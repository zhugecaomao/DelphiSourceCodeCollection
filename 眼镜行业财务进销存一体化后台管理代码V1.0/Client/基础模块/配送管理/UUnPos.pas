unit UUnPos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, ExtCtrls, StdCtrls, Buttons, Grids, DB, DBClient;
type TSendMaster = record
    vcSendBillId: string;
    VcSourceId: string;
    BillNo: string;
    iBIlltype: integer;
    vcSendStockID: string;   //配送仓库
    vcRecvStockID: string;   //接收门店仓库
    dtDrawDate: TDateTime;
    dtOutStockDate: Tdatetime;
    vcEId: string;        ///经手人
    vcListerId: string;   // 制单人
    vcAssessorId: string;  //审核人
    NSumQty: Double;
    nuCess: Double;
    nuTax: Double;
    nuIncTaxSum: Double;
    nuTotalMoney: Double;
    nuUnTaxSum: Double;
    BillStatus: Integer;
    inVoucherSign: Integer;
    inIsReadSign: Integer;
    vcOutHouseReadBillId: string;
    inByReadSign: Integer;
    vcExplain: string;
    SendStatus: Integer;
    VcSendStockName: string;
    VcRecvStockName: string;
    ObjectID: Integer;
  end;
type
  TfmUnPosSendBill = class(TfmBase)
    CdsMasterData: TClientDataSet;
    CdsDetailData: TClientDataSet;
    Panel3: TPanel;
    sgorder: TStringGrid;
    Panel10: TPanel;
    Cmd_Delete: TSpeedButton;
    Cmd_Add: TSpeedButton;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    bitcheck: TBitBtn;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton4: TSpeedButton;
    Label5: TLabel;
    SpeedButton5: TSpeedButton;
    Label6: TLabel;
    Panel4: TPanel;
    TeThemeButton1: TSpeedButton;
    TeThemeButton2: TSpeedButton;
    sourcebill: TSpeedButton;
    query: TSpeedButton;
    help: TSpeedButton;
    BillTitle: TLabel;
    EdtM: TEdit;
    EdtG: TEdit;
    EdtC: TEdit;
    EdtMemo: TEdit;
    StaticText1: TStaticText;
    EdtBillNo: TEdit;
    Label1: TLabel;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    EdtRecvStock: TEdit;
    EdtsendStock: TEdit;
    procedure Cmd_AddClick(Sender: TObject);
    procedure Cmd_DeleteClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sgorderDblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure sgorderSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure bitcheckClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure sgorderKeyPress(Sender: TObject; var Key: Char);
    procedure sgorderMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sgorderDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    pcol,prow:integer; //记录行列编号
     SendMaster: TSendMaster;
    sBillId, SEditMode: string;
    sGoodsName: string;
    sUserCode: string;
    zd:boolean;
    ckid:string;
    procedure FormIni;
    //procedure SelectGoods(iRow: Integer);
    function CheckData: Boolean;
    function SaveData: Boolean;
    function ReadBill: Boolean;
    //procedure SumCol(ACol, ARow: Integer);
  public
    { Public declarations }
  end;

var
  fmUnPosSendBill: TfmUnPosSendBill;
   function ShowUNPosSendbill(sBillId: string; EditMode: string; iBillType: Integer): Integer;
implementation

uses func, Unt_PubStrGrid, untdatadm, Untselectps, USelgoodCode, Login_Man;

{$R *.dfm}
function ShowUNPosSendbill(sBillId: string; EditMode: string; iBillType: Integer): Integer;
begin
  Result := 1;
  fmUnPosSendBill := tfmUnPosSendBill.Create(application);
  fmUnPosSendBill.sBillId := sBillId;
  fmUnPosSendBill.SEditMode := UpperCase(EditMode);
  fmUnPosSendBill.SendMaster.iBIlltype := iBillType;
  try
    fmUnPosSendBill.FormIni;
    fmUnPosSendBill.ShowModal;
  finally
    fmUnPosSendBill.Free;
  end;
end;
//////////////////////////

procedure TfmUnPosSendBill.FormIni;
var
  iRow: Integer;
  temp,make:string;
begin
  EdtSendStock.Text := '';
  EdtRecvStock.Text := trim(shopid);
  EdtM.Text := trim(Handle_Man);
  SendMaster.vcListerId:=edtm.Text;
  EdtG.Text := '';
  EdtC.Text := '';
  EdtMemo.Text := '';
  ckid:=shopid ;
  SendMaster.vcRecvStockID:=shopid;
  if sbillid='' then
  begin
    temp:='select max(right(billno,4)) from SendMasterTable where iBIlltype='+'505'+' and dtDrawDate='+''''+formatdatetime('yyyy''-''mm''-''dd',date)+'''';
    make:='UPS-'+trim(Handle_Part)+trim(handle_no); //编码中部门编号
    edtbillno.Text:=setcode(temp,make);
     sgorder.RowCount := 2;
  for iRow := 1 to sgorder.RowCount do
    sgorder.Rows[irow].Clear;
    sgorder.Cells[0, iRow] := IntToStr(iRow);
  end else
  begin
    ReadBill;
  end;
  zd:=false;
  InitialStrGrid(sgorder,'配送退货单');
  CdsMasterData.Close;
  CdsMasterData.Data :=null;
  temp:= 'Select * from SendMasterTable where 1=2';
  CdsMasterData.Data:=adisp.PubBatch(temp);
  CdsMasterData.Open;
  temp:='Select * from SendDetailTable where 1=2';
  CdsDetailData.Close;
  CdsDetailData.Data:=null;
  CdsDetailData.Data:=adisp.PubBatch(temp);
  CdsDetailData.Open;
end;
function TfmUnPosSendBill.CheckData: Boolean;
var
  iRow: Integer;
begin
//
  Result := False;
  SendMaster.vcExplain := EdtMemo.Text;
  SendMaster.BillNo := EdtBillNo.Text;
  if Trim(SendMaster.BillNo) = '' then
  begin
    EdtBillNo.SetFocus;
    Application.MessageBox('单据编号不能为空！', pchar(application.Title), MB_OK + MB_ICONinformation);
    Exit;
  end;
  if (Trim(EdtsendStock.Text) = '') or
    (SendMaster.vcSendStockID = '') then
  begin
    EdtSendStock.SetFocus;
    Application.MessageBox('配送仓库不能为空！', pchar(application.Title), MB_OK + MB_ICONinformation);
    Exit;
  end;
  if (Trim(EdtRecvStock.Text) = '') or
    (SendMaster.vcRecvStockID = '') then
  begin
    EdtRecvStock.SetFocus;
    Application.MessageBox('退货仓库不能为空！', pchar(application.Title), MB_OK + MB_ICONinformation);
    Exit;
  end;
  if (Trim(EdtM.Text) = '') or
    (SendMaster.vcListerId = '') then
  begin
    EdtM.SetFocus;
    Application.MessageBox('制单人不能为空！', pchar(application.Title), MB_OK + MB_ICONinformation);
    Exit;
  end;
  if (Trim(EdtG.Text) = '') or
    (SendMaster.vcEId = '') then
  begin
    EdtG.SetFocus;
    Application.MessageBox('经手人不能为空！', pchar(application.Title), MB_OK + MB_ICONinformation);
    Exit;
  end;
  for iRow := 1 to sgorder.RowCount - 1 do
  begin
    if (sgorder.Cells[1, iRow] = '') or (sgorder.Cells[2, iRow] = '') then
    begin
      sgorder.SetFocus;
      sgorder.Row := iRow;
      sgorder.Col := 1;
      Application.MessageBox('当前商品不能为空！', pchar(application.Title), MB_OK + MB_ICONinformation);
      Exit;
    end;
    
    if Trim(sgorder.Cells[7, iRow]) = '' then sgorder.Cells[7, iRow] := '0';
    if StrToFloat(sgorder.Cells[7, iRow]) = 0 then
    begin
      sgorder.SetFocus;
      sgorder.Row := iRow;
      sgorder.Col := 7;
      Application.MessageBox('请输入配送数量！', pchar(application.Title), MB_OK + MB_ICONinformation);
      Exit;
    end;
    if strtoint(trim(sgorder.Cells[7, iRow]))>strtoint(trim(sgorder.Cells[21, iRow])) then
    begin
      sgorder.SetFocus;
      sgorder.Row := iRow;
      sgorder.Col := 7;
      Application.MessageBox(pchar('退货数量不得多于配送数量！'), pchar(application.Title), MB_OK + MB_ICONinformation);
      Exit;
    end;
    sgorder.Cells[9, iRow] := FloatToStr(StrToFloat(sgorder.Cells[7, iRow]) * StrToFloat(Trim(sgorder.Cells[8, iRow])));
  end;

  Result := True;
end;

function TfmUnPosSendBill.SaveData: Boolean;
var
  IRow: Integer;
  fQty, fPrice, fTotal, dRate: Double;
  PsRst, iunit,i: Integer;
  iEditMode: Integer;
   mdata,Ddata:olevariant;//主副表数据
begin
  if ieditmode=1  then
  begin
    if not bedit then
    begin
      if trim(Handle_Man)<>trim(edtm.Text) then
      begin
        Application.MessageBox('不能修改数据！',pchar(application.Title),mb_iconinformation);
        exit;
      end;
    end;
  end;
  SendMaster.dtDrawDate:=date;
  for i:=1 to sgorder.RowCount-1 do
  begin
    SendMaster.nuTotalMoney:=SendMaster.nuTotalMoney+strtofloat(sgorder.cells[9,i]);
  end;
  Result := False;
  if SEditMode = '' then
    iEditMode := 0
  else
    iEditMode := 1;
  try
    CdsMasterData.EmptyDataSet;
    CdsMasterData.Append;
    CdsMasterData.FieldByName('vcSendBillId').AsString := SendMaster.vcSendBillId;
    CdsMasterData.FieldByName('VcSourceId').AsString := SendMaster.VcSourceId;
    CdsMasterData.FieldByName('vcSendStockID').AsString := SendMaster.vcSendStockID;
    CdsMasterData.FieldByName('vcRecvStockID').AsString := SendMaster.vcRecvStockID;
    CdsMasterData.FieldByName('vcEId').AsString := SendMaster.vcEId;
    CdsMasterData.FieldByName('vcListerId').AsString := SendMaster.vcListerId;
    CdsMasterData.FieldByName('vcAssessorId').AsString := SendMaster.vcEId;
    CdsMasterData.FieldByName('vcOutHouseReadBillId').AsString := SendMaster.vcOutHouseReadBillId;
    CdsMasterData.FieldByName('vcExplain').AsString := SendMaster.vcExplain;
    CdsMasterData.FieldByName('BillStatus').Asinteger := SendMaster.BillStatus;
    CdsMasterData.FieldByName('iBIlltype').Asinteger := SendMaster.iBIlltype;
    CdsMasterData.FieldByName('inVoucherSign').Asinteger := SendMaster.inVoucherSign;
    CdsMasterData.FieldByName('inIsReadSign').Asinteger := SendMaster.inIsReadSign;
    CdsMasterData.FieldByName('SendStatus').Asinteger := SendMaster.SendStatus;
    CdsMasterData.FieldByName('NSumQty').AsFloat := SendMaster.NSumQty;
    CdsMasterData.FieldByName('nuCess').AsFloat := SendMaster.nuCess;
    CdsMasterData.FieldByName('nuTax').AsFloat := SendMaster.nuTax;
    CdsMasterData.FieldByName('nuIncTaxSum').AsFloat := SendMaster.nuIncTaxSum;
    CdsMasterData.FieldByName('nuTotalMoney').AsFloat := SendMaster.nuTotalMoney;
    CdsMasterData.FieldByName('nuUnTaxSum').AsFloat := SendMaster.nuUnTaxSum;
    CdsMasterData.FieldByName('dtDrawDate').AsDateTime := SendMaster.dtDrawDate;
    CdsMasterData.FieldByName('dtOutStockDate').AsDateTime := SendMaster.dtOutStockDate;
    CdsMasterData.FieldByName('BillNo').AsString := SendMaster.BillNo;
    CdsMasterData.FieldByName('ObjectID').asInteger := SendMaster.ObjectID;

    CdsDetailData.EmptyDataSet;
    for IRow := 1 to sgorder.RowCount - 1 do
    begin
      CdsDetailData.Append;
      CdsDetailData.FieldByName('vcSendBillId').AsString := SendMaster.vcSendBillId;
      CdsDetailData.FieldByName('ord').asInteger := IRow;
      CdsDetailData.FieldByName('InOrderId').asInteger := IRow;
      CdsDetailData.FieldByName('vcPtypeid').AsString := Trim(sgorder.cells[2, iRow]);
      CdsDetailData.FieldByName('VcSendStockID').AsString := Trim(SendMaster.vcSendStockID);
      CdsDetailData.FieldByName('VcRecvStockID').AsString := Trim(SendMaster.vcRecvStockID);
      CdsDetailData.FieldByName('vcBatch').AsString := '';
      CdsDetailData.FieldByName('vcGoodUnitId').AsString := Trim(sgorder.cells[6, iRow]);
      dRate := StrToFloat(sgorder.Cells[16, iRow]);
      iunit:=0;
      if iunit = 1 then
      begin
        fQty := StrToFloat(Trim(sgorder.cells[7, iRow])) * dRate;
        CdsDetailData.FieldByName('nuOutQuantity').asFloat := fQty;
        fPrice := StrToFloat(Trim(sgorder.cells[8, iRow])) / dRate;
        CdsDetailData.FieldByName('SendPrice').asFloat := fPrice;
      end
      else
      begin
        fQty := StrToFloat(Trim(sgorder.cells[7, iRow]));
        CdsDetailData.FieldByName('nuOutQuantity').asFloat := fQty;
        fPrice := StrToFloat(Trim(sgorder.cells[8, iRow]));
        CdsDetailData.FieldByName('SendPrice').asFloat := fPrice;
      end;
      fTotal := fPrice * fQty;
      CdsDetailData.FieldByName('SendTotal').asFloat := fTotal;
      CdsDetailData.FieldByName('nuCess').asFloat := 0;
      CdsDetailData.FieldByName('nuIncTaxPrice').asFloat := fPrice;
      CdsDetailData.FieldByName('nuTax').asFloat := 0;
      CdsDetailData.FieldByName('NTaxTotal').asFloat := fTotal;
      CdsDetailData.FieldByName('nuCostPrice').asFloat := fPrice;
      CdsDetailData.FieldByName('NCastTotal').asFloat := fTotal;
      CdsDetailData.FieldByName('iUnit').asInteger := iunit;
      CdsDetailData.FieldByName('NRate').asFloat := dRate;
    end;
    PsRst := CdsDetailData.RecordCount;
    if ieditmode=0 then   //写草稿;
    begin
      dmmain.cdsReceipt.close;
      dmmain.cdsReceipt.Open;
      dmmain.cdsReceipt.Append;
      dmmain.cdsReceipt.FieldByName('Receipt_NO').AsString:=Trim(edtbillno.Text);
      dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='配送退货单';
      dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=formatdatetime('yyyy''-''mm''-''dd',date);
      dmmain.cdsReceipt.FieldByName('Proposer').AsString:=Trim(Edtm.Text);
      dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
      dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
      dmmain.cdsReceipt.FieldByName('Condense').AsString:='仓库【'+shopid+'】向仓库【'+EdtSendStock.Text+'】退货';
      dmmain.cdsReceipt.FieldByName('Re_part').AsString:=trim(Handle_Part);
      dmmain.cdsReceipt.Post;
      dmmain.cdsReceipt.ApplyUpdates(-1);
    end;
    mdata:= CdsMasterData.Data;
    Ddata:=CdsDetailData.Data;
    adisp.InsertSendBill(mData,dData,iEditMode, PsRst);

    if PsRst <> 0 then raise Exception.Create('单据保存失败！');
    Result := True;
  except
    on E: Exception do
    begin
      Application.MessageBox(Pchar(E.message), pchar(application.Title), MB_OK + MB_ICONinformation)
    end;
  end;
end;
function TfmUnPosSendBill.ReadBill: Boolean;
var
  iRow: Integer;
  sql:widestring;
begin
//
  Result := False;
  if SEditMode = '' then Exit;
  try
  //---显示数据，并且给相应变量付值------//

    sql:='select a.*,b.*,c.* from sendmastertable as a ,senddetailtable as b, vSelectGoods as c where b.vcSendBillId=a.vcSendBillId and b.vcPtypeid =c.goods_no and c.storage_no= a.vcRecvStockID and a.BillNo='+''''+trim(list_no)+'''';   //5-7 WG EDIT
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=null;
    try
    dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
    dmmain.CDSquery2.Open;
    edtbillno.Text:=trim(dmmain.CDSquery2.fieldbyname('billno').AsString);
    //edtsourcno.Text:=trim(dmmain.CDSquery2.fieldbyname('VcSourceId').AsString);
    EdtSendStock.Text:=trim(dmmain.CDSquery2.fieldbyname('vcSendStockID').AsString);
    EdtRecvStock.Text:=trim(dmmain.CDSquery2.fieldbyname('vcRecvStockID').AsString);
    edtm.Text:=trim(dmmain.CDSquery2.fieldbyname('vcListerId').AsString);
    edtg.Text:=trim(dmmain.CDSquery2.fieldbyname('vcEId').AsString);
    edtmemo.Text:=trim(dmmain.CDSquery2.fieldbyname('vcExplain').AsString);
    SendMaster.nuTotalMoney:= dmmain.CDSquery2.fieldbyname('nuTotalMoney').asfloat;
    SendMaster.vcSendStockID:=EdtSendStock.Text;
    SendMaster.vcRecvStockID:=EdtRecvStock.Text;
    SendMaster.BillNo:=edtbillno.Text;
    SendMaster.iBIlltype:=dmmain.CDSquery2.fieldbyname('iBIlltype').AsInteger;
    SendMaster.vcListerId:=edtm.Text;
    SendMaster.vcEId :=edtg.Text;
    SendMaster.vcAssessorId:=edtm.Text;
  //------显示明细数据--------------//
  sgorder.RowCount:=dmmain.CDSquery2.RecordCount+1;
    for iRow := 1 to dmmain.CDSquery2.RecordCount do
    begin
   //
      sgorder.Cells[0, iRow] := IntToStr(dmmain.CDSquery2.RecNo);
      sgorder.Cells[1, iRow]:= trim(dmmain.CDSquery2.fieldbyname('type').AsString);
      sgorder.Cells[2, iRow]:=trim(dmmain.CDSquery2.fieldbyname('vcPtypeid').AsString);//编码
      sgorder.Cells[3, iRow]:=trim(dmmain.CDSquery2.fieldbyname('goods_name').AsString);
      sgorder.Cells[6,iRow] := trim(dmmain.CDSquery2.Fieldbyname('vcGoodUnitId').AsString);
      sgorder.Cells[7,iRow] := trim(dmmain.CDSquery2.Fieldbyname('nuOutQuantity').AsString);
      sgorder.Cells[8,iRow] := trim(dmmain.CDSquery2.Fieldbyname('SendPrice').AsString);
      sgorder.Cells[9,iRow] := trim(dmmain.CDSquery2.Fieldbyname('SendTotal').AsString);
      sgorder.Cells[21,iRow] := trim(dmmain.CDSquery2.Fieldbyname('stock_amount').AsString);
      sgorder.Cells[11,iRow ] := '10';
      dmmain.CDSquery2.Next;
    end;
    except
    end;
    Result := True;
  except
    Result := False;
  end;
end;




/////////////////////////////
procedure TfmUnPosSendBill.Cmd_AddClick(Sender: TObject);
begin
  inherited;
  addgridrows(sgorder);
end;

procedure TfmUnPosSendBill.Cmd_DeleteClick(Sender: TObject);
begin
  inherited;
  deletegridrows(sgorder,prow);
end;

procedure TfmUnPosSendBill.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   dlgselectps:=Tdlgselectps.Create(self);
  dlgselectps.ShowModal;
  if dmmain.CDSdata.IsEmpty  then exit;
  Edtsendstock.Text:=Trim(dmmain.CDSdata.fieldbyname('managerid').AsString);
  SendMaster.vcSendStockID:=Trim(dmmain.CDSdata.fieldbyname('managerid').AsString);
  dmmain.CDSdata.Close;
  dmmain.CDSdata.Data:=null;
  dlgselectps.Free;
end;

procedure TfmUnPosSendBill.BitBtn1Click(Sender: TObject);
begin
  inherited;
  sendmaster.vcListerId:=trim(Handle_Man);
  if not CheckData then Exit;
  if not SaveData then Exit;
  FormIni;
end;

procedure TfmUnPosSendBill.sgorderDblClick(Sender: TObject);
begin
  inherited;
  if trim(EdtsendStock.Text)='' then
  begin
    application.MessageBox('请选择配送仓库！',pchar(application.Title),mb_iconinformation);
    EdtsendStock.SetFocus;
    exit;
  end;
  if (pcol = 1) or (pcol =2) then
  begin
    fmSelgoodCode:= TfmSelgoodCode.Create(nil);
     try
    officeid:=Handle_Part ;
    fmSelgoodCode.show_mode := '配送退货单';
    fmSelgoodCode.billtyped:='501';//申请;
    fmSelgoodCode.storage_no:= trim(EdtsendStock.Text);
    fmSelgoodCode.ShowModal;
    finally
    fmSelgoodCode.Free;
    end;
  end;
end;


procedure TfmUnPosSendBill.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmUnPosSendBill.sgorderSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  pcol:=acol;
  prow:=arow;
end;

procedure TfmUnPosSendBill.bitcheckClick(Sender: TObject);
var
  user,s,temp,remarks,ofid:widestring;
  flag,intof:olevariant;
  totals:double;
  i:integer;
begin
  inherited;
  if trim(sBillId)=''then exit;
  if trim(sgorder.Cells[1,1])='' then exit;
  no:=trim(edtbillno.Text);
  s:=trim(EdtSendStock.Text);
  typed:='配送退货单';
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
  if flag='3' then //
  begin
    //////////////
    try
    flag:=ipubtemp.batchstock(no,3);
    //////////////////////////////////////////////////////////////
    except
      application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
      exit;
    end;
    ////////////////////
  end;
  if flag='1' then
  begin
    application.MessageBox('审核成功！',pchar(application.Title),mb_iconinformation);
    close;
    exit;
  end;
  if flag='2' then
  begin
    application.MessageBox('无权进行进行审核',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if flag='3' then
  begin
    application.MessageBox('审核完毕！',pchar(application.Title),mb_iconinformation);
    close;
    //exit;
  end;
  if flag='4' then
  begin
    application.MessageBox('反审核完毕！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if flag='5' then
  begin
    application.MessageBox('反审核成功！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if flag='6' then
  begin
    application.MessageBox('单据过帐后，不能进行审核或反审核！',pchar(application.Title),mb_iconinformation);
    exit;
  end;

end;

procedure TfmUnPosSendBill.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  Employe_Check:='';
  Employe_Check:='Storage_Umanage_Fad';
  Employe_Check_Result:='';
  frm_Login_Man:=Tfrm_Login_Man.Create(self);
  frm_Login_Man.Caption:='经手人选择';
  frm_Login_Man.ShowModal;
  SendMaster.vcEId := Employe_Check_Result;
  EdtG.Text := Employe_Check_Result;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfmUnPosSendBill.sgorderKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (pcol =7)   then
  begin
    if not (key in ['0'..'9',#8]) then    //数量没有小数点
    key:=#0;
    sgorder.Options := sgorder.Options+ [goediting];
  end else
  begin
   sgorder.Options := sgorder.Options - [goediting];

  end;
end;

procedure TfmUnPosSendBill.sgorderMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  i:integer;  
begin
  inherited;
  if prow<>0 then
  begin
    if (trim(sgorder.Cells[7,prow])<>'') and (trim(sgorder.Cells[21,prow])<>'') then
    begin
      if strtoint(sgorder.Cells[7,prow])> strtoint(sgorder.Cells[21,prow]) then
      begin
        sgorder.Cells[7,prow]:='0';
        application.MessageBox('数量已超过配送数量！',pchar(application.Title),mb_iconinformation);
        exit;
      end;
    end;  
  end;

end;

procedure TfmUnPosSendBill.sgorderDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
  inherited;
 with Sender as Tstringgrid do
  begin
  if gdSelected in State then
  Canvas.Brush.Color:= clTeal;  //clBlue; //clyellow;//clRed;
  Canvas.TextRect(Rect,Rect.Left,Rect.Top,' '+Cells[ACol,ARow]);
  if gdFocused in State then
  Canvas.DrawFocusRect(Rect);
  end;

with Sender as Tstringgrid do
begin
  Canvas.FillRect(Rect);
  s:=Cells[ACol,ARow];
  r:=Rect;
  DrawText(Canvas.Handle,PChar(s),Length(s),r,DT_CENTER or DT_SINGLELINE or DT_VCENTER);
end;

end;

end.

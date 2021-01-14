unit UYdPosBill;

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
  TFmYdPosBill = class(TfmBase)
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
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton4: TSpeedButton;
    Label5: TLabel;
    SpeedButton5: TSpeedButton;
    Label6: TLabel;
    SpeedButton3: TSpeedButton;
    EdtSendStock: TEdit;
    Panel4: TPanel;
    TeThemeButton1: TSpeedButton;
    TeThemeButton2: TSpeedButton;
    sourcebill: TSpeedButton;
    query: TSpeedButton;
    help: TSpeedButton;
    BillTitle: TLabel;
    EdtRecvStock: TEdit;
    EdtM: TEdit;
    EdtG: TEdit;
    EdtC: TEdit;
    EdtMemo: TEdit;
    StaticText1: TStaticText;
    EdtBillNo: TEdit;
    edtpart: TLabeledEdit;
    procedure SpeedButton3Click(Sender: TObject);
    procedure sgorderDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgorderSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure bitcheckClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
    OrderNO:string;//定单编号;
    SendMaster: TSendMaster;
    sBillId, SEditMode: string;
    sGoodsName,Glanno: string;
    sUserCode: string;
    pcol,prow:integer;
    ckid:string;
    procedure FormIni;
    //procedure SelectGoods(iRow: Integer);
    function CheckData: Boolean;
    function SaveData: Boolean;
    function ReadBill: Boolean;
    procedure SumCol(ACol, ARow: Integer);
    function READGLaN(no:string):BOOLEAN;
  public
    { Public declarations }
  end;

var
  FmYdPosBill: TFmYdPosBill;
  function ShowYDPosSendbill(sBillId: string; EditMode: string; iBillType: Integer): Integer;
implementation

uses Unt_PubStrGrid, func, UDLGYDPOS, untdatadm, UntSQpspart,
  Storage_Select, Login_Man;

{$R *.dfm}
//////////////////////////

function ShowYDPosSendbill(sBillId: string; EditMode: string; iBillType: Integer): Integer;
begin
  Result := 1;
  FmYdPosBill := TFmYdPosBill.Create(application);
  FmYdPosBill.sBillId := sBillId;
  FmYdPosBill.SEditMode := UpperCase(EditMode);
  FmYdPosBill.SendMaster.iBIlltype := iBillType;
  try
    FmYdPosBill.FormIni;
    FmYdPosBill.ShowModal;
  finally
    FmYdPosBill.Free;
  end;
end;
function TFmYdPosBill.READGlaN(NO:string):BOOLEAN;
var
  iRow:integer;
  CDS:TCLIENTDATASET ;
  sql:widestring;
BEGIN
  result:=false;
  sql:=' select b.*,c.type,c.goods_name,c.stock_amount from GetGoodsPlanmaster as a, GetGoodsPlan as b,vselectgoods as c where b.vcptyieid=c.goods_no and a.vcstockid=c.storage_no and a.VcGetGoodsPlanID=b.VcGetGoodsPlanID and b.IGetStatus=1 and b.VcGetGoodsPlanID='+''''+trim(no)+'''';

  cds:=TCLIENTDATASET.Create(self);
  cds.Close;
  cds.Data:=null;
  TRY
  cds.Data:=adisp.execSql(sql);
  CDS.Open;
  if cds.IsEmpty then
  begin
    application.MessageBox(pchar('预定商品还没有采购或入库，请入库后进行[预定配送]！'),pchar(application.Title),mb_iconinformation);
    cds.Close;
    cds.Data:=null;
    cds.Free;
    cds:=nil;
    exit;
  end;
  sgorder.RowCount:=cds.RecordCount+1;
  for iRow := 1 to cds.RecordCount do
  begin
 //
    sgorder.Cells[0, iRow] := IntToStr(Irow);
    sgorder.Cells[1, iRow]:= trim(cds.fieldbyname('type').AsString);
    sgorder.Cells[2, iRow]:=trim(cds.fieldbyname('VCPtyieID').AsString);//编码
    sgorder.Cells[3, iRow]:=trim(cds.fieldbyname('goods_name').AsString);
    sgorder.Cells[6,iRow] := trim(cds.Fieldbyname('vcGoodUnitId').AsString);
    sgorder.Cells[7,iRow] := trim(cds.Fieldbyname('NQty').AsString);  //申请数量
    sgorder.Cells[17,iRow] := trim(cds.Fieldbyname('Goodsmemo').AsString);
    sgorder.Cells[8,iRow] := '0';
    sgorder.Cells[9,iRow] := '0';
    sgorder.Cells[19,irow ] := '0000100001';
    sgorder.Cells[16,irow ] := '10';
    sgorder.Cells[11,iRow ] := '10';
    sgorder.Cells[21,iRow] := trim(cds.Fieldbyname('stock_amount').AsString);
    cds.Next;
  end;
  result:=true;
  cds.Close;
  cds.Data:=null;
  cds.Free;
  cds:=nil;
  EXCEPT
    cds.Close;
  cds.Data:=null;
  cds.Free;
  cds:=nil;
  END;
END;
procedure TFmYdPosBill.FormIni;
var
  iRow: Integer;
  temp,make:string;
begin
  EdtSendStock.Text := '';
  EdtRecvStock.Text := '';
  EdtM.Text := trim(Handle_Man);
  EdtG.Text := '';
  EdtC.Text := '';
  EdtMemo.Text := '';
  ckid:=shopid ;
  if sbillid='' then
  begin
    temp:='select max(right(billno,4)) from SendMasterTable where dtDrawDate='+''''+formatdatetime('yyyy''-''mm''-''dd',date)+'''';
    make:='PS-'+trim(Handle_Part)+trim(handle_no); //编码中部门编号
    edtbillno.Text:=setcode(temp,make);
     sgorder.RowCount := 2;
  for iRow := 1 to sgorder.RowCount do
    sgorder.Rows[irow].Clear;
    sgorder.Cells[0, iRow] := IntToStr(iRow);
  end else
  begin
    ReadBill;
  end;
  InitialStrGrid(sgorder,'预定商品配送单');
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
function tFmYdPosBill.CheckData: Boolean;
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
  if (Trim(EdtSendStock.Text) = '') or
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
    Application.MessageBox('收货仓库不能为空！', pchar(application.Title), MB_OK + MB_ICONinformation);
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
  if (Trim(EdtC.Text) = '') or
    (SendMaster.vcAssessorId = '') then
  begin
    EdtC.SetFocus;
    Application.MessageBox('审核人不能为空！', pchar(application.Title), MB_OK + MB_ICONinformation);
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
    if sgorder.Cells[7, iRow]>sgorder.Cells[21, iRow] then
    begin
      sgorder.SetFocus;
      sgorder.Row := iRow;
      sgorder.Col := 7;
      Application.MessageBox(pchar('现有库存数量不能满足配送数量！'), pchar(application.Title), MB_OK + MB_ICONinformation);
      Exit;
    end;
    if Trim(sgorder.Cells[8, iRow]) = '' then sgorder.Cells[8, iRow] := '0';
    sgorder.Cells[9, iRow] := FloatToStr(StrToFloat(sgorder.Cells[7, iRow]) * StrToFloat(Trim(sgorder.Cells[8, iRow])));
  end;

  Result := True;
end;

function TFmYdPosBill.SaveData: Boolean;
var
  IRow: Integer;
  fQty, fPrice, fTotal, dRate: Double;
  PsRst, iunit,i: Integer;
  iEditMode: Integer;
   mdata,Ddata:olevariant;//主副表数据
  temp:widestring;
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
  SendMaster.BillStatus:=5;
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
    CdsMasterData.FieldByName('vcAssessorId').AsString := SendMaster.vcAssessorId;
    CdsMasterData.FieldByName('vcOutHouseReadBillId').AsString := trim(OrderNO);
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
      CdsDetailData.FieldByName('GoodsMemo').AsString := Trim(sgorder.cells[17, iRow]);
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
      dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='预定商品配送单';
      dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=formatdatetime('yyyy''-''mm''-''dd',date);
      dmmain.cdsReceipt.FieldByName('Proposer').AsString:=Trim(Edtm.Text);
      dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
      dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
      dmmain.cdsReceipt.FieldByName('Condense').AsString:='仓库【'+shopid+'】指定出货仓库【'+EdtSendStock.Text+'】向仓库'+EdtRecvStock.Text+'预定商品配送';
      dmmain.cdsReceipt.FieldByName('Re_part').AsString:=trim(Handle_Part);
      dmmain.cdsReceipt.Post;
      dmmain.cdsReceipt.ApplyUpdates(-1);
    end;
    mdata:= CdsMasterData.Data;
    Ddata:=CdsDetailData.Data;
    adisp.InsertSendBill(mData,dData,iEditMode, PsRst);

    if PsRst <> 0 then
    begin
      raise Exception.Create('单据保存失败！');
    end else
    begin
      if iEditMode=0 then   //改变;
      begin
        temp:=' update Getgoodsglanmaster set IPlanStatus=0 where VcGetGoodsPlanID='+''''+trim(Glanno)+'''';
        try
          adisp.updatesql(temp);
        except
        end;
      end;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      Application.MessageBox(Pchar(E.message), pchar(application.Title), MB_OK + MB_ICONinformation)
    end;
  end;
end;
function TFmYdPosBill.ReadBill: Boolean;
var
  iRow: Integer;
  sql:widestring;
begin
//
  Result := False;
  if SEditMode = '' then Exit;
  try
  //---显示数据，并且给相应变量付值------//

    sql:='select a.*,b.*,c.* from sendmastertable as a ,senddetailtable as b, vSelectGoods as c where b.vcSendBillId=a.vcSendBillId and b.vcPtypeid =c.goods_no and c.storage_no= a.vcSendStockID and a.ibilltype=503 and  a.BillNo='+''''+trim(list_no)+'''';   //5-7 WG EDIT
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
    edtc.Text:=trim(dmmain.CDSquery2.fieldbyname('vcAssessorId').AsString);
    edtmemo.Text:=trim(dmmain.CDSquery2.fieldbyname('vcExplain').AsString);
    SendMaster.nuTotalMoney:= dmmain.CDSquery2.fieldbyname('nuTotalMoney').asfloat;
    SendMaster.vcSendStockID:=EdtSendStock.Text;
    SendMaster.vcRecvStockID:=EdtRecvStock.Text;
    SendMaster.BillNo:=edtbillno.Text;
    SendMaster.iBIlltype:=dmmain.CDSquery2.fieldbyname('iBIlltype').AsInteger;
    SendMaster.vcListerId:=edtm.Text;
    SendMaster.vcEId :=edtg.Text;
    SendMaster.vcAssessorId:=edtc.Text;
    SendMaster.VcSourceId:=dmmain.CDSquery2.fieldbyname('VcSourceId').AsString;
    edtpart.Text:=SendMaster.VcSourceId;
    speedbutton3.Enabled:=false;
    speedbutton1.Enabled:=false;
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
      sgorder.Cells[17,iRow] := trim(dmmain.CDSquery2.Fieldbyname('goodsmemo').AsString);
      sgorder.Cells[8,iRow] := trim(dmmain.CDSquery2.Fieldbyname('SendPrice').AsString);
      sgorder.Cells[9,iRow] := trim(dmmain.CDSquery2.Fieldbyname('SendTotal').AsString);
      sgorder.Cells[21,iRow] := trim(dmmain.CDSquery2.Fieldbyname('stock_amount').AsString);
      sgorder.Cells[19,irow ] := '0000100001';
      sgorder.Cells[16,irow ] := '10';
      sgorder.Cells[11,iRow ] := '10';
      //sgorder.Cells[21,iRow] := trim(dmmain.CDSquery2.Fieldbyname('goodsmemo').AsString);
      dmmain.CDSquery2.Next;
    end;
    except
    end;
    Result := True;
  except
    Result := False;
  end;
end;
procedure TFmYdPosBill.SumCol(ACol, ARow: Integer);
var
  dQty, dPrice: Double;
begin
//
  if (ACOl = 7) or (ACOL = 8) then
  begin
    if (Trim(sgorder.Cells[7, ARow]) <> '') and
      (Trim(sgorder.Cells[8, ARow]) <> '') then
    begin
      if Trim(sgorder.Cells[7, ARow]) = '' then sgorder.Cells[7, ARow] := '0';
      if Trim(sgorder.Cells[8, ARow]) = '' then sgorder.Cells[8, ARow] := '0.00';
      dQty := StrToFloat(sgorder.Cells[7, ARow]);
      dPrice := StrToFloat(sgorder.Cells[8, ARow]);
      sgorder.Cells[9, ARow] := FloatToStr(dQty * dPrice);
    end;
  end;
end;
//////////////////////////
procedure TFmYdPosBill.SpeedButton3Click(Sender: TObject);
begin
  inherited;
   dlgSQpspart:=tdlgSQpspart.Create(self);
   dlgSQpspart.ShowModal;
   dlgSQpspart.Free;
   if dmmain.CDSdata.IsEmpty  then exit;
   edtpart.Text:=trim(dmmain.CDSdata.fieldbyname('part_name').AsString);
   officeid:=trim(dmmain.CDSdata.fieldbyname('part_no').AsString);
   if trim(edtpart.Text)<>'' then
   begin
     SendMaster.VcSourceId:=officeid;
     EdtRecvStock.Text:=trim(dmmain.CDSdata.fieldbyname('storageid').AsString);
     SendMaster.vcRecvStockID:=trim(edtrecvstock.Text);
     DlgYdPos:=tDlgYdPos.Create(self);
     DlgYdPos.p_no:=trim(officeid);
     DlgYdPos.SHOPNO:=trim(EdtRecvStock.Text);
     DlgYdPos.ShowModal;
     if not dmmain.cdsyddata.IsEmpty  then
     begin
       if readglan(dmmain.cdsyddata.fieldbyname('VcGetGoodsPlanID').AsString) then
       begin
         Glanno:=trim(dmmain.cdsyddata.fieldbyname('VcGetGoodsPlanID').AsString);
         OrderNO:=trim(dmmain.cdsyddata.fieldbyname('Memo').AsString);
       end;
     end;
     dmmain.cdsyddata.close;
     dmmain.cdsyddata.data:=null;
   end;
   dmmain.CDSdata.Close;
   dmmain.CDSdata.Data:=null;
end;

procedure TFmYdPosBill.sgorderDrawCell(Sender: TObject; ACol,
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

//不但水平居中，还垂直居中
with Sender as Tstringgrid do
begin
  Canvas.FillRect(Rect);
  s:=Cells[ACol,ARow];
  r:=Rect;
  DrawText(Canvas.Handle,PChar(s),Length(s),r,DT_CENTER or DT_SINGLELINE or DT_VCENTER);
end;


end;

procedure TFmYdPosBill.sgorderSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  pcol:=acol;
  prow:=arow;
end;

procedure TFmYdPosBill.bitcheckClick(Sender: TObject);
var
  user,s,temp,remarks,ofid:widestring;
  flag,intof:olevariant;
  totals:double;
  i:integer;
begin
  inherited;
  if trim(SEditMode) = ''then exit;
  if trim(sgorder.Cells[1,1])='' then exit;
  no:=trim(edtbillno.Text);
  s:=trim(EdtSendStock.Text);
  typed:='预定商品配送单';
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
  if flag='3' then //
  begin
    //////////////修改配送单据状态，改为收货状态；修改要货计划的已配数量，满足后设置为配送完成状态/////////
    try
    temp:='update sendmastertable set SendStatus=3,iBIlltype=501 where BillNo='+''''+trim(edtbillno.Text)+'''';
    ipubtemp.scrapsate(temp); //修改配送单;
    ofid:=trim(edtpart.Text);
    ipubtemp.Updatebatch(no,ofid);
    ///////////////////////
    /////////////////////////配送出库
    flag:=ipubtemp.batchstock(no,1);
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

procedure TFmYdPosBill.SpeedButton1Click(Sender: TObject);
var
  sStockID, sStockName: string;
begin
  inherited;
//选择中心仓库
  sStockID := '';
  sStockName := '';
  Check_Storage:='';
  Check_Storage_Result:='';
  Check_Storage:='Storage_Umanage_Fad';
  frm_Storage_Select:=Tfrm_Storage_Select.Create(self);
  frm_Storage_Select.ShowModal;
  sStockName:=Trim(Check_Storage_Result);
  sStockID:=Check_Storage_Result_NO;
  frm_Storage_Select.Free;
  EdtSendStock.Text:= sStockName;
  SendMaster.vcSendStockID := sStockID;
  SendMaster.VcSendStockName := sStockName;
end;

procedure TFmYdPosBill.BitBtn1Click(Sender: TObject);
begin
  inherited;
  sendmaster.vcListerId:=trim(Handle_Man);
  if not CheckData then Exit;
  if not SaveData then Exit;
  FormIni;
end;

procedure TFmYdPosBill.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFmYdPosBill.SpeedButton4Click(Sender: TObject);
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
end;

procedure TFmYdPosBill.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  Employe_Check:='';
  Employe_Check:='Storage_Umanage_Fad';
  Employe_Check_Result:='';
  frm_Login_Man:=Tfrm_Login_Man.Create(self);
  frm_Login_Man.Caption:='审核人选择';
  frm_Login_Man.ShowModal;
  SendMaster.vcAssessorId := Employe_Check_Result;
  EdtC.Text := Employe_Check_Result;
end;

end.

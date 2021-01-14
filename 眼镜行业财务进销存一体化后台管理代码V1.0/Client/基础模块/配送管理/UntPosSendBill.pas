unit UntPosSendBill;
/////门店配送收货单 ydy create   2004-4-9
/////4-26 改为stringgrid
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, DB, DBClient, DBGrids;

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
  TFmPosSendBill = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    EdtSendStock: TEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Panel4: TPanel;
    TeThemeButton1: TSpeedButton;
    TeThemeButton2: TSpeedButton;
    sourcebill: TSpeedButton;
    query: TSpeedButton;
    help: TSpeedButton;
    Label1: TLabel;
    EdtRecvStock: TEdit;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    EdtM: TEdit;
    Label4: TLabel;
    EdtG: TEdit;
    SpeedButton4: TSpeedButton;
    Label5: TLabel;
    EdtC: TEdit;
    SpeedButton5: TSpeedButton;
    Label6: TLabel;
    EdtMemo: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StaticText1: TStaticText;
    EdtBillNo: TEdit;
    BillTitle: TLabel;
    CdsMasterData: TClientDataSet;
    CdsDetailData: TClientDataSet;
    sgorder: TStringGrid;
    bitcheck: TBitBtn;
    edtpart: TLabeledEdit;
    SpeedButton3: TSpeedButton;
    Panel10: TPanel;
    Cmd_Delete: TSpeedButton;
    Cmd_Add: TSpeedButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure sgorderKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure EdtSendStockKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtRecvStockKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtMemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure TeThemeButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgorderDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgorderDblClick(Sender: TObject);
    procedure sgorderSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgorderKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitcheckClick(Sender: TObject);
    procedure sgorderMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton3Click(Sender: TObject);
    procedure edtpartChange(Sender: TObject);
    procedure Cmd_AddClick(Sender: TObject);
    procedure Cmd_DeleteClick(Sender: TObject);
    procedure sourcebillClick(Sender: TObject);
  private
    { Private declarations }
    SendMaster: TSendMaster;
    sBillId, SEditMode: string;
    sGoodsName: string;
    sUserCode: string;
    zd:boolean;
    ckid:string;
    procedure FormIni;
    procedure SelectGoods(iRow: Integer);
    function CheckData: Boolean;
    function SaveData: Boolean;
    function ReadBill: Boolean;
    procedure SumCol(ACol, ARow: Integer);

  public
    { Public declarations }
     pcol,prow:integer; //记录行列编号
  end;
var
  FmPosSendBill: TFmPosSendBill;
  function ShowFmPosSendbill(sBillId: string; EditMode: string; iBillType: Integer): Integer;
implementation

uses  Unt_PubStrGrid, Data, func, untdatadm, UntgoodCodeSelPei,
  Storage_Select, Supply_Monad, Untpart, Untgoodcodedetail, Login_Man,
  UntSQpspart, UntMsgGoods, Unitreportxf;

{$R *.dfm}

function ShowFmPosSendbill(sBillId: string; EditMode: string; iBillType: Integer): Integer;
begin
  Result := 1;
  FmPosSendBill := TFmPosSendBill.Create(application);
  FmPosSendBill.sBillId := sBillId;
  FmPosSendBill.SEditMode := UpperCase(EditMode);
  FmPosSendBill.SendMaster.iBIlltype := iBillType;
  try
    FmPosSendBill.FormIni;
    FmPosSendBill.ShowModal;
  finally
    FmPosSendBill.Free;
  end;
end;

procedure TFmPosSendBill.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFmPosSendBill.sgorderKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (sgorder.Col = 1) or (sgorder.Col = 2) then
  begin
    if key = VK_RETURN then
    begin
      SelectGoods(sgorder.Row);
      Exit;
    end;
  end;


  if (sgorder.Col = 7) then
  begin
    if key = VK_RETURN then
    begin
      sgorder.Col := 8;
      Exit;
    end;
  end;

  if (sgorder.Col = 7) then
  begin
    SumCol(7, sgorder.Row);
    if key = VK_RETURN then
    begin
      sgorder.Col := 8;
      Exit;
    end;
  end;

  if (sgorder.Col = 8) then
  begin
    SumCol(8, sgorder.Row);
    if key = VK_RETURN then
    begin
      if (Trim(sgorder.Cells[1, sgorder.Row]) <> '') or
        (Trim(sgorder.Cells[2, sgorder.Row]) <> '') then
      begin
        if sgorder.Row = (sgorder.RowCount - 1) then
        begin
          sgorder.RowCount := sgorder.RowCount + 1;
        end;

        sgorder.Col := 1;
        sgorder.Row := sgorder.Row + 1;
        Exit;
      end;
    end;
  end;
  if key = VK_RETURN then
    Key := VK_TAB;

end;

procedure TFmPosSendBill.FormIni;
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
  zd:=false;
  InitialStrGrid(sgorder,'配送收货单');
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
  if SendMaster.iBIlltype = 501 then
  begin
//    FmPosSendBill.Caption := '同价配送单';
    BillTitle.Caption := '同价配送单收货单';
  end;
{
  if SendMaster.iBIlltype = 502 then
  begin
    FmPosSendBill.Caption := '变价配送单';
    BillTitle.Caption := '变价配送单';
  end;
  if SEditMode <> '' then
    ReadBill;
}
end;


procedure TFmPosSendBill.SpeedButton1Click(Sender: TObject);
var
  sStockID, sStockName: string;
begin
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
  if not zd then
  begin
  ckid:=shopid;
  shopid:= sStockID;
  end;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFmPosSendBill.SpeedButton2Click(Sender: TObject);
var
  sStockID, sStockName: string;
begin
//选择门店仓库
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
  EdtRecvStock.Text:= sStockName;
  SendMaster.vcRecvStockID := sStockID;
  SendMaster.VcRecvStockName := sStockName;
  SendMaster.ObjectID := 1;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFmPosSendBill.SpeedButton4Click(Sender: TObject);
begin
//选择人员
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

procedure TFmPosSendBill.SpeedButton5Click(Sender: TObject);
begin
//选择人员
  Employe_Check:='';
  Employe_Check:='Storage_Umanage_Fad';
  Employe_Check_Result:='';
  frm_Login_Man:=Tfrm_Login_Man.Create(self);
  frm_Login_Man.Caption:='审核人选择';
  frm_Login_Man.ShowModal;
  SendMaster.vcAssessorId := Employe_Check_Result;
  EdtC.Text := Employe_Check_Result;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFmPosSendBill.EdtSendStockKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    SpeedButton1Click(sender);
  end;
end;

procedure TFmPosSendBill.EdtRecvStockKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SpeedButton2Click(sender);
end;

procedure TFmPosSendBill.EdtMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
   
end;

procedure TFmPosSendBill.EdtGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SpeedButton4Click(sender);
end;

procedure TFmPosSendBill.EdtCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SpeedButton5Click(sender);
end;

procedure TFmPosSendBill.EdtMemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    sgorder.SetFocus;
    sgorder.Col := 1;
    sgorder.Row := 1;
  end;
end;

procedure TFmPosSendBill.SelectGoods(iRow: Integer);
begin
{
  sGoodsID := 'SYSP';
  sPtypeid := '0000100001';
  sGoodsName := '商品名称';
  sStd := '规格';
  sUserCode := 'UserCode';
  Grid.Cells[1, iRow] := sUserCode;
  Grid.Cells[2, iRow] := sGoodsName;
  Grid.Cells[3, iRow] := sStd;
  Grid.Cells[4, iRow] := SendMaster.VcSendStockName;
  Grid.Cells[5, iRow] := SendMaster.VcRecvStockName;
  Grid.Cells[19, iRow] := sPtypeid;
  Grid.Cells[16, iRow] := '10';
  Grid.Col := 6;
}
end;


function TFmPosSendBill.CheckData: Boolean;
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
    {if sgorder.Cells[20, iRow] = '' then
    begin
      sgorder.SetFocus;
      sgorder.Row := iRow;
      sgorder.Col := 6;
      Application.MessageBox('请选择当前的单位！', pchar(application.Title), MB_OK + MB_ICONinformation);
      Exit;
    end;}
    
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
      Application.MessageBox(pchar('现有库存数量不能满足配送数量！'), pchar(application.Title), MB_OK + MB_ICONinformation);
      Exit;
    end;
    if Trim(sgorder.Cells[8, iRow]) = '' then sgorder.Cells[8, iRow] := '0';
    {if StrToFloat(sgorder.Cells[8, iRow]) = 0 then
    begin
      sgorder.SetFocus;
      sgorder.Row := iRow;
      sgorder.Col := 8;
      Application.MessageBox('配送价不能为空或零！', pchar(application.Title), MB_OK + MB_ICONinformation);
      Exit;
    end;}
    sgorder.Cells[9, iRow] := FloatToStr(StrToFloat(sgorder.Cells[7, iRow]) * StrToFloat(Trim(sgorder.Cells[8, iRow])));
  end;

  Result := True;
end;

procedure TFmPosSendBill.BitBtn1Click(Sender: TObject);
begin
  sendmaster.vcListerId:=trim(Handle_Man);
  if not CheckData then Exit;
  if not SaveData then Exit;
  FormIni;
end;

function TFmPosSendBill.SaveData: Boolean;
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
    CdsMasterData.FieldByName('vcAssessorId').AsString := SendMaster.vcAssessorId;
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
      CdsDetailData.FieldByName('goodsmemo').AsString :='配送';
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
      dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='配送单';
      dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=formatdatetime('yyyy''-''mm''-''dd',date);
      dmmain.cdsReceipt.FieldByName('Proposer').AsString:=Trim(Edtm.Text);
      dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
      dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
      dmmain.cdsReceipt.FieldByName('Condense').AsString:='仓库【'+shopid+'】指定出货仓库【'+EdtSendStock.Text+'】向仓库'+EdtRecvStock.Text+'配送';
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

procedure TFmPosSendBill.TeThemeButton1Click(Sender: TObject);
begin
//  Grid.AddRow;

end;

function TFmPosSendBill.ReadBill: Boolean;
var
  iRow: Integer;
  sql:widestring;
begin
//
  Result := False;
  if SEditMode = '' then Exit;
  try
  //---显示数据，并且给相应变量付值------//

    sql:='select a.*,b.*,c.* from sendmastertable as a ,senddetailtable as b, vSelectGoods as c where b.vcSendBillId=a.vcSendBillId and b.vcPtypeid =c.goods_no and c.storage_no= a.vcSendStockID  and a.ibilltype=503 and a.BillNo='+''''+trim(list_no)+'''';   //5-7 WG EDIT
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
    speedbutton2.Enabled:=false;
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
      //gorder.Cells[4,iRow] := trim(dmmain.CDSquery2.Fieldbyname('base_unit').AsString);
      sgorder.Cells[8,iRow] := trim(dmmain.CDSquery2.Fieldbyname('SendPrice').AsString);
      sgorder.Cells[9,iRow] := trim(dmmain.CDSquery2.Fieldbyname('SendTotal').AsString);
      sgorder.Cells[21,iRow] := trim(dmmain.CDSquery2.Fieldbyname('stock_amount').AsString);
      sgorder.Cells[19,irow ] := '0000100001';
      sgorder.Cells[16,irow ] := '10';
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

procedure TFmPosSendBill.SumCol(ACol, ARow: Integer);
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

procedure TFmPosSendBill.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_EsCaPE then
    Close;
end;

procedure TFmPosSendBill.sgorderDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
//ydy add 设置显示颜色
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

procedure TFmPosSendBill.sgorderDblClick(Sender: TObject);
var
  i:integer;
begin
/////复制  数量  单位等
  if zd then  //从要货计划转单，
  begin
  if (pcol = 1) or (pcol =2) then
  begin
   dlgmsggoods:=tdlgmsggoods.Create(self);
   dlgmsggoods.model:=1;
   dlgmsggoods.ShowModal;
   dlgmsggoods.Free;
  end;
  end else  //主动配送
  begin
    if (pcol = 1) or (pcol =2) then
    begin
     fmgoodCodeSelPei:= TfmgoodCodeSelPei.Create(nil);
     try
     fmgoodCodeSelPei.show_mode := '配送收货单';
     fmgoodCodeSelPei.ShowModal;
     finally
     fmgoodCodeSelPei.Free;
   end;
   end;
  end;
  if pcol=7 then
  begin
    for i:=prow+1 to sgorder.RowCount-1 do
    begin
      sgorder.Cells[7,i]:= sgorder.Cells[7,prow]
    end;
  end;
end;

procedure TFmPosSendBill.sgorderSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  pcol:=acol;
  prow:=arow;
end;

procedure TFmPosSendBill.sgorderKeyPress(Sender: TObject; var Key: Char);
begin
  if (pcol =7) or (pcol =8){in [3]}  then
  begin
    if not (key in ['0'..'9',#8]) then    //数量没有小数点
    key:=#0;
    sgorder.Options := sgorder.Options+ [goediting];
  end else
  begin
   sgorder.Options := sgorder.Options - [goediting];

  end;

end;

procedure TFmPosSendBill.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  shopid:=ckid;
  action:=cafree;
end;

procedure TFmPosSendBill.bitcheckClick(Sender: TObject);
var
  user,s,temp,remarks,ofid:widestring;
  flag,intof:olevariant;
  totals:double;
  i:integer;
begin
  if trim(sBillId)=''then exit;
  if trim(sgorder.Cells[1,1])='' then exit;
  no:=trim(edtbillno.Text);
  s:=trim(EdtSendStock.Text);
  typed:='配送单';
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
  if flag='3' then //
  begin
    //////////////修改配送单据状态，改为收货状态；修改要货计划的已配数量，满足后设置为配送完成状态/////////
    try
    temp:='update sendmastertable set SendStatus=3,iBIlltype=501 where BillNo='+''''+trim(edtbillno.Text)+'''';
    ipubtemp.scrapsate(temp); //修改配送单;
    /////////////////////////要货单细表;
    ofid:=trim(edtpart.Text);
    ipubtemp.Updatebatch(no,ofid);
    ///////////////////////
    /////////////////////////配送出库
    flag:=ipubtemp.batchstock(no,1);
    ////////////////////////////////
    ////////////////////财务
    remarks:='从:【'+shopid+'】仓库配送商品';
    /////////////////////////////财务////////////////
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

procedure TFmPosSendBill.sgorderMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  i:integer;  
begin
  if prow<>0 then
  begin
    if (trim(sgorder.Cells[7,prow])<>'') and (trim(sgorder.Cells[21,prow])<>'') then
    begin
      if strtoint(sgorder.Cells[7,prow])> strtoint(sgorder.Cells[21,prow]) then
      begin
        sgorder.Cells[7,prow]:='0';
        application.MessageBox('数量已超过库存数量！',pchar(application.Title),mb_iconinformation);
        exit;
      end;
    end;  
  end;  
  for i:=1 to sgorder.RowCount-1 do
  begin
    SumCol(8,i);
  end;
end;

procedure TFmPosSendBill.SpeedButton3Click(Sender: TObject);
begin
   dlgSQpspart:=tdlgSQpspart.Create(self);
   dlgSQpspart.ShowModal;
   dlgSQpspart.Free;
   if dmmain.CDSdata.IsEmpty  then exit;
   edtpart.Text:=trim(dmmain.CDSdata.fieldbyname('part_name').AsString);
   officeid:=trim(dmmain.CDSdata.fieldbyname('part_no').AsString);
   if trim(edtpart.Text)<>'' then
   begin
     zd:=true;
     SendMaster.VcSourceId:=officeid;
     EdtRecvStock.Text:=trim(dmmain.CDSdata.fieldbyname('storageid').AsString);
     SendMaster.vcRecvStockID:=trim(edtrecvstock.Text);
     speedbutton2.Enabled:=false;
   end else
   begin
     zd:=false;
     SendMaster.VcSourceId:='#';//没有就给一特定字符;
   end;
   dmmain.CDSdata.Close;
   dmmain.CDSdata.Data:=null;
   //shopid:=dmmain.
end;

procedure TFmPosSendBill.edtpartChange(Sender: TObject);
begin
  if trim(edtpart.Text)<>'' then
  begin
    shopid:=ckid ;
  end ;
end;

procedure TFmPosSendBill.Cmd_AddClick(Sender: TObject);
begin
  addgridrows(sgorder);
end;

procedure TFmPosSendBill.Cmd_DeleteClick(Sender: TObject);
begin
  deletegridrows(sgorder,prow);
end;

procedure TFmPosSendBill.sourcebillClick(Sender: TObject);
begin
  if trim(sBillId)=''then exit;
  fastrepxf:=tfastrepxf.Create(self);
  fastrepxf.frReportxf.Dataset:=nil;
  fastrepxf.filenames:='PosBill.ini';
  fastrepxf.ShowModal;
  fastrepxf.Free;
end;

end.


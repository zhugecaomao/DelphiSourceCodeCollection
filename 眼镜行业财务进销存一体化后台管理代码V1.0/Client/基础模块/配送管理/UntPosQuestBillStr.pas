unit UntPosQuestBillStr;
///门店配送退货出库单  2004-4-15 ydy
////ydy 2004-4-23 修改为用STRINGGRID
/////2004-4-25 修改初步完成，采用公用函数
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, DB, DBClient, DBGrids, Menus;

//////数据表的记录
type TSendMaster = record
    vcSendBillId: string;
    VcSourceId: string;
    BillNo: string;
    iBIlltype: integer;
    vcSendStockID: string;
    vcRecvStockID: string;
    dtDrawDate: TDateTime;
    dtOutStockDate: Tdatetime;
    vcEId: string;
    vcListerId: string;
    vcAssessorId: string;
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
  TFmPosQuestBillStr = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BtnAddRow: TSpeedButton;
    BtnDelRow: TSpeedButton;
    sourcebill: TSpeedButton;
    query: TSpeedButton;
    help: TSpeedButton;
    Label4: TLabel;
    Label6: TLabel;
    EdtMemo: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StaticText1: TStaticText;
    EdtBillNo: TEdit;
    BillTitle: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    CdsMasterData: TClientDataSet;
    CdsDetailData: TClientDataSet;
    sgorder: TStringGrid;
    bitcheck: TBitBtn;
    edtsendshop: TLabeledEdit;
    edtRecvStock: TLabeledEdit;
    edtm: TLabeledEdit;
    edtg: TLabeledEdit;
    edtc: TLabeledEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnDelRowClick(Sender: TObject);
    procedure BtnAddRowClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgorderDblClick(Sender: TObject);
    procedure SgorderSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure sgorderDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgorderKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgorderKeyPress(Sender: TObject; var Key: Char);
    procedure sgorderMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure bitcheckClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    SendMaster: TSendMaster;
    sBillId, SEditMode: string;
    sGoodsName: string;
    sUserCode: string;

    procedure FormIni;
    function CheckData: Boolean;
    function SaveData: Boolean;
    function ReadBill: Boolean;
    procedure SumCol(ACol, ARow: Integer);
    procedure ClearGrid;  
  public
    { Public declarations }
     pcol,prow:integer; //记录行列编号
  end;

var
  FmPosQuestBillStr: TFmPosQuestBillStr;
  function ShowPosQuestBillFmStrGrid(sBillId: string; EditMode: string; iBillType: Integer): Integer;

implementation

uses  UntgoodCodeSelPei, Unt_PubStrGrid, Data,untdatadm, func;

{$R *.dfm}

//外部调用函数 (完全自管理)
function ShowPosQuestBillFmStrGrid(sBillId: string; EditMode: string; iBillType: Integer): Integer;
begin
  Result := 1;
  FmPosQuestBillStr := TFmPosQuestBillStr.Create(nil);
  FmPosQuestBillStr.sBillId := sBillId;
  FmPosQuestBillStr.SEditMode := UpperCase(EditMode);
  FmPosQuestBillStr.SendMaster.iBIlltype := iBillType;
  try
    FmPosQuestBillStr.FormIni;
    FmPosQuestBillStr.ShowModal;
  finally
    FmPosQuestBillStr.Free;
  end;
end;

procedure TFmPosQuestBillStr.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFmPosQuestBillStr.sgorderKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
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
{
  if (Key = VK_Insert) and (ssCtrl in Shift) then
 //     sgorder.InsertRows(sgorder.Row, 1);
 if (Key = VK_DELETE) and (ssCtrl in Shift) then
    BtnAddRowClick(sender);
}
end;

procedure TFmPosQuestBillStr.FormIni;
var
  iRow: Integer;
  TEMP,MAKE:STRING;
begin
  EdtMemo.Text := '';
  InitialStrGrid(sgorder,'配送退货单');
  if SendMaster.iBIlltype = 505 then
  begin
    FmPosQuestBillStr.Caption := '门店退货出库单';
    BillTitle.Caption := '门店退货出库单';
  end;
  if SendMaster.iBIlltype = 501 then
  begin
    FmPosQuestBillStr.Caption := '配送收货单';
    BillTitle.Caption := '配送收货单';
  end;
  IF SEditMode = '' THEN
  begin
    ReadBill;
  end;

end;



function TFmPosQuestBillStr.CheckData: Boolean;
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
    Application.MessageBox('单据编号不能为空！', pchar(application.Title), MB_OK +MB_ICONinformation);
    Exit;
  end;
  if (Trim(edtRecvStock.Text) = '') or
    (SendMaster.vcRecvStockID = '') then
  begin
//    EdtRecvStock.SetFocus;
    Application.MessageBox('收货仓库不能为空！', pchar(application.Title), MB_OK +MB_ICONinformation);
    Exit;
  end;
  if (Trim(edtM.Text) = '') or
    (SendMaster.vcListerId = '') then
  begin
//    EdtM.SetFocus;
    Application.MessageBox('制单人不能为空！', pchar(application.Title), MB_OK +MB_ICONinformation);
    Exit;
  end;
  if (Trim(edtG.Text) = '') or
    (SendMaster.vcEId = '') then
  begin
//    EdtG.SetFocus;
    Application.MessageBox('经手人不能为空！', pchar(application.Title), MB_OK +MB_ICONinformation);
    Exit;
  end;
  if (Trim(edtC.Text) = '') or
    (SendMaster.vcAssessorId = '') then
  begin
//    EdtC.SetFocus;
    Application.MessageBox('审核人不能为空！', pchar(application.Title), MB_OK +MB_ICONinformation);
    Exit;
  end;
  for iRow := 1 to sgorder.RowCount - 1 do
  begin
    if (sgorder.Cells[1, iRow] = '') or (sgorder.Cells[2, iRow] = '') then
    begin
      sgorder.SetFocus;
      sgorder.Row := iRow;
      sgorder.Col := 1;
      Application.MessageBox('当前商品不能为空！', pchar(application.Title), MB_OK +MB_ICONinformation);
      Exit;
    end;
    sgorder.Cells[20, iRow] := '1';
{
    if sgorder.Cells[20, iRow] = '' then
    begin
      sgorder.SetFocus;
      sgorder.Row := iRow;
      sgorder.Col := 6;
      Application.MessageBox('请选择当前的单位！', pchar(application.Title), MB_OK +MB_ICONinformation);
      Exit;
    end;
}
    if Trim(sgorder.Cells[7, iRow]) = '' then sgorder.Cells[7, iRow] := '0';
    if StrToFloat(sgorder.Cells[7, iRow]) = 0 then
    begin
      sgorder.SetFocus;
      sgorder.Row := iRow;
      sgorder.Col := 7;
      Application.MessageBox('请输入退货数量！', pchar(application.Title), MB_OK +MB_ICONinformation);
      Exit;
    end;
    if Trim(sgorder.Cells[8, iRow]) = '' then sgorder.Cells[8, iRow] := '0';
    if StrToFloat(sgorder.Cells[8, iRow]) = 0 then
    begin
      sgorder.SetFocus;
      sgorder.Row := iRow;
      sgorder.Col := 6;
      Application.MessageBox('退回价不能为空或零！', pchar(application.Title), MB_OK +MB_ICONinformation);
      Exit;
    end;
    sgorder.Cells[9, iRow] := FloatToStr(StrToFloat(sgorder.Cells[7, iRow]) * StrToFloat(Trim(sgorder.Cells[8, iRow])));
  end;

  Result := True;
end;

procedure TFmPosQuestBillStr.BitBtn1Click(Sender: TObject);
begin
  if not CheckData then Exit;
  if not SaveData then Exit;
  FormIni;
end;

function TFmPosQuestBillStr.SaveData: Boolean;
var
  IRow: Integer;
  fQty, fPrice, fTotal, dRate: Double;
  PsRst, iunit: Integer;
  iEditMode,i: Integer;
  mdata,Ddata:olevariant;//主副表数据
begin
//
  SendMaster.VcSourceId:='0';
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
   with CdsMasterData do
   begin
   EmptyDataSet;
   Append;
   FieldByName('vcSendBillId').AsString := SendMaster.vcSendBillId;
   FieldByName('VcSourceId').AsString := SendMaster.VcSourceId;
   FieldByName('vcSendStockID').AsString := SendMaster.vcSendStockID;
   FieldByName('vcRecvStockID').AsString := SendMaster.vcRecvStockID;
   FieldByName('vcEId').AsString := SendMaster.vcEId;
   FieldByName('vcListerId').AsString := SendMaster.vcListerId;
   FieldByName('vcAssessorId').AsString := SendMaster.vcAssessorId;
   FieldByName('vcOutHouseReadBillId').AsString := SendMaster.vcOutHouseReadBillId;
   FieldByName('vcExplain').AsString := SendMaster.vcExplain;
   FieldByName('BillStatus').Asinteger := SendMaster.BillStatus;
   FieldByName('iBIlltype').Asinteger := SendMaster.iBIlltype;
   FieldByName('inVoucherSign').Asinteger := SendMaster.inVoucherSign;
   FieldByName('inIsReadSign').Asinteger := SendMaster.inIsReadSign;
   FieldByName('SendStatus').Asinteger := SendMaster.SendStatus;
   FieldByName('NSumQty').AsFloat := SendMaster.NSumQty;
   FieldByName('nuCess').AsFloat := SendMaster.nuCess;
   FieldByName('nuTax').AsFloat := SendMaster.nuTax;
   FieldByName('nuIncTaxSum').AsFloat := SendMaster.nuIncTaxSum;
   FieldByName('nuTotalMoney').AsFloat := SendMaster.nuTotalMoney;
   FieldByName('nuUnTaxSum').AsFloat := SendMaster.nuUnTaxSum;
   FieldByName('dtDrawDate').AsDateTime := SendMaster.dtDrawDate;
   FieldByName('dtOutStockDate').AsDateTime := SendMaster.dtOutStockDate;
   FieldByName('BillNo').AsString := SendMaster.BillNo;
   FieldByName('ObjectID').asInteger := SendMaster.ObjectID;

   end;
   with  CdsDetailData do
   begin
    EmptyDataSet;
    for IRow := 1 to sgorder.RowCount - 1 do
    begin
     Append;
     FieldByName('vcSendBillId').AsString := SendMaster.vcSendBillId;
     FieldByName('ord').asInteger := IRow;
     FieldByName('InOrderId').asInteger := IRow;
     FieldByName('vcPtypeid').AsString := Trim(sgorder.cells[2, iRow]);
     FieldByName('VcSendStockID').AsString := Trim(SendMaster.vcSendStockID); //乏货单位
     FieldByName('VcRecvStockID').AsString := Trim(SendMaster.vcRecvStockID); //收获
     FieldByName('vcBatch').AsString := '';
     FieldByName('vcGoodUnitId').AsString := Trim(sgorder.cells[6, iRow]);
     //iunit := StrToInt(sgorder.Cells[20, iRow]);
     dRate := StrToFloat(sgorder.Cells[16, iRow]);
     iunit:=0;
      if iunit = 1 then
      begin
        fQty := StrToFloat(Trim(sgorder.cells[7, iRow])) * dRate;
        FieldByName('nuOutQuantity').asFloat := fQty;
        fPrice := StrToFloat(Trim(sgorder.cells[8, iRow])) / dRate;
        FieldByName('SendPrice').asFloat := fPrice;
      end
      else
      begin
        fQty := StrToFloat(Trim(sgorder.cells[7, iRow]));
        FieldByName('nuOutQuantity').asFloat := fQty;
        fPrice := StrToFloat(Trim(sgorder.cells[8, iRow]));
        FieldByName('SendPrice').asFloat := fPrice;
      end;
      fTotal := fPrice * fQty;
     FieldByName('SendTotal').asFloat := fTotal;
     FieldByName('nuCess').asFloat := 0;
     FieldByName('nuIncTaxPrice').asFloat := fPrice;
     FieldByName('nuTax').asFloat := 0;
     FieldByName('NTaxTotal').asFloat := fTotal;
     FieldByName('nuCostPrice').asFloat := fPrice;
     FieldByName('NCastTotal').asFloat := fTotal;
     FieldByName('iUnit').asInteger := iunit;
     FieldByName('NRate').asFloat := dRate;
     end;
    end;
    PsRst := CdsDetailData.RecordCount;
    //adisp.InsertSendBill(CdsMasterData.Data,CdsDetailData.Data,iEditMode,PsRst);
     if ieditmode=0 then   //写草稿;
    begin
      dmmain.cdsReceipt.close;
      dmmain.cdsReceipt.Open;
      dmmain.cdsReceipt.Append;
      dmmain.cdsReceipt.FieldByName('Receipt_NO').AsString:=Trim(edtbillno.Text);
      dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='配送单';
      dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=formatdatetime('yyyy''-''mm''-''dd',date);
      dmmain.cdsReceipt.FieldByName('Proposer').AsString:=Trim(edtm.Text);
      dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
      dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
      dmmain.cdsReceipt.FieldByName('Condense').AsString:='从仓库'+edtSendshop.Text+'向仓库'+edtRecvStock.Text+'配送退货';
      dmmain.cdsReceipt.Post;
      dmmain.cdsReceipt.ApplyUpdates(-1);
    end;
    mdata:= CdsMasterData.Data;
    Ddata:=CdsDetailData.Data;
    adisp.InsertSendBill(mData,dData,iEditMode, PsRst);
    if PsRst <> 0 then raise Exception.Create('单据保存失败！');
    ClearGrid;
    Result := True;
  except
    on E: Exception do
    begin
      Application.MessageBox(Pchar(E.message), pchar(application.Title), MB_OK +MB_ICONinformation)
    end;
  end;
end;

procedure TFmPosQuestBillStr.BtnDelRowClick(Sender: TObject);
begin
  if sgorder.RowCount = 2 then
  begin
//    sgorder.ClearRows(1, sgorder.ColCount);
    Exit;
  end;
  if sgorder.Row = sgorder.RowCount - 1 then
  begin
//    sgorder.RemoveRows(sgorder.Row, 1);
    sgorder.SetFocus;
    Exit;
  end;
//  sgorder.RemoveRows(sgorder.Row, 1);
  sgorder.SetFocus;
end;

procedure TFmPosQuestBillStr.BtnAddRowClick(Sender: TObject);
begin
//  sgorder.AddRow;
end;

function TFmPosQuestBillStr.ReadBill: Boolean;
var
  iRow: Integer;
  sql:widestring;
begin
//
  Result := False;
  //if SEditMode = '' then Exit;
  try
    sql:='select a.*,b.*,c.* from sendmastertable as a ,senddetailtable as b, goods_code as c where a.vcSendBillId=b.vcSendBillId and b.vcPtypeid=c.goods_no and  a.VCSENDBILLID='+''''+trim(sBillId)+'''';
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=null;
    try
    dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
    dmmain.CDSquery2.Open;
    edtbillno.Text:=trim(dmmain.CDSquery2.fieldbyname('billno').AsString);
    //edtsourcno.Text:=trim(dmmain.CDSquery2.fieldbyname('VcSourceId').AsString);
    edtSendshop.Text:=trim(dmmain.CDSquery2.fieldbyname('vcSendStockID').AsString);
    sendmaster.vcSendStockID:=trim(dmmain.CDSquery2.fieldbyname('vcSendStockID').AsString);
    edtRecvStock.Text:=trim(dmmain.CDSquery2.fieldbyname('vcRecvStockID').AsString);
    edtm.Text:=trim(dmmain.CDSquery2.fieldbyname('vcListerId').AsString);
    edtg.Text:=trim(dmmain.CDSquery2.fieldbyname('vcEId').AsString);
    edtc.Text:=trim(dmmain.CDSquery2.fieldbyname('vcAssessorId').AsString);
    edtmemo.Text:=trim(dmmain.CDSquery2.fieldbyname('vcExplain').AsString);
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


procedure TFmPosQuestBillStr.SumCol(ACol, ARow: Integer);
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

procedure TFmPosQuestBillStr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_EsCaPE then
    Close;
end;

procedure TFmPosQuestBillStr.sgorderSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  pcol:=acol;
  prow:=arow;
end;


procedure TFmPosQuestBillStr.sgorderDblClick(Sender: TObject);
var
  i:integer;
begin
/////复制  数量  单位等
  if (pcol = 1) or (pcol =2) then
  begin
   fmgoodCodeSelPei:= TfmgoodCodeSelPei.Create(nil);
   try
   fmgoodCodeSelPei.show_mode := '门店退货出库单';
   fmgoodCodeSelPei.ShowModal;
   finally
   fmgoodCodeSelPei.Free;
   end;
  end;

  if pcol =  7 then
  begin
  for i:=2 to sgorder.RowCount-1 do
  begin
    sgorder.Cells[7,i] := sgorder.cells[7,1];
    SumCol(7,i);
  end;
  end;

  if pcol =  8 then  ///???//
  begin
    for i:=2 to sgorder.RowCount-1 do
    begin
      sgorder.Cells[8,i] := sgorder.cells[8,1];
      SumCol(8,i);
    end;
  end;

///必须刷新，不然显示不对
  sgorder.Refresh;




end;


procedure TFmPosQuestBillStr.FormShow(Sender: TObject);
var
  t_sql:widestring;
begin
   //edtSendShop.Text := shopid;
   edtM.Text := trim(Handle_Man);
   SendMaster.vcListerId := trim(Handle_Man);   //制单人
   //SendMaster.vcSendStockID := shopid;
   SendMaster.VcSendStockName := shopid; //sStockName;
   SendMaster.vcRecvStockID := shopid; //sStockID;
   SendMaster.VcRecvStockName := shopid;//sStockName;
//   SendMaster.vcAssessorId := cmbc.text;
   sendmaster.vcRecvStockID := '0001';
end;

procedure TFmPosQuestBillStr.Cleargrid;
var
  i,j:integer;
begin
   ///////////ydy add to clear the stringsgorder
   with sgorder do
   begin
      for i:=1 to colCount do
         for j:=1 to rowCount do
            cells[i,j]:='';
   end;
   sgorder.RowCount := 2;
end;




procedure TFmPosQuestBillStr.sgorderDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
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

procedure TFmPosQuestBillStr.sgorderKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (pcol =7) or (pcol =8){in [3]}  then
  begin
  if not (key in ['0'..'9',#8]) then    //数量没有小数点
  key:=#0;
   sgorder.Options := sgorder.Options+ [goediting]
  end
 else
  begin
   sgorder.Options := sgorder.Options - [goediting];
   key := #0;
  end;
end;


procedure TFmPosQuestBillStr.sgorderMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  i:integer;
begin
  for i:=1 to sgorder.RowCount-1 do
  begin
    SumCol(8,i);
  end;
end;

procedure TFmPosQuestBillStr.bitcheckClick(Sender: TObject);
var
  user,sql:widestring;
  flag:olevariant;
begin
  if trim(sBillId)=''then exit;
  if trim(sgorder.Cells[1,1])='' then exit;
  no:=trim(edtbillno.Text);
  try
  flag:=ipubtemp.batchstock(no,2);   //配送入库;
  sql:='update SendMasterTable set SendStatus=2 where  billno='+''''+trim(no)+'''';   //修改为收货完成状态；
  adisp.updatesql(sql);
  except
  end;
  if flag='1' then
  begin
    application.MessageBox('审核成功！',pchar(application.Title),mb_iconinformation);
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

procedure TFmPosQuestBillStr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

end.


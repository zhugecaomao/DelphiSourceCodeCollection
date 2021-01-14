unit UntAskGoodsPlan;
/////***配送-- 要货计划和配送需求计划****/

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids,  StdCtrls,  Buttons, ExtCtrls, ComCtrls;


type TaskMaster = record
    VcGetGoodsPlanID: string;
    BillNo: string;
    iBillType: Integer;
    VCOfficeID: String;
    VcStockID: string;        // 选择中心仓库
    DGetDate: TDateTime;
    VcEID: string;      //制单人
    vcCheckE: string;   //审核人
    Memo: string;
    IPlanStatus: Integer;
  end;
type
  TFmAskGoodsPlan = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    EdtSendStock: TEdit;
    Panel4: TPanel;
    TeThemeButton1: TSpeedButton;
    TeThemeButton2: TSpeedButton;
    sourcebill: TSpeedButton;
    query: TSpeedButton;
    help: TSpeedButton;
    EdtRecvStock: TEdit;
    EdtMemo: TEdit;
    Panel2: TPanel;
    BtnSave: TBitBtn;
    BtnClose: TBitBtn;
    Panel3: TPanel;
    dpt1: TDateTimePicker;
    EdtBillNo: TEdit;
    StaticText1: TStaticText;
    Label7: TLabel;
    CdsMasterData: TClientDataSet;
    CdsDetailData: TClientDataSet;
    sgorder: TStringGrid;
    Label5: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    CmbG: TLabeledEdit;
    cmbc: TLabeledEdit;
    SpeedButton3: TSpeedButton;
    Panel10: TPanel;
    Cmd_Delete: TSpeedButton;
    Cmd_Add: TSpeedButton;
    procedure SpeedButton3Click(Sender: TObject);
    procedure EdtSendStockKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtRecvStockKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dpt1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtMemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgorderKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CdsDetailDataBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
    procedure CdsMasterDataBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCloseClick(Sender: TObject);
    procedure sgorderDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgorderDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgorderDblClick(Sender: TObject);
    procedure sgorderSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgorderKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Cmd_AddClick(Sender: TObject);
    procedure Cmd_DeleteClick(Sender: TObject);
  private
    { Private declarations }
    AskMaster: TAskMaster;
    sBillId, SEditMode: string;
    sUserCode: String;
    sGoodsName: String;
    procedure SelectGoods(iRow: Integer);
    procedure FormIni;
    function CheckData: Boolean;
    function SaveData: Boolean;
    procedure CheckCells(ACol, ARow: Integer);
    function ReadBill: Boolean;    
  public
    { Public declarations }
     pcol,prow:integer; //记录行列编号
  end;

var
  FmAskGoodsPlan: TFmAskGoodsPlan;
function ShowAskGoodsPlanFm(sBillId: string; EditMode: string; iBillType: Integer): Integer;
implementation

uses   Unt_PubStrGrid, UntgoodCodeSelPei, Data, func, untdatadm,
  Storage_Select, Untpart, Login_Man, Untselectps;


{$R *.dfm}

function ShowAskGoodsPlanFm(sBillId: string; EditMode: string; iBillType: Integer): Integer;
begin
  Result := 1;
  FmAskGoodsPlan := TFmAskGoodsPlan.Create(nil);
  try
    FmAskGoodsPlan.sBillId := sBillId;
    FmAskGoodsPlan.SEditMode := UpperCase(EditMode);
    FmAskGoodsPlan.AskMaster.iBillType := iBillType;
    FmAskGoodsPlan.FormIni;
    FmAskGoodsPlan.ShowModal;
  finally
    FmAskGoodsPlan.Free;
  end;
end;

procedure TFmAskGoodsPlan.SpeedButton3Click(Sender: TObject);
var
  sEId, sEName: string;
begin
  Employe_Check:='';
  Employe_Check:='Storage_Umanage_Fad';
  Employe_Check_Result:='';
  frm_Login_Man:=Tfrm_Login_Man.Create(self);
  frm_Login_Man.Caption:='经手人选择';
  frm_Login_Man.ShowModal;
  cmbc.Text:=Employe_Check_Result;
  AskMaster.vcCheckE := Employe_Check_Result;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFmAskGoodsPlan.EdtSendStockKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    //SpeedButton1Click(sender);
  end;
end;

procedure TFmAskGoodsPlan.EdtMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    SpeedButton3Click(sender);
  end;
end;

procedure TFmAskGoodsPlan.EdtRecvStockKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFmAskGoodsPlan.dpt1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFmAskGoodsPlan.EdtMemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{
  if Key = VK_RETURN then
  begin
    Grid.SetFocus;
    Grid.Col := 1;
    Grid.Row := 1;
  end;
}
end;

procedure TFmAskGoodsPlan.sgorderKeyDown(Sender: TObject; var Key: Word;
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

  if (sgorder.Col = 4) then
  begin
    if key = VK_RETURN then
    begin
      sgorder.Col := 5;
      Exit;
    end;
  end;


  if (sgorder.Col = 5) then
  begin
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
  if (sgorder.Col = 7) then
  begin
    if Key = VK_SPACE then
    begin
      CheckCells(sgorder.Col,sgorder.Row);
    end;
  end;
  if key = VK_RETURN then
    Key := VK_TAB;
  if (Key = VK_Insert) and (ssCtrl in Shift) then
//    sgorder.InsertRows(Grid.Row, 1);
  if (Key = VK_DELETE) and (ssCtrl in Shift) then
//    TeThemeButton2Click(sender)
end;

procedure TFmAskGoodsPlan.SelectGoods(iRow: Integer);
var
  sGoodsID, sPtypeid: string;
  sStd: string;
begin
end;

procedure TFmAskGoodsPlan.FormIni;
var
  iRow: Integer;
  temp:widestring;
  sqlpubs,make:string;
begin
   EdtSendStock.Text:=trim(Handle_Part);
   EdtRecvStock.Text:=trim(shopid) ;
//  EdtM.Text := '';
    cmbC.Text := '';
    cmbg.Text := '';
    edit1.Clear;
    dpt1.Date:=date;
    try
  sqlpubs:='select max(right(VcBillNo,4)) from GetGoodsPlanMaster where DGetDate='+''''+formatdatetime('yyyy''-''mm''-''dd',date)+''''+' and VCOfficeID='+''''+trim(Handle_Part)+'''';
  make:='PSQ-'+trim(Handle_Part)+trim(handle_no); //编码中部门编号
  edtbillno.Text:=setcode(sqlpubs,make);
  cmbg.Text := trim(Handle_Man);
  AskMaster.VcEID:=cmbg.Text;
  InitialStrGrid(sgorder,'门店配送需求单');
   CdsMasterData.Close;
  CdsMasterData.Data :=null;
  temp:= 'Select * from GetGoodsPlanMaster where 1=2';
  CdsMasterData.Data:=adisp.PubBatch(temp);
  CdsMasterData.Open;
  temp:='Select * from GetGoodsPlan where 1=2';
  CdsDetailData.Close;
  CdsDetailData.Data:=null;
  CdsDetailData.Data:=adisp.PubBatch(temp);
  CdsDetailData.Open;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit; 
  end;
//  Grid.ClearRect(1, 1, Grid.ColCount, Grid.RowCount);
  for iRow := 1 to sgorder.RowCount do
  begin
    sgorder.Cells[0, iRow] := IntToStr(iRow);
    sgorder.Rows[irow].Clear;
  end;

  sgorder.RowCount := 2;
  sgorder.Cells[0, 1]:='1';
  IF SEditMode <> '' THEN
    ReadBill;

end;

function TFmAskGoodsPlan.CheckData: Boolean;
var
  iRow: Integer;
begin
//
  Result := False;
//  AskMaster.vcExplain := EdtMemo.Text;
  AskMaster.BillNo := EdtBillNo.Text;
  if Trim(askMasTer.BillNo) = '' then
  begin
    EdtBillNo.SetFocus;
    Application.MessageBox('单据编号不能为空！', pchar(application.Title), MB_OK + MB_ICONinformation);
    Exit;
  end;
  if (Trim(EdtSendStock.Text) = '') then
  begin
    EdtSendStock.SetFocus;
    Application.MessageBox('要货单位不能为空！', pchar(application.Title), MB_OK + MB_ICONinformation);
    Exit;
  end;
  if (Trim(EdtRecvStock.Text) = '') then
  begin
    EdtRecvStock.SetFocus;
    Application.MessageBox('要货仓库不能为空！', pchar(application.Title), MB_OK + MB_ICONinformation);
    Exit;
  end;

  if (Trim(Edit1.Text) = '') or
    (AskMaster.VcStockID = '') then
  begin
    Edit1.SetFocus;
    Application.MessageBox('请选择配送仓库！', pchar(application.Title), MB_OK + MB_ICONinformation);
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
    if sgorder.Cells[5, iRow] = '' then
    begin
      sgorder.SetFocus;
      sgorder.Row := iRow;
      sgorder.Col := 5;
      Application.MessageBox('请输入申请商品数量！', pchar(application.Title), MB_OK + MB_ICONinformation);
      Exit;
    end;
    if Trim(sgorder.Cells[5, iRow]) = '' then sgorder.Cells[5, iRow] := '0';
    if StrToFloat(sgorder.Cells[5, iRow]) = 0 then
    begin
      sgorder.SetFocus;
      sgorder.Row := iRow;
      sgorder.Col := 5;
      Application.MessageBox('请输入要货数量！', pchar(application.Title), MB_OK + MB_ICONinformation);
      Exit;
    end;
  end;

  Result := True;
end;

function TFmAskGoodsPlan.SaveData: Boolean;
var
  IRow: Integer;
  fQty, fEndQty,dRate: Double;
  PsRst,iunit: Integer;
  iEditMode,IStatus: Integer;
  mdata,Ddata:olevariant;//主副表数据
begin
//
  Result := False;
  AskMaster.DGetDate:=dpt1.Date;
  AskMaster.VCOfficeID:=trim(EdtSendStock.Text);
  if SEditMode = '' then
    iEditMode := 0
  else
    iEditMode := 1;
  try
    with CdsMasterData do
    begin
     EmptyDataSet;
     Append;
     FieldByName('VcGetGoodsPlanID').AsString := AskMaster.VcGetGoodsPlanID;
     FieldByName('VcBillNo').AsString := AskMaster.BillNo;
     FieldByName('VCOfficeID').AsString := AskMaster.VCOfficeID;
     FieldByName('iBilltype').asinteger := AskMaster.iBillType;
     FieldByName('VcStockID').AsString := AskMaster.VcStockID;
     FieldByName('DGetDate').asstring := formatdatetime('yyyy''-''mm''-''dd',AskMaster.DGetDate);
     FieldByName('VcEID').AsString := AskMaster.VcEID;
     FieldByName('vcCheckE').AsString := AskMaster.vcCheckE;
     FieldByName('Memo').AsString := AskMaster.Memo;
     FieldByName('IPlanStatus').Asinteger := 2;
   end;

   with CdsDetailData do
   begin
    EmptyDataSet;
    for IRow := 1 to sgorder.RowCount - 1 do
    begin
      Append;
      FieldByName('VcGetGoodsPlanID').AsString := AskMaster.VcGetGoodsPlanID;
      FieldByName('ord').asInteger := IRow;
      FieldByName('VCPtyieID').AsString := Trim(sgorder.cells[2, iRow]); //商品编号
      FieldByName('vcGoodUnitId').AsString := Trim(sgorder.cells[4, iRow]);
      //iunit :=  StrToInt(sgorder.Cells[12,iRow]);
      iunit:=0;
      dRate := StrToFloat(sgorder.Cells[11,iRow]);
      if iunit = 1 then
      begin
        fQty := StrToFloat(Trim(sgorder.cells[5, iRow])) * dRate;
        FieldByName('NQty').asFloat := fQty;
        fEndQty := StrToFloat(Trim(sgorder.cells[6, iRow]));
        FieldByName('NSendQty').asFloat := 0;
        FieldByName('NEndQty').asFloat := fQty - fEndQty;
      end
      else
      begin
        fQty := StrToFloat(Trim(sgorder.cells[5, iRow]));
        FieldByName('NQty').asFloat := fQty;
        fEndQty := StrToFloat(Trim(sgorder.cells[6, iRow]));
        FieldByName('NSendQty').asFloat := 0;
        FieldByName('NEndQty').asFloat := fQty - fEndQty;
      end;
      IStatus := StrToInt(sgorder.Cells[10,iRow]);
      FieldByName('IGetStatus').asFloat := IStatus;
      FieldByName('iUnit').asFloat := iunit;
      FieldByName('NRate').asFloat := dRate;
     end;
    end;
    PsRst := CdsDetailData.RecordCount;
     mdata:= CdsMasterData.Data;
     Ddata:=CdsDetailData.Data;
     adisp.InsertGetPlan(mdata,dData,iEditMode, PsRst);

    if PsRst <> 0 then raise Exception.Create('单据保存失败！');
    Result := True;
  except
    on E: Exception do
    begin
      Application.MessageBox(Pchar(E.message), pchar(application.Title), MB_OK + MB_ICONinformation)
    end;
  end;
end;

procedure TFmAskGoodsPlan.CdsDetailDataBeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  //OwnerData := 'Select * from GetGoodsPlan where VcGetGoodsPlanID =''' + sBillId + '''';
end;

procedure TFmAskGoodsPlan.CdsMasterDataBeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  //OwnerData := 'Select * from GetGoodsPlanMaster where VcGetGoodsPlanID = ''' + sBillId + '''';
end;

procedure TFmAskGoodsPlan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=cafree;

end;

procedure TFmAskGoodsPlan.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFmAskGoodsPlan.sgorderDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ACol = 7 then
  begin
     CheckCells(ACol,ARow);
  end;
end;

procedure TFmAskGoodsPlan.CheckCells(ACol, ARow: Integer);
begin
  if (Trim(sgorder.Cells[10, ARow]) = '0') or
    (Trim(sgorder.Cells[10, ARow]) = '') then
  begin
    sgorder.Cells[ACol, ARow] := '【已审】';
    sgorder.Cells[10, ARow] := '1';
  end
  else
  begin
    sgorder.Cells[ACol, ARow] := '【未审】';
    sgorder.Cells[10, ARow] := '0';
  end;
end;

procedure TFmAskGoodsPlan.BtnSaveClick(Sender: TObject);
begin
  if Not CheckData then Exit;
  if Not SaveData then Exit;
  if SEditMode = '' then
  begin
     FormIni;
     EdtSendStock.SetFocus;
     Exit;
  end;
  Close;
end;

procedure TFmAskGoodsPlan.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_EsCaPE then
    Close;
end;

function TFmAskGoodsPlan.ReadBill: Boolean;
var
  iRow: Integer;
begin
//
  Result := False;
  if SEditMode = '' then Exit;
  try
    if CdsMasterData.Active then CdsMasterData.Close;
    if CdsDetailData.Active then CdsDetailData.Close;
    CdsMasterData.Open;
    CdsDetailData.Open;
  //---显示数据，并且给相应变量付值------//



  //------显示明细数据--------------//
    CdsDetailData.First;
    for iRow := 1 to CdsDetailData.RecordCount do
    begin
   //
      sgorder.Cells[0, iRow] := IntToStr(CdsDetailData.RecNo);

      CdsDetailData.Next;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TFmAskGoodsPlan.sgorderDrawCell(Sender: TObject; ACol,
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

procedure TFmAskGoodsPlan.sgorderDblClick(Sender: TObject);
var
  i:integer;
begin
/////复制  数量  单位等
  if (pcol = 1) or (pcol =2) then
  begin
      fmgoodCodeSelPei:= TfmgoodCodeSelPei.Create(nil);
     try
      fmgoodCodeSelPei.show_mode := '配送需求单';
      fmgoodCodeSelPei.ShowModal;
     finally
      fmgoodCodeSelPei.Free;
     end;
  end;
  if pcol=5 then
  begin
    for i:=prow+1 to sgorder.RowCount-1 do
    begin
      sgorder.Cells[5,i]:= sgorder.Cells[5,prow]
    end;
  end;
end;

procedure TFmAskGoodsPlan.sgorderSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  pcol:=acol;
  prow:=arow;
end;

procedure TFmAskGoodsPlan.sgorderKeyPress(Sender: TObject; var Key: Char);
begin
  if (pcol =5) or (pcol =6)  then
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

procedure TFmAskGoodsPlan.SpeedButton1Click(Sender: TObject);
begin
  dlgselectps:=Tdlgselectps.Create(self);
  dlgselectps.ShowModal;
  if dmmain.CDSdata.IsEmpty  then exit;
  Edit1.Text:=Trim(dmmain.CDSdata.fieldbyname('managerid').AsString);
  AskMaster.VcStockID:=Trim(dmmain.CDSdata.fieldbyname('managerid').AsString);
  dmmain.CDSdata.Close;
  dmmain.CDSdata.Data:=null;
  dlgselectps.Free;
end;

procedure TFmAskGoodsPlan.Cmd_AddClick(Sender: TObject);
begin
  addgridrows(sgorder);
end;

procedure TFmAskGoodsPlan.Cmd_DeleteClick(Sender: TObject);
begin
  deletegridrows(sgorder,prow);
end;

end.


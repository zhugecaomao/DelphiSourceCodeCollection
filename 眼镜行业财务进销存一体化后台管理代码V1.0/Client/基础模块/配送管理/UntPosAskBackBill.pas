unit UntPosAskBackBill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids,StdCtrls, Buttons, ExtCtrls, ComCtrls;

  
type TaskMaster = record
    VcGetGoodsPlanID: string;
    BillNo: string;
    iBillType: Integer;
    VCOfficeID: String;
    VcStockID: string;
    DGetDate: TDateTime;
    VcEID: string;
    vcCheckE: string;
    Memo: string;
    IPlanStatus: Integer;
  end;
type
  TFmPosAskBackBill = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    SpeedButton3: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton5: TSpeedButton;
    Label6: TLabel;
    EdtSendStock: TEdit;
    Panel4: TPanel;
    TeThemeButton1: TSpeedButton;
    TeThemeButton2: TSpeedButton;
    sourcebill: TSpeedButton;
    query: TSpeedButton;
    help: TSpeedButton;
    EdtRecvStock: TEdit;
    EdtM: TEdit;
    EdtC: TEdit;
    EdtMemo: TEdit;
    Panel2: TPanel;
    BtnSave: TBitBtn;
    BtnClose: TBitBtn;
    Panel3: TPanel;
    DateTimePicker1: TDateTimePicker;
    CdsMasterData: TClientDataSet;
    CdsDetailData: TClientDataSet;
    EdtBillNo: TEdit;
    StaticText1: TStaticText;
    Label7: TLabel;
    sgorder: TStringGrid;
    bitcheck: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure EdtSendStockKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtRecvStockKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateTimePicker1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtMemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgorderKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TeThemeButton2Click(Sender: TObject);
    procedure TeThemeButton1Click(Sender: TObject);
    procedure CdsDetailDataBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
    procedure CdsMasterDataBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
    procedure BtnCloseClick(Sender: TObject);
    procedure sgordeDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sgorderDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgorderDblClick(Sender: TObject);
    procedure sgorderSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgorderKeyPress(Sender: TObject; var Key: Char);
    procedure bitcheckClick(Sender: TObject);
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
  FmPosAskBackBill: TFmPosAskBackBill;
function ShowPosAskBackBillFm(sBillId: string; EditMode: string; iBillType: Integer): Integer;
implementation

uses   Unt_PubStrGrid, UntgoodCodeSelPei, Data, func, untdatadm;


{$R *.dfm}

function ShowPosAskBackBillFm(sBillId: string; EditMode: string; iBillType: Integer): Integer;
begin
  Result := 1;
  FmPosAskBackBill := TFmPosAskBackBill.Create(nil);
  try
    FmPosAskBackBill.sBillId := sBillId;
    FmPosAskBackBill.SEditMode := UpperCase(EditMode);
    FmPosAskBackBill.AskMaster.iBillType := iBillType;
    FmPosAskBackBill.FormIni;
    FmPosAskBackBill.ShowModal;
  finally
    FmPosAskBackBill.Free;
  end;
end;

procedure TFmPosAskBackBill.SpeedButton1Click(Sender: TObject);
var
  sStockID, sStockName: string;
begin
//选择中心仓库
  sStockID := '00001';
  sStockName := '申请门店';
  EdtSendStock.Text := sStockName;
  AskMaster.VCOfficeID := '0001';
  AskMaster.VcStockID := sStockID;
  EdtSendStock.Text := '门店退货申请仓库';
  EdtRecvStock.Text := sStockName;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFmPosAskBackBill.SpeedButton3Click(Sender: TObject);
var
  sEId, sEName: string;
begin
//选择人员
  sEId := '00001';
  sEName := '制单人';
  AskMaster.VcEID := sEId;
  EdtM.Text := sEName;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFmPosAskBackBill.SpeedButton5Click(Sender: TObject);
var
  sEId, sEName: string;
begin
//选择人员
  sEId := '00002';
  sEName := '审核人';
  AskMaster.vcCheckE := sEId;
  EdtC.Text := sEName;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFmPosAskBackBill.EdtSendStockKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    SpeedButton1Click(sender);
  end;
end;

procedure TFmPosAskBackBill.EdtMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    SpeedButton3Click(sender);
  end;
end;

procedure TFmPosAskBackBill.EdtCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    SpeedButton5Click(sender);
  end;
end;

procedure TFmPosAskBackBill.EdtRecvStockKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFmPosAskBackBill.DateTimePicker1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFmPosAskBackBill.EdtMemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    sgorder.SetFocus;
    sgorder.Col := 1;
    sgorder.Row := 1;
  end;
end;

procedure TFmPosAskBackBill.sgorderKeyDown(Sender: TObject; var Key: Word;
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
  {
  if key = VK_RETURN then
    Key := VK_TAB;
  if (Key = VK_Insert) and (ssCtrl in Shift) then
    Grid.InsertRows(sgorde.Row, 1);
  if (Key = VK_DELETE) and (ssCtrl in Shift) then
    TeThemeButton2Click(sender)
  }
end;


procedure TFmPosAskBackBill.SelectGoods(iRow: Integer);
var
  sGoodsID, sPtypeid: string;
  sStd: string;
begin

  {sgoodsID := 'SYSP';
  sPtypeid := '0000100001';
  sGoodsName := '商品名称';
  sStd := '规格';
  sUserCode := 'UserCode';
  Grid.Cells[1, iRow] := sUserCode;
  Grid.Cells[2, iRow] := sGoodsName;
  Grid.Cells[3, iRow] := sStd;
  Grid.Cells[9, iRow] := sPtypeid;
  Grid.Cells[10, iRow] := '0';
  Grid.Cells[7, iRow] := '【未审】';
  Grid.Cells[6, iRow] := '0';
  Grid.Cells[11, iRow] := '10';
  Grid.Cells[12, iRow] := '1';
}
//  Grid.Col := 4;
end;

procedure TFmPosAskBackBill.FormIni;
var
  iRow: Integer;
begin
  EdtSendStock.Text := '';
  EdtRecvStock.Text := '';
  EdtM.Text := '';
  EdtC.Text := '';
  EdtMemo.Text := '';

  CdsMasterData.Close;
  CdsMasterData.Open;
  CdsDetailData.Close;
  CdsDetailData.Open;

  InitialStrGrid(sgorder,'门店配送退货申请单');
  sgorder.RowCount := 2;
  for iRow := 1 to sgorder.RowCount do
    sgorder.Cells[0, iRow] := IntToStr(iRow);
  IF SEditMode <> '' THEN
    ReadBill;
    sgorder.ColWidths[0] := 28;
end;

procedure TFmPosAskBackBill.TeThemeButton2Click(Sender: TObject);
begin
{
  if grid.RowCount = 2 then
  begin
    Grid.ClearRows(1, Grid.ColCount);
    Exit;
  end;
  if Grid.Row = Grid.RowCount - 1 then
  begin
    Grid.RemoveRows(Grid.Row, 1);
    Grid.SetFocus;
    Exit;
  end;
  Grid.RemoveRows(Grid.Row, 1);
  Grid.SetFocus;
}
end;

procedure TFmPosAskBackBill.TeThemeButton1Click(Sender: TObject);
begin
//  Grid.AddRow;
end;

function TFmPosAskBackBill.CheckData: Boolean;
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
  if (Trim(EdtM.Text) = '') or
    (AskMaster.VcEID = '') then
  begin
    EdtM.SetFocus;
    Application.MessageBox('申请人不能为空！', pchar(application.Title), MB_OK + MB_ICONinformation);
    Exit;
  end;
  if (Trim(EdtC.Text) = '') or
    (AskMaster.vcCheckE = '') then
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
    if sgorder.Cells[8, iRow] = '' then
    begin
      sgorder.SetFocus;
      sgorder.Row := iRow;
      sgorder.Col := 4;
      Application.MessageBox('请选择当前的单位！', pchar(application.Title), MB_OK + MB_ICONinformation);
      Exit;
    end;
    if Trim(sgorder.Cells[5, iRow]) = '' then sgorder.Cells[5, iRow] := '0';
    if StrToFloat(sgorder.Cells[5, iRow]) = 0 then
    begin
      sgorder.SetFocus;
      sgorder.Row := iRow;
      sgorder.Col := 5;
      Application.MessageBox('请输入申请数量！', pchar(application.Title), MB_OK + MB_ICONinformation);
      Exit;
    end;
  end;

  Result := True;
end;

function TFmPosAskBackBill.SaveData: Boolean;
var
  IRow: Integer;
  fQty, fEndQty,dRate: Double;
  PsRst,iunit: Integer;
  iEditMode,IStatus: Integer;
  mdata,Ddata:olevariant;//主副表数据
begin
//
  Result := False;
  if SEditMode = '' then
    iEditMode := 0
  else
    iEditMode := 1;
  try
   CdsMasterData.EmptyDataSet;
    CdsMasterData.Append;
    CdsMasterData.FieldByName('VcGetGoodsPlanID').AsString := AskMaster.VcGetGoodsPlanID;
    CdsMasterData.FieldByName('VcBillNo').AsString := AskMaster.BillNo;
    CdsMasterData.FieldByName('VCOfficeID').AsString := AskMaster.VCOfficeID;
    CdsMasterData.FieldByName('iBilltype').asinteger := AskMaster.iBillType;
    CdsMasterData.FieldByName('VcStockID').AsString := AskMaster.VcStockID;
    CdsMasterData.FieldByName('DGetDate').asDateTime := AskMaster.DGetDate;
    CdsMasterData.FieldByName('VcEID').AsString := AskMaster.VcEID;
    CdsMasterData.FieldByName('vcCheckE').AsString := AskMaster.vcCheckE;
    CdsMasterData.FieldByName('Memo').AsString := AskMaster.Memo;
    CdsMasterData.FieldByName('IPlanStatus').Asinteger := AskMaster.IPlanStatus;
    CdsDetailData.EmptyDataSet;
    for IRow := 1 to sgorder.RowCount - 1 do
    begin
      CdsDetailData.Append;
      CdsDetailData.FieldByName('VcGetGoodsPlanID').AsString := AskMaster.VcGetGoodsPlanID;
      CdsDetailData.FieldByName('ord').asInteger := IRow;
      CdsDetailData.FieldByName('VCPtyieID').AsString := Trim(sgorder.cells[2, iRow]); //商品编号 
      CdsDetailData.FieldByName('vcGoodUnitId').AsString := Trim(sgorder.cells[4, iRow]);
      iunit :=  StrToInt(sgorder.Cells[12,iRow]);
      dRate := StrToFloat(sgorder.Cells[11,iRow]);
      if iunit = 1 then
      begin
        fQty := StrToFloat(Trim(sgorder.cells[5, iRow])) * dRate;
        CdsDetailData.FieldByName('NQty').asFloat := fQty;
        fEndQty := StrToFloat(Trim(sgorder.cells[6, iRow]));
        CdsDetailData.FieldByName('NSendQty').asFloat := fEndQty;
        CdsDetailData.FieldByName('NEndQty').asFloat := fQty - fEndQty;      
      end
      else
      begin
        fQty := StrToFloat(Trim(sgorder.cells[5, iRow]));
        CdsDetailData.FieldByName('NQty').asFloat := fQty;
        fEndQty := StrToFloat(Trim(sgorder.cells[6, iRow]));
        CdsDetailData.FieldByName('NSendQty').asFloat := fEndQty;
        CdsDetailData.FieldByName('NEndQty').asFloat := fQty - fEndQty;
      end;
      IStatus := StrToInt(sgorder.Cells[10,iRow]);
      CdsDetailData.FieldByName('IGetStatus').asFloat := IStatus;
      CdsDetailData.FieldByName('iUnit').asFloat := iunit;
      CdsDetailData.FieldByName('NRate').asFloat := dRate;
    end;
    PsRst := CdsDetailData.RecordCount;
    //adisp.InsertGetPlan(CdsMasterData.Data,CdsDetailData.Data, iEditMode, PsRst);
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

procedure TFmPosAskBackBill.CdsDetailDataBeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  OwnerData := 'Select * from GetGoodsPlan where VcGetGoodsPlanID =''' + sBillId + '''';
end;

procedure TFmPosAskBackBill.CdsMasterDataBeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  OwnerData := 'Select * from GetGoodsPlanMaster where VcGetGoodsPlanID = ''' + sBillId + '''';
end;

procedure TFmPosAskBackBill.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFmPosAskBackBill.sgordeDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ACol = 7 then
  begin
     CheckCells(ACol,ARow);
  end;
end;

procedure TFmPosAskBackBill.CheckCells(ACol, ARow: Integer);
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

procedure TFmPosAskBackBill.BtnSaveClick(Sender: TObject);
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

procedure TFmPosAskBackBill.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_EsCaPE then
    Close;
end;

procedure TFmPosAskBackBill.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  irst: integer;
begin
  irst :=  Application.MessageBox('是否保存当前单据？','系统提示：', MB_YESNOCANCEL + MB_ICONQUESTION + MB_DEFBUTTON3);
  if irst = mrCancel then
  begin
     CanClose := False;
  end;
  
  if irst = mrYes then
  begin
     BtnSaveClick(Sender);
     CanClose := False;
  end;
  if irst = MrNo then
  begin
    CanClose := True;
  end;
end;


function TFmPosAskBackBill.ReadBill: Boolean;
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

procedure TFmPosAskBackBill.sgorderDrawCell(Sender: TObject; ACol,
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


procedure TFmPosAskBackBill.sgorderDblClick(Sender: TObject);
var
  i:integer;
begin
/////复制  数量  单位等
  if (pcol = 1) or (pcol =2) then
  begin
   fmgoodCodeSelPei:= TfmgoodCodeSelPei.Create(nil);
   try
   fmgoodCodeSelPei.show_mode := '门店配送退货申请单';
   fmgoodCodeSelPei.ShowModal;
   finally
   fmgoodCodeSelPei.Free;
   end;
  end;

end;

procedure TFmPosAskBackBill.sgorderSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  pcol:=acol;
  prow:=arow;
end;

procedure TFmPosAskBackBill.sgorderKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (pcol =5) or (pcol =6){in [3]}  then
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

procedure TFmPosAskBackBill.bitcheckClick(Sender: TObject);
var
  user:widestring;
  flag:olevariant;
begin
  if trim(sBillId)=''then exit;
  if trim(sgorder.Cells[1,1])='' then exit;
  no:=trim(edtbillno.Text);
  typed:='退货申请单';
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
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

end.


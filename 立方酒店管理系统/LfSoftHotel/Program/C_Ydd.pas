unit C_Ydd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StandDb, DosMove, DB, DBTables, ExtCtrls, StdCtrls, Buttons,
  DBCtrls, DBNavPlus, Grids, DBGrids, Mask, DateUtils, C_Define;

type
  TYddForm = class(TStandDbForm)
    qryWorkD_YDBH: TStringField;
    qryWorkD_HH: TIntegerField;
    qryWorkD_KRBH: TStringField;
    qryWorkD_YDRQ: TDateField;
    qryWorkD_YDSJ: TTimeField;
    qryWorkD_XFBH: TStringField;
    qryWorkD_SL: TFloatField;
    qryWorkD_DJ: TCurrencyField;
    qryWorkD_JE: TCurrencyField;
    qryWorkD_RZ: TStringField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_BZ: TStringField;
    dsYdd: TDataSource;
    dbgYdd: TDBGrid;
    Label1: TLabel;
    Label10: TLabel;
    dbeXm: TDBEdit;
    dbeLxr: TDBEdit;
    Label3: TLabel;
    dbeDwmc: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbeRq: TDBEdit;
    dbeSj: TDBEdit;
    tblYdxx: TTable;
    qryWorkD_XM: TStringField;
    qryWorkD_LXR: TStringField;
    qryWorkD_DWMC: TStringField;
    qryMaxHh: TQuery;
    tblYdd: TTable;
    tblYddD_YDBH: TStringField;
    tblYddD_HH: TIntegerField;
    tblYddD_KRBH: TStringField;
    tblYddD_YDRQ: TDateField;
    tblYddD_YDSJ: TTimeField;
    tblYddD_SL: TFloatField;
    tblYddD_DJ: TCurrencyField;
    tblYddD_JE: TCurrencyField;
    tblYddD_RZ: TStringField;
    tblYddD_CZYXM: TStringField;
    tblYddD_BZ: TStringField;
    tblYddD_XFMC: TStringField;
    Label6: TLabel;
    dbeFkfs: TDBEdit;
    qryWorkD_YFFS: TStringField;
    qryWorkD_XMMC: TStringField;
    tblYddD_XFBH: TStringField;
    tblYddD_XMMC: TStringField;
    Label7: TLabel;
    Bevel2: TBevel;
    Label8: TLabel;
    btnYdcx: TBitBtn;
    dbeYdbh: TDBEdit;
    dbeCzyxm: TDBEdit;
    Label9: TLabel;
    dbeYfje: TDBEdit;
    qryWorkD_YFJE: TCurrencyField;
    dbeJe: TDBEdit;
    btnDr: TBitBtn;
    procedure qryWorkAfterPost(DataSet: TDataSet);
    procedure qryWorkAfterCancel(DataSet: TDataSet);
    procedure qryWorkNewRecord(DataSet: TDataSet);
    procedure tblYddNewRecord(DataSet: TDataSet);
    procedure tblYddAfterPost(DataSet: TDataSet);
    procedure tblYddBeforePost(DataSet: TDataSet);
    procedure qryWorkBeforeEdit(DataSet: TDataSet);
    procedure tblYddBeforeEdit(DataSet: TDataSet);
    procedure qryWorkBeforeClose(DataSet: TDataSet);
    procedure qryWorkBeforeInsert(DataSet: TDataSet);
    procedure qryWorkBeforeDelete(DataSet: TDataSet);
    procedure qryWorkAfterDelete(DataSet: TDataSet);
    procedure qryWorkBeforeCancel(DataSet: TDataSet);
    procedure qryWorkBeforePost(DataSet: TDataSet);
    procedure qryWorkBeforeOpen(DataSet: TDataSet);
    procedure qryWorkD_YDRQValidate(Sender: TField);
    procedure dbgYddColEnter(Sender: TObject);
    procedure btnYdcxClick(Sender: TObject);
    procedure dsWorkStateChange(Sender: TObject);
    procedure btnDrClick(Sender: TObject);
  private
    { Private declarations }
    FKrbh: string;
    FItemNo: Integer;
    IsIncItemNo: Boolean;
    procedure DeleteItems;
    procedure UpdateYdd;
    procedure UpdateTotals;
  public
    { Public declarations }
  end;

var
  YddForm: TYddForm;

procedure YddNew;
procedure YddEnter(const AKrbh: string);
procedure YddEdit(const AYdbh: string);

implementation

uses C_HotelData, C_YdxxSel, C_XfxmSel, C_Ydb;

{$R *.dfm}

procedure YddNew;
begin
  if Application.FindComponent('YddForm') is TYddForm then
  begin
    ShowInfo('对不起，预定单正在运行中！');
    Exit;
  end;
  YddForm := TYddForm.Create(Application);
  try
    with YddForm do
    begin
      FKrbh := '';
      IsIncItemNo := True;
      qryWork.Open;
      qryWork.Insert;
      ShowModal;
    end;
  finally
    YddForm.qryWork.Close;
    YddForm.Free;
  end;
end;

procedure YddEnter(const AKrbh: string);
begin
  if Application.FindComponent('YddForm') is TYddForm then
  begin
    ShowInfo('对不起，预定单正在运行中！');
    Exit;
  end;
  YddForm := TYddForm.Create(Application);
  try
    with YddForm do
    begin
      IsIncItemNo := True;
      FKrbh := AKrbh;
      qryWork.Open;
      qryWork.Insert;
      ShowModal;
    end;
  finally
    YddForm.qryWork.Close;
    YddForm.Free;
  end;
end;

procedure YddEdit(const AYdbh: string);
begin
  if Application.FindComponent('YddForm') is TYddForm then
  begin
    ShowInfo('对不起，预定单正在运行中！');
    Exit;
  end;
  YddForm := TYddForm.Create(Application);
  try
    with YddForm do
    begin
      IsIncItemNo := True;
      qryWork.Open;
      qryWork.Locate('D_YDBH',AYdbh,[]);
      ShowModal;
    end;
  finally
    YddForm.qryWork.Close;
    YddForm.Free;
  end;
end;

procedure TYddForm.DeleteItems;
begin
  tblYdd.DisableControls;
  try
    tblYdd.First;
    while not tblYdd.Eof do tblYdd.Delete;
  finally
    tblYdd.EnableControls;
  end;
end;

procedure TYddForm.UpdateYdd;
begin
  try
    IsIncItemNo := False;
    tblYdd.DisableControls;
    tblYdd.First;
    while not tblYdd.Eof do
    begin
      tblYdd.Edit;
      tblYddD_YDRQ.Value := qryWorkD_YDRQ.Value;
      tblYddD_YDSJ.Value := qryWorkD_YDSJ.Value;
      tblYdd.Post;
      tblYdd.Next;
    end;
  finally
    tblYdd.EnableControls;
    IsIncItemNo := True;
  end;
end;

procedure TYddForm.UpdateTotals;
var
  TempTotals: Currency;
  PrevRecord: TBookMark;
begin
  PrevRecord := tblYdd.GetBookmark;
  try
    tblYdd.DisableControls;
    TempTotals := 0;
    tblYdd.First;
    while not tblYdd.Eof do
    begin
      TempTotals := TempTotals + tblYddD_JE.Value;
      tblYdd.Next;
    end;
    qryWorkD_JE.Value := TempTotals;
  finally
    tblYdd.EnableControls;
    if PrevRecord<>nil then
    begin
      tblYdd.GotoBookmark(PrevRecord);
      tblYdd.FreeBookmark(PrevRecord);
    end;
  end;
end;

procedure TYddForm.qryWorkAfterPost(DataSet: TDataSet);
begin
  inherited;
  tblYdd.ApplyUpdates;
  tblYdd.CancelUpdates;
end;

procedure TYddForm.qryWorkAfterCancel(DataSet: TDataSet);
begin
  inherited;
  tblYdd.CancelUpdates;
end;

procedure TYddForm.qryWorkNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryWorkD_YDBH.Value := HotelData.GetBh('D_YDBH',PREV_YDBH);
  qryWorkD_HH.Value   := 0;
  qryWorkD_KRBH.Value := FKrbh;
  qryWorkD_CZYXM.Value:= CZY.CzyXm;
  qryWorkD_YDRQ.Value := Tomorrow;
  qryWorkD_YDSJ.Value := Time;
  qryWorkD_RZ.Value   := RZ_NO;
  FItemNo := 1;
end;

procedure TYddForm.tblYddNewRecord(DataSet: TDataSet);
var
  AXfxm: TXFXM;
begin
  inherited;
  AXfxm := XfxmSel;
  if AXfxm.AXfbh = '' then
    Abort;
  if not HotelData.IsValidYd(AXfxm,qryWorkD_YDRQ.Value) then
    if not Confirm('想预定的项目当天已经被预定，你是否坚持预定？') then
      Abort;
  tblYddD_XFBH.Value := AXfxm.AXfbh;
  tblYddD_XMMC.Value := AXfxm.AXmmc;
  tblYddD_YDBH.Value := qryWorkD_YDBH.Value;
  tblYddD_KRBH.Value := qryWorkD_KRBH.Value;
  tblYddD_RZ.Value   := qryWorkD_RZ.Value;
  tblYddD_CZYXM.Value:= qryWorkD_CZYXM.Value;
end;

procedure TYddForm.tblYddAfterPost(DataSet: TDataSet);
begin
  inherited;
  if IsIncItemNo then
  begin
    Inc(FItemNo);
    UpdateTotals;
  end;
end;

procedure TYddForm.tblYddBeforePost(DataSet: TDataSet);
begin
  inherited;
  if IsIncItemNo then
    tblYddD_HH.Value := FItemNo;
end;

procedure TYddForm.qryWorkBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  qryMaxHh.Close;
  qryMaxHh.Open;
  with qryMaxHh.Fields[0] do
    if IsNull then FItemNo := 1
    else FItemNo := AsInteger + 1;
end;

procedure TYddForm.tblYddBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  qryWork.Edit;
end;

procedure TYddForm.qryWorkBeforeClose(DataSet: TDataSet);
begin
  inherited;
  tblYdd.Close;
end;

procedure TYddForm.qryWorkBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if FKrbh = '' then
  begin
    FKrbh := YdxxSel;
    if FKrbh='' then
      Abort;
  end;
end;

procedure TYddForm.qryWorkBeforeDelete(DataSet: TDataSet);
begin
  if not Confirm('你确认删除该预定单和预定项目吗？') then
    Abort
  else
    DeleteItems;
end;

procedure TYddForm.qryWorkAfterDelete(DataSet: TDataSet);
begin
  inherited;
  tblYdd.ApplyUpdates;
end;

procedure TYddForm.qryWorkBeforeCancel(DataSet: TDataSet);
begin
  inherited;
  if (qryWork.State in dsEditModes) and not(tblYdd.Bof and tblYdd.Eof) then
    if not Confirm('正在编辑的预定单尚未保存，你想取消所做的修改吗？否则请先保存！') then
      Abort;
end;

procedure TYddForm.qryWorkBeforePost(DataSet: TDataSet);
begin
  inherited;
  if tblYdd.IsEmpty then
    raise Exception.Create('你没有录入预定项目不能保存！');
  UpdateYdd;
end;

procedure TYddForm.qryWorkBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  tblYdd.Open;
end;

procedure TYddForm.qryWorkD_YDRQValidate(Sender: TField);
begin
  inherited;
  if Sender.AsDateTime < Now then
    raise Exception.Create('预定日期要大于当前日期！');
end;

procedure TYddForm.dbgYddColEnter(Sender: TObject);
begin
  inherited;
  with dbgYdd do
    if (tblYdd.State in dsEditModes)and(SelectedField = tblYddD_JE) then
      tblYddD_JE.Value := tblYddD_SL.Value*tblYddD_DJ.Value;
end;

procedure TYddForm.btnYdcxClick(Sender: TObject);
begin
  inherited;
  Ydb(YDB_KF,qryWorkD_YDRQ.Value);
end;

procedure TYddForm.dsWorkStateChange(Sender: TObject);
begin
  inherited;
  btnDr.Enabled := qryWork.State = dsBrowse;
  btnYdcx.Enabled := btnDr.Enabled;
end;

procedure TYddForm.btnDrClick(Sender: TObject);
begin
  inherited;
    FKrbh := YdxxSel;
    if FKrbh<>'' then
      qryWork.Insert;
end;

end.

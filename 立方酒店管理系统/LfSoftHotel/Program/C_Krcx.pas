unit C_Krcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StandDb, DosMove, DB, DBTables, ExtCtrls, StdCtrls, Buttons,
  DBCtrls, DBNavPlus, Grids, DBGrids;

type
  TKrcxForm = class(TStandDbForm)
    DBGrid1: TDBGrid;
    tblKrxx: TTable;
    btnXq: TBitBtn;
    qryWorkD_KFBH: TStringField;
    qryWorkD_ZDBH: TStringField;
    qryWorkD_KRBH: TStringField;
    qryWorkD_YJBH: TStringField;
    qryWorkD_SJFJ: TFloatField;
    qryWorkD_KFZT: TStringField;
    qryWorkD_KFBZ: TStringField;
    qryWorkD_KRSL: TIntegerField;
    qryWorkD_DHKT: TStringField;
    qryWorkD_BZFJ: TFloatField;
    qryWorkD_CWS: TIntegerField;
    qryWorkD_BJS: TIntegerField;
    qryWorkD_QJS: TIntegerField;
    qryWorkD_JJFJ: TFloatField;
    qryWorkD_FXBH: TStringField;
    qryWorkD_LCBH: TStringField;
    qryWorkD_KRXM: TStringField;
    qryWorkD_DDRQ: TDateField;
    qryWorkD_DDSJ: TTimeField;
    qryWorkD_XB: TStringField;
    qryWorkD_JG: TStringField;
    qryWorkD_MZMC: TStringField;
    qryWorkD_GZDW: TStringField;
    qryWorkD_JTDZ: TStringField;
    qryWorkD_ZJMC: TStringField;
    qryWorkD_ZJHM: TStringField;
    procedure btnLocaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure qryWorkD_JGGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryWorkD_MZMCGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryWorkD_ZJMCGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KrcxForm: TKrcxForm;

procedure Krcx;

implementation

uses C_Define, C_Xxxg, C_Sysprint, C_HotelData, C_Krxx;

{$R *.dfm}

procedure Krcx;
begin
  KrcxForm := TKrcxForm.Create(Application);
  try
    with KrcxForm do
    begin
      qryWork.Open;
      ShowModal;
    end;
  finally
    KrcxForm.qryWork.Close;
    KrcxForm.Free;
  end;
end;

procedure TKrcxForm.btnLocaClick(Sender: TObject);
begin
  inherited;
  if edtValue.Text = '' then
  with qryWork do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from KFZT where (D_KFZT="F") order by D_LCBH,D_KFBH');
      Open;
      EnableControls;
    end;
  if cmbOption.ItemIndex=0 then
  begin
    with qryWork do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from KFZT where (D_KRXM like "%'+edtValue.Text+'%")and(D_KFZT="F") order by D_LCBH,D_KFBH');
      Open;
      EnableControls;
    end;
  end
  else if cmbOption.ItemIndex = 1 then
  begin
    with qryWork do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from KFZT where (D_KFBH like "%'+edtValue.Text+'%")and(D_KFZT="F") order by D_LCBH,D_KFBH');
      Open;
      EnableControls;
    end;
  end
  else if cmbOption.ItemIndex = 2 then
  begin
    with qryWork do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select a.* from KFZT a,KRXX b where (a.D_KRBH=b.D_KRBH)and((b.D_JTDZ like "%'+edtValue.Text+'%")or(b.D_DWMC like "%'+edtValue.Text+'%"))and(a.D_KFZT="F") order by D_LCBH,D_KFBH');
      Open;
      EnableControls;
    end;
  end;
  {else if cmbOption.ItemIndex = 3 then
  begin
    with qryWork do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from KFZT where (D_JTDZ like "%'+edtValue.Text+'%")and(D_KFZT="F") order by D_LCBH,D_KFBH');
      Open;
      EnableControls;
    end;
  end;}

end;

procedure TKrcxForm.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  KrxxEnter(qryWorkD_KRBH.Value);
end;

procedure TKrcxForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '客人信息一览表（'+DateToStr(Date)+'）';
  APrintStru.ADataSet := qryWork;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TKrcxForm.qryWorkD_JGGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  if DisplayText then Text := HotelData.FindMc('DQDM','D_DQBH','D_DQMC',qryWorkD_JG.Value);
  //HotelData.tblDQDM.Lookup('D_DQBH',qryWorkD_JG.Value,'D_DQMC');
end;

procedure TKrcxForm.qryWorkD_MZMCGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  if DisplayText then Text := HotelData.FindMc('MZDM','D_MZBH','D_MZMC',qryWorkD_MZMC.Value);
end;

procedure TKrcxForm.qryWorkD_ZJMCGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  if DisplayText then Text := HotelData.FindMc('ZJDM','D_ZJBH','D_ZJMC',qryWorkD_ZJMC.Value);
end;

end.

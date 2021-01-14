unit C_Krly;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StandDb, DosMove, DB, DBTables, ExtCtrls, StdCtrls, Buttons,
  DBCtrls, DBNavPlus, Grids, DBGrids, Mask, C_Define;

type
  TKrlyForm = class(TStandDbForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    qryWorkD_LYRQ: TDateTimeField;
    qryWorkD_LYSJ: TDateTimeField;
    qryWorkD_LYLX: TStringField;
    qryWorkD_KFBH: TStringField;
    qryWorkD_KRXM: TStringField;
    qryWorkD_LYDX: TStringField;
    qryWorkD_NR: TBlobField;
    procedure qryWorkNewRecord(DataSet: TDataSet);
    procedure DBEdit4Exit(Sender: TObject);
    procedure btnLocaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KrlyForm: TKrlyForm;

procedure Krly;

implementation

uses C_HotelData;

{$R *.dfm}

procedure Krly;
begin
  KrlyForm := TKrlyForm.Create(Application);
  try
    with KrlyForm do
    begin
      qryWork.Open;
      ShowModal;
    end;
  finally
    KrlyForm.qryWork.Close;
    KrlyForm.Free;
  end;
end;

procedure TKrlyForm.qryWorkNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryWorkD_LYRQ.Value := Date;
  qryWorkD_LYSJ.Value := Time;
end;

procedure TKrlyForm.DBEdit4Exit(Sender: TObject);
var
  AKfbh,AKfzt: string;
  AKfxx: TKFXX;
begin
  inherited;
  AKfbh := DBEdit4.Text;
  AKfzt := HotelData.CheckKfzt(AKfbh);
  if (AKfzt=KFZT_BF)or(AKfzt=KFZT_TD) then
  begin
    AKfxx := HotelData.GetKfxx(AKfbh);
    if qryWork.State in [dsInsert,dsEdit] then
      qryWorkD_KRXM.Value := AKfxx.AKrxm;
  end
  else
  begin
    ShowWarning('该客房是空房！');
    DBEdit4.SetFocus;
  end;
end;

procedure TKrlyForm.btnLocaClick(Sender: TObject);
begin
  inherited;
  if cmbExpress.ItemIndex=0 then
    if cmbOption.ItemIndex=0 then
      qryWork.Locate('D_KFBH',edtValue.Text,[])
    else
    if cmbOption.ItemIndex=1 then
      qryWork.Locate('D_KRXM',edtValue.Text,[]);
end;

end.

unit C_Ydql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StandDb, DosMove, DB, DBTables, ExtCtrls, StdCtrls, Buttons,
  DBCtrls, DBNavPlus, Grids, DBGrids;

type
  TYdqlForm = class(TStandDbForm)
    dbgDetail: TDBGrid;
    tblYdxx: TTable;
    qryWorkD_YDBH: TStringField;
    qryWorkD_HH: TIntegerField;
    qryWorkD_KRBH: TStringField;
    qryWorkD_YDRQ: TDateField;
    qryWorkD_YDSJ: TTimeField;
    qryWorkD_XFBH: TStringField;
    qryWorkD_XMMC: TStringField;
    qryWorkD_SL: TFloatField;
    qryWorkD_DJ: TCurrencyField;
    qryWorkD_JE: TCurrencyField;
    qryWorkD_RZ: TStringField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_BZ: TStringField;
    qryWorkD_XM: TStringField;
    qryWorkD_DWMC: TStringField;
    qryWorkD_SX: TStringField;
    qryWorkD_XFMC: TStringField;
    btnClear: TBitBtn;
    procedure qryWorkCalcFields(DataSet: TDataSet);
    procedure btnLocaClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YdqlForm: TYdqlForm;

procedure Ydql;

implementation

uses C_Define, C_HotelData;

{$R *.dfm}

procedure Ydql;
begin
  YdqlForm := TYdqlForm.Create(Application);
  try
    with YdqlForm do
    begin
      qryWork.Params[0].Value := Date;
      qryWork.Open;
      ShowModal;
    end;
  finally
    YdqlForm.qryWork.Close;
    YdqlForm.Free;
  end;
end;

procedure TYdqlForm.qryWorkCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryWorkD_RZ.Value = RZ_YES then qryWorkD_SX.Value := '已入帐'
  else qryWorkD_SX.Value := '已过期';
end;

procedure TYdqlForm.btnLocaClick(Sender: TObject);
begin
  inherited;
  if cmbExpress.ItemIndex = 0 then
    if cmbOption.ItemIndex = 0 then
      qryWork.Locate('D_XMMC',edtValue.Text,[]);
end;

procedure TYdqlForm.btnClearClick(Sender: TObject);
begin
  qryWork.DisableControls;
  try
    with qryWork do
    begin
      First;
      while not Eof do Delete;
    end;
  finally
    qryWork.EnableControls;
  end;
end;

end.

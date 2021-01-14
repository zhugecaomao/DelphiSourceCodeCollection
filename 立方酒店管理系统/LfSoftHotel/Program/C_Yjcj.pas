unit C_Yjcj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls;

type
  TYjcjForm = class(TStdBrowForm)
    qryWorkD_ZDBH: TStringField;
    qryWorkD_KRBH: TStringField;
    qryWorkD_KFBH: TStringField;
    qryWorkD_XFJE: TCurrencyField;
    qryWorkD_YFJE: TCurrencyField;
    qryWorkD_KRXM: TStringField;
    qryWorkD_YE: TCurrencyField;
    qryWorkD_CJBZ: TStringField;
    procedure qryWorkCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YjcjForm: TYjcjForm;

procedure Yjcj;

implementation

uses C_HotelData;

{$R *.dfm}

procedure Yjcj;
begin
  YjcjForm := TYjcjForm.Create(Application);
  try
    with YjcjForm do
    begin
      qryWork.Open;
      ShowModal;
    end;
  finally
    YjcjForm.qryWork.Close;
    YjcjForm.Free;
  end;

end;

procedure TYjcjForm.qryWorkCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryWorkD_YE.Value := qryWorkD_YFJE.Value - qryWorkD_XFJE.Value;
  if qryWorkD_YE.Value < 100 then
    qryWorkD_CJBZ.Value := '´ß½»'
  else
    qryWorkD_CJBZ.Value := '';
end;

end.

unit C_Hcjscx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, DBTables;

type
  THcjscxForm = class(TForm)
    Label1: TLabel;
    qryYdhc: TQuery;
    DBGrid1: TDBGrid;
    dsYdhc: TDataSource;
    qryYdhcD_YDBH: TStringField;
    qryYdhcD_KRBH: TStringField;
    qryYdhcD_KRXM: TStringField;
    qryYdhcD_YDRQ: TDateTimeField;
    qryYdhcD_SYRQ: TDateTimeField;
    qryYdhcD_SYSJ: TDateTimeField;
    qryYdhcD_SJDM: TStringField;
    qryYdhcD_HCBH: TStringField;
    qryYdhcD_HCMC: TStringField;
    qryYdhcD_HCZJ: TFloatField;
    qryYdhcD_HCRS: TIntegerField;
    qryYdhcD_HCRS1: TIntegerField;
    qryYdhcD_HFSL: TFloatField;
    qryYdhcD_HFJE: TFloatField;
    qryYdhcD_HFBZ: TStringField;
    qryYdhcD_XHSL: TFloatField;
    qryYdhcD_XHJE: TFloatField;
    qryYdhcD_XHBZ: TStringField;
    qryYdhcD_SGSL: TFloatField;
    qryYdhcD_SGJE: TFloatField;
    qryYdhcD_SGBZ: TStringField;
    qryYdhcD_QTJE: TFloatField;
    qryYdhcD_QTBZ: TStringField;
    qryYdhcD_HTSL: TFloatField;
    qryYdhcD_HTBZ: TStringField;
    qryYdhcD_BZ: TBlobField;
    qryYdhcD_RZBZ: TStringField;
    qryYdhcD_JSBZ: TStringField;
    qryYdhcD_CZYXM: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HcjscxForm: THcjscxForm;

procedure Hcjscx;

implementation

{$R *.dfm}
procedure Hcjscx;
begin
  HcjscxForm := THcjscxForm.Create(Application);
  try
    with HcjscxForm do
    begin
      qryYdhc.Open;
      ShowModal;
    end;
  finally
    HcjscxForm.Free;
  end;

end;

end.

unit C_Fykjzcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, Grids, DBGrids;

type
  TFykjzcxForm = class(TForm)
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    qryKrzd: TQuery;
    dsKrzd: TDataSource;
    DBGrid1: TDBGrid;
    qryKrzdD_ZDBH: TStringField;
    qryKrzdD_HH: TIntegerField;
    qryKrzdD_ZDLB: TStringField;
    qryKrzdD_KRBH: TStringField;
    qryKrzdD_YJBH: TStringField;
    qryKrzdD_KFBH: TStringField;
    qryKrzdD_SJFJ: TFloatField;
    qryKrzdD_XMBH: TStringField;
    qryKrzdD_XFDJ: TFloatField;
    qryKrzdD_XFSL: TFloatField;
    qryKrzdD_XFJE: TFloatField;
    qryKrzdD_XFRQ: TDateTimeField;
    qryKrzdD_XFSJ: TDateTimeField;
    qryKrzdD_YHJE: TFloatField;
    qryKrzdD_JZRQ: TDateTimeField;
    qryKrzdD_JZSJ: TDateTimeField;
    qryKrzdD_JZBZ: TStringField;
    qryKrzdD_JSBZ: TStringField;
    qryKrzdD_DLR1: TStringField;
    qryKrzdD_DLR2: TStringField;
    qryKrzdD_DLR3: TStringField;
    qryKrzdD_DLR4: TStringField;
    qryKrzdD_CZYXM: TStringField;
    qryKrzdD_JZYXM: TStringField;
    qryKrzdD_TYR: TStringField;
    qryKrzdD_BZ: TStringField;
    qryKrzdD_YSRQ: TStringField;
    qryKrzdD_JZBH: TStringField;
    qryKrzdD_BMBH: TStringField;
    qryKrzdD_XMMC: TStringField;
    procedure OnZdcx(Sender: TObject);
  private
    { Private declarations }
    procedure OnQuery;
  public
    { Public declarations }
  end;

var
  FykjzcxForm: TFykjzcxForm;

procedure Fykjzcx;

implementation

uses C_HotelData, C_Define;

{$R *.dfm}
procedure Fykjzcx;
begin
  FykjzcxForm := TFykjzcxForm.Create(Application);
  try
    with FykjzcxForm do
    begin
      OnQuery;
      ShowModal;
    end;
  finally
    FykjzcxForm.Free;
  end;

end;

procedure TFykjzcxForm.OnQuery;
var
  s : string;
begin
  if RadioButton1.Checked then
    s := 'select * from KRZD where (D_BZ like "%非寓客%")and(D_HH<>0) order by D_XFRQ'
  else
   s := 'select * from KRZDDA where (D_BZ like "%非寓客%")and(D_HH<>0) order by D_XFRQ';
  with qryKrzd do
  begin
    Close;
    SQL.Clear;
    SQL.Add(s);
    Prepare;
    Open;
  end;
end;

procedure TFykjzcxForm.OnZdcx(Sender: TObject);
begin
  OnQuery;
end;

end.

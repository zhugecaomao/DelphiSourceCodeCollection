unit C_Zdlrcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, Grids, DBGrids;

type
  TZdlrcxForm = class(TForm)
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
    qryKrzdD_KFBHCX: TStringField;
    procedure qryKrzdCalcFields(DataSet: TDataSet);
    procedure OnZdcx(Sender: TObject);
  private
    { Private declarations }
    procedure OnQuery;
  public
    { Public declarations }
  end;

var
  ZdlrcxForm: TZdlrcxForm;

procedure Zdlrcx;

implementation

uses C_HotelData, C_Define;

{$R *.dfm}
procedure Zdlrcx;
begin
  ZdlrcxForm := TZdlrcxForm.Create(Application);
  try
    with ZdlrcxForm do
    begin
      OnQuery;
      ShowModal;
    end;
  finally
    ZdlrcxForm.Free;
  end;

end;

procedure TZdlrcxForm.OnQuery;
var
  s : string;
begin
  if RadioButton1.Checked then
    s := 'select * from KRZD where (D_BZ like "%杂单录入%") order by D_XFRQ'
  else
   s := 'select * from KRZDDA where (D_BZ like "%杂单录入%") order by D_XFRQ';
  with qryKrzd do
  begin
    Close;
    SQL.Clear;
    SQL.Add(s);
    Prepare;
    Open;
  end;
end;

procedure TZdlrcxForm.qryKrzdCalcFields(DataSet: TDataSet);
begin
  if RadioButton1.Checked then
  begin
    if qryKrzdD_ZDLB.Value = ZDLB_YK then
      qryKrzdD_KFBHCX.Value := HotelData.FindValue('select D_KFBH from KRZD where (D_ZDBH="'+qryKrzdD_ZDBH.AsString+'")and(D_HH=0)')
    else
      qryKrzdD_KFBHCX.Value := HotelData.FindValue('select D_KRXM from KRXX where (D_KRBH="'+qryKrzdD_KRBH.AsString+'")');
  end
  else
  begin
    if qryKrzdD_ZDLB.Value = ZDLB_YK then
      qryKrzdD_KFBHCX.Value := HotelData.FindValue('select D_KFBH from KRZDDA where (D_ZDBH="'+qryKrzdD_ZDBH.AsString+'")and(D_HH=0)')
    else
      qryKrzdD_KFBHCX.Value := HotelData.FindValue('select D_KRXM from KRXXDA where (D_KRBH="'+qryKrzdD_KRBH.AsString+'")');
  end;
end;

procedure TZdlrcxForm.OnZdcx(Sender: TObject);
begin
  OnQuery;
end;

end.

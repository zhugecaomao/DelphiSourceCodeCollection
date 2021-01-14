unit C_Fjmx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define;

type
  TFjmxForm = class(TStdBrowForm)
    lblHj: TLabel;
    qryWorkD_ZDBH: TStringField;
    qryWorkD_HH: TIntegerField;
    qryWorkD_ZDLB: TStringField;
    qryWorkD_KRBH: TStringField;
    qryWorkD_YJBH: TStringField;
    qryWorkD_KFBH: TStringField;
    qryWorkD_SJFJ: TFloatField;
    qryWorkD_XMBH: TStringField;
    qryWorkD_XFDJ: TFloatField;
    qryWorkD_XFSL: TFloatField;
    qryWorkD_XFJE: TFloatField;
    qryWorkD_XFRQ: TDateTimeField;
    qryWorkD_XFSJ: TDateTimeField;
    qryWorkD_YHJE: TFloatField;
    qryWorkD_JZRQ: TDateTimeField;
    qryWorkD_JZSJ: TDateTimeField;
    qryWorkD_JZBZ: TStringField;
    qryWorkD_JSBZ: TStringField;
    qryWorkD_DLR1: TStringField;
    qryWorkD_DLR2: TStringField;
    qryWorkD_DLR3: TStringField;
    qryWorkD_DLR4: TStringField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_JZYXM: TStringField;
    qryWorkD_TYR: TStringField;
    qryWorkD_BZ: TStringField;
    qryWorkD_YSRQ: TStringField;
    qryWorkD_JZBH: TStringField;
    qryWorkD_BMBH: TStringField;
  private
    { Private declarations }
    FZdbh: string;
    procedure ShowHj;
  public
    { Public declarations }
  end;

var
  FjmxForm: TFjmxForm;

procedure Fjmx(const AZdbh: string);

implementation

{$R *.dfm}

procedure Fjmx(const AZdbh: string);
var
  s : string;
begin
  FjmxForm := TFjmxForm.Create(Application);
  try
    with FjmxForm do
    begin
      FZdbh := AZdbh;
      qryWork.Close;
      s := 'select * from KRZDCX where (D_ZDBH="'+FZdbh+'")and(D_HH<>0)and(D_XMBH="'+XMBH_FJ+'") order by D_XFRQ,D_XFSJ,D_KFBH';
      qryWork.SQL.Clear;
      qryWork.SQL.Add(s);
      qryWork.Open;
      ShowHj;
      ShowModal;
    end;
  finally
    FjmxForm.Free;
  end;
end;

procedure TFjmxForm.ShowHj;
var
  AXfje,AYhje,AYjje: Currency;
begin
  AXfje := 0;AYhje := 0; AYjje := 0;
  with qryWork do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      if qryWorkD_XFJE.AsCurrency > 0 then
        AXfje := AXfje + qryWorkD_XFJE.AsCurrency
      else
        AYjje := AYjje + qryWorkD_XFJE.AsCurrency;
      AYhje := AYhje + qryWorkD_YHJE.AsCurrency;
      Next;
    end;
    First;
    EnableControls;
  end;
  lblHj.Caption := '消费合计：'+CurrToStr(AXfje)+'元  优惠合计：'+CurrToStr(AYhje)+'元  已结金额：'+CurrToStr(0-AYjje)+'元';
end;

end.

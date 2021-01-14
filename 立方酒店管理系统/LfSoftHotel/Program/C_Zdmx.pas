unit C_Zdmx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define;

type
  TZdmxForm = class(TStdBrowForm)
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
    qryWorkD_XMMC: TStringField;
    lblHj: TLabel;
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    FZdbh: string;
    procedure ShowHj;
  public
    { Public declarations }
  end;

var
  ZdmxForm: TZdmxForm;

procedure Zdmx(const AZdbh: string);

implementation

uses C_HotelData;

{$R *.dfm}

procedure Zdmx(const AZdbh: string);
var
  s : string;
begin
  ZdmxForm := TZdmxForm.Create(Application);
  try
    with ZdmxForm do
    begin
      FZdbh := AZdbh;
      qryWork.Close;
      s := 'select * from KRZDCX where (D_ZDBH="'
           +FZdbh
           +'")and(D_HH<>0)and(D_XMBH<>"'
           +XMBH_FJ
           +'") order by D_XFRQ,D_XFSJ';
      //s := 'select * from KRZDCX where (D_ZDBH="'+FZdbh+'")and(D_HH<>0) order by D_XFRQ,D_XFSJ';
      qryWork.SQL.Clear;
      qryWork.SQL.Add(s);
      qryWork.Open;
      ShowHj;
      ShowModal;
    end;
  finally
    ZdmxForm.Free;
  end;
end;

procedure TZdmxForm.ShowHj;
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

procedure TZdmxForm.DBGrid1TitleClick(Column: TColumn);
var
  s : string;
begin
  inherited;
  if Column.FieldName = 'D_XFRQ' then
  begin
    with qryWork do
    begin
      //s := 'select * from KRZDCX where (D_ZDBH="'+FZdbh+'")and(D_HH<>0)and(D_XMBH<>"'+XMBH_FJ+'") order by D_XFRQ,D_XFSJ';
      s := 'select * from KRZDCX where (D_ZDBH="'+FZdbh+'")and(D_HH<>0) order by D_XFRQ,D_XFSJ';
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add(s);
      Open;
      EnableControls;
    end;
  end;
  if Column.FieldName = 'D_XMMC' then
  begin
    with qryWork do
    begin
      //s := 'select * from KRZD where (D_ZDBH="'+FZdbh+'")and(D_HH<>0)and(D_XMBH<>"'+XMBH_FJ+'") order by D_XMBH,D_XFRQ,D_XFSJ';
      s := 'select * from KRZDCX where (D_ZDBH="'+FZdbh+'")and(D_HH<>0) order by D_XMBH,D_XFRQ,D_XFSJ';
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add(s);
      Open;
      EnableControls;
    end;
  end;

end;

end.

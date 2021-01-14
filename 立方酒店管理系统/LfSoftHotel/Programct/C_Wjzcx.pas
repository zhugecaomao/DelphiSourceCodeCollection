unit C_Wjzcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, DBTables;

type
  TWjzCxForm = class(TForm)
    Label1: TLabel;
    qryKrzd: TQuery;
    DBGrid1: TDBGrid;
    dsKrzd: TDataSource;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WjzCxForm: TWjzCxForm;

procedure Wjzcx;

implementation

{$R *.dfm}
procedure Wjzcx;
begin
  WjzcxForm := TWjzcxForm.Create(Application);
  try
    with WjzcxForm do
    begin
      qryKrzd.Close;
      qryKrzd.SQL.Clear;
      qryKrzd.SQL.Add('select * from KRZD where (D_HH<>0)and(D_BZ="∑«‘¢øÕŒ¥Ω·’ ")');
      qryKrzd.Prepare;
      qryKrzd.Open;
      ShowModal;
    end;
  finally
    WjzcxForm.Free;
  end;

end;

end.

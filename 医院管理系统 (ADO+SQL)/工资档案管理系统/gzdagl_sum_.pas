unit gzdagl_sum_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, DbChart, Grids,
  DBGrids, ComCtrls, MXDB, MXGRID, DB, DBTables, MXTABLES, Mxstore,
  StdCtrls, Buttons;

type
  TForm_sum = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    DBChart2: TDBChart;
    Series2: TPieSeries;
    DBGrid1: TDBGrid;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    DBChart3: TDBChart;
    Series3: THorizBarSeries;
    BTbutie_view: TBitBtn;
    BTfenglei_view: TBitBtn;
    procedure BTbutie_viewClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BTfenglei_viewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_sum: TForm_sum;

implementation

uses gzdagl_DM_;

{$R *.dfm}

procedure TForm_sum.BTbutie_viewClick(Sender: TObject);
begin
//统计补贴表数据
DMgzdagl.ADOQsum_butie.Open;
series2.Add(trunc(DMgzdagl.ADOQsum_butie.FieldValues['综合补贴总和']),'综合补贴总和',clskyblue);
series2.Add(trunc(DMgzdagl.ADOQsum_butie.FieldValues['误餐补贴总和']),'误餐补贴总和',clred);
series2.Add(trunc(DMgzdagl.ADOQsum_butie.FieldValues['住房补贴总和']),'住房补贴总和',clyellow);
series2.Add(trunc(DMgzdagl.ADOQsum_butie.FieldValues['医疗补贴总和']),'医疗补贴总和',clgreen);
series2.Add(trunc(DMgzdagl.ADOQsum_butie.FieldValues['浮动工资总和']),'浮动工资总和',clblue);
series2.Add(trunc(DMgzdagl.ADOQsum_butie.FieldValues['特殊津贴总和']),'特殊津贴总和',clbtnface);
series2.Add(trunc(DMgzdagl.ADOQsum_butie.FieldValues['其它总和']),'其它总和',cllime);
BTbutie_view.Enabled:=false;
end;

procedure TForm_sum.PageControl1Change(Sender: TObject);
begin
if pagecontrol1.ActivePageIndex=0 then
   series2.Clear;
   series3.Clear;
   BTbutie_view.Enabled:=true;
   BTfenglei_view.Enabled:=true;
if pagecontrol1.ActivePageIndex=1 then
   series3.Clear;
   BTbutie_view.Enabled:=true;
if pagecontrol1.ActivePageIndex=2 then
   series2.Clear;
   BTfenglei_view.Enabled:=true;
end;

procedure TForm_sum.BTfenglei_viewClick(Sender: TObject);
begin
form_sum.series3.Add(trunc(DMgzdagl.ADOQsum_xingshui.FieldValues['基本工资总和']),'基本工资总和');
form_sum.series3.Add(trunc(DMgzdagl.ADOQsum_xingshui.FieldValues['职位工资总和']),'职位工资总和');
form_sum.series3.Add(trunc(DMgzdagl.ADOQsum_xingshui.FieldValues['级别工资总和']),'级别工资总和');
form_sum.series3.Add(trunc(DMgzdagl.ADOQsum_xingshui.FieldValues['工龄工资总和']),'工龄工资总和');
form_sum.series3.Add(trunc(DMgzdagl.ADOQsum_xingshui.FieldValues['岗位工资总和']),'岗位工资总和');
form_sum.series3.Add(trunc(DMgzdagl.ADOQsum_xingshui.FieldValues['其他总和']),'其他总和');
 btfenglei_view.Enabled:=false;
end;

end.

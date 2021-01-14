unit bqcxtj_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ExtCtrls, TeEngine,
  Series, TeeProcs, Chart, DbChart, XPMenu;

type
  Tbqcxtj = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Ebm: TEdit;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label3: TLabel;
    Panel2: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    Label4: TLabel;
    Panel3: TPanel;
    Button2: TButton;
    Eyear: TEdit;
    ChartYear: TChart;
    Series1: TBarSeries;
    Label5: TLabel;
    Label6: TLabel;
    XPMenu1: TXPMenu;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bqcxtj: Tbqcxtj;

implementation

uses DMyzcx_;

{$R *.dfm}

procedure Tbqcxtj.Button1Click(Sender: TObject);
begin
dmyzcx.ADOSPone.Parameters.ParamByName('@StartTime').Value:=DateTimePicker1.DateTime;
dmyzcx.ADOSPone.Parameters.ParamByName('@EndTime').Value:=DateTimePicker2.DateTime;
dmyzcx.ADOSPone.Parameters.ParamByName('@ryzd').Value:=Ebm.Text;
dmyzcx.ADOSPone.Parameters.ParamByName('@RecCount').Value:=0;
dmyzcx.ADOSPone.ExecProc;
edit1.Text:=inttostr(dmyzcx.ADOSPone.Parameters.parambyname('@RecCount').Value);
end;

procedure Tbqcxtj.Button2Click(Sender: TObject);
var
  IntMonth:ARRAY[1..12] OF integer;//声明一个有12个月的数组
  i:integer;
begin
  if Ebm.Text='' then
  begin
    showmessage('请输入病名');
    Ebm.SetFocus;
    exit;
  end;
  if Eyear.Text='' then
  begin
    showmessage('请输入年份');
    Eyear.SetFocus;
    exit;
  end;

  DMyzcx.ADOSPyear.Parameters.ParamByName('@ryzd').Value:=Ebm.Text;
  try
  DMyzcx.ADOSPyear.Parameters.ParamByName('@year').Value:=Eyear.Text;
  except
     showmessage('请真确输入年份');
     Eyear.SetFocus;
     exit;
  end;

  DMyzcx.ADOSPyear.ExecProc;//执行
  //数组付值
  for i:=1 to 12 do
    IntMonth[i]:=DMyzcx.ADOSPyear.Parameters.ParamByName('@'+inttostr(i)).Value;

    
  ChartYear.Title.Text.Text:=Ebm.Text+' 病例统计趋势图';//char的标题
  series1.Clear;
  series1.AddArray([0,IntMonth[1],IntMonth[2],IntMonth[3],IntMonth[4],IntMonth[5],IntMonth[6],IntMonth[7],IntMonth[8],IntMonth[9],IntMonth[10],IntMonth[11],IntMonth[12]]);




end;

end.

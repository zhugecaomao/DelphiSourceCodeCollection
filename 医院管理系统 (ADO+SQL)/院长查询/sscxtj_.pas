unit sscxtj_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, TeEngine, Series,
  TeeProcs, Chart, DbChart, XPMenu;

type
  Tsscxtj = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Eysxm: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Ecs: TEdit;
    Essmc: TEdit;
    Label5: TLabel;
    Panel2: TPanel;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    EysxmTJ: TEdit;
    Label8: TLabel;
    XPMenu1: TXPMenu;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sscxtj: Tsscxtj;

implementation

uses DMyzcx_;

{$R *.dfm}

procedure Tsscxtj.BitBtn1Click(Sender: TObject);
begin
  if Eysxm.Text='' then
  begin
    showmessage('请输入医生姓名');
    Eysxm.SetFocus;
    exit;
  end;
  if Essmc.Text='' then
  begin
    showmessage('请输入手术名称');
    Essmc.SetFocus;
    exit;
  end;
  dmyzcx.ADOSPGetDrOPS.Parameters.ParamByName('@StartTime').Value:=DateTimePicker1.DateTime;
  dmyzcx.ADOSPGetDrOPS.Parameters.ParamByName('@EndTime').Value:=DateTimePicker2.DateTime;
  dmyzcx.ADOSPGetDrOPS.Parameters.ParamByName('@Dr').Value:='%'+Eysxm.Text+'%';
  dmyzcx.ADOSPGetDrOPS.Parameters.ParamByName('@xmfymc').Value:=Essmc.Text;
  dmyzcx.ADOSPGetDrOPS.ExecProc;
  Ecs.Text:=inttostr(dmyzcx.ADOSPGetDrOPS.Parameters.parambyname('@RecCount').Value);
end;

procedure Tsscxtj.BitBtn2Click(Sender: TObject);
begin
  if EysxmTJ.Text='' then
   begin
     showmessage('医生姓名没填');
     EysxmTJ.SetFocus;
   end
  else
   begin
     DMyzcx.ADOQOPSCount.Close;

     DMyzcx.ADOQOPSCount.Parameters.ParamByName('StartTime').Value:=(DateTimePicker3.Date-1);//语法正确可是查不到当日，只有-1了
     DMyzcx.ADOQOPSCount.Parameters.ParamByName('EndTime').Value:=DateTimePicker4.Date;
     DMyzcx.ADOQOPSCount.Parameters.ParamByName('Dr').Value:='%'+EysxmTJ.Text+'%';

     DMyzcx.ADOQOPSCount.Open;
   end;
end;

end.

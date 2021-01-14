unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ImgList, ComCtrls, ToolWin, XPMenu, DB, ADODB,inifiles,shellapi
  ,mmsystem, StdCtrls;

type
  Tmain_form = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ImageList1: TImageList;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    U1: TMenuItem;
    N9: TMenuItem;
    H1: TMenuItem;
    A1: TMenuItem;
    ImageList2: TImageList;
    CoolBar1: TCoolBar;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    N10: TMenuItem;
    N11: TMenuItem;
    ToolButton9: TToolButton;
    StatusBar: TStatusBar;
    Image1: TImage;
    XPMenu1: TXPMenu;
    N14: TMenuItem;
    N15: TMenuItem;
    ToolButton10: TToolButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ToolButton11: TToolButton;
    Button1: TButton;
    Timer1: TTimer;
    N16: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ToolButton10Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Exefilepath:string;
  end;

var
  main_form: Tmain_form;
  ExeRoot:string;
  DataFile:string;
  csql:string;
  ADOConnection1:TADOConnection;
  n:integer;

implementation
 uses login,config,manage,baker,notebook,info,notice,pic,link,salary;
{$R *.dfm}
{自定义声音播放函数}
function PlayWav(const FileName: string): Boolean;
begin
Result := PlaySound(PChar(FileName), 0, SND_ASYNC);
end;
{URL连接函数定义}
procedure URlink(URL:pchar);
begin
 shellexecute(0,nil,URL,nil,nil,sw_normal);
end;

procedure Tmain_form.FormCreate(Sender: TObject);
var
  config_ini:Tinifile;
  pic,tool,statebar:boolean;
  pic_name:string;
begin

//*调整状态栏的宽度
StatusBar.Panels[0].Width:=StatusBar.Width-StatusBar.Panels[1].Width-StatusBar.Panels[2].Width;
//*显示状态栏的内容
StatusBar.Panels[1].Text:='开发者：李利军';
StatusBar.Panels[2].Text:= '版本：V1.0.0';
//*显示软件标题栏
main_form.Caption:='---|闪零小管家|---'+formatdatetime('yyyy年mm月dd日',date());

//*数据库连接-----------------------------------------------------------------------
chDir(ExtractFilePath(application.ExeName));//*改变当前执行文件目录为当前文件目录
ExeRoot:=getCurrentDir();
Exefilepath:=ExeRoot;//*公共执行文件路径

//*读取config.ini文件配置文件
config_ini:=Tinifile.Create(ExeRoot+'\config.ini');
pic:=config_ini.ReadBool('backGround_pic','背景图片',true);
tool:=config_ini.ReadBool('tool_bar','工具栏',true);
statebar:=config_ini.ReadBool('state_bar','状态栏',true);
pic_name:=config_ini.ReadString('picture_name','图片名称','');
//* 显示软件背景图片
if pic=true then
begin
if  fileexists(pic_name) then
image1.Picture.LoadFromFile(pic_name);
end;
//*是否显示工具栏
if tool=false then coolbar1.Visible:=false;
//*是否显示状态栏
if statebar=false then statusbar.Visible:=false;
//*结束
DataFile:=ExeRoot+'\#database.data';
if not fileexists(DataFile) then
begin
playwav('sound\error.wav');
MessageBox(handle,'指定的数据库不存在'+#13#10#13#10+'请联系系统管理员！','错误提示',MB_OK+MB_ICONERROR);
Application.Terminate;
end
else
begin
ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+DataFile+';Persist Security Info=False;';
ADOConnection1.Connected:=true;
//*结束------------------------------------------------------------------------

//*判断是否显示登陆框------------------------------------------------------------------------
with ADOQuery1 do
begin
Close;
SQL.Clear;
csql:='select * from admin';
SQL.Add(csql);
Prepared;
Open;
end;
if ADOQuery1.RecordCount>0 then
begin
login_form:=Tlogin_form.Create(self);
ADOQuery1.Free;
login_form.showmodal;
end;
end;

//*结束-----------------------------------------------------------------------
end;

procedure Tmain_form.A1Click(Sender: TObject);
begin
playwav('sound\info.wav');
Messagebox(handle,'闪灵小管家(1.0版)'+#13#10+#13#10+'版权所有：2005年8月'+#13#10+
              '作者：李利军' ,'关于...',MB_OK+MB_ICONINFORMATION);
end;

procedure Tmain_form.FormResize(Sender: TObject);
begin
//*调整状态栏的宽度
StatusBar.Panels[0].Width:=StatusBar.Width-StatusBar.Panels[1].Width-StatusBar.Panels[2].Width;
end;

procedure Tmain_form.N11Click(Sender: TObject);
begin
playwav('sound\info.wav');
if  messagebox(handle,'你确定要退出本系统吗？','提醒',MB_YESNO+MB_ICONQUESTION)=ID_YES then
application.Terminate;
end;

procedure Tmain_form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=false;
playwav('sound\info.wav');
if  messagebox(handle,'你确定要退出本系统吗？','提醒',MB_YESNO+MB_ICONQUESTION)=ID_YES then
begin
canclose:=true;
application.Terminate;
end;
end;

procedure Tmain_form.ToolButton10Click(Sender: TObject);
begin
config_form:=Tconfig_form.Create(self);
config_form.ShowModal;
end;

procedure Tmain_form.FormActivate(Sender: TObject);
begin
playwav('sound\start.wav');
end;

procedure Tmain_form.ToolButton6Click(Sender: TObject);
begin
manage_form:=Tmanage_form.Create(self);
manage_form.ADOQuery1.Active:=true;
manage_form.ShowModal;
end;

procedure Tmain_form.ToolButton7Click(Sender: TObject);
begin
baker_form:=Tbaker_form.Create(self);
baker_form.ShowModal;
end;

procedure Tmain_form.ToolButton4Click(Sender: TObject);
begin
notebook_form:=Tnotebook_form.Create(self);
notebook_form.ShowModal;
end;

procedure Tmain_form.ToolButton11Click(Sender: TObject);
begin
info_form:=Tinfo_form.Create(self);
info_form.ShowModal;
end;


procedure Tmain_form.Button1Click(Sender: TObject);
var
  i,k:integer;
  day:double;
begin
  with ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from info where date>=:a and date<=:b');
   Parameters[0].Value:=formatDateTime('yyyy-mm-dd',date());
   Parameters[1].Value:=datetostr(strtodate(formatDateTime('yyyy-mm-dd',date()))+10);
   prepared;
   open;
   first;
  end;
  if not ADOQuery1.Eof then
  begin
  notice_form:=Tnotice_form.Create(self);
  with notice_form.Memo1 do
  begin
   for i:=1 to ADOQuery1.RecordCount do
     begin
     //*计算剩余天数；
      day:=ADOQuery1.FieldValues['date']-strtodate(formatDateTime('yyyy-mm-dd',date()));
      if (day>=10) and (day<11) then
      k:=10;
      if (day>=9) and (day<10) then
      k:=9;
      if (day>=8) and (day<9) then
      k:=8;
      if (day>=7) and (day<8) then
      k:=7;
      if (day>=6) and (day<7) then
      k:=6;
      if (day>=5) and (day<6) then
      k:=5;
      if (day>=4) and (day<5) then
      k:=4;
      if (day>=3) and (day<4) then
      k:=3;
      if (day>=2) and (day<3) then
      k:=2;
      if (day>=1) and (day<2) then
      k:=1;
      if (day>=0) and (day<1) then
      k:=0;
      //*结束
      lines[0]:=#13#10+'温馨提醒：还有 '+inttostr(k)+' 天就到了，别忘了这特殊的一天哦！'#13#10;
      lines[0]:=lines[0]+#13#10+'提醒时间：'+datetostr(ADOQuery1.FieldValues['date']);
      lines[0]:=lines[0]+#13#10+'提醒内容：'+ADOQuery1.FieldValues['content'];
      ADOQuery1.Next;
     end;
  end;
  playwav('sound\sucess.wav');
  notice_form.ShowModal;
  end;
end;

procedure Tmain_form.Timer1Timer(Sender: TObject);
begin
if n<80 then
n:=n+1
else
begin
Timer1.Enabled:=false;
Button1click(self);
end;
end;

procedure Tmain_form.FormShow(Sender: TObject);
begin
n:=0;
Timer1.Enabled:=true;
end;

procedure Tmain_form.ToolButton3Click(Sender: TObject);
begin
pic_form:=Tpic_form.Create(self);
pic_form.ShowModal;
end;

procedure Tmain_form.ToolButton2Click(Sender: TObject);
begin
link_Form:=Tlink_Form.Create(self);
link_Form.ShowModal;
end;

procedure Tmain_form.ToolButton1Click(Sender: TObject);
begin
salary_form:=Tsalary_form.Create(self);
salary_form.ShowModal;
end;

end.

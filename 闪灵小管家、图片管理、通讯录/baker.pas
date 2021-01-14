unit baker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls,FileCtrl, ExtCtrls,mmsystem;

type
  Tbaker_form = class(TForm)
    GroupBox1: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ProgressBar1: TProgressBar;
    SpeedButton3: TSpeedButton;
    Label2: TLabel;
    SpeedButton4: TSpeedButton;
    Label3: TLabel;
    SpeedButton5: TSpeedButton;
    Edit2: TEdit;
    OpenDialog1: TOpenDialog;
    Timer1: TTimer;
    procedure CompactAccess(dbName :string;JetId:string='4.0');
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  baker_form: Tbaker_form;
  path:string;
  db_path:string;
  dbname,dbpath:string;

implementation
uses main,comobj;
{$R *.dfm}

{自定义声音播放函数}
function PlayWav(const FileName: string): Boolean;
begin
Result := PlaySound(PChar(FileName), 0, SND_ASYNC);
end;

procedure Tbaker_form.CompactAccess(dbName :string;JetId:string='4.0');
var
  AVariant :Variant;
begin
  if FileExists(db_path+'.tmp') then DeleteFile(db_path+'.tmp');   //是否存在相同的.tmp的临时文件,有则删了
 AVariant :=CreateOleObject('JRO.JetEngine');
  AVariant.CompactDataBase('Provider=Microsoft.Jet.OLEDB.'+JetId+';Jet OLEDB:Database Password=;Data Source='+
  db_path,
    'Provider=Microsoft.Jet.OLEDB.'+JetId+';Data Source='+db_path+'.tmp');
    DeleteFile(db_path);
    ReNameFile(db_path+'.tmp',db_path);        //把文件名改回来
end;

procedure Tbaker_form.SpeedButton1Click(Sender: TObject);
begin
SelectDirectory('请选择数据备份目录','',path);//path就是你选择的目录,如果不为空的话;
if path<>'' then
  if length(path)<>3 then
  path:=path+'\';
edit1.Text:=path;
end;

procedure Tbaker_form.Timer1Timer(Sender: TObject);
begin
if ProgressBar1.Position<100 then
ProgressBar1.Position:=ProgressBar1.Position+1
else
begin
Timer1.Enabled:=false;
playwav('sound\sucess.wav');
messagebox(handle,'数据备份成功！','提示',MB_OK+MB_ICONINFORMATION);
SpeedButton2.Enabled:=true;
end;
end;

procedure Tbaker_form.SpeedButton2Click(Sender: TObject);
begin
 if trim(edit1.Text)='' then
begin
playwav('sound\info.wav');
messagebox(handle,'请先选择备份数据目录！','提示',MB_OK+MB_ICONINFORMATION);
exit;
end;
if  fileexists(path+'database.bak') then DeleteFile(path+'database.bak');   //是否存在相同的database.bak的文件,有则删了
  begin
  copyfile(Pchar(ExtractFilePath(Application.ExeName )+'#database.data'),Pchar(path+'database.bak'),true);
  if ProgressBar1.Position=100 then
      ProgressBar1.Position:=0;
      Timer1.Enabled:=true;
end;
SpeedButton2.Enabled:=false;
end;

procedure Tbaker_form.SpeedButton3Click(Sender: TObject);
begin
  Label2.Caption :='正在压缩数据库,请稍候...';
if main_form.ADOConnection1.Connected=true then main_form.ADOConnection1.Connected:=false;
  Sleep(500);
  db_path:=ExtractFilePath(Application.ExeName )+'#database.data';    //取得当前数据库所在路径
  CompactAccess(db_path);                                     //压缩
  Label2.Caption :='数据库压缩成功!';
  playwav('sound\sucess.wav');
  messagebox(handle,' 数据库压缩成功！','提示',MB_OK+MB_ICONINFORMATION);
 if main_form.ADOConnection1.Connected=false then main_form.ADOConnection1.Connected:=true;
end;

procedure Tbaker_form.SpeedButton5Click(Sender: TObject);
begin
if opendialog1.Execute then
edit2.Text:=opendialog1.FileName;
end;

procedure Tbaker_form.SpeedButton4Click(Sender: TObject);
begin
if edit2.Text='' then
begin
  playwav('sound\error.wav');
  messagebox(handle,' 请选择你要恢复的数据库！','提示',MB_OK+MB_ICONINFORMATION);
  exit;
end;
if messagebox(handle,'你确定要恢复数据库吗？'+#13#10+'请先备份当前数据库！','提示',MB_YESNO+MB_ICONQUESTION)=ID_YES then
begin
if main_form.ADOConnection1.Connected=true then main_form.ADOConnection1.Connected:=false;
copyfile(Pchar(edit2.Text),Pchar(Extractfilepath(application.ExeName)+'#database.data'),true);
sleep(500);
playwav('sound\sucess.wav');
messagebox(handle,' 数据恢复成功！','提示',MB_OK+MB_ICONINFORMATION);
  if main_form.ADOConnection1.Connected=false then main_form.ADOConnection1.Connected:=true;
end;
end;

end.

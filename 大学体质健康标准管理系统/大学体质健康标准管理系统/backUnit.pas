unit backUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, FileCtrl, bsSkinCtrls,
  bsSkinBoxCtrls, bsfilectrl, BusinessSkinForm;

type
  Tbackform = class(TForm)
    ProgressBar1: TProgressBar;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinPanel1: TbsSkinPanel;
    Label1: TLabel;
    DirectoryListBox1: TbsSkinDirectoryListBox;
    BitBtn1: TbsSkinButton;
    BitBtn2: TbsSkinButton;
    BitBtn4: TbsSkinButton;
    BitBtn3: TbsSkinButton;
    Bevel1: TBevel;
    DriveComboBox1: TbsSkinDriveComboBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    procedure wmgetminmaxinfo(var msg:TWMGetMinMaxInfo);message wm_getminmaxinfo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  backform: Tbackform;

implementation

uses dataunit,mainunit, anquanUnit;

{$R *.dfm}

procedure Tbackform.FormShow(Sender: TObject);
begin
ProgressBar1.Position:=0;
mainform.closetable;
end;

procedure Tbackform.BitBtn1Click(Sender: TObject);
var
  path:string;
begin
path:=ExtractFileDir(Application.ExeName);
ProgressBar1.Min:=0;
ProgressBar1.Max:=7;
if DirectoryListBox1.ItemIndex<>0 then
  begin
    CopyFile(pchar(path+'\info\xibie.db'),pchar(DirectoryListBox1.Directory+'\xibie.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\stugread.db'),pchar(DirectoryListBox1.Directory+'\stugread.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\banji.db'),pchar(DirectoryListBox1.Directory+'\banji.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\studengji.db'),pchar(DirectoryListBox1.Directory+'\studengji.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\yonghu.db'),pchar(DirectoryListBox1.Directory+'\yonghu.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\xueshengxinxi.db'),pchar(DirectoryListBox1.Directory+'\xueshengxinxi.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\stugreaninfo.db'),pchar(DirectoryListBox1.Directory+'\stugreaninfo.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    Application.MessageBox('数据备份完毕！','提示');
    ProgressBar1.Position:=0;
  end
else
  Application.MessageBox('请选择一个目录位置！','提示');
end;

procedure Tbackform.BitBtn2Click(Sender: TObject);
var
  path:string;
begin
path:=ExtractFileDir(Application.ExeName);
ProgressBar1.Min:=0;
ProgressBar1.Max:=12;
if DirectoryListBox1.ItemIndex<>0 then
  begin
    CopyFile(pchar(path+'\info\Standard\dxbothstandboy.db'),pchar(DirectoryListBox1.Directory+'\dxbothstandboy.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\Standard\dxbothstandgirl.db'),pchar(DirectoryListBox1.Directory+'\dxbothstandgirl.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\Standard\dxstandhboy.db'),pchar(DirectoryListBox1.Directory+'\dxstandhboy.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\Standard\dxstandhgirl.db'),pchar(DirectoryListBox1.Directory+'\dxstandhgirl.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\Standard\gzonestandboy.db'),pchar(DirectoryListBox1.Directory+'\gzonestandboy.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\Standard\gzonestandgirl.db'),pchar(DirectoryListBox1.Directory+'\gzonestandgirl.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\Standard\gzstandhboy.db'),pchar(DirectoryListBox1.Directory+'\gzstandhboy.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\Standard\gzstandhgirl.db'),pchar(DirectoryListBox1.Directory+'\gzstandhgirl.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\Standard\gzthreestandboy.db'),pchar(DirectoryListBox1.Directory+'\gzthreestandboy.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\Standard\gztwostandgirl.db'),pchar(DirectoryListBox1.Directory+'\gztwostandgirl.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\Standard\gzthreestandgirl.db'),pchar(DirectoryListBox1.Directory+'\gzthreestandgirl.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(path+'\info\Standard\gztwostandboy.db'),pchar(DirectoryListBox1.Directory+'\gztwostandboy.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    Application.MessageBox('数据备份完毕！','提示');
    ProgressBar1.Position:=0;
  end
else
  Application.MessageBox('请选择一个目录位置！','提示');
end;

procedure Tbackform.BitBtn4Click(Sender: TObject);
var
  path:String;
begin
path:=ExtractFileDir(Application.ExeName);
ProgressBar1.Min:=0;
ProgressBar1.Max:=7;
if DirectoryListBox1.ItemIndex<>0 then
  begin
    CopyFile(pchar(DirectoryListBox1.Directory+'\xibie.db'),pchar(path+'\info\xibie.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\stugread.db'),pchar(path+'\info\stugread.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\banji.db'),pchar(path+'\info\banji.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\studengji.db'),pchar(path+'\info\studengji.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\yonghu.db'),pchar(path+'\info\yonghu.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\xueshengxinxi.db'),pchar(path+'\info\xueshengxinxi.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\stugreaninfo.db'),pchar(path+'\info\stugreaninfo.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    Application.MessageBox('请在程序启动时执行数据还原！'+#13+'数据还原完毕！','提示');
    ProgressBar1.Position:=0;
  end
else
  Application.MessageBox('请选择一个目录！','提示');

end;

procedure Tbackform.BitBtn3Click(Sender: TObject);
var
  path:string;
begin
path:=ExtractFileDir(Application.ExeName);
ProgressBar1.Min:=0;
ProgressBar1.Max:=12;
if DirectoryListBox1.ItemIndex<>0 then
  begin
    CopyFile(pchar(DirectoryListBox1.Directory+'\dxbothstandboy.db'),pchar(path+'\info\Standard\dxbothstandboy.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\dxbothstandgirl.db'),pchar(path+'\info\Standard\dxbothstandgirl.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\dxstandhboy.db'),pchar(path+'\info\Standard\dxstandhboy.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\dxstandhgirl.db'),pchar(path+'\info\Standard\dxstandhgirl.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\gzonestandboy.db'),pchar(path+'\info\Standard\gzonestandboy.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\gzonestandgirl.db'),pchar(path+'\info\Standard\gzonestandgirl.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\gzstandhboy.db'),pchar(path+'\info\Standard\gzstandhboy.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\gzstandhgirl.db'),pchar(path+'\info\Standard\gzstandhgirl.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\gzthreestandboy.db'),pchar(path+'\info\Standard\gzthreestandboy.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\gztwostandgirl.db'),pchar(path+'\info\Standard\gztwostandgirl.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\gzthreestandgirl.db'),pchar(path+'\info\Standard\gzthreestandgirl.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    CopyFile(pchar(DirectoryListBox1.Directory+'\gztwostandboy.db'),pchar(path+'\info\Standard\gztwostandboy.db'),false);
    ProgressBar1.Position:=ProgressBar1.Position+1;
    Application.MessageBox('请在程序启动时执行数据还原！'+#13+'数据还原完毕！','提示');
    ProgressBar1.Position:=0;
  end
else
  Application.MessageBox('请选择一个目录位置！','提示');
end;

procedure Tbackform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
mainform.closetable;
mainform.Show;
end;

procedure Tbackform.FormCreate(Sender: TObject);
begin
backform.Left:=GetSystemMetrics(SM_CXSCREEN)div 2-backform.Width div 2;
backform.Top:=GetSystemMetrics(SM_CYSCREEN)div 2-backform.Height div 2;
end;


procedure tbackform.wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);
begin
    with msg.minmaxinfo^ do
   
    begin
      ptMinTrackSize:=point(390,298);//  限定大小
      ptMaxTrackSize:=point(390,298); // 限定大小
    end;
end;



end.

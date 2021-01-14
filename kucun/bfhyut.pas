unit bfhyut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, ExtCtrls,shellapi;

type
  Tsjbffm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    bflj1: TRadioButton;
    bflj2: TRadioButton;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SpeedButton3: TSpeedButton;
    SaveDialog1: TSaveDialog;
    GroupBox2: TGroupBox;
    SpeedButton5: TSpeedButton;
    hylj1: TRadioButton;
    hylj2: TRadioButton;
    Edit2: TEdit;
    BitBtn8: TBitBtn;
    BitBtn5: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bflj2Click(Sender: TObject);
    procedure bflj1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure hylj1Click(Sender: TObject);
    procedure hylj2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sjbffm: Tsjbffm;

implementation

uses loginut, mainut, dataut;

{$R *.dfm}

procedure Tsjbffm.SpeedButton1Click(Sender: TObject);
var
opstruc:tshfileopstruct;
frombuf,tobuf:array[0..128]of char;
begin

if directoryexists(application.GetNamePath+'backup')=false then
createdir(application.GetNamePath+'backup');
if fileexists(application.GetNamePath+'backup/kcgl.mdb') then
deletefile(application.GetNamePath+'backup/kcgl.mdb');
fillchar(frombuf,sizeof(frombuf),0);
fillchar(tobuf,sizeof(tobuf),0);
strpcopy(frombuf,pchar('data/kcgl.mdb'));
strpcopy(tobuf,pchar('backup/kcgl.mdb'));
with opstruc do
begin
wnd:=handle;
wfunc:=fo_copy;
pfrom:=@frombuf;
pto:=@tobuf;
fflags:=fof_noconfirmation or fof_renameoncollision;
fanyoperationsaborted:=false;
hnamemappings:=nil;
lpszprogresstitle:=nil;
end;
if shfileoperation(opstruc)=0 then
begin

end;
end;

procedure Tsjbffm.SpeedButton2Click(Sender: TObject);
var
opstruc:tshfileopstruct;
frombuf,tobuf:array[0..128]of char;
begin

fillchar(frombuf,sizeof(frombuf),0);
fillchar(tobuf,sizeof(tobuf),0);
strpcopy(frombuf,pchar('backup/kcgl.mdb'));
strpcopy(tobuf,pchar('data/'));
with opstruc do
begin
wnd:=handle;
wfunc:=fo_copy;
pfrom:=@frombuf;
pto:=@tobuf;
fflags:=fof_noconfirmation or fof_renameoncollision;
fanyoperationsaborted:=false;
hnamemappings:=nil;
lpszprogresstitle:=nil;
end;
if shfileoperation(opstruc)=0 then
begin

end;

end;

procedure Tsjbffm.BitBtn1Click(Sender: TObject);
var
opstruc:tshfileopstruct;
frombuf,tobuf:array[0..128]of char;
begin
dataconfm.datacon.Connected:=false;;

if fileexists(application.GetNamePath+'data/kcgl.mdb') then
deletefile(application.GetNamePath+'data/kcgl.mdb');
fillchar(frombuf,sizeof(frombuf),0);
fillchar(tobuf,sizeof(tobuf),0);
strpcopy(frombuf,pchar('backup/kcgl.mdb'));
strpcopy(tobuf,pchar('data/kcgl.mdb'));
with opstruc do
begin
wnd:=handle;
wfunc:=fo_copy;
pfrom:=@frombuf;
pto:=@tobuf;
fflags:=fof_noconfirmation or fof_renameoncollision;
fanyoperationsaborted:=false;
hnamemappings:=nil;
lpszprogresstitle:=nil;
end;
if shfileoperation(opstruc)=0 then
begin

end;
end;

procedure Tsjbffm.bflj2Click(Sender: TObject);
begin
if bflj2.Checked then
begin
edit1.Enabled:=true;
speedbutton3.Enabled:=true;
end
else
begin
edit1.Enabled:=false;
speedbutton3.Enabled:=false;
end;
end;

procedure Tsjbffm.bflj1Click(Sender: TObject);
begin
if bflj1.Checked then
edit1.Enabled:=false;
speedbutton3.Enabled:=false;
end;

procedure Tsjbffm.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure Tsjbffm.BitBtn2Click(Sender: TObject);
var
vlj:string;
opstruc:tshfileopstruct;
frombuf,tobuf:array[0..128]of char;
datapath:string;
begin
datapath:=extractfilepath(paramstr(0));
if bflj1.Checked then
vlj:=datapath+'backup/kcgl.bak';
if bflj2.Checked then
vlj:=edit1.Text;
if bflj1.Checked then
begin
if fileexists(datapath+'backup/kcgl.bak') then
deletefile(datapath+'backup/kcgl.bak');
end;
fillchar(frombuf,sizeof(frombuf),0);
fillchar(tobuf,sizeof(tobuf),0);
strpcopy(frombuf,pchar(datapath+'data/kcgl.mdb'));
strpcopy(tobuf,pchar(vlj));
with opstruc do
begin
wnd:=handle;
wfunc:=fo_copy;
pfrom:=@frombuf;
pto:=@tobuf;
fflags:=fof_noconfirmation or fof_renameoncollision;
fanyoperationsaborted:=false;
hnamemappings:=nil;
lpszprogresstitle:=nil;
end;
if shfileoperation(opstruc)=0 then
begin
  showmessage('备份成功!');
end;
end;

procedure Tsjbffm.SpeedButton5Click(Sender: TObject);
begin
if OpenDialog1.Execute then
 edit2.Text:=OpenDialog1.FileName;
end;

procedure Tsjbffm.BitBtn8Click(Sender: TObject);
 var
vlj:string;
opstruc:tshfileopstruct;
frombuf,tobuf:array[0..128]of char;
datapath:string;
begin
datapath:=extractfilepath(paramstr(0));
if hylj1.Checked then
vlj:=datapath+'backup/kcgl.bak';
if hylj2.Checked then
vlj:=edit2.Text;
dataconfm.datacon.Connected:=false;;

if fileexists(datapath+'data/kcgl.mdb') then
deletefile(datapath+'data/kcgl.mdb');
fillchar(frombuf,sizeof(frombuf),0);
fillchar(tobuf,sizeof(tobuf),0);
strpcopy(frombuf,pchar(vlj));
strpcopy(tobuf,pchar(datapath+'data/kcgl.mdb'));
with opstruc do
begin
wnd:=handle;
wfunc:=fo_copy;
pfrom:=@frombuf;
pto:=@tobuf;
fflags:=fof_noconfirmation or fof_renameoncollision;
fanyoperationsaborted:=false;
hnamemappings:=nil;
lpszprogresstitle:=nil;
end;
if shfileoperation(opstruc)=0 then
begin
showmessage('还原成功!');
end;
end;

procedure Tsjbffm.SpeedButton3Click(Sender: TObject);
begin
if SaveDialog1.Execute then
 edit1.Text:=SaveDialog1.FileName;
end;

procedure Tsjbffm.hylj1Click(Sender: TObject);
begin
if hylj1.Checked then
edit2.Enabled:=false;
speedbutton5.Enabled:=false;
end;

procedure Tsjbffm.hylj2Click(Sender: TObject);
begin
if hylj2.Checked then
begin
edit2.Enabled:=true;
speedbutton5.Enabled:=true;
end
else
begin
edit2.Enabled:=false;
speedbutton5.Enabled:=false;
end;
end;

end.

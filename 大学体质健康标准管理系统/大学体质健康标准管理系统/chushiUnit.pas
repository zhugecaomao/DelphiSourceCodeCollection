unit chushiUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, BusinessSkinForm, StdCtrls,inifiles,registry,
  ExtCtrls;

type
  Tchushiform = class(TForm)
    bsSkinPanel1: TbsSkinPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    bsSkinButton1: TbsSkinButton;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure bsSkinButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure wmgetminmaxinfo(var msg:TWMGetMinMaxInfo);message wm_getminmaxinfo;
    { Private declarations }
  public
    function  newr(pstr:string):string;
    { Public declarations }
  end;

var
  chushiform: Tchushiform;
  regedit:TRegistry;
  regcount:integer;

implementation
uses mainunit;

{$R *.dfm}

function tchushiform.newr(pstr:string):string;
var str,str1:string;
  i,j:integer;
begin                 
  str:=pstr;
  for i:=1 to length(str)+2 do begin

    j:=(i*i*i mod (i+20))+(i*i mod (i+10))+i*2+1;
    str1:=str1+chr(ord(str[i])+j+i);

    j:=(i*i*i mod (i+10))+(i*i mod (i+20))+i*2+1;
    str1:=str1+chr(ord(str[i])+j+i);

    j:=(i*i*i mod (i+1))+(i*i mod (i+30))+i*2+1;
    str1:=str1+chr(ord(str[i])+j+i);

    j:=(i*i*i mod (i))+(i*i mod (i+40))+i*2+1;
    str1:=str1+chr(ord(str[i])+j+i);
  end;
  newr:=str1;
end;




procedure Tchushiform.Edit1Change(Sender: TObject);
begin
if edit1.Text<>'' then
  begin
    edit2.Enabled:=true;
    edit3.Enabled:=true;
  end
else
  begin
    edit2.Enabled:=false;
    edit3.Enabled:=false;
  end;
end;

procedure Tchushiform.bsSkinButton1Click(Sender: TObject);
begin
try
if edit1.Text<>'' then
  begin
  if mainform.runtag=false then
      begin
        if edit3.Text=newr(edit1.Text+edit2.Text) then
          begin
            inifile.WriteString('section','reg','true');
            inifile.WriteString('section','id','datat');
            surfile.Free;
            CopyFile(pchar(ExtractFileDir(Application.ExeName)+'\data.ini'),'c:\windows\system32\datasys.ini',false);
            try
              regedit:=TRegistry.Create;
              regedit.RootKey:=HKEY_LOCAL_MACHINE;
                  if regedit.OpenKey('software\大学体质健康标准管理系统\infomation',true) then
                    begin
                      regedit.WriteString('user',edit1.Text);
                      regedit.WriteString('id',edit2.Text);
                      regedit.WriteString('num',edit3.Text);
                      regedit.WriteString('version','v 1.5');
                    end;
              regedit.CloseKey;
              regedit.Destroy;
            except
               abort;
            end;
            mainform.runtag:=true;
            Application.MessageBox('软件注册成功！','提示');
            edit1.Text:='';
            edit2.Text:='';
            edit3.Text:='';
          end;
            edit1.Text:='';
            edit2.Text:='';
            edit3.Text:='';
          if regcount<3 then   //判断是否为破解
            regcount:=regcount+1
          else
            Application.Terminate;
end
else if mainform.runtag=true then
  begin
    Application.MessageBox('软件已经注册！','提示');
  end;
  end
else
  Application.MessageBox('请输入注册信息！','提示');
except
  abort;
end;
end;


procedure tchushiform.wmgetminmaxinfo(var msg:TWMGetMinMaxInfo);
begin
   with msg.minmaxinfo^ do

    begin
      ptMinTrackSize:=point(433,263);//  限定大小
      ptMaxTrackSize:=point(433,263); // 限定大小
    end;
end;

procedure Tchushiform.FormShow(Sender: TObject);
begin
regcount:=0;
end;

end.

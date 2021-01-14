unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,md5;

type
  Tloginform = class(TForm)
    Edit2: TEdit;
    Button2: TButton;
    Button1: TButton;
    Label1: TLabel;

    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  loginform: Tloginform;

implementation

uses Main;

{$R *.dfm}




procedure Tloginform.Button2Click(Sender: TObject);
 var  PwdArr: Array[0..100] of char;
      ddt:file;
      NumRead:integer;
      pwdtxt:string;
begin

         AssignFile(ddt,GetCurrentDir+'\'+'XYZ.ttf');
                 reset(ddt,1);
          repeat
             BlockRead(ddt,PwdArr,sizeof(PwdArr),NumRead);
          until eof(ddt);
         CloseFile(ddt);
         pwdtxt:=PwdArr;
    if  Pwdtxt= md5.RivestStr(Edit2.Text) then
    begin
      // 登录成功
      showmessage('欢迎使用！');

       MainForm.ToolBar1.Enabled:=True;
    MainForm.PopupMenu1.AutoPopup:=True;
    MainForm.N1.Enabled:=True;
      MainForm.N4.Enabled:=True;
        MainForm.N10.Enabled:=True;
         MainForm.N16.Enabled:=True;
           MainForm.R1.Enabled:=True;
      Close;
                                             

    end
    else
      begin
       showmessage('密码不正确，请重试！');
       Edit2.Text:='';
       //登录不成功
      end;


end;


procedure Tloginform.Button1Click(Sender: TObject);
begin
   Close;
end;

end.


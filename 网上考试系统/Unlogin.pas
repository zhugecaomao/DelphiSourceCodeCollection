unit Unlogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, jpeg;

type
  TLoginfrm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Loginfrm: TLoginfrm;

implementation

uses Undm, Unmain;

{$R *.dfm}

procedure TLoginfrm.Button1Click(Sender: TObject);
begin
 if edit1.Text='' then
  begin
   application.MessageBox('您没有输入登录名，请输入你的登录名！！','系统警告',MB_ok+MB_Iconstop);
   exit;
  end;
   if edit2.Text='' then
  begin
   application.MessageBox('您没有输入口令,请输入你的口令！！','系统警告',MB_ok+MB_Iconstop);
   exit;
  end;
 if datamodule1.CDSManerge.Locate('姓名',edit1.Text,[]) then
  begin
   if datamodule1.CDSManerge.FieldByName('口令').AsString=edit2.Text then
    begin
     if datamodule1.CDSManerge.Fields[2].Value=2 then
      begin
       mainfrm.n1.Enabled:=false;
       mainfrm.toolbutton1.Enabled:=false;
       mainfrm.toolbutton3.Enabled:=false;
  end;
     close;
    end
   else
     application.MessageBox('你输入的口令有误，请重新输入！','系统警告',mb_ok+mb_iconstop);
    end
  else
    application.MessageBox('你输入的姓名有误，请重新输入！','系统警告',mb_ok+mb_iconstop);
end;

procedure TLoginfrm.Button2Click(Sender: TObject);
begin
application.Terminate;
end;

end.

unit Uncount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  Tcountfrm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  countfrm: Tcountfrm;

implementation

uses Undm;

{$R *.dfm}

procedure Tcountfrm.Button1Click(Sender: TObject);
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
 if datamodule1.DSManerge.Locate('姓名',edit1.Text,[]) then
  begin
   if datamodule1.DSManerge.FieldByName('口令').AsString=edit2.Text then
    begin

     close;
    end
   else
     application.MessageBox('你输入的口令有误，请重新输入！','系统警告',mb_ok+mb_iconstop);
    end
  else
    application.MessageBox('你输入的姓名有误，请重新输入！','系统警告',mb_ok+mb_iconstop);
end;

procedure Tcountfrm.Button2Click(Sender: TObject);
begin
application.Terminate;
end;

end.

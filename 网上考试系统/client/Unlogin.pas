unit Unlogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tloginfrm = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  loginfrm: Tloginfrm;

implementation

uses Undm, Unkaoshi;

{$R *.dfm}

procedure Tloginfrm.Button11Click(Sender: TObject);
begin
edit1.Text:=edit1.Text+'1';
end;

procedure Tloginfrm.Button12Click(Sender: TObject);
begin
edit1.Text:=edit1.Text+'2';
end;

procedure Tloginfrm.Button13Click(Sender: TObject);
begin
edit1.Text:=edit1.Text+'3';
end;

procedure Tloginfrm.Button7Click(Sender: TObject);
begin
edit1.Text:=edit1.Text+'4';
end;

procedure Tloginfrm.Button6Click(Sender: TObject);
begin
edit1.Text:=edit1.Text+'5';
end;

procedure Tloginfrm.Button8Click(Sender: TObject);
begin
edit1.Text:=edit1.Text+'6';
end;

procedure Tloginfrm.Button1Click(Sender: TObject);
begin
edit1.Text:=edit1.Text+'7';
end;

procedure Tloginfrm.Button2Click(Sender: TObject);
begin
edit1.Text:=edit1.Text+'8';
end;

procedure Tloginfrm.Button3Click(Sender: TObject);
begin
edit1.Text:=edit1.Text+'9';
end;

procedure Tloginfrm.Button4Click(Sender: TObject);
begin
edit1.Text:=edit1.Text+'0';
end;

procedure Tloginfrm.Button10Click(Sender: TObject);
begin
edit1.Text:='';
end;

procedure Tloginfrm.Button5Click(Sender: TObject);
var i:integer;
    abc:string;
begin
 abc:='';
 for i:=1 to length(edit1.Text)-1 do
 begin
  abc:=abc+edit1.Text[i];
 end;
 edit1.Text:=abc;
end;

procedure Tloginfrm.Button9Click(Sender: TObject);
begin
application.Terminate;
end;

procedure Tloginfrm.Button14Click(Sender: TObject);
begin
 if edit1.Text='' then
  application.MessageBox('请输入你的准考证号','系统警告',mb_ok+mb_iconstop)
 else
  if datamodule2.CDSStudent.Locate('准考证号',edit1.Text,[]) then
    if datamodule2.CDSStudent.FieldByName('状态').AsInteger=1 then
     begin
      datamodule2.CDSStudent.Edit;
      datamodule2.CDSStudent.FieldByName('状态').AsInteger:=2;
      datamodule2.CDSStudent.Post;
      datamodule2.CDSStudent.ApplyUpdates(0);
      kaoshifrm.Show;
      loginfrm.Hide;
     end
    else
     begin
      if datamodule2.CDSStudent.FieldByName('状态').AsInteger=2 then
       application.MessageBox('该准考证号已经有人正在考试！','系统警告！',mb_ok+mb_iconstop);
      if datamodule2.CDSStudent.FieldByName('状态').AsInteger=3 then
       application.MessageBox('该准考证号已经交卷，不能重新考试！','系统警告！',mb_ok+mb_iconstop);
      if datamodule2.CDSStudent.FieldByName('状态').AsInteger=6 then
       application.MessageBox('该准考证号没有分配机器，请联系监考员！','系统警告！',mb_ok+mb_iconstop);
    end
  else
   begin
   application.MessageBox('该准考证号不存在，请重新输入！','系统警告！',mb_ok+mb_iconstop);
   edit1.Text:='';
  end;
end;

end.

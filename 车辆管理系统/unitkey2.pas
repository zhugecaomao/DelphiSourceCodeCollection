unit unitkey2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, Mask;

type
  Tformkey2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Query1: TQuery;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formkey2: Tformkey2;

implementation

{$R *.dfm}

procedure Tformkey2.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tformkey2.BitBtn1Click(Sender: TObject);
var
 str1,str2,str3:string;
 i:integer;
begin
  query1.close;
  query1.SQL.Clear;
  str3:=edit1.text;
  for i:=1 to length(edit3.Text) do
     begin
       str3[i]:=chr(ord(str3[i])-i);
     end;
  str1:='select * from 用户.db where 密码="'+str3+'"';
  query1.sql.text:=str1;
  query1.open;
  if query1.RecordCount <>0 then
    begin
      if (edit2.text=edit3.Text)  then
         begin
          query1.close;
          query1.SQL.Clear;
          str2:=edit2.Text;
          for i:=1 to length(edit2.Text) do
              begin
               str2[i]:=chr(ord(str2[i])-i);
               end;
          query1.sql.add('update 用户.db set 密码='''+trim(str2)+''' where 用户名=''grrrr''');
          query1.ExecSQL;
          close;
          messagedlg('口令已成功修改！',mtinformation,[mbok],0);
         end
      else
        begin
         messagedlg('两次输入结果不一致！',mterror,[mbok],0);
         edit2.Clear;
         edit3.Clear;
        end;
      end
    else
      begin
        messagedlg('原密码输入错误',mterror,[mbok],0);
        edit1.clear;
      end;
  end;
procedure Tformkey2.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then  edit2.SetFocus;
end;

procedure Tformkey2.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then  edit3.SetFocus;
end;

procedure Tformkey2.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then  BitBtn1.SetFocus;
end;

procedure Tformkey2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
query1.close;
action:=cafree;

end;

procedure Tformkey2.FormShow(Sender: TObject);
begin
query1.Open;
end;

end.

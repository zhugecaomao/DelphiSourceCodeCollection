unit unitkey;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, DB, DBTables, Grids, DBGrids,
  Mask;

type
  Tformkey = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Query1: TQuery;
    Edit1: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formkey: Tformkey;

implementation

uses Unit1;

{$R *.dfm}

procedure Tformkey.BitBtn1Click(Sender: TObject);
var
str1,str2 :string;
i:integer;
begin
query1.close;
query1.SQL.Clear;
str2:=edit1.Text;
for i:=1 to length(edit1.Text) do
     begin
       str2[i]:=chr(ord(str2[i])-i);
     end;
str1:='select * from 用户.db where 用户名=''grrrr'' and 密码="'+str2+'"';
query1.sql.text:=str1;
query1.open;
if query1.RecordCount =0 then //<>0 then 2002.08.10 by zjs
  begin
  close;
  end
else
  begin
  messagedlg('密码输入有误，请重试！',mterror,[mbok],0);

  edit1.Clear;

  end
end;


procedure Tformkey.BitBtn2Click(Sender: TObject);
begin
application.Terminate;
end;

procedure Tformkey.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then  BitBtn1.SetFocus;
end;

procedure Tformkey.FormShow(Sender: TObject);
begin
query1.Open;
end;

procedure Tformkey.FormClose(Sender: TObject; var Action: TCloseAction);
begin
query1.Close;
action:=cafree;
end;

end.

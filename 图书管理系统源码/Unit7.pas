unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMenu;

type
  TForm7 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label2: TLabel;
    Button2: TButton;
    Button3: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    XPMenu1: TXPMenu;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation
uses registry, myjiami, Unit1;
{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
var
  reg:Tregistry;
  result:string;
begin
  result:='';
  reg:=Tregistry.create;
  with reg do
  begin
    rootkey:=HKEY_LOCAL_MACHINE;
    OPENKEY('Software\Microsoft\Windows\CurrentVersion',false);
    result:=readstring('ProductID');
  end;
  reg.free;
  edit1.Text:=result;
  edit1.Text:=copy(edit1.Text,1,5)+copy(edit1.Text,7,3)+copy(edit1.Text,11,7)+copy(edit1.Text,19,5);
end;

procedure TForm7.Button2Click(Sender: TObject);
var
  Textfile1:Textfile;
  reg:Tregistry;
  result:string;
  str_sum:string;
begin
  result:='';
  reg:=Tregistry.create;
  with reg do
  begin
    rootkey:=HKEY_LOCAL_MACHINE;
    OPENKEY('Software\Microsoft\Windows\CurrentVersion',false);
    result:=readstring('ProductID');
  end;
  reg.free;
  result:=copy(result,1,5)+copy(result,7,3)+copy(result,11,7)+copy(result,19,5); //µÃµ½×¢²áÂë
  str_sum:=edit2.Text+edit3.Text+edit4.Text+edit5.Text;
  str_sum:=myjiami.str_to_int(str_sum);
  if str_sum =  result   then
  begin
    MessageDlg('¹§Ï²Äã×¢²á³É¹¦£¡£¡', mtInformation, [mbYes],0);
    AssignFile(Textfile1, 'regsys.dat');
    Rewrite(Textfile1);
    writeln(Textfile1, str_sum);  //Ð´Èë×¢²áÂë
    closefile(Textfile1);
    form1.N40.Visible:=false;
    close;
  end
  else
  begin
    MessageDlg('×¢²áÂë²»ÕýÈ·£¡£¡', mtWarning, [mbYes],0);
    edit2.Text:='';
    edit3.Text:='';
    edit4.Text:='';
    edit5.Text:='';
  end;
end;

procedure TForm7.Edit2Change(Sender: TObject);
begin
  if length(edit2.Text)=5 then
  edit3.SetFocus;
end;

procedure TForm7.Edit3Change(Sender: TObject);
begin
  if length(edit3.Text)=3 then
  edit4.SetFocus;
end;

procedure TForm7.Edit4Change(Sender: TObject);
begin
  if length(edit4.Text)=7 then
  edit5.SetFocus;
end;

procedure TForm7.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if (length(edit5.Text)=5) and (key<>#8) then
  key:=#0
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
  close;
end;

end.

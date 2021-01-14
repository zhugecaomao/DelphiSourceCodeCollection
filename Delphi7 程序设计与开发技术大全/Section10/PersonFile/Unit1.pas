unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TPerson=packed record
    FirstName:String[20];
    LastName:String[20];
    Age:Integer;
    SocialCode:Integer;
  end;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  PersonFile:file of TPerson;
  Person:TPerson;
begin
  AssignFile(PersonFile,'PersonFile.dat');
  Reset(PersonFile);
  Seek(PersonFile,FileSize(PersonFile));
  try
    Person.FirstName:=Edit1.Text;
    Person.LastName:=Edit2.Text;
    Person.Age :=StrToInt(Edit3.Text);
    Person.SocialCode :=StrToInt(Edit4.Text);
    Write(PersonFile,Person);
  finally
    CloseFile(PersonFile);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  PersonFile:file of TPerson;
  P,Person:TPerson;
begin
  AssignFile(PersonFile,'PersonFile.dat');
  Reset(PersonFile);
  try
    While not Eof(PersonFile) do
    begin
      Memo1.Lines.Add('=========================');
      Read(PersonFile,Person);
      Memo1.Lines.Add('FirstName:'+Person.FirstName);
      Memo1.Lines.Add('LastName:'+Person.LastName);
      Memo1.Lines.Add('Age:'+IntToStr(Person.Age));
      Memo1.Lines.Add('SocialCode:'+IntToStr(Person.SocialCode));
      Memo1.Lines.Add('=========================');
    end;
  finally
    CloseFile(PersonFile);
  end;
end;

end.
 
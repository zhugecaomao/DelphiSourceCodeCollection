unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  MyTextFile:TextFile;
begin
  AssignFile(MyTextFile,'TextFile.txt');
  Reset(MyTextFile);
  try
    Writeln(MyTextFile,'测试写入。');
  except
    ShowMessage('不能写入。');
  end;
  CloseFile(MyTextFile);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  MyTextFile:TextFile;
begin
  AssignFile(MyTextFile,'TextFile.txt');
  Rewrite(MyTextFile);
  try
    Writeln(MyTextFile,Memo1.Lines.Text); //将Memo1的内容写入文本文件
  finally
    CloseFile(MyTextFile);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  MyTextFile:TextFile;
begin
  AssignFile(MyTextFile,'TextFile.txt');
  Append(MyTextFile);
  try
    Writeln(MyTextFile,'向文件末尾追加文字。');
    Flush(MyTextFile);  //确保文本文件已经被写入
  finally
    CloseFile(MyTextFile);
  end;
end;

end.

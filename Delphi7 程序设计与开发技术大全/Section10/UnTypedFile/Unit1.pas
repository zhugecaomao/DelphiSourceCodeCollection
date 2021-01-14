unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  UnTypedFile:file;
  Buf:array [0..128] of byte;
  Num,I:Integer;
  Str:String;
begin
  AssignFile(UnTypedFile,'UnTypedFile.dat');
  Reset(UnTypedFile);
  try
    BlockRead(UnTypedFile,Buf,1,Num);
    for I:=0 to 128 do
      Str:=Str+VarToStr(char(Buf[I]));
    Memo1.Lines.Add(Str);
  finally
    CloseFile(UnTypedFile);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  UnTypedFile:file;
  Buf:array[0..128] of byte;
  Num:Integer;
begin
  AssignFile(UnTypedFile,'UnTypedFile.dat');
  Reset(UnTypedFile);
  if FileExists('UnTypedFile.dat') then
    Reset(UnTypedFile)
  else
    Rewrite(UnTypedFile);
  try
    Seek(UnTypedFile,FileSize(UnTypedFile)); //Seek使文件指针的位置位于末尾
    FillChar(Buf,SizeOf(Buf),'Y');
    BlockWrite(UnTypedFile,Buf,1,Num);
  finally
    CloseFile(UnTypedFile);
  end;
end;

end.

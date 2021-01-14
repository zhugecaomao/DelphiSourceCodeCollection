unit Unit1;

interface

uses
  ComCtrls, StdCtrls, Controls, Forms, ZnMD5, Classes;

type
  TForm1 = class(TForm)  
    Edit1: TEdit;
    znMD51: TznMD5;
    Button1: TButton;
    PBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure znMD51Begin(const nMaxSize: Cardinal);
    procedure znMD51End(const nNormal: Boolean; const nMD5String: String);
    procedure znMD51Process(const nHasDone: Cardinal);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.znMD51Begin(const nMaxSize: Cardinal);
begin
  PBar1.Max := nMaxSize;
end;

procedure TForm1.znMD51End(const nNormal: Boolean;
  const nMD5String: String);
begin
  if nNormal then
  begin
     PBar1.Position := 0;
     Edit1.Text := nMD5String;
  end else Edit1.Text := 'Md5操作为完成';
end;

procedure TForm1.znMD51Process(const nHasDone: Cardinal);
begin
  PBar1.Position := nHasDone;
  {注意: 这是大概的进度,不精确}
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ZnMd51.SourceFile := Application.ExeName;
  ZnMd51.MD5_File;
end;

{-----------------------------  其它说明----------------------------------------
  属性:
  &.SourceFile,SourceStr: 待Md5运算的文件,字符串
  &.Busy: ZnMd5是否正在运行,True/False

  方法:
  &.MD5_File: 对SourceFile进行运算
  &.MD5_String: 对SourceStr进行运算
  &.StopZnMD5: 若Busy=True时,中断操作
  &.GetMD5String: 获取最后一次MD5运算的值

  作者: dmzn dmzn@163.com 2006-02-08
--------------------------------------------------------------------------------}

end.

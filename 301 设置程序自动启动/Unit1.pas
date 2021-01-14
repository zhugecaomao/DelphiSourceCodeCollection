unit Unit1;

interface

uses
  Windows,Registry, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
procedure SetAutorun(aProgTitle,aCmdLine: string; aRunOnce: boolean );
var
  hKey: string;
  hReg: TRegIniFile;
begin
  if aRunOnce then
  //程序只自动运行一次
    hKey := 'Once'
  else
    hKey := '';
  hReg := TRegIniFile.Create('');
  //TregIniFile类的对象需要创建
  hReg.RootKey := HKEY_LOCAL_MACHINE;
  //设置根键
  hReg.WriteString('Software\Microsoft\Windows\CurrentVersion\Run'
                  + hKey + #0,
                  aProgTitle,
                  //程序名称，可以为自定义值
                  aCmdLine );
                  //命令行数据，必须为该程序的绝对路径＋程序完整名称
  hReg.destroy;
  //释放创建的hReg
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 SetAutorun(Application.Title,application.ExeName,false);
end;

end.

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Registry, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
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

procedure TForm1.Button1Click(Sender: TObject);
var
  hKey: string;
  hReg: TRegIniFile;
begin
  hReg := TRegIniFile.Create('');
  //TregIniFile类的对象需要创建
  hReg.RootKey := HKEY_CLASSES_ROOT;
  hReg.OpenKey('CLSID\{871C5380-42A0-1069-A2EA-08002B30309D}\shell\OpenHomePage\Command',False);
  //设置根键

  hReg.WriteExpandString('','"%ProgramFiles%\Internet Explorer\iexplore.exe"'+edit1.text );
                  //命令行数据，必须为该程序的绝对路径＋程序完整名称
  hReg.destroy;
  //释放创建的hReg
  ShowMessage('锁定完成！');
end;

end.

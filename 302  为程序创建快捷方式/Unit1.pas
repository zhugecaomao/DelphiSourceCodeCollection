unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,registry,ActiveX,Comobj,Shlobj;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
const
  IID_IPersistFile: TGUID =
  (D1:$0000010B;D2:$0000;D3:$0000;D4:($C0,$00,$00,$00,$00,$00,$00,$46));
function GetShellFolder (const folder: string):string;
const
  cWin32='SOFTWARE\Microsoft\Windows\CurrentVersion';
  cSHellPrefix = '\Explorer\Shell Folders';
var
  r:TRegistry;
begin
  Result:='';
  r:=TRegistry.Create;
 //创建对象
  try
    r.Rootkey:=HKEY_CURRENT_USER;
    //只要是Windows95及其以后版本，此处都一样
    if r.OpenKey (cWin32 + cShellPrefix, False) then
    //打开键，开始读取
     Result:= r.ReadString (folder) + '\';
  finally
    r.Free;
   //释放创建的对象
  end;
end;

function CreateLink(aPathObj,aPathLink,aDesc: string): boolean;
var
  sLink: IShellLink;
  PersFile: IPersistFile;
begin
  Result := false;
  if SUCCEEDED(CoCreateInstance(CLSID_ShellLink, nil,
               CLSCTX_INPROC_SERVER, IID_IShellLinkA, sLink)) then
 //创建接口实例成功
  begin
    sLink.SetPath(PChar(aPathObj));
  //设置要创建快捷方式的程序路径及其文件名
    sLink.SetDescription(PChar(aDesc));
    //设置对快捷方式的描述信息
    if SUCCEEDED(sLink.QueryInterface(IID_IPersistFile,PersFile)) then
    //查询接口成功
    begin
      PersFile.Save(StringToOLEStr(aPathLink),TRUE);
      //保存快捷方式
      Result := true;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if not CreateLink(Application.ExeName,
                    GetShellFolder('Desktop')+'mylink.lnk','我的快捷方式') then
 //调用GetShellFolder获取系统桌面文件夹路径
  begin
    Showmessage('创建快捷方式失败');
  end;
end;

end.
 
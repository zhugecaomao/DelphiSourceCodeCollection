unit about;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Dialogs;

type
  Tfrmabout = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    lblOs: TLabel;
    lblMemory: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    Others: TLabel;
    Author: TLabel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    s: string;
    procedure GetOSInfo; //系统信息程序
    procedure GetMemoryInfo; //可用资源程序
  public
    { Public declarations }
  end;

var
  frmabout: Tfrmabout;

const
  ver = '商业软件 v1.0';

implementation

{$R *.DFM}

procedure Tfrmabout.GetMemoryInfo; //可用资源
var
  MS: TMemoryStatus;
begin
  MS.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(MS);
  lblMemory.Caption := lblMemory.Caption + FormatFloat('#,###" KB"', MS.dwTotalPhys div 1024);
end;

procedure Tfrmabout.GetOSInfo; //获取系统信息
var
  Platform: string;
  BuildNumber: Integer;
begin
  case Win32Platform of
    VER_PLATFORM_WIN32_WINDOWS:
      begin
        Platform := 'Windows 95';
        BuildNumber := Win32BuildNumber and $0000FFFF;
      end;
    VER_PLATFORM_WIN32_NT:
      begin
        Platform := 'Windows NT';
        BuildNumber := Win32BuildNumber;
      end;
  else
    begin
      Platform := 'Windows';
      BuildNumber := 0;
    end;
  end;

  if (Win32Platform = VER_PLATFORM_WIN32_WINDOWS)
    or (Win32Platform = VER_PLATFORM_WIN32_NT) then
    begin
      if Win32CSDVersion = ''
        then lblOS.Caption := lblOS.Caption + Format('%s%s          %d.%d (Build %d)', [Platform, #13, Win32MajorVersion, Win32MinorVersion, BuildNumber])
      else lblOS.Caption := lblOS.Caption + Format('%s%s          %d.%d (Build %d: %s)', [Platform, #13, Win32MajorVersion, Win32MinorVersion, BuildNumber, Win32CSDVersion]);
    end else lblOS.Caption := lblOS.Caption + Format('%s%s          %d.%d', [Platform, #13, Win32MajorVersion, Win32MinorVersion])
end;

procedure Tfrmabout.FormCreate(Sender: TObject);
begin
  try
    Caption := '关于 ' + application.Title;
    ProgramIcon.Picture.icon := Application.Icon;
    ProductName.Caption := ProductName.Caption + Application.Title;
    version.Caption := version.Caption + ver;
    Copyright.Caption := Copyright.Caption + '东莞市龙兴五金材料店';
    Author.Caption := Author.Caption + '       陈列旺       ';
    Others.Caption := '警告：未经允许，任何个人、单位可以以任何方式非法拷贝、盗用！' +
      '否则，系统在运行过程中出现的任何问题作者将不负任何连带责任！' + #13 + #13 +
      '程序于Win98~Win2000，SQL Server 2000运行！';
    //初始化---------------------------
    GetMemoryInfo;
    GetOsinfo;
    {***********************}
    //初始化变量s...
    s := '';
  except
    MessageBox(handle, '某些信息不能取得', '提示', MB_OK);
  end;
end;

procedure Tfrmabout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

unit Speed1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TSpeed = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Speed: TSpeed;

implementation

uses Xeduser;

{$R *.DFM}

function CPUSpeed: Double;
const
  DelayTime = 500; // measure time in ms
var
  TimerHi, TimerLo: DWORD;
  PriorityClass, Priority: Integer;
begin
  PriorityClass := GetPriorityClass(GetCurrentProcess);
  Priority := GetThreadPriority(GetCurrentThread);

  SetPriorityClass(GetCurrentProcess, REALTIME_PRIORITY_CLASS);
  SetThreadPriority(GetCurrentThread, THREAD_PRIORITY_TIME_CRITICAL);

  Sleep(10);
  asm
    dw 310Fh // rdtsc
    mov TimerLo, eax
    mov TimerHi, edx
  end;
  Sleep(DelayTime);
  asm
    dw 310Fh // rdtsc
    sub eax, TimerLo
    sbb edx, TimerHi
    mov TimerLo, eax
    mov TimerHi, edx
  end;
  SetThreadPriority(GetCurrentThread, Priority);
  SetPriorityClass(GetCurrentProcess, PriorityClass);
  Result := TimerLo / (1000.0 * DelayTime);
end;

function myGetVersion: string;
var
  VersionInfo: TOSVersionInfo;
  OSName: string;
begin
  VersionInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  if GetVersionEx(VersionInfo) then begin
    with VersionInfo do
      case dwPlatformId of
        VER_PLATFORM_WIN32s: OSName := 'Win32s';
        VER_PLATFORM_WIN32_WINDOWS: OSName := 'Windows 98';
        VER_PLATFORM_WIN32_NT: OSName := 'Windows NT';
      end;
    with VersionInfo do
      Result := OSName + ' 标本：' +
        IntToStr(dwMajorVersion) + '.' +
        IntToStr(dwMinorVersion) + ' (Build ' +
        IntToStr(dwBuildNumber) + ')';
  end else Result := '';
end;

procedure TSpeed.FormCreate(Sender: TObject);
var
  SysInfo: TSystemInfo;
  MemoryStatus: TMemoryStatus;
begin
  Label1.Caption := format('CPU-工作频率：%f 兆赫兹', [CPUSpeed]);
  GlobalMemoryStatus(MemoryStatus);
  Label3.Caption := '内存：' + Format('%10.0n 字节', [MemoryStatus.dwTotalPhys * 1.0]);
  Label2.Caption := '拥有的驱动器：' + GetDrive;
  GetSystemInfo(SysInfo);
  Label4.Caption := '计算机CPU-型号：' + inttostr(SysInfo.dwProcessorType);
  Label5.Caption := MyGetVersion;
end;

end.

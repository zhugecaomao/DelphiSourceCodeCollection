unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,TlHelp32,
  StdCtrls;

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
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  ProcessHndle,PID: HWND;
  BytesRead : DWORD;
  TmpData : array[0..1] of Byte;
  FilePath:String;

const
  OldData : array[0..1] of byte = ($75,$10);   // 原值
  NewData : array[0..1] of byte = ($90,$90);   // 修改值

implementation

{$R *.DFM}

function FindPath(PID:dword):String;   // 查寻程序路径
var
  H: THandle;
  TM: TModuleEntry32;
begin
  Result:='';
  H := CreateToolHelp32SnapShot(TH32CS_SNAPMODULE,PID);
  if H > 0 then
  begin
    TM.dwSize := sizeof(TM);
    Module32First(H, TM);
    Result:=TM.szExePath;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
Var
  H: THandle;
begin
  H:= FindWindow(nil,'test');
  if H = 0 then
  begin
   MessageBox(0,#13+'程序未运行!请仔细检查...!!!','系统提示',0);
   Exit;
  end;
  GetWindowThreadProcessId(H, @PID);
  FilePath := FindPath(PID);
  if FilePath='' then Exit;
  ProcessHndle:=OpenProcess(PROCESS_TERMINATE,FALSE,PID);
  if ProcessHndle = 0 then  Exit;
  TerminateProcess(ProcessHndle, 0);
  CloseHandle(ProcessHndle);


  ZeroMemory(@StartInfo, SizeOf(TStartupInfo));
  StartInfo.cb := SizeOf(TStartupInfo);
  if not CreateProcess(nil,Pchar(FilePath), nil, nil, False, Create_Suspended, nil, nil, StartInfo, ProcInfo) then Exit;
  ReadProcessMemory(ProcInfo.hProcess,Pointer($4277D9),@TmpData,2,BytesRead);
  if (TmpData[0] = OldData[0]) and (TmpData[1] = OldData[1]) then
  begin
  if WriteProcessMemory(ProcInfo.hProcess, Pointer($4277D9), @NewData, 2, BytesRead)  then
   MessageBox(0,'恭喜补丁成功','系统提示',64) else  MessageBox(0,'不好意思补丁失败','系统提示',64)
  end;

  ResumeThread(ProcInfo.hThread);
  CloseHandle(ProcInfo.hProcess);
  CloseHandle(ProcInfo.hThread);
end;

end.

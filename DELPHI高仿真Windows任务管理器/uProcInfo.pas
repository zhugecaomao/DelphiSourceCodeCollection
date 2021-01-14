unit uProcInfo;

interface
uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls,DateUtils,PsAPI,Tlhelp32;
Type
  TProcessorTimeInfo = record
    IdleTime: int64;
    KernelTime: int64;
    UserTime: int64;
    DpcTime: int64;
    InterruptTime:int64;
    InterruptCount:cardinal;
  end;
  TThreadInfo = record
    ftCreationTime: TFileTime;
    dwUnknown1: DWORD;
    dwStartAddress: DWORD;
    dwOwningPID: DWORD;
    dwThreadID: DWORD;
    dwCurrentPriority: DWORD;
    dwBasePriority: DWORD;
    dwContextSwitches: DWORD;
    dwThreadState: DWORD;
    dwUnknown2: DWORD;
    dwUnknown3: DWORD;
    dwUnknown4: DWORD;
    dwUnknown5: DWORD;
    dwUnknown6: DWORD;
    dwUnknown7: DWORD;
  end;
  TProcessInfo = record
    dwOffset: DWORD;
    dwThreadCount: DWORD;
    dwUnknown1: array[0..5] of DWORD;
    ftCreationTime: TFileTime;
    ftUserTime: int64;
    ftKernelTime: int64;
  //      dwUnknown4: DWORD;
  //      dwUnknown5: DWORD;
    dwUnknown6: DWORD;
    pszProcessName: pwideChar;
    dwBasePriority: DWORD;
    dwProcessID: DWORD;
    dwParentProcessID: DWORD;
    dwHandleCount: DWORD;
    dwUnknown7: DWORD;
    dwUnknown8: DWORD;
    dwVirtualBytesPeak: DWORD;
    dwVirtualBytes: DWORD;
    dwPageFaults: DWORD;
    dwWorkingSetPeak: DWORD;
    dwWorkingSet: DWORD;
    dwUnknown9: DWORD;
    dwPagedPool: DWORD;
    dwUnknown10: DWORD;
    dwNonPagedPool: DWORD;
    dwPageFileBytesPeak: DWORD;
    dwPageFileBytes: DWORD;
    dwPrivateBytes: DWORD;
    dwUnknown11: DWORD;
    dwUnknown12: DWORD;
    dwUnknown13: DWORD;
    dwUnknown14: DWORD;
    ati: array[0..0] of TThreadInfo;
  end;
  TProcInfo=Class
  private
    FProcName:String;
    FPID:Integer;
    FMemSize:DWord;
    FCPUTime:TDateTime;
  public
    property PID:Integer Read FPID Write FPID;
    property ProcName:String Read FProcName Write FProcName;
    property MemSize:DWord Read FMemSize Write FMemSize;
    property CPUTime:TDateTime Read FCPUTime Write FCPUTime;
  end;
  TWinInfo=class
    FIcon:HICON;
    FCaption:String;
    FClsName:String;
    FHandle:THandle;
  end;
  function NtQuerySystemInformation(si_class: cardinal; si: pointer; si_length: cardinal; ret_length:cardinal):cardinal; stdcall; external 'ntdll.dll';
  function RunningProcessesList(const List: TStrings): Boolean;
  procedure GetAllWindow(List:TStrings);
  procedure KillProcess(hprocessID: HWND);
implementation

procedure KillProcess(hprocessID: HWND);
var
  processHandle:HWND;
  DWResult: DWORD;
begin
    if hprocessID <> 0 then
    begin
      { Get the process handle }
      processHandle := OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,
        False, hprocessID);
      if processHandle <> 0 then
      begin
        { Terminate the process }
        TerminateProcess(processHandle, 0);
        CloseHandle(ProcessHandle);
      end;
    end;
end;



//Get MemSize by PID
function GetProcessMemorySizeByPID(l_nProcID:HWND; var _nMemSize: Cardinal): Boolean;
var
  l_nTmpHandle: HWND;
  l_pPMC: PPROCESS_MEMORY_COUNTERS;
  l_pPMCSize: Cardinal;
begin

  l_pPMCSize := SizeOf(PROCESS_MEMORY_COUNTERS);

  GetMem(l_pPMC, l_pPMCSize);
  l_pPMC^.cb := l_pPMCSize;
  l_nTmpHandle := OpenProcess(PROCESS_ALL_ACCESS, False, l_nProcID);

  if (GetProcessMemoryInfo(l_nTmpHandle, l_pPMC, l_pPMCSize)) then
    _nMemSize := l_pPMC^.WorkingSetSize
  else
    _nMemSize := 0;
  FreeMem(l_pPMC);
  Result := True;
end;
function RunningProcessesList(const List: TStrings): Boolean;
var
  AI:TProcInfo;
  buf:array[0..299999] of char;
  pi: ^TProcessInfo;
  ti: ^TProcessorTimeInfo;
  aMemSize:DWord;
begin
  NtQuerySystemInformation(5, @buf, 300000, 0);
  pi:=@buf;
  repeat
  try
    AI := TProcInfo.Create;
    AI.PID := pi^.dwProcessID;
    AI.ProcName :=WideCharToString(pi^.pszProcessName);
    AI.FCPUTime :=  ((pi^.ftUserTime+pi^.ftKernelTime) div 10000000)/86400;
    GetProcessMemorySizeByPID(AI.PID,aMemSize);
    AI.MemSize := Round(aMemSize /1024);
    if AI.ProcName='' then
    begin
      AI.ProcName := 'System Idle';
      AI.MemSize := 16;
    end;
    List.AddObject(IntToStr(AI.PID),AI);
  except
  end;
    pi:=pointer(cardinal(pi)+pi^.dwOffset);
  until pi^.dwOffset=0;
    //获得为0时的情况
    AI := TProcInfo.Create;
    AI.PID := pi^.dwProcessID;
    AI.ProcName :=WideCharToString(pi^.pszProcessName);
    AI.FCPUTime :=  ((pi^.ftUserTime+pi^.ftKernelTime) div 10000000)/86400;
    GetProcessMemorySizeByPID(AI.PID,aMemSize);
    AI.MemSize := Round(aMemSize /1024);
    if AI.ProcName='' then
    begin
      AI.ProcName := 'System Idle';
      AI.MemSize := 16;
    end;
    List.AddObject(IntToStr(AI.PID),AI);
end;
function EnumWindowsProc(Handle: HWND; List: TStrings):boolean;stdcall;
var
  WinStyles : DWord;
  WinText:Array[0..100] of Char;
  WinClsName:Array[0..100] of Char;
  strTmp:string;
  aIcon:HICON;
  AI:TWinInfo;
begin
  Result := true;
  WinStyles := GetWindowLong(Handle, GWL_STYLE);
  If ((WinStyles and WS_VISIBLE) > 0) then 
  begin
  GetClassName(Handle,WinClsName,100);
  GetWindowText(Handle,WinText,100);
  strTmp := WinText;
  If Trim(strTmp)<>'' then
  begin
    AI := TWinInfo.Create;
    AI.FIcon := GetClassLong(Handle,GCL_HICON);
    AI.FCaption := strTmp;
    AI.FClsName := WinClsName;
    AI.FHandle := Handle;
    List.AddObject(IntToStr(Handle),AI);
  end;
  end;
end;
procedure GetAllWindow(List:TStrings);
begin
  EnumWindows(@EnumWindowsProc,integer(List));
end;
end.

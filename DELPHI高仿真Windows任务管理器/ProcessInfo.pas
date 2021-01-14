unit ProcessInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,PsAPI, TlHelp32, StdCtrls;
const
  RsSystemIdleProcess = 'System Idle Process';
  RsSystemProcess = 'System Process';
  Type
  TProcInfo=Class
  private
    FFullName:String;
    FPID:Integer;
    FMemSize:DWord;
    FCPUTime:TDateTime;
    function GetFileName:String;
  public
    property FullName:String Read FFullName Write FFullName;
    property PID:Integer Read FPID Write FPID;
    property FileName:String Read GetFileName;
    property MemSize:DWord Read FMemSize Write FMemSize;
    property CPUTime:TDateTime Read FCPUTime Write FCPUTime;
  end;
  function RunningProcessesList(const List: TStrings; FullPath: Boolean): Boolean;
  function GetProcessMemorySizeByPID(l_nProcID:HWND; var _nMemSize: Cardinal): Boolean;

implementation
function IsWinXP: Boolean;
begin
  Result := (Win32Platform = VER_PLATFORM_WIN32_NT) and
    (Win32MajorVersion = 5) and (Win32MinorVersion = 1);
end;

function IsWin2k: Boolean;
begin
  Result := (Win32MajorVersion >= 5) and
    (Win32Platform = VER_PLATFORM_WIN32_NT);
end;

function IsWinNT4: Boolean;
begin
  Result := Win32Platform = VER_PLATFORM_WIN32_NT;
  Result := Result and (Win32MajorVersion = 4);
end;

function IsWin3X: Boolean;
begin
  Result := Win32Platform = VER_PLATFORM_WIN32_NT;
  Result := Result and (Win32MajorVersion = 3) and
    ((Win32MinorVersion = 1) or (Win32MinorVersion = 5) or
    (Win32MinorVersion = 51));
end;
function AddFileTimes(KernelTime, UserTime: TFileTime): TDateTime;
var 
  SysTimeK, SysTimeU: TSystemTime;
begin 
  FileTimeToSystemTime(KernelTime, SysTimeK);
  FileTimeToSystemTime(UserTime, SysTimeU);
  Result :=SystemTimeToDateTime(SysTimeK)+SystemTimeToDateTime(SysTimeU);
end;

function GetProcCPUTime(procID:THandle): TDateTime;
var 
  CreationTime, ExitTime, KernelTime, UserTime: TFileTime;
  rt:real;
begin
  GetProcessTimes(procID, CreationTime, ExitTime, KernelTime,UserTime);
  Result := AddFileTimes(KernelTime, UserTime);
end; 
function RunningProcessesList(const List: TStrings; FullPath: Boolean): Boolean;
var
  AProcInfo:TProcInfo;
  aMemSize:DWord;
  Handle: THandle;
  function ProcessFileName(PID: DWORD): string;
  begin
    Result := '';
    Handle := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False, PID);
    if Handle <> 0 then
      try
        SetLength(Result, MAX_PATH);
        if FullPath then
        begin
          if GetModuleFileNameEx(Handle, 0, PChar(Result), MAX_PATH) > 0 then
            SetLength(Result, StrLen(PChar(Result)))
          else
            Result := '';
        end
        else
        begin
          if GetModuleBaseNameA(Handle, 0, PChar(Result), MAX_PATH) > 0 then
            SetLength(Result, StrLen(PChar(Result)))
          else
            Result := '';
        end;
      finally
        CloseHandle(Handle);
      end;
  end;

  function BuildListTH: Boolean;
  var
    SnapProcHandle: THandle;
    ProcEntry: TProcessEntry32;
    NextProc: Boolean;
    FileName: string;
  begin
    SnapProcHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    Result := (SnapProcHandle <> INVALID_HANDLE_VALUE);
    if Result then
      try
        ProcEntry.dwSize := SizeOf(ProcEntry);
        NextProc := Process32First(SnapProcHandle, ProcEntry);
        while NextProc do
        begin
          if ProcEntry.th32ProcessID = 0 then
          begin
            // PID 0 is always the "System Idle Process" but this name cannot be
            // retrieved from the system and has to be fabricated.
            FileName := RsSystemIdleProcess;
          end
          else
          begin
            if IsWin2k or IsWinXP then
            begin
              FileName := ProcessFileName(ProcEntry.th32ProcessID);
              if FileName = '' then
                FileName := ProcEntry.szExeFile;
            end
            else
            begin
              FileName := ProcEntry.szExeFile;
              if not FullPath then
                FileName := ExtractFileName(FileName);
            end;
          end;
          //get proc info
          AProcInfo := TProcInfo.Create;
          AProcInfo.FullName := FileName;
          AProcInfo.PID := ProcEntry.th32ProcessID;
          GetProcessMemorySizeByPID(AProcInfo.PID,aMemSize);
          AProcInfo.MemSize := Round(aMemSize /1024);    //get memSize
          AProcInfo.CPUTime := GetProcCPUTime(Handle);
          List.AddObject(FileName, AProcInfo);
          NextProc := Process32Next(SnapProcHandle, ProcEntry);
        end;
      finally
        CloseHandle(SnapProcHandle);
      end;
  end;

  function BuildListPS: Boolean;
  var
    PIDs: array [0..1024] of DWORD;
    Needed: DWORD;
    I: Integer;
    FileName: string;
  begin
    Result := EnumProcesses(@PIDs, SizeOf(PIDs), Needed);
    if Result then
    begin
      for I := 0 to (Needed div SizeOf(DWORD)) - 1 do
      begin
        case PIDs[I] of
          0:
            // PID 0 is always the "System Idle Process" but this name cannot be
            // retrieved from the system and has to be fabricated.
            FileName := RsSystemIdleProcess;
          2:
            // On NT 4 PID 2 is the "System Process" but this name cannot be
            // retrieved from the system and has to be fabricated.
            if IsWinNT4 then
              FileName := RsSystemProcess
            else
              FileName := ProcessFileName(PIDs[I]);
            8:
            // On Win2K PID 8 is the "System Process" but this name cannot be
            // retrieved from the system and has to be fabricated.
            if IsWin2k or IsWinXP then
              FileName := RsSystemProcess
            else
              FileName := ProcessFileName(PIDs[I]);
            else
              FileName := ProcessFileName(PIDs[I]);
        end;
        if FileName <> '' then
          List.AddObject(FileName, Pointer(PIDs[I]));
      end;
    end;
  end;
begin
  if IsWin3X or IsWinNT4 then
    Result := BuildListPS
  else
    Result := BuildListTH;
end;

function GetProcessNameFromWnd(Wnd: HWND): string;
var
  List: TStringList;
  PID: DWORD;
  I: Integer;
begin

  Result := '';
  if IsWindow(Wnd) then
  begin
    PID := INVALID_HANDLE_VALUE;
    GetWindowThreadProcessId(Wnd, @PID);
    List := TStringList.Create;
    try
      if RunningProcessesList(List, True) then
      begin
        I := List.IndexOfObject(Pointer(PID));
        if I > -1 then
          Result := List[I];
      end;
    finally
      List.Free;
    end;
  end;
end;
//get mem size
function GetProcessMemorySize(_sProcessName: string; var _nMemSize: Cardinal): Boolean;
var
  l_nWndHandle, l_nProcID, l_nTmpHandle: HWND;
  l_pPMC: PPROCESS_MEMORY_COUNTERS;
  l_pPMCSize: Cardinal;
begin
  l_nWndHandle := FindWindow(nil, PChar(_sProcessName));

  if l_nWndHandle = 0 then 
  begin
    Result := False;
    Exit;
  end;

  l_pPMCSize := SizeOf(PROCESS_MEMORY_COUNTERS);

  GetMem(l_pPMC, l_pPMCSize);
  l_pPMC^.cb := l_pPMCSize;

  GetWindowThreadProcessId(l_nWndHandle, @l_nProcID);
  l_nTmpHandle := OpenProcess(PROCESS_ALL_ACCESS, False, l_nProcID);

  if (GetProcessMemoryInfo(l_nTmpHandle, l_pPMC, l_pPMCSize)) then
    _nMemSize := l_pPMC^.WorkingSetSize
  else
    _nMemSize := 0;

  FreeMem(l_pPMC);

  Result := True;
end;
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






{ TProcInfo }

function TProcInfo.GetFileName: String;
begin
  Result := ExtractFileName(FFullName);
end;

end.

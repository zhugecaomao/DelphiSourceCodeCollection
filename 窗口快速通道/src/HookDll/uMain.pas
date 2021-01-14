unit uMain;

interface

uses
  Windows, Messages, SysUtils;

const
  MAPFILE_GNAME: PChar = 'WIN_BAR_INFO';

{$I ../Common/INCDATA.INC}
{$A-}

procedure GetDLLData(var aReceiveStruct: PReceiveStruct); stdcall; export;
procedure DLLEntryPoint(dwReason: DWord);
function SetHook(aRecHandle: THandle): BOOL; export;
function RemoveHook: BOOL; export;
function Hook(iCode: Integer; wParam: WPARAM;
  CWPRet: PCWPRetStruct): LRESULT; stdcall; export;


implementation

var
  CurHookProc: HHOOK;
  MapFileHandle: THandle;
  ReceiveStruct: PReceiveStruct;
  
{ GetDLLData will be the exported DLL function }
procedure GetDLLData(var aReceiveStruct: PReceiveStruct); stdcall;
begin
  { Point AGlobalData to the same memory address referred to by GlobalData. }
  aReceiveStruct := ReceiveStruct;
end;

procedure OpenSharedData;
var
   Size: Integer;
begin
  { Get the size of the data to be mapped. }
  Size := SizeOf(TReceiveStruct);

  { Now get a memory-mapped file object. Note the first parameter passes
    the value $FFFFFFFF or DWord(-1) so that space is allocated from the system's
    paging file. This requires that a name for the memory-mapped
    object get passed as the last parameter. }

  MapFileHandle := CreateFileMapping(DWord(-1), nil, PAGE_READWRITE, 0, Size, MAPFILE_GNAME);

  if MapFileHandle = 0 then
    RaiseLastWin32Error;
  { Now map the data to the calling process's address space and get a
    pointer to the beginning of this address }
  ReceiveStruct := MapViewOfFile(MapFileHandle, FILE_MAP_ALL_ACCESS, 0, 0, Size);
  { Initialize this data }
  if ReceiveStruct = nil then
  begin
    CloseHandle(MapFileHandle);
    RaiseLastWin32Error;
  end;
end;

procedure CloseSharedData;
{ This procedure un-maps the memory-mapped file and releases the memory-mapped
  file handle }
begin
  UnmapViewOfFile(ReceiveStruct);
  CloseHandle(MapFileHandle);
end;

procedure DLLEntryPoint(dwReason: DWord);
begin
  case dwReason of
    DLL_PROCESS_ATTACH: OpenSharedData;
    DLL_PROCESS_DETACH: CloseSharedData;
  end;
end;

function SetHook(aRecHandle: THandle): BOOL; export;
begin
  ReceiveStruct.RecHandle := aRecHandle;
  if CurHookProc = 0 then
  begin
    CurHookProc := SetWindowsHookEx(WH_CALLWNDPROCRET, @Hook, HInstance, 0);
  end;
  Result := (CurHookProc <> 0);
end;

function RemoveHook: BOOL; export;
begin
  if CurHookProc <> 0 then
  begin
    UnhookWindowshookEx(CurHookProc);
    CurHookProc := 0;
 end;
 Result := (CurHookProc = 0);
end;

function Hook(iCode: Integer; wParam: WPARAM;
  CWPRet: PCWPRetStruct): LRESULT; stdcall; export;
begin
  //在外面需要判断发生变化的窗口是否和自己有关系CWPRet.hwnd = MostRecentWindow
  if iCode = HC_ACTION then
  begin
    ReceiveStruct.CurHandle := CWPRet.hwnd;
    case CWPRet.message of
      WM_ACTIVATE://send msg to notify window change pos. change pos only cur window=active window
      begin
        if CWPRet.lResult = WA_INACTIVE then//
        begin
          SendMessage(ReceiveStruct.RecHandle, MSG_FINDWIN, 0, 0);
          //Abandon();//??不懂
          //Reposition();
        end;
      end;
      WM_WINDOWPOSCHANGED, WM_SETTEXT:
      begin
        SendMessage(ReceiveStruct.RecHandle, MSG_FINDWIN, 0, 0);//MSG_REPOSITION
        //Reposition();
      end;
      WM_CLOSE:
      begin
        SendMessage(ReceiveStruct.RecHandle, MSG_CLOSE, 0, 0);
        //Reposition();
      end;
    end;
  end;
  Result := CallNextHookEx(CurHookProc, iCode, wParam, Integer(CWPRet));
end;

end.

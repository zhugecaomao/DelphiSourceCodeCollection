library LastMsgBoxInfoLib;

uses
  Windows, Messages, APIHook in 'APIHook.pas', Toolhelp in '..\04-ProcessInfo\Toolhelp.pas';

type
  TfnMessageBoxA = function (hWnd: HWND; pszText, pszCaption: LPCSTR; uType: UINT): Integer; stdcall;
  TfnMessageBoxW = function (hWnd: HWND; pszText, pszCaption: LPCWSTR; uType: UINT): Integer; stdcall;

const
  ShareName = 'LastMsgBoxInfoLib_Shared';

var
  g_hMap: THandle = 0; // 映射文件句柄
  g_hhook: ^HHOOK = nil; // 映射内存地址
  g_MessageBoxA: TAPIHook = nil; // HOOK对象
  g_MessageBoxW: TAPIHook = nil;

  // 提交截获信息
procedure SendLastMsgBoxInfo(fUnicode: BOOL; pvCaption, pvText: Pointer; nResult: Integer);
var
  szProcessPathname: array[0..MAX_PATH] of Char;
  pszResult: LPCSTR;
  sz: array[0..2048] of Char;
  ArgList: array[1..5] of Pointer;
  cds: TCopyDataStruct;
begin
  // 进程路径
  szProcessPathname[GetModuleFileNameA(0, szProcessPathname, MAX_PATH)] := #0;

  // 返回值
  case (nResult) of
    IDOK:
      pszResult := 'Ok';
    IDCANCEL:
      pszResult := 'Cancel';
    IDABORT:
      pszResult := 'Abort';
    IDRETRY:
      pszResult := 'Retry';
    IDIGNORE:
      pszResult := 'Ignore';
    IDYES:
      pszResult := 'Yes';
    IDNO:
      pszResult := 'No';
    IDCLOSE:
      pszResult := 'Close';
    IDHELP:
      pszResult := 'Help';
    IDTRYAGAIN:
      pszResult := 'Try Again';
    IDCONTINUE:
      pszResult := 'Continue';
    else
      pszResult := '(Unknown)';
  end;

  // 格式化字串
  ArgList[1] := Pointer(GetCurrentProcessId());
  ArgList[2] := @szProcessPathname;
  ArgList[3] := pvCaption;
  ArgList[4] := pvText;
  ArgList[5] := pszResult;
  if fUnicode then
    wvsprintfA(sz, 'Process: (%d) %s'#13#10'Caption: %S'#13#10'Message: %S'#13#10'Result: %s', @ArgList)
  else
    wvsprintfA(sz, 'Process: (%d) %s'#13#10'Caption: %s'#13#10'Message: %s'#13#10'Result: %s', @ArgList);

  // 主界面显示
  cds.dwData := 0;
  cds.cbData := lstrlenA(sz) + 1;
  cds.lpData := @sz;
  SendMessage(FindWindow(nil, 'Last MessageBox Info'), WM_COPYDATA, 0, LongInt(@cds));
end;

  // MessageBoxW的替换函数
function Hook_MessageBoxW(hWnd: HWND; pszText, pszCaption: LPCWSTR; uType: UINT): Integer; stdcall;
begin
  // MessageBoxW()
  Result := TfnMessageBoxW(g_MessageBoxW.OriginProc())(hWnd, pszText, pszCaption, uType);

  // 发送截获信息
  SendLastMsgBoxInfo(TRUE, pszCaption, pszText, Result);
end;

  // MessageBoxA的替换函数
function Hook_MessageBoxA(hWnd: HWND; pszText, pszCaption: LPCSTR; uType: UINT): Integer; stdcall;
begin
  // MessageBoxA()
  Result := TfnMessageBoxA(g_MessageBoxA.OriginProc())(hWnd, pszText, pszCaption, uType);
                   
  // 发送截获信息
  SendLastMsgBoxInfo(FALSE, pszCaption, pszText, Result);
end;

  // 消息钩子回调
function GetMsgProc(code: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
begin
  // 注: 在Windows2000, 第一个参数可以是0; 在Windows98, 则必须是一个Hook句柄
  Result := CallNextHookEx(g_hhook^, code, wParam, lParam);
end;

  // 装卸消息钩子
function LastMsgBoxInfo_HookAllApps(fInstall: BOOL; dwThreadId: DWORD): BOOL; stdcall;
begin
  if (fInstall) then
  begin
    // 钩子已经安装
    if (g_hhook^ <> 0) then
    begin
      Result := FALSE;
      Exit;
    end;

    // 安装消息钩子
    g_hhook^ := SetWindowsHookEx(WH_GETMESSAGE, @GetMsgProc, HInstance, dwThreadId);
    Result := (g_hhook^ <> 0);

    // DLL进入各进程
    PostMessage(HWND_BROADCAST, WM_NULL, 0, 0);
  end else
  begin
    // 钩子还未安装
    if (g_hhook^ = 0) then
    begin
      Result := FALSE;
      Exit;
    end;

    // 卸载消息钩子
    Result := UnhookWindowsHookEx(g_hhook^);
    g_hhook^ := 0;

    // DLL退出各进程
    PostMessage(HWND_BROADCAST, WM_WININICHANGE, 0, 0);
  end;

end;

  // DLL 回调
procedure DLLMain(dwReason: DWORD);
begin
  if (dwReason = DLL_PROCESS_DETACH) then
  begin
    UnmapViewOfFile(g_hhook);
    CloseHandle(g_hMap);
    
    g_MessageBoxA.Free;
    g_MessageBoxW.Free;
    TAPIHook.HookLoadLibraryAndGetProcAddress(FALSE);
  end;
end;

exports
  LastMsgBoxInfo_HookAllApps;   

var
  vi: TOSVersionInfo;
begin
  // 设置回调
  DllProc := @DLLMain;

  // 映射内存
  g_hMap := CreateFileMapping(INVALID_HANDLE_VALUE, nil, PAGE_READWRITE, 0, SizeOf(HHOOK), ShareName);
  g_hhook := MapViewOfFile(g_hMap, FILE_MAP_ALL_ACCESS, 0, 0, 0);

  // 静态引用
  if TAPIHook.ThisModuleIsAutoLoad(HInstance, GetModuleHandle(nil)) then Exit;

  // Hook API  
  g_MessageBoxA := TAPIHook.Create(User32, 'MessageBoxA', @Hook_MessageBoxA, TRUE);
  g_MessageBoxW := TAPIHook.Create(User32, 'MessageBoxW', @Hook_MessageBoxW, TRUE);

  // 是否2000
  vi.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(vi);
  if (vi.dwPlatformId <> VER_PLATFORM_WIN32_NT) then Exit;

  TAPIHook.HookLoadLibraryAndGetProcAddress(TRUE);
end.

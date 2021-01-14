
// Module name: CmnHdr.h ->> CmnHdr.pas
// Written by: Jeffrey Richter
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

unit CmnHdr;

interface

uses Windows;

function chDIMOF(const A: array of THandle): Integer; overload;
function chDIMOF(const A: array of Char): Integer; overload;
function chDIMOF(const A: array of Byte): Integer; overload;
procedure chFAIL(const szMSG: PChar);
//procedure chASSERT(x: BOOL; const szMSG: PChar);
//procedure chVERIFY(x: BOOL; const szMSG: PChar);
procedure chMB(const szText: PChar; const szTitle: PChar = nil; uType: UINT = MB_OK);
procedure chSETDLGICONS(hWnd: HWND; idiLarge, idiSmall: HICON);
procedure chINITSTRUCT(var pStruct; nStruct: Integer; fInitSize: BOOL);
procedure chWARNIFUNICODEUNDERWIN95();

implementation

uses Messages;

  // 字符数组长度
function chDIMOF(const A: array of THandle): Integer;
begin
  Result := High(A) - Low(A) + 1;
end;

  // 字符数组长度
function chDIMOF(const A: array of Char): Integer;
begin
  Result := High(A) - Low(A) + 1;
end;

  // 字节数组长度
function chDIMOF(const A: array of Byte): Integer;
begin
  Result := High(A) - Low(A) + 1;
end;

  // 效验检测函数
procedure chFAIL(const szMSG: PChar);
begin
  MessageBox(GetActiveWindow(), szMSG, 'Assertion Failed', MB_OK or MB_ICONERROR);
  DebugBreak();
  // Halt();
end;

procedure chASSERT(x: BOOL; const szMSG: PChar);
begin
  if (x = FALSE) then chFAIL(szMSG);
  // Assert();
end;

procedure chVERIFY(x: BOOL; const szMSG: PChar);
asm
  JMP chASSERT
  // chASSERT(x, szMSG);  
end;

  // 提示对话框
procedure chMB(const szText: PChar; const szTitle: PChar = nil; uType: UINT = MB_OK);
var
  szTMP: array[0..MAX_PATH] of Char;
begin
  if (szTitle = nil) then
  begin
    GetModuleFileName(0, szTMP, chDIMOF(szTMP));
    MessageBox(GetActiveWindow(), szText, szTMP, uType)
  end else
    MessageBox(GetActiveWindow(), szText, szTitle, uType);
end;

  // 对话框图标
procedure chSETDLGICONS(hWnd: HWND; idiLarge, idiSmall: HICON);
var
  VerInfo: TOSVersionInfo;
begin
  chINITSTRUCT(VerInfo, SizeOf(VerInfo), TRUE);
  GetVersionEx(VerInfo);

  if (VerInfo.dwPlatformId = VER_PLATFORM_WIN32_NT) and
     (VerInfo.dwMajorVersion <= 3) and
     (VerInfo.dwMinorVersion <= 51) then
  begin
    SetClassLong(hWnd, GCL_HICON, LoadIcon(HInstance, MakeIntResource(idiLarge)));
  end else
  begin
    SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(idiLarge)));
    SendMessage(hwnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(idiSmall)));
  end;
end;

  // 初始化结构
procedure chINITSTRUCT(var pStruct; nStruct: Integer; fInitSize: BOOL);
begin
  ZeroMemory(@pStruct, nStruct);
  if fInitSize then PInteger(@pStruct)^ := nStruct else PInteger(@pStruct)^ := 0;
end;

  // Unicode警告
procedure chWARNIFUNICODEUNDERWIN95();
begin
{$IFDEF UNICODE}
  if (GetWindowsDirectoryW(nil, 0) <= 0) then
    MessageBoxA(0, 'This operating system doesn''t support Unicode.', nil, MB_OK);
{$ENDIF}
end;

end.

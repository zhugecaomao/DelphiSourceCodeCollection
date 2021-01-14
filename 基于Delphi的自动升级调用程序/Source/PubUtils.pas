
{*************************************************************************}
{ 单元描述: 公共杂项函数单元                                              }
{ 版    本: 1.0                                                           }
{ 修改日期: 2005-06-16                                                     }
{*************************************************************************}

unit PubUtils;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ShellApi, ShlObj, ActiveX, Registry, Dialogs;

// 字符串相关
function IsInt(const S: string): Boolean;
function IsFloat(const S: string): Boolean;
function IsEmail(const S: string): Boolean;
function PathWithSlash(const Path: string): string;
function PathWithoutSlash(const Path: string): string;
function FileExtWithDot(const FileExt: string): string;
function FileExtWithoutDot(const FileExt: string): string;
function AddNumberComma(Number: Int64): string;
function ExtractFileMainName(const FileName: string): string;
function ExtractUrlFilePath(const Url: string): string;
function ExtractUrlFileName(const Url: string): string;
function ValidateFileName(const FileName: string): string;
function GetSizeString(Bytes: Int64; const Postfix: string = ' KB'): string;
function GetPercentString(Position, Max: Int64; const Postfix: string = ' %'): string;
function RestrictStrWidth(const S: WideString; Canvas: TCanvas; Width: Integer): WideString;
function RestrictFileNameWidth(const FileName: string; MaxBytes: Integer): string;
function LikeString(Value, Pattern: WideString; CaseInsensitive: Boolean): Boolean;
procedure SplitString(S: string; Delimiter: Char; List: TStrings);
function StartWith(const Source: string; const Left: string): Boolean;
function EndWith(const Source: string; const Right: string): Boolean;

// 系统相关
function GetComputerName: string;
function GetWinUserName: string;
function GetWindowsDir: string;
function GetWinTempDir: string;
function GetWinTempFile(const PrefixStr: string = ''): string;
function GetFullFileName(const FileName: string): string;
function GetShortFileName(const FileName: string): string;
function GetLongFileName(const FileName: string): string;
function GetSpecialFolder(FolderID: Integer): string;
function GetWorkAreaRect: TRect;
function SelectDir(ParentHWnd: HWND; const Caption: string; const Root: WideString; var Path: string): Boolean;
function ExecuteFile(const FileName, Params, DefaultDir: string; ShowCmd: Integer): HWND;
function OpenURL(const URL: string): Boolean;
function OpenEmail(const Email: string): Boolean;
procedure SetStayOnTop(Form : TCustomForm; StayOnTop: Boolean);
procedure HideAppFromTaskBar;
function CheckLangChinesePR: Boolean;
function ShutdownWindows: Boolean;

// 文件相关
function GetFileSize(const FileName: string): Int64;
function GetFileDate(const FileName: string): TDateTime;
function SetFileDate(const FileName: string; CreationTime, LastWriteTime, LastAccessTime: TFileTime): Boolean;
function CopyFileToFolder(FileName, BackupFolder: string): Boolean;
function AutoRenameFileName(const FullName: string): string;
function GetTempFileAtPath(const Path: string; const PrefixStr: string = ''): string;

// 注册表相关
procedure SetAutoRunOnStartup(AutoRun, CurrentUser: Boolean; AppTitle: string = ''; AppPara: string = '');
procedure AssociateFile(const FileExt, FileKey, SoftName, FileDescription: string; Flush: Boolean = False);
procedure SaveAppPath(const CompanyName, SoftName, Version: string);
function ReadAppPath(const CompanyName, SoftName, Version: string; var Path: string): Boolean;

// 日期时间相关
function FileTimeToLocalSystemTime(FTime: TFileTime): TSystemTime;
function LocalSystemTimeToFileTime(STime: TSystemTime): TFileTime;
function GetDatePart(DateTime: TDateTime): TDate;
function GetTimePart(DateTime: TDateTime): TTime;

// 其它函数
procedure BeginWait;
procedure EndWait;
function Iif(Value: Boolean; Value1, Value2: Variant): Variant;
function Min(V1, V2: Integer): Integer;
function Max(V1, V2: Integer): Integer;
procedure Swap(var V1, V2: Integer);
function RestrictRectInScr(Rect: TRect; AllVisible: Boolean): TRect;
function GetAppSubPath(const SubFolder: string = ''): string;
function MsgBox(const Msg: string; Flags: Integer = MB_OK + MB_ICONINFORMATION): Integer;

implementation

//-----------------------------------------------------------------------------
// 描述: 判断字符串 S 是不是一个整型数字
//-----------------------------------------------------------------------------
function IsInt(const S: string): Boolean;
var
  E, R: Integer;
begin
  Val(S, R, E);
  Result := E = 0;
  E := R; // avoid hints
end;

//-----------------------------------------------------------------------------
// 描述: 判断字符串 S 是不是一个浮点型数字
//-----------------------------------------------------------------------------
function IsFloat(const S: string): boolean;
var
  V: Extended;
begin
  Result := TextToFloat(PChar(S), V, fvExtended);
end;

//-----------------------------------------------------------------------------
// 描述: 判断字符串 S 是不是一个 Email 地址
//-----------------------------------------------------------------------------
function IsEmail(const S: string): Boolean;
begin
  Result := True;
  if Pos('@', S) = 0 then Result := False;
  if Pos('.', S) = 0 then Result := False;
end;

//-----------------------------------------------------------------------------
// 描述: 补全路径字符串后面的 "\"
//-----------------------------------------------------------------------------
function PathWithSlash(const Path: string): string;
begin
  Result := Trim(Path);
  if Length(Result) > 0 then
    Result := IncludeTrailingPathDelimiter(Result);
end;

//-----------------------------------------------------------------------------
// 描述: 去掉路径字符串后面的 "\"
//-----------------------------------------------------------------------------
function PathWithoutSlash(const Path: string): string;
begin
  Result := Trim(Path);
  if Length(Result) > 0 then
    Result := ExcludeTrailingPathDelimiter(Result);
end;

//-----------------------------------------------------------------------------
// 描述: 补全文件扩展名前面的 "."
//-----------------------------------------------------------------------------
function FileExtWithDot(const FileExt: string): string;
begin
  Result := FileExt;
  if Length(Result) > 0 then
    if Copy(Result, 1, 1) <> '.' then
      Result := '.' + Result;
end;

//-----------------------------------------------------------------------------
// 描述: 去掉文件扩展名前面的 "."
//-----------------------------------------------------------------------------
function FileExtWithoutDot(const FileExt: string): string;
begin
  Result := FileExt;
  if Length(Result) > 0 then
    if Copy(Result, 1, 1) = '.' then
      Delete(Result, 1, 1);
end;

//-----------------------------------------------------------------------------
// 描述: 给数字加上分隔逗号
// 示例: 1234567 -> 1,234,567
//-----------------------------------------------------------------------------
function AddNumberComma(Number: Int64): string;
var
  Temp: Double;
begin
  Temp := Number;
  Result := Format('%.0n', [Temp]);
end;

//-----------------------------------------------------------------------------
// 描述: 取得文件名的主文件名
// 示例: "C:\test.dat" -> "test"
//-----------------------------------------------------------------------------
function ExtractFileMainName(const FileName: string): string;
var
  Ext: string;
begin
  Ext := ExtractFileExt(FileName);
  Result := ExtractFileName(FileName);
  Result := Copy(Result, 1, Length(Result) - Length(Ext));
end;

//-----------------------------------------------------------------------------
// 描述: 返回URL中的文件路径
// 示例:
//   ExtractUrlFileName('http://www.download.com/file.zip');
//   此调用将返回 'http://www.download.com/'.
//-----------------------------------------------------------------------------
function ExtractUrlFilePath(const Url: string): string;
var
  I: Integer;
begin
  I := LastDelimiter('/\:', Url);
  Result := Copy(Url, 1, I);
end;

//-----------------------------------------------------------------------------
// 描述: 返回URL中的文件名
// 示例:
//   ExtractUrlFileName('http://www.download.com/file.zip');
//   此调用将返回 'file.zip'.
//-----------------------------------------------------------------------------
function ExtractUrlFileName(const Url: string): string;
var
  I: Integer;
begin
  I := LastDelimiter('/\:', Url);
  Result := Copy(Url, I + 1, MaxInt);
end;

//-----------------------------------------------------------------------------
// 描述: 去掉文件名中不合法的字符
// 示例: "tes*t.dat?" -> "test.dat"
//-----------------------------------------------------------------------------
function ValidateFileName(const FileName: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(FileName) do
  begin
    if not (FileName[I] in ['\', '/', ':', '*', '?', '"', '<', '>', '|']) and
      not (Ord(FileName[I]) < 32) then
      Result := Result + FileName[I];
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 取得一个用来描述字节数的字符串
// 参数:
//   Bytes   - 字节数
//   Postfix - 单位后缀，缺省为 " KB"
//-----------------------------------------------------------------------------
function GetSizeString(Bytes: Int64; const Postfix: string): string;
var
  Temp: Double;
begin
  if Bytes > 0 then
  begin
    Temp := Bytes div 1024;
    if Bytes mod 1024 <> 0 then Temp := Temp + 1;
  end else
    Temp := 0;
  Result := Format('%s%s', [Format('%.0n', [Temp]), Postfix]);
end;

//-----------------------------------------------------------------------------
// 描述: 取得一个用来描述百分比的字符串
// 参数:
//   Position, Max   - 当前值 和 最大值
//   Postfix         - 后缀字符串，缺省为 " %"
//-----------------------------------------------------------------------------
function GetPercentString(Position, Max: Int64; const Postfix: string): string;
begin
  if Max > 0 then
    Result := IntToStr(Trunc((Position / Max) * 100)) + Postfix
  else
    Result := '100' + Postfix;
end;

//-----------------------------------------------------------------------------
// 描述: 缩短字符串的长度以适应显示宽度
// 参数:
//   S       - 待缩短的字符串.
//   Canvas  - 字符串所在的Canvas.
//   Width   - 最大象素宽度
// 返回:
//   缩短之后的字符串
//-----------------------------------------------------------------------------
function RestrictStrWidth(const S: WideString; Canvas: TCanvas;
  Width: Integer): WideString;
var
  Src: WideString;
begin
  Src := S;
  Result := S;
  while (Canvas.TextWidth(Result) > Width) and (Length(Result) > 0) do
  begin
    if Length(Src) > 1 then
    begin
      Delete(Src, Length(Src), 1);
      Result := Src + '...';
    end else
      Delete(Result, Length(Result), 1);
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 缩短文件名的长度以适应最大字节数限制
// 参数:
//   FileName - 待缩短的文件名(可以包含路径)
//   MaxBytes - 最大字节数
// 返回:
//   缩短之后的文件名字符串
//-----------------------------------------------------------------------------
function RestrictFileNameWidth(const FileName: string;
  MaxBytes: Integer): string;

  function GetBytes(const S: WideString): Integer;
  var
    AnsiStr: string;
  begin
    AnsiStr := S;
    Result := Length(AnsiStr);
  end;

var
  MainName, NewMainName: WideString;
  Ext: string;
  ExtLen: Integer;
begin
  if Length(FileName) <= MaxBytes then
  begin
    Result := FileName;
  end else
  begin
    Ext := ExtractFileExt(FileName);
    MainName := Copy(FileName, 1, Length(FileName) - Length(Ext));
    ExtLen := Length(Ext);

    NewMainName := MainName;
    while (GetBytes(NewMainName) + ExtLen > MaxBytes) and (Length(NewMainName) > 0) do
    begin
      if Length(MainName) > 1 then
      begin
        Delete(MainName, Length(MainName), 1);
        NewMainName := MainName + '...';
      end else
        Delete(NewMainName, Length(NewMainName), 1);
    end;

    Result := NewMainName + Ext;
    if Length(Result) > MaxBytes then
      Result := Copy(Result, 1, MaxBytes);
  end;
end;

//-----------------------------------------------------------------------------
// 描述：计算通配符表达式，支持通配符'*' 和 '?'
// 参数：
//   Value            - 母串
//   Pattern          - 子串
//   CaseInsensitive  - 是否忽略大小写
// 返回：
//   True  -  匹配
//   False -  不匹配
// 示例：
//   LikeString('abcdefg', 'abc*', True);
//-----------------------------------------------------------------------------
function LikeString(Value, Pattern: WideString; CaseInsensitive: Boolean): Boolean;
const
  MultiWildChar = '*';
  SingleWildChar = '?';

  function MatchPattern(ValueStart, PatternStart: Integer): Boolean;
  begin
    if (Pattern[PatternStart] = MultiWildChar) and (Pattern[PatternStart + 1] = #0) then
      Result := True
    else if (Value[ValueStart] = #0) and (Pattern[PatternStart] <> #0) then
      Result := False
    else if (Value[ValueStart] = #0) then
      Result := True
    else
    begin
      case Pattern[PatternStart] of
        MultiWildChar:
          begin
            if MatchPattern(ValueStart, PatternStart + 1) then
              Result := True
            else
              Result := MatchPattern(ValueStart + 1, PatternStart);
          end;
        SingleWildChar:
          Result := MatchPattern(ValueStart + 1, PatternStart + 1);
        else
          begin
            if not CaseInsensitive and (Value[ValueStart] = Pattern[PatternStart]) or
              CaseInsensitive and (UpperCase(Value[ValueStart]) = UpperCase(Pattern[PatternStart])) then
              Result := MatchPattern(ValueStart + 1, PatternStart + 1)
            else
              Result := False;
          end;
        end;
    end;
  end;

begin
  if Value = '' then Value := #0;
  if Pattern = '' then Pattern := #0;
  Result := MatchPattern(1, 1);
end;

//-----------------------------------------------------------------------------
// 描述: 分割字符串
//-----------------------------------------------------------------------------
procedure SplitString(S: string; Delimiter: Char; List: TStrings);
var
  I: Integer;
begin
  List.Clear;
  while Length(S) > 0 do
  begin
    I := Pos(Delimiter, S);
    if I > 0 then
    begin
      List.Add(Copy(S, 1, I - 1));
      Delete(S, 1, I);
    end else
    begin
      List.Add(S);
      Break;
    end;
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 判断字符串 Source 是不是以 Left 开始
//-----------------------------------------------------------------------------
function StartWith(const Source: string; const Left: string): Boolean;
var
  Start: string;
  Len: Integer;
begin
  Len := Length(Left);
  if (Source = '') or (Left = '') or (Length(Source) < Len) then
  begin
    Result := False;
  end else
  begin
    Start := Copy(Source, 1, Len);
    Result := Start = Left;
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 判断字符串 Source 是不是以 Right 结束
//-----------------------------------------------------------------------------
function EndWith(const Source: string; const Right: string): Boolean;
var
  EndStr: string;
  RightLen: Integer;
  SourceLen: Integer;
begin
  RightLen := Length(Right);
  SourceLen := Length(Source);

  if (Source = '') or (Right = '') or (SourceLen < RightLen) then
  begin
    Result := False;
  end else
  begin
    EndStr := Copy(Source, SourceLen - RightLen + 1, RightLen);
    Result := EndStr = Right;
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 取得计算机名
//-----------------------------------------------------------------------------
function GetComputerName: string;
const
  MaxSize = 256;
var
  Buffer: array[0..MaxSize-1] of Char;
  Size: Cardinal;
begin
  Size := MaxSize;
  Windows.GetComputerName(PChar(@Buffer[0]), Size);
  Result := Buffer;
end;

//-----------------------------------------------------------------------------
// 描述: 取得当前系统用户名
//-----------------------------------------------------------------------------
function GetWinUserName: string;
const
  Size = 255;
var
  Buffer: array[0..Size] of Char;
  Len: DWord;
begin
  Len := Size;
  GetUserName(Buffer, Len);
  Result := Buffer;
end;

//-----------------------------------------------------------------------------
// 描述: 取得 Windows 目录
//-----------------------------------------------------------------------------
function GetWindowsDir: string;
var
  Buffer: array[0..MAX_PATH] of Char;
begin
  GetWindowsDirectory(Buffer, MAX_PATH);
  Result := PathWithSlash(Buffer);
end;

//-----------------------------------------------------------------------------
// 描述: 取得系统临时文件目录
//-----------------------------------------------------------------------------
function GetWinTempDir: string;
const
  Size = 1024;
var
  Buffer: array[0..Size] of Char;
  LongName: string;
begin
  GetTempPath(Size, Buffer);
  Result := PathWithSlash(Buffer);
  LongName := GetLongFileName(Result);
  if Length(LongName) >= Length(Result) then
    Result := LongName;
end;

//-----------------------------------------------------------------------------
// 描述: 取得一个临时文件名(路径为系统临时目录)
// 参数:
//   PrefixStr - 文件名前缀，前三个字符有效
//-----------------------------------------------------------------------------
function GetWinTempFile(const PrefixStr: string): string;
var
  FileName: array[0..MAX_PATH] of Char;
  LongName: string;
begin
  Windows.GetTempFileName(PChar(GetWinTempDir), PChar(PrefixStr), 0, FileName);
  Result := FileName;
  LongName := GetLongFileName(Result);
  if Length(LongName) >= Length(Result) then
    Result := LongName;
end;

//-----------------------------------------------------------------------------
// 描述: 文件的全名(包含路径)
// 示例:
//   "test.dat" -> "C:\test.dat"
//   "C:\a\..\test.dat" -> "C:\test.dat"
//-----------------------------------------------------------------------------
function GetFullFileName(const FileName: string): string;
const
  Size = 1024;
var
  Buffer: array[0..Size] of Char;
  FileNamePtr: PChar;
  Len: DWord;
begin
  Len := Size;
  GetFullPathName(PChar(FileName), Len, Buffer, FileNamePtr);
  Result := Buffer;
end;

//-----------------------------------------------------------------------------
// 描述: 长文件名 -> 短文件名(8.3)
// 备注: FileName 可以是路径，也可以是文件名。
// 示例:
//   "C:\Program Files" -> "C:\PROGRA~1"
//-----------------------------------------------------------------------------
function GetShortFileName(const FileName: string): string;
const
  Size = 1024;
var
  Buffer: array[0..Size] of Char;
begin
  GetShortPathName(PChar(FileName), Buffer, Size);
  Result := Buffer;
end;

//-----------------------------------------------------------------------------
// 描述: 短文件名(8.3) -> 长文件名
// 备注: FileName 可以是路径，也可以是文件名。
// 示例:
//   "C:\PROGRA~1\COMMON~1\" -> "C:\Program Files\Common Files\"
//-----------------------------------------------------------------------------
function GetLongFileName(const FileName: string): string;
var
  Name, S: string;
  SearchRec : TSearchRec;
begin
  S := ExcludeTrailingPathDelimiter(FileName);
  if (Length(S) < 3) or (ExtractFilePath(S) = S) then
  begin
    Result := FileName;
    Exit;
  end;

  if FindFirst(S, faAnyFile, SearchRec) = 0 then
    Name := SearchRec.Name
  else
    Name := ExtractFileName(S);
  FindClose(SearchRec);

  Result := GetLongFileName(ExtractFilePath(S)) + Name;
  if Length(S) <> Length(FileName) then Result := Result + '\';
end;

//-----------------------------------------------------------------------------
// 描述: 取得特殊文件夹路径
// 参数:
//   FolderID -
//      CSIDL_DESKTOP
//      CSIDL_PROGRAMS
//      CSIDL_RECENT
//      CSIDL_SENDTO
//      CSIDL_STARTMENU
//      CSIDL_STARTUP
//      CSIDL_TEMPLATES
//      CSIDL_APPDATA
// 返回:
//   若成功，返回带最后斜线(\)的路径；
//   若失败，返回空字符串。
//-----------------------------------------------------------------------------
function GetSpecialFolder(FolderID: Integer): string;
var
  PidL: PItemIDList;
  Handle: THandle;
  LinkDir: string;
begin
  Result := '';
  Handle := Application.Handle;
  if Succeeded(SHGetSpecialFolderLocation(Handle, FolderID, PidL)) then
  begin
    SetLength(LinkDir, MAX_PATH);
    SHGetPathFromIDList(PidL, PChar(LinkDir));
    SetLength(LinkDir, StrLen(PChar(LinkDir)));
    Result := LinkDir + '\';
    if FolderID = CSIDL_APPDATA then
      Result := Result + 'Microsoft\Internet Explorer\Quick Launch\';
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 取得桌面上除任务栏以外的区域
//-----------------------------------------------------------------------------
function GetWorkAreaRect: TRect;
begin
  SystemParametersInfo(SPI_GETWORKAREA, 0, @Result, 0);
end;

//-----------------------------------------------------------------------------
// 描述: 浏览文件夹，可定位文件夹
// 参数:
//   ParentHWnd - 父窗口的句柄
//   Caption    - 浏览对话框的提示标题
//   Root       - 根目录
//   Path       - 存放用户最终选择的目录
// 返回:
//   True  - 用户点了确定
//   False - 用户点了取消
//-----------------------------------------------------------------------------
function SelectDir(ParentHWnd: HWND; const Caption: string;
  const Root: WideString; var Path: string): Boolean;
const
{$WRITEABLECONST ON}
  InitPath: string = '';
{$WRITEABLECONST OFF}
var
  WindowList: Pointer;
  BrowseInfo: TBrowseInfo;
  Buffer: PChar;
  RootItemIDList, ItemIDList: PItemIDList;
  ShellMalloc: IMalloc;
  IDesktopFolder: IShellFolder;
  Eaten, Flags: LongWord;

  function BrowseCallbackProc(hwnd: HWND; uMsg: UINT; lParam: Cardinal; lpData: Cardinal):Integer; stdcall;
  var
    R: TRect;
  begin
    if uMsg = BFFM_INITIALIZED then
    begin
      GetWindowRect(hwnd, R);
      MoveWindow(hwnd,
        (Screen.Width - (R.Right - R.Left)) div 2,
        (Screen.Height - (R.Bottom - R.Top)) div 2,
        R.Right - R.Left,
        R.Bottom - R.Top,
        True);
      Result := SendMessage(hwnd, BFFM_SETSELECTION, Ord(TRUE), Longint(PChar(InitPath)))
    end else
      Result := 1;
  end;

begin
  Result := False;
  InitPath := Path;
  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
  if (ShGetMalloc(ShellMalloc) = S_OK) and (ShellMalloc <> nil) then
  begin
    Buffer := ShellMalloc.Alloc(MAX_PATH);
    try
      RootItemIDList := nil;
      if Root <> '' then
      begin
        SHGetDesktopFolder(IDesktopFolder);
        IDesktopFolder.ParseDisplayName(Application.Handle, nil,
          POleStr(Root), Eaten, RootItemIDList, Flags);
      end;
      with BrowseInfo do
      begin
        hwndOwner := ParentHWnd;
        pidlRoot := RootItemIDList;
        pszDisplayName := Buffer;
        lpszTitle := PChar(Caption);
        ulFlags := BIF_RETURNONLYFSDIRS;
        lpfn :=@BrowseCallbackProc;
        lParam :=BFFM_INITIALIZED;
      end;
      WindowList := DisableTaskWindows(0);
      try
        ItemIDList := ShBrowseForFolder(BrowseInfo);
      finally
        EnableTaskWindows(WindowList);
      end;
      Result :=  ItemIDList <> nil;
      if Result then
      begin
        ShGetPathFromIDList(ItemIDList, Buffer);
        ShellMalloc.Free(ItemIDList);
        Path := Buffer;
      end;
    finally
      ShellMalloc.Free(Buffer);
    end;
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 用系统 Shell 调用来打开一个文件
//-----------------------------------------------------------------------------
function ExecuteFile(const FileName, Params, DefaultDir: string; ShowCmd: Integer): HWND;
begin
  Result := ShellExecute(Application.Handle, nil,
    PChar(FileName), PChar(Params), PChar(DefaultDir), ShowCmd);
end;

//-----------------------------------------------------------------------------
// 描述: 打开一个 URL
// 示例:
//   OpenURL('http://www.abc.com');
//   OpenURL('www.abc.com');
//   OpenURL('file:///c:\');
//-----------------------------------------------------------------------------
function OpenURL(const URL: string): Boolean;
begin
  Result := ShellExecute(Application.Handle, 'Open', PChar(Trim(URL)), '', '', SW_SHOW) > 32;
end;

//-----------------------------------------------------------------------------
// 描述: 打开一个 Email 发送客户端
//-----------------------------------------------------------------------------
function OpenEmail(const Email: string): Boolean;
const
  SPrefix = 'mailto:';
var
  S: string;
begin
  S := Trim(Email);
  if Pos(SPrefix, S) <> 1 then S := SPrefix + S;
  
  Result := OpenURL(S);
end;

//-----------------------------------------------------------------------------
// 描述: 让窗口保持在最上层
//-----------------------------------------------------------------------------
procedure SetStayOnTop(Form : TCustomForm; StayOnTop: Boolean);
begin
  if StayOnTop Then
    SetWindowPos(Form.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE)
  else
    SetWindowPos(Form.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE);
end;

//-----------------------------------------------------------------------------
// 描述: 隐藏应用程序在任务栏上的选择按钮
//-----------------------------------------------------------------------------
procedure HideAppFromTaskBar;
var
  ExtendedStyle : Integer;
begin
  ExtendedStyle := GetWindowLong(Application.Handle, GWL_EXSTYLE);
  SetWindowLong(Application.Handle, GWL_EXSTYLE,
    ExtendedStyle or WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
end;

//-----------------------------------------------------------------------------
// 描述: 检查当前系统语言是否简体中文
//-----------------------------------------------------------------------------
function CheckLangChinesePR: Boolean;
const
  // LCID Consts
  LangChinesePR = (SUBLANG_CHINESE_SIMPLIFIED shl 10) or LANG_CHINESE;
begin
  Result := SysLocale.DefaultLCID = LangChinesePR;
end;

//-----------------------------------------------------------------------------
// 描述: 关机
//-----------------------------------------------------------------------------
function ShutdownWindows: Boolean;
const
  SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
var
  hToken: THandle;
  tkp: TTokenPrivileges;
  tkpo: TTokenPrivileges;
  Zero: DWORD;
begin
  Result := True;
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    Zero := 0;
    if not OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken) then
    begin
      Result := False;
      Exit;
    end;
    if not LookupPrivilegeValue(nil, SE_SHUTDOWN_NAME, tkp.Privileges[0].Luid) then
    begin
      Result := False;
      Exit;
    end;
    tkp.PrivilegeCount := 1;
    tkp.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;

    AdjustTokenPrivileges(hToken, False, tkp, SizeOf(TTokenPrivileges), tkpo, Zero);
    if Boolean(GetLastError()) then
    begin
      Result := False;
      Exit;
    end else
      ExitWindowsEx(EWX_SHUTDOWN or EWX_POWEROFF, 0);
  end else
    ExitWindowsEx(EWX_SHUTDOWN or EWX_POWEROFF, 0);
end;

//-----------------------------------------------------------------------------
// 描述: 取得文件大小
//-----------------------------------------------------------------------------
function GetFileSize(const FileName: string): Int64;
var
  FileStream: TFileStream;
begin
  Result := -1;
  if not FileExists(FileName) then Exit;
  
  try
    FileStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
    try
      Result := FileStream.Size;
    finally
      FileStream.Free;
    end;
  except
    Result := 0;
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 取得文件的修改时间
//-----------------------------------------------------------------------------
function GetFileDate(const FileName: string): TDateTime;
var
  FileHandle : Integer;
begin
  FileHandle := FileOpen(FileName, fmOpenWrite or fmShareDenyNone);
  try
    if FileHandle > 0 then
      Result := FileDateToDateTime(FileGetDate(FileHandle))
    else
      Result := 0;
  finally
    FileClose(FileHandle);
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 设置文件的时间
//-----------------------------------------------------------------------------
function SetFileDate(const FileName: string;
  CreationTime, LastWriteTime, LastAccessTime: TFileTime): Boolean;
var
  FileHandle : Integer;
begin
  FileHandle := FileOpen(FileName, fmOpenWrite or fmShareDenyNone);
  try
    if FileHandle > 0 then
    begin
      SetFileTime(FileHandle, @CreationTime, @LastAccessTime, @LastWriteTime);
      Result := True;
    end else
      Result := False;
  finally
    FileClose(FileHandle);
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 复制文件到一个文件夹
//-----------------------------------------------------------------------------
function CopyFileToFolder(FileName, BackupFolder: string): Boolean;
var
  MainFileName: string;
begin
  BackupFolder := PathWithSlash(BackupFolder);
  MainFileName := ExtractFileName(FileName);
  ForceDirectories(BackupFolder);
  Result := CopyFile(PChar(FileName), PChar(BackupFolder + MainFileName), False);
end;

//-----------------------------------------------------------------------------
// 描述: 自动调整文件名，防止文件名重复
// 参数:
//   FullName - 文件的全路径名
// 示例：
//   NewName := AutoRenameFileName('C:\Downloads\test.dat');
//   如果 "C:\Downloads\" 下已经存在test.dat，则函数返回 "C:\Downloads\test(1).dat".
//-----------------------------------------------------------------------------
function AutoRenameFileName(const FullName: string): string;
const
  SLeftSym = '(';
  SRightSym = ')';

  // 若S='test(1)'，则返回'(1)'； 若S='test(a)'，则返回''。
  function GetNumberSection(const S: string): string;
  var
    I: Integer;
  begin
    Result := '';
    if Length(S) < 3 then Exit;
    if S[Length(S)] = SRightSym then
    begin
      for I := Length(S) - 2 downto 1 do
        if S[I] = SLeftSym then
        begin
          Result := Copy(S, I, MaxInt);
          Break;
        end;
    end;
    if Length(Result) > 0 then
    begin
      if not IsInt(Copy(Result, 2, Length(Result)-2)) then
        Result := '';
    end;
  end;

var
  Number: Integer;
  Name, Ext, NumSec: string;
begin
  Ext := ExtractFileExt(FullName);
  Result := FullName;
  while FileExists(Result) do
  begin
    Name := Copy(Result, 1, Length(Result) - Length(Ext));
    NumSec := GetNumberSection(Name);
    if Length(NumSec) = 0 then
    begin
      Result := Name + SLeftSym + '1' + SRightSym + Ext;
    end else
    begin
      Number := StrToInt(Copy(NumSec, 2, Length(NumSec)-2));
      Inc(Number);
      Result := Copy(Name, 1, Length(Name) - Length(NumSec)) +
        SLeftSym + IntToStr(Number) + SRightSym + Ext;
    end;
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 取得一个临时文件名
// 参数:
//   Path      - 临时文件所在路径
//   PrefixStr - 文件名前缀，前三个字符有效
//-----------------------------------------------------------------------------
function GetTempFileAtPath(const Path: string; const PrefixStr: string): string;
var
  I: Integer;
begin
  I := 1;
  while True do
  begin
    Result := PathWithSlash(Path) + Copy(PrefixStr, 1, 3) + IntToStr(I) + '.tmp';
    if FileExists(Result) then
      Inc(I)
    else
      Break;
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 设置自启动
// 参数:
//   AutoRun     - 是否自启动
//   CurrentUser - 是否只对当前用户有效
//   AppTitle    - 应用程序的标题，如 "MSN"
//   AppPara     - 自启动的命令行参数，如 "/min"
//-----------------------------------------------------------------------------
procedure SetAutoRunOnStartup(AutoRun, CurrentUser: Boolean; AppTitle, AppPara: string);
var
  R: TRegistry;
  Key, Value: string;
begin
  R := TRegistry.Create;
  try
    if CurrentUser then
      R.RootKey := HKEY_CURRENT_USER
    else
      R.RootKey := HKEY_LOCAL_MACHINE;
    Key := '\Software\Microsoft\Windows\CurrentVersion\Run\';

    if AppTitle = '' then AppTitle := Application.Title;
    Value := Application.ExeName;
    if AppPara <> '' then Value := Value + ' ' + AppPara;

    if R.OpenKey(Key, True) then
    begin
      if AutoRun then
        R.WriteString(AppTitle, Value)
      else
        R.DeleteValue(AppTitle);
    end;
  finally
    R.Free;
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 文件关联
// 参数:
//   FileExt         - 文件扩展名
//   FileKey         - 该文件类型的英文符号
//   SoftName        - 软件的名字 (用于显示在资源管理器的右键菜单上)
//   FileDescription - 文件类型的描述
//   Flush           - 是否刷新Windows缓冲
// 示例:
//   AssociateFile('.edf', 'EDiaryFile', 'EDiary', '电子日记本文件');
//-----------------------------------------------------------------------------
procedure AssociateFile(const FileExt, FileKey, SoftName, FileDescription: string;
  Flush: Boolean);
var
  R: TRegistry;
begin
  try  // Win2000下受限用户执行此操作将会报错
    R := TRegistry.Create;
    try
      R.RootKey := HKEY_CLASSES_ROOT;
      R.OpenKey('\' + FileExt, True);
      R.WriteString('', FileKey);
      R.OpenKey('\' + FileKey, True);
      R.WriteString('', FileDescription);
      R.OpenKey('\' + FileKey + '\Shell\Open\Command', True);
      R.WriteString('', Application.ExeName + ' "%1"');
      R.OpenKey('\' + FileKey + '\Shell\Open with ' + SoftName + '\Command', True);
      R.WriteString('', Application.ExeName + ' "%1"');
      R.OpenKey('\' + FileKey + '\DefaultIcon', True);
      R.WriteString('', Application.ExeName + ',0');
    finally
      R.Free;
    end;
    if Flush then SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  except
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 在注册表中记下程序路径
//-----------------------------------------------------------------------------
procedure SaveAppPath(const CompanyName, SoftName, Version: string);
const
  SPathKey = 'Path'; 
var
  R: TRegistry;
  Key: string;
begin
  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;
    Key := '\Software\' + CompanyName + '\' + SoftName + '\' + Version + '\';
    if R.OpenKey(Key, True) then
      R.WriteString(SPathKey, ExtractFilePath(Application.ExeName));
  finally
    R.Free;
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 从注册表中读取程序路径
//-----------------------------------------------------------------------------
function ReadAppPath(const CompanyName, SoftName, Version: string; var Path: string): Boolean;
const
  SPathKey = 'Path'; 
var
  R: TRegistry;
  Key: string;
begin
  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;
    Key := '\Software\' + CompanyName + '\' + SoftName + '\' + Version + '\';
    Result := R.OpenKey(Key, False);
    if Result then
      Path := R.ReadString(SPathKey);
  finally
    R.Free;
  end;
end;

//-----------------------------------------------------------------------------
// 描述: FileTime -> LocalSystemTime
//-----------------------------------------------------------------------------
function FileTimeToLocalSystemTime(FTime: TFileTime): TSystemTime;
var
  STime: TSystemTime;
begin
  FileTimeToLocalFileTime(FTime, FTime);
  FileTimeToSystemTime(FTime, STime);
  Result := STime;
end;

//-----------------------------------------------------------------------------
// 描述: LocalSystemTime -> FileTime
//-----------------------------------------------------------------------------
function LocalSystemTimeToFileTime(STime: TSystemTime): TFileTime;
var
  FTime: TFileTime;
begin
  SystemTimeToFileTime(STime, FTime);
  LocalFileTimeToFileTime(FTime, FTime);
  Result := FTime;
end;

//-----------------------------------------------------------------------------
// 描述: 返回 TDateTime 中的日期部分
//-----------------------------------------------------------------------------
function GetDatePart(DateTime: TDateTime): TDate;
begin
  Result := Trunc(DateTime);
end;

//-----------------------------------------------------------------------------
// 描述: 返回 TDateTime 中的时间部分
//-----------------------------------------------------------------------------
function GetTimePart(DateTime: TDateTime): TTime;
begin
  Result := DateTime - Trunc(DateTime);
end;

//-----------------------------------------------------------------------------
// 描述: 开始等待
//-----------------------------------------------------------------------------
procedure BeginWait;
begin
  Screen.Cursor := crHourGlass;
end;

//-----------------------------------------------------------------------------
// 描述: 停止等待
//-----------------------------------------------------------------------------
procedure EndWait;
begin
  Screen.Cursor := crDefault;
end;

//-----------------------------------------------------------------------------
// 描述: 相当于C语言中的 exp ? v1 : v2
//-----------------------------------------------------------------------------
function Iif(Value: Boolean; Value1, Value2: Variant): Variant;
begin
  if Value then Result := Value1
  else Result := Value2;
end;

//-----------------------------------------------------------------------------
// 描述: 取 V1, V2 中的最小值
//-----------------------------------------------------------------------------
function Min(V1, V2: Integer): Integer;
begin
  if V1 > V2 then Result := V2
  else Result := V1;
end;

//-----------------------------------------------------------------------------
// 描述: 取 V1, V2 中的最大值
//-----------------------------------------------------------------------------
function Max(V1, V2: Integer): Integer;
begin
  if V1 > V2 then Result := V1
  else Result := V2;
end;

//-----------------------------------------------------------------------------
// 描述: 交换 V1, V2
//-----------------------------------------------------------------------------
procedure Swap(var V1, V2: Integer);
var
  Temp: Integer;
begin
  Temp := V1;
  V1 := V2;
  V2 := Temp;
end;

//-----------------------------------------------------------------------------
// 描述: 限制矩形区域不要超出屏幕范围
// 参数:
//   Rect       - 待调整的矩形区域
//   AllVisible - 矩形区域是不是要全部可见
// 返回:
//   调整后的矩形区域 (宽、高不变)
//-----------------------------------------------------------------------------
function RestrictRectInScr(Rect: TRect; AllVisible: Boolean): TRect;
const
  Space = 100;
var
  ScrRect: TRect;
  W, H: Integer;
begin
  ScrRect := Screen.WorkAreaRect;
  W := Rect.Right - Rect.Left;
  H := Rect.Bottom - Rect.Top;

  if AllVisible then
  begin
    if W > (ScrRect.Right - ScrRect.Left) then W := (ScrRect.Right - ScrRect.Left);
    if H > (ScrRect.Bottom - ScrRect.Top) then H := (ScrRect.Bottom - ScrRect.Top);
    if Rect.Right > ScrRect.Right then
      Rect.Left := ScrRect.Right - W;
    if Rect.Bottom > ScrRect.Bottom then Rect.Top := ScrRect.Bottom - H;
    if Rect.Left < ScrRect.Left then Rect.Left := ScrRect.Left;
    if Rect.Top < ScrRect.Top then Rect.Top := ScrRect.Top;
    Rect.Right := Rect.Left + W;
    Rect.Bottom := Rect.Top + H;
  end else
  begin
    if Rect.Left >= ScrRect.Right - Space then
      Rect.Left := ScrRect.Right - Space;
    if Rect.Top >= ScrRect.Bottom - Space then
      Rect.Top := ScrRect.Bottom - Space;
    if Rect.Right <= ScrRect.Left + Space then
      Rect.Left := ScrRect.Left - (Rect.Right - Rect.Left) + Space;
    if Rect.Top < ScrRect.Top then
      Rect.Top := ScrRect.Top;
    Rect.Right := Rect.Left + W;
    Rect.Bottom := Rect.Top + H;
  end;
  Result := Rect;
end;

//-----------------------------------------------------------------------------
// 描述: 取得 Application 所在路径的子目录路径
//-----------------------------------------------------------------------------
function GetAppSubPath(const SubFolder: string): string;
begin
  Result := ExtractFilePath(Application.ExeName) + SubFolder;
  Result := PathWithSlash(Result);
end;

//-----------------------------------------------------------------------------
// 描述: 显示信息提示框
//-----------------------------------------------------------------------------
function MsgBox(const Msg: string; Flags: Integer): Integer;
begin
  Result := Application.MessageBox(PChar(Msg), PChar(Application.Title), Flags);
end;

end.

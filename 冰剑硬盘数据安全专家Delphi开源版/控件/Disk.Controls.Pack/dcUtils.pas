{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcUtils.pas - bonus routines for many purposes

  Copyright (c) 1999-2002 UtilMind Solutions
  All rights reserved.
  E-Mail: info@appcontrols.com, info@utilmind.com
  WWW: http://www.appcontrols.com, http://www.utilmind.com

  The entire contents of this file is protected by International Copyright
Laws. Unauthorized reproduction, reverse-engineering, and distribution of all
or any portion of the code contained in this file is strictly prohibited and
may result in severe civil and criminal penalties and will be prosecuted to
the maximum extent possible under the law.

*******************************************************************************}
{$I umDefines.inc}

unit dcUtils;

interface

uses Windows, Classes, Graphics;

const
  C_ROOT_DIR  = 'C:\';
  AST_DOT_AST = '*.*';

{ string routines }
{ STRING / FILENAME ROUTINES (check out Disk(App)Controls.hlp for reference) }
type
  TdcSplitStrSide = (LEFT, RIGHT);
  TdcSplitStrSides = set of TdcSplitStrSide;
procedure SplitStr(const SubStr, Str: String;
            var FirstPart, SecondPart: String;
            MainSide: TdcSplitStrSide;
            LeaveSeparatorOn: TdcSplitStrSides);
{$IFNDEF D5}
function  IncludeTrailingBackslash(const St: String): String;
function  ExcludeTrailingBackslash(const St: String): String;
{$ENDIF}
procedure SplitFileNameAndParams(var FileName, Params: String); { splits filename and params }
function  GetPureFileName(const FileName: String): String; { removes all params }
function  GetCorrectFileName(const FileName: String): String; { if file not found - trying to find it in \WINDOWS and \WINDOWS|SYSTEM directories }
function  GetCorrectDirName(const DirName: String): String;
procedure SplitSemicolons(St: String; StrList: TStringList);
procedure GetShell32Icons(IconIndex: Integer; var LargeIcon, SmallIcon: TIcon);
procedure GetDefaultIcons(var LargeIcon, SmallIcon: TIcon);

{ shell utilities routines }
function  GetSystemImageList(Size: Integer): THandle; // Size can be only 16 (16x16) or 32 (32x32)
procedure RunControlPanel(CmdShow: UINT);
procedure RunCPL(const FileName: String; CmdShow: UINT);
function  OpenWithDlg(const FileName: String): Boolean; // returns True if succeed
procedure RepaintScreen;

{ file routines }
function DirectoryExists(const Name: String): Boolean;
function ObjectExists(const Name: String): Boolean;
function IsEqualFileTime(T1, T2: TFileTime): Boolean;
{$IFNDEF D6}
procedure ForceDirectories(Dir: String);
{$ENDIF}
function IsUNCPath(const Path: String): Boolean;

{ Numerical Convertison routines}
{ converts the 32bit Integer to unisgned Extended (float) type }
function IntToExt(Int: DWord): Extended;
{ converts the two 32bit Integer to unisgned Extended (float) type }
function Int2x32ToExt(IntHi, IntLo: DWord): Extended;
{$IFDEF D4}
function Int2x32ToInt64(IntHi, IntLo: DWord): Int64;
{$ENDIF}
function UTCFileTimeToDateTime(Time: TFileTime): TDateTime;
function DateTimeToUTCFileTime(Time: TDateTime): TFileTime;
{ converts datetime value without exception }
function StrToDateTimeDef(const S: String; DefDateTime: TDateTime): TDateTime;


{ miscellaneous }
type
  TdcOSVersion = (osUnknown, os95, os95OSR2, os98, os98SE, osNT3, osNT4, os2K, osME);
  
function GetOS: TdcOSVersion;
function GetOSStr: String;
{ True when the Windows NT/2000 and False when 95/98/ME}
function IsNT: Boolean;
{ True when Windows XP or higher }
function IsXP: Boolean;
{ returns path to System directory }
function GetSystemDir: String;
{ returns path to Windows directory }
function GetWindowsDir: String;
{ returns path to Temporary directory }
function GetTempDir: String;
{ Returns file version for EXE/DLLs }
function GetFileVersion(FileName: String): DWord;

{ graphics }
function IsPictureNotEmpty(const Picture: TPicture): Boolean;
function GetTextHeight(const Canvas: TCanvas): Integer;

implementation

uses Consts, SysUtils, ShellAPI, CommCtrl;

{$IFNDEF D4}
var
  TwoDigitYearCenturyWindow: Word = 50;
{$IFNDEF D3}
  LeadBytes: set of Char = [];

type
  PDayTable = ^TDayTable;
  TDayTable = Array[1..12] of Word;

const
  MonthDays: Array[Boolean] of TDayTable =
    ((31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31),
     (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31));
     
  SCannotCreateDir = 'Unable to create directory';     
{$ENDIF}
{$ENDIF}

{$IFNDEF D3}
function AnsiLastChar(const S: string): PChar;
var
  LastByte: Integer;
begin
  LastByte := Length(S);
  if LastByte <> 0 then
    Result := @S[LastByte]
  else
    Result := nil;
end;

function IsLeapYear(const AYear: Integer): Boolean;
begin
  Result := (AYear mod 4 = 0) and ((AYear mod 100 <> 0) or (AYear mod 400 = 0));
end;
{$ENDIF}

{$IFNDEF D5}
function IncludeTrailingBackslash(const St: String): String;
begin
 if (St = '') or (St[Length(St)] <> '\') then
   Result := St + '\'
 else
   Result := St;
end;

function ExcludeTrailingBackslash(const St: String): String;
begin
  Result := St;
  while (Result <> '') and (Result[Length(Result)] = '\') do
   SetLength(Result, Length(Result) - 1);
end;
{$ENDIF}

procedure SplitStr(const SubStr, Str: String;
            var FirstPart, SecondPart: String;
            MainSide: TdcSplitStrSide;
            LeaveSeparatorOn: TdcSplitStrSides);
var
  I: Integer;
begin
  I := Pos(SubStr, Str);
  if I <> 0 then
   begin
    FirstPart := Str;
    SetLength(FirstPart, I - 1);
    inc(I, Length(SubStr));
    SecondPart := Copy(Str, I, Length(Str) - I + Length(SubStr) + 1);

    if LEFT in LeaveSeparatorOn then
      FirstPart := FirstPart + SubStr;

    if RIGHT in LeaveSeparatorOn then
      SecondPart := SubStr + SecondPart;
   end
  else { if SubStr not found }
   if MainSide = LEFT then
    begin
     FirstPart := Str;
     SecondPart := '';
    end
   else
    begin
     FirstPart := '';
     SecondPart := Str;
    end;
end;

{ splits filename and params }
procedure SplitFilenameAndParams(var FileName, Params: String);
var
  OriginalFileName,
  tmpFileName, tmpParams, StName: String;
  PosStart, PosEnd: Integer;

  procedure CheckExtension;
  begin
    if (ExtractFileExt(FileName) <> '') and 
       (ExtractFileExt(tmpFileName) = '') then
     begin
      tmpFileName := FileName;
      tmpParams := Params;
     end
    else
     begin
      FileName := tmpFileName;
      Params := tmpParams;
     end;
  end;

begin
  FileName := Trim(FileName);
  if FileName = '' then Exit;

  PosStart := Pos('"', FileName);
  if PosStart <> 0 then
    Delete(FileName, PosStart, 1);
  PosEnd := Pos('"', FileName);
  if (PosStart <> 0) and (PosEnd <> 0) then
   begin
    Delete(FileName, PosEnd, 1);

    if PosStart = 1 then
     begin
      Params := Copy(FileName, PosEnd + 1, Length(FileName) - PosEnd);
      Delete(FileName, PosEnd, Length(FileName) - PosEnd + 1);

      { delete all the left quotes }
      Params := Trim(Params);
      PosStart := Pos('"', Params);
      if PosStart <> 0 then
       begin
        Delete(Params, PosStart, 1);
        PosEnd := Pos('"', Params);
        if PosEnd <> 0 then
          Delete(Params, PosEnd, 1);
        end;
     end
    else
     begin
      Params := Copy(FileName, PosStart, Length(FileName) - PosStart + 1);
      Delete(FileName, PosStart - 1, Length(FileName) - PosStart + 2);
     end;
   end
  else { if no quotes ('"') in the string then
         splitting the string by space character }
   begin
    Params := '';
    tmpParams := '';
    OriginalFileName := FileName;

    SplitStr(' -', FileName, tmpFileName, tmpParams, LEFT, [RIGHT]);
    CheckExtension;
    if Params = '' then
      SplitStr(' /', FileName, tmpFileName, tmpParams, LEFT, [RIGHT]);
    CheckExtension;
    if tmpParams = '' then
      SplitStr(' \', FileName, tmpFileName, tmpParams, LEFT, [RIGHT]);
    CheckExtension;
    if tmpParams = '' then
      SplitStr(',', FileName, tmpFileName, tmpParams, LEFT, []);
    CheckExtension;
    if tmpParams = '' then
      SplitStr(' %', FileName, tmpFileName, tmpParams, LEFT, [RIGHT]);
    CheckExtension;

   if (UpperCase(ExtractFileExt(FileName)) = '.DLL') and
      (Pos('RUNDLL', UpperCase(FileName)) <> 0) then
    begin
     SplitStr(' ', ExtractFileName(OriginalFileName), StName, Params, LEFT, []);
     FileName := ExtractFilePath(OriginalFileName) + StName;
    end
   end;

  FileName := Trim(FileName);
  Params := Trim(Params);
end;

{ removes all params }
function GetPureFileName(const FileName: String): String;
var
  Params: String;
begin
  Result := FileName;
  SplitFileNameAndParams(Result, Params);
end;

{ if file not found - trying to find it in \WINDOWS and \WINDOWS|SYSTEM directories }
function GetCorrectFileName(const FileName: String): String;
label SecondTry;
begin
  Result := GetPureFileName(FileName);
  if (ExtractFilePath(Result) = '') and
     not FileExists(Result) then
   begin
    SecondTry:
    { trying to find program in WINDOWS\SYSTEM directory }
    if FileExists(GetSystemDir + Result) then
      Result := GetSystemDir + Result
    else
      { trying to find program in \WINDOWS directory }
      if FileExists(GetWindowsDir + Result) then
         Result := GetWindowsDir + Result
       else
        { trying to add .exe extension }
        if ExtractFileExt(Result) = '' then
         begin
          Result := Result + '.exe';
          goto SecondTry;
         end
        else
         Result := GetPureFileName(FileName);
   end;
end;

function GetCorrectDirName(const DirName: String): String;
var
  Ch: Char;
  St: String;
begin
  Result := DirName;
  { from current directory}
  if Length(Result) = 0 then
    Result := GetCurrentDir
  else
   if not IsUNCPath(Result) then
    // path without disk
    if Result[1] = '\' then
     begin
      GetDir(0, St);
      Result := St[1] + ':' + Result;
     end
    else
     // disk without path
     if (Length(Result) = 2) and (Result[2] = ':') then
      begin
       Ch := UpCase(Result[1]);
       if (Ch >= 'A') and (Ch <= 'Z') then
         GetDir(Byte(Ch) - 64{'A'}, Result);
      end;

  Result := IncludeTrailingBackslash(Result);
end;

procedure SplitSemicolons(St: String; StrList: TStringList);
label DontAdd;
var
  tmpStr: String;
  I, J: Integer;
begin
  if not Assigned(StrList) then Exit;
  StrList.Clear;

  repeat
    I := Pos(';', St);
    if I = 0 then J := Length(St)
    else J := I - 1;

    tmpStr := Copy(St, 1, J);
    Delete(St, 1, J + 1);

    { we shouln't add line if this already exists }
    J := StrList.Count;
    if J <> 0 then
     for J := 0 to J - 1 do
      if tmpStr = StrList[J] then goto DontAdd;
      
    StrList.Add(tmpStr);
    DontAdd:
  until I = 0;
end;

procedure GetShell32Icons(IconIndex: Integer; var LargeIcon, SmallIcon: TIcon);
var
  LIcon, SIcon: hIcon;
begin
  ExtractIconEx(PChar(GetSystemDir + 'SHELL32.DLL'), IconIndex, LIcon, SIcon, 1);
  LargeIcon.Handle := LIcon;
  SmallIcon.Handle := SIcon;
end;

procedure GetDefaultIcons(var LargeIcon, SmallIcon: TIcon);
begin
  GetShell32Icons(0, LargeIcon, SmallIcon);
end;


{ file routines }
function DirectoryExists(const Name: String): Boolean;
var
  Code: Integer;
begin
  Code := GetFileAttributes(PChar(Name));
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
end;

function ObjectExists(const Name: String): Boolean;
var
  Handle: THandle;
  Data: TWin32FindData;  
begin
  Handle := FindFirstFile(PChar(Name), Data);
  if Handle <> INVALID_HANDLE_VALUE then
   begin
    Windows.FindClose(Handle);
    Result := True;
   end
  else Result := False;
end;

function IsEqualFileTime(T1, T2: TFileTime): Boolean;
begin
  if (T1.dwLowDateTime = T2.dwLowDateTime) and (T1.dwHighDateTime = T2.dwHighDateTime) then
    Result := True
  else
    Result := False;
end;

{$IFNDEF D6}
procedure ForceDirectories(Dir: String);
begin
  if Length(Dir) = 0 then
    raise Exception.Create(SCannotCreateDir);
  if (AnsiLastChar(Dir) <> nil) and (AnsiLastChar(Dir)^ = '\') then
    Delete(Dir, Length(Dir), 1);
  if (Length(Dir) < 3) or DirectoryExists(Dir)
    or (ExtractFilePath(Dir) = Dir) then Exit; // avoid 'xyz:\' problem.
  ForceDirectories(ExtractFilePath(Dir));
  CreateDir(Dir);
end;
{$ENDIF}

function IsUNCPath(const Path: String): Boolean;
begin
  Result := Pos('\\?\', Path) = 1;
end;


{ shell utilities routines }
var
  OverlaysAdded: Boolean = False;

function  GetSystemImageList(Size: Integer): THandle;
const
  COMCTL32_V472 = (4 shl 16) or 72;
var
  Flag: DWord;
  ShInfo: TSHFileInfo;

  procedure AddOverlays;
  const
    SIC_SHARING_HAND = 29;
    SIC_SHORTCUT = 30;

    LR_SHARED = $8000;
  var
    h16, h32: THandle;
    hIcon: THandle;
    hShell32: THandle;
  begin
    hShell32 := Windows.LoadLibrary('shell32.dll');
    if hShell32 = 0 then Exit;
    try
      h16 := SHGetFileInfo(C_ROOT_DIR, 0, ShInfo, SizeOf(TSHFileInfo), SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
      h32 := SHGetFileInfo(C_ROOT_DIR, 0, ShInfo, SizeOf(TSHFileInfo), SHGFI_SYSICONINDEX or SHGFI_LARGEICON);
      // Have to apply the icons to both image lists simultaneously

      hicon := Windows.LoadImage(hShell32, PChar(SIC_SHARING_HAND), IMAGE_ICON, 16, 16, LR_SHARED);
      ImageList_SetOverlayImage(h16, ImageList_AddIcon(h16, hIcon), 1);
      DestroyIcon(hicon);

      hicon := Windows.LoadImage(hShell32, PChar(SIC_SHARING_HAND), IMAGE_ICON, 32, 32, LR_SHARED);
      ImageList_SetOverlayImage(h32, ImageList_AddIcon(h32, hIcon), 1);
      DestroyIcon(hicon);

      hicon := Windows.LoadImage(hShell32, PChar(SIC_SHORTCUT), IMAGE_ICON, 16, 16, LR_SHARED);
      ImageList_SetOverlayImage(h16, ImageList_AddIcon(h16, hIcon), 2);
      DestroyIcon(hicon);

      hicon := Windows.LoadImage(hShell32, PChar(SIC_SHORTCUT), IMAGE_ICON, 32, 32, LR_SHARED);      ImageList_SetOverlayImage(h32, ImageList_AddIcon(h32, hicon), 2);
      DestroyIcon(hicon);

      OverlaysAdded := True;
    finally
      if hShell32 <> 0 then FreeLibrary(hShell32);
    end;
  end;

begin
  if IsNT and (GetFileVersion('comctl32.dll') >= COMCTL32_V472) and not OverlaysAdded then
    AddOverlays;

  if Size = 32 then Flag := SHGFI_LARGEICON
  else Flag := SHGFI_SMALLICON;
  Result := SHGetFileInfo(C_ROOT_DIR, 0, ShInfo, SizeOf(TShFileInfo), SHGFI_SYSICONINDEX or Flag);
end;

procedure RunControlPanel(CmdShow: UINT);
begin
  try
    WinExec('rundll32 shell32,Control_RunDLL', CmdShow);
  except
  end;
end;

procedure RunCPL(const FileName: String; CmdShow: UINT);
begin
  try
    WinExec(PChar('rundll32 shell32,Control_RunDLL ' + FileName), CmdShow);
  except
  end;
end;

function OpenWithDlg(const FileName: String): Boolean; // returns True if succeed
begin
  try
    Result := WinExec(PChar('rundll32 shell32,OpenAs_RunDLL ' + FileName), SW_SHOWNORMAL) > 31;
  except
    Result := False;
  end;
end;

procedure RepaintScreen;
begin
  try
    WinExec('rundll32 user,repaintscreen', SW_SHOWNORMAL);
  except
  end;
end;


{ Numerical Conversion routines}
{ converts the 32bit Integer to unisgned Extended (float) type }
function IntToExt(Int: DWord): Extended;
var
  Hi, Lo: DWord;
begin
  Result := Int;
  if Int > 0 then Exit;
  Hi := Int shr 16;
  Lo := Int shl 16;
  Lo := Lo shr 16;
  Result := Hi;
  Result := Result * $10000; // shl 16
  Result := Result + Lo;
end;

{ converts the two 32bit Integer to unisgned Extended (float) type }
function Int2x32ToExt(IntHi, IntLo: DWord): Extended;
begin
  Result := IntToExt(IntHi);
  Result := Result * $10000; // shl 16
  Result := Result * $10000; // shl 16
  Result := Result + IntToExt(IntLo);
end;

{$IFDEF D4}
function Int2x32ToInt64(IntHi, IntLo: DWord): Int64;
var
  dw: Array[1..2] of DWord absolute Result;
begin
  dw[1] := IntLo;
  dw[2] := IntHi;
end;
{$ENDIF}

function UTCFileTimeToDateTime(Time: TFileTime): TDateTime;
var
  LocalFileTime: TFileTime;
  DOSFileTime: Integer;
begin
  try
    FileTimeToLocalFileTime(Time, LocalFileTime);
    if FileTimeToDosDateTime(LocalFileTime, LongRec(DOSFileTime).Hi, LongRec(DOSFileTime).Lo) then
     if DOSFileTime <> 0 then
      begin
       Result := FileDateToDateTime(DOSFileTime);
       Exit;
      end;
    Result := -1;
  except
    Result := -1;
  end;
end;

function DateTimeToUTCFileTime(Time: TDateTime): TFileTime;
var
  DOSFileTime: Integer;
begin
  try
    DOSFileTime := DateTimeToFileDate(Time);
    DOSDateTimeToFileTime(LongRec(DOSFileTime).Hi, LongRec(DOSFileTime).Lo, Result);
  except
  end;  
end;

{ converts datetime value without exception }
function StrToDateTimeDef(const S: String; DefDateTime: TDateTime): TDateTime;
type
  TDateOrder = (doMDY, doDMY, doYMD);
var
  Pos: Integer;
  Date, Time: TDateTime;
{$IFDEF VER100} // Delphi 3 only
  EraNames: Array[1..7] of String;
  EraYearOffsets: Array[1..7] of Integer;
{$ENDIF}

  procedure ScanBlanks(const S: String; var Pos: Integer);
  var
    I: Integer;
  begin
    I := Pos;
    while (I <= Length(S)) and (S[I] = ' ') do Inc(I);
    Pos := I;
  end;

  function ScanChar(const S: String; var Pos: Integer; Ch: Char): Boolean;
  begin
    Result := False;
    ScanBlanks(S, Pos);
    if (Pos <= Length(S)) and (S[Pos] = Ch) then
     begin
      Inc(Pos);
      Result := True;
     end;
  end;

  function ScanString(const S: String; var Pos: Integer;
    const Symbol: String): Boolean;
  begin
    Result := False;
    if Symbol <> '' then
     begin
      ScanBlanks(S, Pos);
      if AnsiCompareText(Symbol, Copy(S, Pos, Length(Symbol))) = 0 then
       begin
        Inc(Pos, Length(Symbol));
        Result := True;
       end;
     end;
  end;

  function ScanNumber(const S: String; var Pos: Integer;
    var Number: Word; var CharCount: Byte): Boolean;
  var
    I: Integer;
    N: Word;
  begin
    Result := False;
    CharCount := 0;
    ScanBlanks(S, Pos);
    I := Pos;
    N := 0;
    while (I <= Length(S)) and (S[I] in ['0'..'9']) and (N < 1000) do
     begin
      N := N * 10 + (Ord(S[I]) - Ord('0'));
      Inc(I);
     end;
    if I > Pos then
     begin
      CharCount := I - Pos;
      Pos := I;
      Number := N;
      Result := True;
     end;
  end;

  function IsValidDate(const Y, M, D: Word): Boolean;
  begin
    Result := (Y >= 1) and (Y <= 9999) and (M >= 1) and (M <= 12) and
      (D >= 1) and (D <= MonthDays[IsLeapYear(Y),M]);
  end;

  function IsValidTime(const Hour, Min, Sec, MSec: Word): Boolean;
  begin
    Result := (Hour < 24) and (Min < 60) and (Sec < 60) and (MSec < 1000);
  end;

  function ScanDate(const S: String; var Pos: Integer;
    var Date: TDateTime): Boolean;
  var
    DateOrder: TDateOrder;
    N1, N2, N3, Y, M, D: Word;
    L1, L2, L3, YearLen: Byte;
    EraName: String;
    EraYearOffset: Integer;
    CenturyBase: Integer;

    function GetDateOrder(const DateFormat: String): TDateOrder;
    var
      I: Integer;
    begin
      Result := doMDY;
      I := 1;
      while I <= Length(DateFormat) do
       begin
        case Chr(Ord(DateFormat[I]) and $DF) of
          'E': Result := doYMD;
          'Y': Result := doYMD;
          'M': Result := doMDY;
          'D': Result := doDMY;
          else
           Inc(I);
           Continue;
         end;
        Exit;
       end;
      Result := doMDY;
    end;

    function CurrentYear: Word;
    var
      SystemTime: TSystemTime;
    begin
      GetLocalTime(SystemTime);
      Result := SystemTime.wYear;
    end;

    function EraToYear(Year: Integer): Integer;
    begin
      {$IFDEF D3}
      if SysLocale.PriLangID = LANG_KOREAN then
       begin
        if Year <= 99 then
          Inc(Year, (CurrentYear + Abs(EraYearOffset)) div 100 * 100);
        if EraYearOffset > 0 then
          EraYearOffset := -EraYearOffset;
       end
      else
      {$ENDIF}
        Dec(EraYearOffset);
      Result := Year + EraYearOffset;
    end;

    function GetEraYearOffset(const Name: String): Integer;
    {$IFDEF D3}
    var
      I: Integer;
    {$ENDIF}  
    begin
      Result := 0;
      {$IFDEF D3}
      for I := Low(EraNames) to High(EraNames) do
       begin
        if EraNames[I] = '' then Break;
        if AnsiStrPos(PChar(EraNames[I]), PChar(Name)) <> nil then
         begin
          Result := EraYearOffsets[I];
          Exit;
         end;
       end;
      {$ENDIF}
    end;

    procedure ScanToNumber(const S: String; var Pos: Integer);
    begin
      while (Pos <= Length(S)) and not (S[Pos] in ['0'..'9']) do
       begin
        if S[Pos] in LeadBytes then Inc(Pos);
        Inc(Pos);
       end;
    end;

  begin
    Y := 0;
    M := 0;
    D := 0;
    YearLen := 0;
    Result := False;
    DateOrder := GetDateOrder(ShortDateFormat);
    EraYearOffset := 0;
    if ShortDateFormat[1] = 'g' then  // skip over prefix text
     begin
      ScanToNumber(S, Pos);
      EraName := Trim(Copy(S, 1, Pos-1));
      EraYearOffset := GetEraYearOffset(EraName);
     end
    else
     {$IFDEF D3}
     if AnsiPos('e', ShortDateFormat) > 0 then
       EraYearOffset := EraYearOffsets[1];
     {$ELSE}
      EraYearOffset := 0;
     {$ENDIF}
    if not (ScanNumber(S, Pos, N1, L1) and ScanChar(S, Pos, DateSeparator) and
      ScanNumber(S, Pos, N2, L2)) then Exit;
    if ScanChar(S, Pos, DateSeparator) then
     begin
      if not ScanNumber(S, Pos, N3, L3) then Exit;
      case DateOrder of
        doMDY: begin
                Y := N3;
                YearLen := L3;
                M := N1;
                D := N2;
               end;
        doDMY: begin
                Y := N3;
                YearLen := L3;
                M := N2;
                D := N1;
               end;
        doYMD: begin
                Y := N1;
                YearLen := L1;
                M := N2;
                D := N3;
               end;
       end;
      if EraYearOffset > 0 then
        Y := EraToYear(Y)
      else
       if YearLen <= 2 then
        begin
         CenturyBase := CurrentYear - TwoDigitYearCenturyWindow;
         Inc(Y, CenturyBase div 100 * 100);
         if (TwoDigitYearCenturyWindow > 0) and (Y < CenturyBase) then
           Inc(Y, 100);
        end;
     end
    else
     begin
      Y := CurrentYear;
      if DateOrder = doDMY then
       begin
        D := N1;
        M := N2;
       end
      else
       begin
        M := N1;
        D := N2;
       end;
     end;
    ScanChar(S, Pos, DateSeparator);
    ScanBlanks(S, Pos);
    {$IFDEF D3}
    if SysLocale.FarEast and (System.Pos('ddd', ShortDateFormat) <> 0) then
     begin     // ignore trailing text
      if ShortTimeFormat[1] in ['0'..'9'] then  // stop at time digit
        ScanToNumber(S, Pos)
      else  // stop at time prefix
       repeat
         while (Pos <= Length(S)) and (S[Pos] <> ' ') do Inc(Pos);
         ScanBlanks(S, Pos);
       until (Pos > Length(S)) or
             (AnsiCompareText(TimeAMString, Copy(S, Pos, Length(TimeAMString))) = 0) or
             (AnsiCompareText(TimePMString, Copy(S, Pos, Length(TimePMString))) = 0);
     end;
    {$ENDIF} 

    Result := IsValidDate(Y, M, D);
    if Result then Date := EncodeDate(Y, M, D);
  end;

  function ScanTime(const S: String; var Pos: Integer;
    var Time: TDateTime): Boolean;
  var
    BaseHour: Integer;
    Hour, Min, Sec: Word;
    Junk: Byte;
  begin
    Result := False;
    BaseHour := -1;
    if ScanString(S, Pos, TimeAMString) or ScanString(S, Pos, 'AM') then
      BaseHour := 0
    else if ScanString(S, Pos, TimePMString) or ScanString(S, Pos, 'PM') then
      BaseHour := 12;
    if BaseHour >= 0 then ScanBlanks(S, Pos);
    if not ScanNumber(S, Pos, Hour, Junk) then Exit;
    Min := 0;
    if ScanChar(S, Pos, TimeSeparator) then
      if not ScanNumber(S, Pos, Min, Junk) then Exit;
    Sec := 0;
    if ScanChar(S, Pos, TimeSeparator) then
      if not ScanNumber(S, Pos, Sec, Junk) then Exit;
    if BaseHour < 0 then
      if ScanString(S, Pos, TimeAMString) or ScanString(S, Pos, 'AM') then
        BaseHour := 0
      else
        if ScanString(S, Pos, TimePMString) or ScanString(S, Pos, 'PM') then
          BaseHour := 12;
    if BaseHour >= 0 then
     begin
      if (Hour = 0) or (Hour > 12) then Exit;
      if Hour = 12 then Hour := 0;
      Inc(Hour, BaseHour);
     end;
    ScanBlanks(S, Pos);

    Result := IsValidTime(Hour, Min, Sec, 0);
    if Result then Time := EncodeTime(Hour, Min, Sec, 0);
  end;

begin
  Pos := 1;
  Time := 0;
  if not ScanDate(S, Pos, Date) or not ((Pos > Length(S)) or
    ScanTime(S, Pos, Time)) then
   begin   // Try time only
    Pos := 1;
    if not ScanTime(S, Pos, Result) or (Pos <= Length(S)) then
      Result := DefDateTime;
   end
  else
   if Date >= 0 then Result := Date + Time
   else Result := Date - Time;
end;


{ miscellaneous routines }
function GetOS: TdcOSVersion;
var
  OS: TOSVersionInfo;
begin
  ZeroMemory(@OS,SizeOf(OS));
  OS.dwOSVersionInfoSize := SizeOf(OS);
  GetVersionEx(OS);
  Result := osUnknown;
  if OS.dwPlatformId = VER_PLATFORM_WIN32_NT then
   case OS.dwMajorVersion of
     3: Result := osNT3;
     4: Result := osNT4;
     5: Result := os2K;
    end
  else
   if (OS.dwMajorVersion = 4) and (OS.dwMinorVersion = 0) then
    begin
     Result := os95;
     if (Trim(OS.szCSDVersion) = 'B') then
       Result := os95OSR2;
    end
   else
    if (OS.dwMajorVersion = 4) and (OS.dwMinorVersion = 10) then
     begin
      Result := os98;
      if Trim(OS.szCSDVersion) = 'A' then
        Result := os98SE;
     end;
end;

function GetOSStr: String;
const
  TdcOSVersionStr: Array[0..8] of String = ('Unknown', 'Win95', 'Win95OSR2', 'Win98', 'Win98SE', 'WinNT3', 'WinNT4', 'Win2K', 'WinME');
begin
  Result := TdcOSVersionStr[Integer(GetOS)];
end;

{ True when the Windows 2000 or higher }
function IsNT: Boolean;
begin
  Result := GetOS in [osNT3, osNT4, os2K];  
end;

{ True if OS is Windows XP or higher }
function IsXP: Boolean;
var
  OS: TOSVersionInfo;
begin
  ZeroMemory(@OS,SizeOf(OS));
  OS.dwOSVersionInfoSize := SizeOf(OS);
  GetVersionEx(OS);
  Result := ((OS.dwMajorVersion = 5) and (OS.dwMinorVersion >= 1)) or
            (OS.dwMajorVersion > 5);
end;

{ returns path to System directory }
function GetSystemDir: String;
var
  PC: Array[0..MAX_PATH + 1] of Char;
begin
  GetSystemDirectory(PC, MAX_PATH);
  Result := IncludeTrailingBackslash(StrPas(PC));
end;

{ returns path to Windows directory }
function GetWindowsDir: String;
var
  PC: Array[0..MAX_PATH + 1] of Char;
begin
  GetWindowsDirectory(PC, MAX_PATH);
  Result := IncludeTrailingBackslash(StrPas(PC));
end;

{ returns path to Temporary directory }
function GetTempDir: String;
var
  PC: Array[0..MAX_PATH + 1] of Char;
begin
  GetTempPath(MAX_PATH, PC);
  Result := IncludeTrailingBackslash(StrPas(PC));
end;

{ Returns file version for EXE/DLLs }
function GetFileVersion(FileName: String): DWord;
var
  Handle: DWord;
  Data: Pointer;
  Size: Integer;
  FixedInfo: PVSFixedFileInfo;
begin
  Result := 0;
  FixedInfo := nil;
  Size := GetFileVersionInfoSize(PChar(FileName), Handle);
  if Size = 0 then Exit;
  GetMem(Data, Size);
  try
    if not GetFileVersionInfo(PChar(FileName), 0, Size, Data) then Exit;
    if not VerQueryValue(Data, '\', Pointer(FixedInfo), Handle) then Exit;
    with FixedInfo^ do
      Result := dwFileVersionMS or dwFileVersionMS;
  finally
    FreeMem(Data);
  end;
end;


{ graphics }
function IsPictureNotEmpty(const Picture: TPicture): Boolean;
begin
  with Picture do
   Result := Assigned(Graphic) and not Graphic.Empty;
//           and (Width > 0) and (Height > 0);
end;

function GetTextHeight(const Canvas: TCanvas): Integer;
begin
  Result := Canvas.TextHeight('Wj');
end;

end.

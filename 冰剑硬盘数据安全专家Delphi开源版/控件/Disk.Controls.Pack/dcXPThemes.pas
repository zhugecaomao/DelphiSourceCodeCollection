{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcXPThemes.pas - support of XP themes for versions lower than D7.

  Copyright (c) 1999-2003 UtilMind Solutions
  All rights reserved.
  E-Mail: info@utilmind.com
  WWW: http://www.utilmind.com, http://www.appcontrols.com

  The entire contents of this file is protected by International Copyright
Laws. Unauthorized reproduction, reverse-engineering, and distribution of all
or any portion of the code contained in this file is strictly prohibited and
may result in severe civil and criminal penalties and will be prosecuted to
the maximum extent possible under the law.

*******************************************************************************}
{$I umDefines.inc}

unit dcXPThemes;

interface

uses Windows;

type
  hTheme = THandle;

// True when Windows XP theme active
function IsThemeActive: Boolean;
// True when the theme is active for current process
function IsAppThemed: Boolean;
// True if possible to use XP theme for controls
function IsThemeEnabled: Boolean;

// WinXP Theme API
function OpenThemeData(Wnd: hWnd; pszClassList: LPCWSTR): hTheme;
function CloseThemeData(Theme: hTheme): hResult;
function DrawThemeBackground(Theme: hTheme; DC: hDC; iPartId, iStateId: Integer; const Rect: TRect; pClipRect: PRect): hResult;
function DrawThemeParentBackground(Wnd: hWnd; DC: hDC; prc: PRect): hResult;
function DrawThemeText(Theme: hTheme; DC: hDC; iPartId, iStateId: Integer; pszText: LPCWSTR; iCharCount: Integer; dwTextFlags, dwTextFlags2: DWord; const Rect: TRect): hResult;

// custom WinXP theme routines
procedure DrawThemedControl(Wnd: hWnd; DC: hDC; ClassList: LPCWSTR; iPartId, iStateId: Integer; const Rect: TRect);
procedure DrawThemedControlWithText(Wnd: hWnd; DC: hDC; ClassList: LPCWSTR; iPartId, iStateId: Integer; const Rect: TRect;
   const Text: {$IFDEF D3}WideString{$ELSE}String{$ENDIF}; TextRect: TRect; Flags, Flags2: Cardinal;
   SeparateTextRect: Boolean);

implementation

uses {$IFDEF D4} ComCtrls, {$ENDIF} dcUtils;

const
  themelib = 'uxtheme.dll'; // WinXP theme library
  ComCtlVersionIE6 = $00060000;

var
  XP, IE6: Boolean;
  ThemeDll: THandle;
  _IsThemeActive: function: BOOL; stdcall;
  _IsAppThemed: function: BOOL; stdcall;
  _OpenThemeData: function(Wnd: hWnd; pszClassList: LPCWSTR): hTheme; stdcall;
  _CloseThemeData: function(Theme: hTheme): hResult; stdcall;
  _DrawThemeBackground: function(Theme: hTheme; DC: hDC; iPartId, iStateId: Integer; const Rect: TRect; pClipRect: PRect): hResult; stdcall;
  _DrawThemeParentBackground: function(Wnd: hWnd; DC: hDC; prc: PRect): hResult; stdcall;
  _DrawThemeText: function(Theme: hTheme; DC: hDC; iPartId, iStateId: Integer; pszText: LPCWSTR; iCharCount: Integer; dwTextFlags, dwTextFlags2: DWord; const pRect: TRect): hResult; stdcall;

function InitTheme: Boolean;
begin
  if XP and (ThemeDll = 0) then
   begin
    ThemeDll := LoadLibrary(themelib);
    _IsThemeActive := GetProcAddress(ThemeDll, 'IsThemeActive');
    _IsAppThemed := GetProcAddress(ThemeDll, 'IsAppThemed');
    _OpenThemeData := GetProcAddress(ThemeDll, 'OpenThemeData');
    _CloseThemeData := GetProcAddress(ThemeDll, 'CloseThemeData');
    _DrawThemeBackground := GetProcAddress(ThemeDll, 'DrawThemeBackground');
    _DrawThemeParentBackground := GetProcAddress(ThemeDll, 'DrawThemeParentBackground');
    _DrawThemeText := GetProcAddress(ThemeDll, 'DrawThemeText');
   end;

  Result := ThemeDll > 0;
end;

// True when Windows XP theme active
function IsThemeActive: Boolean;
begin
  if InitTheme and (@_IsThemeActive <> nil) then
    Result := _IsThemeActive
  else
    Result := False;
end;

// True when the theme is active for current process
function IsAppThemed: Boolean;
begin
  if InitTheme and (@_IsAppThemed <> nil) then
    Result := _IsAppThemed
  else
    Result := False;
end;

// True if possible to use XP theme for controls
function IsThemeEnabled: Boolean;
begin
  Result := IE6 and IsThemeActive and IsAppThemed;
end;

function OpenThemeData(Wnd: hWnd; pszClassList: LPCWSTR): hTheme;
begin
  if InitTheme and (@_OpenThemeData <> nil) then
    Result := _OpenThemeData(Wnd, pszClassList)
  else
    Result := 0;
end;

function CloseThemeData(Theme: hTheme): hResult;
begin
  if InitTheme and (@_OpenThemeData <> nil) then
    Result := _CloseThemeData(Theme)
  else
    Result := 0;
end;

function DrawThemeBackground(Theme: hTheme; DC: hDC; iPartId, iStateId: Integer; const Rect: TRect; pClipRect: PRect): hResult;
begin
  if InitTheme and (@_DrawThemeBackground <> nil) then
    Result := _DrawThemeBackground(Theme, DC, iPartId, iStateId, Rect, pClipRect)
  else
    Result := 0;
end;

function DrawThemeParentBackground(Wnd: hWnd; DC: hDC; prc: PRect): hResult;
begin
  if InitTheme and (@_DrawThemeParentBackground <> nil) then
    Result := _DrawThemeParentBackground(Wnd, DC, prc)
  else
    Result := 0;
end;

function DrawThemeText(Theme: hTheme; DC: hDC; iPartId, iStateId: Integer; pszText: LPCWSTR; iCharCount: Integer; dwTextFlags, dwTextFlags2: DWord; const Rect: TRect): hResult;
begin
  if InitTheme and (@_DrawThemeText <> nil) then
    Result := _DrawThemeText(Theme, DC, iPartId, iStateId, pszText, iCharCount, dwTextFlags, dwTextFlags2, Rect)
  else
    Result := 0;
end;

// custom WinXP theme routines
procedure DrawThemedControl(Wnd: hWnd; DC: hDC; ClassList: LPCWSTR; iPartId, iStateId: Integer; const Rect: TRect);
var
  Theme: hTheme;
begin
  Theme := OpenThemeData(Wnd, ClassList);
  if Theme <> 0 then
   begin
    DrawThemeParentBackground(Wnd, DC, @Rect);
    DrawThemeBackground(Theme, DC, iPartId, iStateId, Rect, nil);
    CloseThemeData(Theme);
   end;
end;

procedure DrawThemedControlWithText(Wnd: hWnd; DC: hDC; ClassList: LPCWSTR; iPartId, iStateId: Integer; const Rect: TRect;
   const Text: {$IFDEF D3}WideString{$ELSE}String{$ENDIF}; TextRect: TRect; Flags, Flags2: Cardinal;
   SeparateTextRect: Boolean);
var
  Theme: hTheme;
{$IFNDEF D3}
  WStr: Array[0..MAX_PATH - 1] of WideChar;
{$ENDIF}
begin
  Theme := OpenThemeData(Wnd, ClassList);
  if Theme <> 0 then
   begin
    if SeparateTextRect then
     with TextRect do
      ExcludeClipRect(DC, Left, Top, Right, Bottom);

    DrawThemeParentBackground(Wnd, DC, @Rect);
    DrawThemeBackground(Theme, DC, iPartId, iStateId, Rect, nil);

    if SeparateTextRect then
      SelectClipRgn(DC, 0);
      
    if Text <> '' then
     begin
      if SeparateTextRect then
        SelectClipRgn(DC, 0);
{$IFNDEF D3}
      MultiByteToWideChar(CP_ACP, 0, PChar(Text), -1, WStr, MAX_PATH);
      DrawThemeText(Theme, DC, iPartId, iStateId, WStr, Length(Text), Flags, Flags2, TextRect);
{$ELSE}
      DrawThemeText(Theme, DC, iPartId, iStateId, PWideChar(Text), Length(Text), Flags, Flags2, TextRect);
{$ENDIF}
     end;
    CloseThemeData(Theme);
   end;
end;

{$IFNDEF D4}
const
  ComCtlDllName = 'comctl32.dll';
  
var
  ComCtlVersion: Integer;
  
function GetComCtlVersion: Integer;
var
  FileName: string;
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  FI: PVSFixedFileInfo;
  VerSize: DWORD;
begin
  if ComCtlVersion = 0 then
  begin
    FileName := ComCtlDllName;
    InfoSize := GetFileVersionInfoSize(PChar(FileName), Wnd);
    if InfoSize <> 0 then
    begin
      GetMem(VerBuf, InfoSize);
      try
        if GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf) then
          if VerQueryValue(VerBuf, '\', Pointer(FI), VerSize) then
            ComCtlVersion := FI.dwFileVersionMS;
      finally
        FreeMem(VerBuf);
      end;
    end;
  end;
  Result := ComCtlVersion;
end;
{$ENDIF}

initialization
  XP := IsXP;
  IE6 := GetComCtlVersion >= ComCtlVersionIE6;

finalization
  if ThemeDll <> 0 then
    FreeLibrary(ThemeDll);

end.

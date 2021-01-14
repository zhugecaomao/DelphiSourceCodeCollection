{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcShellLink.pas - dcShellLink component

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

unit dcShellLink;

interface

uses
  Windows, Classes, Controls, Graphics,
  dcInternal {$IFNDEF D4}, Menus {$ENDIF};

type
  TdcShellLinkRunAs = (raNormal, raMinimized, raMaximized);
  TdcShellLink = class(TumdcComponent)
  private
    FFileName: String;
    FHotKey: TShortCut;
    FIconLocation: String;
    FIconIndex: Integer;
    FLinkTarget: String;
    FParameters: String;
    FShortDescription: String;
    FWorkingDirectory: String;
    FRunAs: TdcShellLinkRunAs;

    FLargeIcon: TIcon;
    FSmallIcon: TIcon;

    procedure SetFileName(const Value: String);
    procedure SetIcon(Value: TIcon);
  protected
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    function SaveToFile(const FileName: String): Boolean;
    function LoadFromFile(const FileName: String): Boolean;
  published
    property About;

    property FILENAME: String read FFileName write SetFileName stored False;
    property HotKey: TShortCut read FHotKey write FHotKey stored False;
    property IconLocation: String read FIconLocation write FIconLocation stored False;
    property IconIndex: Integer read FIconIndex write FIconIndex stored False;
    property LinkTarget: String read FLinkTarget write FLinkTarget stored False;
    property Parameters: String read FParameters write FParameters stored False;
    property ShortDescription: String read FShortDescription write FShortDescription stored False;
    property WorkingDirectory: String read FWorkingDirectory write FWorkingDirectory stored False;
    property RunAs: TdcShellLinkRunAs read FRunAs write FRunAs stored False;

    property LargeIcon: TIcon read FLargeIcon write SetIcon stored False;
    property SmallIcon: TIcon read FSmallIcon write SetIcon stored False;
  end;

function ShortCutToHotKey(ShortCut: TShortCut): Word;
function HotKeyToShortCut(HotKey: Word): TShortCut;

implementation

uses SysUtils, ShellAPI, ShlObj, ComObj, ActiveX;

const
  SHIFT_VALUE  = 256;
  CTRL_VALUE   = 512;
  ALT_VALUE    = 1024;

{ internal routines }
function ShortCutToHotKey(ShortCut: TShortCut): Word;
begin
  Result := ShortCut and not (scShift + scCtrl + scAlt);
  if ShortCut and scShift <> 0 then Inc(Result, SHIFT_VALUE);
  if ShortCut and scCtrl <> 0 then Inc(Result, CTRL_VALUE);
  if ShortCut and scAlt <> 0 then Inc(Result, ALT_VALUE);
end;

function HotKeyToShortCut(HotKey: Word): TShortCut;
begin
  Result := HotKey and not (SHIFT_VALUE + CTRL_VALUE + ALT_VALUE);
  if HotKey and SHIFT_VALUE <> 0 then Inc(Result, scShift);
  if HotKey and CTRL_VALUE <> 0 then Inc(Result, scCtrl);
  if HotKey and ALT_VALUE <> 0 then Inc(Result, scAlt);
end;


{ TdcShellLink }
constructor TdcShellLink.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FLargeIcon := TIcon.Create;
  FSmallIcon := TIcon.Create;
end;

destructor TdcShellLink.Destroy;
begin
  FSmallIcon.Free;
  FLargeIcon.Free;

  inherited Destroy;
end;

function TdcShellLink.SaveToFile(const FileName: String): Boolean;
var
  I: Integer;
  WStr: WideString;  
  ShellObject: IUnknown;
  ShellLink: IShellLink;
  PersistFile: IPersistFile;
begin
  Result := False;

  // creating link file
  ShellObject := CreateComObject(CLSID_ShellLink);
  ShellLink := ShellObject as IShellLink;
  PersistFile := ShellObject as IPersistFile;

  with ShellLink do
   begin
    if SetPath(PChar(FLinkTarget)) <> NOERROR then Exit;
    if SetArguments(PChar(FParameters)) <> NOERROR then Exit;
    if SetWorkingDirectory(PChar(WorkingDirectory)) <> NOERROR then Exit;
    case FRunAs of
      raMaximized: I := SW_SHOWMAXIMIZED;
      raMinimized: I := SW_SHOWMINNOACTIVE;
      else I := SW_SHOWNORMAL;
    end;
    if SetShowCmd(I) <> NOERROR then Exit;
    if SetHotKey(ShortCutToHotKey(FHotKey)) <> NOERROR then Exit;
    if SetDescription(PChar(FShortDescription)) <> NOERROR then Exit;    
    if SetIconLocation(PChar(FIconLocation), FIconIndex) <> NOERROR then Exit;
   end;

  // and finally saving the link
  WStr := FileName;
  if PersistFile.Save(PWChar(WStr), False) <> S_OK then Exit;
  Result := True;
end;

function TdcShellLink.LoadFromFile(const FileName: String): Boolean;
var
  I: Integer;
  W: Word;
  WStr: WideString;
  LIcon, SIcon: hIcon;
  ShellObject: IUnknown;
  ShellLink: IShellLink;
  PersistFile: IPersistFile;
  fd: TWin32FindData;
  ShInfo: TSHFileInfo;
  PC: Array[0..MAX_PATH] of Char;
begin
  Result := False;

  FHotKey := 0;
  FLinkTarget := '';
  FParameters := '';
  FRunAs := raNormal;
  FWorkingDirectory := '';
  FIconIndex := 0;
  FIconLocation := '';
  FShortDescription := '';
  FLargeIcon.Assign(nil);
  FSmallIcon.Assign(nil);

  if not FileExists(FileName) then Exit;

  ShellObject := CreateComObject(CLSID_ShellLink);
  ShellLink := ShellObject as IShellLink;
  PersistFile := ShellObject as IPersistFile;

  WStr := FileName;
  if PersistFile.Load(PWChar(WStr), STGM_READ) <> S_OK then Exit;

  with ShellLink do
   begin
    if GetPath(PC, MAX_PATH, fd, 0) <> NOERROR then Exit;
    FLinkTarget := StrPas(PC);
    if GetArguments(PC, MAX_PATH) <> NOERROR then Exit;
    FParameters := StrPas(PC);
    if GetWorkingDirectory(PC, MAX_PATH) <> NOERROR then Exit;
    FWorkingDirectory := StrPas(PC);
    if GetShowCmd(I) <> NOERROR then Exit;
    case I of
      SW_SHOWMAXIMIZED: FRunAs := raMaximized;
      SW_SHOWMINNOACTIVE: FRunAs := raMinimized;
      else FRunAs := raNormal;
     end;

    if GetHotKey(W) <> NOERROR then Exit;
    FHotKey := HotKeyToShortCut(W);

    if GetDescription(PC, MAX_PATH) <> NOERROR then Exit;
    FShortDescription := StrPas(PC);

    if GetIconLocation(PC, MAX_PATH, FIconIndex) <> NOERROR then Exit;
    FIconLocation := StrPas(PC);

    { extracting icons } 
    if FIconLocation = '' then
     begin
      ShGetFileInfo(PChar(FLinkTarget), 0, ShInfo, SizeOf(TShFileInfo), SHGFI_ICON or SHGFI_LargeICON);
      FLargeIcon.Handle := ShInfo.hIcon;
      ShGetFileInfo(PChar(FLinkTarget), 0, ShInfo, SizeOf(TShFileInfo), SHGFI_ICON or SHGFI_SmallICON);
      FSmallIcon.Handle := ShInfo.hIcon;
     end
    else
     begin
      ExtractIconEx(PChar(FIconLocation), FIconIndex, LIcon, SIcon, 1);
      FLargeIcon.Handle := LIcon;
      FSmallIcon.Handle := SIcon;
     end; 
   end;
  Result := True;
end;

procedure TdcShellLink.SetFileName(const Value: String);
begin
  if (FFileName = Value) and (Value = '') then Exit;
  FFileName := Value;
  LoadFromFile(FFileName);
end;

procedure TdcShellLink.SetIcon(Value: TIcon);
begin
end;

end.

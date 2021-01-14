{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcFileInfo.pas - dcFileInfo component

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

unit dcFileInfo;

interface

uses
  Windows, Classes, Controls, Graphics,
  dcInternal;

type
  TdcFileInfoAttributes = set of (fiaArchive, fiaHidden, fiaReadOnly, fiaSystem, fiaDirectory, fiaTemporary, fiaCompressed, fiaOffline);
  TdcFileInfo = class(TumdcComponent)
  private
    FDisplayName: String;
    FFileAttributes: TdcFileInfoAttributes;
    FFileName: String;
    FFileType: String;
    FFileSize: TdcFileSize;
    FLargeIcon,
    FSmallIcon: TIcon;
    FSysImageIndex: Integer;
    FTimeCreated,
    FTimeLastAccessed,
    FTimeLastModified: TDateTime;

    procedure SetFileName(Value: String);
    procedure SetFileAttributes(Value: TdcFileInfoAttributes);
    procedure SetTimeCreated(Value: TDateTime);
    procedure SetTimeLastAccessed(Value: TDateTime);
    procedure SetTimeLastModified(Value: TDateTime);
    procedure SetNoneStr(const Value: String);
    procedure SetNoneFileSize(Value: TdcFileSize);
    procedure SetNoneInt(Value: Integer);
    procedure SetNoneIcon(Value: TIcon);
  protected
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    function Execute: Boolean; virtual; // False if file not found
  published
    property About;

    property DisplayName: String read FDisplayName write SetNoneStr stored False;
    property FileAttributes: TdcFileInfoAttributes read FFileAttributes write SetFileAttributes stored False;
    property FILENAME: String read FFileName write SetFileName stored False;
    property FileType: String read FFileType write SetNoneStr stored False;
    property FileSize: TdcFileSize read FFileSize write SetNoneFileSize stored False;
    property LargeIcon: TIcon read FLargeIcon write SetNoneIcon stored False;
    property SmallIcon: TIcon read FSmallIcon write SetNoneIcon stored False;
    property SysImageIndex: Integer read FSysImageIndex write SetNoneInt stored False;
    property TimeCreated: TDateTime read FTimeCreated write SetTimeCreated stored False;
    property TimeLastAccessed: TDateTime read FTimeLastAccessed write SetTimeLastAccessed stored False;
    property TimeLastModified: TDateTime read FTimeLastModified write SetTimeLastModified stored False;
  end;

{ bonus routines }  
function GetFileTimes(const FileName: String; var Created, Accessed, Modified: TDateTime): Boolean;
function SetFileTimes(const FileName: String; const Created, Accessed, Modified: TDateTime): Boolean;

implementation

uses SysUtils, ShellAPI, dcUtils;

{$IFNDEF D3}
const
  FILE_ATTRIBUTE_COMPRESSED = $00000800;
  FILE_ATTRIBUTE_OFFLINE    = $00001000;
{$ENDIF}

function GetFileTimes(const FileName: String; var Created, Accessed, Modified: TDateTime): Boolean;
var
  FileHandle: hFile;
  FTCreation, FTAccess, FTWrite: TFileTime;
begin
  Result := False;
  FileHandle := CreateFile(PChar(FileName), 0, FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
                        OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if FileHandle <> INVALID_HANDLE_VALUE then
   begin
    Result := GetFileTime(FileHandle, @FTCreation, @FTAccess, @FTWrite);
    CloseHandle(FileHandle);

    Created := UTCFileTimeToDateTime(FTCreation);
    Accessed := UTCFileTimeToDateTime(FTAccess);
    Modified := UTCFileTimeToDateTime(FTWrite);
   end;
end;

function SetFileTimes(const FileName: String; const Created, Accessed, Modified: TDateTime): Boolean;
var
  FileHandle: hFile;
  FTCreation, FTAccess, FTWrite: TFileTime;  
begin
  Result := False;
  FileHandle := CreateFile(PChar(FileName), GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
                        OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if FileHandle <> INVALID_HANDLE_VALUE then
   begin
    GetFileTime(FileHandle, @FTCreation, @FTAccess, @FTWrite);

    if Created <> -1 then
      FTCreation := DateTimeToUTCFileTime(Created);
    if Accessed <> -1 then
      FTAccess := DateTimeToUTCFileTime(Accessed);
    if Modified <> -1 then
      FTWrite := DateTimeToUTCFileTime(Modified);

    Result := SetFileTime(FileHandle, @FTCreation, @FTAccess, @FTWrite);
    
    CloseHandle(FileHandle);
   end;
end;


constructor TdcFileInfo.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FLargeIcon := TIcon.Create;
  FSmallIcon := TIcon.Create;
end;

destructor TdcFileInfo.Destroy;
begin
  FSmallIcon.Free;
  FLargeIcon.Free;

  inherited Destroy;
end;

function TdcFileInfo.Execute: Boolean;
var
  FindHandle: THandle;
  FindData: TWin32FindData;
  ShInfo: TShFileInfo;
begin
  Result := False;

  FDisplayName := '';
  FFileType := '';
  FFileSize := 0;
  FSysImageIndex := 0;
  FTimeCreated := 0;
  FTimeLastAccessed := 0;
  FTimeLastModified := 0;
  FFileAttributes := [];

  if FFileName <> '' then
   begin
    FindHandle := FindFirstFile(PChar(FFileName), FindData);
    if FindHandle <> INVALID_HANDLE_VALUE then
     with FindData do
      begin
       Windows.FindClose(FindHandle);
       // SIZE
       {$IFNDEF D4}
       FFileSize := Int2x32ToExt(nFileSizeHigh, nFileSizeLow);
       {$ELSE}
       FFileSize := Int2x32ToInt64(nFileSizeHigh, nFileSizeLow);
       {$ENDIF}

       // ATTRIBUTES
       if (dwFileAttributes and FILE_ATTRIBUTE_ARCHIVE = FILE_ATTRIBUTE_ARCHIVE) then
         FFileAttributes := FFileAttributes + [fiaArchive];
       if (dwFileAttributes and FILE_ATTRIBUTE_HIDDEN = FILE_ATTRIBUTE_HIDDEN) then
         FFileAttributes := FFileAttributes + [fiaHidden];
       if (dwFileAttributes and FILE_ATTRIBUTE_READONLY = FILE_ATTRIBUTE_READONLY) then
         FFileAttributes := FFileAttributes + [fiaReadOnly];
       if (dwFileAttributes and FILE_ATTRIBUTE_SYSTEM = FILE_ATTRIBUTE_SYSTEM) then
         FFileAttributes := FFileAttributes + [fiaSystem];
       if (dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY = FILE_ATTRIBUTE_DIRECTORY) then
         FFileAttributes := FFileAttributes + [fiaDirectory];
       if (dwFileAttributes and FILE_ATTRIBUTE_TEMPORARY = FILE_ATTRIBUTE_TEMPORARY) then
         FFileAttributes := FFileAttributes + [fiaTemporary];
       if (dwFileAttributes and FILE_ATTRIBUTE_COMPRESSED = FILE_ATTRIBUTE_COMPRESSED) then
         FFileAttributes := FFileAttributes + [fiaCompressed];
       if (dwFileAttributes and FILE_ATTRIBUTE_OFFLINE = FILE_ATTRIBUTE_OFFLINE) then
         FFileAttributes := FFileAttributes + [fiaOffline];

       // TIME
       FTimeCreated := UTCFileTimeToDateTime(ftCreationTime);
       FTimeLastAccessed := UTCFileTimeToDateTime(ftLastAccessTime);
       FTimeLastModified := UTCFileTimeToDateTime(ftLastWriteTime);

       // ICONS & MISCELLANEOUS SHELL INFO
       ShGetFileInfo(PChar(FFileName), 0, ShInfo, SizeOf(TShFileInfo), SHGFI_ICON or SHGFI_LargeICON);
       LargeIcon.Handle := ShInfo.hIcon;
       ShGetFileInfo(PChar(FFileName), 0, ShInfo, SizeOf(TShFileInfo), SHGFI_ICON or SHGFI_SmallICON or SHGFI_TYPENAME or SHGFI_DISPLAYNAME or SHGFI_SYSICONINDEX);
       SmallIcon.Handle := ShInfo.hIcon;

       FDisplayName := ShInfo.szDisplayName;
       FFileType := ShInfo.szTypeName;
       FSysImageIndex := ShInfo.iIcon;
       Result := True;
      end
    else
      // if file not found - showing default MS icon
      GetShell32Icons(0, FLargeIcon, FSmallIcon)
   end   
  else
   begin
    FLargeIcon.Assign(nil);
    FSmallIcon.Assign(nil);
   end;
end;

procedure TdcFileInfo.SetFileName(Value: String);
begin
  Value := GetCorrectFileName(Value);

  if FFileName <> Value then
   begin
    FFileName := Value;
    Execute;
   end;
end;

procedure TdcFileInfo.SetFileAttributes(Value: TdcFileInfoAttributes);
var
  Attr: DWord;
begin
  if (FFileName <> '') and (FFileAttributes <> Value) then
   begin
    Attr := 0;
    if fiaArchive in Value then inc(Attr, FILE_ATTRIBUTE_ARCHIVE);
    if fiaHidden in Value then inc(Attr, FILE_ATTRIBUTE_HIDDEN);
    if fiaReadOnly in Value then inc(Attr, FILE_ATTRIBUTE_READONLY);
    if fiaSystem in Value then inc(Attr, FILE_ATTRIBUTE_SYSTEM);
    if fiaTemporary in Value then inc(Attr, FILE_ATTRIBUTE_TEMPORARY);
    if fiaOffline in Value then inc(Attr, FILE_ATTRIBUTE_OFFLINE);

    if Windows.SetFileAttributes(PChar(FFileName), Attr) then
      Execute;
   end;
end;

procedure TdcFileInfo.SetTimeCreated(Value: TDateTime);
begin
  if (FFileName <> '') and (FTimeCreated <> Value) then
   if SetFileTimes(FFileName, Value, -1, -1) then
     FTimeCreated := Value;
end;

procedure TdcFileInfo.SetTimeLastAccessed(Value: TDateTime);
begin
  if (FFileName <> '') and (FTimeLastAccessed <> Value) then
   if SetFileTimes(FFileName, -1, Value, -1) then
     FTimeLastAccessed := Value;
end;

procedure TdcFileInfo.SetTimeLastModified(Value: TDateTime);
begin
  if (FFileName <> '') and (FTimeLastModified <> Value) then
   if SetFileTimes(FFileName, -1, -1, Value) then
     FTimeLastModified := Value;
end;

procedure TdcFileInfo.SetNoneStr(const Value: String); begin {} end;
procedure TdcFileInfo.SetNoneFileSize(Value: TdcFileSize); begin {} end;
procedure TdcFileInfo.SetNoneInt(Value: Integer); begin {} end;
procedure TdcFileInfo.SetNoneIcon(Value: TIcon); begin {} end;

end.
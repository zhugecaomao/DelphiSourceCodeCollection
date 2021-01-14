{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcShellIcon.pas - dcShellIcon component

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

unit dcShellIcon;

interface

uses
  Windows, Classes, Controls, Graphics,
  dcInternal;

type
  TdcShellIconOption = (ioDereferenceShellLinks, ioLinkOverlay, ioOpen, ioSelected);
  TdcShellIconOptions = set of TdcShellIconOption;

  TdcShellIcon = class(TumdcComponent)
  private
    FDisplayName: String;
    FFileName: String;
    FFileType: String;
    FOptions: TdcShellIconOptions;
    FLargeIcon: TIcon;
    FSmallIcon: TIcon;
    FSysImageIndex: Integer;

    procedure SetFileName(Value: String);
    procedure SetIcon(Value: TIcon);
    procedure SetNoneStr(const Value: String);
    procedure SetNoneInt(Value: Integer);
    procedure SetOptions(Value: TdcShellIconOptions);

    procedure ExtractIcons;
  protected
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property About;

    property DisplayName: String read FDisplayName write SetNoneStr stored False;
    property FileName: String read FFileName write SetFileName stored False;
    property FileType: String read FFileType write SetNoneStr stored False;
    property Options: TdcShellIconOptions read FOptions write SetOptions default [];
    property LargeIcon: TIcon read FLargeIcon write SetIcon stored False;
    property SmallIcon: TIcon read FSmallIcon write SetIcon stored False;
    property SysImageIndex: Integer read FSysImageIndex write SetNoneInt stored False;    
  end;

implementation

uses ShellAPI, SysUtils, dcUtils, dcShellLink;

constructor TdcShellIcon.Create(aOwner: TComponent);
begin
  inherited;
  FLargeIcon := TIcon.Create;
  FSmallIcon := TIcon.Create;
end;

destructor TdcShellIcon.Destroy;
begin
  FSmallIcon.Free;
  FLargeIcon.Free;
  inherited;
end;

procedure TdcShellIcon.ExtractIcons;
var
  Flags: UINT;
  ShInfo: TShFileInfo;
  tmpShellLink: TdcShellLink;
begin
  FDisplayName := '';
  FFileType := '';
  FSysImageIndex := 0;
  FLargeIcon.Assign(nil);
  FSmallIcon.Assign(nil);
  if FFileName = '' then Exit;

  Flags := 0;
  if ioSelected in FOptions then
    inc(Flags, SHGFI_SELECTED);
  if ioLinkOverlay in FOptions then
    inc(Flags, SHGFI_LINKOVERLAY);
  if ioOpen in FOptions then
    inc(Flags, SHGFI_OPENICON);

  if (ioDereferenceShellLinks in FOptions) and
     not (ioLinkOverlay in FOptions) and
     (UpperCase(ExtractFileExt(FFileName)) = '.LNK') then
   begin
    ShGetFileInfo(PChar(FFileName), 0, ShInfo, SizeOf(TShFileInfo), SHGFI_ATTRIBUTES or SHGFI_DISPLAYNAME or SHGFI_TYPENAME or SHGFI_SYSICONINDEX);
    FDisplayName := ShInfo.szDisplayName;
    FFileType := ShInfo.szTypeName;
    FSysImageIndex := ShInfo.iIcon;            
    if ShInfo.dwAttributes and $10000 = $10000 then { is this 100% link ? }
     begin
      tmpShellLink := TdcShellLink.Create(Self);
      with tmpShellLink do
       begin
        FileName := FFileName;
        FLargeIcon.Assign(LargeIcon);
        FSmallIcon.Assign(SmallIcon);
        if Parameters = '' then
          FFileName := LinkTarget
        else
          FFileName := '"' + LinkTarget + '" ' + Parameters;   
        Free;
       end;
      Exit;
     end;
   end;

  ShGetFileInfo(PChar(FFileName), 0, ShInfo, SizeOf(TShFileInfo), SHGFI_ICON or SHGFI_LargeICON or Flags);
  FLargeIcon.Handle := ShInfo.hIcon;
  ShGetFileInfo(PChar(FFileName), 0, ShInfo, SizeOf(TShFileInfo), SHGFI_ICON or SHGFI_SmallICON or Flags or SHGFI_DISPLAYNAME or SHGFI_TYPENAME or SHGFI_SYSICONINDEX);
  FSmallIcon.Handle := ShInfo.hIcon;
  FDisplayName := ShInfo.szDisplayName;
  FFileType := ShInfo.szTypeName;
  FSysImageIndex := ShInfo.iIcon;  

  if (FLargeIcon.Handle = 0) or (FSmallIcon.Handle = 0) then
    GetDefaultIcons(FLargeIcon, FSmallIcon);
end;


procedure TdcShellIcon.SetFileName(Value: String);
begin
  Value := GetCorrectFileName(Value);
  if FFileName <> Value then
   begin
    FFileName := Value;
    ExtractIcons;
   end;
end;

procedure TdcShellIcon.SetIcon(Value: TIcon);
begin
end;

procedure TdcShellIcon.SetNoneStr(const Value: String);
begin
end;

procedure TdcShellIcon.SetNoneInt(Value: Integer);
begin
end;

procedure TdcShellIcon.SetOptions(Value: TdcShellIconOptions);
begin
  if FOptions <> Value then
   begin
    FOptions := Value;
    ExtractIcons;
   end;
end;

end.
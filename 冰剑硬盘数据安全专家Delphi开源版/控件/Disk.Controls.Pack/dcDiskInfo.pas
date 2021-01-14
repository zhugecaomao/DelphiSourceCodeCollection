{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcDiskInfo.pas - dcDiskInfo component

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

unit dcDiskInfo;

interface

uses
  Windows, Classes, Controls, Graphics,
  dcInternal;

type
  TdcDriveType = (dtUnknown, dtNoDrive, dtFloppy, dtFixed, dtNetwork, dtCDROM, dtRAM, dtVirtual);
  TdcDiskInfo = class(TumdcComponent)
  private
    FDisk: Char;
    FSerialNumberStr: String;
    FSerialNumber: LongInt;
    FVolumeLabel: String;
    FFileSystem: String;
    FDriveType: TdcDriveType;
    FDiskSize: TdcFileSize;
    FDiskFree: TdcFileSize;
    FLargeIcon: TIcon;
    FSmallIcon: TIcon;
    FSysImageIndex: Integer;

    FFreeClusters: DWord;
    FTotalClusters: DWord;
    FSectorsPerCluster: DWord;
    FBytesPerSector: DWord;

    function  GetAvailableDrives: String;
    procedure SetDisk(Value: Char);
    procedure SetNothing(const Value: String); procedure SetNothingLong(Value: LongInt); procedure SetNothingInt(Value: Integer); procedure SetNothingFileSize(Value: TdcFileSize); procedure SetNothingDW(Value: DWord); procedure SetNothingDT(Value: TdcDriveType); procedure SetNothingIcon(Value: TIcon);
  protected
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property About;

    property AvailableDrives: String read GetAvailableDrives write SetNothing stored False;
    property Disk: Char read FDisk write SetDisk default 'C';
    property SerialNumberStr: String read FSerialNumberStr write SetNothing stored False;
    property SerialNumber: LongInt read FSerialNumber write SetNothingLong stored False;
    property VolumeLabel: String read FVolumeLabel write SetNothing stored False;
    property FileSystem: String read FFileSystem write SetNothing stored False;
    property DriveType: TdcDriveType read FDriveType write SetNothingDT stored False;
    property DiskSize: TdcFileSize read FDiskSize write SetNothingFileSize stored False;
    property DiskFree: TdcFileSize read FDiskFree write SetNothingFileSize stored False;
    property LargeIcon: TIcon read FLargeIcon write SetNothingIcon stored False;
    property SmallIcon: TIcon read FSmallIcon write SetNothingIcon stored False;
    property SysImageIndex: Integer read FSysImageIndex write SetNothingInt stored False;

    property FreeClusters: DWord read FFreeClusters write SetNothingDW stored False;
    property TotalClusters: DWord read FTotalClusters write SetNothingDW stored False;
    property SectorsPerCluster: DWord read FSectorsPerCluster write SetNothingDW stored False;
    property BytesPerSector: DWord read FBytesPerSector write SetNothingDW stored False;
  end;

implementation

uses SysUtils, ShellAPI, dcUtils;

{$IFNDEF D4}
// Avoiding Delphi3 bug (it uses 32-bit integer instead of 64)
function GetDiskFreeSpaceEx(lpDirectoryName: PChar;
  var lpFreeBytesAvailableToCaller, lpTotalNumberOfBytes: TLargeInteger;
  lpTotalNumberOfFreeBytes: PLargeInteger): BOOL; stdcall; external kernel32 name 'GetDiskFreeSpaceExA';
{$ENDIF}

var
  VDrive: Array[0..2] of Char = (#0, ':', #0);

constructor TdcDiskInfo.Create(aOwner: TComponent);
begin
  inherited;
  FLargeIcon := TIcon.Create;
  FSmallIcon := TIcon.Create;
  Disk := 'C';
end;

destructor TdcDiskInfo.Destroy;
begin
  FSmallIcon.Free;
  FLargeIcon.Free;
  inherited;
end;

function  TdcDiskInfo.GetAvailableDrives: String;
var
  I: Integer;
  DriveBits: set of 0..25;  
begin
  Result := '';
  Integer(DriveBits) := GetLogicalDrives;
  for I := 0 to 25 do
   if not (I in DriveBits) then Continue
   else Result := Result + Char(I + Byte('A'));
end;

procedure TdcDiskInfo.SetDisk(Value: Char);
var
  RootPath: Array[0..4] of Char;
  RootPtr: PChar;

  VolumeLabel, FileSystem: Array[0..MAX_PATH] of Char;
  Res: Integer;  
  SerialNumber, DW, SysFlags: DWord;
  ShInfo: TShFileInfo;

{$IFNDEF D4}
  LargeDiskFree, LargeDiskSize: TLargeInteger;
{$ENDIF}
begin
  Value := UpCase(Value);
  if Value in ['A'..'Z'] then
   begin
    FDisk := Value;

    VDrive[0] := Value;
    RootPath[0] := Value;
    RootPath[1] := ':';
    RootPath[2] := '\';
    RootPath[3] := #0;
    RootPtr := RootPath;

    FDriveType := TdcDriveType(GetDriveType(RootPtr));

    { is this virtual drive? }
    Res := QueryDOSDevice(VDrive, VolumeLabel, MAX_PATH);
    if not ((Res < 3) or { Win9x machines uses "x:" identifier for normal drives }
       ((VolumeLabel[0] = '\') and (VolumeLabel[1] <> '?'))) { WinNT uses identifiers which begins from "\" character, i.e: "\Device\HarddiskVolume1" }
      then FDriveType := dtVirtual;

    if (FDriveType <> dtNoDrive) and GetDiskFreeSpace(RootPtr, FSectorsPerCluster, FBytesPerSector, FFreeClusters, FTotalClusters) then
     begin
      GetVolumeInformation(RootPtr, VolumeLabel, MAX_PATH,
                           @SerialNumber, DW, SysFlags,
                           FileSystem, MAX_PATH);
      FSerialNumber := SerialNumber;
      FSerialNumberStr := IntToHex(FSerialNumber, 8);
      Insert('-', FSerialNumberStr, 5);
      FVolumeLabel := VolumeLabel;
      FFileSystem := FileSystem;

{$IFNDEF D4}
      if GetDiskFreeSpaceEx(RootPtr, LargeDiskFree, LargeDiskSize, nil) then
       begin
        FDiskSize := Int2x32ToExt(LargeDiskSize.HighPart, LargeDiskSize.LowPart);
        FDiskFree := Int2x32ToExt(LargeDiskFree.HighPart, LargeDiskFree.LowPart);
       end
{$ELSE}
      if GetDiskFreeSpaceEx(RootPtr, FDiskFree, FDiskSize, nil) then
{$ENDIF}
       { GetDiskFreeSpaceEx does not works on Win95 with OSR2 service pack and higher
         (Win95OSR2+/NT4+ supports disks over 2 gigabytes).
         So, if function fails - we have to use SysUtils (which works with
         huge disks beginning from Delphi4, which contains Int64 type)... }
      else         
       begin
        FDiskSize := SysUtils.DiskSize(Byte(Value) - 64);
        FDiskFree := SysUtils.DiskFree(Byte(Value) - 64);
       end;
     end
    else
     begin
      FDiskSize := 0;     
      FDiskFree := 0;
      FBytesPerSector := 0;
      FSectorsPerCluster := 0;
      FTotalClusters := 0;
      FFreeClusters := 0;
      FSerialNumber := 0;
      FSerialNumberStr := '';
      FVolumeLabel := '';
      FFileSystem := '';
     end;

    if FDriveType <> dtNoDrive then
     begin
      ShGetFileInfo(RootPtr, 0, ShInfo, SizeOf(TShFileInfo), SHGFI_ICON or SHGFI_LARGEICON);
      FLargeIcon.Handle := ShInfo.hIcon;
      ShGetFileInfo(RootPtr, 0, ShInfo, SizeOf(TShFileInfo), SHGFI_ICON or SHGFI_SMALLICON or SHGFI_SYSICONINDEX);
      FSmallIcon.Handle := ShInfo.hIcon;
      FSysImageIndex := ShInfo.iIcon; 
     end
    else
     begin
      FLargeIcon.Assign(nil);
      FSmallIcon.Assign(nil);
      FSysImageIndex := -1;
     end;
   end
end;

procedure TdcDiskInfo.SetNothing(const Value: String); begin {} end;
procedure TdcDiskInfo.SetNothingLong(Value: LongInt); begin {} end;
procedure TdcDiskInfo.SetNothingInt(Value: Integer); begin {} end;
procedure TdcDiskInfo.SetNothingFileSize(Value: TdcFileSize); begin {} end;
procedure TdcDiskInfo.SetNothingDW(Value: DWord); begin {} end; 
procedure TdcDiskInfo.SetNothingDT(Value: TdcDriveType); begin {} end;
procedure TdcDiskInfo.SetNothingIcon(Value: TIcon); begin {} end;

end.
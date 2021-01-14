{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcVirtualDrives.pas - dcVirtualDrives component

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

unit dcVirtualDrives;

interface

uses
  Windows, Classes, Controls, Graphics,
  dcInternal;

type
  TdcVirtualDrives = class(TumdcComponent)
  private
    FDrive: Char;
    FTarget: String;

    function  GetVirtualDrives: String;
    function  GetUnusedDrives: String;
    procedure SetDrive(Value: Char);
    procedure SetTarget(Value: String);
    procedure SetNoneStr(const Value: String);
  protected
  public
    constructor Create(aOwner: TComponent); override;

    function AddDrive(Drive: Char; Target: String): Boolean;
    function DeleteDrive(Drive: Char): Boolean;
    function GetTargetByDrive(Drive: Char): String;
  published
    property About;
    property VirtualDrives: String read GetVirtualDrives write SetNoneStr;
    property UnusedDrives: String read GetUnusedDrives write SetNoneStr;
    property Drive: Char read FDrive write SetDrive stored False default '.';
    property Target: String read FTarget write SetTarget stored False;
  end;

implementation

uses SysUtils, dcUtils;

var
  VDrive: Array[0..2] of Char = (#0, ':', #0);

constructor TdcVirtualDrives.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  FDrive := '.';
end;

function TdcVirtualDrives.AddDrive(Drive: Char; Target: String): Boolean;
begin
  Drive := UpCase(Drive);

  { prevent to override regular drive }
  if (Pos(Drive, UnusedDrives) = 0) and
     (Pos(Drive, VirtualDrives) = 0) then
   begin
    Result := False;
    Exit;
   end;

  VDrive[0] := Drive;
  Result := DefineDOSDevice(0, VDrive, PChar(Target));
end;

function TdcVirtualDrives.DeleteDrive(Drive: Char): Boolean;
begin
  Drive := UpCase(Drive);
  
  { prevent to delete regular drive }
  if (Pos(Drive, VirtualDrives) = 0) then
   begin
    Result := False;
    Exit;
   end;

  VDrive[0] := Drive;   
  Result := DefineDOSDevice(DDD_REMOVE_DEFINITION, VDrive, nil);
end;

function TdcVirtualDrives.GetTargetByDrive(Drive: Char): String;
var
  I, Res: Integer;
  Drives: String;
  Target: Array[0..MAX_PATH] of Char;
begin
  Result := '';
  Drive := UpCase(Drive);
  Drives := VirtualDrives;
  I := Length(Drives);
  if I <> 0 then
   for I := 1 to I do
    if Drive = Drives[I] then
     begin
      VDrive[0] := Drive;
      Res := QueryDOSDevice(VDrive, Target, MAX_PATH);
      if Res <> 0 then
       begin
        { small fix for NT machines }
        Res := Pos('\??\', Target);
        if Res <> 0 then
         Move(Target[4], Target, MAX_PATH);
        { --- }
        Result := StrPas(Target);
       end; 
      Exit;
     end;
end;

function TdcVirtualDrives.GetVirtualDrives: String;
var
  I, Res: Integer;
  Target: Array[0..MAX_PATH] of Char;
  DriveBits: set of 0..25;
begin
  Result := '';
  Integer(DriveBits) := GetLogicalDrives;
  for I := 0 to 25 do
   if not (I in DriveBits) then Continue
   else
    begin
     VDrive[0] := Char(I + Byte('A'));
     Res := QueryDOSDevice(VDrive, Target, MAX_PATH);
     if (Res < 3) or { Win9x machines uses "x:" identifier for normal drives }
        ((Target[0] = '\') and (Target[1] <> '?')){ WinNT uses identifiers which begins from "\" character, i.e: "\Device\HarddiskVolume1" }
        then Continue;

     Result := Result + VDrive[0];
    end;
end;

function TdcVirtualDrives.GetUnusedDrives: String;
var
  I: Integer;
  DriveBits: set of 0..25;
begin
  Result := '';
  Integer(DriveBits) := GetLogicalDrives;
  for I := 0 to 25 do
   if not (I in DriveBits) then
     Result := Result + Char(I + Byte('A'))
end;

procedure TdcVirtualDrives.SetDrive(Value: Char);
var
  St: String;
begin
  Value := UpCase(Value);
  if not (Value in ['A'..'Z']) then // clear properties
   begin
    FDrive := '.';
    FTarget := '';
    Exit;
   end;

  St := GetTargetByDrive(Value);
  if St <> '' then
   begin
    FDrive := Value;
    FTarget := St;
   end;
end;

procedure TdcVirtualDrives.SetTarget(Value: String);
begin
  if FDrive = '.' then Exit;

  Value := ExcludeTrailingBackslash(Value);
  if (FTarget <> Value) and (Value <> '') then
   begin
    FTarget := Value;
    VDrive[0] := FDrive;
    DefineDOSDevice(0, VDrive, PChar(FTarget));
   end;
end;

procedure TdcVirtualDrives.SetNoneStr(const Value: String);
begin
end;

end.

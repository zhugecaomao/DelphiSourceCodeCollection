{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcFileCRC.pas - dcFileCRC component

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

unit dcFileCRC;

interface

uses
  Windows, Classes, Controls, Graphics,
  dcInternal;

type
  TdcFileCRCMethod = (crc32, crc16, crcArc);
  TdcFileCRC = class(TumdcComponent)
  private
    FCRC: DWord;
    FFileName: String;
    FMethod: TdcFileCRCMethod;

    procedure SetFileName(const Value: String);
    procedure SetMethod(Value: TdcFileCRCMethod);
    procedure SetNothingInt(Value: DWord);
  public
    procedure UpdateCRC; virtual;
  published
    property About;
    property CRC: DWord read FCRC write SetNothingInt stored False;
    property FILENAME: String read FFileName write SetFileName stored False;
    property Method: TdcFileCRCMethod read FMethod write SetMethod default crc32;
  end;

implementation

uses dcCRC;

procedure TdcFileCRC.UpdateCRC;
begin
  FCRC := GetFileCRC(FFileName, TCRCMethod(FMethod));
end;

procedure TdcFileCRC.SetFileName(const Value: String);
begin
  if FFileName <> Value then
   begin
    FFileName := Value;
    UpdateCRC;
   end;
end;

procedure TdcFileCRC.SetMethod(Value: TdcFileCRCMethod);
begin
  if FMethod <> Value then
   begin
    FMethod := Value;
    UpdateCRC;
   end;
end;

procedure TdcFileCRC.SetNothingInt(Value: DWord);
begin
end;

end.


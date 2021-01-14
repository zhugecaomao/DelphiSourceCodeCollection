{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcSystemImageList.pas - dcSystemImageList component

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

unit dcSystemImageList;

interface

uses
  Classes, Controls, Graphics
  {$IFDEF D4}, ImgList {$ENDIF};

type
  TdcSystemImageSize = (is16x16, is32x32);
  TdcSystemImageList = class(TImageList)
  private
    FAbout: String;
    FImageSize: TdcSystemImageSize;
    FImageSizeInt: Integer;

    { design-time properties of the TComponent }
    procedure ReadLeft(Reader: TReader);
    procedure ReadTop(Reader: TReader);
    procedure WriteLeft(Writer: TWriter);
    procedure WriteTop(Writer: TWriter);

    function  GetAllocBy: Integer;
    function  GetBkColor: TColor;
    function  GetBlendColor: TColor;
    function  GetDrawingStyle: TDrawingStyle;
    function  GetImageType: TImageType;
    function  GetMasked: Boolean;
    function  GetShareImages: Boolean;
    procedure SetImageSize(Value: TdcSystemImageSize);
  protected
    procedure DefineProperties(Filer: TFiler); override;  
    procedure SysInitialize; virtual;
  public
    constructor Create(aOwner: TComponent); override;
    constructor CreateSize(aWidth, aHeight: Integer);
  published
    property About: String read FAbout write FAbout stored False;
    property ImageSize: TdcSystemImageSize read FImageSize write SetImageSize default is16x16;    

    { getting rid of some properties from the Object Inspector }
    property AllocBy: Integer read GetAllocBy stored False;
    property BkColor: TColor read GetBkColor stored False;
    property BlendColor: TColor read GetBlendColor stored False;
    property DrawingStyle: TDrawingStyle read GetDrawingStyle stored False;
    property ImageType: TImageType read GetImageType stored False;
    property Masked: Boolean read GetMasked stored False;
    property ShareImages: Boolean read GetShareImages default True;
    property Width: Integer read FImageSizeInt stored False;
    property Height: Integer read FImageSizeInt stored False;
  end;

implementation

uses SysUtils, dcUtils;

constructor TdcSystemImageList.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  SysInitialize;
end;

constructor TdcSystemImageList.CreateSize(aWidth, aHeight: Integer);
begin
  inherited Create(nil);
  if aWidth = 32 then FImageSize := is32x32;
  SysInitialize;
end;

procedure TdcSystemImageList.SysInitialize;
begin
  inherited ShareImages := True;
  if FImageSize = is16x16 then FImageSizeInt := 16
  else FImageSizeInt := 32;
  Handle := GetSystemImageList(FImageSizeInt);
end;

function TdcSystemImageList.GetAllocBy: Integer;
begin
  Result := inherited AllocBy; 
end;

function  TdcSystemImageList.GetBkColor: TColor;
begin
  Result := inherited BkColor;
end;

function  TdcSystemImageList.GetBlendColor: TColor;
begin
  Result := inherited BlendColor;
end;

function  TdcSystemImageList.GetDrawingStyle: TDrawingStyle;
begin
  Result := inherited DrawingStyle;
end;

function  TdcSystemImageList.GetImageType: TImageType;
begin
  Result := inherited ImageType; 
end;

function  TdcSystemImageList.GetMasked: Boolean;
begin
  Result := inherited Masked; 
end;

function TdcSystemImageList.GetShareImages: Boolean;
begin
  Result := True;
end;

procedure TdcSystemImageList.SetImageSize(Value: TdcSystemImageSize);
begin
  if FImageSize <> Value then
   begin
    FImageSize := Value;
    SysInitialize;
   end;
end;

{ === design-time and storage stuff === }
procedure TdcSystemImageList.ReadLeft(Reader: TReader);
var
  FakeDesignInfo: LongInt;
begin
  FakeDesignInfo := DesignInfo;
  LongRec(FakeDesignInfo).Lo := Reader.ReadInteger;
  DesignInfo := FakeDesignInfo;
end;

procedure TdcSystemImageList.ReadTop(Reader: TReader);
var
  FakeDesignInfo: LongInt;
begin
  FakeDesignInfo := DesignInfo;
  LongRec(FakeDesignInfo).Hi := Reader.ReadInteger;
  DesignInfo := FakeDesignInfo;
end;

procedure TdcSystemImageList.WriteLeft(Writer: TWriter);
begin
  Writer.WriteInteger(LongRec(DesignInfo).Lo);
end;

procedure TdcSystemImageList.WriteTop(Writer: TWriter);
begin
  Writer.WriteInteger(LongRec(DesignInfo).Hi);
end;

procedure TdcSystemImageList.DefineProperties(Filer: TFiler);
var
  Ancestor: TComponent;
  Info: Longint;
begin
  Info := 0;
  Ancestor := TComponent(Filer.Ancestor);
  if Ancestor <> nil then Info := Ancestor.DesignInfo;
  Filer.DefineProperty('Left', ReadLeft, WriteLeft,
    LongRec(DesignInfo).Lo <> LongRec(Info).Lo);
  Filer.DefineProperty('Top', ReadTop, WriteTop,
    LongRec(DesignInfo).Hi <> LongRec(Info).Hi);
end;

end.

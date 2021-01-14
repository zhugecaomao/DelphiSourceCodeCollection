{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcIcon2Bitmap.pas - dcIcon2Bitmap component

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

unit dcIcon2Bitmap;

interface

uses
  Windows, Classes, Controls, Graphics, Forms,
  dcInternal;

type
  TdcIcon2Bitmap = class(TumdcComponent)
  private
    FIcon: TIcon;
    FBitmap: TBitmap;

    procedure SetIcon(Value: TIcon);
    procedure SetBitmap(Value: TBitmap);
  protected
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property About;

    property Icon: TIcon read FIcon write SetIcon stored False;
    property Bitmap: TBitmap read FBitmap write SetBitmap stored False;
  end;

implementation

const
  TRANSP_BMP_COLOR = $FEFFFE;

constructor TdcIcon2Bitmap.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FIcon := TIcon.Create;
  FBitmap := TBitmap.Create;
end;

destructor TdcIcon2Bitmap.Destroy;
begin
  FBitmap.Free;
  FIcon.Free;

  inherited Destroy;
end;


procedure TdcIcon2Bitmap.SetIcon(Value: TIcon);
var
  R: TRect;
  IconInfo: TIconInfo;
begin
  FIcon.Assign(Value);

  if not FIcon.Empty then
   begin
    { converting Icon to Bitmap }
    GetIconInfo(FIcon.Handle, IconInfo);
    FBitmap.Width := IconInfo.xHotspot shl 1 + 2;
    FBitmap.Height := IconInfo.yHotspot shl 1 + 2;
    R := Rect(0, 0, FBitmap.Width, FBitmap.Height);
    FBitmap.Canvas.Brush.Color := TRANSP_BMP_COLOR;
    FBitmap.Canvas.FillRect(R);
    DrawIconEx(FBitmap.Canvas.Handle, 1, 1,
               FIcon.Handle, FBitmap.Width - 2, FBitmap.Height - 2,
               0, 0, DI_NORMAL);
   end
  else
    FBitmap.Assign(nil);
end;

procedure TdcIcon2Bitmap.SetBitmap(Value: TBitmap);
begin
end;

end.
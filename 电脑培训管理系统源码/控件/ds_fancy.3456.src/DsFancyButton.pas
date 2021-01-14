unit DsFancyButton;

// DsFancyButton Release 1.1 for Delphi 3 and 4
// Copyright (c) 1999-2000 by Djoko Susilo
// ------------ Q14 Project Feb 99 ------------
// e-mail: djokos@cabi.net.id
// http://homepage.indo1.com/delphianhome/
// --------------------------------------------
// Files needed to install:
// DsFancyButton.pas (this file)
// DsFancyButton.dcr (resource for icon)
//---------------------------------------------
// R1.1 10-Nov-99:
// -Gradient process using region function
//---------------------------------------------

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms;

type
  TTextStyle = (txNone, txLowered, txRaised, txShadowed);
  TShape = (shCapsule, shOval, shRectangle, shRoundRect);
  TDsFancyButton = class(TGraphicControl)
  private
    FButtonColor: TColor;
    FIsDown: Boolean;
    FFrameColor: TColor;
    FFrameWidth: Integer;
    FCornerRadius: Integer;
    FRgn, MRgn: HRgn;   // region, detect mouse move and position
    FShape: TShape;
    FTextColor: TColor;
    FTextStyle: TTextStyle;

    procedure SetButtonColor(Value: TColor);
    procedure CMEnabledChanged(var message: TMessage);
              message CM_ENABLEDCHANGED;
    procedure CMTextChanged(var message: TMessage);
              message CM_TEXTCHANGED;
    procedure CMDialogChar(var message: TCMDialogChar);
              message CM_DIALOGCHAR;
    procedure WMSize(var message: TWMSize); message WM_PAINT;
  protected
    procedure Click; override;
    procedure DrawShape;
    procedure Paint; override;
    procedure SetFrameColor(Value: TColor);
    procedure SetFrameWidth(Value: Integer);
    procedure SetCornerRadius(Value: Integer);
    procedure SetShape(Value: TShape);
    procedure SetTextStyle(Value: TTextStyle);
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WriteCaption;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ButtonColor: TColor
             read FButtonColor write SetButtonColor;
    property Caption;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property FrameColor: TColor
             read FFrameColor write SetFrameColor;
    property FrameWidth: Integer
             read FFrameWidth write SetFrameWidth;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property CornerRadius: Integer
             read FCornerRadius write SetCornerRadius;
    property Shape: TShape
             read FShape write SetShape default shRoundRect;
    property ShowHint;
    property TextStyle: TTextStyle
             read FTextStyle write SetTextStyle;
    property Visible;

    property OnClick;         property OnDragDrop;
    property OnDragOver;      property OnEndDrag;
    property OnMouseDown;     property OnMouseUp;
    property OnMouseMove;
  end;

procedure Register;

implementation

constructor TDsFancyButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle:=[csClickEvents, csCaptureMouse, csSetCaption];
  Enabled:=True;
  FButtonColor:=clBtnFace;
  FIsDown:=False;
  FFrameColor:=clGray;
  FFrameWidth:=6;
  FCornerRadius:=10;
  FRgn:=0;
  FShape:=shRoundRect;
  FTextStyle:=txRaised;
  Height:=25;
  Visible:=True;
  Width:=97;
end;

destructor TDsFancyButton.Destroy;
begin
  DeleteObject(FRgn);
  DeleteObject(MRgn);
  inherited Destroy;
end;

procedure TDsFancyButton.Paint;
var Dia: Integer;
    ClrUp, ClrDown: TColor;
begin
  Canvas.Brush.Style:=bsClear;   // transparant
  // check button state, wether pressed (ButtonDown) or not;
  // change line color to get pressing effect

  if FIsDown then
    begin ClrUp:=clBtnShadow; ClrDown:=clBtnHighlight; end
  else
    begin ClrUp:=clBtnHighlight; ClrDown:=clBtnShadow; end;

  with Canvas do
  begin
    case Shape of
      shRoundRect:
        begin
          Dia:=2*CornerRadius;
          MRgn:=CreateRoundRectRgn(0, 0, Width, Height, Dia, Dia);
        end;
      shCapsule:
        begin
          if Width<Height then Dia:=Width else Dia:=Height;
          MRgn:=CreateRoundRectRgn(0, 0, Width, Height, Dia, Dia);
        end;
      shRectangle: MRgn:=CreateRectRgn(0, 0, Width-1, Height-1);
      shOval: MRgn:=CreateEllipticRgn(0, 0, Width, Height);
    end; //case
    Canvas.Brush.Color:=FButtonColor;
    FillRgn(Handle, MRgn, Brush.Handle);
    Brush.Color:=ClrUp;
    FrameRgn(Handle, MRgn, Brush.Handle, 1, 1);
    OffsetRgn(MRgn, 1, 1);
    Brush.Color:=ClrDown;
    FrameRgn(Handle, MRgn, Brush.Handle, 1, 1);
  end; //canvas
  DrawShape;  // draw button face
  WriteCaption;  // write Caption
end;

procedure TDsFancyButton.DrawShape;
var
  FC, Warna: TColor;
  R, G, B: Byte;
  AwalR, AwalG, AwalB,
  AkhirR, AkhirG, AkhirB,
  n, t, Dia: Integer;
begin
  if FFrameWidth mod 2=0 then t:=FFrameWidth
  else t:=FFrameWidth+1;

  Warna:=ColorToRGB(ButtonColor);
  FC:=ColorToRGB(FrameColor);
  Canvas.Brush.Color:=Warna;

  // gradient preparation
  AwalR:=GetRValue(FC); AkhirR:=GetRValue(Warna);
  AwalG:=GetGValue(FC); AkhirG:=GetGValue(Warna);
  AwalB:=GetBValue(FC); AkhirB:=GetBValue(Warna);
  FRgn:=0;
  with Canvas do
  for n:=0 to t-1 do
  begin
    R:=AwalR+Trunc(Sqrt(t*t-Sqr(t-n))*(AkhirR-AwalR)/t);
    G:=AwalG+Trunc(Sqrt(t*t-Sqr(t-n))*(AkhirG-AwalG)/t);
    B:=AwalB+Trunc(Sqrt(t*t-Sqr(t-n))*(AkhirB-AwalB)/t);
    Brush.Color:=RGB(R, G, B);

    case Shape of
      shOval: FRgn:=CreateEllipticRgn(1+n, 1+n, Width-n, Height-n);
      shRoundRect:
        begin
          Dia:=CornerRadius;
          if (Dia-n)>0 then
            FRgn:=CreateRoundRectRgn(1+n, 1+n, Width-n, Height-n, 2*(Dia-n), 2*(Dia-n))
          else FRgn:=CreateRectRgn(1+n, 1+n, Width-n-1, Height-n-1);
        end;
      shCapsule:
        begin
          if Width<Height then Dia:=Width div 2 else Dia:=Height div 2;
          if (Dia-n)>0 then
            FRgn:=CreateRoundRectRgn(1+n, 1+n, Width-n, Height-n, 2*(Dia-n), 2*(Dia-n))
          else FRgn:=CreateRectRgn(1+n, 1+n, Width-n-1, Height-n-1);
        end;
      else FRgn:=CreateRectRgn(1+n, 1+n, Width-n-1, Height-n-1);
    end; //case
    FrameRgn(Handle, FRgn, Brush.Handle, 1, 1);
  end;
end;

procedure TDsFancyButton.WriteCaption;
var Flags: Word;
    BtnL, BtnT, BtnR, BtnB: Integer;
    R, TR: TRect;
begin
  R:=ClientRect; TR:=ClientRect;
  Canvas.Font:=Self.Font;
  Canvas.Brush.Style:=bsClear;
  Flags:=DT_CENTER or DT_SINGLELINE;
  Canvas.Font:=Font;

  if FIsDown then FTextColor:=FrameColor
  else FTextColor:=Self.Font.Color;

  with canvas do
  begin
    BtnT:=(Height-TextHeight(Caption)) div 2;
    BtnB:=BtnT+TextHeight(Caption);
    BtnL:=(Width-TextWidth(Caption)) div 2;
    BtnR:=BtnL+TextWidth(Caption);
    TR:=Rect(BtnL, BtnT, BtnR, BtnB);
    R:=TR;
    if ((TextStyle=txLowered) and FIsDown) or
       ((TextStyle=txRaised) and not FIsDown) then
    begin
      Font.Color:=clBtnHighLight;
      OffsetRect(TR, -1+1, -1+1);
      DrawText(Handle, PChar(Caption), Length(Caption), TR, Flags);
    end
    else if ((TextStyle=txLowered) and not FIsDown) or
            ((TextStyle=txRaised) and FIsDown) then
    begin
      Font.Color:=clBtnHighLight;
      OffsetRect(TR, +2, +2);
      DrawText(Handle, PChar(Caption), Length(Caption), TR, Flags);
    end
    else if (TextStyle=txShadowed) and FIsDown then
    begin
      Font.Color:=clBtnShadow;
      OffsetRect(TR, 3+1, 3+1);
      DrawText(Handle, PChar(Caption), Length(Caption), TR, Flags);
    end
    else if (TextStyle=txShadowed) and not FIsDown then
    begin
      Font.Color:=clBtnShadow;
      OffsetRect(TR, 2+1, 2+1);
      DrawText(Handle, PChar(Caption), Length(Caption), TR, Flags);
    end;
    if Enabled then Font.Color:=FTextColor //Self.Font.Color
    else if (TextStyle=txShadowed) and not Enabled then
      Font.Color:=clBtnFace
    else Font.Color:=clBtnShadow;
    if FIsDown then OffsetRect(R, 1, 1)
    else OffsetRect(R, -1, -1);
    DrawText(Handle, PChar(Caption), Length(Caption), R, Flags);
  end;
end;

procedure TDsFancyButton.SetButtonColor(value: TColor);
begin
  if value<>FButtonColor then
    begin FButtonColor:=value; Invalidate; end;
end;

procedure TDsFancyButton.WMLButtonDown(var message: TWMLButtonDown);
begin
  if not PtInRegion(MRgn, message.xPos, message.yPos) then Exit;
  FIsDown:=True;
  Paint;
  inherited;
end;

procedure TDsFancyButton.WMLButtonUp(var message: TWMLButtonUp);
begin
  if not FIsDown then Exit;
  FIsDown:=False;
  Paint;
  inherited;
end;

procedure TDsFancyButton.SetShape(Value: TShape);
begin
  if Value<>FShape then
    begin FShape:=Value; Invalidate; end;
end;

procedure TDsFancyButton.SetTextStyle(Value: TTextStyle);
begin
  if Value<>FTextStyle then
    begin FTextStyle:=Value; Invalidate; end;
end;

procedure TDsFancyButton.SetFrameColor(Value: TColor);
begin
  if Value<>FFrameColor then
    begin FFrameColor:=Value; Invalidate; end;
end;

// set gradient size, maximum value is half of Width or Height, 
// which one is smaller. The minimum value is 4 pixels.
procedure TDsFancyButton.SetFrameWidth(Value: Integer);
var w: integer;
begin
  if Width<Height then w:=Width else w:=Height;
  if Value<>FFrameWidth then FFrameWidth:=Value;
  if FFrameWidth<4 then FFrameWidth:=4;
  if FFrameWidth>(w div 2) then FFrameWidth:=(w div 2);
  Invalidate;
end;

// set the maximum value of diameter to Width or Height,
// which one is smaller.
procedure TDsFancyButton.SetCornerRadius(Value: Integer);
var w: Integer;
begin
  if Width<Height then w:=Width else w:=Height;
  if Value<>FCornerRadius then FCornerRadius:=Value;
  if FCornerRadius<3 then FCornerRadius:=3;
  if FCornerRadius>w then FCornerRadius:=w;
  Invalidate;
end;

procedure TDsFancyButton.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  invalidate;
end;

// refresh Caption for changes
procedure TDsFancyButton.CMTextChanged(var Message: TMessage);
begin
  Invalidate;
end;

procedure TDsFancyButton.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(CharCode, Caption) and Enabled then
      begin Click; Result:=1; end
    else inherited;
end;

// limit the button size due to slow gradient
procedure TDsFancyButton.WMSize(var Message: TWMSize);
begin
  inherited;
  if Width>145 then Width:=145;
  if Height>145 then Height:=145;
end;

procedure TDsFancyButton.Click;
begin
  FIsDown:=False;
  Invalidate;
  inherited Click;
end;

procedure Register;
begin
  RegisterComponents('Fancy Compo', [TDsFancyButton]);
end;

end.

unit lxpQRShape;

interface

uses
  Windows, Graphics, SysUtils, Classes, Controls, QuickRpt, QRCtrls;

type
  TQRShapeTypeEx = (qrsRectangle, qrsVertLine, qrsHorLine, qrsCircle, qrsLTToRB, qrsRTToLB);
  TlxpQRShape = class(TQRShape)
  private
    FShape: TQRShapeTypeEx;
    procedure SetShape(Value: TQRShapeTypeEx);
    procedure DrawShapes(FCanvas: TCanvas; OfsX, OfsY: Integer);
  protected
    procedure Paint; override;
    procedure Print(OfsX, OfsY: Integer); override;
  published
    property Shape: TQRShapeTypeEx read FShape write SetShape;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('lxpbuaa', [TlxpQRShape]);
end;

{ TQRShapeEx }

procedure TlxpQRShape.Paint;
begin
  DrawShapes(Canvas, 0, 0);
end;

procedure TlxpQRShape.Print(OfsX, OfsY: Integer);
begin
  with QRPrinter do
    DrawShapes(Canvas, XPos(OfsX + Size.Left), YPos(OfsY + Size.Top));
end;


procedure TlxpQRShape.SetShape(Value: TQRShapeTypeEx);
begin
  if FShape <> Value then
  begin
    FShape := Value;
    Invalidate;
  end;
end;


procedure TlxpQRShape.DrawShapes(FCanvas: TCanvas; OfsX, OfsY: Integer);
var
  X, Y, W, H, S, HM, VM: Integer;
  procedure InitCanvas(DrawFrame: Boolean);
  begin
    FCanvas.Pen := Pen;
    FCanvas.Brush := Brush;
    if DrawFrame then with FCanvas.Pen do
    begin
      Width := Frame.Width;
      Color := Frame.Color;
      Style := Frame.Style;
    end;
    with FCanvas do
    begin
      X := Pen.Width div 2;
      Y := X;
      W := Width - Pen.Width + 1;
      H := Height - Pen.Width + 1;
      if Pen.Width = 0 then
      begin
        Dec(W);
        Dec(H);
      end;
      if W < H then S := W else S := H;
      HM := Width div 2;
      VM := Height div 2;
    end;
  end;
  procedure MoveToEx(X, Y: Integer);
  begin
    FCanvas.MoveTo(X + OfsX, Y + OfsY);
  end;
  procedure LineToEx(X, Y: Integer);
  begin
    FCanvas.LineTo(X + OfsX, Y + OfsY);
  end;
begin
  InitCanvas(True);
  with FCanvas do
  begin
    if Frame.DrawTop then
    begin
      MoveToEx(X, Y);
      LineToEx(Width - X, Y);
    end;
    if Frame.DrawLeft then
    begin
      MoveToEx(X, Y);
      LineToEx(X, Height - Y);
    end;
    if Frame.DrawRight then
    begin
      MoveToEx(Width - X - 1, Y);
      LineToEx(Width - X - 1, Height - Y);
    end;
    if Frame.DrawBottom then
    begin
      MoveToEx(X, Height - Y - 1);
      LineToEx(Width - X, Height - Y - 1);
    end;
  end;

  InitCanvas(False);
  if FShape = qrsCircle then
  begin
    Inc(X, (W - S) div 2);
    Inc(Y, (H - S) div 2);
    W := S;
    H := S;
  end;

  with FCanvas do
    case FShape of
      qrsRectangle:
        Rectangle(X + OfsX, Y + OfsY, X + W + OfsX, Y + H + OfsY);
      qrsCircle:
        Ellipse(X + OfsX, Y + OfsY, X + W + OfsX, Y + H + OfsY);
      qrsHorLine:
      begin
        MoveToEx(X, VM);
        LineToEx(Width - X, VM);
      end;
      qrsVertLine:
      begin
        MoveToEx(HM, Y);
        LineToEx(HM, Height - Y);
      end;
      qrsLTToRB:
      begin
        MoveToEx(X, Y);
        LineToEx(Width - X, Height - Y);
      end;
      qrsRTToLB:
      begin
        MoveToEx(Width - X, Y);
        LineToEx(X, Height - Y);
      end;
    end;
end;


end.

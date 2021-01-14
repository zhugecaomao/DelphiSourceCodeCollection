unit lxpArtWordLabel;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Graphics;

type
  TArtWordStyles = set of (aws3D, awsShadow, awsOutlined);
  TlxpArtWordLabel = class(TGraphicControl)
  private
    FArtWordStyles: TArtWordStyles;
    FAlignment: TAlignment;
    FCaption: TCaption;
    FAutoSize: Boolean;
    FColor3D, FColorShadow, FColorOutline: TColor;
    FShadowLength: Integer;
    procedure SetArtWordStyles(Value: TArtWordStyles);
    procedure SetCaption(Value: TCaption);
    function GetFont: TFont;
    procedure SetFont(Value: TFont);
    function GetColor(Index: Integer): TColor;
    procedure SetColor(Index: Integer; Value: TColor);
    procedure SetShadowLength(Value: Integer);
    procedure SetAlignment(Value: TAlignment);
  protected
    procedure Paint; override;
    procedure SetAutosize(Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Caption: TCaption read fCaption write SetCaption;
    property Font: TFont read GetFont write SetFont;
    property ArtWordStyles: TArtWordStyles read FArtWordStyles write SetArtWordStyles;
    property Color3D: TColor Index 0 read GetColor write SetColor;
    property ColorShadow: TColor Index 1 read GetColor write SetColor;
    property ColorOutline: TColor Index 2 read GetColor write SetColor;
    property ShadowLength: Integer read FShadowLength write SetShadowLength;
    property AutoSize: Boolean read fAutoSize write SetAutosize;
    property Alignment: TAlignment read FAlignment write SetAlignment;

    property Align;
    property ParentFont;
    property ParentShowHint;
    property ShowHint;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

procedure Register;

implementation

uses Math;

procedure Register;
begin
  RegisterComponents('lxpbuaa', [TlxpArtWordLabel]);
end;

{ TlxpArtWordLabel }

constructor TlxpArtWordLabel.Create(AOwner: TComponent);
begin
  inherited;
  FArtWordStyles := [aws3D, awsShadow];
  FCaption := 'TlxpArtWordLabel';
  fColor3D := clWhite;
  FColorShadow := clGray;
  FColorOutline := clWhite;
  FShadowLength := 3;
end;

procedure TlxpArtWordLabel.SetCaption(Value: TCaption);
begin
  if FCaption <> Value then
  begin
    FCaption := Value;
    Repaint;
  end;
end;

function TlxpArtWordLabel.GetFont: TFont;
begin
  Result := Canvas.Font;
end;

procedure TlxpArtWordLabel.SetFont(Value: TFont);
begin
  if Canvas.Font <> Value then
  begin
    Canvas.Font := Value;
    Repaint;
  end;
end;


procedure TlxpArtWordLabel.SetArtWordStyles(Value: TArtWordStyles);
begin
  if FArtWordStyles <> Value then
  begin
    FArtWordStyles := Value;
    Repaint;
  end;
end;


function TlxpArtWordLabel.GetColor(Index: Integer): TColor;
begin
  case Index of
    0: Result := FColor3D;
    1: Result := FColorShadow;
  else
    Result := FColorOutline;
  end;
end;

procedure TlxpArtWordLabel.SetColor(Index: Integer; Value: TColor);
begin
  if GetColor(index) <> Value then
  begin
    case Index of
      0: FColor3D := Value;
      1: FColorShadow := Value;
    else
      FColorShadow := Value;
    end;
    Repaint;
  end;
end;

procedure TlxpArtWordLabel.SetShadowLength(Value: Integer);
begin
  if FShadowLength <> Value then
  begin
    FShadowLength := Value;
    Repaint;
  end;
end;

procedure TlxpArtWordLabel.SetAutosize(Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    Width := Canvas.TextWidth(FCaption) + 4;
    Height := Canvas.TextHeight(FCaption) + 4;
    Repaint;
  end;
end;     

procedure TlxpArtWordLabel.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    Repaint;
  end;
end;

procedure TlxpArtWordLabel.Paint;
var
  Backup: TColor;
  X, Y: Integer;
begin
  inherited;

  Y := Max((Height - Canvas.TextHeight(FCaption)) div 2, 0);
  case FAlignment of
    taCenter:
      X := Max((Width - Canvas.TextWidth(FCaption)) div 2, 0);
    taLeftJustify:
      X := 2;
  else
    X := Width - Canvas.TextWidth(FCaption) -2;
  end;

  Canvas.Brush.Style := bsClear;
  Backup := Font.Color;

  if aws3D in FArtWordStyles then with Canvas do
  begin
    Font.Color := FColor3D;
    TextOut(X + 1, Y + 1, FCaption);
    Font.Color := Backup;
  end;

  if awsShadow in FArtWordStyles then with Canvas do
  begin
    Font.Color := FColorShadow;
    TextOut(X + FShadowLength, Y + FShadowLength, FCaption);
    Font.Color := Backup;
  end;

  if awsOutlined in FArtWordStyles then with Canvas do
  begin
    Font.Color := FColorOutline;
    TextOut(X + 1, Y + 1, FCaption);
    TextOut(X - 1, Y + 1, FCaption);
    TextOut(X + 1, Y - 1, FCaption);
    TextOut(X - 1, Y - 1, FCaption);
    Font.Color := Backup;
  end;

  Canvas.TextOut(X, Y, FCaption);
end;



end.

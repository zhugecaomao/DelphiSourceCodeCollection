unit LEDFont;

interface

uses
  SysUtils, Classes, Controls, Graphics, ExtCtrls, Windows;

type
  TLEDFontNum = class(TGraphicControl)
  private
    FAutoSize: Boolean;
    FOffsetX: integer;
    FWordWidth: integer;
    FOffsetY: integer;
    FSpace: integer;
    FWordHeight: integer;
    FThick: integer;
    FText: String;
    FLightColor: TColor;
    FBGColor: TColor;
    FDarkColor: TColor;
    FTransparent: Boolean;

    OriginX: Integer;
    OriginY: Integer;
    d:   array [0..7, 0..5] of TPoint;
    LED: array [0..11] of String;

    procedure SetAutoSize2(const Value: Boolean);
    procedure SetBGColor(const Value: TColor);
    procedure SetDarkColor(const Value: TColor);
    procedure SetLightColor(const Value: TColor);
    procedure SetOffSetX(const Value: integer);
    procedure SetOffSetY(const Value: integer);
    procedure SetSpace(const Value: integer);
    procedure SetText(const Value: String);
    procedure SetThick(const Value: integer);
    procedure SetWordHeight(const Value: integer);
    procedure SetWordWidth(const Value: integer);

    procedure MakeMatrix;
    procedure Draw;
    { Private declarations }
  protected
    { Protected declarations }
    procedure Paint; Override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property OffSetX: integer read FOffsetX write SetOffSetX default 4;
    property OffSetY: integer read FOffsetY write SetOffSetY default 4;
    property WordWidth: integer read FWordWidth write SetWordWidth
      default 17;
    property WordHeight: integer read FWordHeight write SetWordHeight
      default 29;
    property Thick: integer read FThick write SetThick;
    property Space: integer read FSpace write SetSpace;
    property Text: String read FText write SetText;
    property BGColor: TColor read FBGColor write SetBGColor
      default $004A424A;
    property LightColor: TColor read FLightColor write SetLightColor
      default $0000FFF7;
    property DarkColor: TColor read FDarkColor write SetDarkColor
      default $00636363;
    property AutoSize: Boolean read FAutoSize write SetAutoSize2 default True;
    property ShowHint;
    property Visible;
    property PopupMenu;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseUp;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('System', [TLEDFontNum]);
end;

{ TLEDFontNum }

constructor TLEDFontNum.Create(AOwner : TComponent);
begin
  inherited;
  Width := 47;
  Height := 38;

  FOffsetX := 4;
  FOffsetY := 4;
  FThick := 3;
  FWordWidth := 17;
  FWordHeight := 29;
  FSpace := 4;
  FText := '00';
  FBGColor := $004A424A;
  FLightColor := $0000FFF7;
  FDarkColor := $00636363;
  FAutoSize := True;
  FTransparent := False;

  LED[0] := '012345';
  LED[1] := '12';
  LED[2] := '01643';
  LED[3] := '01623';
  LED[4] := '5612';
  LED[5] := '05623';
  LED[6] := '054326';
  LED[7] := '012';
  LED[8] := '0123456';
  LED[9] := '650123';
  LED[10] := '6';
  LED[11] := '7';
end;

destructor TLEDFontNum.Destroy;
begin
  inherited;
end;

procedure TLEDFontNum.Paint;
begin
  inherited;
  Draw;
end;

procedure TLEDFontNum.Draw;
var
  MemImage: TImage;
  i: Integer;
  j: Integer;
  iPointPos: integer;
  NewText: string;
begin
  if not Visible then
    Exit;

  OriginX := 0;
  OriginY := 0;
  MemImage := TImage.Create(Self);
  MemImage.Width := Width;
  MemImage.Height := Height;
  iPointPos := Pos('.',Text);
  newText   := Text;

  if iPointPos > 0 then
    system.Delete(newText, iPointPos,1);

  with MemImage.Canvas do
  begin
    Brush.Color := FBGColor;
    FillRect(ClipRect);
    for i := 1 to Length(NewText) do
    begin
      if i = 1 then
      begin
        Inc(OriginX, FOffsetX);
        Inc(OriginY, FOffsetY);
      end
      else
        Inc(OriginX, FWordWidth + FSpace);
      MakeMatrix;

      if FDarkColor <> FBGColor then
      begin
        Brush.Color := FDarkColor;
        Pen.Color := FDarkColor;
        for j := 1 to Length( LED[8] ) do
          Polygon( d[ StrToInt( LED[8][j] ) ] );

        Polygon(d[7]);
      end;

      if (newText[i] <> ' ') and (FLightColor <> FBGColor) then
      begin
        Brush.Color := FLightColor;
        Pen.Color := FLightColor;
        if newText[i] = '-' then
        begin
          for j := 1 to Length( LED[10] ) do
            Polygon( d[ StrToInt( LED[10][j] ) ] );
        end
        else if newText[i] in ['0'..'9'] then
        begin
          for j := 1 to Length( LED[ StrToInt( newText[i] ) ] ) do
            Polygon( d[ StrToInt( LED[ StrToInt( newText[i] ) ][j] ) ] );
          if i = (iPointPos - 1) then
            Polygon(d[7]);
        end;
      end;
    end;
  end;
  Canvas.Draw(0, 0, MemImage.Picture.Graphic);
  MemImage.Free;

  if FAutoSize and (Width <> FWordWidth * Length(newText) +
     FSpace * (Length(newText) - 1) + OffsetX * 2 + 1) then
  begin
    Width := FWordWidth * Length(newText) + FSpace * (Length(newText) - 1) +
      OffsetX * 2;
    Height := FWordHeight + OffsetY * 2;
  end;
end;

procedure TLEDFontNum.MakeMatrix;
begin
  d[0, 0] := Point(OriginX + 2, OriginY);
  d[0, 1] := Point(OriginX + FThick + 1, OriginY + FThick - 1);
  d[0, 2] := Point(OriginX + FWordWidth - FThick - 2 - FThick - 1, OriginY + FThick - 1);
  d[0, 3] := Point(OriginX + FWordWidth - 3 - FThick - 1, OriginY);
  d[0, 4] := d[0, 3];
  d[0, 5] := d[0, 3];

  d[1, 0] := Point(OriginX + FWordWidth - 1 - FThick - 1 , OriginY + 1);
  d[1, 1] := Point(OriginX + FWordWidth - FThick - FThick - 1, OriginY + FThick);
  d[1, 2] := Point(OriginX + FWordWidth - FThick - FThick - 1, OriginY + (FWordHeight - 1) div 2 - FThick);
  d[1, 3] := Point(OriginX + FWordWidth - 1 - FThick - 1, OriginY + (FWordHeight - 1) div 2 - 1);
  d[1, 4] := d[1, 3];
  d[1, 5] := d[1, 3];

  d[2, 0] := Point(OriginX + FWordWidth - 1 - FThick - 1, OriginY + (FWordHeight - 1) div 2 + 1);
  d[2, 1] := Point(OriginX + FWordWidth - FThick - FThick - 1, OriginY + (FWordHeight - 1) div 2 + FThick);
  d[2, 2] := Point(OriginX + FWordWidth - FThick - FThick - 1, OriginY + FWordHeight - FThick - 1);
  d[2, 3] := Point(OriginX + FWordWidth - 1 - FThick - 1, OriginY + FWordHeight - 2);
  d[2, 4] := d[2, 3];
  d[2, 5] := d[2, 3];

  d[3, 0] := Point(OriginX + FWordWidth - 3 - FThick - 1, OriginY + FWordHeight - 1);
  d[3, 1] := Point(OriginX + FWordWidth - FThick - 2 - FThick - 1, OriginY + FWordHeight - FThick);
  d[3, 2] := Point(OriginX + FThick + 1, OriginY + FWordHeight - FThick);
  d[3, 3] := Point(OriginX + 2, OriginY + FWordHeight - 1);
  d[3, 4] := d[3, 3];
  d[3, 5] := d[3, 3];

  d[4, 0] := Point(OriginX, OriginY + FWordHeight - 2);
  d[4, 1] := Point(OriginX + FThick - 1, OriginY + FWordHeight - FThick - 1);
  d[4, 2] := Point(OriginX + FThick - 1, OriginY + (FWordHeight - 1) div 2 + FThick);
  d[4, 3] := Point(OriginX, OriginY + (FWordHeight - 1) div 2 + 1);
  d[4, 4] := d[4, 3];
  d[4, 5] := d[4, 3];

  d[5, 0] := Point(OriginX, OriginY + (FWordHeight - 1) div 2 - 1);
  d[5, 1] := Point(OriginX + FThick - 1, OriginY + (FWordHeight - 1) div 2 - FThick);
  d[5, 2] := Point(OriginX + FThick - 1, OriginY + FThick);
  d[5, 3] := Point(OriginX, OriginY + 1);
  d[5, 4] := d[5, 3];
  d[5, 5] := d[5, 3];

  d[6, 0] := Point(OriginX + FThick, OriginY + (FWordHeight + 1) div 2 - FThick + 1);
  d[6, 1] := Point(OriginX + 2, OriginY + (FWordHeight + 1) div 2 - 1);
  d[6, 2] := Point(OriginX + FThick, OriginY + (FWordHeight + 1) div 2 + FThick - 3);
  d[6, 3] := Point(OriginX + FWordWidth - FThick - 1 - FThick - 1, OriginY + (FWordHeight + 1) div 2 + FThick - 3);
  d[6, 4] := Point(OriginX + FWordWidth - 3 - FThick - 1 , OriginY + (FWordHeight + 1) div 2 - 1);
  d[6, 5] := Point(OriginX + FWordWidth - FThick - 1 - FThick - 1, OriginY + (FWordHeight + 1) div 2 - FThick + 1);
  if FThick = 1 then
  begin
    d[6, 0] := Point(d[6, 0].X + 1, d[6, 0].Y - 1);
    d[6, 2] := Point(d[6, 2].X + 1, d[6, 2].Y + 1);
    d[6, 3] := Point(d[6, 3].X - 1, d[6, 3].Y + 1);
    d[6, 5] := Point(d[6, 5].X - 1, d[6, 5].Y - 1);
  end;

  d[7, 0] := Point(OriginX + FWordWidth - FThick, OriginY + FWordHeight - FThick);
  d[7, 1] := Point(OriginX + FWordWidth - FThick, OriginY + FWordHeight);
  d[7, 2] := Point(OriginX + FwordWidth, OriginY + FWordHeight);
  d[7, 3] := Point(OriginX + FWordWidth, OriginY + FWordHeight - FThick);
  d[7, 4] := d[7, 0];
  d[7, 5] := d[7, 0];
end;

procedure TLEDFontNum.SetOffsetX(const Value: Integer);
begin
  if FOffsetX <> Value then
  begin
    FOffsetX := Value;
    Invalidate;
  end;
end;

procedure TLEDFontNum.SetOffsetY(const Value: Integer);
begin
  if FOffsetY <> Value then
  begin
    FOffsetY := Value;
    Invalidate;
  end;
end;

procedure TLEDFontNum.SetWordWidth(const Value: Integer);
begin
  if (FWordWidth <> Value) and (FThick * 2 < Value) then
  begin
    FWordWidth := Value;
    Invalidate;
  end;
end;

procedure TLEDFontNum.SetWordHeight(const Value: Integer);
begin
  if (FWordHeight <> Value) and (FThick * 4 - 1 < Value) then
  begin
    if (Value - FThick * 4 + 1) mod 2 = 0 then
      FWordHeight := Value
    else
      FWordHeight := Value + 1;
    Invalidate;
  end;
end;

procedure TLEDFontNum.SetThick(const Value: Integer);
begin
  if (FThick <> Value) and (FWordWidth > Value * 2) and
     (FWordHeight > Value * 4 - 1) and
     ((FWordHeight - Value * 4 + 1) mod 2 = 0) then
  begin
    FThick := Value;
    Invalidate;
  end;
end;

procedure TLEDFontNum.SetSpace(const Value: Integer);
begin
  if FSpace <> Value then
  begin
    FSpace := Value;
    Invalidate;
  end;
end;

procedure TLEDFontNum.SetText(const Value: String);
begin
  if FText <> Value then
  begin
    FText := Value;
    Draw;
  end;
end;

procedure TLEDFontNum.SetBGColor(const Value: TColor);
begin
  if FBGColor <> Value then
  begin
    FBGColor := Value;
    Invalidate;
  end;
end;

procedure TLEDFontNum.SetLightColor(const Value: TColor);
begin
  if FLightColor <> Value then
  begin
    FLightColor := Value;
    Invalidate;
  end;
end;

procedure TLEDFontNum.SetDarkColor(const Value: TColor);
begin
  if FDarkColor <> Value then
  begin
    FDarkColor := Value;
    Invalidate;
  end;
end;

procedure TLEDFontNum.SetAutoSize2(const Value: Boolean);
var
  newText: string;
begin
  newText := Text;
  if Pos('.',newText) > 0 then
    Delete(newText, Pos('.',newText), 1);

  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    if FAutoSize and (Width <> FWordWidth * Length(newText) +
       FSpace * (Length(newText) - 1) + OffsetX * 2) then
    begin
      Width := FWordWidth * Length(newText) + FSpace * (Length(newText) - 1) +
        OffsetX * 2;
      Height := FWordHeight + OffsetY * 2;
    end;
  end;
end;

end.

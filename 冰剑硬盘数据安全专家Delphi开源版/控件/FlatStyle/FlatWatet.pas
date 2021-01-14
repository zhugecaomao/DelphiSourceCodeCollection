unit FlatWatet;

interface

{$I FlatStyle.inc}

uses
  Windows, SysUtils, Graphics, Math;

const
  csDefDamping = 20;
  RAND_MAX = $7FFF;

type
  PIntArray = ^TIntArray;
  TIntArray = array[0..65535] of Integer;
  
  PPIntArray = ^TPIntArray;
  TPIntArray = array[0..65535] of PIntArray;

  PRGBArray = ^TRGBArray;
  TRGBArray = array[0..65535] of TRGBTriple;

  PPRGBArray = ^TPRGBArray;
  TPRGBArray = array[0..65535] of PRGBArray;

  TWaterDamping = 1..99;

  TDefineWatet = class(TObject)
  private
    FWaterWidth: Integer;
    FWaterHeight: Integer;
    FWaterBuff1: Pointer;
    FWaterBuff2: Pointer;
    FScanLine1: PPIntArray;
    FScanLine2: PPIntArray;
    FScanLineSrc: PPRGBArray;
    FDamping: TWaterDamping;
  protected
    procedure CalcWater;
    procedure SetDamping(Value: TWaterDamping);
    procedure ClearWater;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetSize(Bitmap: TBitmap);
    procedure Render(Src, Dst: TBitmap);
    procedure Blob(x, y: Integer; ARadius, AHeight: Integer);
    property Damping: TWaterDamping read FDamping write SetDamping;
  end;

implementation

{ TWater }

procedure TDefineWatet.Blob(x, y, ARadius, AHeight: Integer);
var
  Rquad: Integer;
  cx, cy, cyq: Integer;
  WaterLeft, WaterTop, WaterRight, WaterBottom: Integer;
begin
  if (x < 0) or (x > FWaterWidth - 1) then
    x := 1 + ARadius + Random(RAND_MAX) mod (FWaterWidth - 2 * ARadius - 1);
  if (y < 0) or (y > FWaterHeight - 1) then
    y := 1 + ARadius + Random(RAND_MAX) mod (FWaterHeight - 2 * ARadius - 1);

  WaterLeft   := -Min(x, ARadius);
  WaterRight  := Min(FWaterWidth - 1 - x, ARadius);
  WaterTop    := -Min(y, ARadius);
  WaterBottom := Min(FWaterHeight - 1 - y, ARadius);
  Rquad       := ARadius * ARadius;
  for cy := WaterTop to WaterBottom do
  begin
    cyq := cy * cy;
    for cx := WaterLeft to WaterRight do
    begin
      if (cx * cx + cyq <= Rquad) then
      begin
        Inc(FScanLine1[cy + y][cx + x], AHeight);
      end;
    end;
  end;
end;

procedure TDefineWatet.CalcWater;
var
  x, y, xl, xr: Integer;
  NewH: Integer;
  P, P1, P2, P3: PIntArray;
  PT: Pointer;
  Rate: Integer;
begin
  Rate := (100 - FDamping) * 256 div 100;
  for y := 0 to FWaterHeight - 1 do
  begin
    P  := FScanLine2[y];
    P1 := FScanLine1[Max(y - 1, 0)];
    P2 := FScanLine1[y];
    P3 := FScanLine1[Min(y + 1, FWaterHeight - 1)];
    for x := 0 to FWaterWidth - 1 do
    begin
      xl := Max(x - 1, 0);
      xr := Min(x + 1, FWaterWidth - 1);
      NewH := (P1[xl] + P1[x] + P1[xr] + P2[xl] + P2[xr] + P3[xl] + P3[x] + P3[xr]) div 4 - P[x];
      P[x] := NewH * Rate div 256;
    end;
  end;
  
  PT := FWaterBuff1;
  FWaterBuff1 := FWaterBuff2;
  FWaterBuff2 := PT;
  PT := FScanLine1;
  FScanLine1 := FScanLine2;
  FScanLine2 := PT;
end;

procedure TDefineWatet.ClearWater;
begin
  if FWaterBuff1 <> nil then
    ZeroMemory(FWaterBuff1, (FWaterWidth * FWaterHeight) * SizeOf(Integer));
 if FWaterBuff2 <> nil then
    ZeroMemory(FWaterBuff2, (FWaterWidth * FWaterHeight) * SizeOf(Integer));
end;

constructor TDefineWatet.Create;
begin
  inherited;
  FDamping := csDefDamping;
end;

destructor TDefineWatet.Destroy;
begin
  if FWaterBuff1 <> nil then
     FreeMem(FWaterBuff1);
  if FWaterBuff2 <> nil then
     FreeMem(FWaterBuff2);
  if FScanLine1 <> nil then
     FreeMem(FScanLine1);
  if FScanLine2 <> nil then
     FreeMem(FScanLine2);
  if FScanLineSrc <> nil then
     FreeMem(FScanLineSrc);
  inherited Destroy;
end;

procedure TDefineWatet.Render(Src, Dst: TBitmap);
var
  dx, dy: Integer;
  i, c, x, y: Integer;
  P1, P2, P3: PIntArray;
  PSrc, PDst: PRGBArray;
  PSrcDot, PDstDot: PRGBTriple;
  BytesPerLine1, BytesPerLine2: Integer;
begin
  CalcWater;
  Src.PixelFormat := pf24bit;
  Dst.PixelFormat := pf24bit;
  
  FScanLineSrc[0] := Src.ScanLine[0];
  BytesPerLine1 := Integer(Src.ScanLine[1]) - Integer(FScanLineSrc[0]);
  for i := 1 to FWaterHeight - 1 do
    FScanLineSrc[i] := PRGBArray(Integer(FScanLineSrc[i - 1]) + BytesPerLine1);

  PDst := Dst.ScanLine[0];
  BytesPerLine2 := Integer(Dst.ScanLine[1]) - Integer(PDst);

  for y := 0 to FWaterHeight - 1 do
  begin
    PSrc := FScanLineSrc[y];
    P1 := FScanLine1[Max(y - 1, 0)];
    P2 := FScanLine1[y];
    P3 := FScanLine1[Min(y + 1, FWaterHeight - 1)];
    for x := 0 to FWaterWidth - 1 do
    begin
      dx := P2[Max(x - 1, 0)] - P2[Min(x + 1, FWaterWidth - 1)];
      dy := P1[x] - P3[x];

      if (x + dx >= 0) and (x + dx < FWaterWidth) and (y + dy >= 0) and
        (y + dy < FWaterHeight) then
      begin
        PSrcDot := @FScanLineSrc[y + dy][x + dx];
        PDstDot := @PDst[x];

        c := PSrcDot.rgbtBlue - dx;
        if c < 0 then
          PDstDot.rgbtBlue := 0
        else if c > 255 then
          PDstDot.rgbtBlue := 255
        else
          PDstDot.rgbtBlue := c;

        c := PSrcDot.rgbtGreen - dx;
        if c < 0 then
          PDstDot.rgbtGreen := 0
        else if c > 255 then
          PDstDot.rgbtGreen := 255
        else
          PDstDot.rgbtGreen := c;
          
        c := PSrcDot.rgbtRed - dx;
        if c < 0 then
          PDstDot.rgbtRed := 0
        else if c > 255 then
          PDstDot.rgbtRed := 255
        else
          PDstDot.rgbtRed := c;
      end
      else
      begin
        PDst[x] := PSrc[x];
      end;
    end;
    PDst := PRGBArray(Integer(PDst) + BytesPerLine2);
  end;
end;

procedure TDefineWatet.SetDamping(Value: TWaterDamping);
begin
  if (Value >= Low(TWaterDamping)) and (Value <= High(TWaterDamping)) then
      FDamping := Value;
end;

procedure TDefineWatet.SetSize;
var
  i: Integer;
begin
  FWaterWidth  := Bitmap.Width;
  FWaterHeight := Bitmap.Height;
  if (FWaterWidth <= 0) or (FWaterHeight <= 0) then
  begin
    FWaterWidth  := 0;
    FWaterHeight := 0;
  end;
  ReallocMem(FWaterBuff1,  FWaterWidth  * FWaterHeight * SizeOf(Integer));
  ReallocMem(FWaterBuff2,  FWaterWidth  * FWaterHeight * SizeOf(Integer));
  ReallocMem(FScanLine1,   FWaterHeight * SizeOf(PIntArray));
  ReallocMem(FScanLine2,   FWaterHeight * SizeOf(PIntArray));
  ReallocMem(FScanLineSrc, FWaterHeight * SizeOf(PRGBArray));
  ClearWater;
  if (FWaterHeight > 0)and(FWaterWidth > 0) then
  begin
    FScanLine1[0] := FWaterBuff1;
    FScanLine2[0] := FWaterBuff2;
    for i := 1 to FWaterHeight - 1 do
    begin
      FScanLine1[i] := @FScanLine1[i - 1][FWaterWidth];
      FScanLine2[i] := @FScanLine2[i - 1][FWaterWidth];      
    end;
  end;
end;

end.

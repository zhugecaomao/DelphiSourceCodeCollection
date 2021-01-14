unit Tunnel;

interface

uses
  Windows, Math;

const
  szAppName = 'Tunnel';
  szTitle = 'Tunnel: Palette Animation Demo';
  ID_TIMER = 1;

var
  plp: PLogPalette;

function CreateRoutine(hWnd: HWND): HPALETTE; // 初始化
procedure PaintRoutine(hdc: HDC; cxClient, cyClient: Integer); // 绘制
procedure TimerRoutine(hdc: HDC; hPalette: HPALETTE); // 修改
procedure DestroyRoutine(hWnd: HWND; hPalette: HPALETTE); // 反初始化

implementation

  // 初始化
function CreateRoutine(hWnd: HWND): HPALETTE;
var
  byGrayLevel: Byte;
  J: Integer;
begin
  GetMem(plp, SizeOf(TLogPalette) + 255 * SizeOf(TPaletteEntry));
 // Initialize the fields of the LOGPALETTE structure
  plp.palVersion := $300;
  plp.palNumEntries := 128;
  for J := 0 to 127 do
  begin
    if (J < 64) then byGrayLevel := 4 * J else byGrayLevel := Min(255, 4 * (128 - J));
    plp.palPalEntry[J].peRed := byGrayLevel;
    plp.palPalEntry[J].peGreen := byGrayLevel;
    plp.palPalEntry[J].peBlue := byGrayLevel;
    plp.palPalEntry[J].peFlags := PC_RESERVED;
    plp.palPalEntry[J + 128].peRed := byGrayLevel;
    plp.palPalEntry[J + 128].peGreen := byGrayLevel;
    plp.palPalEntry[J + 128].peBlue := byGrayLevel;
    plp.palPalEntry[J + 128].peFlags := PC_RESERVED;
  end;
  Result := CreatePalette(plp^);
  SetTimer(hWnd, ID_TIMER, 50, nil);
end;

  // 绘制
procedure PaintRoutine(hdc: HDC; cxClient, cyClient: Integer);
var
  hBrush, J: DWORD;
  Rect: TRect;
begin
  for J := 0 to 126 do
  begin
   // Use a RECT structure for each of 128 rectangles
    Rect.Left := J * cxClient div 255;
    Rect.Top := J * cyClient div 255;
    Rect.Right := cxClient - J * cxClient div 255;
    Rect.Bottom := cyClient - J * cyClient div 255;
    hBrush := CreateSolidBrush(PaletteIndex(J));
   // Fill the rectangle and delete the brush
    FillRect(hdc, Rect, hBrush);
    DeleteObject(hBrush);
  end;
end;

  // 修改
procedure TimerRoutine(hdc: HDC; hPalette: HPALETTE);
const
{$J+}
  iLevel: Integer = 0;
{$J-}
begin
  iLevel := (iLevel + 1) mod 128;
  AnimatePalette(hPalette, 0, 128,
    PPaletteEntry(Integer(@plp.palPalEntry[0]) + iLevel * SizeOf(TPaletteEntry)));
end;

  // 反初始化
procedure DestroyRoutine(hWnd: HWND; hPalette: HPALETTE);
begin
  KillTimer(hWnd, ID_TIMER);
  DeleteObject(hPalette);
  FreeMem(plp);
end;

end.

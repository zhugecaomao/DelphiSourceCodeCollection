unit AllColor;

interface

uses
  Windows, Math;

const
  szAppName = 'AllColor';
  szTitle = 'AllColor: Palette Animation Demo';
  ID_TIMER = 1;

var
  pe: TPaletteEntry;
  iIncr: Integer;

function CreateRoutine(hWnd: HWND): HPALETTE; // 初始化
procedure PaintRoutine(hdc: HDC; cxClient, cyClient: Integer); // 绘制
procedure TimerRoutine(hdc: HDC; hPalette: HPALETTE); // 修改
procedure DestroyRoutine(hWnd: HWND; hPalette: HPALETTE); // 反初始化

implementation

  // 初始化
function CreateRoutine(hWnd: HWND): HPALETTE;
var
  hWndDc: DWORD;
  lp: TLogPalette;
begin
  hWndDc := GetDC(hWnd);
  iIncr := 1 shl (8 - GetDeviceCaps(hWndDc, COLORRES) div 3); // 渐变步长
  ReleaseDC(hWnd, hWndDc);

  lp.palVersion := $0300 ;
  lp.palNumEntries := 1;
  lp.palPalEntry[0].peRed := 0;
  lp.palPalEntry[0].peGreen := 0;
  lp.palPalEntry[0].peBlue := 0;
  lp.palPalEntry[0].peFlags := PC_RESERVED;
  Result := CreatePalette(lp);

  pe := lp.palPalEntry[0];
  SetTimer(hWnd, ID_TIMER, 10, nil);
end;

procedure DisplayRGB(hdc: HDC; ppe: PPaletteEntry);
var
  szBuffer: array[0..16] of Char;
  OutList: array[0..3] of DWORD;
begin
  OutList[0] := ppe.peRed;
  OutList[1] := ppe.peGreen;
  OutList[2] := ppe.peBlue;
  wvsprintf(szBuffer, ' %02X-%02X-%02X ', @OutList[0]);
  TextOut(hdc, 0, 0, szBuffer, lstrlen(szBuffer));
end;

  // 绘制
procedure PaintRoutine(hdc: HDC; cxClient, cyClient: Integer);
var
  hBrush: DWORD;
  Rect: TRect;
begin
 // Draw Palette Index 0 on entire window
  hBrush := CreateSolidBrush(PaletteIndex(0));
  SetRect(Rect, 0, 0, cxClient, cyClient);
  FillRect(hdc, Rect, hBrush);
  DeleteObject(SelectObject(hdc, GetStockObject(WHITE_BRUSH)));
 // Display the RGB value
  DisplayRGB(hdc, @pe);
end;

  // 修改
procedure TimerRoutine(hdc: HDC; hPalette: HPALETTE);
const
{$J+}
  bRedUp: Boolean = TRUE;
  bGreenUp: Boolean = TRUE;
  bBlueUp: Boolean = TRUE;
{$J-}
begin
 // Define new color value
  Inc(pe.peBlue, IfThen(bBlueUp, iIncr, -iIncr));
  if (pe.peBlue = Byte(IfThen(bBlueUp, 0, 256 - iIncr))) then
  begin
    pe.peBlue := IfThen(bBlueUp, 256 - iIncr, 0);
    bBlueUp := not bBlueUp;
    Inc(pe.peGreen, IfThen(bGreenUp, iIncr, -iIncr));
    if (pe.peGreen = Byte(IfThen(bGreenUp, 0, 256 - iIncr))) then
    begin
      pe.peGreen := IfThen(bGreenUp, 256 - iIncr, 0);
      bGreenUp := not bGreenUp;
      Inc(pe.peRed, IfThen(bRedUp, iIncr, -iIncr));
      if (pe.peRed = Byte(IfThen(bRedUp, 0, 256 - iIncr))) then
      begin
        pe.peRed := Byte(IfThen(bRedUp, 256 - iIncr, 0));
        bRedUp := not bRedUp;
      end;
    end;
  end;
 // Animate the palette
  AnimatePalette(hPalette, 0, 1, @pe);
  DisplayRGB(hdc, @pe);
end;

  // 反初始化
procedure DestroyRoutine(hWnd: HWND; hPalette: HPALETTE);
begin
  KillTimer(hWnd, ID_TIMER);
  DeleteObject(hPalette);
end;

end.

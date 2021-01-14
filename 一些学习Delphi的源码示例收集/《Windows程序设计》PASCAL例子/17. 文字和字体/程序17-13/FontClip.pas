unit  FontClip;

interface

uses
  Windows, EzFont;

const
  szAppName = 'FontClip';
  szTitle = 'FontClip: Using Path for Clipping on Font';

procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
  
implementation

procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
const           
  szString = 'Clipping';
var
  hFont: LongWord; // HFONT
  y, iOffset: Integer;
  pt: array[0..3] of TPoint;
  Size: TSize;
begin
  hFont := EzCreateFont(hdc, 'Times New Roman', 1200, 0, 0, TRUE);
  SelectObject(hdc, hFont);
  GetTextExtentPoint32(hdc, szString, lstrlen(szString), Size);

  BeginPath(hdc);
  TextOut(hdc, (cxArea - Size.cx) div 2, (cyArea - Size.cy) div 2, szString, lstrlen(szString));
  EndPath(hdc);

 // Set clipping area
  SelectClipPath(hdc, RGN_COPY);

 // Draw Bezier splines
  iOffset := (cxArea + cyArea) div 4;
  y := -iOffset;
  while (y < cyArea + iOffset) do
  begin
    pt[0].x := 0;
    pt[0].y := y;
    pt[1].x := cxArea div 3;
    pt[1].y := y + iOffset;
    pt[2].x := 2 * cxArea div 3;
    pt[2].y := y - iOffset;
    pt[3].x := cxArea;
    pt[3].y := y;
    SelectObject(hdc, CreatePen(PS_SOLID, 1, RGB(Random(256), Random(256), Random(256))));
    PolyBezier(hdc, pt, 4);
    DeleteObject(SelectObject(hdc, GetStockObject (BLACK_PEN)));
    Inc(y);
  end;

  DeleteObject(SelectObject(hdc, GetStockObject(WHITE_BRUSH)));
  SelectObject(hdc, GetStockObject(SYSTEM_FONT));
  DeleteObject(hFont);
end;

end.

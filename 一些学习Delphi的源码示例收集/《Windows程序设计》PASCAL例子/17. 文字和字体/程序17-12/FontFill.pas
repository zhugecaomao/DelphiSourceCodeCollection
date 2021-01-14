unit  FontFill;

interface

uses
  Windows, EzFont;

const
  szAppName = 'FontFill';
  szTitle = 'FontFill: Using Path to Fill Font';

procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
  
implementation

procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
const           
  szString = 'Filling';
var
  hFont: LongWord; // HFONT
  Size: TSize;
begin
  hFont := EzCreateFont(hdc, 'Times New Roman', 1440, 0, 0, TRUE);
  SelectObject(hdc, hFont);
  SetBkMode(hdc, TRANSPARENT); 
  GetTextExtentPoint32(hdc, szString, lstrlen(szString), Size);

  BeginPath(hdc);
  TextOut(hdc, (cxArea - Size.cx) div 2, (cyArea - Size.cy) div 2, szString, lstrlen(szString));
  EndPath(hdc);

  SelectObject(hdc, CreateHatchBrush(HS_DIAGCROSS, RGB(255, 0, 0)));
  SetBkColor(hdc, RGB(0, 0, 255));
  SetBkMode(hdc, OPAQUE);

  StrokeAndFillPath(hdc);
  
  DeleteObject(SelectObject(hdc, GetStockObject(WHITE_BRUSH)));
  SelectObject(hdc, GetStockObject(SYSTEM_FONT));
  DeleteObject(hFont);
end;

end.

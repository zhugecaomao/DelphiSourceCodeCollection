unit  FontOut2;

interface

uses
  Windows, EzFont;

const
  szAppName = 'FontOut2';
  szTitle = 'FontOut2: Using Path to Outline Font';

procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
  
implementation

procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
const           
  szString = 'Outline';
var
  hFont: LongWord; // HFONT
  lb: TLogBrush;
  Size: TSize;
begin
  hFont := EzCreateFont(hdc, 'Times New Roman', 1440, 0, 0, TRUE);
  SelectObject(hdc, hFont);
  SetBkMode(hdc, TRANSPARENT);
  GetTextExtentPoint32(hdc, szString, lstrlen(szString), Size);

  BeginPath(hdc);
  TextOut(hdc, (cxArea - Size.cx) div 2, (cyArea - Size.cy) div 2, szString, lstrlen(szString));
  EndPath(hdc);

  lb.lbStyle := BS_SOLID;
  lb.lbColor := RGB(255, 0, 0);
  lb.lbHatch := 0;
  SelectObject(hdc, ExtCreatePen(PS_GEOMETRIC or PS_DOT,
    GetDeviceCaps(hdc, LOGPIXELSX) div 24, lb, 0, nil));
  StrokePath(hdc);

  DeleteObject(SelectObject(hdc, GetStockObject(BLACK_PEN)));
  SelectObject(hdc, GetStockObject(SYSTEM_FONT));
  DeleteObject(hFont);
end;

end.

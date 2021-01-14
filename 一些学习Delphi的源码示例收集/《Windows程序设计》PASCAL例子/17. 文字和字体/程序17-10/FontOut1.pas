unit  FontOut1;

interface

uses
  Windows, EzFont;

const
  szAppName = 'FontOut1';
  szTitle = 'FontOut1: Using Path to Outline Font';

procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
  
implementation

procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
const           
  szString = 'Outline';
var
  hFont: LongWord; // HFONT
  Size: TSize;
begin
  hFont := EzCreateFont(hdc, 'Times New Roman', 1440, 0, 0, TRUE);
  SelectObject(hdc, hFont);
  GetTextExtentPoint32(hdc, szString, lstrlen(szString), Size);

  BeginPath(hdc);
  TextOut(hdc, (cxArea - Size.cx) div 2, (cyArea - Size.cy) div 2, szString, lstrlen(szString));
  EndPath(hdc);
  StrokePath(hdc);

  SelectObject(hdc, GetStockObject(SYSTEM_FONT));
  DeleteObject(hFont);
end;

end.

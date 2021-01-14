unit  FontRot;

interface

uses
  Windows, EzFont;

const
  szAppName = 'FontRot';
  szTitle = 'FontRot: Rotated Fonts';

procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
  
implementation

procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
const
  szString = '  Rotation';
var  
  hFont: LongWord; // HFONT
  i: Integer;
  lf: TLogFont;
begin        
  hFont := EzCreateFont(hdc, 'Times New Roman', 540, 0, 0, TRUE);
  GetObject(hFont, SizeOf(TLogFont), @lf);
  DeleteObject(hFont);
  SetBkMode(hdc, TRANSPARENT);
  SetTextAlign(hdc, TA_BASELINE);
  SetViewportOrgEx(hdc, cxArea div 2, cyArea div 2, nil);
  for i := 0 to 11 do
  begin
    lf.lfEscapement := i * 300;
    lf.lfOrientation := lf.lfEscapement;
    SelectObject(hdc, CreateFontIndirect(lf));
    TextOut(hdc, 0, 0, szString, lstrlen(szString));
    DeleteObject(SelectObject(hdc, GetStockObject(SYSTEM_FONT)));
  end;
end;

end.

unit  EzTest;

interface

uses
  Windows, EzFont;

const
  szAppName = 'EzTest';
  szTitle = 'EZTest: Test of EZFONT';

procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
  
implementation

procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
var
  hFont: LongWord; // HFONT
  y, iPointSize: Integer;
  lf: TLogFont;
  szBuffer: array[0..100] of Char;
  tm: TTextMetric;
  List: array[0..3] of LongWord;
begin  
 // Set Logical Twips mapping mode
  SetMapMode(hdc, MM_ANISOTROPIC);
  SetWindowExtEx(hdc, 1440, 1440, nil);
  SetViewportExtEx(hdc, GetDeviceCaps(hdc, LOGPIXELSX), GetDeviceCaps(hdc, LOGPIXELSY), nil);
 // Try some fonts
  y := 0;
  for iPointSize := 80 to 120 do
  begin
    hFont := EzCreateFont(hdc, 'Times New Roman', iPointSize, 0, 0, TRUE);
    GetObject(hFont, SizeOf(LOGFONT), @lf);
    SelectObject(hdc, hFont);
    GetTextMetrics(hdc, tm);
    List[0] := iPointSize div 10;
    List[1] := iPointSize mod 10;
    List[2] := lf.lfHeight;
    List[3] := tm.tmHeight;
    TextOut(hdc, 0, y, szBuffer, wvsprintf(szBuffer,
      'Times New Roman font of %i.%i points, lf.lfHeight = %i, tm.tmHeight = %i',
      @List[0]));
    DeleteObject(SelectObject(hdc, GetStockObject(SYSTEM_FONT)));
    Inc(y, tm.tmHeight);
  end;
end;

end.

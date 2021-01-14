unit EzFont;

interface

uses Windows;

const
  EZ_ATTR_BOLD      = 1;
  EZ_ATTR_ITALIC    = 2;
  EZ_ATTR_UNDERLINE = 4;
  EZ_ATTR_STRIKEOUT = 8;

function EzCreateFont(hdc: HDC; szFaceName: PChar;
  iDeciPtHeight, iDeciPtWidth, iAttributes: Integer; fLogRes: Boolean): HFONT;

implementation

uses Math;

function EzCreateFont(hdc: HDC; szFaceName: PChar;
  iDeciPtHeight, iDeciPtWidth, iAttributes: Integer; fLogRes: Boolean): HFONT;
var
  cxDpi, cyDpi: Extended;
  lf: TLogFont;
  pt: TPoint;
  tm: TTextMetric;
begin
  SaveDC(hdc);
  SetGraphicsMode(hdc, GM_ADVANCED);
  ModifyWorldTransform(hdc, PXForm(nil)^, MWT_IDENTITY);
  SetViewportOrgEx(hdc, 0, 0, nil);
  SetWindowOrgEx(hdc, 0, 0, nil);
  if fLogRes then
  begin
    cxDpi := GetDeviceCaps(hdc, LOGPIXELSX);
    cyDpi := GetDeviceCaps(hdc, LOGPIXELSY);
  end else
  begin
    cxDpi := (25.4 * GetDeviceCaps(hdc, HORZRES) / GetDeviceCaps(hdc, HORZSIZE));
    cyDpi := (25.4 * GetDeviceCaps(hdc, VERTRES) / GetDeviceCaps(hdc, VERTSIZE));
  end;
  pt.x := Trunc(iDeciPtWidth * cxDpi / 72);
  pt.y := Trunc(iDeciPtHeight * cyDpi / 72);
  DPtoLP(hdc, pt, 1);
  lf.lfHeight := - Trunc(Abs(pt.y) / 10.0 + 0.5);
  lf.lfWidth := 0;
  lf.lfEscapement := 0;
  lf.lfOrientation := 0;
  lf.lfWeight := IfThen((iAttributes and EZ_ATTR_BOLD) <> 0, 700, 0);
  lf.lfItalic := IfThen((iAttributes and EZ_ATTR_ITALIC) <> 0, 1, 0);
  lf.lfUnderline := IfThen((iAttributes and EZ_ATTR_UNDERLINE) <> 0, 1, 0);
  lf.lfStrikeOut := IfThen((iAttributes and EZ_ATTR_STRIKEOUT) <> 0, 1, 0);
  lf.lfCharSet := DEFAULT_CHARSET;
  lf.lfOutPrecision := 0;
  lf.lfClipPrecision := 0;
  lf.lfQuality := 0;
  lf.lfPitchAndFamily := 0;
  lstrcpy(lf.lfFaceName, szFaceName);
  Result := CreateFontIndirect(lf);
  if (iDeciPtWidth <> 0) then
  begin
    Result := SelectObject(hdc, Result);
    GetTextMetrics(hdc, tm);
    DeleteObject(SelectObject(hdc, Result));
    lf.lfWidth := Trunc(tm.tmAveCharWidth * Abs(pt.x) / Abs(pt.y) + 0.5);
    Result := CreateFontIndirect(lf);
  end;
  RestoreDC(hdc, -1);
end;

end.

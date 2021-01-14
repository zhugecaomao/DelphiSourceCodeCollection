unit EMF8;

interface

uses Windows;

const
  szClass = 'EMF8';
  szTitle = 'EMF8: Enhanced MetaFile Demo #8';

procedure CreateRoutine(hWnd: HWND); // 建立emf8.emf并绘制上标尺
procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer); // 将emf8.emf绘制在中间

implementation

  // 绘制标尺
procedure DrawRuler(hdc: HDC; cx, cy: Integer);
var
  iAdj, i, iHeight: Integer;
  lf: TLOGFONT;
  ch: Char;
begin
  if (GetVersion() and $80000000) <> 0 then iAdj := 0 else iAdj := 1;

 // Black pen with 1-point width
  SelectObject(hdc, CreatePen(PS_SOLID, cx div 72 div 6, 0));

 // Rectangle surrounding entire pen (with adjustment)
  Rectangle(hdc, iAdj, iAdj, cx + iAdj + 1, cy + iAdj + 1);

 // Tick marks
  for i := 1 to 95 do
  begin
    if (i mod 16 = 0) then iHeight := cy div 2 // inches
    else if (i mod 8 = 0) then iHeight := cy div 3 // half inches
      else if (i mod 4 = 0) then iHeight := cy div 5 // quarter inches
        else if (i mod 2 = 0) then iHeight := cy div 8 // eighths
          else iHeight := cy div 12; // sixteenths
    MoveToEx(hdc, i * cx div 96, cy, nil);
    LineTo(hdc, i * cx div 96, cy - iHeight);
  end;

 // Create logical font
  FillMemory(@lf, SizeOf(lf), 0);
  lf.lfHeight := cy div 2;
  lstrcpy(lf.lfFaceName, 'Times New Roman');
  SelectObject(hdc, CreateFontIndirect(lf));
  SetTextAlign(hdc, TA_BOTTOM or TA_CENTER);
  SetBkMode(hdc, TRANSPARENT);

 // Display numbers
  for i := 1 to 4 do
  begin
    ch := Char(i + $30);
    TextOut(hdc, i * cx div 6, cy div 2, @ch, 1);
  end;

 // Clean up
  DeleteObject(SelectObject(hdc, GetStockObject(SYSTEM_FONT)));
  DeleteObject(SelectObject(hdc, GetStockObject(BLACK_PEN)));
end;

  // 建立emf8.emf并绘制上标尺
procedure CreateRoutine(hWnd: HWND);
var
  hdcEMF: HDC;
  hemf: HENHMetaFile;
  cxMms, cyMms, cxPix, cyPix, xDpi, yDpi: Integer;
begin
  hdcEMF := CreateEnhMetaFile(0, 'emf8.emf', nil, 'EMF8'#0'EMF Demo #8'#0#0);
  if (hdcEMF = 0) then Exit;

  cxMms := GetDeviceCaps(hdcEMF, HORZSIZE);
  cyMms := GetDeviceCaps(hdcEMF, VERTSIZE);
  cxPix := GetDeviceCaps(hdcEMF, HORZRES);
  cyPix := GetDeviceCaps(hdcEMF, VERTRES);
  xDpi := cxPix * 254 div cxMms div 10;
  yDpi := cyPix * 254 div cyMms div 10;

  DrawRuler(hdcEMF, 6 * xDpi, yDpi);
  hemf := CloseEnhMetaFile(hdcEMF);
  DeleteEnhMetaFile(hemf);
end;

  // 将emf8.emf绘制在中间
procedure PaintRoutine(hWnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
var
  emh: TEnhMetaHeader;
  hemf: HENHMetaFile;
  cxImage, cyImage: Integer;
  Rect: TRect;
begin
  hemf := GetEnhMetaFile('emf8.emf');
  GetEnhMetaFileHeader(hemf, SizeOf(emh), @emh);
  cxImage := emh.rclBounds.Right - emh.rclBounds.Left;
  cyImage := emh.rclBounds.Bottom - emh.rclBounds.Top;
  Rect.Left := (cxArea - cxImage) div 2;
  Rect.Right := (cxArea + cxImage) div 2;
  Rect.Top := (cyArea - cyImage) div 2;
  Rect.Bottom := (cyArea + cyImage) div 2;
  PlayEnhMetaFile(hdc, hemf, Rect);
  DeleteEnhMetaFile(hemf);
end;

end.

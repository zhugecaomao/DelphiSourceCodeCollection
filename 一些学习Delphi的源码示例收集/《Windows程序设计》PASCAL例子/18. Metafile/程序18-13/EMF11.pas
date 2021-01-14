unit EMF11;

interface

uses Windows;

const
  szClass = 'EMF11';
  szTitle = 'EMF11: Enhanced MetaFile Demo #11';

procedure CreateRoutine(hWnd: HWND); // 建立emf
procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer); // 绘制emf

implementation

  // 绘制标尺
procedure DrawRuler(hdc: HDC; cx, cy: Integer);
var
  i, iHeight: Integer;
  lf: TLogFont;
  ch: Char;
begin
 // Black pen with 1-point width
  SelectObject(hdc, CreatePen(PS_SOLID, cx div 72 div 6, 0));

 // Rectangle surrounding entire pen (with adjustment)
  if (GetVersion() and $80000000) <> 0 then
    Rectangle(hdc, 0, -2, cx + 2, cy) // Windows 98
  else
    Rectangle(hdc, 0, -1, cx + 1, cy); // Windows NT

 // Tick marks
  for i := 1 to 95 do
  begin
    if (i mod 16 = 0) then iHeight := cy div 2 // inches
    else if (i mod 8 = 0) then iHeight := cy div 3 // half inches
         else if (i mod 4 = 0) then iHeight := cy div 5 // quarter inches
              else if (i mod 2 = 0) then iHeight := cy div 8 // eighths
                   else iHeight := cy div 12; // sixteenths
    MoveToEx(hdc, i * cx div 96, 0, nil);
    LineTo(hdc, i * cx div 96, iHeight);
  end;

  // Create logical font
  FillMemory(@lf, SizeOf(lf), 0);
  lf.lfHeight := cy div 2;
  lstrcpy(lf.lfFaceName, 'Times New Roman');
  SelectObject(hdc, CreateFontIndirect(lf));
  SetTextAlign(hdc, TA_BOTTOM or TA_CENTER);
  SetBkMode(hdc, TRANSPARENT);

  // Display numbers
  for i := 1 to 5 do
  begin
    ch := Char(i + $30);
    TextOut(hdc, i * cx div 6, cy div 2, @ch, 1);
  end;

  // Clean up
  DeleteObject(SelectObject(hdc, GetStockObject(SYSTEM_FONT)));
  DeleteObject(SelectObject(hdc, GetStockObject(BLACK_PEN)));
end;

  // 建立emf
procedure CreateRoutine(hWnd: HWND);
var
  hdcEMF: HDC;
  hemf: HENHMetaFile;
begin
  hdcEMF := CreateEnhMetaFile(0, 'emf11.emf', nil, 'EMF11'#0'EMF Demo #11'#0#0);
  SetMapMode(hdcEMF, MM_LOENGLISH); // 自动转换
  DrawRuler(hdcEMF, 600, 100);
  hemf := CloseEnhMetaFile(hdcEMF);
  DeleteEnhMetaFile(hemf);
end;

  // 绘制emf
procedure PaintRoutine(hWnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
var
  emh: TEnhMetaHeader;
  hemf: HENHMetaFile;
  cxMms, cyMms, cxPix, cyPix, cxImage, cyImage: Integer;
  Rect: TRect;
begin
  cxMms := GetDeviceCaps(hdc, HORZSIZE);
  cyMms := GetDeviceCaps(hdc, VERTSIZE);
  cxPix := GetDeviceCaps(hdc, HORZRES);
  cyPix := GetDeviceCaps(hdc, VERTRES);

  hemf := GetEnhMetaFile('emf11.emf');
  GetEnhMetaFileHeader(hemf, SizeOf(emh), @emh);

  cxImage := emh.rclFrame.Right - emh.rclFrame.Left;
  cyImage := emh.rclFrame.Bottom - emh.rclFrame.Top;
  cxImage := cxImage * cxPix div cxMms div 100;
  cyImage := cyImage * cyPix div cyMms div 100;

  Rect.Left := (cxArea - cxImage) div 2;
  Rect.Top  := (cyArea - cyImage) div 2;
  Rect.Right := (cxArea + cxImage) div 2;
  Rect.Bottom := (cyArea + cyImage) div 2;
  
  PlayEnhMetaFile(hdc, hemf, Rect);
  DeleteEnhMetaFile(hemf);
end;

end.

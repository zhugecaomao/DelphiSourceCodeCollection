unit EMF10;

interface

uses Windows;

const
  szClass = 'EMF10';
  szTitle = 'EMF10: Enhanced MetaFile Demo #10';

procedure CreateRoutine(hWnd: HWND); // 建立emf
procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer); // 绘制emf

implementation

uses Math;

  // 建立emf
procedure CreateRoutine(hWnd: HWND);
begin
end;

  // 绘制emf
procedure PaintRoutine(hWnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
var
  emh: TEnhMetaHeader;
  fScale: Extended;
  hemf: HENHMetaFile;
  cxMms, cyMms, cxPix, cyPix, cxImage, cyImage: Integer;
  Rect: TRect;
begin
  cxMms := GetDeviceCaps(hdc, HORZSIZE);
  cyMms := GetDeviceCaps(hdc, VERTSIZE);
  cxPix := GetDeviceCaps(hdc, HORZRES);
  cyPix := GetDeviceCaps(hdc, VERTRES);

  hemf := GetEnhMetaFile('..\程序18-10\emf8.emf');
  GetEnhMetaFileHeader(hemf, SizeOf(emh), @emh);

  cxImage := emh.rclFrame.Right - emh.rclFrame.Left;
  cyImage := emh.rclFrame.Bottom - emh.rclFrame.Top;
  cxImage := cxImage * cxPix div cxMms div 100;
  cyImage := cyImage * cyPix div cyMms div 100;
  fScale := Min(cxArea / cxImage, cyArea / cyImage);
  cxImage := Trunc(fScale * cxImage);
  cyImage := Trunc(fScale * cyImage);

  Rect.Left  := (cxArea - cxImage) div 2;
  Rect.Right := (cxArea + cxImage) div 2;
  Rect.Top := (cyArea - cyImage) div 2;
  Rect.Bottom := (cyArea + cyImage) div 2;
  
  PlayEnhMetaFile(hdc, hemf, Rect);
  DeleteEnhMetaFile(hemf);
end;

end.

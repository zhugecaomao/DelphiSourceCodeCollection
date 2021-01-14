unit EMF13;

interface

uses Windows;

const
  szClass = 'EMF13';
  szTitle = 'EMF13: Enhanced MetaFile Demo #13';

procedure CreateRoutine(hWnd: HWND); // 建立emf
procedure PaintRoutine(hwnd: HWND; hdc: HDC; cxArea, cyArea: Integer); // 绘制emf

implementation

  // 建立emf
procedure CreateRoutine(hWnd: HWND);
begin
end;

  // 绘制emf
procedure PaintRoutine(hWnd: HWND; hdc: HDC; cxArea, cyArea: Integer);
var
  emh: TEnhMetaHeader;
  hemf: HENHMetaFile;
  pt: TPoint;
  cxImage, cyImage: Integer;
  Rect: TRect;
begin
  SetMapMode(hdc, MM_HIMETRIC);
  SetViewportOrgEx(hdc, 0, cyArea, nil);

  pt.x := cxArea;
  pt.y := 0;
  DPtoLP(hdc, pt, 1);

  hemf := GetEnhMetaFile('..\程序18-13\emf11.emf');
  GetEnhMetaFileHeader(hemf, SizeOf(emh), @emh);

  cxImage := emh.rclFrame.Right - emh.rclFrame.Left;
  cyImage := emh.rclFrame.Bottom - emh.rclFrame.Top;

  Rect.Left := (pt.x - cxImage) div 2;
  Rect.Top := (pt.y + cyImage) div 2;
  Rect.Right := (pt.x + cxImage) div 2;
  Rect.Bottom := (pt.y - cyImage) div 2;

  PlayEnhMetaFile(hdc, hemf, Rect);
  DeleteEnhMetaFile(hemf);
end;

end.

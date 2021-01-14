unit Pipes;

interface

uses
  Windows, Math;

const
  szAppName = 'Pipes';
  szTitle = 'Pipes: Palette Animation Demo';
  ID_TIMER = 1;

var
  plp: PLogPalette;

function CreateRoutine(hWnd: HWND): HPALETTE; // 初始化
procedure PaintRoutine(hdc: HDC; cxClient, cyClient: Integer); // 绘制
procedure TimerRoutine(hdc: HDC; hPalette: HPALETTE); // 修改
procedure DestroyRoutine(hWnd: HWND; hPalette: HPALETTE); // 反初始化

implementation

  // 初始化
function CreateRoutine(hWnd: HWND): HPALETTE;
var
  i: Integer;
begin
  GetMem(plp, SizeOf(TLogPalette) + 32 * SizeOf(TPaletteEntry));
 // Initialize the fields of the LOGPALETTE structure
  plp.palVersion := $0300;
  plp.palNumEntries := 16;
  for i := 0 to 8 do
  begin
    plp.palPalEntry[i].peRed := Min(255, $20 * i);
    plp.palPalEntry[i].peGreen := 0 ;
    plp.palPalEntry[i].peBlue := Min(255, $20 * i);
    plp.palPalEntry[i].peFlags := PC_RESERVED;
    plp.palPalEntry[16 - i] := plp.palPalEntry[i];
    plp.palPalEntry[16 + i] := plp.palPalEntry[i];
    plp.palPalEntry[32 - i] := plp.palPalEntry[i];
  end;
  Result := CreatePalette(plp^);
  SetTimer(hWnd, ID_TIMER, 100, nil);
end;

  // 绘制
procedure PaintRoutine(hdc: HDC; cxClient, cyClient: Integer);
var
  hBrush, J: DWORD;
  Rect: TRect;
begin
 // 白色背景
  SetRect(Rect, 0, 0, cxClient, cyClient);
  hBrush := SelectObject(hdc, GetStockObject(WHITE_BRUSH));
  FillRect(hdc, Rect, hBrush);
  
 // 管子内部
  for J := 0 to 127 do
  begin
    hBrush := CreateSolidBrush(PaletteIndex(J mod 16));
    SelectObject(hdc, hBrush);

    Rect.Left := (127 - J) * cxClient div 128;
    Rect.Right := (128 - J) * cxClient div 128;
    Rect.Top := 4 * cyClient div 14;
    Rect.Bottom := 5 * cyClient div 14;
    FillRect(hdc, Rect, hBrush);

    Rect.Left := J * cxClient div 128;
    Rect.Right := (J + 1) * cxClient div 128;
    Rect.Top := 9 * cyClient div 14;
    Rect.Bottom := 10 * cyClient div 14;
    FillRect(hdc, Rect, hBrush);
    
    DeleteObject(SelectObject(hdc, GetStockObject(WHITE_BRUSH)));
  end;
  
 // 管子边框
  MoveToEx(hdc, 0, 4 * cyClient div 14, nil);
  LineTo(hdc, cxClient, 4 * cyClient div 14);

  MoveToEx(hdc, 0, 5 * cyClient div 14, nil);
  LineTo(hdc, cxClient,5 * cyClient div 14);

  MoveToEx(hdc, 0, 9 * cyClient div 14, nil);
  LineTo(hdc, cxClient, 9 * cyClient div 14);
  
  MoveToEx(hdc, 0, 10 * cyClient div 14, nil);
  LineTo(hdc, cxClient, 10 * cyClient div 14);
end;

  // 修改
procedure TimerRoutine(hdc: HDC; hPalette: HPALETTE);
const
{$J+}
  iIndex: Integer = 0;
{$J-}
begin
  AnimatePalette(hPalette, 0, 16,
    PPaletteEntry(Integer(@plp.palPalEntry[0]) + iIndex * SizeOf(TPaletteEntry)));
  iIndex := (iIndex + 1) mod 16;
end;

  // 反初始化
procedure DestroyRoutine(hWnd: HWND; hPalette: HPALETTE);
begin
  KillTimer(hWnd, ID_TIMER);
  DeleteObject(hPalette);
  FreeMem(plp);
end;

end.

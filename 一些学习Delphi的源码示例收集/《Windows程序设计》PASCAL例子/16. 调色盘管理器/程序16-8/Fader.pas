unit Fader;

interface

uses
  Windows, Math;
  
const
  szAppName = 'Fader';
  szTitle = 'Fader: Palette Animation Demo';
  ID_TIMER = 1;
  
var
  lp: TLogPalette;

function CreateRoutine(hWnd: HWND): HPALETTE; // 初始化
procedure PaintRoutine(hdc: HDC; cxClient, cyClient: Integer); // 绘制文字
procedure TimerRoutine(hdc: HDC; hPalette: HPALETTE); // 修改调色板
procedure DestroyRoutine(hWnd: HWND; hPalette: HPALETTE); // 反初始化

implementation

  // 初始化(建立逻辑调色板,安装时钟)
function CreateRoutine(hWnd: HWND): HPALETTE;
var
  J: Integer;
begin
  lp.palVersion := $0300;
  lp.palNumEntries := 1;
  lp.palPalEntry[0].peRed := 255;
  lp.palPalEntry[0].peGreen := 255;
  lp.palPalEntry[0].peBlue := 255;
  lp.palPalEntry[0].peFlags := PC_RESERVED;
  Result := CreatePalette(lp);
  SetTimer(hWnd, ID_TIMER, 50, nil);
end;

  // 绘制文字
procedure PaintRoutine(hdc: HDC; cxClient, cyClient: Integer);
const
  szText = 'Fade In and Out';
var
  x, y: Integer;
  SizeText: TSize; 
begin
  SetTextColor(hdc, PaletteIndex(0));
  GetTextExtentPoint32(hdc, szText, lstrlen(szText), SizeText); // 字符串输出范围
  x := 0;
  while (x < cxClient) do
  begin
    y := 0;
    while (y < cyClient) do
    begin
      TextOut(hdc, x, y, szText, lstrlen(szText));
      Inc(y, SizeText.cy);
    end;
    Inc(x, SizeText.cx);
  end;
end;

  // 修改调色板
procedure TimerRoutine(hdc: HDC; hPalette: HPALETTE);
const
{$J+}
  bFadeIn: Boolean = TRUE;
{$J-}
begin
  if (bFadeIn = TRUE) then
  begin
    Dec(lp.palPalEntry[0].peRed, 4);
    Dec(lp.palPalEntry[0].peGreen, 4);
    if (lp.palPalEntry[0].peRed <= 3) then bFadeIn := FALSE;
  end else
  begin
    Inc(lp.palPalEntry[0].peRed, 4);
    Inc(lp.palPalEntry[0].peGreen, 4);
    if (lp.palPalEntry[0].peRed >= 255) then bFadeIn := TRUE;
  end;
  AnimatePalette(hPalette, 0, 1, @lp.palPalEntry[0]);
end;

  // 反初始化(删除逻辑调色板,删除时钟)
procedure DestroyRoutine(hWnd: HWND; hPalette: HPALETTE);
begin
  KillTimer(hWnd, ID_TIMER);
  DeleteObject(hPalette);
end;

end.

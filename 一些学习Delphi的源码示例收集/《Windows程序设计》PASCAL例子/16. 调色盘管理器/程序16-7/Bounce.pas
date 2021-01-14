unit Bounce;

interface

uses
  Windows, Math;
  
const
  szAppName = 'Bounce';
  szTitle = 'Bounce: Palette Animation Demo';
  ID_TIMER = 1;
  
var
  plp: PLogPalette;

function CreateRoutine(hWnd: HWND): HPALETTE; // 初始化
procedure PaintRoutine(hdc: HDC; cxClient, cyClient: Integer); // 绘制图形
procedure TimerRoutine(hdc: HDC; hPalette: HPALETTE); // 移动图形
procedure DestroyRoutine(hWnd: HWND; hPalette: HPALETTE); // 反初始化

implementation

  // 初始化(申请内存,建立调色板,安装定时器)
function CreateRoutine(hWnd: HWND): HPALETTE;
var
  J: Integer;
begin
  GetMem(plp, SizeOf(TLogPalette) + 33 * SizeOf(TPaletteEntry));
  plp.palVersion := $0300;
  plp.palNumEntries := 34;
  for J := 0 to 33 do
  begin
    plp.palPalEntry[J].peRed := 255;
    plp.palPalEntry[J].peGreen := IfThen(J = 0, 0 ,255); // 第一个调色盘项目红色,其它白色
    plp.palPalEntry[J].peBlue := IfThen(J = 0, 0, 255);
    plp.palPalEntry[J].peFlags := IfThen(J = 33, 0, PC_RESERVED); // 背景是最后的一个调色盘项目
  end;
  Result := CreatePalette(plp^);
  SetTimer(hWnd, ID_TIMER, 50, nil);
end;

  // 绘制图形(椭圆)
procedure PaintRoutine(hdc: HDC; cxClient, cyClient: Integer);
var
  hBrush: LongWord;
  J, x1, x2, y1, y2: Integer;
  Rect: TRect;
begin
 // 用最后一个调色板项目绘制背景
  SetRect(Rect, 0, 0, cxClient, cyClient);
  hBrush := CreateSolidBrush(PaletteIndex(33));
  FillRect(hdc, Rect, hBrush);
  DeleteObject(hBrush);
  
 // 选入空画笔(无边框)
  SelectObject(hdc, GetStockObject(NULL_PEN));
 // 画33个椭圆(呈W状)
  for J := 0 to 32 do
  begin
    x1 := J * cxClient div 33;
    x2 := (J + 1)* cxClient div 33;

    if (J < 9) then // 从上到下
    begin
      y1 := J * cyClient div 9;
      y2 := (J + 1) * cyClient div 9;
    end else
      if (J < 17) then // 从下到上
      begin
        y1 := (16 - J) * cyClient div 9;
        y2 := (17 - J) * cyClient div 9;
      end else
        if (J < 25) then // 从上到下
        begin
          y1 := (J - 16) * cyClient div 9;
          y2 := (J - 15) * cyClient div 9;
        end else
        begin // 从下到上
          y1 := (32 - J) * cyClient div 9;
          y2 := (33 - J) * cyClient div 9;
        end;

    hBrush := CreateSolidBrush(PaletteIndex(J));
    SelectObject(hdc, hBrush);
    Ellipse(hdc, x1, y1, x2, y2);
    DeleteObject(SelectObject(hdc, GetStockObject(WHITE_BRUSH)));
  end;
end;

  // 移动图形(实际上是改变调色板项目)
procedure TimerRoutine(hdc: HDC; hPalette: HPALETTE);
const
{$J+}
  bLeftToRight: Boolean = TRUE; // 方向
  iBall: Integer = 0;
{$J-}
begin
 // 白色
  plp.palPalEntry[iBall].peGreen := 255;
  plp.palPalEntry[iBall].peBlue := 255;
 // 移动
  Inc(iBall, IfThen(bLeftToRight, 1, -1));
 // 边界
  if (iBall = IfThen(bLeftToRight, 33, -1)) then
  begin
    iBall := IfThen(bLeftToRight, 31, 1);
    bLeftToRight := not bLeftToRight;
  end;
 // 红色
  plp.palPalEntry[iBall].peGreen := 0;
  plp.palPalEntry[iBall].peBlue  := 0;
 // 修改
  AnimatePalette(hPalette, 0, 33, @plp.palPalEntry[0]);
end;

  // 反初始化(删除定时器,删除调色板,释放内存)
procedure DestroyRoutine(hWnd: HWND; hPalette: HPALETTE);
begin
  KillTimer(hWnd, ID_TIMER);
  DeleteObject(hPalette);
  FreeMem(plp);
end;

end.

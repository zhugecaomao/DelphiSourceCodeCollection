program SnowFall;

{$R 'LiuMazi.res' 'LiuMazi.txt'}

uses
  Windows, Messages;

const
  SnowNumber = 500; // 雪点数量-1

type
  SnowNode = record
    Point: TPoint;  // 雪点位置
    Color: Integer; // 先前颜色
    Speed: Integer; // 下落速率
    nMove: Integer; // 下落距离
    Stick: Integer; // '粘连'度
  end;

var
  SnowNodes: array[0..SnowNumber] of SnowNode; // 雪点数组
  hTimer: Integer; // '随机风向'时钟句柄
  CrWind: Integer; // 当前'风向' ( -1 ~ 1 )
  CrStep: Integer; // 当前循环步数(用于限速) 
  ScreenWidth, ScreenHeight: Integer; // 屏幕尺寸
  
  
  // 取屏幕尺寸 -> ScreenWidth, ScreenHeight
procedure GetScreenSize;
begin
  ScreenWidth := GetSystemMetrics(SM_CXSCREEN);
  ScreenHeight := GetSystemMetrics(SM_CYSCREEN);
end;

  // '随机风向'时钟
procedure TimerProc(hWnd: HWND; uMsg: UINT; idEvent: UINT; dwTime: DWORD); stdcall;
begin
  SetTimer(0, hTimer, (Random(27)+4) * 500, @TimerProc); // 重设下次风向改变时间
  if (CrWind <> 0) then CrWind := 0 else CrWind := Random(3) - 1; // 修改风向
end;

  // 初始化雪点数组
procedure InitSnowNodes;
var
  hScreenDc, J: Integer;
begin
  hScreenDc := CreateDC('DISPLAY', nil, nil, nil);
  for J := 0 to SnowNumber do
  begin
    SnowNodes[J].Point.X := Random(ScreenWidth);
    SnowNodes[J].Point.Y := Random(ScreenHeight);
    SnowNodes[J].Color := GetPixel(hScreenDc, SnowNodes[J].Point.X, SnowNodes[J].Point.Y);
    SnowNodes[J].Speed := Random(5) + 1; // 几次循环作下落一次 (1~5)
    SnowNodes[J].nMove := Random(SnowNodes[J].Speed)+1; // 每次下落距离(1~5)
    SnowNodes[J].Stick := 30 - Random(SnowNodes[J].Speed); // '粘连'度(几次循环作一次粘连判断)
  end;
  DeleteDC(hScreenDc);
end;

  // 移动雪点 ..
procedure MoveSnowNodes;
var
  hScreenDc, I, X, Y: Integer;
begin
  hScreenDc := CreateDC('DISPLAY', nil, nil, nil);
  for I := 0 to SnowNumber do
  begin
   // 控制雪点下降速率
    if (CrStep mod SnowNodes[I].Speed) <> 0 then Continue;
   // 恢复上次被覆盖点
    if GetPixel(hScreenDc, SnowNodes[I].Point.X, SnowNodes[I].Point.Y) = $FFFFFF then
      SetPixel(hScreenDc, SnowNodes[I].Point.X, SnowNodes[I].Point.Y, SnowNodes[I].Color);
   // 根据风向作随机飘落
    X := SnowNodes[I].Point.X + Random(3) - 1 + CrWind;
    Y := SnowNodes[I].Point.Y + SnowNodes[I].nMove;
   // 积雪(停留)效果处理
    if ( (CrStep mod SnowNodes[I].Stick) = 0 ) // 降低积雪概率 ..
       and ( GetPixel(hScreenDc, X, Y) <> GetPixel(hScreenDc, X, Y+1) ) // '边缘'判断
       and ( GetPixel(hScreenDc, X-1, Y) <> GetPixel(hScreenDc, X-1, Y+1) )
       and ( GetPixel(hScreenDc, X+1, Y) <> GetPixel(hScreenDc, X+1, Y+1) ) then
    begin
     // 稍微调整坐标
      if GetPixel(hScreenDc, X, Y-1) = GetPixel(hScreenDc, X, Y-2) then Dec(Y) // 上边缘
      else if GetPixel(hScreenDc, X, Y+1) = GetPixel(hScreenDc, X, Y+2) then Inc(Y); // 下边缘
      Inc(X, CrWind);
     // 画三个点(雪花)
      SetPixel(hScreenDc, X, Y, $FFFFFF);
      SetPixel(hScreenDc, X+1, Y+1, $FFFFFF);
      SetPixel(hScreenDc, X-1, Y+1, $FFFFFF);
     // 重生雪点
      SnowNodes[I].Point.Y := Random(10);
      SnowNodes[I].Point.X := Random(ScreenWidth);
      SnowNodes[I].Color := GetPixel(hScreenDc, SnowNodes[I].Point.X, SnowNodes[I].Point.Y);
    end else
    begin
      if (X < 0) or (X > ScreenWidth) or (Y > ScreenHeight) then // 超出范围则重生雪点
      begin
        SnowNodes[I].Point.Y := Random(10);
        SnowNodes[I].Point.X := Random(ScreenWidth);
        SnowNodes[I].Color := GetPixel(hScreenDc, SnowNodes[I].Point.X, SnowNodes[I].Point.Y);
      end else
      begin
       // 保存颜色并绘制雪点
        SnowNodes[I].Color := GetPixel(hScreenDc, X, Y);
        SetPixel(hScreenDc, X, Y, $FFFFFF);
       // 此时保存新雪点位置
        SnowNodes[I].Point.X := X;
        SnowNodes[I].Point.Y := Y;
      end;
    end;
  end;
  DeleteDC(hScreenDc);
  Inc(CrStep);
end;  

var
  ThreadMsg: TMsg;  // 标准消息结构体
  Frequency: Int64; // 高性能定时器频率
  StartCt, EndCt: Int64; // 高性能定时器计数
  ElapsedTime: Extended; // 时间间隔
begin
  Randomize;  GetScreenSize;  InitSnowNodes; // 初始化
  QueryPerformanceFrequency(Frequency); // 高性能定时器频率
  hTimer := SetTimer(0, 0, Random(5)*500, @TimerProc); // 安装随机风向定时器
  RegisterHotKey(0, 0, MOD_CONTROL, ORD('L')); // 注册退出热键 Ctrl+L
  while TRUE do // 消息循环
  begin
    QueryPerformanceCounter(StartCt); // 执行运算前 计数值
    if PeekMessage(ThreadMsg, 0, 0, 0, PM_REMOVE) then // 取到消息
    begin
      case ThreadMsg.message of
        WM_TIMER:
          TimerProc(0, 0, 0, 0); // 预设风向改变时间已到

        WM_HOTKEY:
          begin
            KillTimer(0, hTimer); // 删除随机风向定时器
            UnregisterHotKey(0, 0); // 删除退出热键 Ctrl+L
            InvalidateRect(0, nil, TRUE); // 刷新屏幕
            Break; // 跳出消息循环
          end;

        WM_DISPLAYCHANGE:
          begin
            GetScreenSize; // 重新取屏幕尺寸
            InitSnowNodes; // 初始化雪点数组
          end;
      end;
    end;
    MoveSnowNodes; // 移动雪点
    QueryPerformanceCounter(EndCt); // 执行运算后计数值
    ElapsedTime := (EndCt-StartCt)/Frequency; 
    if (ElapsedTime < 0.0005) then Sleep(2) // 简单限速
    else if (ElapsedTime < 0.0010) then Sleep(1)
         else if (ElapsedTime < 0.0015) then Sleep(0);
  end;
end.

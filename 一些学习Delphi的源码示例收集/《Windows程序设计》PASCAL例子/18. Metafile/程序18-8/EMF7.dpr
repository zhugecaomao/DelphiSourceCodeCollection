program  EMF7;

uses
  Windows, Messages;

   // 枚举回调函数
function EnhMetaFileProc(hdc: HDC; pHandleTable: PHandleTable;
  pEmfRecord: PEnhMetaRecord; iHandles: Integer; pData: LPARAM): Integer; stdcall;
var
  hBrush: LongWord; // HBRUSH
  hPen: LongWord; // HPEN
  lb: TLogBrush;
begin
  if (pEmfRecord.iType <> EMR_HEADER) and (pEmfRecord.iType <> EMR_EOF) then
    PlayEnhMetaFileRecord(hdc, pHandleTable^, pEmfRecord^, iHandles);

  if (pEmfRecord.iType = EMR_RECTANGLE) then // 矩形
  begin
    hBrush := SelectObject(hdc, GetStockObject(NULL_BRUSH)); // 空画刷(不填充)
    lb.lbStyle := BS_SOLID;
    lb.lbColor := RGB(0, 255, 0);
    lb.lbHatch := 0;                                               // 建立并选入新画笔
    hPen := SelectObject(hdc, ExtCreatePen(PS_SOLID or PS_GEOMETRIC, 5, lb, 0, nil));
    Ellipse(hdc, 100, 100, 200, 200); // 添加椭圆
    DeleteObject(SelectObject(hdc, hPen)); // 选回老画笔删除新画笔
    SelectObject(hdc, hBrush);
  end;

  Result := 1; // TRUE
end;

   // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  hdcWnd, hdcEMF: HDC;
  hemfOld, hemf: HENHMetaFile;
  ps: TPaintStruct;
  Rect: TRect;
  emh: TEnhMetaHeader;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
       // Retrieve existing MetaFile and header
        hemfOld := GetEnhMetaFile('..\程序18-4\emf3.emf');
        GetEnhMetaFileHeader(hemfOld, SizeOf(TEnhMetaHeader), @emh);

       // Create a new MetaFile DC
        hdcEMF := CreateEnhMetaFile(0, 'emf7.emf', nil, 'EMF7'#0'EMF Demo #7'#0#0);

       // Enumerate the existing MetaFile
        EnumEnhMetaFile(hdcEMF, hemfOld, @EnhMetaFileProc, nil, emh.rclBounds);
        
       // Clean up
        hemf := CloseEnhMetaFile(hdcEMF);
        DeleteEnhMetaFile(hemfOld);
        DeleteEnhMetaFile(hemf);
      end;

    WM_PAINT:
      begin
        hdcWnd := BeginPaint(hWnd, ps);

        GetClientRect(hWnd, Rect);
        Rect.Left := Rect.Right div 4;
        Rect.Right := 3 * Rect.Right div 4;
        Rect.Top := Rect.Bottom div 4;
        Rect.Bottom := 3 * Rect.Bottom div 4;

        hemf := GetEnhMetaFile('emf7.emf'); // 重新打开
        PlayEnhMetaFile(hdcWnd, hemf, Rect);
        DeleteEnhMetaFile(hemf);

        EndPaint(hWnd, ps);
      end;       

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 退出
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end; 

  
const
  szAppName = 'EMF7';

var
  hWnd: LongWord;
  Msg: TMsg;
  WndClass: TWndClass;
  
begin
 // 填充结构体
  WndClass.style := CS_HREDRAW or CS_VREDRAW;
  WndClass.lpfnWndProc := @WndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := 0;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(0, IDI_APPLICATION);
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground := GetStockObject(WHITE_BRUSH);
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体                      
  hWnd := CreateWindow(szAppName, 'Enhanced MetaFile Demo #7',
                       WS_OVERLAPPEDWINDOW,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, 0, hInstance, nil);

 // 显示窗体
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);
    
 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;

end.

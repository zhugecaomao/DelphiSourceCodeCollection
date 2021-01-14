program  EMF;

{$R EMF.Res}

uses
  Windows, Messages, CommDlg, EMF13 in 'EMF13.pas';

  // 打印emf
function PrintRoutine(hWnd: HWND): Boolean;
const
{$J+}
  di: TDocInfo = ();
  pd: TPrintDlg = (); // = { sizeof (PRINTDLG) }
  szMessage: array[0..32] of Char = '';
{$J-}
var
  hdcPrn: HDC;
  cxPage, cyPage: Integer;
begin
  Result := FALSE;

  pd.lStructSize := SizeOf(TPrintDlg);
  pd.Flags := PD_RETURNDC or PD_NOPAGENUMS or PD_NOSELECTION;
  if (not PrintDlg(pd)) then
  begin
    Result := TRUE;
    Exit; // return TRUE
  end; 
  if (pd.hDC = 0) then
    Exit // return FALSE
  else
    hdcPrn := pd.hDC;

  cxPage := GetDeviceCaps(hdcPrn, HORZRES);
  cyPage := GetDeviceCaps(hdcPrn, VERTRES);
  lstrcpy(szMessage, szClass);
  lstrcat(szMessage, 'Printing');
  di.cbSize := SizeOf(TDocInfo);
  di.lpszDocName := szMessage;
  
  if (StartDoc(hdcPrn, di) > 0) then
  begin
    if (StartPage(hdcPrn) > 0) then
    begin
      PaintRoutine(hWnd, hdcPrn, cxPage, cyPage);
      if (EndPage(hdcPrn) > 0) then
      begin
        EndDoc(hdcPrn);
        Result := TRUE;
      end;
    end;
  end;
  
  DeleteDC(hdcPrn);
end;

   // 窗体过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  cxClient: Integer = 0;
  cyClient: Integer = 0;
{$J-}
  IDM_PRINT = 40001;
  IDM_EXIT  = 40002;
  IDM_ABOUT = 40003;
var
  hWndDc: HDC;
  bSuccess: Boolean;
  ps: TPaintStruct;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        CreateRoutine(hWnd);
      end;

    WM_COMMAND:
      begin
        case (wParam) of
          IDM_PRINT:
            begin
              SetCursor(LoadCursor(0, IDC_WAIT));
              ShowCursor(TRUE);
              bSuccess := PrintRoutine(hWnd);
              ShowCursor(FALSE);
              SetCursor(LoadCursor(0, IDC_ARROW));
              if (bSuccess = FALSE) then
              begin
                MessageBox(hWnd, 'Error encountered during printing',
                  szClass, MB_ICONASTERISK or MB_OK);
              end;    
            end;

          IDM_EXIT:
            begin
              SendMessage(hWnd, WM_CLOSE, 0, 0);
            end;

          IDM_ABOUT:
            begin
              MessageBox(hWnd,
                'Enhanced MetaFile Demo Program'#13#10'Copyright (c) Charles Petzold, 1998',
                 szClass, MB_ICONINFORMATION or MB_OK);
            end;
        end; // END case (wParam) of ..
      end;

     WM_SIZE:
       begin
         cxClient := LOWORD(lParam);
         cyClient := HIWORD(lParam);
       end;

    WM_PAINT:
      begin
        hWndDC := BeginPaint(hWnd, ps);
        PaintRoutine(hWnd, hWndDC, cxClient, cyClient);    
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
  szResource = 'EMF';
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
  WndClass.lpszMenuName := szResource;
  WndClass.lpszClassName := szClass;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szClass, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体                      
  hWnd := CreateWindow(szClass, szTitle,
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

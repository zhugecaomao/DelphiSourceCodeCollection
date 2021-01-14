program  FontDemo;

{$R FontDemo.Res}

uses
  Windows, Messages, CommDlg,
  EzFont in '..\程序17-2\EzFont.pas',
  FontFill in 'FontFill.pas';

   // 窗体过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  di: TDocInfo = (); // = { sizeof (DOCINFO), TEXT ("Font Demo: Printing") } ;
  cxClient: Integer = 0;
  cyClient: Integer = 0;
  pd: TPrintDlg = (); // = { sizeof (PRINTDLG) } ;
{$J-}
  IDM_PRINT = 40001;
  IDM_ABOUT = 40002;
var
  hdcWnd, hdcPrn: HDC;
  cxPage, cyPage: Integer;
  ps: TPaintStruct;
  fSuccess: Boolean;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        di.cbSize := SizeOf(TDocInfo);
        di.lpszDocName := 'Font Demo: Printing';
        pd.lStructSize := SizeOf(TPrintDlg);
      end;

    WM_COMMAND:
      begin
        case wParam of
          IDM_PRINT:
            begin
             // Get printer DC
              pd.hwndOwner := hWnd;
              pd.Flags := PD_RETURNDC or PD_NOPAGENUMS or PD_NOSELECTION;
              if (not PrintDlg(pd)) then Exit; // return 0
              hdcPrn := pd.hDC;
              if (hdcPrn = 0) then
              begin
                MessageBox(hWnd, 'Cannot obtain Printer DC', szAppName, MB_ICONEXCLAMATION or MB_OK);
                Exit;
              end;
             // Get size of printable area of page
              cxPage := GetDeviceCaps(hdcPrn, HORZRES);
              cyPage := GetDeviceCaps(hdcPrn, VERTRES);
              fSuccess := FALSE;
             // Do the printer page
              SetCursor(LoadCursor(0, IDC_WAIT));
              ShowCursor(TRUE);
              if ((StartDoc(hdcPrn, di) > 0) and (StartPage(hdcPrn) > 0)) then
              begin
                PaintRoutine(hWnd, hdcPrn, cxPage, cyPage);
                if (EndPage(hdcPrn) > 0) then
                begin
                  fSuccess := TRUE;
                  EndDoc(hdcPrn);
                end;
              end;
              DeleteDC(hdcPrn);
              ShowCursor(FALSE);
              SetCursor(LoadCursor(0, IDC_ARROW));
              if (not fSuccess) then
                MessageBox(hWnd,
                  'Error encountered during printing',
                  szAppName, MB_ICONEXCLAMATION or MB_OK);
            end;

          IDM_ABOUT:
            begin
              MessageBox(hWnd,
                'Font Demonstration Program'#13#10'(c) Charles Petzold, 1998',
                szAppName, MB_ICONINFORMATION or MB_OK);
            end;
        end;      
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;

    WM_PAINT:
      begin
        hdcWnd := BeginPaint(hWnd, ps);
        PaintRoutine(hWnd, hdcWnd, cxClient, cyClient);
        EndPaint(hWnd, ps);
      end;  

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 放一个退出消息WM_QUIT
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end; 

const
  szResource = 'FontDemo';
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
  WndClass.lpszClassName := szAppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, szTitle,
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

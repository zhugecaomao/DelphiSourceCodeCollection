unit Print3;

{$R Print.RES}

interface

uses
  Windows, Messages, WinSpool, GetPrnDC; 

const
  szAppName = 'Print3';
  szCaption = 'Print Program 3 (Dialog Box)';

var
  bUserAbort: Boolean = FALSE; // 取消打印
  hDlgPrint: LongWord = 0; // 对话框句柄

procedure PageGDICalls(hdcPrn: HDC; cxPage, cyPage: Integer);
function PrintMyPage(hWnd: HWND): Boolean;

implementation

procedure PageGDICalls(hdcPrn: HDC; cxPage, cyPage: Integer);
const
  szTextStr = 'Hello, Printer!';
begin
  Rectangle(hdcPrn, 0, 0, cxPage, cyPage);
  MoveToEx(hdcPrn, 0, 0, nil);
  LineTo(hdcPrn, cxPage, cyPage);
  MoveToEx(hdcPrn, cxPage, 0, nil);
  LineTo(hdcPrn, 0, cyPage);
  SaveDC(hdcPrn);
  SetMapMode(hdcPrn, MM_ISOTROPIC);
  SetWindowExtEx(hdcPrn, 1000, 1000, nil);
  SetViewportExtEx(hdcPrn, cxPage div 2, -cyPage div 2, nil);
  SetViewportOrgEx(hdcPrn, cxPage div 2,  cyPage div 2, nil);
  Ellipse(hdcPrn, -500, 500, 500, -500);
  SetTextAlign(hdcPrn, TA_BASELINE or TA_CENTER);
  TextOut(hdcPrn, 0, 0, szTextStr, lstrlen(szTextStr));
  RestoreDC(hdcPrn, -1);
end;

  // 对话框消息接收函数
function PrintDlgProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := FALSE; // 未处理消息
  case Msg of
    WM_INITDIALOG:
      begin
        SetWindowText(hDlg, szAppName); // 设置对话框标题
        EnableMenuItem(GetSystemMenu(hDlg, FALSE), SC_CLOSE, MF_GRAYED); // 禁用关闭菜单
        Result := TRUE;
      end;

    WM_COMMAND:
      begin
        bUserAbort := TRUE; // 用户取消
        EnableWindow(GetParent(hDlg), TRUE); // 启用主窗体
        DestroyWindow(hDlg); // 注销对话框
        hDlgPrint := 0;
        Result := TRUE;
      end;
  end;
end; 

  // 放弃回调函数  
function AbortProc(hdcPrn, iCode: Integer): BOOL; stdcall;
var
  Msg: TMSG;
begin
  while (not bUserAbort) and PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do
  begin
    if (hDlgPrint = 0) or (not IsDialogMessage(hDlgPrint, Msg)) then
    begin
      TranslateMessage(Msg); // 这句可以去掉
      DispatchMessage(Msg);
    end;
  end;
  Result:= not bUserAbort;
end;  

function PrintMyPage(hWnd: HWND): Boolean;
const
  di: TDocInfo = (
    cbSize: SizeOf(TDocInfo);
    lpszDocName: 'Print1: Printing';
    lpszOutput: nil;
    lpszDatatype: nil;
    fwType: 0;   );
var    
  hdcPrn: HDC;
  xPage, yPage: Integer;
begin
  Result := FALSE;

  hdcPrn := GetPrinterDC();
  if (hdcPrn = 0) then Exit;

  xPage := GetDeviceCaps(hdcPrn, HORZRES);
  yPage := GetDeviceCaps(hdcPrn, VERTRES);

  EnableWindow(hWnd, FALSE);
  bUserAbort := FALSE;
  hDlgPrint := CreateDialog(hInstance, 'PrintDlgBox', hWnd, @PrintDlgProc);
  SetAbortProc(hdcPrn, @AbortProc);

  if (StartDoc(hdcPrn, di) > 0) then
  begin
    if (StartPage(hdcPrn) > 0) then
    begin
      PageGDICalls(hdcPrn, xPage, yPage);
      if (EndPage(hdcPrn) > 0) then
      begin
        EndDoc(hdcPrn);
        Result := TRUE;
      end;
    end;
  end;

  if (not bUserAbort) then
  begin
    EnableWindow(hWnd, TRUE);
    DestroyWindow(hDlgPrint);
  end;

  DeleteDC(hdcPrn);
end;

end.

program CopyData;

{$R 'CopyData.res' 'CopyData.rc'}

uses Windows, Messages;

const
  IDD_COPYDATA   = 1;
  IDI_COPYDATA   = 2;
  IDC_DATA1      = 100;
  IDC_COPYDATA1  = 101;
  IDC_DATA2      = 102;
  IDC_COPYDATA2  = 103;

  // WM_COPYDATA
function Dlg_OnCopyData(hWnd, hWndFrom: HWND; cds: PCopyDataStruct): BOOL;
begin
  if (cds.dwData = 0) then
    SetWindowText(GetDlgItem(hWnd, IDC_DATA1), cds.lpData)
  else
    SetWindowText(GetDlgItem(hWnd, IDC_DATA2), cds.lpData);

  Result := TRUE;
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_COPYDATA)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_COPYDATA)));

  SetWindowText(GetDlgItem(hWnd, IDC_DATA1), 'Some test data');
  SetWindowText(GetDlgItem(hWnd, IDC_DATA2), 'Some more test data');

  Result := TRUE;
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  hWndEdit, hWndT: DWORD; // HWND
  cds: TCopyDataStruct;
  szCaption: array[0..100] of Char;
begin
  case (id) of
    IDCANCEL:
      begin
        EndDialog(hwnd, id);
      end;

    IDC_COPYDATA1,
    IDC_COPYDATA2:
      begin
        // 并非单击按钮
        if (codeNotify <> BN_CLICKED) then Exit;

        // 准备发送数据
        if (id = IDC_COPYDATA1) then
        begin
          hWndEdit := GetDlgItem(hWnd, IDC_DATA1);
          cds.dwData := 0;
        end else
        begin
          hWndEdit := GetDlgItem(hWnd, IDC_DATA2);
          cds.dwData := 1;
        end;
        cds.cbData := (GetWindowTextLength(hWndEdit) + 1);
        GetMem(cds.lpData, cds.cbData);
        GetWindowText(hWndEdit, cds.lpData, cds.cbData);

        // 枚举窗口发送
        GetWindowText(hWnd, szCaption, SizeOf(szCaption));
        hWndT := FindWindowEx(0, 0, nil, szCaption);
        while IsWindow(hWndT) do
        begin
          SendMessage(hWndT, WM_COPYDATA, hWnd, LongInt(@cds));
          hWndT := FindWindowEx(0, hWndT, nil, szCaption);
        end;

        FreeMem(cds.lpData);
      end;
  end;
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  case (uMsg) of
    WM_INITDIALOG:
      Result := SetWindowLong(hWnd, DWL_MSGRESULT, Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))) <> 0;

    WM_COMMAND:
      begin
        Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
        Result := TRUE;
      end;

    WM_COPYDATA:
      Result := Dlg_OnCopyData(hWnd, wParam, PCopyDataStruct(lParam));

    else
      Result := FALSE;
  end;
end;

  // 程序入口
begin
  DialogBox(HInstance, MakeIntResource(IDD_COPYDATA), 0, @Dlg_Proc);
end.

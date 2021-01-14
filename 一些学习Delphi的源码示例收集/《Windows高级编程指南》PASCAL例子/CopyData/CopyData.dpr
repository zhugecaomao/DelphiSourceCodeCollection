
// Module name: CopyData.C ->> CopyData.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program CopyData;

{$R 'CopyData.res' 'CopyData.rc'}

uses
  Windows, Messages,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  IDD_COPYDATA  = 1;
  IDC_DATA1     = 100;
  IDC_COPYDATA1 = 101;
  IDC_DATA2     = 102;
  IDI_COPYDATA  = 102;
  IDC_COPYDATA2 = 103;

  // WM_COPYDATA 处理
function Dlg_OnCopyData(hWnd, hWndFrom: HWND; cds: PCopyDataStruct): BOOL;
begin          
  Edit_SetText(GetDlgItem(hWnd, IfThen(cds.dwData = 0, IDC_DATA1, IDC_DATA2)), cds.lpData);
  Result := TRUE;
end;

  // WM_INITDIALOG 处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  chSETDLGICONS(hWnd, IDI_COPYDATA, IDI_COPYDATA);

  Edit_SetText(GetDlgItem(hWnd, IDC_DATA1),  'Some test data');
  Edit_SetText(GetDlgItem(hWnd, IDC_DATA2),  'Some more test data');

  Result := TRUE;
end;

  // WM_COMMAND 处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  hWndEdit, hWndSibling: DWORD; // HWND
  cds: TCopyDataStruct;
  szCaption, szCaptionSibling: array[0..100] of Char;
begin
  case (id) of
    IDC_COPYDATA1, // 按钮通知
    IDC_COPYDATA2:
      begin
        if (codeNotify <> BN_CLICKED) then Exit; // 并非单击按钮(导致的通知)

        hWndEdit := GetDlgItem(hWnd, IfThen(id = IDC_COPYDATA1, IDC_DATA1, IDC_DATA2));
        cds.dwData := IfThen(id = IDC_COPYDATA1, 0, 1);
        cds.cbData := Edit_GetTextLength(hWndEdit) + 1;
        cds.lpData := HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, cds.cbData);
        Edit_GetText(hWndEdit, cds.lpData, cds.cbData);

        GetWindowText(hWnd, szCaption, chDIMOF(szCaption));
        hWndSibling := GetFirstSibling(hWnd);
        while IsWindow(hWndSibling) do // 寻找所有同名窗体, 发送 WM_COPYDATA
        begin
          GetWindowText(hWndSibling, szCaptionSibling, chDIMOF(szCaptionSibling));
          if (lstrcmp(szCaption, szCaptionSibling) = 0) then
            SendMessage(hWndSibling, WM_COPYDATA, hWnd, LPARAM(@cds));
            
          hWndSibling := GetNextSibling(hWndSibling);
        end;

        HeapFree(GetProcessHeap(), 0, cds.lpData);
      end;

    IDCANCEL:      // 要求关闭
      begin
        EndDialog(hWnd, id);
      end;
  end;
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  case (uMsg) of
    WM_INITDIALOG:
      begin
        Result := SetDlgMsgResult(hWnd, LRESULT(Dlg_OnInitDialog(hWnd, wParam, lParam)));
      end;

    WM_COMMAND:
      begin
        Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
        Result := TRUE;
      end;

    WM_COPYDATA:
      begin
        Dlg_OnCopyData(hWnd, wParam, PCopyDataStruct(lParam));
        Result := TRUE;
      end;

    else
      Result := FALSE;
  end;
end;

  // 程序入口
begin
  chWARNIFUNICODEUNDERWIN95();
  DialogBox(HInstance, MakeIntResource(IDD_COPYDATA), 0, @Dlg_Proc);
end.

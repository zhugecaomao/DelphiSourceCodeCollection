
// Module Name: WindowsX.h ->> WindowsX.pas
// Copyright (c) 1985-1997, Microsoft Corporation
// Translator: ÁõÂé×Ó, Liu_mazi@126.com

unit WindowsX;

interface

uses Windows;

procedure FORWARD_WM_NEXTDLGCTL(hWnd, hWndSetFocus: HWND; fNext: BOOL);
procedure FORWARD_WM_HSCROLL(hWnd, hWndScrollBar: HWND; nScrollCode, nPos: Integer);

function GetWindowStyle(hWnd: HWND): DWORD;
function SetDlgMsgResult(hWnd: HWND; MsgResult: LRESULT): BOOL;

function GetFirstChild(hWnd: HWND): HWND;
function GetFirstSibling(hWnd: HWND): HWND;
function GetLastSibling(hWnd: HWND): HWND;
function GetNextSibling(hWnd: HWND): HWND;
function GetPrevSibling(hWnd: HWND): HWND;

procedure SetWindowRedraw(hWndL: HWND; fRedraw: BOOL);

function Static_GetText(hWndCtl: HWND; const lpch: PChar; cchMax: Integer): Integer;
function Static_SetText(hWndCtl: HWND; const lpsz: PChar): BOOL;

function Button_Enable(hWndCtl: HWND; fEnable: BOOL): BOOL;
function Button_GetCheck(hWndCtl: HWND): Integer;
procedure Button_SetCheck(hWndCtl: HWND; Check: Integer);

function Edit_GetText(hWndCtl: HWND; lpch: PChar; cchMax: Integer): Integer;
function Edit_GetTextLength(hWndCtl: HWND): Integer;
function Edit_SetText(hWndCtl: HWND; lpsz: PChar): BOOL;

function ScrollBar_SetPos(hWndCtl: HWND; Pos: Integer; fRedraw: BOOL): Integer;
function ScrollBar_GetPos(hWndCtl: HWND): Integer;
function ScrollBar_SetRange(hWndCtl: HWND; posMin, posMax: Integer; fRedraw: BOOL): BOOL;
function ScrollBar_GetRange(hWndCtl: HWND; lpposMin, lpposMax: PInteger): BOOL;

function ListBox_Enable(hWndCtl: HWND; fEnable: BOOL): BOOL;
procedure ListBox_ResetContent(hWndCtl: HWND);
function ListBox_GetCount(hWndCtl: HWND): Integer;
function ListBox_AddString(hWndCtl: HWND; lpsz: PChar): Integer;
function ListBox_DeleteString(hWndCtl: HWND; nIndex: Integer): Integer;
function ListBox_GetText(hWndCtl: HWND; nIndex: Integer; lpszBuffer: PChar): Integer;
function ListBox_GetItemData(hWndCtl: HWND; nIndex: Integer): DWORD;
function ListBox_SetItemData(hWndCtl: HWND; nIndex: Integer; dwData: DWORD): Integer;
function ListBox_GetCurSel(hWndCtl: HWND): Integer;
function ListBox_SetCurSel(hWndCtl: HWND; nIndex: Integer): Integer;
procedure ListBox_SetHorizontalExtent(hWndCtl: HWND; cxExtent: Integer);

function ComboBox_GetText(hWndCtl: HWND; lpch: PChar; cchMax: Integer): Integer;
function ComboBox_AddString(hWndCtl: HWND; lpsz: PChar): Integer;
function ComboBox_GetLBTextLen(hWndCtl: HWND; nIndex: Integer): Integer;
function ComboBox_GetLBText(hWndCtl: HWND; nIndex: Integer; lpszBuffer: PChar): Integer;
function ComboBox_GetCurSel(hWndCtl: HWND): Integer;
function ComboBox_SetCurSel(hWndCtl: HWND; nIndex: Integer): Integer;

implementation

uses Messages;

procedure FORWARD_WM_NEXTDLGCTL(hWnd, hWndSetFocus: HWND; fNext: BOOL);
begin
  SendMessage(hWnd, WM_NEXTDLGCTL, hWndSetFocus, LPARAM(fNext));
end;

procedure FORWARD_WM_HSCROLL(hWnd, hWndScrollBar: HWND; nScrollCode, nPos: Integer);
begin
  SendMessage(hWnd, WM_HSCROLL, MakeWParam(nScrollCode, nPos), hWndScrollBar);
end;

function GetWindowStyle(hWnd: HWND): DWORD;
begin
  Result := GetWindowLong(hWnd, GWL_STYLE);
end;

function SetDlgMsgResult(hWnd: HWND; MsgResult: LRESULT): BOOL;
begin
  Result := BOOL(SetWindowLong(hWnd, DWL_MSGRESULT, MsgResult));
end;

function GetFirstChild(hWnd: HWND): HWND;
begin
  Result := GetTopWindow(hWnd);
end;

function GetFirstSibling(hWnd: HWND): HWND;
begin
  Result := GetWindow(hWnd, GW_HWNDFIRST);
end;

function GetLastSibling(hWnd: HWND): HWND;
begin
  Result := GetWindow(hWnd, GW_HWNDLAST);
end;

function GetNextSibling(hWnd: HWND): HWND;
begin
  Result := GetWindow(hWnd, GW_HWNDNEXT);
end;

function GetPrevSibling(hWnd: HWND): HWND;
begin
  Result := GetWindow(hWnd, GW_HWNDPREV);
end;

procedure SetWindowRedraw(hWndL: HWND; fRedraw: BOOL);
begin
  SendMessage(hWndL, WM_SETREDRAW, WPARAM(fRedraw), 0);
end;

function Static_GetText(hWndCtl: HWND; const lpch: PChar; cchMax: Integer): Integer;
begin
  Result := GetWindowText(hWndCtl, lpch, cchMax);
end;

function Static_SetText(hWndCtl: HWND; const lpsz: PChar): BOOL;
begin
  Result := SetWindowText(hWndCtl, lpsz);
end;

function Button_Enable(hWndCtl: HWND; fEnable: BOOL): BOOL;
begin
  Result := EnableWindow(hWndCtl, fEnable);
end;

function Button_GetCheck(hWndCtl: HWND): Integer;
begin
  Result := SendMessage(hWndCtl, BM_GETCHECK, 0, 0);
end;

procedure Button_SetCheck(hWndCtl: HWND; Check: Integer);
begin
  SendMessage(hWndCtl, BM_SETCHECK, Check, 0);
end;

function Edit_GetText(hWndCtl: HWND; lpch: PChar; cchMax: Integer): Integer;
begin
  Result := GetWindowText(hWndCtl, lpch, cchMax);
end;

function Edit_GetTextLength(hWndCtl: HWND): Integer;
begin
  Result := GetWindowTextLength(hWndCtl);
end;

function Edit_SetText(hWndCtl: HWND; lpsz: PChar): BOOL;
begin
  Result := SetWindowText(hWndCtl, lpsz);
end;

function ScrollBar_SetPos(hWndCtl: HWND; Pos: Integer; fRedraw: BOOL): Integer;
begin
  Result := SetScrollPos(hWndCtl, SB_CTL, Pos, fRedraw);
end;

function ScrollBar_GetPos(hWndCtl: HWND): Integer;
begin
  Result := GetScrollPos(hWndCtl, SB_CTL);
end;

function ScrollBar_SetRange(hWndCtl: HWND; posMin, posMax: Integer; fRedraw: BOOL): BOOL;
begin
  Result := SetScrollRange(hWndCtl, SB_CTL, posMin, posMax, fRedraw);
end;

function ScrollBar_GetRange(hWndCtl: HWND; lpposMin, lpposMax: PInteger): BOOL;
begin
  Result := GetScrollRange(hWndCtl, SB_CTL, lpposMin^, lpposMax^);
end;

function ListBox_Enable(hWndCtl: HWND; fEnable: BOOL): BOOL;
begin
  Result := EnableWindow(hWndCtl, fEnable);
end;

procedure ListBox_ResetContent(hWndCtl: HWND);
begin
  SendMessage(hWndCtl, LB_RESETCONTENT, 0, 0);
end;

function ListBox_GetCount(hWndCtl: HWND): Integer;
begin                              
  Result := SendMessage(hWndCtl, LB_GETCOUNT, 0, 0);
end;

function ListBox_AddString(hWndCtl: HWND; lpsz: PChar): Integer;
begin
  Result := SendMessage(hWndCtl, LB_ADDSTRING, 0, LPARAM(lpsz));
end;

function ListBox_DeleteString(hWndCtl: HWND; nIndex: Integer): Integer;
begin
  Result := SendMessage(hWndCtl, LB_DELETESTRING, nIndex, 0);
end;  

function ListBox_GetText(hWndCtl: HWND; nIndex: Integer; lpszBuffer: PChar): Integer;
begin
  Result := SendMessage(hWndCtl, LB_GETTEXT, nIndex, LPARAM(lpszBuffer));
end;

function ListBox_GetItemData(hWndCtl: HWND; nIndex: Integer): DWORD;
begin
  Result := SendMessage(hWndCtl, LB_GETITEMDATA, nIndex, 0);
end;  

function ListBox_SetItemData(hWndCtl: HWND; nIndex: Integer; dwData: DWORD): Integer;
begin
  Result := SendMessage(hWndCtl, LB_SETITEMDATA, nIndex, dwData);
end;

function ListBox_GetCurSel(hWndCtl: HWND): Integer;
begin
  Result := SendMessage(hWndCtl, LB_GETCURSEL, 0, 0);
end;
  
function ListBox_SetCurSel(hWndCtl: HWND; nIndex: Integer): Integer;
begin
  Result := SendMessage(hWndCtl, LB_SETCURSEL, nIndex, 0);
end;

procedure ListBox_SetHorizontalExtent(hWndCtl: HWND; cxExtent: Integer);
begin
  SendMessage(hWndCtl, LB_SETHORIZONTALEXTENT, cxExtent, 0);
end;

function ComboBox_GetText(hWndCtl: HWND; lpch: PChar; cchMax: Integer): Integer;
begin
  Result := GetWindowText(hWndCtl, lpch, cchMax);
end;

function ComboBox_AddString(hWndCtl: HWND; lpsz: PChar): Integer;
begin
  Result := SendMessage(hWndCtl, CB_ADDSTRING, 0, LPARAM(lpsz));
end;

function ComboBox_GetLBTextLen(hWndCtl: HWND; nIndex: Integer): Integer;
begin
  Result := SendMessage(hWndCtl, CB_GETLBTEXTLEN, nIndex, 0);
end;

function ComboBox_GetLBText(hWndCtl: HWND; nIndex: Integer; lpszBuffer: PChar): Integer;
begin
  Result := SendMessage(hWndCtl, CB_GETLBTEXT, nIndex, LPARAM(lpszBuffer));
end;  

function ComboBox_GetCurSel(hWndCtl: HWND): Integer;
begin
  Result := SendMessage(hWndCtl, CB_GETCURSEL, 0, 0);
end;

function ComboBox_SetCurSel(hWndCtl: HWND; nIndex: Integer): Integer;
begin
  Result := SendMessage(hWndCtl, CB_SETCURSEL, nIndex, 0);
end;

end.

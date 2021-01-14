program AppInst;

{$R 'AppInst.res' 'AppInst.rc'}

uses
  Windows, Messages;

const
  IDD_APPINST =   1; // 模板ID
  IDI_APPINST = 101; // 图标ID
  IDC_COUNT   = 100; // 控件ID

var
  g_uMsgAppInstCountUpdate: DWORD = INVALID_ATOM; // 自注册消息
  g_plApplicationInstances: PLongInt = nil;       // 共享节地址

  // 处理WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_APPINST)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_APPINST)));

  PostMessage(HWND_BROADCAST, g_uMsgAppInstCountUpdate, 0, 0); // 通知所有实例, 计数已变化

  Result := TRUE;
end;

  // 处理WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
begin
  if (id = IDCANCEL) then EndDialog(hWnd, id);
end;

  // 对话框消息回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM):BOOL; stdcall;
begin
  case (uMsg) of
    WM_INITDIALOG:
      begin
        Result := SetWindowLong(hWnd, DWL_MSGRESULT, Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))) <> 0;
      end;

    WM_COMMAND:
      begin
        Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
        Result := TRUE;
      end

    else
      if (uMsg = g_uMsgAppInstCountUpdate) then
      begin
        SetDlgItemInt(hWnd, IDC_COUNT, g_plApplicationInstances^, FALSE); // 显示最新计数值
        Result := TRUE;
      end else
        Result := FALSE;
  end;
end;

  // 比较节名字符数组
function CompareSectionName(S1, S2: PByte): BOOL;
begin
  while (S1^ <> 0) and (S2^ <> 0) and (S1^ <> S2^) do
  begin
    Inc(S1);
    Inc(S2);
  end;
  Result := (S1^ = S2^); // or (S2^ = 0)
end;

  // 寻找符合条件的节
function SectionVirualAddress(const Name: string; MiniSize, Character: DWORD): Pointer;
var
  BasePt: DWord;
  TempPt: PByte;
  NumSec: Word;
begin
  Result := nil;

  // EXE 映像基地址
  BasePt := GetModuleHandle(nil);
  if (BasePt = 0) then Exit else TempPt := PByte(BasePt);

  // 效验 DOS 文件头
  if (PImageDosHeader(TempPt).e_magic <> IMAGE_DOS_SIGNATURE) then Exit;
  Inc(TempPt, PImageDosHeader(TempPt)._lfanew);

  // 效验 PE 文件头
  if (PImageNtHeaders(TempPt).Signature <> IMAGE_NT_SIGNATURE) then Exit;
  NumSec := PImageNtHeaders(TempPt).FileHeader.NumberOfSections;

  // 定位到节表数组
  Inc(TempPt, SizeOf(DWORD) + SizeOf(TImageFileHeader) +
    PImageNtHeaders(TempPt).FileHeader.SizeOfOptionalHeader);

  // 遍历数组, 寻找符合条件的节
  while (NumSec <> 0) do
  begin
    if ( CompareSectionName(@PImageSectionHeader(TempPt).Name[0], @Name[1]) ) and    // 名称
       ( PImageSectionHeader(TempPt).Characteristics and Character = Character ) and // 属性
       ( PImageSectionHeader(TempPt).Misc.VirtualSize >= MiniSize ) then             // 大小
    begin
      Result := Pointer(BasePt + PImageSectionHeader(TempPt).VirtualAddress);
      Exit;
    end;

    Dec(NumSec);
    Inc(PImageSectionHeader(TempPt), 1);
  end;
end;

  // 程序入口
begin
  // 首先, 很感谢 DelphiBBS 上的朋友们给予的帮助, 详细讨论请见
  // http://www.delphibbs.com/delphibbs/dispq.asp?lid=3088031

  // 至今为止, 还没找到试验成功的让Delphi编译时增加新节的方法,
  // 如果您知道, 希望能教我, 不胜感激, 邮箱: Liu_mazi@126.com

  // 目前用的是一个不得已的办法, 即编译之后再用PE编辑工具修改,
  // 手工给EXE加上一个名为'Shared'的带共享属性的节, 且VSize=4,
  // 而程序运行时, 会尝试寻找这个新增的节, 并用他存储全局数据

  // 定位新节
  g_plApplicationInstances := SectionVirualAddress('Shared', 4,
    IMAGE_SCN_MEM_SHARED or IMAGE_SCN_MEM_READ or IMAGE_SCN_MEM_WRITE);
  if (g_plApplicationInstances = nil) then
  begin
    MessageBox(0, '定位共享节失败', 'AppInst', MB_OK);
    Exit;
  end;

  // 注册消息
  g_uMsgAppInstCountUpdate := RegisterWindowMessage('MsgAppInstCountUpdate');

  // 增加计数
  InterlockedExchangeAdd(g_plApplicationInstances, 1);

  // 显示界面
  DialogBox(HInstance, MakeIntResource(IDD_APPINST), 0, @Dlg_Proc);

  // 减少计数
  InterlockedExchangeAdd(g_plApplicationInstances, -1);

  // 广播通知
  PostMessage(HWND_BROADCAST, g_uMsgAppInstCountUpdate, 0, 0);
end.

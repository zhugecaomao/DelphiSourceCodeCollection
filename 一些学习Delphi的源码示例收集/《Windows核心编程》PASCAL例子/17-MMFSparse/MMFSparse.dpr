program MMFSparse;

{$R 'MMFSparse.res' 'MMFSparse.rc'}

uses Windows, Messages, SparseStream in 'SparseStream.pas';

type
  TByteArray = array[0..0] of Byte;
  PByteArray = ^TByteArray;

  TMMFSparse = class(TSparseStream)
  private
    m_hFilemap: THandle;
    m_pvFile: Pointer;
  public
    function ByteArrayPt(): PByteArray;
    constructor Create(hStream: THandle = 0; dwStreamSizeMax: DWORD = 0);
    destructor Destroy(); override;
    function Initialize(hStream: THandle; dwStreamSizeMax: DWORD): BOOL;
    procedure ForceClose();
  end;

function TMMFSparse.ByteArrayPt(): PByteArray;
begin
  Result := m_pvFile;
end;
  
constructor TMMFSparse.Create(hStream: THandle = 0; dwStreamSizeMax: DWORD = 0);
begin
  Initialize(hStream, dwStreamSizeMax);
end;

destructor TMMFSparse.Destroy();
begin
  ForceClose();
end;

  // 建立内存映射文件并映射至进程空间
function TMMFSparse.Initialize(hStream: THandle; dwStreamSizeMax: DWORD): BOOL;
begin
  if (m_hFileMap <> 0) then ForceClose();

  m_hFileMap := 0;
  m_pvFile := nil;
  Result := TRUE;

  if (hStream <> 0) then
  begin
    if (dwStreamSizeMax = 0) then DebugBreak();

    inherited Initialize(hStream);
    Result := MakeSparse();

    if (Result) then
    begin
      m_hFileMap := CreateFileMapping(hStream, nil, PAGE_READWRITE,
        DWORD(dwStreamSizeMax shr 32), DWORD(dwStreamSizeMax), nil); // **

      if (m_hFileMap <> 0) then
      begin
        m_pvFile := MapViewOfFile(m_hFileMap, FILE_MAP_WRITE or FILE_MAP_READ, 0, 0, 0);
      end else
      begin
        inherited Initialize(0);
        ForceClose();
        Result := FALSE;
      end;
    end;

  end;
end;

  // 取消内存映射并关闭映射文件
procedure TMMFSparse.ForceClose();
begin
  if (m_pvFile <> nil) then
  begin
    UnmapViewOfFile(m_pvFile);
    m_pvFile := nil;
  end;

  if (m_hFilemap <> 0) then
  begin
    CloseHandle(m_hFilemap);
    m_hFilemap := 0;
  end;
end;

const
  StreamSize = 1 * 1024 * 1024; // 1 MB = 1024 KB, 1 KB = 1024 Byte
  szPathname = 'Z:\MMFSparse.';
  IDC_CREATEMMF            = 101;
  IDC_OFFSET               = 103;
  IDC_WRITEBYTE            = 105;
  IDC_READBYTE             = 106;
  IDC_BYTE                 = 109;
  IDC_FILESTATUS           = 1000;
  IDC_FREEALLOCATEDREGIONS = 1002;
  IDD_MMFSPARSE = 1;
  IDI_MMFSPARSE = 102;

var
  g_hStream: THandle = INVALID_HANDLE_VALUE;
  g_mmf: TMMFSparse;

  // WM_INITDIALOG处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_MMFSPARSE)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_MMFSPARSE)));

  EnableWindow(GetDlgItem(hWnd, IDC_OFFSET), FALSE);
  SendMessage(GetDlgItem(hWnd, IDC_OFFSET), EM_LIMITTEXT, 4, 0);
  SetDlgItemInt(hWnd, IDC_OFFSET, 1000, FALSE);
  EnableWindow(GetDlgItem(hWnd, IDC_BYTE), FALSE);
  SendMessage(GetDlgItem(hWnd, IDC_BYTE), EM_LIMITTEXT, 3, 0);
  SetDlgItemInt(hWnd, IDC_BYTE, 5, FALSE);
  EnableWindow(GetDlgItem(hWnd, IDC_WRITEBYTE), FALSE);
  EnableWindow(GetDlgItem(hWnd, IDC_READBYTE), FALSE);
  EnableWindow(GetDlgItem(hWnd, IDC_FREEALLOCATEDREGIONS), FALSE);

  Result := TRUE;
end;

  // 显示内存分配情况
procedure Dlg_ShowAllocatedRanges(hWnd: HWND);
var
  dwNumEntries: DWORD;
  pfarb: PFileAllocatedRangeBufferArray;
  sz: array[0..4095] of Char;
  dwEntry: DWORD;
  CurrEnd: PChar;
  ArgList: array[0..1] of DWORD;
begin
  pfarb := PFileAllocatedRangeBufferArray(g_mmf.QueryAllocatedRanges(@dwNumEntries));

  if (dwNumEntries = 0) then
  begin
    SetDlgItemText(hWnd, IDC_FILESTATUS, 'No allocated ranges in the file');
  end else
  begin
    CurrEnd := @sz[0];
    CurrEnd[0] := #0;
    for dwEntry := 0 to dwNumEntries - 1 do
    begin
      ArgList[0] := pfarb[dwEntry].FileOffset.LowPart;
      ArgList[1] := pfarb[dwEntry].Length.LowPart;
      Inc(CurrEnd, wvsprintf(CurrEnd, 'Offset: %7.7u, Length: %7.7u'#13#10, @ArgList));
    end;
    SetDlgItemText(hWnd, IDC_FILESTATUS, sz);
  end;

  g_mmf.FreeAllocatedRanges(PFileAllocatedRangeBuffer(pfarb));
end;

  // WM_COMMAND处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  fTranslated: BOOL;
  dwOffset: DWORD;
begin
  case (id) of
    IDCANCEL:
      begin
        if (g_hStream <> INVALID_HANDLE_VALUE) then CloseHandle(g_hStream);
        EndDialog(hWnd, id);
      end;

    IDC_CREATEMMF:
      begin
        // 建立Z:\MMFSparse
        g_hStream := CreateFile(szPathname, GENERIC_READ or GENERIC_WRITE, 0, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
        if (g_hStream = INVALID_HANDLE_VALUE) then
        begin
          MessageBox(GetActiveWindow(), 'Failed to create file.', 'MMFSparse', MB_OK);
          DebugBreak();
          Exit;
        end;

        // 建立文件内存映射
        if (g_mmf.Initialize(g_hStream, StreamSize) = FALSE) then
        begin
          MessageBox(GetActiveWindow(), 'Failed to initialize Sparse MMF.', 'MMFSparse', MB_OK);
          DebugBreak();
          Exit;
        end;
        Dlg_ShowAllocatedRanges(hWnd);

        EnableWindow(GetDlgItem(hWnd, IDC_CREATEMMF), FALSE);
        EnableWindow(GetDlgItem(hWnd, IDC_OFFSET), TRUE);
        EnableWindow(GetDlgItem(hWnd, IDC_BYTE), TRUE);
        EnableWindow(GetDlgItem(hWnd, IDC_WRITEBYTE), TRUE);
        EnableWindow(GetDlgItem(hWnd, IDC_READBYTE), TRUE);
        EnableWindow(GetDlgItem(hWnd, IDC_FREEALLOCATEDREGIONS), TRUE);
        SetFocus(GetDlgItem(hWnd, IDC_OFFSET));
      end;

    IDC_WRITEBYTE:
      begin
        dwOffset := GetDlgItemInt(hWnd, IDC_OFFSET, fTranslated, FALSE);
        if (fTranslated) then
        begin
          g_mmf.ByteArrayPt[dwOffset * 1024] := GetDlgItemInt(hWnd, IDC_BYTE, PBOOL(nil)^, FALSE);
          Dlg_ShowAllocatedRanges(hWnd);
        end;
      end;

    IDC_READBYTE:
      begin
        dwOffset := GetDlgItemInt(hWnd, IDC_OFFSET, fTranslated, FALSE);
        if (fTranslated) then
        begin
          SetDlgItemInt(hWnd, IDC_BYTE, g_mmf.ByteArrayPt[dwOffset * 1024], FALSE);
          Dlg_ShowAllocatedRanges(hWnd);
        end;
      end;

    IDC_FREEALLOCATEDREGIONS:
      begin
        // 取消内存映射后将文件全部清零(无效数据)
        g_mmf.ForceClose();
        g_mmf.DecommitPortionOfStream(0, StreamSize);
        g_mmf.Initialize(g_hStream, StreamSize);
        Dlg_ShowAllocatedRanges(hWnd);
      end;
  end; // END case of ....
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := FALSE;

  case (uMsg) of
    WM_INITDIALOG:
      Result := SetWindowLong(hWnd,
        DWL_MSGRESULT, Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))) <> 0;

    WM_COMMAND:
      Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
  end;
end;

  // 程序入口
var
  vi: TOSVersionInfo;
begin
  vi.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(vi);

  if (vi.dwPlatformId <> VER_PLATFORM_WIN32_NT) or (vi.dwMajorVersion < 5) then
    MessageBox(0, 'This application requires features present in Windows 2000.', 'MMFSparse', MB_OK)
  else begin
    if g_mmf.DoesFileSystemSupportSparseStreams('Z:\') then
    begin  
      g_mmf := TMMFSparse.Create();
      DialogBox(HInstance, MakeIntResource(IDD_MMFSPARSE), 0, @Dlg_Proc);
      g_mmf.Free;
    end else
      MessageBox(0, 'Current File System nonsupport the Sparse Files.', 'MMFSparse', MB_OK);
  end;
end.

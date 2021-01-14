unit DibFile;

interface

uses
  Windows, CommDlg;

procedure DibFileInitialize(hWnd: HWND); // 初始化对话框结构体
function DibFileOpenDlg(hWnd: HWND; pstrFileName, pstrTitleName: PChar): Boolean; // 打开文件对话框
function DibFileSaveDlg(hWnd: HWND; pstrFileName, pstrTitleName: PChar): Boolean; // 保存文件对话框
function DibLoadImage(pstrFileName: PChar): PBitmapFileHeader; // 装入图片文件
function DibSaveImage(pstrFileName: PChar; pbmfh: PBitmapFileHeader): Boolean; // 保存图片文件

implementation

var
  ofn: TOpenFilename;

procedure DibFileInitialize(hWnd: HWND);
const
  szFilter = 'Bitmap Files (*.BMP)'#0'*.bmp'#0'All Files (*.*)'#0'*.*'#0#0;
begin
  ofn.lStructSize := SizeOf(TOpenFilename);
  ofn.hwndOwner := hWnd;
  ofn.hInstance := 0;
  ofn.lpstrFilter := szFilter;
  ofn.lpstrCustomFilter := nil;
  ofn.nMaxCustFilter := 0;
  ofn.nFilterIndex := 0;
  ofn.lpstrFile := nil; // Set in Open and Close functions
  ofn.nMaxFile := MAX_PATH;
  ofn.lpstrFileTitle := nil; // Set in Open and Close functions
  ofn.nMaxFileTitle := MAX_PATH;
  ofn.lpstrInitialDir := nil;
  ofn.lpstrTitle := nil;
  ofn.Flags := 0; // Set in Open and Close functions
  ofn.nFileOffset := 0;
  ofn.nFileExtension := 0;
  ofn.lpstrDefExt := 'bmp';
  ofn.lCustData := 0;
  ofn.lpfnHook := nil;
  ofn.lpTemplateName := nil;
end;

function DibFileOpenDlg(hWnd: HWND; pstrFileName, pstrTitleName: PChar): Boolean;
begin
  ofn.hwndOwner := hWnd;
  ofn.lpstrFile := pstrFileName;
  ofn.lpstrFileTitle := pstrTitleName;
  ofn.Flags := 0;
  Result := GetOpenFileName(ofn);
end;

function DibFileSaveDlg(hWnd: HWND; pstrFileName, pstrTitleName: PChar): Boolean;
begin
  ofn.hwndOwner := hWnd;
  ofn.lpstrFile := pstrFileName;
  ofn.lpstrFileTitle := pstrTitleName;
  ofn.Flags := OFN_OVERWRITEPROMPT;
  Result := GetSaveFileName(ofn);
end;

function DibLoadImage(pstrFileName: PChar): PBitmapFileHeader;
var
  bSuccess: Boolean;
  dwFileSize, dwHighSize, dwBytesRead: DWORD;
  hFile: THandle;
begin
  Result := nil;
  hFile := CreateFile(pstrFileName, GENERIC_READ, FILE_SHARE_READ, nil,
                   OPEN_EXISTING, FILE_FLAG_SEQUENTIAL_SCAN, 0);
  if (hFile = INVALID_HANDLE_VALUE) then Exit;
  dwFileSize := GetFileSize(hFile, @dwHighSize);
  if (dwHighSize <> 0) then
  begin
    CloseHandle(hFile);
    Exit;
  end;
  GetMem(Result, dwFileSize);
  if (Result = nil) then
  begin
    CloseHandle(hFile);
    Exit;
  end;
  bSuccess := ReadFile(hFile, Result^, dwFileSize, dwBytesRead, nil);
  CloseHandle(hFile);
  if (not bSuccess) or (dwBytesRead <> dwFileSize) or
     (Result.bfType <> $4D42) or (Result.bfSize <> dwFileSize) then
  begin
    FreeMem(Result);
    Result := nil;
    Exit;
  end;
end;

function DibSaveImage(pstrFileName: PChar; pbmfh: PBitmapFileHeader): Boolean;
var
  bSuccess: Boolean;
  dwBytesWritten: DWORD;
  hFile: THandle;
begin
  Result := FALSE;
  hFile := CreateFile(pstrFileName, GENERIC_WRITE, 0, nil,
                   CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if (hFile = INVALID_HANDLE_VALUE) then Exit;
  bSuccess := WriteFile(hFile, pbmfh^, pbmfh.bfSize, dwBytesWritten, nil);
  CloseHandle(hFile);
  if (not bSuccess) or (dwBytesWritten <> pbmfh.bfSize) then
  begin
    DeleteFile(pstrFileName);
    Exit;
  end;
  Result := TRUE;
end;

end.

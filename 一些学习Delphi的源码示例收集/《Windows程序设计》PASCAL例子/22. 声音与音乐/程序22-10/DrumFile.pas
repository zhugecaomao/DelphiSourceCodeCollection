unit DrumFile;

interface

uses Windows, DrumTime;

function DrumFileOpenDlg(hWnd: HWND; szFileName, szTitleName: PChar): Boolean;
function DrumFileSaveDlg(hWnd: HWND; szFileName, szTitleName: PChar): Boolean;
function DrumFileWrite(pDrum: PDrum; szFileName: PChar): PChar;
function DrumFileRead(pDrum: PDrum; szFileName: PChar): PChar;

implementation

uses MMSystem, CommDlg;

const
  szDrumID = 'DRUM';
  szListID = 'LIST';
  szInfoID = 'INFO';
  szSoftID = 'ISFT';
  szDateID = 'ISCD';
  szFmtID  = 'fmt ';
  szDataID = 'data';
  szSoftware = 'DRUM by Charles Petzold, Programming Windows';
  szErrorNoCreate = 'File %s could not be opened for writing.';
  szErrorCannotWrite = 'File %s could not be written to. ';
  szErrorNotFound = 'File %s not found or cannot be opened.';
  szErrorNotDrum = 'File %s is not a standard DRUM file.';
  szErrorUnsupported = 'File %s is not a supported DRUM file.';
  szErrorCannotRead = 'File %s cannot be read.';
  szFilter: array[0..2] of PChar = ('Drum Files (*.DRM)', '*.drm', '');
 
var
  ofn: TOpenFilename; // = { sizeof (OPENFILENAME) }

  // 打开文件对话框
function DrumFileOpenDlg(hWnd: HWND; szFileName, szTitleName: PChar): Boolean;
begin
  ofn.lStructSize := SizeOf(TOpenFilename);
  ofn.hwndOwner := hWnd;
  ofn.lpstrFilter := szFilter[0];
  ofn.lpstrFile := szFileName;
  ofn.nMaxFile := MAX_PATH;
  ofn.lpstrFileTitle := szTitleName;
  ofn.nMaxFileTitle := MAX_PATH;
  ofn.Flags := OFN_CREATEPROMPT;
  ofn.lpstrDefExt := 'drm';
  
  Result := GetOpenFileName(ofn);
end;

  // 保存文件对话框
function DrumFileSaveDlg(hWnd: HWND; szFileName, szTitleName: PChar): Boolean;
begin
  ofn.lStructSize := SizeOf(TOpenFilename);
  ofn.hwndOwner := hWnd;
  ofn.lpstrFilter := szFilter[0];
  ofn.lpstrFile := szFileName;
  ofn.nMaxFile := MAX_PATH;
  ofn.lpstrFileTitle := szTitleName;
  ofn.nMaxFileTitle := MAX_PATH;
  ofn.Flags := OFN_OVERWRITEPROMPT;
  ofn.lpstrDefExt := 'drm';
  
  Result := GetSaveFileName(ofn);
end;

  // 保存drm文件
function DrumFileWrite(pDrum: PDrum; szFileName: PChar): PChar;
var
  szDateBuf: array[0..16] of Char;
  hmmio: Integer; // HMMIO
  iFormat: Integer;
  MMCKInfo: array[0..2] of TMMCKInfo;
  st: TSystemTime;
  wError: WORD;
  List: array[0..2] of DWORD;
begin
  iFormat := 2;
  wError := 0;
  ZeroMemory(@MMCKInfo[0], 3 * SizeOf(TMMCKInfo));

 // Recreate the file for writing
  hmmio := mmioOpen(szFileName, nil, MMIO_CREATE or MMIO_WRITE or MMIO_ALLOCBUF);
  if (hmmio = 0) then
  begin
    Result := szErrorNoCreate;
    Exit;
  end;

 // Create a "RIFF" chunk with a "CPDR" type
  mmckinfo[0].fccType := mmioStringToFOURCC(szDrumID, 0);
  wError := wError or mmioCreateChunk(hmmio, @mmckinfo[0], MMIO_CREATERIFF);

 // Create "LIST" sub-chunk with an "INFO" type
  mmckinfo[1].fccType := mmioStringToFOURCC(szInfoID, 0);
  wError := wError or mmioCreateChunk(hmmio, @mmckinfo[1], MMIO_CREATELIST);

 // Create "ISFT" sub-sub-chunk
  mmckinfo[2].ckid := mmioStringToFOURCC(szSoftID, 0);
  wError := wError or mmioCreateChunk(hmmio, @mmckinfo[2], 0);
  wError := wError or WORD(mmioWrite(hmmio, szSoftware, SizeOf(szSoftware)) <> SizeOf(szSoftware));
  wError := wError or mmioAscend(hmmio, @mmckinfo[2], 0);

 // Create a time string
  GetLocalTime(st);
  List[0] := st.wYear;
  List[1] := st.wMonth;
  List[2] := st.wDay;
  wvsprintfA(szDateBuf, '%04d-%02d-%02d', @List[0]);

 // Create "ISCD" sub-sub-chunk
  mmckinfo[2].ckid := mmioStringToFOURCC(szDateID, 0);
  wError := wError or mmioCreateChunk(hmmio, @mmckinfo[2], 0);
  wError := wError or WORD(mmioWrite(hmmio, szDateBuf, lstrlen(szDateBuf) + 1) <> lstrlen(szDateBuf) + 1);
  wError := wError or mmioAscend(hmmio, @mmckinfo[2], 0);
  wError := wError or mmioAscend(hmmio, @mmckinfo[1], 0);

 // Create "fmt " sub-chunk
  mmckinfo[1].ckid := mmioStringToFOURCC(szFmtID, 0);
  wError := wError or mmioCreateChunk(hmmio, @mmckinfo[1], 0);
  wError := wError or WORD(mmioWrite(hmmio, @iFormat, SizeOf(Integer)) <> SizeOf(Integer));
  wError := wError or mmioAscend(hmmio, @mmckinfo[1], 0);
                                 
 // Create the "data" sub-chunk
  mmckinfo[1].ckid := mmioStringToFOURCC(szDataID, 0);
  wError := wError or mmioCreateChunk(hmmio, @mmckinfo[1], 0);
  wError := wError or WORD(mmioWrite(hmmio, PChar(pDrum), SizeOf(TDrum)) <> SizeOf(TDrum));
  wError := wError or mmioAscend(hmmio, @mmckinfo[1], 0);
  wError := wError or mmioAscend(hmmio, @mmckinfo[0], 0);

 // Clean up and return
  wError := wError or mmioClose(hmmio, 0);
  if (wError <> 0) then
  begin
    mmioOpen(szFileName, nil, MMIO_DELETE);
    Result := szErrorCannotWrite;
    Exit;
  end;

  Result := nil;
end;

  // 装入drm文件
function DrumFileRead(pDrum: PDrum; szFileName: PChar): PChar;
var
  Drum: TDrum;
  hmmio: Integer; // HMMIO
  i, iFormat: Integer;
  mmckinfo: array[0..1] of TMMCKINFO;
begin
  ZeroMemory(@mmckinfo[0], 2 * SizeOf(TMMCKINFO));

 // Open the file
  hmmio := mmioOpen(szFileName, nil, MMIO_READ);
  if (hmmio = 0) then
  begin
    Result := szErrorNotFound;
    Exit;
  end;   

 // Locate a "RIFF" chunk with a "DRUM" form-type
  mmckinfo[0].ckid := mmioStringToFOURCC(szDrumID, 0);
  if (mmioDescend(hmmio, @mmckinfo[0], nil, MMIO_FINDRIFF) <> MMSYSERR_NOERROR) then
  begin
    mmioClose(hmmio, 0);
    Result := szErrorNotDrum;
    Exit;
  end;

 // Locate, read, and verify the "fmt " sub-chunk
  mmckinfo[1].ckid := mmioStringToFOURCC(szFmtID, 0);
  if (mmioDescend(hmmio, @mmckinfo[1], @mmckinfo[0], MMIO_FINDCHUNK) <> MMSYSERR_NOERROR) then
  begin
    mmioClose(hmmio, 0);
    Result := szErrorNotDrum;
    Exit;
  end;
  if (mmckinfo[1].cksize <> SizeOf(Integer)) then
  begin
    mmioClose(hmmio, 0);
    Result := szErrorUnsupported;
    Exit;
  end;
  if (mmioRead(hmmio, @iFormat, SizeOf(Integer)) <> SizeOf(Integer)) then
  begin
    mmioClose(hmmio, 0);
    Result := szErrorCannotRead;
    Exit;
  end;
  if (iFormat <> 1) and (iFormat <> 2) then
  begin
    mmioClose(hmmio, 0);
    Result := szErrorUnsupported;
    Exit;
  end;

 // Go to end of "fmt " sub-chunk
  mmioAscend(hmmio, @mmckinfo[1], 0);

 // Locate, read, and verify the "data" sub-chunk
  mmckinfo[1].ckid := mmioStringToFOURCC(szDataID, 0);
  if (mmioDescend(hmmio, @mmckinfo[1], @mmckinfo[0], MMIO_FINDCHUNK) <> 0) then
  begin
    mmioClose(hmmio, 0);
    Result := szErrorNotDrum;
    Exit;
  end;
  if (mmckinfo[1].cksize <> SizeOf(TDrum)) then
  begin
    mmioClose(hmmio, 0);
    Result := szErrorUnsupported;
    Exit;
  end;
  if (mmioRead(hmmio, @Drum, SizeOf(TDrum)) <> SizeOf(TDrum)) then
  begin
    mmioClose(hmmio, 0);
    Result := szErrorCannotRead;
    Exit;
  end;

 // Close the file
  mmioClose(hmmio, 0);
  
 // Convert format 1 to format 2 and copy the DRUM structure data
  if (iFormat = 1) then
  begin
    for i := 0 to NUM_PERC - 1 do
    begin
      Drum.dwSeqPerc[i] := Drum.dwSeqPian[i];
      Drum.dwSeqPian[i] := 0;
    end;
  end;
  CopyMemory(pDrum, @Drum, SizeOf(TDrum));

  Result := nil;
end;

end.

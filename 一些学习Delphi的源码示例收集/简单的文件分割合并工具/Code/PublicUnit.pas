unit  PublicUnit;

interface

const   
 {  控件ID  }
  TabCtrlID  = 10;
  Panel1ID   = 11;
  Panel2ID   = 12;
  Panel3ID   = 13;
  Button1ID  = 14;
  Button2ID  = 15;
  Button3ID  = 16;
  Button4ID  = 17;
  Button5ID  = 18;
  Button6ID  = 19;
  Button7ID  = 20;
  Button8ID  = 21;
  Button9ID  = 22;
  ComboBoxID = 23;
  GroupBoxID = 24;
  RadioBtID1 = 25;
  RadioBtID2 = 26;
  RadioBtID3 = 27;
  EditID1    = 28;
  EditID2    = 29;
  EditID3    = 30;
  ListBoxID  = 31;
 {   其他   }
  FormTitle  = ' 简易文件分割器    By 麻子';
  MAX_LENGTH = 1000;    
  
var           
 {  控件句柄  }
  hMainForm: LongWord;
  hTabCtrl: LongWord;
  hPanel1: LongWord;
  hPanel2: LongWord;
  hPanel3: LongWord;
  hButton1:LongWord;
  hButton2:LongWord;
  hButton3:LongWord;
  hButton4:LongWord;
  hButton5:LongWord;
  hButton6:LongWord;
  hButton7:LongWord;
  hButton8:LongWord;
  hButton9:LongWord;
  hComboBox: LongWord;
  hEdit1: LongWord;
  hEdit2: LongWord;
  hEdit3: LongWord;
  hGroupBox1: LongWord;
  hRadioBtn1: LongWord;
  hRadioBtn2: LongWord;
  hRadioBtn3: LongWord;
  hListBox: LongWord;
  hHintForm: LongWord; 
  hToolTip: LongWord;
  hImageList: LongWord;     
 {  字体句柄  }
  hSmallFont:  LongWord;
  hLargeFont:  LongWord;
  hNormalFont: LongWord;
  hLinkerFont: LongWord;
 {  光标句柄  }
  hHandCursor: LongWord;
  hArrowCursor: LongWord;
  hDrapCursor: LongWord;
 {  设备环境  }
  hHintFormDC: LongWord;
  hPanel1DC: LongWord;
  hPanel2DC: LongWord;
  hPanel3DC: LongWord;
 {   其他   }
  Continue_Run: Boolean;     // 处理(分割or合并)线程可以继续执行
  Mouse_Focus: Integer = 0;  // Panel3鼠标范围(0正常,1~4链接1~4)
  CurState: Integer = 0;     // 程序状态 (0正常,1分割中,2合并中)
  FileList: array of string; // 文件名列表数组
  FilesBuf: array[0..MAX_LENGTH] of Char;  

  
procedure Create_OurFont;   // 建立字体,装入光标 
procedure SetLeaveEvent(hWindow: Longword);   // 要求WM_MOUSELEAVE通知
procedure SetCaption(hWin: LongWord; const sText: string);  // 设窗体标题
function GetCaption(hWin: LongWord): string;                // 取窗体标题
function ExtractFileName(const FileName: string): string; // 解析出文件名
function ExtractFilePath(const FileName: string): string; // 解析出文件路径
function ExtractMainName(const FileName: string): string; // 解析出文件主名
function ExtractExteName(const FileName: string): string; // 解析出文件扩展名
function DirectoryExists(const Directory: string): Boolean; // 目录是否存在
function FileExists(const FileName: string): Boolean;       // 文件是否存在
function StrLen(const Str: PChar): Cardinal;              // PChar字符串长度
function StrCopy(Dest: PChar; const Source: PChar): PChar;// 拷贝PChar字符串
function StrPas(const Str: PChar): string;                // PChar转成string
function Trim(const S: string): string;                   // 去除首尾空格符
function StrToInt64(const S: string): Int64;              // 字符串转整数值
function Int2Hex(v: Integer): string;                     // 数值转16进制串
function GetFileLength(hFile: LongWord; const sFileName: string='mazi'): Int64; // 取文件长度
procedure CopyFileBlock(hSource, hDest: LongWord; BlockSize: Int64); // 拷贝文件块

implementation

uses
  Windows, Messages;

    // ---- 建立字体,提取光标 ---- //
procedure Create_OurFont;
begin
  hSmallFont := CreateFont(12, 6, 0, 0, FW_EXTRALIGHT, Byte(FALSE), Byte(FALSE),
    Byte(FALSE), GB2312_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
    DEFAULT_QUALITY, DEFAULT_PITCH, '宋体');
  hLargeFont := CreateFont(20, 10, 0, 0, FW_HEAVY, Byte(FALSE), Byte(FALSE),
    Byte(FALSE), GB2312_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
    DEFAULT_QUALITY, DEFAULT_PITCH, '宋体');  
  hNormalFont := CreateFont(14, 7, 0, 0, FW_EXTRALIGHT, Byte(FALSE), Byte(FALSE),
    Byte(FALSE), GB2312_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
    DEFAULT_QUALITY, DEFAULT_PITCH, '宋体');
  hLinkerFont := CreateFont(14, 7, 0, 0, FW_EXTRALIGHT, Byte(FALSE), Byte(TRUE),
    Byte(FALSE), GB2312_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
    DEFAULT_QUALITY, DEFAULT_PITCH, '宋体');   
  hHandCursor := LoadCursor(0, IDC_HAND) ;
  hArrowCursor := LoadCursor(0, IDC_ARROW);
  hDrapCursor := LoadCursor(hInstance, 'Drag');
end;         

    // -- 要求WM_MOUSELEAVE通知 -- //
procedure SetLeaveEvent(hWindow: Longword);
var
  EventTrack: TTrackMouseEvent;
begin
  with EventTrack do
  begin
    cbSize := Sizeof (EventTrack);
    dwFlags := TME_LEAVE;
    hwndTrack := hWindow;
    dwHoverTime := HOVER_DEFAULT;
  end;
  TrackMouseEvent(EventTrack);
end;

    // -- 取窗体标题文字 -- //
function GetCaption(hWin: LongWord): string;
var
  TextLength: Integer;
begin
  TextLength := GetWindowTextLength(hWin)+1;
  SetLength(Result, TextLength);
  GetWindowText(hWin, @Result[1], TextLength);
  Result := Trim( string(PChar(Result)) );
end;

   // -- 设窗体标题文字 -- //
procedure SetCaption(hWin: LongWord; const sText: string);
begin
  SetWindowText(hWin, PChar(sText));
end;

    // -- 解析出文件名 -- //
function ExtractFileName(const FileName: string): string;
var
  P: Integer;
begin
  P := Length(FileName);
  while (P > 0)and(FileName[P] <> '\')and(FileName[P] <> ':') do Dec(P);
  Result := Copy(FileName, P + 1, Length(FileName)-P);
end;

    // -- 解析出文件路径 -- //
function ExtractFilePath(const FileName: string): string;
var
  P: Integer;
begin
  P := Length(FileName);
  while (P > 0)and(FileName[P] <> '\')and(FileName[P] <> ':') do Dec(P);
  Result := Copy(FileName, 1, P);
end;

    // -- 解析出文件主名 -- //
function ExtractMainName(const FileName: string): string;
var
  P: Integer;
begin
  P := Length(FileName);
  while (P > 0)and(FileName[P] <> '.') do Dec(P);
  Result := Copy(FileName, 1, P-1);
end;

    // -- 解析出文件扩展名 -- //
function ExtractExteName(const FileName: string): string;
var
  P: Integer;
begin
  P := Length(FileName);
  while (P > 0)and(FileName[P] <> '.') do Dec(P);
  Result := Copy(FileName, P, Length(FileName)-P+1);
end;      

    // -- 目录是否存在 -- //
function DirectoryExists(const Directory: string): Boolean;
var
  Code: Integer;
begin
  Code := GetFileAttributes( PChar(Directory) );
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
end;

    // -- 文件是否存在 -- //
function FileExists(const FileName: string): Boolean;
  function FileAge(const FileName: string): Integer;
  type
    LongRec = packed record
      case Integer of
        0: (Lo, Hi: Word);
        1: (Words: array [0..1] of Word);
        2: (Bytes: array [0..3] of Byte);
    end;
  var
    Handle: THandle;
    FindData: TWin32FindData;
    LocalFileTime: TFileTime;
  begin
    Handle := FindFirstFile(PChar(FileName), FindData);
    if Handle <> INVALID_HANDLE_VALUE then
    begin
      Windows.FindClose(Handle);
      if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
      begin
        FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
        if FileTimeToDosDateTime(LocalFileTime, LongRec(Result).Hi, LongRec(Result).Lo) then
          Exit;
      end;
    end;
    Result := -1;
  end;
begin
  Result := FileAge(FileName) <> -1;
end;

    // -- PChar字符串长度 -- //
function StrLen(const Str: PChar): Cardinal; assembler;
asm
  MOV     EDX,EDI
  MOV     EDI,EAX
  MOV     ECX,0FFFFFFFFH
  XOR     AL,AL
  REPNE   SCASB
  MOV     EAX,0FFFFFFFEH
  SUB     EAX,ECX
  MOV     EDI,EDX
end;

    // -- 拷贝PChar字符串 -- //
function StrCopy(Dest: PChar; const Source: PChar): PChar;
asm
  PUSH    EDI
  PUSH    ESI
  MOV     ESI,EAX
  MOV     EDI,EDX
  MOV     ECX,0FFFFFFFFH
  XOR     AL,AL
  REPNE   SCASB
  NOT     ECX
  MOV     EDI,ESI
  MOV     ESI,EDX
  MOV     EDX,ECX
  MOV     EAX,EDI
  SHR     ECX,2
  REP     MOVSD
  MOV     ECX,EDX
  AND     ECX,3
  REP     MOVSB
  POP     ESI
  POP     EDI
end;

    // -- PChar转string -- //
function StrPas(const Str: PChar): string;
begin
  Result := Str;
end;

    // -- 去除首尾空格符 -- //
function Trim(const S: string): string;
var
  I, L: Integer;
begin
  L := Length(S);
  I := 1;
  while (I <= L) and (S[I] <= ' ') do Inc(I);
  if I > L then Result := '' else
  begin
    while S[L] <= ' ' do Dec(L);
    Result := Copy(S, I, L - I + 1);
  end;
end;

    // -- 字符串转数值 -- //
function StrToInt64(const S: string): Int64;
var
  E: Integer;
begin
  Val(S, Result, E);   if E<>0 then Result := 0;
end;

    // -- 数值转字符串 -- //
function Int2Hex(v: Integer): string;
var
  j: Integer;
  t: Byte;
  p: PByte;
begin
  Result := '000';
  p := @Result[3];
  for j:=1 to 3 do
  begin
    t := v and $0F;
    if (t > 9) then t := t + 7;
    t := t + $30;
    p^:= t;
    v := v shr 4;
    Dec(p);    
  end;
end;

    // -- 取文件长度 -- //
function GetFileLength(hFile: LongWord; const sFileName: string='mazi'): Int64;
var
  Low32, High32: LongWord;
begin
  if (sFileName <> 'mazi') then // 给了sFileName则打开
  begin
    hFile := CreateFile(PChar(sFileName), GENERIC_READ, 3, nil,
                      OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    if (hFile = INVALID_HANDLE_VALUE) then  hFile := 0;
  end;
  if (hFile = 0) then Result := 0
  else begin
    Low32 := GetFileSize(hFile, @High32);
    Result := High32;
    Result := (Result shl 32) or Low32;
  end;
  if sFileName<>'mazi' then CloseHandle(hFile);
end;

    // -- 拷贝文件块 -- //
procedure CopyFileBlock(hSource, hDest: LongWord; BlockSize: Int64);
const
  MaxBufSize = $F000;   // 申请内存上限 ..
var
  BufSize: LongWord;
  Buffer: PByte;
  Num, Tmp: LongWord;
begin
  if BlockSize > MaxBufSize then BufSize := MaxBufSize else BufSize := BlockSize;  
  GetMem(Buffer, BufSize);
  while (Continue_Run) and (BlockSize>0) do
  begin
    if (BlockSize > BufSize) then Num := BufSize else Num := BlockSize;
    ReadFile(hSource, Buffer^, Num, Tmp, nil);
    WriteFile(hDest, Buffer^, Num, Tmp, nil);
    Dec(BlockSize, Num);
  end; 
  FreeMem(Buffer, BufSize);
end;

end.

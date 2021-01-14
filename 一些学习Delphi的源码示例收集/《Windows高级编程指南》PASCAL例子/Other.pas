unit Other;

interface

uses Windows;

  { LIMITS.H, Line 46 }
const
  UINT_MAX = $FFFFFFFF;

  { WINNT.H, Line 6498 }
const
  HEAP_ZERO_MEMORY = $00000008;

  { WINNT.H, Line 4539 }
const
  PROCESSOR_ARCHITECTURE_INTEL = 0;
  PROCESSOR_ARCHITECTURE_MIPS  = 1;
  PROCESSOR_ARCHITECTURE_ALPHA = 2;
  PROCESSOR_ARCHITECTURE_PPC   = 3;

  { WINNT.H, Line 6519 }
const
  IS_TEXT_UNICODE_SIGNATURE = $0008;

  { EXCPT.H, Line 144 }
const
  EXCEPTION_EXECUTE_HANDLER = 1;
  EXCEPTION_CONTINUE_SEARCH = 0;
  EXCEPTION_CONTINUE_EXECUTION = -1;
  
  { EXCPT.H, Line 70 }
type
  TExceptionDisposition = DWORD;
const
  ExceptionContinueExecution = 0;
  ExceptionContinueSearch    = 1;
  ExceptionNestedException   = 2;
  ExceptionCollidedUnwind    = 3;

  // 标准线程SEH结构
type
  PExceptionRegistration = ^TExceptionRegistration;
  TExceptionRegistration = record
    Prev: PExceptionRegistration;
    Handler: Pointer; // 回调地址
  end;

  // 线程异常回调形式
type
  TfnPerThreadExcptionHandler = function(var ExceptionRecord: TExceptionRecord; var EstablisherFrame: TExceptionRegistration;
    var ContextRecord: TContext; DispatcherContext: Pointer): TExceptionDisposition; cdecl;

  // 自定义异常代码
const
  LeaveException = $20000000;

  { WINNT.H, Line 286 }
const
  ERROR_SEVERITY_ERROR = $C0000000;

  { ntstatus.h Line 216}
const
  STATUS_UNWIND = $C0000027;

  { shlwapi.h, Line 228 }
function PathFileExists(const pszPath: PChar): BOOL; stdcall;
  
  { Math.pas, Line 280 }
function IfThen(AValue: Bool; const ATrue: Integer; const AFalse: Integer = 0): Integer; overload;
function IfThen(AValue: Bool; const ATrue: Int64; const AFalse: Int64 = 0): Int64; overload;
function IfThen(AValue: Bool; const ATrue: Double; const AFalse: Double = 0.0): Double; overload;
function IfThen(AValue: Bool; const ATrue: PChar; const AFalse: PChar): PChar; overload;

  // 字符串函数集
function StrRev(const pString: PChar): PChar;
function StrChr(const pString: PChar; x: Char): PChar;
function StrRChr(const pString: PChar; x: Char): PChar;
function StrLen(const pString: PChar): Integer;

  // 包装打印API
function _wvsprintf(const Output, Format: PChar; const Arg_List: array of DWORD): Integer;

  // 寻找特定PE节
function SectionVirualAddress(hModule: HMODULE; const Name: string; MiniSize, Character: DWORD): Pointer;

  // 字符串转整数
function Str2Int(const pString: PChar): Integer;

  // 异常相关函数
procedure RemoveCurrentThreadOtherSEH();
procedure _leave();

implementation

function PathFileExists; external 'shlwapi.dll' Name 'PathFileExistsA';

function IfThen(AValue: Bool; const ATrue: Integer; const AFalse: Integer): Integer;
begin
  if AValue then Result := ATrue else Result := AFalse;
end;

function IfThen(AValue: Bool; const ATrue: Int64; const AFalse: Int64): Int64;
begin
  if AValue then Result := ATrue else Result := AFalse;
end;

function IfThen(AValue: Bool; const ATrue: Double; const AFalse: Double): Double;
begin
  if AValue then Result := ATrue else Result := AFalse;
end;

function IfThen(AValue: Bool; const ATrue: PChar; const AFalse: PChar): PChar;
begin
  if AValue then Result := ATrue else Result := AFalse;
end;

function StrRev(const pString: PChar): PChar;
var
  pBackward, pForward: PChar;
  cSwap: Char;
begin
  pForward := pString;
  while (pForward^ <> #0) do Inc(pForward);
  Dec(pForward);

  pBackward := pString;
  while (pBackward < pForward) do
  begin
    cSwap := pBackward^;
    pBackward^ := pForward^;
    pForward^ := cSwap;

    Inc(pBackward);
    Dec(pForward);
  end;

  Result := pString;
end;

function StrChr(const pString: PChar; x: Char): PChar;
begin
  Result := pString;
  while (Result^ <> #0) and (Result^ <> x) do Inc(Result);
  if (Result^ <> x) then Result := nil;
end;

function StrRChr(const pString: PChar; x: Char): PChar;
begin
  Result := pString + StrLen(pString);

  repeat
    if (Result^ = x) then Exit;
    Dec(Result);
  until Result < pString;

  Result := nil;
end;

function StrLen(const pString: PChar): Integer;
var
  pBackward: PChar;
begin
  pBackward := pString;
  while (pBackward^ <> #0) do Inc(pBackward);
  Result := pBackward - pString;
end;

function _wvsprintf(const Output, Format: PChar; const Arg_List: array of DWORD): Integer;
begin
  Result := Windows.wvsprintf(Output, Format, @Arg_List[Low(Arg_List)]);
end;

function CompareSectionName(S1, S2: PByte): BOOL;
begin
  while (S1^ <> 0) and (S2^ <> 0) and (S1^ = S2^) do
  begin
    Inc(S1);
    Inc(S2);
  end;
  Result := (S1^ = S2^); // or (S2^ = 0)
end;

function SectionVirualAddress(hModule: HMODULE; const Name: string; MiniSize, Character: DWORD): Pointer;
var
  TempPt: PByte;
  NumSec: Word;
begin
  Result := nil;

  // 模块映像基地址
  if (hModule = 0) then Exit else TempPt := PByte(hModule);

  // 效验 DOS 文件头
  if (PImageDosHeader(TempPt).e_magic <> IMAGE_DOS_SIGNATURE) then Exit;
  Inc(TempPt, PImageDosHeader(TempPt)._lfanew);

  // 效验 PE 文件头
  if (PImageNtHeaders(TempPt).Signature <> IMAGE_NT_SIGNATURE) then Exit;
  NumSec := PImageNtHeaders(TempPt).FileHeader.NumberOfSections;

  // 定位到节表数组
  Inc(TempPt, SizeOf(DWORD) + SizeOf(TImageFileHeader) + PImageNtHeaders(TempPt).FileHeader.SizeOfOptionalHeader);

  // 遍历数组, 寻找符合条件的节
  while (NumSec <> 0) do
  begin
    if ( CompareSectionName(@PImageSectionHeader(TempPt).Name[0], @Name[1]) ) and    // 名称
       ( PImageSectionHeader(TempPt).Characteristics and Character = Character ) and // 属性
       ( PImageSectionHeader(TempPt).Misc.VirtualSize >= MiniSize ) then             // 大小
    begin
      Result := Pointer(hModule + PImageSectionHeader(TempPt).VirtualAddress);
      Exit;
    end;

    Dec(NumSec);
    Inc(PImageSectionHeader(TempPt), 1);
  end;
end;

function Str2Int(const pString: PChar): Integer;
var
  pBackward: PChar;
begin
  Result := 0;
  if (pString = nil) or (pString^ = #0) then Exit;

  pBackward := pString;
  if (pBackward = '-') then Inc(pBackward);

  while (pBackward^ >= '0') and (pBackward^ <= '9') do
  begin
    Result := Result * 10 + Byte(pBackward^) - $30;
    Inc(pBackward);
  end;

  if (pString^ = '-') then Result := - Result;
end;

  // 摘除调用线程所有SEH节点, 慎用!
procedure RemoveCurrentThreadOtherSEH();
asm
  // p := TEB.ExceptionList;
  MOV EDX, FS:[0]

  // if (p = $FFFFFFFF) then Exit;
  CMP EDX, -1
  JZ  @@QUIT

  // while (p.Prev <> $FFFFFFFF) do p := p.Prev;
@@LOOP:
  MOV EAX, EDX
  MOV EDX, [EAX].TExceptionRegistration.Prev
  CMP EDX, -1
  JNZ @@LOOP

  // TEB.ExceptionList := p;
  MOV FS:[0], EAX

@@QUIT:
end;

  // 在调用线程引发一个软件异常
procedure _leave();
begin                      
  RaiseException(LeaveException, 0, 0, nil)
end;

end.

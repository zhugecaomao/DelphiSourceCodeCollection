unit XEDUSER;

interface
uses
  Windows, WinSpool, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Printers, BDE, ShellAPI, Math, StdCtrls, ExtCtrls, DBTables, DB, DBGrids, Registry;

const
  SysFile = 'D:\PAS\XED.INT';
  MyName = '';
  MyCode = '';
  MyPage = '';
type
  WatchColor = array[1..10] of TColor;
  TCPUID = array[1..4] of Longint;
  TVChar = array[0..11] of char;

const PassKey: string = 'Present';
var
  Systemor: Boolean = false;
  KeyPath: string = 'SoftWare\MicroSoft\Windows\CurrentVersion\';
  MainCap: string = '';
  SellName: string = '';
  SellCode: string = '';
  ClassStr: string = '';
  OldCoder: string = '';
  HardCode: string = '';
  ShowName: string = '';
  Name1: string = '计时表';
  Name2: string = '雄棋娱乐室';

  Registed: Boolean = False;
  CompRate: Byte = 10;
  CompName: string = '';
  ShopExec: string = '';
  CanEdit: Boolean = True;
  FirstUse: Boolean = True;
  OpenFile: Boolean = False;
  MakeNews: Boolean = False;
  BT: TDatetime = 0;
  RegPass, CurPass: string;
  DeskBMP, IniPath: string;
  CoName, CoTele, CoPage: string;
  Truant: Word;
var
  Grade: Integer;
  SX, SY: Word;
  MSt0, MSt: Word;
  GDate1, GDate2: TDate;
  PrHandle: DWord;
  
function FormatCode(S: String): String;
procedure Run(S: string);
function NewCom(var Comb: TComboBox): Boolean;
function CanExit: Boolean;
function HasField(T: TQuery; S: string): Boolean;
procedure SetRatio(X, Y: Word);
function GetDrive: string;
procedure SetAlias(NameStr, Dirstr: string);
procedure PackTable(Name: string);
procedure PickStr(P: TColumn; tb: TTable; S: string);
procedure CloseMDI(H: THandle);
procedure ShowTime(M: TImage);

function PrintName: PChar;
function PrintHandle: Cardinal;
function SetLocPrint(Size, Wide, Leng: Integer; spOrder: Boolean): Boolean;
function AbortPrint: Boolean;
function PrintState: integer;
function ENumPrint(S: TStrings): Boolean;
function CopyFiles(H: integer; F1, F2: string): Boolean;
function GetCPUID: TCPUID;
function GetCPUVendor: TVChar;
function FileVersion(S: string): string;
function DiskID(Drive: PChar): string;
function OutofDate: Boolean;
function EncodeStr(S: string): string;
procedure LoadSite(Hnd: THandle; Key: string);
procedure SaveSite(Hnd: THandle; Key: string);
function GetPYStr(HZStr: WideString): string;
procedure RedrawForm(Sender: TObject);
function Cost(P1, P2, T1, T2: TTime): Real;

implementation

function Cost(P1, P2, T1, T2: TTime): Real;
Begin
//P1, P2: 实际时间; T1, T2: 基准时间

  If P1 < 4/24 then P1 := P1 + 1;
  If P2 < 4/24 then P2 := P2 + 1;
  If P1 > P2 Then Begin
    Showmessage('非法的时间记录,请修改出入时间');
    Result := 0;
    Exit;
  End Else Begin
    If T2 = 0 Then T2 := T1 + 1;
    If (P1 < T1) Then P1 := T1;
    If (P2 > T2) Then P2 := T2;
    If P1 > P2 Then Result := 0
    Else Result := 24 * (P2 - P1);// 小时数
  End;
//  Showmessage(Datetimetostr(P1)+'-'+Datetimetostr(P2)+', on:'+timetostr(T1)+'-'+timetostr(T2)
//  +' is hour: '+ floattostr(result));
End;

function FormatCode(S: String): String;
var
  I: Integer;
Begin
  Result := '';
  For i := 1 To Length(S) Do Begin
    if ((I + 3) mod 4 = 0) and (I > 1) and (S[I] <> '-') then Result := Result + '-' + S[I]
      else Result := Result + S[I];
  End;
End;

function GetDrive: string;
var
  drives: set of 0..25;
  drive: integer;
begin
  Result := '';
  DWORD(drives) := Windows.GetLogicalDrives;
  for drive := 0 to 25 do
    if drive in drives then
      Result := Result + Chr(drive + Ord('A'));
end;

procedure SetRatio(X, Y: Word);
var
  DM: TDeviceMode;
begin
  ENumDisplaySettings(nil, 0, DM);
  DM.dmFields := dm_pelswidth or dm_pelsheight;
  DM.dmPelsWidth := X;
  DM.dmPelsHeight := Y;
  ChangeDisplaySettings(DM, 1);
end;

procedure Run(S: string);
var P: array[0..79] of char;
begin
  StrPCopy(P, S);
  WinExec(P, 1);
end;

function NewCom(var Comb: TComboBox): Boolean;
var I: Integer;
  NewComb: Boolean;
begin
  NewComb := True;
  for i := 0 to Comb.Items.Count - 1 do
    if Comb.Text = Comb.Items[i] then
    begin
      NewComb := False;
      Break;
    end;
  if NewComb then Comb.items.Add(Comb.Text);
  NewCom := NewComb;
end;

function CanExit: Boolean;
begin
  CanExit := True;
end;

function HasField(T: TQuery; S: string): Boolean;
var I: Word;
begin
  T.Open;
  for I := 1 to T.FieldCount - 1 do
    if T.Fields[I].FieldName = S then begin
      Result := True;
      Exit;
    end;
  Result := False;
end;

procedure SetAlias(NameStr, Dirstr: string);
var
  P: string;
begin
  P := Copy(Dirstr, 1, 2);
  with Session do begin
    if IsAlias(NameStr) then
      DeleteAlias(NameStr);
    Close;
    if DRIVE_REMOTE = GetDriveType(PChar(P)) then begin
      NetFileDir := DirStr;
      Showmessage('设置指定的网络驱动器作为系统数据库路径');
    end else NetFileDir := '';
    ConfigMode := cmSession;
    AddStandardAlias(NameStr, Dirstr, 'PARADOX');
    Open;
  end;
end;

procedure PackTable(Name: string);
//DbiPackTable(Table1.DBHandle, Table1.Handle, nil, szdBASE, True);
var
  Props: CURProps;
  hDb: hDBIDb;
  TableDesc: CRTblDesc;
  Table: TTable;
begin
  Table := TTable.Create(nil);
  Table.Exclusive := True;
  Name := ExpandFileName(Name);
  Table.TableName := Name;
  try
    Table.Open;
    HDb := Table.Database.Handle;
    DbiGetCursorProps(Table.Handle, Props);
    Table.Close;
    if (Props.szTableType = szPARADOX) then begin
      FillChar(TableDesc, sizeof(TableDesc), 0);
      StrPCopy(TableDesc.szTblName, Table.TableName);
      StrPCopy(TableDesc.szTblType, Props.szTableType);
      TableDesc.bPack := True;
      DbiDoRestructure(hDb, 1, @TableDesc, nil, nil, nil, False);
    end;
  except
    Showmessage('因故无法整理数据库：' + Name);
  end;
  Table.Free;
end;

procedure PickStr(P: TColumn; tb: TTable; S: string);
var
  Opened: Boolean;
begin
  Opened := tb.Active;
  tb.Open;
  tb.First;
  tb.DisableControls;
  P.PickList.Clear;
  while not tb.eof do begin
    P.PickList.Add(tb[S]);
    tb.Next;
  end;
  tb.Active := Opened;
  tb.enableControls;
end;

function GetPass(S: string): Real;
var
  I: Word;
  T: Real;
begin
  T := 1.2345678;
  for i := 1 to Length(S) do T := T * Byte(S[I]);
  Result := T;
end;


procedure CloseMDI(H: THandle);
begin
  SendMessage(application.mainform.ClientHandle, WM_MDIDESTROY, H, 0);
end;

procedure ShowTime(M: TImage);
const
  PRuler1 = clWhite; //刻度1
  PRuler2 = clBlue; //刻度2

  PHour = clWhite;
  PMin = clWhite;
  PSec = clRed; //秒色
  PDing1 = clYellow; //丁色
  PDing2 = clYellow;

  Word1 = clGreen; //字1
  Word2 = clFuchsia; //字2

var
  a: Word;
  b: Word;
  R0: Word;
  P1, P2, P3, P4: TPoint;
  Angle: Real;
  Hour, Minute, Sec, MSec: Word;
  I: Word;
  X, Y: Word;
  Delt: Word;
  Delt21: Word;
  Delt22: Word;
  TM: TTime;
  C: TCanvas;
  IMG: TImage;
  Lab1: TLabel;
  ss, SinK, CosK: Word;
  K: Real;

  procedure Site(H, W: Word; Angle: Real; var P1, P2: TPoint);
  var
    S1, S2, S3, S4: Real;
  begin
    if not M.Visible then exit;
    Angle := Angle - pi / 2;
    S1 := H * Sin(Angle);
    S2 := H * Cos(Angle);
    S3 := W * Sin(Angle);
    S4 := W * Cos(Angle);

    P1.X := Round(S2 - S3) + a;
    P1.Y := Round(S1 + S4) + b;
    P2.X := Round(S2 + S3) + a;
    P2.Y := Round(S1 - S4) + b;
  end;

begin
  TM := Now;
  DecodeTime(Now, Hour, Minute, Sec, MSec);
  MST := MSec div 500;
  if MST = MST0 then Begin
    MST0 := MST + 1;
    Exit;
  End;
  MST0 := MST;

  a := M.Width div 2;
  b := M.Height div 2;
  if a < b then r0 := a else r0 := b;

  IMG := TImage.Create(nil);

  IMG.Width := M.Width;
  IMG.Height := M.Height;

  C := IMG.Canvas;

  C.Brush.Color := clGreen;
  C.Pen.Color := clRed;

  with IMG.ClientRect do // 画边框
    C.Rectangle(Left, Top, Right, Bottom);

  C.Pen.Width := 5;
  Delt := R0 * 9 div 100;
  C.Pen.Color := $DEDEDE; // 画外圆
  C.Brush.Color := c.pen.Color; // 画指针
  C.Ellipse(Delt, Delt, a * 2 - Delt, b * 2 - Delt);

  C.Brush.Color := clGray; // 画底色
  C.Pen.Color := clGreen;
  Delt := R0 * 10 div 100;
  C.Ellipse(Delt, Delt, a * 2 - Delt, b * 2 - Delt);

  C.Pen.Width := 1;

  Delt21 := R0 * 30 div 1000; // 画刻度
  Delt22 := R0 * 50 div 1000;

  SS := Sec + trunc(msec div 500 / 2); //秒针角度
  for i := 0 to 59 do begin
    if i mod 5 > 0 then Delt := Delt21 else Delt := Delt22;

    Angle := (i / 30 + i div 15 / 2) * pi;

    if (SS = i) then begin
      C.Pen.Color := PRuler1; // 画刻度
      C.Brush.Color := PRuler1;
    end else begin
      C.Pen.Color := PRuler2; // 画刻度
      C.Brush.Color := PRuler2;
    end;

    K := Arctan(tan(Angle) * a / b) + (i + 45) div 15 * pi / 2;
    CosK := Round((a - R0 * 20 div 100) * Cos(k));
    SinK := Round((b - R0 * 20 div 100) * Sin(k));
    X := a + CosK;
    y := b + SinK;
    C.Ellipse(X - Delt, Y - Delt, X + Delt, Y + Delt);
  end;

  C.Brush.Color := clGray; //字底色

  Lab1 := TLabel.Create(nil);
  Lab1.Caption := Name1;
  Lab1.Font.Name := 'MS Sans Serif';
  Lab1.Font.Color := clRed;
  Lab1.Font.Style := [fsBold];
  Lab1.Font.Height := R0 * 12 div 50;

  C.Font := Lab1.Font;
  C.TextOut(a - Lab1.Width div 2, B * 5 div 10, Lab1.Caption);
  Lab1 := TLabel.Create(nil);
  Lab1.Font.Height := R0 * 15 div 50;
  Lab1.Caption := Name2;
  Lab1.Font.Name := 'MS Sans Serif';
  Lab1.Font.Color := clYellow;
  Lab1.Font.Style := [fsBold];
  Lab1.Font.Height := R0 * 18 div 100;

  C.Font := Lab1.Font;
  C.TextOut(a - Lab1.Width div 2, B * 14 div 10, Lab1.Caption);
  Lab1.Free;

  C.Brush.Color := PHour; // 画指针
  C.Pen.Color := C.Brush.Color;
  Angle := TM * 4 * Pi;
  Site(R0 * 45 div 100, R0 * 4 div 100, Angle, P1, P2); // 时针
  Site(R0 * 10 div 100, R0 * 5 div 100, Angle + Pi, P3, P4);
  C.Polygon([P1, P2, P3, P4]);

  C.Brush.Color := PMin;
  C.Pen.Color := C.Brush.Color;
  Angle := (TM - Hour) * 48 * Pi;
  Site(R0 * 60 div 100, R0 * 3 div 100, Angle, P1, P2); // 分针
  Site(R0 * 12 div 100, R0 * 4 div 100, Angle + Pi, P3, P4);
  C.Polygon([P1, P2, P3, P4]);

  C.Brush.Color := PSec;
  C.Pen.Color := C.Brush.Color;
  Angle := (Sec + msec div 500 / 2) * Pi / 30;
  Site(R0 * 75 div 100, R0 * 1 div 100, Angle, P1, P2); // 秒针
  Site(R0 * 15 div 100, R0 * 2 div 100, Angle + Pi, P3, P4);
  C.Polygon([P1, P2, P3, P4]);

  C.Brush.Color := clBlack;
  C.Pen.Color := C.Brush.Color;
  Delt := R0 * 5 div 100;
  C.Ellipse(a - Delt, b - Delt, a + Delt, b + Delt);
  M.Picture := IMG.Picture;
  IMG.Free;
end;

function ENumPrint(S: TStrings): Boolean;
var
  Buffer: array[1..1200] of char;
  Reads, Num: DWord;
  PName: _PRINTER_INFO_1;
  I: Word;
begin
  Result := EnumPrinters(PRINTER_ENUM_LOCAL, nil, 1, @Buffer, 1000, Reads, Num);
  if not Result then exit;
  S.Clear;
  for i := 0 to Num - 1 do begin
    Move(Buffer[i * Sizeof(PName) + 1], PName, Sizeof(PName));
    S.Add(PName.pName);
  end;
end;

function PrintName;
var
  Buffer: array[1..1200] of char;
  Reads, Num: DWord;
  PName: _PRINTER_INFO_1;
begin
  EnumPrinters(PRINTER_ENUM_DEFAULT, nil, 1, @Buffer, 1000, Reads, Num);
  Move(Buffer[1], PName, Sizeof(PName));
  Result := PName.pName;
end;

function PrintHandle: Cardinal;
var
  Hdl: Cardinal;
begin
  if OpenPrinter(PrintName, Hdl, nil) then
    Result := Hdl else Result := 0;
end;

function SetLocPrint(Size, Wide, Leng: Integer; spOrder: Boolean): Boolean;
type
  TPaperName = array[1..64] of Char;
  TPaperNames = array[0..0] of TPaperName;
  PPaperNames = ^TPaperNames;
var
  Dev, Drv, Port: array[1..128] of Char;
  hDMode: THandle;
  pDMode: PDevMode;
begin
  Printer.PrinterIndex := Printer.PrinterIndex;
  Printer.GetPrinter(@Dev, @Drv, @Port, hDMode);
  if hDMode <> 0 then begin
    pDMode := GlobalLock(hDMode);
    if pDMode <> nil then begin
      if spOrder then
        pDMode.dmOrientation := DMORIENT_PORTRAIT
      else
        pDMode.dmOrientation := DMORIENT_LANDSCAPE;
      pDMode.dmPaperSize := Size;
      pDMode.dmPaperLength := Leng;
      pDMode.dmPaperWidth := Wide;
      pDMode.dmMediaType := 1;
      pDMode.dmFields := pDMode.dmFields
        or dm_Orientation
        or dm_PaperSize
        or dm_PaperLength
        or dm_PaperWidth
        or dm_MediaType;
    end;
    GlobalUnlock(hDMode);
  end;
  Printer.PrinterIndex := Printer.PrinterIndex;
  Result := True;
end;

function AbortPrint;
begin
  Result := WinSpool.SetPrinter(PrHandle, 0, nil, PRINTER_CONTROL_PURGE);
end;

function PrintState: Integer;
var
  S3: cardinal;
  P1: _PRINTER_INFO_2;
  DV: Devmode;
  Buffer: array[1..1200] of char;
  ST: Cardinal;
  S: string;
begin
  S3 := 1000;
  if not GetPrinter(PrHandle, 2, @Buffer[1], S3, @S3) then
  begin
    PrintState := 0;
    Exit;
  end;
  Move(Buffer[1], P1, Sizeof(P1));
  DV := P1.pDevMode^;
  if dv.dmSize = 0 then ;
  ST := P1.Status;
  case ST of
    PRINTER_STATUS_BUSY: S := 'AAAAA';
    PRINTER_STATUS_DOOR_OPEN: S := 'AAAAA';
    PRINTER_STATUS_ERROR: S := 'AAAAA';
    PRINTER_STATUS_INITIALIZING: S := 'AAAAA';
    PRINTER_STATUS_IO_ACTIVE: S := 'AAAAA';
    PRINTER_STATUS_MANUAL_FEED: S := 'AAAAA';
    PRINTER_STATUS_NO_TONER: S := 'AAAAA';
    PRINTER_STATUS_NOT_AVAILABLE: S := 'AAAAA';
    PRINTER_STATUS_OFFLINE: S := 'AAAAA';
    PRINTER_STATUS_OUT_OF_MEMORY: S := 'AAAAA';
    PRINTER_STATUS_OUTPUT_BIN_FULL: S := 'AAAAA';
    PRINTER_STATUS_PAGE_PUNT: S := 'AAAAA';
    PRINTER_STATUS_PAPER_JAM: S := 'AAAAA';
    PRINTER_STATUS_PAPER_OUT: S := 'AAAAA';
    PRINTER_STATUS_PAPER_PROBLEM: S := 'AAAAA';
    PRINTER_STATUS_PAUSED: S := 'AAAAA';
    PRINTER_STATUS_PENDING_DELETION: S := 'AAAAA';
    PRINTER_STATUS_PRINTING: S := 'AAAAA';
    PRINTER_STATUS_PROCESSING: S := 'AAAAA';
    PRINTER_STATUS_TONER_LOW: S := 'AAAAA';
//    PRINTER_STATUS_UNAVAILABLE        : S := 'AAAAA';
    PRINTER_STATUS_USER_INTERVENTION: S := 'AAAAA';
    PRINTER_STATUS_WAITING: S := 'AAAAA';
    PRINTER_STATUS_WARMING_UP: S := 'AAAAA';
  end;
  Showmessage(S);
  PrintState := ST;
end;

function CopyFiles(H: integer; F1, F2: string): Boolean;
var
  Path1, Path2: array[0..128] of Char;
  OPStruc: SHFileOpStruct;
begin
  fillchar(Path1, 129, 0);
  fillchar(Path2, 129, 0);
  StrpCopy(Path1, F1);
  StrpCopy(Path2, F2);
  with OpStruc do begin
    Wnd := 0;
    wFunc := FO_COPY;
    OpStruc.pFrom := @Path1;
    pTo := @Path2;
    fFlags := FOF_NOCONFIRMATION + FOF_NOCONFIRMMKDIR;
    fAnyOperationsAborted := False;
    hNameMappings := nil;
    lpszProgressTitle := 'aaa';
  end;

{    FOF_ALLOWUNDO :;
    FOF_CONFIRMMOUSE:;
    FOF_FILESONLY:;
    FOF_MULTIDESTFILES:;
    FOF_NOCONFIRMATION:;
    FOF_NOCONFIRMMKDIR:;
    FOF_RENAMEONCOLLISION:;
    FOF_SILENT:;
    FOF_SIMPLEPROGRESS:;
    FOF_WANTMAPPINGHANDLE:;
}
  Result := ShFileOperation(OpStruc) = 0;
end;

function CPUID_Ready: Boolean;
asm
	PUSHFD			{direct access to flags no possible, only via stack}
	POP	EAX		{flags to EAX}
	MOV	EDX,EAX		{save current flags}
	XOR	EAX,$200000	{not ID bit}
	PUSH	EAX		{onto stack}
	POPFD			{from stack to flags, with not ID bit}
	PUSHFD			{back to stack}
	POP	EAX		{get back to EAX}
	XOR	EAX,EDX		{check if ID bit affected}
	JZ	@1		{no, CPUID not availavle}
	MOV	AL,True		{Result=True}
	@1:
end;

function GetCPUID: TCPUID;
asm
	PUSH	EBX         	{Save affected register}
	PUSH	EDI
	MOV	EDI,EAX     	{@Resukt}
	MOV	EAX,1
	DW	$A20F       	{CPUID Command}
	STOSD			{CPUID[1]}
	MOV	EAX,EBX
	STOSD               	{CPUID[2]}
	MOV	EAX,ECX
	STOSD               	{CPUID[3]}
	MOV	EAX,EDX
	STOSD         	{CPUID[4]}
	POP	EDI		{Restore registers}
	POP	EBX
end;

function GetCPUVendor: TVChar;
asm
	PUSH	EBX		{Save affected register}
	PUSH	EDI
	MOV	EDI,EAX	{@Result (TVChar)}
	MOV	EAX,0
	DW	$A20F		{CPUID Command}
	MOV	EAX,EBX
	XCHG	EBX,ECX 	{save ECX result}
	MOV	ECX,4
@1:	STOSB
	SHR	EAX,8
	LOOP	@1
	MOV	EAX,EDX
	MOV	ECX,4
@2:	STOSB
	SHR	EAX,8
	LOOP	@2
	MOV	EAX,EBX
	MOV	ECX,4
@3:	STOSB
	SHR	EAX,8
	LOOP	@3
	POP	EDI		{Restore registers}
	POP	EBX
end;

function FileVersion(S: string): string;
var
  L, Len: longword;
  Sz: Word;
  Buf: Pointer;
  Ver: ^TVSFixedFileInfo;
begin
  Sz := GetFileVersionInfoSize(PChar(S), L);
  if Sz = 0 then Result := '' else
  begin
    GetMem(Buf, Sz);
    GetFileVersionInfo(PChar(S), 0, Sz, Buf);
    VerQueryValue(Buf, '\', Pointer(Ver), Len);
    Result :=
      IntToStr(HIWORD(Ver.dwFileVersionMS)) + '.' +
      IntToStr(LOWORD(Ver.dwFileVersionMS)) + '.' +
      IntToStr(HIWORD(Ver.dwFileVersionLS)) + ' 编译次数：' +
      IntToStr(LOWORD(Ver.dwFileVersionLS));
    FreeMem(Buf, Sz);
  end;
end;

function DiskID(Drive: PChar): string;
var
  Tmp1, Tmp2: DWord;
  DW: DWord;
begin
  GetVolumeInformation(Drive,
    nil, 0, @DW, Tmp1, Tmp2, nil, 0);
  Result := IntToStr(DW);
end;

function EncodeStr(S: string): string;
var
  I: Integer;
  R: Word;
  P: string;
begin
  S := S + '123456789012345678';
  R := 4444;
  if R = 4444 then ;
  P := '';
  for I := 1 to 16 do begin
    if S[I] = #0 then S[I] := Chr(I + 65);
    R := Trunc(Sqrt((987 * Ord(S[I]) * 9)));
    R := R mod 1000;
    while R < 048 do R := R + 20 + I;
    while R > 090 do R := R - 20 - I;
    while R < 048 do R := R + 20 + I;
    P := P + Chr(R);
  end;
  Result := P;
end;

function OutofDate: Boolean;
const
  KeyName = 'FirstDate';
var
  Reg: TRegistry;
  P: string;
  i: Word;
  Date0: TDate;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKey_Local_Machine;
  Reg.OpenKey(KeyPath + PassKey, True);
  if Reg.ValueExists(KeyName) then begin
    P := Reg.ReadString(KeyName);
    for I := 1 to Length(P) do
      P[i] := Chr((ord(P[i]) - 25 - I) xor I);
    Date0 := StrToDate(P);
    Result := Date - Date0 > 40;
  end else begin
    P := FormatDateTime('yyyy-mm-dd', Date);
    for I := 1 to Length(P) do
      P[i] := Chr(ord(P[i]) xor I + 25 + I);
    Reg.WriteString(KeyName, P);
    Result := False;
  end;
  Reg.CloseKey;
  Reg.Free;
end;

procedure RedrawForm(Sender: TObject);
var
  H: THandle;
  DC: HDC;
begin
  H := FindWindow('Progman', nil);
  DC := GetWindowDC(H);
  Sendmessage(H, wm_EraseBkGnd, DC, 0);
  SendMessage(H, wm_Paint, DC, 0);
  RedrawWindow(H, nil, 0, RDW_ERASE or RDW_INVALIDATE
    or RDW_ALLCHILDREN);
  ReleaseDC(H, DC);
end;

procedure LoadSite(Hnd: THandle; Key: string);
var
  R: TRegistry;
  Place: TWindowPlacement;
begin
  R := TRegistry.Create;
  if R.OpenKey('SoftWare\X-Ware\' + Key, False) then begin
    R.ReadBinaryData('Position', Place, Sizeof(Place));
    SetWindowPlacement(Hnd, @Place);
    R.Free;
  end;
end;

procedure SaveSite(Hnd: THandle; Key: string);
var
  Place: TWindowPlacement;
  R: TRegistry;
begin
  R := TRegistry.Create;
  Place.length := Sizeof(Place);
  if not GetWindowPlacement(Hnd, @Place) then Exit;
  if R.OpenKey('SoftWare\X-Ware\' + Key, True) then begin
    R.WriteBinaryData('Position', Place, Sizeof(Place));
    R.Free;
  end;
end;

function GetPYStr(HZStr: WideString): string;
var
  S: string;
  I: Word;
  C: Char;
begin
  Result := '';
  for I := 1 to Length(HZStr) do begin
    S := HZStr[I];
    if Length(S) = 1 then C := S[1] else
      case WORD(S[1]) * 256 + Byte(S[2]) of
        $B0A1..$B0C4: C := 'A'; $B0C5..$B2C0: C := 'B';
        $B2C1..$B4ED: C := 'C'; $B4EE..$B6E9: C := 'D';
        $B6EA..$B7A1: C := 'E'; $B7A2..$B8C0: C := 'F';
        $B8C1..$B9FD: C := 'G'; $B9FE..$BBF6: C := 'H';
        $BBF7..$BFA5: C := 'J'; $BFA6..$C0AB: C := 'K';
        $C0AC..$C2E7: C := 'L'; $C2E8..$C4C2: C := 'M';
        $C4C3..$C5B5: C := 'N'; $C5B6..$C5BD: C := 'O';
        $C5BE..$C6D9: C := 'P'; $C6DA..$C8BA: C := 'Q';
        $C8BB..$C8F5: C := 'R'; $C8F6..$CBF9: C := 'S';
        $CBFA..$CDD9: C := 'T'; $CDDA..$CEF3: C := 'W';
        $CEF4..$D1B8: C := 'X'; $D1B9..$D4D0: C := 'Y';
        $D4D1..$D7F9: C := 'Z'; else C := '?';
      end;
    Result := Result + C;
  end;
end;

begin
  ShortDateFormat := 'yyyy-mm-dd';
  DateSeparator := '-';
  PrHandle := PrintHandle;
end.

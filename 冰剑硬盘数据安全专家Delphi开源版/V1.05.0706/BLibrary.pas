unit BLibrary;
{
BinJian 程序函数库 v1.0 2007/7/4
BinJian Procedure&Function Library
编译环境 Delphi 7,Vista
部分函数非本人原创，只是做了整理。
(C)2007-2046 Cnare.cn
}
interface
uses
  Windows,SysUtils,Classes,ShellApi,Forms,StringsUnit,Aes,Vclzip,VclUnzip,
  Registry,SHLOBJ,Dialogs;
Function Deltree(ASourceDir: string): Boolean ;  {删除目录及子文件 2007/6/24}
Function GetIdeSerialNumber:pchar;     {返回硬盘物理型号 2007/7/3}
Function GetRandomString:string;    {返回一个随机字符串}
Function GetTempDir: string;        {返回一个随机临时目录}
Function ExecAppWait(AppName, Params: string): Boolean; {运行一个程序，并等待它退出}
Function NewTemp:String;     {创建一个随机临时目录并返回它的路径}
Procedure ShowBox(S1,S2:String);   {简化版的MessageBOX消息框}
{ZIP 压缩引擎接口 v1.0 by binjian 2007.6.24}
Function ZipFile(SrcPathName{欲压缩}, ZipFileName: string; OverWrite: Boolean;
  IsDir: Boolean; sPwd: string): Boolean;
Function UnZipFile(DesPathName,ZipFileName,sPwd:string):Boolean;
{--}
Procedure Rshell(Ext,path:string); {关联扩展名}
Function RunCore(Mode,SourceName,PWS:String):Boolean; {调用Core接口函数}
Function RunCore2(Mode,SourceName,DName,PWS:String):Boolean; {调用Core接口函数2}
implementation
Function Deltree; {删除目录及子文件 2007.6.24}
Var
  FileRec:TSearchrec;
  Sour:String;
begin
  Sour:=ASourceDir;
  if Sour[Length(Sour)]<>'\' then Sour := Sour + '\';
  if not DirectoryExists(ASourceDir) then
    exit;
  if FindFirst(Sour+'*.*',faAnyfile,FileRec) = 0 then
    repeat
      if ((FileRec.Attr and faDirectory) <> 0) then
      begin
        if (FileRec.Name<>'.') and (FileRec.Name<>'..') then
          begin
            DelTree(Sour+FileRec.Name);
            FileSetAttr(Sour+FileRec.Name,faArchive);
            RemoveDir(Sour+FileRec.Name);
          end;
      end
      else
      begin
        FileSetAttr(Sour+FileRec.Name,faArchive);
        deletefile(Sour+FileRec.Name);
      end;
   until FindNext(FileRec)<>0;
   FindClose(FileRec);
   FileSetAttr(Sour,faArchive);
   RemoveDir(Sour);
end;
function GetIdeSerialNumber;
const IDENTIFY_BUFFER_SIZE = 512;
type
  TIDERegs = packed record
    bFeaturesReg: BYTE; // Used for specifying SMART "commands".
    bSectorCountReg: BYTE; // IDE sector count register
    bSectorNumberReg: BYTE; // IDE sector number register
    bCylLowReg: BYTE; // IDE low order cylinder value
    bCylHighReg: BYTE; // IDE high order cylinder value
    bDriveHeadReg: BYTE; // IDE drive/head register
    bCommandReg: BYTE; // Actual IDE command.
    bReserved: BYTE; // reserved for future use.  Must be zero.
  end;
  TSendCmdInParams = packed record
    // Buffer size in bytes
    cBufferSize: DWORD;
    // Structure with drive register values.
    irDriveRegs: TIDERegs;
    // Physical drive number to send command to (0,1,2,3).
    bDriveNumber: BYTE;
    bReserved: array[0..2] of Byte;
    dwReserved: array[0..3] of DWORD;
    bBuffer: array[0..0] of Byte; // Input buffer.
  end;
  TIdSector = packed record
    wGenConfig: Word;
    wNumCyls: Word;
    wReserved: Word;
    wNumHeads: Word;
    wBytesPerTrack: Word;
    wBytesPerSector: Word;
    wSectorsPerTrack: Word;
    wVendorUnique: array[0..2] of Word;
    sSerialNumber: array[0..19] of CHAR;
    wBufferType: Word;
    wBufferSize: Word;
    wECCSize: Word;
    sFirmwareRev: array[0..7] of Char;
    sModelNumber: array[0..39] of Char;
    wMoreVendorUnique: Word;
    wDoubleWordIO: Word;
    wCapabilities: Word;
    wReserved1: Word;
    wPIOTiming: Word;
    wDMATiming: Word;
    wBS: Word;
    wNumCurrentCyls: Word;
    wNumCurrentHeads: Word;
    wNumCurrentSectorsPerTrack: Word;
    ulCurrentSectorCapacity: DWORD;
    wMultSectorStuff: Word;
    ulTotalAddressableSectors: DWORD;
    wSingleWordDMA: Word;
    wMultiWordDMA: Word;
    bReserved: array[0..127] of BYTE;
  end;
  PIdSector = ^TIdSector;
  TDriverStatus = packed record
    // 驱动器返回的错误代码，无错则返回0
    bDriverError: Byte;
    // IDE出错寄存器的内容，只有当bDriverError 为 SMART_IDE_ERROR 时有效
    bIDEStatus: Byte;
    bReserved: array[0..1] of Byte;
    dwReserved: array[0..1] of DWORD;
  end;
  TSendCmdOutParams = packed record
    // bBuffer的大小
    cBufferSize: DWORD;
    // 驱动器状态
    DriverStatus: TDriverStatus;
    // 用于保存从驱动器读出的数据的缓冲区，实际长度由cBufferSize决定
    bBuffer: array[0..0] of BYTE;
  end;
var hDevice: THandle;
  cbBytesReturned: DWORD;
  SCIP: TSendCmdInParams;
  aIdOutCmd: array[0..(SizeOf(TSendCmdOutParams) + IDENTIFY_BUFFER_SIZE - 1) - 1] of Byte;
  IdOutCmd: TSendCmdOutParams absolute aIdOutCmd;
  procedure ChangeByteOrder(var Data; Size: Integer);
  var ptr: PChar;
    i: Integer;
    c: Char;
  begin
    ptr := @Data;
    for i := 0 to (Size shr 1) - 1 do begin
      c := ptr^;
      ptr^ := (ptr + 1)^;
      (ptr + 1)^ := c;
      Inc(ptr, 2);
    end;
  end;
begin
  Result := ''; // 如果出错则返回空串
  if SysUtils.Win32Platform = VER_PLATFORM_WIN32_NT then begin // Windows NT, Windows 2000
        // 提示! 改变名称可适用于其它驱动器，如第二个驱动器： '\\.\PhysicalDrive1\'
    hDevice := CreateFile('\\.\PhysicalDrive0', GENERIC_READ or GENERIC_WRITE,
      FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0);
  end else // Version Windows 95 OSR2, Windows 98
    hDevice := CreateFile('\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0);
  if hDevice = INVALID_HANDLE_VALUE then Exit;
  try
    FillChar(SCIP, SizeOf(TSendCmdInParams) - 1, #0);
    FillChar(aIdOutCmd, SizeOf(aIdOutCmd), #0);
    cbBytesReturned := 0;
      // Set up data structures for IDENTIFY command.
    with SCIP do begin
      cBufferSize := IDENTIFY_BUFFER_SIZE;
  //      bDriveNumber := 0;
      with irDriveRegs do begin
        bSectorCountReg := 1;
        bSectorNumberReg := 1;
  //      if Win32Platform=VER_PLATFORM_WIN32_NT then bDriveHeadReg := $A0
  //      else bDriveHeadReg := $A0 or ((bDriveNum and 1) shl 4);
        bDriveHeadReg := $A0;
        bCommandReg := $EC;
      end;
    end;
    if not DeviceIoControl(hDevice, $0007C088, @SCIP, SizeOf(TSendCmdInParams) - 1,
      @aIdOutCmd, SizeOf(aIdOutCmd), cbBytesReturned, nil) then Exit;
  finally
    CloseHandle(hDevice);
  end;
  with PIdSector(@IdOutCmd.bBuffer)^ do begin
    ChangeByteOrder(sSerialNumber, SizeOf(sSerialNumber));
    (PChar(@sSerialNumber) + SizeOf(sSerialNumber))^ := #0;
    Result := PChar(@sSerialNumber);
  end;
end;
function GetRandomString;        {返回一个随机字符串}
{max length of generated password} 
const
   intMAX_PW_LEN = 10; 
var 
   i: Byte; 
   s: string;
begin
  s:='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Result := '';
  for i := 0 to intMAX_PW_LEN-1 do
    Result := Result + s[Random(Length(s)-1)+1];
end;
function GetTempDir;       {返回一个随机临时目录}
var
  Buffer: array[0..MAX_PATH] of Char;
begin
  GetTempPath(SizeOf(Buffer) - 1, Buffer);
  Result := StrPas(Buffer);
end;
Function ExecAppWait(AppName,Params:string):Boolean;     {运行一个程序，并等待它退出}
var
  // Structure containing and receiving info about application to start
  ShellExInfo: TShellExecuteInfo;
begin
  FillChar(ShellExInfo, SizeOf(ShellExInfo), 0);
  with ShellExInfo do begin
    cbSize := SizeOf(ShellExInfo);
    fMask := see_Mask_NoCloseProcess;
    Wnd := Application.Handle;
    lpFile := PChar(AppName);
    lpParameters := PChar(Params);
    nShow := sw_ShowNormal;
  end;
  Result := ShellExecuteEx(@ShellExInfo);
  if Result then
    while WaitForSingleObject(ShellExInfo.HProcess, 100) = WAIT_TIMEOUT do
    begin
      Application.ProcessMessages;
      if Application.Terminated then Break;
    end;
end;
Function NewTemp;
begin
  result:=GetTempDir+GetRandomString+'\';
  MkDir(result);
end;
Procedure ShowBox;
begin
  Messagebox(0,pchar(s1),pchar(s2),MB_OK+MB_DEFBUTTON1+MB_APPLMODAL+MB_ICONError)
end;
Function UnZipFile;
{解压缩引擎动态调用}
begin
  Result := false;
  if (not DirectoryExists(DesPathName)) then
  MkDir(DesPathName);
  if IOResult <> 0 then Exit;
  if not FileExists(ZipFileName) then Exit;
  with Tvclunzip.Create(nil) do
  try
  try
  Password := sPwd;
  DoProcessMessages := True;
  ZipName := ZipFileName;
  ReadZip;
  if Count = 0 then Abort; // 没有文件的情况退出
    DestDir := DesPathName;
    DoAll := True;
    RecreateDirs := True;
   if UnZip=Count then Result:=true else Result:=false;
  except
   Result := false;
  end;
  finally
    Free;
  end;
end;
Function ZipFile;
{压缩引擎动态调用}
var
  VCLZip: TVCLZip;
  ZFileList: TStringList;
begin
  Result := False;
  ZFileList := TStringList.Create;
  VCLZip := TVCLZip.Create(nil);
  try
    if IsDir and (not DirectoryExists(SrcPathName)) then
      MkDir(SrcPathName);
    ZFileList.Text := SrcPathName;
    with VCLZip do
    try
      Password := sPwd;
      DoProcessMessages := True;
      DoAll := True;
      if OverWrite then
      begin
        OverwriteMode := Always;
        ZipAction := zaReplace;
      end else begin
        OverwriteMode := Never;
        ZipAction := zaUpdate;
      end;
      FlushFilesOnClose := True;
      if IsDir then
        RootDir := SrcPathName
      else
        RootDir := ExtractFilePath(SrcPathName);
      FilesList.Clear;
      if IsDir then
        FilesList.Add('*.*')
      else
        FilesList.Assign(ZFileList);
      RelativePaths := True;
      ZipName := ZipFileName;
      Zip;
      Result := True;
    except
      Result := False;
    end;
  finally
    VCLZip.Free;
    ZFileList.Free;
  end;
end;
procedure Rshell;
const
  Name = 'BinjianSE';
var
  reg: TRegistry;
begin
 reg := TRegistry.Create;
 reg.RootKey:=HKEY_CLASSES_ROOT;
 reg.OpenKey(Ext,true);
 reg.WriteString('',Name);
 reg.CloseKey;
 reg.OpenKey(Name+'\shell\open\command', true);
 //用于打开.zzz文件的可执行程序
 reg.WriteString('', '"' + path + '" "%1"');
 reg.CloseKey;
 reg.OpenKey(Name+'\DefaultIcon',true);
 //取当前可执行程序的图标为.zzz文件的图标
 reg.WriteString('',''+ path +',0');
 reg.Free;
 //立即刷新
 SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
end;
Function RunCore(Mode,SourceName,PWS:String):Boolean;
Var
  CoreFile:String;
begin
  CoreFile:=ExtractFilePath(Application.ExeName)+CoreName;
  {如果是加密模式}

  If (Mode='E')or(Mode='e')
  then If ExecAppWait(CoreFile,' E '+'"'+SourceName+'" "'+SourceName+'.$b" "'+PWS+'"')
  then begin
  ShowMessage(' E '+'"'+SourceName+'" "'+SourceName+'.$b" "'+PWS+'"');
  DeleteFile(SourceName);
  ReNameFile(SourceName+'.$b',SourceName);
  Result:=True;
  end else Result:=False else Result:=false;
  {如果是解密模式}
  IF (Mode='D')or(Mode='d')
  then If ExecAppWait(CoreFile,' D '+'"'+SourceName+'" "'+SourceName+'.$d" "'+PWS+'"')
  then begin
  DeleteFile(SourceName);
  ReNameFile(SourceName+'.$d',SourceName);
  Result:=True;
  end else Result:=False else Result:=false;
end;
Function RunCore2(Mode,SourceName,DName,PWS:String):Boolean;
Var
  CoreFile:String;
begin
  CoreFile:=ExtractFilePath(Application.ExeName)+CoreName;
  {如果是加密模式}
  If (Mode='E')or(Mode='e')
  then {begin
  ShowMessage(' E '+'"'+SourceName+'" "'+DName+'" "'+PWS+'"');  }
  If ExecAppWait(CoreFile,' E '+'"'+SourceName+'" "'+DName+'" "'+PWS+'"')
  then Result:=True else Result:=False; {end else Result:=false;     }
  {如果是解密模式}
  IF (Mode='D')or(Mode='d')
  then If ExecAppWait(CoreFile,' D '+'"'+SourceName+'" "'+DName+'" "'+PWS+'"')
  then Result:=True else Result:=False; {else Result:=false; }
end;
initialization
   Randomize;
end.
 
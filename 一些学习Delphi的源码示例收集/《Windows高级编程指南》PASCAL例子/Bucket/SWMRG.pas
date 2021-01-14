                
// Module name: SWMRG.H & SWMRG.C ->> SWMRG.pas
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

unit SWMRG;

interface

uses Windows;

  // 复合同步对象
type
  SingleWriterMultiReaderGuard = record
    hMutexNoWriter: THandle;  // 是否有线程写, 互斥对象
    hEventNoReaders: THandle; // 是否有线程读, 事件对象(手动重置)
    hSemNumReaders: THandle;  // 读者线程计数, 信号量对象
  end;
  TSWMRG = SingleWriterMultiReaderGuard;
  PSWMRG = ^TSWMRG;

function SWMRGInitialize(var pSWMRG: TSWMRG; const lpszName: PChar): BOOL;
procedure SWMRGDelete(var pSWMRG: TSWMRG);

function SWMRGWaitToWrite(var pSWMRG: TSWMRG; dwTimeout: DWORD): DWORD;
procedure SWMRGDoneWriting(var pSWMRG: TSWMRG);

function SWMRGWaitToRead(var pSWMRG: TSWMRG; dwTimeout: DWORD): DWORD;
procedure SWMRGDoneReading(var pSWMRG: TSWMRG);

implementation

uses CmnHdr;

  // 连接字符串
function ConstructObjName(const lpszPrefix, lpszSuffix, lpszFullName: PChar; cbFullName: Integer; fOk: PBOOL): PChar;
begin
  Result := nil;
  fOk^ := TRUE;
  if (lpszSuffix = nil) then Exit;

  if (lstrlen(lpszPrefix) + lstrlen(lpszSuffix) >= cbFullName) then
  begin
    fOk^ := FALSE;
    Exit;
  end;

  lstrcpy(lpszFullName, lpszPrefix);
  lstrcat(lpszFullName, lpszSuffix);
  Result := lpszFullName;
end;

  // 建立对象
function SWMRGInitialize(var pSWMRG: TSWMRG; const lpszName: PChar): BOOL;
var
  szFullObjName: array[0..100] of Char;
  lpszObjName: PChar;
  fOk: BOOL;
begin
  pSWMRG.hMutexNoWriter := 0;
  pSWMRG.hEventNoReaders := 0;
  pSWMRG.hSemNumReaders := 0;

  lpszObjName := ConstructObjName('SWMRGMutexNoWriter', lpszName, szFullObjName, chDIMOF(szFullObjName), @fOk);
  if (fOk) then  pSWMRG.hMutexNoWriter := CreateMutex(nil, FALSE, lpszObjName);

  lpszObjName := ConstructObjName('SWMRGEventNoReaders', lpszName, szFullObjName, chDIMOF(szFullObjName), @fOk);
  if (fOk) then  pSWMRG.hEventNoReaders := CreateEvent(nil, TRUE, TRUE, lpszObjName);

  lpszObjName := ConstructObjName('SWMRGSemNumReaders', lpszName,  szFullObjName, chDIMOF(szFullObjName), @fOk);
  if (fOk) then pSWMRG.hSemNumReaders := CreateSemaphore(nil, 0, $7FFFFFFF, lpszObjName);

  Result := (pSWMRG.hMutexNoWriter <> 0) and (pSWMRG.hEventNoReaders <> 0) and (pSWMRG.hSemNumReaders <> 0);
  if (not Result) then SWMRGDelete(pSWMRG);
end;

  // 删除对象
procedure SWMRGDelete(var pSWMRG: TSWMRG);
begin
  if (pSWMRG.hMutexNoWriter <> 0) then CloseHandle(pSWMRG.hMutexNoWriter);
  if (pSWMRG.hEventNoReaders <> 0) then CloseHandle(pSWMRG.hEventNoReaders);
  if (pSWMRG.hSemNumReaders <> 0) then  CloseHandle(pSWMRG.hSemNumReaders);
end;

  // 等待写入
function SWMRGWaitToWrite(var pSWMRG: TSWMRG; dwTimeout: DWORD): DWORD;
var
  aHandles: array[0..1] of THandle;
begin
  aHandles[0] := pSWMRG.hMutexNoWriter;  // 是否有线程写
  aHandles[1] := pSWMRG.hEventNoReaders; // 是否有线程读
  Result := WaitForMultipleObjects(2, @aHandles, TRUE, dwTimeout);
end;

  // 写入完毕
procedure SWMRGDoneWriting(var pSWMRG: TSWMRG);
begin
  ReleaseMutex(pSWMRG.hMutexNoWriter); // 没有线程写
end;

  // 等待读取
function SWMRGWaitToRead(var pSWMRG: TSWMRG; dwTimeout: DWORD): DWORD;
var
  lPreviousCount: Longint;
begin
  // 没有线程写
  Result := WaitForSingleObject(pSWMRG.hMutexNoWriter, dwTimeout);

  // 非超时返回
  if (Result <> WAIT_TIMEOUT) then
  begin
    // 读者计数增加
    ReleaseSemaphore(pSWMRG.hSemNumReaders, 1, @lPreviousCount);

    // 开始有线程读
    if (lPreviousCount = 0) then ResetEvent(pSWMRG.hEventNoReaders);

    // 仍没有线程写
    ReleaseMutex(pSWMRG.hMutexNoWriter);
  end;
end;

  // 读取完成
procedure SWMRGDoneReading(var pSWMRG: TSWMRG);
var
  aHandles: array[0..1] of THandle;
  lNumReaders: Longint;
begin
  aHandles[0] := pSWMRG.hMutexNoWriter; // 暂时禁止读写
  aHandles[1] := pSWMRG.hSemNumReaders; // 减少读者计数
  WaitForMultipleObjects(2, @aHandles, TRUE, INFINITE);

  // 取得计数
  ReleaseSemaphore(pSWMRG.hSemNumReaders, 1, @lNumReaders);
  WaitForSingleObject(pSWMRG.hSemNumReaders, INFINITE);

  // 无线程读
  if (lNumReaders = 0) then SetEvent(pSWMRG.hEventNoReaders);

  // 无线程写
  ReleaseMutex(pSWMRG.hMutexNoWriter);
end;

end.

program SWMRGTest;

{$R 'SWMRG.res' 'SWMRG.rc'}

uses Windows, Messages, SWMRG in 'SWMRG.pas';

  // 资源保护对象
var g_swmrg: TSWMRG;

  // 线程回调函数
function Thread(pvParam: Pointer): Integer;
var
  sz: array[0..50] of Char;
  n: Integer;
begin
  // 选择读/写
  wvsprintf(sz, 'SWMRG Test: Thread %d', @pvParam);
  n := MessageBox(0, 'YES: Attempt to read'#13#10'NO: Attempt to write', sz, MB_YESNO);

  // 尝试读/写
  if (n = IDYES) then
  begin
    g_swmrg.WaitToRead();
    MessageBox(0, 'OK stops READING', sz, MB_OK);
  end else
  begin
    g_swmrg.WaitToWrite();
    MessageBox(0, 'OK stops WRITING', sz, MB_OK);
  end;

  // 停止读/写
  g_swmrg.Done();

  Result := 0;
end;

  // 程序入口
var
  hThreads: array[1..MAXIMUM_WAIT_OBJECTS] of THandle;
  nThreads: Integer;
  dwThreadId: DWORD;
begin
  // 建立保护对象
  g_swmrg := TSWMRG.Create();

  // 建立一组线程
  for nThreads := 1 to 8 do
    hThreads[nThreads] := BeginThread(nil, 0, @Thread, Pointer(nThreads), 0, dwThreadId);

  // 等待线程结束
  nThreads := 8;
  WaitForMultipleObjects(nThreads, @hThreads[1], TRUE, INFINITE);

  // 关闭线程句柄
  while (nThreads > 0) do
  begin
    CloseHandle(hThreads[nThreads]);
    Dec(nThreads);
  end;

  // 释放保护对象
  g_swmrg.Free();
end.

program OptexTest;

{$R 'Optex.res' 'Optex.rc'}

uses Windows, Messages, Optex in 'Optex.pas';

function SecondFunc(Optex: TOptex): Integer;
begin
  // 如果可以进去,说明有问题
  if (Optex.TryEnter() <> FALSE) then {DebugBreak()};

  // 等待主线程离开临界区
  Optex.Enter();

  // 拥有计数增加
  Optex.Enter();
  MessageBox(0, 'Secondary: Entered the optex'#13#10'(Dismiss me 2nd)', 'OptexTest', 0);

  // 拥有计数减少, 但是仍然拥有
  Optex.Leave();
  MessageBox(0, 'Secondary: The primary thread should not display a box yet', 'OptexTest', 0);

  // 离开临界区(放行主线程)
  Optex.Leave();

  Result := 0;
end;

procedure FirstFunc(fLocal: BOOL; Optex: TOptex);
var
  hOtherThread: THandle;
  dwThreadId: DWORD;
  si: TStartupInfo;
  pi: TProcessInformation;
  szPath: array[0..MAX_PATH] of Char;
begin
  // 进入临界区
  Optex.Enter();

  // 再次进入
  if (Optex.TryEnter() <> TRUE) then {DebugBreak()};

  // 单进程测试
  if (fLocal) then
  begin
    // 建立新线程(为了测试)
    hOtherThread := BeginThread(nil, 0,  @SecondFunc, Pointer(Optex), 0, dwThreadId);
  end else
  begin
    // 建立新进程(为了测试)
    GetModuleFileName(0, szPath, SizeOf(szPath));
    si.cb := SizeOf(TStartupInfo);
    CreateProcess(nil, szPath, nil, nil, FALSE, 0, nil, nil, si, pi);
    hOtherThread := pi.hProcess;
    CloseHandle(pi.hThread);
  end;

  // 等待第二个线程(可能是新进程中的主线程)挂起
  MessageBox(0, 'Primary: Hit OK to give optex to secondary', 'OptexTest', 0);

  // 离开临界区
  Optex.Leave();
  Optex.Leave();

  // 等待第二个线程拥有对象
  MessageBox(0, 'Primary: Hit OK to wait for the optex'#13#10'(Dismiss me 1st)', 'OptexTest', 0);

  // 等待第二个线程释放对象
  Optex.Enter();

  // 等待第二个线程(或第二个进程)结束
  WaitForSingleObject(hOtherThread, INFINITE);
  CloseHandle(hOtherThread);
  
  Optex.Leave();
end;

  // 程序主线程入口
var
  hevt: THandle;
  OptexSingle, OptexCross: TOptex;
begin
  // 这个对象用来判断是否重复运行
  hevt := CreateEvent(nil, FALSE, FALSE, 'OptexTest');
  if (GetLastError() <> ERROR_ALREADY_EXISTS) then
  begin
    // 第一个实例

    // 测试单进程对象
    OptexSingle := TOptex.Create;
    FirstFunc(TRUE, OptexSingle);
    OptexSingle.Free;

    // 测试多进程对象
    OptexCross := TOptex.Create('CrossOptexTest');
    FirstFunc(FALSE, OptexCross);
    OptexCross.Free;
  end else
  begin
    // 第二个实例

    // 中断连接调试器
    {DebugBreak();}

    // 测试多进程对象
    OptexCross := TOptex.Create('CrossOptexTest');
    SecondFunc(OptexCross);
    OptexCross.Free;
  end;

  CloseHandle(hevt);
end.

unit WaitForMultExp;

interface

uses Windows;

function WaitForMultipleExpressions(nExpObjects: DWORD;
  phExpObjects: PWOHandleArray; dwMilliseconds: DWORD): DWORD; stdcall;

implementation

type
  // 单个表达式结构
  PExpression = ^TExpression;
  TExpression = record
    m_phExpObjects: PWOHandleArray; // 列表位置
    m_nExpObjects: DWORD;           // 列表长度
  end;

  // 单个表达式线程
function WFME_ThreadExpression(var Expression: TExpression): Integer;
begin
  Result := WaitForMultipleObjectsEx(
    Expression.m_nExpObjects, Expression.m_phExpObjects, TRUE, INFINITE, TRUE);
end;

  // 空的APC回调函数
procedure WFME_ExpressionAPC(dwData: DWORD); stdcall;
begin
  // 没有实际动作, 仅用作促使WaitForMultipleObjectsEx()返回
end;

  // 扩展的WaitForXX
function WaitForMultipleExpressions(nExpObjects: DWORD;
  phExpObjects: PWOHandleArray; dwMilliseconds: DWORD): DWORD; stdcall;
var
  phExpObjectsTemp: PWOHandleArray;
  hsemOnlyOne: THandle; // 单计数信号量内核对象
  Expression: array[0..MAXIMUM_WAIT_OBJECTS - 1] of TExpression; // 表达式数组
  ahThreads: array[0..MAXIMUM_WAIT_OBJECTS - 1] of THandle; // 线程句柄数组
  dwExpNum, dwNumExps, dwObjBegin, dwObjCur, dwThreadId: DWORD;
begin
  // 申请内存并拷贝句柄列表
  GetMem(phExpObjectsTemp, SizeOf(THandle) * (nExpObjects + 1));
  CopyMemory(phExpObjectsTemp, phExpObjects, SizeOf(THandle) * nExpObjects);
  phExpObjectsTemp[nExpObjects] := 0;

  // 防止多个线程等待成功, (而造成多次改变对象状态)
  hsemOnlyOne := CreateSemaphore(nil, 1, 1, nil);

  // 分析调用者所给句柄列表
  dwNumExps := 0;
  dwObjBegin := 0;
  dwObjCur := 0;
  Result := 0;
  while (Result <> WAIT_FAILED) and (dwObjCur <= nExpObjects) do
  begin
    // 定位单个表达式尾部
    while (phExpObjectsTemp[dwObjCur] <> 0) do Inc(dwObjCur);

    // 尾部加入信号量句柄
    phExpObjectsTemp[dwObjCur] := hsemOnlyOne;

    // 填写单个表达式结构
    Expression[dwNumExps].m_phExpObjects := @phExpObjectsTemp[dwObjBegin];
    Expression[dwNumExps].m_nExpObjects := dwObjCur - dwObjBegin + 1;

    // 表达式内部句柄过多
    if (Expression[dwNumExps].m_nExpObjects > MAXIMUM_WAIT_OBJECTS) then
    begin
      Result := WAIT_FAILED;
      SetLastError(ERROR_SECRET_TOO_LONG);
    end;

    // 准备处理下个表达式
    Inc(dwObjCur);
    dwObjBegin := dwObjCur;
    Inc(dwNumExps);

    // 原意: 表达式数量过多
    // 疑问: 当处理到第64个表达式, dwNumExps应该就等于64, 但目前表达式个数并未超过64
    if (dwNumExps = MAXIMUM_WAIT_OBJECTS) then
    begin
      Result := WAIT_FAILED;
      SetLastError(ERROR_TOO_MANY_SECRETS);
    end;
  end;

  // 所给句柄列表没有问题
  if (Result <> WAIT_FAILED) then
  begin
    // 为每个表达式建立线程
    for dwExpNum := 0 to dwNumExps - 1 do
    begin
      ahThreads[dwExpNum] :=
        BeginThread(nil, 1, @WFME_ThreadExpression, @Expression[dwExpNum], 0, dwThreadId);
    end;

    // 等待某一个表达式成立
    Result := WaitForMultipleObjects(dwNumExps, @ahThreads[0], FALSE, dwMilliseconds);

    // 超时, 准备按超时处理
    if (Result = WAIT_TIMEOUT) then
    begin
      // 阻止表达式线程等待成功
      Result := WaitForSingleObject(hsemOnlyOne, 0);

      // 如果等待信号量hsemOnlyOne超时,
      // 说明有表达式线程刚好等待成功
      if (WAIT_TIMEOUT = Result) then
      begin
        // 找出等待成功的线程
        Result := WaitForMultipleObjects(dwNumExps, @ahThreads[0], FALSE, INFINITE);
      end else
      begin
        // 否则, 按照超时处理
        Result := WAIT_TIMEOUT;
      end;
    end;

    // 唤醒仍在等待的表达式线程
    for dwExpNum := 0 to dwNumExps - 1 do
    begin
      if (WAIT_TIMEOUT = Result) or (dwExpNum <> (Result - WAIT_OBJECT_0)) then
        QueueUserAPC(@WFME_ExpressionAPC, ahThreads[dwExpNum], 0);
    end;

{$IFDEF DEBUG}
   WaitForMultipleObjects(dwExpNum, @ahThreads[0], TRUE, INFINITE);
{$ENDIF}

    // 关闭线程(内核对象)句柄
    for dwExpNum := 0 to dwNumExps - 1 do CloseHandle(ahThreads[dwExpNum]);
  end;

  // 清除信号量(内核)对象
  CloseHandle(hsemOnlyOne);
end;

end.

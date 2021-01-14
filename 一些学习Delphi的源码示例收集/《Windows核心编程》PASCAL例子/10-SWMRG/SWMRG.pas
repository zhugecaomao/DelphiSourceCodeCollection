unit SWMRG;

interface

uses Windows;

type
  TSWMRG = class(TObject) // 资源(多读/单写)保护类
  public
    constructor Create();
    destructor Destroy(); override;
    procedure WaitToRead();  // 等待(所保护的)资源读权限
    procedure WaitToWrite(); // 等待(所保护的)资源写权限
    procedure Done();        // 结束(所保护的)资源的访问
  private
    m_cs: TRTLCriticalSection; // 用于互斥访问其他类成员
    m_hsemReaders: THandle; // 资源读权限等待信号量
    m_hsemWriters: THandle; // 资源写权限等待信号量
    m_nWaitingReaders: Integer; // 等待读权限线程计数值
    m_nWaitingWriters: Integer; // 等待写权限线程计数值
    m_nActive: Integer; // 状态(0: 空闲; >0: 正在读取的线程数量; -1: 1个线程正在写入)
  end;

implementation

  // 构造函数
constructor TSWMRG.Create();
begin
  m_nWaitingReaders := 0;
  m_nWaitingWriters := 0;
  m_nActive := 0;

  m_hsemReaders := CreateSemaphore(nil, 0, MAXLONG, nil);
  m_hsemWriters := CreateSemaphore(nil, 0, MAXLONG, nil);

  InitializeCriticalSection(m_cs);
end;

  // 析构函数
destructor TSWMRG.Destroy();
begin
{$IFDEF DEBUG}
   if (m_nActive <> 0) then DebugBreak();
{$ENDIF}

  m_nWaitingReaders := 0;
  m_nWaitingWriters := 0;
  m_nActive := 0;

  CloseHandle(m_hsemReaders);
  CloseHandle(m_hsemWriters);

  DeleteCriticalSection(m_cs);
end;

  // 等待(所保护资源)读权限
procedure TSWMRG.WaitToRead();
var
  fResourceWritePending: BOOL;
begin
  // 等待类成员变量访问权
  EnterCriticalSection(m_cs);

  // 有线程(等待写/正在写)
  fResourceWritePending := (m_nWaitingWriters <> 0) or (m_nActive < 0);

  // 增加(等待/正在)读计数
  if (fResourceWritePending) then Inc(m_nWaitingReaders) else Inc(m_nActive);

  // 释放类成员变量访问权
  LeaveCriticalSection(m_cs);

  // 等待(所保护资源)读权限
  if (fResourceWritePending) then WaitForSingleObject(m_hsemReaders, INFINITE);
end;

  // 等待(所保护资源)写权限
procedure TSWMRG.WaitToWrite();
var
  fResourceOwned: BOOL;
begin
  // 等待类成员变量访问权
  EnterCriticalSection(m_cs);

  // 有线程正在访问(资源)
  fResourceOwned := (m_nActive <> 0);

  // 修改(等待/正在)写计数
  if (fResourceOwned) then Inc(m_nWaitingWriters) else m_nActive := -1;

  // 释放类成员变量访问权
  LeaveCriticalSection(m_cs);

  // 等待(所保护资源)写权限
  if (fResourceOwned) then WaitForSingleObject(m_hsemWriters, INFINITE);
end;

  // 结束(所保护资源)的访问
procedure TSWMRG.Done();
var
  hsem: THandle; // 信号量对象句柄
  lCount: LongInt; // 信号量计数值增加量
begin
  hsem := 0; lCount := 1;

  // 等待类成员变量访问权
  EnterCriticalSection(m_cs);

  // 修改(资源)状态计数值
  if (m_nActive > 0) then Dec(m_nActive) else Inc(m_nActive);

  // 已无线程正访问(资源)
  if (m_nActive = 0) then
  begin
    // 优先考虑资源写请求
    if (m_nWaitingWriters > 0) then
    begin
      m_nActive := -1;
      Dec(m_nWaitingWriters);
      hsem := m_hsemWriters;

      // 释放一个等待写的线程
    end else
    begin
      // 然后才考虑资源读请求
      if (m_nWaitingReaders > 0) then
      begin
        m_nActive := m_nWaitingReaders;
        m_nWaitingReaders := 0;
        hsem := m_hsemReaders;
        lCount := m_nActive;

        // 释放所有等待读的线程
      end else
      begin
        // There are no threads waiting at all; no semaphore gets released
      end;
    end;
  end;

  // 释放类成员变量访问权
  LeaveCriticalSection(m_cs);

  // 释放若干等待访问线程
  if (hsem <> 0) then ReleaseSemaphore(hsem, lCount, nil);
end;

end.

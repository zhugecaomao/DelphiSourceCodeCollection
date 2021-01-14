
{*************************************************************************}
{ 单元名称: 线程管理单元                                                  }
{ 版    本: 1.3.4                                                         }
{ 备    注: 此单元提供线程安全退出、线程事件安全回调等功能。              }
{                                                                         }
{ 使用说明:                                                               }
{   1. 所有线程从 TSafeThread 继承，程序在退出前，调用 WaitForAllThread。 }
{   2. 凡是带事件回调的线程操作，一般为窗体或数据模块发起请求，由线程执行 }
{      操作，收到应答后做更新动作。但在收到应答时窗体也许已经被用户关闭或 }
{      取消，故有可能造成流程混乱。所以约定应按下列操作执行：             }
{      a. 从 TThreadOperator 继承出新的操作类，重载 DoSendRequest 和      }
{         DoRecvResponse两个虚函数，两者功能详见函数注释。若需要附加参数，}
{         还需重载 InitParameter 函数。                                   }
{      b. 需执行线程操作时，调用全局函数 ExecuteEventThread，将操作发起者 }
{         的指针、新的操作类和相关参数告知此函数。                        }
{      c. 在操作发起者(窗体，数据模块等) 不再允许接收上次发出的请求的应答 }
{         时，应调用 EventThreadMgr.UnregisterThread，注销线程。          }
{         UnregisterOwner 函数，注销自己。                                }
{      d. 在操作发起者关闭时，应调用 EventThreadMgr.UnregisterOwner 函数，}
{         注销自己。                                                      }
{*************************************************************************}

unit ThreadMgr;

interface

uses
  Windows, SysUtils, Classes, Controls, SyncObjs, Dialogs, Forms;

type

{ Classes }

  TSafeThread = class;
  TEventThread = class;
  TThreadOperator = class;
  TEventThreadMgr = class;

{ TSafeThread - 安全线程基类 }

  TThreadSyncExEvent = procedure(Param: Pointer) of object;

  TSafeThread = class(TThread)
  private
    FSyncMethod: TThreadSyncExEvent;
    FSyncParam: Pointer;

    procedure DoSynchronizeEx;
  protected
    function GetTerminated: Boolean; virtual;
    procedure DoTerminate; override;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;

    //劝告线程退出
    procedure Stop; virtual;
    //强制线程退出
    procedure Kill; virtual;
    
    procedure Synchronize(Method: TThreadMethod); overload;
    procedure SynchronizeEx(Method: TThreadSyncExEvent; Param: Pointer);

    property Terminated read GetTerminated;
  end;

{ TThreadOperator - 线程操作类 }

  TThreadOprClass = class of TThreadOperator;
  TThreadOprOption = (tooChgCursor);
  TThreadOprOptions = set of TThreadOprOption;
  TResponseEvent = procedure(Operator: TThreadOperator) of object;

  TThreadOperator = class(TObject)
  protected
    FOwner: TObject;             //线程操作发起者，由TEventThread传入
    FThread: TEventThread;       //执行操作的线程，由TEventThread传入
    FOptions: TThreadOprOptions; //选项

    procedure DoBegin;
    procedure DoEnd;
  protected
    procedure InitParameter(const Params: array of const); virtual;
    function BeforeExecute: Boolean; virtual;
    procedure DoSendRequest; virtual;
    procedure DoRecvResponse; virtual;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SendRequest;
    procedure RecvResponse;
    property Owner: TObject read FOwner;
  end;

{ TEventThread }

  TEventThread = class(TSafeThread)
  protected
    FOperator: TThreadOperator;
    procedure Execute; override;
  public
    constructor Create(AOwner: TObject; AOprClass: TThreadOprClass;
      const Params: array of const; Options: TThreadOprOptions);
    destructor Destroy; override;
  end;

{ TEventThreadMgr }

  PEventThreadItem = ^TEventThreadItem;
  TEventThreadItem = record
    Owner: TObject;
    Thread: TEventThread;
  end;

  TEventThreadMgr = class(TObject)
  private
    FItems: TList;
    FCSect: TCriticalSection;

    procedure Clear;
    procedure Lock;
    procedure Unlock;
    function FindOwner(AOwner: TObject): Integer;
    function FindThread(AThread: TEventThread): Integer;
    procedure Delete(Index: Integer);
  public
    constructor Create;
    destructor Destroy; override;

    procedure RegisterThread(AOwner: TObject; AThread: TEventThread);
    procedure UnregisterThread(AThread: TEventThread);
    procedure UnregisterOwner(AOwner: TObject);
  end;

var
  ThreadList: TThreadList;
  EventThreadMgr: TEventThreadMgr;

function ExecuteEventThread(AOwner: TObject; AOprClass: TThreadOprClass;
  const Params: array of const; Options: TThreadOprOptions = [tooChgCursor]): TEventThread;
procedure WaitForAllThread;
procedure WaitForThread(Thread: TThread);
procedure SleepThread(Thread: TSafeThread; MSeconds: Integer);

implementation

//-----------------------------------------------------------------------------
// 描述: 执行一个带事件的线程
// 参数:
//   AOwner       - 线程操作发起者 (比如TForm, TDataModule, TObject 等)
//   AOprClass    - 事件线程操作类
//   Params       - 需要传给操作类的参数
//   Options      - 线程操作选项
// 返回:
//   执行此次操作的线程
//-----------------------------------------------------------------------------
function ExecuteEventThread(AOwner: TObject; AOprClass: TThreadOprClass;
  const Params: array of const; Options: TThreadOprOptions): TEventThread;
begin
  Result := TEventThread.Create(AOwner, AOprClass, Params, Options);
  Result.Resume;
end;

//-----------------------------------------------------------------------------
// 描述: 等待所有线程安全退出
// 备注: 在 Application 退出前，应调用此函数。
//-----------------------------------------------------------------------------
procedure WaitForAllThread;
const
  TerminateWaitTime: Integer = 5*1000;   //总共等待多长时间(毫秒)
  SleepTime: Integer = 250;              //检测时间间隔(毫秒)
var
  I, J: Integer;
  List: TList;
begin
  for I := 1 to (TerminateWaitTime div SleepTime) do
  begin
    List := ThreadList.LockList;
    try
      if List.Count = 0 then Break;
      for J := List.Count - 1 downto 0 do
      begin
        if TObject(List[J]) is TSafeThread then
          try
            TSafeThread(List[J]).Stop;
          except
          end
        else
          TThread(List[J]).Terminate;
      end;
      Classes.CheckSynchronize;
    finally
      ThreadList.UnlockList;
    end;
    Sleep(SleepTime);
  end;

  //强行终止线程
  List := ThreadList.LockList;
  try
    for I := 0 to List.Count - 1 do
      TerminateThread(TThread(List[I]).Handle, 0);
  finally
    ThreadList.UnlockList;
  end;
  ThreadList.Clear;
end;

//-----------------------------------------------------------------------------
// 描述: 等待某个线程安全退出
//-----------------------------------------------------------------------------
procedure WaitForThread(Thread: TThread);
const
  SleepTime: Integer = 250;             //检测时间间隔(毫秒)
var
  List: TList;
begin
  if Thread = nil then Exit;
  while True do
  begin
    List := ThreadList.LockList;
    try
      if List.IndexOf(Pointer(Thread)) = -1 then Break;
      if Thread is TSafeThread then
        try
          TSafeThread(Thread).Stop
        except
        end
      else
        Thread.Terminate;
      Classes.CheckSynchronize;
    finally
      ThreadList.UnlockList;
    end;
    Sleep(SleepTime);
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 让线程进入睡眠
// 备注: 1. 此过程必须由线程调用。 2. 睡眠会因Terminated而中断。
//-----------------------------------------------------------------------------
procedure SleepThread(Thread: TSafeThread; MSeconds: Integer);
const
  Interval = 100;
var
  I: Integer;
begin
  for I := 1 to MSeconds div Interval do
  begin
    if Thread.Terminated then Break;
    Sleep(Interval);
  end;
end;

{ TSafeThread }

constructor TSafeThread.Create(CreateSuspended: Boolean);
begin
  inherited;
  FreeOnTerminate := True;
  ThreadList.Add(Self);
end;

destructor TSafeThread.Destroy;
begin
  ThreadList.Remove(Self);
  inherited;
end;

function TSafeThread.GetTerminated: Boolean;
begin
  Result := inherited Terminated or Application.Terminated;
end;

procedure TSafeThread.DoTerminate;
begin
  ThreadList.Remove(Self);
  inherited;
end;

procedure TSafeThread.Stop;
begin
  inherited Terminate;
end;

procedure TSafeThread.Kill;
begin
  ThreadList.Remove(Self);
  TerminateThread(Handle, 0);
end;

procedure TSafeThread.DoSynchronizeEx;
begin
  FSyncMethod(FSyncParam);
end;

procedure TSafeThread.Synchronize(Method: TThreadMethod);
begin
  inherited Synchronize(Method);
end;

procedure TSafeThread.SynchronizeEx(Method: TThreadSyncExEvent; Param: Pointer);
begin
  if Assigned(Method) then
  begin
    FSyncMethod := Method;
    FSyncParam := Param;
    Synchronize(DoSynchronizeEx);
  end;
end;

{ TThreadOperator }

//-----------------------------------------------------------------------------
// 描述: 构造函数
//-----------------------------------------------------------------------------
constructor TThreadOperator.Create;
begin
  inherited;
end;

destructor TThreadOperator.Destroy;
begin
  inherited;
end;

procedure TThreadOperator.DoBegin;
begin
  if tooChgCursor in FOptions then
    Screen.Cursor := crAppStart;
end;

procedure TThreadOperator.DoEnd;
begin
  if tooChgCursor in FOptions then
    Screen.Cursor := crDefault;
end;

//-----------------------------------------------------------------------------
// 描述: 初始化参数
//-----------------------------------------------------------------------------
procedure TThreadOperator.InitParameter(const Params: array of const);
begin
end;

//-----------------------------------------------------------------------------
// 描述: 在 SendRequest 之前被调用
// 返回:
//   True  - 允许往下执行
//   False - 不往下执行，使线程退出
//-----------------------------------------------------------------------------
function TThreadOperator.BeforeExecute: Boolean;
begin
  Result := True;
end;

//-----------------------------------------------------------------------------
// 描述: 发送请求
// 备注: 此函数通常完成向网络提交请求的操作。
//-----------------------------------------------------------------------------
procedure TThreadOperator.DoSendRequest;
begin
end;

//-----------------------------------------------------------------------------
// 描述: 收到应答
// 备注: 此函数通常用于执行在收到应答后的操作，比如更新界面等。
// 注意: 此函数会在线程的Synchronize函数中执行。
//-----------------------------------------------------------------------------
procedure TThreadOperator.DoRecvResponse;
begin
end;

//-----------------------------------------------------------------------------
// 描述: 发送请求 (供线程 TEventThread 调用)
//-----------------------------------------------------------------------------
procedure TThreadOperator.SendRequest;
begin
  FThread.Synchronize(DoBegin);
  //注册线程操作发起者和任务ID
  EventThreadMgr.RegisterThread(FOwner, FThread);
  DoSendRequest;
end;

//-----------------------------------------------------------------------------
// 描述: 收到应答 (供线程 TEventThread 调用)
//-----------------------------------------------------------------------------
procedure TThreadOperator.RecvResponse;
var
  Found: Boolean;
begin
  EventThreadMgr.Lock;
  try
    //检查线程是否已注销
    Found := (EventThreadMgr.FindThread(FThread) <> -1);
  finally
    EventThreadMgr.Unlock;
  end;

  try
    if Found then
      FThread.Synchronize(DoRecvResponse);
  finally
    FThread.Synchronize(DoEnd);
  end;
end;

{ TEventThread }

//-----------------------------------------------------------------------------
// 描述: 构造函数
// 参数:
//   AOwner    - 线程操作发起者 (比如TForm, TDataModule, TObject等)
//   AOprClass - 事件线程操作类
//   Params    - 传给操作类的参数
//   Options   - 线程操作选项
//-----------------------------------------------------------------------------
constructor TEventThread.Create(AOwner: TObject; AOprClass: TThreadOprClass;
  const Params: array of const; Options: TThreadOprOptions);
begin
  inherited Create(True);

  //创建并初始化操作对象
  FOperator := AOprClass.Create;
  FOperator.FOwner := AOwner;
  FOperator.FThread := Self;
  FOperator.FOptions := Options;
  FOperator.InitParameter(Params);

  FreeOnTerminate := True;
end;

destructor TEventThread.Destroy;
begin
  FOperator.Free;
  inherited;
end;

procedure TEventThread.Execute;
begin
  if not Terminated then
  begin
    if FOperator.BeforeExecute then
    begin
      FOperator.SendRequest;
      FOperator.RecvResponse;
    end;
  end;
end;

{ TEventThreadMgr }

constructor TEventThreadMgr.Create;
begin
  inherited;
  FItems := TList.Create;
  FCSect := TCriticalSection.Create;
end;

destructor TEventThreadMgr.Destroy;
begin
  Clear;
  FItems.Free;
  FCSect.Free;
  inherited;
end;

procedure TEventThreadMgr.Lock;
begin
  FCSect.Enter;
end;

procedure TEventThreadMgr.Unlock;
begin
  FCSect.Leave;
end;

procedure TEventThreadMgr.Clear;
var
  I: Integer;
begin
  Lock;
  try
    for I := 0 to FItems.Count - 1 do
      Dispose(PEventThreadItem(FItems[I]));
    FItems.Clear;
  finally
    Unlock;
  end;
end;

function TEventThreadMgr.FindOwner(AOwner: TObject): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to FItems.Count - 1 do
    if PEventThreadItem(FItems[I]).Owner = AOwner then
    begin
      Result := I;
      Exit;
    end;
end;

function TEventThreadMgr.FindThread(AThread: TEventThread): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to FItems.Count - 1 do
    if PEventThreadItem(FItems[I]).Thread = AThread then
    begin
      Result := I;
      Exit;
    end;
end;

procedure TEventThreadMgr.Delete(Index: Integer);
begin
  Dispose(PEventThreadItem(FItems[Index]));
  FItems.Delete(Index);
end;

//-----------------------------------------------------------------------------
// 描述: 注册操作线程
// 参数:
//   AOwner  - 操作发起者
//   AThread - 操作线程
//-----------------------------------------------------------------------------
procedure TEventThreadMgr.RegisterThread(AOwner: TObject; AThread: TEventThread);
var
  ItemPtr: PEventThreadItem;
begin
  New(ItemPtr);
  ItemPtr.Owner := AOwner;
  ItemPtr.Thread := AThread;

  Lock;
  try
    FItems.Add(ItemPtr);
  finally
    Unlock;
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 注销操作线程
// 参数:
//   AThread - 操作线程
//-----------------------------------------------------------------------------
procedure TEventThreadMgr.UnregisterThread(AThread: TEventThread);
var
  I: Integer;
begin
  Lock;
  try
    while True do
    begin
      I := FindThread(AThread);
      if I <> -1 then Delete(I)
      else Break;
    end;
  finally
    Unlock;
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 注销操作发起者
// 参数:
//   AOwner  - 操作发起者
// 备注:
//   和操作发起者相关的操作线程均被注销。
//-----------------------------------------------------------------------------
procedure TEventThreadMgr.UnregisterOwner(AOwner: TObject);
var
  I: Integer;
begin
  Lock;
  try
    while True do
    begin
      I := FindOwner(AOwner);
      if I <> -1 then Delete(I)
      else Break;
    end;
  finally
    Unlock;
  end;
end;

initialization
  ThreadList := TThreadList.Create;
  EventThreadMgr := TEventThreadMgr.Create;

finalization
  EventThreadMgr.Free;
  ThreadList.Free;

end.

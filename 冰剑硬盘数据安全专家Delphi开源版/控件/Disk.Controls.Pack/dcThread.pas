{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcThread.pas - TdcEventThread class used in the dcDiskScanner and
                       dcMultiDiskScanner components.

  Copyright (c) 1999-2002 UtilMind Solutions
  All rights reserved.
  E-Mail: info@appcontrols.com, info@utilmind.com
  WWW: http://www.appcontrols.com, http://www.utilmind.com

  The entire contents of this file is protected by International Copyright
Laws. Unauthorized reproduction, reverse-engineering, and distribution of all
or any portion of the code contained in this file is strictly prohibited and
may result in severe civil and criminal penalties and will be prosecuted to
the maximum extent possible under the law.

*******************************************************************************}
{$I umDefines.inc}

unit dcThread;

interface

uses
  Windows, Classes, dcInternal;

type
  TdcCustomThread = class;
  
  { TdcEventThread }
  TdcEventThread = class
  private
    FHandle: THandle;
    FThreadID: THandle;
    FTerminated: Boolean;
    FSuspended: Boolean;
    FFreeOnTerminate: Boolean;
    FReturnValue: Integer;
    FRunning: Boolean;
    FMethod: TThreadMethod;
    FSynchronizeException: TObject;

    // addons
    FOnExecute,
    FOnException,
    FOnTerminate: TNotifyEvent;

    // for internal use
    Owner: TdcCustomThread;

    function  GetPriority: TThreadPriority;
    procedure SetPriority(Value: TThreadPriority);
    procedure SetSuspended(Value: Boolean);

    // addons
    procedure CallTerminate;    
    procedure CallException;
  protected
    procedure DoTerminate; //virtual;
    procedure Execute; //virtual;
    procedure Synchronize(Method: TThreadMethod);
    property ReturnValue: Integer read FReturnValue write FReturnValue;
    property Terminated: Boolean read FTerminated;

    function CreateThread: TdcEventThread;
    function RecreateThread: TdcEventThread;
  public
    constructor Create(aOwner: TdcCustomThread);
    destructor Destroy; override;
    procedure Resume;
    procedure Suspend;
    procedure Terminate;
    function WaitFor:{$IFDEF D4}LongWord{$ELSE}Integer{$ENDIF};

    property FreeOnTerminate: Boolean read FFreeOnTerminate write FFreeOnTerminate;
    property Handle: THandle read FHandle;
    property Priority: TThreadPriority read GetPriority write SetPriority;
    property Suspended: Boolean read FSuspended write SetSuspended;
    property ThreadID: THandle read FThreadID;

    property OnExecute: TNotifyEvent read FOnExecute write FOnExecute;
    property OnException: TNotifyEvent read FOnException write FOnException;
    property OnTerminate: TNotifyEvent read FOnTerminate write FOnTerminate;    
  end;

  { TdcCustomThread }
  TdcCustomThread = class(TumdcComponent)
  private
    FThread: TdcEventThread;
    FDesignSuspended,
    FHandleExceptions,              // handle all exceptions within thread and do not raise them in the OnExecute event handler
    FFreeOwnerOnTerminate: Boolean; // destroys owner on thread on terminate, if True. AK: July 6, 2002
    FWaitThread: Boolean;
    FWaitTimeout: Cardinal;    

    FOnWaitTimeoutExpired: TNotifyEvent;

    { for internal use }
    FSyncMethod: TNotifyEvent;
    FSyncParams: Pointer;

    procedure InternalSynchronization;

    function  GetPriority: TThreadPriority;
    procedure SetPriority(Value: TThreadPriority);
    function  GetSuspended: Boolean;
    procedure SetSuspended(Value: Boolean);
    function  GetRunning: Boolean;
    function  GetTerminated: Boolean;
    function  GetThreadID: THandle;

    function  GetOnException: TNotifyEvent;
    procedure SetOnException(Value: TNotifyEvent);
    function  GetOnExecute: TNotifyEvent;
    procedure SetOnExecute(Value: TNotifyEvent);
    function  GetOnTerminate: TNotifyEvent;
    procedure SetOnTerminate(Value: TNotifyEvent);

    function  GetHandle: THandle;
    function  GetReturnValue: Integer;
    procedure SetReturnValue(Value: Integer);
  protected
    procedure Loaded; override;
    procedure DoWaitTimeoutExpired; //virtual;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    { public methods and properties }
    function  Execute: Boolean; // virtual;
    procedure Synchronize(Method: TThreadMethod); //virtual;
    procedure SynchronizeEx(Method: TNotifyEvent; Params: Pointer); //virtual;
    procedure Suspend;
    procedure Resume;
    procedure Terminate(Imediately: Boolean); //virtual;
    function  WaitFor:{$IFDEF D4}LongWord{$ELSE}Integer{$ENDIF};

    property Handle: THandle read GetHandle;
    property Running: Boolean read GetRunning;
    property Terminated: Boolean read GetTerminated;
    property ThreadID: THandle read GetThreadID;
    property ReturnValue: Integer read GetReturnValue write SetReturnValue;
    property FreeOwnerOnTerminate: Boolean read FFreeOwnerOnTerminate write FFreeOwnerOnTerminate default False;

    // properties
    property HandleExceptions: Boolean read FHandleExceptions write FHandleExceptions default True;
    property Priority: TThreadPriority read GetPriority write SetPriority default tpNormal;
    property Suspended: Boolean read GetSuspended write SetSuspended default True;
    property WaitThread: Boolean read FWaitThread write FWaitThread default False;
    property WaitTimeout: Cardinal read FWaitTimeout write FWaitTimeout default 0;    

    // events
    property OnException: TNotifyEvent read GetOnException write SetOnException;
    property OnExecute: TNotifyEvent read GetOnExecute write SetOnExecute;
    property OnTerminate: TNotifyEvent read GetOnTerminate write SetOnTerminate;
    property OnWaitTimeoutExpired: TNotifyEvent read FOnWaitTimeoutExpired write FOnWaitTimeoutExpired;
  end;

  { TdcThread }
  TdcThread = class(TdcCustomThread)
  published
    property HandleExceptions;
    property Priority;
    property Suspended;
    property WaitThread;
    property WaitTimeout;

    property OnException;
    property OnExecute;
    property OnTerminate;
    property OnWaitTimeoutExpired;
  end;

implementation

uses Forms;

const
  CM_EXECPROC = $8FFF;
  CM_DESTROYWINDOW = $8FFE;

  Priorities: Array[TThreadPriority] of Integer =
   (THREAD_PRIORITY_IDLE, THREAD_PRIORITY_LOWEST, THREAD_PRIORITY_BELOW_NORMAL,
    THREAD_PRIORITY_NORMAL, THREAD_PRIORITY_ABOVE_NORMAL,
    THREAD_PRIORITY_HIGHEST, THREAD_PRIORITY_TIME_CRITICAL);

type
  PRaiseFrame = ^TRaiseFrame;
  TRaiseFrame = record
    NextRaise: PRaiseFrame;
    ExceptAddr: Pointer;
    ExceptObject: TObject;
    ExceptionRecord: PExceptionRecord;
  end;

var
  ThreadLock: TRTLCriticalSection;
  ThreadWindow: HWND;
  ThreadCount: Integer;

{ Internal thread management routines }
function ThreadWndProc(Window: HWND; Message, wParam, lParam: Longint): Longint; stdcall;
begin
  case Message of
    CM_EXECPROC:
      with TdcEventThread(lParam) do
       begin
        Result := 0;
        if not (csDestroying in Owner.ComponentState) then
         try
           FSynchronizeException := nil;
           FMethod;
         except
{$WARNINGS OFF}
{$IFNDEF VER110}
           if RaiseList <> nil then
            begin
             FSynchronizeException := PRaiseFrame(RaiseList)^.ExceptObject;
             PRaiseFrame(RaiseList)^.ExceptObject := nil;
            end;
{$ENDIF}
{$WARNINGS ON}
         end;
       end;
    CM_DESTROYWINDOW:
      begin
        EnterCriticalSection(ThreadLock);
        try
          if (ThreadCount = 0) and (ThreadWindow <> 0) then
           begin
            DestroyWindow(ThreadWindow);
            ThreadWindow := 0;
           end;
        finally
          LeaveCriticalSection(ThreadLock);
        end;
        Result := 0;
      end;
  else
    Result := DefWindowProc(Window, Message, wParam, lParam);
  end;
end;

var
  ThreadWindowClass: TWndClass = (
    style: 0;
    lpfnWndProc: @ThreadWndProc;
    cbClsExtra: 0;
    cbWndExtra: 0;
    hInstance: 0;
    hIcon: 0;
    hCursor: 0;
    hbrBackground: 0;
    lpszMenuName: nil;
    lpszClassName: 'TdcThreadWindow');

procedure AddThread;

  function AllocateWindow: HWND;
  var
    TempClass: TWndClass;
    ClassRegistered: Boolean;
  begin
    ThreadWindowClass.hInstance := HInstance;
    ClassRegistered := GetClassInfo(HInstance, ThreadWindowClass.lpszClassName, TempClass);
    if not ClassRegistered or (TempClass.lpfnWndProc <> @ThreadWndProc) then
     begin
      if ClassRegistered then
        Windows.UnregisterClass(ThreadWindowClass.lpszClassName, HInstance);
      Windows.RegisterClass(ThreadWindowClass);
     end;
    Result := CreateWindow(ThreadWindowClass.lpszClassName, '', 0,
      0, 0, 0, 0, 0, 0, HInstance, nil);
  end;

begin
  EnterCriticalSection(ThreadLock);
  try
    if ThreadCount = 0 then
      ThreadWindow := AllocateWindow;
    Inc(ThreadCount);
  finally
    LeaveCriticalSection(ThreadLock);
  end;
end;

procedure RemoveThread;
begin
  EnterCriticalSection(ThreadLock);
  try
    Dec(ThreadCount);
    if ThreadCount = 0 then
      PostMessage(ThreadWindow, CM_DESTROYWINDOW, 0, 0);
  finally
    LeaveCriticalSection(ThreadLock);
  end;
end;

function ThreadProc(Thread: TdcEventThread): Integer;
var
  FreeThread: Boolean;
begin
  Thread.FRunning := True;
  try
    Thread.Execute;
  finally
    FreeThread := Thread.FFreeOnTerminate;
    Result := Thread.FReturnValue;
    Thread.FRunning := False;
    Thread.DoTerminate;
    if FreeThread then Thread.Free;
    EndThread(Result);
  end;
end;

{ TdcEventThread }
constructor TdcEventThread.Create(aOwner: TdcCustomThread);
var
  Flags: DWORD;
begin
  inherited Create;
  Owner := aOwner;

  AddThread;
  
  FSuspended := True; // always suspended after creation
  Flags := CREATE_SUSPENDED;

  FHandle := BeginThread(nil, 0, @ThreadProc, Pointer(Self), Flags, FThreadID);
end;

destructor TdcEventThread.Destroy;
begin
  if FRunning and not Suspended then
   begin
    Terminate;
    WaitFor;
   end;
  if FHandle <> 0 then CloseHandle(FHandle);
  inherited;
  RemoveThread;
end;

procedure TdcEventThread.DoTerminate;
begin
  if Assigned(FOnTerminate) then
    Synchronize(CallTerminate);
end;

function TdcEventThread.GetPriority: TThreadPriority;
var
  P: Integer;
  I: TThreadPriority;
begin
  P := GetThreadPriority(FHandle);
  Result := tpNormal;
  for I := Low(TThreadPriority) to High(TThreadPriority) do
    if Priorities[I] = P then Result := I;
end;

procedure TdcEventThread.SetPriority(Value: TThreadPriority);
begin
  SetThreadPriority(FHandle, Priorities[Value]);
end;

procedure TdcEventThread.Synchronize(Method: TThreadMethod);
begin
  FSynchronizeException := nil;
  FMethod := Method;
  SendMessage(ThreadWindow, CM_EXECPROC, 0, Longint(Self));
  if Assigned(FSynchronizeException) and not Owner.FHandleExceptions then
    raise FSynchronizeException;
end;

procedure TdcEventThread.SetSuspended(Value: Boolean);
begin
  if Value <> FSuspended then
   if Value then
     Suspend
   else
     Resume;
end;

procedure TdcEventThread.Suspend;
begin
  FSuspended := True;
  SuspendThread(FHandle);
end;

procedure TdcEventThread.Resume;
begin
  if ResumeThread(FHandle) = 1 then
    FSuspended := False;
end;

procedure TdcEventThread.Terminate;
begin
  FTerminated := True;
end;

function TdcEventThread.WaitFor:{$IFDEF D4}LongWord{$ELSE}Integer{$ENDIF};
var
  Msg: TMsg;
  H: THandle;
begin
  H := FHandle;
  if GetCurrentThreadID = MainThreadID then
    while MsgWaitForMultipleObjects(1, H, False, INFINITE, QS_SENDMESSAGE) = WAIT_OBJECT_0 + 1 do
      PeekMessage(Msg, 0, 0, 0, PM_NOREMOVE)
  else
    WaitForSingleObject(H, INFINITE);
  GetExitCodeThread(H, Result);
end;


function TdcEventThread.CreateThread: TdcEventThread;
begin
  Result := TdcEventThread.Create(Owner);
  try
    Result.Priority := Priority;
    Result.FOnTerminate := FOnTerminate;
    Result.FOnExecute := FOnExecute;
    Result.FOnException := FOnException;
  except
    Result.Free;
    raise;
  end;
end;

function TdcEventThread.RecreateThread: TdcEventThread;
begin
  TerminateThread(Handle, 0);
  Result := CreateThread;
  Free;
end;

procedure TdcEventThread.CallTerminate;
var
  FreeOwnerOnTerminate: Boolean;
begin
  FreeOwnerOnTerminate := Owner.FFreeOwnerOnTerminate;

  if Assigned(FOnTerminate) and not (csDestroying in Owner.ComponentState) then
   if Owner.FHandleExceptions then
    try
      FOnTerminate(Owner);
    except
      if Assigned(FOnException) and not (csDestroying in Owner.ComponentState) then
        CallException;
    end
   else
     FOnTerminate(Owner);

  // next lines should be proceed ONLY if FreeOwnerOnTerminate is True  
  if FreeOwnerOnTerminate then
   with Owner do
    if Owner <> nil then
     begin
      FThread := CreateThread; // create new thread instead this, which will be automatically destroyed
      Owner.Free;              // destroy owner (which will destroy the thread)
     end;
end;

procedure TdcEventThread.CallException;
begin
  if not (csDestroying in Owner.ComponentState) and Assigned(FOnException) then
    FOnException(Owner);
end;

procedure TdcEventThread.Execute;
begin
  if Assigned(FOnExecute) and not (csDestroying in Owner.ComponentState) then
   if Owner.FHandleExceptions then
    try
      FOnExecute(Owner);
    except
      if Assigned(FOnException) and not (csDestroying in Owner.ComponentState) then
        Synchronize(CallException);
    end
   else
     FOnExecute(Owner);
end;


{ TdcThread }
constructor TdcCustomThread.Create(aOwner: TComponent);
begin
  inherited;
  FDesignSuspended := True;  
  FHandleExceptions := True;
  FThread := TdcEventThread.Create(Self);
end;

destructor TdcCustomThread.Destroy;
begin
  if FThread.FRunning then Terminate(True);
  FThread.Free;
  inherited;
end;

procedure TdcCustomThread.Loaded;
begin
  inherited;
  SetSuspended(FDesignSuspended);
end;

procedure TdcCustomThread.DoWaitTimeoutExpired;
begin
  Terminate(True);
  if Assigned(FOnWaitTimeoutExpired) then
    FOnWaitTimeoutExpired(Self);
end;


{ methods }
function TdcCustomThread.Execute: Boolean;
var
  CurrentThreadHandle: THandle;
  TempWaitTimeout, WaitResult: DWord;
begin
  Terminate(True);
  if FFreeOwnerOnTerminate then
    FThread.FreeOnTerminate := True;
  FThread.Resume;
  
  Result := True;
  if FWaitThread then
   begin
    CurrentThreadHandle := FThread.FHandle;
    if FWaitTimeout = 0 then
      TempWaitTimeout := INFINITE
    else
      TempWaitTimeout := FWaitTimeout;
    repeat
      WaitResult := MsgWaitForMultipleObjects(1, CurrentThreadHandle, False, TempWaitTimeout, QS_ALLINPUT);
      if WaitResult = WAIT_TIMEOUT then
       begin
        Terminate(True);
        if Assigned(FOnWaitTimeoutExpired) then
          FOnWaitTimeoutExpired(Self);
        Result := False;
        Exit;
       end;
      Application.ProcessMessages;
    until (WaitResult <> WAIT_OBJECT_0 + 1) or (csDestroying in ComponentState) or Application.Terminated;
   end;
end;

procedure TdcCustomThread.Suspend;
begin
  FThread.Suspend;
end;

procedure TdcCustomThread.Resume;
begin
  FThread.Resume;
end;

procedure TdcCustomThread.Synchronize(Method: TThreadMethod);
begin
  if not (csDestroying in Owner.ComponentState) then
    FThread.Synchronize(Method);
end;

procedure TdcCustomThread.InternalSynchronization;
begin
  if not (csDestroying in Owner.ComponentState) then
    FSyncMethod(FSyncParams);
end;

procedure TdcCustomThread.SynchronizeEx(Method: TNotifyEvent; Params: Pointer);
begin
  if not (csDestroying in Owner.ComponentState) and
     Assigned(Method) then
   begin
    FSyncMethod := Method;
    FSyncParams := Params;
    FThread.Synchronize(InternalSynchronization);
   end;
end;

procedure TdcCustomThread.Terminate(Imediately: Boolean);
begin
  if not Assigned(FThread) then Exit;

  if Imediately then
    FThread := FThread.RecreateThread
  else
    FThread.Terminate;
end;

function TdcCustomThread.WaitFor:{$IFDEF D4}LongWord{$ELSE}Integer{$ENDIF};
begin
  Terminate(True);
  Result := FThread.WaitFor;
end;


function  TdcCustomThread.GetHandle: THandle;
begin
  Result := FThread.FHandle;
end;

function  TdcCustomThread.GetReturnValue: Integer;
begin
  Result := FThread.ReturnValue;
end;

procedure TdcCustomThread.SetReturnValue(Value: Integer);
begin
  FThread.ReturnValue := Value;
end;


{ properties }
function TdcCustomThread.GetPriority: TThreadPriority;
begin
  Result := FThread.Priority;
end;

procedure TdcCustomThread.SetPriority(Value: TThreadPriority);
begin
  FThread.Priority := Value;
end;

function TdcCustomThread.GetSuspended: Boolean;
begin
  if csDesigning in ComponentState then
    Result := FDesignSuspended
  else
    Result := FThread.Suspended;
end;

procedure TdcCustomThread.SetSuspended(Value: Boolean);
begin
  if csDesigning in ComponentState then
    FDesignSuspended := Value
  else
   begin
    FDesignSuspended := Value;
    FThread.Suspended := Value;
   end; 
end;

function TdcCustomThread.GetRunning: Boolean;
begin
  Result := FThread.FRunning;
end;

function TdcCustomThread.GetTerminated: Boolean;
begin
  Result := FThread.FTerminated;
end;

function  TdcCustomThread.GetThreadID: THandle;
begin
  Result := FThread.ThreadID;
end;


// events
function  TdcCustomThread.GetOnException: TNotifyEvent;
begin
  Result := FThread.FOnException;
end;

procedure TdcCustomThread.SetOnException(Value: TNotifyEvent);
begin
  FThread.FOnException := Value;
end;

function  TdcCustomThread.GetOnExecute: TNotifyEvent;
begin
  Result := FThread.FOnExecute;
end;

procedure TdcCustomThread.SetOnExecute(Value: TNotifyEvent);
begin
  FThread.FOnExecute := Value;
end;

function  TdcCustomThread.GetOnTerminate: TNotifyEvent;
begin
  Result := FThread.FOnTerminate;
end;

procedure TdcCustomThread.SetOnTerminate(Value: TNotifyEvent);
begin
  FThread.FOnTerminate := Value;
end;

initialization
  InitializeCriticalSection(ThreadLock);

finalization
  DeleteCriticalSection(ThreadLock);

end.
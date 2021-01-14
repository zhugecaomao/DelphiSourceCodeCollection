unit URunDosThrd;

interface

uses
  Messages, Windows, SysUtils, Classes;

const
  READCOUNT = 1;
  //自定义消息码
  WM_CREATEPIPE_ERROR    = WM_USER + 1;
  WM_CREATEPROCESS_ERROR = WM_USER + 2;
  WM_READPIPE_ERROR      = WM_USER + 3;
  WM_FINISHED_COMMAND    = WM_USER + 4;

type
  TRunDosThread = class(TThread)
  private
    { Private declarations }
    Security : TSecurityAttributes;
    ReadPipe,WritePipe : Thandle;
    StartInfo : TStartUpInfo;
    ProcessInfo : TProcessInformation;
    //ProcessInformation: TProcessInformation;
    Buf: PChar;
    Command_line: string;
    DosApp: string;   
    procedure UpdateShow;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended:boolean; AppName: string);
  end;

var
  aRunDosThread: TRunDosThread;

implementation

uses UMain;

constructor TRunDosThread.Create(CreateSuspended:boolean; AppName: string);
begin
  DosApp := AppName;
  FreeOnTerminate := True;
  inherited Create(CreateSuspended);
end;

procedure TRunDosThread.UpdateShow;
var
  s: string;
  i: integer;
begin
  s := string(Buf);
  i:=0;
  if Length(s)=0 then Exit;
  while True do begin
    i:=i+1;
    if s[i] = #10 then begin
       Insert(#13,s,i);
       i:=i+1;
    end;
    if i>=Length(s) then Break;
  end;
  
  FrmMain.MemoDOS.Text := FrmMain.MemoDOS.Text + s;
  FrmMain.MemoDOS.Refresh;
  
end;

procedure TRunDosThread.Execute;
var
  dwRead: DWORD;
  len: integer;
begin
  { Place thread code here }

  // 创建与Spawn.exe通讯的可继承的匿名管道
  with Security do begin
    nlength := SizeOf(TSecurityAttributes);
    binherithandle := True;
    lpsecuritydescriptor := nil;
  end;
  if not Createpipe (ReadPipe, WritePipe, @Security, 0) then begin
     PostMessage(FrmMain.Handle,WM_CREATEPIPE_ERROR,0,0);
     Exit;
  end;

  // 准备Spawn的命令行，在命令行给出写管道句柄和要Spawn执行的命令
  FmtStr(command_line, 'spawn -h %d %s',[WritePipe, DosApp]);
  // 子进程以隐藏方式运行
  with StartInfo do begin
    cb := SizeOf(TStartUpInfo);
    dwFlags :=STARTF_USESHOWWINDOW;
    wShowWindow := SW_HIDE;
  end;

  // 创建Spawn子进程
  if not CreateProcess( nil, PChar(Command_line), nil, nil, TRUE,
                    0, nil, nil, StartInfo, ProcessInfo) then begin
     PostMessage(FrmMain.Handle,WM_CREATEPROCESS_ERROR,0,0);
     Exit;
  end;

  // 读管道，并显示Spawn从管道中返回的输出信息
  if (not ReadFile(ReadPipe, len, Sizeof(integer), dwRead, nil)) or (dwRead = 0) then Exit;

  while (len<>0) do begin
     Buf := AllocMem(len + 1);
     try
       ZeroMemory(buf,len+1);
       if (not ReadFile(ReadPipe, buf[0], len, dwRead, nil)) or (dwRead = 0) then Exit;
       buf[dwRead]:= #0;
       // 将结果显示在Memo中，并刷新对话框
       Synchronize(UpdateShow);

       if (not ReadFile(ReadPipe, len, Sizeof(integer), dwRead, nil)) or (dwRead = 0) then Exit;

     finally
       FreeMem(Buf);
     end;
  end;

  // 等待Spawn结束
  WaitForSingleObject(ProcessInfo.hProcess, 30000);

  // 关闭管道句柄
  CloseHandle(ProcessInfo.hProcess);
  CloseHandle(ProcessInfo.hThread);
  CloseHandle(ReadPipe);
  CloseHandle(WritePipe);
  PostMessage(FrmMain.Handle,WM_FINISHED_COMMAND,0,0);  
end;

end.

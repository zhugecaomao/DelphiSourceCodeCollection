unit ScriptExecutor;

interface

{$WARN SYMBOL_PLATFORM OFF}
  
uses
  Windows, Messages, Classes, SysUtils, Forms, Dialogs, ScriptParser,
  NetworkLayer, Global;

type

{ TScriptExecutor }

  TDnStateChangedEvent = procedure(Sender: TObject; FileIndex: Integer) of object;

  TScriptExecutor = class(TObject)
  private
    FHttpClient: THttpClient;
    FScriptResult: TScriptResult;
    FCheckedUpgrade: Boolean;
    FBeforeDownload: TDnStateChangedEvent;
    FAfterDownload: TDnStateChangedEvent;

    procedure DownloadFiles;
    procedure TerminateOwner;
    procedure PerformActions;
    procedure RunExeFile;
    function CheckSelfUpgrade(const SrcFileName, DestFileName: string): Boolean;
  public
    constructor Create(HttpClient: THttpClient; ScriptResult: TScriptResult);
    destructor Destroy; override;

    procedure CheckUpgrade;
    procedure Execute;

    property BeforeDownload: TDnStateChangedEvent read FBeforeDownload write FBeforeDownload;
    property AfterDownload: TDnStateChangedEvent read FAfterDownload write FAfterDownload;
  end;

implementation

uses PubUtils;

function MyMoveFile(const SrcFileName, DestFileName: string): Boolean;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    Result := MoveFileEx(PChar(SrcFileName), PChar(DestFileName),
      MOVEFILE_COPY_ALLOWED or MOVEFILE_REPLACE_EXISTING or MOVEFILE_WRITE_THROUGH);
  end else
  begin
    Result := MoveFile(PChar(SrcFileName), PChar(DestFileName));
    if not Result then
    begin
      Result := CopyFile(PChar(SrcFileName), PChar(DestFileName), False);
      if Result then DeleteFile(SrcFileName);
    end;
  end;
end;

{ TScriptExecutor }

constructor TScriptExecutor.Create(HttpClient: THttpClient;
  ScriptResult: TScriptResult);
begin
  inherited Create;
  FHttpClient := HttpClient; 
  FScriptResult := ScriptResult;
end;

destructor TScriptExecutor.Destroy;
begin
  inherited;
end;

//-----------------------------------------------------------------------------
// 描述: 下载新版程序文件
//-----------------------------------------------------------------------------
procedure TScriptExecutor.DownloadFiles;
var
  I: Integer;
  FileStream: TFileStream;
begin
  with FScriptResult do
  begin
    try
      for I := 0 to Length(DownloadItems) - 1 do
      begin
        ForceDirectories(ExtractFilePath(DownloadItems[I].DestFile));
        FileStream := TFileStream.Create(DownloadItems[I].DestFile, fmCreate or fmShareDenyWrite);
        try
          if Assigned(FBeforeDownload) then FBeforeDownload(Self, I);
          FHttpClient.Get(DownloadItems[I].SourceURL, FileStream);
          if Assigned(FAfterDownload) then FAfterDownload(Self, I);
        finally
          FileStream.Free;
        end;
      end;
    except
      on E: Exception do
      begin
        for I := 0 to Length(DownloadItems) - 1 do
          DeleteFile(DownloadItems[I].DestFile);
        raise Exception.CreateFmt('下载文件失败。'#13#13'错误信息: '#13'%s', [E.Message]);
      end;
    end;
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 终止宿主程序
//-----------------------------------------------------------------------------
procedure TScriptExecutor.TerminateOwner;

  function WindowExists(WinHandle: THandle): Boolean;
  var
    Handle: THandle;
  begin
    Result := False;
    Handle := GetDesktopWindow;
    Handle := GetWindow(Handle, GW_CHILD);
    while IsWindow(Handle) do
    begin
      if Handle = WinHandle then
      begin
        Result := True;
        Break;
      end;
      Handle := GetWindow(Handle, GW_HWNDNEXT);
    end;
  end;

  // 等待宿主程序退出，若已退出则返回 True
  function WaitProgramExit(WinHandle: THandle): Boolean;
  const
    MaxWaitMSecs = 3000;   // 最长等待时间(毫秒)
    MSecsPerLoop = 200;    // 每次循环等待时间(毫秒)
  var
    I: Integer;
  begin
    Result := False;
    // 等待宿主程序退出
    for I := 1 to (MaxWaitMSecs div MSecsPerLoop) do
      if WindowExists(WinHandle) then
        Sleep(MSecsPerLoop)
      else begin
        Result := True;
        Break;
      end;
  end;

  // 强行退出宿主程序
  procedure ForceProgramExit(ProcessID: Cardinal);
  var
    Handle: THandle;
    ExitCode: Cardinal;
  begin
    Handle := OpenProcess(PROCESS_ALL_ACCESS, True, ProcessID);
    GetExitCodeProcess(Handle, ExitCode);
    TerminateProcess(Handle, ExitCode);
  end;

var
  Exited: Boolean;
begin
  // 通知宿主程序退出
  SendMessage(CmdParams.WinHandle, CmdParams.ExitMsgID, 0, 0);
  // 等待宿主程序退出
  Exited := WaitProgramExit(CmdParams.WinHandle);
  // 强行退出宿主程序
  if not Exited then ForceProgramExit(CmdParams.ProcessID);
end;

//-----------------------------------------------------------------------------
// 描述: 执行升级动作
//-----------------------------------------------------------------------------
procedure TScriptExecutor.PerformActions;
var
  I, FileAttr: Integer;
begin
  with FScriptResult do
  begin
    for I := 0 to Length(ActionItems) - 1 do
    begin
      case ActionItems[I].ActionType of
        satExecute:
          begin
            ExecuteFile(ActionItems[I].FileName1, '', '', SW_SHOW);
          end;
        satReplace:
          begin
            ForceDirectories(ExtractFilePath(ActionItems[I].FileName2));
            if not CheckSelfUpgrade(ActionItems[I].FileName1, ActionItems[I].FileName2) then
            begin
              if not MyMoveFile(ActionItems[I].FileName1, ActionItems[I].FileName2) then
                raise Exception.Create('无法覆盖文件，请退出旧版程序。');
            end;
          end;
        satAdd:
          begin
            if not FileExists(ActionItems[I].FileName2) then
            begin
              ForceDirectories(ExtractFilePath(ActionItems[I].FileName2));
              if not MyMoveFile(ActionItems[I].FileName1, ActionItems[I].FileName2) then
                raise Exception.Create('复制文件失败。');
            end;
          end;
        satDelete:
          begin
            // 去掉目的文件的只读等属性
            FileAttr := FileGetAttr(ActionItems[I].FileName1);
            FileSetAttr(ActionItems[I].FileName1, FileAttr and not faReadOnly and not faHidden and not faSysFile);
            // 尝试删除文件
            if not DeleteFile(ActionItems[I].FileName1) then
              raise Exception.Create('删除文件失败，请退出旧版程序。');
          end;
      end;
    end;
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 升级完毕后执行指定 exe 文件
//-----------------------------------------------------------------------------
procedure TScriptExecutor.RunExeFile;
begin
  with FScriptResult do
  begin
    if Length(RunFileName) > 0 then
      ExecuteFile(RunFileName, '', '', SW_SHOW);
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 检查是否需要自升级 (即升级程序自身也需要升级)
// 返回: 若需要自升级则返回True
//-----------------------------------------------------------------------------
function TScriptExecutor.CheckSelfUpgrade(const SrcFileName, DestFileName: string): Boolean;
begin
  Result := SameText(GetFullFileName(Application.ExeName), GetFullFileName(DestFileName));
  if Result then
  begin
    SelfUpgFiles.SrcFileName := GetFullFileName(SrcFileName);
    SelfUpgFiles.DestFileName := GetFullFileName(DestFileName);
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 检查是否需要升级 或 是否能升级
// 备注: 若无需或不能升级，则抛出异常。
//-----------------------------------------------------------------------------
procedure TScriptExecutor.CheckUpgrade;
begin
  FCheckedUpgrade := True;
  if CmdParams.CurVersion >= FScriptResult.NewVersion then
    raise Exception.Create('当前版本已是最高版本，无需升级。');

  if FScriptResult.SupportVer.IndexOf(CmdParams.CurVersion) = -1 then
    raise Exception.Create('对不起，当前版本太旧，已无法在线升级。请登录官方网站下载最新版本。');
end;

procedure TScriptExecutor.Execute;
begin
  if not FCheckedUpgrade then
    CheckUpgrade;
  DownloadFiles;
  TerminateOwner;
  PerformActions;
  RunExeFile;
end;

end.

unit UpgradeThread;

interface

uses
  Windows, Classes, SysUtils, Forms, ThreadMgr, NetworkLayer, Global;

type

  TUpgradeThread = class(TSafeThread)
  private
    FHttpClient: THttpClient;
    FUserAccepted: Boolean;
    FProgressMax: Integer;
    FProgressPos: Integer;
    FResultMsg: string;

    procedure DownloadScript;
    procedure ProcessScript;
    procedure InitBeforeExecute(Param: Pointer);
    procedure ShowStepPage(Param: Pointer);
    procedure ShowResultMsg;
    function WaitForUserAccept: Boolean;

    procedure DoProgress;
    procedure DoBeforeDownloadFile(Param: Pointer);
    procedure DoAfterDownloadFile(Param: Pointer);

    procedure HttpClientProgressEvent(Sender: TObject; Max, Pos: Int64);
    procedure BeforeDownloadFileEvent(Sender: TObject; FileIndex: Integer);
    procedure AfterDownloadFileEvent(Sender: TObject; FileIndex: Integer);
  protected
    procedure Execute; override;
  public
    constructor Create;
    destructor Destroy; override;

    property UserAccepted: Boolean read FUserAccepted write FUserAccepted;
  end;

implementation

uses
  PubUtils, SysDM, MainFrm, ScriptParser, ScriptExecutor;

{ TUpgradeThread }

constructor TUpgradeThread.Create;
begin
  inherited Create(True);
  FHttpClient := NetworkFactory.CreateHttpClient;
  FHttpClient.OnProgress := HttpClientProgressEvent;
end;

destructor TUpgradeThread.Destroy;
begin
  FHttpClient.Free;
  inherited;
end;

procedure TUpgradeThread.DownloadScript;
var
  HttpClient: THttpClient;
  ScriptStream: TMemoryStream;
begin
  try
    HttpClient := NetworkFactory.CreateHttpClient;
    ScriptStream := TMemoryStream.Create;
    try
      HttpClient.Get(CmdParams.ScriptURL, ScriptStream);
      ForceDirectories(ExtractFilePath(GetLocalScriptFileName));
      ScriptStream.SaveToFile(GetLocalScriptFileName);
    finally
      ScriptStream.Free;
      HttpClient.Free;
    end;
  except
    raise Exception.Create('下载升级脚本文件失败。网络未连通，或升级文件未准备就绪。');
  end;
end;

procedure TUpgradeThread.ProcessScript;
var
  SptParser: TScriptParser;
  SptExecutor: TScriptExecutor;
begin
  SptParser := TScriptParser.Create(GetLocalScriptFileName);
  try
    if SptParser.Parse then
    begin
      // 执行前的准备
      SynchronizeEx(InitBeforeExecute, Pointer(SptParser));

      // 执行升级脚本
      SptExecutor := TScriptExecutor.Create(FHttpClient, SptParser.Result);
      SptExecutor.BeforeDownload := BeforeDownloadFileEvent;
      SptExecutor.AfterDownload := AfterDownloadFileEvent;
      try
        // 检查是否需要升级
        SptExecutor.CheckUpgrade;
        // 若需要升级，则等待用户选择是否继续
        SynchronizeEx(ShowStepPage, Pointer(usQuery));
        if WaitForUserAccept then
        begin
          SynchronizeEx(ShowStepPage, Pointer(usProgress));
          SptExecutor.Execute;
        end;
      finally
        SptExecutor.Free;
      end;
    end else
      raise Exception.Create('脚本中出现错误。');
  finally
    SptParser.Free;
  end;
end;

procedure TUpgradeThread.InitBeforeExecute(Param: Pointer);
var
  SptParser: TScriptParser;
begin
  SptParser := TScriptParser(Param);
  MainForm.InitDnListView(SptParser.Result.DownloadItems);
end;

procedure TUpgradeThread.ShowStepPage(Param: Pointer);
begin
  MainForm.ShowStepPage(TUpgradeStep(Param));
end;

procedure TUpgradeThread.ShowResultMsg;
begin
  MainForm.ShowResultMsg(FResultMsg);
end;

function TUpgradeThread.WaitForUserAccept: Boolean;
begin
  while not Terminated do
  begin
    if FUserAccepted then Break;
    Sleep(100);
  end;
  Result := FUserAccepted;
end;

procedure TUpgradeThread.DoProgress;
begin
  MainForm.ProgressBar.Max := FProgressMax;
  MainForm.ProgressBar.Position := FProgressPos;
  //Sleep(300);   // debug
end;

procedure TUpgradeThread.DoBeforeDownloadFile(Param: Pointer);
begin
  MainForm.SetDnListItemState(Integer(Param), dsDownloading);
end;

procedure TUpgradeThread.DoAfterDownloadFile(Param: Pointer);
begin
  MainForm.SetDnListItemState(Integer(Param), dsFinished);
end;

procedure TUpgradeThread.HttpClientProgressEvent(Sender: TObject; Max, Pos: Int64);
begin
  FProgressMax := Max;
  FProgressPos := Pos;
  Synchronize(DoProgress);
end;

procedure TUpgradeThread.BeforeDownloadFileEvent(Sender: TObject; FileIndex: Integer);
begin
  SynchronizeEx(DoBeforeDownloadFile, Pointer(FileIndex));
end;

procedure TUpgradeThread.AfterDownloadFileEvent(Sender: TObject; FileIndex: Integer);
begin
  SynchronizeEx(DoAfterDownloadFile, Pointer(FileIndex));
end;

procedure TUpgradeThread.Execute;
begin
  try
    DownloadScript;
  except
    on E: Exception do
    begin
      FResultMsg := E.Message;
      Synchronize(ShowResultMsg);
      Exit;
    end;
  end;

  try
    ProcessScript;
  except
    on E: Exception do
    begin
      FResultMsg := E.Message;
      Synchronize(ShowResultMsg);
      Exit;
    end;
  end;

  DeleteFile(GetLocalScriptFileName);
  FResultMsg := '升级完毕。';
  Synchronize(ShowResultMsg);
end;

end.

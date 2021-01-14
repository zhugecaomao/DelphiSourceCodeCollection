unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, IdBaseComponent,
  IdComponent, IdRawBase, IdRawClient, IdIcmpClient,unitPing,DateUtils;

type
  TfrmNetWatch = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    TaskList: TListBox;
    Splitter2: TSplitter;
    Panel2: TPanel;
    CurentTaskLog: TMemo;
    Splitter3: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnReadTask: TBitBtn;
    TaskLog: TMemo;
    ErrorLog: TMemo;
    Status: TStatusBar;
    PingTimer: TTimer;
    btnStartTask: TBitBtn;
    btnStopTask: TBitBtn;
    PingClient: TIdIcmpClient;
    btnClose: TBitBtn;
    procedure PingTimerTimer(Sender: TObject);
    procedure btnReadTaskClick(Sender: TObject);
    procedure btnStartTaskClick(Sender: TObject);
    procedure btnStopTaskClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PingClientReply(ASender: TComponent;
      const AReplyStatus: TReplyStatus);
  private
    { Private declarations }
  public
    { Public declarations }
    //现阶段程序仅支持 ping 网络主机开机检测 
    PingTaskList : Tlist ;

    function AddMsg(ttMemo : TMemo ;msg : string ): boolean;

  end;

var
  frmNetWatch: TfrmNetWatch;

implementation

{$R *.dfm}
function TfrmNetWatch.AddMsg(ttMemo : TMemo;msg : string ): boolean;
var
  ttMsg,ttFileName : string ;
  ttTextFile : TextFile ;
begin
  if ttMemo.Lines.Count > 1000 then
    ttMemo.Lines.Clear;
  ttMsg := datetimetostr(now)+ ' : ' +msg ;
  ttMemo.Lines.Add(ttMsg);
  ttFileName :=  '.\log\' + ttMemo.Name + '_'+ inttostr(yearof(now))+'_'+ inttostr(monthof(now))+'_'+ inttostr(dayof(now)) + '.log';
  //将日志写入日志文件
  try
    assignfile(ttTextFile,ttFileName);
    If FileExists(ttFileName) Then
      Reset(ttTextFile)
    Else
      Rewrite(ttTextFile);

    append(ttTextFile);
    WriteLn(ttTextFile, ttMsg);
  finally
    closefile(ttTextFile);
  end;
  result := true;
end;


procedure TfrmNetWatch.PingTimerTimer(Sender: TObject);
var
  tSeq ,tTotal : integer ;
  tPingTask : TstringList ;
  ttPing : TPing ;
  tStr : string ;
begin
  AddMsg(self.TaskLog,'开始执行任务');
  self.Status.Panels[1].Text := datetimetostr(now);
  self.CurentTaskLog.Clear;
  //检测 需要检测的机器
  tSeq := 0 ;
  tTotal := self.PingTaskList.Count;
  while tSeq < tTotal do
  begin
    sleep(1000);
    AddMsg(self.CurentTaskLog,'检测到第 '+ inttostr(tSeq + 1)+' 个任务。');
    AddMsg(self.TaskLog,'检测到第 '+ inttostr(tSeq + 1)+' 个任务。');

    tPingTask := TstringList.Create;
    tPingTask.AddStrings(TstringList(self.PingTaskList.List[tSeq]));
    AddMsg(self.CurentTaskLog,'任务名称：' + tPingTask.Strings[0] );
    AddMsg(self.CurentTaskLog,'任务主机：' + tPingTask.Strings[1] );
    AddMsg(self.CurentTaskLog,'任务种类：' + tPingTask.Strings[2] );

    ttPing := tPing.create;
    try
        tStr := '';
        ttPing.pinghost(tPingTask.Strings[1],tStr);
        if pos('Can not find host',tStr) = 0 then
        begin
          AddMsg(self.CurentTaskLog,tPingTask.Strings[2]+'主机正常');
          AddMsg(self.CurentTaskLog,'测试结果：' + tStr );
        end
        else
        begin
          AddMsg(self.CurentTaskLog,tPingTask.Strings[2]+'主机已经关机');
          AddMsg(self.CurentTaskLog,'测试结果：' + tStr );
        end
    finally
      tPingTask.Free;
      ttPing.Free;

    end;

    tSeq := tSeq  + 1 ;
  end;

  AddMsg(self.TaskLog,'执行任务结束');
end;

procedure TfrmNetWatch.btnReadTaskClick(Sender: TObject);
var
  tSeq,tTotal : integer ;
  tTask : TstringList;
begin
  //读入任务
  self.TaskList.Items.Clear;
  self.TaskList.Items.LoadFromFile('.\cfg\task.txt');

  //处理   Ping 任务
  //清除Ping原有任务
  tSeq := 0 ;
  tTotal := self.PingTaskList.Count;
  while tSeq < tTotal do
  begin
    TstringList(self.PingTaskList.List[tSeq]).Free ;
    tSeq := tSeq + 1 ;
  end;
  self.PingTaskList.Clear;
  //解析Ping检测任务
  tSeq := 0 ;
  tTotal := self.TaskList.Items.Count ;
  while tSeq < tTotal do
  begin
    //对每行任务进行解析
    if pos('ping', self.TaskList.Items.Strings[tSeq]) <> 0 then
    begin
      tTask := TstringList.Create;
      ExtractStrings([','],[' '],pchar(self.TaskList.Items.Strings[tSeq]),tTask);
      self.PingTaskList.Add(tTask);
    end;
    tSeq := tSeq  + 1 ;

  end;

  //如果有其他任务 在此予以解析
  
end;

procedure TfrmNetWatch.btnStartTaskClick(Sender: TObject);
begin
  //开始任务
  self.btnReadTaskClick(Sender);  
  self.PingTimer.Enabled := true ;
end;

procedure TfrmNetWatch.btnStopTaskClick(Sender: TObject);
begin
  //开始结束任务
  self.PingTimer.Enabled := false  ;
end;

procedure TfrmNetWatch.btnCloseClick(Sender: TObject);
begin
  //退出程序
  self.Close;
end;

procedure TfrmNetWatch.FormCreate(Sender: TObject);
begin
  if self.PingTaskList = nil then
    self.PingTaskList := TList.Create;

  btnReadTaskClick(Sender);
end;

procedure TfrmNetWatch.PingClientReply(ASender: TComponent;
  const AReplyStatus: TReplyStatus);
begin
  //恢复数据

end;

end.

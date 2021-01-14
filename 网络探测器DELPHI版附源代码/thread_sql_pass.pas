unit thread_sql_pass;

interface

uses
  Classes, Windows, SysUtils, Connection, forms, ADODB, Db, syncobjs, ole2;
type
  Tsql_pass = class(TThread)
  private
    fado_con : TADOConnection;
    state,temp_pass : AnsiString;
    ip_no,user_no,Fpass_no : integer;
    run_count : integer;//当运行够这么多次后就退出,好释放内存
  protected
    procedure Execute; override;
    procedure ThreadDone_pass(Sender: TObject);
    procedure set_list;
    procedure first_run;
    procedure NetCon_Echoopen(Sender : TObject; IConnection: TObject;Error: integer);

    procedure FAfterConnect(Sender : TObject);
    procedure adoConnectComplete(Connection: TADOConnection; const  Error : Error;
       var EventStatus: TEventStatus);
  public
    constructor Create(CreateSuspended: Boolean);
  end;

implementation

uses function_1, main, report, dict;

{ Tsql_pass }

procedure Tsql_pass.adoConnectComplete(Connection: TADOConnection;
  const Error: Error; var EventStatus: TEventStatus);
begin
 state:=Error.Description;
 Synchronize(set_list);//写错误信息
// first_run;
end;

constructor Tsql_pass.Create(CreateSuspended: Boolean);
begin
   OnTerminate := ThreadDone_pass;

   fado_con:= TADOConnection.Create(frmMain);
   fado_con.AfterConnect:=FAfterConnect;
   fado_con.OnConnectComplete:=adoConnectComplete;
   fado_con.ConnectionTimeout:=StrToInt(frmMain.Edit28.Text);
   fado_con.LoginPrompt:=false;
   fado_con.KeepConnection:=false;

   ip_no:=0;
   user_no:=0;
   Fpass_no:=0;
   run_count:=0;
   state:='';
   FreeOnTerminate := True;
   inc(share_thread_no);//线程加1
   frmReport.Edit14.Text:=IntToStr(share_thread_no);
   frmMain.Edit25.Text:=IntToStr(share_thread_no);
   inherited Create(CreateSuspended);

end;

procedure Tsql_pass.Execute;
begin
  inherited;
  try
    CoInitialize(nil);//在线程中一定要初始化
    first_run;
  finally
    CoUninitialize;//在线程中一定要初始化
  end;
end;

procedure Tsql_pass.FAfterConnect(Sender: TObject);
begin
  state:='';
  Synchronize(set_list);//找到密码
  fado_con.Close;
// first_run;

end;

procedure Tsql_pass.first_run;
var
  temp_str : AnsiString;
  po :integer;
  uo : AnsiString;
begin
  temp_str:='';

  inc(run_count);//记录运行的次数
  if (run_count>=50) then exit;
  Application.ProcessMessages;

  ping_CriticalSection.Enter;//进入临界状态
  Fpass_no:=scan_port_ip;//用于指示密码位置
  user_no:=share_ip_no; //用户位置
  ip_no:=cur_ip;
  if (ip_no>=main_list.Count)then
  begin
    ping_CriticalSection.Leave;//析放临界状态
    exit;
  end;

  if (const_pass) then //使用内定密码
  begin
     uo := frmDict.user_list.Lines.Strings[user_no];
     temp_str:=NameToPass(uo,pass_no);
  end;
  if (temp_str='') then
  begin
    inc(scan_port_ip);
    if (scan_port_ip>=port_lists.Count)then
    begin
      scan_port_ip:=0;
      inc(share_ip_no);//用户列表位置加一
      pass_no:=0;
      if (share_ip_no>=frmDict.user_list.Lines.Count) then
      begin
        share_ip_no:=0;
        inc(cur_ip);
        frmMain.Edit20.Text:=main_list.Strings[ip_no];//示显示检测的IP
      end;
    end;
  end;
  ping_CriticalSection.Leave;//析放临界状态
  if not (thread_run) then exit;
  fado_con.ConnectionString:='Provider=SQLOLEDB.1;Persist Security Info=True;Data Source='+main_list.Strings[ip_no];
  if (temp_str='') then//不用内定密码?
    temp_pass:=port_lists.Strings[Fpass_no]
  else
    temp_pass:=temp_str;

  fado_con.Open(frmDict.user_list.Lines.Strings[user_no],temp_pass);

end;

procedure Tsql_pass.NetCon_Echoopen(Sender, IConnection: TObject;
  Error: integer);
begin

end;

procedure Tsql_pass.set_list;
begin
  if (state='')then
  begin
//若成功则跳到下一个用户
     if (user_no=share_ip_no)then
     begin
       inc(share_ip_no);
       scan_port_ip:=0;
     end;
     frmReport.Edit1.Text:=IntToStr(StrToInt(frmReport.Edit1.Text)+1);
     frmMain.Edit22.Text:=IntToStr(StrToInt(frmMain.Edit22.Text)+1);
     frmMain.Edit3.Text:=port_lists.Strings[Fpass_no];//密码
     if (report_show) then//若不弹出检测窗则不写事件,只写成功的
       frmReport.all_info.Lines.Add('检测:'+main_list.Strings[ip_no]+'->用户:'+
       frmDict.user_list.Lines.Strings[user_no]+'->密码:'+temp_pass+'-------------[成功]');
     frmReport.ok_info.Lines.Add('主机:['+main_list.Strings[ip_no]+'] 用户:['+
       frmDict.user_list.Lines.Strings[user_no]+'] 密码:['+temp_pass+']');
  end else
  if (report_show)then //若不弹出检测窗则不写事件,只写成功的
  begin
    frmReport.all_info.Lines.Add('检测:'+main_list.Strings[ip_no]+'->用户:'+
         frmDict.user_list.Lines.Strings[user_no]+'->密码:'+temp_pass+'-------------[失败:'+state+']');
    if (frmReport.all_info.Lines.Count>500) then
    begin
      frmReport.all_info.Lines.Clear();
    end;
  end;

  frmReport.Edit9.Text:=IntToStr(StrToInt(frmReport.Edit9.Text)+1);

end;

//---------------------------------------------------------------------------
//由于不停响应事件而再次连接的工作方式,因而在运行一段时间后内存栈会很多,
//故达到一定程度要释放,即退出!
procedure Tsql_pass.ThreadDone_pass(Sender: TObject);
begin
  fado_con.Free;
  Dec(share_thread_no); //线程总数减一
  frmReport.Edit14.Text:=IntToStr(share_thread_no);
  frmMain.Edit25.Text:=IntToStr(share_thread_no);
//  if (run_count>=50) then
    frmMain.thread_time.Enabled:=true;//激活外部时钟,
  if (share_thread_no=0)then
  begin
    frmMain.Bar.Position:=0;
  end;

end;

end.

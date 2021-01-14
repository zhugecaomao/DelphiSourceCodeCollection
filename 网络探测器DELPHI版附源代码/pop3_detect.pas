unit pop3_detect;

interface

uses
  Classes, SysUtils, SyncObjs, pop_scan, forms, Dialogs, winsock;
type
  TPop3_Detect = class(TThread)
  private
    { Private declarations }
    ip_index,user_index,pass_index : integer;//
    Err,Error_no : integer;
    email_str : AnsiString;
  protected
    procedure Execute; override;
  public
    Fpop_scan : Tpop_scan;
    constructor Create(CreateSuspended: Boolean);
    procedure OnSendDetect(Error : integer);
    procedure set_str;
    procedure ThreadDone(Sender : TObject);
  end;

implementation

uses function_1,report, main, dict;

{ TPop3_Detect }

constructor TPop3_Detect.Create(CreateSuspended: Boolean);
begin

  Error_no := 0;//不能连接的次数
  Fpop_scan := Tpop_scan.Create(frmMain);
  OnTerminate :=ThreadDone;
  FreeOnTerminate := True;
  Fpop_scan.Port:=frmMain.Edit44.Text;
  Fpop_scan.OnSendDetect:=OnSendDetect;

  inc(share_thread_no);
  frmMain.Edit43.Text:=IntToStr(share_thread_no);
  frmReport.Edit14.Text:=IntToStr(StrToInt(frmReport.Edit14.Text)+1);
  inherited Create(CreateSuspended);

end;

procedure TPop3_Detect.Execute;
var
  temp_str,uo : AnsiString;
begin
  inherited;
  temp_str:='';

  while (thread_run) do
  begin
    ping_CriticalSection.Enter;//进入临界状态
    ip_index:=share_ip_no;//取得当前要扫描的POP_IP地址
    user_index:=scan_port_ip;//用户位置 main_list中
    pass_index:=scan_port_no;//当前要扫描的pass_位置! 位于port_lists中
    if ip_index >= frmMain.pop3_list.Items.Count then
    begin
        ping_CriticalSection.Leave;//析放临界状态
        break;
    end;
    if (const_pass) then//使用内定密码
    begin
      uo := main_list.Strings[user_index];
      temp_str:=NameToPass(uo,pass_no);
    end;
    if (temp_str='') then
    begin
      inc(scan_port_no);
      if (scan_port_no>=port_lists.Count) then
      begin
        scan_port_no:=0;
        inc(scan_port_ip);
        pass_no:=0;
        if (scan_port_ip >= main_list.Count) then
        begin
          scan_port_ip:=0;
          inc(share_ip_no);
        end;
      end;
    end;
    if (ping_thread_no=0) then frmMain.Bar.Position:=frmMain.Bar.Position+1;
    email_str:=frmMain.pop3_list.Items.Strings[ip_index];
    frmMain.Edit39.Text:=main_list.Strings[user_index]+'@'+email_str;
    ping_CriticalSection.Leave;//析放临界状态

    Fpop_scan.UserName:=main_list.Strings[user_index];//+'@'+email_str;
    if (inet_addr(pchar(email_str))=-1) then Fpop_scan.HostName:=email_str
      else  Fpop_scan.Address:=email_str;

    if (Fpop_scan.Address<>'') then
    begin
      if (temp_str='') then
      begin
         if (port_lists.Count>0) then
         begin
           Fpop_scan.PassWord:=port_lists.Strings[pass_index];
           Fpop_scan.SendDetect;
         end;
      end
      else
      begin
         Fpop_scan.PassWord:=temp_str;
         Fpop_scan.SendDetect;
      end;
    end else begin
      ping_CriticalSection.Enter;//进入临界状态
      frmReport.all_info.Lines.Add('信箱:'+email_str+'错误!');
      if (ip_index = share_ip_no) then
      begin
        inc(share_ip_no);
        scan_port_ip:=0;
        scan_port_no:=0;
        pass_no:=0;
      end;
      ping_CriticalSection.Leave;//析放临界状态
    end;
  end;

end;

procedure TPop3_Detect.OnSendDetect(Error: integer);
begin
  Err:=Error;
  Synchronize(set_str);

end;

procedure TPop3_Detect.set_str;
begin
  if (Err=-1) then//主机断开连接
  begin
      frmMain.pop3_info.Lines.Add('POP3主机:'+email_str+'不可连接!');
      Beep();
      inc(Error_no);
      Application.ProcessMessages;
      if (Error_no>3) then//连接2 次若不通就跳过
      begin
         Error_no:=0;
         if (ip_index = share_ip_no)then//跳到下一主机
         begin
           inc(share_ip_no);
           scan_port_ip:=0;
           scan_port_no:=0;
           pass_no:=0;
         end;
       end;
   end
   else
     if (Err=-2) then //用户登陆失败
     begin
       Error_no:=0;
       frmMain.pop3_info.Lines.Add('信箱:'+Fpop_scan.UserName+'@'+email_str+'-->用户登陆失败:'+'密码:['+Fpop_scan.PassWord+']'+Trim(Fpop_scan.Recv_Info));
       if (user_index = scan_port_ip) then//跳到下一用户
       begin
         inc(scan_port_ip);
         scan_port_no:=0;
         if (scan_port_ip>=main_list.Count) then
         begin
           scan_port_ip:=0;
           inc(share_ip_no);
           pass_no:=0;
         end;
       end
  end else
  if (Err=-3) then//密码登陆失败
  begin
    Error_no:=0;
    frmMain.pop3_info.Lines.Add('信箱:'+Fpop_scan.UserName+'@'+email_str+'密码:['+Fpop_scan.PassWord+']-->登陆失败:'+Trim(Fpop_scan.Recv_Info));
  end else
  if (Err=0) then
  begin
     Beep;
     Error_no:=0;
     frmMain.pop3_info.Lines.Add('信箱:'+Fpop_scan.UserName+'@'+email_str+'密码:['+Fpop_scan.PassWord+']-->成功:'+Trim(Fpop_scan.Recv_Info));
     frmMain.pop3_pass.Lines.Add('信箱:'+Fpop_scan.UserName+'@'+email_str+'密码:['+Fpop_scan.PassWord+']   信息:'+Trim(Fpop_scan.Recv_Info));

     frmMain.Edit41.Text:=IntToStr(StrToInt(frmMain.Edit41.Text)+1);
     if (user_index = scan_port_ip)then//跳到下一用户
     begin
       inc(scan_port_ip);
       scan_port_no:=0;
       if (scan_port_ip>=main_list.Count)then
       begin
         scan_port_ip:=0;
         inc(share_ip_no);
         pass_no:=0;
       end;
     end;
  end;
  frmMain.Edit46.Text:=IntToStr(StrToInt(frmMain.Edit46.Text)+1);
  if (frmMain.pop3_info.Lines.Count>300) then frmMain.pop3_info.Lines.Clear;

end;

procedure TPop3_Detect.ThreadDone(Sender: TObject);
begin
  (TPop3_Detect(Sender)).Fpop_scan.Free;

  Dec(share_thread_no);
  frmMain.Edit43.Text:=IntToStr(share_thread_no);
  frmReport.Edit14.Text:=IntToStr(StrToInt(frmReport.Edit14.Text)-1);
  if ((ping_thread_no=0)and(share_thread_no=0)) then
  begin
     frmMain.Bar.Position:=0;
     frmMain.Edit39.Text:='扫描完毕,请查看...';
  end;

end;

end.

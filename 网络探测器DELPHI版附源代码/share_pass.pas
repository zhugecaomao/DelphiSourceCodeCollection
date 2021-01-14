unit share_pass;

interface

uses
  Classes, SysUtils, SyncObjs, Connection;

type
  tshare_pass = class(TThread)
  private
    { Private declarations }
    FNetConnection : TNetConnection;
    flist : TStringList;//用于保存用户列表
    state : integer;
    pass_no,user_no: longint;
  protected
    procedure ThreadDone_share(Sender : TObject);
    procedure set_list;
    procedure NetCon_Echoopen(Sender: TObject; IConnection: TObject; Error: integer);
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
  end;

implementation

{ Important: Methods and properties of objects in VCL or CLX can only be used
  in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure tshare_pass.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

uses function_1,report, main, dict;

{ tshare_pass }

procedure tshare_pass.ThreadDone_share(Sender : TObject);
begin
  FNetConnection.Free;
  flist.Free;
  Dec(share_thread_no); //线程总数减一
  frmReport.Edit14.Text := IntToStr(share_thread_no);

  if (share_thread_no = 0) then
  begin
//    frmmain.Edit8.Text := '查找共享完成';
//    frmmain.BitBtn4.Enabled <> frmmain.share_check.Checked;
//    frmmain.BitBtn5.Enabled <> frmmain.share_check.Checked;
    frmMain.Bar.Position := 0;
  end;
end;

constructor tshare_pass.Create(CreateSuspended: Boolean);
begin
   FNetConnection := TNetConnection.Create(frmMain);
   flist := TStringList.Create;
   //   FNetConnection.OnEchoClose := NetCon_EchoClose;
   FNetConnection.OnEchoOpen := NetCon_Echoopen;
   FNetConnection.GetInfo := false;//找系统信息
   FNetConnection.AutoDo := false;//不是自动查找
   OnTerminate := ThreadDone_share;
   FreeOnTerminate := True;
   inc(share_thread_no);//线程加1
   frmReport.Edit14.Text := IntToStr(share_thread_no);
  inherited Create(CreateSuspended);

end;

procedure tshare_pass.Execute;
var
  ip_no, temp : Integer;
  temp_str,un : AnsiString;
begin
  { Place thread code here }
  temp := 0;
  temp_str := '';
  while (thread_run) do
  begin
    pass_no := 0;//用于指示密码位置
    user_no := 0;
    ping_CriticalSection.Enter;//进入临界状态
    ip_no := cur_ip;
    inc(cur_ip);
    ping_CriticalSection.Leave;//析放临界状态
    if (ip_no >= main_list.Count) then exit;

    FNetConnection.Address := main_list.Strings[ip_no];
    FNetConnection.get_user(1,flist);//找用户
    if (flist.Count = 0) then //若没有用户则取默认的用户
        flist.AddStrings(frmDict.user_list.Lines)
      else temp := 0;

    while (thread_run) do
    begin
      if (pass_no >= port_lists.Count) then
      begin
        pass_no := 0;
        temp := 0;
        inc(user_no);//用户列表位置加一
        if (user_no >= flist.Count)then
        begin
           user_no := 0;
           break;
        end;
      end;
      FNetConnection.UserName := flist.Strings[user_no];
      if (const_pass) then //使用内定密码
      begin
        un := FNetConnection.UserName;
        temp_str := NameToPass(un,temp);
      end;

      if (temp_str <> '')then
          FNetConnection.PassWord := temp_str
         else
         begin
           FNetConnection.PassWord := port_lists.Strings[pass_no];
           inc(pass_no);
         end;

      FNetConnection.open;
      FNetConnection.close;
    end;
  end;

end;

procedure tshare_pass.NetCon_Echoopen(Sender, IConnection: TObject;
  Error: integer);
begin
  state := Error;
  Synchronize(set_list);//写全部信息
  if ((Error=51)or (Error=53)or (Error=64)or (Error=1792)) then//远程计算机不可用/网络路径不存在/不可再用/登录服务不运行
  begin
    user_no := flist.Count;
    pass_no := port_lists.Count;
  end;

end;

procedure tshare_pass.set_list;
begin
 if (state=0) then
 begin
//若成功则跳到下一个用户
    if (FNetConnection.UserName=flist.Strings[user_no]) then
       pass_no := port_lists.Count;

    Beep;
    frmReport.Edit1.Text := IntToStr(StrToInt(frmReport.Edit1.Text)+1);
    frmReport.all_info.Lines.Add('检测:'+ FNetConnection.Address+ '->用户:'+
          FNetConnection.UserName+'.密码:'+FNetConnection.PassWord+'-------------[成功]');
    frmReport.ok_info.Lines.Add('主机:['+FNetConnection.Address+'] 用户:['+
          FNetConnection.UserName+'] 密码:['+FNetConnection.PassWord+']');
  end else
  begin
    frmReport.all_info.Lines.Add('检测:'+FNetConnection.Address+'->用户:'+
        FNetConnection.UserName+'->密码:'+FNetConnection.PassWord+'-------------[失败:'+IntToStr(state)+']');
    if (frmReport.all_info.Lines.Count>500) then
    begin
      frmReport.all_info.Lines.Clear;
    end;
 end;
 frmReport.Edit9.Text := IntToStr(StrToInt(frmReport.Edit9.Text)+1);

end;

end.


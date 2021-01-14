unit thread_share;

interface
uses
  Classes, SysUtils, ComCtrls,Connection ; // Connection
type
  myThread_share = class(TThread)
  private
    { Private declarations }
    FNetConnection : TNetConnection;
    list : TStringList;
    procedure set_list;
    procedure set_user;
    procedure set_svr;
    procedure set_system;
  protected
    procedure Execute; override;
    procedure ThreadDone_share(Sender: TObject);
    procedure NetCon_EchoClose(Sender: TObject;
                     IConnection: TObject; Error: integer);
    procedure NetCon_Echoopen(Sender: TObject; IConnection: TObject; Error: integer);
    procedure NetCon_EchoShareEnum(Sender: TObject;
                      IConnection: TObject; Error: integer);
    procedure Netopensucceed(Sender: TObject);
  public
    constructor Create(CreateSuspended: Boolean);
  end;

implementation

uses report, main, dict, function_1;

{ Thread_share }

constructor myThread_share.Create(CreateSuspended: Boolean);
begin
   FNetConnection := TNetConnection.Create(frmMain);
   list := TStringList.Create;

   FNetConnection.OnEchoClose:=NetCon_EchoClose;
   FNetConnection.OnEchoOpen:=NetCon_Echoopen;
   FNetConnection.OnEchoShareEnum:=NetCon_EchoShareEnum;
   FNetConnection.OnOpenSucceed:=Netopensucceed;
   FNetConnection.GetInfo:=lookup_system;//找系统信息
   OnTerminate :=ThreadDone_share;
   FreeOnTerminate := True;
   inc(share_thread_no);//线程加1
   frmMain.Edit16.Text:=IntToStr(share_thread_no);
   inherited Create(CreateSuspended);

end;

procedure myThread_share.Execute;
var
  no : integer;
begin
  inherited;
   ping_CriticalSection.Enter;//进入临界状态
   no:=share_ip_no;
   if (no >= frmMain.tree_ping.Items.Count) then
   begin
     ping_CriticalSection.Leave();//析放临界状态
     exit;
   end else
     if (do_select) then
     begin
        if (frmMain.tree_ping.Selected=nil) then
          FNetConnection.Address:=frmMain.tree_ping.Items.Item[0].Text
          else
          FNetConnection.Address:=frmMain.tree_ping.Selected.Text;
        frmMain.Edit8.Text:=FNetConnection.Address;
        share_ip_no:=frmMain.tree_ping.Items.Count;//设为最大
     end else
     begin
       inc(share_ip_no);
       FNetConnection.Address:=frmMain.tree_ping.Items.Item[no].Text;
       frmMain.Edit8.Text:=FNetConnection.Address;
     end;
   ping_CriticalSection.Leave;//析放临界状态

   FNetConnection.open;

end;

procedure myThread_share.NetCon_EchoClose(Sender, IConnection: TObject;
  Error: integer);
var
  no : integer;
begin
  Synchronize(set_system);
  if (lookup_Services) then
  begin
    FNetConnection.EnumServices(list);
    if (list.Count>1) then Synchronize(set_svr);//找服务
  end;

  ping_CriticalSection.Enter;//进入临界状态
  no:=share_ip_no;
  if (no>=frmMain.tree_ping.Items.Count) then
  begin
    ping_CriticalSection.Leave;//析放临界状态
    exit;
  end  else
  begin
    inc(share_ip_no);
    FNetConnection.Address:=frmMain.tree_ping.Items.Item[no].Text;
    frmMain.Edit8.Text:=FNetConnection.Address;
  end;
    ping_CriticalSection.Leave;//析放临界状态

 if (thread_run) then FNetConnection.open;

end;

procedure myThread_share.NetCon_Echoopen(Sender, IConnection: TObject;
  Error: integer);
begin
  if (Error<>0) then NetCon_EchoClose( nil, nil,0);

end;

procedure myThread_share.NetCon_EchoShareEnum(Sender, IConnection: TObject;
  Error: integer);
begin
  if ((Error=0)or(Error=234)) then Synchronize(set_list);

end;

procedure myThread_share.Netopensucceed(Sender: TObject);
begin
 if (lookup_user)then
 begin
     FNetConnection.NetQueryDisplayInformation(1,list);
     if (list.Count>1) then Synchronize(set_user);//找用户
 end;
end;

procedure myThread_share.set_list;
var
  i : integer;
  temp_node : TTreeNode;
begin
  temp_node:=frmMain.tree_share.Items.Add(nil,FNetConnection.list.Strings[0]);

  for i:=1 to FNetConnection.list.Count-1 do
  begin
    frmMain.tree_share.Items.AddChild(temp_node,FNetConnection.list.Strings[i]);
    frmMain.Edit10.Text:=IntToStr(StrToInt(frmMain.Edit10.Text)+1);
  end;

end;

procedure myThread_share.set_svr;
var
  i : integer;
  temp_node : TTreeNode;
begin
  temp_node:=frmMain.share_svr.Items.Add(nil,list.Strings[0]);

  for i:=1 to list.Count-1 do
  begin
    frmMain.share_svr.Items.AddChild(temp_node,list.Strings[i]);
//    frmMain.Edit10.Text=IntToStr(StrToInt(frmMain.Edit10.Text)+1);
  end;

end;

procedure myThread_share.set_system;
var
  i : integer;
  temp_node : TTreeNode;
begin
 if ((lookup_system) and (FNetConnection.list_info.Count>1))then
 begin
    temp_node:=frmMain.share_system.Items.Add(nil,FNetConnection.list_info.Strings[0]);
    for i:=1 to FNetConnection.list_info.Count-1 do
    begin
      frmMain.share_system.Items.AddChild(temp_node,FNetConnection.list_info.Strings[i]);
    end;
    FNetConnection.list_info.Clear;
 end;
end;

procedure myThread_share.set_user;
var
  i : integer;
  temp_node : TTreeNode;
begin
  temp_node:=frmMain.share_user.Items.Add(nil,list.Strings[0]);

  for i:=1 to list.Count-1 do
  begin
    frmMain.share_user.Items.AddChild(temp_node,list.Strings[i]);
//    frmMain.Edit10.Text=IntToStr(StrToInt(frmMain.Edit10.Text)+1);
  end;
end;

procedure myThread_share.ThreadDone_share(Sender: TObject);
begin
  FNetConnection.Free;
  list.Free;
  Dec(share_thread_no); //线程总数减一
  frmMain.Edit16.Text:=IntToStr(share_thread_no);
  if ((share_thread_no=0)and(ping_thread_no=0)) then
  begin
    frmMain.Edit8.Text:='查找共享完成';
    frmMain.BitBtn4.Enabled:= not frmMain.share_check.Checked;
    frmMain.BitBtn5.Enabled:= not frmMain.share_check.Checked;
    frmMain.Bar.Position:=0;
    do_select:=false;
  end;

end;

end.

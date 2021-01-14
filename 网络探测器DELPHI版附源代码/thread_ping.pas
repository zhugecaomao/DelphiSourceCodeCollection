unit thread_ping;

interface

uses
  Classes, SysUtils, SyncObjs, ComCtrls, Ping;
type
  Tmy_thread1 = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  public
    FPing : TPing;
    constructor Create(thread_Ping: TPing; CreateSuspended: Boolean);
    procedure set_str;
    procedure set_str2;
    procedure set_bar;
    procedure ThreadDone(Sender : TObject);
    procedure PingEchoReply(Sender : TObject; Icmp: TObject;Error: integer);
  end;

implementation

uses function_1,report, main;

{ Tmy_thread1 }

constructor Tmy_thread1.Create(thread_Ping: TPing;
  CreateSuspended: Boolean);
begin
  FPing:=thread_Ping;
  OnTerminate :=ThreadDone;
  FreeOnTerminate := True;
  FPing.OnEchoReply:=PingEchoReply;
  inc(ping_thread_no);
  frmMain.Edit14.Text:=IntToStr(ping_thread_no);
  inherited Create(CreateSuspended);

end;

procedure Tmy_thread1.Execute;
var
  no : LongWord;
begin
  inherited;

  while (thread_run) do
  begin
   ping_CriticalSection.Enter;//进入临界状态
       no:=cur_ip;
       inc(cur_ip);
   ping_CriticalSection.Leave;//析放临界状态

   if ((ping_ip_start+no)<=ping_ip_stop)then
   begin
      FPing.Address:=iptostr(ping_ip_start+no);
      FPing.Ping;
   end else break;
  end;

end;

procedure Tmy_thread1.PingEchoReply(Sender, Icmp: TObject; Error: integer);
begin
  Synchronize(set_bar);
  if (Error=1) then Synchronize(set_str)
    else
     if (frmMain.CheckBox5.Checked) then Synchronize(set_str2);

end;

procedure Tmy_thread1.set_bar;
begin
  frmMain.Edit7.Text:=FPing.Address;
  frmMain.Bar.Position:=cur_ip;

end;

procedure Tmy_thread1.set_str;
var
  temp_node : TTreeNode;
begin
  temp_node:=frmMain.tree_ping.Items.Add(nil,FPing.Address);
  temp_node.ImageIndex:=0;
  temp_node.SelectedIndex:=0;

//  frmMain.ListBox1.Items.Add(FPing.Address);
  frmMain.Edit9.Text:=IntToStr(StrToInt(frmMain.Edit9.Text)+1);
  if (frmMain.share_check.Checked)then  creat_share ;//自动找共享资料

end;

procedure Tmy_thread1.set_str2;
var
  temp_node : TTreeNode;
begin
  temp_node:=frmMain.tree_ping.Items.Add(nil,FPing.Address);
  temp_node.ImageIndex:=1;
  temp_node.SelectedIndex:=1;

//  frmMain.ListBox1.Items.Add(FPing.Address);
  frmMain.Edit9.Text:=IntToStr(StrToInt(frmMain.Edit9.Text)+1);
  if (frmMain.share_check.Checked)then creat_share;//自动找共享资料

end;

procedure Tmy_thread1.ThreadDone(Sender: TObject);
begin
  (Tmy_thread1(Sender)).FPing.Free;
  Dec(ping_thread_no);
  frmMain.Edit14.Text:=IntToStr(ping_thread_no);
  if (ping_thread_no=0)then
  begin
    frmMain.Edit7.Text:='查找完成...';
    frmMain.Bar.Max:=frmMain.tree_ping.Items.Count;
    if (share_thread_no>0) then
       frmMain.Bar.Position:=share_ip_no
    else
       frmMain.Bar.Position:=0;
  end;
end;

end.

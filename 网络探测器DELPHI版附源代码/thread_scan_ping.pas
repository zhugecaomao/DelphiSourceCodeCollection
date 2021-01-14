unit thread_scan_ping;

interface
uses
  Classes, SysUtils, SyncObjs,Connection , ComCtrls,Ping;//Connection

type
  Tmy_scan_ping = class(TThread)
  private
    { Private declarations }
    fProcess : LongWord;
    procedure Update_scan_ip;
  protected
    procedure Execute; override;
  public
    FPing : TPing;
    constructor Create(CreateSuspended: Boolean);
    procedure set_str;
    procedure set_str2;
    procedure set_bar;
    procedure ThreadDone(Sender : TObject);
    procedure PingEchoReply(Sender : TObject; Icmp: TObject;Error: integer);
  end;

implementation

uses function_1, main, Tlookup_name;

{ Tmy_scan_ping }

constructor Tmy_scan_ping.Create(CreateSuspended: Boolean);
begin
  FPing:= TPing.Create(frmMain);
  FPing.Timeout:=StrToInt(frmMain.Edit12.Text);

  OnTerminate :=ThreadDone;
  FreeOnTerminate := True;
  FPing.OnEchoReply:=PingEchoReply;
  inc(ping_thread_no);
  frmMain.scan_edit2.Text:=IntToStr(ping_thread_no+scan_thread_no);

  inherited Create(CreateSuspended);
end;

procedure Tmy_scan_ping.Update_scan_ip;
begin
    frmMain.scan_ip.Text:=iptostr(ping_ip_start + fProcess );
end;

procedure Tmy_scan_ping.Execute;
begin
  inherited;
  while (thread_run) do
  begin
    ping_CriticalSection.Enter;//进入临界状态
    fProcess:=cur_ip;
    inc(cur_ip);
    //frmMain.scan_ip.Text:=iptostr(ping_ip_start+no);
    Synchronize(Update_scan_ip);
    ping_CriticalSection.Leave;//析放临界状态

    if ((ping_ip_start + fProcess)<=ping_ip_stop) then
    begin
      FPing.Address:=iptostr(ping_ip_start + fProcess);
      FPing.Ping;
    end else break;
  end
end;

procedure Tmy_scan_ping.PingEchoReply(Sender, Icmp: TObject;
  Error: integer);
begin
  Synchronize(set_bar);
  if (Error=1) then
     Synchronize(set_str)
  else
    if not (only_ping) then Synchronize(set_str2);

end;

procedure Tmy_scan_ping.set_bar;
begin
  frmMain.Bar.Position:=cur_ip;
end;

procedure Tmy_scan_ping.set_str;
var
  temp_node : TTreeNode;
  bubble : TmyLookUp_Name;//查找名称
begin
  temp_node:=frmMain.Tree_port.Items.Add(nil,FPing.Address);
  temp_node.ImageIndex:=0;
  temp_node.SelectedIndex:=0;
  main_list.Add(IntToStr(Integer(temp_node.ItemId)));
  main_list.Add(FPing.Address);
  frmMain.scan_edit3.Text:=IntToStr(StrToInt(frmMain.scan_edit3.Text)+1);

  if (frmMain.CheckBox2.Checked) then
  begin
     bubble := TmyLOOKUP_Name.Create(Integer(temp_node.ItemId),FPing.Address,false);
  end;
  frmMain.thread_time.Enabled:=true;

end;

procedure Tmy_scan_ping.set_str2;
var
  temp_node : TTreeNode;
  bubble : TmyLookUp_Name;//查找名称
begin
  temp_node:=frmMain.Tree_port.Items.Add(nil,FPing.Address);
  temp_node.ImageIndex:=1;
  temp_node.SelectedIndex:=1;
  main_list.Add(IntToStr(Integer(temp_node.ItemId)));
  main_list.Add(FPing.Address);

  if (frmMain.CheckBox2.Checked)then
  begin
    bubble := TMyLookUp_Name.Create(Integer(temp_node.ItemId),FPing.Address,false);
  end;

  frmMain.thread_time.Enabled:=true;

end;

procedure Tmy_scan_ping.ThreadDone(Sender: TObject);
begin
  (Tmy_scan_ping(Sender)).FPing.Free;
  Dec(ping_thread_no);
  frmMain.scan_edit2.Text:=IntToStr(ping_thread_no+scan_thread_no);

  if ((scan_thread_no=0)and(ping_thread_no=0)) then
  begin
    frmMain.Bar.Position:=0;
    frmMain.scan_ip.Text:='扫描完毕,请查看...';
  end;

end;

end.

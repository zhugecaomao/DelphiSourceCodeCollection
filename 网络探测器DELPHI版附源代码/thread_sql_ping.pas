unit thread_sql_ping;

interface

uses
  Classes, SysUtils, syncobjs, Win_scan;

type
  Tmy_sql_ping = class(TThread)
  private
  protected
    procedure Execute; override;
  public
    Fscan_port : Tscan_port;
    constructor Create(CreateSuspended: Boolean);
    procedure scanOnScan(Sender: TObject; Error: integer);
    procedure set_str;
    procedure set_bar;
    procedure ThreadDone(Sender: TObject);
  end;

implementation

uses   function_1, tlookup_name, main;

{ Tmy_sql_ping }

//PING线程的结束处理事件
constructor Tmy_sql_ping.Create(CreateSuspended: Boolean);
begin
  Fscan_port:= Tscan_port.Create(frmMain);

  Fscan_port.Port:=frmMain.Edit27.Text;
  OnTerminate :=ThreadDone;
  FreeOnTerminate := True;
  Fscan_port.OnScan:=scanOnScan;
  inc(ping_thread_no);
  inherited Create(CreateSuspended);

end;

procedure Tmy_sql_ping.Execute;
var
  no : integer;
begin
  inherited;
  while (thread_run)do
  begin
    ping_CriticalSection.Enter();//进入临界状态
    no:=cur_ip;
    inc(cur_ip);
    frmMain.Edit24.Text:=IntToStr(ping_thread_no);
    ping_CriticalSection.Leave;//析放临界状态

    if ((ping_ip_start+no)<=ping_ip_stop) then
    begin
      Fscan_port.Address:=iptostr(ping_ip_start + no);
      Fscan_port.scan;
    end else break;
  end;
end;

procedure Tmy_sql_ping.scanOnScan(Sender: TObject; Error: integer);
begin
  Synchronize(set_bar);
  if (Error=0) then Synchronize(set_str);

end;

procedure Tmy_sql_ping.set_bar;
begin
  frmMain.Edit19.Text:=Fscan_port.Address;
  frmMain.Bar.Position:=cur_ip;

end;

procedure Tmy_sql_ping.set_str;
begin
  frmMain.ListBox2.Items.Add(Fscan_port.Address);
  frmMain.Edit21.Text:=IntToStr((StrToInt(frmMain.Edit21.Text)+1));

end;

procedure Tmy_sql_ping.ThreadDone(Sender: TObject);
begin
  (Tmy_sql_ping(Sender)).Fscan_port.Free;
  Dec(ping_thread_no);
  frmMain.Edit24.Text:=IntToStr(ping_thread_no);
  if (ping_thread_no=0)then
  begin
    frmMain.Bar.Max:=main_list.Count;
    frmMain.Bar.Position:=0;
  end;

end;

end.

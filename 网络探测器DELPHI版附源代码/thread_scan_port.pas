unit thread_scan_port;

interface
uses
  Classes, SysUtils, SyncObjs, win_scan, Ping, ComCtrls, CommCtrl;
type
  Tmy_scan_port = class(TThread)
  private
    { Private declarations }
//   tree_index : HTREEITEM;
    tree_index : integer;
    port_str : AnsiString;
  protected
    procedure Execute; override;
  public
    Fscan_port : Tscan_port;
    constructor Create(CreateSuspended: Boolean);
    procedure scanOnScan(Sender : TObject; Error : integer);
    procedure set_str;
    procedure ThreadDone(Sender : TObject);
  end;

implementation

uses function_1,report, main, dict;

{ Tmy_scan_port }

constructor Tmy_scan_port.Create(CreateSuspended: Boolean);
begin
  Fscan_port:= Tscan_port.Create(frmMain);
  OnTerminate := ThreadDone;
  FreeOnTerminate := True;
  Fscan_port.OnScan:=scanOnScan;
  inc(scan_thread_no);
  frmMain.scan_edit2.Text:=IntToStr(scan_thread_no+ping_thread_no);
  inherited Create(CreateSuspended);
end;

procedure Tmy_scan_port.Execute;
var
  no : integer;
  s : AnsiString;
begin
  inherited;

  while (thread_run)do
  begin
    ping_CriticalSection.Enter;//进入临界状态
    tree_index:=scan_port_ip;//取得当前要扫描的IP
    no:=scan_port_no;//当前要扫描的端口号_位置! 位于port_lists中
    if ((tree_index >= main_list.Count)or(no>=port_lists.Count)) then
    begin
       ping_CriticalSection.Leave;//析放临界状态
       break;
    end;
    s := port_lists.Strings[no];
    frmMain.scan_ip.Text:=main_list.Strings[tree_index+1]+'   ->: '+get_intstr(s);//标示出当前IP
    inc(scan_port_no);
    if (scan_port_no>=port_lists.Count) then
    begin
       scan_port_no:=0;
       scan_port_ip:=scan_port_ip+2;
    end;
    frmMain.Bar.Position:=frmMain.Bar.Position+1;
    frmMain.scan_edit3.Text:=IntToStr(StrToInt(frmMain.scan_edit3.Text)+1);
    ping_CriticalSection.Leave;//析放临界状态
    s := port_lists.Strings[no];
    Fscan_port.Port:=get_intstr(s);
    Fscan_port.Address:=main_list.Strings[tree_index+1];
    port_str:=port_lists.Strings[no];////保留当前的端口号
    Fscan_port.scan;
  end;
end;

procedure Tmy_scan_port.scanOnScan(Sender: TObject; Error: integer);
begin
   if (Error=0)  then Synchronize(set_str);

end;

procedure Tmy_scan_port.set_str;
var
  temp_node  : TTreeNode;
  temp_node2 : TTreeNode;
begin

  frmMain.scan_edit4.Text:=IntToStr(StrToInt(frmMain.scan_edit4.Text)+1);

  temp_node:=frmMain.Tree_port.Items.GetNode(HTREEITEM(StrToInt(main_list.Strings[tree_index])));
  temp_node.ImageIndex:=3;
  temp_node.SelectedIndex:=3;
  temp_node2:=frmMain.Tree_port.Items.AddChild(temp_node,port_str);
  temp_node2.ImageIndex:=2;
  temp_node2.SelectedIndex:=2;

end;

procedure Tmy_scan_port.ThreadDone(Sender: TObject);
begin
  (Tmy_scan_port(Sender)).Fscan_port.Free;
  Dec(scan_thread_no);
  frmMain.scan_edit2.Text:=IntToStr(scan_thread_no+ping_thread_no);
  if ((scan_thread_no=0) and (ping_thread_no=0)) then
  begin
     frmMain.Bar.Position:=0;
     frmMain.scan_ip.Text:='扫描完毕,请查看...';
  end;

end;

end.

unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, ImgList, Menus, ComCtrls, StdCtrls, Buttons,
  CheckLst, syncobjs, winsock, clipbrd;

type
  TfrmMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Tree_port: TTreeView;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    port_option: TComboBox;
    port_list: TCheckListBox;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    port_stop: TEdit;
    port_start: TEdit;
    CheckBox6: TCheckBox;
    scan_edit3: TEdit;
    scan_ip: TEdit;
    BitBtn2: TBitBtn;
    BitBtn8: TBitBtn;
    scan_edit4: TEdit;
    scan_edit2: TEdit;
    TabSheet2: TTabSheet;
    Bevel1: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label15: TLabel;
    Label41: TLabel;
    BitBtn7: TBitBtn;
    share_check: TCheckBox;
    Edit5: TEdit;
    Edit6: TEdit;
    Button2: TButton;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Button3: TButton;
    Button5: TButton;
    CheckBox3: TCheckBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit14: TEdit;
    Edit16: TEdit;
    CheckBox5: TCheckBox;
    tree_ping: TTreeView;
    Edit4: TEdit;
    Button4: TButton;
    Edit11: TEdit;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    tree_share: TTreeView;
    TabSheet7: TTabSheet;
    share_user: TTreeView;
    TabSheet8: TTabSheet;
    share_svr: TTreeView;
    TabSheet9: TTabSheet;
    share_system: TTreeView;
    Button7: TButton;
    TabSheet3: TTabSheet;
    Bevel2: TBevel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label25: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Edit17: TEdit;
    Edit18: TEdit;
    Button8: TButton;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Button10: TButton;
    Button12: TButton;
    Button13: TButton;
    ListBox2: TListBox;
    CheckBox4: TCheckBox;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    BitBtn9: TBitBtn;
    Button18: TButton;
    sql_cmd: TMemo;
    Edit3: TEdit;
    Edit27: TEdit;
    Edit32: TComboBox;
    Button6: TButton;
    TabSheet10: TTabSheet;
    Bevel3: TBevel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label55: TLabel;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    CheckBox8: TCheckBox;
    Edit42: TEdit;
    Edit43: TEdit;
    pop3_list: TListBox;
    Edit36: TEdit;
    Edit37: TEdit;
    Button9: TButton;
    Edit44: TEdit;
    BitBtn12: TBitBtn;
    BitBtn16: TBitBtn;
    Button15: TButton;
    new_pop3: TEdit;
    BitBtn13: TBitBtn;
    Edit46: TEdit;
    PageControl3: TPageControl;
    TabSheet12: TTabSheet;
    Splitter1: TSplitter;
    pop3_pass: TMemo;
    pop3_info: TMemo;
    pop3_auto: TCheckBox;
    TabSheet5: TTabSheet;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Edit12: TEdit;
    Edit13: TEdit;
    GroupBox2: TGroupBox;
    Label20: TLabel;
    Edit15: TEdit;
    check_system: TCheckBox;
    check_user: TCheckBox;
    check_Services: TCheckBox;
    GroupBox3: TGroupBox;
    Label33: TLabel;
    Edit26: TEdit;
    GroupBox4: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    Edit28: TEdit;
    Edit33: TEdit;
    GroupBox5: TGroupBox;
    Label54: TLabel;
    Label56: TLabel;
    Edit45: TEdit;
    Edit47: TEdit;
    TabSheet4: TTabSheet;
    Label11: TLabel;
    Label44: TLabel;
    Memo1: TMemo;
    BitBtn10: TBitBtn;
    Edit34: TEdit;
    Edit35: TEdit;
    BitBtn11: TBitBtn;
    Bar: TProgressBar;
    BitBtn6: TBitBtn;
    memo_m: TPopupMenu;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N4: TMenuItem;
    scan_image: TImageList;
    open_port: TOpenDialog;
    save_port: TSaveDialog;
    ado_q: TADOQuery;
    ado_pub: TADOConnection;
    listbox_m: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    share_tree_m: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    share_con: TMenuItem;
    N1: TMenuItem;
    MenuItem7: TMenuItem;
    Timer1: TTimer;
    thread_time: TTimer;
    TabSheet11: TTabSheet;
    GroupBox6: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    Edit48: TEdit;
    Edit49: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    rgTools: TRadioGroup;
    RichEdit1: TRichEdit;
    edParameter: TEdit;
    Button11: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure share_checkClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure ado_qAfterOpen(DataSet: TDataSet);
    procedure BitBtn9Click(Sender: TObject);
    procedure ado_pubAfterConnect(Sender: TObject);
    procedure ado_pubBeforeConnect(Sender: TObject);
    procedure ado_pubAfterDisconnect(Sender: TObject);
    procedure Edit32KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button13Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure sql_cmdDblClick(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
    procedure ListBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N9Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure tree_shareDblClick(Sender: TObject);
    procedure check_systemClick(Sender: TObject);
    procedure check_ServicesClick(Sender: TObject);
    procedure check_userClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure ado_pubConnectComplete(Connection: TADOConnection;
      const Error: Error; var EventStatus: TEventStatus);
    procedure BitBtn7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TabSheet4Hide(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure thread_timeTimer(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure share_conClick(Sender: TObject);
    procedure Tree_portKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet1Hide(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure pop3_autoClick(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure pop3_infoDblClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure edParameterKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure my_Exception(Sender: TObject; E: Exception);
  end;

var
   frmMain: TfrmMain;

implementation

uses dict,report, function_1, thread_ping, Spec;

{$R *.dfm}

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  if (not (check_ip(Edit5.Text)and check_ip(Edit6.Text))) then
     exit;//检查IP是否合法
  ping_ip_start:=strtoip(Edit5.Text);  ping_ip_stop:=strtoip(Edit6.Text);
  cur_ip:=0;
  share_ip_no:=0;
//  frmMain.Edit10.Text:='0';
  Bar.Max:=ping_ip_stop-ping_ip_start;
  thread_run:=true;

  if (CheckBox3.Checked) then
    creat_ping(StrToInt(Edit13.Text)) //建立线程
  else
  begin
    tree_ping.Items.Clear;Edit9.Text:='0';
    creat_ping(StrToInt(Edit13.Text)); //建立线程
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  osvi : TOSVersionInfo ;
  bOsVersionInfoEx : boolean;
  GInitData : TWSAData;
begin
//系统检测
  init_frmMain;//初始数据
  Edit35.Text:=IntToStr(ComponentCount);
  Application.OnException:=my_Exception;

  ZeroMemory(@osvi, sizeof(TOSVersionInfo));
  osvi.dwOSVersionInfoSize := sizeof(TOSVersionInfo);
   if( not (bOsVersionInfoEx = GetVersionEx(TOSVersionInfo(osvi)) ) ) then
   begin
      osvi.dwOSVersionInfoSize := sizeof (TOSVersionInfo);
      if (not GetVersionEx(TOSVersionInfo(osvi)) )then
         exit;
   end;
   case (osvi.dwPlatformId) of
     VER_PLATFORM_WIN32_NT:
         begin
           if ( osvi.dwMajorVersion <= 4 ) then Version:=40;//是nt4.0
           if ( osvi.dwMajorVersion = 5 ) then Version:=2000;//windows2000
         end;
     VER_PLATFORM_WIN32_WINDOWS:
        begin
          if ((osvi.dwMajorVersion > 4) or
            ((osvi.dwMajorVersion = 4) and (osvi.dwMinorVersion > 0))) then
            Version:=98//是widnows98
           else Version:=95;//是 Windows 95
        end;
     VER_PLATFORM_WIN32s:
            Version:=32;//"Microsoft Win32;
   end;

  ping_CriticalSection:= TCriticalSection.Create;//全局临界变量

 if (WSAStartup(101,GInitData)<>0) then
    ShowMessage('初始化SOCKET函数失败!');

  port_lists:= TStringList.Create;
  main_list:= TStringList.Create;

end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  save_frmMain;//保存数据
  ado_q.Close;ado_pub.Close;
  port_lists.Free;
  main_list.Free;
  ping_CriticalSection.Free;

end;

procedure TfrmMain.share_checkClick(Sender: TObject);
begin
 BitBtn4.Enabled:= not share_check.Checked;
 frmMain.BitBtn5.Enabled:=not share_check.Checked;

end;

procedure TfrmMain.BitBtn4Click(Sender: TObject);
var
  no : integer;
begin
  no:=StrToInt(Edit15.Text);
  share_ip_no:=0;
  share_thread_no:=0;
  Edit10.Text:='0';
  thread_run:=true;
  frmMain.BitBtn4.Enabled:=false;
  frmMain.BitBtn5.Enabled:=false;
  if (do_select) then//若只对选择工作,则一个线程足已
  begin
    creat_share;
  end else begin
    while (no>0)do
    begin
       creat_share;
       no := no -1 ;
    end;
  end;

end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
 (TMemo(memo_m.PopupComponent)).Clear;
// tree_share.Items.Clear;

end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
 (TTreeView(share_tree_m.PopupComponent)).FullExpand;

end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
 (TTreeView(share_tree_m.PopupComponent)).FullCollapse;

end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
 if ( not (check_ip(Edit1.Text)and check_ip(Edit2.Text))) then
     exit;//检查IP是否合法
  ping_ip_start:=strtoip(Edit1.Text);
  ping_ip_stop:=strtoip(Edit2.Text);

  thread_run:=true;
  thread_type:=10;//1代表是端口扫描的线程

  if (not (CheckBox6.Checked)) then
  begin
    scan_ip.Text:='';scan_edit2.Text:='0';scan_edit3.Text:='0';
    scan_edit4.Text:='0';
    Tree_port.Items.Clear;
  end;
  creat_scan_ping(StrToInt(Edit13.Text)); //建立线程

end;

procedure TfrmMain.CheckBox1Click(Sender: TObject);
begin
  only_ping:=CheckBox1.Checked;
end;

procedure TfrmMain.CheckBox2Click(Sender: TObject);
begin
 lookup_name:=CheckBox2.Checked;
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
var
  i : integer;
  temp : boolean;
  str : String;
begin
 if (open_port.Execute) then
  begin
   port_lists.LoadFromFile(open_port.FileName);
   port_list.Items.Clear;
   for i:=0 to port_lists.Count-1 do
   begin
     str := port_lists.Strings[i];
     temp:=(str[1]='+');
     Delete(str,1,2);
     port_list.Items.Add(Trim(str));
     port_list.Checked[i]:=temp;
   end;
   port_lists.Clear;
  end;
end;

procedure TfrmMain.BitBtn3Click(Sender: TObject);
var
  i : integer;
begin
 if (save_port.Execute) then
  begin
   port_lists.Clear;
   for i:=0 to port_list.Items.Count-1 do
   begin
     if (port_list.Checked[i]) then
       port_lists.Add('+,'+port_list.Items.Strings[i])
      else
       port_lists.Add('-,'+port_list.Items.Strings[i]);
   end;
   port_lists.SaveToFile(save_port.FileName);
   port_lists.Clear;
  end;
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
var
  i : integer;
begin
  for i:=0 to port_list.Items.Count-1 do
  begin
     port_list.Checked[i]:=false;
  end;

end;

procedure TfrmMain.BitBtn8Click(Sender: TObject);
var
  i : integer;
begin
  for i:=0 to port_list.Items.Count-1 do
  begin
    port_list.Checked[i]:=true;
  end;   
end;

procedure TfrmMain.Button18Click(Sender: TObject);
begin
  if (Button18.Caption = '连接') then
  begin
    ado_pub.Close;
    ado_pub.ConnectionString:='Provider=SQLOLEDB;Password='+Edit31.Text
              +';Persist Security Info=True;User ID='+Edit30.Text
              +';Initial Catalog=master;Data Source='+Edit29.Text;
    ado_pub.Open;
 end else ado_pub.Close;

end;

procedure TfrmMain.ado_qAfterOpen(DataSet: TDataSet);
begin
 sql_cmd.Lines.Add('shell:\'+Edit32.Text);
 DataSet.First;
 while (not (DataSet.Eof))do
  begin
   sql_cmd.Lines.Add(DataSet.FieldByName('output').AsString);
   DataSet.Next;
  end;
 sql_cmd.Lines.Add('操作完成');

end;

procedure TfrmMain.BitBtn9Click(Sender: TObject);
begin
 ado_q.Close;
 ado_q.SQL.Text:='exec xp_cmdshell ''+Edit32.Text+''';
 ado_q.Open;

end;

procedure TfrmMain.ado_pubAfterConnect(Sender: TObject);
begin
 sql_cmd.Lines.Add('user:'+Edit30.Text+' Pass:'+Edit31.Text+' ->已连接成功!');
 Button18.Caption:='断开';

end;

procedure TfrmMain.ado_pubBeforeConnect(Sender: TObject);
begin
 sql_cmd.Lines.Add('正在连接...请稍等!');

end;

procedure TfrmMain.ado_pubAfterDisconnect(Sender: TObject);
begin
 sql_cmd.Lines.Add('连接已断开!');
 Button18.Caption:='连接';

end;

procedure TfrmMain.Edit32KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=13) then
  begin
    Edit32.Items.Add(Edit32.Text);
    BitBtn9Click(nil);
    Edit32.SelectAll;
  end;

end;

procedure TfrmMain.my_Exception(Sender: TObject; E: Exception);
begin
  Application.MessageBox(pchar(E.Message),'洗碗虫',0);
end;

procedure TfrmMain.Button13Click(Sender: TObject);
begin
  frmDict.Show;
end;

procedure TfrmMain.Button8Click(Sender: TObject);
begin
  if (not(check_ip(Edit17.Text)and check_ip(Edit18.Text))) then
     exit;//检查IP是否合法
  ping_ip_start:=strtoip(Edit17.Text);
  ping_ip_stop:=strtoip(Edit18.Text);

  Bar.Max:=ping_ip_stop-ping_ip_start;
  thread_run:=true;

  if (CheckBox4.Checked) then
    creat_sql_ping(StrToInt(Edit26.Text)) //建立线程
  else
  begin
    ListBox2.Items.Clear;Edit24.Text:='0';Edit21.Text:='0';
    creat_sql_ping(StrToInt(Edit26.Text)); //建立线程
  end;

end;

procedure TfrmMain.sql_cmdDblClick(Sender: TObject);
begin
  if (sql_cmd.Left<>3) then
  begin
    sql_cmd.Left:=3;
    sql_cmd.Width:=550;
    Edit32.Left:=3;
    Edit32.Width:=524;
  end else
  begin
    sql_cmd.Left:=261;
    sql_cmd.Width:=292;
    Edit32.Left:=261;
    Edit32.Width:=267;
  end;

end;

procedure TfrmMain.ListBox2DblClick(Sender: TObject);
begin
  Edit29.Text:=ListBox2.Items.Strings[ListBox2.ItemIndex];

end;

procedure TfrmMain.ListBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clip_text : TClipboard;
begin
  clip_text := TClipboard.Create;
  if ((Key=67) and (ssCtrl in Shift))then
  begin
    clip_text.AsText:=(TListBox(Sender)).Items.Strings[ListBox2.ItemIndex];
  end;
  if ((Key=86) and (ssCtrl in Shift)) then
  begin
    (TListBox(Sender)).Items.Add(clip_text.AsText);
  end;
  clip_text.Free;
end;

procedure TfrmMain.N9Click(Sender: TObject);
begin
  if (save_port.Execute) then
  begin
    (TMemo(memo_m.PopupComponent)).Lines.SaveToFile(save_port.FileName);
  end

end;

procedure TfrmMain.MenuItem5Click(Sender: TObject);
begin
  if (open_port.Execute) then
  begin
    (TTreeView(share_tree_m.PopupComponent)).LoadFromFile(open_port.FileName);
  end

end;

procedure TfrmMain.N5Click(Sender: TObject);
begin
  if (save_port.Execute) then
  begin
    (TListBox(listbox_m.PopupComponent)).Items.SaveToFile(save_port.FileName);
  end
end;

procedure TfrmMain.N6Click(Sender: TObject);
begin
  if (open_port.Execute) then
  begin
    (TListBox(listbox_m.PopupComponent)).Items.LoadFromFile(open_port.FileName);
  end
end;

procedure TfrmMain.MenuItem4Click(Sender: TObject);
begin
  if (save_port.Execute) then
  begin
    (TTreeView(share_tree_m.PopupComponent)).SaveToFile(save_port.FileName);
  end
end;

procedure TfrmMain.N10Click(Sender: TObject);
begin
  if (open_port.Execute) then
  begin
    (TMemo(memo_m.PopupComponent)).Lines.LoadFromFile(open_port.FileName);
  end
end;

procedure TfrmMain.MenuItem7Click(Sender: TObject);
begin
 (TTreeView(share_tree_m.PopupComponent)).Items.Clear;

end;

procedure TfrmMain.tree_shareDblClick(Sender: TObject);
begin
  if (PageControl2.Left<>3) then
  begin
    PageControl2.Left:=3;
    PageControl2.Width:=550;
  end else
  begin
    PageControl2.Left:=280;
    PageControl2.Width:=270;
  end
end;

procedure TfrmMain.check_systemClick(Sender: TObject);
begin
  lookup_system:=check_system.Checked;//查找系统信息
end;

procedure TfrmMain.check_ServicesClick(Sender: TObject);
begin
  lookup_Services:=check_Services.Checked;//查找系统信息
end;

procedure TfrmMain.check_userClick(Sender: TObject);
begin
  lookup_user:=check_user.Checked;//查找用户信息
end;

procedure TfrmMain.BitBtn6Click(Sender: TObject);
begin
  thread_run:=false;
end;

procedure TfrmMain.BitBtn5Click(Sender: TObject);
begin
  do_select:=true;
  BitBtn4Click(nil);
end;

procedure TfrmMain.Button3Click(Sender: TObject);
var
  i : integer;
begin
  if ((share_thread_no<>0)or(ping_thread_no<>0)or(scan_thread_no<>0)) then
  begin
    ShowMessage('目前有线程在运行,不能继续');
    exit;
  end;

  cur_ip:=0;
  scan_port_ip:=0;
  share_ip_no:=0;

//取IP地址
  main_list.Clear;
  if (do_select) then
  begin
    if Assigned(tree_ping.Selected) then
       main_list.Add(tree_ping.Selected.Text);

  end else
  begin
    for i:=0 to frmMain.tree_ping.Items.Count-1 do
    begin
      main_list.Add(tree_ping.Items.Item[i].Text);
    end;
  end;
  do_select:=false;
  if (main_list.Count=0) then
  begin
    ShowMessage('没有可检测的IP地址!不能继续');
    exit;
  end;
//用户
  if (frmDict.user_list.Lines.Count=0) then
  begin
    frmDict.user_list.Lines.Add('Administrator');
  end;

//密码列表
  port_lists.Clear;
  port_lists.AddStrings(frmDict.pass_list.Lines);
  port_lists.Insert(0,'');
  frmReport.Show; //弹出结果窗体
  frmReport.Edit9.Text:='0';
  frmReport.Edit1.Text:='0';
  i:=StrToInt(Edit15.Text);
  thread_run:=true;
  while (i>0) do
  begin
    if (share_thread_no<main_list.Count) then
       creat_share_pass;
    i := i -1;
  end;

end;

procedure TfrmMain.Button5Click(Sender: TObject);
begin
 do_select:=true;
 Button3Click(nil);
end;

procedure TfrmMain.Button10Click(Sender: TObject);
var
  i : integer;
begin
  i:=0;
  if ((share_thread_no<>0)or(ping_thread_no<>0)or(scan_thread_no<>0)) then
  begin
   ShowMessage('目前有线程在运行,不能继续');
   exit;
  end;

 cur_ip:=0; scan_port_ip:=0; share_ip_no:=0;

//取IP地址
  main_list.Clear;
  if (do_select) then
  begin
    for i:=0 to frmMain.ListBox2.Items.Count-1 do
      if (ListBox2.Selected[i])then
        main_list.Add(frmMain.ListBox2.Items.Strings[i]);
  end
  else
  begin
    main_list.AddStrings(frmMain.ListBox2.Items);
  end;
  do_select:=false;
  if (main_list.Count=0) then
  begin
    ShowMessage('没有可检测的IP地址!不能继续');
    exit;
  end;
//用户
  if (frmDict.user_list.Lines.Count=0) then
  begin
    frmDict.user_list.Lines.Add('sa');
  end;

//密码列表
  port_lists.Clear;
  port_lists.AddStrings(frmDict.pass_list.Lines);
  port_lists.Insert(0,'');
  frmReport.Show; //弹出结果窗体
  frmReport.Edit9.Text:='0';
  frmReport.Edit1.Text:='0';
  i:=StrToInt(Edit33.Text);//端口线程
  thread_run:=true;
  thread_type:=100;//100代表是检测sql密码的线程
  while (i>0)do
  begin
    creat_sql_pass;
    i := i -1;
  end;

end;

procedure TfrmMain.Button12Click(Sender: TObject);
begin
  do_select:=true;
  Button10Click(nil);

end;

procedure TfrmMain.ado_pubConnectComplete(Connection: TADOConnection;
  const Error: Error; var EventStatus: TEventStatus);
begin
 sql_cmd.Lines.Add(Error.Description);
end;

procedure TfrmMain.BitBtn7Click(Sender: TObject);
var
  i, len : integer;
begin
  if ((share_thread_no<>0)or(ping_thread_no<>0)or(scan_thread_no<>0)) then
  begin
    ShowMessage('目前有线程在运行,不能转换');
    exit;
  end;

  i:=0;

  case (PageControl2.ActivePageIndex)of
    0 :for i:=0 to tree_share.Items.Count-1 do
       begin
         if (tree_share.Items.Item[i].Level=0)then
         begin
           tree_ping.Items.Add(nil,tree_share.Items.Item[i].Text);
           Edit9.Text:=IntToStr(StrToInt(Edit9.Text)+1);
         end;
       end;
    1 : for i:=0 to share_user.Items.Count-1 do
       begin
         if (share_user.Items.Item[i].Level=0) then
         begin
           tree_ping.Items.Add(nil,share_user.Items.Item[i].Text);
           Edit9.Text:=IntToStr(StrToInt(Edit9.Text)+1);
         end;
       end;
    2 :for i:=0 to share_svr.Items.Count-1 do
       begin
         if (share_svr.Items.Item[i].Level=0)then
         begin
           tree_ping.Items.Add(nil,share_svr.Items.Item[i].Text);
           Edit9.Text:=IntToStr(StrToInt(Edit9.Text)+1);
         end;
       end;
    4 :for i:=0 to share_system.Items.Count-1 do
       begin
         if (share_system.Items.Item[i].Level=0)then
         begin
           tree_ping.Items.Add(nil,share_system.Items.Item[i].Text);
           Edit9.Text:=IntToStr(StrToInt(Edit9.Text)+1);
         end;
       end;
  end;
end;

procedure TfrmMain.Button6Click(Sender: TObject);
begin
// frmReport.Show; //弹出结果窗体
  if tree_ping.Items.Count > 0 then
    frmSpec.edtAddr.Text := tree_ping.Items.Item[0].Text
  else frmSpec.edtAddr.Text := Edit5.Text;

  frmSpec.ShowModal;
end;

procedure TfrmMain.TabSheet4Show(Sender: TObject);
begin
  Timer1.Enabled:=true;
end;

procedure TfrmMain.TabSheet4Hide(Sender: TObject);
begin
 Timer1.Enabled:=false;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
 Edit34.Text:=IntToStr(ComponentCount);
end;

procedure TfrmMain.thread_timeTimer(Sender: TObject);
var
  i : integer;
begin
  thread_time.Enabled := false;
  if not (thread_run) then exit;
  case (thread_type) of
    10: begin
         i:=StrToInt(Edit26.Text) - scan_thread_no;//端口线程
         creat_scan_port(i);
        end;
    100: begin
           i:=StrToInt(Edit33.Text)-share_thread_no;//100代表是检测sql密码的线程
           while (i>0) do begin
             if (cur_ip<main_list.Count) then
             begin
               creat_sql_pass;
               i := i -1;
              end
             else exit;
           end;
        end;
    110: begin
           creat_pop3_detect;//110代表是检测POP3的线程
        end;
  end;
end;

procedure TfrmMain.BitBtn11Click(Sender: TObject);
begin
  Edit35.Text:=IntToStr(ComponentCount);
end;

procedure TfrmMain.share_conClick(Sender: TObject);
var
  SelNode : TTreeNode;
  str : AnsiString;
begin
  SelNode :=(TTreeView(share_tree_m.PopupComponent)).Selected;
  if (SelNode=nil) then exit;
  if (SelNode.Level<>0)then
    SelNode := SelNode.Parent;

  str:='explorer.exe \\\\'+SelNode.Text;

  WinExec(pchar(str),SW_SHOW);
end;

procedure TfrmMain.Tree_portKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clip_text : TClipboard;
begin
  clip_text:= TClipboard.Create;

 if ((Key=67)and ( ssCtrl in Shift)) then
  begin
    clip_text.AsText:=(TTreeView(Sender)).Selected.Text;
  end;
 if ((Key=86)and (ssCtrl in Shift)) then
  begin
   if ((TTreeView(Sender)).Selected<>nil) then
      (TTreeView(Sender)).Items.AddChild((TTreeView(Sender)).Selected,clip_text.AsText)      
    else
      (TTreeView(Sender)).Items.Add(nil,clip_text.AsText);
  end;
  clip_text.Free;
end;

procedure TfrmMain.TabSheet1Show(Sender: TObject);
begin
  share_con.Visible:=false;
end;

procedure TfrmMain.TabSheet1Hide(Sender: TObject);
begin
  share_con.Visible:=true;
end;

procedure TfrmMain.Button9Click(Sender: TObject);
begin
 if (not (check_ip(Edit36.Text)and check_ip(Edit37.Text)))then
     exit;//检查IP是否合法
  ping_ip_start:=strtoip(Edit36.Text);
  ping_ip_stop:=strtoip(Edit37.Text);

  Bar.Max:=ping_ip_stop-ping_ip_start;
  thread_run:=true;
  thread_type:=110;//110代表是检测POP3的线程
  main_list.Clear;//即时取用户与密码列表
  main_list.AddStrings(frmDict.user_list.Lines);
  port_lists.Clear;//即时取用户与密码列表
  port_lists.AddStrings(frmDict.pass_list.Lines);
  if (pop3_auto.Checked) then//自动查找
  begin
    share_thread_no:=0;//detect线程数量
    share_ip_no:=0;//detect_ip的位置指示
    scan_thread_no:=0;//detect_user位置指示
    scan_port_no:=0;//detect_Pass当前的端口号
    Edit46.Text:='0';Edit41.Text:='0';
    pass_no:=0;
  end;
  cur_ip:=0;
  if (CheckBox8.Checked) then
     creat_pop3_scan(StrToInt(Edit45.Text)) //建立线程
   else
   begin
     pop3_list.Items.Clear;Edit42.Text:='0';Edit40.Text:='0';
     creat_pop3_scan(StrToInt(Edit45.Text)); //建立线程
   end;
end;

procedure TfrmMain.BitBtn12Click(Sender: TObject);
begin
  share_thread_no:=0;//detect线程数量
  share_ip_no:=0;//detect_ip的位置指示
  scan_port_ip:=0;//detect_user位置指示
  scan_port_no:=0;//detect_Pass当前的端口号
  Edit46.Text:='0';Edit41.Text:='0';
  pass_no:=0;
  thread_run:=true;
  do_select:=false;
  main_list.Clear;
  main_list.AddStrings(frmDict.user_list.Lines);
  port_lists.Clear;
  port_lists.AddStrings(frmDict.pass_list.Lines);

  Bar.Max:=main_list.Count*port_lists.Count*pop3_list.Items.Count;
  creat_pop3_detect;
end;

procedure TfrmMain.pop3_autoClick(Sender: TObject);
begin
 BitBtn12.Enabled:= not pop3_auto.Checked;
 BitBtn16.Enabled:= not pop3_auto.Checked;
end;

procedure TfrmMain.BitBtn16Click(Sender: TObject);
begin
  share_thread_no:=0;//detect线程数量
  share_ip_no:=0;//detect_ip的位置指示
  scan_port_ip:=0;//detect_user位置指示
  scan_port_no:=0;//detect_Pass当前的端口号
  Edit46.Text:='0';Edit41.Text:='0';
  pass_no:=0;
  thread_run:=true;
  do_select:=true;
  main_list.Clear;
  main_list.AddStrings(frmDict.user_list.Lines);

  port_lists.Clear;
  port_lists.AddStrings(frmDict.pass_list.Lines);

  Bar.Max:=main_list.Count*port_lists.Count;
  creat_pop3_detect;
end;

procedure TfrmMain.BitBtn13Click(Sender: TObject);
begin
  if (pop3_list.Items.IndexOf(new_pop3.Text)=-1)then
  begin
    pop3_list.Items.Add(new_pop3.Text);
    new_pop3.SelectAll;
  end;
end;

procedure TfrmMain.pop3_infoDblClick(Sender: TObject);
begin
 if (PageControl3.Left<>3)then
  begin
   PageControl3.Left:=3;
   PageControl3.Width:=550;
  end else
  begin
   PageControl3.Left:=259;
   PageControl3.Width:=298;
  end;
end;

procedure TfrmMain.N8Click(Sender: TObject);
begin
 (TListBox(listbox_m.PopupComponent)).Items.Clear;
end;

procedure TfrmMain.Button11Click(Sender: TObject);
begin
   RichEdit1.Clear;
   case rgTools.ItemIndex of
      0:  RunDosCommand('ping.exe ' + edParameter.Text, RichEdit1.Lines);
      1:  RunDosCommand('tracert.exe ' + edParameter.Text, RichEdit1.Lines);
      2:  RunDosCommand('ipconfig.exe ', RichEdit1.Lines);
      3:  RunDosCommand('net.exe view ', RichEdit1.Lines);
      4:  RunDosCommand('route.exe print ', RichEdit1.Lines);
      5:  RunDosCommand('netstat.exe ', RichEdit1.Lines);
      6:  RunDosCommand('net config server ', RichEdit1.Lines);
      7:  RunDosCommand('nbtstat ' + edParameter.Text, RichEdit1.Lines);
      8:  RunDosCommand('cmd.exe /K '+ edParameter.Text, RichEdit1.Lines);
   end;
end;

procedure TfrmMain.edParameterKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Button11Click(self);
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  Edit48.Text := LookupName(Edit49.Text);
end;

procedure TfrmMain.SpeedButton2Click(Sender: TObject);
begin
  Edit49.Text := gethostbyip(Edit48.Text);
end;

end.

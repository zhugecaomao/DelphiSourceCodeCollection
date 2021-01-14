unit Chain_Server_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,shellapi, StdCtrls, Menus;
const
  WM_WZGLNOTIFY = WM_USER + 199;  //自定义消息
  strNotifyTip = '◆数据应用服务器◆';
  ID_MAIN = 199;
  const
  CM_RESTORE = WM_USER + $1000; {自定义的“恢复”消息}
  WZGL_APP_NAME = 'Manager_System';
type
  Tfrm_Chain_Server_Main = class(TForm)
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    Show1: TMenuItem;
    N1: TMenuItem;
    About1: TMenuItem;
    N2: TMenuItem;
    Close1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Show1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);


  private
     {Private declarations }
      nid:NOTIFYICONDATA;
     cancels:boolean;
     FpNotify : PNotifyIconDataA;
     Index:Integer;
    function AddIcon(hwnd: HWND): Boolean; //在状态区添加图标
    function RemoveIcon(hwnd: HWND): Boolean; //从状态区移去图标
    procedure Notify(var Msg: TMessage); message WM_WZGLNOTIFY; //自定义消息处理函数
    procedure minimize(sender: Tobject); //定义最小化过程，赋给Application.OnMinimize
    procedure RestoreRequest(var message: TMessage); message CM_RESTORE;
  public
    { Public declarations }
  end;

var
  frm_Chain_Server_Main: Tfrm_Chain_Server_Main;
  IconData: TNotifyIconData;
  tags:boolean;

implementation

uses Unitzc, Chain_Data, UBook;

{$R *.dfm}

///////////////自定义函数/////////////////////////////////
////////////////////////////////////////{处理“恢复”消息}

procedure Tfrm_Chain_Server_Main.RestoreRequest(var message: TMessage);
begin
  if IsIconic(Application.Handle) = True then  //窗体是否最小化
    Application.Restore  //恢复窗体
  else
    Application.BringToFront; //提到前面显示
end;
//在状态区添加图标
function Tfrm_Chain_Server_Main.AddIcon(hwnd: HWND): Boolean;
begin
  nid.cbSize := sizeof(NOTIFYICONDATA);
  nid.Wnd := hwnd;
  nid.uID := iD_MAIN;
  nid.uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;
  nid.uCallbackMessage := WM_WZGLNOTIFY;
  nid.hIcon := LoadIcon(hInstance, 'MAINICON');
  strCopy(nid.szTip, strNotifyTip);
  AddIcon := Shell_NotifyIcon(NIM_ADD, @nid);
end;

//从状态区移去图标
function Tfrm_Chain_Server_Main.RemoveIcon(hwnd: HWND): Boolean;
var
  nid: NOTIFYICONDATA;
begin
  nid.cbSize := sizeof(NOTIFYICONDATA);
  nid.Wnd := hwnd;
  nid.uID := iD_MAIN ;
  nid.uFlags := 0;
  RemoveIcon := Shell_NotifyIcon(NIM_DELETE, @nid);
end;

//自定义消息处理函数
procedure Tfrm_Chain_Server_Main.Notify(var Msg: TMessage);
var
  Pt: TPoint;
begin
  case msg.LParam of
    WM_RBUTTONDOWN:    //当点击右键时,弹出快捷菜单
      begin
        SetForeGroundWindow(nid.wnd);
        GetCursorPos(Pt);
        Popupmenu1.Popup(pt.x, pt.y);
      end;
  end;
end;

//定义最小化过程，赋给Application.OnMinimize;
procedure tfrm_Chain_Server_Main.minimize(sender: Tobject);
begin
  AddIcon(handle);
  ShowWindow(Application.handle, sw_hide);
end;

//******************************************************************************
procedure Tfrm_Chain_Server_Main.FormCreate(Sender: TObject);
begin
  application.OnMinimize:=minimize;
end;

procedure Tfrm_Chain_Server_Main.Show1Click(Sender: TObject);
begin
    RemoveIcon(handle);
  self.WindowState:=wsNormal;
  ShowWindow(Application.handle, SW_SHOWNORMAL);
end;

procedure Tfrm_Chain_Server_Main.Close1Click(Sender: TObject);
begin
  cancels:=true;
  RemoveIcon(handle);
  application.Terminate;
end;

procedure Tfrm_Chain_Server_Main.FormShow(Sender: TObject);
begin
  cancels:=false;
end;

procedure Tfrm_Chain_Server_Main.About1Click(Sender: TObject);
begin
  Application.MessageBox('［连锁管理系统］由问鼎科技研制！'+#13#10+'服务器模块，请勿关闭！','［连锁管理系统］',mb_ok);
end;

procedure Tfrm_Chain_Server_Main.N3Click(Sender: TObject);
begin
  Formzc:=TFormzc.create(self);
  Formzc.ShowModal;
  Formzc.Free;
end;

procedure Tfrm_Chain_Server_Main.N4Click(Sender: TObject);
begin
  if not frm_Chain_Data.ADOConnMaster.Connected then
  begin
    application.MessageBox(pchar('尚未连接数据库，请先完成数据库连接！'),pchar(application.Title),mb_iconinformation);
    exit;
  end;
  FmBook:=tFmBook.Create(self);
  FmBook.ShowModal;
  FmBook.Free;
end;

procedure Tfrm_Chain_Server_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tfrm_Chain_Server_Main.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   canclose:=cancels;
  if not canclose then application.Minimize;
end;

end.

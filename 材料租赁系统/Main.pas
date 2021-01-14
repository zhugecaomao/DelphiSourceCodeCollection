unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, DB, ADODB, mxOutlookBarPro, StdCtrls, ExtCtrls,
  Buttons, ComCtrls, ToolWin, jpeg, shellapi;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ADOConnect: TADOConnection;
    PrinterSetup: TPrinterSetupDialog;
    Image1: TImage;
    il1: TImageList;
    il4: TImageList;
    il3: TImageList;
    il2: TImageList;
    ImageListmenu: TImageList;
    ImageList4: TImageList;
    ImageTools: TImageList;
    ImageList2: TImageList;
    clb1: TCoolBar;
    tlb1: TToolBar;
    tbtn3: TToolButton;
    tbtn2: TToolButton;
    tbtnXGMM: TToolButton;
    tbSound: TToolButton;
    tlb2: TToolBar;
    tbtn16: TToolButton;
    tbtnclose: TToolButton;
    tbtn15: TToolButton;
    btnTree: TSpeedButton;
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    pnl3: TPanel;
    sb1: TSpeedButton;
    mxOutlookBarPro: TmxOutlookBarPro;
    StatusBar1: TStatusBar;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    adoqytmp: TADOQuery;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    pShwomessage: TPanel;
    adoRep: TADOQuery;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbtncloseClick(Sender: TObject);
    procedure btnTreeClick(Sender: TObject);
    procedure sb1Click(Sender: TObject);
    procedure mxOutlookBarProHeaders4Buttons1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure mxOutlookBarProHeaders0Buttons5Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
  private
   procedure DoEnterAsTab(var Msg: TMsg; var Handled: Boolean);
    { Private declarations }
   procedure CloseAll;
  public

    { Public declarations }
      bConnect:boolean;
      Year,Month,Day:word;
  end;

var
  frmMain: TfrmMain;

implementation
    uses common,U_Public,DBConnectFrm,U_DM,U_dwinfo,U_bmbm,U_User,u_dlck,u_xgmm
         ,u_Spbm,U_clffd,u_Zlflr,u_Clhsd,u_clcx,U_clffd_sort,u_Jsmx,Usltz,Ujetz
         ,utLeasehold;
{$R *.dfm}
//关闭子窗口
procedure TfrmMain.CloseAll;
var
  i:integer;
begin
  for i:=0 to MDIChildCount-1  do
    begin
       MDIChildren[i].Close;
    end;
end;
//  转换TAB
procedure Tfrmmain.DoEnterAsTab(var Msg: TMsg; var Handled: Boolean);
begin
  if Msg.Message = WM_KEYDOWN then
  begin
    if Msg.wParam = VK_RETURN then
      Keybd_event(VK_TAB, 0, 0, 0);
  end; //if      Application.OnMessage := DoEnterAsTab;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if application.MessageBox('真的要退出本系统吗?！','材料租赁系统!',MB_YESNO)=IDYES then
     begin
      if bConnect then
         CanClose:=True;
 //        dbconnect.Close ;
     end
   else
      CanClose:=False;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TfrmMain.tbtncloseClick(Sender: TObject);
begin
close;
end;

procedure TfrmMain.btnTreeClick(Sender: TObject);
begin
Pnl1.Visible := btnTree.Down;
end;

procedure TfrmMain.sb1Click(Sender: TObject);
begin
  btnTree.Down := false;
  Pnl1.Visible := btnTree.Down;
end;

procedure TfrmMain.mxOutlookBarProHeaders4Buttons1Click(Sender: TObject);
begin
PrinterSetup.Execute ;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  Datapath:string;
  serverName, databaseName, userName, password: string;
begin
//Provider=SQLOLEDB.1;Password=ccponline;Persist Security Info=True;User ID=sa;Initial Catalog=CLZL;Data Source=CCPSEVER;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=CCPSEVER;Use Encryption for Data=False;Tag with column collation when possible=False
  readFromIni(serverName, databaseName, userName, password);//读取配置文件
 if not ConnectLocalDB(ADOConnect,databaseName,serverName,userName, password) then
    if not DBConnectExecute(TfrmDBConnect) then
      Application.Terminate;  //如果连接不成功，退出应用程序
if not LoginExecute(TfrmLogin) then //如果身份验证无效，就退出系统
    Application.Terminate;
width:=800;
height:=600;
Datapath :=ExtractFilePath(ParamStr(0));
ShortDateFormat:='YYYY/MM/DD';
longdateformat:='YYYY/MM/DD';
DATESEPARATOR:='/';
Application.OnMessage := DoEnterAsTab;
DecodeDate(date,Year,Month,Day);
end;

procedure TfrmMain.N5Click(Sender: TObject);
begin
ShowModalForm(TfrmDwinfo);
end;

procedure TfrmMain.N6Click(Sender: TObject);
var
frmBmda:TfrmBmda;
begin
CloseAll;
screen.Cursor := crHourGlass;
frmBmda:=TfrmBmda.Create(self);
frmBmda.show;
screen.Cursor := crDefault;

end;

procedure TfrmMain.N19Click(Sender: TObject);
begin
ShowModalForm(TfrmUse);
end;

procedure TfrmMain.N21Click(Sender: TObject);
begin
ShowModalForm(TfrmXgmm);
end;

procedure TfrmMain.N12Click(Sender: TObject);
var
frmSpbm:TfrmSpbm;
begin
CloseAll;
screen.Cursor := crHourGlass;
frmSpbm:=TfrmSpbm.Create(self);
frmSpbm.show;
screen.Cursor := crDefault;
end;

procedure TfrmMain.N8Click(Sender: TObject);
var
  frmclffd_sort:Tfrmclffd_sort;
begin
screen.Cursor := crHourGlass;
CloseAll;
CurrentParam.Num :=0;
frmclffd_sort:=Tfrmclffd_sort.Create(self);
frmclffd_sort.Show ;
screen.Cursor := crDefault;
//ShowModalForm(Tfrmclffd_sort);
//ShowModalForm(TfrmClffd);
end;

procedure TfrmMain.mxOutlookBarProHeaders0Buttons5Click(Sender: TObject);
var
frmZlflr:TfrmZlflr;
begin
screen.Cursor := crHourGlass;
frmZlflr:=TfrmZlflr.Create(self);
frmZlflr.show;
//screen.Cursor := crHourGlass;
screen.Cursor := crDefault;

//ShowModalForm(TfrmZlflr);
end;

procedure TfrmMain.N10Click(Sender: TObject);
var
  frmclffd_sort:Tfrmclffd_sort;
begin
CloseAll;
CurrentParam.Num :=1;
frmclffd_sort:=Tfrmclffd_sort.Create(self);
frmclffd_sort.Show ;
//ShowModalForm(Tfrmclffd_sort);
//ShowModalForm(TfrmClhsd);
end;

procedure TfrmMain.N13Click(Sender: TObject);
//var
//frmclcx:Tfrmclcx;
begin
{screen.Cursor := crHourGlass;
frmclcx:=Tfrmclcx.Create(self);
frmclcx.show;
screen.Cursor := crDefault; }
ShowModalForm(Tfrmclcx);
end;

procedure TfrmMain.N26Click(Sender: TObject);
begin
ShellExecute(handle, 'open', 'Calc.exe', nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.N15Click(Sender: TObject);
begin
ShowModalForm(TfrmJsmx );
end;

procedure TfrmMain.N25Click(Sender: TObject);
var
 frmSltz:TfrmSltz;
begin
CloseAll;
screen.Cursor := crHourGlass;
//screen.Cursor := crDefault;
 frmSltz:=TfrmSltz.Create(self);
 frmSltz.Show ;
 screen.Cursor := crDefault;

end;

procedure TfrmMain.N24Click(Sender: TObject);
var
 frmjetz:Tfrmjetz;
begin
CloseAll;
screen.Cursor := crHourGlass;
//screen.Cursor := crDefault;
 frmjetz:=Tfrmjetz.Create(self);
 frmjetz.Show ;
 screen.Cursor := crDefault;
end;

procedure TfrmMain.N23Click(Sender: TObject);
begin
ShellExecute(handle, 'open', 'Ptools.exe', nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.N27Click(Sender: TObject);
var
  sSql:string;
begin
if application.MessageBox('是否要清空所输入的数据?！','材料租赁系统!',MB_YESNO)=IDNO then
exit;
pShwomessage.Caption :='正在清空查询数据，请稍候！......' ;
pShwomessage.Visible :=true;
pShwomessage.Update ;
ADOConnect.BeginTrans;
try
sSql:='DELETE  FROM cljxb';
ExecuteSQL(sSql,adoqytmp,true);
sSql:='DELETE  FROM ggxhb';
ExecuteSQL(sSql,adoqytmp,true);
sSql:='DELETE  FROM sfdj';
ExecuteSQL(sSql,adoqytmp,true);
sSql:='DELETE  FROM sfmx';
ExecuteSQL(sSql,adoqytmp,true);
except
Application.MessageBox('清空数据失败!', '错误', mb_iconInformation + mb_defbutton1);
ADOConnect.RollbackTrans ;
pShwomessage.Visible :=false;
exit;
end;
ADOConnect.CommitTrans ;
Application.MessageBox('数据已被初始完成!', '提示信息', mb_iconInformation + mb_defbutton1);
pShwomessage.Visible :=false;
end;

end.

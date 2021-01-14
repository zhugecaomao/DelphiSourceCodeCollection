unit sfxt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls, ToolWin, ImgList, StdCtrls, Buttons, jpeg;

type
  Tfrm_main = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    X1: TMenuItem;
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
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Image1: TImage;
    StatusBar2: TStatusBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    H1: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    Timer1: TTimer;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    N19: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ToolButton10Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frm_main: Tfrm_main;
  userxm_v,userid_v:string;

implementation

uses chutudan, shoufeidan, tqsfd_u, ctdcx_u, sfdcx_u, about_u, lock, yhgl_u,
  dwxx_u;

{$R *.dfm}

procedure Tfrm_main.BitBtn1Click(Sender: TObject);
begin
  frm_main.N8Click(Sender);
end;

procedure Tfrm_main.BitBtn2Click(Sender: TObject);
begin
  application.CreateForm(ttqsfd,tqsfd);
  tqsfd.ShowModal;
end;

procedure Tfrm_main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if self.ModalResult<>mrok then
  begin
    if Application.MessageBox('请确认是否退出本系统','提示信息',mb_iconquestion+ mb_YesNo)=id_yes then
       application.Terminate
    else
       canclose:=false;
  end;
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
begin
  statusbar2.panels[1].Text:=statusbar2.panels[1].Text+userxm_v;
  statusbar2.panels[2].Text:=statusbar2.panels[2].Text+datetimetostr(date);
end;

procedure Tfrm_main.N12Click(Sender: TObject);
begin
  application.CreateForm(tctdcx,ctdcx);
  ctdcx.Show;
end;

procedure Tfrm_main.N13Click(Sender: TObject);
begin
  application.CreateForm(tsfdcx,sfdcx);
  sfdcx.Show;
end;

procedure Tfrm_main.N16Click(Sender: TObject);
begin
  application.CreateForm(tfrm_about,frm_about);
  frm_about.ShowModal;
end;

procedure Tfrm_main.N18Click(Sender: TObject);
begin
  application.CreateForm(tfrm_yhgl,frm_yhgl);
  frm_yhgl.Show;
end;

procedure Tfrm_main.N19Click(Sender: TObject);
begin
  application.CreateForm(tfrm_dwxx,frm_dwxx);
  frm_dwxx.Show;
end;

procedure Tfrm_main.N2Click(Sender: TObject);
begin
  frm_main.ToolButton9Click(Sender);
end;

procedure Tfrm_main.N8Click(Sender: TObject);
begin
  application.CreateForm(tctd,ctd);
  ctd.Show;
end;

procedure Tfrm_main.N9Click(Sender: TObject);
begin
  application.CreateForm(tsfd,sfd);
  sfd.ShowModal;
end;

procedure Tfrm_main.SpeedButton1Click(Sender: TObject);
begin
  frm_main.N8Click(Sender);
end;

procedure Tfrm_main.SpeedButton2Click(Sender: TObject);
begin
  application.CreateForm(ttqsfd,tqsfd);
  tqsfd.ShowModal;
end;

procedure Tfrm_main.Timer1Timer(Sender: TObject);
begin
  if  Assigned(lock_frm)=False then
  begin
    //if findwindow(nil,'用户锁定')=0 then  //窗口没有打开
    lock_frm:=tlock_frm.Create(self);
    lock_frm.ShowModal;
  end;
end;

procedure Tfrm_main.ToolButton10Click(Sender: TObject);
begin
  frm_main.X1Click(sender);
end;

procedure Tfrm_main.ToolButton2Click(Sender: TObject);
begin
  frm_main.SpeedButton1click(sender);
end;

procedure Tfrm_main.ToolButton3Click(Sender: TObject);
begin
  frm_main.BitBtn2Click(Sender);
end;

procedure Tfrm_main.ToolButton4Click(Sender: TObject);
begin
  frm_main.N19Click(Sender);
end;

procedure Tfrm_main.ToolButton6Click(Sender: TObject);
begin
  frm_main.N12click(sender);
end;

procedure Tfrm_main.ToolButton7Click(Sender: TObject);
begin
  frm_main.N13click(sender);
end;

procedure Tfrm_main.ToolButton9Click(Sender: TObject);
begin
  lock_frm:=tlock_frm.Create(self);
  lock_frm.ShowModal;
end;

procedure Tfrm_main.X1Click(Sender: TObject);
begin
  close;
end;

end.

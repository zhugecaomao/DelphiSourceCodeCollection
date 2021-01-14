unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ImgList;

type
  TfrmMain = class(TForm)
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    AAA1: TMenuItem;
    BBB1: TMenuItem;
    CCC1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
  pwCheck,ChangeUser:Boolean; //密码检测,更换用户
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses fLogin;
{$R *.dfm}

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ChangeUser:=false;
  Application.CreateForm(TfrmLogin, frmLogin);
  frmLogin.ShowModal;
  frmLogin.Free;
  if Not pwCheck then
  Application.Terminate;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 messagebeep(0);
 if application.messagebox('请确认是否退出!', '询问', mb_iconinformation + mb_yesno) = IDno then
 abort;
end;

procedure TfrmMain.ToolButton2Click(Sender: TObject);
begin
close;
end;

procedure TfrmMain.ToolButton1Click(Sender: TObject);
begin
 ChangeUser:=True;
 inherited;
 Application.CreateForm(TfrmLogin, frmLogin);
 frmLogin.ShowModal;
 frmLogin.Free;
 if not pwCheck then
 begin
 Application.Terminate;
 end;
end;

end.

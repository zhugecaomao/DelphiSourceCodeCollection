unit Logfrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RzPanel, RzStatus, RzBckgnd, StdCtrls, RzLabel, Mask, RzEdit,
  RzButton, RzForms, RzCmboBx;

type
  TfrmLogin = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzFormShape1: TRzFormShape;
    RzPanel3: TRzPanel;
    RzSeparator1: TRzSeparator;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    edPassword: TRzEdit;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    cbUserID: TRzComboBox;
    RzShapeButton1: TRzShapeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzShapeButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses mainfrm, RegUser;

{$R *.DFM}

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Screen.Cursor :=crDefault;
  Action:=cafree;
end;

procedure TfrmLogin.RzBitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TfrmLogin.RzBitBtn2Click(Sender: TObject);
begin
  hide;
  frmReg:=TfrmReg.Create(application);
  frmReg.ShowModal ;
end;

procedure TfrmLogin.RzBitBtn1Click(Sender: TObject);
begin
  with frmmain,frmmain.c.Socket do
  begin
    MyID:=cbUserID.Text;
    send('L','',cbUserID.Text,edPassword.Text,myHost,myAddress,'','');
    //向服务器发送登录请求
    Screen.Cursor :=crHourGlass;
  end;
end;               

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  if not frmmain.IsSrvStart then
  begin
    frmmain.c.Active :=true;
  end;
  frmmain.RegIni1.ReadSection('UserID',cbUserID.Items);
end;

procedure TfrmLogin.RzShapeButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmLogin.FormDestroy(Sender: TObject);
begin
  frmLogin:=nil;
end;

end.

unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatButtonUnit, TFlatTitlebarUnit, ExtCtrls, TFlatPanelUnit,
  StdCtrls;

type
  TFrmAbout = class(TForm)
    AboutTitle: TFlatTitlebar;
    FlatPanel1: TFlatPanel;
    BtnOk: TFlatButton;
    lblProgramName: TLabel;
    lblVersion: TLabel;
    Shape1: TShape;
    lblZZ: TLabel;
    lblzzz: TLabel;
    lblemail: TLabel;
    Label1: TLabel;
    Shape2: TShape;
    Label2: TLabel;
    lblRegInc: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbout: TFrmAbout;

implementation

uses Main, Reg,global;

{$R *.dfm}

procedure TFrmAbout.FormCreate(Sender: TObject);
begin
AboutTitle.Caption :='关于'+FrmMain.MainTitle.caption;
lblzz.Caption :='欢迎使用';
lblprogramName.Caption :=FrmMain.MainTitle.caption;
lblzzz.Caption:='软件作者：罗祖术';
lblemail.Caption :='Luozs168@163.net';
lblVersion.Caption :=FrmMain.lblVersion.Caption ;
end;

procedure TFrmAbout.BtnOkClick(Sender: TObject);
begin
  close;
end;

procedure TFrmAbout.Label5Click(Sender: TObject);
begin
FrmRegistry.showmodal;
end;

procedure TFrmAbout.FormActivate(Sender: TObject);
begin
  if checkreg=0 then
      lblreginc.Caption :='未注册版本'
      else
        lblreginc.Caption :=tempInc;
end;

end.

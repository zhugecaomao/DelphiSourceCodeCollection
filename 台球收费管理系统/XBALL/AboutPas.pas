unit AboutPas;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, ShellAPI, ComCtrls;
                    
type
  TAboutForm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Bevel1: TBevel;
    Panel2: TPanel;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    EMail: TLabel;
    OKButton: TButton;
    Label4: TLabel;
    procedure EMailMouseEnter(Sender: TObject);
    procedure EMailMouseLeave(Sender: TObject);
    procedure GotoFGP(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.dfm}

uses XedUser;

procedure TAboutForm.EMailMouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Style :=
    TLabel(Sender).Font.Style + [fsUnderLine];
end;

procedure TAboutForm.EMailMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Style :=
    TLabel(Sender).Font.Style - [fsUnderLine];
end;

procedure TAboutForm.GotoFGP(Sender: TObject);
var
  P: PChar;
begin
  if Sender = eMail then
    P := 'MailTo:Fangmin@yeah.Net'
  else
   P := 'http://Fangmins.go.163.com';
  ShellExecute(0, nil,  P, nil, nil, SW_SHOWNORMAL);
end;

procedure TAboutForm.Image1DblClick(Sender: TObject);
begin
  Image1.Picture.SaveToFile('C:\Picture.JPG');
end;

end.

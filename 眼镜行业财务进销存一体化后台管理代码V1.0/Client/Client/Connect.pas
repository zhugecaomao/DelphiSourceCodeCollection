unit Connect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,IniFiles, XPMenu;

type
  Tfrm_Connect = class(TForm)
    GroupBox1: TGroupBox;
    Image1: TImage;
    Panel1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    XPMenu1: TXPMenu;
    LabeledEdit1: TLabeledEdit;
    Label1: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure edt_PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Connect: Tfrm_Connect;
  Flag:integer;
implementation

uses Data, func;

{$R *.dfm}

procedure Tfrm_Connect.btnOkClick(Sender: TObject);
var
    f:TIniFile;
begin
    f:=TIniFile.Create(ExtractFileDir(application.Exename)+'\GD_IP_Config.ini');
    f.WriteString('NetSetting','IP_Address',Decrypt(trim(LabeledEdit1.Text),'luersoft'));
    f.WriteString('NetSetting','server_Guid','{70D825D1-C4AD-4E28-B216-FF5152FF6118}');
    f.WriteString('NetSetting','server_Name','GD_Chain_Server.Easy_Dcom_Server');
    f.Free;
    Close;
end;

procedure Tfrm_Connect.edt_PasswordKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key=#13 then
    begin
        btnok.Click;
    end;
end;

procedure Tfrm_Connect.btnCancelClick(Sender: TObject);
begin
     Close;
end;

procedure Tfrm_Connect.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=cafree;
end;

end.

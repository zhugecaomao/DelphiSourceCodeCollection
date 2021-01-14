unit smtpauth;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TfrmSMTPAuthentication = class(TForm)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    cboAuthType: TComboBox;
    lblAuthenticationType: TLabel;
    edtAccount: TEdit;
    edtPassword: TEdit;
    lbAccount: TLabel;
    lbPassword: TLabel;
    procedure cboAuthTypeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure EnableControls;
  end;

var
  frmSMTPAuthentication: TfrmSMTPAuthentication;

implementation

{$R *.DFM}

{ TfrmSMTPAuthentication }

procedure TfrmSMTPAuthentication.EnableControls;
begin
  edtAccount.Enabled := (cboAuthType.ItemIndex <> 0);
  lbAccount.Enabled := (cboAuthType.ItemIndex <> 0);
  edtPassword.Enabled := (cboAuthType.ItemIndex <> 0);
  lbPassword.Enabled := (cboAuthType.ItemIndex <> 0);
end;

procedure TfrmSMTPAuthentication.cboAuthTypeChange(Sender: TObject);
begin
  EnableControls;
end;

end.

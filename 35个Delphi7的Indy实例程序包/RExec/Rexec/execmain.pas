{-----------------------------------------------------------------------------
 Demo Name: RExec Demo client
 Author:    JP Mugass
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:35:08
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

}

unit execmain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdRemoteCMDClient, IdRexec;

type
  TfrmMainForm = class(TForm)
    edtUserID: TEdit;
    lblUserID: TLabel;
    edtPassword: TEdit;
    lblPassword: TLabel;
    chkStdErr: TCheckBox;
    edtCommand: TEdit;
    lblCommand: TLabel;
    mmoResults: TMemo;
    mmoError: TMemo;
    BitBtn1: TBitBtn;
    lblResults: TLabel;
    IdRexec1: TIdRexec;
    lblError: TLabel;
    edtHost: TEdit;
    lblHost: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainForm: TfrmMainForm;

implementation

{$R *.DFM}

procedure TfrmMainForm.BitBtn1Click(Sender: TObject);
begin
  IdRexec1.UseStdError := chkStdErr.Checked;
  IdRexec1.Host := edtHost.Text;
  IdRexec1.Username := edtUserID.Text;
  IdRexec1.Password := edtPassword.Text;
  mmoResults.Lines.Text := IdRexec1.Execute(edtCommand.Text);
  mmoError.Lines.Text := IdRexec1.ErrorMessage;
end;

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  chkStdErr.Checked := IdRexec1.UseStdError;
  
end;

end.

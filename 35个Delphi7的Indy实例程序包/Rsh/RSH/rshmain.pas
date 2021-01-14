{-----------------------------------------------------------------------------
 Demo Name: RSH Client demo
 Author:    <unknown - please contact me to get credit ! - Allen O'Neill>
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:39:19
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:


}

unit rshmain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdRemoteCMDClient, IdRexec, IdRSH;

type
  TfrmMainForm = class(TForm)
    edtUserID: TEdit;
    lblUserID: TLabel;
    chkStdErr: TCheckBox;
    edtCommand: TEdit;
    lblCommand: TLabel;
    mmoResults: TMemo;
    mmoError: TMemo;
    BitBtn1: TBitBtn;
    lblResults: TLabel;
    lblError: TLabel;
    edtHost: TEdit;
    lblHost: TLabel;
    Label1: TLabel;
    IdRSH1: TIdRSH;
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

function LocalUserName : String;
var
  szUserName: Array[0..MAX_PATH] of Char;
  ln : Cardinal;
begin
  ln := SizeOf(szUserName);
  if GetUserName(szUserName,ln) then
  begin
    Result := szUserName;
  end
  else
  begin
    Result := '';
  end;
end;

procedure TfrmMainForm.BitBtn1Click(Sender: TObject);
begin
  IdRSH1.UseStdError := chkStdErr.Checked;
  IdRSH1.Host := edtHost.Text;
  IdRSH1.HostUsername := edtUserID.Text;
  IdRSH1.ClientUserName := LocalUserName;
  mmoResults.Lines.Text := IdRSH1.Execute(edtCommand.Text);
  mmoError.Lines.Text := IdRSH1.ErrorMessage;
end;

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  chkStdErr.Checked := IdRSH1.UseStdError;
  
end;

end.

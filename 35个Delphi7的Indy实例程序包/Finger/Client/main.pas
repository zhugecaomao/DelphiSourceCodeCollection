{-----------------------------------------------------------------------------
 Demo Name: main
 Author:    <unknown - please ocntact me to take credit! - Allen O'Neill>
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 00:58:50
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 Demonstrates basic finger client functionality
}


unit main;

interface

uses
  Windows, Messages, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons,
  SysUtils, Classes, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdFinger;

type
  TfrmFingerDemo = class(TForm)
    IdFngFinger: TIdFinger;
    edtQuerry: TEdit;
    lblQuerry: TLabel;
    mmoQuerryResults: TMemo;
    lblInstructions: TLabel;
    chkVerboseQuerry: TCheckBox;
    bbtnQuerry: TBitBtn;
    procedure bbtnQuerryClick(Sender: TObject);
  private
  public
  end;

var
  frmFingerDemo: TfrmFingerDemo;

implementation
{$R *.DFM}

procedure TfrmFingerDemo.bbtnQuerryClick(Sender: TObject);
begin
  {Set the Query string for the Finger from the text entered}
  IdFngFinger.CompleteQuery := edtQuerry.Text;
  {Do we want verbose query - not supported on many systems}
  IdFngFinger.VerboseOutput := chkVerboseQuerry.Checked;
  {Do our query with the Finger function}
  mmoQuerryResults.Lines.Text := IdFngFinger.Finger;
end;

end.

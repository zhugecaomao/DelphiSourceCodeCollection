{-----------------------------------------------------------------------------
 Demo Name: Main
 Author:    <unknown - please contact me to claim credit! - Allen O'Neill>
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:49:13
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:


 Demonstrates a DateTime client getting current date and time from remote DateTimeServer

// A list of time servers is available at:
// http://www.eecis.udel.edu/~mills/ntp/servers.html


}


unit Main;

interface

uses
  Windows, Messages, Graphics, Controls, Forms, Dialogs, StdCtrls,
  SysUtils, Classes, IdComponent, IdTCPConnection, IdTCPClient, IdTime,
  IdBaseComponent;

type
  TfrmTimeDemo = class(TForm)
    lblTimeServer: TLabel;
    IdDemoTime: TIdTime;
    edtTimeResult: TEdit;
    Label1: TLabel;
    btnGetTime: TButton;
    cmboTimeServer: TComboBox;
    procedure btnGetTimeClick(Sender: TObject);
  private
  public
  end;

var
  frmTimeDemo: TfrmTimeDemo;

implementation
{$R *.DFM}

// No real code required - all functionality built into component !
procedure TfrmTimeDemo.btnGetTimeClick(Sender: TObject);
begin
  IdDemoTime.Host := cmboTimeServer.Text;
  { After setting Host, this is all you have to get the time from a time
  server.  We do the rest. }
  edtTimeResult.Text := DateTimeToStr ( IdDemoTime.DateTime );
end;

end.

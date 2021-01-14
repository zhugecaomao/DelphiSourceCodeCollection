{-----------------------------------------------------------------------------
 Demo Name: mainform
 Author:    <unknown - please contact me to take credit ! - Allen O'Neill >
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 00:49:52
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 Demonstrates the use of DayTimeServer ... objective is simply to issue the current
 date and time to any client who connects. All functionality is inbuilt into component

}

unit mainform;

interface

uses
  Windows, Messages, Graphics, Controls, Forms, Dialogs,
  SysUtils, Classes,
  IdComponent, IdTCPServer, IdDayTimeServer, IdBaseComponent;

type
  TfrmMain = class(TForm)
    IdDayTimeServer1: TIdDayTimeServer;
    procedure FormActivate(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation
{$R *.DFM}

// No Code required - DayTimeServer is functional as is.
 procedure TfrmMain.FormActivate(Sender: TObject);
begin
  try
    IdDayTimeServer1.Active := True;
    ShowMessage('Daytime server active - use telnet to connect to port 13 on this machine to test !');
  except
  on E : Exception do
    ShowMessage('Permission Denied. Cannot bind reserved port.' + #13+#13 + '');
  end;
end;


end.

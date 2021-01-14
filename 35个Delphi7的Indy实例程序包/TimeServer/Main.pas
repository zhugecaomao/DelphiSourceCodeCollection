{-----------------------------------------------------------------------------
 Demo Name: Main
 Author:    <unknown - please contact me to claim credit! - Allen O'Meill>
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:53:39
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 Demonstrates basic use of the TimeServer

}


unit Main;

interface

uses
  Windows, Messages, Graphics, Controls, Forms, Dialogs, StdCtrls,
  SysUtils, Classes, IdComponent, IdTCPServer, IdTimeServer, IdBaseComponent;

type
  TfrmMain = class(TForm)
    IdTimeServer1: TIdTimeServer;
    Label1: TLabel;
    lblStatus: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure IdTimeServer1Connect(AThread: TIdPeerThread);
    procedure IdTimeServer1Disconnect(AThread: TIdPeerThread);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation
{$R *.DFM}

// No Code required - TimeServer is functional as is.
 procedure TfrmMain.FormActivate(Sender: TObject);
begin
  try
    IdTimeServer1.Active := True;
  except
    ShowMessage('Permission Denied. Cannot bind reserved port due to security reasons');
    Application.Terminate;
  end;
end;


procedure TfrmMain.IdTimeServer1Connect(AThread: TIdPeerThread);
begin
lblStatus.caption := '[ Client connected ]';
end;

procedure TfrmMain.IdTimeServer1Disconnect(AThread: TIdPeerThread);
begin
lblStatus.caption := '[ idle ]';
end;

end.

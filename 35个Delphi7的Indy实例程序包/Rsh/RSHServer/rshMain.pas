{-----------------------------------------------------------------------------
 Demo Name: RSH Server demo
 Author:    <unknown - please contact me to get credit ! - Allen O'Neill>
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:39:19
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:


}

unit rshMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdBaseComponent, IdTCPClient, IdComponent, IdTCPServer, IdRemoteCMDServer, IdRSHServer;

type
  TForm1 = class(TForm)
    IdRSHServer1: TIdRSHServer;
    procedure IdRSHServer1Command(AThread: TIdPeerThread;
      AStdError: TIdTCPClient; AClientUserName, AHostUserName,
      ACommand: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.IdRSHServer1Command(AThread: TIdPeerThread;
  AStdError: TIdTCPClient; AClientUserName, AHostUserName,
  ACommand: String);
begin
  IdRSHServer1.SendResults(AThread,AStdError,'RSH Demo Program');
end;

end.

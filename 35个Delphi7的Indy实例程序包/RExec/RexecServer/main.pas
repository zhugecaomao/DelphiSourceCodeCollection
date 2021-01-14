{-----------------------------------------------------------------------------
 Demo Name: RExec Demo Server
 Author:    JP Mugass
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:35:08
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 This is not so much a demo program for a Rexec server
 but a program for testing it with some other client implementations

}

unit main;

interface

uses
  Windows, Messages, IdTCPServer, IdRexecServer, IdTCPClient, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdBaseComponent, IdComponent, IdRemoteCMDServer;

type
  TForm1 = class(TForm)
    IdRexecServer1: TIdRexecServer;
    procedure IdRexecServer1Command(AThread: TIdPeerThread;
      AStdError: TIdTCPClient; AUserName, APassword, ACommand: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.IdRexecServer1Command(AThread: TIdPeerThread;
  AStdError: TIdTCPClient; AUserName, APassword, ACommand: String);
begin
  If ACommand <> 'TEST' then
  begin
    IdRexecServer1.SendError(AThread, AStdError, 'Error: '+AUserName+':'+APassword+':'+ACommand+' is not a valid task');
  end
  else
  begin
    IdRexecServer1.SendResults(AThread, AStdError, 'Success: '+AUserName+':'+APassword+':'+ACommand);
  end;
end;

end.

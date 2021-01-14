{-----------------------------------------------------------------------------
 Demo Name: Telnet server demo
 Author:    Siamak Sarmady (email: sarmadys@onlineprogrammer.org)
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:55:19
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 A simple Indy Telnet Server Demo
 Test using telnet on port 23
 
}

unit telnetsrvmain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IdBaseComponent, IdComponent, IdTCPServer, IdTelnetServer,
  IdAntiFreezeBase, IdAntiFreeze;

type
  TMainForm = class(TForm)
    IdTelnetServer1: TIdTelnetServer;
    IdAntiFreeze1: TIdAntiFreeze;
    buttonExit: TButton;
    Label1: TLabel;
    procedure IdTelnetServer1Authentication(AThread: TIdPeerThread;
      const AUsername, APassword: String; var AAuthenticated: Boolean);
    procedure IdTelnetServer1Execute(AThread: TIdPeerThread);
    procedure buttonExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.IdTelnetServer1Authentication(AThread: TIdPeerThread;
  const AUsername, APassword: String; var AAuthenticated: Boolean);
begin
AAuthenticated:=True;
AThread.Connection.Write(AUsername);
AThread.Connection.WriteLn(', Welcome to Indy Telnet Server.');
AThread.Connection.WriteLn('You have new mail.');
AThread.Connection.WriteLn('');
end;

procedure TMainForm.IdTelnetServer1Execute(AThread: TIdPeerThread);
var
  str : string;
begin
 with AThread.Connection do
  begin
   Write('shell>');
   str:=InputLn('');
   if (str='exit') or (str='logout') then
      Disconnect;
   WriteLn(str);
  end;
end;

procedure TMainForm.buttonExitClick(Sender: TObject);
begin
 if IdTelnetServer1.Active=true then
 begin
   IdTelnetServer1.Active:=true
 end;
 Application.Terminate;
end;

end.

{-----------------------------------------------------------------------------
 Demo Name: POP3 Server demo
 Author:    Siamak Sarmady (email: sarmadys@onlineprogrammer.org)
 Copyright: Indy Pit Crew
 Purpose:
 History:   Added in some missing command handler comments - aon
 Date:      27/10/2002 01:22:21
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 Demonstrates POP3 server events (by way of comment - NOT functional!)

}

unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdBaseComponent, IdComponent, IdTCPServer, IdPOP3Server, StdCtrls;

type
  TfrmMain = class(TForm)
    btnExit: TButton;
    IdPOP3Server1: TIdPOP3Server;
    procedure btnExitClick(Sender: TObject);
    procedure IdPOP3Server1CommandUSER(AThread: TIdPeerThread;
      AUserName: String);
    procedure IdPOP3Server1Connect(AThread: TIdPeerThread);
    procedure IdPOP3Server1CommandPASS(AThread: TIdPeerThread;
      APassword: String);
    procedure IdPOP3Server1CommandSTAT(AThread: TIdPeerThread);
    procedure IdPOP3Server1CommandLIST(AThread: TIdPeerThread;
      AMessageNum: Integer);
    procedure IdPOP3Server1CommandRETR(AThread: TIdPeerThread;
      AMessageNum: Integer);
    procedure IdPOP3Server1CommandDELE(AThread: TIdPeerThread;
      AMessageNum: Integer);
    procedure IdPOP3Server1CommandQUIT(AThread: TIdPeerThread);
    procedure FormActivate(Sender: TObject);
    procedure IdPOP3Server1CheckUser(AThread: TIdPeerThread;
      LThread: TIdPOP3ServerThread);
    procedure IdPOP3Server1DELE(ASender: TIdCommand; AMessageNum: Integer);
    procedure IdPOP3Server1Exception(AThread: TIdPeerThread;
      AException: Exception);
    procedure IdPOP3Server1LIST(ASender: TIdCommand; AMessageNum: Integer);
    procedure IdPOP3Server1QUIT(ASender: TIdCommand);
    procedure IdPOP3Server1RETR(ASender: TIdCommand; AMessageNum: Integer);
    procedure IdPOP3Server1RSET(ASender: TIdCommand);
    procedure IdPOP3Server1STAT(ASender: TIdCommand);
    procedure IdPOP3Server1TOP(ASender: TIdCommand; AMessageNum,
      ANumLines: Integer);
    procedure IdPOP3Server1UIDL(ASender: TIdCommand; AMessageNum: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

//If user presses exit button close socket and exit
procedure TfrmMain.btnExitClick(Sender: TObject);
begin
 if IdPop3Server1.Active=True then
  IdPop3Server1.Active:=False;
 Application.Terminate;
end;

//After completing a connection client sends a user name. We receive
//this username in AUserName variable in next function. 
procedure TfrmMain.IdPOP3Server1CommandUSER(AThread: TIdPeerThread;
  AUserName: String);
begin
AThread.Connection.WriteLn('+OK User Ok');
end;

//When a clinet connects to our server we must reply with +OK,
//if we are ready to accept mails. Otherwise if we are not ready
//we can issue an error.
// You may also wish to initialise some global vars here, set the POP3 box to locked state, etc.
procedure TfrmMain.IdPOP3Server1Connect(AThread: TIdPeerThread);
begin
AThread.Connection.WriteLn('+OK Indy MailServer Ready');
end;

//In reply to server request for a valid password, client delivers
//the password. We will receive password in this method and we can
//either accept or reject the password.
//This is done by either replying with +OK answer or an error code.
procedure TfrmMain.IdPOP3Server1CommandPASS(AThread: TIdPeerThread;
  APassword: String);
begin
 AThread.Connection.WriteLn('+OK Password OK');
end;

//When client asks for a statistic of messages server will answer
//by sending an +OK followed by number of messages and length of them
//Format of client message is STAT
procedure TfrmMain.IdPOP3Server1CommandSTAT(AThread: TIdPeerThread);
begin
AThread.Connection.WriteLn('+OK 1 40');
end;

//before retrieving messages, client asks for a list  of messages
//Server responds with a +OK followed by number of deliverable
//messages and length of messages in bytes. After this a separate
//list of each message and its length is sent to client.
//here we have only one message, but we can continue with message
//number and its length , one per line and finally a '.' character.
//Format of client command is  LIST 
procedure TfrmMain.IdPOP3Server1CommandLIST(AThread: TIdPeerThread;
  AMessageNum: Integer);
begin
AThread.Connection.WriteLn('+OK 1 messages (40 octets)');
AThread.Connection.WriteLn('1 40');
AThread.Connection.WriteLn('.');
end;


//Client initiates retrieving each message by issuing a RETR command
//to server. Server will respond by +OK and will continue by sending
//message itself. Each message is saved in a database uppon arival
//by smtp server and is now delivered to user mail agent by pop3 server.
//Here we do not read mail from a storage but we deliver a sample
//mail from inside program. We can deliver multiple mails using
//this method.  Format of RETR command is something like
// RETR 1 or RETR 2 etc.  
procedure TfrmMain.IdPOP3Server1CommandRETR(AThread: TIdPeerThread;
  AMessageNum: Integer);
begin
AThread.Connection.WriteLn('+OK 40 octets');
AThread.Connection.WriteLn('From: demo@nevrona.com');
AThread.Connection.WriteLn('To: you@yourdomain.com ');
AThread.Connection.WriteLn('Subject: Hello ');
AThread.Connection.WriteLn('');
AThread.Connection.WriteLn('Hello world! This is email body.');
AThread.Connection.WriteLn('.');


end;

//Usually, messages are deleted after being retrieved from pop3 server
//This is done when client sents DELE command after retrieving a message
//Client command is something like DELE 1 which means delete message 1
procedure TfrmMain.IdPOP3Server1CommandDELE(AThread: TIdPeerThread;
  AMessageNum: Integer);
begin
 AThread.Connection.WriteLn('+OK message 1 deleted');

end;

//After doing every step client asks for ending session, this
//is done by sending QUIT message to server. Server will answer
//with +OK and some more information. Additional information
//is optional.
procedure TfrmMain.IdPOP3Server1CommandQUIT(AThread: TIdPeerThread);
begin
 AThread.Connection.WriteLn('+OK OL POP3 server signing off (maildrop empty)');

end;

//Activate the server socket when activating server main window.
procedure TfrmMain.FormActivate(Sender: TObject);
begin
 IdPop3Server1.Active:=True;
end;

// This is where you validate the user/pass credentials of the user logging in
procedure TfrmMain.IdPOP3Server1CheckUser(AThread: TIdPeerThread;
  LThread: TIdPOP3ServerThread);
begin
// LThread.Username -> examine this for valid username
// LThread.Password -> examine this for valid password
// if the user/pass pair are valid, then respond with
// LThread.State := Trans
// to reject the user/pass pair, do not change the state
LThread.State := Trans;
end;

// This is where the client program issues a delete command for a particular message
procedure TfrmMain.IdPOP3Server1DELE(ASender: TIdCommand;
  AMessageNum: Integer);
begin
// if the message has been deleted, then return a success command as follows;
// ASender.Thread.Connection.Writeln('+OK - Message ' + IntToStr(AMessageNum) + ' Deleted')
// otherwise, if there was an error in deleting the message, or the message number
// did not exist in the first place, then return the following:
// ASender.Thread.Connection.Writeln('-ERR - Message ' + IntToStr(AMessageNum) + ' not deleted because.... [reason]')
end;

procedure TfrmMain.IdPOP3Server1Exception(AThread: TIdPeerThread;
  AException: Exception);
begin
// Handle any exceptions given by the thread here
end;

procedure TfrmMain.IdPOP3Server1LIST(ASender: TIdCommand;
  AMessageNum: Integer);
begin
// Here you return a list of available messages to the client
end;

procedure TfrmMain.IdPOP3Server1QUIT(ASender: TIdCommand);
begin
// here is where the client has decided to close the connection
end;

procedure TfrmMain.IdPOP3Server1RETR(ASender: TIdCommand;
  AMessageNum: Integer);
begin
// Here is where the client wishes to RETRieve a specific messages number
end;

procedure TfrmMain.IdPOP3Server1RSET(ASender: TIdCommand);
begin
// here is where the client wishes to reset the current state
// This may be used to reset a list of pending deletes, etc.
end;

procedure TfrmMain.IdPOP3Server1STAT(ASender: TIdCommand);
begin
// here is where the client has asked for the Status of the mailbox
end;

procedure TfrmMain.IdPOP3Server1TOP(ASender: TIdCommand; AMessageNum,
  ANumLines: Integer);
begin
// This is where the cleint has requested the TOP X lines of a particular
// message to be sent to them
end;

procedure TfrmMain.IdPOP3Server1UIDL(ASender: TIdCommand;
  AMessageNum: Integer);
begin
// This is where the client has requested the unique identifier (UIDL) of each
// message, or a particular message to be sent to them.
end;

end.

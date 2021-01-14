{-----------------------------------------------------------------------------
 Demo Name: SMTPSever demo
 Author:    Andrew Neillans
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:27:09
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:                             

 Demonstration of SMTPSerer (by use of comments only!! - read the RFC to understand how to
                             store and manage server data, and thus be able to use this component effectivly)

}

unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdBaseComponent, IdComponent, IdTCPServer, IdSMTPServer, StdCtrls,
  IdMessage, IdEMailAddress;

type
  TfrmSmtpServer = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ToLabel: TLabel;
    FromLabel: TLabel;
    SubjectLabel: TLabel;
    IdSMTPServer: TIdSMTPServer;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure IdSMTPServer1ADDRESSError(AThread: TIdPeerThread;
      const CmdStr: String);
    procedure IdSMTPServer1CommandAUTH(AThread: TIdPeerThread;
      const CmdStr: String);
    procedure IdSMTPServer1CommandCheckUser(AThread: TIdPeerThread;
      const Username, Password: String; var Accepted: Boolean);
    procedure IdSMTPServer1CommandQUIT(AThread: TIdPeerThread);
    procedure IdSMTPServer1CommandX(AThread: TIdPeerThread;
      const CmdStr: String);
    procedure IdSMTPServerCommandMAIL(const ASender: TIdCommand;
      var Accept: Boolean; EMailAddress: String);
    procedure IdSMTPServerCommandRCPT(const ASender: TIdCommand;
      var Accept, ToForward: Boolean; EMailAddress: String;
      var CustomError: String);
    procedure IdSMTPServerReceiveRaw(ASender: TIdCommand;
      var VStream: TStream; RCPT: TIdEMailAddressList;
      var CustomError: String);
    procedure IdSMTPServerReceiveMessage(ASender: TIdCommand;
      var AMsg: TIdMessage; RCPT: TIdEMailAddressList;
      var CustomError: String);
    procedure IdSMTPServerReceiveMessageParsed(ASender: TIdCommand;
      var AMsg: TIdMessage; RCPT: TIdEMailAddressList;
      var CustomError: String);
    procedure IdSMTPServerCommandHELP(ASender: TIdCommand);
    procedure IdSMTPServerCommandSAML(ASender: TIdCommand);
    procedure IdSMTPServerCommandSEND(ASender: TIdCommand);
    procedure IdSMTPServerCommandSOML(ASender: TIdCommand);
    procedure IdSMTPServerCommandTURN(ASender: TIdCommand);
    procedure IdSMTPServerCommandVRFY(ASender: TIdCommand);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSmtpServer: TfrmSmtpServer;

implementation

{$R *.DFM}

procedure TfrmSmtpServer.IdSMTPServer1ADDRESSError(AThread: TIdPeerThread;
  const CmdStr: String);
begin
 // Send the Address Error String - this *WILL* be coded in eventually.
 AThread.Connection.Writeln('500 Syntax Error in MAIL FROM or RCPT TO');
end;

procedure TfrmSmtpServer.IdSMTPServer1CommandAUTH(AThread: TIdPeerThread;
  const CmdStr: String);
begin
 // This is where you would process the AUTH command - for now, we send a error
 AThread.Connection.Writeln(IdSMTPServer.Messages.ErrorReply);
end;

procedure TfrmSmtpServer.IdSMTPServer1CommandCheckUser(AThread: TIdPeerThread;
  const Username, Password: String; var Accepted: Boolean);
begin
 // This event allows you to 'login' a user - this is used internall in the
 // IdSMTPServer to validate users connecting using the AUTH.
 Accepted := False;
end;

procedure TfrmSmtpServer.IdSMTPServer1CommandQUIT(AThread: TIdPeerThread);
begin
// Process any logoff events here - e.g. clean temp files
end;

procedure TfrmSmtpServer.IdSMTPServer1CommandX(AThread: TIdPeerThread;
  const CmdStr: String);
begin
 // You can use this for debugging :)
 
end;

procedure TfrmSmtpServer.IdSMTPServerCommandMAIL(const ASender: TIdCommand;
  var Accept: Boolean; EMailAddress: String);
begin
 // This is required!
 // You check the EMAILADDRESS here to see if it is to be accepted / processed.
 // Set Accept := True if its allowed
 Accept := True;
end;

procedure TfrmSmtpServer.IdSMTPServerCommandRCPT(const ASender: TIdCommand;
  var Accept, ToForward: Boolean; EMailAddress: String;
  var CustomError: String);
begin
 // This is required!
 // You check the EMAILADDRESS here to see if it is to be accepted / processed.
 // Set Accept := True if its allowed
 // Set ToForward := True if its needing to be forwarded.
 Accept := True;
end;

procedure TfrmSmtpServer.IdSMTPServerReceiveRaw(ASender: TIdCommand;
  var VStream: TStream; RCPT: TIdEMailAddressList;
  var CustomError: String);
begin
// This is the main event for receiving the message itself if you are using
// the ReceiveRAW method
// The message data will be given to you in VSTREAM
// Capture it using a memorystream, filestream, or whatever type of stream
// is suitable to your storage mechanism.
// The RCPT variable is a list of recipients for the message
end;

procedure TfrmSmtpServer.IdSMTPServerReceiveMessage(ASender: TIdCommand;
  var AMsg: TIdMessage; RCPT: TIdEMailAddressList;
  var CustomError: String);
begin
// This is the main event if you have opted to have idSMTPServer present the message packaged as a TidMessage
// The AMessage contains the completed TIdMessage.
// NOTE: Dont forget to add IdMessage to your USES clause!

ToLabel.Caption := AMsg.Recipients.EMailAddresses;
FromLabel.Caption := AMsg.From.Text;
SubjectLabel.Caption := AMsg.Subject;
Memo1.Lines := AMsg.Body;

// Implement your file system here :)
end;

procedure TfrmSmtpServer.IdSMTPServerReceiveMessageParsed(ASender: TIdCommand;
  var AMsg: TIdMessage; RCPT: TIdEMailAddressList;
  var CustomError: String);
begin
// This is the main event if you have opted to have the idSMTPServer to do your parsing for you.
// The AMessage contains the completed TIdMessage.
// NOTE: Dont forget to add IdMessage to your USES clause!

ToLabel.Caption := AMsg.Recipients.EMailAddresses;
FromLabel.Caption := AMsg.From.Text;
SubjectLabel.Caption := AMsg.Subject;
Memo1.Lines := AMsg.Body;

// Implement your file system here :)

end;

procedure TfrmSmtpServer.IdSMTPServerCommandHELP(ASender: TIdCommand);
begin
// here you can send back a lsit of supported server commands
end;

procedure TfrmSmtpServer.IdSMTPServerCommandSAML(ASender: TIdCommand);
begin
// not really used anymore - see RFC for information
end;

procedure TfrmSmtpServer.IdSMTPServerCommandSEND(ASender: TIdCommand);
begin
// not really used anymore - see RFC for information
end;

procedure TfrmSmtpServer.IdSMTPServerCommandSOML(ASender: TIdCommand);
begin
// not really used anymore - see RFC for information
end;

procedure TfrmSmtpServer.IdSMTPServerCommandTURN(ASender: TIdCommand);
begin
// not really used anymore - see RFC for information
end;

procedure TfrmSmtpServer.IdSMTPServerCommandVRFY(ASender: TIdCommand);
begin
// not really used anymore - see RFC for information
end;

procedure TfrmSmtpServer.Button1Click(Sender: TObject);
begin
IdSMTPServer.active := true;
end;

procedure TfrmSmtpServer.Button2Click(Sender: TObject);
begin
IdSMTPServer.active := false;
end;

end.

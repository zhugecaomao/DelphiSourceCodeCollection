{-----------------------------------------------------------------------------
 Demo Name: SMTPRelay
 Author:    Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 00:27:55
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 Demonstrates sending an email without the use of a local SMTP server
 This works by extracting the domain part form the recipient email address,
 then doing an MX lookup against a DNS server for that domain part,
 and finally connecting directly to the SMTP server that the MX record
 point to, to deliver the message.
 
}


unit fMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IdComponent,
  IdUDPBase, IdUDPClient, IdDNSResolver, IdBaseComponent, IdMessage,
  StdCtrls, ExtCtrls, ComCtrls, IdAntiFreezeBase, IdAntiFreeze;

type
  TfrmMain = class(TForm)
    IdMessage: TIdMessage;
    IdDNSResolver: TIdDNSResolver;
    IdSMTP: TIdSMTP;
    Label1: TLabel;
    sbMain: TStatusBar;
    Label2: TLabel;
    edtDNS: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtSender: TEdit;
    Label5: TLabel;
    edtRecipient: TEdit;
    Label6: TLabel;
    edtSubject: TEdit;
    Label7: TLabel;
    mmoMessageText: TMemo;
    btnSendMail: TButton;
    btnExit: TButton;
    IdAntiFreeze: TIdAntiFreeze;
    Label8: TLabel;
    edtTimeOut: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    procedure btnExitClick(Sender: TObject);
    procedure btnSendMailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  fMailServers : TStringList;
  Function PadZero(s:String):String;
  Function GetMailServers:Boolean;
  Function ValidData : Boolean;
  Procedure SendMail; OverLoad;
  Function SendMail(aHost : String):Boolean; OverLoad;
  Procedure LockControls;
  procedure UnlockControls;
  Procedure Msg(aMessage:String);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}


procedure TfrmMain.btnExitClick(Sender: TObject);
begin
application.terminate;
end;

procedure TfrmMain.btnSendMailClick(Sender: TObject);
begin
Msg('');
LockControls;
if ValidData then SendMail;
UnlockControls;
Msg('');
end;

function TfrmMain.GetMailServers: Boolean;
var
  i,x : integer;
  LDomainPart : String;
  LMXRecord : TMXRecord;
begin
if not assigned(fmailServers) then fMailServers := TStringList.Create;
fmailServers.clear;

Result := true;
with IdDNSResolver do
  begin
  QueryResult.Clear;
  QueryRecords := [qtMX];
  Msg('Setting up DNS query parameters');
  Host := edtDNS.text;
  ReceiveTimeout := StrToInt(edtTimeOut.text);
  // Extract the domain part from recipient email address
  LDomainPart := copy(edtRecipient.text,pos('@',edtRecipient.text)+1,length(edtRecipient.text)); // the domain name to resolve

  try
  Msg('Resolving DNS');
  Resolve(LDomainPart);

  if QueryResult.Count > 0 then
    begin
      for i := 0 to QueryResult.Count - 1 do
        begin
        LMXRecord := TMXRecord(QueryResult.Items[i]);
        fMailServers.Append(PadZero(IntToStr(LMXRecord.Preference)) + '=' + LMXRecord.ExchangeServer);
        end;

    // sort in order of priority and then remove extra data
    fMailServers.Sorted := false;
    for i := 0 to fMailServers.count - 1 do
      begin
      x := pos('=',fMailServers.Strings[i]);
      if x > 0 then fMailServers.Strings[i] :=
        copy(fMailServers.Strings[i],x+1,length(fMailServers.Strings[i]));
      end;
    fMailServers.Sorted := true;
    fMailServers.Duplicates := dupIgnore;
    Result := true;
    end
  else
    begin
    Msg('No response from DNS server');
    MessageDlg('There is no response from the DNS server !', mtInformation, [mbOK], 0);
    Result := false;
    end;
  except
  on E : Exception do
    begin
    Msg('Error resolving domain');
    MessageDlg('Error resolving domain: ' + e.message, mtInformation, [mbOK], 0);
    Result := false;
    end;
  end;

  end;
end;

// Used in DNS preferance sorting
procedure TfrmMain.LockControls;
var i : integer;
begin
edtDNS.enabled := false;
edtSender.enabled := false;
edtRecipient.enabled := false;
edtSubject.enabled := false;
mmoMessageText.enabled := false;
btnExit.enabled := false;
btnSendMail.enabled := false;
end;

procedure TfrmMain.UnlockControls;
begin
edtDNS.enabled := true;
edtSender.enabled := true;
edtRecipient.enabled := true;
edtSubject.enabled := true;
mmoMessageText.enabled := true;
btnExit.enabled := true;
btnSendMail.enabled := true;
end;


function TfrmMain.PadZero(s: String): String;
begin
if length(s) < 2 then
  s := '0' + s;
Result := s;
end;

procedure TfrmMain.SendMail;
var
  i : integer;
begin
if GetMailServers then
  begin
  with IdMessage do
    begin
    Msg('Assigning mail message properties');
    From.Text := edtSender.text;
    Sender.Text := edtSender.text;
    Recipients.EMailAddresses := edtRecipient.text;
    Subject := edtSubject.text;
    Body := mmoMessageText.Lines;
    end;

  for i := 0 to fMailServers.count -1 do
    begin
    Msg('Attempting to send mail');
    if SendMail(fMailServers.Strings[i]) then
      begin
      MessageDlg('Mail successfully sent and available for pickup by recipient !', mtInformation, [mbOK], 0);
      Exit;
      end;
    end;
  // if we are here then something went wrong .. ie there were no available servers to accept our mail!
  MessageDlg('Could not send mail to remote server - please try again later.', mtInformation, [mbOK], 0);
  end;
if assigned(fMailServers) then FreeAndNil(fMailServers);
end;

function TfrmMain.SendMail(aHost: String): Boolean;
begin
Result := false;
with IdSMTP do
  begin
  Caption := 'Trying to sendmail via: ' + aHost;
  Msg('Trying to sendmail via: ' + aHost);
  Host := aHost;
  try
  Msg('Attempting connect');
  Connect;
  Msg('Successful connect ... sending message');
  Send(IdMessage);
  Msg('Attempting disconnect');
  Disconnect;
  msg('Successful disconnect');
  Result := true;
  except on E : Exception do
    begin
    if connected then try disconnect; except end;
    Msg('Error sending message');
    result := false;
    ShowMessage(E.Message);
    end;
  end;
  end;
Caption := '';
end;


function TfrmMain.ValidData: Boolean;
var ErrString:string;
begin
Result := True;
ErrString := '';

if trim(edtDNS.text) = '' then ErrString := ErrString +  #13 + #187 + 'DNS server not filled in';
if trim(edtSender.text) = '' then ErrString := ErrString + #13 + #187 + 'Sender email not filled in';
if trim(edtRecipient.text) = '' then ErrString := ErrString +  #13 + #187 + 'Recipient not filled in';

if ErrString <> '' then
  begin
  MessageDlg('Cannot proceed due to the following errors:'+#13+#10+ ErrString, mtInformation, [mbOK], 0);
  Result := False;
  end;
end;

procedure TfrmMain.Msg(aMessage: String);
begin
sbMain.SimpleText := aMessage;
application.ProcessMessages;
end;

end.



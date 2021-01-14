{***************************************************************
*
* Project : pop3server
* Unit Name: pop3server
* Purpose : A simple Indy pop3 server demo
* Author : Siamak Sarmady (email: sarmadys@onlineprogrammer.org)
* Date : 07/02/2001 - 17:52:31
* History :
*
****************************************************************}
program pop3server;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {frmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

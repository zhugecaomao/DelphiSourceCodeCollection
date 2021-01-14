{***************************************************************
*
* Project : Telnet Server
* Unit Name: telnetsrv
* Purpose : A simple Indy Telnet Server Demo
* Author : Siamak Sarmady (email: sarmadys@onlineprogrammer.org)
* Date : 07/02/2001 - 17:52:31
* History :
*
****************************************************************}

program telnetsrv;

uses
  Forms,
  telnetsrvmain in 'telnetsrvmain.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

// NOTE: This demo ONLY runs under Windows.


program TCPStreamClient;

uses
  Forms,
  ClientMain in 'ClientMain.pas' {Form2};

{$R *.RES}

{
	Indy TCP Stream Client Demo
	Don Siders <sidersd@att.net>
	October 6, 2000

	Demonstrates use of the following:

 	TIdTCPClient.ReadLn to get server responses.

 	TIdTCPClient.WriteLn to send requests to the server.

 	TIdTCPClient.ReadStream to load requested data from the server .

 	Run TCPStreamServer.EXE prior to using TCPStreamClient.
}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

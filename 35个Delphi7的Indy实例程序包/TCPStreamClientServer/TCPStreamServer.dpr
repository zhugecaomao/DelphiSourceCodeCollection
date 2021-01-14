// NOTE: This demo ONLY runs under Windows.

program TCPStreamServer;

uses
  Forms,
  ServerMain in 'ServerMain.pas' {Form1};

{$R *.RES}

{
	Indy TCP Stream Server Demo
	Don Siders <sidersd@att.net>
	October 6, 2000

	Demonstrates use of the following:

 	TIdTCPServer.Execute to service threaded connection requests.

	TIdTCPServer.WriteStream to send data to the client.

 	TIdTCPServer.OpenWriteBuffer, TIdTCPServer.CloseWriteBuffer to manage
 	Indy data buffering prior to transmission.

 	Run TCPStreamServer.EXE prior to using TCPStreamClient.
}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

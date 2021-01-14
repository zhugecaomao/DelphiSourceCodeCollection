{-----------------------------------------------------------------------------
 Demo Name: ClientMain
 Author:    Don Siders
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:35:45
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:


 Load button connects to the server and sends the OUTLINE command.
 Reads data from the server using ReadStream, and stores the data
 in the outline component.

 A timer is provided to simulate load conditions from a single PC.

}


unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IdBaseComponent,
	IdComponent, IdTCPConnection, IdTCPClient, ExtCtrls, Grids, Outline;


type
  TForm2 = class(TForm)
	  TCPClient: TIdTCPClient;
	  Panel1: TPanel;
	  Button1: TButton;
    Outline1: TOutline;
    Button2: TButton;
    Timer1: TTimer;
	  procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormResize(Sender: TObject);
	private
	public
	end;

var
	Form2: TForm2;

implementation
{$R *.DFM}

procedure TForm2.Button1Click(Sender: TObject);

var
	SResponse: String;
	AStream: TStringStream;

begin
	with TCPClient do
	begin
		Connect;
		
		while Connected do
		begin
			AStream := TStringStream.Create('');
		
			try
				// banner means the server thread is running
				SResponse := UpperCase(ReadLn);
				if Pos('HELLO', SResponse) = 0 then Break;

				// request OUTLINE data
				WriteLn('OUTLINE');

				{	read all bytes until disconnected
					no length marker in stream }
				ReadStream(AStream, -1, True);
				AStream.Seek(0, soFromBeginning);

				with Outline1 do
				begin
					Clear;
					Lines.LoadFromStream(AStream);
					// Lines.Text := AStream.DataString;
					FullExpand;
				end;

			finally
				Disconnect;
				AStream.Free;
			end;
		end;
	end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
	Outline1.Clear;

	Timer1.Enabled := not Timer1.Enabled;
	Button1.Enabled := not TImer1.Enabled;

	if Timer1.Enabled then
		Button2.Caption := 'Stop Timer'
	else
		Button2.Caption := 'Start Timer';

end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
	try
		Button1.Click;
		
	except // reset the timer and raise the exception
		begin
			Button2.Click;
			raise;
		end;
	end;
end;

procedure TForm2.FormResize(Sender: TObject);
begin
	Button1.Width := (Width-26) div 2;
	Button2.Width := 	Button1.Width;
	Button2.Left  := 	Button1.Left + Button1.Width + 4;
end;

end.

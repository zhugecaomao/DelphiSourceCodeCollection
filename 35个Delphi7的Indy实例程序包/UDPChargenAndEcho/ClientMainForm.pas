{-----------------------------------------------------------------------------
 Demo Name: UDP chargen/echo client
 Author:    <unknown - please contact me to take credit>
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:58:13
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 Demonstrates using UDP client against CharGen and Echo server

}

unit ClientMainForm;

interface

uses
  Windows, Buttons, Messages, Graphics, Controls, Forms, Dialogs,
  SysUtils, Classes, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPClient, StdCtrls;

type
  TfrmMain = class(TForm)
    Button1: TButton;
    IdUDPClient1: TIdUDPClient;
    IdUDPClient2: TIdUDPClient;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Test(IdUDPClient: TIdUDPClient);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

uses IdException, IdStackConsts;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  Test(IdUDPClient1);
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  Test(IdUDPClient2);
end;

procedure TfrmMain.Test(IdUDPClient: TIdUDPClient);
var
  counter: integer;
  s, peer: string;
  port: integer;
begin
  counter := 1;
  try
    IdUDPClient.Send(Format('test #%d', [counter]));
    inc(counter);
    repeat
      try
        s := IdUDPClient.ReceiveString(peer, port);
      except
        on E: EIdSocketError do
          if E.LastError <> 10040 then
            raise;
      end;
      if s <> '' then
        ShowMessage(Format('%s:%d said'#13'%s', [peer, port, s]));
    until s = '';
  finally
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // enable broadcast support in TIdUDPClient
  IdUDPClient1.BroadcastEnabled := True;
  IdUDPClient2.BroadcastEnabled := True;
end;

end.

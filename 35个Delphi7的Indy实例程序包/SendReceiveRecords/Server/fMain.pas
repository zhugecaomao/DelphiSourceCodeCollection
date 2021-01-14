unit fMain;
{-----------------------------------------------------------------------------
 Demo Name: Records - Server
 Author:    Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:24:55
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 Demonstrates sending / receiving record data and use of buffers
 Note - sending record data etc can also be done using Streams - this is just another method.

}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IdBaseComponent, IdComponent, IdTCPServer;

type
  Direction = (dirLeft,dirRight);

type
  MyRecord = Packed Record
  MyInteger : Integer;
  MyString : String[250];
  MyBool : Boolean;
  MyDirection : Direction;
  end;


type
  TfrmMain = class(TForm)
    IdTCPServer: TIdTCPServer;
    btnStart: TButton;
    btnExit: TButton;
    procedure btnExitClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure IdTCPServerExecute(AThread: TIdPeerThread);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
if IdTCPServer.active then IdTCPServer.active := false;
application.terminate;
end;

procedure TfrmMain.btnStartClick(Sender: TObject);
begin
IdTCPServer.active := not IdTCPServer.active;

if btnStart.caption = 'Start' then btnStart.caption := 'Stop'
else if btnStart.caption = 'Stop' then btnStart.caption := 'Start';

end;

procedure TfrmMain.IdTCPServerExecute(AThread: TIdPeerThread);
var
  MyRec : MyRecord;
begin
AThread.connection.ReadBuffer(MyRec,SizeOf(MyRec));
AThread.connection.WriteBuffer(MyRec,SizeOf(MyRec),true);
end;

end.

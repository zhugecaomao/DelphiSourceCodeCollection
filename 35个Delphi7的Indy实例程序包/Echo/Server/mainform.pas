{-----------------------------------------------------------------------------
 Demo Name: Echo server
 Author:    <unknown - please contact me to take credit! - Allen O'Neill>
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 00:51:54
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 No coding is required.  Echo server is ready to go by setting Active to True
}


unit mainform;

interface

uses
  Windows, Messages, Graphics, Controls, Forms, Dialogs, StdCtrls,
  SysUtils, Classes, IdBaseComponent, IdComponent, IdTCPServer,
  IdEchoServer;

type
  TForm1 = class(TForm)
    IdECHOServer1: TIdECHOServer;
    Label1: TLabel;
    lblStatus: TLabel;
    btnExit: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure IdECHOServer1Connect(AThread: TIdPeerThread);
    procedure IdECHOServer1Disconnect(AThread: TIdPeerThread);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

 procedure TForm1.FormActivate(Sender: TObject);
begin
  try
    IdECHOServer1.Active := True;
  except
    ShowMessage('Permission Denied. Cannot bind reserved port due to security reasons');
    Application.Terminate;
  end;
end;


procedure TForm1.btnExitClick(Sender: TObject);
begin
if IdECHOServer1.active then
    IdECHOServer1.active := false;
Application.terminate;
end;

procedure TForm1.IdECHOServer1Connect(AThread: TIdPeerThread);
begin
lblStatus.caption := '[ Serving client ]';
end;

procedure TForm1.IdECHOServer1Disconnect(AThread: TIdPeerThread);
begin
lblStatus.caption := '[ idle - waiting next client ]';
end;

end.

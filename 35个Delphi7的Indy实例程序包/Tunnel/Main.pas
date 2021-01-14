{-----------------------------------------------------------------------------
 Demo Name: Tunnell client/server demo
 Author:    Gregor Ibic
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:16:53
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 Demonstrates TunnelMaster/Slave combination - look at the code under the START button for info

}

unit Main;

interface

uses
  Windows, Messages, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons,
  SysUtils, Classes, IdTunnelSlave, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdTunnelMaster;

type
  TfrmMain = class(TForm)
    Panel2: TPanel;
    lblSlaves: TLabel;
    Label3: TLabel;
    lblServices: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    lblClients: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    btnStart: TBitBtn;
    btnStop: TBitBtn;
    tmrRefresh: TTimer;
    procedure tmrRefreshTimer(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Master: TIdTunnelMaster;
    Slave: TIdTunnelSlave;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}
uses IdGlobal;

procedure TfrmMain.tmrRefreshTimer(Sender: TObject);
begin
  if Slave.Active then begin
    lblClients.Caption := IntToStr(Slave.NumClients);
  end;

  if Master.Active then begin
    lblSlaves.Caption := IntToStr(Master.NumSlaves);
    lblServices.Caption := IntToStr(Master.NumServices);
  end;
end;

procedure TfrmMain.btnStartClick(Sender: TObject);
begin
  btnStart.Enabled := False;
  btnStop.Enabled := True;
  Master.Active := True;
  sleep(100);
  Slave.Active := True;
  tmrRefresh.Enabled := True;
end;

procedure TfrmMain.btnStopClick(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  btnStart.Enabled := True;
  btnStop.Enabled := False;
  Slave.Active := False;
  lblClients.Caption := '0';
  sleep(100); // only for Master to realize that something happened
              // before printing to the screen. It is not needed in real
              // app
  if Master.Active then begin
    lblSlaves.Caption := IntToStr(Master.NumSlaves);
    lblServices.Caption := IntToStr(Master.NumServices);
  end;
  Master.Active := False;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Master := TIdTunnelMaster.Create(self);
  Master.MappedHost := '127.0.0.1';
  Master.MappedPort := 80;
  Master.LockDestinationHost := True;
  Master.LockDestinationPort := True;
  Master.DefaultPort := 9000;
  Master.Bindings.Add;

  Slave := TIdTunnelSlave.Create(self);
  Slave.MasterHost := '127.0.0.1';
  Slave.MasterPort := 9000;
  Slave.Socks4 := False;
  Slave.DefaultPort := 8080;
  Slave.Bindings.Add;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  Slave.Active := False;
  Master.Active := False;
  sleep(100);
  Slave.Destroy;
  Master.Destroy;
end;


end.

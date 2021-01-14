{-----------------------------------------------------------------------------
 Demo Name: Main
 Author:    < Unknown >
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:20:26
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 Demonstrates using the ICMP client to generate PING stats.

}




unit Main;

interface

uses
  Windows, Messages, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  SysUtils, Classes, IdIcmpClient, IdBaseComponent, IdComponent, IdRawBase, IdRawClient;


type
  TfrmPing = class(TForm)
    lstReplies: TListBox;
    ICMP: TIdIcmpClient;
    Panel1: TPanel;
    btnPing: TButton;
    edtHost: TEdit;
    procedure btnPingClick(Sender: TObject);
    procedure ICMPReply(ASender: TComponent; const ReplyStatus: TReplyStatus);
  private
  public
  end;

var
  frmPing: TfrmPing;

implementation
{$R *.DFM}

procedure TfrmPing.btnPingClick(Sender: TObject);
var
  i: integer;
begin
  ICMP.OnReply := ICMPReply;
  ICMP.ReceiveTimeout := 1000;
  btnPing.Enabled := False; try
    ICMP.Host := edtHost.Text;
    for i := 1 to 4 do begin
      ICMP.Ping;
      Application.ProcessMessages;
      //Sleep(1000);
    end;
  finally btnPing.Enabled := True; end;
end;

procedure TfrmPing.ICMPReply(ASender: TComponent; const ReplyStatus: TReplyStatus);
var
  sTime: string;
begin
  // TODO: check for error on ping reply (ReplyStatus.MsgType?)
  if (ReplyStatus.MsRoundTripTime = 0) then
    sTime := '<1'
  else
    sTime := '=';

  lstReplies.Items.Add(Format('%d bytes from %s: icmp_seq=%d ttl=%d time%s%d ms',
    [ReplyStatus.BytesReceived,
    ReplyStatus.FromIpAddress,
    ReplyStatus.SequenceId,
    ReplyStatus.TimeToLive,
    sTime,
    ReplyStatus.MsRoundTripTime]));
end;

end.

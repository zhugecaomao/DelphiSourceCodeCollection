{-----------------------------------------------------------------------------
 Demo Name: UDP chargen/echo server
 Author:    <unknown - please contact me to take credit>
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:58:13
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

}




unit ServerMainForm;

interface

uses
  Controls, Forms, StdCtrls, Classes, IdSocketHandle,
  IdUDPServer;

type
  TfrmMain = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    UDPServer: TIdUDPServer;
    procedure UDPServerUDPRead(Sender: TObject; AData: TStream; ABinding: TIdSocketHandle);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

uses IdAssignedNumbers, IdGlobal, SysUtils;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  UDPServer := TIdUDPServer.Create(self);
  with UDPServer do
  begin
    Bindings.add.Port := IdPORT_ECHO;
    Bindings.add.Port := IdPORT_CHARGEN;
    OnUDPRead := UDPServerUDPRead;
    Active := True;
  end;
end;

procedure TfrmMain.UDPServerUDPRead(Sender: TObject; AData: TStream; ABinding: TIdSocketHandle);
const
  rowlength = 75;
var
  s: string;
  i, row: integer;
  c: Char;
begin
  SetLength(s, AData.Size);
  AData.Read(s[1], AData.Size);
  with ABinding do
    Memo1.Lines.Add(Format('%s:%d> %s', [PeerIP, PeerPort, s]));
  case ABinding.Port of
    IdPORT_ECHO : ;
    IdPORT_CHARGEN :
      begin
        i := 1; c := '0'; row := 0;
        SetLength(s, UDPServer.BufferSize);
        while i <= Length(s) do
        begin
          if c > #95 then c := '0';
          if i mod (rowlength + 1) = 0 then
          begin
            s[i] := #13;
            c := chr(ord('0') + row mod (95 - ord('0')));
            inc(row);
          end
          else
            s[i] := c;
          inc(i); inc(c);
        end;
      end;
  end;
  with ABinding do
    SendTo(PeerIP, PeerPort, s[1], Length(s));
end;

end.

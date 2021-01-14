{-----------------------------------------------------------------------------
 Demo Name: ClientFrmMainUnit
 Author:    Helge Jung (helge@eco-logic-software.de)
 Copyright: Indy Pit Crew
 Purpose:
 History:   Improvements supplied by: Enver ALTIN
 Date:      27/10/2002 00:24:26
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 Demonstration on how to use TIdTCPServer and TIdTCPClient
 with using Threads and WriteBuffer/ReadBuffer


}

unit ClientFrmMainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, StdCtrls,
  GlobalUnit;

type
  TClientFrmMain = class(TForm)
                     CBClientActive: TCheckBox;
                     IncomingMessages: TMemo;
                     Label1: TLabel;
                     Client: TIdTCPClient;
                     Label2: TLabel;
                     EditCommand: TComboBox;
                     Label3: TLabel;
                     EditMessage: TEdit;
                     Label4: TLabel;
                     EditRecipient: TEdit;
                     ButtonSend: TButton;

                     procedure CBClientActiveClick(Sender: TObject);
                     procedure ButtonSendClick(Sender: TObject);

                    private

                    public

                   end;

  TClientHandleThread = class(TThread)
                         private
                          CB: TCommBlock;

                          procedure HandleInput;

                         protected
                          procedure Execute; override;

                        end;

var
  ClientFrmMain: TClientFrmMain;
  ClientHandleThread: TClientHandleThread;   // variable (type see above)

implementation

{$R *.DFM}

procedure TClientHandleThread.HandleInput;
begin
  if CB.Command = 'MESSAGE' then
    ClientFrmMain.IncomingMessages.Lines.Add (CB.MyUserName + ': ' + CB.Msg)
  else
  if CB.Command = 'DIALOG' then
    MessageDlg ('"'+CB.MyUserName+'" sends you this message:'+#13+CB.Msg, mtInformation, [mbOk], 0)
  else  // unknown command
    MessageDlg('Unknown command "'+CB.Command+'" containing this message:'+#13+CB.Msg, mtError, [mbOk], 0);
end;

procedure TClientHandleThread.Execute;
begin
  while not Terminated do
  begin
    if not ClientFrmMain.Client.Connected then
      Terminate
    else
    try
      ClientFrmMain.Client.ReadBuffer(CB, SizeOf (CB));
      Synchronize(HandleInput);
    except
    end;
  end;
end;

procedure TClientFrmMain.CBClientActiveClick(Sender: TObject);
begin
  if CBClientActive.Checked then
  begin
    try
      Client.Connect(10000);  // in Indy < 8.1 leave the parameter away

      ClientHandleThread := TClientHandleThread.Create(True);
      ClientHandleThread.FreeOnTerminate:=True;
      ClientHandleThread.Resume;
    except
      on E: Exception do MessageDlg ('Error while connecting:'+#13+E.Message, mtError, [mbOk], 0);
    end;
  end
  else
  begin
    ClientHandleThread.Terminate;
    Client.Disconnect;
  end;

  ButtonSend.Enabled := Client.Connected;
  CBClientActive.Checked := Client.Connected;
end;

procedure TClientFrmMain.ButtonSendClick(Sender: TObject);
var
  CommBlock : TCommBlock;

begin
  CommBlock.Command      := EditCommand.Text;         // assign the data
  CommBlock.MyUserName   := Client.LocalName;
  CommBlock.Msg          := EditMessage.Text;
  CommBlock.ReceiverName := EditRecipient.Text;

  Client.WriteBuffer (CommBlock, SizeOf (CommBlock), true);
end;

end.

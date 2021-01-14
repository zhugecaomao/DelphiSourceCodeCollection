unit Chatmain;

interface

uses
  Classes, QControls, QStdCtrls, QExtCtrls, QButtons, QForms, Sockets;


type
  TForm1 = class(TForm)
    memRecv: TMemo;
    Panel1: TPanel;
    memSend: TMemo;
    Panel2: TPanel;
    btnSend: TButton;
    Panel3: TPanel;
    Label1: TLabel;
    edtRemoteHost: TEdit;
    Label2: TLabel;
    edtRemotePort: TEdit;
    Label3: TLabel;
    edtLocalPort: TEdit;
    btnActivateServer: TButton;
    TcpClient1: TTcpClient;
    TcpServer1: TTcpServer;
    procedure btnSendClick(Sender: TObject);
    procedure TcpServer1Accept(sender: TObject;
      ClientSocket: TCustomIpClient);
    procedure btnActivateServerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  // you must create your own thread to synch
  // writing to a gui component
  TClientDataThread = class(TThread)
  private
  public
    ListBuffer :TStringList;
    TargetList :TStrings;
    procedure synchAddDataToControl;
    constructor Create(CreateSuspended: Boolean);
    procedure Execute; override;
    procedure Terminate;
  end;

var
  Form1: TForm1;
  //DataThread: TClientDataThread;

implementation

{$R *.xfm}

//------------- TClientDataThread impl -----------------------------------------
constructor TClientDataThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  FreeOnTerminate := true;
  ListBuffer := TStringList.Create;
end;

procedure TClientDataThread.Terminate;
begin
  ListBuffer.Free;
  inherited;
end;

procedure TClientDataThread.Execute;
begin
  Synchronize(synchAddDataToControl);
end;

procedure TClientDataThread.synchAddDataToControl;
begin
 TargetList.AddStrings(ListBuffer);
end;
//------------- end TClientDataThread impl -------------------------------------


procedure TForm1.btnActivateServerClick(Sender: TObject);
begin
  TcpServer1.LocalPort := edtLocalPort.Text;
  TcpServer1.Active := True;
end;         

procedure TForm1.btnSendClick(Sender: TObject);
var
  I: Integer;
begin
  TcpClient1.RemoteHost := edtRemoteHost.Text;
  TcpClient1.RemotePort := edtRemotePort.Text;
  try
    if TcpClient1.Connect then
      for I := 0 to memSend.Lines.Count - 1 do
      TcpClient1.Sendln(memSend.Lines[I]);
  finally
    TcpClient1.Disconnect;
  end;
end;

procedure TForm1.TcpServer1Accept(sender: TObject;
  ClientSocket: TCustomIpClient);
var
  s: string;
  DataThread: TClientDataThread;
begin
  // create thread
  DataThread:= TClientDataThread.Create(true);
  // set the TagetList to the gui list that you
  // with to synch with.
  DataThread.TargetList := memRecv.lines;

  // Load the Threads ListBuffer
  DataThread.ListBuffer.Add('*** Connection Accepted ***');
  DataThread.ListBuffer.Add('Remote Host: ' + ClientSocket.LookupHostName(ClientSocket.RemoteHost) +
   ' (' + ClientSocket.RemoteHost + ')');
  DataThread.ListBuffer.Add('===== Begin message =====');
  s := ClientSocket.Receiveln;
  while s <> '' do
  begin
    DataThread.ListBuffer.Add(s);
    s := ClientSocket.Receiveln;
  end;
  DataThread.ListBuffer.Add('===== End of message =====');

  // Call Resume which will execute and synch the
  // ListBuffer with the TargetList
  DataThread.Resume;

end;

end.

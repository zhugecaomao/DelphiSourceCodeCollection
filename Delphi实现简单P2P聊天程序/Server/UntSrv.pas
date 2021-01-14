unit UntSrv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp;

type
  TFrmSrv = class(TForm)
    SrvSocket: TServerSocket;
    gp1: TGroupBox;
    MemClientLink: TMemo;
    gb2: TGroupBox;
    gb3: TGroupBox;
    MemSendMsg: TMemo;
    btnSend: TButton;
    gp4: TGroupBox;
    MemClientMsg: TMemo;
    SrvSocket2: TServerSocket;
    SrvSocket1: TServerSocket;
    procedure SrvSocketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure SrvSocketListen(Sender: TObject; Socket: TCustomWinSocket);
    procedure SrvSocketClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure SrvSocketClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSrv: TFrmSrv;
  ClientHost:TList;
implementation

{$R *.dfm}
//监听客户端
procedure TFrmSrv.SrvSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ClientHost.Add(Socket);
  MemClientLink.Lines.Add(Socket.RemoteHost+':'+Socket.RemoteAddress);
end;

procedure TFrmSrv.FormCreate(Sender: TObject);
begin
  ClientHost:=TList.Create;
  MemClientLink.ReadOnly:=True;
end;
//程序在进行启动连接时
procedure TFrmSrv.SrvSocketListen(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  MemClientLink.Lines.Add('Link...'+#13+Socket.RemoteHost+Socket.RemoteAddress);
end;
//接收客户端信息
procedure TFrmSrv.SrvSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
Var
  Len : Word;
  Buf : Array of Char;
  Msg : String;
begin //当收到一次信息后,还会侦听一次
  try
    Socket.ReceiveBuf(Len,2); //前两个字节存放消息体内容长度
    if Len < 1 then Exit;
    SetLength(Buf,Len);
    Socket.ReceiveBuf(Buf[0],len);
    SetLength(Msg, len);
    Move(Buf[0], Msg[1], Len);
    MemClientMsg.Lines.Add(Socket.LocalHost+':'+Msg);
    MemClientMsg.Lines.Add(#13);
  except

  end;
end;
//释放客户端
procedure TFrmSrv.SrvSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ClientHost.Remove(Socket);
end;
//关闭窗体
procedure TFrmSrv.FormClose(Sender: TObject; var Action: TCloseAction);
Var
  I : Integer;
begin
  for i := 0 to ClientHost.Count-1 do ClientHost.Delete(i);
  FreeAndNil(ClientHost);
end;

procedure TFrmSrv.btnSendClick(Sender: TObject);
Var
  Len,I : Word;
  Buf : Array of Char;
  Msg : String;
begin
  if ClientHost.Count<=0 then
  begin
    MessageDlg('对不起，当前没有一台客户端程序！',MtWarning,[Mbyes],0);
    Exit;    
  end;

  Msg:=Trim(MemSendMsg.Text);
  Len:=Length(Msg);
  SetLength(Buf,Len+2);   //设置buf长度,前两个字节存放消息体内容长度
  Move(Len,Buf[0],2);     //把消息体内容长度放入前两个字节
  Move(Msg[1],Buf[2],Len);//把消息体内容放入包中,从第三个字节开始存放
  for i := 0 to ClientHost.Count-1 do
  begin
    try
      TCustomWinSocket(ClientHost[i]).SendBuf(Buf[0],Len+2);
    except
      TCustomWinSocket(ClientHost[i]).Close;
      ClientHost.Remove(ClientHost[i]);
    end;
  end;
end;

end.

unit frm_Ping;

interface
//Download by http://www.codefans.net
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,Winsock, ExtCtrls, XPMan;


 const  WS_VERSION_REQD = $101;
type

  PIPOptionInformation = ^TIPOptionInformation;

  TIPOptionInformation = packed record
    TTL: Byte;
    TOS: Byte;
    Flags: Byte;
    OptionsSize: Byte;
    OptionsData: PChar;
  end;

  PIcmpEchoReply = ^TIcmpEchoReply;

  TIcmpEchoReply = packed record
  Address: DWORD;
  Status: DWORD;
  RTT: DWORD;
  DataSize: Word;
  Reserved: Word;
  Data: Pointer;
  Options: TIPOptionInformation ;
  end;

  TIcmpCreateFile = function: THandle; stdcall;
  TIcmpCloseHandle = function(IcmpHandle: THandle):Boolean;stdcall;
  TIcmpSendEcho=Function(IcmpHandle:THandle;DestinationAddress:DWORD;RequestData:LPSTR;
                        RequestSize:Word;RequestOptions:PIPOptionInformation;ReplyBuffer: Pointer;
                        ReplySize: DWord;Timeout: DWord): DWord; stdcall;

  type
  TFrmPing = class(TForm)
    BtnStartPing: TButton;
    EdIP: TEdit;
    GBxPingData: TGroupBox;
    LblSAddr: TLabel;
    LblSRTT: TLabel;
    LblSDataSize: TLabel;
    LblAddr: TLabel;
    LblRTT: TLabel;
    LblDataSize: TLabel;
    LblStatus: TLabel;
    LblSStatus: TLabel;
    Label1: TLabel;
    BtnStop: TButton;
    BtnClose: TButton;
    TimerPing: TTimer;
    XPManifest1: TXPManifest;
    Bevel1: TBevel;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnStartPingClick(Sender: TObject);
    procedure TimerPingTimer(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
  private
    hICMPdll:HWND;
    hICMP: THANDLE;
    IcmpCreateFile : TIcmpCreateFile;
    IcmpCloseHandle: TIcmpCloseHandle;
    IcmpSendEcho: TIcmpSendEcho;
    procedure DllLoad;
    Procedure DllFree;
    procedure Ping;
    procedure StartPing;
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FrmPing: TFrmPing;
  torf: ShortInt ;

implementation

{$R *.dfm}

function inet_addr(const IP:LPSTR):DWORD;stdcall; external 'WSOCK32.dll'

procedure TFrmPing.DllLoad;
begin
  hICMPdll := LoadLibrary('icmp.dll');
  @ICMPCreateFile := GetProcAddress(hICMPdll, 'IcmpCreateFile');
  @IcmpCloseHandle := GetProcAddress(hICMPdll, 'IcmpCloseHandle');
  @IcmpSendEcho := GetProcAddress(hICMPdll, 'IcmpSendEcho');
end;

Procedure TFrmPing.DllFree;
begin
  FreeLibrary(hICMPdll);
end;



procedure TFrmPing.FormCreate(Sender: TObject);
begin
  DllLoad;
end;

procedure TFrmPing.FormDestroy(Sender: TObject);
begin
  DllFree;
end;

procedure TFrmPing.StartPing;
var
  WSAData: TWSAData;
begin
  WSAStartup(WS_VERSION_REQD,WSAData);
  hICMP := IcmpCreateFile;
  Ping;
  IcmpCloseHandle(hICMP);
  WSACleanup;
end;

procedure TFrmPing.BtnStartPingClick(Sender: TObject);
begin
  BtnStartPing.Enabled:=false;
  EDIP.Enabled:=false;
  TimerPing.Enabled:=true;
end;

procedure TFrmPing.Ping;
var
  IPOpt:TIPOptionInformation;
  pReqData,pRevData:PChar;
  pIPE:PIcmpEchoReply;
  FIPAddress:DWORD;
  FSize: DWORD;
  MyString:string;
  FTimeOut:DWORD;
  BufferSize:DWORD;
//  torf:string;
begin
  if Trim(EdIP.Text) <> '' then
  begin
    FIPAddress := inet_addr(Pchar(EdIP.Text));
    FSize := 40;
    BufferSize := SizeOf(TICMPEchoReply) + FSize;
    GetMem(pRevData,FSize);
    GetMem(pIPE,BufferSize);
    FillChar(pIPE^, SizeOf(pIPE^), 0);
    pIPE^.Data := pRevData;
    MyString := 'I''m Terry,Pinging your Computer now!!';
    pReqData := PChar(MyString);
    FillChar(IPOpt, Sizeof(IPOpt), 0);
    IPOpt.TTL := 64;
    FTimeOut := 400;
    IcmpSendEcho(hICMP, FIPAddress, pReqData, Length(MyString),@IPOpt,pIPE, BufferSize, FTimeOut);
    if pIPE^.Status = 0 then
    begin
      LblSStatus.Caption:='成功连通';
      LblSAddr.caption:=inttostr(pIPE^.Address);
      LblSDataSize.Caption:=inttostr(pIPE^.DataSize);
      LblSRTT.Caption:=inttostr(pIPE^.RTT);
      if pIPE^.RTT < 1 then
        LblSRTT.Caption:='小于1毫秒';
      if torf<>1 then
       begin
        ListBox1.Items.Add(DateTimeToStr(Date()) + FormatdateTime(' hh:mm', Now()) + '连接正常');
        torf:=1 ;
        end
    end
    else
      begin
        LblSStatus.Caption:='没有连通';
        LblSAddr.caption:='';
        LblSDataSize.Caption:='';
        LblSRTT.Caption:='';
       if torf=1then
       begin

        ListBox1.Items.Add(DateTimeToStr(Date()) + FormatdateTime(' hh:mm', Now()) + '连接异常');
       torf:=2;
       end;
      end;
    FreeMem(pRevData);
    FreeMem(pIPE,BufferSize);
  end;
end;


procedure TFrmPing.TimerPingTimer(Sender: TObject);
begin
  StartPing;
end;

procedure TFrmPing.BtnStopClick(Sender: TObject);
begin
  TimerPing.Enabled:=false;
  EDIP.Enabled:=true;
  BtnStartPing.Enabled:=true;
end;

procedure TFrmPing.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

end.

unit Connection;

interface

uses
  Windows, Messages,Classes,NetConnection;


const
  WM_ASYNCCONNECTION = WM_USER + 80;

type
  TNetConnectionReply = procedure(Sender: TObject; IConnection: TObject; Error : Integer) of object;
  TNetConnection = class(TComponent)
  private
    FIConnection      : TIConnection;
    FWindowHandle     : HWND;
    FOnEchoClose    : TNetConnectionReply;
    FOnEchoOpen     : TNetConnectionReply;
    FOnEchoShareName : TNetConnectionReply;
    FOnOpenSucceed : TNotifyEvent;
    procedure   SetAddress(Value : String);
    function    GetAddress : String;
    procedure   SetShareName(Value : String);
    function    GetShareName : String;
    procedure   my_SetUserName(Value : String);
    function    my_GetUserName : String;
    procedure   SetPassWord(Value : String);
    function    GetPassWord : String;
    function    Get_list : TStringlist;
    function    Get_list_info : TStringlist;
    procedure   Set_autodo(Value :boolean);
    function    Get_autodo:boolean;
    procedure   Set_info(Value :boolean);
    function    Get_info:boolean;
 protected
    procedure   WndProc(var MsgRec: TMessage);
    procedure   WMAsyncGetHostByName(var msg: TMessage); message WM_ASYNCCONNECTION;

    procedure   NetConEchoOpen(Sender: TObject; Error : Integer);
    procedure   NetConEchoClose(Sender: TObject; Error : Integer);
    procedure   NetConEchoShareEnum(Sender: TObject; Error : Integer);
    procedure   NetOpenSucceed(Sender: TObject);
  public
    constructor Create(Owner : TComponent); override;
    destructor  Destroy; override;

    function    open : Integer;
    function    close : Integer;
    function    ShareEnum : Integer;
    function   NetQueryDisplayInformation(Level:integer;var list:Tstringlist):integer;
    function   get_user(Level:integer;var list:Tstringlist):integer;
    function   EnumServices(var var_list:Tstringlist):integer;
    function   GetServerInfo:integer;

    property    Handle      : HWND           read FWindowHandle;
    property    list      : Tstringlist      read get_list;
    property    list_info      : Tstringlist      read get_list_info;
  published
    property    Address     : String         read  GetAddress write SetAddress;
    property    ShareName     : String         read  GetShareName write SetShareName;
    property    UserName     : String         read  my_GetUserName write my_SetUserName;
    property    PassWord     : String         read  GetPassWord write SetPassWord;
    property    AutoDo     : boolean         read  Get_autodo write Set_autodo;
    property    GetInfo     : boolean         read  Get_Info write Set_info;
    property    OnEchoClose : TNetConnectionReply read  FOnEchoClose
                                             write FOnEchoClose;
    property    OnEchoOpen   : TNetConnectionReply   read  FOnEchoOpen
                                             write FOnEchoOpen;
    property    OnEchoShareEnum   : TNetConnectionReply   read  FOnEchoShareName
                                             write FOnEchoShareName;
    property    OnOpenSucceed    : TNotifyEvent   read  FOnOpenSucceed write FOnOpenSucceed;
  end;

procedure Register;

implementation


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ This function is a callback function. It means that it is called by       }
{ windows. This is the very low level message handler procedure setup to    }
{ handle the message sent by windows (winsock) to handle messages.          }
function XSocketWindowProc(
    ahWnd   : HWND;
    auMsg   : Integer;
    awParam : WPARAM;
    alParam : LPARAM): Integer; stdcall;
var
    Obj    : TNetConnection;
    MsgRec : TMessage;
begin
    { At window creation ask windows to store a pointer to our object       }
    Obj := TNetConnection(GetWindowLong(ahWnd, 0));

    { If the pointer is not assigned, just call the default procedure       }
    if not Assigned(Obj) then
        Result := DefWindowProc(ahWnd, auMsg, awParam, alParam)
    else begin
        { Delphi use a TMessage type to pass paramter to his own kind of    }
        { windows procedure. So we are doing the same...                    }
        MsgRec.Msg    := auMsg;
        MsgRec.wParam := awParam;
        MsgRec.lParam := alParam;
        Obj.WndProc(MsgRec);
        Result := MsgRec.Result;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ This global variable is used to store the windows class characteristic    }
{ and is needed to register the window class used by TWSocket               }
var
    XSocketWindowClass: TWndClass = (
        style         : 0;
        lpfnWndProc   : @XSocketWindowProc;
        cbClsExtra    : 0;
        cbWndExtra    : SizeOf(Pointer);
        hInstance     : 0;
        hIcon         : 0;
        hCursor       : 0;
        hbrBackground : 0;
        lpszMenuName  : nil;
        lpszClassName : 'INetConnectionClass');


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ Allocate a window handle. This means registering a window class the first }
{ time we are called, and creating a new window each time we are called.    }
function XSocketAllocateHWnd(Obj : TObject): HWND;
var
    TempClass       : TWndClass;
    ClassRegistered : Boolean;
begin
    { Check if the window class is already registered                       }
    XSocketWindowClass.hInstance := HInstance;
    ClassRegistered := GetClassInfo(HInstance,
                                    XSocketWindowClass.lpszClassName,
                                    TempClass);
    if not ClassRegistered then begin
       { Not yet registered, do it right now                                }
       Result := Windows.RegisterClass(XSocketWindowClass);
       if Result = 0 then
           Exit;
    end;

    { Now create a new window                                               }
    Result := CreateWindowEx(WS_EX_TOOLWINDOW,
                           XSocketWindowClass.lpszClassName,
                           '',        { Window name   }
                           WS_POPUP,  { Window Style  }
                           0, 0,      { X, Y          }
                           0, 0,      { Width, Height }
                           0,         { hWndParent    }
                           0,         { hMenu         }
                           HInstance, { hInstance     }
                           nil);      { CreateParam   }

    { if successfull, the ask windows to store the object reference         }
    { into the reserved byte (see RegisterClass)                            }
    if (Result <> 0) and Assigned(Obj) then
        SetWindowLong(Result, 0, Integer(Obj));
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ Free the window handle                                                    }
procedure XSocketDeallocateHWnd(Wnd: HWND);
begin
    DestroyWindow(Wnd);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TNetConnection.WndProc(var MsgRec: TMessage);
begin
     with MsgRec do begin
         if Msg = WM_ASYNCCONNECTION then
             WMAsyncGetHostByName(MsgRec)
         else
             Result := DefWindowProc(Handle, Msg, wParam, lParam);
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TNetConnection.WMAsyncGetHostByName(var msg: TMessage);
//var
//    Phe     : Phostent;
//    IPAddr  : TInAddr;
//    Error   : Word;
begin
//    if msg.wParam <> LongInt(FDnsLookupHandle) then
        Exit;
{    FDnsLookupHandle := 0;
    Error := Msg.LParamHi;
    if Error = 0 then begin
        Phe        := PHostent(@FDnsLookupBuffer);
        IPAddr     := PInAddr(Phe^.h_addr_list^)^;
        FDnsResult := StrPas(inet_ntoa(IPAddr));
    end;

    if Assigned(FOnDnsLookupDone) then
        FOnDnsLookupDone(Self, Error);
  }
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
constructor TNetConnection.Create(Owner : TComponent);
begin
    Inherited Create(Owner);
    FIConnection := TIConnection.Create;
    FIConnection.OnEchoClose :=NetConEchoClose;
    FIConnection.OnEchoOpen   :=NetConEchoOpen;
    FIConnection.OnShareEnum   :=NetConEchoShareEnum;
    FIConnection.OnOpenSucceed :=NetOpenSucceed;
    { Delphi 32 bits has threads and VCL is not thread safe.                }
    { We need to do our own way to be thread safe.                          }

    FWindowHandle := XSocketAllocateHWnd(Self);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
destructor TNetConnection.Destroy;
begin
    XSocketDeallocateHWnd(Handle);
    if Assigned(FIConnection) then begin
        FIConnection.Destroy;
        FIConnection := nil;
    end;
    inherited Destroy;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TNetConnection.NetConEchoOpen(Sender: TObject; Error : Integer);
begin
    if Assigned(FOnEchoOpen) then
        FOnEchoOpen(Self, Sender, Error);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TNetConnection.NetConEchoClose(Sender: TObject;Error : Integer);
begin
    if Assigned(FOnEchoClose) then
        FOnEchoClose(Self, Sender,Error);
end;

procedure  TNetConnection.NetConEchoShareEnum(Sender: TObject; Error : Integer);
begin
    if Assigned(FOnEchoShareName) then
        FOnEchoShareName(Self, Sender,Error);
end;

procedure  TNetConnection.NetOpenSucceed(Sender: TObject);
begin
    if Assigned(FOnOpenSucceed) then
        FOnOpenSucceed(Self);
end;
{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TNetConnection.open : Integer;
begin
    if Assigned(FIConnection) then
        Result := FIConnection.open
    else
        Result :=4000;
end;
function TNetConnection.close : Integer;
begin
    if Assigned(FIConnection) then
        Result := FIConnection.close
    else
        Result :=4000;
end;

function TNetConnection.ShareEnum : Integer;
begin
    if Assigned(FIConnection) then
        Result :=FIConnection.ShareEnum
    else
       Result :=4000;
end;
function  TNetConnection.NetQueryDisplayInformation(Level:integer;var list:Tstringlist):integer;
begin
    if Assigned(FIConnection) then
        Result :=FIConnection.NetQueryDisplayInformation(Level,list)
    else
       Result :=4000;
end;
function  TNetConnection.get_user(Level:integer;var list:Tstringlist):integer;
begin
    if Assigned(FIConnection) then
        Result :=FIConnection.get_user(Level,list)
    else
       Result :=4000;
end;

function TNetConnection.EnumServices(var var_list:Tstringlist):integer;
begin
    if Assigned(FIConnection) then
        Result :=FIConnection.my_EnumServices(var_list)
    else
       Result :=4000;
end;

function TNetConnection.GetServerInfo:integer;
begin
    if Assigned(FIConnection) then
        Result :=FIConnection.getserverinfo
    else
       Result :=4000;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TNetConnection.SetAddress(Value : String);
begin
    if Assigned(FIConnection) then
        FIConnection.Address := Value;
end;
{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TNetConnection.GetAddress : String;
begin
    if Assigned(FIConnection) then
        Result := FIConnection.Address
    else
        Result := '';
end;
procedure TNetConnection.SetShareName(Value : String);
begin
    if Assigned(FIConnection) then
        FIConnection.ShareName := Value;
end;

function TNetConnection.GetShareName: String;
begin
     if Assigned(FIConnection) then
        Result := FIConnection.ShareName
    else
        Result := '';
end;

procedure TNetConnection.my_SetUserName(Value : String);
begin
    if Assigned(FIConnection) then
        FIConnection.UserName := Value;
end;

function TNetConnection.my_GetUserName: String;
begin
     if Assigned(FIConnection) then
        Result := FIConnection.UserName
    else
        Result := '';
end;

procedure TNetConnection.SetPassWord(Value : String);
begin
    if Assigned(FIConnection) then
        FIConnection.PassWord := Value;
end;

function TNetConnection.getPassWord: String;
begin
     if Assigned(FIConnection) then
        Result := FIConnection.PassWord
    else
        Result := '';
end;
function   TNetConnection.Get_list : TStringlist;
begin
     if Assigned(FIConnection) then
        Result := FIConnection.list
    else
        Result :=nil;
end;

function   TNetConnection.Get_list_info : TStringlist;
begin
     if Assigned(FIConnection) then
        Result := FIConnection.list_info
    else
        Result :=nil;
end;

procedure TNetConnection.Set_autodo(Value :boolean);
begin
    if Assigned(FIConnection) then
        FIConnection.autodo := Value;
end;

function  TNetConnection.Get_autodo:boolean;
 begin
     if Assigned(FIConnection) then
        Result := FIConnection.autodo
      else  Result:=false;
 end;
function  TNetConnection.Get_info:boolean;
 begin
     if Assigned(FIConnection) then
        Result := FIConnection.FGetInfo
      else  Result:=false;
 end;

procedure TNetConnection.Set_info(Value :boolean);
begin
    if Assigned(FIConnection) then
        FIConnection.FGetInfo := Value;
end;


procedure Register;
begin
    RegisterComponents('My_net', [TNetConnection]);
end;

end.



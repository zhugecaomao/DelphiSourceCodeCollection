unit lxpTrayIcon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Menus, ShellApi, ExtCtrls;

const
  ICON_ID = 1;
  MI_ICONEVENT = WM_USER + 1;

type
  TlxpTrayIcon = class(TComponent)
  private
    { Private declarations }
    FTrayIcon: TIcon;
    FInterval: Cardinal;
    FPopupMenu: TPopupMenu;
    FNotificationWnd: HWnd;
    FHint: String;
    FStartAtBoot: Boolean;
    FOnDblClick: TNotifyEvent;
    TimerHandle: LongWord;
    NotifyIconData: TNotifyIconData;
    OldWindowProc: TWndMethod;
    procedure NotificationWndProc(var Message: TMessage);
    procedure SetTrayIcon(const Value: TIcon);
    procedure SetStartAtBoot(const Value: Boolean);
    procedure Registry(B: Boolean);
    procedure NewWindowProc(var Message: TMessage);
  protected
    { Protected declarations }
    procedure DoDblClick;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override; 
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor  Destroy;override;
    procedure RestoreApp;
    procedure ShowTrayIcon(Mode: Cardinal = NIM_ADD; Animated: Boolean = False);
  published
    { Published declarations }
    property Hint: String read FHint write FHint;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property PopupMenu: TPopupMenu read FPopupMenu write FPopupMenu;
    property TrayIcon: TIcon read FTrayIcon write SetTrayIcon;
    property StartAtBoot: Boolean read FStartAtBoot write SetStartAtBoot;
    property Interval: Cardinal read FInterval write FInterval;
  end;

procedure Register;

implementation

uses Forms, Registry;

var
  FlxpTrayIcon: TlxpTrayIcon;

procedure Register;
begin
  RegisterComponents('lxpbuaa', [TlxpTrayIcon]);
end;

{ TlxpTrayIcon }

constructor TlxpTrayIcon.Create(AOwner: TComponent);
begin      
  inherited Create(AOwner);
  FlxpTrayIcon := Self;
  FTrayIcon := TIcon.Create;
  FInterval := 500;
  TimerHandle := 0;
  FNotificationWnd := Classes.AllocateHWnd(NotificationWndProc);

  if AOwner is TForm then
  begin
    OldWindowProc := TForm(AOwner).WindowProc;
    TForm(AOwner).WindowProc := NewWindowProc;
  end;
end;

procedure TlxpTrayIcon.NewWindowProc(var Message: TMessage);
begin
  if Assigned(OldWindowProc) then
    OldWindowProc(Message);
  with Message do
  if (Msg = WM_SYSCOMMAND) and
     (WParam = SC_MINIMIZE) then
    ShowWindow(Application.Handle, SW_HIDE);
end;

destructor TlxpTrayIcon.Destroy;
begin
  ShowTrayIcon(NIM_DELETE);
  FreeAndNil(FTrayIcon);
  if FNotificationWnd <> 0 then
    Classes.DeallocateHWnd(FNotificationWnd);
  if TimerHandle <> 0 then
    KillTimer(0, TimerHandle);
  inherited Destroy;
end;

procedure TlxpTrayIcon.DoDblClick;
begin
  if Assigned(OnDblClick) then OnDblClick(Self);
end;

procedure TlxpTrayIcon.Loaded;
begin
  inherited;

  if not (csDesigning in ComponentState) then
  begin
    if FTrayIcon.Handle = 0 then
      FTrayIcon.Assign(Application.Icon);
    //≥ı ºªØ NotifyIconData
    FillChar(NotifyIconData,SizeOf(NotifyIconData),0);
    with NotifyIconData do
    begin
      cbSize := SizeOf(TNotifyIconData);
      Wnd := FNotificationWnd;
      uID := ICON_ID;
      uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;
      uCallBackMessage := MI_ICONEVENT;
      hIcon := FTrayIcon.Handle;
      StrLCopy(szTip,PChar(Hint),SizeOf(szTip));
    end;
    ShowTrayIcon;
  end;
end;

procedure TlxpTrayIcon.NotificationWndProc(var Message: TMessage);
var
  P: TPoint;
begin
  if Message.Msg = MI_ICONEVENT then
  begin
    case Message.LParam of
      WM_LBUTTONDBLCLK:
      begin
        DoDblClick;
        RestoreApp;
      end;
      WM_RBUTTONDOWN:
      begin
        if Assigned(FPopupMenu) then
        begin
          GetCursorPos(P);
          FPopupMenu.Popup(P.X,P.Y);
        end;
      end;
    end;
  end else Message.Result :=
    DefWindowProc(FNotificationWnd, Message.Msg, Message.WParam, Message.lParam);
end;  

procedure SetAnimatedIcon(Wnd: HWND; Msg, idEvent: UINT; dwTime: DWORD); stdcall;
begin
  if Msg = WM_TIMER then with FlxpTrayIcon.NotifyIconData do
  begin
    if hIcon = 0 then hIcon := FlxpTrayIcon.FTrayIcon.Handle
    else hIcon := 0;
    Shell_NotifyIcon(NIM_MODIFY, @FlxpTrayIcon.NotifyIconData);
  end;
end;

procedure TlxpTrayIcon.ShowTrayIcon(Mode: Cardinal = NIM_ADD; Animated: Boolean = False);
begin
  if csDesigning in ComponentState then Exit;
  if Mode = NIM_MODIFY then
  begin
    if Animated then
    begin
      if TimerHandle = 0 then
        TimerHandle := SetTimer(0, 0, FInterval, @SetAnimatedIcon)
    end else if TimerHandle <> 0 then
    begin
      KillTimer(0, TimerHandle);
      TimerHandle := 0;
      NotifyIconData.hIcon := FTrayIcon.Handle;
    end;
  end;
  Shell_NotifyIcon(Mode, @NotifyIconData);
end;

procedure TlxpTrayIcon.RestoreApp;
begin
  ShowTrayIcon(NIM_MODIFY, False);
  ShowWindow(Application.Handle, SW_SHOWNORMAL);
  ShowWindow(Application.MainForm.Handle, SW_SHOWNORMAL);
  //Application.MainForm.Show;
  SetForegroundWindow(Application.MainForm.Handle);
end;


procedure TlxpTrayIcon.SetTrayIcon(const Value: TIcon);
begin
  FTrayIcon.Assign(Value);
end;

procedure TlxpTrayIcon.SetStartAtBoot(const Value: Boolean);
begin
  if FStartAtBoot <> Value then
  begin
    FStartAtBoot := Value;
    if not (csDesigning in ComponentState) then
      Registry(FStartAtBoot);
  end;
end;

procedure TlxpTrayIcon.Registry(B: Boolean);
var
  Reg: TRegistry;
  KeyName: String;
begin
  Reg := TRegistry.Create;
  KeyName := ExtractFileName(Application.ExeName);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', false) then
    begin
      if B then
        Reg.WriteString(KeyName,Application.ExeName)
      else Reg.DeleteKey(KeyName);
      Reg.CloseKey;
    end;
  finally
    FreeAndNil(Reg);
  end;
end;

procedure TlxpTrayIcon.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent = FPopupMenu then FPopupMenu := nil;
  end;
end;

end.

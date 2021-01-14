unit MenuExec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, Menus, StdCtrls, ComCtrls, ToolWin, DBCtrls,
  IniFiles, ExtDlgs, Buttons, Grids, DBGrids, ImgList, Registry, ShellAPI,
  MMSystem;

var T: TWindowState;

const
  SysFile = 'C:\PAS\XED.INT';
  WM_TRAYNOTIFY = WM_USER + 1000;
  MY_TRAY_ICON = WM_USER + 1001;
  MY_mess = WM_USER + 1002;
type
  TA00Form = class(TForm)
    Panel1: TPanel;
    CoolBar1: TCoolBar;
    Animate1: TAnimate;
    ToolBar2: TToolBar;
    MainMenu1: TMainMenu;
    Window: TMenuItem;
    Pop1: TPopupMenu;
    MExit: TMenuItem;
    M2: TMenuItem;
    M4: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Watch: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    About: TMenuItem;
    N35: TMenuItem;
    ViewBase: TMenuItem;
    PassWord: TMenuItem;
    Open1: TOpenPictureDialog;
    PopupCalBtnFrom: TSpeedButton;
    CDR: TMenuItem;
    CPU1: TMenuItem;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    N36: TMenuItem;
    Panel2: TPanel;
    Image1: TImage;
    N15: TMenuItem;
    MainBtn: TToolButton;
    MonthData: TMenuItem;
    ViewData: TMenuItem;
    InOut: TMenuItem;
    Come: TMenuItem;
    Leave: TMenuItem;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    N41: TMenuItem;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    N3: TMenuItem;
    N11: TMenuItem;
    miLogin: TMenuItem;
    miDele: TMenuItem;
    miModify: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N20: TMenuItem;
    D1: TMenuItem;
    N19: TMenuItem;
    N24: TMenuItem;
    procedure AboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure Minimize(Sender: TObject);
    procedure MExitClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure ViewBaseClick(Sender: TObject);
    procedure LetWindowLive(var MSG: TMessage); message WM_QUERYEndSession;
    procedure CDRClick(Sender: TObject);
    procedure CPU1Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure Maximize(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure MonthDataClick(Sender: TObject);
    procedure MainTask(Sender: TObject);
    procedure ViewDataClick(Sender: TObject);
    procedure ComeClick(Sender: TObject);
    procedure LeaveClick(Sender: TObject);
    procedure PassWordClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N41Click(Sender: TObject);
    procedure ViewVForm(Sender: TObject);
    procedure DoPassWord(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
  private
    { Private declarations }
    OldWinProc, NewWinProc: Pointer;
    procedure MyDraw(var Msg: TMessage);
  public
    Logined: Boolean;
    procedure OnIdle(Sender: TObject; var Done: Boolean);
    { Public declarations }
  protected
    procedure WMTrayNotify(var Msg: TMessage); message WM_TRAYNOTIFY;
    procedure SetPrintTo();
  end;

var
  NT: TNotifyIconData;
  A00Form: TA00Form;
  TMP: integer;
  Dire: Boolean;
  Number: Byte;
  Time: Longint;
  Login: Boolean = False;
  Exames: Boolean = False;
var
  Seet: Boolean = True;
  LL: Word = 0;
  PP: Boolean = False;
const
  S = '欢迎使用娱乐收费管理程序（版本3.0）,祝你工作愉快';

implementation

uses Mydesk, MyPict, AboutPas, BasePas,
  Xeduser, BDE, Speed1, GetStru, Work01, ComePas, CMonth, ViewPas, LeftPas,
  Data, Authors, LogVisor, DataPas, KardPas;

{$R *.DFM}

//  1092608;

procedure TA00Form.SetPrintTo();
var
  F: TInifile;
  dSize, dWidth, dLength: Integer;
  dOrder: Boolean;
begin
  F := TIniFile.Create('.\Printer.INI');
  dSize  := F.ReadInteger('打印机参数', '纸张', 256);
  dWidth := F.ReadInteger('打印机参数', '宽度', 1024);
  dLength:= F.ReadInteger('打印机参数', '长度', 1024);
  dOrder := F.ReadBool('打印机参数', '方向', True);
  F.WriteInteger('打印机参数', '纸张', dSize);
  F.WriteInteger('打印机参数', '宽度', dWidth);
  F.WriteInteger('打印机参数', '长度', dLength);
  F.WriteBool('打印机参数', '方向', dOrder);
  F.Free;
  SetLocPrint(dSize, dWidth, dLength, dOrder);
end;

procedure TA00Form.LetWindowLive(var MSG: TMessage);
begin
  MSG.Result := 0;
end;

procedure LoadMode(A: TFormClass);
begin
  with A.Create(Application) do begin
    Showmodal;
    Free;
  end;
end;

procedure TA00Form.AboutClick(Sender: TObject);
begin
  Application.CreateForm(TAboutForm, AboutForm);
  AboutForm.Showmodal;
  AboutForm.Free;
end;

procedure TA00Form.WMTrayNotify(var Msg: TMessage);
var
  PT: TPoint;
begin
  case MSG.lParam of
    WM_LBUTTONUP, WM_RBUTTONUP:
      if IsWindowVisible(Handle) then begin
        Application.Minimize;
      end else begin
        Application.Restore;
        if MSG.lParam = WM_RBUTTONUP then begin
          GetCursorPos(Pt);
          Pop1.Popup(PT.X, PT.Y);
        end;
      end;
  end;
end;

procedure TA00Form.MyDraw(var Msg: TMessage);
begin
  with Msg do Result := CallWindowProc(OldWinProc,
      ClientHandle, msg, wParam, lParam);
  if (Msg.Msg = wm_EraseBkgnd) then
  begin Canvas.Handle := Msg.WParam;
    Canvas.StretchDraw(GetClientRect, Image1.Picture.Graphic);
  end;
end;

procedure TA00Form.Minimize(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_Hide);
  ShowWindow(Handle, SW_Hide);
end;

procedure TA00Form.Maximize(Sender: TObject);
begin
  SetForeGroundWindow(Handle);
  ShowWindow(Application.Handle, SW_Show);
end;

procedure TA00Form.FormCreate(Sender: TObject);
var P: array[0..79] of Char;
  R: TRegistry;

var
  S: ^DWord;
  Hour, Min, Sec, MSec: Word;
  PP: string;
  H: Integer;
begin
  Try
    Animate1.FileName := 'Cool.avi';
    Animate1.Active := True;
  Except End;
  Top := 0;
  Left := 0;
  Width := 640;
  Height := 480;
//  SystemParametersInfo(SPI_SCREENSAVERRUNNING, 1, @Tmp, 0);
  Application.OnMinimize := Minimize;
  Application.OnRestore := Maximize;
  NewWinProc := MakeObjectInstance(MyDraw);
  OldWinProc := Pointer(setWindowLong(ClientHandle, gwl_WndProc, Cardinal(NewWinProc)));
  Application.Onidle := OnIdle;
  GetWindowsDirectory(P, 40);
  R := TRegIniFile.Create('Control Panel');
  R.OpenKey('Desktop', False);
  DeskBMP := R.ReadString('Wallpaper');
  R.Free;
  if FileExists(DeskBMP) then begin
    Image1.Picture.LoadFromFile(DeskBMP);
  end;
  Panel2.Hide;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  Application.title := '娱乐室';
  Panel1.Align := alBottom;
  Panel2.Align := alClient;
  CoolBar1.Align := AlTop;
  Dire := False;
  FormResize(Self);

  Time := GetCurrentTime;
  New(S);
  S^ := 255;
  DecodeTime(Now, Hour, Min, Sec, MSec);
  case Hour of
    00..06: PP := '凌晨';
    07..11: PP := '上午';
    12..13: PP := '中午';
    14..17: PP := '下午';
    18..23: PP := '晚上';
  end;
  SetAlias('PLAYBALL', ExtractFileDir(ParamStr(0)));
  DM.PassWord.Open;
  H := DM.PassWord.RecordCount;
  DM.PassWord.Close;
  if (H = 0) then Begin
    Application.MessageBox(
      '系统目前还没有设置任何操作员及密码'#13#13 +
      '为了安全起见，请设置至少一个操作员',
      '系统提示', MB_OK + MB_ICONWARNING);
  End Else Begin
    Logined := False;
    DoPassWord(miLogin);
    if not Logined then Application.Terminate;
  End;
  with NT do begin
    cbSize := Sizeof(TNOTIFYICONDATA);
    Wnd := Handle;
    UID := MY_TRAY_ICON;
    uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;
    uCallBackMessage := WM_TRAYNOTIFY;
    hIcon := LoadIcon(HInstance, 'MAINICON');
    szTip := '娱乐室管理程序'#0;
  end;
  Shell_NotifyIcon(NIM_ADD, @NT);
  LoadSite(Handle, '娱乐室管理系统');
  Show; Update;
  MainTask(Self);
end;

procedure TA00Form.N21Click(Sender: TObject);
begin
  N21.Checked := not N21.Checked;
  Coolbar1.Visible := N21.Checked;
end;

procedure TA00Form.N22Click(Sender: TObject);
begin
  N22.Checked := not N22.Checked;
  Panel1.Visible := N22.Checked;
end;

procedure TA00Form.FormResize(Sender: TObject);
begin
  if Width < 350 then width := 350;
  if Height < 280 then Height := 280;
end;

procedure TA00Form.N23Click(Sender: TObject);
begin
  Application.CreateForm(TPictForm, PictForm);
  PictForm.ShowModal;
  PictForm.Free;
end;

procedure TA00Form.MExitClick(Sender: TObject);
begin
  Close;
end;

procedure TA00Form.N1Click(Sender: TObject);
begin
  Showmessage('没有帮助信息');
end;

procedure TA00Form.N5Click(Sender: TObject);
begin
  LoadMode(TDeskForm);
end;

procedure TA00Form.N7Click(Sender: TObject);
begin
  run('MSHearts');
end;

procedure TA00Form.N8Click(Sender: TObject);
begin
  run('FreeCell');
end;

procedure TA00Form.N9Click(Sender: TObject);
begin
  Run('WinMine');
end;

procedure TA00Form.N10Click(Sender: TObject);
begin
  Run('Sol');
end;

procedure TA00Form.ViewBaseClick(Sender: TObject);
begin
  Application.CreateForm(TBaseForm, BaseForm);
  BaseForm.Showmodal;
  BaseForm.Free;
end;

procedure TA00Form.OnIdle(Sender: TObject; var Done: Boolean);
var Time2: Longint;
begin
  if (MDIChildCount = 0) and (DeskBMP = '') then Panel2.Show
  else Panel2.Hide;
  Done := False;
  Time2 := GetCurrentTime;
  if Time2 - Time >= 200 then begin
    Time := Time2;
    Panel1.Caption := Copy(S, 1, LL);
    LL := LL + 2;
    if LL > Length(S) then LL := 2;
    Panel1.Update;
  end;
end;

procedure TA00Form.CDRClick(Sender: TObject);
begin
  if CDR.Caption = '&5. 打开[CDROM]' then begin
    CDR.Caption := '&5. 关闭[CDROM]';
    mciSendString('Set cdaudio door open wait', nil, 0, handle);
  end else
    if CDR.Caption = '&5. 关闭[CDROM]' then begin
      CDR.Caption := '&5. 打开[CDROM]';
      mciSendString('Set cdaudio door closed wait', nil, 0, handle);
    end;
end;

procedure TA00Form.CPU1Click(Sender: TObject);
begin
  LoadMode(TSpeed);
end;

procedure TA00Form.ToolButton8Click(Sender: TObject);
begin
//  PostQuitMessage(0);
end;

procedure TA00Form.N15Click(Sender: TObject);
begin
  Application.CreateForm(TReadStru, ReadStru);
  ReadStru.Showmodal;
  ReadStru.Free;
end;

procedure TA00Form.MonthDataClick(Sender: TObject);
begin
  Application.CreateForm(TMMonth, MMonth);
  MMonth.Showmodal;
  MMonth.Free;
end;

procedure TA00Form.MainTask(Sender: TObject);
begin
  Hide;
  StateForm := TStateForm.Create(Application);
  StateForm.ShowModal;
  StateForm.Free;
  Show;
end;

procedure TA00Form.ViewDataClick(Sender: TObject);
begin
  Application.CreateForm(TStateForm, StateForm);
  StateForm.ShowModal;
  StateForm.Free;
end;

procedure TA00Form.ComeClick(Sender: TObject);
begin
  Application.CreateForm(TComeForm, ComeForm);
  ComeForm.Showmodal;
  ComeForm.Free;
end;

procedure TA00Form.LeaveClick(Sender: TObject);
begin
  Application.CreateForm(TLeftForm, LeftForm);
  LeftForm.Showmodal;
  LeftForm.Free;
end;

procedure TA00Form.PassWordClick(Sender: TObject);
begin
  if not Systemor then Exit;
  Application.CreateForm(TAuthor, Author);
  Author.ShowModal;
  Author.Free;
end;

procedure TA00Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SystemParametersInfo(SPI_SCREENSAVERRUNNING, 0, @Tmp, 0);
  Shell_NotifyIcon(NIM_DELETE, @NT);
  SaveSite(Handle, '娱乐室管理系统');
end;

procedure TA00Form.N41Click(Sender: TObject);
begin
  ExitWindowsEx(EWX_SHUTDOWN, 0);
end;

procedure TA00Form.ViewVForm(Sender: TObject);
begin
  Application.CreateForm(TViewForm, ViewForm);
  ViewForm.Showmodal;
  ViewForm.Free;
end;

procedure TA00Form.DoPassWord(Sender: TObject);
begin
  LogForm := TLogForm.Create(Application);
  LogForm.Page1.ActivePageIndex := TMenuItem(Sender).Tag;
  LogForm.Page1.ActivePage.Show;
  LogForm.ShowModal;
end;

procedure TA00Form.D1Click(Sender: TObject);
begin
  if Not Systemor then Exit;
  Application.CreateForm(TDataForm, DataForm);
  DataForm.Showmodal;
  DataForm.Free;
end;

procedure TA00Form.N24Click(Sender: TObject);
begin
  CardForm := TCardForm.Create(Application);
  CardForm.ShowModal;
  CardForm.Free;
end;

end.

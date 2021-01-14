unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mxOutlookBar, ComCtrls, ToolWin, ExtCtrls, StdActns, ActnList,
  RegControls, ImgList, TFlatHintUnit, Menus, ActnMan, BandActn, ActnCtrls,
  ActnMenus, TFlatTitlebarUnit, TFlatAnimWndUnit, Buttons,
  TFlatSpeedButtonUnit, TFlatPanelUnit, CoolTrayIcon, TextTrayIcon,
  TFlatButtonUnit, XPMenu, TB2Dock, TB2Toolbar, TB2Item, TB2MDI, TBSkinPlus,
  TB2ToolWindow;

type
  TfrmMain = class(TForm)
    FlatHint1: TFlatHint;
    imgTray: TImageList;
    RegForm1: TRegForm;
    ActionList1: TActionList;
    actRestore: TAction;
    actTerminal: TAction;
    WindowArrange1: TWindowArrange;
    WindowCascade1: TWindowCascade;
    WindowClose1: TWindowClose;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowCloseAll: TAction;
    ActionManager1: TActionManager;
    ImageList2: TImageList;
    imgOutLook: TImageList;
    actEMP: TAction;
    Image1: TImage;
    actGood: TAction;
    actIN: TAction;
    actSupp: TAction;
    actCust: TAction;
    actOut: TAction;
    SpeedButton1: TSpeedButton;
    actType: TAction;
    Action1: TAction;
    StatusBar: TStatusBar;
    Timer_system: TTimer;
    TBTopDock: TTBDock;
    TBSkin: TTBSkin;
    TBMDIHandler: TTBMDIHandler;
    TBDockLeft: TTBDock;
    TBToolWindow1: TTBToolWindow;
    mxOutlookBar: TmxOutlookBar;
    oo: TmxOutlookBarHeader;
    btnCust: TOutlookButton;
    Button3: TOutlookButton;
    btnGoods: TOutlookButton;
    btnType: TOutlookButton;
    Header2: TmxOutlookBarHeader;
    Header3: TmxOutlookBarHeader;
    TBDockRight: TTBDock;
    TBDockBottom: TTBDock;
    TBSkin2: TTBSkin;
    popMenu: TTBPopupMenu;
    mnuRestore: TTBItem;
    T1: TTBItem;
    trayIcon1: TCoolTrayIcon;
    btnSale: TOutlookButton;
    Button1: TOutlookButton;
    imgTool: TImageList;
    TBToolbar1: TTBToolbar;
    N1: TTBSubmenuItem;
    MenuLogin: TTBItem;
    MenuEdit: TTBItem;
    N4: TTBSeparatorItem;
    MenuAddUser: TTBItem;
    MenuDelUser: TTBItem;
    MenuChangUser: TTBItem;
    N8: TTBSeparatorItem;
    MenuExit: TTBItem;
    N10: TTBSubmenuItem;
    menuAddRec: TTBItem;
    MenuSaveRec: TTBItem;
    MenuEditRec: TTBItem;
    MenuDelRec: TTBItem;
    MenuCancelRec: TTBItem;
    N16: TTBSeparatorItem;
    MenuBackRec: TTBItem;
    menuNextRec: TTBItem;
    N19: TTBSubmenuItem;
    MenuFindRec: TTBItem;
    N2: TTBItem;
    N21: TTBSubmenuItem;
    N3: TTBItem;
    N22: TTBItem;
    actConfig: TAction;
    Button2: TOutlookButton;
    actUnit: TAction;
    actOutPriceHist: TAction;
    actInPriceHist: TAction;
    Button4: TOutlookButton;
    Button5: TOutlookButton;
    Button6: TOutlookButton;
    actQrySheet: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actCustExecute(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure actGoodExecute(Sender: TObject);
    procedure actTypeExecute(Sender: TObject);
    procedure actSuppExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Timer_systemTimer(Sender: TObject);
    procedure TB_exitClick(Sender: TObject);
    procedure trayIcon1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure actConfigExecute(Sender: TObject);
    procedure actOutExecute(Sender: TObject);
    procedure actUnitExecute(Sender: TObject);
    procedure actOutPriceHistExecute(Sender: TObject);
    procedure actInPriceHistExecute(Sender: TObject);
    procedure actINExecute(Sender: TObject);
    procedure actQrySheetExecute(Sender: TObject);
  private
    islogined: boolean;
    FClientInstance,
      FPrevClientProc: TFarProc;
    procedure ClientWndProc(var Message: TMessage);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses common, about, cust, goods, supp, gdstype, firstStore, gds, sale,
  gdsSelect, data, gdsUnit, inPriceHist, sellPriceHist, buy, SheetBrow;

{$R *.dfm}

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
  application.Minimize;
end;

procedure TfrmMain.ClientWndProc(var Message: TMessage);
var
  MyDC: hDC;
  Ro, Co: Word;
begin
  with Message do
    case Msg of
      WM_ERASEBKGND:
        begin
          MyDC := TWMEraseBkGnd(Message).DC;
          for Ro := 0 to ClientHeight div Image1.Picture.Height do
            for Co := 0 to ClientWIDTH div Image1.Picture.Width do
              BitBlt(MyDC, Co * Image1.Picture.Width, Ro * Image1.Picture.Height,
                Image1.Picture.Width, Image1.Picture.Height,
                Image1.Picture.Bitmap.Canvas.Handle, 0, 0, SRCCOPY);
          Result := 1;
        end;
    else
      Result := CallWindowProc(FPrevClientProc, ClientHandle, Msg, wParam, lParam);
    end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  islogined := false;
  StatusBar.Panels[3].Text := format('操作员：【%s】 权限〖全部〗', [dm.GetCurrentUser]);
  FClientInstance := MakeObjectInstance(ClientWndProc);
  FPrevClientProc := Pointer(GetWindowLong(ClientHandle, GWL_WNDPROC));
  SetWindowLong(ClientHandle, GWL_WNDPROC, LongInt(FClientInstance));

end;

procedure TfrmMain.actCustExecute(Sender: TObject);
begin
  OpenForm(TfrmCust, frmCust, self);
end;

procedure TfrmMain.SpeedButton19Click(Sender: TObject);
begin
  // OpenForm(TfrmgdsSelect,frmgdsSelect,self);
end;

procedure TfrmMain.actGoodExecute(Sender: TObject);
begin
  OpenForm(TfrmGds, frmGds, self);
end;

procedure TfrmMain.actTypeExecute(Sender: TObject);
begin
  OpenForm(TfrmType, frmType, self);
end;

procedure TfrmMain.actSuppExecute(Sender: TObject);
begin
  OpenForm(TfrmSupp, frmSupp, self);
end;

procedure TfrmMain.Action1Execute(Sender: TObject);
begin
  OpenForm(TfrmAbout, frmAbout, self);
end;

procedure TfrmMain.Timer_systemTimer(Sender: TObject);
begin
  StatusBar.Panels.Items[2].Text := '现在时间：' + DateTimeToStr(now);
  if statusbar.Panels.Items[0].Text = '' then
    statusbar.Panels.Items[0].Text := '准备好';
end;

procedure TfrmMain.TB_exitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.trayIcon1Click(Sender: TObject);
begin
  application.Restore;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  OpenForm(TfrmGdsSelect, frmGdsSelect, self);
end;

procedure TfrmMain.actConfigExecute(Sender: TObject);
begin
  dm.ConfigDB;
end;

procedure TfrmMain.actOutExecute(Sender: TObject);
begin
  OpenForm(TfrmSale, frmSale, self);
end;

procedure TfrmMain.actUnitExecute(Sender: TObject);
var frmGdsUnit: TfrmGdsUnit;
begin
  frmGdsUnit := TfrmGdsUnit.create(self);
  frmGdsUnit.showmodal;
end;

procedure TfrmMain.actOutPriceHistExecute(Sender: TObject);
begin
  OpenForm(TfrmSellPriceHist, frmSellPriceHist, self);
end;

procedure TfrmMain.actInPriceHistExecute(Sender: TObject);
begin
  OpenForm(TfrmInPriceHist, frmInPriceHist, self);
end;

procedure TfrmMain.actINExecute(Sender: TObject);
begin
  OpenForm(TfrmBuy, frmBuy, self);
end;

procedure TfrmMain.actQrySheetExecute(Sender: TObject);
begin
  OpenForm(TfrmQrySheet, frmQrySheet, self);  
end;

end.


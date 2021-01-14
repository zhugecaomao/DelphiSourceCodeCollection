unit CMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, Buttons, JSocket, StdCtrls, Share,
  RzButton, Grobal2, ObjectBase, OleCtrls, ShockwaveFlashObjects_TLB;
const
  MAXBAGITEMCL = 52;

type
  TConnectionStep = (cnsLogin, cnsSelChr, cnsReSelChr, cnsPlay);
  TSceneType = (stIntro, st_NewAccount, stLogin, stSelectServer, stSelectCountry, stSelectChr, stNewChr, stLoading,
    stLoginNotice, stPlayGame);
  TScene = (s_None, s_Intro, s_NewAccount, s_Login, s_SelectServer, s_SelectChr, s_LoginNotice, s_Play);
  TTimerCommand = (tcSoftClose, tcReSelConnect, tcFastQueryChr, tcQueryItemPrice);
  TUserCharacterInfo = record
    sName: string[19];
    btJob: Byte;
    btHair: Byte;
    wLevel: Word;
    btSex: Byte;
  end;
  TSelChar = record
    boValid: Boolean;
    UserChr: TUserCharacterInfo;
    boSelected: Boolean;
    boFreezeState: Boolean; //TRUE:倔篮惑怕 FALSE:踌篮惑怕
    boUnfreezing: Boolean; //踌绊 乐绰 惑怕牢啊?
    boFreezing: Boolean; //倔绊 乐绰 惑怕?
    nAniIndex: Integer; //踌绰(绢绰) 局聪皋捞记
    nDarkLevel: Integer;
    nEffIndex: Integer; //瓤苞 局聪皋捞记
    dwStartTime: LongWord;
    dwMoretime: LongWord;
    dwStartefftime: LongWord;
  end;
  TPlayScene = class
    m_MySelf: THumActor;
    m_TargetCret: TActor;
    m_FocusCret: TActor;
    m_MagicTarget: TActor;
    m_MsgList: TList;
    m_ActorList: TList;
    m_FreeActorList: TList;
    m_ChangeFaceReadyList: TList;
  private

  public
    constructor Create;
    destructor Destroy; override;
    procedure SendMsg(nIdent, nChrID, nX, nY, nDir, nFeature, nState: Integer; sMsg: string);
    function FindActor(nChrID: Integer): TActor; overload;
    function FindActor(sName: string): TActor; overload;
    function FindActorXY(nX, nY: Integer): TActor;
    function IsValidActor(Actor: TActor): Boolean;
    function NewActor(nChrID: Integer; wX, wY, wDir: Word; nFeature, nState: Integer): TActor;
    procedure ActorDied(Actor: TObject);
    procedure SetActorDrawLevel(Actor: TObject; nLevel: Integer);
    procedure ClearActors;
    procedure ClearObjects();
    function DeleteActor(nChrID: Integer): TActor;
    procedure DelActor(Actor: TObject);
    function IsChangingFace(nRecogID: Integer): Boolean;
  end;
  TfrmCMain = class(TForm)
    MainMenu1: TMainMenu;
    MENU_CONTROL: TMenuItem;
    MENU_CONTROL_EXIT: TMenuItem;
    TimerMain: TTimer;
    StatusBar: TStatusBar;
    PanelMenu: TPanel;
    PanelTitle: TPanel;
    PanelClient: TPanel;
    CSocket: TClientSocket;
    PanelUserLogin: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ButtonLoginClose: TSpeedButton;
    EditUserAccount: TEdit;
    EditUserPassword: TEdit;
    ButtonStart: TRzButton;
    PanelMessageDlg: TPanel;
    MsgBoxClose: TSpeedButton;
    MsgBoxOK: TRzButton;
    MsgBoxCancel: TRzButton;
    MsgBoxYes: TRzButton;
    MsgBoxNo: TRzButton;
    MsgBoxLabel: TLabel;
    PanelSelectServer: TPanel;
    ButtonSelectServerClose: TSpeedButton;
    ButtonServer1: TRzButton;
    ButtonServer2: TRzButton;
    ButtonServer3: TRzButton;
    ButtonServer4: TRzButton;
    ButtonServer5: TRzButton;
    ButtonServer6: TRzButton;
    ButtonServer7: TRzButton;
    ButtonServer8: TRzButton;
    CmdTimer: TTimer;
    SelChrWaitTimer: TTimer;
    PanelSelectChr: TPanel;
    ButtonSelectChrClose: TSpeedButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    EditSelectChrName1: TEdit;
    Label4: TLabel;
    EditSelectChrJob1: TEdit;
    Label5: TLabel;
    EditSelectChrLevel1: TEdit;
    Label6: TLabel;
    EditSelectChrSex1: TEdit;
    ButtonSelectChr1: TRzButton;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EditSelectChrName2: TEdit;
    EditSelectChrJob2: TEdit;
    EditSelectChrLevel2: TEdit;
    EditSelectChrSex2: TEdit;
    ButtonSelectChr2: TRzButton;
    GroupBox3: TGroupBox;
    EditSelectChrCurChr: TEdit;
    ButtonSelectChrStartPlay: TRzButton;
    ButtonSelectChrNewChr: TRzButton;
    ButtonSelectChrDelChr: TRzButton;
    WaitMsgTimer: TTimer;
    PanelPlayGame: TPanel;
    MinTimer: TTimer;
    Panel1: TPanel;
    EditChat: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton17: TSpeedButton;
    ButtonPlayGameClose: TSpeedButton;
    LabelPlayGameHP: TLabel;
    LabelPlayGameMP: TLabel;
    ListBoxActor: TListBox;
    LabelPlayGameLevel: TLabel;
    PanelCreateNewChr: TPanel;
    ButtonCreateNewChr: TSpeedButton;
    GroupBox4: TGroupBox;
    ButtonCreateNewChrWarr: TRzButton;
    ButtonCreateNewChrWizard: TRzButton;
    ButtonCreateNewChrTaos: TRzButton;
    ButtonCreateNewChrFemale: TRzButton;
    ButtonCreateNewChrMale: TRzButton;
    ButtonCreateNewChrOK: TRzButton;
    GroupBox5: TGroupBox;
    Label11: TLabel;
    EditCreateNewChrName: TEdit;
    EditCreateNewChrSex: TEdit;
    Label13: TLabel;
    EditCreateNewChrJob: TEdit;
    Label14: TLabel;
    ListBoxChat: TListBox;
    PopupMenu: TPopupMenu;
    POPMENU_AUTOSCROLL: TMenuItem;
    ButtonNewAccount: TRzButton;
    PanelNewAccount: TPanel;
    ButtonPanelNewAccountClose: TSpeedButton;
    LabelStatus: TLabel;
    GroupBox6: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    EditPassword: TEdit;
    EditAccount: TEdit;
    EditConfirm: TEdit;
    EditYourName: TEdit;
    EditSSNo: TEdit;
    EditBirthDay: TEdit;
    EditQuiz1: TEdit;
    EditAnswer1: TEdit;
    EditQuiz2: TEdit;
    EditAnswer2: TEdit;
    MemoHelp: TMemo;
    EditPhone: TEdit;
    EditMobPhone: TEdit;
    EditEMail: TEdit;
    ButtonPanelNewAccountOK: TRzButton;
    PanelPlay: TPanel;
    GroupBox7: TGroupBox;
    CheckBoxAutoLogin: TCheckBox;
    ButtonChr1: TRadioButton;
    ButtonChr2: TRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerMainTimer(Sender: TObject);
    procedure MENU_CONTROL_EXITClick(Sender: TObject);
    procedure CSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure CSocketConnecting(Sender: TObject; Socket: TCustomWinSocket);
    procedure CSocketDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure CSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure CSocketLookup(Sender: TObject; Socket: TCustomWinSocket);
    procedure CSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure PanelUserLoginMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure EditUserAccountKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonStartClick(Sender: TObject);
    procedure MsgBoxOKClick(Sender: TObject);
    procedure ButtonServer1Click(Sender: TObject);
    procedure CmdTimerTimer(Sender: TObject);
    procedure ButtonSelectChr1Click(Sender: TObject);
    procedure EditChatKeyPress(Sender: TObject; var Key: Char);
    procedure ListBoxActorDblClick(Sender: TObject);
    procedure ListBoxActorDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ListBoxChatDblClick(Sender: TObject);
    procedure POPMENU_AUTOSCROLLClick(Sender: TObject);
    procedure ListBoxChatClick(Sender: TObject);
    procedure EditAccountEnter(Sender: TObject);
    procedure ButtonPanelNewAccountOKClick(Sender: TObject);
    procedure CheckBoxAutoLoginClick(Sender: TObject);
    function GetRGB(c256: Byte): TColor;
  private
    m_boTimerMainBusy: BOOL;
    m_boOpened: BOOL;
    m_dwOpenTick: LongWord;
    m_dwMinTick: LongWord;
    m_sSockText: string;
    m_sBufferText: string;
    m_sLoginAccount: string;
    m_sLoginPasswd: string;
    m_nCertification: Integer;
    m_TimerCmd: TTimerCommand;
    m_sCharName: string;
    m_CharMsgList: TStringList;
    m_CharBkColorList: TList;
    m_nChatBoardTop: Integer;
    m_GuildChatMsgList: TStringList;
    m_sWhisperName: string;
    m_dwRunOneTick: LongWord;
    m_boChatAutoScroll: BOOL;
    dwOKTick: LongWord;
    m_boAutoLogin: BOOL;
    m_nAutoChr: Integer;
    g_PlayScene: TPlayScene;
    g_nMySpeedPoint: Integer; //敏捷
    g_nMyHitPoint: Integer; //准确
    g_nMyAntiPoison: Integer; //魔法躲避
    g_nMyPoisonRecover: Integer; //中毒恢复
    g_nMyHealthRecover: Integer; //体力恢复
    g_nMySpellRecover: Integer; //魔法恢复
    g_nMyAntiMagic: Integer; //魔法躲避
    g_nMyHungryState: Integer; //饥饿状态


    g_boNextTimePowerHit: BOOL; //打开攻杀
    g_boCanLongHit: BOOL; //打开刺杀
    g_boCanWideHit: BOOL; //打开半月
    g_boCanCrsHit: BOOL;
    g_boCanTwnHit: BOOL;
    g_boCanStnHit: BOOL;
    g_boNextTimeFireHit: BOOL;

    g_dwLatestFireHitTick: LongWord;

    g_sGoldName: string;
    g_sGameGoldName: string;
    g_sGamePointName: string;
    g_btCode: Byte;
    g_boSendLogin: BOOL;
    g_boServerConnected: BOOL;
    g_SoftClosed: BOOL;
    g_ConnectionStep: TConnectionStep; //当前游戏网络连接步骤
    g_CurrentScene: TScene; //当前界面状态
    g_boServerChanging: BOOL;
    g_boMapMoving: BOOL;
    g_sWaitingStr: string;
    g_WaitingMsg: TDefaultMessage;
    g_boMapMovingWait: BOOL;
    g_ServerList: TStringList;
    g_sServerMiniName: string;
    g_sServerName: string;
    g_wAvailIDDay: Word;
    g_wAvailIDHour: Word;
    g_wAvailIPDay: Word;
    g_wAvailIPHour: Word;

    g_boDoFastFadeOut: BOOL;
    g_dwFirstServerTime: LongWord;
    g_dwFirstClientTime: LongWord;

    g_sSelChrAddr: string;
    g_nSelChrPort: Integer;
    g_sRunServerAddr: string;
    g_nRunServerPort: Integer;

    g_ChrArr: array[0..1] of TSelChar;
    g_ChangeFaceReadyList: TList;
    g_FreeActorList: TList;

    g_nTargetX: Integer;
    g_nTargetY: Integer;
    g_sMapTitle: string;
    g_sMapName: string;
    g_nMapMusic: Integer;
    g_MagicList: TList;
    g_UseItems: array[0..12] of TClientItem;
    g_ItemArr: array[0..MAXBAGITEMCL - 1] of TClientItem;
    g_boBagLoaded: BOOL;

    g_boAllowGroup: BOOL;

    g_boActionLock: BOOL;

    g_nReceiveCount: Integer;
    NewIdRetryUE: TUserEntry;
    NewIdRetryAdd: TUserEntryAdd;
    m_sMakeNewId: string;
    procedure WaitAndPass(dwMsec: LongWord);
    procedure ActiveCmdTimer(Cmd: TTimerCommand);
    procedure SetTopOrder(Control: TControl);
    function MessageDlg(sMsg: string; DlgButtons: TMsgDlgButtons): TModalResult;
    procedure CloseScene;
    procedure OpenScene();
    procedure ChangeScene(SceneType: TSceneType);
    procedure ProcessMsg(Msg: Pointer);
    procedure ShowSelectServer;
    procedure ActionFailed();
    procedure CheckSpeedHack(dwTime: LongWord);
    procedure DecodeMessagePacket(sDataBlock: string);
    procedure ClientNewIDSuccess();

    procedure ClientNewIDFail(nFailCode: Integer);
    procedure ClientLoginFail(nFailCode: Integer);
    procedure ClientGetPasswordOK(DefMsg: TDefaultMessage; sData: string);
    procedure ClientGetPasswdSuccess(sData: string);
    procedure ClientGetReceiveChrs(sData: string);
    procedure ClientQueryChrFail(nFailCode: Integer);
    procedure ClientNewChrFail(nFailCode: Integer);
    procedure ClientDelChrFail(nFailCode: Integer);
    procedure ClientGetStartPlay(sData: string);
    procedure ClientStartPlayFail();
    procedure ClientVersionFail();
    procedure ClientGetSendNotice(sData: string);
    procedure ClientGetNewMap(DefMsg: TDefaultMessage; sData: string);
    procedure ClientGetReconnect(sData: string);
    procedure ClientGetAreaState(nAreaState: Integer);
    procedure ClientGetMapDescription(DefMsg: TDefaultMessage; sData: string);
    procedure ClientGetGameGoldName(DefMsg: TDefaultMessage; sData: string);
    procedure ClientGetAdjustBonus(nBonusPoint: Integer; sData: string);
    procedure ClientGetMyStatus(DefMsg: TDefaultMessage);
    procedure ClientGetObjTurn(DefMsg: TDefaultMessage; sData: string);
    procedure ClientGetBackStep(DefMsg: TDefaultMessage; sData: string);
    procedure ClientGetAbility(DefMsg: TDefaultMessage; sData: string);
    procedure ClientGetSubAbility(DefMsg: TDefaultMessage);
    procedure ClientGetDayChanging(DefMsg: TDefaultMessage);
    procedure ClientGetWinExp(DefMsg: TDefaultMessage);
    procedure ClientGetLevelUp(DefMsg: TDefaultMessage);
    procedure CliengGetHealthSpellChaged(DefMsg: TDefaultMessage);
    procedure ClientGetStruck(DefMsg: TDefaultMessage; sData: string);

    procedure ClientGetUserLogin(DefMsg: TDefaultMessage; sData: string);
    procedure ClientGetMessage(DefMsg: TDefaultMessage; sData: string);
    procedure ClientHearMsg(DefMsg: TDefaultMessage; sData: string);
    procedure ClientGetUserName(DefMsg: TDefaultMessage; sData: string);
    procedure ClientGetUserNameColor(DefMsg: TDefaultMessage);
    procedure ClientGetHideObject(DefMsg: TDefaultMessage);
    procedure ClientObjDigup(DefMsg: TDefaultMessage; sData: string);
    procedure ClientObjDigDown(DefMsg: TDefaultMessage);
    procedure ClientGetAddItem(sData: string);
    procedure ClientGetBagItmes(sData: string);
    procedure ClientGetUpdateItem(sData: string);
    procedure ClientGetDelItem(sData: string);
    procedure ClientGetDelItems(sData: string);
    procedure ClientDelDropItem(nItemID: Integer; sData: string);
    procedure ClientGetDropItemFail(nItemID: Integer; sData: string);
    procedure ClientGetShowItem(nItemID, nX, nY, nLooks: Integer; sItemName: string);
    procedure ClientGetHideItem(nItemID, nX, nY: Integer);
    procedure ClientGetTakeOnOK(nItemID: Integer);
    procedure ClientGetTakeOnFail();
    procedure ClientGetTakeOffOK(nItemID: Integer);
    procedure ClientGetTakeOffFail();
    procedure ClientGetSenduseItems(sData: string);
    procedure ClientGetWeightChanged(DefMsg: TDefaultMessage);
    procedure ClientGetGoldChanged(DefMsg: TDefaultMessage);
    procedure ClientGetFeatureChange(DefMsg: TDefaultMessage);
    procedure ClientGetCharStatusChange(DefMsg: TDefaultMessage);
    procedure ClientGetClearObjects();
    procedure ClientGetEatItemOK();
    procedure ClientGetEatItemFail();
    procedure ClientGetAddMagic(sData: string);
    procedure ClientGetMyMagics(sData: string);
    procedure ClientGetDelMagic(nMagicID: Integer);
    procedure ClientGetMagicLevelUp(DefMsg: TDefaultMessage);
    procedure ClientGetDuraChange(DefMsg: TDefaultMessage);
    procedure ClientGetMerchantSay(DefMsg: TDefaultMessage; sData: string);
    procedure ClientGetMerchantClose();
    procedure ClientGetSendGoodsList(DefMsg: TDefaultMessage; sData: string);
    procedure ClientGetSendMakeDrugList(DefMsg: TDefaultMessage; sData: string);
    procedure ClientGetSendUserSell(nMerchant: Integer);
    procedure ClientGetSendUserRepair(nMerchant: Integer);
    procedure ClientGetBuyPrice(DefMsg: TDefaultMessage);
    procedure ClientGetUserSellItemOK();
    procedure ClientGetRepairCost(DefMsg: TDefaultMessage);

    procedure SendLogin(sAccount, sPassWord: string);
    procedure SendQueryChr();
    procedure SendSocket(sSendMsg: string);
    procedure SendClientMessage(nIdent, nRecog, nParam, nTag, nSeries: Integer);
    procedure SendSelectServer(sServerName: string);
    procedure SendSelChr(sChrName: string);
    procedure SendDelChr(sChrName: string);
    procedure SendRunLogin();
    procedure SendSay(sMsg: string);

    procedure Run();
    procedure ClearBag();
    procedure ClearChatBoard();
    function IsGroupMember(sName: string): BOOL;
    procedure ChangeServerClearGameVariables();
    procedure AddChatBoardString(sMsg: string; nFColor, nBColor: Integer);
    procedure AddGuildChat(sMsg: string);
    function AddItemBag(ClientItem: TClientItem): BOOL;
    procedure ArrangeItembag();
    procedure MakeNewChar(nIndex: Integer);
    procedure SelectChrCreateNewChr();
    procedure SendNewChr(sAccount, sChrName, sHair, sJob, sSex: string);
    function CheckUserEntrys: Boolean;
    function NewIdCheckBirthDay: Boolean;
    procedure SendNewAccount(ue: TUserEntry; ua: TUserEntryAdd);
    { Private declarations }
  public

    m_boClose: BOOL;
    m_dwCloseTick: LongWord;

    procedure CreateParams(var Params: TCreateParams); override;
    procedure Open();
    { Public declarations }
  end;


var
  frmCMain: TfrmCMain;

implementation

uses Main, CLogin, HUtil32, EDecode;
{$R *.dfm}

{ TfrmCMain }
procedure TfrmCMain.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent := 0;
end;

procedure TfrmCMain.Open;
begin
  Caption := m_SelGameZone.sServerName;
  m_dwOpenTick := GetTickCount();
  m_dwMinTick := GetTickCount();
  m_boOpened := False;
  m_boAutoLogin := True;
  m_nAutoChr := 0;
  TimerMain.Enabled := True;
  //Flash.Movie := FalshUrl;
  //Flash.Play;
  Show();
end;

procedure TfrmCMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
  m_boClose := True;
  m_dwCloseTick := GetTickCount();
  CSocket.Close;
end;

procedure TfrmCMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageBox(Handle, '是否确认退出?', '确认信息', MB_YESNO + MB_ICONQUESTION) <> ID_YES then begin
    CanClose := False;
    Exit;
  end;
  Application.Restore;
  Application.RestoreTopMosts;
end;

procedure TfrmCMain.FormCreate(Sender: TObject);
begin
  m_boTimerMainBusy := False;
  m_boChatAutoScroll := True;

  g_ConnectionStep := cnsLogin;
  g_CurrentScene := s_None;
  g_boSendLogin := False;
  g_boServerConnected := False;
  m_sSockText := '';
  m_sBufferText := '';
  g_ServerList := TStringList.Create;
  g_PlayScene := TPlayScene.Create;
  m_CharMsgList := TStringList.Create;
  m_CharBkColorList := TList.Create;
  g_ChangeFaceReadyList := TList.Create;
  m_GuildChatMsgList := TStringList.Create;
  g_FreeActorList := TList.Create;

  g_MagicList := TList.Create;
end;

procedure TfrmCMain.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  g_ServerList.Free;
  g_PlayScene.Free;
  m_CharMsgList.Free;
  m_CharBkColorList.Free;
  m_GuildChatMsgList.Free;
  g_FreeActorList.Free;
  for I := 0 to g_MagicList.Count - 1 do begin
    Dispose(pTClientMagic(g_MagicList.Items[I]));
  end;
  g_MagicList.Free;
end;

procedure TfrmCMain.SetTopOrder(Control: TControl);
var
  I: Integer;
  WinControl: TControl;
  TempControl: TControl;
begin
  for I := 0 to ControlCount - 1 do begin
    WinControl := Controls[I];
    if WinControl = Control then begin
      RemoveControl(WinControl);
      InsertControl(WinControl);
      break;
    end;
  end;
end;

procedure TfrmCMain.TimerMainTimer(Sender: TObject);
var
  sData: string;
begin
  m_boTimerMainBusy := True;
  try
    if (not m_boOpened) and (GetTickCount - m_dwOpenTick > 500) then begin
      m_boOpened := True;
      if m_SelGameZone.sGameIPaddr = '' then begin
        CSocket.Host := '127.0.0.1';
      end else begin
        CSocket.Host := m_SelGameZone.sGameIPaddr;
      end;
      CSocket.Port := m_SelGameZone.nGameIPPort;
      CSocket.Active := True;
    end;
    m_sBufferText := m_sBufferText + m_sSockText;
    m_sSockText := '';
    if m_sBufferText <> '' then begin
      while Length(m_sBufferText) >= 2 do begin
        if g_boMapMovingWait then break;
        if Pos('!', m_sBufferText) <= 0 then break;
        m_sBufferText := ArrestStringEx(m_sBufferText, '#', '!', sData);
        if sData = '' then break;
        DecodeMessagePacket(sData);
      end;
    end;
    Run();
  finally
    m_boTimerMainBusy := False;
  end;
end;
procedure TfrmCMain.ActiveCmdTimer(Cmd: TTimerCommand);
begin
  CmdTimer.Enabled := True;
  m_TimerCmd := Cmd;
end;

procedure TfrmCMain.CmdTimerTimer(Sender: TObject);
var
  I: Integer;
begin
  if Sender = CmdTimer then begin

  end else
    if Sender = SelChrWaitTimer then begin
    SelChrWaitTimer.Enabled := False;
    SendQueryChr;
  end else
    if Sender = WaitMsgTimer then begin
    if g_PlayScene.m_MySelf = nil then Exit;
    if g_PlayScene.m_MySelf.ActionFinished then begin
      WaitMsgTimer.Enabled := False;
      case g_WaitingMsg.Ident of
        SM_CHANGEMAP: begin
            g_boMapMovingWait := False;
            g_boMapMoving := False;

            //ClearDropItems;
            //g_PlayScene.CleanObjects;
            g_sMapTitle := '';
            g_PlayScene.m_MySelf.CleanCharMapSetting(g_WaitingMsg.Param, g_WaitingMsg.Tag);
            g_PlayScene.SendMsg(SM_CHANGEMAP, 0,
              g_WaitingMsg.Param {x},
              g_WaitingMsg.Tag {y},
              g_WaitingMsg.Series {darkness},
              0, 0,
              g_sWaitingStr {mapname});
            g_nTargetX := -1;
            g_PlayScene.m_TargetCret := nil;
            g_PlayScene.m_FocusCret := nil;
          end;
      end;
    end;
  end else
    if Sender = MinTimer then begin
    if GetTickCount - m_dwMinTick >= 1000 then begin
      m_dwMinTick := GetTickCount();
      for I := 0 to g_PlayScene.m_ActorList.Count - 1 do begin
        if IsGroupMember(TActor(g_PlayScene.m_ActorList[I]).m_sUserName) then begin
          TActor(g_PlayScene.m_ActorList[I]).m_boGrouped := True;
        end else begin
          TActor(g_PlayScene.m_ActorList[I]).m_boGrouped := False;
        end;
      end;
      for I := g_FreeActorList.Count - 1 downto 0 do begin
        if GetTickCount - TActor(g_FreeActorList[I]).m_dwDeleteTime > 60 * 1000 then begin
          TActor(g_FreeActorList[I]).Free;
          g_FreeActorList.Delete(I);
        end;
      end;
    end;
  end;
end;
procedure TfrmCMain.WaitAndPass(dwMsec: LongWord);
var
  dwStartTick: LongWord;
begin
  dwStartTick := GetTickCount;
  while GetTickCount - dwStartTick < dwMsec do begin
    Application.ProcessMessages;
  end;
end;

procedure TfrmCMain.ProcessMsg(Msg: Pointer);
begin

end;

procedure TfrmCMain.MENU_CONTROL_EXITClick(Sender: TObject);
begin
  if Sender = MENU_CONTROL_EXIT then begin
    Close;
  end;

end;
procedure TfrmCMain.ListBoxActorDblClick(Sender: TObject);
var
  nIndex: Integer;
begin
  nIndex := ListBoxActor.ItemIndex;
  if (nIndex >= 0) and (nIndex < ListBoxActor.Items.Count) then begin
    EditChat.Text := '/' + ListBoxActor.Items.Strings[nIndex] + ' ';
  end;

end;


procedure TfrmCMain.ListBoxActorDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  nIdx: Integer;
  Actor: TActor;
  Color: TColor;
  FColor: TColor;
  BColor: TColor;
begin
  if Control = ListBoxActor then begin
    ListBoxActor.Canvas.FillRect(Rect);
    Actor := TActor(ListBoxActor.Items.Objects[Index]);
    case Actor.m_btRace of //
      RCC_USERHUMAN: Color := clGreen;
      RCC_MERCHANT: Color := clBlue;
      RCC_GUARD: Color := clYellow;
      else Color := clRed;
    end;
    ListBoxActor.Canvas.Font.Color := Color;
    ListBoxActor.Canvas.TextOut(Rect.Left + 5, Rect.top + ((Rect.Bottom - Rect.top) - ListBoxActor.Canvas.TextHeight('A')) div 2, ListBoxActor.Items[Index]);
  end else
    if Control = ListBoxChat then begin
    ListBoxChat.Canvas.FillRect(Rect);
    FColor := TColor(ListBoxChat.Items.Objects[Index]);
    BColor := TColor(m_CharBkColorList.Items[Index]);
    ListBoxChat.Canvas.Font.Color := FColor;
    ListBoxChat.Canvas.Brush.Color := BColor;
    ListBoxChat.Canvas.TextOut(Rect.Left + 5, Rect.top + ((Rect.Bottom - Rect.top) - ListBoxChat.Canvas.TextHeight('A')) div 2, ListBoxChat.Items[Index]);
  end;
end;


procedure TfrmCMain.ListBoxChatDblClick(Sender: TObject);
var
  sLineText: string;
  nPos: Integer;
  nIndex: Integer;
begin
  nIndex := ListBoxChat.ItemIndex;
  if (nIndex < 0) or (nIndex >= ListBoxChat.Items.Count) then Exit;
  sLineText := ListBoxChat.Items.Strings[nIndex];
  EditChat.Text := sLineText;
end;

procedure TfrmCMain.ListBoxChatClick(Sender: TObject);
var
  sLineText: string;
  nPos: Integer;
  nIndex: Integer;
begin
  nIndex := ListBoxChat.ItemIndex;
  if (nIndex < 0) or (nIndex >= ListBoxChat.Items.Count) then Exit;

  sLineText := ListBoxChat.Items.Strings[nIndex];
  if sLineText = '' then Exit;
  nPos := Pos(':', sLineText);
  if nPos > 0 then begin
    sLineText := Copy(sLineText, 1, nPos - 1);
    nPos := Pos(')', sLineText);
    if nPos > 0 then begin
      sLineText := Copy(sLineText, nPos + 1, Length(sLineText) - nPos);
    end;
    EditChat.Text := '/' + sLineText + ' ';
  end else begin
    EditChat.Text := sLineText;
  end;
end;

procedure TfrmCMain.CSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  StatusBar.Panels[0].Text := '服务器连接成功...';
  g_boServerConnected := True;
  if g_ConnectionStep = cnsLogin then begin
    ChangeScene(stLogin);
  end;
  if g_ConnectionStep = cnsSelChr then begin
    SelChrWaitTimer.Enabled := True;
  end;
  if g_ConnectionStep = cnsPlay then begin
    if not g_boServerChanging then begin
      ClearBag;
      ClearChatBoard;
      ChangeScene(stLoginNotice);
    end else begin
      ChangeServerClearGameVariables;
    end;
    SendRunLogin;
  end;
  m_sSockText := '';
  m_sBufferText := '';
end;

procedure TfrmCMain.CSocketConnecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  StatusBar.Panels[0].Text := '正在连接服务器...';
end;

procedure TfrmCMain.CSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  StatusBar.Panels[0].Text := '已断开连接...';
  g_boServerConnected := False;
  if (g_ConnectionStep = cnsLogin) and not g_boSendLogin then begin
    MessageDlg('Connection closed...', [mbOk]);
  end;
  if g_SoftClosed then begin
    g_SoftClosed := False;
    ActiveCmdTimer(tcReSelConnect);
  end;
end;

procedure TfrmCMain.CSocketError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode := 0;
  Socket.Close;
end;

procedure TfrmCMain.CSocketLookup(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  StatusBar.Panels[0].Text := '正在解析地址...';
end;

procedure TfrmCMain.CSocketRead(Sender: TObject; Socket: TCustomWinSocket);
var
  nIdx: Integer;
  sData: string;
  sData2: string;
begin
  sData := Socket.ReceiveText;
  nIdx := Pos('*', sData);
  if nIdx > 0 then begin
    sData2 := Copy(sData, 1, nIdx - 1);
    sData := sData2 + Copy(sData, nIdx + 1, Length(sData));
    CSocket.Socket.SendText('*');
  end;
  m_sSockText := m_sSockText + sData;
end;

procedure TfrmCMain.PanelUserLoginMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DragMove = $F012; //$F020
begin
  ReleaseCapture;
  (Sender as TWinControl).Perform(WM_SysCommand, SC_DragMove, 0);
end;


procedure TfrmCMain.POPMENU_AUTOSCROLLClick(Sender: TObject);
begin
  POPMENU_AUTOSCROLL.Checked := not POPMENU_AUTOSCROLL.Checked;
  m_boChatAutoScroll := POPMENU_AUTOSCROLL.Checked;
end;


procedure TfrmCMain.EditAccountEnter(Sender: TObject);
begin
  if Sender = EditAccount then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('您的帐号名称可以包括：');
    MemoHelp.Lines.Add('字符、数字的组合。');
    MemoHelp.Lines.Add('帐号名称长度必须为4或以上。');
    MemoHelp.Lines.Add('登陆帐号并游戏中的人物名称。');
    MemoHelp.Lines.Add('请仔细输入创建帐号所需信息。');
    MemoHelp.Lines.Add('您的登陆帐号可以登陆游戏');
    MemoHelp.Lines.Add('及我们网站，以取得一些相关信息。');
    MemoHelp.Lines.Add('');
    MemoHelp.Lines.Add('建议您的登陆帐号不要与游戏中的角');
    MemoHelp.Lines.Add('色名相同，');
    MemoHelp.Lines.Add('以确保你的密码不会被爆力破解。');
    Exit;
  end;
  if Sender = EditPassword then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('您的密码可以是字符及数字的组合，');
    MemoHelp.Lines.Add('但密码长度必须至少4位。');
    MemoHelp.Lines.Add('建议您的密码内容不要过于简单，');
    MemoHelp.Lines.Add('以防被人猜到。');
    MemoHelp.Lines.Add('请记住您输入的密码，如果丢失密码');
    MemoHelp.Lines.Add('将无法登录游戏。');
  end;
  if Sender = EditConfirm then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('再次输入密码');
    MemoHelp.Lines.Add('以确认。');
  end;
  if Sender = EditYourName then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('请输入您的全名.');
  end;
  if Sender = EditSSNo then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('请输入你的身份证号');
    MemoHelp.Lines.Add('例如： 720101-146720');
  end;
  if Sender = EditBirthDay then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('请输入您的生日');
    MemoHelp.Lines.Add('例如：1977/10/15');
  end;
  if Sender = EditQuiz1 then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('请输入第一个密码提示问题');
    MemoHelp.Lines.Add('这个提示将用于密码丢失后找');
    MemoHelp.Lines.Add('回密码用。');
    MemoHelp.Lines.Add('');
  end;
  if Sender = EditAnswer1 then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('请输入上面问题的');
    MemoHelp.Lines.Add('答案。');
    MemoHelp.Lines.Add('');
  end;
  if Sender = EditQuiz2 then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('请输入第二个密码提示问题');
    MemoHelp.Lines.Add('这个提示将用于密码丢失后找');
    MemoHelp.Lines.Add('回密码用。');
    MemoHelp.Lines.Add('');
  end;
  if Sender = EditAnswer2 then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('请输入上面问题的');
    MemoHelp.Lines.Add('答案。');
    MemoHelp.Lines.Add('');
  end;
  if Sender = EditPhone then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('请输入您的电话');
    MemoHelp.Lines.Add('号码。');
    MemoHelp.Lines.Add('');
  end;
  if Sender = EditMobPhone then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('请输入您的手机号码。');
    MemoHelp.Lines.Add('');
  end;
  if Sender = EditEMail then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('请输入您的邮件地址。您的邮件将被');
    MemoHelp.Lines.Add('接收最近更新的一些信息');
    MemoHelp.Lines.Add('');
  end;
end;
function TfrmCMain.NewIdCheckBirthDay: Boolean;
var
  str, t1, t2, t3, syear, smon, sday: string;
  ayear, amon, aday, sex: Integer;
  flag: Boolean;
begin
  Result := True;
  flag := True;
  str := EditBirthDay.Text;
  str := GetValidStr3(str, syear, ['/']);
  str := GetValidStr3(str, smon, ['/']);
  str := GetValidStr3(str, sday, ['/']);
  ayear := Str_ToInt(syear, 0);
  amon := Str_ToInt(smon, 0);
  aday := Str_ToInt(sday, 0);
  if (ayear <= 1890) or (ayear > 2101) then flag := False;
  if (amon <= 0) or (amon > 12) then flag := False;
  if (aday <= 0) or (aday > 31) then flag := False;
  if not flag then begin
    Beep;
    EditBirthDay.SetFocus;
    Result := False;
  end;
end;
function TfrmCMain.CheckUserEntrys: Boolean;
begin
  Result := False;
  EditAccount.Text := Trim(EditAccount.Text);
  EditQuiz1.Text := Trim(EditQuiz1.Text);
  EditYourName.Text := Trim(EditYourName.Text);
  if Length(EditAccount.Text) < 3 then begin
    MessageBox(Handle, '登录帐号的长度必须大于3位。', '提示信息', MB_OK + MB_ICONINFORMATION);
    Beep;
    EditAccount.SetFocus;
    Exit;
  end;
  if not NewIdCheckBirthDay then Exit;
  if Length(EditPassword.Text) < 3 then begin
    EditPassword.SetFocus;
    Exit;
  end;
  if EditPassword.Text <> EditConfirm.Text then begin
    EditConfirm.SetFocus;
    Exit;
  end;
  if Length(EditQuiz1.Text) < 1 then begin
    EditQuiz1.SetFocus;
    Exit;
  end;
  if Length(EditAnswer1.Text) < 1 then begin
    EditAnswer1.SetFocus;
    Exit;
  end;
  if Length(EditQuiz2.Text) < 1 then begin
    EditQuiz2.SetFocus;
    Exit;
  end;
  if Length(EditAnswer2.Text) < 1 then begin
    EditAnswer2.SetFocus;
    Exit;
  end;
  if Length(EditYourName.Text) < 1 then begin
    EditYourName.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TfrmCMain.ButtonPanelNewAccountOKClick(Sender: TObject);
var
  ue: TUserEntry;
  ua: TUserEntryAdd;
begin
  if GetTickCount - dwOKTick < 5000 then begin
    MessageBox(Handle, '请稍候再点确定！！！', '提示信息', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if CheckUserEntrys then begin
    FillChar(ue, sizeof(TUserEntry), #0);
    FillChar(ua, sizeof(TUserEntryAdd), #0);
    ue.sAccount := LowerCase(EditAccount.Text);
    ue.sPassWord := EditPassword.Text;
    ue.sUserName := EditYourName.Text;
    ue.sSSNo := '650101-1455111';
    ue.sQuiz := EditQuiz1.Text;
    ue.sAnswer := Trim(EditAnswer1.Text);
    ue.sPhone := EditPhone.Text;
    ue.sEMail := Trim(EditEMail.Text);
    ua.sQuiz2 := EditQuiz2.Text;
    ua.sAnswer2 := Trim(EditAnswer2.Text);
    ua.sBirthday := EditBirthDay.Text;
    ua.sMobilePhone := EditMobPhone.Text;
    NewIdRetryUE := ue;
    NewIdRetryUE.sAccount := '';
    NewIdRetryUE.sPassWord := '';
    NewIdRetryAdd := ua;
    SendNewAccount(ue, ua);
    ButtonPanelNewAccountOK.Enabled := False;
    dwOKTick := GetTickCount();
  end;
end;

procedure TfrmCMain.EditChatKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (Trim(EditChat.Text) <> '') then begin
    SendSay(EditChat.Text);
    EditChat.Text := '';
    Key := #0;
  end;
end;

procedure TfrmCMain.EditUserAccountKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Sender = EditUserAccount then begin
    if Key = #13 then begin
      Key := #0;
      EditUserPassword.SetFocus;
    end;
  end else
    if Sender = EditUserPassword then begin
    if Key = #13 then begin
      Key := #0;
      ButtonStartClick(ButtonStart);
    end;
  end;
end;

procedure TfrmCMain.ButtonStartClick(Sender: TObject);
begin
  if (Sender = ButtonLoginClose) or
    (Sender = ButtonSelectServerClose) or
    (Sender = ButtonSelectChrClose) or
    (Sender = ButtonPlayGameClose) then begin
    Close;
  end else
    if Sender = ButtonPanelNewAccountClose then begin
    ChangeScene(stLogin);
  end else
    if Sender = ButtonStart then begin
    m_sLoginAccount := LowerCase(EditUserAccount.Text);
    m_sLoginPasswd := EditUserPassword.Text;
    if g_boSendLogin then begin
      MessageDlg('正在登录,请稍候...', []);
      Exit;
    end;

    if (m_sLoginAccount <> '') and (m_sLoginPasswd <> '') then begin
      SendLogin(m_sLoginAccount, m_sLoginPasswd);
      EditUserAccount.Text := '';
      EditUserPassword.Text := '';
      EditUserAccount.Enabled := False;
      EditUserPassword.Enabled := False;
    end else begin
      EditUserAccount.Text := '';
      EditUserPassword.Text := '';
      EditUserAccount.SetFocus;
    end;
  end else
    if Sender = ButtonNewAccount then begin
    ChangeScene(st_NewAccount);
  end else
    if Sender = ButtonCreateNewChr then begin
    PanelCreateNewChr.Visible := False;
  end;
end;



procedure TfrmCMain.CheckBoxAutoLoginClick(Sender: TObject);
begin
  if Sender = CheckBoxAutoLogin then begin
    m_boAutoLogin := CheckBoxAutoLogin.Checked;
  end else
    if Sender = ButtonChr1 then begin
    if ButtonChr1.Checked then m_nAutoChr := 0;
  end else
    if Sender = ButtonChr2 then begin
    if ButtonChr2.Checked then m_nAutoChr := 1;
  end;
end;

function TfrmCMain.MessageDlg(sMsg: string;
  DlgButtons: TMsgDlgButtons): TModalResult;
begin
  MsgBoxOK.Visible := False;
  MsgBoxYes.Visible := False;
  MsgBoxCancel.Visible := False;
  MsgBoxNo.Visible := False;
  PanelMessageDlg.Left := (Width - PanelMessageDlg.Width) div 2;
  PanelMessageDlg.top := (Height - PanelMessageDlg.Height) div 2;
  MsgBoxLabel.Caption := sMsg;
  SetTopOrder(PanelMessageDlg);
  PanelMessageDlg.Visible := True;
end;


procedure TfrmCMain.MsgBoxOKClick(Sender: TObject);
begin
  if Sender = MsgBoxOK then begin

  end else
    if Sender = MsgBoxCancel then begin
  end else
    if Sender = MsgBoxYes then begin
  end else
    if Sender = MsgBoxNo then begin
  end else
    if Sender = MsgBoxClose then begin
    PanelMessageDlg.Visible := False;
  end;
end;


procedure TfrmCMain.ButtonServer1Click(Sender: TObject);
var
  sSvrName: string;
begin
  if Sender = ButtonServer1 then begin
    sSvrName := g_ServerList.Strings[0];
  end else
    if Sender = ButtonServer2 then begin
    sSvrName := g_ServerList.Strings[1];
  end else
    if Sender = ButtonServer3 then begin
    sSvrName := g_ServerList.Strings[2];
  end else
    if Sender = ButtonServer4 then begin
    sSvrName := g_ServerList.Strings[3];
  end else
    if Sender = ButtonServer5 then begin
    sSvrName := g_ServerList.Strings[4];
  end else
    if Sender = ButtonServer6 then begin
    sSvrName := g_ServerList.Strings[5];
  end else
    if Sender = ButtonServer7 then begin
    sSvrName := g_ServerList.Strings[6];
  end else
    if Sender = ButtonServer8 then begin
    sSvrName := m_SelGameZone.sServerName;
  end;
  if sSvrName <> '' then begin
    g_sServerMiniName := sSvrName;
    g_sServerName := sSvrName;
    SendSelectServer(sSvrName);
  end;

end;

procedure TfrmCMain.ButtonSelectChr1Click(Sender: TObject);
var
  sChrName: string;
begin
  if Sender = ButtonSelectChr1 then begin
    if (not g_ChrArr[0].boSelected) and (g_ChrArr[0].boValid) then begin
      EditSelectChrCurChr.Text := (g_ChrArr[0].UserChr.sName);
      g_ChrArr[0].boSelected := True;
      g_ChrArr[1].boSelected := False;
      g_ChrArr[0].boUnfreezing := True;
      g_ChrArr[0].nAniIndex := 0;
      g_ChrArr[0].nDarkLevel := 0;
      g_ChrArr[0].nEffIndex := 0;
      g_ChrArr[0].dwStartTime := GetTickCount;
      g_ChrArr[0].dwMoretime := GetTickCount;
      g_ChrArr[0].dwStartefftime := GetTickCount;
    end;
  end else
    if Sender = ButtonSelectChr2 then begin
    if (not g_ChrArr[1].boSelected) and (g_ChrArr[1].boValid) then begin
      EditSelectChrCurChr.Text := (g_ChrArr[1].UserChr.sName);
      g_ChrArr[1].boSelected := True;
      g_ChrArr[0].boSelected := False;
      g_ChrArr[1].boUnfreezing := True;
      g_ChrArr[1].nAniIndex := 0;
      g_ChrArr[1].nDarkLevel := 0;
      g_ChrArr[1].nEffIndex := 0;
      g_ChrArr[1].dwStartTime := GetTickCount;
      g_ChrArr[1].dwMoretime := GetTickCount;
      g_ChrArr[1].dwStartefftime := GetTickCount;
    end;

  end else
    if Sender = ButtonSelectChrStartPlay then begin
    sChrName := '';
    if g_ChrArr[0].boValid and g_ChrArr[0].boSelected then sChrName := g_ChrArr[0].UserChr.sName;
    if g_ChrArr[1].boValid and g_ChrArr[1].boSelected then sChrName := g_ChrArr[1].UserChr.sName;
    if sChrName <> '' then begin
      SendSelChr(sChrName);
    end else begin
      MessageDlg('还没创建游戏角色！\点击创建角色按钮创建一个游戏角色。', [mbOk]);
    end;
  end else
    if Sender = ButtonSelectChrNewChr then begin
    if not g_ChrArr[0].boValid or not g_ChrArr[1].boValid then begin
      if not g_ChrArr[0].boValid then MakeNewChar(0)
      else MakeNewChar(1);
    end else begin
      MessageDlg('一个帐号最多只能创建二个游戏角色！', [mbOk]);
    end;
  end else
    if Sender = ButtonSelectChrDelChr then begin
    sChrName := EditSelectChrCurChr.Text;
    if MessageBox(Handle, PChar(format('是否确认删除此角色?'#13#13'角色名称: %s', [sChrName])), '确认信息', MB_YESNO + MB_ICONQUESTION) = ID_YES then begin
      SendDelChr(sChrName);
    end;
  end else
    if Sender = ButtonCreateNewChrWarr then begin
    EditCreateNewChrJob.Text := '武士';
    EditCreateNewChrJob.Tag := 0;
  end else
    if Sender = ButtonCreateNewChrWizard then begin
    EditCreateNewChrJob.Text := '法师';
    EditCreateNewChrJob.Tag := 1;
  end else
    if Sender = ButtonCreateNewChrTaos then begin
    EditCreateNewChrJob.Text := '道士';
    EditCreateNewChrJob.Tag := 2;
  end else
    if Sender = ButtonCreateNewChrMale then begin
    EditCreateNewChrSex.Text := '男';
    EditCreateNewChrSex.Tag := 0;
  end else
    if Sender = ButtonCreateNewChrFemale then begin
    EditCreateNewChrSex.Text := '女';
    EditCreateNewChrSex.Tag := 1;
  end else
    if Sender = ButtonCreateNewChrOK then begin
    SelectChrCreateNewChr();
  end;
end;

procedure TfrmCMain.DecodeMessagePacket(sDataBlock: string);
var
  sData: string;
  sTagStr: string;
  sDefMsg: string;
  sBody: string;
  DefMsg: TDefaultMessage;
begin
  if sDataBlock[1] = '+' then begin //checkcode
    sData := Copy(sDataBlock, 2, Length(sDataBlock) - 1);
    sData := GetValidStr3(sData, sTagStr, ['/']);
    if sTagStr = 'PWR' then g_boNextTimePowerHit := True; //打开攻杀
    if sTagStr = 'LNG' then g_boCanLongHit := True; //打开刺杀
    if sTagStr = 'ULNG' then g_boCanLongHit := False; //关闭刺杀
    if sTagStr = 'WID' then g_boCanWideHit := True; //打开半月
    if sTagStr = 'UWID' then g_boCanWideHit := False; //关闭半月
    if sTagStr = 'CRS' then g_boCanCrsHit := True;
    if sTagStr = 'UCRS' then g_boCanCrsHit := False;
    if sTagStr = 'TWN' then g_boCanTwnHit := True;
    if sTagStr = 'UTWN' then g_boCanTwnHit := False;
    if sTagStr = 'STN' then g_boCanStnHit := True;
    if sTagStr = 'USTN' then g_boCanStnHit := False;
    if sTagStr = 'FIR' then begin
      g_boNextTimeFireHit := True; //打开烈火
      g_dwLatestFireHitTick := GetTickCount;
      //Myself.SendMsg (SM_READYFIREHIT, Myself.XX, Myself.m_nCurrY, Myself.Dir, 0, 0, '', 0);
    end;
    if sTagStr = 'UFIR' then g_boNextTimeFireHit := False; //关闭烈火
    if sTagStr = 'GOOD' then begin
      g_boActionLock := False;
      Inc(g_nReceiveCount);
    end;
    if sTagStr = 'FAIL' then begin
      ActionFailed;
      g_boActionLock := False;
      Inc(g_nReceiveCount);
    end;
    if sData <> '' then begin
      CheckSpeedHack(Str_ToInt(sData, 0));
    end;
    Exit;
  end;
  if Length(sDataBlock) < DEFBLOCKSIZE then begin
    if sDataBlock[1] = '=' then begin
      sData := Copy(sDataBlock, 2, Length(sDataBlock) - 1);
      if sData = 'DIG' then begin
        g_PlayScene.m_MySelf.m_boDigFragment := True;
      end;
    end;
    Exit;
  end;

  sDefMsg := Copy(sDataBlock, 1, DEFBLOCKSIZE);
  sBody := Copy(sDataBlock, DEFBLOCKSIZE + 1, Length(sDataBlock) - DEFBLOCKSIZE);
  DefMsg := DecodeMessage(sDefMsg);

  if g_PlayScene.m_MySelf = nil then begin
    case DefMsg.Ident of
      SM_NEWID_SUCCESS: ClientNewIDSuccess();
      SM_NEWID_FAIL: ClientNewIDFail(DefMsg.Recog);
      SM_PASSWD_FAIL: ClientLoginFail(DefMsg.Recog);
      SM_PASSOK_SELECTSERVER: ClientGetPasswordOK(DefMsg, sBody);
      SM_SELECTSERVER_OK: ClientGetPasswdSuccess(sBody);
      SM_QUERYCHR: ClientGetReceiveChrs(sBody);
      SM_QUERYCHR_FAIL: ClientQueryChrFail(DefMsg.Recog);
      SM_NEWCHR_SUCCESS: SendQueryChr();
      SM_NEWCHR_FAIL: ClientNewChrFail(DefMsg.Recog);
      SM_DELCHR_SUCCESS: SendQueryChr();
      SM_DELCHR_FAIL: ClientDelChrFail(DefMsg.Recog);
      SM_STARTPLAY: ClientGetStartPlay(sBody);
      SM_STARTFAIL: ClientStartPlayFail();
      SM_VERSION_FAIL: ClientVersionFail();
      SM_OUTOFCONNECTION,
        SM_NEWMAP,
        SM_LOGON,
        SM_RECONNECT,
        SM_SENDNOTICE: ;
      else Exit;
    end;
  end;
  if g_boMapMoving then begin
    if DefMsg.Ident = SM_CHANGEMAP then begin
      g_WaitingMsg := DefMsg;
      g_sWaitingStr := DecodeString(sBody);
      g_boMapMovingWait := True;
      WaitMsgTimer.Enabled := True;
    end;
    Exit;
  end;
  case DefMsg.Ident of
    SM_NEWMAP: ClientGetNewMap(DefMsg, sBody);
    //SM_SERVERCONFIG    :;
    SM_RECONNECT: ClientGetReconnect(sBody);
    SM_TIMECHECK_MSG: CheckSpeedHack(DefMsg.Recog);
    SM_AREASTATE: ClientGetAreaState(DefMsg.Recog);
    SM_MAPDESCRIPTION: ClientGetMapDescription(DefMsg, sBody);
    //SM_GAMEGOLDNAME    :ClientGetGameGoldName(DefMsg,sBody);
    SM_ADJUST_BONUS: ClientGetAdjustBonus(DefMsg.Recog, sBody);
    SM_MYSTATUS: ClientGetMyStatus(DefMsg);
    SM_TURN: ClientGetObjTurn(DefMsg, sBody);
    SM_BACKSTEP: ClientGetBackStep(DefMsg, sBody);

    SM_ABILITY: ClientGetAbility(DefMsg, sBody);
    SM_SUBABILITY: ClientGetSubAbility(DefMsg);
    SM_DAYCHANGING: ClientGetDayChanging(DefMsg);
    SM_WINEXP: ClientGetWinExp(DefMsg);
    SM_LEVELUP: ClientGetLevelUp(DefMsg);
    SM_HEALTHSPELLCHANGED: CliengGetHealthSpellChaged(DefMsg);
    SM_STRUCK: ClientGetStruck(DefMsg, sBody);
    //SM_PASSWORD          :;
    SM_OPENHEALTH: ;
    SM_CLOSEHEALTH: ;
    SM_INSTANCEHEALGUAGE: ;
    SM_BREAKWEAPON: ;

    SM_SENDNOTICE: ClientGetSendNotice(sBody);
    SM_LOGON: ClientGetUserLogin(DefMsg, sBody);
    SM_CRY,
      SM_GROUPMESSAGE,
      SM_GUILDMESSAGE,
      SM_WHISPER,
      SM_SYSMESSAGE: ClientGetMessage(DefMsg, sBody);
    SM_HEAR: ClientHearMsg(DefMsg, sBody);
    SM_USERNAME: ClientGetUserName(DefMsg, sBody);
    SM_CHANGENAMECOLOR: ClientGetUserNameColor(DefMsg);
    SM_HIDE,
      SM_GHOST,
      SM_DISAPPEAR: ClientGetHideObject(DefMsg);
    SM_DIGUP: ClientObjDigup(DefMsg, sBody);
    SM_DIGDOWN: ClientObjDigDown(DefMsg);
    SM_SHOWEVENT: ;
    SM_HIDEEVENT: ;
    SM_ADDITEM: ClientGetAddItem(sBody);
    SM_BAGITEMS: ClientGetBagItmes(sBody);
    SM_UPDATEITEM: ClientGetUpdateItem(sBody);
    SM_DELITEM: ClientGetDelItem(sBody);
    SM_DELITEMS: ClientGetDelItems(sBody);
    SM_DROPITEM_SUCCESS: ClientDelDropItem(DefMsg.Recog, sBody);
    SM_DROPITEM_FAIL: ClientGetDropItemFail(DefMsg.Recog, sBody);
    SM_ITEMSHOW: ClientGetShowItem(DefMsg.Recog, DefMsg.Param {x}, DefMsg.Tag {y}, DefMsg.Series {looks}, DecodeString(sBody));
    SM_ITEMHIDE: ClientGetHideItem(DefMsg.Recog, DefMsg.Param, DefMsg.Tag);
    SM_OPENDOOR_OK: ; //Map.OpenDoor (msg.param, msg.tag);
    SM_OPENDOOR_LOCK: ; //DScreen.AddSysMsg ('此门被锁定！');
    SM_CLOSEDOOR: ; //Map.CloseDoor (msg.param, msg.tag);
    SM_TAKEON_OK: ClientGetTakeOnOK(DefMsg.Recog);
    SM_TAKEON_FAIL: ClientGetTakeOnFail();
    SM_TAKEOFF_OK: ClientGetTakeOffOK(DefMsg.Recog);
    SM_TAKEOFF_FAIL: ClientGetTakeOffFail();
    SM_EXCHGTAKEON_OK: ;
    SM_EXCHGTAKEON_FAIL: ;
    SM_SENDUSEITEMS: ClientGetSenduseItems(sBody);
    SM_WEIGHTCHANGED: ClientGetWeightChanged(DefMsg);
    SM_GOLDCHANGED: ClientGetGoldChanged(DefMsg);
    SM_FEATURECHANGED: ClientGetFeatureChange(DefMsg);
    SM_CHARSTATUSCHANGED: ClientGetCharStatusChange(DefMsg);
    SM_CLEAROBJECTS: ClientGetClearObjects();
    SM_EAT_OK: ClientGetEatItemOK();
    SM_EAT_FAIL: ClientGetEatItemFail();
    SM_ADDMAGIC: ClientGetAddMagic(sBody);
    SM_SENDMYMAGIC: ClientGetMyMagics(sBody);
    SM_DELMAGIC: ClientGetDelMagic(DefMsg.Recog);
    SM_MAGIC_LVEXP: ClientGetMagicLevelUp(DefMsg);
    SM_DURACHANGE: ClientGetDuraChange(DefMsg);
    SM_MERCHANTSAY: ClientGetMerchantSay(DefMsg, sBody);
    SM_MERCHANTDLGCLOSE: ClientGetMerchantClose();
    SM_SENDGOODSLIST: ClientGetSendGoodsList(DefMsg, sBody);
    SM_SENDUSERMAKEDRUGITEMLIST: ClientGetSendMakeDrugList(DefMsg, sBody);
    SM_SENDUSERSELL: ClientGetSendUserSell(DefMsg.Recog);
    SM_SENDUSERREPAIR: ClientGetSendUserRepair(DefMsg.Recog);
    SM_SENDBUYPRICE: ClientGetBuyPrice(DefMsg);
    SM_USERSELLITEM_OK: ClientGetUserSellItemOK();
    SM_SENDREPAIRCOST: ClientGetRepairCost(DefMsg);
    SM_USERREPAIRITEM_OK: ;
    SM_USERREPAIRITEM_FAIL: ;
    SM_STORAGE_OK,
      SM_STORAGE_FULL,
      SM_STORAGE_FAIL: ;
    SM_SAVEITEMLIST: ;
    SM_TAKEBACKSTORAGEITEM_OK,
      SM_TAKEBACKSTORAGEITEM_FAIL,
      SM_TAKEBACKSTORAGEITEM_FULLBAG: ;
  end;
end;

procedure TfrmCMain.CloseScene();
begin
  case g_CurrentScene of
    s_None: ;
    s_Intro: ;
    s_NewAccount: begin
        PanelNewAccount.Visible := False;
      end;
    s_Login: begin
        PanelUserLogin.Visible := False;
      end;
    s_SelectServer: begin
        PanelSelectServer.Visible := False;
      end;
    s_SelectChr: begin
        PanelSelectChr.Visible := False;
      end;
    s_LoginNotice: ;
    s_Play: begin
        PanelPlayGame.Visible := False;
      end;
  end;
end;
procedure TfrmCMain.OpenScene();
begin
  case g_CurrentScene of
    s_None: ;
    s_Intro: ;
    s_NewAccount: begin
        PanelNewAccount.Left := (PanelClient.Width - PanelNewAccount.Width) div 2;
        PanelNewAccount.top := (PanelClient.Height - PanelNewAccount.Height) div 2;
        SetTopOrder(PanelNewAccount);
        PanelNewAccount.Visible := True;
      end;
    s_Login: begin
        PanelUserLogin.Left := (Width - PanelUserLogin.Width) div 2;
        PanelUserLogin.top := (Height - PanelUserLogin.Height) div 2;
        PanelUserLogin.Visible := True;
        EditUserAccount.Text := '';
        EditUserPassword.Text := '';
        //EditUserAccount.SetFocus;
        EditUserAccount.Enabled := True;
        EditUserPassword.Enabled := True;
        ButtonStart.Enabled := True;
        SetTopOrder(PanelUserLogin);
      end;
    s_SelectServer: begin
        PanelSelectServer.Left := (PanelClient.Width - PanelSelectServer.Width) div 2;
        PanelSelectServer.top := (PanelClient.Height - PanelSelectServer.Height) div 2;
        ButtonServer1.Visible := False;
        ButtonServer2.Visible := False;
        ButtonServer3.Visible := False;
        ButtonServer4.Visible := False;
        ButtonServer5.Visible := False;
        ButtonServer6.Visible := False;
        ButtonServer7.Visible := False;
        ButtonServer8.Visible := False;
        PanelSelectServer.Visible := True;
        SetTopOrder(PanelSelectServer);
        ShowSelectServer();
        if m_boAutoLogin then begin
          //SendSelectServer(m_GameZone.sServerName);
        end;

      end;
    s_SelectChr: begin
        PanelSelectChr.Left := (PanelClient.Width - PanelSelectChr.Width) div 2;
        PanelSelectChr.top := (PanelClient.Height - PanelSelectChr.Height) div 2;
        PanelSelectChr.Visible := True;
        SetTopOrder(PanelSelectChr);
        if m_boAutoLogin then begin
          if m_nAutoChr = 0 then begin
            ButtonSelectChr1Click(ButtonSelectChr1);
          end else begin
            ButtonSelectChr1Click(ButtonSelectChr2);
          end;
          ButtonSelectChr1Click(ButtonSelectChrStartPlay);
        end;
      end;
    s_LoginNotice: ;
    s_Play: begin
        PanelPlayGame.Left := (PanelClient.Width - PanelPlayGame.Width) div 2;
        PanelPlayGame.top := (PanelClient.Height - PanelPlayGame.Height) div 2;
        PanelPlayGame.Align := alClient;
        SetTopOrder(PanelPlayGame);
        PanelPlay.Visible := False;
        PanelPlayGame.Visible := True;

      end;
  end;
end;
procedure TfrmCMain.ChangeScene(SceneType: TSceneType);
begin
  if g_CurrentScene <> s_None then CloseScene();


  case SceneType of
    stIntro: g_CurrentScene := s_Intro;
    st_NewAccount: g_CurrentScene := s_NewAccount;
    stLogin: g_CurrentScene := s_Login;
    stSelectServer: g_CurrentScene := s_SelectServer;
    stSelectCountry: ;
    stSelectChr: g_CurrentScene := s_SelectChr;
    stNewChr: ;
    stLoading: ;
    stLoginNotice: g_CurrentScene := s_LoginNotice;
    stPlayGame: g_CurrentScene := s_Play;
  end;
  if g_CurrentScene <> s_None then OpenScene();
end;

procedure TfrmCMain.ShowSelectServer();
  function GetStatusColor(nStatus: Integer): TColor;
  begin
    case nStatus of //
      0: Result := clDkGray;
      1: Result := clBlue;
      2: Result := clGreen;
      3: Result := clMaroon;
      4: Result := clRed;
      else begin
          Result := clBlack;
        end;
    end; // case
  end;
var
  I: Integer;
begin
  for I := 0 to g_ServerList.Count - 1 do begin
    case I of //
      0: begin
          ButtonServer1.Caption := g_ServerList.Strings[I];
          ButtonServer1.Font.Color := GetStatusColor(Integer(g_ServerList.Objects[I]));
          ButtonServer1.Visible := True;
        end;
      1: begin
          ButtonServer2.Caption := g_ServerList.Strings[I];
          ButtonServer2.Font.Color := GetStatusColor(Integer(g_ServerList.Objects[I]));
          ButtonServer2.Visible := True;
        end;
      2: begin
          ButtonServer3.Caption := g_ServerList.Strings[I];
          ButtonServer3.Font.Color := GetStatusColor(Integer(g_ServerList.Objects[I]));
          ButtonServer3.Visible := True;
        end;
      3: begin
          ButtonServer4.Caption := g_ServerList.Strings[I];
          ButtonServer4.Font.Color := GetStatusColor(Integer(g_ServerList.Objects[I]));
          ButtonServer4.Visible := True;
        end;
      4: begin
          ButtonServer5.Caption := g_ServerList.Strings[I];
          ButtonServer5.Font.Color := GetStatusColor(Integer(g_ServerList.Objects[I]));
          ButtonServer5.Visible := True;
        end;
      5: begin
          ButtonServer6.Caption := g_ServerList.Strings[I];
          ButtonServer6.Font.Color := GetStatusColor(Integer(g_ServerList.Objects[I]));
          ButtonServer6.Visible := True;
        end;
      6: begin
          ButtonServer7.Caption := g_ServerList.Strings[I];
          ButtonServer7.Font.Color := GetStatusColor(Integer(g_ServerList.Objects[I]));
          ButtonServer7.Visible := True;
        end;
    end;
  end;
  {ButtonServer8.Caption:=m_GameZone.sServerName;
  ButtonServer8.Font.Color:=GetStatusColor(Integer(-1));
  ButtonServer8.Visible:=True;}

end;

procedure TfrmCMain.ActionFailed;
begin

end;

procedure TfrmCMain.CheckSpeedHack(dwTime: LongWord);
begin

end;

procedure TfrmCMain.ClientLoginFail(nFailCode: Integer);
begin
  case nFailCode of
    -1: MessageDlg('密码错误！！', [mbOk]);
    -2: MessageDlg('密码输入错误超过3次，此帐号被暂时锁定，请稍候再登录！', [mbOk]);
    -3: MessageDlg('此帐号已经登录或被异常锁定，请稍候再登录！', [mbOk]);
    -4: MessageDlg('这个帐号访问失败！\请使用其他帐号登录，\或者申请付费注册。', [mbOk]);
    -5: MessageDlg('这个帐号被锁定！', [mbOk]);
    else MessageDlg('此帐号不存在或出现未知错误！！', [mbOk]);
  end;
  EditUserAccount.Enabled := True;
  EditUserPassword.Enabled := True;
  g_boSendLogin := False;
end;

procedure TfrmCMain.ClientGetPasswordOK(DefMsg: TDefaultMessage;
  sData: string);
var
  I: Integer;
  sServerName: string;
  sServerStatus: string;
  nCount: Integer;
begin
  sData := DecodeString(sData);
  //  FrmDlg.DMessageDlg (sBody + '/' + IntToStr(Msg.Series), [mbOk]);
  nCount := _MIN(6, DefMsg.Series);
  g_ServerList.Clear;
  for I := 0 to nCount - 1 do begin
    sData := GetValidStr3(sData, sServerName, ['/']);
    sData := GetValidStr3(sData, sServerStatus, ['/']);
    g_ServerList.AddObject(sServerName, TObject(Str_ToInt(sServerStatus, 0)));
  end;
  g_wAvailIDDay := Loword(DefMsg.Recog);
  g_wAvailIDHour := Hiword(DefMsg.Recog);
  g_wAvailIPDay := DefMsg.Param;
  g_wAvailIPHour := DefMsg.Tag;

  if g_wAvailIDDay > 0 then begin
    if g_wAvailIDDay = 1 then
      MessageDlg('您当前ID费用到今天为止。', [mbOk])
    else if g_wAvailIDDay <= 3 then
      MessageDlg('您当前IP费用还剩 ' + IntToStr(g_wAvailIDDay) + ' 天。', [mbOk]);
  end else if g_wAvailIPDay > 0 then begin
    if g_wAvailIPDay = 1 then
      MessageDlg('您当前IP费用到今天为止。', [mbOk])
    else if g_wAvailIPDay <= 3 then
      MessageDlg('您当前IP费用还剩 ' + IntToStr(g_wAvailIPDay) + ' 天。', [mbOk]);
  end else if g_wAvailIPHour > 0 then begin
    if g_wAvailIPHour <= 100 then
      MessageDlg('您当前IP费用还剩 ' + IntToStr(g_wAvailIPHour) + ' 小时。', [mbOk]);
  end else if g_wAvailIDHour > 0 then begin
    MessageDlg('您当前ID费用还剩 ' + IntToStr(g_wAvailIDHour) + ' 小时。', [mbOk]); ;
  end;
  ChangeScene(stSelectServer);
end;


procedure TfrmCMain.ClientGetMyStatus(DefMsg: TDefaultMessage);
begin

end;

procedure TfrmCMain.ClientGetNewMap(DefMsg: TDefaultMessage; sData: string);
var
  sText: string;
begin
  g_sMapTitle := '';
  sText := DecodeString(sData);
  g_sMapName := sText;
  g_PlayScene.SendMsg(DefMsg.Ident, 0,
    DefMsg.Param {x},
    DefMsg.Tag {y},
    DefMsg.Series {darkness},
    0, 0,
    sText {mapname});
end;
////////////////////////////////////////////////////////////////////////////////
function GetCodeMsgSize(X: Double): Integer;
begin
  if INT(X) < X then Result := TRUNC(X) + 1
  else Result := TRUNC(X)
end;
//////////////////////////////////////////////////////////////////////////////////
function TfrmCMain.GetRGB(c256: Byte): TColor;
begin
  Result := RGB(ColorTable[c256].rgbRed, ColorTable[c256].rgbGreen, ColorTable[c256].rgbBlue);
end;

/////////////////////////////////////////////
procedure TfrmCMain.ClientGetObjTurn(DefMsg: TDefaultMessage;
  sData: string);
var
  sBody2: string;
  sBody: string;
  sColor: string;
  CharDesc: TCharDesc;
  Actor: TActor;
begin
  if Length(sData) > GetCodeMsgSize(sizeof(TCharDesc) * 4 / 3) then begin
    sBody := Copy(sData, GetCodeMsgSize(sizeof(TCharDesc) * 4 / 3) + 1, Length(sData));
    sBody := DecodeString(sBody);
    sColor := GetValidStr3(sBody, sBody, ['/']);
  end else sData := '';
  DecodeBuffer(sData, @CharDesc, sizeof(TCharDesc));
  g_PlayScene.SendMsg(DefMsg.Ident,
    DefMsg.Recog,
    DefMsg.Param {x},
    DefMsg.Tag {y},
    DefMsg.Series {dir + light},
    CharDesc.Feature,
    CharDesc.Status,
    '');
  if sBody <> '' then begin
    Actor := g_PlayScene.FindActor(DefMsg.Recog);
    if Actor <> nil then begin
      Actor.m_sDescUserName := GetValidStr3(sBody, Actor.m_sUserName, ['\']);
      //Actor.UserName := sBody;
      Actor.m_nNameColor := GetRGB(Str_ToInt(sColor, 0));
    end;
  end;
end;

procedure TfrmCMain.ClientGetPasswdSuccess(sData: string);
var
  sText: string;
  sSelChrAddr: string;
  sSelChrPort: string;
  sCertification: string;
begin
  sText := DecodeString(sData);
  sText := GetValidStr3(sText, sSelChrAddr, ['/']);
  sText := GetValidStr3(sText, sSelChrPort, ['/']);
  sText := GetValidStr3(sText, sCertification, ['/']);
  m_nCertification := Str_ToInt(sCertification, 0);

  CSocket.Active := False;
  CSocket.Host := '';
  CSocket.Port := 0;
  WaitAndPass(500); //0.5檬悼救 扁促覆
  g_ConnectionStep := cnsSelChr;
  with CSocket do begin
    g_sSelChrAddr := sSelChrAddr;
    g_nSelChrPort := Str_ToInt(sSelChrPort, 0);
    Address := g_sSelChrAddr;
    Port := g_nSelChrPort;
    Active := True;
  end;

end;

procedure TfrmCMain.ClientGetReceiveChrs(sData: string);
  procedure AddChr(sName: string; nJob, nHair, nLevel, nSex: Integer);
  var
    I: Integer;
  begin
    if not g_ChrArr[0].boValid then I := 0
    else if not g_ChrArr[1].boValid then I := 1
    else Exit;
    g_ChrArr[I].UserChr.sName := sName;
    g_ChrArr[I].UserChr.btJob := nJob;
    g_ChrArr[I].UserChr.btHair := nHair;
    g_ChrArr[I].UserChr.wLevel := nLevel;
    g_ChrArr[I].UserChr.btSex := nSex;
    g_ChrArr[I].boValid := True;
  end;
  function GetJobName(nJob: Integer): string;
  begin
    case nJob of
      0: Result := '武士';
      1: Result := '魔法师';
      2: Result := '道士'
      else Result := '未知';
    end;
  end;
  function GetSexName(nSex: Integer): string;
  begin
    case nSex of
      0: Result := '男';
      1: Result := '女';
      else Result := '未知';
    end;
  end;
var
  I: Integer;
  nSelect: Integer;
  sText: string;
  sName: string;
  sJob: string;
  sHair: string;
  sLevel: string;
  sSex: string;
begin
  FillChar(g_ChrArr, sizeof(g_ChrArr), 0);
  EditSelectChrName1.Text := '';
  EditSelectChrLevel1.Text := '';
  EditSelectChrSex1.Text := '';
  EditSelectChrJob1.Text := '';

  EditSelectChrName2.Text := '';
  EditSelectChrLevel2.Text := '';
  EditSelectChrSex2.Text := '';
  EditSelectChrJob2.Text := '';

  sText := DecodeString(sData);
  for I := Low(g_ChrArr) to High(g_ChrArr) do begin
    sText := GetValidStr3(sText, sName, ['/']);
    sText := GetValidStr3(sText, sJob, ['/']);
    sText := GetValidStr3(sText, sHair, ['/']);
    sText := GetValidStr3(sText, sLevel, ['/']);
    sText := GetValidStr3(sText, sSex, ['/']);
    nSelect := 0;
    if (sName <> '') and (sLevel <> '') and (sSex <> '') then begin
      if sName[1] = '*' then begin
        nSelect := I;
        sName := Copy(sName, 2, Length(sName) - 1);
        EditSelectChrCurChr.Text := sName;
      end;
      AddChr(sName, Str_ToInt(sJob, 0), Str_ToInt(sHair, 0), Str_ToInt(sLevel, 0), Str_ToInt(sSex, 0));
    end;
    if nSelect = 0 then begin
      g_ChrArr[0].boFreezeState := False;
      g_ChrArr[0].boSelected := True;
      g_ChrArr[1].boFreezeState := True;
      g_ChrArr[1].boSelected := False;
    end else begin
      g_ChrArr[0].boFreezeState := True;
      g_ChrArr[0].boSelected := False;
      g_ChrArr[1].boFreezeState := False;
      g_ChrArr[1].boSelected := True;
    end;
  end;
  EditSelectChrName1.Text := g_ChrArr[0].UserChr.sName;
  EditSelectChrLevel1.Text := IntToStr(g_ChrArr[0].UserChr.wLevel);
  EditSelectChrSex1.Text := GetSexName(g_ChrArr[0].UserChr.btSex);
  EditSelectChrJob1.Text := GetJobName(g_ChrArr[0].UserChr.btJob);

  EditSelectChrName2.Text := g_ChrArr[1].UserChr.sName;
  EditSelectChrLevel2.Text := IntToStr(g_ChrArr[1].UserChr.wLevel);
  EditSelectChrSex2.Text := GetSexName(g_ChrArr[1].UserChr.btSex);
  EditSelectChrJob2.Text := GetJobName(g_ChrArr[1].UserChr.btJob);
  ChangeScene(stSelectChr);
end;



procedure TfrmCMain.ClientGetReconnect(sData: string);
begin

end;

procedure TfrmCMain.ClientQueryChrFail(nFailCode: Integer);
begin

end;

procedure TfrmCMain.ClientNewChrFail(nFailCode: Integer);
begin
  case nFailCode of
    0: MessageDlg('[错误信息] 输入的角色名称包含非法字符！ 错误代码 = 0', [mbOk]);
    2: MessageDlg('[错误信息] 创建角色名称已被其他人使用！ 错误代码 = 2', [mbOk]);
    3: MessageDlg('[错误信息] 您只能创建二个游戏角色！ 错误代码 = 3', [mbOk]);
    4: MessageDlg('[错误信息] 创建角色时出现错误！ 错误代码 = 4', [mbOk]);
    else MessageDlg('[错误信息] 创建角色时出现未知错误！', [mbOk]);
  end;
end;

procedure TfrmCMain.ClientNewIDFail(nFailCode: Integer);
begin
  case nFailCode of
    0: begin
        MessageDlg('帐号 "' + m_sMakeNewId + '" 已被其他的玩家使用了。'#13'请选择其它帐号名注册。', [mbOk]);
        ButtonPanelNewAccountOK.Enabled := True;
      end;
    -2: begin
        MessageDlg('此帐号名被禁止使用！', [mbOk]);
        ButtonPanelNewAccountOK.Enabled := True;
      end;
    else begin
        MessageDlg('帐号创建失败，请确认帐号是否包括空格、及非法字符！Code: ' + IntToStr(nFailCode), [mbOk]);
        ButtonPanelNewAccountOK.Enabled := True;
      end;
  end;
end;

procedure TfrmCMain.ClientNewIDSuccess;
begin
  MessageBox(Handle, '您的帐号创建成功。'#13'请妥善保管您的帐号和密码，'#13'并且不要因任何原因把帐号和密码告诉任何其他人。', '确认信息', MB_OK);
  ChangeScene(stLogin);
end;

procedure TfrmCMain.ClientObjDigDown(DefMsg: TDefaultMessage);
begin
  g_PlayScene.SendMsg(DefMsg.Ident, DefMsg.Recog, DefMsg.Param {x}, DefMsg.Tag {y}, 0, 0, 0, '');
end;

procedure TfrmCMain.ClientObjDigup(DefMsg: TDefaultMessage; sData: string);
var
  MsgWL: TMessageBodyWL;
  Actor: TActor;
begin
  DecodeBuffer(sData, @MsgWL, sizeof(TMessageBodyWL));
  Actor := g_PlayScene.FindActor(DefMsg.Recog);
  if Actor = nil then
    Actor := g_PlayScene.NewActor(DefMsg.Recog, DefMsg.Param, DefMsg.Tag, DefMsg.Series, MsgWL.lParam1, MsgWL.lParam2);
  Actor.m_nCurrentEvent := MsgWL.lTag1;
  Actor.SendMsg(SM_DIGUP,
    DefMsg.Param {x},
    DefMsg.Tag {y},
    DefMsg.Series {dir + light},
    MsgWL.lParam1,
    MsgWL.lParam2, '', 0);
end;

procedure TfrmCMain.CliengGetHealthSpellChaged(DefMsg: TDefaultMessage);
begin

end;

procedure TfrmCMain.ClientDelChrFail(nFailCode: Integer);
begin

end;

procedure TfrmCMain.ClientGetStartPlay(sData: string);
var
  sText: string;
  sRunAddr: string;
  sRunPort: string;
begin
  sText := DecodeString(sData);
  sRunPort := GetValidStr3(sText, g_sRunServerAddr, ['/']);
  g_nRunServerPort := Str_ToInt(sRunPort, 0);

  CSocket.Active := False;
  CSocket.Host := '';
  CSocket.Port := 0;
  WaitAndPass(500); //0.5檬悼救 扁促覆

  g_ConnectionStep := cnsPlay;
  with CSocket do begin
    Address := g_sRunServerAddr;
    Port := g_nRunServerPort;
    Active := True;
  end;
end;

procedure TfrmCMain.ClientStartPlayFail;
begin
  MessageDlg('此服务器满员！', [mbOk]);

end;

procedure TfrmCMain.ClientVersionFail;
begin
  MessageDlg('游戏程序版本不正确，请下载最新版本游戏程序！', [mbOk]);
end;

procedure TfrmCMain.ClientGetSendNotice(sData: string);
var
  sLineText: string;
  sMsg: string;
  sServerName: string;
begin
  g_boDoFastFadeOut := False;
  sMsg := '';
  sData := DecodeString(sData);
  while True do begin
    if sData = '' then break;
    sData := GetValidStr3(sData, sLineText, [#27]);
    sMsg := sMsg + sLineText + #13;
  end;
  sServerName := m_SelGameZone.sServerName;
  if m_boAutoLogin then begin
    SendClientMessage(CM_LOGINNOTICEOK, 0, 0, 0, CLIENTTYPE);
  end else
    if (MessageBox(Handle, PChar(sMsg), PChar(sServerName + '公告'), MB_OK) = ID_OK) then begin
    SendClientMessage(CM_LOGINNOTICEOK, 0, 0, 0, CLIENTTYPE);
  end;

end;


procedure TfrmCMain.ClientGetUserLogin(DefMsg: TDefaultMessage;
  sData: string);
var
  MsgWL: TMessageBodyWL;
begin
  g_dwFirstServerTime := 0;
  g_dwFirstClientTime := 0;
  DecodeBuffer(sData, @MsgWL, sizeof(TMessageBodyWL));
  g_PlayScene.SendMsg(DefMsg.Ident, DefMsg.Recog, DefMsg.Param {x}, DefMsg.Tag {y}, DefMsg.Series {dir}, MsgWL.lParam1 {desc.Feature}, MsgWL.lParam2 {desc.Status}, '');
  ChangeScene(stPlayGame);
  SendClientMessage(CM_QUERYBAGITEMS, 0, 0, 0, 0);
  if Lobyte(Loword(MsgWL.lTag1)) = 1 then g_boAllowGroup := True
  else g_boAllowGroup := False;
  g_boServerChanging := False;
  if g_wAvailIDDay > 0 then begin
    AddChatBoardString('您当前通过包月帐号充值。', clGreen, clWhite)
  end else if g_wAvailIPDay > 0 then begin
    AddChatBoardString('您当前通过包月IP 充值。', clGreen, clWhite)
  end else if g_wAvailIPHour > 0 then begin
    AddChatBoardString('您当前通过计时IP 充值。', clGreen, clWhite)
  end else if g_wAvailIDHour > 0 then begin
    AddChatBoardString('您当前通过计时帐号充值。', clGreen, clWhite)
  end;
end;

procedure TfrmCMain.ClientGetAbility(DefMsg: TDefaultMessage;
  sData: string);
begin
  g_PlayScene.m_MySelf.m_nGold := DefMsg.Recog;
  g_PlayScene.m_MySelf.m_btJob := DefMsg.Param;
  g_PlayScene.m_MySelf.m_nGameGold := MakeLong(DefMsg.Tag, DefMsg.Series);
  DecodeBuffer(sData, @g_PlayScene.m_MySelf.m_Abil, sizeof(TAbility));
end;


procedure TfrmCMain.ClientGetStruck(DefMsg: TDefaultMessage;
  sData: string);
begin

end;

procedure TfrmCMain.ClientGetSubAbility(DefMsg: TDefaultMessage);
begin
  g_nMyHitPoint := Lobyte(DefMsg.Param);
  g_nMySpeedPoint := Hibyte(DefMsg.Param);
  g_nMyAntiPoison := Lobyte(DefMsg.Tag);
  g_nMyPoisonRecover := Hibyte(DefMsg.Tag);
  g_nMyHealthRecover := Lobyte(DefMsg.Series);
  g_nMySpellRecover := Hibyte(DefMsg.Series);
  g_nMyAntiMagic := Lobyte(LongWord(DefMsg.Recog));
end;

procedure TfrmCMain.ClientGetAddItem(sData: string);
begin

end;

procedure TfrmCMain.ClientGetHideObject(DefMsg: TDefaultMessage);
begin
  if g_PlayScene.m_MySelf.m_nRecogId <> DefMsg.Recog then
    g_PlayScene.SendMsg(SM_HIDE, DefMsg.Recog, DefMsg.Param {x}, DefMsg.Tag {y}, 0, 0, 0, '');
end;

procedure TfrmCMain.ClientGetMessage(DefMsg: TDefaultMessage;
  sData: string);
var
  sText: string;
begin
  sText := DecodeString(sData);
  AddChatBoardString(sText, GetRGB(Lobyte(DefMsg.Param)), GetRGB(Hibyte(DefMsg.Param)));
  if DefMsg.Ident = SM_GUILDMESSAGE then
    AddGuildChat(sText);
end;

procedure TfrmCMain.ClientGetWinExp(DefMsg: TDefaultMessage);
begin

end;

procedure TfrmCMain.ClientHearMsg(DefMsg: TDefaultMessage; sData: string);
var
  sText: string;
  Actor: TActor;
begin
  sText := DecodeString(sData);
  AddChatBoardString(sText, GetRGB(Lobyte(DefMsg.Param)), GetRGB(Hibyte(DefMsg.Param)));
  Actor := g_PlayScene.FindActor(DefMsg.Recog);
  if Actor <> nil then begin
    Actor.Say(sText);
  end;
end;


procedure TfrmCMain.ClientGetUserName(DefMsg: TDefaultMessage;
  sData: string);
var
  sText: string;
  Actor: TActor;
begin
  sText := DecodeString(sData);
  Actor := g_PlayScene.FindActor(DefMsg.Recog);
  if Actor <> nil then begin
    Actor.m_sDescUserName := GetValidStr3(sText, Actor.m_sUserName, ['\']);
    //Actor.UserName := str;
    Actor.m_nNameColor := GetRGB(DefMsg.Param);
    if Actor = g_PlayScene.m_MySelf then
      Caption := format('%s - %s', [m_SelGameZone.sServerName, Actor.m_sUserName]);

  end;

end;


procedure TfrmCMain.ClientGetUserNameColor(DefMsg: TDefaultMessage);
var
  sText: string;
  Actor: TActor;
begin
  Actor := g_PlayScene.FindActor(DefMsg.Recog);
  if Actor <> nil then begin
    Actor.m_nNameColor := GetRGB(DefMsg.Param);
  end;
end;


procedure TfrmCMain.ClientGetBackStep(DefMsg: TDefaultMessage;
  sData: string);
begin

end;

procedure TfrmCMain.ClientGetBagItmes(sData: string);
var
  sItem: string;
  ClientItem: TClientItem;
begin
  FillChar(g_ItemArr, sizeof(g_ItemArr), #0);
  while True do begin
    if sData = '' then break;
    sData := GetValidStr3(sData, sItem, ['/']);
    DecodeBuffer(sItem, @ClientItem, sizeof(TClientItem));
    AddItemBag(ClientItem);
  end;
  ArrangeItembag;
  g_boBagLoaded := True;
end;

procedure TfrmCMain.ClientGetUpdateItem(sData: string);
begin

end;


procedure TfrmCMain.ClientGetDayChanging(DefMsg: TDefaultMessage);
begin

end;

procedure TfrmCMain.ClientGetDelItem(sData: string);
begin

end;

procedure TfrmCMain.ClientGetDelItems(sData: string);
begin

end;

procedure TfrmCMain.ClientDelDropItem(nItemID: Integer; sData: string);
begin

end;

procedure TfrmCMain.ClientGetDropItemFail(nItemID: Integer; sData: string);
begin

end;

procedure TfrmCMain.ClientGetShowItem(nItemID, nX, nY, nLooks: Integer;
  sItemName: string);
begin

end;

procedure TfrmCMain.ClientGetHideItem(nItemID, nX, nY: Integer);
begin

end;

procedure TfrmCMain.ClientGetTakeOnOK(nItemID: Integer);
begin

end;

procedure TfrmCMain.ClientGetTakeOnFail;
begin

end;

procedure TfrmCMain.ClientGetTakeOffOK(nItemID: Integer);
begin

end;

procedure TfrmCMain.ClientGetTakeOffFail;
begin

end;

procedure TfrmCMain.ClientGetSenduseItems(sData: string);
var
  nIndex: Integer;
  sIndex: string;
  sBody: string;
  ClientItem: TClientItem;
begin
  FillChar(g_UseItems, sizeof(g_UseItems), #0);
  while True do begin
    if sData = '' then break;
    sData := GetValidStr3(sData, sIndex, ['/']);
    sData := GetValidStr3(sData, sBody, ['/']);
    nIndex := Str_ToInt(sIndex, -1);
    if nIndex in [0..12] then begin
      DecodeBuffer(sBody, @ClientItem, sizeof(TClientItem));
      g_UseItems[nIndex] := ClientItem;
    end;
  end;
end;

procedure TfrmCMain.ClientGetWeightChanged(DefMsg: TDefaultMessage);
begin

end;


procedure TfrmCMain.ClientGetGameGoldName(DefMsg: TDefaultMessage;
  sData: string);
var
  sBody: string;
begin
  if sData <> '' then begin
    sData := DecodeString(sData);
    sData := GetValidStr3(sData, sBody, [#13]);
    g_sGameGoldName := sBody;
    g_sGamePointName := sData;
  end;
  g_PlayScene.m_MySelf.m_nGameGold := DefMsg.Recog;
  g_PlayScene.m_MySelf.m_nGamePoint := MakeLong(DefMsg.Param, DefMsg.Tag);
end;

procedure TfrmCMain.ClientGetGoldChanged(DefMsg: TDefaultMessage);
begin
  if DefMsg.Recog > g_PlayScene.m_MySelf.m_nGold then begin
    AddChatBoardString('已获得 ' + IntToStr(DefMsg.Recog - g_PlayScene.m_MySelf.m_nGold) + g_sGoldName {'金币。}, GetRGB(180), clWhite);
  end;
  g_PlayScene.m_MySelf.m_nGold := DefMsg.Recog;
  g_PlayScene.m_MySelf.m_nGameGold := MakeLong(DefMsg.Param, DefMsg.Tag);
end;

procedure TfrmCMain.ClientGetFeatureChange(DefMsg: TDefaultMessage);
begin

end;

procedure TfrmCMain.ClientGetCharStatusChange(DefMsg: TDefaultMessage);
begin

end;

procedure TfrmCMain.ClientGetClearObjects;
begin
  g_PlayScene.ClearObjects;
  g_boMapMoving := True;
end;

procedure TfrmCMain.ClientGetEatItemOK;
begin

end;

procedure TfrmCMain.ClientGetEatItemFail;
begin

end;

procedure TfrmCMain.ClientGetAddMagic(sData: string);
var
  ClientMagic: pTClientMagic;
begin
  if sData = '' then Exit;

  New(ClientMagic);
  DecodeBuffer(sData, @(ClientMagic^), sizeof(TClientMagic));
  g_MagicList.Add(ClientMagic);
end;


procedure TfrmCMain.ClientGetAdjustBonus(nBonusPoint: Integer;
  sData: string);
begin

end;

procedure TfrmCMain.ClientGetAreaState(nAreaState: Integer);
begin

end;

procedure TfrmCMain.ClientGetMyMagics(sData: string);
var
  I: Integer;
  sBody: string;
  ClientMagic: pTClientMagic;
begin
  for I := 0 to g_MagicList.Count - 1 do
    Dispose(pTClientMagic(g_MagicList[I]));
  g_MagicList.Clear;

  while True do begin
    if sData = '' then break;
    sData := GetValidStr3(sData, sBody, ['/']);
    if sBody <> '' then begin
      New(ClientMagic);
      DecodeBuffer(sBody, @(ClientMagic^), sizeof(TClientMagic));
      g_MagicList.Add(ClientMagic);
    end else break;
  end;
end;

procedure TfrmCMain.ClientGetDelMagic(nMagicID: Integer);
begin

end;


procedure TfrmCMain.ClientGetLevelUp(DefMsg: TDefaultMessage);
begin

end;

procedure TfrmCMain.ClientGetMagicLevelUp(DefMsg: TDefaultMessage);
begin

end;

procedure TfrmCMain.ClientGetDuraChange(DefMsg: TDefaultMessage);
begin

end;

procedure TfrmCMain.ClientGetMerchantSay(DefMsg: TDefaultMessage;
  sData: string);
begin

end;


procedure TfrmCMain.ClientGetMapDescription(DefMsg: TDefaultMessage;
  sData: string);
var
  sTitle: string;
begin
  sData := DecodeString(sData);
  sData := GetValidStr3(sData, sTitle, [#13]);
  g_sMapTitle := sTitle;
  g_nMapMusic := DefMsg.Recog;
end;

procedure TfrmCMain.ClientGetMerchantClose;
begin

end;

procedure TfrmCMain.ClientGetSendGoodsList(DefMsg: TDefaultMessage;
  sData: string);
begin

end;

procedure TfrmCMain.ClientGetSendMakeDrugList(DefMsg: TDefaultMessage;
  sData: string);
begin

end;

procedure TfrmCMain.ClientGetSendUserSell(nMerchant: Integer);
begin

end;

procedure TfrmCMain.ClientGetSendUserRepair(nMerchant: Integer);
begin

end;

procedure TfrmCMain.ClientGetBuyPrice(DefMsg: TDefaultMessage);
begin

end;

procedure TfrmCMain.ClientGetUserSellItemOK;
begin

end;

procedure TfrmCMain.ClientGetRepairCost(DefMsg: TDefaultMessage);
begin

end;

procedure TfrmCMain.SendSocket(sSendMsg: string);
begin
  if CSocket.Socket.Connected then begin
    CSocket.Socket.SendText('#' + IntToStr(g_btCode) + sSendMsg + '!');
    Inc(g_btCode);
    if g_btCode >= 10 then g_btCode := 1;
  end;
end;

procedure TfrmCMain.SendClientMessage(nIdent, nRecog, nParam, nTag, nSeries: Integer);
var
  DefMsg: TDefaultMessage;
begin
  DefMsg := MakeDefaultMsg(nIdent, nRecog, nParam, nTag, nSeries);
  SendSocket(EncodeMessage(DefMsg));
end;

procedure TfrmCMain.SendNewAccount(ue: TUserEntry; ua: TUserEntryAdd);
var
  Msg: TDefaultMessage;
begin
  m_sMakeNewId := ue.sAccount;
  Msg := MakeDefaultMsg(CM_ADDNEWUSER, 0, 0, 0, 0);
  SendSocket(EncodeMessage(Msg) + EncodeBuffer(@ue, sizeof(TUserEntry)) + EncodeBuffer(@ua, sizeof(TUserEntryAdd)));
end;

procedure TfrmCMain.SendLogin(sAccount, sPassWord: string);
var
  DefMsg: TDefaultMessage;
begin
  DefMsg := MakeDefaultMsg(CM_IDPASSWORD, 0, 0, 0, 0);
  SendSocket(EncodeMessage(DefMsg) + EncodeString(sAccount + '/' + sPassWord));
  g_boSendLogin := True;
end;
procedure TfrmCMain.SendNewChr(sAccount, sChrName, sHair, sJob, sSex: string);
var
  DefMsg: TDefaultMessage;
begin
  DefMsg := MakeDefaultMsg(CM_NEWCHR, 0, 0, 0, 0);
  SendSocket(EncodeMessage(DefMsg) + EncodeString(sAccount + '/' + sChrName + '/' + sHair + '/' + sJob + '/' + sSex));
end;

procedure TfrmCMain.SendQueryChr;
var
  DefMsg: TDefaultMessage;
begin
  DefMsg := MakeDefaultMsg(CM_QUERYCHR, 0, 0, 0, 0);
  SendSocket(EncodeMessage(DefMsg) + EncodeString(m_sLoginAccount + '/' + IntToStr(m_nCertification)));
end;


procedure TfrmCMain.SendSelectServer(sServerName: string);
var
  DefMsg: TDefaultMessage;
begin
  DefMsg := MakeDefaultMsg(CM_SELECTSERVER, 0, 0, 0, 0);
  SendSocket(EncodeMessage(DefMsg) + EncodeString(sServerName));
end;

procedure TfrmCMain.SendSay(sMsg: string);
var
  DefMsg: TDefaultMessage;
begin
  DefMsg := MakeDefaultMsg(CM_SAY, 0, 0, 0, 0);
  SendSocket(EncodeMessage(DefMsg) + EncodeString(sMsg));
  if sMsg[1] = '/' then begin
    AddChatBoardString(sMsg, GetRGB(180), clWhite);
    GetValidStr3(Copy(sMsg, 2, Length(sMsg) - 1), m_sWhisperName, [' ']);
  end;
end;

procedure TfrmCMain.SendSelChr(sChrName: string);
var
  DefMsg: TDefaultMessage;
begin
  m_sCharName := sChrName;
  DefMsg := MakeDefaultMsg(CM_SELCHR, 0, 0, 0, 0);
  SendSocket(EncodeMessage(DefMsg) + EncodeString(m_sLoginAccount + '/' + sChrName));
end;

procedure TfrmCMain.SendDelChr(sChrName: string);
var
  DefMsg: TDefaultMessage;
begin
  DefMsg := MakeDefaultMsg(CM_DELCHR, 0, 0, 0, 0);
  SendSocket(EncodeMessage(DefMsg) + EncodeString(sChrName));
end;

procedure TfrmCMain.SendRunLogin;
var
  DefMsg: TDefaultMessage;
  sSendMsg: string;
begin
  sSendMsg := '**' +
    m_sLoginAccount + '/' +
    m_sCharName + '/' +
    IntToStr(m_nCertification) + '/' +
    IntToStr(VERSION_NUMBER) + '/';
  sSendMsg := sSendMsg + '0';
  SendSocket(EncodeString(sSendMsg));
end;

procedure TfrmCMain.ClearBag;
begin

end;

procedure TfrmCMain.ClearChatBoard;
begin

end;

procedure TfrmCMain.ChangeServerClearGameVariables;
begin

end;



procedure TfrmCMain.AddChatBoardString(sMsg: string; nFColor,
  nBColor: Integer);
var
  I: Integer;
  nLen: Integer;
  nAline: Integer;
  sDLine: string;
  sTemp: string;
const
  BOXWIDTH = 440; //41 聊天框文字宽度
  VIEWCHATLINE = 9;
begin
  nLen := Length(sMsg);
  sTemp := '';
  I := 1;
  while True do begin
    if I > nLen then break;
    if Byte(sMsg[I]) >= 128 then begin
      sTemp := sTemp + sMsg[I];
      Inc(I);
      if I <= nLen then sTemp := sTemp + sMsg[I]
      else break;
    end else sTemp := sTemp + sMsg[I];

    nAline := Canvas.TextWidth(sTemp);
    if nAline > BOXWIDTH then begin
      //m_CharMsgList.AddObject (sTemp, TObject(nFColor));
      ListBoxChat.Items.AddObject(sTemp, TObject(nFColor));
      m_CharBkColorList.Add(Pointer(nBColor));
      sMsg := Copy(sMsg, I + 1, nLen - I);
      sTemp := '';
      break;
    end;
    Inc(I);
  end;
  if sTemp <> '' then begin
    //m_CharMsgList.AddObject (sTemp, TObject(nFColor));
    ListBoxChat.Items.AddObject(sTemp, TObject(nFColor));
    m_CharBkColorList.Add(Pointer(nBColor));
    sMsg := '';
  end;
  if m_CharMsgList.Count > 200 then begin
    //m_CharMsgList.Delete (0);
    ListBoxChat.Items.Delete(0);
    m_CharBkColorList.Delete(0);
    if ListBoxChat.Items.Count - m_nChatBoardTop < VIEWCHATLINE then Dec(m_nChatBoardTop);
  end else if (ListBoxChat.Items.Count - m_nChatBoardTop) > VIEWCHATLINE then begin
    Inc(m_nChatBoardTop);
  end;

  if sMsg <> '' then
    AddChatBoardString(' ' + sMsg, nFColor, nBColor);
  if m_boChatAutoScroll then
    ListBoxChat.TopIndex := ListBoxChat.Items.Count - 1;
  //      begin
  //  m_CharMsgList.AddObject(sMsg,TObject(nFColor));
  //  m_CharBkColorList.Add(Pointer(nBColor));
  //  if MemoChat.Lines.Count > 20 then MemoChat.Lines.Delete(0);
  //
  //  MemoChat.Lines.Add(sMsg)
end;

procedure TfrmCMain.AddGuildChat(sMsg: string);
begin

end;










function TfrmCMain.IsGroupMember(sName: string): BOOL;
begin

end;


procedure TfrmCMain.Run;
var
  I: Integer;
  Actor: TActor;
begin
  if g_CurrentScene = s_Play then begin
    if g_PlayScene.m_MySelf <> nil then begin
      if GetTickCount - m_dwRunOneTick >= 1000 then begin
        m_dwRunOneTick := GetTickCount();
        ListBoxActor.Items.BeginUpdate;
        for I := 0 to g_PlayScene.m_ActorList.Count - 1 do begin
          Actor := TActor(g_PlayScene.m_ActorList.Items[I]);
          if I >= ListBoxActor.Items.Count then begin
            ListBoxActor.Items.AddObject(Actor.m_sUserName, Actor);
          end else begin
            ListBoxActor.Items.Strings[I] := Actor.m_sUserName;
            ListBoxActor.Items.Objects[I] := Actor;
          end;
        end;
        if g_PlayScene.m_ActorList.Count < ListBoxActor.Items.Count then begin
          for I := ListBoxActor.Items.Count - 1 downto g_PlayScene.m_ActorList.Count - 1 do begin
            if ListBoxActor.ItemIndex = I then ListBoxActor.ItemIndex := I - 1;

            ListBoxActor.Items.Delete(I);
          end;
        end;
        ListBoxActor.Items.EndUpdate;
        LabelPlayGameHP.Caption := format('生命: %d/%d', [g_PlayScene.m_MySelf.m_Abil.HP, g_PlayScene.m_MySelf.m_Abil.MaxHP]);
        LabelPlayGameMP.Caption := format('魔法: %d/%d', [g_PlayScene.m_MySelf.m_Abil.MP, g_PlayScene.m_MySelf.m_Abil.MaxMP]);
        LabelPlayGameLevel.Caption := format('等级: %d', [g_PlayScene.m_MySelf.m_Abil.Level]);
        StatusBar.Panels[1].Text := format('地图:%s(%s) 座标:(%d:%d)', [g_sMapTitle,
          g_sMapName,
            g_PlayScene.m_MySelf.m_nCurrX,
            g_PlayScene.m_MySelf.m_nCurrY]);
      end;
    end;
  end;
end;




function TfrmCMain.AddItemBag(ClientItem: TClientItem): BOOL;
var
  I: Integer;
begin
  Result := False;
  for I := Low(g_ItemArr) to High(g_ItemArr) do begin
    if (g_ItemArr[I].MakeIndex = ClientItem.MakeIndex) and (g_ItemArr[I].S.Name = ClientItem.S.Name) then begin
      Exit;
    end;
  end;

  if ClientItem.S.Name = '' then Exit;
  if ClientItem.S.StdMode <= 3 then begin
    for I := 0 to 5 do
      if g_ItemArr[I].S.Name = '' then begin
        g_ItemArr[I] := ClientItem;
        Result := True;
        Exit;
      end;
  end;
  for I := 6 to MAXBAGITEMCL - 1 do begin
    if g_ItemArr[I].S.Name = '' then begin
      g_ItemArr[I] := ClientItem;
      Result := True;
      break;
    end;
  end;
  ArrangeItembag;
end;

procedure TfrmCMain.ArrangeItembag;
begin

end;

procedure TfrmCMain.MakeNewChar(nIndex: Integer);
begin
  FillChar(g_ChrArr[nIndex].UserChr, sizeof(TUserCharacterInfo), #0);
  PanelCreateNewChr.Left := (PanelSelectChr.Width - PanelCreateNewChr.Width) div 2;
  //PanelCreateNewChr.Top:= (PanelSelectChr.Height - PanelCreateNewChr.Height) div 2;
  PanelCreateNewChr.top := 20;
  SetTopOrder(PanelCreateNewChr);
  EditCreateNewChrName.Text := '';
  EditCreateNewChrSex.Text := '男';
  EditCreateNewChrSex.Tag := 0;
  EditCreateNewChrJob.Text := '武士';
  EditCreateNewChrJob.Tag := 0;

  PanelCreateNewChr.Visible := True;
end;

procedure TfrmCMain.SelectChrCreateNewChr;
var
  sChrName: string;
  sHair: string;
  sJob: string;
  sSex: string;
begin
  sChrName := Trim(EditCreateNewChrName.Text);
  if sChrName = '' then Exit;
  sHair := IntToStr(1 + Random(5));
  sJob := IntToStr(EditCreateNewChrJob.Tag);
  sSex := IntToStr(EditCreateNewChrSex.Tag);
  SendNewChr(m_sLoginAccount, sChrName, sHair, sJob, sSex);
  PanelCreateNewChr.Visible := False;
end;



{ TPlayScene }

procedure TPlayScene.ActorDied(Actor: TObject);
var
  I: Integer;
  boFlag: Boolean;
begin
  for I := 0 to m_ActorList.Count - 1 do
    if m_ActorList[I] = Actor then begin
      m_ActorList.Delete(I);
      break;
    end;
  boFlag := False;
  for I := 0 to m_ActorList.Count - 1 do
    if not TActor(m_ActorList[I]).m_boDeath then begin
      m_ActorList.Insert(I, Actor);
      boFlag := True;
      break;
    end;
  if not boFlag then m_ActorList.Add(Actor);
end;

procedure TPlayScene.ClearActors;
var
  I: Integer;
begin
  for I := 0 to m_ActorList.Count - 1 do
    TActor(m_ActorList[I]).Free;
  m_ActorList.Clear;

end;

procedure TPlayScene.ClearObjects;
var
  I: Integer;
begin
  for I := m_ActorList.Count - 1 downto 0 do begin
    if TActor(m_ActorList[I]) <> m_MySelf then begin
      TActor(m_ActorList[I]).Free;
      m_ActorList.Delete(I);
    end;
  end;
  m_MsgList.Clear;
  m_TargetCret := nil;
  m_FocusCret := nil;
  m_MagicTarget := nil;
end;

constructor TPlayScene.Create;
begin
  m_MySelf := nil;
  m_MsgList := TList.Create;
  m_ActorList := TList.Create;
  m_FreeActorList := TList.Create;
  m_ChangeFaceReadyList := TList.Create;
end;

procedure TPlayScene.DelActor(Actor: TObject);
var
  I: Integer;
begin
  for I := 0 to m_ActorList.Count - 1 do begin
    if m_ActorList[I] = Actor then begin
      TActor(m_ActorList[I]).m_dwDeleteTime := GetTickCount;
      m_FreeActorList.Add(m_ActorList[I]);
      m_ActorList.Delete(I);
      break;
    end;
  end;
end;

function TPlayScene.DeleteActor(nChrID: Integer): TActor;
var
  I: Integer;
begin
  for I := 0 to m_ActorList.Count - 1 do begin
    if TActor(m_ActorList[I]).m_nRecogId = nChrID then begin
      TActor(m_ActorList[I]).m_dwDeleteTime := GetTickCount;
      m_FreeActorList.Add(m_ActorList[I]);
      m_ActorList.Delete(I);
      break;
    end;
  end;
end;

destructor TPlayScene.Destroy;
begin
  m_MsgList.Free;
  m_ActorList.Free;
  m_FreeActorList.Free;
  m_ChangeFaceReadyList.Free;
  inherited;
end;

function TPlayScene.FindActor(nChrID: Integer): TActor;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to m_ActorList.Count - 1 do begin
    if TActor(m_ActorList[I]).m_nRecogId = nChrID then begin
      Result := TActor(m_ActorList[I]);
      break;
    end;
  end;
end;

function TPlayScene.FindActor(sName: string): TActor;
var
  I: Integer;
  Actor: TActor;
begin
  Result := nil;
  for I := 0 to m_ActorList.Count - 1 do begin
    Actor := TActor(m_ActorList[I]);
    if CompareText(Actor.m_sUserName, sName) = 0 then begin
      Result := Actor;
      break;
    end;
  end;
end;

function TPlayScene.FindActorXY(nX, nY: Integer): TActor;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to m_ActorList.Count - 1 do begin
    if (TActor(m_ActorList[I]).m_nCurrX = nX) and (TActor(m_ActorList[I]).m_nCurrY = nY) then begin
      Result := TActor(m_ActorList[I]);
      if not Result.m_boDeath and Result.m_boVisible and Result.m_boHoldPlace then
        break;
    end;
  end;
end;

function TPlayScene.IsChangingFace(nRecogID: Integer): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to m_ChangeFaceReadyList.Count - 1 do begin
    if Integer(m_ChangeFaceReadyList[I]) = nRecogID then begin
      Result := True;
      break;
    end;
  end;
end;

function TPlayScene.IsValidActor(Actor: TActor): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to m_ActorList.Count - 1 do begin
    if TActor(m_ActorList[I]) = Actor then begin
      Result := True;
      break;
    end;
  end;
end;

function TPlayScene.NewActor(nChrID: Integer; wX, wY, wDir: Word; nFeature,
  nState: Integer): TActor;
var
  I: Integer;
  Actor: TActor;
  btRaceImg: Byte;
begin
  Result := nil; //jacky
  for I := 0 to m_ActorList.Count - 1 do begin
    if TActor(m_ActorList[I]).m_nRecogId = nChrID then begin
      Result := TActor(m_ActorList[I]);
      Exit;
    end;
  end;
  if IsChangingFace(nChrID) then Exit;
  btRaceImg := RACEfeature(nFeature);
  case btRaceImg of
    0: Actor := THumActor.Create;
    else Actor := TActor.Create;
  end;
  with Actor do begin
    m_nRecogId := nChrID;
    m_nCurrX := wX;
    m_nCurrY := wY;
    m_nRx := m_nCurrX;
    m_nRy := m_nCurrY;
    m_btDir := wDir;
    m_nFeature := nFeature;
    m_btRace := RACEfeature(nFeature); //changefeature啊 乐阑锭父
    m_btHair := HAIRfeature(nFeature); //函版等促.
    m_btDress := DRESSfeature(nFeature);
    m_btWeapon := WEAPONfeature(nFeature);
    m_wAppearance := APPRfeature(nFeature);
    if m_btRace = 0 then begin
      m_btSex := m_btDress mod 2; //0:巢磊 1:咯磊
    end else begin
      m_btSex := 0;
    end;
    m_nState := nState;
    m_SayingArr[0] := '';
  end;
  m_ActorList.Add(Actor);
  Result := Actor;
end;

procedure TPlayScene.SendMsg(nIdent, nChrID, nX, nY, nDir, nFeature,
  nState: Integer; sMsg: string);
var
  Actor: TActor;
begin
  case nIdent of
    SM_CHANGEMAP,
      SM_NEWMAP: begin
        if (nIdent = SM_NEWMAP) and (m_MySelf <> nil) then begin
          m_MySelf.m_nCurrX := nX;
          m_MySelf.m_nCurrY := nY;
          m_MySelf.m_nRx := nX;
          m_MySelf.m_nRy := nY;
          DelActor(m_MySelf);
        end;
      end;
    SM_LOGON: begin
        Actor := FindActor(nChrID);
        if Actor = nil then begin
          Actor := NewActor(nChrID, nX, nY, Lobyte(nDir), nFeature, nState);
          Actor.m_nChrLight := Hibyte(nDir);
          nDir := Lobyte(nDir);
          Actor.SendMsg(SM_TURN, nX, nY, nDir, nFeature, nState, '', 0);
        end;
        if m_MySelf <> nil then begin
          m_MySelf := nil;
        end;
        m_MySelf := THumActor(Actor);
      end;
    SM_HIDE: begin
        Actor := FindActor(nChrID);
        if Actor <> nil then begin
          if Actor.m_boDelActionAfterFinished then begin
            Exit;
          end;
          if Actor.m_nWaitForRecogId <> 0 then begin
            Exit;
          end;
        end;
        DeleteActor(nChrID);
      end;
    else begin
        Actor := FindActor(nChrID);
        if (nIdent = SM_TURN) or (nIdent = SM_RUN) or (nIdent = SM_HORSERUN) or (nIdent = SM_WALK) or
          (nIdent = SM_BACKSTEP) or
          (nIdent = SM_DEATH) or (nIdent = SM_SKELETON) or
          (nIdent = SM_DIGUP) or (nIdent = SM_ALIVE) then begin
          if Actor = nil then
            Actor := NewActor(nChrID, nX, nY, Lobyte(nDir), nFeature, nState);
          if Actor <> nil then begin
            Actor.m_nChrLight := Hibyte(nDir);
            nDir := Lobyte(nDir);
            if nIdent = SM_SKELETON then begin
              Actor.m_boDeath := True;
              Actor.m_boSkeleton := True;
            end;
          end;
        end;
        if Actor = nil then Exit;
        case nIdent of
          SM_FEATURECHANGED: begin
              Actor.m_nFeature := nFeature;
              Actor.m_nFeatureEx := nState;
              Actor.FeatureChanged;
            end;
          SM_CHARSTATUSCHANGED: begin
              Actor.m_nState := nFeature;
              Actor.m_nHitSpeed := nState;
            end;
          else begin
              if nIdent = SM_TURN then begin
                if sMsg <> '' then
                  Actor.m_sUserName := sMsg;
              end;
              Actor.SendMsg(nIdent, nX, nY, nDir, nFeature, nState, '', 0);
            end;
        end;

      end;
  end;
end;

procedure TPlayScene.SetActorDrawLevel(Actor: TObject; nLevel: Integer);
var
  I: Integer;
begin
  if nLevel = 0 then begin
    for I := 0 to m_ActorList.Count - 1 do
      if m_ActorList[I] = Actor then begin
        m_ActorList.Delete(I);
        m_ActorList.Insert(0, Actor);
        break;
      end;
  end;
end;







end.


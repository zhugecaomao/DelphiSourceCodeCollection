unit ObjectBase;

interface
uses
  Windows,Classes,Grobal2;
Const
  MAXSAY = 5;
type
  TActionInfo = packed record
    start   :Word;//0x14              // 矫累 橇贰烙
    frame   :Word;//0x16              // 橇贰烙 肮荐
    skip    :Word;//0x18
    ftime   :Word;//0x1A              // 橇贰烙 肮荐
    usetick :Word;//0x1C              // 荤侩平, 捞悼 悼累俊父 荤侩凳
  end;
  pTActionInfo = ^TActionInfo;
  THumanAction = packed record
    ActStand:      TActionInfo;   //1
    ActWalk:       TActionInfo;   //8
    ActRun:        TActionInfo;   //8
    ActRushLeft:   TActionInfo;
    ActRushRight:  TActionInfo;
    ActWarMode:    TActionInfo;   //1
    ActHit:        TActionInfo;   //6
    ActHeavyHit:   TActionInfo;   //6
    ActBigHit:     TActionInfo;   //6
    ActFireHitReady: TActionInfo; //6
    ActSpell:      TActionInfo;   //6
    ActSitdown:    TActionInfo;   //1
    ActStruck:     TActionInfo;   //3
    ActDie:        TActionInfo;   //4
  end;
  pTHumanAction = ^THumanAction;
  TMonsterAction = packed record
    ActStand:      TActionInfo;   //1
    ActWalk:       TActionInfo;   //8
    ActAttack:     TActionInfo;   //6 0x14 - 0x1C
    ActCritical:   TActionInfo;   //6 0x20 -
    ActStruck:     TActionInfo;   //3
    ActDie:        TActionInfo;   //4
    ActDeath:      TActionInfo;
  end;
  pTMonsterAction = ^TMonsterAction;
  TActor = class
    m_nRecogId       :Integer;
    m_nCurrX         :Integer;
    m_nCurrY         :Integer;
    m_btDir                   :Byte;       //当前站立方向 0x0C
    m_btSex                   :Byte;       //性别 0x0D
    m_btRace                  :Byte;       //0x0E
    m_btHair                  :Byte;       //头发类型 0x0F
    m_btDress                 :Byte;       //衣服类型 0x10
    m_btWeapon                :Byte;       //武器类型
    m_btHorse                 :Byte;       //马类型
    m_btEffect                :Byte;       //天使类型
    m_btJob                   :Byte;       //职业 0:武士  1:法师  2:道士
    m_wAppearance             :Word;       //0x14
    m_btDeathState            :Byte;
    m_nFeature                :Integer;    //0x18
    m_nFeatureEx              :Integer;
    m_nState                  :Integer;
    m_boDeath                 :Boolean;    //0x20
    m_boSkeleton              :Boolean;    //0x21
    m_boDelActor              :Boolean;    //0x22
    m_boDelActionAfterFinished :Boolean;   //0x23
    m_sDescUserName           :String;     //人物名称，后缀
    m_sUserName               :String;     //0x28
    m_nNameColor              :Integer;    //0x2C
    m_Abil                    :TAbility;   //0x30
    m_nGold                   :Integer;    //金币数量0x58
    m_nGameGold               :Integer;    //游戏币数量
    m_nGamePoint              :Integer;    //游戏点数量
    m_nHitSpeed               :ShortInt;   //攻击速度 0: 扁夯, (-)蠢覆 (+)狐抚
    m_boVisible               :Boolean;    //0x5D
    m_boHoldPlace             :Boolean;    //0x5E

    m_SayingArr               :array[0..MAXSAY-1] of String;
    m_SayWidthsArr            :array[0..MAXSAY-1] of Integer;
    m_dwSayTime               :LongWord;
    m_nSayX                   :Integer;
    m_nSayY                   :Integer;
    m_nSayLineCount           :Integer;

    m_nRx            :Integer;
    m_nRy            :Integer;
    m_nCurrentEvent  :Integer;
    m_nChrLight      :Integer;
    m_boDigFragment  :BOOL;
    m_nCurrentAction          :Integer;
    m_boGrouped               :Boolean;

    m_dwDeleteTime            :LongWord;

    m_dwWaitMagicRequest      :LongWord;
    m_nWaitForRecogId         :Integer;
    m_nWaitForFeature         :Integer;
    m_nWaitForStatus          :Integer;
    
    m_Action         :pTMonsterAction;
  protected
    m_nStartFrame             :Integer;
    m_nEndFrame               :Integer;
    m_nCurrentFrame           :Integer;
     m_nOldx                   :Integer;
     m_nOldy                   :Integer;
     m_nOldDir                 :Integer; //0x214 0x218 0x21C
     m_nActBeforeX             :Integer;
     m_nActBeforeY             :Integer;  //0x220 0x224
     m_nWpord                  :Integer;     
  public
    m_MsgList: TList;
    constructor Create; dynamic;
    destructor Destroy; override;
    procedure  SendMsg (wIdent:Word; nX,nY, ndir,nFeature,nState:Integer;sStr:String;nSound:Integer);
    procedure  UpdateMsg(wIdent:Word; nX,nY, ndir,nFeature,nState:Integer;sStr:String;nSound:Integer);
    procedure  Say(sMsg:String);
    procedure  FeatureChanged();
    function ActionFinished():BOOL;
    procedure  CleanCharMapSetting(nX,nY:Integer);
    procedure  CleanUserMsgs;
  end;
  THumActor = class (TActor)

  end;
  TNpcActor = class (TActor)

  end;
implementation

{ TActor }

function TActor.ActionFinished():BOOL;
begin
  Result:=True;
end;

procedure TActor.CleanCharMapSetting(nX, nY: Integer);
begin
  m_nCurrX := nX;
  m_nCurrY := nY;
  m_nRx := nX;
  m_nRy := nY;
  m_nOldx := nX;
  m_nOldy := nY;
  m_nCurrentAction := 0;
  m_nCurrentFrame := -1;
  CleanUserMsgs;
end;

procedure TActor.CleanUserMsgs;
var
  I:Integer;
  Msg:pTChrMsg;
begin
    I:= 0;
    while TRUE do begin
      if I >= m_MsgList.Count then break;
      Msg:=m_MsgList.Items[I];
      if (Msg.Ident >= 3000) and //努扼捞攫飘俊辑 焊辰 皋技瘤绰
         (Msg.Ident <= 3099) then begin
        Dispose(Msg);
        m_MsgList.Delete (I);
        Continue;
      end;
      Inc(I);
    end;
end;

constructor TActor.Create;
begin
  m_MsgList:=TList.Create;
end;

destructor TActor.Destroy;
begin
  m_MsgList.Free;
  inherited;
end;

procedure TActor.FeatureChanged;
begin

end;

procedure TActor.Say(sMsg: String);
begin

end;

procedure TActor.SendMsg(wIdent: Word; nX, nY, ndir, nFeature,
  nState: Integer; sStr: String; nSound: Integer);
begin

end;

procedure TActor.UpdateMsg(wIdent: Word; nX, nY, ndir, nFeature,
  nState: Integer; sStr: String; nSound: Integer);
begin

end;

end.

          {*************************************************}
          {***************      连连看1.0       ************}
          {***************    开发  孔祥吉      ************}
          {*************完成于 07.3.5 哈萨克斯坦************}
          {*********本软件为共享免费软件版权属于作者********}
          {***任何单位和个人不经作者同意禁止用于商业盈利****}
          {*******开发者引用本程序请保留开发者信息**********}
          {*************************************************}
unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DXPlay, DXInput, DXSounds, DXSprite, DXDraws, DIB,DXClass,DirectX,
  ExtCtrls, Menus, ToolWin, ComCtrls, MPlayer,Math,Regest;
type

  TMonoSprite = class;

  TSpriteImageID = Set of 1..100;

  TLanguageType = (ltChs,ltEng);

  TSpriteXY = record
    X,Y: integer;
    ID,ImageID: integer;
    XID,YID: integer;
    dead,throut,show: boolean;
    MonoSprite: TMonoSprite;
  end;

  TRandomEvent = record
    ID: integer;
    Add: integer;
  end;

  TGameState = (gtWait,gtRuning,gtPaused,gtGameOver);

  TForm1 = class(TForm)
    DXDraw: TDXDraw;
    ImageList: TDXImageList;
    DXSpriteEngine: TDXSpriteEngine;
    DXWaveList1: TDXWaveList;
    DXInput: TDXInput;
    DXPlay1: TDXPlay;
    DXSound1: TDXSound;
    DXTimer1: TDXTimer;
    DXImageList1: TDXImageList;
    SaveDialog1: TSaveDialog;
    MainMenu1: TMainMenu;
    game1: TMenuItem;
    NewGame1: TMenuItem;
    GameOver1: TMenuItem;
    Exit1: TMenuItem;
    about1: TMenuItem;
    about: TMenuItem;
    other1: TMenuItem;
    hint1: TMenuItem;
    wash1: TMenuItem;
    aa1: TMenuItem;
    Auto1: TMenuItem;
    Level1: TMenuItem;
    Normal1: TMenuItem;
    Easy1: TMenuItem;
    Hard1: TMenuItem;
    Level2: TMenuItem;
    Music1: TMenuItem;
    Sound1: TMenuItem;
    BackgroundMusic1: TMenuItem;
    Language1: TMenuItem;
    Chinese1: TMenuItem;
    English1: TMenuItem;
    N2: TMenuItem;
    MediaPlayer1: TMediaPlayer;
    ModesMenu: TMenuItem;
    BackImage: TDXImageList;
    EndGame1: TMenuItem;
    Regest1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure DXTimer1Timer(Sender: TObject; LagCount: Integer);
    procedure DXDrawMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Exit1Click(Sender: TObject);
    procedure NewGame1Click(Sender: TObject);
    procedure aboutClick(Sender: TObject);
    procedure GameOver1Click(Sender: TObject);
    procedure wash1Click(Sender: TObject);
    procedure aa1Click(Sender: TObject);
    procedure hint1Click(Sender: TObject);
    procedure Auto1Click(Sender: TObject);
    procedure Easy1Click(Sender: TObject);
    procedure Normal1Click(Sender: TObject);
    procedure Hard1Click(Sender: TObject);
    procedure Level2Click(Sender: TObject);
    procedure Music1Click(Sender: TObject);
    procedure BackgroundMusic1Click(Sender: TObject);
    procedure Sound1Click(Sender: TObject);
    procedure MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
      var DoDefault: Boolean);
    procedure Chinese1Click(Sender: TObject);
    procedure English1Click(Sender: TObject);
    procedure Language1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure DXDrawInitialize(Sender: TObject);
    procedure EndGame1Click(Sender: TObject);
    procedure game1Click(Sender: TObject);
    procedure other1Click(Sender: TObject);
    procedure about1Click(Sender: TObject);
    procedure Regest1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FAngle: Integer;

    FShowRegTime: integer;
    FShowReg: boolean;

    FRanEventID: TRandomEvent;

    FocusedSprite,FocusedSprite1: array[0..1] of TSpriteXY;
    FSurface: TDirectDrawSurface;

    FScore,FBaseScore,FTotleScore,FOneSpriteScore,FIniScore,CurLostIndex: integer;

    Language: TLanguageType;

    FImageW,FImageH,FBackImageW,FBackImageH,w,h,Ax,Ay: integer;

    FX,FY: integer;
    FLevel,FStep,FTime,FOneTime,FLostTime,incTime,incTime1,incTime2,incTime3: integer;

    FGameState: TGameState;

    {FPaused: boolean;
    FGameOver: boolean;
    FPassAll: boolean;
    Fstart: boolean; }

    SelfDo: boolean;
    IS800x600: boolean;

    Washing,FCLose,FStop: boolean;
    FBackMusic,FMusic: boolean;

    FHint,FWash: integer;

    FProgressW,FProgressH,FProgressT: integer;
    FProgressC: TColor;

    FSprites: array of array of TSpriteXY;

    FRoadPoint,FFirstRoadPoint: array[0..1] of TSpriteXY;

    NumStrs: array[1..10] of string;
    FStrs: array[1..100] of string;
    FRanEventName: array[1..5] of string;

    FSpritesCount,ImageCount,OneImageCount: integer;

    FSpritesCount2,OneImageCount2,ImageCount2: integer;

    procedure ChangeLanguge(AType: TLanguageType);

    procedure AssignPoint(SourPoint: TSpriteXY; var DesPoint: TSpriteXY);

    procedure Initialize(isStep: boolean = false);
    procedure FocusedSprites(AX,AY: integer);
    procedure UnFocusedSprite;

    procedure DeadSprite;
    procedure InitializeSprite;
    procedure Randomsprite;
    procedure RandomEvent;

    procedure WashSprite;
    procedure MoveSprite(AStep: integer);

    procedure InitializeID;
    procedure DrawLine(X1,Y1,X2,Y2: integer;ACanvas: TCanvas;PenColor: TColor);
    procedure getXY(Count: integer;var x: integer;var y: integer);

    procedure getRaodPoint(StPoint,EndPoint: TSpriteXY;var RoadPoint1,RoadPoint2: TSpriteXY);
    procedure getFirstRaodPoint(var RoadPoint1,RoadPoint2: TSpriteXY;ISF4: boolean = false);

    procedure NewGame(ALeavel: integer = 2);
    procedure PauseGame;
    procedure GameOver;
    procedure DoPassStep;
    procedure EndGame;

    procedure PlayBackMusic(Play: boolean=true);
  public
    constructor Create(AOwner: TComponent);override;
    procedure ModeItemClick(Sender: TObject);
    { Public declarations }
  end;

  TMonoSprite = class(TImageSprite)
  private
    FCounter: Double;
    FS: Integer;
    Focused,OldFocused: boolean;
    procedure Hit;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
  protected
    //FDefaultGammaRamp: TDDGammaRamp;
    procedure Click;dynamic;
  public
    ID: integer;
    ImageID: integer;
    XID,YID: integer;
    ISDead: boolean;
    //FS: Integer;
    procedure DoMove(MoveCount: Integer); override;
    procedure DoDead;
  end;

  TMyBackGroubd = class(TBackgroundSprite)
  protected
    procedure DoCollision(Sprite: TSprite; var Done: Boolean); override;
    procedure DoMove(MoveCount: Integer); override;
    //procedure DoClick;override;
  end;

var
  Form1: TForm1;
  FRegInfo: TRegInfo;
  FDecKey: TMemoEncKey ;
  FParentFile: TFileStream;
  ChsNum: array[1..10] of string = ('第一关','第二关','第三关','第四关',
                                  '第五关','第六关','第七关','第八关','第九关','第十关');
  ChsStr: array[1..48] of string = (  '无变化',
                                      '左移',
                                      '右移',
                                      '左右分离',
                                      '左右集中',
                                      '上移',
                                      '下移',
                                      '上下分离',
                                      '上下集中',
                                      '时间剩余 : ',
                                      '提示(F4)剩余 :',
                                      '重洗(F5)剩余 : ',
                                      ' 次',
                                      '共 ',
                                      ' 种图片',
                                      '每种 ',
                                      '剩余 ',
                                      ' 对',
                                      '游戏',
                                      '新游戏',
                                      '暂停',
                                      '退出',
                                      '设置',
                                      '等级',
                                      '容易',
                                      '一般',
                                      '困难',
                                      '声音',
                                      '音效',
                                      '背景音乐',
                                      '其他',
                                      '提示',
                                      '重洗',
                                      '语言',
                                      '中文',
                                      '英文',
                                      '自动',
                                      '帮助',
                                      '关于',
                                      '恭喜过关,继续下一难度',
                                      '恭喜通关,重新开始?',
                                      '见缝插针',
                                      '排名',
                                      '连连看 1.0',
                                      '结束游戏',
                                      '恢复',
                                      '未注册',
                                      '天'
                                      );

  RanEventName: array[1..5] of string =('提示增加',
                                        '重新洗牌增加',
                                        '分数增加',
                                        '时间增加',
                                        ''
                                        );

  EngNum: array[1..10] of string = ('First Step','Second Step','Third Step',
                                  'Fourth Step','Fifths Step','Sixth Step',
                                    'Seventh Step','Eighth Step','Ninth Step',
                                    'Tenth Step');
  EngStr: array[1..48] of string = (   'No Change',
                                      'Left',
                                      'Right',
                                      'Left And Right',
                                      'Left and Right To Center',
                                      'Up',
                                      'Down',
                                      'Up And Down',
                                      'Top and  Bottom To Center',
                                      'Remain Time : ',
                                      'Remain Hint(F4) : ',
                                      'Remain Shuffle(F5) : ',
                                      '',
                                      '',
                                      '  Type pictures',
                                      'Every Type  ',
                                      'Remain  ',
                                      '  Twain',
                                      'Game',
                                      'New Game',
                                      'Pause',
                                      'Exit',
                                      'Setting',
                                      'Level',
                                      'Easy',
                                      'Normal',
                                      'Hard',
                                      'Sound',
                                      'Music',
                                      'BackGround Music',
                                      'Other',
                                      'Hint',
                                      'Shuffle',
                                      'Language',
                                      'Chinese',
                                      'English',
                                      'Auto',
                                      'Help',
                                      'About',
                                      'Congratulation!Next Level?',
                                      'Congratulation! You Pass All Level,Again?',
                                      'Make use of every bit of time or space',
                                      'Sequence',
                                      'Look for Link 1.0',
                                      'End Game',
                                      'Resume',
                                      'Not Registered',
                                      'Days'
                                      );
  RanEventNameEn: array[1..5] of string =('Hint Add',
                                        'Shuffle Add',
                                        'Scores Add',
                                        'Time Add',
                                        ''
                                        );
  procedure CheckUseInfo(var ARegInfo: TRegInfo;ADecKey: TMemoEncKey);

implementation

uses about,Scores, Reg;

{$R *.dfm}
{$R MIDI.RES}

procedure CheckUseInfo(var ARegInfo: TRegInfo;ADecKey: TMemoEncKey);
var
  Reginfo: TRegInfo;
  DecKey: TMemoEncKey;
  function ISSameSn(Sn1,Sn2: FSn) :boolean;
  var
    i: integer;
  begin
    result := true;
    for i := low(Sn1) to high(Sn1) do
    begin
      if Sn1[i] <> Sn2[i] then
      begin
        result := false;
        break;
      end;
    end;
  end;
  procedure AssignSn(var Sn1: TRegInfo;Sn2: FSn);
  var
    i: integer;
  begin
    for i := low(Sn2) to high(Sn2) do
    begin
      Sn1.Sn[i] := Sn2[i];
    end;
  end;
  procedure getOldUserInfo;
  var
    File1,File2: TFileStream;
  begin
    if not(Fileexists(RegFileName)) then
    begin
      File1 := TFileStream.Create(RegFileName,fmCreate);
      WriteUserInfo(ARegInfo,ADecKey,TStream(File1));
      File1.Free;
    end;

    if FileExists(RegFileName) then
    try
      FileSetAttr(RegFileName,faSysFile or faHidden);
    except
    end;

    File1 := TFileStream.Create(RegFileName,fmOpenReadWrite);
    GetRegInfo(RegInfo,DecKey,File1);


    ARegInfo.RunData := Max(ARegInfo.RunData,RegInfo.RunData);
    ARegInfo.InstallDate := Min(ARegInfo.InstallDate,RegInfo.InstallDate);
    if round(Date - ARegInfo.InstallDate)+2 > ARegInfo.RunData then
    begin
      ARegInfo.RunData := round(Date - ARegInfo.InstallDate)+2;
    end
    else if round(Date - ARegInfo.InstallDate)+2 < ARegInfo.RunData then
    begin
      ARegInfo.RunData := FMaxRunData;

    end;
    if ARegInfo.RunData = 0 then
      ARegInfo.RunData := 1;

    //showmessage(inttostr(ARegInfo.RunData));
    WriteUserInfo(ARegInfo,ADecKey,TStream(File1),false);
    WriteUserInfo(ARegInfo,ADecKey,TStream(FParentFile),false);
    File1.Free;
  end;
begin
  try
    //if FParentFile = nil then
  except
    //showmessage(ParamStr(2));
    //Application.Terminate;
  end;

  getUserSn(Reginfo);
  if isSameSn(ARegInfo.Sn,Reginfo.Sn) and  ARegInfo.Reged then
    exit;

  if not(isSameSn(ARegInfo.Sn,Reginfo.Sn)) then
  begin
    //showmessage(ARegInfo.Sn[0]+'-'+ARegInfo.Sn[1]+'-'+ARegInfo.Sn[2]+'-'+ARegInfo.Sn[3]);
    AssignSn(ARegInfo,Reginfo.Sn);
    //showmessage(ARegInfo.Sn[0]+'-'+ARegInfo.Sn[1]+'-'+ARegInfo.Sn[2]+'-'+ARegInfo.Sn[3]);
    //ARegInfo.InstallDate := now;
    ARegInfo.Reged := false;
    //showmessage(Reginfo.Sn[0]+'-'+Reginfo.Sn[1]+'-'+Reginfo.Sn[2]+'-'+Reginfo.Sn[3]);
  end;
  getOldUserInfo;
end;
{ TMonoSprite }

procedure TMonoSprite.Click;
begin
  showmessage('');
end;

procedure TMonoSprite.DoDead;
begin
  //Collisioned := False;
  ISDead := true;
  Dead;

  //Image := Form1.ImageList.Items.Find('100');

end;

procedure TMonoSprite.DoMove(MoveCount: Integer);
var
  GammaRamp: TDDGammaRamp;
  i: Integer;
begin
  inherited DoMove(MoveCount);

  if not Collisioned then
  begin
    Inc(FS, MoveCount);
    if FS > 10000 then
      Dead;
  end;


end;

procedure TMonoSprite.Hit;
begin

end;

procedure TMonoSprite.WMLButtonUp(var Message: TWMLButtonUp);
begin
  if PtInRect(ClientRect, SmallPointToPoint(Message.Pos)) then Click;
end;

{ TMyBackGroubd }



procedure TMyBackGroubd.DoCollision(Sprite: TSprite; var Done: Boolean);
begin
  inherited;

end;

procedure TMyBackGroubd.DoMove(MoveCount: Integer);
begin
  inherited;
  //image.Draw(Form1.DXDraw.Surface,100,100,1);
end;

procedure TForm1.Initialize(isStep: boolean = false);
var
  i,j,n,m,k: integer;
  SpriteImageID1: TSpriteImageID;
begin
  //FPaused := false;
  //DXTimer1.Enabled := false;
  case FLevel of
   1 :
    begin
      if FStep > 10 then
      begin
        FStop := true;
        ShowScores(true,FScore);
        FStep := 1;
        DXWaveList1.Items.Find('tada').Play(false);
        if MessageDlg(FStrs[40],
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          {inc(FLevel);
          FSpritesCount := 192;
          ImageCount := 48;}
          NewGame(2);
        end
        else
        begin
          FGameState := gtWait;
          ShowScores(true,FScore);
        end;
       FStop := false;
      end
      else
      begin
        FSpritesCount := 160;
        FSpritesCount2 := 96;
        ImageCount := 24;
        ImageCount2 := 8;
      end;
      OneImageCount := FSpritesCount2 div ImageCount;
      OneImageCount2 := (FSpritesCount- FSpritesCount2) div ImageCount2;
    end;
   2 :
   begin
      if FStep > 10 then
      begin
        FStop := true;
        ShowScores(true,FScore);
        FStep := 1;
        DXWaveList1.Items.Find('tada').Play(false);
        if MessageDlg(FStrs[40],
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          {inc(FLevel);
          FSpritesCount := 240;
          ImageCount := 60; }
          NewGame(3);
        end
        else
        begin
          FGameState := gtWait;
          ShowScores(true,FScore);
        end;
        FStop := false;
      end
      else
      begin
        FSpritesCount := 192;
        FSpritesCount2 := 160;
        ImageCount := 40;
        ImageCount2 := 4;
      end;
      OneImageCount := FSpritesCount2 div ImageCount;
      OneImageCount2 := (FSpritesCount - FSpritesCount2) div ImageCount2;
    end;
   3 :
   begin
      //pass
      if FStep > 10 then
      begin
        FStop := true;
        ShowScores(true,FScore);
        FStep := 1;
        DXWaveList1.Items.Find('tada').Play(false);
        if MessageDlg(FStrs[41],
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          {FLevel := 1;
          FStep := 1;
          FSpritesCount := 160;
          ImageCount := 40;
          FScore := 0; }
          NewGame(1);
        end
        else
        begin
          FGameState := gtWait;
          //ShowScores(true,FScore);
        end;
          FStop := false;
      end
      else
      begin
        FSpritesCount := 240;
        FSpritesCount2 := 192;
        ImageCount := 48;
        ImageCount2 := 8;
      end;
      OneImageCount := FSpritesCount2 div ImageCount;
      OneImageCount2 := (FSpritesCount- FSpritesCount2) div ImageCount2;
    end;
  end;

  FTotleScore := FBaseScore*FLevel*FLevel +  FIniScore*FStep;
  FOneSpriteScore := round(FTotleScore / (FSpritesCount /2));
  FOneTime := round(FTime / (FSpritesCount /2));

  FTime := 420+60*FLevel;

  if FGameState = gtWait then exit;

  washing := false;

  getXY(FSpritesCount,Ax,Ay);

  setlength(FSprites,Ax);
  for i := low(FSprites) to high(FSprites) do
  begin
    setlength(FSprites[i],Ay);
  end;

  n := 1;
  k := 0;
  m := 0;

  w := (DXDraw.width - Ax*FImageW) div 2;
  if IS800x600 then
    h := (DXDraw.height - Ay*FImageH) div 2+FImageH
  else
    h := (DXDraw.height - Ay*FImageH) div 2;

  SpriteImageID1 := [];
  for i := low(FSprites) to high(FSprites)  do
  begin
    for j := low(FSprites[i]) to high(FSprites[i]) do
    begin
      with FSprites[i][j] do
      begin
        ImageID := n;
        ID := k;
        inc(k);
        inc(m);
        if k = FSpritesCount2 then
        begin
          OneImageCount := OneImageCount2;
          m := 0;
        end;
        if (m mod OneImageCount = 0) then
        begin
          Randomize;
          while n in SpriteImageID1 do
          begin
            n := randomrange(1,100);
          end;
          //inc(n);
          include(SpriteImageID1,n);
        end;
        if n > ImageList.Items.Count then
          n := 1;
        X := w + i*FImageW;
        Y := h + j * FImageH;
        XID := i;
        YID := j;
        Dead := false;
      end;
    end;
  end;



  for i := low(FocusedSprite) to high(FocusedSprite) do
  begin
    FocusedSprite[i].ID := - 1 ;
  end;

  InitializeSprite;
  Randomsprite;
  //DXTimer1.Enabled := true;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  CheckUseInfo(FRegInfo,FDecKey);
  if not(FRegInfo.Reged) and (FRegInfo.RunData >FMaxRunData) then
    fmReg.ShowModal;
  DXDraw.Width := Width;
  DXDraw.height := Height;

  {DXDraw.Display.Width := 1024;
  DXDraw.Display.Height := 768;
  DXDraw.Display.BitCount := 32;
  DXDraw.Options := DXDraw.Options + [doFullScreen];
  DXDraw.Initialize;}
end;

procedure TForm1.DXTimer1Timer(Sender: TObject; LagCount: Integer);
var
  i,i1,j1: integer;
  R: TRect;
  procedure DrawRegInfo;
  begin
    if FRegInfo.Reged then exit;
    with DXDraw.Surface.Canvas do
    begin
      Font.Color := clRed;
      Font.Size := 12;
      textout(DXDraw.Surface.Width - textwidth(FStrs[47])-5,20,FStrs[47]);
      textout(DXDraw.Surface.Width - textwidth(FStrs[17]+':'+formatfloat('00',FMaxRunData - FRegInfo.RunData)+
              FStrs[48])-5,40,
              FStrs[17]+':'+formatfloat('00',FMaxRunData - FRegInfo.RunData)+
              FStrs[48]);
      release;
    end;
  end;
begin
  if not(FRegInfo.Reged) and (FRegInfo.RunData >FMaxRunData)
    and (FGameState = gtRuning) then
  begin
    inc(FShowRegTime);
    if (FShowRegTime > (1000 div DXTimer1.Interval)*30) and FShowReg then
    begin
      FShowReg := false;
      fmReg.Close;
      fmReg.Hide;
      fmReg.ShowModal;
      FShowReg := true;
      FShowRegTime := 0;
    end;
  end;

  if FStop or Washing or FClose then
  begin
    DXDraw.Surface.Canvas.Release;
    DXDraw.Flip;
    exit;
  end;
  try
  DXInput.Update;

  try
    DXSpriteEngine.Dead;
    //DXSpriteEngine.
    DXSpriteEngine.Move(LagCount);
  except
  end;

  if (selfDo) and (FGameState = gtRuning) then   //auto
  begin
    inc(incTime3);
    if (incTime3 >= (200 div DXTimer1.Interval)) and not(Washing) then
    begin
      try
      getFirstRaodPoint(FFirstRoadPoint[0],FFirstRoadPoint[1],true);
      except
      end;
      incTime3 := 0;
    end;
  end;
  if Washing then exit;
  //controls
  if isButton5 in DXInput.States then
  begin
    for i := 0 to DXSpriteEngine.Engine.Count - 1 do
    begin
      DXSpriteEngine.Engine[i].Dead;
    end;
    Application.Terminate;
    exit;
  end;

  if isButton7 in DXInput.States then
  begin
  //DXImageList1.Items.Clear;
  if SaveDialog1.Execute then
  begin
    {for i := 1 to 100 do
    begin
      DXImageList1.Items.Add;
      DXImageList1.Items[i-1].Picture.LoadFromFile('E:\my program\link and look\face\QQ1\'+inttostr(i)+' 副本.bmp' );
    end;
    for i := 0 to DXImageList1.Items.Count - 1 do
    begin
      DXImageList1.Items[i].Name := inttostr(i+1);
    end; 
    Back47x37.Items.SaveToFile(SaveDialog1.FileName+'1.dxg');
    Back57x45.Items.SaveToFile(SaveDialog1.FileName+'.dxg'); }
    //DXWaveList1.Items.SaveToFile(SaveDialog1.FileName+'.dxw'); }
  end;
  end;

  if not DXDraw.CanDraw then exit;
  if FGameState = gtWait then
  begin
    DXDraw.Surface.Fill(0);
    Inc(FAngle);
    with DXImageList1.Items.Find('logo') do
    DrawWaveX(DXDraw.Surface, (DXDraw.Surface.Width - width) div 2 - width div 2+20,
          (DXDraw.Surface.Height - Height) div 2 - Height div 2,
          width+width div 2,
          Height + Height div 2,
          0,4,200, FAngle*10);

    DrawRegInfo;

    DXDraw.Flip;
    exit;
  end;

  if FGameState = gtGameOver then
  begin

    if DXDraw.CanDraw then
    begin
      with DXImageList1.Items.Find('gameover') do
      Draw(DXDraw.Surface,
          (DXDraw.Surface.Width - width) div 2,
            (DXDraw.Surface.Height - Height) div 2,0) ;
    end;

    DrawRegInfo;

    DXDraw.Flip;
    inc(incTime1);
     if incTime1 >= (2000 div DXTimer1.Interval) then
     begin
      incTime1 := 0;
      FGameState := gtWait;
     end;
    exit;
  end;

  if FGameState = gtPaused then
  begin
    if DXDraw.CanDraw then
    for i1 := low(FSprites) to high(FSprites) do
    begin
      for j1 := low(FSprites[0]) to high(FSprites[0]) do
      begin
        if not(FSprites[i1][j1].dead) and (FSprites[i1][j1].MonoSprite<>nil) then
        begin
        if DXDraw.CanDraw then
        BackImage.Items[FStep-1].StretchDraw(DXDraw.Surface,Rect(FSprites[i1][j1].X,    //FSprites[i1][j1].Y,FSprites[i1][j1].X+FImageW+7,
                    FSprites[i1][j1].Y,FSprites[i1][j1].X+FBackImageW,
                    FSprites[i1][j1].Y+FBackImageH),0);
        end;
      end;
      with DXImageList1.Items.Find('back') do
      Draw(DXDraw.Surface,
          (DXDraw.Surface.Width - width) div 2,
            (DXDraw.Surface.Height - Height) div 2,0) ;
    end;

    DrawRegInfo;

    DXDraw.Flip;
    exit;
  end;

  inc(incTime);
  if incTime >= (1000 div DXTimer1.Interval) then
  begin
    inctime := 0;
    inc(FLostTime);
    if FLostTime = FTime then
      GameOver;
  end;

  if FGameState = gtWait then exit;


  {  Description  }
  DXDraw.Surface.Fill(0);
  
    //DXDraw.Surface.Canvas.Release;
    for i1 := low(FSprites) to high(FSprites) do
    begin
      for j1 := low(FSprites[0]) to high(FSprites[0]) do
      begin
        if not(FSprites[i1][j1].dead) and (FSprites[i1][j1].MonoSprite<>nil) then
        begin
        if DXDraw.CanDraw then
        BackImage.Items[FStep-1].StretchDraw(DXDraw.Surface,Rect(FSprites[i1][j1].X,    //FSprites[i1][j1].Y,FSprites[i1][j1].X+FImageW+7,
                    FSprites[i1][j1].Y,FSprites[i1][j1].X+FBackImageW,
                    FSprites[i1][j1].Y+FBackImageH),0);
        end;
      end
    end;

    //DXDraw.Surface.Canvas.Release;

    for i1 := low(FSprites) to high(FSprites) do
    begin
      for j1 := low(FSprites[0]) to high(FSprites[0]) do
      begin
        if not(FSprites[i1][j1].dead) and (FSprites[i1][j1].MonoSprite<>nil) then
        try
        if DXDraw.CanDraw then
        ImageList.Items[FSprites[i1][j1].ImageID].StretchDraw(DXDraw.Surface,Rect(FSprites[i1][j1].X,    //FSprites[i1][j1].Y,FSprites[i1][j1].X+FImageW+7,
                    FSprites[i1][j1].Y,FSprites[i1][j1].X+FImageW,
                    FSprites[i1][j1].Y+FImageH),0);
        //FSprites[i1][j1].MonoSprite.DoDraw;
        except
        end;
      end
    end;

  //DXSpriteEngine.Draw;
  //DXDraw.Surface.Canvas.Lock;
  if DXDraw.CanDraw then
  with DXDraw.Surface.Canvas do
  begin
    //DXDraw.Surface.Canvas.Release;
    if (FTime <> 0) and (FGameState = gtRuning) then
    begin

      //out information
      Brush.Color := clwhite;
      try
      except
      end;
      FillRect(Rect((Screen.width -FProgressW) div 2-1,FProgressT-1,
              (Screen.width -FProgressW) div 2 + FProgressW+1,
              FProgressT + FProgressH+1));

      Brush.Style := bsSolid;
      Brush.Color := FProgressC;
      FillRect(Rect((Screen.width -FProgressW) div 2,FProgressT,
              (Screen.width -FProgressW) div 2 + round(FProgressW*((FTime - FLostTime) / FTime)),
              FProgressT + FProgressH));
      Brush.Color := clblack;
      try
      if Font <> nil then
      begin
      DXDraw.Surface.Canvas.Font.Color := clwhite;
      DXDraw.Surface.Canvas.Font.Size := 9;
      end;
      except
      end;
      textout(10,10,FStrs[10]+inttostr(FTime - FLostTime)) ; //+'：'+inttostr(100-inctime)
      textout(10,25,FStrs[11]+inttostr(FHint)+FStrs[13]);
      textout(10,40,FStrs[12]+inttostr(FWash)+FStrs[13]);
      textout(10,55,NumStrs[FStep]);
      //textout(10,70,FStrs[14]+inttostr(ImageCount)+FStrs[15]);
      //textout(10,85,FStrs[16]+inttostr(OneImageCount div 2)+FStrs[18]);
      //if DXSpriteEngine.Engine.Count > 0 then
        //textout(10,105,FStrs[17]+inttostr(DXSpriteEngine.Engine.Count div 2)+FStrs[18]);

      DrawRegInfo;

      try
      if Font <> nil then
      begin
      Font.Color := clyellow;
      Font.Size := 12;
      end;
      except
      end;
      if FStep < 10 then
        textout((Screen.width -textwidth(FStrs[FStep])) div 2,FProgressT
          + FProgressH + 10,FStrs[FStep])
      else
        textout((Screen.width -textwidth(FStrs[42])) div 2,FProgressT
          + FProgressH + 10,FStrs[42]);
      try
      Font.Color := clRed;
      Font.Size := 12;
      except
      end;
      textout((Screen.width -FProgressW) div 2 + FProgressW + 20,FProgressT,
              'Scores : '+inttostr(FScore));

      //out Random Envent
      if (FRanEventID.ID > 0) and (FRanEventID.ID < high(RanEventName)) then
      begin
        textout((Screen.width -textwidth(FRanEventName[FRanEventID.ID])) div 2,FProgressT
          + FProgressH + 10+textheight('A')+10,FRanEventName[FRanEventID.ID]+' '+inttostr(FRanEventID.Add));
        inc(incTime1);
         if incTime1 >= (3000 div DXTimer1.Interval) then
         begin
          incTime1 := 0;
          FRanEventID.ID := -1;
         end;
      end;
    end;
  end;

  //draw focuse
  for i := low(FocusedSprite) to high(FocusedSprite) do
  begin
    if FocusedSprite[i].ID = - 1 then continue;
    if DXDraw.CanDraw then
    with DXDraw.Surface.Canvas do
    begin
      Brush.Style := bsClear;

      try
      Pen.Color := clred;
      Pen.Width := 3;
      except
      end;
      R := Rect(FocusedSprite[i].X+3,FocusedSprite[i].Y+3,
                                FocusedSprite[i].X+FImageW-2,FocusedSprite[i].Y+FImageH-2);
      try
      Pen.Color := clblack;
      except
      end;
      PolyLine([Point(R.Left, R.Bottom), Point(R.Left, R.Top),
        Point(R.Right, R.Top)]);
      Pen.Color := clwhite;
      PolyLine([Point(R.Right, R.Top), Point(R.Right, R.Bottom),
        Point(R.Left, R.Bottom)]);
    end;
  end;
  //draw hint
  for i := low(FFirstRoadPoint) to high(FFirstRoadPoint) do
  begin
    if not(FFirstRoadPoint[i].show) then break;
    if DXDraw.CanDraw then
    with DXDraw.Surface.Canvas do
    begin
      inc(incTime2);
      Brush.Style := bsClear;
      try
      Pen.Color := clred;
      Pen.Width := 3;
      except
      end;
      R := Rect(FFirstRoadPoint[i].X+3,FFirstRoadPoint[i].Y+3,
                                FFirstRoadPoint[i].X+FImageW-2,FFirstRoadPoint[i].Y+FImageH-2);
      try
      Pen.Color := clwhite;
      except
      end;
      PolyLine([Point(R.Left, R.Bottom), Point(R.Left, R.Top),
        Point(R.Right, R.Top)]);
      try
      Pen.Color := clblack;
      except
      end;
      PolyLine([Point(R.Right, R.Top), Point(R.Right, R.Bottom),
        Point(R.Left, R.Bottom)]);
      //Release;
    end;
    if incTime2 >= (1200 div DXTimer1.Interval) then
    begin
      FFirstRoadPoint[0].show := false;
      FFirstRoadPoint[1].show := false;
      incTime2 := 0;
    end;
  end;

  if (FGameState = gtRuning) and (DXSpriteEngine.Engine.Count = 0)  then
  begin
    if DXDraw.CanDraw then
    with DXDraw.Surface.Canvas do
    begin
    try
      Font.Size := 30;
      Font.Color := clred;
    except
    end;
      if FStep < 10 then
        TextOut((Screen.width - TextWidth(NumStrs[FStep+1])) div 2,
          (DXDraw.Height - TextHeight('第')) div 2,NumStrs[FStep+1]);
    end;

    inc(incTime1);
    if incTime1 >= (500 div DXTimer1.Interval) then
    begin
      incTime1 := 0;
      DoPassStep;
      CurLostIndex := 0;
    end;
  end;
  DXDraw.Surface.Canvas.Release;
  try
    DXDraw.Flip;
  except
  end

  finally
    //Application.HandleMessage;
  end;
end;

procedure TForm1.DXDrawMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FX := X;
  FY := Y;

  if Button = mbLeft then
    FocusedSprites(X,Y)
  else if Button = mbRight then
    UnFocusedSprite;
  //Form1.DXInput.Mouse.Update;
  //DXInput.Update;
end;

procedure TForm1.FocusedSprites(AX, AY: integer);
var
  ID,i,j: integer;
begin
    //FocusedSprite[1].ID := ID;
  if FGameState <> gtRuning then
    exit;
  //InitializeID;

  for i := low(FSprites) to high(FSprites) do
  begin
    for j := low(FSprites[0]) to high(FSprites[0]) do
    begin
      if FSprites[i][j].Dead then continue;
      with FSprites[i][j].MonoSprite do
      begin
        if (Form1.FX >= X) and (Form1.FX <= X+FImageW)
        and (Form1.FY >= Y) and (Form1.FY <= Y+FImageH) then
        begin
          if (FocusedSprite[1].XID = i) and (FocusedSprite[1].YID = j) then
          begin
            if FocusedSprite[1].ID <> -1 then
              FocusedSprite[1].ID := -1
            else
            begin
              FocusedSprite[1].ID := 1;
              FocusedSprite[1].ImageID := FSprites[i][j].MonoSprite.ImageID;
            end;
            {FocusedSprite[1].X := FocusedSprite[0].X;
            FocusedSprite[1].Y := FocusedSprite[0].Y;
            FocusedSprite[1].ID := FocusedSprite[0].ID;
            FocusedSprite[1].ImageID := FocusedSprite[1].ImageID;
            FocusedSprite[1].XID := FocusedSprite[0].XID;
            FocusedSprite[1].YID := FocusedSprite[0].YID;  }
            //if FocusedSprite[1].ID = -1 then
            Continue;
          end
          else if (FocusedSprite[0].XID = i) and (FocusedSprite[0].YID = j) then
          begin
            if FocusedSprite[0].ID <> -1 then
              FocusedSprite[0].ID := -1
            else
            begin
              FocusedSprite[0].ID := 1;
              FocusedSprite[0].ImageID := FSprites[i][j].MonoSprite.ImageID;
            end;
            {if FocusedSprite[1].ID <> -1 then
            begin
            FocusedSprite[0].X := FocusedSprite[1].X;
            FocusedSprite[0].Y := FocusedSprite[1].Y;
            FocusedSprite[0].ID := FocusedSprite[1].ID;
            FocusedSprite[0].ImageID := FocusedSprite[1].ImageID;
            FocusedSprite[0].XID := FocusedSprite[1].XID;
            FocusedSprite[0].YID := FocusedSprite[1].YID;
            end; }
            //if FocusedSprite[0].ID = -1 then
            Continue;
          end;

          //if FocusedSprite[0].ID = TMonoSprite(DXSpriteEngine.Engine[i]).ID then
          //begin
            //FocusedSprite[0].ID := -1;
            //Continue;
          //end;

          if FocusedSprite[1].ID <> -1 then
          begin
          FocusedSprite[0].X := FocusedSprite[1].X;
          FocusedSprite[0].Y := FocusedSprite[1].Y;
          FocusedSprite[0].ID := FocusedSprite[1].ID;
          FocusedSprite[0].ImageID := FocusedSprite[1].ImageID;
          FocusedSprite[0].XID := FocusedSprite[1].XID;
          FocusedSprite[0].YID := FocusedSprite[1].YID;
          end;

          FocusedSprite[1].X := round(X);
          FocusedSprite[1].Y := round(Y);
          FocusedSprite[1].ID := FSprites[i][j].MonoSprite.ID;
          FocusedSprite[1].ImageID := FSprites[i][j].MonoSprite.ImageID;
          FocusedSprite[1].XID := i;//FSprites[i][j].MonoSprite.XID;
          FocusedSprite[1].YID := j;//FSprites[i][j].MonoSprite.YID;
          if FMusic then
          DXWaveList1.Items.Find('Alert').Play(false);

          break;
        end;
      end;
    end;
  end;
  DeadSprite;
end;

procedure TForm1.DeadSprite;
  procedure Dead;
  begin
    //InitializeID;
    if (FRoadPoint[0].throut ) and (FRoadPoint[1].throut) then
    begin
      if FSprites[FocusedSprite1[0].XID][FocusedSprite1[0].YID].dead then exit;
      FSprites[FocusedSprite1[0].XID][FocusedSprite1[0].YID].dead := true;
      FSprites[FocusedSprite1[1].XID][FocusedSprite1[1].YID].dead := true;

      FSprites[FocusedSprite1[0].XID][FocusedSprite1[0].YID].MonoSprite.Dead;
      FSprites[FocusedSprite1[1].XID][FocusedSprite1[1].YID].MonoSprite.Dead;
      //DXSpriteEngine.Dead;
      FSprites[FocusedSprite1[0].XID][FocusedSprite1[0].YID].MonoSprite.ISDead := true;
      FSprites[FocusedSprite1[1].XID][FocusedSprite1[1].YID].MonoSprite.ISDead := true;
      FocusedSprite[0].ID := -1;
      FocusedSprite[1].ID := -1;
      FocusedSprite[1].ImageID := -1;
      FocusedSprite[0].ImageID := -1;

      FRoadPoint[0].throut := false;
      FRoadPoint[1].throut := false;
      FRoadPoint[0].ID := -1;
      FRoadPoint[1].ID := -1;

      inc(CurLostIndex);

      //Move Sprite
      if DXSpriteEngine.Engine.Count > 2 then
      MoveSprite(FStep);

      //get score
      if FLostTime = 0 then FLostTime := 1;
      FScore := FScore +  round(((CurLostIndex*FOneTime)/FLostTime)*FOneSpriteScore);

      if FMusic then
        DXWaveList1.Items.Find('recycle').Play(false);

      //random event
      Randomize;
      if RandomRange(1,50+(FLevel-1)*50) in[1..4] then
        RandomEvent;

      getFirstRaodPoint(FFirstRoadPoint[0],FFirstRoadPoint[1],false);
      //InitializeID;
      if DXDraw.CanDraw then
      DrawLine(FocusedSprite[0].X + FImageW div 2,FocusedSprite[0].Y+ FImageH div 2,
            FocusedSprite[1].X + FImageW div 2,FocusedSprite[1].Y+FImageH div 2,DXDraw.Surface.Canvas,CLGreen);
    end;
  end;
begin
  if (FocusedSprite[0].ID = - 1) or (FocusedSprite[1].ID = -1) then exit;
  if (FocusedSprite[0].XID = FocusedSprite[1].XID ) and
  (FocusedSprite[0].YID = FocusedSprite[1].YID ) then exit;

  AssignPoint(FocusedSprite[0],FocusedSprite1[0]);
  AssignPoint(FocusedSprite[1],FocusedSprite1[1]);

  if (FocusedSprite[0].ImageID = FocusedSprite[1].ImageID) and not(selfDo) then
  begin
    if (FocusedSprite[0].ID = - 1) or (FocusedSprite[1].ID = -1) then exit;
    getRaodPoint(FocusedSprite[0],FocusedSprite[1],FRoadPoint[0],FRoadPoint[1]);
    Dead;

  end;
  if selfDo then
    Dead;
end;

procedure TForm1.InitializeID;
var
  i1,j1: integer;
begin
  //DXSpriteEngine

  for i1 := low(FSprites) to high(FSprites) do
  begin
    for j1 := low(FSprites[0]) to high(FSprites[0]) do
    begin
      if not(FSprites[i1][j1].dead) then
      with FSprites[i1][j1].MonoSprite do
      begin
        //IsDead := FSprites[i1][j1].dead;
        //FSprites[i1][j1].ImageID := ImageID;
        XID := i1;
        YID := j1;
        //if ImageID > 60 then
        //begin
          //showmessage('');
        //end;
        ImageID := FSprites[i1][j1].ImageID;
        //FSprites[i1][j1].X := round(X);
        //FSprites[i1][j1].Y := round(Y);
      end;
    end;
  end;
end;

procedure TForm1.DrawLine(X1,Y1,X2,Y2: integer;ACanvas: TCanvas;PenColor: TColor);
var
  i,j: integer;
  temSpriteXY: TSpriteXY;
begin

  //Form1.DXInput.Joystick.Effects.Find('eff1').Start;
  //ACanvas.Pen.Width := 2;
  //FClose := true;
  try
  for j := 0 to 4 do
  begin
    try
    ACanvas.Pen.Color := PenColor;
    //Application.HandleMessage;
    ACanvas.Pen.Width := 3;
    ACanvas.Pen.Color := PenColor;
    except
    end;
    //ACanvas.MoveTo(FRoadPoint[0].X+FImageW div 2,FRoadPoint[0].Y+FImageH div 2);
    //ACanvas.LineTo(FRoadPoint[1].X+FImageW div 2,FRoadPoint[1].Y+FImageH div 2);
    ACanvas.Polyline([Point(FRoadPoint[0].X+FImageW div 2,FRoadPoint[0].Y+FImageH div 2)
                  ,Point(FRoadPoint[1].X+FImageW div 2,FRoadPoint[1].Y+FImageH div 2)]);

    if FRoadPoint[0].X = FRoadPoint[1].X then
    begin
      if not(selfDo) then
      Application.HandleMessage;
      begin
      //ACanvas.Pen.Width := 4;
      try
      ACanvas.Pen.Color := PenColor;
      except
      end;
      if FocusedSprite[0].Y > FocusedSprite[1].Y then
      begin
        AssignPoint(FocusedSprite[0],temSpriteXY);
        AssignPoint(FocusedSprite[1],FocusedSprite[0]);
        AssignPoint(temSpriteXY,FocusedSprite[1]);
      end;
      if FRoadPoint[0].Y > FRoadPoint[1].Y then
      begin
        AssignPoint(FRoadPoint[0],temSpriteXY);
        AssignPoint(FRoadPoint[1],FRoadPoint[0]);
        AssignPoint(temSpriteXY,FRoadPoint[1]);
      end;
      ACanvas.Polyline([Point(FRoadPoint[0].X+FImageW div 2,FRoadPoint[0].Y+FImageH div 2)
                  ,Point(FocusedSprite[0].X+FImageW div 2,FocusedSprite[0].Y+FImageH div 2)]);
      ACanvas.Polyline([Point(FRoadPoint[1].X+FImageW div 2,FRoadPoint[1].Y+FImageH div 2)
                  ,Point(FocusedSprite[1].X+FImageW div 2,FocusedSprite[1].Y+FImageH div 2)]);

      {
        if FRoadPoint[0].Y = Y1 - FImageH div 2 then
        begin
          ACanvas.MoveTo(FRoadPoint[0].X+FImageW div 2,FRoadPoint[0].Y+FImageH div 2);
          ACanvas.LineTo(X1,FRoadPoint[0].Y+FImageH div 2);
        end
        else if FRoadPoint[0].Y = Y2 - FImageH div 2 then
        begin
          ACanvas.MoveTo(FRoadPoint[0].X+FImageW div 2,FRoadPoint[0].Y+FImageH div 2);
          ACanvas.LineTo(X2,FRoadPoint[0].Y+FImageH div 2);
        end;

        if FRoadPoint[1].Y = Y1 - FImageH div 2 then
        begin
          ACanvas.MoveTo(FRoadPoint[1].X+FImageW div 2,FRoadPoint[1].Y+FImageH div 2);
          ACanvas.LineTo(X1,FRoadPoint[1].Y+FImageH div 2);
        end
        else if FRoadPoint[1].Y = Y2 - FImageH div 2 then
        begin
          ACanvas.MoveTo(FRoadPoint[1].X+FImageW div 2,FRoadPoint[1].Y+FImageH div 2);
          ACanvas.LineTo(X2,FRoadPoint[1].Y+FImageH div 2);
        end; }
      end
    end;
    if FRoadPoint[0].Y = FRoadPoint[1].Y then
    begin
      if not(selfDo) then
      Application.HandleMessage;
      //ACanvas.Pen.Width := 4;
      try
      ACanvas.Pen.Color := PenColor;
      except
      end;
      if FocusedSprite[0].X > FocusedSprite[1].X then
      begin
        AssignPoint(FocusedSprite[0],temSpriteXY);
        AssignPoint(FocusedSprite[1],FocusedSprite[0]);
        AssignPoint(temSpriteXY,FocusedSprite[1]);
      end;
      if FRoadPoint[0].X > FRoadPoint[1].X then
      begin
        AssignPoint(FRoadPoint[0],temSpriteXY);
        AssignPoint(FRoadPoint[1],FRoadPoint[0]);
        AssignPoint(temSpriteXY,FRoadPoint[1]);
      end;
      ACanvas.Polyline([Point(FRoadPoint[0].X+FImageW div 2,FRoadPoint[0].Y+FImageH div 2)
                  ,Point(FocusedSprite[0].X+FImageW div 2,FocusedSprite[0].Y+FImageH div 2)]);
      ACanvas.Polyline([Point(FRoadPoint[1].X+FImageW div 2,FRoadPoint[1].Y+FImageH div 2)
                  ,Point(FocusedSprite[1].X+FImageW div 2,FocusedSprite[1].Y+FImageH div 2)]);
      {if FRoadPoint[0].X = X1 - FImageW div 2 then
      begin
        ACanvas.MoveTo(FRoadPoint[0].X+FImageW div 2,FRoadPoint[0].Y+FImageH div 2);
        ACanvas.LineTo(FRoadPoint[0].X+FImageW div 2,Y1);
      end
      else if FRoadPoint[0].X = X2 - FImageW div 2 then
      begin
        ACanvas.MoveTo(FRoadPoint[0].X+FImageW div 2,FRoadPoint[0].Y+FImageH div 2);
        ACanvas.LineTo(FRoadPoint[0].X+FImageW div 2,Y2);
      end;

      if FRoadPoint[1].X = X1 - FImageW div 2 then
      begin
        ACanvas.MoveTo(FRoadPoint[1].X+FImageW div 2,FRoadPoint[1].Y+FImageH div 2);
        ACanvas.LineTo(FRoadPoint[1].X+FImageW div 2,Y1);
      end
      else if FRoadPoint[1].X = X2 - FImageW div 2 then
      begin
        ACanvas.MoveTo(FRoadPoint[1].X+FImageW div 2,FRoadPoint[1].Y+FImageH div 2);
        ACanvas.LineTo(FRoadPoint[1].X+FImageW div 2,Y2);
      end;  }
    end;
  end;

  //DXDraw.Surface.Canvas.Release;
  finally
  fClose := false;
  end;
end;

procedure TForm1.getXY(Count: integer; var x, y: integer);
var
  i,temY,temX,temNum,temNum1,temNum2,temNum3,temNum4: integer;
begin
  if Count = 1 then
  begin
  x := 1;
  y := 1;
  exit;
  end;
  y := 1;
  temNum2 := Count;
  for i := 1 to Count do
  begin
    temNum := i ;
    temNum4 := Count mod i;
    temNum1 := Count div i;
    if temNum4 = 0 then
    begin
      temNum3 := temNum1 - temNum;
      if (temNum3 >= 0) and (temNum3 <= temNum2) then
      begin
        temNum2 := temNum3;
        temY := temNum;
        temX := temNum1;
      end;
    end;
    if (temY > y) and (temY <> y) then
      y := temY;
  end;
  x := temX;
  y := temY;
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FShowRegTime := 0;
  FShowReg := true;

  FRanEventID.ID := -1;
  FGameState := gtWait;

  Language := ltchs;
  ChangeLanguge(Language);

  FBackMusic := true;
  FMusic := true;

  FLevel := 1;

  FImageW := 50;
  FImageH := 38;

  FProgressW := 300;
  FProgressH := 20;
  FProgressT := 10;
  FProgressC := CLRed;



  //DXWaveList1.Items.Find('backmusic').Play(false);
  //DXWaveList1.Items[1].Looped := true;
  PlayBackMusic(true);

  DXDraw.Top := 0;
end;

procedure TForm1.InitializeSprite;
var
  i,j: integer;
begin
  for i := 0 to DXSpriteEngine.Engine.Count - 1 do
  begin
    DXSpriteEngine.Engine[i].Dead;
  end;


  for i := low(FSprites) to high(FSprites)  do
  begin
    for j := low(FSprites[i]) to high(FSprites[i]) do
    begin
      FSprites[i][j].dead := false;
      FSprites[i][j].MonoSprite := TMonoSprite.Create(DXSpriteEngine.Engine);
        with FSprites[i][j].MonoSprite do
        begin
          Image := ImageList.Items.Find(inttostr(FSprites[i][j].ImageID));
          ImageID := FSprites[i][j].ImageID;
          ID := FSprites[i][j].ID;
          X := FSprites[i][j].X;
          Y := FSprites[i][j].Y;
          XID := i;//FSprites[i][j].XID;
          YID := j;//FSprites[i][j].YID;
          Z := 2;
          Width := FImageW;// div 2;
          Height := FImageH;// div 2
        end;
    end;
  end;
end;

procedure TForm1.Randomsprite;
var
  i,j: integer;
  m,n,m1,n1: integer;
  ImageID: integer;
  temSpriteXY1: TSpriteXY;
  procedure AssignPoint1(SourPoint: TSpriteXY;
    var DesPoint: TSpriteXY);
  begin
      DesPoint.ID := SourPoint.ID;
      DesPoint.ImageID := SourPoint.ImageID;
      //DesPoint.XID := SourPoint.XID;
      //DesPoint.YID:= SourPoint.YID;
      DesPoint.dead:= SourPoint.dead;
      DesPoint.show:= SourPoint.show;
      //DesPoint.throut:= SourPoint.throut;
      //if not(SourPoint.dead) then
      try
        DesPoint.MonoSprite := SourPoint.MonoSprite;
      except
      end;
  end;

  procedure AdjustSprite;
  var
    i1,j1: integer;
  begin
    for i1 := low(FSprites) to high(FSprites) do
    begin
      for j1 := low(FSprites[0]) to high(FSprites[0]) do
      begin
        begin
          if FSprites[i1][j1].dead then continue;
          with FSprites[i1][j1].MonoSprite do
          begin
            X := FSprites[i1][j1].X;
            Y := FSprites[i1][j1].Y;
            XID := i1;
            YID := j1;
            //FSprites[i1][j1].ID := ID;
          end;
        end;
      end;
    end;
  end;
begin
  randomize;
  //if Washing then exit;
  //Washing := true;
  try
  //DXSpriteEngine.Dead;
  for i := low(FSprites) to high(FSprites)*high(FSprites[low(FSprites)])*2  do
  begin
    randomize;
    n := random(high(FSprites)+1);
    m := random(high(FSprites[low(FSprites)])+1);
    while FSprites[n][m].dead do
    begin
      n := random(high(FSprites)+1);
      m := random(high(FSprites[low(FSprites)])+1);
    end;


    randomize;
    n1 := random(high(FSprites)+1);
    m1 := random(high(FSprites[low(FSprites)])+1);
    while FSprites[n][m].dead do
    begin
      n1 := random(high(FSprites)+1);
      m1 := random(high(FSprites[low(FSprites)])+1);
    end;

    if not(FSprites[n][m].dead) and not(FSprites[n1][m1].dead)  then
    begin
      AssignPoint1(FSprites[n][m],temSpriteXY1);
      AssignPoint1(FSprites[n1][m1],FSprites[n][m]);
      AssignPoint1(temSpriteXY1,FSprites[n1][m1]);
    end;
  end;
  AdjustSprite;
  finally
    //Washing := false;
  end;

end;

procedure TForm1.getRaodPoint(StPoint, EndPoint: TSpriteXY;
                  var RoadPoint1,RoadPoint2: TSpriteXY);
var
  i,j,i1,j1,AX,AY,minX,minY,minX1,minY1,tem,MaxX,MaxY,Addi,Addj: integer;
  temPoint,temPoint1: TSpriteXY;
  procedure IniPoint;
  begin
    RoadPoint1.ID := -1;
    RoadPoint2.ID := -1;
  end;

  function getPassX(FromX,ToX: integer;down: boolean=false): boolean;
  var
    i,j,i1,j1: integer;
  begin
    result := false;
    if down then
      for i := ToX downto FromX do  //low(FSprites)-1  //high(FSprites)+1
      begin
        Addi := 0; addj := 0;
        if i = stPoint.XID then
          Addi := 1
        else
          Addi := 0;
        if i = endPoint.XID then
          Addj := -1
        else
          Addj := 0;
           //else Addi := 0;

        for j := miny + Addi to MaxY + Addj do
        begin
          IniPoint;
          if (i <> -1) and (i <> high(FSprites)+1) then
          begin
            if not(FSprites[i][j].dead) then
              break;
            if (j = MaxY + Addj) then
            begin
              //get one road
              AssignPoint(FSprites[i][stPoint.YID],RoadPoint1);
              AssignPoint(FSprites[i][endPoint.YID],RoadPoint2);
            end;
          end
          else if i = -1 then
          begin
            //get one road
            AssignPoint(FSprites[i+1][stPoint.YID],RoadPoint1);
            AssignPoint(FSprites[i+1][endPoint.YID],RoadPoint2);
            RoadPoint1.XID := -1;
            RoadPoint2.XID := -1;
            RoadPoint1.X := FSprites[i+1][stPoint.YID].X - FImageH;
            RoadPoint2.X := FSprites[i+1][endPoint.YID].X - FImageH;
          end
          else if i = high(FSprites)+1 then
          begin
            //get one road
            AssignPoint(FSprites[i-1][stPoint.YID],RoadPoint1);
            AssignPoint(FSprites[i-1][endPoint.YID],RoadPoint2);
            RoadPoint1.XID := high(FSprites)+1;
            RoadPoint2.XID := high(FSprites)+1;
            RoadPoint1.X := FSprites[i-1][stPoint.YID].X + FImageH ;
            RoadPoint2.X := FSprites[i-1][endPoint.YID].X + FImageH;
          end;
          minX1 := min(RoadPoint1.XID,stPoint.XID);

          RoadPoint1.throut := false;
          RoadPoint2.throut := false;
          if (RoadPoint1.ID <> -1) and (RoadPoint2.ID <> -1) then
          begin
            //check road;
            if minX1+1 > Max(i,stPoint.XID)-1 then
              RoadPoint1.throut := true;

            for i1 := minX1+1 to Max(RoadPoint1.XID,stPoint.XID)-1 do
            begin
              if not(FSprites[i1][miny].Dead) then
              begin
                RoadPoint1.throut := false;
                break;
              end;
              if i1 = Max(RoadPoint1.XID,stPoint.XID)-1 then
                RoadPoint1.throut := true
            end;

            minX1 := min(RoadPoint2.XID,endPoint.XID);
            if minx1+1 > Max(RoadPoint2.XID,endPoint.XID)-1 then
              RoadPoint2.throut := true;
            for j1 := minx1+1 to Max(RoadPoint2.XID,endPoint.XID)-1 do
            begin
              if not(FSprites[j1][maxy].Dead) then
              begin
                RoadPoint2.throut := false;
                break;
              end;
              if j1 = Max(RoadPoint2.XID,endPoint.XID)-1 then //throut
                RoadPoint2.throut := true;
            end;
            if RoadPoint1.throut and RoadPoint2.throut then
            begin
              result := true;
              exit;
            end;
          end;
        end;
      end
    else
      for i := FromX to ToX do  //low(FSprites)-1  //high(FSprites)+1
      begin
        Addi := 0; addj := 0;
        if i = stPoint.XID then
          Addi := 1
        else
          Addi := 0;
        if i = endPoint.XID then
          Addj := -1
        else
          Addj := 0;
           //else Addi := 0;

        for j := miny + Addi to MaxY + Addj do
        begin
          IniPoint;
          if (i <> -1) and (i <> high(FSprites)+1) then
          begin
            if not(FSprites[i][j].dead) then
              break;
            if (j = MaxY + Addj) then
            begin
              //get one road
              AssignPoint(FSprites[i][stPoint.YID],RoadPoint1);
              AssignPoint(FSprites[i][endPoint.YID],RoadPoint2);
            end;
          end
          else if i = -1 then
          begin
            //get one road
            AssignPoint(FSprites[i+1][stPoint.YID],RoadPoint1);
            AssignPoint(FSprites[i+1][endPoint.YID],RoadPoint2);
            RoadPoint1.XID := -1;
            RoadPoint2.XID := -1;
            RoadPoint1.X := FSprites[i+1][stPoint.YID].X - FImageH;
            RoadPoint2.X := FSprites[i+1][endPoint.YID].X - FImageH;
          end
          else if i = high(FSprites)+1 then
          begin
            //get one road
            AssignPoint(FSprites[i-1][stPoint.YID],RoadPoint1);
            AssignPoint(FSprites[i-1][endPoint.YID],RoadPoint2);
            RoadPoint1.XID := high(FSprites)+1;
            RoadPoint2.XID := high(FSprites)+1;
            RoadPoint1.X := FSprites[i-1][stPoint.YID].X + FImageH ;
            RoadPoint2.X := FSprites[i-1][endPoint.YID].X + FImageH;
          end;
          minX1 := min(RoadPoint1.XID,stPoint.XID);

          RoadPoint1.throut := false;
          RoadPoint2.throut := false;
          if (RoadPoint1.ID <> -1) and (RoadPoint2.ID <> -1) then
          begin
            //check road;
            if minX1+1 > Max(i,stPoint.XID)-1 then
              RoadPoint1.throut := true;

            for i1 := minX1+1 to Max(RoadPoint1.XID,stPoint.XID)-1 do
            begin
              if not(FSprites[i1][miny].Dead) then
              begin
                RoadPoint1.throut := false;
                break;
              end;
              if i1 = Max(RoadPoint1.XID,stPoint.XID)-1 then
                RoadPoint1.throut := true
            end;

            minX1 := min(RoadPoint2.XID,endPoint.XID);
            if minx1+1 > Max(RoadPoint2.XID,endPoint.XID)-1 then
              RoadPoint2.throut := true;
            for j1 := minx1+1 to Max(RoadPoint2.XID,endPoint.XID)-1 do
            begin
              if not(FSprites[j1][maxy].Dead) then
              begin
                RoadPoint2.throut := false;
                break;
              end;
              if j1 = Max(RoadPoint2.XID,endPoint.XID)-1 then //throut
                RoadPoint2.throut := true;
            end;
            if RoadPoint1.throut and RoadPoint2.throut then
            begin
              result := true;
              exit;
            end;
          end;
        end;
      end;
  end;
  function getPassY(FormY,ToY: integer;down: boolean=false): boolean;
  var
    i,j,i1,j1: integer;  
  begin
    result := false;
    if down then
      for j := ToY  downto FormY do  //low(FSprites[0])-1   high(FSprites[0])+1
      begin
        Addi := 0; addj := 0;
        if j = stPoint.YID then
        begin
          if stPoint.XID > endPoint.XID then
          Addj := -1
        else
          Addi := 1;
        end;
        if j = endPoint.YID then
        begin
          if stPoint.XID > endPoint.XID then
            Addi := 1
          else
            Addj := -1;
        end;

        for i := minX + addi to maxX + addj do
        begin
          IniPoint;
          if (j <> low(FSprites[0])-1)  and (j<>high(FSprites[0])+1) then
          begin
            if not(FSprites[i][j].dead) then
              break;
            if (i = maxX +  addj) then  //get one road
            begin
              AssignPoint(FSprites[stPoint.XID][j],RoadPoint1);
              AssignPoint(FSprites[endPoint.XID][j],RoadPoint2);
            end;
          end
          else if (j = low(FSprites[0])-1)  then
          begin
            AssignPoint(FSprites[stPoint.XID][j+1],RoadPoint1);
            AssignPoint(FSprites[endPoint.XID][j+1],RoadPoint2);
            RoadPoint1.YID := -1;
            RoadPoint2.YID := -1;
            RoadPoint1.Y := FSprites[stPoint.XID][j+1].Y - FImageH ;
            RoadPoint2.Y := FSprites[endPoint.XID][j+1].Y - FImageH;
          end
          else if (j=high(FSprites[0])+1) then
          begin
            AssignPoint(FSprites[stPoint.XID][j-1],RoadPoint1);
            AssignPoint(FSprites[endPoint.XID][j-1],RoadPoint2);
            RoadPoint1.YID := high(FSprites[0])+1;
            RoadPoint2.YID := high(FSprites[0])+1;
            RoadPoint1.Y := FSprites[stPoint.XID][j-1].Y + FImageH ;
            RoadPoint2.Y := FSprites[endPoint.XID][j-1].Y + FImageH;
          end;

          //check raod
          RoadPoint1.throut := false;
          RoadPoint2.throut := false;
          if (RoadPoint1.ID <> -1) and (RoadPoint2.ID <> -1) then
          begin
            minY1 := min(RoadPoint1.YID,stPoint.YID);
            if  minY1+1 > max(RoadPoint1.YID,stPoint.YID)-1 then
              RoadPoint1.throut := true;
            for i1 := minY1+1 to max(RoadPoint1.YID,stPoint.YID)-1 do
            begin
              if not(FSprites[RoadPoint1.XID][i1].Dead) then
              begin
                RoadPoint1.throut := false;
                break;
              end;
              if i1 = max(RoadPoint1.YID,stPoint.YID) -1 then
                RoadPoint1.throut := true;
            end;

            minY1 := min(RoadPoint2.YID,endPoint.YID);

            if minY1+1 > max(RoadPoint2.YID,endPoint.YID)-1 then
              RoadPoint2.throut := true;
            for j1 := minY1+1  to max(RoadPoint2.YID,endPoint.YID)-1  do
            begin
              if not(FSprites[RoadPoint2.XID][j1].Dead) then
              begin
                RoadPoint2.throut := false;
                break;
              end;
              if j1 = max(RoadPoint2.YID,endPoint.YID)-1 then //throut
                RoadPoint2.throut := true;
            end;
            if RoadPoint1.throut and RoadPoint2.throut then
            begin
              result := true;
              exit;

            end;
          end;
        end;
      end
    else
      for j := FormY  to ToY do  //low(FSprites[0])-1   high(FSprites[0])+1
      begin
        Addi := 0; addj := 0;
        if j = stPoint.YID then
        begin
          if stPoint.XID > endPoint.XID then
          Addj := -1
        else
          Addi := 1;
        end;
        if j = endPoint.YID then
        begin
          if stPoint.XID > endPoint.XID then
            Addi := 1
          else
            Addj := -1;
        end;

        for i := minX + addi to maxX + addj do
        begin
          IniPoint;
          if (j <> low(FSprites[0])-1)  and (j<>high(FSprites[0])+1) then
          begin
            if not(FSprites[i][j].dead) then
              break;
            if (i = maxX +  addj) then  //get one road
            begin
              AssignPoint(FSprites[stPoint.XID][j],RoadPoint1);
              AssignPoint(FSprites[endPoint.XID][j],RoadPoint2);
            end;
          end
          else if (j = low(FSprites[0])-1)  then
          begin
            AssignPoint(FSprites[stPoint.XID][j+1],RoadPoint1);
            AssignPoint(FSprites[endPoint.XID][j+1],RoadPoint2);
            RoadPoint1.YID := -1;
            RoadPoint2.YID := -1;
            RoadPoint1.Y := FSprites[stPoint.XID][j+1].Y - FImageH ;
            RoadPoint2.Y := FSprites[endPoint.XID][j+1].Y - FImageH;
          end
          else if (j=high(FSprites[0])+1) then
          begin
            AssignPoint(FSprites[stPoint.XID][j-1],RoadPoint1);
            AssignPoint(FSprites[endPoint.XID][j-1],RoadPoint2);
            RoadPoint1.YID := high(FSprites[0])+1;
            RoadPoint2.YID := high(FSprites[0])+1;
            RoadPoint1.Y := FSprites[stPoint.XID][j-1].Y + FImageH ;
            RoadPoint2.Y := FSprites[endPoint.XID][j-1].Y + FImageH;
          end;

          //check raod
          RoadPoint1.throut := false;
          RoadPoint2.throut := false;
          if (RoadPoint1.ID <> -1) and (RoadPoint2.ID <> -1) then
          begin
            minY1 := min(RoadPoint1.YID,stPoint.YID);
            if  minY1+1 > max(RoadPoint1.YID,stPoint.YID)-1 then
              RoadPoint1.throut := true;
            for i1 := minY1+1 to max(RoadPoint1.YID,stPoint.YID)-1 do
            begin
              if not(FSprites[RoadPoint1.XID][i1].Dead) then
              begin
                RoadPoint1.throut := false;
                break;
              end;
              if i1 = max(RoadPoint1.YID,stPoint.YID) -1 then
                RoadPoint1.throut := true;
            end;

            minY1 := min(RoadPoint2.YID,endPoint.YID);

            if minY1+1 > max(RoadPoint2.YID,endPoint.YID)-1 then
              RoadPoint2.throut := true;
            for j1 := minY1+1  to max(RoadPoint2.YID,endPoint.YID)-1  do
            begin
              if not(FSprites[RoadPoint2.XID][j1].Dead) then
              begin
                RoadPoint2.throut := false;
                break;
              end;
              if j1 = max(RoadPoint2.YID,endPoint.YID)-1 then //throut
                RoadPoint2.throut := true;
            end;
            if RoadPoint1.throut and RoadPoint2.throut then
            begin
              result := true;
              exit;
            end;
          end;
        end;
      end;
  end;

begin
  InitializeID;

  AX := ABS(stPoint.XID - endPoint.XID);
  AY := ABS(stPoint.YID - endPoint.YID);

  if ((AX = 1) and (AY = 0)) or ((AY = 1) and (AX = 0)) then
  begin
    AssignPoint(StPoint,RoadPoint1);
    AssignPoint(EndPoint,RoadPoint2);
    RoadPoint1.throut := true;
    RoadPoint2.throut := true;
    exit;
  end;

  if stPoint.YID > endPoint.YID then
  begin
    tem := stPoint.YID;
    stPoint.YID := endPoint.YID;
    endPoint.YID := tem;

    tem := stPoint.XID;
    stPoint.XID := endPoint.XID;    
    endPoint.XID := tem;

  end;

  minX := min(stPoint.XID,endPoint.XID);
  minY := min(stPoint.YID,endPoint.YID);
  MaxX := max(stPoint.XID,endPoint.XID);
  maxY := max(stPoint.YID,endPoint.YID);

  IniPoint;
  if stPoint.X >= endPoint.X then
  begin
   if getPassX(low(FSprites)-1,endPoint.XID,true) then exit;
   if getPassX(endPoint.XID,stPoint.XID) then exit;
   if getPassX(stPoint.XID,high(FSprites)+1) then exit;
  end
  else
  begin
   if getPassX(low(FSprites)-1,stPoint.XID,true) then exit;
   if getPassX(stPoint.XID,endPoint.XID) then exit;
   if getPassX(endPoint.XID,high(FSprites)+1) then exit;
  end;


{  for i := low(FSprites)-1 to high(FSprites)+1 do
  begin
    Addi := 0; addj := 0;
    if i = stPoint.XID then
      Addi := 1
    else
      Addi := 0;
    if i = endPoint.XID then
      Addj := -1
    else
      Addj := 0;
       //else Addi := 0;

    for j := miny + Addi to MaxY + Addj do
    begin
      IniPoint;
      if (i <> -1) and (i <> high(FSprites)+1) then
      begin
        if not(FSprites[i][j].dead) then
          break;
        if (j = MaxY + Addj) then
        begin
          //get one road
          AssignPoint(FSprites[i][stPoint.YID],RoadPoint1);
          AssignPoint(FSprites[i][endPoint.YID],RoadPoint2);
        end;
      end
      else if i = -1 then
      begin
        //get one road
        AssignPoint(FSprites[i+1][stPoint.YID],RoadPoint1);
        AssignPoint(FSprites[i+1][endPoint.YID],RoadPoint2);
        RoadPoint1.XID := -1;
        RoadPoint2.XID := -1;
        RoadPoint1.X := FSprites[i+1][stPoint.YID].X - FImageH;
        RoadPoint2.X := FSprites[i+1][endPoint.YID].X - FImageH;
      end
      else if i = high(FSprites)+1 then
      begin
        //get one road
        AssignPoint(FSprites[i-1][stPoint.YID],RoadPoint1);
        AssignPoint(FSprites[i-1][endPoint.YID],RoadPoint2);
        RoadPoint1.XID := high(FSprites)+1;
        RoadPoint2.XID := high(FSprites)+1;
        RoadPoint1.X := FSprites[i-1][stPoint.YID].X + FImageH ;
        RoadPoint2.X := FSprites[i-1][endPoint.YID].X + FImageH;
      end;
      minX1 := min(RoadPoint1.XID,stPoint.XID);

      RoadPoint1.throut := false;
      RoadPoint2.throut := false;
      if (RoadPoint1.ID <> -1) and (RoadPoint2.ID <> -1) then
      begin
        //check road;
        if minX1+1 > Max(i,stPoint.XID)-1 then
          RoadPoint1.throut := true;

        for i1 := minX1+1 to Max(RoadPoint1.XID,stPoint.XID)-1 do
        begin
          if not(FSprites[i1][miny].Dead) then
          begin
            RoadPoint1.throut := false;
            break;
          end;
          if i1 = Max(RoadPoint1.XID,stPoint.XID)-1 then
            RoadPoint1.throut := true
        end;

        minX1 := min(RoadPoint2.XID,endPoint.XID);
        if minx1+1 > Max(RoadPoint2.XID,endPoint.XID)-1 then
          RoadPoint2.throut := true;
        for j1 := minx1+1 to Max(RoadPoint2.XID,endPoint.XID)-1 do
        begin
          if not(FSprites[j1][maxy].Dead) then
          begin
            RoadPoint2.throut := false;
            break;
          end;
          if j1 = Max(RoadPoint2.XID,endPoint.XID)-1 then //throut
            RoadPoint2.throut := true;
        end;
        if RoadPoint1.throut and RoadPoint2.throut then exit;
      end;
    end;
  end; }

  IniPoint;
  RoadPoint1.throut := false;
  RoadPoint2.throut := false;
  if stPoint.YID < endPoint.YID then
  begin
    if getPassY(low(FSprites[0])-1,stPoint.YID,true) then exit;
    if getPassY(stPoint.YID,endPoint.YID) then exit;
    if getPassY(endPoint.YID,high(FSprites[0])+1) then exit;
  end
  else
  begin
    if getPassY(low(FSprites[0])-1,endPoint.YID,true) then exit;
    if getPassY(endPoint.YID,stPoint.YID) then exit;
    if getPassY(stPoint.YID,high(FSprites[0])+1) then exit;
  end;

  {for j := low(FSprites[0])-1  to high(FSprites[0])+1 do
  begin
    Addi := 0; addj := 0;
    if j = stPoint.YID then
    begin
      if stPoint.XID > endPoint.XID then
      Addj := -1
    else
      Addi := 1;
    end;
    if j = endPoint.YID then
    begin
      if stPoint.XID > endPoint.XID then
        Addi := 1
      else
        Addj := -1;
    end;

    for i := minX + addi to maxX + addj do
    begin
      IniPoint;
      if (j <> low(FSprites[0])-1)  and (j<>high(FSprites[0])+1) then
      begin
        if not(FSprites[i][j].dead) then
          break;
        if (i = maxX +  addj) then  //get one road
        begin
          AssignPoint(FSprites[stPoint.XID][j],RoadPoint1);
          AssignPoint(FSprites[endPoint.XID][j],RoadPoint2);
        end;
      end
      else if (j = low(FSprites[0])-1)  then
      begin
        AssignPoint(FSprites[stPoint.XID][j+1],RoadPoint1);
        AssignPoint(FSprites[endPoint.XID][j+1],RoadPoint2);
        RoadPoint1.YID := -1;
        RoadPoint2.YID := -1;
        RoadPoint1.Y := FSprites[stPoint.XID][j+1].Y - FImageH ;
        RoadPoint2.Y := FSprites[endPoint.XID][j+1].Y - FImageH;
      end
      else if (j=high(FSprites[0])+1) then
      begin
        AssignPoint(FSprites[stPoint.XID][j-1],RoadPoint1);
        AssignPoint(FSprites[endPoint.XID][j-1],RoadPoint2);
        RoadPoint1.YID := high(FSprites[0])+1;
        RoadPoint2.YID := high(FSprites[0])+1;
        RoadPoint1.Y := FSprites[stPoint.XID][j-1].Y + FImageH ;
        RoadPoint2.Y := FSprites[endPoint.XID][j-1].Y + FImageH;
      end;

      //check raod
      RoadPoint1.throut := false;
      RoadPoint2.throut := false;
      if (RoadPoint1.ID <> -1) and (RoadPoint2.ID <> -1) then
      begin
        minY1 := min(RoadPoint1.YID,stPoint.YID);
        if  minY1+1 > max(RoadPoint1.YID,stPoint.YID)-1 then
          RoadPoint1.throut := true;
        for i1 := minY1+1 to max(RoadPoint1.YID,stPoint.YID)-1 do
        begin
          if not(FSprites[RoadPoint1.XID][i1].Dead) then
          begin
            RoadPoint1.throut := false;
            break;
          end;
          if i1 = max(RoadPoint1.YID,stPoint.YID) -1 then
            RoadPoint1.throut := true;
        end;

        minY1 := min(RoadPoint2.YID,endPoint.YID);

        if minY1+1 > max(RoadPoint2.YID,endPoint.YID)-1 then
          RoadPoint2.throut := true;
        for j1 := minY1+1  to max(RoadPoint2.YID,endPoint.YID)-1  do
        begin
          if not(FSprites[RoadPoint2.XID][j1].Dead) then
          begin
            RoadPoint2.throut := false;
            break;
          end;
          if j1 = max(RoadPoint2.YID,endPoint.YID)-1 then //throut
            RoadPoint2.throut := true;
        end;
        if RoadPoint1.throut and RoadPoint2.throut then exit;
      end;
    end;
  end;}
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.NewGame1Click(Sender: TObject);
begin
  NewGame(FLevel);
end;

procedure TForm1.aboutClick(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TForm1.NewGame(ALeavel: integer = 2);
var
  memoSt: TMemoryStream;
begin
  if FGameState = gtPaused then exit;
  if (Screen.Width >= 800) and (Screen.Width < 1024) then
  begin
    IS800x600 := true;
  end;
  memoSt := TMemoryStream.Create;
  if IS800x600 then
  begin
    FImageW := 37;
    FImageH := 28;
    FBackImageW := 42;
    FBackImageH := 33;

    {memoSt.Clear;
    Back47x37.Items.SaveToStream(memoSt);
    memoSt.Seek(0,0);
    BackImage.Items.LoadFromStream(memoSt);
    memoSt.Clear;
    QQ40x30.Items.SaveToStream(memoSt);
    memoSt.Seek(0,0);
    ImageList.Items.LoadFromStream(memoSt); }
  end
  else
  begin
    FImageW := 50;
    FImageH := 37;
    FBackImageW := 57;
    FBackImageH := 45;

    {memoSt.Clear;
    Back57x45.Items.SaveToStream(memoSt);
    memoSt.Seek(0,0);
    BackImage.Items.LoadFromStream(memoSt);

    memoSt.Clear;
    QQ50x37.Items.SaveToStream(memoSt);
    memoSt.Seek(0,0);
    ImageList.Items.LoadFromStream(memoSt); }
  end;

  FLevel := ALeavel;
  FGameState := gtRuning;

  FHint := 10;
  FWash := 10;
  FScore := 0;
  FBaseScore := 1000;
  FIniScore := 500;
  CurLostIndex := 0;

  FStep := 1;
  FTime := 300+60*FLevel;
  FLostTime := 0;
  incTime := 0;

  incTime1 := 0;
  incTime2 := 0;
  DXTimer1.Enabled := true;
  FGameState := gtRuning;
  Initialize;
end;

procedure TForm1.PauseGame;
begin
  if (FGameState <> gtPaused) and (FGameState <> gtRuning) then exit;
  if FGameState = gtPaused then
    FGameState :=gtRuning
  else
    FGameState := gtPaused;
end;

procedure TForm1.GameOver1Click(Sender: TObject);
begin
  PauseGame;
end;

procedure TForm1.GameOver;
var
  i,j: integer;
begin
  for i := 0 to DXSpriteEngine.Engine.Count - 1 do
  begin
    DXSpriteEngine.Engine[i].Dead;
  end;
  FGameState := gtGameOver;
  for i := low(FocusedSprite) to high(FocusedSprite) do
  begin
    FocusedSprite[i].ID := - 1 ;
  end;

  for i := low(FSprites) to high(FSprites)  do
    for j := low(FSprites[i]) to high(FSprites[i]) do
      FSprites[i][j].dead := true;
end;

procedure TForm1.DoPassStep;
begin
  if FGameState = gtRuning then
  begin
    inc(FStep);
    //dec(FTime,60);
    inc(FHint);
    inc(FWash);
    FLostTime := 0;
    incTime := 0;
    //FGameOver := false;
    //FPaused := false;
    Initialize(true);
    DXTimer1.Enabled := true;
  end;
end;

procedure TForm1.wash1Click(Sender: TObject);
begin

  if FGameState = gtRuning then
  begin
    if FWash >0 then
    begin
    WashSprite;
    dec(FWash);
    end;
  end;
end;

procedure TForm1.aa1Click(Sender: TObject);
var
  i,j: integer;
begin
  for i := 0 to DXSpriteEngine.Engine.Count - 1 do
  begin
    DXSpriteEngine.Engine[i].Dead;
  end;
  //FGameOver := true;
  for i := low(FocusedSprite) to high(FocusedSprite) do
  begin
    FocusedSprite[i].ID := - 1 ;
    FocusedSprite[i].dead := true;
  end;
  for i := low(FSprites) to high(FSprites)  do
    for j := low(FSprites[i]) to high(FSprites[i]) do
      FSprites[i][j].dead := true;

end;

procedure TForm1.getFirstRaodPoint(var RoadPoint1, RoadPoint2: TSpriteXY;ISF4: boolean = false);
var
  SpriteImageID: TSpriteImageID;
  i,j,i1,j1,i2,j2: integer;
  IntArry: array of integer;
  ts: array of TSpriteXY;
  Awash: boolean;
  temSpriteXY,temSpriteXY1: TSpriteXY;
begin
  //DXTimer1.Enabled:= false;
  if Washing then exit;
  if FClose then exit;
  FClose := true;
  try
  InitializeID;

  Awash := true;

  SpriteImageID := [];
  setlength(IntArry,0);
  DXSpriteEngine.Dead;
  for i := 0 to DXSpriteEngine.Engine.Count -  1 do
  begin
    if DXSpriteEngine.Engine = nil then
      continue;
    if not(TMonoSprite(DXSpriteEngine.Engine[i]).ImageID in SpriteImageID) then
    begin
      include(SpriteImageID,TMonoSprite(DXSpriteEngine.Engine[i]).ImageID);
      setlength(IntArry,high(IntArry)+2);
      IntArry[high(IntArry)] := TMonoSprite(DXSpriteEngine.Engine[i]).ImageID;
    end;
  end;

  for i := low(IntArry) to high(IntArry) do
  begin
    setlength(ts,0);
    for i2 := 0 to DXSpriteEngine.Engine.Count -  1  do
    begin
      if DXSpriteEngine.Engine = nil then
        continue;
        if TMonoSprite(DXSpriteEngine.Engine[i2]).ImageID = IntArry[i] then
        begin
          setlength(ts,high(ts)+2);
          AssignPoint(FSprites[TMonoSprite(DXSpriteEngine.Engine[i2]).XID][TMonoSprite(DXSpriteEngine.Engine[i2]).YID],
          ts[high(ts)]);
        end;
      //end;
    end;

    for i1 := low(ts) to high(ts) - 1 do
    begin
      if ts[i1].dead then continue;
      for j1 := i1 + 1 to high(ts) do
      begin
        if ts[j1].dead then continue;
        RoadPoint1.throut := false;
        RoadPoint2.throut := false;
        AssignPoint(ts[i1],temSpriteXY);
        AssignPoint(ts[j1],temSpriteXY1);

        getRaodPoint(temSpriteXY,temSpriteXY1,RoadPoint1,RoadPoint2);
        if RoadPoint1.throut and RoadPoint2.throut then
        begin
          Awash := false;

          //DXWaveList1.Items.Find('notify').Play(false);
          Awash := false;
          if IsF4 then
          begin
            ts[i1].show := true;
            ts[j1].show := true;
          end;
          if SelfDo then
          begin
            AssignPoint(ts[i1],FocusedSprite[0]);
            AssignPoint(ts[j1],FocusedSprite[1]);
            AssignPoint(RoadPoint1,FRoadPoint[0]);
            AssignPoint(RoadPoint2,FRoadPoint[1]);
          end;
          AssignPoint(ts[i1],RoadPoint1);
          AssignPoint(ts[j1],RoadPoint2);
          if SelfDo then
          begin
            DeadSprite;
          end;
          exit;
        end;
      end;
    end;
  end;
  if (Awash) and (DXSpriteEngine.Engine.Count > 0) then
  begin
    //DXTimer1.Enabled:= false;
    //if MessageDlg('洗牌?',
          //mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    WashSprite;
    getRaodPoint(FocusedSprite[0],FocusedSprite[1],FRoadPoint[0],FRoadPoint[1]);
    //DXTimer1.Enabled := true;
  end;
  //DXTimer1.Enabled:= true;
  finally
    FClose := false
  end;
end;

procedure TForm1.WashSprite;
begin
  //if FWash > 0 then
  begin
    if washing then exit;
    try
      washing := true;
      Application.HandleMessage;
      Randomsprite;
    finally
      washing := false;
    end;
      try
        //showmessage('');
        if FMusic then
        DXWaveList1.Items[4].Play(false);
      except
      end;
      //DXTimer1.Enabled:= true;
  end;
end;

procedure TForm1.AssignPoint(SourPoint: TSpriteXY;
  var DesPoint: TSpriteXY);
begin
    DesPoint.X := SourPoint.X;
    DesPoint.Y := SourPoint.Y;
    DesPoint.ID := SourPoint.ID;
    DesPoint.ImageID := SourPoint.ImageID;
    DesPoint.XID := SourPoint.XID;
    DesPoint.YID:= SourPoint.YID;
    DesPoint.dead:= SourPoint.dead;
    DesPoint.show:= SourPoint.show;
    DesPoint.throut:= SourPoint.throut;
end;

procedure TForm1.hint1Click(Sender: TObject);
begin
  if FGameState = gtRuning then
  if FHint > 0 then
  begin
    getFirstRaodPoint(FFirstRoadPoint[0],FFirstRoadPoint[1],true);
    if FFirstRoadPoint[0].show then
    begin
      if FMusic then
      DXWaveList1.Items.Find('notify').Play(false);
      dec(FHint);
    end;
  end;
end;

procedure TForm1.MoveSprite(AStep: integer);
var
  i,j,n,m,n1,m1: integer;
  temSpriteXY,temSpriteXY1: TSpriteXY;
  procedure AdjustSprite;
  var
    i1,j1: integer;
  begin
    for i1 := low(FSprites) to high(FSprites) do
    begin
      for j1 := low(FSprites[0]) to high(FSprites[0]) do
      begin
        //if not(FSprites[i1][j1].dead) then
        begin
          if not(FSprites[i1][j1].dead) then
          with FSprites[i1][j1].MonoSprite do
          begin
            X := FSprites[i1][j1].X;
            Y := FSprites[i1][j1].Y;
            XID := i1;
            YID := j1;
            FSprites[i1][j1].ID := ID;
          end;
        end;
      end;
    end;
  end;

  procedure AssignPoint1(SourPoint: TSpriteXY;
    var DesPoint: TSpriteXY);
  begin
      DesPoint.ID := SourPoint.ID;
      DesPoint.ImageID := SourPoint.ImageID;

      DesPoint.dead:= SourPoint.dead;
      DesPoint.show:= SourPoint.show;
      DesPoint.throut:= SourPoint.throut;
      //if not(SourPoint.dead) then
      try
      DesPoint.MonoSprite := SourPoint.MonoSprite;
      except
      end;
  end;
  //to left
  procedure ToLeft(ASpriteXY: TSpriteXY;FromID: integer);
  var
    i: integer;
  begin
    AssignPoint1(FSprites[ASpriteXY.XID][ASpriteXY.YID],temSpriteXY);
    for i := ASpriteXY.XID to FromID do
    begin
      if (i < FromID) then
      begin
        AssignPoint1(FSprites[i+1][ASpriteXY.YID],FSprites[i][ASpriteXY.YID])
      end
      else
      begin
        AssignPoint1(temSpriteXY,FSprites[i][ASpriteXY.YID]);
      end;
    end;
  end;

  //to right
  procedure ToRight(ASpriteXY: TSpriteXY;FromID: integer);
  var
    i: integer;
  begin
    AssignPoint1(FSprites[ASpriteXY.XID][ASpriteXY.YID],temSpriteXY);
    for i := ASpriteXY.XID downto FromID do
    begin
      if i > FromID then
        AssignPoint1(FSprites[i-1][ASpriteXY.YID],FSprites[i][ASpriteXY.YID])
      else
        AssignPoint1(temSpriteXY,FSprites[i][ASpriteXY.YID]);
    end;
  end;

  //to down
  procedure ToDown(ASpriteXY: TSpriteXY;FromID: integer);
  var
    i: integer;
  begin
    AssignPoint1(FSprites[ASpriteXY.XID][ASpriteXY.YID],temSpriteXY);
    for i := ASpriteXY.YID downto FromID do
    begin
      if i > FromID then
        AssignPoint1(FSprites[ASpriteXY.XID][i-1],FSprites[ASpriteXY.XID][i])
      else
        AssignPoint1(temSpriteXY,FSprites[ASpriteXY.XID][i]);
    end;
  end;
  //to up
  procedure ToUp(ASpriteXY: TSpriteXY;FromID: integer);
  var
    i: integer;
  begin
    AssignPoint1(FSprites[ASpriteXY.XID][ASpriteXY.YID],temSpriteXY);
    for i := ASpriteXY.YID to FromID do
    begin
      if (i < FromID) then
      begin
        AssignPoint1(FSprites[ASpriteXY.XID][i+1],FSprites[ASpriteXY.XID][i])
      end
      else
      begin
        AssignPoint1(temSpriteXY,FSprites[ASpriteXY.XID][i]);
      end;
    end;
  end;

begin
  InitializeID;
   case AStep of
   2 :   //to left
   begin
    if FocusedSprite1[0].XID < FocusedSprite1[1].XID then
    begin
      AssignPoint(FocusedSprite1[0],temSpriteXY1);
      AssignPoint(FocusedSprite1[1],FocusedSprite1[0]);
      AssignPoint(temSpriteXY1,FocusedSprite1[1]);
    end;
    ToLeft(FocusedSprite1[0],high(FSprites));
    ToLeft(FocusedSprite1[1],high(FSprites));
   end;

   3 :  //to right
   begin
    if FocusedSprite1[0].XID > FocusedSprite1[1].XID then
    begin
      AssignPoint(FocusedSprite1[0],temSpriteXY1);
      AssignPoint(FocusedSprite1[1],FocusedSprite1[0]);
      AssignPoint(temSpriteXY1,FocusedSprite1[1]);
    end;
    ToRight(FocusedSprite1[0],low(FSprites));
    ToRight(FocusedSprite1[1],low(FSprites));
   end;

   4 : //to left and to right
   begin
    if (FocusedSprite1[0].XID < high(FSprites) div 2)
      and (FocusedSprite1[1].XID < high(FSprites) div 2) then
    begin
      if FocusedSprite1[0].XID < FocusedSprite1[1].XID then
      begin
        AssignPoint(FocusedSprite1[0],temSpriteXY1);
        AssignPoint(FocusedSprite1[1],FocusedSprite1[0]);
        AssignPoint(temSpriteXY1,FocusedSprite1[1]);
      end;
    end;
    if (FocusedSprite1[0].XID > high(FSprites) div 2 +1)
      and (FocusedSprite1[1].XID > high(FSprites) div 2 +1) then
    begin
      if FocusedSprite1[0].XID > FocusedSprite1[1].XID then
      begin
        AssignPoint(FocusedSprite1[0],temSpriteXY1);
        AssignPoint(FocusedSprite1[1],FocusedSprite1[0]);
        AssignPoint(temSpriteXY1,FocusedSprite1[1]);
      end;
    end;
    
    if FocusedSprite1[0].XID < high(FSprites) div 2 then
      toleft(FocusedSprite1[0],high(FSprites) div 2)
    else if FocusedSprite1[0].XID > high(FSprites) div 2 +1 then
      toright(FocusedSprite1[0],high(FSprites) div 2 +1);
    if FocusedSprite1[1].XID < high(FSprites) div 2 then
      toleft(FocusedSprite1[1],high(FSprites) div 2)
    else if FocusedSprite1[1].XID > high(FSprites) div 2 +1 then
      toright(FocusedSprite1[1],high(FSprites) div 2 +1);
   end;

   5 : //left and right to middle
   begin
    if (FocusedSprite1[0].XID <= high(FSprites) div 2)
      and (FocusedSprite1[1].XID <= high(FSprites) div 2) then
    begin
      if FocusedSprite1[0].XID > FocusedSprite1[1].XID then
      begin
        AssignPoint(FocusedSprite1[0],temSpriteXY1);
        AssignPoint(FocusedSprite1[1],FocusedSprite1[0]);
        AssignPoint(temSpriteXY1,FocusedSprite1[1]);
      end;
    end;
    if (FocusedSprite1[0].XID >= high(FSprites) div 2 +1)
      and (FocusedSprite1[1].XID >= high(FSprites) div 2 +1) then
    begin
      if FocusedSprite1[0].XID < FocusedSprite1[1].XID then
      begin
        AssignPoint(FocusedSprite1[0],temSpriteXY1);
        AssignPoint(FocusedSprite1[1],FocusedSprite1[0]);
        AssignPoint(temSpriteXY1,FocusedSprite1[1]);
      end;
    end;
    
    if FocusedSprite1[0].XID <= high(FSprites) div 2 then
      toright(FocusedSprite1[0],low(FSprites))
    else if FocusedSprite1[0].XID >= high(FSprites) div 2 +1 then
      toleft(FocusedSprite1[0],high(FSprites));
    if FocusedSprite1[1].XID <= high(FSprites) div 2 then
      toright(FocusedSprite1[1],low(FSprites))
    else if FocusedSprite1[1].XID >= high(FSprites) div 2 +1 then
      toleft(FocusedSprite1[1],high(FSprites));
   end;
   //to up
   6 :
   begin
    if FocusedSprite1[0].YID < FocusedSprite1[1].YID then
    begin
      AssignPoint(FocusedSprite1[0],temSpriteXY1);
      AssignPoint(FocusedSprite1[1],FocusedSprite1[0]);
      AssignPoint(temSpriteXY1,FocusedSprite1[1]);
    end;
    ToUp(FocusedSprite1[0],high(FSprites[0]));
    ToUp(FocusedSprite1[1],high(FSprites[0]));
   end;
   7 :  //to down
   begin
    if FocusedSprite1[0].YID > FocusedSprite1[1].YID then
    begin
      AssignPoint(FocusedSprite1[0],temSpriteXY1);
      AssignPoint(FocusedSprite1[1],FocusedSprite1[0]);
      AssignPoint(temSpriteXY1,FocusedSprite1[1]);
    end;
    ToDown(FocusedSprite1[0],low(FSprites[0]));
    ToDown(FocusedSprite1[1],low(FSprites[0]));
   end;
   8 : //to Up and to down
   begin
    if (FocusedSprite1[0].YID < high(FSprites[0]) div 2)
      and (FocusedSprite1[1].YID < high(FSprites[0]) div 2) then
    begin
      if FocusedSprite1[0].YID < FocusedSprite1[1].YID then
      begin
        AssignPoint(FocusedSprite1[0],temSpriteXY1);
        AssignPoint(FocusedSprite1[1],FocusedSprite1[0]);
        AssignPoint(temSpriteXY1,FocusedSprite1[1]);
      end;
    end;
    if (FocusedSprite1[0].YID > high(FSprites[0]) div 2 +1)
      and (FocusedSprite1[1].YID > high(FSprites[0]) div 2 +1) then
    begin
      if FocusedSprite1[0].YID > FocusedSprite1[1].YID then
      begin
        AssignPoint(FocusedSprite1[0],temSpriteXY1);
        AssignPoint(FocusedSprite1[1],FocusedSprite1[0]);
        AssignPoint(temSpriteXY1,FocusedSprite1[1]);
      end;
    end;
     if FocusedSprite1[0].YID < high(FSprites[0]) div 2 then
      toUp(FocusedSprite1[0],high(FSprites[0]) div 2)
      else if FocusedSprite1[0].YID > high(FSprites[0]) div 2 +1 then
        toDown(FocusedSprite1[0],high(FSprites[0]) div 2 +1);
     if FocusedSprite1[1].YID < high(FSprites[0]) div 2 then
      toUp(FocusedSprite1[1],high(FSprites[0]) div 2)
      else if FocusedSprite1[1].YID > high(FSprites[0]) div 2 +1 then
        toDown(FocusedSprite1[1],high(FSprites[0]) div 2 +1);
    end;
   9 : //Up and Down to middle
   begin
    if (FocusedSprite1[0].YID <= high(FSprites[0]) div 2)
      and (FocusedSprite1[1].YID <= high(FSprites[0]) div 2) then
    begin
      if FocusedSprite1[0].YID > FocusedSprite1[1].YID then
      begin
        AssignPoint(FocusedSprite1[0],temSpriteXY1);
        AssignPoint(FocusedSprite1[1],FocusedSprite1[0]);
        AssignPoint(temSpriteXY1,FocusedSprite1[1]);
      end;
    end;
    if (FocusedSprite1[0].YID >= high(FSprites[0]) div 2 +1)
      and (FocusedSprite1[1].YID >= high(FSprites[0]) div 2 +1) then
    begin
      if FocusedSprite1[0].YID < FocusedSprite1[1].YID then
      begin
        AssignPoint(FocusedSprite1[0],temSpriteXY1);
        AssignPoint(FocusedSprite1[1],FocusedSprite1[0]);
        AssignPoint(temSpriteXY1,FocusedSprite1[1]);
      end;
    end;
    
    if FocusedSprite1[0].YID <= high(FSprites[0]) div 2 then
      toDown(FocusedSprite1[0],low(FSprites))
    else if FocusedSprite1[0].YID >= high(FSprites[0]) div 2 +1 then
      toUp(FocusedSprite1[0],high(FSprites[0]));
    if FocusedSprite1[1].YID <= high(FSprites[0]) div 2 then
      toDown(FocusedSprite1[1],low(FSprites[0]))
    else if FocusedSprite1[1].YID >= high(FSprites[0]) div 2 +1 then
      toUp(FocusedSprite1[1],high(FSprites[0]));
   end;
   10 :
   begin
    repeat
      randomize;
      repeat
        n := random(high(FSprites)+1);
        m := random(high(FSprites[low(FSprites)])+1);
      until
        not(FSprites[n][m].dead);


     repeat
        n1 := random(high(FSprites)+1);
        m1 := random(high(FSprites[low(FSprites)])+1);
     until
      not(FSprites[n1][m1].dead);
    until
       (n <> n1) or (m1 <> n1);



    AssignPoint1(FSprites[FocusedSprite1[0].XID][FocusedSprite1[0].YID],temSpriteXY1);
    AssignPoint1(FSprites[n][m],FSprites[FocusedSprite1[0].XID][FocusedSprite1[0].YID]);
    AssignPoint1(temSpriteXY1,FSprites[n][m]);

    AssignPoint1(FSprites[FocusedSprite1[1].XID][FocusedSprite1[1].YID],temSpriteXY1);
    AssignPoint1(FSprites[n1][m1],FSprites[FocusedSprite1[1].XID][FocusedSprite1[1].YID]);
    AssignPoint1(temSpriteXY1,FSprites[n1][m1]);
   end;
  end;
  
  if AStep>1 then
  begin
    AdjustSprite;
  end;
end;

procedure TForm1.Auto1Click(Sender: TObject);
begin
  if FGameState <> gtRuning then exit;
  SelfDo := true;
  getFirstRaodPoint(FFirstRoadPoint[0],FFirstRoadPoint[1],true);
  Auto1.Checked := not(Auto1.Checked);
  SelfDo := Auto1.Checked;
  if SelfDo then
    getFirstRaodPoint(FFirstRoadPoint[0],FFirstRoadPoint[1],true);
end;

procedure TForm1.Easy1Click(Sender: TObject);
begin
  if FGameState = gtWait then
  FLevel := 1;
  //if Fstart then
    //NewGame(FLevel);
end;

procedure TForm1.Normal1Click(Sender: TObject);
begin
  if FGameState = gtWait then
  FLevel := 2;
  //if Fstart then
    //NewGame(FLevel);
end;

procedure TForm1.Hard1Click(Sender: TObject);
begin
  if FGameState = gtWait then
  FLevel := 3;
  //if Fstart then
    //NewGame(FLevel);
end;

procedure TForm1.Level2Click(Sender: TObject);
begin
  Hard1.Checked := FLevel = 3;
  Normal1.Checked := FLevel = 2;
  Easy1.Checked := FLevel = 1;
  Hard1.Enabled := not(not(FRegInfo.Reged) and (FRegInfo.RunData >FMaxRunData));
  Normal1.Enabled := Hard1.Enabled;
  Easy1.Enabled := Hard1.Enabled;
end;

procedure TForm1.Music1Click(Sender: TObject);
begin
  FMusic := not(FMusic);
end;

procedure TForm1.BackgroundMusic1Click(Sender: TObject);
begin
  FBackMusic := not(FBackMusic);
  if FBackMusic then
  begin
    //DXWaveList1.Items.Find('backmusic').Play(false);
    //DXWaveList1.Items[1].Looped := true;
    PlayBackMusic;
  end
  else
    PlayBackMusic(false);
    //DXWaveList1.Items.Find('backmusic').Stop;
end;

procedure TForm1.Sound1Click(Sender: TObject);
begin
  BackgroundMusic1.Checked := FBackMusic;
  Music1.Checked := FMusic;

  BackgroundMusic1.Enabled := not(not(FRegInfo.Reged) and (FRegInfo.RunData >FMaxRunData));
  Music1.Enabled := BackgroundMusic1.Enabled;
  //Easy1.Enabled := Hard1.Enabled;
end;

procedure TForm1.MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
  var DoDefault: Boolean);
begin
  //MediaPlayer1.
end;

procedure TForm1.Chinese1Click(Sender: TObject);
begin
  Language := ltchs;
  ChangeLanguge(Language);
end;

procedure TForm1.English1Click(Sender: TObject);
begin
  Language := ltEng;
  ChangeLanguge(Language);
end;

procedure TForm1.Language1Click(Sender: TObject);
begin
  Chinese1.Checked := Language = ltchs;
  English1.Checked := Language = ltEng;
end;

procedure TForm1.ChangeLanguge(AType: TLanguageType);
var
  i: integer;
begin
  case AType of
   ltchs :
   begin
    for i := low(FStrs) to high(FStrs) do
    begin
      if (i>=low(ChsStr)) and (i<=high(ChsStr)) then
      FStrs[i] := ChsStr[i];
    end;
    for i := low(NumStrs) to high(NumStrs) do
    begin
      if (i>=low(ChsNum)) and (i<=high(ChsNum)) then
      NumStrs[i] := ChsNum[i];
    end;
    for i := low(FRanEventName) to high(FRanEventName) do
    begin
      if (i>=low(FRanEventName)) and (i<=high(FRanEventName)) then
      FRanEventName[i] := RanEventName[i];
    end;

   end;
   lteng :
   begin
    for i := low(FStrs) to high(FStrs) do
    begin
      if (i>=low(EngStr)) and (i<=high(EngStr)) then
      FStrs[i] := EngStr[i];
    end;
    for i := low(NumStrs) to high(NumStrs) do
    begin
      if (i>=low(EngNum)) and (i<=high(EngNum)) then
      NumStrs[i] := EngNum[i];
    end;
    for i := low(FRanEventName) to high(FRanEventName) do
    begin
      if (i>=low(FRanEventName)) and (i<=high(FRanEventName)) then
      FRanEventName[i] := RanEventNameEn[i];
    end;
   end;
  end;
  Game1.Caption := FStrs[19];
  NewGame1.Caption := FStrs[20];
  if FGameState <> gtPaused then
    GameOver1.Caption := FStrs[21]
  else
    GameOver1.Caption := FStrs[46];
  Exit1.Caption := FStrs[22];

  Level1.Caption := FStrs[23];
  Level2.Caption := FStrs[24];
  Easy1.Caption := FStrs[25];
  Normal1.Caption := FStrs[26];
  Hard1.Caption := FStrs[27];
  Sound1.Caption := FStrs[28];
  Music1.Caption := FStrs[29];
  BackgroundMusic1.Caption := FStrs[30];

  other1.Caption := FStrs[31];
  hint1.Caption := FStrs[32];
  wash1.Caption := FStrs[33];
  Language1.Caption := FStrs[34];
  Chinese1.Caption := FStrs[35];
  English1.Caption := FStrs[36];
  Auto1.Caption := FStrs[37];

  about1.Caption := FStrs[38];
  about.Caption := FStrs[39];
  N2.Caption := FStrs[43];

  Caption := FStrs[44];
  EndGame1.Caption := FStrs[45];


end;

procedure TForm1.N1Click(Sender: TObject);
begin
  ShowScores(true,0);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  ShowScores(true);
end;

procedure TForm1.PlayBackMusic(Play: boolean=true);
var
  Filename: string;
  Res : TResourceStream;
  i: integer;
begin
  //if not(MediaPlayer1.Mode in [mpOpen,mpPlaying,mpStopped]) then
  try
    MediaPlayer1.Close;
  except
  end;
  FileName := ExtractfilePath(Application.Name)+'back.MID';
  if not(MediaPlayer1.Mode in [mpPlaying, mpRecording, mpSeeking,
    mpPaused, mpOpen])  then
  begin
    Randomize;
    i := RandomRange(1,5);
    Res := TResourceStream.Create(hInstance, 'Sound'+inttostr(i), Pchar('MID'));
    Res.SavetoFile(FileName);
    Res.Free;
  end;
  if FileExists(FileName) then
  begin
    MediaPlayer1.FileName := FileName;
    if Play then
    begin
      MediaPlayer1.Open;
      MediaPlayer1.Play;
    end
    else
    begin
      //MediaPlayer1.Stop;
      //MediaPlayer1.Close;
    end;
  end;
end;

procedure TForm1.MediaPlayer1Notify(Sender: TObject);
begin
  With MediaPlayer1 do
  begin
    if {Notify and} (Mode in [mpStopped]) then
    begin
      if FBackMusic then
      begin
        PlayBackMusic;
        //showmessage('Play');
      end;
    end;
  end;
end;

procedure TForm1.DXDrawInitialize(Sender: TObject);
var
  i: Integer;
  MenuItem: TMenuItem;
begin
  {for i:=ModesMenu.Count-1 downto 0 do
    ModesMenu.Items[0].Free;

  for i:=0 to DXDraw.Display.Count-1 do
  begin
    MenuItem := TMenuItem.Create(ModesMenu);
    with MenuItem do
    begin
      Caption := Format('%dx%dx%d', [DXDraw.Display.Modes[i].Width,
        DXDraw.Display.Modes[i].Height, DXDraw.Display.Modes[i].BitCount]);
      OnClick := ModeItemClick;
    end;
    ModesMenu.Add(MenuItem);
  end; }
end;

procedure TForm1.ModeItemClick(Sender: TObject);
var
  s: string;
  i, AWidth, AHeight, ABitCount: Integer;
begin
  DXDraw.Finalize;

  s := TMenuItem(Sender).Caption;

  i := Pos('x', s);
  AWidth := StrToInt(Copy(s, 1, i-1));
  s := Copy(s, i+1, Length(s));

  i := Pos('x', s);
  AHeight := StrToInt(Copy(s, 1, i-1));
  s := Copy(s, i+1, Length(s));

  ABitCount := StrToInt(s);

  DXDraw.Display.Width := AWidth;
  DXDraw.Display.Height := AHeight;
  DXDraw.Display.BitCount := ABitCount;
  DXDraw.Options := DXDraw.Options + [doFullScreen];
  DXDraw.Initialize;
end;

procedure TForm1.RandomEvent;
var
  RanNum: integer;
begin
  //Randomize;
  //Randomize;
  FRanEventID.ID := randomRange(-1,7);
  case FRanEventID.ID of
   1 :
   begin
    inc(FHint);
    FRanEventID.Add := 1;
   end;
   2 :
   begin
    inc(FWash);
    FRanEventID.Add := 1;
   end;
   3 :
   begin
    RanNum := RandomRange(100,1000);
    inc(FScore,RanNum);
    FRanEventID.Add := RanNum;
   end;
   4 :
   begin
    RanNum := RandomRange(10,30);
    inc(FTime,RanNum);
    FRanEventID.Add := RanNum;
   end;
  end;
  if FMusic and (FRanEventID.ID in [1..4]) then
    DXWaveList1.Items.Find('event').Play(false);

end;

procedure TForm1.EndGame;
var
  i,j: integer;
begin
  if FGameState <> gtruning then exit;
  for i := 0 to DXSpriteEngine.Engine.Count - 1 do
  begin
    DXSpriteEngine.Engine[i].Dead;
  end;
  FGameState := gtWait;
  for i := low(FocusedSprite) to high(FocusedSprite) do
  begin
    FocusedSprite[i].ID := - 1 ;
  end;

  for i := low(FSprites) to high(FSprites)  do
    for j := low(FSprites[i]) to high(FSprites[i]) do
      FSprites[i][j].dead := true;

end;

procedure TForm1.EndGame1Click(Sender: TObject);
begin
  EndGame;
end;

procedure TForm1.game1Click(Sender: TObject);
begin
  if FGameState <> gtPaused then
    GameOver1.Caption := FStrs[21]
  else
    GameOver1.Caption := FStrs[46];
  NewGame1.Enabled := FGameState = gtWait;
  EndGame1.Enabled := FGameState = gtruning;
  GameOver1.Enabled := (FGameState = gtruning) or (FGameState = gtPaused);
end;

procedure TForm1.other1Click(Sender: TObject);
begin
  hint1.Enabled := FHint > 0;
  wash1.Enabled := FWash > 0;
end;

procedure TForm1.UnFocusedSprite;
begin
  if FocusedSprite[1].ID <> - 1 then
    FocusedSprite[1].ID := -1
    else if FocusedSprite[0].ID <> -1 then
      FocusedSprite[0].ID := -1;
end;
procedure TForm1.about1Click(Sender: TObject);
begin
  Regest1.Visible := not(FRegInfo.Reged);
end;

procedure TForm1.Regest1Click(Sender: TObject);
begin
  fmReg.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    FParentFile := TFileStream.Create(ExtractFilePath(Application.ExeName)+ParamStr(2),fmOpenReadWrite);
  except
    application.Terminate;
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if FParentFile <> nil then
    FParentFile.Free;
end;

initialization

finalization


end.

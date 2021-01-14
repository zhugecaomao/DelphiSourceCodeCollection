unit Russ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Square, Buttons, ExtCtrls, RzPanel, RzForms, RzButton, StdCtrls, RzLabel;

type
  TRussfrm = class(TForm)
    sPrim: TSquare;
    sSec: TSquare;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzFormShape1: TRzFormShape;
    RzPanel4: TRzPanel;
    RzPanel5: TRzPanel;
    RzShapeButton1: TRzShapeButton;
    RzShapeButton2: TRzShapeButton;
    sPrimV: TSquare;
    Bevel1: TShape;
    Bevel2: TShape;
    sSecV: TSquare;
    btSecImage: TRzToolButton;
    btPrimImage: TRzToolButton;
    LbSecHost: TRzLabel;
    LbSecAddress: TRzLabel;
    lbSecUser: TRzLabel;
    LbPrimHost: TRzLabel;
    LbPrimAddress: TRzLabel;
    lbPrimUser: TRzLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    RzToolButton1: TRzToolButton;
    Label5: TLabel;
    RzToolButton2: TRzToolButton;
    Label6: TLabel;
    RzToolButton3: TRzToolButton;
    Label7: TLabel;
    RzToolButton4: TRzToolButton;
    Label8: TLabel;
    Timer2: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzShapeButton1Click(Sender: TObject);
    procedure RzShapeButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sPrimStop(Sender: TObject);
    procedure sPrimGameOver(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sSecStop(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton4Click(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Timer2Timer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure sPrimStart(Sender: TObject);
    procedure sSecStart(Sender: TObject);
    procedure sSecGameOver(Sender: TObject);
    procedure sPrimDelLine(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure CreateParams(var Params:TCreateParams);override;
  public
    { Public declarations }
    UserID,UserHandle,MyID,MyHandle:string;
    index:integer;
    Started,UserStarted:Boolean;
    CommandList:TStrings;
    OldFlag,OldStyle:byte;
    GameConnected:Boolean;
    PGameOver,SGameOver:Boolean;
    procedure Init;
  end;

implementation

uses mainfrm;


{$R *.DFM}

procedure TRussfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
  frmMain.frmChat[index].Russfrm :=nil;
  CommandList.Free;
end;

procedure TRussfrm.FormCreate(Sender: TObject);
begin
  sPrimV.New(0,0,true);
  OldFlag:=sPrimV.Flag;
  OldStyle:=sPrimV.NowStyle;
  CommandList:=TStringList.Create;
  BringToFront;
  //SetWindowPos(handle,HWND_TOPMOST,0,0,0,0,swp_NoSize);
end;

procedure TRussfrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_Return then
  begin
    if not Started then
    begin
      CommandList.Add(myHandle+'.Start');
      Started:=True;
      Timer1.Enabled :=true;
      Timer2.Enabled :=true;
    end;
  end
  else if Key=VK_Down then
  begin
    CommandList.Add(myHandle+'.Down');
    Sleep(30);
  end
  else if Key=VK_Left then
  begin
    CommandList.Add(myHandle+'.Left');
    Sleep(10);
  end
  else if Key=VK_Right then
  begin
    CommandList.Add(myHandle+'.Right');
    Sleep(10);
  end
  else if Key=VK_Up then
  begin
    CommandList.Add(myHandle+'.Change');
    Sleep(10);
  end;
end;

procedure TRussfrm.RzShapeButton1Click(Sender: TObject);
begin
  close
end;

procedure TRussfrm.RzShapeButton2Click(Sender: TObject);
begin
  CloseWindow(handle);
end;

procedure TRussfrm.sPrimStop(Sender: TObject);
begin
  CommandList.Add(myHandle+'.Stop');
  Label3.Caption :='得分:'+inttostr(sPrim.DelLinesCount);
end;

procedure TRussfrm.Init;
begin
  GameConnected:=true;
  MyID :=frmmain.myID;
  MyHandle :=frmmain.myHandle;

  btSecImage.ImageIndex :=frmMain.frmChat[index].btImage.ImageIndex;
  LbSecHost.Caption :=frmMain.frmChat[index].LbHost.Caption ;
  LbSecAddress.Caption :=frmMain.frmChat[index].LbAddress.Caption ;
  LbSecUser.Caption :=frmMain.frmChat[index].lbUser.Caption ;

  btPrimImage.ImageIndex :=frmMain.myImgIndex;
  LbPrimHost.Caption :='主机名:'+frmMain.c.Socket.LocalHost ;
  LbPrimAddress.Caption :='IP地址:'+frmMain.c.Socket.LocalAddress ;
  LbPrimUser.Caption :='昵称:'+frmMain.myName ;
end;

procedure TRussfrm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := WS_POPUP or WS_SYSMENU or WS_MINIMIZEBOX;
  Params.WndParent :=GetDesktopWindow;
end;

procedure TRussfrm.sPrimGameOver(Sender: TObject);
begin
  sPrim.TextOut('Game Over',clred);
  Started:=false;
  Timer1.Enabled :=false;
  Timer2.Enabled :=false;
  PGameOver:=true;
  CommandList.Clear;
end;

procedure TRussfrm.Timer1Timer(Sender: TObject);
begin
  if CommandList.Count <>0 then
    frmmain.Send('P',UserHandle,inttostr(OldFlag)
      ,inttostr(OldStyle),MyHandle,UserID,MyID,CommandList.Text);
  CommandList.Clear;
end;

procedure TRussfrm.sSecStop(Sender: TObject);
begin
  Label4.Caption :='得分:'+inttostr(sSec.DelLinesCount);
end;

procedure TRussfrm.RzToolButton1Click(Sender: TObject);
begin
  CommandList.Add(MyHandle+'.Change');
  Sleep(10);
end;

procedure TRussfrm.RzToolButton4Click(Sender: TObject);
begin
  CommandList.Add(MyHandle+'.Down');
  Sleep(10);
end;

procedure TRussfrm.RzToolButton3Click(Sender: TObject);
begin
  CommandList.Add(MyHandle+'.Right');
  Sleep(10);
end;

procedure TRussfrm.RzToolButton2Click(Sender: TObject);
begin
  CommandList.Add(MyHandle+'.Left');
  Sleep(10);
end;

procedure TRussfrm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if GameConnected then
  begin
    if MessageBox(0, '正在与对方联机游戏，是否关闭？', '提示',
       MB_ICONQUESTION or MB_OKCANCEL or MB_DEFBUTTON2)=mrOk then
    begin
      frmmain.frmChat[Index].RzBitBtn5.Enabled:=true;
      frmmain.Send('J',frmmain.myHandle,frmmain.myName,frmmain.myID,UserHandle,'','','');
    end
    else
      abort;
  end
  else
    frmmain.frmChat[Index].RzBitBtn5.Enabled:=true;
end;

procedure TRussfrm.Timer2Timer(Sender: TObject);
begin
  //OldFlag:=sPrimV.Flag;
  //OldStyle:=sPrimV.NowStyle;
  CommandList.Add(myHandle+'.Down');
end;

procedure TRussfrm.FormPaint(Sender: TObject);
begin
  if not GameConnected then
    sSec.TextOut('对方已下线',clRed);
  if PGameOver then
    sPrim.TextOut('Game Over',clred);
  if SGameOver then
    sSec.TextOut('Game Over',clred);
end;

procedure TRussfrm.sPrimStart(Sender: TObject);
begin
  label3.Caption :='得分:0';
  PGameOver:=false;
end;

procedure TRussfrm.sSecStart(Sender: TObject);
begin
  label4.Caption :='得分:0';
  SGameOver:=false;
  UserStarted:=true;
end;

procedure TRussfrm.sSecGameOver(Sender: TObject);
begin
  sSec.TextOut('Game Over',clred);
  SGameOver:=true;
  UserStarted:=false;
end;

procedure TRussfrm.sPrimDelLine(Sender: TObject);
begin
  CommandList.Add(myHandle+'.Build');
end;

end.

{
    TMagnetic VCL Write by ZHONG WAN at 2001.3 Ver 1.01

      -'`"_         -'`" \
     /     \       /      "
    /     /\\__   /  ___   \       西安科技学院143信箱 710054
   |      | \  -"`.-(   \   |
   |      |  |     | \"  |  |                万  重
   |     /  /  "-"  \  \    |
    \___/  /  (o o)  \  (__/       电邮(email):
         __| _     _ |__           mantousoft@sina.com
        (      ( )      )
         \_\.-.___.-./_/           网址(homepage):
           __  | |  __             http://mantousoft.51.net
          |  \.| |./  |
          | '#.   .#' |            OICQ: 6036742
          |__/ '"" \__|
        -/             \-          2001.3.1

    版权所有，任何人不得未经允许用于商业或盈利

    如果你觉得有什么好的建议，希望能告诉我

    同时欢迎你改进本控件的特性

    改完了一定要寄一份给我噢
}

unit Magnetic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,Dialogs,
  ExtCtrls;

type
  TMagOption = class (TPersistent)
  private
      fMagTray:boolean;
      fMagExplorer:boolean;
      fMagCustom:boolean;
  public
      constructor Create;
      destructor Destroy;override;
  published
      property MagTray:boolean     read fMagTray      write fMagTray;
      property MagExplorer:boolean read fMagExplorer  write fMagExplorer;
      property MagCustom:boolean   read fMagCustom    write fMagCustom;
  end;

type
  TMagnetic = class(TCustomPanel)
  private
    fActive:Boolean;
    fCanResize:Boolean;
    fOldPoint:TPoint;     {old mouse point}
    fNewPoint:TPoint;     {moved point}
    fMagEffect:Integer;   {magnetic effect default 10pix}
    fMagOption:TMagOption;
    fMovedByForm:Boolean;
    fForm:TForm;
    fOldX, fOldY: Integer;
    fOldTWndMethod:TWndMethod;
    HWnd_Tray,HWnd_Explorer:HWND;
    RWnd_Tray,RWnd_Explorer,RWnd_Custrom:TRect;
    procedure Magnetic(var MagPoint:TPoint);
    procedure WndProcMe(var Message: TMessage);
    procedure WMMouseMove(var Msg:TMessage);
    procedure WMLButtonDown(var Msg:TMessage);
    procedure WMNCHitTest(var Msg: TMessage);
    { private declarations }
  protected
    procedure Loaded;override;
    procedure SetMagOption(Value:TMagOption);
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    { protected declarations }
  public
    CustomMagWnd:HWND;
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    { public declarations }
  published
    property Active:boolean       read fActive          write fActive;
    property FormCanResize:boolean    read fCanResize       write fCanResize;    
    property MagOption:TMagOption read fMagOption       write SetMagOption;
    property MagEffect:Integer    read fMagEffect       write fMagEffect;
    property MovedByForm:Boolean  read fMovedByForm     write fMovedByForm;
    property Color;
    property Caption;
    property Align;
    { published declarations }
  end;

implementation

constructor TMagOption.Create;
begin
  inherited Create;
  fMagTray:=True;
  fMagExplorer:=False;
  fMagCustom:=False;
end;

destructor TMagOption.Destroy;
begin
  inherited Destroy;
end;

constructor TMagnetic.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  fActive:=True;
  fMagEffect:=10;
  fMovedByForm:=false;
  height:=30;
  width:=100;
  BevelInner:=bvNone;
  BevelOuter:=bvNone;
  Parent:=fForm;
  fMagOption:=TMagOption.Create;
  fForm:=TForm(AOwner);
  if fForm.BorderStyle=bsNone then fCanResize:=true;
end;

destructor TMagnetic.Destroy;
begin
  fMagOption.Free;
  if not (CsDesigning in ComponentState) then
    fForm.WindowProc:=fOldTWndMethod;
  inherited Destroy;
end;

procedure TMagnetic.WndProcMe(var Message: TMessage);
begin
  { disable during Delphi IDE }
  if (CsDesigning in ComponentState) then fOldTwndMethod(Message)
  else
    case Message.Msg of
      WM_LBUTTONDOWN : WMLButtonDown(Message);
      WM_MOUSEMOVE   : WMMouseMove(Message);
      WM_NCHITTEST   : WMNCHitTest(Message);
    else fOldTwndMethod(Message);
  end;
end;

procedure TMagnetic.WMMouseMove(var Msg:TMessage);
var
  pt:TPoint;
begin
  if not (CsDesigning in ComponentState) then
  begin
    fOldTWndMethod(Msg);
    if not fActive then exit;
    {whether can move}
    if (fForm.WindowState<>wsNormal)and not fActive then exit;
    {whether mouse left button}
    if HiWord(GetAsyncKeyState(VK_LBUTTON))>0 then
    begin
      pt:=Point(TWMMouseMove(Msg).XPos,TWMMouseMove(Msg).YPos);
      {calculate new point}
      fNewPoint:=Point(fForm.left+pt.x-fOldPoint.x,fForm.top+pt.y-fOldPoint.y);
      Magnetic(fNewPoint);  {do magnetic}
      fForm.SetBounds(fNewpoint.X,fNewpoint.Y,fForm.Width,fForm.Height);
    end;
  end;
end;

procedure TMagnetic.WMLButtonDown(var Msg: TMessage);
begin
  if not (CsDesigning in ComponentState) then
  begin
    fOldTWndMethod(Msg);
    if not fActive then exit;
    fOldPoint:=Point(TWMLButtonDown(Msg).XPos,TWMLButtonDown(Msg).YPos);
    if MagOption.fMagCustom and (CustomMagWnd>0) then
      GetWindowRect(CustomMagWnd, RWnd_Custrom);     { get custom rect }
    if MagOption.fMagExplorer then
      HWnd_Explorer:=FindWindow('CabinetWClass',nil);{ get explorer handle }
      if HWnd_Explorer>0 then
        GetWindowRect(HWnd_Explorer, RWnd_Explorer); { get explorer rect }
    if MagOption.fMagTray then
      HWnd_Tray:=FindWindow('Shell_TrayWnd',nil);    { get traybar handle }
    if HWnd_Tray>0 then
      GetWindowRect(HWnd_Tray, RWnd_Tray);           { get taskbar rect }
  end;
end;

procedure TMagnetic.WMNCHitTest(var Msg:TMessage);
var
  pt:TPoint;
begin
  if not (CsDesigning in ComponentState) then
  begin
    fOldTWndMethod(Msg);
    {if windowstate not normal and not can resize then exit}
    if (fForm.WindowState<>wsNormal) or not fCanResize then exit;
    {get form's edges and change it's size}
    pt:=Point(TWMNCHitTest(Msg).XPos,TWMNCHitTest(Msg).YPos);
    pt:=fForm.ScreenToClient(pt);
    if (pt.x<5) and (pt.y<5) then Msg.Result:=htTopLeft
    else if (pt.x>fForm.Width-5) and (pt.y<5) then Msg.Result:=htTopRight
    else if (pt.x>fForm.Width-5) and (pt.y>fForm.Height-5) then Msg.Result:=htBottomRight
    else if (pt.x<5) and (pt.y>fForm.Height-5) then Msg.Result:=htBottomLeft
    else if (pt.x<5) then Msg.Result:=htLeft
    else if (pt.y<5) then Msg.Result:=htTop
    else if (pt.x>fForm.Width-5) then Msg.Result:=htRight
    else if (pt.y>fForm.Height-5) then Msg.Result:=htBottom;
  end;
end;

procedure TMagnetic.Magnetic(var MagPoint:TPoint);
begin
  if not fActive then exit;

  if MagOption.fMagCustom and (CustomMagWnd>0) then
  begin
    { mangetize custrom}
    if Abs(RWnd_Custrom.Bottom-MagPoint.Y)<fMagEffect then MagPoint.Y:=RWnd_Custrom.Bottom
    else if Abs(MagPoint.Y+fForm.Height-RWnd_Custrom.Top)<fMagEffect then MagPoint.Y:=RWnd_Custrom.Top-fForm.Height;
    if Abs(RWnd_Custrom.Right-MagPoint.X)<fMagEffect then MagPoint.X:=RWnd_Custrom.Right
    else if Abs(MagPoint.X+fForm.Width-RWnd_Custrom.Left)<fMagEffect then MagPoint.X:=RWnd_Custrom.Left-fForm.Width;
  end;

  if MagOption.fMagExplorer and (HWnd_Explorer>0) then
  begin
    { mangetize explorer}
    if Abs(RWnd_Explorer.Bottom-MagPoint.Y)<fMagEffect then MagPoint.Y:=RWnd_Explorer.Bottom
    else if Abs(MagPoint.Y+fForm.Height-RWnd_Explorer.Top)<fMagEffect then MagPoint.Y:=RWnd_Explorer.Top-fForm.Height;
    if Abs(RWnd_Explorer.Right-MagPoint.X)<fMagEffect then MagPoint.X:=RWnd_Explorer.Right
    else if Abs(MagPoint.X+fForm.Width-RWnd_Explorer.Left)<fMagEffect then MagPoint.X:=RWnd_Explorer.Left-fForm.Width;
  end;

  if MagOption.fMagTray and (HWnd_Tray>0) then
  begin
    { mangetize tray}
    if Abs(RWnd_Tray.Bottom-MagPoint.Y)<fMagEffect then MagPoint.Y:=RWnd_Tray.Bottom
    else if Abs(MagPoint.Y+fForm.Height-RWnd_Tray.Top)<fMagEffect then MagPoint.Y:=RWnd_Tray.Top-fForm.Height;
    if Abs(RWnd_Tray.Right-MagPoint.X)<fMagEffect then MagPoint.X:=RWnd_Tray.Right
    else if Abs(MagPoint.X+fForm.Width-RWnd_Tray.Left)<fMagEffect then MagPoint.X:=RWnd_Tray.Left-fForm.Width;
  end;

  { magnetize screen }
  if MagPoint.X<fMagEffect then MagPoint.X:=0;
  if MagPoint.X>Screen.Width-fForm.Width-fMagEffect then MagPoint.X:=Screen.Width-fForm.Width;
  if MagPoint.Y<fMagEffect then MagPoint.Y:=0;
  if MagPoint.Y>Screen.Height-fForm.Height-fMagEffect then MagPoint.Y:=Screen.Height-fForm.Height;
  { end screen }

end;

procedure TMagnetic.SetMagOption(Value:TMagOption);
begin
  FMagOption.Assign(Value);
end;

procedure TMagnetic.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if not (CsDesigning in ComponentState) then
  begin
    if not fActive then exit;
    FOldX := X;
    FOldy := Y;
    if MagOption.fMagCustom and (CustomMagWnd>0) then
      GetWindowRect(CustomMagWnd, RWnd_Custrom);
    if MagOption.fMagExplorer then
      HWnd_Explorer:=FindWindow('CabinetWClass',nil);
      if HWnd_Explorer>0 then
        GetWindowRect(HWnd_Explorer, RWnd_Explorer);
    if MagOption.fMagTray then
      HWnd_Tray:=FindWindow('Shell_TrayWnd',nil);
    if HWnd_Tray>0 then
      GetWindowRect(HWnd_Tray, RWnd_Tray);
  end;
end;

procedure TMagnetic.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if not (CsDesigning in ComponentState) then
  begin
    if not fActive then exit;
    if (fForm.WindowState<>wsNormal)and not fActive then exit;
    if HiWord(GetAsyncKeyState(VK_LBUTTON))>0 then
    begin
      fNewPoint:=Point(fForm.left+x-fOldx,fForm.top+y-fOldy);
      Magnetic(fNewPoint);
      fForm.SetBounds(fNewpoint.X,fNewpoint.Y,fForm.Width,fForm.Height);
    end;
  end;
end;

procedure TMagnetic.Loaded;
begin
  inherited;
  if not (CsDesigning in ComponentState) then
  begin
    fOldTWndMethod:=fForm.WindowProc;
    if fMovedByForm then
      fForm.WindowProc:=WndProcMe;
  end;
end;

end.

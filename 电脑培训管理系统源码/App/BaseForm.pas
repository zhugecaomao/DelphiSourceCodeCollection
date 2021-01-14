unit BaseForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ImgList, ToolWin, ComCtrls, MenuBar, Menus, Buttons;

type
  TWhichBorder=(wbTop,wbLeft,wbRight,wbBottom,wbLeftTop,wbLeftBottom,wbRightTop,
    wbRightBottom,wbNone);
  TzypNeoBorderIcons=Array [1..3] of Boolean;
  TBaseFrm = class(TForm)
    ImageTop: TImage;
    ImageLeft: TImage;
    ImageLeftTop: TImage;
    ImageRightTop: TImage;
    ImageRight: TImage;
    ImageBottom: TImage;
    LabelCaption: TLabel;
    ImageIcon: TImage;
    PanelBkGnd: TPanel;
    ImageMax: TImage;
    ImageMin: TImage;
    ImageNormal: TImage;
    ImageClose: TImage;
    CoolBar: TCoolBar;
    MenuBar: TMenuBar;
    ImageDeactiveLeftTop: TImage;
    ImageDeactiveTop: TImage;
    ImageDeactiveRightTop: TImage;
    ImageActiveTop: TImage;
    ImageActiveLeftTop: TImage;
    ImageActiveRightTop: TImage;
    ImageActiveMenubar: TImage;
    ImageDeactiveMenubar: TImage;
    ImageLeftBottom: TImage;
    ImageRightBottom: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
    procedure ImageMinClick(Sender: TObject);
    procedure ImageNormalClick(Sender: TObject);
    procedure ImageMaxClick(Sender: TObject);
    procedure ImageTopDblClick(Sender: TObject);
    procedure SetCanResize(value:Boolean);
    function  GetcanResize:Boolean;
    procedure SetBorderIcons;
    procedure ImageTopMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageTopMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageTopMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
    procedure ImageIconDblClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure LabelCaptionDblClick(Sender: TObject);
  private
    { Private declarations }
    OriginalPos:TPoint;    // 记录原始位置
    CurrentPos:TPoint;     // 记录当前位置
    DownPos:TPoint;        // 记录鼠标按下时位置
    MouseLButtonDown:Boolean;   // 标记鼠标左键是否按下
    FCanResize:Boolean;
    FzypNeoBorderIcons:TZypNeoBorderIcons;
    B_selfcreate:boolean;
  public
    { Public declarations }
  protected
    procedure WndProc(var Msg:TMessage);override;
    procedure WMNCHitTest(var Msg:TWMNCHitTest);message WM_NCHITTEST;
  end;

var
  BaseFrm: TBaseFrm;

implementation

{$R *.DFM}
const
  cTopHeight=50;
  cRightTopWidth=97;
  cLeftWidth=10;
  cRightWidth=10;
  cBottomHeight=12;
  cMaxWidth=800;
  cMaxHeight=600;
  cMinWidth=300;
  cMinHeight=200;
  cPenWidth=3;
  cIconTop=6;


procedure TBaseFrm.WMNCHitTest(var Msg:TWMNCHitTest);
var
  pt:TPoint;
begin
if (GetCanReSize=False) or (WindowState<>wsNormal) then
  begin
  inherited;
  exit;
  end;
pt:=Point(Msg.xPos,Msg.yPos);
pt:=ScreenToClient(pt);
if (pt.x<5) and (pt.y<5) then Msg.Result:=htTopLeft
else if (pt.x>width-5) and (pt.y<5) then Msg.Result:=htTopRight
else if (pt.x>width-5) and (pt.y>height-5) then Msg.Result:=htBottomRight
else if (pt.x<5) and (pt.y>height-5) then Msg.Result:=htBottomLeft
else if (pt.x<5) then Msg.Result:=htLeft
else if (pt.y<5) then Msg.Result:=htTop
else if (pt.x>width-5) then Msg.Result:=htRight
else if (pt.y>height-5) then Msg.Result:=htBottom
else inherited;
end;

procedure TBaseFrm.SetBorderIcons;
begin
case BorderStyle of
  bsToolWindow,
  bsSizeToolWin,
  bsDialog:
    begin
    FzypNeoBorderIcons[1]:=True;
    FzypNeoBorderIcons[2]:=False;
    FzypNeoBorderIcons[3]:=False;
    ImageIcon.Visible:=False;
    ImageIcon.Enabled:=False;
    end;
  bsNone:
    begin     
    FzypNeoBorderIcons[1]:=False;
    FzypNeoBorderIcons[2]:=False;
    FzypNeoBorderIcons[3]:=False;
    ImageIcon.Visible:=False;
    ImageIcon.Enabled:=False;
    end;
else
    FzypNeoBorderIcons[1]:=True;
    FzypNeoBorderIcons[2]:=True;
    FzypNeoBorderIcons[3]:=True;
    ImageIcon.Visible:=True;
    ImageIcon.Enabled:=True;
    end;
if biSystemMenu in BorderIcons then
  begin
  FzypNeoBorderIcons[1]:=FzypNeoBorderIcons[1] and True;
  FzypNeoBorderIcons[2]:=FzypNeoBorderIcons[2] and True;
  FzypNeoBorderIcons[3]:=FzypNeoBorderIcons[3] and True;
  ImageIcon.Visible:=ImageIcon.Visible and True;
  ImageIcon.Enabled:=ImageIcon.Enabled and True;
  end
else
  begin
  FzypNeoBorderIcons[1]:=FzypNeoBorderIcons[1] and False;
  FzypNeoBorderIcons[2]:=FzypNeoBorderIcons[2] and False;
  FzypNeoBorderIcons[3]:=FzypNeoBorderIcons[3] and False;
  ImageIcon.Visible:=ImageIcon.Visible and False;
  ImageIcon.Enabled:=ImageIcon.Enabled and False;
  end;
if biMinimize in BorderIcons then
  begin
  FzypNeoBorderIcons[3]:=FzypNeoBorderIcons[3] and True;
  end
else
  begin
  FzypNeoBorderIcons[3]:=FzypNeoBorderIcons[3] and False;
  end;
if biMaximize in BorderIcons then
  begin
  FzypNeoBorderIcons[2]:=FzypNeoBorderIcons[2] and True;
  end
else
  begin
  FzypNeoBorderIcons[2]:=FzypNeoBorderIcons[2] and False;
  end;
ImageClose.Visible:=FzypNeoBorderIcons[1];
ImageClose.Enabled:=FzypNeoBorderIcons[1];
ImageMax.Visible:=FzypNeoBorderIcons[2];
ImageMax.Enabled:=FzypNeoBorderIcons[2];
ImageMin.Visible:=FzypNeoBorderIcons[3];
ImageMin.Enabled:=FzypNeoBorderIcons[3];
end;

procedure TBaseFrm.SetCanResize(value:Boolean);
begin
if FCanResize<>value then FCanResize:=value;
end;

function TBaseFrm.GetcanResize;
begin
Result:=FCanResize;
end;

procedure TBaseFrm.WndProc(var Msg:TMessage);
begin
inherited WndProc(Msg);
if Msg.Msg=WM_ACTIVATE then
  begin
  case Msg.WParamLo of
    WA_ACTIVE,WA_CLICKACTIVE:
      begin
      ImageTop.Picture:=ImageActiveTop.Picture;
      ImageLeftTop.Picture:=ImageActiveLeftTop.Picture;
      ImageRightTop.Picture:=ImageActiveRightTop.Picture;
      Coolbar.Bitmap:=ImageActiveMenubar.Picture.Bitmap;
      end;
    WA_INACTIVE:
      begin
      ImageLeftTop.Picture:=ImageDeactiveLeftTop.Picture;
      ImageTop.Picture:=ImageDeactiveTop.Picture;
      ImageRightTop.Picture:=ImageDeactiveRightTop.Picture;
      CoolBar.Bitmap:=ImageDeactiveMenuBar.Picture.Bitmap;
      end;
    end;
  end;
end;

procedure TBaseFrm.FormCreate(Sender: TObject);
var
  TheBitmap : TBitmap;
begin
  TheBitmap := TBitmap.Create;
  TheBitmap.Height := application.icon.Height+2;
  TheBitmap.Width := application.icon.Width+2;
  TheBitmap.Canvas.Draw(0, 0, application.Icon);
  ImageIcon.Picture.Bitmap :=thebitmap;
//因为PanelBGNND是应用程序的所有控件的平台，因此它的大小应决定窗体的大小
PanelBKGND.Align :=alNone;
B_selfcreate:=false;
Width:=PanelBKGND.Width+cLeftWidth+cRightWidth;
height:=PanelBKGND.Height+cTopHeight+cBottomHeight-2;
B_selfcreate:=true;
PanelBKGND.Color:=TColor($00CFCFCF);
SetBorderIcons;
if (BorderStyle=bsSizeable)or(BorderStyle=bsSizeToolWin) then //窗体是否允许改变大小
  begin
  SetCanResize(True);
  end
else
  begin
  SetCanResize(False);
  end;
BorderStyle:=bsNone;
if Assigned(Menu) then
  begin
  CoolBar.Visible:=True;
  Menubar.Menu:=Menu;
  Menu:=Nil;
  end
else
  begin
  Coolbar.Visible:=False;
  end;
//FormResize(Sender);
end;

procedure TBaseFrm.FormResize(Sender: TObject);
var
  i:Integer;
begin
if not B_selfcreate then exit;
LabelCaption.Left :=0;
LabelCaption.Top :=8;
LabelCaption.Width :=self.Width ;
ImageTop.Left:=0;
ImageTop.Top:=0;
ImageTop.Width:=ClientWidth;
ImageBottom.Left :=IMAGELEFTBOTTOM.Width-2;
ImageBottom.Width:=ClientWidth;
ImageBottom.Top:=ClientHeight-cBottomHeight;
ImageLeft.Height:=ClientHeight;
ImageRight.Height:=ClientHeight;
ImageRight.Left:=ClientWidth-cRightWidth;
ImageLeftBottom.left:=0;
ImageLeftBottom.Top:=ClientHeight-cBottomHeight;
ImageRightBottom.Top:=ClientHeight-cBottomHeight;
ImageRightBottom.Left:=ClientWidth-cRightWidth;
ImageRightTop.Left:=ClientWidth-cRightTopWidth;
ImageRightTop.top:=0;
ImageLeftTop.Left:=0;
ImageLeftTop.Top:=0;
PanelBKGND.Left:=cLeftWidth;
PanelBKGND.Top:=cTopHeight;
PanelBKGND.Width:=ClientWidth-cLeftWidth-cRightWidth;
PanelBKGND.Height:=ClientHeight-cTopHeight-cBottomHeight+2;
ImageMin.top:=cIconTop;
ImageMax.top:=cIconTop;
ImageNormal.Top:=cIconTop;
ImageClose.top:=cIconTop;
i:=1;
if FzypNeoBorderIcons[1] then
  begin
  ImageClose.Left:=Width-3-i*17-2;
  Inc(i);
  end;
if FzypNeoBorderIcons[2] then
  begin
  ImageMax.Left:=Width-3-i*17-2;
  ImageNormal.Left:=ImageMax.Left;
  Inc(i);
  end;
if FzypNeoBorderIcons[3] then
  begin
  ImageMin.Left:=Width-3-i*17-2;
  end;
MenuBar.Width:=ImageRightTop.Left-MenuBar.Left;
if FzypNeoBorderIcons[2] then
 if WindowState=wsMaximized then
  begin
  ImageNormal.Enabled:=True;
  ImageNormal.Visible:=True;
  ImageMax.Enabled:=False;
  ImageMax.Visible:=False;
  end
 else
  begin
  ImageNormal.Enabled:=False;
  ImageNormal.Visible:=False;
  ImageMax.Enabled:=True;
  Imagemax.Visible:=True;
  end;
end;

procedure TBaseFrm.ImageCloseClick(Sender: TObject);
begin
Close;
end;

procedure TBaseFrm.ImageMinClick(Sender: TObject);
begin
if Application.MainForm=Self then
  Application.Minimize   //Change here!!!
else
  WindowState:=wsMinimized;
end;

procedure TBaseFrm.ImageNormalClick(Sender: TObject);
begin
WindowState:=wsNormal;
end;

procedure TBaseFrm.ImageMaxClick(Sender: TObject);
begin
WindowState:=wsMaximized;
end;

procedure TBaseFrm.ImageTopDblClick(Sender: TObject);
begin
   exit;   //不允许最大化
if WindowState<>wsMaximized then
  WindowState:=wsMaximized
else
  WindowState:=wsNormal;
end;

procedure TBaseFrm.ImageTopMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   //FisDown:=True;
   //GetCursorPos(FOldP);
     OriginalPos.x:=self.Left;         // 记录下原始坐标位置
     OriginalPos.y:=self.Top;
     DownPos.x:=X;                      // 鼠标按下的位置
     DownPos.y:=Y;
     DownPos:=ClientToScreen(DownPos);   // 将客户区坐标转换为屏幕坐标
     if Button = mbLeft then
          MouseLButtonDown:=True;
end;

procedure TBaseFrm.ImageTopMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   //if not FisDown then exit;
   //GetCursorPos(Fp);
   //FDetaX:=Fp.x-Foldp.x;
   //FDetaY:=FP.y-FOldP.y;
   //SetBounds(Left+FDetaX,Top+FDetaY,Width,Height);
   //GetCursorPos(FOldP);
     if MouseLButtonDown then
     begin
          CurrentPos.x:=X;
          CurrentPos.y:=Y;
          CurrentPos:=ClientToScreen(CurrentPos);  // 将客户区坐标转换为屏幕坐标
          // 确定窗体的新位置
          self.Left:=OriginalPos.x+(CurrentPos.x-DownPos.x);
          self.Top :=OriginalPos.y+(CurrentPos.y-DownPos.y);
     end;
end;

procedure TBaseFrm.ImageTopMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   //FisDown:=false;
   MouseLButtonDown:=False;        // 鼠标左键弹起
end;

procedure TBaseFrm.ImageIconDblClick(Sender: TObject);
begin
Close;
end;

procedure TBaseFrm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   if newwidth>=cmaxwidth then
      imagebottom.Stretch :=true
   else
      imagebottom.Stretch :=false;
   imagetop.Stretch :=imagebottom.Stretch ;
   if newheight>=cmaxheight then
      imageleft.Stretch :=true
   else
      imageleft.Stretch :=false;
   imageright.Stretch :=imageleft.Stretch ;
//if NewWidth>=cMaxWidth then NewWidth:=cMaxWidth;
if NewWidth<=cMinWidth then NewWidth:=cMinWidth;
//if NewHeight>=cMaxHeight then NewHeight:=cMaxHeight;
if NewHeight<=cMinHeight then NewHeight:=cMinHeight;
end;

procedure TBaseFrm.FormShow(Sender: TObject);
begin
   LabelCaption.Caption:=Caption;
end;

procedure TBaseFrm.LabelCaptionDblClick(Sender: TObject);
begin
   if Imagemax.Visible then
      Imagemaxclick(sender)
   else if Imagenormal.Visible then
      Imagenormalclick(sender);


end;

end.

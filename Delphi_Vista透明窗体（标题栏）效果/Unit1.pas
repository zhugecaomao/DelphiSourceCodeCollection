unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, XPMan;

const WM_SHOWFRAME = WM_USER+1;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Image2: TImage;
    XPManifest1: TXPManifest;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ShowFrame(var Msg:TMessage); message WM_SHOWFRAME;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
var Wnd: TWndClass;
    Hnd: THandle;
    ComponentForm: TForm;

//Funkcja obs³uguj¹ca zdarzenia pó³przezroczystego okna
function WndNewProc(Wnd: HWND; uMsg: UINT; wPar: WPARAM; lPar: LPARAM): LRESULT; stdcall;
var Rect: TRect;
begin
Result := 0;
case uMsg of
  WM_DESTROY: PostQuitMessage(0);
  WM_LBUTTONDOWN: SendMessage(Wnd, WM_SYSCOMMAND, SC_MOVE+2, 0);
  else
    begin
    if ((uMsg = WM_MOVING) or (uMsg = WM_MOVE)) and GetWindowRect(Wnd, Rect) then
      SetWindowPos(ComponentForm.Handle, 0, Rect.Left, Rect.Top, 0, 0, SWP_NOSIZE);
    Result := DefWindowProc(Wnd, uMsg, wPar, lPar);
    end;
  end;
end;

//Funkcja odmalowuj¹ca pó³przezroczyste okno z uwzglêdnieniem regionu
procedure PaintLayeredWindow(Hnd: THandle; Region: HRGN);
var blend: BLENDFUNCTION;
    P: TPoint;
    S: TSize;
    X, Y: integer;
    bmpRGBA: TBitmap;
    Alpha: byte;
    Linia32: PRGBQuad;
    Linia32RGBA: PRGBQuad;
begin
//Tworzenie warstwy RGB
bmpRGBA := Form1.Image1.Picture.Bitmap;
try
//Sklejenie RGB oraz wygenerowanego A
  with TBitmap.Create() do
    begin
    try
      Width := bmpRGBA.Width;
      Height := bmpRGBA.Height;
      PixelFormat := pf32bit;
      for Y := 0 to Height-1 do
        begin
        Linia32RGBA := bmpRGBA.ScanLine[Y];
        Linia32 := ScanLine[Y];
        for X := 0 to Width-1 do
          begin
          if PtInRegion(Region, X, Y) then
            Alpha := 0
          else
            Alpha := Linia32RGBA.rgbReserved;
          Linia32.rgbRed := MulDiv(Linia32RGBA.rgbRed, Alpha, 255);
          Linia32.rgbGreen := MulDiv(Linia32RGBA.rgbGreen, Alpha, 255);
          Linia32.rgbBlue := MulDiv(Linia32RGBA.rgbBlue, Alpha, 255);
          Linia32.rgbReserved := Alpha;
          inc(Linia32);
          inc(Linia32RGBA);
          end;
        end;

//Nak³adanie bitmapy
      P := Point(0, 0);
      S.cx := bmpRGBA.Width;
      S.cy := bmpRGBA.Height;
      blend.BlendOp := AC_SRC_OVER;
      blend.BlendFlags := 0;
      blend.AlphaFormat := AC_SRC_ALPHA;
      blend.SourceConstantAlpha := 255;
      UpdateLayeredWindow(Hnd, GetDC(0), nil, @S, Canvas.Handle, @P, 0, @blend, ULW_ALPHA);
    finally
      Free;
      end;
    end;
finally
  end;
end;

//Tworzenie regionów, wycinanie okna komponentów i tworzenie okna pó³przezroczystego
procedure CreateLayered(Form: TForm);
var Region: HRGN;
    ComponentRegion: HRGN;
    i:Integer;
const LayeredWndClass = 'LayeredWndClass';
begin
ComponentForm := Form;
ComponentForm.BorderStyle := bsNone;
Region := CreateRectRgn(0, 0, 0, 0);
for i := 0 to ComponentForm.ControlCount-1 do
  if ComponentForm.Controls[i].Visible then
    begin
    ComponentRegion := CreateRectRgn(ComponentForm.Controls[i].Left, ComponentForm.Controls[i].Top, ComponentForm.Controls[i].Width+ComponentForm.Controls[i].Left, ComponentForm.Controls[i].Height+ComponentForm.Controls[i].Top);
    CombineRgn(Region, Region, ComponentRegion, RGN_OR);
    DeleteObject(ComponentRegion);
    end;
with Wnd do
  begin
  lpfnWndProc := @WndNewProc;
  hInstance := hInstance;
  lpszClassName := LayeredWndClass;
  hbrBackground := COLOR_WINDOW;
  end;
Windows.RegisterClass(Wnd);
Hnd := CreateWindowEx(WS_EX_LAYERED, LayeredWndClass, PChar(ComponentForm.Caption), WS_VISIBLE, ComponentForm.Left, ComponentForm.Top, ComponentForm.Width, ComponentForm.Height, ComponentForm.Handle, 0, hInstance, NIL);
PaintLayeredWindow(Hnd, Region);
SetWindowRgn(ComponentForm.Handle, Region, TRUE);
DeleteObject(Region);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
PostMessage(Handle, WM_SHOWFRAME, 0, 0);
end;

procedure TForm1.ShowFrame(var Msg: TMessage);
begin
CreateLayered(self);
end;

end.

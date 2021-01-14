unit TMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TMainForm = class(TForm)
    ScenePanel: TPanel;
    Timer: TTimer;
    MenuPanel: TPanel;
    EndBtnPanel: TPanel;
    EndBtn: TBitBtn;
    LogoPanel: TPanel;
    Logo: TImage;
    BtnPanel: TPanel;
    NewBtn: TBitBtn;
    SetupBtn: TBitBtn;
    HelpBtn: TBitBtn;
    AboutBtn: TBitBtn;
    ContinueBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure EndBtnClick(Sender: TObject);
    procedure ScenePanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ScenePanelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ScenePanelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ScenePanelResize(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure EndBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ContinueBtnClick(Sender: TObject);
    procedure NewBtnClick(Sender: TObject);
    procedure SetupBtnClick(Sender: TObject);
    procedure HelpBtnClick(Sender: TObject);
    procedure AboutBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DC  : HDC;
    HRC : HGLRC;
    angle, mx, my, sx, sy, ax, ay, az : integer;
    MouseStatus : byte;
    Scene : array[ 0..7, 0..10, 0..7 ] of byte;
    SceneFill : array[ 0..10 ] of byte;
    SceneX, SceneY, SceneZ, Speed, Rand : byte;
    SceneStepX, SceneStepY, SceneStepZ : real;
    Blend : boolean;
    Part : array[ 0..3, 0..2 ] of byte;
    RotKub : array[ 0..2 ] of byte;
    PartColor : byte;
    PartPos : byte;
    Pause : boolean;
    Score : LongInt;
    Count : Word;
    procedure InitGL;
    procedure MakeList;
    procedure DrowScene;
    procedure DrowKub( x, y, z : real; c : byte );
    function MoveDown : boolean;
    procedure NewPart;
    procedure Destruct;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses GL, GLU, TSetup, THelp, TAbout;

const Colors : array[ 1..12, 0..3 ] of GLfloat =
  ((1,0,0,0.5),(0,1,0,0.5),(0,0,1,0.5),(1,0,1,0.5),(1,1,0,0.5),(0,1,1,0.5),(1,1,1,0.5),
  (1,0.5,0.5,0.5),(0.5,1,0.5,0.5),(0.5,0.5,1,0.5),(1,0.5,1,0.5),(1,0.5,0.1,0.5));
      NewParts : array[ 1..7, 0..3, 0..2 ] of byte =
  (((2,10,3),(3,10,3),(3,10,4),(4,10,3)),((2,10,3),(3,10,3),(4,10,3),(5,10,3)),
  ((3,10,3),(3,10,4),(4,10,3),(4,10,4)),((3,10,3),(4,10,3),(4,10,4),(5,10,4)),
  ((3,10,3),(4,10,3),(5,10,3),(3,10,4)),((3,9,3),(3,10,3),(3,10,4),(4,10,4)),
  ((3,9,4),(3,10,3),(3,10,4),(4,10,4)));
      LPos : array[ 0..2, 0..3 ] of GLfloat = ((2,0,0,1),(0,2,0,1),(0,0,2,1));
      LColor : array[ 0..2, 0..3 ] of GLfloat = ((1,0,0,0.5),(0,0,1,0.5),(0,1,0,0.5));

//=========================================== InitGL

procedure TMainForm.InitGL;
var nPixelFormat: Integer;
    pfd: TPixelFormatDescriptor;
    gldAspect : GLdouble;
begin
  DC := GetDC( ScenePanel.Handle );

  FillChar( pfd, SizeOf( pfd ), 0);
  with pfd do begin
    nSize     := sizeof(pfd);
    nVersion  := 1;
    dwFlags   := PFD_DRAW_TO_WINDOW or
                 PFD_SUPPORT_OPENGL or
                 PFD_DOUBLEBUFFER;
    iPixelType:= PFD_TYPE_RGBA;
    cColorBits:= 24;
    cDepthBits:= 32;
    iLayerType:= PFD_MAIN_PLANE;
  end;
  nPixelFormat := ChoosePixelFormat( DC, @pfd );
  SetPixelFormat( DC, nPixelFormat, @pfd );
  DescribePixelFormat( DC, nPixelFormat, sizeof( TPixelFormatDescriptor ), pfd );

  HRC := wglCreateContext( DC );
  wglMakeCurrent( DC, HRC );

  glViewport(0, 0, ScenePanel.width, ScenePanel.height);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity;
  gldAspect := ScenePanel.width / ScenePanel.height;
  gluPerspective( 60, gldAspect, 0.01, 20 );
  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();
  glEnable(GL_DEPTH_TEST);
  if Blend then glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
end;

//=========================================== MakeList

procedure TMainForm.MakeList;
var i : Integer;
    r : Real;
begin
  glNewList( 1, GL_COMPILE );
    glColor4f( 1, 1, 1, 0.5 );
    glBegin( GL_LINES );
      for i := 0 to SceneX + 1 do begin
        r := -0.8 + SceneStepX * i;
        glVertex3f( r, -0.7, -0.8 ); glVertex3f( r, -0.7, 0.8 );
        glVertex3f( r, -0.7, -0.8 ); glVertex3f( r, 1.5, -0.8 );
        glVertex3f( r, -0.7,  0.8 ); glVertex3f( r, 1.5,  0.8 );
      end;
      for i := 0 to SceneZ + 1 do begin
        r := -0.8 + SceneStepZ * i;
        glVertex3f( -0.8, -0.7, r ); glVertex3f(  0.8, -0.7, r );
        glVertex3f( -0.8, -0.7, r ); glVertex3f( -0.8,  1.5, r );
        glVertex3f(  0.8, -0.7, r ); glVertex3f(  0.8,  1.5, r );
      end;
      for i := 0 to SceneY do begin
        r := -0.7 + SceneStepY * ( i + 1 );
        glVertex3f( -0.8, r, -0.8 ); glVertex3f( -0.8, r,  0.8 );
        glVertex3f( -0.8, r,  0.8 ); glVertex3f(  0.8, r,  0.8 );
        glVertex3f(  0.8, r,  0.8 ); glVertex3f(  0.8, r, -0.8 );
        glVertex3f(  0.8, r, -0.8 ); glVertex3f( -0.8, r, -0.8 );
      end;
    glEnd;
  glEndList();
end;

//=========================================== DrowScene

procedure TMainForm.DrowScene;
var a, b, c : byte;
begin
   glClear( GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT );
   glPushMatrix();
   glTranslatef( 0, sx/10, sy/10 );
   glRotatef( ax, 1, 0, 0 );
   glRotatef( ay, 0, 1, 0 );
   glRotatef( az, 0, 0, 1 );
   glEnable(GL_BLEND);
   glCallList( 1 );
   for a := 0 to SceneX do for b := 0 to SceneY do for c := 0 to SceneZ do
     if Scene[a,b,c] <> 0 then DrowKub( a, b, c, 0 );
   for a := 0 to 3 do
     DrowKub( Part[ a, 0 ], Part[ a, 1 ], Part[ a, 2 ], PartColor );
   glDisable(GL_BLEND);
   glPopMatrix();
   glFlush();
   SwapBuffers( DC );
end;

//=========================================== DrowKub

procedure TMainForm.DrowKub( x, y, z : real; c : byte );
begin
  if c = 0 then glColor4fv( @colors[ trunc( y ) + 1 ] )
           else glColor4fv( @colors[ c ] );
  x := -0.8 + SceneStepX * x;
  y := -0.7 + SceneStepY * y;
  z := -0.8 + SceneStepZ * z;
  glBegin( GL_QUADS );
    glVertex3f( x, y, z ); glVertex3f( x+SceneStepX, y, z );
    glVertex3f( x+SceneStepX, y+SceneStepY, z ); glVertex3f( x, y+SceneStepY, z );
    glVertex3f( x, y, z ); glVertex3f( x+SceneStepX, y, z );
    glVertex3f( x+SceneStepX, y, z+SceneStepZ ); glVertex3f( x, y, z+SceneStepZ );
    glVertex3f( x, y, z ); glVertex3f( x, y+SceneStepY, z );
    glVertex3f( x, y+SceneStepY, z+SceneStepZ ); glVertex3f( x, y, z+SceneStepZ );
    glVertex3f( x+SceneStepX, y+SceneStepY, z+SceneStepZ );
    glVertex3f( x, y+SceneStepY, z+SceneStepZ );
    glVertex3f( x, y, z+SceneStepZ ); glVertex3f( x+SceneStepX, y, z+SceneStepZ );
    glVertex3f( x+SceneStepX, y+SceneStepY, z+SceneStepZ );
    glVertex3f( x, y+SceneStepY, z+SceneStepZ );
    glVertex3f( x, y+SceneStepY, z ); glVertex3f( x+SceneStepX, y+SceneStepY, z );
    glVertex3f( x+SceneStepX, y+SceneStepY, z+SceneStepZ );
    glVertex3f( x+SceneStepX, y, z+SceneStepZ );
    glVertex3f( x+SceneStepX, y, z ); glVertex3f( x+SceneStepX, y+SceneStepY, z );
  glEnd;
end;

//=========================================== MoveDown

function TMainForm.MoveDown : Boolean;
var i, j : integer;
begin
  MoveDown := false;
  for i := 0 to 3 do
    if ( Part[ i, 1 ] = 0 ) or
       ( Scene[ Part[ i, 0 ], Part[ i, 1 ] - 1, Part[ i, 2 ] ] <> 0 ) then begin
      for j := 0 to 3 do begin
        Scene[ Part[ j, 0 ], Part[ j, 1 ], Part[ j, 2 ] ] := PartColor;
        Dec( SceneFill[ Part[ j, 1 ] ] );
      end;
      Destruct;
      NewPart;
      Exit;
    end;
  for i := 0 to 3 do Dec( Part[ i, 1 ] );
  Dec( RotKub[ 1 ] );
  MoveDown := true;
end;

//=========================================== NewPart

procedure TMainForm.NewPart;
var i : integer;
begin
  Inc( Count );
  if ( Count mod 50 = 0 ) and ( Speed < Count div 50 ) and ( Speed < 10 ) then
    Speed := Count div 50;
  Timer.Interval := 2000 div Speed;
  Inc( Score, 4 * Speed );
  Caption := 'GniLTris         ' + IntToStr( Score );
  PartColor := Random( 7 ) + 1;
  for i := 0 to 3 do begin
    Part[ i, 0 ] := NewParts[ PartColor, i, 0 ] + SceneX - 5;
    Part[ i, 1 ] := NewParts[ PartColor, i, 1 ] + SceneY - 10;
    Part[ i, 2 ] := NewParts[ PartColor, i, 2 ] + SceneZ - 5;
    if Scene[ Part[ i, 0 ], Part[ i, 1 ], Part[ i, 2 ] ] > 0 then begin
      Pause := true;
      if MessageDlg( 'Game Over' + #13#10 + #13#10 + 'Score - ' + IntToStr( Score )
                     + #13#10 + #13#10 + 'Play again?', mtConfirmation,
                     [ mbYes, mbNo ], 0 ) = mrYes then begin
        Pause := false;
        NewBtnClick( nil );
      end else
        Close;
      Pause := false;
    end;
  end;
  RotKub[ 0 ] := SceneX - 4;
  RotKub[ 1 ] := SceneY - 3;
  RotKub[ 2 ] := SceneZ - 4;
end;

//=========================================== Destruct

procedure TMainForm.Destruct;
var i, j, l, n : integer;
    k : real;
begin
  j := 0;
  for i := 0 to SceneY do if SceneFill[ i ] = 0 then Inc( j );
  case j of
    2 : j := 3;
    3 : j := 5;
    4 : j := 7;
  end;
  Inc( Score, SceneX * SceneZ * Speed * j ); 
  Caption := 'GniLTris         ' + IntToStr( Score );
  k := 0.9;
  while k > 0 do begin
    for i := 0 to SceneY do
      if SceneFill[ i ] = 0 then Colors[ i + 1, 3 ] := k;
    k := k - 0.05;
    DrowScene;
  end;
  for n := SceneY downto 0 do if SceneFill[ n ] = 0 then begin
    Colors[ n + 1, 3 ] := 0.5;
    for i := 0 to SceneX do for j := 0 to SceneZ do for l := n to SceneZ - 1 do
      Scene[ i, l, j ] := Scene[ i, l + 1, j ];
    for i := 0 to SceneX do for j := 0 to SceneZ do Scene[ i, 10, j ] := 0;
    for i := n to SceneY - 1 do SceneFill[ i ] := SceneFill[ i + 1 ];
    SceneFill[ SceneZ ] := ( SceneX + 1 ) * ( SceneZ + 1 );
  end;
end;

//=========================================== FormCreate

procedure TMainForm.FormCreate(Sender: TObject);
var f : file of byte;
    b : byte;
begin
  sx := -5;
  sy := -30;
  ax := 70;
  ay := -120;
  az := 0;
  angle := 10;
  AssignFile( f, Copy( ParamStr( 0 ), 1, Length( ParamStr( 0 ) ) - 3 ) + 'cfg' );
  {$I-}
    Reset( f );
  {$I+}
  if IOResult <> 0 then begin
    SceneX := 7;
    SceneY := 10;
    SceneZ := 7;
    Speed := 1;
    Rand := 0;
    Blend := true;
  end else begin
    Read( f, b ); SceneX := b - 1;
    Read( f, b ); SceneY := b - 1;
    Read( f, b ); SceneZ := b - 1;
    Read( f, b ); Speed := b;
    Read( f, b ); Rand := b;
    Read( f, b ); Blend := b > 0;
    CloseFile( f );
  end;

  Timer.Interval := 2000 div Speed;
  SceneStepX := 1.6 / ( SceneX + 1 );
  SceneStepY := 2.2 / ( SceneY + 1 );
  SceneStepZ := 1.6 / ( SceneZ + 1 );
  MouseStatus := 0;
  Pause := false;

  InitGL;
  MakeList;
  Randomize;
  NewBtnClick( Sender );
  NewPart;
end;

//=========================================== EndBtnClick

procedure TMainForm.EndBtnClick(Sender: TObject);
begin
  Close;
end;

//=========================================== ScenePanelMouseDown

procedure TMainForm.ScenePanelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then Inc( MouseStatus );
  if Button = mbRight then Inc( MouseStatus, 2 );
  mx := x;
  my := y;
end;

//=========================================== ScenePanelMouseMove

procedure TMainForm.ScenePanelMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if MouseStatus = 0 then Exit;
  if MouseStatus and 1 <> 0 then begin
    Inc( ay, mx-x );
    Inc( ax, my-y );
  end;
  if MouseStatus and 2 <> 0 then begin
    Inc( az, mx-x );
    Inc( sy, my-y );
    if sy < -150 then sy := -150;
    if sy > 0 then sy := 0;
  end;
  mx := x;
  my := y;
  DrowScene;
end;

//=========================================== ScenePanelMouseUp

procedure TMainForm.ScenePanelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then MouseStatus := MouseStatus and 2;
  if Button = mbRight then MouseStatus := MouseStatus and 1;
end;

//=========================================== ScenePanelResize

procedure TMainForm.ScenePanelResize(Sender: TObject);
var gldAspect : glDouble;
begin
  glViewport(0, 0, ScenePanel.width, ScenePanel.height);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity;
  gldAspect := ScenePanel.width / ScenePanel.height;
  gluPerspective( 60, gldAspect, 0.01, 20 );
end;

//=========================================== TimerTime

procedure TMainForm.TimerTimer(Sender: TObject);
begin
  if not Pause then if not MoveDown then Exit;
  DrowScene;
end;

//=========================================== EndBtnClick

procedure TMainForm.EndBtn2Click(Sender: TObject);
begin
  Close;
end;

//=========================================== FormKeyDown

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : integer;
    PartTmp : array[0..3,0..2] of byte;

    //=========================================== CheckPart

    function CheckPart : boolean;
    var i : integer;
    begin
      CheckPart := false;
      for i := 0 to 3 do
        if ( PartTmp[ i, 0 ] < 0 ) or ( PartTmp[ i, 0 ] > SceneX ) or
           ( PartTmp[ i, 1 ] < 0 ) or ( PartTmp[ i, 1 ] > SceneY ) or
           ( PartTmp[ i, 2 ] < 0 ) or ( PartTmp[ i, 2 ] > SceneZ ) or
           ( Scene[ PartTmp[ i, 0 ], PartTmp[ i, 1 ], PartTmp[ i, 2 ] ] > 0 )
        then Exit;
      CheckPart := true;
    end;

    //=========================================== MovePart

    procedure MovePart( Direction : boolean );
    var i, j : integer;
    begin
      if Direction then
        for i := 0 to 3 do for j := 0 to 2 do
          Part[ i, j ] := PartTmp[ i, j ]
      else
        for i := 0 to 3 do for j := 0 to 2 do
          PartTmp[ i, j ] := Part[ i, j ];
    end;

    //=========================================== FormKeyDown

begin
  if Pause then Exit;
  case Key of
    38 : begin // UP
      MovePart( false );
      for i := 0 to 3 do Dec( PartTmp[ i, 0 ] );
      if CheckPart then begin
        MovePart( true );
        Dec( RotKub[ 0 ] );
      end;
    end;
    40 : begin // DOWN
      MovePart( false );
      for i := 0 to 3 do Inc( PartTmp[ i, 0 ] );
      if CheckPart then begin
        MovePart( true );
        Inc( RotKub[ 0 ] );
      end;
    end;
    39 : begin //RIGHT
      MovePart( false );
      for i := 0 to 3 do Dec( PartTmp[ i, 2 ] );
      if CheckPart then begin
        MovePart( true );
        Dec( RotKub[ 2 ] );
      end;
    end;
    37 : begin //LEFT
      MovePart( false );
      for i := 0 to 3 do Inc( PartTmp[ i, 2 ] );
      if CheckPart then begin
        MovePart( true );
        Inc( RotKub[ 2 ] );
      end;
    end;
    32 : while MoveDown do begin
      Inc( Score, Speed );
      Caption := 'GniLTris         ' + IntToStr( Score );
      DrowScene;
    end;
    27 : begin //MENU
      Pause := true;
      MenuPanel.Visible := true;
      DrowScene;
    end;
    65 : begin // A - RotY+
      for i := 0 to 3 do begin
        PartTmp[ i, 0 ] := 5 - Part[ i, 2 ] + RotKub[ 2 ] + RotKub[ 0 ];
        PartTmp[ i, 1 ] := Part[ i, 1 ];
        PartTmp[ i, 2 ] := Part[ i, 0 ] - RotKub[ 0 ] + RotKub[ 2 ];
      end;
      if CheckPart then MovePart( true );
    end;
    90 : begin // Z - RotY-
      for i := 0 to 3 do begin
        PartTmp[ i, 0 ] := Part[ i, 2 ] - RotKub[ 2 ] + RotKub[ 0 ];
        PartTmp[ i, 1 ] := Part[ i, 1 ];
        PartTmp[ i, 2 ] := 5 - Part[ i, 0 ] + RotKub[ 0 ] + RotKub[ 2 ];
      end;
      if CheckPart then MovePart( true );
    end;
    83 : begin // S - RotX+
      for i := 0 to 3 do begin
        PartTmp[ i, 0 ] := Part[ i, 0 ];
        PartTmp[ i, 1 ] := 5 - Part[ i, 2 ] + RotKub[ 2 ] + RotKub[ 1 ];
        PartTmp[ i, 2 ] := Part[ i, 1 ] - RotKub[ 1 ] + RotKub[ 2 ];
      end;
      if CheckPart then MovePart( true );
    end;
    88 : begin // X - RotX-
      for i := 0 to 3 do begin
        PartTmp[ i, 0 ] := Part[ i, 0 ];
        PartTmp[ i, 1 ] := Part[ i, 2 ] - RotKub[ 2 ] + RotKub[ 1 ];
        PartTmp[ i, 2 ] := 5 - Part[ i, 1 ] + RotKub[ 1 ] + RotKub[ 2 ];
      end;
      if CheckPart then MovePart( true );
    end;
    68 : begin // D - RotZ+
      for i := 0 to 3 do begin
        PartTmp[ i, 0 ] := Part[ i, 1 ] - RotKub[ 1 ] + RotKub[ 0 ];
        PartTmp[ i, 1 ] := 5 - Part[ i, 0 ] + RotKub[ 0 ] + RotKub[ 1 ];
        PartTmp[ i, 2 ] := Part[ i, 2 ];
      end;
      if CheckPart then MovePart( true );
    end;
    67 : begin // C - RotZ-
      for i := 0 to 3 do begin
        PartTmp[ i, 0 ] := 5 - Part[ i, 1 ] + RotKub[ 1 ] + RotKub[ 0 ];
        PartTmp[ i, 1 ] := Part[ i, 0 ] - RotKub[ 0 ] + RotKub[ 1 ];
        PartTmp[ i, 2 ] := Part[ i, 2 ];
      end;
      if CheckPart then MovePart( true );
    end;
  end;
  DrowScene;
end;

//=========================================== ContinueBtnClick

procedure TMainForm.ContinueBtnClick(Sender: TObject);
begin
  Pause := false;
  MenuPanel.Visible := false;
  DrowScene;
end;

//=========================================== NewBtnClick

procedure TMainForm.NewBtnClick(Sender: TObject);
var i, j, k : byte;
begin
  Score := 0;
  Caption := 'GniLTris         ' + IntToStr( Score );
  Count := 0;
  for i := 0 to SceneY do SceneFill[ i ] := ( SceneX + 1 ) * ( SceneZ + 1 );
  if Rand > 0 then
    for i := 0 to SceneX do for j := 0 to Rand - 1 do for k := 0 to SceneZ do begin
      Scene[ i, j, k ] := Random( 3 );
      if Scene[ i, j, k ] <> 0 then begin
        Dec( SceneFill[ j ] );
        Inc( Score, Speed*SceneY );
      end;
    end;
  for i := 0 to SceneX do for j := Rand to SceneY do for k := 0 to SceneZ do
    Scene[ i, j, k ] := 0;
end;

//=========================================== SetupBtnClick

procedure TMainForm.SetupBtnClick(Sender: TObject);
begin
  try
    GLTrisSetup := TGLTrisSetup.Create( MainForm );
    with GLTrisSetup do
      if Execute then begin
        SceneX := SpinX.Value - 1;
        SceneY := SpinY.Value - 1;
        SceneZ := SpinZ.Value - 1;
        Speed := SpinS.Value;
        Rand := SpinR.Value;
        SceneStepX := 1.6 / ( SceneX + 1 );
        SceneStepY := 2.2 / ( SceneY + 1 );
        SceneStepZ := 1.6 / ( SceneZ + 1 );
        Timer.Interval := 2000 div Speed;
        Blend := Graphic.ItemIndex = 1;
        InitGL;
        MakeList;
        NewBtnClick( Sender );
        NewPart;
      end;
  finally
    GLTrisSetup.Free;
  end;
  DrowScene;
end;

//=========================================== HelpBtnClick

procedure TMainForm.HelpBtnClick(Sender: TObject);
begin
  try
    GLTrisHelp := TGLTrisHelp.Create( MainForm );
    GLTrisHelp.ShowModal;
  finally
    GLTrisHelp.Free;
  end;
  DrowScene;
end;

//=========================================== AboutBtnClick

procedure TMainForm.AboutBtnClick(Sender: TObject);
begin
  try
    GLTrisAbout := TGLTrisAbout.Create( MainForm );
    GLTrisAbout.ShowModal;
  finally
    GLTrisAbout.Free;
  end;
  DrowScene;
end;

//=========================================== TheStoryEnd :)

end.


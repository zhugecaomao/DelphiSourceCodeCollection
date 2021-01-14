unit FrmPitPw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ToolWin, Menus, ExtCtrls, ImgList, ActnList,
  StdCtrls, Printers;

type
  TPitPw = class(TForm)
    ScrollBox1: TScrollBox;
    sbarMain: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    Panel1: TPanel;
    PageEdit: TEdit;
    PageLabel: TPanel;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    Panel3: TPanel;
    ZoomEdit: TEdit;
    Panel2: TPanel;
    ToolButton9: TToolButton;
    ToolButton15: TToolButton;
    ilstActions: TImageList;
    dlogOpen: TOpenDialog;
    dlogSave: TSaveDialog;
    PreviewTimer: TTimer;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    SaveAs1: TMenuItem;
    Print1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Page1: TMenuItem;
    First1: TMenuItem;
    Previous1: TMenuItem;
    Next1: TMenuItem;
    Last1: TMenuItem;
    N2: TMenuItem;
    GotoPage1: TMenuItem;
    Zoom1: TMenuItem;
    In1: TMenuItem;
    Out1: TMenuItem;
    N3: TMenuItem;
    Page2: TMenuItem;
    PageWidth1: TMenuItem;
    PopupMenu1: TPopupMenu;
    In2: TMenuItem;
    Out2: TMenuItem;
    Image1: TImage;
    PrintDialog1: TPrintDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    procedure PrintFP01;
    
  public
    
  end;

var
  PitPw: TPitPw;

implementation

uses
  FrmCustom, FrmMain;

{$R *.dfm}

procedure TPitPw.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPitPw.ToolButton2Click(Sender: TObject);
begin
  if dlogSave.Execute then
  begin
    if dlogSave.FileName<>'' then
    begin
      Image1.Picture.SaveToFile(dlogSave.FileName);
    end;
  end;
end;

procedure TPitPw.ToolButton1Click(Sender: TObject);
begin
  if dlogOpen.Execute then
  begin
    if dlogOpen.FileName<>'' then
    begin
      Image1.Canvas.Brush.Style:=bsClear;
      Image1.Picture.LoadFromFile(dlogOpen.FileName);
    end;
  end;
end;

procedure TPitPw.SaveAs1Click(Sender: TObject);
begin
  ToolButton2.Click;
end;

procedure TPitPw.ToolButton15Click(Sender: TObject);
begin
  Close;
end;

procedure TPitPw.ToolButton11Click(Sender: TObject);
var
  ScaleX,ScaleY :Integer;
  R :TRect;
begin
  if Printer.Printers.Count=0 then
  begin
    ShowMessage('请首先安装打印机');
    Exit;          
  end;
  if not dlogOpen.Execute then Exit
  else
  begin
    with Printer do
    begin
      BeginDoc;
      ScaleX :=GetDeviceCaps(Handle,LogPixelsX) div PixelsPerInch;
      ScaleY :=GetDeviceCaps(Handle,LogPixelsY) div PixelsPerInch;
      R :=Rect(0,0,Image1.Width*ScaleX,Image1.Height*ScaleY);
      Canvas.StretchDraw(R,Image1.Picture.Graphic);
      EndDoc;
    end;
  end;
end;


procedure TPitPw.PrintFP01;
var
  CurrentIndex: Integer;
  aTmpFont: TFont;
  DrawMoneyCp,DrawMoney, DrawOne: string;
  i, j, THeight, TWidth: Integer;
begin
  Printer.Orientation:=poPortrait;
  with Printer do
  begin
    THeight := Canvas.TextHeight('1');
    aTmpFont := Canvas.Font;
    with Canvas do
    begin
      TextOut(500, 20, BKString);
      Font.Size := 14;
      Font.Name := '宋体';
      Font.Style := [fsBold];
      TextOut(250, 20, '租 赁 业 发 票');
      Font.Size := 10;
      Font.Name := '宋体';
      Font.Color := $004080FF;
      Font.Style := Font.Style - [fsBold];
    



























    
      MoveTo(20, 100); LineTo(650, 100); 
      MoveTo(20, 100); LineTo(20, 290); 
      MoveTo(650, 100); LineTo(650, 290); 
      MoveTo(20, 160); LineTo(650, 160);
      MoveTo(110, 120); LineTo(300, 120);
      MoveTo(110, 140); LineTo(260, 140);
      MoveTo(430, 120); LineTo(650, 120);

      MoveTo(110, 100); LineTo(110, 270);
      MoveTo(185, 120); LineTo(185, 220);
      MoveTo(260, 120); LineTo(260, 220);
      MoveTo(300, 100); LineTo(300, 220);
      MoveTo(340, 100); LineTo(340, 220);
      MoveTo(380, 100); LineTo(380, 220);
      MoveTo(430, 100); LineTo(430, 220);

      MoveTo(20, 240); LineTo(650, 240);
      MoveTo(20, 270); LineTo(650, 270);
      MoveTo(20, 290); LineTo(650, 290);

      MoveTo(160, 270); LineTo(160, 290);
      MoveTo(280, 270); LineTo(280, 290);
      MoveTo(410, 270); LineTo(410, 290);
      MoveTo(530, 270); LineTo(530, 290);

      for i := 1 to 3 do
      begin
        MoveTo(20, 160 + i * 20); LineTo(650, 160 + i * 20);
      end;
























     
















































    end;
  end;
end;
procedure TPitPw.ToolButton3Click(Sender: TObject);
var
  ScaleX,ScaleY :Integer;
  R :TRect;
begin
  Application.MessageBox('你不能使用打印 ！', '贝壳提示', MB_OK + MB_ICONSTOP 
    + MB_DEFBUTTON3 + MB_TOPMOST);









end;

procedure TPitPw.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.

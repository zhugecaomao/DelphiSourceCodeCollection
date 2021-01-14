unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, XPMan, ImgList, StdCtrls, Menus, ExtCtrls;

type
  TForm1 = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    HeaderControl1: THeaderControl;
    Memo1: TMemo;
    Memo2: TMemo;
    PopupMenu1: TPopupMenu;
    O: TMenuItem;
    F: TMenuItem;
    S: TMenuItem;
    ToolButton4: TToolButton;
    Timer1: TTimer;
    procedure HeaderControl1SectionResize(HeaderControl: THeaderControl;
      Section: THeaderSection);
    procedure OClick(Sender: TObject);
    procedure SClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure StatusBar1Resize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.HeaderControl1SectionResize(HeaderControl: THeaderControl;
  Section: THeaderSection);
begin
Memo1.Width :=HeaderControl1.Sections[0].Width;
HeaderControl1.Sections[1].Width:=HeaderControl1.Width-HeaderControl1.Sections[0].Width;

end;

procedure TForm1.OClick(Sender: TObject);
begin
ToolButton1.ImageIndex :=3;
ToolButton1.Hint:='打开';
ShowMessage('打开');
end;

procedure TForm1.SClick(Sender: TObject);
begin
ToolButton1.ImageIndex :=4;
ToolButton1.Hint:='保存';
ShowMessage('保存');
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
Case ToolButton1.ImageIndex of
  3:O.Click;
  4:S.Click;
end;
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
ShowMessage('关于');
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
ShowMessage('查找');
end;

procedure TForm1.StatusBar1Resize(Sender: TObject);
begin
StatusBar1.Panels[2].Width:=120;
StatusBar1.Panels[1].Width:=120;
StatusBar1.Panels[0].Width:=StatusBar1.Width-240;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
StatusBar1.Panels[2].Text:=VarToStr(Time);
StatusBar1.Panels[1].Text:=VarToStr(Date);

end;

end.

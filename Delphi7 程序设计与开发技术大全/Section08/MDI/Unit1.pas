unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus ,Unit2, StdCtrls;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    FileM: TMenuItem;
    O1: TMenuItem;
    O2: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    N1: TMenuItem;
    X1: TMenuItem;
    WindowM: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    HelpM: TMenuItem;
    A2: TMenuItem;
    procedure CreateMDIChild(const Name: string);
    procedure O1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
procedure TMainForm.CreateMDIChild(const Name: string);
var
  Child: TChildForm;
begin
  Child := TChildForm.Create(Application);
  Child.Caption := Name;
  if FileExists(Name) then Child.Memo1.Lines.LoadFromFile(Name);
end;

procedure TMainForm.O1Click(Sender: TObject);
begin
  CreateMDIChild('NoName' + IntToStr(MDIChildCount + 1));
end;

//最大化
procedure TMainForm.N3Click(Sender: TObject);
var
  I:Integer;
begin
  for I:=0 to MDIChildCount-1 do
    MDIChildren[I].WindowState:=wsMaximized;
end;

//最小化
procedure TMainForm.N4Click(Sender: TObject);
var
  I:Integer;
begin
  for I:=0 to MDIChildCount-1 do
    MDIChildren[I].WindowState:=wsMinimized;
end;

//还原
procedure TMainForm.N5Click(Sender: TObject);
var
  I:Integer;
begin
  for I:=0 to MDIChildCount-1 do
    MDIChildren[I].WindowState:=wsNormal;
end;

end.

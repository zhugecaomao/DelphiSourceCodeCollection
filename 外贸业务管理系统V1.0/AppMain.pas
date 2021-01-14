unit AppMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TAppMain_frm = class(TForm)
    Button1: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AppMain_frm: TAppMain_frm;

implementation

uses TabInfo, TabInfoStyle, TabInfoEdit;

{$R *.dfm}

procedure TAppMain_frm.N2Click(Sender: TObject);
begin
  application.CreateForm(TTabInfo_frm, TabInfo_frm);
  TabInfo_frm.ShowModal;
  TabInfo_frm.Free;
end;

procedure TAppMain_frm.N3Click(Sender: TObject);
begin
  application.CreateForm(TTabInfoStyle_frm, TabInfoStyle_frm);
  TabInfoStyle_frm.ShowModal;
  TabInfoStyle_frm.Free;

end;

procedure TAppMain_frm.N4Click(Sender: TObject);
begin
  application.CreateForm(TTabInfoEdit_frm, TabInfoEdit_frm);
  TabInfoEdit_frm.ShowModal;
  TabInfoEdit_frm.Free;

end;

end.

unit main;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMenu, Menus, ImgList, ExtCtrls;
type
  Tfrmmain = class(TForm)
    MainMenu1: TMainMenu;
    XPMenu1: TXPMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ImageList1: TImageList;
    N3: TMenuItem;
    Panel1: TPanel;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmmain: Tfrmmain;
implementation
uses shuju, luru, chaxun;
{$R *.dfm}

procedure Tfrmmain.N2Click(Sender: TObject);
begin
   application.CreateForm(tlurufrm,lurufrm);
   lurufrm.ShowModal;
   lurufrm.Free;
end;
procedure Tfrmmain.N4Click(Sender: TObject);
begin
    close;
end;
procedure Tfrmmain.N6Click(Sender: TObject);
begin
       application.CreateForm(tfrmchaxun,frmchaxun);
       frmchaxun.ShowModal;
       frmchaxun.Free;
end;
end.

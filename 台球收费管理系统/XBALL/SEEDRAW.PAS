unit SeeDraw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus;

type
  TSeeForm = class(TForm)
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeeForm: TSeeForm;

implementation

{$R *.DFM}

procedure TSeeForm.FormCreate(Sender: TObject);
begin
  image1.Align := AlClient;
end;

procedure TSeeForm.Image1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TSeeForm.N1Click(Sender: TObject);
begin
  N1.Checked := not N1.Checked;
  if N1.Checked then
  begin
    BorderStyle := BSNone;
    WindowState := wsMaximized;
  end
  else
  begin
    WindowState := wsNormal;
    BorderStyle := BSSizeAble;
  end;
end;

procedure TSeeForm.N3Click(Sender: TObject);
begin
  Close;
end;

procedure TSeeForm.FormResize(Sender: TObject);
var W, X, Y, Z: Word;
begin
  if N4.Checked then Exit;
  if WindowState <> wsNormal then Exit;
  X := Image1.Picture.Width;
  Y := Image1.Picture.Height;
  if X > Y then Z := X else Z := Y;
  if Height > Width then W := Height else W := Width;
  Height := W * Y div Z;
  Width := W * X div Z;
  Image1.Update;
end;

procedure TSeeForm.N4Click(Sender: TObject);
begin
  N4.Checked := not N4.Checked;
end;

end.

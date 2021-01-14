unit C_Preview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, ExtCtrls, FR_View, Menus;

type
  TPreviewForm = class(TForm)
    ImageList1: TImageList;
    Panel1: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnFirst: TToolButton;
    btnPrev: TToolButton;
    btnNext: TToolButton;
    btnLast: TToolButton;
    ToolButton3: TToolButton;
    btnPrint: TToolButton;
    btnClose: TToolButton;
    frPreview1: TfrPreview;
    btnScale: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N1001: TMenuItem;
    N751: TMenuItem;
    N1002: TMenuItem;
    N1501: TMenuItem;
    N2001: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ToolButton1: TToolButton;
    btnLoadFile: TToolButton;
    btnSaveFile: TToolButton;
    ToolButton2: TToolButton;
    procedure OnClose(Sender: TObject);
    procedure OnFirst(Sender: TObject);
    procedure OnPrev(Sender: TObject);
    procedure OnNext(Sender: TObject);
    procedure OnLast(Sender: TObject);
    procedure OnPrint(Sender: TObject);
    procedure OnScale(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OnLoadFile(Sender: TObject);
    procedure OnSaveFile(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreviewForm: TPreviewForm;

implementation

{$R *.dfm}

procedure TPreviewForm.OnClose(Sender: TObject);
begin
  Close;
end;

procedure TPreviewForm.OnFirst(Sender: TObject);
begin
  frPreview1.First;
end;

procedure TPreviewForm.OnPrev(Sender: TObject);
begin
  frPreview1.Prev;
end;

procedure TPreviewForm.OnNext(Sender: TObject);
begin
  frPreview1.Next;
end;

procedure TPreviewForm.OnLast(Sender: TObject);
begin
  frPreview1.Last;
end;

procedure TPreviewForm.OnPrint(Sender: TObject);
begin
  frPreview1.Print;
end;

procedure TPreviewForm.OnScale(Sender: TObject);
begin
  btnScale.Caption := (Sender as TMenuItem).Caption;
  case (Sender as TMenuItem).Tag of
    1 : frPreview1.PageWidth;
    2 : frPreview1.Zoom := 50;
    3 : frPreview1.Zoom := 75;
    4 : frPreview1.Zoom := 100;
    5 : frPreview1.Zoom := 150;
    6 : frPreview1.Zoom := 200;
    7 : frPreview1.OnePage;
    8 : frPreview1.TwoPages;
  end;
end;

procedure TPreviewForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  frPreview1.Window.FormKeyDown(Sender, Key, Shift);
end;

procedure TPreviewForm.OnLoadFile(Sender: TObject);
begin
  frPreview1.LoadFromFile;
end;

procedure TPreviewForm.OnSaveFile(Sender: TObject);
begin
  frPreview1.SaveToFile;
end;

end.

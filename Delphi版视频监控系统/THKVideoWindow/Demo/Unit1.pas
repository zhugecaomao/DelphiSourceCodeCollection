unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, HKVideoWindow, Menus, ExtCtrls;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    GroupBox2: TGroupBox;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    LabeledEdit1: TLabeledEdit;
    Panel2: TPanel;
    HKVideoWindow1: THKVideoWindow;
    GroupBox3: TGroupBox;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure HKVideoWindow1Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  HKVideoWindow1.PaneStyle := Pane1;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  HKVideoWindow1.PaneStyle := Pane4;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
  HKVideoWindow1.PaneStyle := Pane9;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
  HKVideoWindow1.PaneStyle := Pane16;
end;

procedure TForm1.RadioButton5Click(Sender: TObject);
begin
  HKVideoWindow1.PaneStyle := Pane25;
end;

procedure TForm1.RadioButton6Click(Sender: TObject);
begin
  HKVideoWindow1.PaneStyle := Pane36;
end;

procedure TForm1.RadioButton7Click(Sender: TObject);
begin
  HKVideoWindow1.PaneStyle := Pane49;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  Self.BorderStyle := bsNone;
  Self.WindowState := wsMaximized;
  Panel1.Visible := False;

  HKVideoWindow1.VideoWinStyle := FullScreen;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Self.BorderStyle := bsSizeable;
  Self.WindowState := wsNormal;
  Self.Width := 790;
  Self.Height := 560;
  Panel1.Visible := True;

  HKVideoWindow1.VideoWinStyle := Normal;
end;

procedure TForm1.RadioButton8Click(Sender: TObject);
begin
  HKVideoWindow1.CanDrawRect := True;
  PopupMenu1.AutoPopup := False;
end;

procedure TForm1.RadioButton9Click(Sender: TObject);
begin
  HKVideoWindow1.CanDrawRect := False;
  PopupMenu1.AutoPopup := True;
end;

procedure TForm1.HKVideoWindow1Click(Sender: TObject);
var
  R: TRect;
  Sel: Integer;
begin
  Sel := HKVideoWindow1.Selected;
  LabeledEdit1.Text := IntToStr(Sel);
  R := HKVideoWindow1.Pane[Sel];

  LabeledEdit2.Text := IntToStr(R.Left);
  LabeledEdit3.Text := IntToStr(R.Top);
  LabeledEdit4.Text := IntToStr(R.Right);
  LabeledEdit5.Text := IntToStr(R.Bottom);
end;

end.

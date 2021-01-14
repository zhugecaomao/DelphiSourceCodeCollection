unit Mains;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TfrmMains = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Splitter1: TSplitter;
    SpeedButton2: TSpeedButton;
    Memo2: TMemo;
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMains: TfrmMains;

implementation

{$R *.DFM}

procedure TfrmMains.CheckBox1Click(Sender: TObject);
begin
  if self.CheckBox1.Checked then
    self.FormStyle := fsStayOnTop
  else
    self.FormStyle := fsNormal;
end;

procedure TfrmMains.SpeedButton1Click(Sender: TObject);
begin
  self.Memo1.Lines.Clear;
end;

procedure TfrmMains.SpeedButton2Click(Sender: TObject);
begin
  Panel2.Visible := not Panel2.Visible;
end;

end.


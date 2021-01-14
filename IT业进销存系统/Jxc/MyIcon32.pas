unit MyIcon32;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, menus;

type
  TfraMyIcon32 = class(TFrame)
    Image1: TImage;
    Label1: TLabel;
    Shape1: TShape;
    procedure FrameMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FrameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Main;

{$R *.DFM}

procedure TfraMyIcon32.FrameMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Label1.Font.Color := clBlue;
  Shape1.Brush.Color := $00FFBFBF;
  Shape1.Pen.Color := $00FFBFBF;
end;

procedure TfraMyIcon32.FrameClick(Sender: TObject);
var
  c: TComponent;
  s: string;
begin
  if (Sender is TLabel) or (Sender is TImage) then
    s := self.Hint;
  c := frmMain.FindComponent(s);
  if (c <> nil) and (c is TMenuItem) and TMenuItem(c).Visible then
    TMenuItem(c).Click;
end;

end.

unit MyLabel;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, menus;

type
  TfraMyLabel = class(TFrame)
    Label1: TLabel;
    Shape1: TShape;
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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

procedure TfraMyLabel.Label1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Label1.Font.Color := clBlue;
  Shape1.Brush.Color := clRed;
end;

procedure TfraMyLabel.FrameMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Label1.Font.Color := clNavy;
  Shape1.Brush.Color := clLime;
end;

procedure TfraMyLabel.FrameClick(Sender: TObject);
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

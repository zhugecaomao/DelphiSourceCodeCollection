unit fm_icon;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls,menus;

type
  TFrame1 = class(TFrame)
    Label1: TLabel;
    Image1: TImage;
    procedure FrameClick(Sender: TObject);
    procedure FrameMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Main, func;

{$R *.dfm}

procedure TFrame1.FrameClick(Sender: TObject);
var
  c: TComponent;
  s: string;
begin
  if (Sender is TLabel) or (Sender is TImage) or(Sender is TFrame)then
    s := 'n'+self.Hint;
    //if loginlock[strtoint(self.Hint)]=0 then exit;
  c := frm_main.FindComponent(s);
  if (c <> nil) and (c is TMenuItem) then
    TMenuItem(c).Click;
end;

procedure TFrame1.FrameMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  self.Color:=$00FFBFBF;
  self.Label1.Font.Color:=clBlue;
end;

end.

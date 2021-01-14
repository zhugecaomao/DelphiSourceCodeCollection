unit Icon32;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfraIcon32 = class(TFrame)
    Image1: TImage;
    Label1: TLabel;
    Shape1: TShape;
    procedure FrameMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TfraIcon32.FrameMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Label1.Font.Color := clBlue;
  Shape1.Visible := True;
end;

end.

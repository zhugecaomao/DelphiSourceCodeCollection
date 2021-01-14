unit QtkcbdlxEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TfrmQtkcbdlxEdit = class(TfrmComEdit)
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQtkcbdlxEdit: TfrmQtkcbdlxEdit;

implementation

uses dm;
{$R *.DFM}

procedure TfrmQtkcbdlxEdit.FormShow(Sender: TObject);
begin
  blnSetID := True;
  strKeyFields := 'MC';
  inherited;
end;

end.

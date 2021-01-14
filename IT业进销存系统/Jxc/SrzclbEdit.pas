unit SrzclbEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TfrmSrzclbEdit = class(TfrmComEdit)
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSrzclbEdit: TfrmSrzclbEdit;

implementation

uses dm;
{$R *.DFM}

procedure TfrmSrzclbEdit.FormShow(Sender: TObject);
begin
  blnSetID := True;
  strKeyFields := 'BH; MC';
  inherited;
end;

end.

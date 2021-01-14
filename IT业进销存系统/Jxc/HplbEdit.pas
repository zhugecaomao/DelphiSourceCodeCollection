unit HplbEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TfrmHplbEdit = class(TfrmComEdit)
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure FormShow(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHplbEdit: TfrmHplbEdit;

implementation

uses dm;
{$R *.DFM}

procedure TfrmHplbEdit.FormShow(Sender: TObject);
begin
  blnSetID := True;
  strKeyFields := 'MC';
  inherited;
end;

end.

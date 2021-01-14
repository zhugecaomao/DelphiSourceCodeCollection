unit YglbEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TfrmYglbEdit = class(TfrmComEdit)
    procedure FormShow(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmYglbEdit: TfrmYglbEdit;

implementation

uses dm;
{$R *.DFM}

procedure TfrmYglbEdit.FormShow(Sender: TObject);
begin
  blnSetID := True;
  strKeyFields := 'MC';
  inherited;
end;

end.

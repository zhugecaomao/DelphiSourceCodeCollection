unit BmEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TfrmBmEdit = class(TfrmComEdit)
    procedure FormShow(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBmEdit: TfrmBmEdit;

implementation

uses dm;
{$R *.DFM}

procedure TfrmBmEdit.FormShow(Sender: TObject);
begin
  blnSetID := True;
  strKeyFields := 'MC';
  inherited;
end;

end.

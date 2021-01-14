unit CyjsdwEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TfrmCyjsdwEdit = class(TfrmComEdit)
    procedure FormShow(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCyjsdwEdit: TfrmCyjsdwEdit;

implementation

uses dm;
{$R *.DFM}

procedure TfrmCyjsdwEdit.FormShow(Sender: TObject);
begin
  strKeyFields := 'MC';
  inherited;
end;

end.

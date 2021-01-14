unit SjzlEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, db;

type
  TfrmSjzlEdit = class(TfrmComEdit)
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);override;
		procedure dsOnNewRecord(DataSet: TDataSet);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSjzlEdit: TfrmSjzlEdit;

implementation

uses dm, Common;
{$R *.DFM}

procedure TfrmSjzlEdit.dsOnNewRecord(DataSet: TDataSet);
begin
  inherited;
  if DataSet.State in [dsInsert] then
    SetFieldValue('select iif(isnull(max(XH)), 1, max(XH)+1) from SJZL', DataSet, 'XH');
end;

procedure TfrmSjzlEdit.FormShow(Sender: TObject);
begin
  blnSetID := True;
  strKeyFields := 'MC';
  inherited;
end;

end.

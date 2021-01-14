unit CkEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB;

type
  TfrmCkEdit = class(TfrmComEdit)
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormShow(Sender: TObject);override;
		procedure dsOnNewRecord(DataSet: TDataSet);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCkEdit: TfrmCkEdit;

implementation

uses dm, Common;
{$R *.DFM}

procedure TfrmCkEdit.dsOnNewRecord(DataSet: TDataSet);
begin
  inherited;
  if DataSet.State in [dsInsert] then
    SetFieldValue('select iif(isnull(max(XH)), 1, max(XH)+1) from CK', DataSet, 'XH');
end;

procedure TfrmCkEdit.FormShow(Sender: TObject);
begin
  blnSetID := True;
  strKeyFields := 'MC';
  inherited;
end;

end.

unit GroupDesktopClassEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, db;

type
  TfrmGroupDesktopClassEdit = class(TfrmComEdit)
  procedure dsOnNewRecord(DataSet: TDataSet);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGroupDesktopClassEdit: TfrmGroupDesktopClassEdit;

implementation

uses Dm, Desktop;

{$R *.DFM}

procedure TfrmGroupDesktopClassEdit.dsOnNewRecord(DataSet: TDataSet);
begin
  DBEdit1.DataSource.DataSet.Edit;
  DBEdit1.DataSource.DataSet.FieldByName('gName').AsString :=
    frmDesktop.ComboBox1.Text;
end;

end.

unit SfkfsEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Db;

type
  TfrmSfkfsEdit = class(TfrmComEdit)
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);override;
		procedure sDataChange(Sender: TObject; Field: TField);override;
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSfkfsEdit: TfrmSfkfsEdit;

implementation

uses dm, Common;
{$R *.DFM}

procedure TfrmSfkfsEdit.FormShow(Sender: TObject);
begin
  blnSetID := True;
  strKeyFields := 'MC';
  if not Data.Zh.Active then
    Data.Zh.Open;
  inherited;
end;

procedure TfrmSfkfsEdit.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Sender is TDBLookupComboBox) then
  begin
    TDBLookupComboBox(Sender).DataSource.DataSet.Edit;
    TDBLookupComboBox(Sender).Field.Value := 0;
  end;
end;

procedure TfrmSfkfsEdit.sDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [dsInsert, dsEdit]) then
    if (UpperCase(Field.FieldName) = 'ZHID') then
      if Field.AsInteger = 0 then
        dsEdits['aZHMC'] := ''
      else
        with CurDs do
        begin
          CommandText := 'select MC from ZH where ID = ' + Field.AsString;
          Open;
          if not IsEmpty then
            dsEdits['aZHMC'] := FieldValues['MC'];
          Close;
        end;
end;

end.

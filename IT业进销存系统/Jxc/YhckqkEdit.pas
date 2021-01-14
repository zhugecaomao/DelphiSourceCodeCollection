unit YhckqkEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB;

type
  TfrmYhckqkEdit = class(TfrmComEdit)
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    procedure FormShow(Sender: TObject);override;
		procedure sDataChange(Sender: TObject; Field: TField);override;
		procedure dsBeforePost(DataSet: TDataSet);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmYhckqkEdit: TfrmYhckqkEdit;

implementation

uses dm, MyLib, Common;
{$R *.DFM}

procedure TfrmYhckqkEdit.dsBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dsEdits['ZCZHID'] = dsEdits['ZRZHID'] then
  begin
    Application.MessageBox('''转出帐户''与''转入帐户''不能相同, 请重新录入!', '录入错误', MB_OK + MB_ICONWARNING);
    DBLookupComboBox2.SetFocus;
    abort;
  end;
end;

procedure TfrmYhckqkEdit.FormShow(Sender: TObject);
begin
  blnSetID := True;
  strKeyFields := 'RQ; ZCZHID; ZRZHID';
  ValuesToStrings(DBComboBox1.Items, 'select XM from YG order by BH');
  inherited;
end;

procedure TfrmYhckqkEdit.sDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [dsInsert,dsEdit]) then
  begin
    if (UpperCase(Field.FieldName) = 'ZCZHID') then
      dsEdits['aZCZHMC'] := DBLookupComboBox2.Text;
    if (UpperCase(Field.FieldName) = 'ZRZHID') then
      dsEdits['aZRZHMC'] := DBLookupComboBox1.Text;
    if (UpperCase(Field.FieldName) = 'JSR') and (Field.AsString <> '') then
      with CurDs do
      begin
        CommandText := 'select XM from YG where BH = ''' + Field.AsString + '''';
        Open;
        if not IsEmpty then
        begin
          dsEdits['JSR'] := Fields[0].AsString;
          DBComboBox1.Text := Fields[0].AsString;
        end;
        Close;
      end;
  end;
end;

end.

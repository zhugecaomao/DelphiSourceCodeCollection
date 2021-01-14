unit ZhEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, db;

type
  TfrmZhEdit = class(TfrmComEdit)
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    procedure FormShow(Sender: TObject);override;
		procedure dsBeforePost(DataSet: TDataSet);override;
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure MyAfterApplyUpdates;override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmZhEdit: TfrmZhEdit;

implementation

uses dm, Common;
{$R *.DFM}

procedure TfrmZhEdit.FormShow(Sender: TObject);
begin
  blnSetID := True;
  strKeyFields := 'MC';
  inherited;
  DBEdit3.Color := clWhite;
  DBEdit4.Color := clWhite;
end;

procedure TfrmZhEdit.dsBeforePost(DataSet: TDataSet);
begin
  inherited;
  if DBRadioGroup1.ItemIndex = 1 then
  begin
    dsEdits.FieldByName('KHYH').AsString := '';
    dsEdits.FieldByName('YHZH').AsString := '';
  end;
end;

procedure TfrmZhEdit.DBRadioGroup1Change(Sender: TObject);
begin
  DBEdit3.Enabled := DBRadioGroup1.ItemIndex = 0;
  DBEdit4.Enabled := DBEdit3.Enabled;
end;

procedure TfrmZhEdit.MyAfterApplyUpdates;
var
  dblQMJE: Double;
begin
  with CurDs do
  begin
    CommandText := 'select QMJE from ZH where ID = ' +
      dsEdits.FieldByName('ID').AsString;
    Open;
    dblQMJE := Fields[0].AsFloat;
    Close;
  end;
  if (dblQMJE <> dsEdits.FieldByName('QMJE').AsFloat) then
    with dsEdits do
    begin
      Edit;
      FieldByName('ITMP').AsInteger := FieldByName('ITMP').AsInteger + 1;
      FieldByName('QMJE').AsFloat := dblQMJE;
      Post;
      ApplyUpdates(0);
    end;
end;

end.

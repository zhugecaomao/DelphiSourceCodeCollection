unit KhEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, ComCtrls, db;

type
  TfrmKhEdit = class(TfrmComEdit)
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Bevel2: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Bevel3: TBevel;
    Bevel4: TBevel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBCheckBox1: TDBCheckBox;
    procedure FormShow(Sender: TObject);override;
		procedure sDataChange(Sender: TObject; Field: TField);override;
    procedure MyAfterApplyUpdates;override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKhEdit: TfrmKhEdit;

implementation

uses dm, Common;
{$R *.DFM}

procedure TfrmKhEdit.FormShow(Sender: TObject);
begin
  blnSetID := True;
  strKeyFields := 'BH;MC;DQID';
  if not Data.Dq.Active then
    Data.Dq.Open;
  inherited;
end;

procedure TfrmKhEdit.sDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [dsInsert, dsEdit]) then
    if (UpperCase(Field.FieldName) = 'DQID') and (Field.AsString <> '') then
      with CurDs do
      begin
        CommandText := 'select MC from DQ where ID = ' + Field.AsString;
        Open;
        if not IsEmpty then
          dsEdits['aDQMC'] := FieldValues['MC'];
        Close;
      end;
end;

procedure TfrmKhEdit.MyAfterApplyUpdates;
var
  dblQMJE, dblSJJE: Double;
begin
  with CurDs do
  begin
    CommandText := 'select QMJE, QMJE-YXJE as aSJJE from KH where ID=' +
      dsEdits.FieldByName('ID').AsString;
    Open;
    dblQMJE := Fields[0].AsFloat;
    dblSJJE := Fields[1].AsFloat;
    Close;
  end;
  if (dblQMJE <> dsEdits.FieldByName('QMJE').AsFloat) or
    (dblSJJE <> dsEdits.FieldByName('aSJJE').AsFloat) then
    with dsEdits do
    begin
      Edit;
      FieldByName('ITMP').AsInteger := FieldByName('ITMP').AsInteger + 1;
      FieldByName('QMJE').AsFloat := dblQMJE;
      FieldByName('aSJJE').AsFloat := dblSJJE;
      Post;
      ApplyUpdates(0);
    end;
end;

end.

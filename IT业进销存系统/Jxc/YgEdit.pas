unit YgEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, db;

type
  TfrmYgEdit = class(TfrmComEdit)
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    DBRadioGroup1: TDBRadioGroup;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    DBComboBox2: TDBComboBox;
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
  frmYgEdit: TfrmYgEdit;

implementation

uses dm, Common;
{$R *.DFM}

procedure TfrmYgEdit.FormShow(Sender: TObject);
begin
  blnSetID := True;
  strKeyFields := 'BH;MC';
  if not Data.BM.Active then
    Data.BM.Open;
  if not Data.YGLB.Active then
    Data.YGLB.Open;
  inherited;
end;

procedure TfrmYgEdit.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Sender is TDBLookupComboBox) then
  begin
    TDBLookupComboBox(Sender).DataSource.DataSet.Edit;
    TDBLookupComboBox(Sender).Field.Value := 0;
  end;
end;

procedure TfrmYgEdit.sDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [dsInsert, dsEdit]) then
  begin
    if (UpperCase(Field.FieldName) = 'BMID') then
      if Field.AsInteger = 0 then
        dsEdits['aBMMC'] := ''
      else
        with CurDs do
        begin
          CommandText := 'select MC from BM where ID = ' + Field.AsString;
          Open;
          if not IsEmpty then
            dsEdits['aBMMC'] := FieldValues['MC'];
          Close;
        end;
    if (UpperCase(Field.FieldName) = 'YGLBID') then
      if Field.AsInteger = 0 then
        dsEdits['aYGLBMC'] := ''
      else
        with CurDs do
        begin
          CommandText := 'select MC from YGLB where ID = ' + Field.AsString;
          Open;
          if not IsEmpty then
            dsEdits['aYGLBMC'] := FieldValues['MC'];
          Close;
        end;
  end;
end;

end.


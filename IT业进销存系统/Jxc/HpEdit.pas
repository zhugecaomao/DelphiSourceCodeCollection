unit HpEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Grids, db;

type
  TfrmHpEdit = class(TfrmComEdit)
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label13: TLabel;
    Bevel4: TBevel;
    sgSj: TStringGrid;
    Label14: TLabel;
    DBEdit2: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Bevel5: TBevel;
    sgKc: TStringGrid;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    procedure FormShow(Sender: TObject);override;
		procedure sDataChange(Sender: TObject; Field: TField);override;
		procedure dsOnNewRecord(DataSet: TDataSet);override;
		procedure dsAfterScroll(DataSet: TDataSet);override;
    procedure MyAfterApplyUpdates;override;
  private
    { Private declarations }
    blnQcjeChange: boolean;
  public
    { Public declarations }
  end;

var
  frmHpEdit: TfrmHpEdit;

implementation

uses dm, Common, ComFun;
{$R *.DFM}

procedure TfrmHpEdit.FormShow(Sender: TObject);
begin
  blnSetID := True;
  strKeyFields := 'BH;MC;HPHSFFID;HPLBID';
  if not Data.HPLB.Active then
    Data.HPLB.Open;
  if not Data.HPHSFF.Active then
    Data.HPHSFF.Open;
  inherited;
  dsAfterScroll(nil);
end;

procedure TfrmHpEdit.dsOnNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('HPHSFFID').AsInteger := 1;
end;

procedure TfrmHpEdit.sDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [dsInsert,dsEdit]) then
  begin
    if (UpperCase(Field.FieldName) = 'HPHSFFID') then
      dsEdits.FieldByName('HPSXID').AsInteger :=
        Data.Hphsff.FieldByName('LB').AsInteger;
    if (UpperCase(Field.FieldName) = 'HPLBID') and (Field.AsString <> '') then
      with CurDs do
      begin
        CommandText := 'select MC from HPLB where ID = ' + Field.AsString;
        Open;
        if not IsEmpty then
          dsEdits['aHPLBMC'] := FieldValues['MC'];
        Close;
      end;
    if (UpperCase(Field.FieldName) = 'QCJE') then
      blnQcjeChange := True;
  end;
end;

procedure TfrmHpEdit.dsAfterScroll(DataSet: TDataSet);
begin
  blnQcjeChange := False;
  //KC
  with CurDs do
  begin
    Close;
    CommandText := 'select * from CK order by XH';
    Open;
    sgKc.RowCount := RecordCount;  //0 CKID  1 是否空  2原值
    sgKc.ColWidths[0] := 0;
    sgKc.ColWidths[1] := 0;
    sgKc.ColWidths[2] := 0;
    sgKc.ColWidths[3] := Trunc(sgKc.Width / 5 * 2.5);
    sgKc.ColWidths[4] := sgKc.Width - sgKc.ColWidths[0] - 4;
    while not Eof do
    begin
      sgKc.Cells[0, RecNo - 1] := FieldByName('ID').AsString;
      sgKc.Cells[3, RecNo - 1] := FieldByName('MC').AsString;
      if dsEdits.FieldByName('ID').AsString = '' then
      begin
        sgKc.Cells[1, RecNo - 1] := '1';
        sgKc.Cells[2, RecNo - 1] := '0';
        sgKc.Cells[4, RecNo - 1] := '';
      end
      else
      begin
        dm.Data.Tmp.Close;
        dm.Data.Tmp.CommandText := 'select QCS from HPKC ' +
          'where CKID=' + FieldByName('ID').AsString + ' ' +
          'and HPID=' + dsEdits.FieldByName('ID').AsString;
        dm.Data.Tmp.Open;
        if dm.Data.Tmp.IsEmpty then
        begin
          sgKc.Cells[1, RecNo - 1] := '1';
          sgKc.Cells[2, RecNo - 1] := '0';
          sgKc.Cells[4, RecNo - 1] := '';
        end
        else
        begin
          sgKc.Cells[1, RecNo - 1] := '0';
          sgKc.Cells[2, RecNo - 1] := FormatFloat('#,0.###', dm.Data.Tmp.FieldByName('QCS').AsFloat);
          sgKc.Cells[4, RecNo - 1] := sgKc.Cells[2, RecNo - 1];
        end;
      end;
      Next;
    end;
    Close;
  end;
  //SJ
  with CurDs do
  begin
    Close;
    CommandText := 'select * from SJZL order by XH';
    Open;
    sgSj.RowCount := RecordCount;  //0 CKID  1 是否空
    sgSj.ColWidths[0] := 0;
    sgSj.ColWidths[1] := 0;
    sgSj.ColWidths[2] := Trunc(sgSj.Width / 5 * 2.5);
    sgSj.ColWidths[3] := sgSj.Width - sgSj.ColWidths[0] - 4;
    while not Eof do
    begin
      sgSj.Cells[0, RecNo - 1] := FieldByName('ID').AsString;
      sgSj.Cells[2, RecNo - 1] := FieldByName('MC').AsString;
      if dsEdits.FieldByName('ID').AsString = '' then
      begin
        sgSj.Cells[1, RecNo - 1] := '1';
        sgSj.Cells[3, RecNo - 1] := '';
      end
      else
      begin
        dm.Data.Tmp.Close;
        dm.Data.Tmp.CommandText := 'select SJ from HPSJ ' +
          'where SJZLID=' + FieldByName('ID').AsString + ' ' +
          'and HPID=' + dsEdits.FieldByName('ID').AsString;
        dm.Data.Tmp.Open;
        if dm.Data.Tmp.IsEmpty then
        begin
          sgSj.Cells[1, RecNo - 1] := '1';
          sgSj.Cells[3, RecNo - 1] := '';
        end
        else
        begin
          sgSj.Cells[1, RecNo - 1] := '0';
          sgSj.Cells[3, RecNo - 1] := FormatFloat('#,0.###', dm.Data.Tmp.FieldByName('SJ').AsFloat);
        end;
      end;
      Next;
    end;
    Close;
  end;
end;

procedure TfrmHpEdit.MyAfterApplyUpdates;
var
  i: integer;
  dblQCSL, dblZKCL: Double;
begin
  //KC
  for i := 0 to sgKc.RowCount - 1 do
  begin
    sgKc.Cells[4, i] := Float2Str(Str2Float(sgKc.Cells[4, i]));
    if sgKc.Cells[1, i] = '1' then
      SqlExec('insert into HPKC (CKID, HPID, QCS, JCS) ' +
        'values (' + sgKc.Cells[0, i] + ', ' + dsEdits.FieldByName('ID').AsString + ', ' +
        sgKc.Cells[4, i] + ', ' + sgKc.Cells[4, i] + ')')
    else
      SqlExec('update HPKC set QCS = ' + sgKc.Cells[4, i] + ', ' +
        'JCS = JCS - ' + sgKc.Cells[2, i] + ' + ' + sgKc.Cells[4, i] + ' ' +
        'where CKID = ' + sgKc.Cells[0, i] + ' and ' +
        'HPID = ' + dsEdits.FieldByName('ID').AsString);
  end;
  //Set KC.ZKCL
  with CurDs do
  begin
    CommandText := 'select sum(QCS), sum(JCS) from HPKC where HPID=' +
      dsEdits.FieldByName('ID').AsString;
    Open;
    dblQCSL := Fields[0].AsFloat;
    dblZKCL := Fields[1].AsFloat;
    Close;
  end;
  if (dblZKCL <> dsEdits.FieldByName('aZKCL').AsFloat) or blnQcjeChange then
    with dsEdits do
    begin
      Edit;
      FieldByName('ITMP').AsInteger := FieldByName('ITMP').AsInteger + 1;
      if dblQCSL <> 0 then
      begin
        FieldByName('JQJ').AsFloat :=  RoundPlus(FieldByName('QCJE').AsFloat / dblQCSL, 2);
        FieldByName('QCJQJ').AsFloat :=  RoundPlus(FieldByName('QCJE').AsFloat / dblQCSL, 2);
      end;
      FieldByName('aZKCL').AsFloat := dblZKCL;
      Post;
      ApplyUpdates(0);
    end;
  //SJ
  for i := 0 to sgSj.RowCount - 1 do
  begin
    sgSj.Cells[3, i] := Float2Str(Str2Float(sgSj.Cells[3, i]));
    if sgSj.Cells[1, i] = '1' then
      SqlExec('insert into HPSJ (SJZLID, HPID, SJ) ' +
        'values (' + sgSj.Cells[0, i] + ', ' + dsEdits.FieldByName('ID').AsString + ', ' +
        sgSj.Cells[3, i] + ')')
    else
      SqlExec('update HPSJ set SJ = ' + sgSj.Cells[3, i] + ' ' +
        'where SJZLID = ' + sgSj.Cells[0, i] + ' and ' +
        'HPID = ' + dsEdits.FieldByName('ID').AsString);
  end;
end;

end.

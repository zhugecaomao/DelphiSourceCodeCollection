unit Thgc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDj, Menus, DBCtrls, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask,
  Grids, DBGrids, Buttons, Db, CheckLst, ActnList;

type
  TfrmThgc = class(TfrmComDj)
    Label9: TLabel;
    DBEdit6: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    N7: TMenuItem;
    Label4: TLabel;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    aThgc: TAction;
    T1: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure IniRecord;override;
    procedure MxOnNewRecord(DataSet: TDataSet);override;
    procedure sMxDataChange(Sender: TObject; Field: TField);override;
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure FormShow(Sender: TObject);override;
    procedure aThgcExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);override;
  private
    { private declarations }
  public
    { Public declarations }
  end;

var
  frmThgc: TfrmThgc;

implementation

uses Dm, Common, Main, MyLib, HpHelp, ComFun, QtkcbdHpHelp;

{$R *.DFM}

procedure TfrmThgc.FormShow(Sender: TObject);
begin
  strZbMxKey := 'ID,ZBID';
  strZbKeyFields := '';
  strMxKeyFields := 'RQ; ABH';
  strMxHelpFields := 'ABH';
  strMxHh := 'HH';
  blnSetZbID := True;
  strAutoScale := 'DBGrid1';
  inherited;
  DBGrid1.SetFocus;
end;

procedure TfrmThgc.IniRecord;
begin
  //同时更新 frmZB.dsAfterScroll
  dsMx.CommandText :=
    'select M.*, ' +
    'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
    'from THGC M, HP H, M inner join H on M.HPID=H.ID ' +
    'where ZBID = ' + Float2Str(dsZb['ID']);
  inherited;
end;

procedure TfrmThgc.MxOnNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet['RQ'] := Date;
end;

procedure TfrmThgc.sMxDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [Dsinsert,Dsedit]) then
  begin
    if (UpperCase(Field.FieldName) = 'ABH') and (Field.AsString <> '') then
      with CurDs do
      begin
        CommandText := 'select * from HP where BH = ''' + Field.AsString + '''';
        Open;
        if not IsEmpty then
        begin
          dsMx['HPID'] := FieldValues['ID'];
          dsMx['aPM'] := FieldValues['PM'];
          dsMx['aDW'] := FieldValues['DW'];
          dsMx['DJ'] := GetFieldValue('select DJ from QTKCBD where ' +
            'ZBID = ' + Float2Str(dsZb['ID']) + ' and ' +
            'HPID = ' + Float2Str(dsMx['HPID']));
        end
        else
          DBGrid1EditButtonClick(nil);
        Close;
      end;
  end;
end;

procedure TfrmThgc.DBGrid1EditButtonClick(Sender: TObject);
begin
  if UpperCase(DBGrid1.SelectedField.FieldName) = 'ABH' then
  begin
    with Data.QtkcbdHpHelp do
    begin
      Close;
      CommandText :=
        'select H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
        'from HP H,QTKCBD Q ' +
        'where H.ID=Q.HPID and Q.ZBID = ' + Float2Str(dsZb['ID']);
      Open;
    end;
    frmQtkcbdHpHelp := TfrmQtkcbdHpHelp.Create(Application);
    with frmQtkcbdHpHelp do
    begin
      strEditFieldName := 'aBH';
      strHelpFieldName := 'aBH';
      dsEditing := self.dsMx;
      Edit1.Text := self.DBGrid1.Fields[1].Text;
      ShowModal;
      Free;
    end;
  end;
end;

procedure TfrmThgc.aThgcExecute(Sender: TObject);
begin
  with CurDs do
  begin
    CommandText :=
      'select H.BH as aBH, H.PM as aPM, H.DW as aDW, Q.SL - Q.THSL as aMTSL ' +
      'from HP H,QTKCBD Q ' +
      'where Q.SL > Q.THSL and H.ID=Q.HPID and Q.ZBID = ' + Float2Str(dsZb['ID']);
    Open;
    while not Eof do
    begin
      dsMx.Append;
      dsMx.FieldByName('aBH').AsString := FieldByName('aBH').AsString;
      dsMx.FieldByName('SL').AsFloat := FieldByName('aMTSL').AsFloat;
      Next;
    end;
    Close;
  end;
  dsMx.First;
end;

procedure TfrmThgc.aSaveExecute(Sender: TObject);
var
  dblTHSL: double;
begin
  inherited;
  with Data.Qtkcbd do
  begin
    First;
    while not Eof do
    begin
      with CurDs do
      begin
        CommandText := 'select sum(SL) as aTHSL from THGC ' +
          'where ZBID = ' + Float2Str(dsZb['ID']) + ' and ' +
          'HPID = ' + Float2Str(dm.Data.Qtkcbd['HPID']);
        Open;
        dblTHSL := VarToFloat(FieldValues['aTHSL']);
        Close;
      end;
      if FieldByName('THSL').AsFloat <> dblTHSL then
      begin
        Edit;
        FieldByName('THSL').AsFloat := dblTHSL;
        Post;
        ApplyUpdates(-1);
      end;
      Next;
    end;
    First;
  end;
  CanSave := False;
end;

end.

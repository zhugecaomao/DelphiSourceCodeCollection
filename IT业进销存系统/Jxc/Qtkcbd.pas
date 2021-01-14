unit Qtkcbd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDj, Menus, DBCtrls, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask,
  Grids, DBGrids, Buttons, Db, CheckLst, ActnList;

type
  TfrmQtkcbd = class(TfrmComDj)
    Label9: TLabel;
    Label7: TLabel;
    DBText1: TDBText;
    DBEdit6: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    aThgc: TAction;
    N12: TMenuItem;
    T1: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure IniRecord;override;
    procedure TotalField(Kind: char; Field: TField);override;
    procedure ZbOnNewRecord(DataSet: TDataSet);override;
    procedure sZbDataChange(Sender: TObject; Field: TField);override;
    procedure sMxDataChange(Sender: TObject; Field: TField);override;
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure FormShow(Sender: TObject);override;
    procedure aThgcExecute(Sender: TObject);
  private
    { private declarations }
  public
    { Public declarations }
  end;

var
  frmQtkcbd: TfrmQtkcbd;

implementation

uses Dm, Common, Main, MyLib, HpHelp, ComFun, Thgc;

{$R *.DFM}

procedure TfrmQtkcbd.FormShow(Sender: TObject);
begin
  strZbMxKey := 'ID,ZBID; RQ,RQ; CKID,CKID; CRLX,CRLX';
  strZbKeyFields := 'DJBH; RQ; CKID; KCBDLXID';
  strMxKeyFields := 'ABH';
  strMxHelpFields := 'ABH';
  strMxHh := 'HH';
  blnSetZbID := True;
  strAutoScale := 'DBGrid1';
  inherited;
end;

procedure TfrmQtkcbd.IniRecord;
begin
  //同时更新 frmZB.dsAfterScroll
  dsMx.CommandText :=
    'select M.*, ' +
    'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
    'from QTKCBD M, HP H, M inner join H on M.HPID=H.ID ' +
    'where ZBID = ' + Float2Str(dsZb['ID']);
  inherited;
end;

procedure TfrmQtkcbd.ZbOnNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet['RQ'] := Date;
  DataSet['CKID'] := pintCKID;
  DataSet['CZY'] := pstrUserName;
end;

procedure TfrmQtkcbd.sZbDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [dsInsert, dsEdit]) then
  begin
    if (UpperCase(Field.FieldName) = 'RQ') then
      dsZb['DJBH'] := GetDjbh('QB', Field.AsDateTime, 'QTKCBDZB');
    if (UpperCase(Field.FieldName) = 'CKID') then
      dsZb['aCKMC'] := DBLookupComboBox1.Text;
    if (UpperCase(Field.FieldName) = 'QTKCBDLXID') then
    begin
      dsZb['aQTKCBDLXMC'] := DBLookupComboBox2.Text;
      if Data.Qtkcbdlx.FieldByName('RKL').AsBoolean then
      begin
        dsZb['CRLX'] := 2;
        dsZb['aCRLX'] := '入库类(增加库存)'
      end
      else
      begin
        dsZb['CRLX'] := 1;
        dsZb['aCRLX'] := '出库类(减少库存)';
      end;
      if Data.Qtkcbdlx.FieldByName('THBZ').AsBoolean then
        dsZb['aTH'] := '需要'
      else
        dsZb['aTH'] := '不需要';
    end;
  end;
end;

procedure TfrmQtkcbd.TotalField(Kind: char; Field: TField);
var
  dblOld, dblNew: Double;
begin
  dblOld := RoundPlus(arMx('SL') * arMx('DJ'), 2);
  if Kind <> 'D' then
    dblNew := RoundPlus(dsMx['SL'] * dsMx['DJ'], 2)
  else
    dblNew := 0;
  if Kind = 'E' then
    if (Field = nil) or (Pos(UpperCase(Field.FieldName) + ';', 'SL; DJ;') = 0) then
      Exit
    else
      arrMx[Field.Index] := dsMx[Field.FieldName];
  dsZb.Edit;
  case Kind of
    'E', 'C': dsZb['JE'] := dsZb['JE'] - dblOld + dblNew;
    'D':      dsZb['JE'] := dsZb['JE'] - dblOld;
  end;
end;

procedure TfrmQtkcbd.sMxDataChange(Sender: TObject; Field: TField);
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
          if dsMx['DJ'] = 0 then
            dsMx['DJ'] := FieldValues['JQJ'];
        end
        else
          DBGrid1EditButtonClick(nil);
        Close;
      end;
    if (UpperCase(Field.FieldName) = 'DJ') then
      SqlExec('update THGC set DJ = ' + Float2Str(dsMx['DJ']) + ' where ' +
        'ZBID = ' + Float2Str(dsZb['ID']) + ' and ' +
        'HPID = ' + Float2Str(dsMx['HPID']));
  end;
end;

procedure TfrmQtkcbd.DBGrid1EditButtonClick(Sender: TObject);
begin
  if UpperCase(DBGrid1.SelectedField.FieldName) = 'ABH' then
  begin
    frmHpHelp := TfrmHpHelp.Create(Application);
    with frmHpHelp do
    begin
      strEditFieldName := 'aBH';
      strHelpFieldName := 'BH';
      dsEditing := self.dsMx;
      Edit1.Text := self.DBGrid1.Fields[0].Text;
      ShowModal;
      Free;
    end;
  end;
end;

procedure TfrmQtkcbd.aThgcExecute(Sender: TObject);
begin
  if aSave.Enabled then
    if Application.MessageBox('登记''退还过程''之前，必须先保存本单据。现在就保存吗?',
      '提示', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
      aSave.Execute
    else
      Exit;
  frmThgc := TfrmThgc.Create(Application);
  frmThgc.blnStopScroll := True;
  frmThgc.ShowModal;
  frmThgc.Free;
  aSave.Execute;
end;

end.

unit Chtj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDj, Menus, DBCtrls, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask,
  Grids, DBGrids, Buttons, Db, CheckLst, ActnList;

type
  TfrmChtj = class(TfrmComDj)
    Label9: TLabel;
    Label7: TLabel;
    DBText1: TDBText;
    DBEdit6: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    N7: TMenuItem;
    N8: TMenuItem;
    H1: TMenuItem;
    procedure IniRecord;override;
    procedure TotalField(Kind: char; Field: TField);override;
    procedure ZbOnNewRecord(DataSet: TDataSet);override;
    procedure sZbDataChange(Sender: TObject; Field: TField);override;
    procedure sMxDataChange(Sender: TObject; Field: TField);override;
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure FormShow(Sender: TObject);override;
  private
    { private declarations }
  public
    { Public declarations }
  end;

var
  frmChtj: TfrmChtj;

implementation

uses Dm, Common, Main, MyLib, HpHelp, ComFun;

{$R *.DFM}

procedure TfrmChtj.FormShow(Sender: TObject);
begin
  strZbMxKey := 'ID,ZBID; RQ,RQ';
  strZbKeyFields := 'DJBH; RQ';
  strMxKeyFields := 'ABH; DJ';
  strMxHelpFields := 'ABH';
  strMxHh := 'HH';
  blnSetZbID := True;
  strAutoScale := 'DBGrid1';
  inherited;
end;

procedure TfrmChtj.IniRecord;
begin
  //同时更新 frmZB.dsAfterScroll
  dsMx.CommandText :=
    'select M.*, ' +
    'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
    'from CHTJ M, HP H, M inner join H on M.HPID=H.ID ' +
    'where ZBID = ' + Float2Str(dsZb['ID']);
  inherited;
end;

procedure TfrmChtj.ZbOnNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet['RQ'] := Date;
  DataSet['CZY'] := pstrUserName;
end;

procedure TfrmChtj.sZbDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [dsInsert, dsEdit]) then
    if (UpperCase(Field.FieldName) = 'RQ') then
      dsZb['DJBH'] := GetDjbh('TJ', Field.AsDateTime, 'CHTJZB');
end;

procedure TfrmChtj.TotalField(Kind: char; Field: TField);
var
  dblOld, dblNew: Double;
begin
  dblOld := RoundPlus(arMx('SL') * (arMx('DJ') - arMx('JDJ')), 2);
  if Kind <> 'D' then
    dblNew := RoundPlus(dsMx['SL'] * (dsMx['DJ'] - dsMx['JDJ']), 2)
  else
    dblNew := 0;
  if Kind = 'E' then
    if (Field = nil) or (Pos(UpperCase(Field.FieldName) + ';', 'SL; JDJ; DJ;') = 0) then
      Exit
    else
      arrMx[Field.Index] := dsMx[Field.FieldName];
  dsZb.Edit;
  case Kind of
    'E', 'C': dsZb['JE'] := dsZb['JE'] - dblOld + dblNew;
    'D':      dsZb['JE'] := dsZb['JE'] - dblOld;
  end;
end;

procedure TfrmChtj.sMxDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [Dsinsert,Dsedit]) then
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
          //SL,JDJ,DJ
          dsMx['SL'] := GetFieldValue('select sum(JCS) from HPKC where HPID = ' + Float2Str(dsMx['HPID']));
          dsMx['JDJ'] := FieldValues['JQJ'];
          dsMx['DJ'] := FieldValues['JQJ'];
        end
        else
          DBGrid1EditButtonClick(nil);
        Close;
      end;
end;

procedure TfrmChtj.DBGrid1EditButtonClick(Sender: TObject);
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

end.

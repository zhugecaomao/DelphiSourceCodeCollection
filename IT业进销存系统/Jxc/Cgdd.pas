unit Cgdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDj, Menus, DBCtrls, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask,
  Grids, DBGrids, Buttons, Db, CheckLst, ActnList;

type
  TfrmCgdd = class(TfrmComDj)
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    Label7: TLabel;
    DBText1: TDBText;
    btnGysHelp: TSpeedButton;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label5: TLabel;
    DBComboBox1: TDBComboBox;
    pnlZt: TPanel;
    spZt: TShape;
    labZt: TLabel;
    DBCheckBox1: TDBCheckBox;
    procedure IniRecord;override;
    procedure TotalField(Kind: char; Field: TField);override;
    procedure ZbOnNewRecord(DataSet: TDataSet);override;
    procedure sZbDataChange(Sender: TObject; Field: TField);override;
    procedure sMxDataChange(Sender: TObject; Field: TField);override;
    procedure btnGysHelpClick(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure FormShow(Sender: TObject);override;
  private
    { private declarations }
  public
    { Public declarations }
  end;

var
  frmCgdd: TfrmCgdd;

implementation

uses Dm, Common, Main, MyLib, GysHelp, HpHelp, ComFun;

{$R *.DFM}

procedure TfrmCgdd.FormShow(Sender: TObject);
begin
  strZbMxKey := 'ID,ZBID; RQ,RQ';
  strZbKeyFields := 'DJBH; RQ; AGYSBH';
  strMxKeyFields := 'ABH';
  strZbHelpFields := 'AGYSBH';
  strMxHelpFields := 'ABH';
  strMxHh := 'HH';
  blnSetZbID := True;
  strAutoScale := 'DBGrid1';
  ValuesToStrings(DBComboBox1.Items, 'select XM from YG where YWYBZ order by BH');
  inherited;
end;

procedure TfrmCgdd.IniRecord;
var
  bmMx: TBookMark;
  blnOk: boolean;
begin
  //同时更新 frmZB.dsAfterScroll frmHelp.dsAfterScroll
  dsMx.CommandText :=
    'select M.*, ' +
    '(select HH from CGDD where CGDD.ZBID=M.ZBID and CGDD.HH=M.HH) as TMP, ' +
    '(select sum(SL) from CGSH where DDID=M.ZBID and HPID=M.HPID) as aSHSL, ' +
    'iif(M.SL > aSHSL, M.SL - aSHSL, 0) as aMSSL, ' +
    'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
    'from CGDD M, HP H, M inner join H on M.HPID=H.ID ' +
    'where ZBID = ' + Float2Str(dsZb['ID']);
  inherited;
  //Set pnlZt
  if dsZb.FieldByName('ZT').AsBoolean then
  begin
    spZt.Pen.Color := clRed;
    labZt.Font.Color := spZt.Pen.Color;
    labZt.Caption := '中止执行';
    pnlZt.Visible := True;
  end
  else
  begin
    blnOk := False;
    with dsMx do
    begin
      DisableControls;
      bmMx := GetBookmark;
      First;
      while not Eof do
      begin
        if RecNo = 1 then
          blnOk := FieldByName('aSHSL').AsFloat >= FieldByName('SL').AsFloat
        else
          blnOk := blnOk and (FieldByName('aSHSL').AsFloat >= FieldByName('SL').AsFloat);
        Next;
      end;
      EnableControls;
      GotoBookmark(bmMx);
      FreeBookmark(bmMx);
    end;
    spZt.Pen.Color := clGreen;
    labZt.Font.Color := spZt.Pen.Color;
    labZt.Caption := '执行完毕';
    pnlZt.Visible := blnOK;
  end;
end;

procedure TfrmCgdd.ZbOnNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet['RQ'] := Date;
  DataSet['YWY'] := '';
  DataSet['CZY'] := pstrUserName;
end;

procedure TfrmCgdd.btnGysHelpClick(Sender: TObject);
begin
  frmGysHelp := TFrmGysHelp.Create(Application);
  with frmGysHelp do
  begin
    strEditFieldName := 'aGYSBH';
    strHelpFieldName := 'BH';
    dsEditing := self.dsZb;
    Edit1.Text := self.DBEdit2.Text;
    ShowModal;
    if ModalResult = MROK then
      self.Perform(WM_KEYDOWN, VK_RETURN, 0);
    Free;
  end;
end;

procedure TfrmCgdd.sZbDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [dsInsert, dsEdit]) then
  begin
    if (UpperCase(Field.FieldName) = 'RQ') then
      dsZb['DJBH'] := GetDjbh('CD', Field.AsDateTime, 'CGDDZB');
    if (UpperCase(Field.FieldName) = 'AGYSBH') then
      with CurDs do
      begin
        CommandText := 'select * from GYS where BH = ''' + Field.AsString + '''';
        Open;
        if not IsEmpty then
        begin
          dsZb['GYSID'] := FieldValues['ID'];
          dsZb['aGYSMC'] := FieldValues['MC'];
        end
        else
          Screen.ActiveControl.Perform(WM_LBUTTONDBLCLK, 0, 0);
        Close;
      end;
    if (UpperCase(Field.FieldName) = 'YWY') and (Field.AsString <> '') then
      with CurDs do
      begin
        CommandText := 'select XM from YG where BH = ''' + Field.AsString + '''';
        Open;
        if not IsEmpty then
        begin
          dsZb['YWY'] := Fields[0].AsString;
          DBComboBox1.Text := Fields[0].AsString;
        end;
        Close;
      end;
  end;
end;

procedure TfrmCgdd.TotalField(Kind: char; Field: TField);
var
  dblOld, dblNew: Double;
begin
  dblOld := RoundPlus(arMx('SL') * arMx('DJ') * (1 + arMx('NSL') / 100), 2);
  if Kind <> 'D' then
    dblNew := RoundPlus(dsMx['SL'] * dsMx['DJ'] * (1 + dsMx['NSL'] / 100), 2)
  else
    dblNew := 0;
  if Kind = 'E' then
    if (Field = nil) or (Pos(UpperCase(Field.FieldName) + ';', 'SL; DJ; NSL;') = 0) then
      Exit
    else
      arrMx[Field.Index] := dsMx[Field.FieldName];
  dsZb.Edit;
  case Kind of
    'E', 'C': dsZb['JE'] := dsZb['JE'] - dblOld + dblNew;
    'D':      dsZb['JE'] := dsZb['JE'] - dblOld;
  end;
end;

procedure TfrmCgdd.sMxDataChange(Sender: TObject; Field: TField);
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
            dsMx['DJ'] := FieldValues['JJ'];
        end
        else
          DBGrid1EditButtonClick(nil);
        Close;
      end;
  end;
end;

procedure TfrmCgdd.DBGrid1EditButtonClick(Sender: TObject);
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

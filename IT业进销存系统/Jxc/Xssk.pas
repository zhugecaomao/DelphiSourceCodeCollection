unit Xssk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDj, Menus, DBCtrls, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask,
  Grids, DBGrids, Buttons, Db, CheckLst, ActnList, Variants;

type
  TfrmXssk = class(TfrmComDj)
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    Label7: TLabel;
    btnKhHelp: TSpeedButton;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    ToolButton1: TToolButton;
    aZdfk: TAction;
    aCKGJD: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    N12: TMenuItem;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    labJEA: TLabel;
    labJEB: TLabel;
    labJEC: TLabel;
    labJED: TLabel;
    Shape1: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    ToolButton2: TToolButton;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBComboBox2: TDBComboBox;
    Label13: TLabel;
    Label15: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    pnlHint: TPanel;
    Label16: TLabel;
    Label20: TLabel;
    Label17: TLabel;
    aZdfkB: TAction;
    N13: TMenuItem;
    labJYJ: TLabel;
    labKYZJE: TLabel;
    labSKHYE: TLabel;
    DBCheckBox2: TDBCheckBox;
    pnlTs: TPanel;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    btnCloseTs: TButton;
    Label18: TLabel;
    Label19: TLabel;
    aTs: TAction;
    N14: TMenuItem;
    N15: TMenuItem;
    aKhXx: TAction;
    N16: TMenuItem;
    K1: TMenuItem;
    procedure IniRecord;override;
    procedure TotalField(Kind: char; Field: TField);override;
    procedure ZbOnNewRecord(DataSet: TDataSet);override;
    procedure MxBeforeInsert(DataSet: TDataSet);override;
    procedure sZbDataChange(Sender: TObject; Field: TField);override;
    procedure sMxDataChange(Sender: TObject; Field: TField);override;
    procedure btnKhHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);override;
    procedure aZdfkExecute(Sender: TObject);
    procedure aCKGJDExecute(Sender: TObject);
    procedure aZdfkBExecute(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure aSaveExecute(Sender: TObject);override;
    procedure btnCloseTsClick(Sender: TObject);
    procedure aTsExecute(Sender: TObject);
    procedure DBComboBox2Change(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure aKhXxExecute(Sender: TObject);
  private
    { private declarations }
    blnCanInsert: boolean;
    procedure SetMx;
    procedure SetJEABCD;
    procedure SetJYJ;
    procedure SetKYZJE;
    procedure SetSKHYE;
  public
    { Public declarations }
  end;

var
  frmXssk: TfrmXssk;

implementation

uses Dm, Common, Main, MyLib, KhHelp, HpHelp, ComFun, KhXx, Xskd;

{$R *.DFM}

procedure TfrmXssk.FormShow(Sender: TObject);
begin
  strZbMxKey := 'ID,ZBID; RQ,RQ';
  strZbKeyFields := 'DJBH; RQ; AFKLX; AKHBH; SFKFSID; ZHID';
  strZbHelpFields := 'AKHBH';
  strMxHh := 'HH';
  blnSetZbID := True;
  strAutoScale := 'DBGrid1';
  inherited;
end;

procedure TfrmXssk.IniRecord;
begin
  //同时更新 frmZB.dsAfterScroll
  dsMx.CommandText :=
    'select M.*, ' +
    'D.DJBH as aDDBH, D.RQ+D.SKQX as aSKQX, D.JE as aDDJE, ' +
    'D.YSJE - M.JE as aYSJE, D.JE - D.YSJE + M.JE as aMSJE ' +
    'from XSSK M, XSKDZB D, M inner join D on M.DDID=D.ID ' +
    'where M.ZBID = ' + Float2Str(dsZb['ID']);
  inherited;
  //INI LABEL
  labJYJ.Caption := '0.00';
  labKYZJE.Caption := '0.00';
  labSKHYE.Caption := '0.00';
  labJEA.Caption := '0.00';
  labJEB.Caption := '0.00';
  labJEC.Caption := '0.00';
  labJED.Caption := '0.00';
  //SetJYJ
  SetJYJ;
  //SetJEABCD
  SetJEABCD;
  //SetSKHYE
  SetSKHYE;
  //
  DBCheckBox2.Enabled := dsZb.FieldByName('FKLX').AsInteger = 1;
end;

procedure TfrmXssk.ZbOnNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet['RQ'] := Date;
  DataSet['AFKLX'] := DBComboBox2.Items[0];
  DataSet['CZY'] := pstrUserName;
  DataSet['SFKFSID'] := Data.Sfkfs['ID'];
  DataSet['SYJY'] := False;
end;

procedure TfrmXssk.btnKhHelpClick(Sender: TObject);
begin
  frmKhHelp := TFrmKhHelp.Create(Application);
  with frmKhHelp do
  begin
    strEditFieldName := 'aKHBH';
    strHelpFieldName := 'BH';
    dsEditing := self.dsZb;
    Edit1.Text := self.DBEdit2.Text;
    ShowModal;
    if ModalResult = MROK then
      self.Perform(WM_KEYDOWN, VK_RETURN, 0);
    Free;
  end;
end;

procedure TfrmXssk.sZbDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [dsInsert, dsEdit]) then
  begin
    if (UpperCase(Field.FieldName) = 'RQ') then
      dsZb['DJBH'] := GetDjbh('XS', Field.AsDateTime, 'XSSKZB');
    if (UpperCase(Field.FieldName) = 'AKHBH') then
      with CurDs do
      begin
        CommandText := 'select * from KH where BH = ''' + Field.AsString + '''';
        Open;
        if not IsEmpty then
        begin
          dsZb['KHID'] := FieldValues['ID'];
          dsZb['aKHMC'] := FieldValues['MC'];
          dsZb['JEA'] := FieldValues['YXJE'];
          SetMx;
          SetJYJ;
        end
        else
          Screen.ActiveControl.Perform(WM_LBUTTONDBLCLK, 0, 0);
        Close;
      end;
    if (UpperCase(Field.FieldName) = 'AFKLX') then
      dsZb['FKLX'] := DBComboBox2.ItemIndex + 1;
    if (UpperCase(Field.FieldName) = 'SFKFSID') then
    begin
      dsZb['aSFKFSMC'] := DBLookupComboBox1.Text;
      dsZb['ZHID'] := DBLookupComboBox1.ListSource.DataSet['ZHID'];
    end;
    if (UpperCase(Field.FieldName) = 'ZHID') then
      dsZb['aZHMC'] := DBLookupComboBox2.Text;
    if (UpperCase(Field.FieldName) = 'JE') then
      SetKYZJE;
  end;
end;

//sZbDataChange不能即用更新，所以在这里做
procedure TfrmXssk.DBComboBox2Change(Sender: TObject);
begin
  DBCheckBox2.Enabled := True;
  if DBComboBox2.ItemIndex = 1 then
    DBCheckBox2.Enabled := False;
  if dsZb = nil then Exit;
  if (DBComboBox2.ItemIndex + 1) <> dsZb.FieldByName('FKLX').AsInteger then
    dsZb['FKLX'] := DBComboBox2.ItemIndex + 1;
  SetMx;
end;

//sZbDataChange不能即用更新，所以在这里做
procedure TfrmXssk.DBCheckBox2Click(Sender: TObject);
begin
  if dsZb = nil then Exit;
  if dsZb.State in [dsInsert, dsEdit] then
    dsZb.FieldByName('SYJY').AsBoolean := DBCheckBox2.Checked;
  SetJYJ;
end;

procedure TfrmXssk.MxBeforeInsert(DataSet: TDataSet);
begin
  if not blnCanInsert then
    abort;
end;

procedure TfrmXssk.SetMx;
var
  dblJE: double;
  blnHaveOld: boolean;
  intDDID: integer;
begin
  screen.Cursor := crHourGlass;
  //Del
  with dsMx do
    while not IsEmpty do
      Delete;
  //Add
  if DBComboBox2.ItemIndex = 0 then
  begin
    blnCanInsert := True;
    blnHaveOld := False;
    if CheckRecord('select * from XSSKZB where ID = ' + Float2Str(dsZb['ID']) + ' and ' +
      'KHID = ' + Float2Str(dsZb['KHID'])) then
      with CurDs do
      begin
        CommandText := 'select F.DDID, F.JE as BDJE, S.DJBH, S.RQ- S.SKQX as aSKQX, S.JE, S.YSJE ' +
          'from XSSK F, XSKDZB S ' +
          'where F.DDID = S.ID and ZBID = ' + Float2Str(dsZb['ID']);
        Open;
        blnHaveOld := not IsEmpty;
        while not Eof do
        begin
          dsMx.Append;
          dsMx['DDID'] := FieldValues['DDID'];
          dsMx['aDDBH'] := FieldValues['DJBH'];
          dsMx['aSKQX'] := FieldValues['aSKQX'];
          dsMx['aDDJE'] := FieldValues['JE'];
          dsMx['aYSJE'] := FieldValues['YSJE'] - FieldValues['BDJE'];
          dsMx['aMSJE'] := FieldValues['JE'] - FieldValues['YSJE'] + FieldValues['BDJE'];
          dsMx['JE'] := FieldValues['BDJE'];
          Next;
        end;
        dsMx.First;
        DBGrid1.SelectedIndex := DBGrid1.FieldCount - 1;
        Close;
      end;
    //New Add
    if not blnHaveOld then
      with CurDs do
      begin
        CommandText := 'select * from XSKDZB ' +
          'where XSLX = 2 and KHID = ' + VarToStr(dsZb['KHID']) + ' and JE > YSJE ' +
          'order by ID';
        Open;
        while not Eof do
        begin
          intDDID := FieldByName('ID').AsInteger;
          dblJE := VarToFloat(GetFieldValue('select JE from XSSK ' +
            'where ZBID = ' + Float2Str(dsZb['ID']) + ' and ' +
            'DDID = ' + IntToStr(intDDID)));
          dsMx.Append;
          dsMx['DDID'] := FieldValues['ID'];
          dsMx['aDDBH'] := FieldValues['DJBH'];
          dsMx['aSKQX'] := FieldByName('RQ').AsDateTime + FieldByName('SKQX').AsInteger;
          dsMx['aDDJE'] := FieldValues['JE'];
          dsMx['aYSJE'] := FieldValues['YSJE'] - dblJE;
          dsMx['aMSJE'] := FieldValues['JE'] - FieldValues['YSJE'] + dblJE;
          dsMx['JE'] := dblJE;
          Next;
        end;
        dsMx.First;
        DBGrid1.SelectedIndex := DBGrid1.FieldCount - 1;
        Close;
      end;
    blnCanInsert := False;
  end;
  //SetJEABCD
  SetJEABCD;
  screen.Cursor := crDefault;
end;

procedure TfrmXssk.TotalField(Kind: char; Field: TField);
var
  dblJED, dblOld, dblNew: Double;
begin
  dblJED := Str2Float(labJED.Caption);
  dblOld := RoundPlus(arMx('JE'), 2);
  if Kind <> 'D' then
    dblNew := RoundPlus(dsMx['JE'], 2)
  else
    dblNew := 0;
  if Kind = 'E' then
    if (Field = nil) or (Pos(UpperCase(Field.FieldName) + ';', 'JE;') = 0) then
      Exit
    else
      arrMx[Field.Index] := dsMx[Field.FieldName];

  dsZb.Edit;
  case Kind of
    'E', 'C': dblJED := dblJED - dblOld + dblNew;
    'D':      dblJED := dblJED - dblOld;
  end;
  labJED.Caption := FormatFloat('#,0.00', dblJED);
  SetSKHYE;
end;

procedure TfrmXssk.sMxDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [Dsinsert,Dsedit]) then
  begin
    if (UpperCase(Field.FieldName) = 'DDID') and (Field.AsString <> '') then
      with CurDs do
      begin
        CommandText := 'select * from XSKDZB where ID = ' + Field.AsString;
        Open;
        if not IsEmpty then
        begin
          dsMx['aDDBH'] := FieldValues['DJBH'];
          dsMx['aSKQX'] := FieldByName('RQ').AsDateTime + FieldByName('SKQX').AsInteger;
          dsMx['aDDJE'] := FieldValues['JE'];
          dsMx['aYSJE'] := FieldValues['YSJE'];
          dsMx['aMSJE'] := FieldValues['JE'] - FieldValues['YSJE'];
        end
        else
          DBGrid1EditButtonClick(nil);
        Close;
      end;
  end;
end;

//自动收款 所有
procedure TfrmXssk.aZdfkExecute(Sender: TObject);
var
  dblKYZJE: double;
begin
  dblKYZJE := Str2Float(labKYZJE.Caption);
  with dsMx do
  begin
    First;
    while not Eof do
    begin
      Edit;
      if FieldByName('aMSJE').AsFloat > dblKYZJE then
      begin
        FieldByName('JE').AsFloat := dblKYZJE;
        dblKYZJE := 0;
      end
      else
      begin
        FieldByName('JE').AsFloat := FieldByName('aMSJE').AsFloat;
        dblKYZJE := dblKYZJE - FieldByName('JE').AsFloat;
      end;
      Post;
      Next;
    end;
    First;
  end;
end;

//自动收款 当前收货单
procedure TfrmXssk.aZdfkBExecute(Sender: TObject);
var
  dblFKHYE: double;
begin
  dblFKHYE := Str2Float(labSKHYE.Caption);
  with dsMx do
    if not Eof then
      if FieldByName('JE').AsFloat <> 0 then
      begin
        Edit;
        FieldByName('JE').AsFloat := 0;
        Post;
      end
      else
      begin
        Edit;
        if FieldByName('aMSJE').AsFloat > dblFKHYE then
          FieldByName('JE').AsFloat := dblFKHYE
        else
          FieldByName('JE').AsFloat := FieldByName('aMSJE').AsFloat;
        Post;
      end;
end;

//查看购进单
procedure TfrmXssk.aCKGJDExecute(Sender: TObject);
begin
  OpenXskd(dsMx['DDID']);
end;

procedure TfrmXssk.SetJYJ;
begin
  if dsZb = nil then exit;
  if DBCheckBox2.Checked then
    labJYJ.Caption := FormatFloat('#,0.00', dsZb.FieldByName('JEA').AsFloat)
  else
    labJYJ.Caption := '0.00';
  SetKYZJE;
  screen.Cursor := crDefault;
end;

procedure TfrmXssk.SetKYZJE;
begin
  if (labJYJ.Caption = 'labJYJ') or (labJED.Caption = 'labJED') then Exit;
  labKYZJE.Caption := FormatFloat('#,0.00', Str2Float(labJYJ.Caption) + dsZb.FieldByName('JE').AsFloat);
  SetSKHYE;
end;

procedure TfrmXssk.SetSKHYE;
begin
  labSKHYE.Caption := FormatFloat('#,0.00', Str2Float(labKYZJE.Caption) - Str2Float(labJED.Caption));
  if dsZb.State in [dsInsert, dsEdit] then
    dsZb['JEB'] := dsZb.FieldByName('JE').AsFloat - Str2Float(labJED.Caption);
end;

procedure TfrmXssk.SetJEABCD;
var
  dblJEA, dblJEB, dblJEC, dblJED: double;
begin
  dblJEA := 0;
  dblJEB := 0;
  dblJEC := 0;
  dblJED := 0;
  with dsMx do
  begin
    First;
    while not Eof do
    begin
      dblJEA := dblJEA + dsMx['aDDJE'];
      dblJEB := dblJEB + dsMx['aYSJE'];
      dblJEC := dblJEC + dsMx['aMSJE'];
      dblJED := dblJED + dsMx['JE'];
      Next;
    end;
    First;
  end;
  labJEA.Caption := FormatFloat('#,0.00', dblJEA);
  labJEB.Caption := FormatFloat('#,0.00', dblJEB);
  labJEC.Caption := FormatFloat('#,0.00', dblJEC);
  labJED.Caption := FormatFloat('#,0.00', dblJED);
end;

procedure TfrmXssk.DBGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
  aZdfkB.Execute;
end;

procedure TfrmXssk.aSaveExecute(Sender: TObject);
var
  blnErr: boolean;
begin
  if Str2Float(labKYZJE.Caption) = 0 then
  begin
    Application.MessageBox(Pchar('可用总金额不能为零, 请输入''收款金额''或选择''使用结余额''!'), '录入错误', MB_OK + MB_ICONWARNING);
    abort;
  end;
  if (dsZb.FieldByName('FKLX').AsInteger = 1) and (Str2Float(labJED.Caption) = 0) then
  begin
    Application.MessageBox(Pchar('收款金额没有付任何应收单据。（如果要进行预收收款，请选择''收款类型''为预收款）'), '录入错误', MB_OK + MB_ICONWARNING);
    abort;
  end;
  if (dsZb.FieldByName('FKLX').AsInteger = 1) and
    (Str2Float(labJED.Caption) > Str2Float(labKYZJE.Caption)) then
  begin
    Application.MessageBox(Pchar('本次收款总金额不应该大于可用总金额，请重新分配本次收款。'), '录入错误', MB_OK + MB_ICONWARNING);
    abort;
  end;
  blnErr := False;
  with dsMx do
  begin
    First;
    while not Eof do
    begin
      if FieldByName('JE').AsFloat > FieldByName('aMSJE').AsFloat then
      begin
        blnErr := True;
        DBGrid1.SelectedIndex := DBGrid1.FieldCount - 1;
        Break;
      end;
      Next;
    end;
    if not blnErr then
      First;
  end;
  if blnErr then
  begin
    Application.MessageBox(Pchar('本次收款不应该大于销售单末收金额。'), '录入错误', MB_OK + MB_ICONWARNING);
    abort;
  end;
  if (dsZb.FieldByName('FKLX').AsInteger = 1) and
    (Str2Float(labJED.Caption) < Str2Float(labKYZJE.Caption)) then
    if Application.MessageBox( '收款有结余，结余金额转入对应客户预收款中?',
      '询问', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1 ) = IDNO then
      abort;
  inherited;
end;

procedure TfrmXssk.btnCloseTsClick(Sender: TObject);
begin
  pnlTs.Visible := False;
end;

procedure TfrmXssk.aTsExecute(Sender: TObject);
begin
  pnlTs.Top := (self.Height - pnlTs.Height) div 2;
  pnlTs.Visible := True;
end;

procedure TfrmXssk.aKhXxExecute(Sender: TObject);
begin
  frmKhXx := TfrmKhXx.Create(Application);
  with frmKhXx do
  begin
    intKHID := dsZb.FieldByName('KHID').AsInteger;
    ShowModal;
    Free;
  end;
end;

end.

unit Cgsh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDj, Menus, DBCtrls, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask,
  Grids, DBGrids, Buttons, Db, CheckLst, ActnList, Variants;

type
  TfrmCgsh = class(TfrmComDj)
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
    Label5: TLabel;
    DBComboBox1: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    ToolButton1: TToolButton;
    aXzdd: TAction;
    ToolButton4: TToolButton;
    N7: TMenuItem;
    N8: TMenuItem;
    Label8: TLabel;
    DBComboBox2: TDBComboBox;
    pnlZt: TPanel;
    spZt: TShape;
    labZt: TLabel;
    aFkgc: TAction;
    H1: TMenuItem;
    ToolButton2: TToolButton;
    DBComboBox3: TDBComboBox;
    Label15: TLabel;
    Label18: TLabel;
    DBEdit5: TDBEdit;
    Label16: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label17: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    Label13: TLabel;
    procedure IniRecord;override;
    procedure TotalField(Kind: char; Field: TField);override;
    procedure ZbOnNewRecord(DataSet: TDataSet);override;
    procedure MxOnNewRecord(DataSet: TDataSet);override;
    procedure sZbDataChange(Sender: TObject; Field: TField);override;
    procedure sMxDataChange(Sender: TObject; Field: TField);override;
    procedure btnGysHelpClick(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure FormShow(Sender: TObject);override;
    procedure DBComboBox2Change(Sender: TObject);
    procedure aXzddExecute(Sender: TObject);
    procedure aFkgcExecute(Sender: TObject);
    procedure DBLookupComboBoxDelete(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZbBeforePost(DataSet: TDataSet);override;
  private
    { private declarations }
    procedure SetNSL(const ANSL: integer);
    procedure SetZt;
  public
    { Public declarations }
  end;

var
  frmCgsh: TfrmCgsh;

implementation

uses Dm, Common, Main, MyLib, GysHelp, HpHelp, ComFun, CgddHelp;

{$R *.DFM}

procedure TfrmCgsh.FormShow(Sender: TObject);
begin
  strZbMxKey := 'ID,ZBID; RQ,RQ; CKID,CKID';
  strZbKeyFields := 'DJBH; RQ; AGYSBH; CKID; ACGLX; AFPLX';
  strMxKeyFields := 'ABH';
  strZbHelpFields := 'AGYSBH';
  strMxHelpFields := 'ABH';
  strMxHh := 'HH';
  blnSetZbID := True;
  strAutoScale := 'DBGrid1';
  ValuesToStrings(DBComboBox1.Items, 'select XM from YG where YWYBZ order by BH');
  inherited;
  SetZt;
end;

procedure TfrmCgsh.IniRecord;
begin
  //同时更新 frmZB.dsAfterScroll
  dsMx.CommandText :=
    'select M.*, ' +
    'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
    'from CGSH M, HP H, M inner join H on M.HPID=H.ID ' +
    'where ZBID = ' + Float2Str(dsZb['ID']);
  inherited;
  SetZt;
end;

procedure TfrmCgsh.ZbOnNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet['RQ'] := Date;
  DataSet['CKID'] := pintCKID;
  DataSet['ACGLX'] := DBComboBox3.Items[0];
  DataSet['AFPLX'] := DBComboBox2.Items[0];
  DataSet['YWY'] := '';
  DataSet['CZY'] := pstrUserName;
end;

procedure TfrmCgsh.SetZt;
begin
  //Set pnlZt
  pnlZt.Visible := False;
  if dsZb.FieldByName('CGLX').AsInteger = 1 then
  begin
    spZt.Pen.Color := clBlue;
    labZt.Font.Color := spZt.Pen.Color;
    labZt.Caption := '现款采购';
    pnlZt.Visible := True;
  end
  else if (dsZb.FieldByName('CGLX').AsFloat = 2) and (dsZb.FieldByName('JE').AsFloat <> 0) and (dsZb.FieldByName('YFJE').AsFloat >= dsZb.FieldByName('JE').AsFloat) then
  begin
    spZt.Pen.Color := clGreen;
    labZt.Font.Color := spZt.Pen.Color;
    labZt.Caption := '付款完毕';
    pnlZt.Visible := True;
  end;
  //Other
  //收款期限
  Label12.Enabled := DBComboBox3.ItemIndex = 1;
  Label13.Enabled := DBComboBox3.ItemIndex = 1;
  DBEdit4.Enabled := DBComboBox3.ItemIndex = 1;
  //票号，收款方式，去向
  Label16.Enabled := DBComboBox3.ItemIndex = 0;
  DBEdit5.Enabled := DBComboBox3.ItemIndex = 0;
  Label17.Enabled := DBComboBox3.ItemIndex = 0;
  DBLookupComboBox2.Enabled := DBComboBox3.ItemIndex = 0;
  Label18.Enabled := DBComboBox3.ItemIndex = 0;
  DBLookupComboBox3.Enabled := DBComboBox3.ItemIndex = 0;
  if dsZb.State in [dsInsert, dsEdit] then
  begin
    if DBComboBox3.ItemIndex = 0 then
      DBedit4.Text := '0';
    if DBComboBox3.ItemIndex > 0 then
    begin
      DBLookupComboBox2.Field.Value := 0;
      DBLookupComboBox3.Field.Value := 0;
    end;
  end;
  if DBLookupComboBox2.Enabled and not Data.SFKFS.Active then
    Data.SFKFS.Open;
  if DBLookupComboBox3.Enabled and not Data.ZH.Active then
    Data.ZH.Open;
end;

procedure TfrmCgsh.btnGysHelpClick(Sender: TObject);
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

procedure TfrmCgsh.sZbDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [dsInsert, dsEdit]) then
  begin
    if (UpperCase(Field.FieldName) = 'RQ') then
      dsZb['DJBH'] := GetDjbh('CS', Field.AsDateTime, 'CGSHZB');
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
    if (UpperCase(Field.FieldName) = 'ACGLX') then
    begin
      dsZb['CGLX'] := DBComboBox3.ItemIndex + 1;
      SetZt;
    end;
    if (UpperCase(Field.FieldName) = 'AFPLX') then
      dsZb['FPLX'] := DBComboBox2.ItemIndex + 1;
    if (UpperCase(Field.FieldName) = 'CKID') then
      dsZb['aCKMC'] := DBLookupComboBox1.Text;
    if (UpperCase(Field.FieldName) = 'SFKFSID') then
    begin
      dsZb['aSFKFSMC'] := DBLookupComboBox2.Text;
      dsZb['ZHID'] := DBLookupComboBox2.ListSource.DataSet['ZHID'];
    end;
    if (UpperCase(Field.FieldName) = 'ZHID') then
      dsZb['aZHMC'] := DBLookupComboBox3.Text;
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
    if (UpperCase(Field.FieldName) = 'CGLX') or (UpperCase(Field.FieldName) = 'JE') then
    begin
      if dsZb.FieldByName('CGLX').AsInteger = 1 then
        dsZb['YFJE1'] := dsZb['JE']
      else
        dsZb['YFJE1'] := dsZb['YFJE'];
      dsZb['MFJE'] := dsZb['JE'] - dsZb['YFJE1'];
    end;
  end;
end;

procedure TfrmCgsh.TotalField(Kind: char; Field: TField);
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

procedure TfrmCgsh.MxOnNewRecord(DataSet: TDataSet);
begin
  inherited;
  if DBComboBox1.ItemIndex = 2 then
    DataSet['NSL'] := 17;
end;

procedure TfrmCgsh.sMxDataChange(Sender: TObject; Field: TField);
var
  dblSX, dblZKCL: double;
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
    if (UpperCase(Field.FieldName) = 'SL') and (Field.AsFloat <> 0)
      and (dsMx.State in [dsInsert]) then
    begin
      dblSX := VarToFloat(GetFieldValue('select SX from HP where ID = ' + Float2Str(dsMx['HPID'])));
      if dblSX <> 0 then
      begin
        dblZKCL := VarToFloat(GetFieldValue('select sum(JCS) from HPKC where HPID = ' + Float2Str(dsMx['HPID'])));
        if dblZKCL + Field.AsFloat > dblSX then
          Application.MessageBox(Pchar('收货后，货品''' + VarToStr(dsMx['aPM']) + '''的总库存量已经超过设定的库存上限。'), '提醒你', MB_OK + MB_ICONWARNING);
      end;
    end;
  end;
end;

procedure TfrmCgsh.DBGrid1EditButtonClick(Sender: TObject);
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

//设置税率
procedure TfrmCgsh.DBComboBox2Change(Sender: TObject);
begin
  if DBComboBox2.ItemIndex = 2 then
    SetNSL(17)
  else
    SetNSL(0);
end;

procedure TfrmCgsh.SetNSL(const ANSL: integer);
var
  bmMx: TBookMark;
begin
  with dsMx do
  begin
    bmMx := GetBookmark;
    try
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('NSL').AsFloat := ANSL;
        Post;
        Next;
      end;
      GotoBookmark(bmMx);
    finally
      FreeBookmark(bmMx);
    end;
  end;
end;

//选择订单
procedure TfrmCgsh.aXzddExecute(Sender: TObject);
begin
  if dsZb.FieldByName('aGYSBH').AsString = '' then
  begin
    Application.MessageBox('请先录入供应商资料。', '提醒你', MB_OK + MB_ICONWARNING);
    DBEdit2.SetFocus;
    Exit;
  end;
  frmCgddHelp := TFrmCgddHelp.Create(Application);
  with frmCgddHelp do
  begin
    dsEditing := self.dsMx;
    Edit1.Text := self.DBEdit7.Text;
    dtpRqa.Date := StrToDate(DBEdit1.Text) - 30;
    dtpRqb.Date := StrToDate(DBEdit1.Text);
    ShowModal;
    if dsZb['aGYSBH'] <> dsHelp['aGYSBH'] then
      dsZb['aGYSBH'] := dsHelp['aGYSBH'];
    Free;
  end;
end;

//付款过程
procedure TfrmCgsh.aFkgcExecute(Sender: TObject);
begin
  OpenCgFkgc(dsZb['ID']);
end;

procedure TfrmCgsh.DBLookupComboBoxDelete(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Sender is TDBLookupComboBox) then
  begin
    TDBLookupComboBox(Sender).DataSource.DataSet.Edit;
    TDBLookupComboBox(Sender).Field.Value := 0;
  end;
end;

procedure TfrmCgsh.ZbBeforePost(DataSet: TDataSet);
begin
  if (dsZb.FieldByName('CGLX').AsInteger = 1) and
    ((dsZb.FieldByName('SFKFSID').AsInteger = 0) or
    (dsZb.FieldByName('ZHID').AsInteger = 0))then
  begin
    Application.MessageBox('''付款方式''或''付款来源''未录入, 请继续录入!', '录入错误', MB_OK + MB_ICONWARNING);
    DBLookupComboBox2.SetFocus;
    Abort;
  end;
  inherited;
end;

end.

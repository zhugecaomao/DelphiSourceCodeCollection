unit Xskd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDj, Menus, DBCtrls, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask,
  Grids, DBGrids, Buttons, Db, CheckLst, ActnList, Variants;

type
  TfrmXskd = class(TfrmComDj)
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    Label7: TLabel;
    DBText1: TDBText;
    btnKhHelp: TSpeedButton;
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
    aSkgc: TAction;
    H1: TMenuItem;
    ToolButton2: TToolButton;
    Label11: TLabel;
    DBEdit3: TDBEdit;
    aKhXx: TAction;
    N12: TMenuItem;
    K1: TMenuItem;
    Label15: TLabel;
    DBComboBox3: TDBComboBox;
    Label16: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label17: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label18: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    Label13: TLabel;
    procedure IniRecord;override;
    procedure TotalField(Kind: char; Field: TField);override;
    procedure ZbOnNewRecord(DataSet: TDataSet);override;
    procedure MxOnNewRecord(DataSet: TDataSet);override;
    procedure sZbDataChange(Sender: TObject; Field: TField);override;
    procedure sMxDataChange(Sender: TObject; Field: TField);override;
    procedure btnKhHelpClick(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure FormShow(Sender: TObject);override;
    procedure DBComboBox2Change(Sender: TObject);
    procedure aXzddExecute(Sender: TObject);
    procedure aSkgcExecute(Sender: TObject);
    procedure aKhXxExecute(Sender: TObject);
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
  frmXskd: TfrmXskd;

implementation

uses Dm, Common, Main, MyLib, KhHelp, HpHelp, ComFun, XsddHelp, KhXx;

{$R *.DFM}

procedure TfrmXskd.FormShow(Sender: TObject);
begin
  strZbMxKey := 'ID,ZBID; RQ,RQ; CKID,CKID';
  strZbKeyFields := 'DJBH; RQ; AKHBH; CKID; AXSLX; AFPLX';
  strMxKeyFields := 'ABH';
  strZbHelpFields := 'AKHBH';
  strMxHelpFields := 'ABH';
  strMxHh := 'HH';
  blnSetZbID := True;
  strAutoScale := 'DBGrid1';
  ValuesToStrings(DBComboBox1.Items, 'select XM from YG where YWYBZ order by BH');
  inherited;
end;

procedure TfrmXskd.IniRecord;
begin
  //同时更新 frmZB.dsAfterScroll frmHelp.dsAfterScroll
  dsMx.CommandText :=
    'select M.*, ' +
    'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
    'from XSKD M, HP H, M inner join H on M.HPID=H.ID ' +
    'where ZBID = ' + Float2Str(dsZb['ID']) + ' order by M.HH';
  inherited;
  SetZt;
end;

procedure TfrmXskd.SetZt;
begin
  //Set pnlZt
  pnlZt.Visible := False;
  if dsZb.FieldByName('XSLX').AsInteger = 1 then
  begin
    spZt.Pen.Color := clBlue;
    labZt.Font.Color := spZt.Pen.Color;
    labZt.Caption := '现款销售';
    pnlZt.Visible := True;
  end
  else if (dsZb.FieldByName('XSLX').AsFloat = 2) and (dsZb.FieldByName('JE').AsFloat <> 0) and (dsZb.FieldByName('YSJE').AsFloat >= dsZb.FieldByName('JE').AsFloat) then
  begin
    spZt.Pen.Color := clGreen;
    labZt.Font.Color := spZt.Pen.Color;
    labZt.Caption := '收款完毕';
    pnlZt.Visible := True;
  end;
  //Other
  //收款期限
  Label12.Enabled := DBComboBox3.ItemIndex = 1;
  Label13.Enabled := DBComboBox3.ItemIndex = 1;
  DBEdit4.Enabled := DBComboBox3.ItemIndex = 1;
  //票号，收款方式，去向
  Label18.Enabled := DBComboBox3.ItemIndex = 0;
  DBEdit5.Enabled := DBComboBox3.ItemIndex = 0;
  Label16.Enabled := DBComboBox3.ItemIndex = 0;
  DBLookupComboBox2.Enabled := DBComboBox3.ItemIndex = 0;
  Label17.Enabled := DBComboBox3.ItemIndex = 0;
  DBLookupComboBox3.Enabled := DBComboBox3.ItemIndex = 0;
  if dsZb.State in [dsInsert, dsEdit] then
  begin
    if DBComboBox3.ItemIndex = 0 then
      DBedit4.Text := '0';
    if DBComboBox3.ItemIndex = 1 then
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

procedure TfrmXskd.ZbOnNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet['RQ'] := Date;
  DataSet['CKID'] := pintCKID;
  DataSet['AXSLX'] := DBComboBox3.Items[0];
  DataSet['AFPLX'] := DBComboBox2.Items[0];
  DataSet['YWY'] := '';
  DataSet['CZY'] := pstrUserName;
end;

procedure TfrmXskd.btnKhHelpClick(Sender: TObject);
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

procedure TfrmXskd.sZbDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [dsInsert, dsEdit]) then
  begin
    if (UpperCase(Field.FieldName) = 'RQ') then
      dsZb['DJBH'] := GetDjbh('XD', Field.AsDateTime, 'XSKDZB');
    if (UpperCase(Field.FieldName) = 'AKHBH') then
      with CurDs do
      begin
        CommandText := 'select * from KH where BH = ''' + Field.AsString + '''';
        Open;
        if not IsEmpty then
        begin
          dsZb['KHID'] := FieldValues['ID'];
          dsZb['aKHMC'] := FieldValues['MC'];
        end
        else
          Screen.ActiveControl.Perform(WM_LBUTTONDBLCLK, 0, 0);
        Close;
      end;
    if (UpperCase(Field.FieldName) = 'AXSLX') then
    begin
      dsZb['XSLX'] := DBComboBox3.ItemIndex + 1;
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
    if (UpperCase(Field.FieldName) = 'XSLX') or (UpperCase(Field.FieldName) = 'JE') then
    begin
      if dsZb.FieldByName('XSLX').AsInteger = 1 then
        dsZb['YSJE1'] := dsZb['JE']
      else
        dsZb['YSJE1'] := dsZb['YSJE'];
      dsZb['MSJE'] := dsZb['JE'] - dsZb['YSJE1'];
    end;
  end;
end;

procedure TfrmXskd.TotalField(Kind: char; Field: TField);
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

procedure TfrmXskd.MxOnNewRecord(DataSet: TDataSet);
begin
  inherited;
  if DBComboBox1.ItemIndex = 2 then
    DataSet['NSL'] := 17;
end;

procedure TfrmXskd.sMxDataChange(Sender: TObject; Field: TField);
var
  dblXX, dblZKCL: double;
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
          dsMx['CBDJ'] := FieldValues['JQJ'];
          dsMx['DJ'] := GetSj(FieldByName('ID').AsInteger, pintSJID);
        end
        else
          DBGrid1EditButtonClick(nil);
        Close;
      end;
    if (UpperCase(Field.FieldName) = 'SL') and (Field.AsFloat <> 0)
      and (dsMx.State in [dsInsert]) then
    begin
      dblZKCL := VarToFloat(GetFieldValue('select sum(JCS) from HPKC where HPID = ' + Float2Str(dsMx['HPID'])));
      if dblZKCL - Field.AsFloat < 0 then
        Application.MessageBox(Pchar('发货后，货品''' + VarToStr(dsMx['aPM']) + '''的总库存量将出现负数。'), '提醒你', MB_OK + MB_ICONWARNING)
      else
      begin
        dblXX := VarToFloat(GetFieldValue('select XX from HP where ID = ' + Float2Str(dsMx['HPID'])));
        if dblXX <> 0 then
          if dblZKCL - Field.AsFloat < dblXX then
            Application.MessageBox(Pchar('发货后，货品''' + VarToStr(dsMx['aPM']) + '''的总库存量已经低于设定的库存下限。'), '提醒你', MB_OK + MB_ICONWARNING);
      end;
    end;
  end;
end;

procedure TfrmXskd.DBGrid1EditButtonClick(Sender: TObject);
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
procedure TfrmXskd.DBComboBox2Change(Sender: TObject);
begin
  if DBComboBox2.ItemIndex = 2 then
    SetNSL(17)
  else
    SetNSL(0);
end;

procedure TfrmXskd.SetNSL(const ANSL: integer);
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
procedure TfrmXskd.aXzddExecute(Sender: TObject);
begin
  if dsZb.FieldByName('aKHBH').AsString = '' then
  begin
    Application.MessageBox('请先录入客户资料。', '提醒你', MB_OK + MB_ICONWARNING);
    DBEdit2.SetFocus;
    Exit;
  end;
  frmXsddHelp := TFrmXsddHelp.Create(Application);
  with frmXsddHelp do
  begin
    dsEditing := self.dsMx;
    Edit1.Text := self.DBEdit7.Text;
    dtpRqa.Date := StrToDate(DBEdit1.Text) - 30;
    dtpRqb.Date := StrToDate(DBEdit1.Text);
    ShowModal;
    if dsZb['aKHBH'] <> dsHelp['aKHBH'] then
      dsZb['aKHBH'] := dsHelp['aKHBH'];
    Free;
  end;
end;

//付款过程
procedure TfrmXskd.aSkgcExecute(Sender: TObject);
begin
  OpenXsSkgc(dsZb['ID']);
end;

procedure TfrmXskd.aKhXxExecute(Sender: TObject);
begin
  frmKhXx := TfrmKhXx.Create(Application);
  with frmKhXx do
  begin
    intKHID := dsZb.FieldByName('KHID').AsInteger;
    ShowModal;
    Free;
  end;
end;

procedure TfrmXskd.DBLookupComboBoxDelete(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Sender is TDBLookupComboBox) then
  begin
    TDBLookupComboBox(Sender).DataSource.DataSet.Edit;
    TDBLookupComboBox(Sender).Field.Value := 0;
  end;
end;

procedure TfrmXskd.ZbBeforePost(DataSet: TDataSet);
var
  dXYED, dQMJE: double;
begin
  inherited;
  if (dsZb.FieldByName('XSLX').AsInteger = 1) and
    ((dsZb.FieldByName('SFKFSID').AsInteger = 0) or
    (dsZb.FieldByName('ZHID').AsInteger = 0)) then
  begin
    Application.MessageBox('''收款方式''或''收款去向''未录入, 请继续录入!', '录入错误', MB_OK + MB_ICONWARNING);
    DBLookupComboBox2.SetFocus;
    Abort;
  end;
  if (dsZb.FieldByName('XSLX').AsInteger = 2) then
  begin
    with CurDs do
    begin
      CommandText := 'select XYED, QMJE from KH where ID = ' + IntToStr(dsZb['KHID']);
      Open;
      dXYED := Fields[0].AsFloat;
      dQMJE := Fields[1].AsFloat;
      Close;
    end;
    if (dsZb.State in [dsInsert]) and (dXYED <> 0) and
      (dQMJE + dsZb.FieldByName('JE').AsFloat > dXYED) and
      (Application.MessageBox('客户欠款金额已经超过其信用额度, 是否续销售这批货品给该客户?',
      '提醒你', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDNO) then
      Abort;
  end;
end;

end.

unit Xsth;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDj, Menus, DBCtrls, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask,
  Grids, DBGrids, Buttons, Db, CheckLst, ActnList, Variants;

type
  TfrmXSth = class(TfrmComDj)
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
    aShd: TAction;
    ToolButton4: TToolButton;
    N7: TMenuItem;
    N8: TMenuItem;
    DBEdit3: TDBEdit;
    Label11: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label12: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label8: TLabel;
    DBComboBox2: TDBComboBox;
    Label10: TLabel;
    aKhXx: TAction;
    N12: TMenuItem;
    K1: TMenuItem;
    procedure IniRecord;override;
    procedure TotalField(Kind: char; Field: TField);override;
    procedure ZbOnNewRecord(DataSet: TDataSet);override;
    procedure sZbDataChange(Sender: TObject; Field: TField);override;
    procedure sMxDataChange(Sender: TObject; Field: TField);override;
    procedure btnKhHelpClick(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure FormShow(Sender: TObject);override;
    procedure aShdExecute(Sender: TObject);
    procedure aKhXxExecute(Sender: TObject);
    procedure ZbBeforePost(DataSet: TDataSet);override;
    procedure DBComboBox2Exit(Sender: TObject);
  private
    { private declarations }
    procedure SetZt;
  public
    { Public declarations }
  end;

var
  frmXSth: TfrmXSth;

implementation

uses Dm, Common, Main, MyLib, KhHelp, HpHelp, ComFun, CgddHelp, KhXx,
  XskdHelp;

{$R *.DFM}

procedure TfrmXSth.FormShow(Sender: TObject);
begin
  strZbMxKey := 'ID,ZBID; RQ,RQ; CKID,CKID';
  strZbKeyFields := 'DJBH; RQ; AKHBH; CKID; ATHLX';
  strMxKeyFields := 'ABH';
  strZbHelpFields := 'AKHBH';
  strMxHelpFields := 'ABH';
  strMxHh := 'HH';
  blnSetZbID := True;
  strAutoScale := 'DBGrid1';
  ValuesToStrings(DBComboBox1.Items, 'select XM from YG where YWYBZ order by BH');
  inherited;
end;

procedure TfrmXSth.IniRecord;
begin
  //同时更新 frmZB.dsAfterScroll
  dsMx.CommandText :=
    'select M.*, ' +
    'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
    'from XSTH M, HP H, M inner join H on M.HPID=H.ID ' +
    'where ZBID = ' + Float2Str(dsZb['ID']);
  inherited;
  SetZt;
end;

procedure TfrmXSth.ZbOnNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet['RQ'] := Date;
  DataSet['CKID'] := pintCKID;
  DataSet['ATHLX'] := DBComboBox2.Items[0];
  DataSet['SFKFSID'] := Data.Sfkfs['ID'];
  DataSet['YWY'] := '';
  DataSet['CZY'] := pstrUserName;
end;

procedure TfrmXSth.btnKhHelpClick(Sender: TObject);
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

procedure TfrmXSth.sZbDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (Field <> nil) and (TDataSource(Sender).State in [dsInsert, dsEdit]) then
  begin
    if (UpperCase(Field.FieldName) = 'RQ') then
      dsZb['DJBH'] := GetDjbh('XT', Field.AsDateTime, 'XSTHZB');
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
    if (UpperCase(Field.FieldName) = 'ATHLX') then
    begin
      dsZb['THLX'] := DBComboBox2.ItemIndex + 1;
      SetZt;
    end;
    if (UpperCase(Field.FieldName) = 'CKID') then
      dsZb['aCKMC'] := DBLookupComboBox1.Text;
    if (UpperCase(Field.FieldName) = 'SFKFSID') then
    begin
      dsZb['aSFKFSMC'] := DBLookupComboBox2.Text;
      dsZb['ZHID'] := DBLookupComboBox2.ListSource.DataSet['ZHID'];
    end;
    if (UpperCase(Field.FieldName) = 'ZHID') then
      dsZb['aZHMC'] := DBLookupComboBox2.Text;
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

procedure TfrmXSth.TotalField(Kind: char; Field: TField);
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

procedure TfrmXSth.sMxDataChange(Sender: TObject; Field: TField);
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
      dblSX := VarToFloat(GetFieldValue('select SX from HP where ID = ' + Float2Str(dsMx['HPID'])));
      if dblSX <> 0 then
      begin
        dblZKCL := VarToFloat(GetFieldValue('select sum(JCS) from HPKC where HPID = ' + Float2Str(dsMx['HPID'])));
        if dblZKCL + Field.AsFloat > dblSX then
          Application.MessageBox(Pchar('退入后，货品''' + VarToStr(dsMx['aPM']) + '''的总库存量已经超过设定的库存上限。'), '提醒你', MB_OK + MB_ICONWARNING);
      end;
    end;
  end;
end;

procedure TfrmXSth.DBGrid1EditButtonClick(Sender: TObject);
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

//引用销售单
procedure TfrmXSth.aShdExecute(Sender: TObject);
begin
  if dsZb.FieldByName('aKHBH').AsString = '' then
  begin
    Application.MessageBox('请先录入客户资料。', '提醒你', MB_OK + MB_ICONWARNING);
    DBEdit2.SetFocus;
    Exit;
  end;
  frmXskdHelp := TFrmXskdHelp.Create(Application);
  with frmXskdHelp do
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

procedure TfrmXSth.aKhXxExecute(Sender: TObject);
begin
  frmKhXx := TfrmKhXx.Create(Application);
  with frmKhXx do
  begin
    intKHID := dsZb.FieldByName('KHID').AsInteger;
    ShowModal;
    Free;
  end;
end;

procedure TfrmXSth.SetZt;
begin
  //票号，收款方式，去向
  Label10.Enabled := DBComboBox2.ItemIndex = 0;
  Label11.Enabled := DBComboBox2.ItemIndex = 0;
  Label12.Enabled := DBComboBox2.ItemIndex = 0;
  DBEdit3.Enabled := DBComboBox2.ItemIndex = 0;
  DBLookupComboBox2.Enabled := DBComboBox2.ItemIndex = 0;
  DBLookupComboBox3.Enabled := DBComboBox2.ItemIndex = 0;
  if dsZb.State in [dsInsert, dsEdit] then
    if DBComboBox2.ItemIndex = 1 then
    begin
      DBLookupComboBox2.Field.Value := 0;
      DBLookupComboBox3.Field.Value := 0;
    end;
  if DBLookupComboBox2.Enabled and not Data.SFKFS.Active then
    Data.SFKFS.Open;
  if DBLookupComboBox3.Enabled and not Data.ZH.Active then
    Data.ZH.Open;
end;

procedure TfrmXSth.ZbBeforePost(DataSet: TDataSet);
begin
  if (dsZb.FieldByName('THLX').AsInteger = 1) and
    ((dsZb.FieldByName('SFKFSID').AsInteger = 0) or
    (dsZb.FieldByName('ZHID').AsInteger = 0))then
  begin
    Application.MessageBox('''付款方式''或''退款帐户''未录入, 请继续录入!', '录入错误', MB_OK + MB_ICONWARNING);
    DBLookupComboBox2.SetFocus;
    Abort;
  end;
  inherited;
end;

procedure TfrmXSth.DBComboBox2Exit(Sender: TObject);
begin
  if not Label11.Enabled then
    DBGrid1.SetFocus; 
end;

end.

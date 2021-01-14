unit uFM_3080;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_FM, ExtCtrls, Grids, DBGrids, DBVrtNav, StdCtrls, Spin, Buttons, Db,
  DBTables, Mask, DBCtrls, ComCtrls, ToolWin, utilities, Variants;

type
  TFM_3080 = class(TS_Form)
    Panel2: TPanel;
    Panel4: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    DBVertNavigator1: TDBVertNavigator;
    DBGrid1: TDBGrid;
    BitBtn4: TBitBtn;
    SpinEdit1: TSpinEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Query1: TQuery;
    DataSource3: TDataSource;
    DBGrid2: TDBGrid;
    Query1F02: TStringField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    BitBtn3: TBitBtn;
    SB6: TSpeedButton;
    BitBtn2: TBitBtn;
    Query1F01: TStringField;
    Qry1: TQuery;
    Qry2: TQuery;
    Table2: TTable;
    Table2F01: TStringField;
    Table2F02: TStringField;
    Table2K_SN: TStringField;
    Table2D_SN: TStringField;
    Table2F03: TDateTimeField;
    Table2F04: TStringField;
    Table2F05: TFloatField;
    Table2F06: TFloatField;
    Table2F07: TFloatField;
    Table2F08: TStringField;
    Table2F09: TDateTimeField;
    Table2F10: TFloatField;
    Table2BUSER: TStringField;
    Table2BTIME: TDateTimeField;
    Table2EUSER: TStringField;
    Table2ETIME: TDateTimeField;
    Table1: TTable;
    Table1F01: TStringField;
    Table1F02: TStringField;
    Table1F03: TFloatField;
    Table1F04: TFloatField;
    Table1F05: TFloatField;
    Table1F06: TFloatField;
    Table1F07: TFloatField;
    Table1F08: TFloatField;
    Table1F09: TFloatField;
    Table1F10: TFloatField;
    Table1F11: TFloatField;
    Table1F14: TFloatField;
    Table1BUSER: TStringField;
    Table1BTIME: TDateTimeField;
    Table1EUSER: TStringField;
    Table1ETIME: TDateTimeField;
    Table1CalF09: TFloatField;
    Table1CalF10: TFloatField;
    Table1CalF11: TFloatField;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Table2CalF10: TFloatField;
    Query1F03: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SB6Click(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure Table2BeforePost(DataSet: TDataSet);
    procedure Table2BeforeDelete(DataSet: TDataSet);
    procedure Table2AfterDelete(DataSet: TDataSet);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure Table2AfterPost(DataSet: TDataSet);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Table2CalcFields(DataSet: TDataSet);
    procedure Panel4Exit(Sender: TObject);
    procedure Panel5Exit(Sender: TObject);
    procedure Table2BeforeInsert(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table1AfterEdit(DataSet: TDataSet);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure Table1F06Validate(Sender: TField);
    procedure Table1F07Validate(Sender: TField);
    procedure Table1F08Validate(Sender: TField);
    procedure Table1F14Validate(Sender: TField);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_3080: TFM_3080;
  iSN:integer;
  procedure EValue_IsNotNull(Sender: TField; sDefVal: string='');
implementation

uses uDataBaseEValue,uConstant;

{$R *.DFM}

procedure TFM_3080.FormCreate(Sender: TObject);
begin
  inherited;
  SpinEdit1.Text := formatdatetime('yyyy',date);
  ComboBox1.ItemIndex := strtoint(formatdatetime('mm',date))-1;
  Query1.Params[0].AsString := copy(SpinEdit1.Text,3,2)+combobox1.Text;
  Query1.Close;
  Query1.Open;
end;

procedure TFM_3080.BitBtn4Click(Sender: TObject);
begin
  inherited;
  Query1.Params[0].AsString := copy(SpinEdit1.Text,3,2)+combobox1.Text;
  Query1.Close;
  Query1.Open;

end;

procedure TFM_3080.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if Table1.State in [dsInsert,dsEdit] then Table1.Cancel;
  BitBtn3.Enabled := false;
  BitBtn2.Enabled := false;
end;

procedure TFM_3080.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if Table1.State in [dsInsert,dsEdit] then Table1.Post;
  BitBtn3.Enabled := false;
  BitBtn2.Enabled := false;
end;

procedure TFM_3080.SB6Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFM_3080.DBGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedField = Table2F03  then AssignDBDate(Sender, DataSource2, 'F03');
  if DBGrid1.SelectedField = Table2F09  then AssignDBDate(Sender, DataSource2, 'F09');
  if DBGrid1.SelectedField = Table2F04  then
    Select_Data(DataSource2,'币别点选窗口','select F01 as 币别,F02 AS 汇率 from T1100','STK0311',['F04','F05'],[0,1],[]);

end;

procedure TFM_3080.Table2BeforePost(DataSet: TDataSet);
begin
  inherited;
  Table2F10.AsFloat := Table2CalF10.AsFloat;
  if Table2F04.AsString = ''  then
  begin
    R_OKMessage(['请输入币别栏位']);
    Abort;
  end;
  if Table2.State in [dsInsert] then
  begin
    QryExec(Qry1,'select Max(K_SN) as MaxK_SN from T3060A where F01='''+Table1F01.AsString+''' and F02='''+Table1F02.AsString+'''');
      if Qry1.Fields[0].IsNull then
        Table2K_SN.AsInteger := 1 else
          Table2K_SN.AsInteger := Qry1.Fields[0].asinteger+1;

    QryExec(Qry1,'select Max(D_SN) as MaxD_SN from T3060A where F01='''+Table1F01.AsString+''' and F02='''+Table1F02.AsString+'''') ;
      if  Qry1.Fields[0].IsNull then
        Table2D_SN.AsInteger := 1 else
          Table2D_SN.AsInteger := Qry1.Fields[0].asinteger+1;
  end;



end;

procedure TFM_3080.Table2BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  iSN := Table2D_SN.AsInteger;
end;

procedure TFM_3080.Table2AfterDelete(DataSet: TDataSet);
begin
  inherited;
  QryExec(Qry1,'select Max(D_SN) as MaxSN from T3060A');
  if iSN < Qry1.FieldByName('MaxSN').asinteger then
     Qry1.Close;
     Qry1.SQL.Clear;
     Qry1.SQL.Add('Update T3060A set D_SN=D_SN-1 where D_SN > '''+inttostr(iSN)+''''+' and F01='''+Table1F01.AsString+''' and F02='''+Table1F02.AsString+'''');
     Qry1.ExecSQL;
     Table2.Refresh;
  Table1.Edit;
  Table1.Post;
end;

procedure TFM_3080.Table1CalcFields(DataSet: TDataSet);
var
  iDSum:real;
begin
  inherited;
  iDSum := 0;
  Table1CalF09.AsFloat := Table1F03.AsFloat+Table1F14.AsFloat-Table1F06.AsFloat-Table1F07.AsFloat-Table1F08.AsFloat-Table1F04.AsFloat;
  QryExec(Qry1,'select F04,sum(F10) as DSum from T3060A where F01='''+Table1F01.AsString+''' and F02='''+Table1F02.AsString+''' Group by F04');
  Qry1.First;
  while not Qry1.Eof do
  begin
    QryExec(Qry2,'Select F02 from T1100 where F01='''+Qry1.Fieldbyname('F04').asstring+'''');
    iDSum := DealFractional(iDSum + Qry1.FieldbyName('DSum').asfloat*Qry2.FieldbyName('F02').AsFloat,2);
    Qry1.Next;
  end;
  Table1CalF10.AsFloat := iDSum;
  Table1CalF11.AsFloat := Table1CalF09.AsFloat-iDSum;
end;

procedure TFM_3080.Table2AfterPost(DataSet: TDataSet);
begin
  inherited;
  Table1.Edit;
  Table1.Post;
end;

procedure TFM_3080.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  Table1F09.AsFloat := Table1CalF09.AsFloat;
  Table1F10.AsFloat := Table1CalF10.AsFloat;
  Table1F11.AsFloat := Table1CalF11.AsFloat;

end;

procedure TFM_3080.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Table1.State in [dsEdit] then
    if R_YesNoMessage(['是否存档']) then Table1.Post;
  if Table1.State in [dsInsert,dsEdit] then
    if R_YesNoMessage(['是否存档']) then Table2.Post;
end;

procedure TFM_3080.Table2CalcFields(DataSet: TDataSet);
begin
  inherited;
  Table2CalF10.AsFloat := Table2F06.AsFloat + Table2F07.AsFloat;
end;

procedure TFM_3080.Panel4Exit(Sender: TObject);
begin
  inherited;
  BitBtn3.Click ;
end;

procedure TFM_3080.Panel5Exit(Sender: TObject);
begin
  inherited;
  if Table2.State in [dsInsert,dsEdit] then
    Table2.Post;
end;

procedure TFM_3080.Table2BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if Table1F01.AsString='' then
  begin
    R_OKMessage(['主档无冲帐资料']);
    Abort;
  end;
end;

procedure TFM_3080.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  if Table1.State in [dsBrowse] then
  begin
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := false;
  end
  else
    begin
    BitBtn2.Enabled := true;
    BitBtn3.Enabled := true;
  end;
end;

procedure TFM_3080.Table1AfterEdit(DataSet: TDataSet);
begin
  inherited;
  BitBtn2.Enabled := true;
  BitBtn3.Enabled := true;
end;

procedure TFM_3080.Table1BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if query1F02.AsString='' then
    begin
      r_okmessage(['无对应客户资料!']);
      abort;
    end;
end;


procedure EValue_IsNotNull(Sender: TField; sDefVal: string='');
begin
  if linFieldCheck then exit;
  if (Sender.IsNull) or (varToStr(Sender.value)='') then
    if (sDefVal<>'') then
      Sender.AsString := sDefVal
    else
    begin
      R_OkMessage([Sender.DisplayName],rValue_isnotnull);
      linFieldCheck := True;
      Sender.FocusControl;
      linFieldCheck := False;
      abort;
    end;
end;

procedure TFM_3080.Table1F06Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(sender,table1f06.AsString);
end;

procedure TFM_3080.Table1F07Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(sender,table1f07.AsString);
end;

procedure TFM_3080.Table1F08Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(sender,table1f08.AsString);
end;

procedure TFM_3080.Table1F14Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(sender,table1F14.AsString);
end;

end.

unit uFM_SYS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_FM, ToolEdit, RXDBCtrl, StdCtrls, DBCtrls, Db, Buttons, Mask,
  DBTables, ExtCtrls;

type
  TFM_SYS = class(TS_Form)
    Panel1: TPanel;
    Table1: TTable;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    BitBtn1: TBitBtn;
    Table1F01: TStringField;
    Table1F02: TStringField;
    Table1F03: TStringField;
    Table1F04: TStringField;
    Table1F05: TStringField;
    Table1F06: TStringField;
    Table1F07: TStringField;
    Table1F08: TStringField;
    Table1F09: TStringField;
    Table1F10: TStringField;
    Table1F11: TStringField;
    Table1F12: TStringField;
    Table1F13: TStringField;
    Table1F14: TStringField;
    Table1F15: TStringField;
    Table1F16: TStringField;
    Table1F17: TStringField;
    Table1F18: TStringField;
    Table1F20: TSmallintField;
    Table1F21: TStringField;
    Table1F22: TStringField;
    Table1BUSER: TStringField;
    Table1BTIME: TDateTimeField;
    Table1EUSER: TStringField;
    Table1ETIME: TDateTimeField;
    DBComboBox1: TDBComboBox;
    RxDBComboEdit1: TRxDBComboEdit;
    DBComboBox2: TDBComboBox;
    Table1F23: TFloatField;
    Label22: TLabel;
    DBEdit19: TDBEdit;
    Label13: TLabel;
    procedure DBEdit1Exit(Sender: TObject);
    procedure Table1F01Validate(Sender: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure Table1F05Validate(Sender: TField);
    procedure Table1F07Validate(Sender: TField);
    procedure Table1F08Validate(Sender: TField);
    procedure Table1F20Validate(Sender: TField);
    procedure DBEdit14Exit(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RxDBComboEdit1ButtonClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table1F20GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Table1F20SetText(Sender: TField; const Text: String);
    procedure Table1F21Validate(Sender: TField);
    procedure Table1F23Validate(Sender: TField);
    procedure Table1F22Validate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_SYS: TFM_SYS;

implementation
uses utilities,uDataBaseEValue, uDM, uFunction;

{$R *.DFM}

procedure TFM_SYS.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  if Table1.State in [dsInsert,dsEdit] then
  begin
    if (Table1F03.AsString = '') then Table1F03.AsString := Copy(Table1F01.AsString,1,8);
  end;
end;

procedure TFM_SYS.Table1F01Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender, Table1F01.AsString);
end;

procedure TFM_SYS.BitBtn1Click(Sender: TObject);
begin
  inherited;
  try
   if Table1.State in [dsInsert,dsEdit] then Table1.Post;
    self.Close;
  except
   R_okMessage(['请检查输入是否正确!']);
   Raise;
  end;

  DM.Q_SysParam.Close;
  DM.Q_SysParam.Open;  
end;

procedure TFM_SYS.Table1F05Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender);
end;

procedure TFM_SYS.Table1F07Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender);
end;

procedure TFM_SYS.Table1F08Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender);
end;

procedure TFM_SYS.Table1F20Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender);
end;

procedure TFM_SYS.DBEdit14Exit(Sender: TObject);
begin
  inherited;
  if Table1.State in [dsInsert,dsEdit] then
    if Table1F13.AsString = '' then
      Table1F13.AsString := Table1F08.AsString;
end;

procedure TFM_SYS.Table1BeforePost(DataSet: TDataSet);
begin
//把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
  inherited;

  CheckFieldVal(DataSet)
end;

procedure TFM_SYS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Table1.Close;
end;

procedure TFM_SYS.FormCreate(Sender: TObject);
begin
  //inherited;
  Width:=714; Height:=498;
  try
   Table1.Open;
  except
    R_OkMessage(['资料表开启错误!'],'',MB_ICONERROR);
    raise;
  end;
  DBComboBox1.Text := '25';
  DBCombobox2.Text := '内含';
end;

procedure TFM_SYS.RxDBComboEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  select_data(DataSource1,'选择币别','select F01 as ''币别'' from T1100','STK0311',['F21'],[0],[45]);

end;

procedure TFM_SYS.DBEdit2Exit(Sender: TObject);
begin
  inherited;
   if Table1.State in [dsInsert,dsEdit] then
    if Table1F04.AsString = '' then
      Table1F04.AsString := copy(Table1F02.AsString,1,8);
end;

procedure TFM_SYS.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet,'系统参数设定');
end;

procedure TFM_SYS.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet,'系统参数设定');
end;

procedure TFM_SYS.Table1F20GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  { <结帐日> 为 0 时, 显示为 '月底' }
  if (Sender.AsString='') then Text := ''
    else if (Sender.AsInteger = 0) then Text := '月底'
           else Text := Sender.AsString;

end;

procedure TFM_SYS.Table1F20SetText(Sender: TField;
  const Text: String);
begin
  inherited;
  { <结帐日> 输入为 '月底'时, 存入 0 值 }
  if (Text = '月底') then Sender.AsInteger := 0
    else if (Text = '') then Sender.AsInteger := 25
        else Sender.AsInteger := StrToInt(Text);

end;

procedure TFM_SYS.Table1F21Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender);
end;

procedure TFM_SYS.Table1F23Validate(Sender: TField);
begin
  inherited;
   EValue_IsNotNull(Sender);
end;

procedure TFM_SYS.Table1F22Validate(Sender: TField);
begin
  inherited;
   EValue_IsNotNull(Sender);
end;

end.

unit uFM_5010;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_EDIT_GRID, DBTables, Db, Grids, DBGrids, Buttons, DBCtrls,
  DBNavPlus, ToolWin, ComCtrls, StdCtrls, Mask, ExtCtrls, ToolEdit,
  RXDBCtrl,utilities;

type
  TFM_5010 = class(TS_SingleDBEdit_WithGrid)
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
    Table1F11: TDateTimeField;
    Table1F13: TStringField;
    Table1F14: TStringField;
    Table1F15: TStringField;
    Table1F20: TSmallintField;
    Table1BUser: TStringField;
    Table1BTime: TDateTimeField;
    Table1EUser: TStringField;
    Table1ETime: TDateTimeField;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Table1F21: TStringField;
    Table1F22: TStringField;
    Table1F23: TFloatField;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    DBComboBox1: TDBComboBox;
    DBDateEdit1: TDBDateEdit;
    DBComboBox2: TDBComboBox;
    RxDBComboEdit2: TRxDBComboEdit;
    procedure SB6Click(Sender: TObject);
    procedure Table1F03Validate(Sender: TField);
    procedure Table1F02Validate(Sender: TField);
    procedure Table1F20GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Table1F20SetText(Sender: TField; const Text: String);
    procedure RxDBComboEdit2ButtonClick(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure SB3Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure SB0Click(Sender: TObject);
    procedure SB4Click(Sender: TObject);
    procedure Table1BeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_5010: TFM_5010;

implementation

uses uDataBaseEValue,uDM, uFunction, uRp_5010, uFM_5010A, uFM_5010B;

{$R *.DFM}

procedure TFM_5010.SB6Click(Sender: TObject);
begin
  inherited;
  self.close;
end;

procedure TFM_5010.Table1F03Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender, Copy(Table1F02.AsString, 1, 8));
end;

procedure TFM_5010.Table1F02Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender, Table1F03.AsString);
end;

procedure TFM_5010.Table1F20GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  { <结帐日> 为 0 时, 显示为 '月底' }
  if (Sender.AsString='') then Text := ''
    else if (Sender.AsInteger = 0) then Text := '月底'
           else Text := Sender.AsString;
end;

procedure TFM_5010.Table1F20SetText(Sender: TField; const Text: String);
begin
  inherited;
  { <结帐日> 输入为 '月底'时, 存入 0 值 }
  if (Text = '月底') then Sender.AsInteger := 0
    else if (Text = '') then Sender.AsInteger := 25
        else Sender.AsInteger := StrToInt(Text);
end;

procedure TFM_5010.RxDBComboEdit2ButtonClick(Sender: TObject);
begin
  inherited;
  { 点选 <币别> }
  Select_Data(DataSource1,'币别选取窗口','SELECT F01 as ''币别名称'', F02 as ''参考汇率'' From T1100 Order By F01','STK0311',['F21'],[0],[]);
end;

procedure TFM_5010.Table1BeforePost(DataSet: TDataSet);
begin
//把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
  inherited;

end;

procedure TFM_5010.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
//显示资料新增与修改记录
  InforDisplay(Dataset,'厂商资料');

end;

procedure TFM_5010.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
//显示资料新增与修改记录
  InforDisplay(Dataset,'厂商资料');
end;

procedure TFM_5010.FormCreate(Sender: TObject);
begin
  inherited;
  Width:=798; Height:=522;
  iRefreshDSCnt := 1;
end;

procedure TFM_5010.FormShow(Sender: TObject);
begin
  inherited;
  asRefreshDSNm[0] := 'Q_T5010';
end;

procedure TFM_5010.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  Table1F22.AsString := DM.Q_SysParamF22.AsString;
  Table1F23.AsString := DM.Q_SysParamF23.AsString;
  Table1F21.AsString := DM.Q_SysParamF21.AsString;
end;

procedure TFM_5010.SB3Click(Sender: TObject);
begin
  inherited;
  xSearch_Data(Table1,1,[0,2,8,14,15]);
end;

procedure TFM_5010.SB2Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('Rp_5010')=nil then
   Rp_5010 := TRp_5010.Create(self);
  Rp_5010.Preview;
end;

procedure TFM_5010.SB0Click(Sender: TObject);
begin
  inherited;
  FM_5010A := TFM_5010A.Create(self);
  FM_5010A.Show;
  FM_5010A.Query1.Locate('F03',Table1F03.AsString,[]);
end;

procedure TFM_5010.SB4Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('FM_5010B')=nil then
    FM_5010B := TFM_5010B.Create(self);
    FM_5010B.Show;
end;

procedure TFM_5010.Table1BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  QryExec(Qry1,'Delete from T5010A where F01='''+Table1F03.AsString+'''',false);
end;

end.

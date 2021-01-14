unit uFM_1011;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_EDIT_GRID, DBTables, Db, Grids, DBGrids, Buttons, DBCtrls,
  DBNavPlus, ToolWin, ComCtrls, StdCtrls, Mask, ExtCtrls, ToolEdit,
  RXDBCtrl,utilities;

type
  TFM_1011 = class(TS_SingleDBEdit_WithGrid)
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
    Table1F12: TStringField;
    Table1F13: TStringField;
    Table1F14: TStringField;
    Table1F15: TStringField;
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
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    procedure Table1F03Validate(Sender: TField);
    procedure Table1F02Validate(Sender: TField);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB3Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_1011: TFM_1011;

implementation

uses uDataBaseEValue,uDM, uFunction, uRp_1011;

{$R *.DFM}

procedure TFM_1011.Table1F03Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender, Copy(Table1F02.AsString, 1, 8));
end;

procedure TFM_1011.Table1F02Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender, Table1F03.AsString);
end;

procedure TFM_1011.Table1BeforePost(DataSet: TDataSet);
begin
//把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
  inherited;
end;

procedure TFM_1011.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
//显示资料新增与修改记录
  InforDisplay(Dataset,'协力厂商资料');

end;

procedure TFM_1011.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
//显示资料新增与修改记录
  InforDisplay(Dataset,'协力厂商资料');
end;

procedure TFM_1011.FormCreate(Sender: TObject);
begin
  inherited;
  Width:=774;Height:=516;
  iRefreshDSCnt := 1;
end;

procedure TFM_1011.FormShow(Sender: TObject);
begin
  inherited;
  asRefreshDSNm[0] := 'Q_T1011';
end;

procedure TFM_1011.SB3Click(Sender: TObject);
begin
  inherited;
  xSearch_Data(Table1,1,[0,2,12,13]);
end;

procedure TFM_1011.SB2Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('Rp_1011')=nil then
   Rp_1011 := TRp_1011.Create(self);
   Rp_1011.Preview;
end;

end.

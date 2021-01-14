unit uFM_2170;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_FM, Buttons, DBCtrls, DBNavPlus, ExtCtrls, DBTables, Db, Grids,
  DBGrids, StdCtrls, Mask, ToolEdit;

type
  TFM_2170 = class(TS_Form)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavPlus1: TDBNavPlus;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    DataSource1: TDataSource;
    UpdateSQL1: TUpdateSQL;
    Query1F01: TDateTimeField;
    Query1D_SN: TSmallintField;
    Query1F02: TDateTimeField;
    Query1F03: TStringField;
    Query1F04: TStringField;
    Query1F05: TStringField;
    Query1F06: TDateTimeField;
    Query1F07: TStringField;
    Query1F08: TIntegerField;
    Query1F09: TIntegerField;
    Query1F10: TIntegerField;
    Query1F11: TIntegerField;
    Query1F12: TIntegerField;
    Query1F13: TIntegerField;
    Query1F14: TIntegerField;
    Query1F15: TStringField;
    SpeedButton3: TSpeedButton;
    Qry: TQuery;
    Panel3: TPanel;
    DateEdit1: TDateEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Query1Buser: TStringField;
    Query1Btime: TDateTimeField;
    Query1Euser: TStringField;
    Query1Etime: TDateTimeField;
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Query1BeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Query1AfterPost(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Query1AfterScroll(DataSet: TDataSet);
    procedure Query1AfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_2170: TFM_2170;

implementation
uses utilities, uRp_2170, uFunction;

{$R *.DFM}

procedure TFM_2170.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFM_2170.DBGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
  
  if DBGrid1.SelectedField = Query1F02 then
    AssignDBDate(Sender,DataSource1,'F02');
  if DBGRid1.SelectedField = Query1F06 then
    AssignDBDate(Sender,DataSource1,'F06');
end;

procedure TFM_2170.SpeedButton3Click(Sender: TObject);
begin
  inherited;

  Query1.ApplyUpdates;
end;

procedure TFM_2170.Query1BeforePost(DataSet: TDataSet);
begin
  InforSave(DataSet);
  Query1F01.AsDateTime := DateEdit1.Date;
  QryExec(Qry,'select max(D_SN) from T2170');
  Query1D_SN.AsInteger := Qry.Fields[0].AsInteger + 1;
  inherited;

end;

procedure TFM_2170.FormCreate(Sender: TObject);
begin
  inherited;
  DateEdit1.Date := Date;
  Query1.Params[0].AsDate := DateEdit1.Date;
  Query1.Close;
  Query1.Open;
end;

procedure TFM_2170.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Query1.Params[0].AsDate := DateEdit1.Date;
  Query1.Close;
  Query1.Open;
end;

procedure TFM_2170.Query1AfterPost(DataSet: TDataSet);
begin
  inherited;
   Query1.ApplyUpdates;
   //显示资料新增与修改记录
  InforDisplay(Dataset,'软料部生产进度表');
end;

procedure TFM_2170.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if application.FindComponent('Rp_2170')=nil then
     Rp_2170 := TRp_2170.Create(Application);
     with Rp_2170 do
     begin
     query1.close;
     query1.Params[0].AsDate := DateEdit1.Date;
     query1.Open;
     previewmodal;
     end;
end;

procedure TFM_2170.Query1AfterScroll(DataSet: TDataSet);
begin
  inherited;
     //显示资料新增与修改记录
  InforDisplay(Dataset,'软料部生产进度表');
end;

procedure TFM_2170.Query1AfterDelete(DataSet: TDataSet);
begin
  inherited;
  Query1.ApplyUpdates;
end;

end.

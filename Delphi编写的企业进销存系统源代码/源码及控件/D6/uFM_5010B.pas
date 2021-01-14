unit uFM_5010B;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_FM, Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, Mask, ToolEdit,
  ExtCtrls;

type
  TFM_5010B = class(TS_Form)
    Panel1: TPanel;
    Panel2: TPanel;
    ComboEdit1: TComboEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    ComboEdit2: TComboEdit;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    DataSource1: TDataSource;
    Query1F01: TStringField;
    Query1F02: TStringField;
    Query1F03: TStringField;
    Query1F04: TStringField;
    Query1F05: TFloatField;
    Query1K_SN: TSmallintField;
    Query1F06: TDateTimeField;
    Query1F07: TStringField;
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboEdit1ButtonClick(Sender: TObject);
    procedure ComboEdit2ButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_5010B: TFM_5010B;

implementation
 uses utilities;
{$R *.DFM}

procedure TFM_5010B.BitBtn2Click(Sender: TObject);
begin
  inherited;
   Close;
end;

procedure TFM_5010B.ComboEdit1ButtonClick(Sender: TObject);
var
 xs : TStringList;
begin
   xs := Select_text('选择品名','select distinct F03  as 品名 from T5010A ','STK0311',[0],[]);
   if Assigned(xs) then
   try
     ComboEdit1.Text := xs.Strings[0];
   finally
     xs.Free;
   end;
  inherited;

end;

procedure TFM_5010B.ComboEdit2ButtonClick(Sender: TObject);
var
 xs : TStringList;
begin
   xs := Select_text('选择规格','select distinct F04 as 规格 from T5010A ','STK0311',[0],[]);
   if Assigned(xs) then
   try
    ComboEdit2.Text := xs.Strings[0];
   finally
    xs.Free;
   end;
  inherited;

end;

procedure TFM_5010B.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.add('select F01,K_SN,F02,F03,F04,F05,F06,F07 from T5010A where 0=0');
   if ComboEdit1.Text <> '' then
     Query1.SQL.Add(' and F03='''+ComboEdit1.text+'''');
   if ComboEdit2.Text <> '' then
     Query1.sql.Add(' and F04='''+ComboEdit2.text+'''');
  Query1.Open;

end;

end.

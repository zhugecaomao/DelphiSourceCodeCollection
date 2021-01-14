unit uFM_3021;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, Spin, ExtCtrls, Mask,
  DBCtrls, DBNavPlus;

type
  TFM_3021 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    SpinEdit1: TSpinEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    DataSource1: TDataSource;
    Query1F02: TStringField;
    Panel4: TPanel;
    Query2: TQuery;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Table1: TTable;
    Qry1: TQuery;
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
    Table1F12: TStringField;
    Table1F13: TFloatField;
    Table1F14: TFloatField;
    Table1BUSER: TStringField;
    Table1BTIME: TDateTimeField;
    Table1EUSER: TStringField;
    Table1ETIME: TDateTimeField;
    Query2F01: TStringField;
    Query2F02: TDateTimeField;
    Query2F04: TStringField;
    Query2F05: TFloatField;
    Query2F06: TStringField;
    Query2F07: TFloatField;
    Query2F08: TFloatField;
    Query2F09: TFloatField;
    Query2F10: TFloatField;
    Query2F11: TStringField;
    Query2F12: TStringField;
    Query2F13: TStringField;
    Query2F14: TStringField;
    Query1F01: TStringField;
    Query1F03: TStringField;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label2: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit2: TDBEdit;
    Panel6: TPanel;
    BitBtn2: TBitBtn;
    DBNavPlus1: TDBNavPlus;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Query1AfterScroll(DataSet: TDataSet);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel5Exit(Sender: TObject);
    procedure Table1BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_3021: TFM_3021;

implementation

uses uDM,utilities;

{$R *.DFM}

procedure TFM_3021.BitBtn1Click(Sender: TObject);
begin
  with Query1 do
  begin
   Close;
   SQL.Clear;
   SQL.Add('select distinct A.F01, A.F02,B.F03 from T3020 as A'
                   +' left join T1010 as B on B.F01=A.F02 '
                   +' where A.F01='''+copy(SpinEdit1.Text,3,2) + ComboBox1.text+'''');
   Open;
  end;
  with Query2 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from T2160 where F03='''+Query1.Fields[1].AsString+''' and F12='''+copy(SpinEdit1.text,3,2)+ComboBox1.Text+'''');
   Open;
  end;

end;

procedure TFM_3021.FormShow(Sender: TObject);
begin
 left :=0 ; top := 0; Width := 690; Height := 450 ;
 Query1.Close;
 Query1.Open;
 Query2.Close;
 Query2.Open;
 Table1.Close;
 Table1.Open;
 Query1.Params[0].AsString := Copy(SpinEdit1.text,3,2)+ComboBox1.Text;
 Query2.Params[0].AsString := Copy(SpinEdit1.text,3,2)+ComboBox1.Text;
end;

procedure TFM_3021.Query1AfterScroll(DataSet: TDataSet);
begin
  with Query2 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from T2160 where F03='''+Query1.Fields[0].AsString+''' and F12='''+copy(SpinEdit1.text,3,2)+ComboBox1.Text+'''');
   Open;
  end;
  
end;

procedure TFM_3021.Table1CalcFields(DataSet: TDataSet);
begin
//  QryExec(Qry1,'select F23 from TSysParam' );
 // Table1lkCalculate.AsFloat := Table1F15.AsFloat * Qry1.Fields[0].AsFloat;
end;

procedure TFM_3021.Table1BeforePost(DataSet: TDataSet);
begin
//  Table1F16.AsFloat := Table1lkCalculate.AsFloat;
//  Table1F11.AsFloat := Table1F11.AsFloat + Table1F16.AsFloat;
 // Table1F13.AsFloat := Table1F11.AsFloat - Table1F12.AsFloat;
end;

procedure TFM_3021.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TFM_3021.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFM_3021.FormCreate(Sender: TObject);
begin
  //if DM.Q_TSysParamF20.AsString = 'T' then
      //showmessage(inttostr(GetYear(now()))) ;
    //SpinEdit1.Value := GetYear(now()) ;
  //else
   //  SpinEdit1.Value := GetYear(date(),false);
   SpinEdit1.Text := formatdatetime('yyyy',date);
   ComboBox1.itemindex := strtoint(formatdatetime('mm',date))-1 ;
 end;

procedure TFM_3021.Panel5Exit(Sender: TObject);
begin
  if table1.state in [dsinsert,dsedit] then
     table1.post;
end;

procedure TFM_3021.Table1BeforeInsert(DataSet: TDataSet);
begin
{  if query1.params[1].asstring = '' then
    begin
     R_Okmessage(['无对应客户资料理']);
     abort;
    end; }
end;

end.


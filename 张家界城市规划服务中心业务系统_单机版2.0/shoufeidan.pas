unit shoufeidan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,math,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, ComCtrls, DB, ADODB,StrUtils,
  frxClass, frxDBSet;

type
  Tsfd = class(TForm)
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label26: TLabel;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    ADOTable2: TADOTable;
    DataSource2: TDataSource;
    Panel1: TPanel;
    Label24: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label25: TLabel;
    DBEdit11: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    frxDBDataset1: TfrxDBDataset;
    ADOTable3: TADOTable;
    ADOTable1sfbh: TWideStringField;
    ADOTable1ctbh: TWideStringField;
    ADOTable1jsdw: TWideStringField;
    ADOTable1tfs: TFloatField;
    ADOTable1tfje: TBCDField;
    ADOTable1fzzs: TIntegerField;
    ADOTable1fzje: TBCDField;
    ADOTable1jbr: TWideStringField;
    ADOTable1rq: TDateTimeField;
    ADOTable1jdr: TWideStringField;
    ADOTable1jdrq: TDateTimeField;
    ADOTable1bz: TWideMemoField;
    frxReport1: TfrxReport;
    procedure BitBtn2Click(Sender: TObject);
    procedure ADOTable1AfterInsert(DataSet: TDataSet);
    procedure ADOTable1BeforeInsert(DataSet: TDataSet);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure ADOTable1AfterPost(DataSet: TDataSet);
    procedure ADOTable1AfterDelete(DataSet: TDataSet);
    procedure ADOTable1BeforeDelete(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ADOTable1BeforePost(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sfd: Tsfd;
  bh_v,datestr,addstr:string;
  jsdw_v:string;

  Const
  connstr='Provider=Microsoft.Jet.OLEDB.4.0;'+
          'Data Source=%s;Persist Security Info=False;'+
          'Jet OLEDB:Database Password=%s';

implementation

uses tqsfd_u, sfxt;

{$R *.dfm}

procedure Tsfd.ADOTable1BeforeDelete(DataSet: TDataSet);
begin
  jsdw_v:=adotable1.FieldByName('jsdw').AsString;
end;

procedure Tsfd.ADOTable1AfterDelete(DataSet: TDataSet);
var
  sqlstr:string;
begin
  tqsfd.ADOQuery1.SQL.Clear;
  sqlstr:='select * from tbl_ctd where ctdw='''+jsdw_v+'''';
  tqsfd.ADOQuery1.SQL.Add(sqlstr);
  tqsfd.ADOQuery1.Open;
  tqsfd.ADOQuery1.Edit;
  tqsfd.ADOQuery1.FieldByName('flag').AsBoolean:=false;
  tqsfd.ADOQuery1.Post;
end;

procedure Tsfd.ADOTable1AfterPost(DataSet: TDataSet);
var
  sqlstr:string;
begin
  
  jsdw_v:=adotable1.FieldByName('jsdw').AsString;
  tqsfd.ADOQuery1.SQL.Clear;
  sqlstr:='select * from tbl_ctd where ctdw='''+jsdw_v+'''';
  tqsfd.ADOQuery1.SQL.Add(sqlstr);
  tqsfd.ADOQuery1.Open;
  tqsfd.ADOQuery1.Edit;
  tqsfd.ADOQuery1.FieldByName('flag').AsBoolean:=true;
  tqsfd.ADOQuery1.Post;
end;

procedure Tsfd.ADOTable1AfterInsert(DataSet: TDataSet);
begin
  adotable1.FieldByName('jdrq').AsDateTime:=now;
  if bh_v=datestr then
  begin
    addstr:=format('%.3d',[strtoint(addstr)]);
    dbedit8.Text:=datestr+addstr;
  end
  else
    DBEdit8.Text:=datestr+'001';
end;

procedure Tsfd.ADOTable1BeforeInsert(DataSet: TDataSet);
begin
  if adotable1.RecordCount>0 then  //如果有记录进行取值
  begin
    adotable1.Last;
    bh_v:=leftstr(adotable1.FieldByName('sfbh').AsString,8);
    addstr:=inttostr(strtoint(rightstr(adotable1.FieldByName('sfbh').AsString,3))+1);
  end;
  datestr:=formatdatetime('yyyymmdd',date);
end;


procedure Tsfd.ADOTable1BeforePost(DataSet: TDataSet);
begin
  adotable1.FieldByName('jdr').AsString:=sfxt.userxm_v;
end;

procedure Tsfd.BitBtn1Click(Sender: TObject);
begin
  if adotable3.State=dsinactive then adotable3.Open;
  if adotable3.Filtered=false then  adotable3.Filtered:=true;
  adotable3.Filter:='sfbh='+adotable1.FieldByName('sfbh').AsString;
  frxreport1.ShowReport;
end;

procedure Tsfd.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tsfd.DateTimePicker1Change(Sender: TObject);
begin
  adotable1.Edit;
  adotable1.FieldByName('rq').AsDateTime:=datetimepicker1.Date;
end;

procedure Tsfd.FormCreate(Sender: TObject);
var
  dbfilename:string;
begin
  dbfilename:=extractfilepath(application.ExeName)+'database\sfgl.mdb';
  adoconnection1.ConnectionString:=format(connstr,[dbfilename,'tjz929']);
  if datasource1.DataSet.State=dsinactive then datasource1.DataSet.Open;
  if datasource2.DataSet.State=dsinactive then datasource2.DataSet.Open;
  datetimepicker1.Date:=date;
end;

end.

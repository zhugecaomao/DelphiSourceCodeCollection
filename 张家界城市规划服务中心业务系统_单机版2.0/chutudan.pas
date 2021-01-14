unit chutudan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ComCtrls, ExtCtrls, Buttons, DB, ADODB,StrUtils,
  frxClass, frxDBSet;

type
  Tctd = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBComboBox1: TDBComboBox;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    Label16: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label17: TLabel;
    DBEdit13: TDBEdit;
    Label18: TLabel;
    DBEdit14: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBNavigator1: TDBNavigator;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DBEdit15: TDBEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    DBLookupComboBox1: TDBLookupComboBox;
    ADOTable2: TADOTable;
    DataSource2: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBComboBox2: TDBComboBox;
    ADOTable3: TADOTable;
    DataSource3: TDataSource;
    BitBtn3: TBitBtn;
    ADOQuery1: TADOQuery;
    frxDBDataset1: TfrxDBDataset;
    ADOTable4: TADOTable;
    ADOTable1ctbh: TWideStringField;
    ADOTable1ctdw: TWideStringField;
    ADOTable1tm: TWideStringField;
    ADOTable1blc: TWideStringField;
    ADOTable1dz: TWideStringField;
    ADOTable1bztfs: TIntegerField;
    ADOTable1ctzs: TIntegerField;
    ADOTable1zbx: TWideStringField;
    ADOTable1zby: TWideStringField;
    ADOTable1je: TBCDField;
    ADOTable1tfbjr: TWideStringField;
    ADOTable1jsfzr: TWideStringField;
    ADOTable1chdz: TWideStringField;
    ADOTable1rq: TDateTimeField;
    ADOTable1jdr: TWideStringField;
    ADOTable1jdrq: TDateTimeField;
    ADOTable1bz: TWideMemoField;
    ADOTable1flag: TBooleanField;
    frxReport1: TfrxReport;
    DBCheckBox1: TDBCheckBox;
    procedure ADOTable1BeforeInsert(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure ADOTable1AfterInsert(DataSet: TDataSet);
    procedure ADOTable1BeforeScroll(DataSet: TDataSet);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBComboBox2DropDown(Sender: TObject);
    procedure ADOTable1AfterPost(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ADOTable1BeforePost(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ctd: Tctd;
  bh_v,datestr,addstr:string;
Const
  connstr='Provider=Microsoft.Jet.OLEDB.4.0;'+
          'Data Source=%s;Persist Security Info=False;'+
          'Jet OLEDB:Database Password=%s';

implementation

uses sfxt, dwcx_u;

{$R *.dfm}

procedure Tctd.ADOTable1BeforeInsert(DataSet: TDataSet);
begin
  if adotable1.RecordCount>0 then  //如果有记录进行取值
  begin
    adotable1.Last;
    bh_v:=leftstr(adotable1.FieldByName('ctbh').AsString,8);
    addstr:=inttostr(strtoint(rightstr(adotable1.FieldByName('ctbh').AsString,3))+1);
  end;
  datestr:=formatdatetime('yyyymmdd',date);
  
end;

procedure Tctd.ADOTable1BeforePost(DataSet: TDataSet);
begin
  adotable1.FieldByName('jdr').AsString:=sfxt.userxm_v;
end;

procedure Tctd.ADOTable1AfterInsert(DataSet: TDataSet);
begin
  adotable1.FieldByName('jdrq').AsDateTime:=now;
  if bh_v=datestr then
  begin
    addstr:=format('%.3d',[strtoint(addstr)]);
    dbedit12.Text:=datestr+addstr;
  end
  else
    DBEdit12.Text:=datestr+'001';
end;

procedure Tctd.ADOTable1AfterPost(DataSet: TDataSet);
var
  sqlstr:string;
begin
  
  adoquery1.SQL.Clear;
  sqlstr:='select dw from tbl_dwxx where dw='''+adotable1.FieldByName('ctdw').AsString+'''';
  adoquery1.SQL.Text:=sqlstr;
  adoquery1.Open;
  if adoquery1.RecordCount<=0 then
  begin
    adotable3.Append;
    adotable3.FieldByName('dw').AsString:=adotable1.FieldByName('ctdw').AsString;
    adotable3.Post;
    dbcombobox2.Items.Add(adotable3.FieldByName('dw').AsString);  //刷新新增的记录
  end;
end;

procedure Tctd.ADOTable1BeforeScroll(DataSet: TDataSet);
begin
  datetimepicker1.Date:=adotable1.FieldByName('rq').AsDateTime;
end;

procedure Tctd.BitBtn1Click(Sender: TObject);
begin
  if adotable4.State=dsinactive then adotable4.Open;
  if adotable4.Filtered=false then  adotable4.Filtered:=true;
  adotable4.Filter:='ctbh='+adotable1.FieldByName('ctbh').AsString;
  frxreport1.ShowReport;
end;

procedure Tctd.BitBtn2Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tctd.BitBtn3Click(Sender: TObject);
begin
  application.CreateForm(tfrm_dwcx,frm_dwcx);
  frm_dwcx.show;
end;

procedure Tctd.DateTimePicker1Change(Sender: TObject);
begin
  adotable1.Edit;
  adotable1.FieldByName('rq').AsDateTime:=datetimepicker1.Date;
end;

procedure Tctd.DBComboBox2DropDown(Sender: TObject);
begin
  with dbcombobox2 do
  begin
    if items.Count<=0 then
    begin
      with adotable3 do
      begin
        first;
        while (fieldbyname('dw').AsString<>null) and (not eof) do
        begin
          items.Add(fieldbyname('dw').AsString);
          next;
        end;
      end;
    end;
  end;
end;

procedure Tctd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tctd.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if datasource1.DataSet.Modified then
    if Application.MessageBox('请确认是否保存数据?', '提示信息', mb_iconinformation + mb_YesNo) = idyes then
      datasource1.DataSet.Post;

end;

procedure Tctd.FormCreate(Sender: TObject);
var
  dbfilename:string;
begin
  dbfilename:=extractfilepath(application.ExeName)+'database\sfgl.mdb';
  adoconnection1.ConnectionString:=format(connstr,[dbfilename,'tjz929']);
  if datasource1.DataSet.State=dsinactive then datasource1.DataSet.Open;
  if datasource2.DataSet.State=dsinactive then datasource2.DataSet.Open;
  if datasource3.DataSet.State=dsinactive then datasource3.DataSet.Open;
  datetimepicker1.Date:=date;
end;

end.

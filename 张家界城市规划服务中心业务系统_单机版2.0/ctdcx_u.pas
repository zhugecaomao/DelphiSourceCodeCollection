unit ctdcx_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  Tctdcx = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery1ctbh: TWideStringField;
    ADOQuery1ctdw: TWideStringField;
    ADOQuery1tm: TWideStringField;
    ADOQuery1blc: TWideStringField;
    ADOQuery1dz: TWideStringField;
    ADOQuery1bztfs: TIntegerField;
    ADOQuery1ctzs: TIntegerField;
    ADOQuery1zbx: TWideStringField;
    ADOQuery1zby: TWideStringField;
    ADOQuery1je: TBCDField;
    ADOQuery1tfbjr: TWideStringField;
    ADOQuery1jsfzr: TWideStringField;
    ADOQuery1chdz: TWideStringField;
    ADOQuery1rq: TDateTimeField;
    ADOQuery1jdr: TWideStringField;
    ADOQuery1jdrq: TDateTimeField;
    ADOQuery1flag: TBooleanField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ctdcx: Tctdcx;
Const
  connstr='Provider=Microsoft.Jet.OLEDB.4.0;'+
          'Data Source=%s;Persist Security Info=False;'+
          'Jet OLEDB:Database Password=%s';

implementation

{$R *.dfm}

procedure Tctdcx.BitBtn1Click(Sender: TObject);
var
  sqlstr,sqltj:string;
begin
  adoquery1.SQL.Clear;
  if edit1.Text<>'' then
  begin
    case combobox1.ItemIndex of
    0:sqltj:='ctdw';
    1:sqltj:='ctbh';
    2:sqltj:='tm';
    3:sqltj:='rq';
    end;
    sqlstr:='select * from tbl_ctd where '+sqltj+' like ''%'+edit1.Text+'%''';
  end
  else
    sqlstr:='select * from tbl_ctd';
  adoquery1.SQL.Add(sqlstr);
  adoquery1.Open;
end;

procedure Tctdcx.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure Tctdcx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.Free;
end;

procedure Tctdcx.FormCreate(Sender: TObject);
var
  dbfilename:string;
begin
  dbfilename:=extractfilepath(application.ExeName)+'database\sfgl.mdb';
  adoconnection1.ConnectionString:=format(connstr,[dbfilename,'tjz929']);
  //if datasource1.DataSet.State=dsinactive then datasource1.DataSet.Open;
end;
end.

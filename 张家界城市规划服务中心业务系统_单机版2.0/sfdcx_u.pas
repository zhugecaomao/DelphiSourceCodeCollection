unit sfdcx_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  Tsfdcx = class(TForm)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    ADOQuery1sfbh: TWideStringField;
    ADOQuery1ctbh: TWideStringField;
    ADOQuery1jsdw: TWideStringField;
    ADOQuery1tfs: TFloatField;
    ADOQuery1tfje: TBCDField;
    ADOQuery1fzzs: TIntegerField;
    ADOQuery1fzje: TBCDField;
    ADOQuery1jbr: TWideStringField;
    ADOQuery1rq: TDateTimeField;
    ADOQuery1jdr: TWideStringField;
    ADOQuery1jdrq: TDateTimeField;
    ADOQuery1bz: TWideMemoField;
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
  sfdcx: Tsfdcx;
Const
  connstr='Provider=Microsoft.Jet.OLEDB.4.0;'+
          'Data Source=%s;Persist Security Info=False;'+
          'Jet OLEDB:Database Password=%s';

implementation

{$R *.dfm}

procedure Tsfdcx.BitBtn1Click(Sender: TObject);
var
  sqlstr,sqltj:string;
begin
  adoquery1.SQL.Clear;
  if edit1.Text<>'' then
  begin
    case combobox1.ItemIndex of
    0:sqltj:='jsdw';
    1:sqltj:='sfbh';
    2:sqltj:='tfje';
    3:sqltj:='rq';
    end;
    sqlstr:='select * from tbl_sfd where '+sqltj+' like ''%'+edit1.Text+'%''';
  end
  else
    sqlstr:='select * from tbl_sfd';
  adoquery1.SQL.Add(sqlstr);
  adoquery1.Open;
end;

procedure Tsfdcx.BitBtn3Click(Sender: TObject);
begin
  self.close;
end;

procedure Tsfdcx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.Free;
end;

procedure Tsfdcx.FormCreate(Sender: TObject);
var
  dbfilename:string;
begin
  dbfilename:=extractfilepath(application.ExeName)+'database\sfgl.mdb';
  adoconnection1.ConnectionString:=format(connstr,[dbfilename,'tjz929']);
  //if datasource1.DataSet.State=dsinactive then datasource1.DataSet.Open;
end;

end.

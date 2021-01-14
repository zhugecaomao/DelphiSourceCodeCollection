unit dwcx_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, ADODB;

type
  Tfrm_dwcx = class(TForm)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_dwcx: Tfrm_dwcx;
Const
  connstr='Provider=Microsoft.Jet.OLEDB.4.0;'+
          'Data Source=%s;Persist Security Info=False;'+
          'Jet OLEDB:Database Password=%s';

implementation

uses chutudan;

{$R *.dfm}

procedure Tfrm_dwcx.BitBtn1Click(Sender: TObject);
var
  sqlstr,sqltj:string;
begin
  adoquery1.SQL.Clear;
  if edit1.Text<>'' then
  begin
    case combobox1.ItemIndex of
    0:sqltj:='dw';
    1:sqltj:='xmmc';
    2:sqltj:='fzr';
    end;
    sqlstr:='select * from tbl_dwxx where '+sqltj+' like ''%'+edit1.Text+'%''';
  end
  else
    sqlstr:='select * from tbl_dwxx';
  adoquery1.SQL.Add(sqlstr);
  adoquery1.Open;
end;

procedure Tfrm_dwcx.BitBtn2Click(Sender: TObject);
begin
  ctd.ADOTable1.Edit;
  ctd.ADOTable1.FieldByName('ctdw').AsString:=adoquery1.FieldByName('dw').AsString;
  close;
end;

procedure Tfrm_dwcx.BitBtn3Click(Sender: TObject);
begin
  self.close;
end;

procedure Tfrm_dwcx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.Free;
end;

procedure Tfrm_dwcx.FormCreate(Sender: TObject);
var
  dbfilename:string;
begin
  dbfilename:=extractfilepath(application.ExeName)+'database\sfgl.mdb';
  adoconnection1.ConnectionString:=format(connstr,[dbfilename,'tjz929']);
  //if datasource1.DataSet.State=dsinactive then datasource1.DataSet.Open;
end;

end.

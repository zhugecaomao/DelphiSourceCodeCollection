unit tqsfd_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, ADODB,Math;

type
  Ttqsfd = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tqsfd: Ttqsfd;
Const
  connstr='Provider=Microsoft.Jet.OLEDB.4.0;'+
          'Data Source=%s;Persist Security Info=False;'+
          'Jet OLEDB:Database Password=%s';

implementation

uses shoufeidan;

{$R *.dfm}

procedure Ttqsfd.BitBtn1Click(Sender: TObject);
var
  tfs_f:single;
begin
  close;
  application.CreateForm(tsfd,sfd);
  sfd.Show;
  sfd.ADOTable1.Insert;
  sfd.ADOTable1.FieldByName('ctbh').AsString:=adoquery1.FieldByName('ctbh').AsString;
  sfd.ADOTable1.FieldByName('jsdw').AsString:=adoquery1.FieldByName('ctdw').AsString;
  sfd.ADOTable1.FieldByName('tfje').AsCurrency:=adoquery1.FieldByName('je').AsCurrency;
  tfs_f:=adoquery1.FieldByName('je').AsInteger/150;
  sfd.ADOTable1.FieldByName('tfs').AsFloat:=roundto(tfs_f,-2);
end;

procedure Ttqsfd.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Ttqsfd.FormCreate(Sender: TObject);
var
  dbfilename:string;
begin
  dbfilename:=extractfilepath(application.ExeName)+'database\sfgl.mdb';
  adoconnection1.ConnectionString:=format(connstr,[dbfilename,'tjz929']);
  if datasource1.DataSet.State=dsinactive then datasource1.DataSet.Open;
end;

end.

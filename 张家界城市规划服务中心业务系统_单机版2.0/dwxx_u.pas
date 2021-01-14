unit dwxx_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, DBCtrls, StdCtrls, Buttons, Mask;

type
  Tfrm_dwxx = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Label1: TLabel;
    ADOTable1dw: TWideStringField;
    ADOTable1xmmc: TWideStringField;
    ADOTable1fzr: TWideStringField;
    ADOTable1bgdh: TWideStringField;
    ADOTable1sj: TWideStringField;
    ADOTable1dz: TWideStringField;
    ADOTable1email: TWideStringField;
    ADOTable1bz: TWideMemoField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBMemo1: TDBMemo;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_dwxx: Tfrm_dwxx;
Const
  connstr='Provider=Microsoft.Jet.OLEDB.4.0;'+
          'Data Source=%s;Persist Security Info=False;'+
          'Jet OLEDB:Database Password=%s';

implementation

{$R *.dfm}

procedure Tfrm_dwxx.BitBtn1Click(Sender: TObject);
begin
  self.close;
end;

procedure Tfrm_dwxx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.Free;
end;

procedure Tfrm_dwxx.FormCreate(Sender: TObject);
var
  dbfilename:string;
begin
  dbfilename:=extractfilepath(application.ExeName)+'database\sfgl.mdb';
  adoconnection1.ConnectionString:=format(connstr,[dbfilename,'tjz929']);
  if datasource1.DataSet.State=dsinactive then datasource1.DataSet.Open;
end;

end.

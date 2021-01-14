unit DataModule;

interface

uses
  Windows,SysUtils, Classes, DB, ADODB;

type
  TDataModuleADO = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOTable1: TADOTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleADO : TDataModuleADO;

  MyPath,MyPass : string;

implementation

uses Main;

{$R *.dfm}

procedure TDataModuleADO.DataModuleCreate(Sender: TObject);
begin
  ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
               MyPath+'Data\BookManage.mdb;Jet OLEDB:Database Password='+
               MyPassW+';Persist Security Info=False';

  ADOQuery1.Connection:=ADOConnection1;
  ADOTable1.Connection:=ADOConnection1;
end;

end.

unit Unit2;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDataModule2 = class(TDataModule)
    StudentTable: TTable;
    RecordTable: TTable;
    Booktable: TTable;
    Query1: TQuery;
    StudentDS: TDataSource;
    RecordDS: TDataSource;
    BookDS: TDataSource;
    QueryDS: TDataSource;
    usertable: TTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.dfm}

end.

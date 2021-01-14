unit DMypgl_;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMypgl = class(TDataModule)
    ADOCypgl: TADOConnection;
    ADOTypgl: TADOTable;
    DSypgl: TDataSource;
    ADOTgys: TADOTable;
    DSgys: TDataSource;
    ADOQypgq: TADOQuery;
    DSypgq: TDataSource;
    ADOQyp_xg_tj: TADOQuery;
    DSyp_xg_tj: TDataSource;
    ADOQgys: TADOQuery;
    DSQgys: TDataSource;
    ADOTyp: TADOTable;
    ADOTgys2: TADOTable;
    DSyp: TDataSource;
    DSgys2: TDataSource;
    ADOQgys_modify: TADOQuery;
    DSmodify: TDataSource;
    ADOQqhgys: TADOQuery;
    DSqhgys: TDataSource;
    ADOQypcx: TADOQuery;
    DSypcx: TDataSource;
    ADOQypcx2: TADOQuery;
    DSypcx2: TDataSource;
    ADOQjtcx: TADOQuery;
    DSjtcx: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMypgl: TDMypgl;

implementation

uses ypgl_;

{$R *.dfm}

end.

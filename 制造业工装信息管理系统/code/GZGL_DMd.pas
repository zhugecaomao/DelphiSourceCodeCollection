unit GZGL_DMd;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDMD = class(TDataModule)
    Connection1: TADOConnection;
    Tbl_GZCP: TADOTable;
    Tbl_ZBLX: TADOTable;
    Src_GZ: TDataSource;
    Src_CP: TDataSource;
    Src_ZBLX: TDataSource;
    Src_GZCP: TDataSource;
    Tbl_CP: TADOTable;
    Tbl_GZ: TADOTable;
    Qry_CP: TADOQuery;
    Qry_ZBLX: TADOQuery;
    Qry_GZCP: TADOQuery;
    Qry_GZ: TADOQuery;
    SrcQry_GZ: TDataSource;
    SrcQry_CP: TDataSource;
    SrcQry_ZBLX: TDataSource;
    SrcQry_GZCP: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMD: TDMD;

implementation

{$R *.dfm}

end.

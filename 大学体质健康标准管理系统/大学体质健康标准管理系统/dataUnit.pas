unit dataUnit;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDataModule1 = class(TDataModule)
    xibie: TTable;
    banjixinxi: TTable;
    xueshengxinxi: TTable;
    yonghu: TTable;
    Dxibie: TDataSource;
    Dbanjixinxi: TDataSource;
    Dxueshengxinxi: TDataSource;
    Dyonghu: TDataSource;
    Dnull: TDataSource;
    bzdxbothboy: TDataSource;
    bzdxbothgirl: TDataSource;
    bzdxheighboy: TDataSource;
    bzdxheiggirl: TDataSource;
    bzgzoneboy: TDataSource;
    bzgzonegirl: TDataSource;
    bzgzheigboy: TDataSource;
    bzgzheiggirl: TDataSource;
    bzgzthreeboy: TDataSource;
    bzgzthreegirl: TDataSource;
    bzgztwoboy: TDataSource;
    bzgztwogirl: TDataSource;
    zdxbothstandboy: TTable;
    zdxbothstandgirl: TTable;
    zdxstandhboy: TTable;
    zdxstandhgirl: TTable;
    zgzonestandboy: TTable;
    zgzonestandgirl: TTable;
    zgzstandhboy: TTable;
    zgzstandhgirl: TTable;
    zgzthreestandboy: TTable;
    zgzthreestandgirl: TTable;
    zgztwostandboy: TTable;
    zgztwostandgirl: TTable;
    dstugread: TDataSource;
    stugread: TTable;
    Ddengji: TDataSource;
    studengji: TTable;
    stugreadinfo: TTable;
    Dstugreadinfo: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.

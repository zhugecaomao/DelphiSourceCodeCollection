unit DataModule_Unit;

interface

uses
  SysUtils, Classes, DB, ADODB, ExtCtrls;

type
  TNetBBS_DataModule = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NetBBS_DataModule: TNetBBS_DataModule;

implementation

{$R *.dfm}

end.

unit DMyzcx_;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMyzcx = class(TDataModule)
    ADOCyzcx: TADOConnection;
    ADOSPone: TADOStoredProc;
    ADOSPyear: TADOStoredProc;
    ADOSPMoneyAll: TADOStoredProc;
    ADOSPMonthMoneyAll: TADOStoredProc;
    ADOSPGetDrOPS: TADOStoredProc;
    ADOQOPSCount: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMyzcx: TDMyzcx;

implementation

{$R *.dfm}

end.

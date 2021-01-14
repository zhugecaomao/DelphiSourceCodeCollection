unit shuju;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  Tfrmdate = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADODataSet1: TADODataSet;
    ADOQuery1: TADOQuery;
    ADODataSet2: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdate: Tfrmdate;

implementation

{$R *.dfm}

end.

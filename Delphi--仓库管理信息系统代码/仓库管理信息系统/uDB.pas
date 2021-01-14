unit uDB;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmWarehouse = class(TDataModule)
    ACWarehouse: TADOConnection;
    XXDB_CKDYB: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmWarehouse: TdmWarehouse;

implementation

{$R *.dfm}

end.

unit Dataa;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TData3 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery2: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOQuery3: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Data3: TData3;

implementation

{$R *.dfm}

end.

unit FrmData;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModule1 = class(TDataModule)
    ADOCon: TADOConnection;
    ADOSelect: TADOQuery;
    ADOTax: TADOQuery;
    ADOOther: TADOQuery;
    ADOTableTax: TADOTable;
  private
    
  public
    
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.

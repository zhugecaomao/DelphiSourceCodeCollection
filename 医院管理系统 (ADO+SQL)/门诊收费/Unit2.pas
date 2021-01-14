unit Unit2;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMmzsf = class(TDataModule)
    ADOCmzsf: TADOConnection;
    ADOTmzsf: TADOTable;
    DSmzsf: TDataSource;
    ADOTyp: TADOTable;
    DSyp: TDataSource;
    ADOTmzsfDesigner1: TStringField;
    ADOTmzsfDSDesigner2: TIntegerField;
    ADOTmzsfDSDesigner3: TFloatField;
    ADOTmzsfDSDesigner4: TDateTimeField;
    ADOQmzsf: TADOQuery;
    ADOQmzsfDSDesigner: TStringField;
    ADOQmzsfDSDesigner2: TStringField;
    ADOQmzsfDSDesigner4: TFloatField;
    ADOQmzsfDSDesigner5: TFloatField;
    ADOQmzsfDSDesigner9: TStringField;
    DSQyp: TDataSource;
    ADOQdtzj: TADOQuery;
    DSdtzj: TDataSource;
    ADOQ2bh: TStringField;
    ADOQ2sl: TIntegerField;
    ADOQ2fy: TFloatField;
    ADOQdtzjDSDesigner4: TDateTimeField;
    
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  DMmzsf: TDMmzsf;

implementation

uses Unit1;

{$R *.dfm}




end.

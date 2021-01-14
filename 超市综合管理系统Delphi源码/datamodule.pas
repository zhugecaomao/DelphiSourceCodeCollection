unit datamodule;

interface

uses
  SysUtils, Classes, ADODB, DB, RpRave, RpDefine, RpCon, RpConDS;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ADOCommand1: TADOCommand;
    ADOQuery1: TADOQuery;
    RvDataSetConnection1: TRvDataSetConnection;
    RvProject1: TRvProject;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    RvProject2: TRvProject;
    RvDataSetConnection2: TRvDataSetConnection;
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

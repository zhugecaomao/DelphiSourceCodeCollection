unit dataut;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdataconfm = class(TDataModule)
    datacon: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dataconfm: Tdataconfm;

implementation

{$R *.dfm}

procedure Tdataconfm.DataModuleCreate(Sender: TObject);
var
datapath:string;
begin
datapath:=extractfilepath(paramstr(0));
datacon.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+datapath+'data\kcgl.mdb;Persist Security Info=False';
datacon.Connected:=true;
end;

end.

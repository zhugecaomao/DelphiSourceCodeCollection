unit DMUnit;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    UseNameQuery: TADOQuery;
    UseNameSource: TDataSource;
    FhxxQuery: TADOQuery;
    FhxxSource: TDataSource;
    SHXXQuery: TADOQuery;
    SHXXSource: TDataSource;
    HY_XXQuery: TADOQuery;
    HY_XXSource: TDataSource;
    CD_XXQuery: TADOQuery;
    CD_XXSource: TDataSource;
    LY_XXQuery: TADOQuery;
    LY_XXSource: TDataSource;
    DL_XXSource: TDataSource;
    DL_XXQuery: TADOQuery;
    YWYSource: TDataSource;
    YWYQuery: TADOQuery;
    HYFYQuery: TADOQuery;
    HYFYSource: TDataSource;
    CDFYQuery: TADOQuery;
    CDFYSource: TDataSource;
    TEMPSource: TDataSource;
    TEMPQuery: TADOQuery;
    DLFYSource: TDataSource;
    DLFYQuery: TADOQuery;
    OTHERSource: TDataSource;
    OTHERQuery: TADOQuery;
    KHFYSource: TDataSource;
    BoxFYQuery: TADOQuery;
    LYBOXQuery: TADOQuery;
    LYPRCQuery: TADOQuery;
    LYPADQuery: TADOQuery;
    DLBOXQuery: TADOQuery;
    DLPRCQuery: TADOQuery;
    MonthSource: TDataSource;
    MonthQuery: TADOQuery;
    KFYQuery: TADOQuery;
    QueryKH: TADOQuery;
    KHFYQuery: TADOQuery;
    Conn: TADOConnection;
    DS_QueryKH: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    KFY1Query: TADOQuery;
    ADOQuery5: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses CDUnit, YWYUnit;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
//var
  //cnnstr,prvdr,dataprvdr,dsdir:string;
begin
  with conn do
    try
  conn.Connected:=false;
  conn.ConnectionString:=' Provider=SQLOLEDB.1;Password=wygsmanager;Persist Security Info=True;User ID=sa;Initial Catalog=DATA;Data Source=kj';
  conn.Connected:=true;
   //showmessage('sdff');
    except
    //showmessage('34324');
    end;

 { cnnstr:='Provider=%s;Data provider=%s;Data Source=%s';
  prvdr:='msdatashape.1';
  dataprvdr:='Microsoft.Jet.OLEDB.4.0';
  dsdir:=GetcurrentDir+'\Data\CHANGHAI.mdb';
  self.Conn.Connected:=false;
  self.Conn.ConnectionString:='';
  self.Conn.ConnectionString:=Format(Cnnstr,[prvdr,dataprvdr,dsdir]);
  cnnstr:=self.Conn.ConnectionString;
  self.Conn.Connected:=True; }
end;

end.

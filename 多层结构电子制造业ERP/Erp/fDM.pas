unit fDM;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect;

type
  TDM = class(TDataModule)
    UserInfor: TClientDataSet;
    ErpDcom: TDCOMConnection;
  private
    { Private declarations }
  public
  sysUser,sysTheGroupStr:String;
  sysTheGroupInt:Integer;
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.

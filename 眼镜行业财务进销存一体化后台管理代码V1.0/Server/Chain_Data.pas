unit Chain_Data;

interface

uses
  SysUtils, Classes, Provider, DB, ADODB,Registry,windows,forms;

type
  Tfrm_Chain_Data = class(TDataModule)
    ADO_Connection: TADOConnection;
    ADOConnMaster: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    //function CheckRecord(strSql: string):Boolean;  //检查是否有符合条件的记录
    //function GetFieldValue(strSql: string):Variant;  //返回sql语句的字段值（一个）
    //function IsModify(DeltaDS: TClientDataSet; strFieldName: string): boolean;
    //function GetCurValue(DeltaDS: TClientDataSet; strFieldName: string): Variant;
    //function GetValue(DeltaDS: TClientDataSet; strFieldName: string;
    //GetValueType: TGetValueType): string;
    //procedure SetJQJ(strHPID: string; SL, DJ: double; Kind: string);
    protected
    //class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    //procedure SetFilter(Filter: OleVariant); safecall;
  public
    { Public declarations }
  end;

var
  frm_Chain_Data: Tfrm_Chain_Data;

implementation

uses  func, Unitzc, Unitpubsub;

{$R *.dfm}

procedure Tfrm_Chain_Data.DataModuleCreate(Sender: TObject);
var
  reg:treginifile;
  fwqm,yhm,mm,sjkm,ms:string;
begin
  reg:=treginifile.Create;
  reg.RootKey:=HKEY_LOCAL_MACHINE;
  fwqm:=reg.ReadString('\software\manager_sales','服务器名','');                                  //;User ID='+trim(yhm)+';password='+trim(mm)+'
  yhm:=reg.ReadString('\software\manager_sales','用户名称','');
  mm:=reg.ReadString('\software\manager_sales','用户密码','');
  sjkm:=reg.ReadString('\software\manager_sales','数据库名称','');
  ms:= reg.ReadString('\software\manager_sales','连接模式','');
  ADOconnmaster.DefaultDatabase:=sjkm;
  if trim(ms)='2' then
  begin
    ADOconnmaster.ConnectionString:='Provider=SQLOLEDB.1;Persist Security Info=False;User ID='+trim(yhm)+';password='+trim(mm)+';Initial Catalog='+trim(sjkm)+';Data Source='+trim(fwqm);
  end;
  if trim(ms)='1' then
  begin
    ADOconnmaster.ConnectionString:='Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog='+trim(sjkm)+';Data Source='+trim(fwqm);
  end;
  try
  ADOconnmaster.Connected:=true;
  SERVERNAME:=FWQM;
  except
    Application.MessageBox('数据库连接错误,请重新注册!','错误',mb_iconwarning);
    Application.CreateForm(TFormzc, Formzc);
    formzc.ShowModal;
  end;
  reg.Free;
  reg:=treginifile.Create;
  reg.RootKey:=HKEY_LOCAL_MACHINE;
  sjkm:=reg.ReadString('\software\manager_DB','数据库名称','');
  ms:= reg.ReadString('\software\manager_DB','连接模式','');
  ADO_Connection.DefaultDatabase:=sjkm;
  if trim(ms)='2' then
  begin
    ADO_Connection.ConnectionString:='Provider=SQLOLEDB.1;Persist Security Info=False;User ID='+trim(yhm)+';password='+trim(mm)+';Initial Catalog='+trim(sjkm)+';Data Source='+trim(fwqm);
  end;
  if trim(ms)='1' then
  begin
    ADO_Connection.ConnectionString:='Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog='+trim(sjkm)+';Data Source='+trim(fwqm);
  end;
  try
  ADO_Connection.Connected:=true;
  servername:=trim(fwqm);
  except
  end;
  reg.Free;
end;

end.

unit GZGL_DModule;

interface

uses
   Windows,Forms,


  SysUtils, ADODB, DB, Classes;

type
  Tdmd = class(TDataModule)
    Connec_main: TADOConnection;
    Tbl_GZCP3: TADOTable;
    Tbl_ZBLX: TADOTable;
    Src_GZ: TDataSource;
    Src_CP: TDataSource;
    Src_GZCP3: TDataSource;
    Tbl_CP: TADOTable;
    Tbl_GZ: TADOTable;
    Qry_GZ2: TADOQuery;
    Qry_ZBLX: TADOQuery;
    Qry_GZCP: TADOQuery;
    Qry_GZ: TADOQuery;
    SrcQry_GZ: TDataSource;
    SrcQry_GZ2: TDataSource;
    SrcQry_ZBLX: TDataSource;
    SrcQry_GZCP: TDataSource;
    Tbl_dw: TADOTable;
    Src_dw: TDataSource;
    Src_zblx: TDataSource;
    Src_gz3: TDataSource;
    Tbl_gz3: TADOTable;
    Tbl_GZCP: TADOTable;
    Src_GZCP: TDataSource;
    Tbl_GZCP2: TADOTable;
    Src_GZCP2: TDataSource;
    Src_cp2: TDataSource;
    Tbl_cp2: TADOTable;
    TbL_yzjh: TADOTable;
    Src_yzjh: TDataSource;
    TbL_lb: TADOTable;
    Src_lb: TDataSource;
    TbL_zzjh: TADOTable;
    Src_zzjh: TDataSource;
    Qry_temp: TADOQuery;
    Qry_CP: TADOQuery;
    SrcQry_CP: TDataSource;
    Qry_GZ1: TADOQuery;
    SrcQry_GZ1: TDataSource;
    Tbl_NBB: TADOTable;
    Src_NBB: TDataSource;
    Src_temp: TDataSource;
    Tbl_YBB: TADOTable;
    Src_YBB: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmd: Tdmd;

implementation

{$R *.dfm}

procedure Tdmd.DataModuleCreate(Sender: TObject);
var
  s,Mypath:string;
  strlst:tstringlist;
begin
  //配置数据
  Connec_main.connected:=false;
    application.ExeName;
  Mypath:=extractfilepath(application.exename);
  s:=mypath+'dataset.ini';
  if fileexists(s) then begin
    strlst:=tstringlist.Create;
    strlst.LoadFromFile(s);
    s:=strlst.Text;
  end else begin
    s:='Provider=Microsoft.Jet.OLEDB.3.51;'+
       'Persist Security Info=False;'+
       'mode = share deny none;'+
       'Data Source=%sSQ_GZK.mdb';
  end;
  s:=format(s,[mypath]);
  try
    Connec_main.ConnectionString:=s;
    Connec_main.connected:=true;
    tbl_gz.open;
    tbl_cp.open;
    tbl_gzcp.open;
  except
    s:='老兄,数据连接错误,请与管理员联系！ ';
    MessageBox(application.handle,pchar(s),'错误',16+mb_ok);
  end;

end;

end.

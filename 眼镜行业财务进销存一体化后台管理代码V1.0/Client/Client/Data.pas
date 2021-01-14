unit Data;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, ADODB,Inifiles, DBClient, MConnect, Menus,
  SConnect, ObjBrkr, Provider, ScktComp;

type
  Tfrm_Data = class(TDataModule)
    Socket_Connection: TSocketConnection;
    Simple: TSimpleObjectBroker;
    ClientDataSet_Add: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    ClientDataSet4: TClientDataSet;
    ClientDataSet_Goods: TClientDataSet;
    Client_Temp: TClientDataSet;
    DataSource_Search: TDataSource;
    ClientDataSet_Select: TClientDataSet;
    ClientDataSet_Stock_States: TClientDataSet;
    DataSource_Stock_States: TDataSource;
    DataSource_Stock_States_detail: TDataSource;
    ClientDataSet_Stock_States_detail: TClientDataSet;
    ClientDataSet_Stock_States_Total: TClientDataSet;
    DataSource_Stock_States_Total: TDataSource;
    ClientDataSet_Goods_Information: TClientDataSet;
    DataSource_Goods_Information: TDataSource;
    DataSource_StoreProdc: TDataSource;
    StoredProc1: TStoredProc;
    ClientDataSet_Stock_Jion_Search: TClientDataSet;
    DataSource_Stock_Jion_Search: TDataSource;
    ClientDataSet_Submit_adopt: TClientDataSet;
    DataSource_Submit_adopt: TDataSource;
    ClientDataSet_Submit_adopt_detail: TClientDataSet;
    DataSource_Submit_adopt_detail: TDataSource;
    ClientDataSet_Receipt: TClientDataSet;
    DataSource_Receipt: TDataSource;
    ClientDataSet_Submit_quit_detail: TClientDataSet;
    DataSource_Submit_quit_detail: TDataSource;
    ClientDataSet_Submit_quit: TClientDataSet;
    DataSource_Submit_quit: TDataSource;
    ClientDataSet_Storage_Warn: TClientDataSet;
    DataSource_Storage_Warn: TDataSource;
    ClientDataSet_Company: TClientDataSet;
    DataSource_Company: TDataSource;
    ClientDataSet_TMP: TClientDataSet;
    DataSource_TMP: TDataSource;
    Data_SP_Part_Set: TDataSource;
    Data_Goods: TDataSource;
    Client_Goods: TClientDataSet;
    Data_Part_Set: TDataSource;
    Client_Part_Set: TClientDataSet;
    Client_SP_Part_Set: TClientDataSet;
    Data_Stock_States: TDataSource;
    Client_Stock_States: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Pub_Right:String;
  end;

var
  frm_Data: Tfrm_Data;
implementation

uses  func, Unitzcser;

{$R *.dfm}

procedure Tfrm_Data.DataModuleCreate(Sender: TObject);
var
  fl:tinifile;
  s,remo:string;
  i,j:integer;
  sv:tserveritem;
begin
  fl:=Tinifile.Create(ExtractFilePath(application.ExeName)+'GD_IP_Config.ini');
  //********服务器名称解密码************
  s:=fl.ReadString('servers','counts','');
  if s='' then
  begin
    i:=0;
  end else
  begin
    i:=strtoint(s);
  end;
  for j:=1 to i do
  begin
    remo:=fl.ReadString('servers','servier'+inttostr(j),'');
    simple.Servers.Add;
    simple.Servers[j-1].ComputerName:=trim(remo);
  end;
  fl.Free;
  try
  Socket_Connection.Connected:=true;
  except
    application.MessageBox('应用服务器连接错误,请重新注册应用服务器！',pchar(application.Title),mb_iconwarning);
    application.CreateForm(tfrmzcser,frmzcser);
    frmzcser.ShowModal;
  end;
end;


end.



unit untdatadm;

interface

uses
  SysUtils, Classes, DB, DBClient,windows,forms, MConnect, SConnect,inifiles,
  ObjBrkr, WinSkinStore, WinSkinData, FR_DSet, FR_DBSet,variants;

type
  Tdmmain = class(TDataModule)
    cdsStock_contract: TClientDataSet;
    cdsReceipt: TClientDataSet;
    cdsStock_contract_detail: TClientDataSet;
    CDSexecsql: TClientDataSet;
    CDSquery: TClientDataSet;
    CDSquery2: TClientDataSet;
    csdStock_Write: TClientDataSet;
    cdsStock_Write_detail: TClientDataSet;
    cdsStock_States: TClientDataSet;
    cdsStock_Jion: TClientDataSet;
    cdsQuality_Check: TClientDataSet;
    cdsQuality_Check_detail: TClientDataSet;
    cdsCancel_strip: TClientDataSet;
    cdsCanceldetail: TClientDataSet;
    socketpublic: TSocketConnection;
    cdsstockdetail: TClientDataSet;
    cdspornal: TClientDataSet;
    cdspart: TClientDataSet;
    cdspay: TClientDataSet;
    cdspaydetail: TClientDataSet;
    cdsmoneyinput: TClientDataSet;
    cdsmoneydetail: TClientDataSet;
    cdsstockwarn: TClientDataSet;
    cdsstorage: TClientDataSet;
    dsquery: TClientDataSet;
    cdsscrap: TClientDataSet;
    cdsscrapdetail: TClientDataSet;
    cdscheck: TClientDataSet;
    cdscheckdetail: TClientDataSet;
    cdsOverflow: TClientDataSet;
    cdsOverflowdetail: TClientDataSet;
    cdsoutstrip: TClientDataSet;
    cdsoutdetail: TClientDataSet;
    cdsGoods_Requirement: TClientDataSet;
    cdsGoods_Requirement_Detail: TClientDataSet;
    cdsflat: TClientDataSet;
    cdsflatdetail: TClientDataSet;
    cdsBatchGuest: TClientDataSet;
    cdsprice: TClientDataSet;
    dsmaster: TDataSource;
    cdsprintmaster: TClientDataSet;
    SkinData1: TSkinData;
    SkinStore1: TSkinStore;
    cdssupply_company: TClientDataSet;
    dscompany: TDataSource;
    cdsdata: TClientDataSet;
    cdsKQdoc: TClientDataSet;
    cdsbcjg: TClientDataSet;
    cdsbcap: TClientDataSet;
    cdsstorage_jion: TClientDataSet;
    cdsstorage_detail: TClientDataSet;
    frDBDataprint: TfrDBDataSet;
    cdspresent: TClientDataSet;
    cdspresentdetail: TClientDataSet;
    cdsyddata: TClientDataSet;
    CdsCOMINFO: TClientDataSet;
    Dscominfo: TDataSource;
    procedure CDSexecsqlReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsReceiptReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsStock_JionReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsstockwarnReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsstorageReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsbcjgReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsbcapReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure dsqueryAfterClose(DataSet: TDataSet);
    procedure CDSqueryAfterClose(DataSet: TDataSet);
    procedure CDSquery2AfterClose(DataSet: TDataSet);
    procedure CDSexecsqlAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmmain: Tdmmain;

implementation

uses Data, func, Unitzcser;

{$R *.dfm}

procedure Tdmmain.CDSexecsqlReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin

  application.MessageBox(pchar(e.Message),'提示',10);
end;

procedure Tdmmain.DataModuleCreate(Sender: TObject);
var
  fl:tinifile;
  s,remo:string;
  i,j:integer;
  sv:tserveritem;
begin
  fl:=Tinifile.Create(ExtractFilePath(application.ExeName)+'Systeminit.ini');
  //********服务器名称解密码************
  s:=fl.ReadString('Skin','itemindex','');
  if s='' then
  begin
    i:=0;
  end else
  begin
    i:=strtoint(s);
  end;
  Skinid:=i;
  SkinData1.LoadFromCollection(SkinStore1,i);
  fl.Free;
  try
  socketpublic.Connected:=true;
  except
    application.MessageBox('应用服务器连接错误,请重新注册应用服务器！',pchar(application.Title),mb_iconwarning);
    application.CreateForm(tfrmzcser,frmzcser);
    frmzcser.ShowModal;
  end;


end;

procedure Tdmmain.cdsReceiptReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  application.MessageBox(pchar(e.Message),'错误',mb_iconwarning); 
end;

procedure Tdmmain.cdsStock_JionReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  application.MessageBox(pchar(e.Message),'error',mb_iconwarning); 
end;

procedure Tdmmain.cdsstockwarnReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  application.MessageBox(pchar(e.Message),'error',mb_iconwarning);
end;

procedure Tdmmain.cdsstorageReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  application.MessageBox(pchar(e.Message),'error',mb_iconwarning);
end;

procedure Tdmmain.cdsbcjgReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  application.MessageBox(pchar(e.Message),'error',mb_iconwarning);
end;

procedure Tdmmain.cdsbcapReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  application.MessageBox(pchar(e.Message),'error',mb_iconwarning);
end;

procedure Tdmmain.dsqueryAfterClose(DataSet: TDataSet);
begin
  dsquery.Data:=null;
  dsquery.IndexName:='';
  dsquery.IndexDefs.Clear;
end;

procedure Tdmmain.CDSqueryAfterClose(DataSet: TDataSet);
begin
  cdsquery.Data:=null;
  cdsquery.IndexName:='';
  cdsquery.IndexDefs.Clear;
end;

procedure Tdmmain.CDSquery2AfterClose(DataSet: TDataSet);
begin
  cdsquery2.Data:=null;
  cdsquery2.IndexName:='';
  cdsquery2.IndexDefs.Clear;
end;

procedure Tdmmain.CDSexecsqlAfterClose(DataSet: TDataSet);
begin
  cdsexecsql.Data:=null;
  cdsexecsql.IndexName:='';
  cdsexecsql.IndexDefs.Clear;
end;

end.

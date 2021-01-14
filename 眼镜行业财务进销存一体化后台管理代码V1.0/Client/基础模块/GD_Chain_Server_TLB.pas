unit GD_Chain_Server_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.130  $
// File generated on 2004-8-3 11:50:56 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\zzh\216³ÌÐò\Server\GD_Chain_Server.tlb (1)
// LIBID: {142B2F15-25E9-4DE5-AE11-63EBC1329B23}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (D:\WINNT\system32\midas.dll)
//   (2) v2.0 stdole, (D:\WINNT\SYSTEM32\STDOLE2.TLB)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}

interface

uses ActiveX, Classes, Graphics, Midas, StdVCL, Variants, Windows;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  GD_Chain_ServerMajorVersion = 1;
  GD_Chain_ServerMinorVersion = 0;

  LIBID_GD_Chain_Server: TGUID = '{142B2F15-25E9-4DE5-AE11-63EBC1329B23}';

  IID_IEasy_Dcom_Server: TGUID = '{66D5A470-06EF-4952-9C16-F341EAFDD162}';
  CLASS_Easy_Dcom_Server: TGUID = '{70D825D1-C4AD-4E28-B216-FF5152FF6118}';
  IID_IPublicServer: TGUID = '{333729FB-3E89-4E1D-9206-225BF082FB07}';
  CLASS_PublicServer: TGUID = '{E3485416-8439-4E76-BECB-1F7506164E4C}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IEasy_Dcom_Server = interface;
  IEasy_Dcom_ServerDisp = dispinterface;
  IPublicServer = interface;
  IPublicServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Easy_Dcom_Server = IEasy_Dcom_Server;
  PublicServer = IPublicServer;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  POleVariant1 = ^OleVariant; {*}


// *********************************************************************//
// Interface: IEasy_Dcom_Server
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {66D5A470-06EF-4952-9C16-F341EAFDD162}
// *********************************************************************//
  IEasy_Dcom_Server = interface(IAppServer)
    ['{66D5A470-06EF-4952-9C16-F341EAFDD162}']
    function  GetRecord(const sql: WideString): OleVariant; safecall;
    function  execSql(const sql: WideString): OleVariant; safecall;
    function  resultrecord(const sql: WideString): OleVariant; safecall;
    function  receipted(const receipt_no: WideString; const typed: WideString; 
                        const user_no: WideString; Unre: Integer; const Part_no: WideString): OleVariant; safecall;
    function  inputstorage(const no: WideString; flag: Integer; const shop_id: WideString): OleVariant; safecall;
    function  inputMoney(const no: WideString; flag: Integer): OleVariant; safecall;
    function  updatesql(const sqlpub: WideString): OleVariant; safecall;
    procedure InsertSendBill(var MasterData: OleVariant; var DetailData: OleVariant; 
                             EditMode: Integer; var PsResoult: Integer); safecall;
    procedure InsertGetPlan(var MasterData: OleVariant; var DetailData: OleVariant; 
                            EditMode: Integer; var PsResoult: Integer); safecall;
    function  PubBatch(const sqltemp: WideString): OleVariant; safecall;
    function  userlogin(const shopID: WideString; const user: WideString; const pwd: WideString; 
                        const selfcuid: WideString; out outbool: OleVariant): OleVariant; safecall;
    function  CancelGoods(const shopID: WideString; const Stock_No: WideString): WordBool; safecall;
    function  UpdateOrder(const TableName: WideString): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IEasy_Dcom_ServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {66D5A470-06EF-4952-9C16-F341EAFDD162}
// *********************************************************************//
  IEasy_Dcom_ServerDisp = dispinterface
    ['{66D5A470-06EF-4952-9C16-F341EAFDD162}']
    function  GetRecord(const sql: WideString): OleVariant; dispid 1;
    function  execSql(const sql: WideString): OleVariant; dispid 2;
    function  resultrecord(const sql: WideString): OleVariant; dispid 3;
    function  receipted(const receipt_no: WideString; const typed: WideString; 
                        const user_no: WideString; Unre: Integer; const Part_no: WideString): OleVariant; dispid 4;
    function  inputstorage(const no: WideString; flag: Integer; const shop_id: WideString): OleVariant; dispid 5;
    function  inputMoney(const no: WideString; flag: Integer): OleVariant; dispid 6;
    function  updatesql(const sqlpub: WideString): OleVariant; dispid 7;
    procedure InsertSendBill(var MasterData: OleVariant; var DetailData: OleVariant; 
                             EditMode: Integer; var PsResoult: Integer); dispid 8;
    procedure InsertGetPlan(var MasterData: OleVariant; var DetailData: OleVariant; 
                            EditMode: Integer; var PsResoult: Integer); dispid 9;
    function  PubBatch(const sqltemp: WideString): OleVariant; dispid 10;
    function  userlogin(const shopID: WideString; const user: WideString; const pwd: WideString; 
                        const selfcuid: WideString; out outbool: OleVariant): OleVariant; dispid 11;
    function  CancelGoods(const shopID: WideString; const Stock_No: WideString): WordBool; dispid 12;
    function  UpdateOrder(const TableName: WideString): Integer; dispid 13;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames: OleVariant; dispid 20000003;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// Interface: IPublicServer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {333729FB-3E89-4E1D-9206-225BF082FB07}
// *********************************************************************//
  IPublicServer = interface(IAppServer)
    ['{333729FB-3E89-4E1D-9206-225BF082FB07}']
    procedure returedate(out begindate: OleVariant; out enddate: OleVariant; 
                         out checkcode: OleVariant; const shopID: WideString); safecall;
    procedure updatecheck(const fieldnames: WideString; const numbers: WideString; 
                          const checkcode: WideString; const goodsno: WideString); safecall;
    procedure quedetail(const checkcode: WideString; out values: OleVariant); safecall;
    procedure ty_query(const t_sql: WideString; out t_rs: OleVariant); safecall;
    procedure autoid(const sql: WideString; const maks: WideString; out outid: OleVariant); safecall;
    procedure stock(flag: Integer; const shopID: WideString; const operater: WideString; 
                    const officeid: WideString); safecall;
    procedure scrapsate(const sql: WideString); safecall;
    function  inputFlat(const no: WideString; const shopID: WideString): OleVariant; safecall;
    procedure Gether(const G_no: WideString; money: Double; flag: Integer; bz: Integer); safecall;
    function  MoneyTable(index: Integer; const no: WideString; totalmoneys: Double; 
                         const billid: WideString; const checkid: WideString; 
                         const passid: WideString; const wldwno: WideString; 
                         const wldwname: WideString; const shopID: WideString; 
                         const remark: WideString): OleVariant; safecall;
    function  batchstock(const Stock_No: WideString; typed: Integer): OleVariant; safecall;
    function  Updatebatch(const Stock_No: WideString; const Part_no: WideString): OleVariant; safecall;
    function  OutNewShop(const no: WideString): OleVariant; safecall;
    function  MZSGOODS(const no: WideString; Flag: Integer): OleVariant; safecall;
    procedure LQ_WriteFinanceBill(billid: Integer; BillType: Integer; BillDate: OleVariant; 
                                  const AccountId: WideString; const AccountName: WideString; 
                                  const AccountId2: WideString; const AccountName2: WideString; 
                                  Total: Double; const Comment: WideString; ord: Integer; 
                                  out nRet: Integer; const ShopNo: WideString; EditMode: Integer); safecall;
    procedure WriteMainBill(const BillCode: WideString; BillType: Integer; BillDate: OleVariant; 
                            const BillEId: WideString; const CheckEid: WideString; 
                            const PassEid: WideString; const UnitId: WideString; 
                            const UnitName: WideString; Total: Double; IsCheck: Integer; 
                            Red: Integer; const PosId: WideString; const Explain: WideString; 
                            out ret: Integer; EditMode: Integer; billid: Integer); safecall;
    function  EditMoney(Main_no: Integer; const checkid: WideString): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IPublicServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {333729FB-3E89-4E1D-9206-225BF082FB07}
// *********************************************************************//
  IPublicServerDisp = dispinterface
    ['{333729FB-3E89-4E1D-9206-225BF082FB07}']
    procedure returedate(out begindate: OleVariant; out enddate: OleVariant; 
                         out checkcode: OleVariant; const shopID: WideString); dispid 2;
    procedure updatecheck(const fieldnames: WideString; const numbers: WideString; 
                          const checkcode: WideString; const goodsno: WideString); dispid 3;
    procedure quedetail(const checkcode: WideString; out values: OleVariant); dispid 4;
    procedure ty_query(const t_sql: WideString; out t_rs: OleVariant); dispid 1;
    procedure autoid(const sql: WideString; const maks: WideString; out outid: OleVariant); dispid 5;
    procedure stock(flag: Integer; const shopID: WideString; const operater: WideString; 
                    const officeid: WideString); dispid 6;
    procedure scrapsate(const sql: WideString); dispid 7;
    function  inputFlat(const no: WideString; const shopID: WideString): OleVariant; dispid 8;
    procedure Gether(const G_no: WideString; money: Double; flag: Integer; bz: Integer); dispid 9;
    function  MoneyTable(index: Integer; const no: WideString; totalmoneys: Double; 
                         const billid: WideString; const checkid: WideString; 
                         const passid: WideString; const wldwno: WideString; 
                         const wldwname: WideString; const shopID: WideString; 
                         const remark: WideString): OleVariant; dispid 10;
    function  batchstock(const Stock_No: WideString; typed: Integer): OleVariant; dispid 11;
    function  Updatebatch(const Stock_No: WideString; const Part_no: WideString): OleVariant; dispid 12;
    function  OutNewShop(const no: WideString): OleVariant; dispid 13;
    function  MZSGOODS(const no: WideString; Flag: Integer): OleVariant; dispid 14;
    procedure LQ_WriteFinanceBill(billid: Integer; BillType: Integer; BillDate: OleVariant; 
                                  const AccountId: WideString; const AccountName: WideString; 
                                  const AccountId2: WideString; const AccountName2: WideString; 
                                  Total: Double; const Comment: WideString; ord: Integer; 
                                  out nRet: Integer; const ShopNo: WideString; EditMode: Integer); dispid 20;
    procedure WriteMainBill(const BillCode: WideString; BillType: Integer; BillDate: OleVariant; 
                            const BillEId: WideString; const CheckEid: WideString; 
                            const PassEid: WideString; const UnitId: WideString; 
                            const UnitName: WideString; Total: Double; IsCheck: Integer; 
                            Red: Integer; const PosId: WideString; const Explain: WideString; 
                            out ret: Integer; EditMode: Integer; billid: Integer); dispid 21;
    function  EditMoney(Main_no: Integer; const checkid: WideString): Integer; dispid 15;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames: OleVariant; dispid 20000003;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoEasy_Dcom_Server provides a Create and CreateRemote method to          
// create instances of the default interface IEasy_Dcom_Server exposed by              
// the CoClass Easy_Dcom_Server. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoEasy_Dcom_Server = class
    class function Create: IEasy_Dcom_Server;
    class function CreateRemote(const MachineName: string): IEasy_Dcom_Server;
  end;

// *********************************************************************//
// The Class CoPublicServer provides a Create and CreateRemote method to          
// create instances of the default interface IPublicServer exposed by              
// the CoClass PublicServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPublicServer = class
    class function Create: IPublicServer;
    class function CreateRemote(const MachineName: string): IPublicServer;
  end;

implementation

uses ComObj;

class function CoEasy_Dcom_Server.Create: IEasy_Dcom_Server;
begin
  Result := CreateComObject(CLASS_Easy_Dcom_Server) as IEasy_Dcom_Server;
end;

class function CoEasy_Dcom_Server.CreateRemote(const MachineName: string): IEasy_Dcom_Server;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Easy_Dcom_Server) as IEasy_Dcom_Server;
end;

class function CoPublicServer.Create: IPublicServer;
begin
  Result := CreateComObject(CLASS_PublicServer) as IPublicServer;
end;

class function CoPublicServer.CreateRemote(const MachineName: string): IPublicServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PublicServer) as IPublicServer;
end;

end.

unit erpServer_TLB;

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
// File generated on 03-5-26 18:13:59 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Èí¼þ¿ª·¢\Erp\Server\erpServer.tlb (1)
// LIBID: {B1F4B860-8FA5-11D7-BDAA-5254AB374BF2}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\SYSTEM\STDOLE2.TLB)
//   (2) v4.0 StdVCL, (C:\WINDOWS\SYSTEM\stdvcl40.dll)
//   (3) v1.0 Midas, (C:\WINDOWS\SYSTEM\midas.dll)
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
  erpServerMajorVersion = 1;
  erpServerMinorVersion = 0;

  LIBID_erpServer: TGUID = '{B1F4B860-8FA5-11D7-BDAA-5254AB374BF2}';

  IID_IEServer: TGUID = '{B1F4B861-8FA5-11D7-BDAA-5254AB374BF2}';
  CLASS_EServer: TGUID = '{B1F4B863-8FA5-11D7-BDAA-5254AB374BF2}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IEServer = interface;
  IEServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  EServer = IEServer;


// *********************************************************************//
// Interface: IEServer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1F4B861-8FA5-11D7-BDAA-5254AB374BF2}
// *********************************************************************//
  IEServer = interface(IAppServer)
    ['{B1F4B861-8FA5-11D7-BDAA-5254AB374BF2}']
  end;

// *********************************************************************//
// DispIntf:  IEServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1F4B861-8FA5-11D7-BDAA-5254AB374BF2}
// *********************************************************************//
  IEServerDisp = dispinterface
    ['{B1F4B861-8FA5-11D7-BDAA-5254AB374BF2}']
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
// The Class CoEServer provides a Create and CreateRemote method to          
// create instances of the default interface IEServer exposed by              
// the CoClass EServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoEServer = class
    class function Create: IEServer;
    class function CreateRemote(const MachineName: string): IEServer;
  end;

implementation

uses ComObj;

class function CoEServer.Create: IEServer;
begin
  Result := CreateComObject(CLASS_EServer) as IEServer;
end;

class function CoEServer.CreateRemote(const MachineName: string): IEServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EServer) as IEServer;
end;

end.

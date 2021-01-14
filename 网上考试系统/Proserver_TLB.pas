unit Proserver_TLB;

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
// File generated on 2003-5-22 20:39:18 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\øº ‘œµÕ≥\Proserver.tlb (1)
// LIBID: {28D9B113-9A4B-4061-9B99-0DD3707A8F46}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (D:\WINNT\System32\midas.dll)
//   (2) v2.0 stdole, (D:\WINNT\System32\stdole2.tlb)
//   (3) v4.0 StdVCL, (D:\WINNT\System32\stdvcl40.dll)
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
  ProserverMajorVersion = 1;
  ProserverMinorVersion = 0;

  LIBID_Proserver: TGUID = '{28D9B113-9A4B-4061-9B99-0DD3707A8F46}';

  IID_Iexamserver: TGUID = '{B246069C-CC05-4DD8-B52D-3234D0EF4B1B}';
  CLASS_examserver: TGUID = '{B674DE19-F8FC-4448-BFAA-3A3A5BDA7AEE}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  Iexamserver = interface;
  IexamserverDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  examserver = Iexamserver;


// *********************************************************************//
// Interface: Iexamserver
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B246069C-CC05-4DD8-B52D-3234D0EF4B1B}
// *********************************************************************//
  Iexamserver = interface(IAppServer)
    ['{B246069C-CC05-4DD8-B52D-3234D0EF4B1B}']
  end;

// *********************************************************************//
// DispIntf:  IexamserverDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B246069C-CC05-4DD8-B52D-3234D0EF4B1B}
// *********************************************************************//
  IexamserverDisp = dispinterface
    ['{B246069C-CC05-4DD8-B52D-3234D0EF4B1B}']
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
// The Class Coexamserver provides a Create and CreateRemote method to          
// create instances of the default interface Iexamserver exposed by              
// the CoClass examserver. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Coexamserver = class
    class function Create: Iexamserver;
    class function CreateRemote(const MachineName: string): Iexamserver;
  end;

implementation

uses ComObj;

class function Coexamserver.Create: Iexamserver;
begin
  Result := CreateComObject(CLASS_examserver) as Iexamserver;
end;

class function Coexamserver.CreateRemote(const MachineName: string): Iexamserver;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_examserver) as Iexamserver;
end;

end.

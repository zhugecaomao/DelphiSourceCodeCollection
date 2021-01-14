unit JxcS_TLB;

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

// PASTLWTR : 1.2
// File generated on 2003-1-5 23:41:20 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Jxc\JxcS.tlb (1)
// LIBID: {7EC66AE1-5977-11D4-927E-0000210072AB}
// LCID: 0
// Helpfile: 
// HelpString: JxcS Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINNT\System32\midas.dll)
//   (2) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
//{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  JxcSMajorVersion = 1;
  JxcSMinorVersion = 0;

  LIBID_JxcS: TGUID = '{7EC66AE1-5977-11D4-927E-0000210072AB}';

  IID_Idatas: TGUID = '{7EC66AE2-5977-11D4-927E-0000210072AB}';
  CLASS_datas: TGUID = '{7EC66AE4-5977-11D4-927E-0000210072AB}';
  IID_IDatasBb: TGUID = '{129E7A00-80EC-11D4-927E-0000210072AB}';
  CLASS_DatasBb: TGUID = '{129E7A02-80EC-11D4-927E-0000210072AB}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  Idatas = interface;
  IdatasDisp = dispinterface;
  IDatasBb = interface;
  IDatasBbDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  datas = Idatas;
  DatasBb = IDatasBb;


// *********************************************************************//
// Interface: Idatas
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7EC66AE2-5977-11D4-927E-0000210072AB}
// *********************************************************************//
  Idatas = interface(IAppServer)
    ['{7EC66AE2-5977-11D4-927E-0000210072AB}']
    procedure SetFilter(Filter: OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  IdatasDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7EC66AE2-5977-11D4-927E-0000210072AB}
// *********************************************************************//
  IdatasDisp = dispinterface
    ['{7EC66AE2-5977-11D4-927E-0000210072AB}']
    procedure SetFilter(Filter: OleVariant); dispid 1;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// Interface: IDatasBb
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {129E7A00-80EC-11D4-927E-0000210072AB}
// *********************************************************************//
  IDatasBb = interface(IAppServer)
    ['{129E7A00-80EC-11D4-927E-0000210072AB}']
    procedure SetFilter(Filter: OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  IDatasBbDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {129E7A00-80EC-11D4-927E-0000210072AB}
// *********************************************************************//
  IDatasBbDisp = dispinterface
    ['{129E7A00-80EC-11D4-927E-0000210072AB}']
    procedure SetFilter(Filter: OleVariant); dispid 1;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class Codatas provides a Create and CreateRemote method to          
// create instances of the default interface Idatas exposed by              
// the CoClass datas. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Codatas = class
    class function Create: Idatas;
    class function CreateRemote(const MachineName: string): Idatas;
  end;

// *********************************************************************//
// The Class CoDatasBb provides a Create and CreateRemote method to          
// create instances of the default interface IDatasBb exposed by              
// the CoClass DatasBb. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDatasBb = class
    class function Create: IDatasBb;
    class function CreateRemote(const MachineName: string): IDatasBb;
  end;

implementation

uses ComObj;

class function Codatas.Create: Idatas;
begin
  Result := CreateComObject(CLASS_datas) as Idatas;
end;

class function Codatas.CreateRemote(const MachineName: string): Idatas;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_datas) as Idatas;
end;

class function CoDatasBb.Create: IDatasBb;
begin
  Result := CreateComObject(CLASS_DatasBb) as IDatasBb;
end;

class function CoDatasBb.CreateRemote(const MachineName: string): IDatasBb;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DatasBb) as IDatasBb;
end;

end.

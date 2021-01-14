unit server_tlb;

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
// File generated on 4/9/99 12:30:18 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Temp\demos\MIDAS\BRFCASE\Server.tlb
// IID\LCID: {A1695C19-F724-11D1-AABE-00C04FA35CFA}\0
// Helpfile: 
// DepndLst: 
//   (1) v4.0 StdVCL, (D:\TP\bin\stdvcl40.dll)
//   (2) v2.0 stdole, (C:\WINNTS\system32\stdole2.tlb)
//   (3) v1.0 Midas, (D:\tp5\bin\midas.dll)
// ************************************************************************ //
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL, 
  MIDAS;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  LIBID_Server: TGUID = '{A1695C19-F724-11D1-AABE-00C04FA35CFA}';
  IID_IBriefCaseDemo: TGUID = '{A1695C1A-F724-11D1-AABE-00C04FA35CFA}';
  CLASS_BriefCaseDemo: TGUID = '{A1695C1C-F724-11D1-AABE-00C04FA35CFA}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IBriefCaseDemo = interface;
  IBriefCaseDemoDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  BriefCaseDemo = IBriefCaseDemo;


// *********************************************************************//
// Interface: IBriefCaseDemo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1695C1A-F724-11D1-AABE-00C04FA35CFA}
// *********************************************************************//
  IBriefCaseDemo = interface(IAppServer)
    ['{A1695C1A-F724-11D1-AABE-00C04FA35CFA}']
  end;

// *********************************************************************//
// DispIntf:  IBriefCaseDemoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1695C1A-F724-11D1-AABE-00C04FA35CFA}
// *********************************************************************//
  IBriefCaseDemoDisp = dispinterface
    ['{A1695C1A-F724-11D1-AABE-00C04FA35CFA}']
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
// The Class CoBriefCaseDemo provides a Create and CreateRemote method to          
// create instances of the default interface IBriefCaseDemo exposed by              
// the CoClass BriefCaseDemo. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBriefCaseDemo = class
    class function Create: IBriefCaseDemo;
    class function CreateRemote(const MachineName: string): IBriefCaseDemo;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TBriefCaseDemo
// Help String      : BriefCaseDemo Object
// Default Interface: IBriefCaseDemo
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TBriefCaseDemo = class(TOleServer)
  private
    FIntf:        IBriefCaseDemo;
    function      GetDefaultInterface: IBriefCaseDemo;

  protected
    procedure InitServerData; override;
  public
    procedure Connect; override;
    procedure Disconnect; override;
  // --------------
  // --------------
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
    function  AS_GetProviderNames: OleVariant;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant);
  // --------------
    property  DefaultInterface: IBriefCaseDemo read GetDefaultInterface;
  // --------------
  // --------------
  // --------------
  // --------------
  published
  end;

procedure Register;

implementation

uses ComObj;

class function CoBriefCaseDemo.Create: IBriefCaseDemo;
begin
  Result := CreateComObject(CLASS_BriefCaseDemo) as IBriefCaseDemo;
end;

class function CoBriefCaseDemo.CreateRemote(const MachineName: string): IBriefCaseDemo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BriefCaseDemo) as IBriefCaseDemo;
end;

procedure TBriefCaseDemo.InitServerData;
const
  CServerData: TServerData = (
    ClassID: '{A1695C1C-F724-11D1-AABE-00C04FA35CFA}';
    EventIID: '';
    LicenseKey: nil;
    Version: 401);

begin
  ServerData := @CServerData;
end;

procedure TBriefCaseDemo.Connect;
begin
  if FIntf = nil then
  begin
    FIntf := CoBriefCaseDemo.Create;
  end;
end;

procedure TBriefCaseDemo.DisConnect;
begin
  FIntf := nil;
end;


function TBriefCaseDemo.GetDefaultInterface: IBriefCaseDemo;
begin
  Connect;
  Result := FIntf;
end;

function  TBriefCaseDemo.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                                         MaxErrors: Integer; out ErrorCount: Integer; 
                                         var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
end;

function  TBriefCaseDemo.AS_GetRecords(const ProviderName: WideString; Count: Integer; 
                                       out RecsOut: Integer; Options: Integer; 
                                       const CommandText: WideString; var Params: OleVariant; 
                                       var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords(ProviderName, Count, RecsOut, Options, CommandText, 
                                           Params, OwnerData);
end;

function  TBriefCaseDemo.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest(ProviderName, Data);
end;

function  TBriefCaseDemo.AS_GetProviderNames: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames;
end;

function  TBriefCaseDemo.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams(ProviderName, OwnerData);
end;

function  TBriefCaseDemo.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; 
                                       RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
end;

procedure TBriefCaseDemo.AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                                    var Params: OleVariant; var OwnerData: OleVariant);
begin
  DefaultInterface.AS_Execute(ProviderName, CommandText, Params, OwnerData);
end;

procedure Register;
begin
  RegisterComponents('Servers',[TBriefCaseDemo]);
end;

end.

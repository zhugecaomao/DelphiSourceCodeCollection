//----------FINISHING CodeFans.NET
unit UNTService;

interface

uses
   SysUtils, Classes, Windows, SvcMgr, WinSvc, Registry;

type
  TNTService = class(TService)
  protected
    procedure Start(Sender: TService; var Started: boolean);
    procedure Stop(Sender: TService; var Stopped: boolean);
    procedure Execute(Sender: TService);
    procedure ServiceAfterInstall(Sender: TService);
  public
    function GetServiceController: TServiceController; override;
    constructor CreateNew(AOwner: TComponent; Dummy: integer = 0); override;
    procedure CreateForm(InstanceClass: TComponentClass; var Reference);
    procedure Run;
  end;

function StartNTService(DisplayName, Description: string): Boolean;
function IsNTService: boolean;

var
  NTService: TNTService;

implementation

var
   FIsService: boolean;
   FServiceName: string;
   FDisplayName: string;
   FDescription: string;

//------------------------------------------------------------------------------
//---- TNTService -------------------------------------------------------------
//------------------------------------------------------------------------------
procedure ServiceController(CtrlCode: dword); stdcall;
begin
   NTService.Controller(CtrlCode);
end;

//------------------------------------------------------------------------------
function TNTService.GetServiceController: TServiceController;
begin
   result := ServiceController;
end;

//------------------------------------------------------------------------------
procedure TNTService.CreateForm(InstanceClass: TComponentClass; var Reference);
begin
   SvcMgr.Application.CreateForm(InstanceClass, Reference);
end;

//------------------------------------------------------------------------------
procedure TNTService.Run;
begin
   SvcMgr.Application.Run;
end;

//------------------------------------------------------------------------------
constructor TNTService.CreateNew(AOwner: TComponent; Dummy: integer);
begin
   inherited;
   AllowPause    := False;
   Interactive   := True;
   DisplayName   := FDisplayName;
   Name          := FServiceName;
   OnStart       := Start;
   OnStop        := Stop;
   AfterInstall  := ServiceAfterInstall;
end;

//------------------------------------------------------------------------------
procedure TNTService.Start(Sender: TService; var Started: boolean);
begin
   Started := True;
end;

//------------------------------------------------------------------------------
procedure TNTService.Execute(Sender: TService);
begin
   while not Terminated do ServiceThread.ProcessRequests(True);
end;

//------------------------------------------------------------------------------
procedure TNTService.Stop(Sender: TService; var Stopped: boolean);
begin
   Stopped := True;
end;

//------------------------------------------------------------------------------
procedure TNTService.ServiceAfterInstall(Sender: TService);
// Registers the service's description
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('System\CurrentControlSet\Services\' + Name, True) then
    begin
      Reg.WriteString('Description', FDescription);
    end
  finally
    FreeAndNil(Reg);
  end;
end;
//------------------------------------------------------------------------------
//---- Various -----------------------------------------------------------------
//------------------------------------------------------------------------------
function IsNTService: boolean;
begin
   Result := FIsService;
end;

//------------------------------------------------------------------------------
function StartNTService(DisplayName, Description: string): Boolean;
var
   Mgr, Svc: Integer;
   UserName, ServiceStartName: string;
   Config: Pointer;
   Size: DWord;
   n: integer;
begin
   FDisplayName := DisplayName;
   FServiceName := DisplayName;
   FDescription := Description;

   for n := 1 to Length(FServiceName) do
      if FServiceName[n] = ' ' then
         FServiceName[n] := '_';

   FIsService := FindCmdLineSwitch('install',   ['-','\','/'], True) or
                 FindCmdLineSwitch('uninstall', ['-','\','/'], True);

   if FIsService then begin
      SvcMgr.Application.Initialize;
      NTService := TNTService.CreateNew(SvcMgr.Application, 0);
      Result := True;
      Exit;
   end;

   Mgr := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
   if Mgr <> 0 then begin
      Svc := OpenService(Mgr, PChar(FServiceName), SERVICE_ALL_ACCESS);
      FIsService := Svc <> 0;
      if FIsService then begin
         QueryServiceConfig (Svc, nil, 0, Size);
         Config := AllocMem(Size);
         try
            QueryServiceConfig(Svc, Config, Size, Size);
            ServiceStartName := PQueryServiceConfig(Config)^.lpServiceStartName;
            if CompareText(ServiceStartName, 'LocalSystem') = 0 then
               ServiceStartName := 'SYSTEM';
         finally
            Dispose(Config);
         end;
         CloseServiceHandle(Svc);
      end;
      CloseServiceHandle(Mgr);
   end;

   if FIsService then begin
      Size := 256;
      SetLength(UserName, Size);
      GetUserName(PChar(UserName), Size);
      SetLength(UserName, StrLen(PChar(UserName)));
      FIsService := CompareText(UserName, ServiceStartName) = 0;
   end;

   Result := FIsService;

   if FIsService then begin
      SvcMgr.Application.Initialize;
      NTService := TNTService.CreateNew(SvcMgr.Application, 0);
   end;
end;

end.

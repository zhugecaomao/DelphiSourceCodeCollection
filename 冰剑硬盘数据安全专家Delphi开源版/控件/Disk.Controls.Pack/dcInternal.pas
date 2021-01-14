{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcInternal.pas - Base ancestor class, TumdcComponent

  Copyright (c) 1999-2002 UtilMind Solutions
  All rights reserved.
  E-Mail: info@appcontrols.com, info@utilmind.com
  WWW: http://www.appcontrols.com, http://www.utilmind.com

  The entire contents of this file is protected by International Copyright
Laws. Unauthorized reproduction, reverse-engineering, and distribution of all
or any portion of the code contained in this file is strictly prohibited and
may result in severe civil and criminal penalties and will be prosecuted to
the maximum extent possible under the law.

*******************************************************************************}
{$I umDefines.inc}

unit dcInternal;

interface

uses
  Classes, Graphics, Registry
  {$IFDEF USEINIFILES},IniFiles{$ENDIF};

type
  TdcFileSize = {$IFNDEF D4}Extended{$ELSE}Int64{$ENDIF};

  TdcScanAttribute = (saNormal, saArchive, saReadOnly, saHidden, saSystem, saDirectory, saAny);
  TdcScanAttributes = set of TdcScanAttribute;

  { TdcRegistrySaver }
  TdcRegSaverOptions = set of (saveOnClose, saveOnMoveResize);
  TdcRegLocation = (rCurrentUser, rLocalMachine);
  {$IFDEF USEINIFILES}
  TdcStorageType = (useRegistry, useIniFile);
  {$ENDIF}
  TdcRegistrySaver = class(TPersistent)
  private
    FEnabled: Boolean;
    {$IFDEF USEINIFILES}
    FIniFileName, FIniSection: String;
    {$ENDIF}
    FOptions: TdcRegSaverOptions;
    FRegKey: String;
    FRegLocation: TdcRegLocation;
    {$IFDEF USEINIFILES}
    FStorage: TdcStorageType;
    {$ENDIF}

    { for internal use }
    FOwner: TComponent;

    function  IsStoreRegKey: Boolean;
    procedure SetRegKey(const Value: String);
  protected
    procedure DoSaveToRegistry(Reg: TRegistry); virtual; abstract;
    procedure DoLoadFromRegistry(Reg: TRegistry); virtual; abstract;

    {$IFDEF USEINIFILES}
    procedure DoSaveToIniFile(Ini: TIniFile); virtual; abstract;
    procedure DoLoadFromIniFile(Ini: TIniFile); virtual; abstract;
    {$ENDIF}
  public
    constructor Create(aOwner: TComponent); virtual;

    procedure Save; virtual;
    procedure Load; virtual;

    property Owner: TComponent read FOwner;
  published
    property Enabled: Boolean read FEnabled write FEnabled default False;
    {$IFDEF USEINIFILES}
    property IniFileName: String read FIniFileName write FIniFileName;
    property IniSection: String read FIniSection write FIniSection;
    {$ENDIF}
    property Options: TdcRegSaverOptions read FOptions write FOptions default [saveOnClose];
    property RegKey: String read FRegKey write SetRegKey stored IsStoreRegKey;
    property RegLocation: TdcRegLocation read FRegLocation write FRegLocation default rCurrentUser;
    {$IFDEF USEINIFILES}
    property Storage: TdcStorageType read FStorage write FStorage default useRegistry;
    {$ENDIF}
  end;

  { TdcUniqueList (the TList descendant which can contain only unique pointers (Items) }
  TdcUniqueList = class(TList)
  public
    function Add(Item: Pointer): Integer;
    procedure Insert(Index: Integer; Item: Pointer);
  end;

  { TdcObjectList (the list which:
     1. Can contain only unique items (this because it's successor of TdcUniqueList)
     2. Operate only with Objects instead of Pointers
     3. Owns objects and destroy then on removing
     4. Have protected "IsCanAddItem" function which can be overriden to check whether item can or cannot be added for some reason }
  TdcObjectListItemEvent = procedure(Sender: TObject; Item: TObject) of object;
  TdcObjectList = class(TdcUniqueList)
  private
    FOwnsObjects: Boolean;
{$IFDEF D5}
    FOnAdded,
    FOnDeleted: TdcObjectListItemEvent;
    FOnChanged: TNotifyEvent;
{$ENDIF}
  protected
{$IFDEF D4}
    FOwner: TObject;
{$ENDIF}

    function IsCanAddItem(Item: TObject): Boolean; virtual;
{$IFDEF D5}
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
    procedure DoAdded(Item: TObject); virtual;
    procedure DoDeleted(Item: TObject); virtual;
    procedure DoChanged; virtual;
{$ENDIF}
{$IFDEF D4}
    procedure Initialize; virtual;
    procedure LoadItemFromStream(Stream: TStream); virtual;
    procedure SaveItemToStream(Index: Integer; Stream: TStream); virtual;
{$ENDIF}
  public
    constructor Create; {$IFDEF D4} overload;
    constructor Create(AOwnsObjects: Boolean; AOwner: TObject = nil); overload;
    constructor Create(AStream: TStream; AOwnsObjects: Boolean = True; AOwner: TObject = nil); overload; {$ENDIF}
{$IFNDEF D5}
    destructor Destroy; override;
    procedure Clear; {$IFDEF D4} override; {$ENDIF}
{$ENDIF}
    function Add(Item: TObject): Integer;
    function Remove(Item: TObject {$IFDEF D4}; ReleaseInstance: Boolean = True {$ENDIF}): Integer;
    procedure Delete(Index: Integer {$IFDEF D4}; ReleaseInstance: Boolean = True {$ENDIF});
    function IndexOf(Item: TObject): Integer;
    procedure Insert(Index: Integer; Item: TObject);
    function FindInstanceOf(AClass: TClass; AExact: Boolean {$IFDEF D4} = True {$ENDIF}; AStartAt: Integer {$IFDEF D4} = 0 {$ENDIF}): Integer;

{$IFDEF D4}
    procedure LoadFromStream(Stream: TStream; Reset: Boolean = True); virtual;
    procedure SaveToStream(Stream: TStream); virtual;

    property Owner: TObject read FOwner;    
{$ENDIF}

    property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects default True;
{$IFDEF D5}
    property OnAdded: TdcObjectListItemEvent read FOnAdded write FOnAdded;
    property OnDeleted: TdcObjectListItemEvent read FOnDeleted write FOnDeleted;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
{$ENDIF}
  end;

{$IFDEF D4}
  { TdcListObject }
  TdcListObject = class(TPersistent)
  private
    FOwner: TdcObjectList;
  protected
    procedure Initialize(AObject: TObject); virtual;
  public
    Data: Pointer;

    constructor Create(aOwner: TdcObjectList; Stream: TStream = nil; AObject: TObject = nil); virtual;

    procedure LoadFromStream(Stream: TStream; AObject: TObject = nil); virtual;
    procedure SaveToStream(Stream: TStream); virtual;

    property Owner: TdcObjectList read FOwner;
  end;
{$ENDIF}  

// Base DiskControls class
  TumdcComponent = class(TComponent)
  private
    FAbout: String;
  public
    {$IFDEF TRIAL}
    constructor Create(aOwner: TComponent); override;
    {$ENDIF}

    property About: String read FAbout write FAbout stored False;
  end;

implementation

uses Windows, Forms, SysUtils {$IFNDEF D5},dcUtils{$ENDIF};

const
  DEF_REGKEY   = '\Software\CompanyName\ProgramName\Default';
{$IFDEF USEINIFILES}
  ERROR_NO_INI = '.INI file not specified';
{$ENDIF}

{$IFDEF TRIAL}
var
  NotifyDone: Boolean = False;
{$ENDIF}

{ TdcRegistrySaver }
constructor TdcRegistrySaver.Create(aOwner: TComponent);
begin
  inherited Create;
  FOwner := aOwner;

  FOptions := [saveOnClose];
  FRegKey := DEF_REGKEY;
end;

procedure TdcRegistrySaver.Save;
var
  Reg: TRegistry;
{$IFDEF USEINIFILES}
  Ini: TIniFile;
{$ENDIF}
begin
  if not FEnabled or (csDesigning in Owner.ComponentState) then Exit;

{$IFDEF USEINIFILES}
  if Storage = useRegistry then
   begin
{$ENDIF}
    Reg := TRegistry.Create;
    with Reg do
     try
       try
         if FRegLocation = rCurrentUser then
           RootKey := HKEY_CURRENT_USER
         else
           RootKey := HKEY_LOCAL_MACHINE;
         if OpenKey(FRegKey, True) then
           DoSaveToRegistry(Reg);
       except
       end;
     finally
       Free;
     end;
{$IFDEF USEINIFILES}     
   end
  else
   begin
    if FIniFileName = '' then
      raise Exception.Create(ERROR_NO_INI);

    Ini := TIniFile.Create(FIniFileName);
    try
      try
        DoSaveToIniFile(Ini);
      except
      end;
    finally
      Ini.Free;
    end;
   end;
{$ENDIF}   
end;

procedure TdcRegistrySaver.Load;
var
  Reg: TRegistry;
{$IFDEF USEINIFILES}
  Ini: TIniFile;
{$ENDIF}
begin
  if not FEnabled or (csDesigning in Owner.ComponentState) then Exit;

{$IFDEF USEINIFILES}
  if Storage = useRegistry then
   begin
{$ENDIF}
    Reg := TRegistry.Create;
    with Reg do
     try
       try
         if FRegLocation = rCurrentUser then
           RootKey := HKEY_CURRENT_USER
         else
           RootKey := HKEY_LOCAL_MACHINE;
         if OpenKey(FRegKey, False) then
           DoLoadFromRegistry(Reg);
       except
       end;
     finally
       Free;
     end;
{$IFDEF USEINIFILES}     
   end
  else
   begin
    if FIniFileName = '' then
      raise Exception.Create(ERROR_NO_INI);

    Ini := TIniFile.Create(FIniFileName);
    try
      try
        DoLoadFromIniFile(Ini);
      except
      end;
    finally
      Ini.Free;
    end;
   end;
{$ENDIF}   
end;

function  TdcRegistrySaver.IsStoreRegKey: Boolean;
begin
  Result := DEF_REGKEY <> FRegKey;
end;

procedure TdcRegistrySaver.SetRegKey(const Value: String);
begin
  FRegKey := ExcludeTrailingBackslash(Value);
end;


{ TdcUniqueList (the TList descendant which can contain only unique pointers (Items) }
function TdcUniqueList.Add(Item: Pointer): Integer;
begin
  if (Item <> nil) and (IndexOf(Item) = -1) then
    Result := inherited Add(Item)
  else
    Result := -1;
end;

procedure TdcUniqueList.Insert(Index: Integer; Item: Pointer);
begin
  if (Item <> nil) and (IndexOf(Item) = -1) then
    inherited Insert(Index, Item)
end;


{ TdcObjectList }
constructor TdcObjectList.Create;
begin
  inherited Create;
  FOwnsObjects := True;
end;

{$IFDEF D4}
constructor TdcObjectList.Create(AOwnsObjects: Boolean; AOwner: TObject = nil);
begin
  inherited Create;
  FOwnsObjects := AOwnsObjects;
  FOwner := AOwner;
end;

constructor TdcObjectList.Create(AStream: TStream; AOwnsObjects: Boolean = True; AOwner: TObject = nil);
begin
  inherited Create;
  if AStream <> nil then
    LoadFromStream(AStream);
  FOwnsObjects := AOwnsObjects;
  FOwner := AOwner;
end;

procedure TdcObjectList.Initialize;
begin
  // abstract
end;
{$ENDIF}

{$IFNDEF D5}
destructor TdcObjectList.Destroy;
begin
  if FOwnsObjects then
    Clear;
end;

procedure TdcObjectList.Clear;
var
  I: Integer;
begin
  if FOwnsObjects and (Count <> 0) then
   for I := Count - 1 downto 0 do
    if Items[I] <> nil then
     TObject(Items[I]).Free;

{$IFDEF D4}
  inherited;
{$ELSE}
  SetCount(0);
  SetCapacity(0);
{$ENDIF}
end;
{$ENDIF}

function TdcObjectList.Add(Item: TObject): Integer;
begin
  if IsCanAddItem(Item) then
    Result := inherited Add(Item)
  else
   begin
    Result := -1;
    if (Item <> nil) and FOwnsObjects then
      Item.Free;
   end; 
end;

function TdcObjectList.Remove(Item: TObject {$IFDEF D4}; ReleaseInstance: Boolean = True {$ENDIF}): Integer;
begin
  Result := IndexOf(Item);
  if Result >= 0 then
    Delete(Result {$IFDEF D4}, ReleaseInstance {$ENDIF});
end;

procedure TdcObjectList.Delete(Index: Integer {$IFDEF D4}; ReleaseInstance: Boolean = True {$ENDIF});
var
{$IFDEF D5}
  OldOwnsObjects: Boolean;
{$ELSE}
  Temp: Pointer;
{$ENDIF}
begin
{$IFDEF D5}
  OldOwnsObjects := FOwnsObjects;
  FOwnsObjects := ReleaseInstance;
{$ELSE}
  Temp := Items[Index];
{$ENDIF}

  inherited Delete(Index);

{$IFDEF D5}
  FOwnsObjects := OldOwnsObjects;
{$ELSE}
  if {$IFDEF D4}ReleaseInstance and {$ENDIF}(Temp <> nil) then
    TObject(Temp).Free;
{$ENDIF}
end;

function TdcObjectList.IndexOf(Item: TObject): Integer;
begin
  Result := inherited IndexOf(Item);
end;

procedure TdcObjectList.Insert(Index: Integer; Item: TObject);
begin
  if IsCanAddItem(Item) then
    inherited Insert(Index, Item)
  else
    if (Item <> nil) and FOwnsObjects then
      Item.Free;
end;

function TdcObjectList.FindInstanceOf(AClass: TClass; AExact: Boolean {$IFDEF D4} = True {$ENDIF}; AStartAt: Integer {$IFDEF D4} = 0 {$ENDIF}): Integer;
begin
  for Result := AStartAt to Count - 1 do
   if (AExact and (TObject(Items[Result]).ClassType = AClass)) or
      (not AExact and TObject(Items[Result]).InheritsFrom(AClass)) then
     Exit;
  Result := -1;
end;

{$IFDEF D4}
procedure TdcObjectList.LoadItemFromStream(Stream: TStream);
begin
  // abstract
end;

procedure TdcObjectList.SaveItemToStream(Index: Integer; Stream: TStream);
begin
  if TObject(Items[Index]) is TdcListObject then
    TdcListObject(Items[Index]).SaveToStream(Stream);
end;

procedure TdcObjectList.LoadFromStream(Stream: TStream; Reset: Boolean {$IFDEF D4} = True {$ENDIF});
var
  I: Integer;
begin
  if Reset then Clear; // clear before load new values

  Stream.Read(I, SizeOf(I));
  if I <> 0 then
   for I := 0 to I - 1 do
     LoadItemFromStream(Stream);
end;

procedure TdcObjectList.SaveToStream(Stream: TStream);
var
  I: Integer;
begin
  Stream.Write(Count, SizeOf(Count));
  if Count <> 0 then
   for I := 0 to Count - 1 do
     SaveItemToStream(I, Stream);
end;
{$ENDIF}

{$IFDEF D5}
procedure TdcObjectList.Notify(Ptr: Pointer; Action: TListNotification);
begin
  case Action of
    lnAdded: DoAdded(Ptr);
    lnExtracted: DoDeleted(Ptr);
    lnDeleted: begin
                DoDeleted(Ptr);
                if FOwnsObjects then
                  TObject(Ptr).Free;
               end;
   end;

  inherited Notify(Ptr, Action);
  DoChanged;
end;

procedure TdcObjectList.DoAdded(Item: TObject);
begin
  if not (csDestroying in Application.ComponentState) and Assigned(FOnAdded) then
    FOnAdded(Self, Item);
end;

procedure TdcObjectList.DoDeleted(Item: TObject);
begin
  if not (csDestroying in Application.ComponentState) and Assigned(FOnDeleted) then
    FOnDeleted(Self, Item);
end;

procedure TdcObjectList.DoChanged;
begin
  if not (csDestroying in Application.ComponentState) and Assigned(FOnChanged) then
    FOnChanged(Self);
end;
{$ENDIF}

function TdcObjectList.IsCanAddItem(Item: TObject): Boolean;
begin
  Result := True;
end;


{$IFDEF D4}
{ TdcListObject }
constructor TdcListObject.Create(aOwner: TdcObjectList; Stream: TStream = nil; AObject: TObject = nil);
begin
  inherited Create;
  FOwner := aOwner;

  Initialize(AObject);

  if Stream <> nil then
    LoadFromStream(Stream, AObject);
end;

procedure TdcListObject.Initialize(AObject: TObject);
begin
  // abstract
end;

procedure TdcListObject.LoadFromStream(Stream: TStream; AObject: TObject = nil);
begin
  // abstract
end;

procedure TdcListObject.SaveToStream(Stream: TStream);
begin
  // abstract
end;
{$ENDIF}



{$IFDEF TRIAL}
constructor TumdcComponent.Create(aOwner: TComponent);
begin
  inherited;

  if not NotifyDone and not (csDesigning in ComponentState) then
   begin
    NotifyDone := True;
    Application.MessageBox('This program built with DiskControls'#13#10 +
                           '(c) by UtilMind Solutions 1999-2002'#13#10#10 +
                           'To register DiskControls pack -'#13#10 +
                           'follow instructions in "readme.txt" file.', 'UNREGISTERED', mb_Ok or mb_IconInformation or mb_SystemModal);
   end;
end;
{$ENDIF}

end.

{*******************************************************************************

  Disk Controls pack v3.5
  FILE: _DCReg.pas - use this unit to register classes / components / property
        editors to the Delphi/BCB IDE 

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

unit _DCReg;

interface

procedure Register;

implementation

uses Windows, Classes, Controls, Forms, Dialogs, SysUtils,
     {$IFDEF D5} Menus, {$ENDIF}
     FiltEdit,
{$IFDEF D6}
     DesignIntf, DesignEditors, DesignMenus,
{$ELSE}
     DsgnIntf,
{$ENDIF}     
     dcInternal, dcAbout,
     dcDiskScanner, dcFileOperations, dcFolderMonitor,
     dcVirtualDrives, dcDiskInfo, dcFileInfo, dcFileCRC,
     dcFileAssociation, dcVersionInfo,
     {$IFDEF D3} dcShellIcon, dcShellLink, dcShellProperties,
     dcExtDialogs, dcBrowseDialog, {$ENDIF}
     dcEdits, dcFileTail, dcFolderView,
     dcStdDialogs,
     dcSystemImageList, dcIcon2Bitmap

     {$IFDEF D3}, dcDiskScannerEditor, dcVirtualDrivesEditor {$ENDIF};

const
  dcVersion = 'v3.8';
  dcOpenDialogRegKey = '\Software\UtilMind Solutions\DiskControls\';

type
{$IFDEF D5}
  {$IFNDEF D6}
  IMenuItem = TMenuItem;
  IProperty = TPropertyEditor;
  {$ENDIF}
{$ENDIF}

{$IFNDEF D5}
  TComponents = TComponentList;
  IComponents = TComponentList;
{$ELSE}
 {$IFNDEF D6}
  TComponents = TDesignerSelectionList;
  IComponents = TDesignerSelectionList;
 {$ELSE}
  TComponents = TDesignerSelections;
  IComponents = IDesignerSelections;
 {$ENDIF}
{$ENDIF}

{*******************************************************************************
  About property editor for all Disk Controls, implements About dialog.
*******************************************************************************}
 { TdcAboutProperty }
  TdcAboutProperty = class(TStringProperty)
    procedure Edit; override;
    function  GetAttributes: TPropertyAttributes; override;
    function  GetValue: String; override;
  end;

{*******************************************************************************
  Default component editor for all Disk Controls, implements About dialog.
*******************************************************************************}
  { TdcComponentEditor }
  TdcComponentEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function  GetVerbCount: Integer; override;
    function  GetVerb(Index: Integer): string; override;
    {$IFDEF D5}
    procedure PrepareItem(Index: Integer; const AItem: IMenuItem); override;
    {$ENDIF}
  end;

{$IFDEF D3}
  TdcVirtualDrivesCompEditor = class(TdcComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function  GetVerbCount: Integer; override;
    function  GetVerb(Index: Integer): string; override;
    {$IFDEF D5}
    procedure PrepareItem(Index: Integer; const AItem: IMenuItem); override;
    {$ENDIF}
  end;
{$ENDIF}  

{*******************************************************************************
  FileName property editor
*******************************************************************************}
  TdcFileNameProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

{*******************************************************************************
  LinkFileName property editor
*******************************************************************************}
  TdcLinkFileNameProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;


{$IFDEF D3}
{*******************************************************************************
  Folder property editor
*******************************************************************************}
  TdcFolderProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;
{$ENDIF}


{*******************************************************************************
  dcFileInfo component editor - implements file open dialog on doubleclick
*******************************************************************************}
  TdcFileInfoCompEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): string; override;
    {$IFDEF D5}
    procedure PrepareItem(Index: Integer; const AItem: IMenuItem); override;
    {$ENDIF}
  end;

{$IFDEF D3}
{*******************************************************************************
  dcShellIcon component editor - implements file open dialog on doubleclick
*******************************************************************************}
  TdcShellIconCompEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): string; override;
    {$IFDEF D5}
    procedure PrepareItem(Index: Integer; const AItem: IMenuItem); override;
    {$ENDIF}
  end;

{*******************************************************************************
  dcShellLink component editor - implements file open dialog on doubleclick
*******************************************************************************}
  TdcShellLinkCompEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): string; override;
    {$IFDEF D5}
    procedure PrepareItem(Index: Integer; const AItem: IMenuItem); override;
    {$ENDIF}
  end;

{*******************************************************************************
  dcShellItem component editor - some testing features
*******************************************************************************}
  TdcShellItemCompEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): string; override;
    {$IFDEF D5}
    procedure PrepareItem(Index: Integer; const AItem: IMenuItem); override;
    {$ENDIF}
  end;

{*******************************************************************************
  dcDiskScannerIncludeList component editor
*******************************************************************************}
  TdcDiskScannerIncludeListProperty = class(TPropertyEditor)
  public
    procedure Edit; override;
    function GetValue: String; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

{*******************************************************************************
  dcDiskScannerExcludeList component editor
*******************************************************************************}
  TdcDiskScannerExcludeListProperty = class(TPropertyEditor)
  public
    procedure Edit; override;
    function GetValue: String; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

{*******************************************************************************
  dcDiskScannerFiles component editor
*******************************************************************************}
  TdcDiskScannerFilesCompEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): string; override;
    {$IFDEF D5}
    procedure PrepareItem(Index: Integer; const AItem: IMenuItem); override;
    {$ENDIF}
  end;
{$ENDIF}  

{==============================================================================}

{ TacAboutProperty }
procedure TdcAboutProperty.Edit;
begin
  dcShowAbout(TComponent(GetComponent(0)).ClassName);
end;

function TdcAboutProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paReadOnly, paDialog];
end;

function TdcAboutProperty.GetValue: String;
begin
  Result := dcVersion;
end;


{ TdcComponentEditor}
procedure TdcComponentEditor.ExecuteVerb(Index: Integer);
begin
  if Index = GetVerbCount - 1 then
    dcShowAbout(Component.ClassName)
  else inherited ExecuteVerb(Index);
end;

function TdcComponentEditor.GetVerb(Index: Integer): string;
begin
  if Index = GetVerbCount - 1 then Result := 'About...'
  else Result := inherited GetVerb(Index);
end;

function TdcComponentEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 1;
end;

{$IFDEF D5}
procedure TdcComponentEditor.PrepareItem(Index: Integer; const AItem: IMenuItem);
begin
  {$IFNDEF D6}
  if (Index = GetVerbCount - 1) then
    AItem.Bitmap.LoadFromResourceName(hInstance, 'DCABOUT')
  else
  {$ENDIF}
    inherited PrepareItem(Index, AItem)
end;
{$ENDIF}


{$IFDEF D3}
// TdcVirtualDrives Component Editor
procedure TdcVirtualDrivesCompEditor.ExecuteVerb(Index: Integer);
var
  tmpDrive: Char;
  DrivesEditor: TVirtualDrivesEditor;
  VDrives: TdcVirtualDrives;
begin
  VDrives := TdcVirtualDrives(Component);
  if (Index = GetVerbCount - 4) or (Index = GetVerbCount - 3) then
   begin
    DrivesEditor := TVirtualDrivesEditor.Create(Application);
    with DrivesEditor, VDrives do
     try
       IsAddDrive := Index = GetVerbCount - 4;
       if ShowModal = ID_OK then
        begin
         tmpDrive := Char(DriveBox.Items[DriveBox.ItemIndex][1]);
         if IsAddDrive then
           AddDrive(tmpDrive, TargetEdit.Text)
         else
           DeleteDrive(tmpDrive);
         Self.Designer.Modified;
        end;
     finally
       DrivesEditor.Free;
     end;
   end
  else inherited ExecuteVerb(Index);
end;

function  TdcVirtualDrivesCompEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 3;
end;

function  TdcVirtualDrivesCompEditor.GetVerb(Index: Integer): String;
begin
  if Index = GetVerbCount - 4 then Result := 'Add virtual drive...'
  else
    if Index = GetVerbCount - 3 then Result := 'Remove virtual drive...'
    else
      if Index = GetVerbCount - 2 then Result := '-'
      else Result := inherited GetVerb(Index);
end;

{$IFDEF D5}
procedure TdcVirtualDrivesCompEditor.PrepareItem(Index: Integer; const AItem: IMenuItem);
begin
  {$IFNDEF D6}
  if (Index = GetVerbCount - 4) then
    AItem.Bitmap.LoadFromResourceName(hInstance, 'DCADDDRIVE')
  else
   if (Index = GetVerbCount - 3) then
     AItem.Bitmap.LoadFromResourceName(hInstance, 'DCDELETEDRIVE')
   else
  {$ENDIF}
     inherited PrepareItem(Index, AItem)
end;
{$ENDIF}
{$ENDIF}


// TdcFileName property
procedure TdcFileNameProperty.Edit;
var
  Dialog: TdcOpenDialog;
begin
  Dialog := TdcOpenDialog.Create(Application);
  with Dialog do
  try
    InitialDirSaver.RegKey := dcOpenDialogRegKey + TComponent(GetComponent(0)).Name;
    FileName   := GetValue;
    Filter     := 'All files (*.*)|*.*';
    Options    := Options + [ofHideReadOnly, ofNoDereferenceLinks];
    if Execute then SetValue(FileName);
  finally
    Free;
  end;
end;

function TdcFileNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paRevertable];
end;


// TdcLinkFileName property
procedure TdcLinkFileNameProperty.Edit;
var
  Dialog: TdcOpenDialog;
begin
  Dialog := TdcOpenDialog.Create(Application);
  with Dialog do
  try
    InitialDirSaver.RegKey := dcOpenDialogRegKey + TComponent(GetComponent(0)).Name;  
    FileName   := GetValue;
    Filter     := 'Shortcut files (*.lnk)|*.lnk|All files (*.*)|*.*';
    Options    := Options + [ofHideReadOnly, ofNoDereferenceLinks];
    if Execute then SetValue(FileName);
  finally
    Free;
  end;
end;

function TdcLinkFileNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paRevertable];
end;


{$IFDEF D3}
// TdcFolderProperty
procedure TdcFolderProperty.Edit;
const
  Tip0: String = 'Design-Time Tip: ';
  Tip1: String = 'Please specify the Drive property first.';
var
  BrowseDialog: TdcBrowseDialog;
  Component: TPersistent;
begin
  Component := GetComponent(0);
  BrowseDialog := TdcBrowseDialog.Create(Application);
  with BrowseDialog do
  try
    Folder := GetValue;

    if Component is TdcBrowseDialog then
     begin
      BrowseFor := TdcBrowseDialog(Component).BrowseFor;
      Options := TdcBrowseDialog(Component).Options;
      Position := TdcBrowseDialog(Component).Position;
      SpecialLocation := TdcBrowseDialog(Component).SpecialLocation;
      StatusText := TdcBrowseDialog(Component).StatusText;
      Title := TdcBrowseDialog(Component).Title;
      NewFolder.Caption := TdcBrowseDialog(Component).NewFolder.Caption;
      NewFolder.Prompt := TdcBrowseDialog(Component).NewFolder.Prompt;
      NewFolder.Visible := TdcBrowseDialog(Component).NewFolder.Visible;
     end
    else
     if Component is TdcVirtualDrives then
      with Component as TdcVirtualDrives do
       if Drive = '.' then
        begin
         if Length(VirtualDrives) = 0 then
          Application.MessageBox(PChar(Tip1 + #13#10#10 +
                                 'However, if the VirtualDrives list is empty,'#13#10 +
                                 'you have to add new virtual drive before'#13#10 +
                                 'specifying the Drive letter.'#13#10#10 +
                                 'Right-click the component to Add new drive.'),
                                 PChar(Tip0 + TComponent(Component).Name), MB_OK + MB_ICONSTOP)
         else
          Application.MessageBox(PChar(Tip1), PChar(Tip0 + TComponent(Component).Name), MB_OK + MB_ICONSTOP);
        Exit;
       end;

    if Execute then SetValue(Folder);
  finally
    Free;
  end;
end;

function TdcFolderProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paRevertable];
end;
{$ENDIF}


// dcFileInfo Component Editor
procedure TdcFileInfoCompEditor.ExecuteVerb(Index: Integer);
var
  Dialog: TdcOpenDialog;
begin
  if Index = 0 then
   begin
    Dialog := TdcOpenDialog.Create(Application);
    with Dialog do
    try
      InitialDirSaver.RegKey := dcOpenDialogRegKey + TComponent(Component).Name;
      if Component.ClassName = 'TdcFileInfo' then
        FileName := TdcFileInfo(Component).FileName
      else
       if Component.ClassName = 'TdcVersionInfo' then
         FileName := TdcVersionInfo(Component).FileName;
      Filter     := 'All files (*.*)|*.*';
      Options    := Options + [ofHideReadOnly, ofNoDereferenceLinks];
      if Execute then
       begin
        if Component.ClassName = 'TdcFileInfo' then
          TdcFileInfo(Component).FileName := FileName
        else
         if Component.ClassName = 'TdcVersionInfo' then
           TdcVersionInfo(Component).FileName := FileName;
        Designer.Modified;
       end;
    finally
      Free;
    end;
   end
  else
   if Index = 1 then
    dcShowAbout(Component.ClassName);
end;

function TdcFileInfoCompEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 2;
end;

function TdcFileInfoCompEditor.GetVerb(Index: Integer): String;
begin
  if Index = 0 then
    Result := '&Select File...'
  else
    if Index = 1 then
      Result := '&About...';  
end;

{$IFDEF D5}
procedure TdcFileInfoCompEditor.PrepareItem(Index: Integer; const AItem: IMenuItem);
begin
  {$IFNDEF D6}
  if (Index = GetVerbCount - 2) then
    AItem.Bitmap.LoadFromResourceName(hInstance, 'DCLOAD')
  else
   if (Index = GetVerbCount - 1) then
     AItem.Bitmap.LoadFromResourceName(hInstance, 'DCABOUT')
   else
  {$ENDIF} 
     inherited PrepareItem(Index, AItem)
end;
{$ENDIF}


{$IFDEF D3}
// dcShellIcon Component Editor
procedure TdcShellIconCompEditor.ExecuteVerb(Index: Integer);
var
  Dialog: TdcOpenDialog;
begin
  if Index = 0 then
   begin
    Dialog := TdcOpenDialog.Create(Application);
    with Dialog do
    try
      InitialDirSaver.RegKey := dcOpenDialogRegKey + TComponent(Component).Name;    
      FileName   := TdcShellIcon(Component).FileName;
      Filter     := 'All files (*.*)|*.*';
      Options    := Options + [ofHideReadOnly, ofNoDereferenceLinks];
      if Execute then
       begin
        TdcShellIcon(Component).FileName := FileName;
        Designer.Modified;
       end;
    finally
      Free;
    end;
   end
  else
   if Index = 1 then
    dcShowAbout(Component.ClassName);
end;

function TdcShellIconCompEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 2;
end;

function TdcShellIconCompEditor.GetVerb(Index: Integer): String;
begin
  if Index = 0 then
    Result := '&Select File...'
  else
    if Index = 1 then
      Result := '&About...';  
end;

{$IFDEF D5}
procedure TdcShellIconCompEditor.PrepareItem(Index: Integer; const AItem: IMenuItem);
begin
  {$IFNDEF D6}
  if (Index = GetVerbCount - 2) then
    AItem.Bitmap.LoadFromResourceName(hInstance, 'DCLOAD')
  else
   if (Index = GetVerbCount - 1) then
     AItem.Bitmap.LoadFromResourceName(hInstance, 'DCABOUT')
   else
  {$ENDIF}
     inherited PrepareItem(Index, AItem)
end;
{$ENDIF}


// dcShellLink Component Editor
procedure TdcShellLinkCompEditor.ExecuteVerb(Index: Integer);
var
  Dialog: TdcOpenDialog;
begin
  if Index = 0 then
   begin
    Dialog := TdcOpenDialog.Create(Application);
    with Dialog do
    try
      InitialDirSaver.RegKey := dcOpenDialogRegKey + TComponent(Component).Name;    
      FileName   := TdcShellLink(Component).FileName;
      Filter     := 'Shortcut files (*.lnk)|*.lnk|All files (*.*)|*.*';
      Options    := Options + [ofHideReadOnly, ofNoDereferenceLinks];
      if Execute then
       begin
        TdcShellLink(Component).FileName := FileName;
        Designer.Modified;
       end;
    finally
      Free;
    end;
   end
  else
   if Index = 1 then
    dcShowAbout(Component.ClassName);
end;

function TdcShellLinkCompEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 2;
end;

function TdcShellLinkCompEditor.GetVerb(Index: Integer): String;
begin
  if Index = 0 then
    Result := '&Select Shell Link...'
  else
    if Index = 1 then
      Result := '&About...';  
end;

{$IFDEF D5}
procedure TdcShellLinkCompEditor.PrepareItem(Index: Integer; const AItem: IMenuItem);
begin
  {$IFNDEF D6}
  if (Index = GetVerbCount - 2) then
    AItem.Bitmap.LoadFromResourceName(hInstance, 'DCLOAD')
  else
   if (Index = GetVerbCount - 1) then
     AItem.Bitmap.LoadFromResourceName(hInstance, 'DCABOUT')
   else
  {$ENDIF} 
     inherited PrepareItem(Index, AItem)
end;
{$ENDIF}


// dcShellItem Component Editor
procedure TdcShellItemCompEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then
    dcShowAbout(Component.ClassName)
  else
   if Index = 2 then
     TdcShellProperties(Component).ShowProperties
   else
    if Index = 3 then
      TdcShellProperties(Component).ShowContextMenu;
end;

function TdcShellItemCompEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 4;
end;

function TdcShellItemCompEditor.GetVerb(Index: Integer): String;
begin
  if Index = 0 then
    Result := '&About...'
  else
   if Index = 1 then
     Result := '-'
   else
    if Index = 2 then
      Result := 'Test Show&Properties...'
    else
     if Index = 3 then
       Result := 'Test Show&ContextMenu >';
end;

{$IFDEF D5}
procedure TdcShellItemCompEditor.PrepareItem(Index: Integer; const AItem: IMenuItem);
begin
  {$IFNDEF D6}
  if (Index = GetVerbCount - 4) then
    AItem.Bitmap.LoadFromResourceName(hInstance, 'DCABOUT')
  else
   if (Index = GetVerbCount - 2) then
     AItem.Bitmap.LoadFromResourceName(hInstance, 'DCLIGHT')
   else
    if (Index = GetVerbCount - 1) then
      AItem.Bitmap.LoadFromResourceName(hInstance, 'DCLIGHT')
    else
  {$ENDIF}
      inherited PrepareItem(Index, AItem)
end;
{$ENDIF}


// MultiDiskScanner editors
{ IncludeList Property Editor }
procedure TdcDiskScannerIncludeListProperty.Edit;
begin
  ShowMultiDiskScannerDesigner(Designer, TdcMultiDiskScanner(GetComponent(0)), False);
end;

function TdcDiskScannerIncludeListProperty.GetValue: String;
var
  i: Integer;
begin
  i := TdcMultiDiskScanner(GetComponent(0)).IncludeList.Count;
  if i = 0 then
   Result := '(None)'
  else
   if i = 1 then
    Result := '(1 include)'
   else
    Result := '(' + IntToStr(i) + ' includes)'
end;

function TdcDiskScannerIncludeListProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;


{ ExcludeList Property Editor }
procedure TdcDiskScannerExcludeListProperty.Edit;
begin
  ShowMultiDiskScannerDesigner(Designer, TdcMultiDiskScanner(GetComponent(0)), True);
end;

function TdcDiskScannerExcludeListProperty.GetValue: String;
var
  I: Integer;
begin
  I := TdcMultiDiskScanner(GetComponent(0)).ExcludeList.Count;
  if I = 0 then
    Result := '(None)'
  else
   if I = 1 then
     Result := '(1 exclude)'
   else
     Result := '(' + IntToStr(I) + ' excludes)'
end;

function TdcDiskScannerExcludeListProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;


{ Component Editor }
procedure TdcDiskScannerFilesCompEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 3 then
    ShowMultiDiskScannerDesigner(Designer, TdcMultiDiskScanner(Component), False)
  else
   if Index = 2 then
     ShowMultiDiskScannerDesigner(Designer, TdcMultiDiskScanner(Component), True)
   else
    if Index = 0 then
      dcShowAbout(Component.ClassName);
end;

function TdcDiskScannerFilesCompEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 4;
end;

function TdcDiskScannerFilesCompEditor.GetVerb(Index: Integer): String;
begin
  if Index = 3 then
    Result := '&IncludeList Designer...'
  else
   if Index = 2 then
     Result := '&ExcludeList Designer...'
   else
    if Index = 1 then
      Result := '-'
    else
     if Index = 0 then
       Result := '&About...';
end;

{$IFDEF D5}
procedure TdcDiskScannerFilesCompEditor.PrepareItem(Index: Integer; const AItem: IMenuItem);
begin
  {$IFNDEF D6}
  if (Index = GetVerbCount - 1) then
    AItem.Bitmap.LoadFromResourceName(hInstance, 'DCTOOL')
  else
   if (Index = GetVerbCount - 2) then
     AItem.Bitmap.LoadFromResourceName(hInstance, 'DCTOOL')
   else
    if (Index = GetVerbCount - 4) then
      AItem.Bitmap.LoadFromResourceName(hInstance, 'DCABOUT')
    else
  {$ENDIF}  
      inherited PrepareItem(Index, AItem)
end;
{$ENDIF}
{$ENDIF}


procedure Register;
begin
  RegisterComponents('Disk Controls', [TdcDiskScanner,
                                       TdcMultiDiskScanner,
                                       TdcFileOperations,
                                       TdcFolderMonitor,
                                       TdcFileAssociation,
                                       TdcVirtualDrives,
                                       TdcDiskInfo,
                                       TdcFileInfo,
                                       TdcFileCRC,
                                       TdcFileTail,
                                       TdcVersionInfo,
{$IFDEF D3}
                                       TdcShellIcon,
                                       TdcShellLink,
                                       TdcShellProperties,
{$ENDIF}
                                       TdcFolderListView,
                                       TdcFileEdit,
{$IFDEF D3}                                       
                                       TdcFolderEdit,
{$ENDIF}                                       
                                       TdcOpenDialog,
                                       TdcSaveDialog,
{$IFDEF D3}
                                       TdcOpenPictureDialog,
                                       TdcSavePictureDialog,
                                       TdcBrowseDialog,                                       
{$ENDIF}
                                       TdcSystemImageList,
                                       TdcIcon2Bitmap]);

  RegisterComponentEditor(TumdcComponent, TdcComponentEditor);
{$IFDEF D3}
  RegisterComponentEditor(TdcMultiDiskScanner, TdcDiskScannerFilesCompEditor);
  RegisterComponentEditor(TdcVirtualDrives, TdcVirtualDrivesCompEditor);
{$ENDIF}  
  RegisterComponentEditor(TdcFileInfo, TdcFileInfoCompEditor);
  RegisterComponentEditor(TdcFileCRC, TdcFileInfoCompEditor);
  RegisterComponentEditor(TdcVersionInfo, TdcFileInfoCompEditor);
{$IFDEF D3}
  RegisterComponentEditor(TdcShellIcon, TdcShellIconCompEditor);
  RegisterComponentEditor(TdcShellLink, TdcShellLinkCompEditor);
  RegisterComponentEditor(TdcShellProperties, TdcShellItemCompEditor);
{$ENDIF}  
  RegisterComponentEditor(TdcFolderListView, TdcComponentEditor);
  RegisterComponentEditor(TdcFileEdit, TdcComponentEditor);
{$IFDEF D3}
  RegisterComponentEditor(TdcFolderEdit, TdcComponentEditor);
{$ENDIF}  
  RegisterComponentEditor(TdcOpenDialog, TdcComponentEditor);
  RegisterComponentEditor(TdcSaveDialog, TdcComponentEditor);
{$IFDEF D3}
  RegisterComponentEditor(TdcOpenPictureDialog, TdcComponentEditor);
  RegisterComponentEditor(TdcSavePictureDialog, TdcComponentEditor);
{$ENDIF}  
  RegisterComponentEditor(TdcSystemImageList, TdcComponentEditor);

  RegisterPropertyEditor(TypeInfo(String), TumdcComponent, 'About', TdcAboutProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcSystemImageList, 'About', TdcAboutProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcFileEdit, 'About', TdcAboutProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcFileEdit, 'DlgFilter', TFilterProperty);
  RegisterPropertyEditor(TypeInfo(TCaption), TdcFileEdit, 'Text', TdcFileNameProperty);
{$IFDEF D3}
  RegisterPropertyEditor(TypeInfo(String), TdcFolderEdit, 'About', TdcAboutProperty);
  RegisterPropertyEditor(TypeInfo(TCaption), TdcFolderEdit, 'Text', TdcFolderProperty);
{$ENDIF}    
  RegisterPropertyEditor(TypeInfo(String), TdcFolderListView, 'About', TdcAboutProperty);
{$IFDEF D3}
  RegisterPropertyEditor(TypeInfo(String), TdcFolderListView, 'Folder', TdcFolderProperty);
{$ENDIF}    
  RegisterPropertyEditor(TypeInfo(String), TdcOpenDialog, 'About', TdcAboutProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcSaveDialog, 'About', TdcAboutProperty);
{$IFDEF D3}
  RegisterPropertyEditor(TypeInfo(String), TdcOpenPictureDialog, 'About', TdcAboutProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcSavePictureDialog, 'About', TdcAboutProperty);
{$ENDIF}  
  RegisterPropertyEditor(TypeInfo(String), TdcFileTail, 'FileName', TdcFileNameProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcFileInfo, 'FileName', TdcFileNameProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcFileCRC, 'FileName', TdcFileNameProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcFileAssociation, 'ExecutableFile', TdcFileNameProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcFileAssociation, 'IconFile', TdcFileNameProperty);    
  RegisterPropertyEditor(TypeInfo(String), TdcVersionInfo, 'FileName', TdcFileNameProperty);
{$IFDEF D3}
  RegisterPropertyEditor(TypeInfo(String), TdcShellIcon, 'FileName', TdcFileNameProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcShellLink, 'FileName', TdcLinkFileNameProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcShellLink, 'LinkTarget', TdcFileNameProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcShellProperties, 'FileName', TdcFileNameProperty);
{$ENDIF}  
  RegisterPropertyEditor(TypeInfo(String), TdcRegistrySaver, 'IniFileName', TdcFileNameProperty);
{$IFDEF D3}
  RegisterPropertyEditor(TypeInfo(String), TdcOpenDialog, 'InitialDir', TdcFolderProperty);
{$ENDIF}  
  RegisterPropertyEditor(TypeInfo(TFileName), TdcOpenDialog, 'FileName', TdcFileNameProperty);
{$IFDEF D3}
  RegisterPropertyEditor(TypeInfo(String), TdcSaveDialog, 'InitialDir', TdcFolderProperty);
{$ENDIF}
  RegisterPropertyEditor(TypeInfo(TFileName), TdcSaveDialog, 'FileName', TdcFileNameProperty);
{$IFDEF D3}
  RegisterPropertyEditor(TypeInfo(String), TdcOpenPictureDialog, 'InitialDir', TdcFolderProperty);
  RegisterPropertyEditor(TypeInfo(TFileName), TdcOpenPictureDialog, 'FileName', TdcFileNameProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcSavePictureDialog, 'InitialDir', TdcFolderProperty);
  RegisterPropertyEditor(TypeInfo(TFileName), TdcSavePictureDialog, 'FileName', TdcFileNameProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcBrowseDialog, 'Folder', TdcFolderProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcDiskScanner, 'Folder', TdcFolderProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcFolderMonitor, 'Folder', TdcFolderProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcVirtualDrives, 'Target', TdcFolderProperty);
  RegisterPropertyEditor(TypeInfo(String), TdcFileOperations, 'DestFolder', TdcFolderProperty);
  RegisterPropertyEditor(TypeInfo(TList), TdcMultiDiskScanner, 'IncludeList', TdcDiskScannerIncludeListProperty);
  RegisterPropertyEditor(TypeInfo(TList), TdcMultiDiskScanner, 'ExcludeList', TdcDiskScannerExcludeListProperty);
{$ENDIF}  
end;

end.

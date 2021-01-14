{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcFolderView.pas - dcFolderListView and dcFolderTreeView components

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

unit dcFolderView;

interface

uses
  Windows, Messages, Classes, Controls, Graphics,
  ComCtrls, CommCtrl, dcInternal, dcComCtrls, dcDiskScanner,
  {$IFDEF D3}dcShellProperties, {$ENDIF} dcFileAssociation, dcFolderMonitor,
  dcFileOperations;

type
  TdcFolderListView = class;

  TdcListColumn = class(TPersistent)
  private
    FAlignment: TAlignment;
    FCaption: String;
    FWidth: TWidth;
    FVisible: Boolean;

    { for internal use }
    IsNameColumn: Boolean;
    FolderListView: TdcFolderListView;
    Column: TListColumn;

    procedure CreateColumn(Columns: TListColumns; Order: Byte);

    function  GetAlignment: TAlignment;
    procedure SetAlignment(Value: TAlignment);
    function  GetCaption: String;
    procedure SetCaption(const Value: String);
    function  GetWidth: TWidth;
    procedure SetWidth(Value: TWidth);
    procedure SetVisible(Value: Boolean);
  protected
  public
    constructor Create(aFolderListView: TdcFolderListView; aIsNameColumn: Boolean);
  published
    property Alignment: TAlignment read GetAlignment write SetAlignment;
    property Caption: String read GetCaption write SetCaption;
    property Width: TWidth read GetWidth write SetWidth;
    property Visible: Boolean read FVisible write SetVisible default True;
  end;

  TdcListColumns = class(TPersistent)
  private
    FName, FSize, FType, FModified, FAttributes: TdcListColumn;
  public
    constructor Create(aFolderListView: TdcFolderListView);
    destructor Destroy; override;
  published
    property Name: TdcListColumn read FName write FName;
    property Size: TdcListColumn read FSize write FSize;
    property FileType: TdcListColumn read FType write FType;
    property Modified: TdcListColumn read FModified write FModified;
    property Attributes: TdcListColumn read FAttributes write FAttributes; 
  end;

  TdcFolderChangedEvent = procedure(Sender: TObject; Folder: String) of object;
  TdcFolderListViewOptions = set of (floOpenFiles, floExploreFolders, floShowContextMenu, floAllowDelete);
  TdcFolderListView = class(TumCustomListView)
  private
    FFolderMonitor: TdcFolderMonitor;  
    FKBStr: String;
    FOptions: TdcFolderListViewOptions;
    FReportColumns: TdcListColumns;
    FShowFileExtensions: Boolean;

    { for internal use }
    ListUpdated, Busy: Boolean;
    OldControlCursor: TCursor;    
    FSmallImages, FLargeImages: THandle; { system images }
    CurrentOrder: Byte;
    ColumnOrders: Array[0..4] of Byte;

    FFiles: TList;

    FDiskScanner: TdcDiskScanner;
{$IFDEF D3}
    FShellProperties: TdcShellProperties;
{$ENDIF}    
    FFileAssociation: TdcFileAssociation;

    FOnFolderChanged: TdcFolderChangedEvent;
    FOnBeginUpdate, FOnEndUpdate: TNotifyEvent;

    function  GetFolder: String;
    procedure SetFolder(const Value: String);
    function  GetFileMask: String;
    procedure SetFileMask(const Value: String);
    procedure SetFolderMonitor(Value: TdcFolderMonitor);
    function  GetFileAttributes: TdcScanAttributes;
    procedure SetFileAttributes(Value: TdcScanAttributes);
    function  GetReadOnly: Boolean;
    procedure SetReadOnly(Value: Boolean);
    function  GetShowAllFolders: Boolean;
    procedure SetShowAllFolders(Value: Boolean);
    procedure SetShowFileExtensions(Value: Boolean);
    procedure SetKBStr(Value: String);

    procedure ScanDone(Sender: TObject; TotalFiles: Integer;
                       const TotalSize: Extended; ElapsedTimeInSeconds: Integer);
    procedure FileFound(Sender: TObject; const FileName, FileType: String;
                        const FileSize: Extended; const FileTime: TDateTime;
                        const FileAttributes: TdcScanAttributes;
                        const LargeIcon, SmallIcon: TIcon; SysImageIndex: Integer;
                        TotalFiles: Integer; const TotalSize: Extended);
    procedure FolderMonitorOnChange(Sender: TObject);
    procedure ContextMenuOnDelete(Sender: TObject; const FileName: String);
    procedure ContextMenuOnRename(Sender: TObject; const FileName: String);

    procedure WMLButtonDblClk(var Msg: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMRButtonDown(var Msg: TWMRButtonDown); message WM_RBUTTONDOWN;
  protected
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;    
    procedure CreateWnd; override;
    procedure Edit(const Item: TLVItem); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

    procedure UpdateListItems; override;    
    procedure InitColumns; virtual;
    procedure ExecuteListItem(ListItem: TListItem); virtual;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    function  FileNameByListItem(ListItem: TListItem): String; virtual;
    function  FileSizeByListItem(ListItem: TListItem): Extended; virtual;
    function  FileTypeByListItem(ListItem: TListItem): String; virtual;
    function  FileTimeByListItem(ListItem: TListItem): TDateTime; virtual;
    function  FileAttributesByListItem(ListItem: TListItem): TdcScanAttributes; virtual;
    function  ListItemByFileName(FileName: String): TListItem; virtual;
    function  DeleteSelectedFiles: Boolean; virtual;

    procedure Refresh; virtual;
    function  IsBackPossible: Boolean; virtual;
    procedure Back; virtual;
    procedure SelectAll; {$IFNDEF D6} virtual; {$ELSE} override; {$ENDIF}
    procedure UnselectAll; virtual;
    procedure CreateFolder(FolderName: String; Edit: Boolean); virtual;
    procedure CreateShortcut; virtual;
{$IFDEF D3}
    procedure ShowFolderProperties; virtual;
    procedure ShowItemProperties; virtual;
{$ENDIF}    
  published
    property Items stored False;
    property ViewStyle default vsIcon;
    property ReadOnly read GetReadOnly write SetReadOnly;

    property KBStr: String read FKBStr write SetKBStr;
    property Options: TdcFolderListViewOptions read FOptions write FOptions default [floOpenFiles, floExploreFolders, floShowContextMenu, floAllowDelete];
    property ReportColumns: TdcListColumns read FReportColumns write FReportColumns;
    property Folder: String read GetFolder write SetFolder;
    property FileMask: String read GetFileMask write SetFileMask;
    property FolderMonitor: TdcFolderMonitor read FFolderMonitor write SetFolderMonitor;    
    property FileAttributes: TdcScanAttributes read GetFileAttributes write SetFileAttributes default [saNormal, saArchive, saReadOnly, saSystem, saHidden, saDirectory, saAny];
    property ShowAllFolders: Boolean read GetShowAllFolders write SetShowAllFolders default True;
    property ShowFileExtensions: Boolean read FShowFileExtensions write SetShowFileExtensions default False;

    property OnFolderChanged: TdcFolderChangedEvent read FOnFolderChanged write FOnFolderChanged;
    property OnBeginUpdate: TNotifyEvent read FOnBeginUpdate write FOnBeginUpdate;
    property OnEndUpdate: TNotifyEvent read FOnEndUpdate write FOnEndUpdate;
  end;

implementation

uses Forms, SysUtils, ShellAPI, dcUtils;

{ *** SHELLOBJECT STRUCTURE FOR STORING FOLDER CONTENTS ***}
type
  TdcShellObject = class(TObject)
    FileName, FileType: String;
    FileSize: Extended;
    FileTime: TDateTime;
    Attributes: TdcScanAttributes;
    SysImageIndex: Integer;
    ListItem: TListItem;

    constructor Create(aFileName, aFileType: String;
                       aFileSize: Extended; aFileTime: TDateTime;
                       aAttributes: TdcScanAttributes;
                       aSysImageIndex: Integer);

    function ApplyToListView(ListView: TdcFolderListView): TListItem;
  end;

constructor TdcShellObject.Create(aFileName, aFileType: String;
                       aFileSize: Extended; aFileTime: TDateTime;
                       aAttributes: TdcScanAttributes;
                       aSysImageIndex: Integer);
begin
  inherited Create;
  FileName := aFileName;
  FileType := aFileType;
  FileSize := aFileSize;
  FileTime := aFileTime;
  Attributes := aAttributes;
  SysImageIndex := aSysImageIndex;
end;

function TdcShellObject.ApplyToListView(ListView: TdcFolderListView): TListItem;
var
  St, Ext: String;
begin
  Result := ListView.Items.Add;
  with ListView, Result do
   begin
    Data := Self;

    { Name (always visible) }
    St := ExtractFileName(FileName);
    Ext := LowerCase(ExtractFileExt(St));
    if not FShowFileExtensions and not (saDirectory in Attributes) then
     if Ext = '.lnk' then
       SetLength(St, Length(St) - Length(Ext))
     else
      begin
       FFileAssociation.EXTENSION := Ext;
       if FFileAssociation.ExecutableFile <> '' then
         SetLength(St, Length(St) - Length(Ext));
      end;
    Caption := St;

    { Icon image/overlay }
    ImageIndex := SysImageIndex;
    if not (saDirectory in Attributes) and ((Ext = '.lnk') or (Ext = '.url')) then
      OverlayIndex := 1;
    { TODO: Overlay image for shared folders }
    if saHidden in Attributes then
      Cut := True;

    { Size }
    if FReportColumns.FSize.FVisible then
     begin
      if not (saDirectory in Attributes) then
        if FileSize <> 0 then
          St := FloatToStrF(Int(FileSize / 1024 + 1), ffNumber, 18, 0) + FKBStr
        else
          St := '0' + FKBStr
      else
        St := '';
      SubItems.Add(St);
     end;

    { Type }
    if FReportColumns.FType.FVisible then
      SubItems.Add(FileType);

    { Modified }
    if FReportColumns.FModified.FVisible then
      SubItems.Add(FormatDateTime(ShortDateFormat + ' ' + ShortTimeFormat, FileTime));

    { Attributes }
    if FReportColumns.FAttributes.FVisible then
     begin
      St := '';
      if (saReadOnly in Attributes) then St := St + 'R';
      if (saHidden in Attributes) then St := St + 'H';
      if (saSystem in Attributes) then St := St + 'S';
      if (saArchive in Attributes) then St := St + 'A';
      SubItems.Add(St);
     end;
   end;  
end;
{ ******************************************************* }


{ TdcListColumn }
constructor TdcListColumn.Create(aFolderListView: TdcFolderListView; aIsNameColumn: Boolean);
begin
  inherited Create;
  FolderListView := aFolderListView;
  IsNameColumn := aIsNameColumn; 
  FVisible := True;
end;

procedure TdcListColumn.CreateColumn(Columns: TListColumns; Order: Byte);
begin
  if FVisible then
   begin
    { this will used for sorting by correct order }
    with FolderListView do
     begin
      ColumnOrders[CurrentOrder] := Order;
      Inc(CurrentOrder);
     end; 

    Column := Columns.Add;
    with Column do
     begin
      Alignment := FAlignment;
      Caption := FCaption;
      Width := FWidth;
     end;
   end
  else
   Column := nil;   
end;

function  TdcListColumn.GetAlignment: TAlignment;
begin
  if Column <> nil then
    Result := Column.Alignment
  else
    Result := FAlignment;
end;

procedure TdcListColumn.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
   if Column <> nil then
    begin
     Column.Alignment := Value;
     FAlignment := Column.Alignment;
    end
   else
     FAlignment := Value;
end;

function  TdcListColumn.GetCaption: String;
begin
  if Column <> nil then
    Result := Column.Caption
  else
    Result := FCaption;
end;

procedure TdcListColumn.SetCaption(const Value: String);
begin
  if FCaption <> Value then
   if Column <> nil then
    begin
     Column.Caption := Value;
     FCaption := Column.Caption;
    end
   else
     FCaption := Value;
end;

function  TdcListColumn.GetWidth: TWidth;
begin
  if Column <> nil then
    Result := Column.Width
  else
    Result := FWidth;
end;

procedure TdcListColumn.SetWidth(Value: TWidth);
begin
  if FWidth <> Value then
   if Column <> nil then
    begin
     Column.Width := Value;
     FWidth := Column.Width;
    end
   else
     FWidth := Value;
end;

procedure TdcListColumn.SetVisible(Value: Boolean);
begin
  if (FVisible <> Value) and not IsNameColumn then
   begin
    FVisible := Value;
    FolderListView.InitColumns;
   end;
end;


{ TdcListColumns }
constructor TdcListColumns.Create(aFolderListView: TdcFolderListView);
begin
  inherited Create;
  FName := TdcListColumn.Create(aFolderListView, True);
  with FName do
   begin
    FCaption := 'Name';
    FWidth := 180;
   end;
  FSize := TdcListColumn.Create(aFolderListView, False);
  with FSize do
   begin
    FCaption := 'Size';
    FWidth := 60;
    FAlignment := taRightJustify;
   end;
  FType := TdcListColumn.Create(aFolderListView, False);
  with FType do
   begin
    FCaption := 'Type';
    FWidth := 100;
   end;
  FModified := TdcListColumn.Create(aFolderListView, False);
  with FModified do
   begin
    FCaption := 'Modified';
    FWidth := 120;
   end;
  FAttributes := TdcListColumn.Create(aFolderListView, False);
  with FAttributes do
   begin
    FCaption := 'Attributes';
    FWidth := 50;
    FAlignment := taRightJustify;
    FVisible := False;
   end;
end;

destructor TdcListColumns.Destroy;
begin
  FAttributes.Free;
  FModified.Free;
  FType.Free;
  FSize.Free;
  FName.Free;
  inherited Destroy;
end;


{ Default sorting for FolderListView }
function DCFolderListViewSort(Item1, Item2: TListItem;
  lParam: Integer): Integer; stdcall;

  function IsFolder(ShObj: TdcShellObject): Boolean;
  begin
    Result := saDirectory in ShObj.Attributes
  end;

  function MyCompareStr(Str1, Str2: String): Integer;
  begin
    if (Str1 <> '') and (Str2 = '') then Result := -1
    else
     if (Str2 <> '') and (Str1 = '') then Result := 1
     else
       Result := AnsiCompareStr(Str1, Str2);
  end;

var
  Column: Integer;
  Str1, Str2: String;
  ShObj1, ShObj2: TdcShellObject;
begin
  with Item1 do
   if Assigned(TListView(ListView).OnCompare) then
     TListView(ListView).OnCompare(ListView, Item1, Item2, lParam, Result)
   else
    begin
     Result := 0;
     ShObj1 := Item1.Data;
     ShObj2 := Item2.Data;
     if (ShObj1 = nil) or (ShObj2 = nil) then Exit;

     Column := TdcFolderListView(ListView).ColumnOrders[LoWord(lParam)];
     case Column of
       { by size }
       1: if ShObj1.FileSize < ShObj2.FileSize then Result := -1
          else
           if ShObj1.FileSize > ShObj2.FileSize then Result := 1
           else Result := 0;

       { by type or attributes (by caption) }
       2, 4: begin
              Column := LoWord(lParam) - 1;

              if Item1.SubItems.Count > Column then
                Str1 := Item1.SubItems[Column]
              else
                Str1 := '';

              if Item2.SubItems.Count > Column then
                Str2 := Item2.SubItems[Column]
              else
                Str2 := '';

              Result := MyCompareStr(Str1, Str2);
             end;

       { by time }
       3: if ShObj1.FileTime < ShObj2.FileTime then Result := -1
          else
           if ShObj1.FileTime > ShObj2.FileTime then Result := 1
           else Result := 0;

       { by name }
       else
        { directory is top-priority thing }
        if IsFolder(ShObj1) and not IsFolder(ShObj2) then Result := -1
        else
         if not IsFolder(ShObj1) and IsFolder(ShObj2) then Result := 1
         else
          { now by name }
          Result := MyCompareStr(ShObj1.FileName, ShObj2.FileName);
      end;

     Result := Result * ShortInt(HiWord(lParam));
    end;
end;

{ TdcFolderListView }
constructor TdcFolderListView.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  inherited ViewStyle := vsIcon;
  DefaultSortProc := @DCFolderListViewSort;

  FFiles := TList.Create;
  FReportColumns := TdcListColumns.Create(Self);
  FDiskScanner := TdcDiskScanner.Create(Self);
  with FDiskScanner do
   begin
    SearchAttributes := [saNormal, saArchive, saReadOnly, saSystem, saHidden, saDirectory, saAny];
    ThreadPriority := tpTimeCritical;
    IncludeSubfolders := False;
    OnFileFound := FileFound;
    OnScanDone := ScanDone;
   end;

{$IFDEF D3}
  FShellProperties := TdcShellProperties.Create(Self);
  with FShellProperties do
   begin
    OnDelete := ContextMenuOnDelete;
    OnRename := ContextMenuOnRename;
   end;
{$ENDIF}   
   
  FFileAssociation := TdcFileAssociation.Create(Self);

  FLargeImages := GetSystemImageList(32);
  FSmallImages := GetSystemImageList(16);

  ShowAllFolders := True;
  FOptions := [floOpenFiles, floExploreFolders, floShowContextMenu, floAllowDelete];
  FKBStr := 'KB';
  IconOptions.AutoArrange := True;
end;

destructor TdcFolderListView.Destroy;
begin
  FFileAssociation.Free;
{$IFDEF D3}
  FShellProperties.Free;
{$ENDIF}  
  FDiskScanner.Free;
  FReportColumns.Free;
  FFiles.Free;
  inherited Destroy;
end;

procedure TdcFolderListView.Loaded;
begin
  inherited Loaded;

{$IFDEF D3}
  { can rename files? }
  with FShellProperties do
   if ReadOnly then
     MenuOptions := MenuOptions - [moCanRename]
   else
     MenuOptions := MenuOptions + [moCanRename];
{$ENDIF}     

  Refresh;
end;

procedure TdcFolderListView.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FFolderMonitor) then
    FFolderMonitor := nil;
end;

procedure TdcFolderListView.CreateWnd;
begin
  inherited CreateWnd;
  if FLargeImages <> 0 then
    SendMessage(Handle, LVM_SETIMAGELIST, LVSIL_NORMAL, FLargeImages);
  if FSmallImages <> 0 then
    SendMessage(Handle, LVM_SETIMAGELIST, LVSIL_SMALL, FSmallImages);
  Refresh;
end;

procedure TdcFolderListView.Edit(const Item: TLVItem);
var
  ShellObject: TdcShellObject;
  OldName, NewName, NewFileName: String;
begin
  if Selected = nil then Exit;
  ShellObject := Selected.Data;

  OldName := Selected.Caption;
  inherited Edit(Item);
  NewName := Selected.Caption;

  if NewName = '' then
   begin
    Selected.Caption := OldName;
    Exit;
   end;

  { rename file or directory }
  with ShellObject do
   try
     NewFileName := IncludeTrailingBackslash(ExtractFilePath(FileName)) +
                    NewName + ExtractFileExt(FileName);
     if MoveFile(PChar(FileName), PChar(NewFileName)) then
       FileName := NewFileName
     else
       Selected.Caption := OldName;
     AlphaSort;  
   except
   end;
end;

procedure TdcFolderListView.KeyDown(var Key: Word; Shift: TShiftState);
var
  ListItem: TListItem;
begin
  case Key of
    VK_RETURN: begin
                ListItem := Selected;
                if ListItem = nil then Exit;
{$IFDEF D3}
                if ssAlt in Shift then
                 begin
                  if not (floShowContextMenu in FOptions) then Exit;
                  FShellProperties.ShowPropertiesByFile(FileNameByListItem(ListItem));
                  Key := 0;
                 end
                else
{$ENDIF}
                  ExecuteListItem(ListItem);
               end;
    VK_BACK: if not IsEditing then Back;
    VK_DELETE: if (floAllowDelete in FOptions) and not IsEditing then DeleteSelectedFiles;
    VK_F5: Refresh;
   end;
end;

procedure TdcFolderListView.UpdateListItems;
var
  I: Integer;
  OldCursor: TCursor;
begin
  inherited;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

  Items.BeginUpdate;
  Items.Clear;

  { filling the listview } 
  I := FFiles.Count;
  if I <> 0 then
   for I := 0 to I - 1 do
    TdcShellObject(FFiles[I]).ApplyToListView(Self);

  AlphaSort;
  Items.EndUpdate;
  Invalidate;

  Screen.Cursor := OldCursor;
end;

procedure TdcFolderListView.InitColumns;
begin
  with Columns, FReportColumns do
   begin
    BeginUpdate;
    try
      Clear;
      CurrentOrder := 0;
      FName.CreateColumn(Columns, 0);
      FSize.CreateColumn(Columns, 1);
      FType.CreateColumn(Columns, 2);
      FModified.CreateColumn(Columns, 3);
      FAttributes.CreateColumn(Columns, 4);

      UpdateListItems;
    finally
      EndUpdate;
    end;
    Invalidate;
   end;
end;

procedure TdcFolderListView.ExecuteListItem(ListItem: TListItem);
var
  FileName: String;
begin
  if ListItem = nil then Exit;

  FileName := FileNameByListItem(ListItem);
  if FileName = '' then Exit;
  
  if (floExploreFolders in FOptions) and
     (saDirectory in FileAttributesByListItem(ListItem)) then
   begin
    Folder := FileName;
    if Assigned(FOnFolderChanged) then
      FOnFolderChanged(Self, Folder);
    Exit; 
   end;
  if floOpenFiles in FOptions then
   try
     ShellExecute(GetDesktopWindow, 'open', PChar(FileName), nil, nil, SW_SHOWNORMAL);
   except
   end;
end;

function TdcFolderListView.IsBackPossible: Boolean;
begin
  Result := Length(Folder) > 3;
end;

procedure TdcFolderListView.Back;
begin
  if IsBackPossible then
   begin
    Folder := ExtractFilePath(ExcludeTrailingBackslash(Folder));
    if Assigned(FOnFolderChanged) then
      FOnFolderChanged(Self, Folder);
   end;
end;

procedure TdcFolderListView.SelectAll;
var
  I: Integer;
begin
  SetFocus;
  Items.BeginUpdate;
  try
    for I := 0 to Items.Count - 1 do
      Items[I].Selected := True;
  except
  end;
  Items.EndUpdate;
end;

procedure TdcFolderListView.UnselectAll;
var
  I: Integer;
begin
//  Items.BeginUpdate;
  try
    for I := 0 to Items.Count - 1 do
      Items[I].Selected := False;
  except
  end;
//  Items.EndUpdate;
end;

procedure TdcFolderListView.CreateFolder(FolderName: String; Edit: Boolean);
var
  FullFolderName: String;
  ShObject: TdcShellObject;
  ShInfo: TShFileInfo;
  FindHandle: THandle;
  FindData: TWin32FindData;

  function FindUnusedFolderName(FullFolderName: String): String;
  var iTry: Integer;
  begin
    if ObjectExists(FullFolderName) then
     begin
      iTry := 1;
      repeat
       Inc(iTry);
       Result := FullFolderName + ' (' + IntToStr(iTry) + ')';
      until not ObjectExists(Result) or (iTry = MaxInt);
     end
    else Result := FullFolderName;
  end;

begin
  if FolderName = '' then FolderName := 'New Folder';
  FullFolderName := FindUnusedFolderName(IncludeTrailingBackslash(Folder) + FolderName);
  FolderName := ExtractFileName(FullFolderName);
  if CreateDirectory(PChar(FullFolderName), nil) then
   begin
    { checking the created folder to retrieve information }
    FindHandle := FindFirstFile(PChar(FullFolderName), FindData);
    if FindHandle <> INVALID_HANDLE_VALUE then
     with FindData do
      begin
       Windows.FindClose(FindHandle);

       { retrieving the folder information and adding to internal list }
       ShGetFileInfo(PChar(FullFolderName), 0, ShInfo, SizeOf(TShFileInfo), SHGFI_TYPENAME or SHGFI_SYSICONINDEX);
       ShObject := TdcShellObject.Create(FullFolderName, ShInfo.szTypeName,
          0, UTCFileTimeToDateTime(FindData.ftLastWriteTime),
          [saDirectory], ShInfo.iIcon);
       FFiles.Add(ShObject);

       { adding list item}
       if Edit then
         TListItem(ShObject.ApplyToListView(Self)).EditCaption;
      end;
   end;
end;

procedure TdcFolderListView.CreateShortcut;
begin
  try
    WinExec(PChar('rundll32 appwiz.cpl,NewLinkHere ' + Folder), SW_SHOWNORMAL);
  except
  end;
end;

{$IFDEF D3}
procedure TdcFolderListView.ShowFolderProperties;
begin
  FShellProperties.ShowPropertiesByFile(Folder);
end;

procedure TdcFolderListView.ShowItemProperties;
begin
  if Selected <> nil then
    FShellProperties.ShowPropertiesByFile(FileNameByListItem(Selected));
end;
{$ENDIF}

procedure TdcFolderListView.Refresh;
begin
  if not (csLoading in ComponentState) and
     not (csReading in ComponentState) and
     not FDiskScanner.Busy and not Busy then
   begin
    Busy := True;
    ListUpdated := True;
    if Columns.Count = 0 then InitColumns;

    if Assigned(FOnBeginUpdate) then
      FOnBeginUpdate(Self);

    if Assigned(FFolderMonitor) then
     begin
      FFolderMonitor.Active := False;
      FFolderMonitor.Folder := Folder;
     end;

    if not (csDesigning in ComponentState) then
     begin
      OldControlCursor := Cursor;
      Cursor := crHourglass;
     end; 

    Items.BeginUpdate;
    FFiles.Clear;
    Items.Clear;
    Items.EndUpdate;

    FDiskScanner.Execute;
   end;
end;


{ event handlers }
procedure TdcFolderListView.ScanDone(Sender: TObject; TotalFiles: Integer;
  const TotalSize: Extended; ElapsedTimeInSeconds: Integer);
begin
  UpdateListItems;
  if not (csDesigning in ComponentState) then
    Cursor := OldControlCursor;

  if Assigned(FFolderMonitor) then
    FFolderMonitor.Active := True;

  if Assigned(FOnEndUpdate) then
    FOnEndUpdate(Self);
  Busy := False;  
end;

procedure TdcFolderListView.FileFound(Sender: TObject;
  const FileName, FileType: String;
  const FileSize: Extended; const FileTime: TDateTime;
  const FileAttributes: TdcScanAttributes;
  const LargeIcon, SmallIcon: TIcon; SysImageIndex: Integer;
  TotalFiles: Integer; const TotalSize: Extended);
var
  ShellObject: TdcShellObject;
begin
  ShellObject := TdcShellObject.Create(FileName, FileType,
       FileSize, FileTime, FileAttributes, SysImageIndex);
  FFiles.Add(ShellObject);
end;

procedure TdcFolderListView.FolderMonitorOnChange(Sender: TObject);
begin
  Refresh;
end;

procedure TdcFolderListView.ContextMenuOnDelete(Sender: TObject; const FileName: String);
var
  ShellObject: TdcShellObject;
begin
  if Selected <> nil then
   begin
    { delete record from list }
    try
      ShellObject := Selected.Data;
      FFiles.Remove(ShellObject);
    except
    end;  

    { delete list item }
    Items.Delete(Selected.Index);
   end;
end;

procedure TdcFolderListView.ContextMenuOnRename(Sender: TObject; const FileName: String);
begin
  if Selected <> nil then Selected.EditCaption;
end;


{ public methods }
function  TdcFolderListView.FileNameByListItem(ListItem: TListItem): String;
begin
  Result := '';
  if ListItem <> nil then
   try
     Result := TdcShellObject(ListItem.Data).FileName;
   except
   end
end;

function TdcFolderListView.FileSizeByListItem(ListItem: TListItem): Extended;
begin
  Result := -1;
  if ListItem <> nil then
   try
     Result := TdcShellObject(ListItem.Data).FileSize;
   except
   end
end;

function TdcFolderListView.FileTypeByListItem(ListItem: TListItem): String;
begin
  Result := '';
  if ListItem <> nil then
   try
     Result := TdcShellObject(ListItem.Data).FileType;
   except
   end
end;

function TdcFolderListView.FileTimeByListItem(ListItem: TListItem): TDateTime;
begin
  Result := -1;
  if ListItem <> nil then
   try
     Result := TdcShellObject(ListItem.Data).FileTime;
   except
   end
end;

function TdcFolderListView.FileAttributesByListItem(ListItem: TListItem): TdcScanAttributes;
begin
  Result := [];
  if ListItem <> nil then
   try
     Result := TdcShellObject(ListItem.Data).Attributes;
   except
   end
end;

function  TdcFolderListView.ListItemByFileName(FileName: String): TListItem;
var
  I: Integer;
begin
  Result := nil;
  I := FFiles.Count;
  if I <> 0 then
   for I := 0 to I - 1 do
    if TdcShellObject(FFiles[I]).FileName = FileName then
     begin
      Result := TdcShellObject(FFiles[I]).ListItem; 
      Exit;
     end;
end;

function  TdcFolderListView.DeleteSelectedFiles: Boolean;
var
  I: Integer;
  St: String;
  Lst: TList;  
  ShellObject: TdcShellObject;
  FileOperations: TdcFileOperations;
begin
  Result := False;
  I := Items.Count;
  if I = 0 then Exit;

  Lst := TList.Create;
  FileOperations := TdcFileOperations.Create(Self);
  with FileOperations do
   try
     try
       for I := 0 to I - 1 do
        if Items[I].Selected then
         begin
          St := FileNameByListItem(Items[I]);
          FileList.Add('"' + St + '"');
          Lst.Add(Items[I]);
         end;
       ListUpdated := False;  
       Result := FileOperations.Delete;
       { if command confirmed }
       if Result and not ListUpdated and (Lst.Count <> 0) then
        begin
         Items.BeginUpdate;
         for I := Lst.Count - 1 downto 0 do
          begin
           try
             ShellObject := TListItem(Lst[I]).Data;
             FFiles.Remove(ShellObject);
           except
           end;
           { delete list item }
           Items.Delete(TListItem(Lst[I]).Index);
          end;
         Items.EndUpdate;
        end;  
     except
     end;
   finally
     Free;
   end;
  Lst.Free; 
end;


{ properties }
function  TdcFolderListView.GetFolder: String;
begin
  Result := FDiskScanner.Folder;
end;

procedure TdcFolderListView.SetFolder(const Value: String);
begin
  if LowerCase(IncludeTrailingBackslash(FDiskScanner.Folder)) <> LowerCase(IncludeTrailingBackslash(Value)) then
   begin
    FDiskScanner.Folder := Value;
    Refresh;
   end;
end;

function  TdcFolderListView.GetFileMask: String;
begin
  Result := FDiskScanner.SearchMask;
end;

procedure TdcFolderListView.SetFileMask(const Value: String);
begin
  if LowerCase(FDiskScanner.SearchMask) <> LowerCase(Value) then
   begin
    FDiskScanner.SearchMask := Value;
    Refresh;
   end;
end;

procedure TdcFolderListView.SetFolderMonitor(Value: TdcFolderMonitor);
begin
  if FFolderMonitor <> Value then
   begin
    FFolderMonitor := Value;
    if Value <> nil then
     begin
      FFolderMonitor.Active := True;
      FFolderMonitor.Folder := Folder;
      FFolderMonitor.OnChange := FolderMonitorOnChange;
      Value.FreeNotification(Self);
     end;
   end;
end;

function  TdcFolderListView.GetFileAttributes: TdcScanAttributes;
begin
  Result := FDiskScanner.SearchAttributes;
end;

procedure TdcFolderListView.SetFileAttributes(Value: TdcScanAttributes);
begin
  if FDiskScanner.SearchAttributes <> Value then
   begin
    FDiskScanner.SearchAttributes := Value;
    Refresh;
   end;
end;

function  TdcFolderListView.GetReadOnly: Boolean;
begin
  Result := inherited ReadOnly;
end;

procedure TdcFolderListView.SetReadOnly(Value: Boolean);
begin
  inherited ReadOnly := Value;

{$IFDEF D3}
  with FShellProperties do
   if Value then
     MenuOptions := MenuOptions - [moCanRename]
   else
     MenuOptions := MenuOptions + [moCanRename];
{$ENDIF}
end;

function  TdcFolderListView.GetShowAllFolders: Boolean;
begin
  Result := FDiskScanner.FindAllFolders;
end;

procedure TdcFolderListView.SetShowAllFolders(Value: Boolean);
begin
  FDiskScanner.FindAllFolders := Value;
  if HandleAllocated then Refresh;
end;

procedure TdcFolderListView.SetShowFileExtensions(Value: Boolean);
begin
  if FShowFileExtensions <> Value then
   begin
    FShowFileExtensions := Value;
    UpdateListItems;
   end;
end;

procedure TdcFolderListView.SetKBStr(Value: String);
begin
  if FKBStr <> Value then
   begin
    FKBStr := Value;
    UpdateListItems;
   end;
end;


{ misc functions }
procedure TdcFolderListView.WMLButtonDblClk(var Msg: TWMLButtonDblClk);
begin
  inherited;
  ExecuteListItem(GetItemAt(Msg.XPos, Msg.YPos));
end;

procedure TdcFolderListView.WMRButtonDown(var Msg: TWMRButtonDown);
var
  ListItem: TListItem;
begin
  ListItem := GetItemAt(Msg.XPos, Msg.YPos);
  if (ListItem <> nil) and (floShowContextMenu in FOptions) then
   begin
    SetFocus;
    if MultiSelect then UnselectAll;
    ListItem.Selected := True;

{$IFDEF D3}
    with FShellProperties do
     begin
      if floAllowDelete in FOptions then
       MenuOptions := MenuOptions + [moAllowDelete]
      else
       MenuOptions := MenuOptions - [moAllowDelete];

      ShowContextMenuByFile(FileNameByListItem(ListItem));
     end;
{$ENDIF}      
   end
  else inherited;
end;

end.

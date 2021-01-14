{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcDiskScanner.pas - dcDiskScanner and dcMultiDiskScanner components

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

unit dcDiskScanner;

interface

uses
  Windows, Classes, Controls, Forms, Graphics, SysUtils,
  dcInternal, dcThread;

type
// DiskScanner
  TDiskScannerMatches = class(TPersistent)
  private
    FLimited: Boolean;
    FMaxMatches: DWord;
  protected
  public
  published
    property Limited: Boolean read FLimited write FLimited default False;
    property MaxMatches: DWord read FMaxMatches write FMaxMatches default 0;
  end;

  TFindFilesByDateKind = (ffModified, ffCreated, ffAccessed);
  TSearchTime = class(TPersistent)
  private
    FAnyTime: Boolean;
    FFindFiles: TFindFilesByDateKind;
    FSinceTime: TDateTime;
    FTillTime: TDateTime;
  protected
  public
    constructor Create;
  published
    property AnyTime: Boolean read FAnyTime write FAnyTime default True;
    property FindFiles: TFindFilesByDateKind read FFindFiles write FFindFiles default ffModified;
    property SinceTime: TDateTime read FSinceTime write FSinceTime;
    property TillTime: TDateTime read FTillTime write FTillTime;
  end;

  TSearchSize = class(TPersistent)
  private
    FAnySize: Boolean;
    FMinSizeKB,
    FMaxSizeKB: Integer;
  protected
  public
    constructor Create;
  published
    property AnySize: Boolean read FAnySize write FAnySize default True;
    property MinSizeKB: Integer read FMinSizeKB write FMinSizeKB default 0;
    property MaxSizeKB: Integer read FMaxSizeKB write FMaxSizeKB default 0;
  end;

  TdcFileFoundEvent = procedure(Sender: TObject; const FileName, FileType: String;
                                const FileSize: Extended; const FileTime: TDateTime;
                                const FileAttributes: TdcScanAttributes;
                                const LargeIcon, SmallIcon: TIcon; SysImageIndex: Integer;
                                TotalFiles: Integer; const TotalSize: Extended) of object;
  TdcScanFolderEvent = procedure(Sender: TObject; const Folder: String) of object;
  TdcScanDoneEvent = procedure(Sender: TObject; TotalFiles: Integer;
     const TotalSize: Extended; ElapsedTimeInSeconds: Integer) of object;

// TdcCustomDiskScanner
  TdcCustomDiskScanner = class(TumdcComponent)
  private
    FFiles: TStringList;
    FFindAllFolders: Boolean;
    FMatches: TDiskScannerMatches;
    FSearchAttributes: TdcScanAttributes;
    FSearchTime: TSearchTime;
    FSearchSize: TSearchSize;
    FUseIcons: Boolean;

    FThread: TdcCustomThread;

    { for internal use }
    MultiFind: Boolean;
    tmpLIcon, tmpSIcon: TIcon;
    CurrentFile, CurrentFolder: String;
    FileType: String;
    FileSize: Extended;
    FileTime: TDateTime;
    FileAttributes: TdcScanAttributes;
    SysImageIndex: Integer;

    ITotalFiles: DWord;
    ITotalSize: Extended;
    IElapsedTime: TDateTime;
    { ---------------- }

    FOnFileFound: TdcFileFoundEvent;
    FOnScanFolder: TdcScanFolderEvent;
    FOnScanDone: TdcScanDoneEvent;
    FOnStopped: TNotifyEvent;
    FOnFolderNotExist: TdcScanFolderEvent;

    function  GetBusy: Boolean;
    procedure SetSearchAttributes(Value: TdcScanAttributes);
    function  GetSuspended: Boolean;
    procedure SetSuspended(Value: Boolean);
    function  GetThreadPriority: TThreadPriority;
    procedure SetThreadPriority(Value: TThreadPriority);
    function  GetWaitThread: Boolean;
    procedure SetWaitThread(Value: Boolean);

    { utilities }
    function  IsDirectory(Data: TWin32FindData): Boolean;
    function  IsHidden(Data: TWin32FindData): Boolean;
    function  IsGoodFileName(Data: TWin32FindData): Boolean;
    function  IsGoodAttributes(Data: TWin32FindData): Boolean;    
    function  IsGoodSize(Data: TWin32FindData): Boolean;
    function  IsGoodTime(Data: TWin32FindData): Boolean;
    function  IsNewFile(Data: TWin32FindData): Boolean;    
    function  IsGoodFile(Data: TWin32FindData): Boolean;

    function  AttrToScanAttributes(Attr: Integer): TdcScanAttributes;
    procedure ProcessFoundFile(Data: TWin32FindData);
  protected
    procedure ThreadExecute(Sender: TObject); virtual;
    procedure ThreadException(Sender: TObject); virtual;
    procedure ThreadDone(Sender: TObject); virtual;

    procedure DoFileFound; virtual;
    procedure DoScanFolder; virtual;
    procedure DoFolderNotExist; virtual;

    property FindAllFolders: Boolean read FFindAllFolders write FFindAllFolders default False;
    property Matches: TDiskScannerMatches read FMatches write FMatches;
    property SearchAttributes: TdcScanAttributes read FSearchAttributes write SetSearchAttributes default [saNormal, saArchive, saReadOnly, saSystem, saHidden];
    property SearchTime: TSearchTime read FSearchTime write FSearchTime;
    property SearchSize: TSearchSize read FSearchSize write FSearchSize;
    property Suspended: Boolean read GetSuspended write SetSuspended default True;    
    property ThreadPriority: TThreadPriority read GetThreadPriority write SetThreadPriority default tpNormal;
    property WaitThread: Boolean read GetWaitThread write SetWaitThread default False;
    property UseIcons: Boolean read FUseIcons write FUseIcons default False;
    property OnFileFound: TdcFileFoundEvent read FOnFileFound write FOnFileFound;
    property OnScanFolder: TdcScanFolderEvent read FOnScanFolder write FOnScanFolder;
    property OnScanDone: TdcScanDoneEvent read FOnScanDone write FOnScanDone;
    property OnStopped: TNotifyEvent read FOnStopped write FOnStopped;
    property OnFolderNotExist: TdcScanFolderEvent read FOnFolderNotExist write FOnFolderNotExist;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    function  Execute: Boolean; virtual;
    procedure Stop; virtual;

    property Files: TStringList read FFiles;
    property Busy: Boolean read GetBusy;
    property Thread: TdcCustomThread read FThread;
  end;

// TdcDiskScanner  
  TdcDiskScanner = class(TdcCustomDiskScanner)
  private
    FFolder: String;
    FSearchMask: String;
    FIncludeSubfolders: Boolean;
    FIncludeHiddenSubfolders: Boolean;

    procedure SetFolder(const Value: String);
  protected
    procedure ThreadExecute(Sender: TObject); override;  
  public
    constructor Create(aOwner: TComponent); override;
  published
    property About;

    property Folder: String read FFolder write SetFolder;
    property SearchMask: String read FSearchMask write FSearchMask;
    property IncludeSubfolders: Boolean read FIncludeSubfolders write FIncludeSubfolders default True;
    property IncludeHiddenSubfolders: Boolean read FIncludeHiddenSubfolders write FIncludeHiddenSubfolders default False;

    property FindAllFolders;
    property Matches;
    property SearchAttributes;
    property SearchTime;
    property SearchSize;
    property Suspended;
    property ThreadPriority;
    property WaitThread;
    property UseIcons;
    property OnFileFound;
    property OnScanFolder;
    property OnScanDone;
    property OnStopped;    
  end;

// TDiskScannerPath
  TDiskScannerPath = class(TPersistent)
  private
    FPathMask: String;
    FIncludeSubfolders: Boolean;
  protected
  public
    constructor Create(const aPathMask: String; aIncludeSubfolders: Boolean);
  published
    property PathMask: String read FPathMask write FPathMask;
    property IncludeSubfolders: Boolean read FIncludeSubfolders write FIncludeSubfolders;
  end;

// TDiskScanList
  TDiskScanList = class(TdcObjectList)
  private
    function  Get(Index: Integer): TDiskScannerPath;
    procedure Put(Index: Integer; Item: TDiskScannerPath);
  public
    procedure AddPath(PathMask: String; IncludeSubfolders: Boolean);

    function LoadFromFile(const FileName: String): Boolean; // returns True if successfull
    function SaveToFile(const FileName: String): Boolean; // returns True if successfull

    property Items[Index: Integer]: TDiskScannerPath read Get write Put; default;    
  end;

// TdcMultiDiskScanner
  TdcMultiDiskScanner = class(TdcCustomDiskScanner)
  private
    FIncludeList: TDiskScanList;
    FExcludeList: TDiskScanList;

    FPreExcludedList, FExcludedWithoutPath: TStringList;
    FOnExcludingBegin, FOnExcludingEnd: TNotifyEvent;
  protected
    procedure ReadData(Stream: TStream); virtual;
    procedure WriteData(Stream: TStream); virtual;
    procedure DefineProperties(Filer: TFiler); override;

    procedure ThreadExecute(Sender: TObject); override;
    procedure ThreadDone(Sender: TObject); override;        
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property About;

    property IncludeList: TDiskScanList read FIncludeList write FIncludeList;
    property ExcludeList: TDiskScanList read FExcludeList write FExcludeList;

    property OnExcludingBegin: TNotifyEvent read FOnExcludingBegin write FOnExcludingBegin;
    property OnExcludingEnd: TNotifyEvent read FOnExcludingEnd write FOnExcludingEnd;

    property Matches;
    property SearchAttributes;
    property SearchTime;
    property SearchSize;
    property Suspended;
    property ThreadPriority;
    property WaitThread;
    property UseIcons;
    property OnFileFound;
    property OnScanFolder;
    property OnScanDone;
    property OnStopped;
    property OnFolderNotExist;
  end;

implementation

uses ShellAPI, dcUtils, dcFileAssociation;

// SearchTime
constructor TSearchTime.Create;
begin
  inherited;
  FAnyTime := True;
end;

// SearchSize
constructor TSearchSize.Create;
begin
  inherited;
  FAnySize := True;
end;

// CustomDiskScanner
constructor TdcCustomDiskScanner.Create(aOwner: TComponent);
begin
  inherited;
  FThread := TdcCustomThread.Create(Self);
  FThread.OnExecute := ThreadExecute;
  FThread.OnException := ThreadException;
  FThread.OnTerminate := ThreadDone;

  FSearchAttributes := [saNormal, saArchive, saReadOnly, saSystem, saHidden];

  FSearchTime := TSearchTime.Create;
  FSearchSize := TSearchSize.Create;
  FMatches := TDiskScannerMatches.Create;

  tmpLIcon := TIcon.Create;
  tmpSIcon := TIcon.Create;
  FFiles := TStringList.Create;
end;

destructor TdcCustomDiskScanner.Destroy;
begin
  Stop;

  FFiles.Free;
  tmpSIcon.Free;
  tmpLIcon.Free;

  FMatches.Free;
  FSearchSize.Free;
  FSearchTime.Free;
  FThread.Free;  

  inherited;
end;

{ public methods }
function TdcCustomDiskScanner.Execute: Boolean;
begin
  Result := Busy;
  if not Result then
   begin
    ITotalFiles := 0;
    ITotalSize := 0;
    IElapsedTime := Now;
    FThread.Execute;
   end
end;

procedure TdcCustomDiskScanner.Stop;
begin
  if Busy then
   begin
    FThread.Terminate(False);
    
    if Assigned(FOnStopped) and not (csDestroying in ComponentState) then
      FOnStopped(Self);
   end;
end;

{ virtual thread methods }
procedure TdcCustomDiskScanner.ThreadExecute(Sender: TObject);
begin
  FFiles.Clear;
end;

procedure TdcCustomDiskScanner.ThreadException(Sender: TObject);
begin
end;

procedure TdcCustomDiskScanner.ThreadDone(Sender: TObject);

  function GetSeconds: LongInt;
  var
    TimeDif: TDateTime;
  begin
    Result := 0;
    TimeDif := Now - IElapsedTime;
    if TimeDif <> 0 then
     try
       Result := Trunc(MSecsPerDay * TimeDif / 1000);
     except
     end;
  end;
  
begin
  if not (csDestroying in ComponentState) and
    Assigned(FOnScanDone) then
    FOnScanDone(Self, ITotalFiles, ITotalSize, GetSeconds);
end;

procedure TdcCustomDiskScanner.DoFileFound;
begin
  if not FThread.Terminated and not (csDestroying in ComponentState) then
    FOnFileFound(Self, CurrentFile, FileType,
                 FileSize, FileTime, FileAttributes,
                 tmpLIcon, tmpSIcon, SysImageIndex,
                 ITotalFiles, ITotalSize);
end;

procedure TdcCustomDiskScanner.DoScanFolder;
begin
  if not FThread.Terminated and not (csDestroying in ComponentState) then
    FOnScanFolder(Self, CurrentFolder);
end;

procedure TdcCustomDiskScanner.DoFolderNotExist;
begin
  if not FThread.Terminated and not (csDestroying in ComponentState) then
    FOnFolderNotExist(Self, CurrentFolder);
end;

{ utilities }
function  TdcCustomDiskScanner.IsDirectory(Data: TWin32FindData): Boolean;
begin
  Result := (Data.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = FILE_ATTRIBUTE_DIRECTORY;
end;

function  TdcCustomDiskScanner.IsHidden(Data: TWin32FindData): Boolean;
begin
  Result := (Data.dwFileAttributes and FILE_ATTRIBUTE_HIDDEN) = FILE_ATTRIBUTE_HIDDEN;
end;

function  TdcCustomDiskScanner.IsGoodFileName(Data: TWin32FindData): Boolean;
begin
  with Data do
    Result := (String(cFileName) <> '.') and (String(cFileName) <> '..');
end;

function  TdcCustomDiskScanner.IsGoodAttributes(Data: TWin32FindData): Boolean;
{
  function orOK(SA: TdcScanAttribute; FA: DWord): Boolean;
  begin
    Result := (SA in FSearchAttributes) and
              ((Data.dwFileAttributes and FA) = FA);
  end;
}
  function andOK(SA: TdcScanAttribute; FA: DWord): Boolean;
  begin
    Result := not (not (SA in FSearchAttributes) and
                  ((Data.dwFileAttributes and FA) = FA));
  end;

begin
  if Data.dwFileAttributes = 0 then
    Result := (saNormal in FSearchAttributes)
  else
   Result :=
     (andOK(saDirectory, FILE_ATTRIBUTE_DIRECTORY) and
      andOK(saArchive, FILE_ATTRIBUTE_ARCHIVE) and
      andOK(saReadOnly, FILE_ATTRIBUTE_READONLY) and
      andOK(saHidden, FILE_ATTRIBUTE_HIDDEN) and
      andOK(saSystem, FILE_ATTRIBUTE_SYSTEM) and
      andOK(saNormal, FILE_ATTRIBUTE_NORMAL));

{ Result :=
    orOK(saDirectory, FILE_ATTRIBUTE_DIRECTORY) or
    orOK(saArchive, FILE_ATTRIBUTE_ARCHIVE) or
    orOK(saReadOnly, FILE_ATTRIBUTE_READONLY) or
    orOK(saHidden, FILE_ATTRIBUTE_HIDDEN) or
    orOK(saSystem, FILE_ATTRIBUTE_SYSTEM) or
    orOK(saNormal, FILE_ATTRIBUTE_NORMAL) or
    ((saNormal in FSearchAttributes) and (dwFileAttributes = 0));}
end;

function  TdcCustomDiskScanner.IsGoodSize(Data: TWin32FindData): Boolean;
var
  ExtSize: Extended;
begin
  with Data do
    ExtSize := Int2x32ToExt(nFileSizeHigh, nFileSizeLow);
  Result := FSearchSize.AnySize or
            ((ExtSize >= FSearchSize.MinSizeKB * $400) and
             (ExtSize <= FSearchSize.MaxSizeKB * $400));
end;

function  TdcCustomDiskScanner.IsGoodTime(Data: TWin32FindData): Boolean;
var
  FileTime: TDateTime;
begin
  if FSearchTime.AnyTime then Result := True
  else
   begin
    with Data do
     case FSearchTime.FindFiles of
       ffCreated: FileTime := UTCFileTimeToDateTime(ftCreationTime);
       ffModified: FileTime := UTCFileTimeToDateTime(ftLastWriteTime);
       ffAccessed: FileTime := UTCFileTimeToDateTime(ftLastAccessTime);
       else FileTime := -1;
      end;
     
    Result := (FileTime <> -1) and
              (FileTime >= FSearchTime.SinceTime) and
              (FileTime <= FSearchTime.TillTime);
   end;
end;

function  TdcCustomDiskScanner.IsNewFile(Data: TWin32FindData): Boolean;
var
  I: Integer;
begin
  Result := True;
  I := FFiles.Count;
  if I <> 0 then
   for I := 0 to I - 1 do
    if CurrentFolder + Data.cFileName = FFiles[I] then
     begin
      Result := False;
      Exit;
     end;
end;

function  TdcCustomDiskScanner.IsGoodFile(Data: TWin32FindData): Boolean;
begin
  Result := IsGoodAttributes(Data) and
            IsGoodFileName(Data) and
            IsGoodSize(Data) and
            IsGoodTime(Data) and
            (not MultiFind or IsNewFile(Data));
end;

function  TdcCustomDiskScanner.AttrToScanAttributes(Attr: Integer): TdcScanAttributes;
begin
  if Attr = 0 then Result := [saNormal]
  else
   begin
    Result := [];   
    if (Attr and FILE_ATTRIBUTE_NORMAL) = FILE_ATTRIBUTE_NORMAL then
      Result := Result + [saNormal];
    if (Attr and FILE_ATTRIBUTE_ARCHIVE) = FILE_ATTRIBUTE_ARCHIVE then
      Result := Result + [saArchive];
    if (Attr and FILE_ATTRIBUTE_READONLY) = FILE_ATTRIBUTE_READONLY then
      Result := Result + [saReadOnly];
    if (Attr and FILE_ATTRIBUTE_HIDDEN) = FILE_ATTRIBUTE_HIDDEN then
      Result := Result + [saHidden];
    if (Attr and FILE_ATTRIBUTE_SYSTEM) = FILE_ATTRIBUTE_SYSTEM then
      Result := Result + [saSystem];
    if (Attr and FILE_ATTRIBUTE_DIRECTORY) = FILE_ATTRIBUTE_DIRECTORY then
      Result := Result + [saDirectory];

{ // ToDo ?
    if (Attr and FILE_ATTRIBUTE_TEMPORARY) = FILE_ATTRIBUTE_TEMPORARY then
      Result := Result + [saTemporary];
    if (Attr and FILE_ATTRIBUTE_COMPRESSED) = FILE_ATTRIBUTE_COMPRESSED then
      Result := Result + [saCompressed];
    if (Attr and FILE_ATTRIBUTE_OFFLINE) = FILE_ATTRIBUTE_OFFLINE then
      Result := Result + [saOffline];
}      
   end;
end;

procedure TdcCustomDiskScanner.ProcessFoundFile(Data: TWin32FindData);
var
  Res: Integer;
  ShInfo: TShFileInfo;
begin
  FFiles.Add(CurrentFolder + Data.cFileName);
  
  { 64-bit filesize for files over 2gb }
  with Data do
    FileSize := Int2x32ToExt(nFileSizeHigh, nFileSizeLow);

  Inc(ITotalFiles);
  ITotalSize := ITotalSize + FileSize;

  if Assigned(FOnFileFound) then
   begin
    if FUseIcons then
     begin
      ShGetFileInfo(PChar(CurrentFile), 0, ShInfo, SizeOf(TShFileInfo), SHGFI_ICON or SHGFI_LARGEICON);
      tmpLIcon.Handle := ShInfo.hIcon;
      Res := ShGetFileInfo(PChar(CurrentFile), 0, ShInfo, SizeOf(TShFileInfo), SHGFI_ICON or SHGFI_SMALLICON or SHGFI_TYPENAME or SHGFI_SYSICONINDEX);
      tmpSIcon.Handle := ShInfo.hIcon;
     end
    else
     begin
      Res := ShGetFileInfo(PChar(CurrentFile), 0, ShInfo, SizeOf(TShFileInfo), SHGFI_TYPENAME or SHGFI_SYSICONINDEX);
      tmpLIcon.Handle := 0;
      tmpSIcon.Handle := 0;
     end;

    if Res <> 0 then
     begin
      FileType := ShInfo.szTypeName;
      SysImageIndex := ShInfo.iIcon;
     end
    else
     { Couldn't get file info for some reason??
       Unfortunately, this problem happends if
       whe trying to scan files in the "Recycle.bin" }
     with TdcFileAssociation.Create(nil) do
      try
        EXTENSION := ExtractFileExt(Data.cFileName);
        FileType := FileDescription;
        SysImageIndex := 0;

        if FUseIcons then
         begin
          tmpLIcon.Assign(LargeIcon);
          tmpSIcon.Assign(SmallIcon);
         end;
      finally
        Free;
      end;

    FileTime := UTCFileTimeToDateTime(Data.ftLastWriteTime);
    FileAttributes := AttrToScanAttributes(Data.dwFileAttributes);

    if not FThread.Terminated then
      FThread.Synchronize(DoFileFound);
   end;

  if FMatches.FLimited and (ITotalFiles = FMatches.FMaxMatches) then Stop;
end;

{ properties }
function  TdcCustomDiskScanner.GetBusy: Boolean;
begin
  Result := FThread.Running;
end;

procedure TdcCustomDiskScanner.SetSearchAttributes(Value: TdcScanAttributes);
begin
  if FSearchAttributes <> Value then
   begin
    if not (saAny in FSearchAttributes) and (saAny in Value) then
     begin
      FSearchAttributes := [saNormal, saArchive, saReadOnly, saHidden, saSystem, saDirectory, saAny];
      Exit;
     end;

    if (saAny in FSearchAttributes) and (saAny in Value) and
       (not (saReadOnly in Value) or not (saHidden in Value) or
        not (saSystem in Value) or not (saDirectory in Value) or
        not (saArchive in Value) or not (saNormal in Value)) then
     Value := Value - [saAny]
    else
     if not (saAny in FSearchAttributes) and not (saAny in Value) and
        (saReadOnly in Value) and (saHidden in Value) and
        (saSystem in Value) and (saDirectory in Value) and
        (saDirectory in Value) and (saNormal in Value) then
      Value := Value + [saAny];

    FSearchAttributes := Value;
   end;
end;

function  TdcCustomDiskScanner.GetSuspended: Boolean;
begin
  Result := FThread.Suspended;
end;

procedure TdcCustomDiskScanner.SetSuspended(Value: Boolean);
begin
  FThread.Suspended := Value;
end;

function  TdcCustomDiskScanner.GetThreadPriority: TThreadPriority;
begin
  Result := FThread.Priority;
end;

procedure TdcCustomDiskScanner.SetThreadPriority(Value: TThreadPriority);
begin
  FThread.Priority := Value;
end;

function  TdcCustomDiskScanner.GetWaitThread: Boolean;
begin
  Result := FThread.WaitThread;
end;

procedure TdcCustomDiskScanner.SetWaitThread(Value: Boolean);
begin
  FThread.WaitThread := Value;
end;


// DiskScanner
constructor TdcDiskScanner.Create(aOwner: TComponent);
begin
  inherited;

  FFolder := C_ROOT_DIR;
  FIncludeSubfolders := True;
  FSearchMask := AST_DOT_AST;
end;

procedure TdcDiskScanner.ThreadExecute(Sender: TObject);
var
  Masks: TStringList;

  procedure ScanFolder(const SFolder: String);
  var
    I: Integer;
    FindHandle: THandle;
    FindData: TWin32FindData;

    procedure ScanMask(const SMask: String);
    begin
      FindHandle := FindFirstFile(PChar(SFolder + SMask), FindData);
      if FindHandle <> INVALID_HANDLE_VALUE then
       try
         repeat
           CurrentFile := SFolder + FindData.cFileName;
           if IsGoodFile(FindData) then ProcessFoundFile(FindData);
         until not FindNextFile(FindHandle, FindData) or FThread.Terminated
       finally
         Windows.FindClose(FindHandle);
       end;
    end;

    procedure ScanFolders;
    begin
      FindHandle := FindFirstFile(PChar(SFolder + AST_DOT_AST), FindData);
      if FindHandle <> INVALID_HANDLE_VALUE then
       try
         repeat
           CurrentFile := SFolder + FindData.cFileName;
           if IsDirectory(FindData) and
              IsGoodAttributes(FindData) and
              IsGoodFileName(FindData) then
             ProcessFoundFile(FindData);
         until not FindNextFile(FindHandle, FindData) or FThread.Terminated
       finally
         Windows.FindClose(FindHandle);
       end;
    end;

  begin
    CurrentFolder := SFolder;
      
    // Current Folder
    if Assigned(FOnScanFolder) then
     begin
      if FThread.Terminated then Exit;
      FThread.Synchronize(DoScanFolder);
     end;

    // Folders (even those which does not match to search mask)
    if FFindAllFolders and (saDirectory in FSearchAttributes) then
      ScanFolders;

    // Files
    for I := 0 to Masks.Count - 1 do
      ScanMask(Masks[I]);

    if FThread.Terminated then Exit;

    // Scan Directories
    if FIncludeSubfolders then
     begin
      FindHandle := FindFirstFile(PChar(SFolder + AST_DOT_AST), FindData);
      if FindHandle <> INVALID_HANDLE_VALUE then
       try
         repeat
           CurrentFile := SFolder + FindData.cFileName;
           if IsDirectory(FindData) and
              IsGoodFileName(FindData) then
            begin
             if IsHidden(FindData) and not FIncludeHiddenSubfolders then Continue;
             if not FThread.Terminated then
               ScanFolder(CurrentFile + '\');
            end; 
         until not FindNextFile(FindHandle, FindData) or FThread.Terminated
       finally
         Windows.FindClose(FindHandle);
       end; 
     end;
  end;

begin
  inherited;
  Masks := TStringList.Create;
  try
    SplitSemicolons(FSearchMask, Masks);
    MultiFind := (Masks.Count > 1) or FFindAllFolders;
    ScanFolder(IncludeTrailingBackslash(FFolder));
  finally
    Masks.Free;
  end;  
end;

procedure TdcDiskScanner.SetFolder(const Value: String);
begin
  if FFolder <> Value then
   begin
    if Value = '' then
     begin
      FFolder := '';
      Exit;
     end;

{  // commented to support UNC pathes

    if Length(Value) > 3 then
      Value := ExcludeTrailingBackslash(Value);

  if (Value[2] <> ':') and (Value[3] <> '\') then
      raise Exception.Create('Disk Letter is not specified.');

    if not DirectoryExists(Value) then
      raise Exception.Create('Folder does not exists.');}

    FFolder := Value;
   end;
end;


// DiskScannerPath
constructor TDiskScannerPath.Create(const aPathMask: String; aIncludeSubfolders: Boolean);
begin
  inherited Create;
  FPathMask := aPathMask;
  FIncludeSubfolders := aIncludeSubfolders;
end;


// DiskScanList
procedure TDiskScanList.AddPath(PathMask: String; IncludeSubfolders: Boolean);
var
  DiskScannerPath: TDiskScannerPath;
begin
  DiskScannerPath := TDiskScannerPath.Create(PathMask, IncludeSubfolders);
  Add(DiskScannerPath);
end;

function TDiskScanList.LoadFromFile(const FileName: String): Boolean; // returns True if successfull
var
  I: Integer;
  St, Params: String;
  StrList: TStringList;
begin
  Result := True;
  StrList := TStringList.Create;
  try
    try
      StrList.LoadFromFile(FileName);
    except
      Result := False;
    end;
    if Result then
     begin
      I := StrList.Count;
      if I <> 0 then
       for I := 0 to I - 1 do
        begin
         St := StrList[I];
         SplitFileNameAndParams(St, Params); { splits the path and params }
         AddPath(St, Params = '/+');
        end;
     end;
  finally
    StrList.Free;
  end;  
end;

function TDiskScanList.SaveToFile(const FileName: String): Boolean; // returns True if successfull
var
  I: Integer;
  St: String;
  StrList: TStringList;
begin
  Result := True;
  StrList := TStringList.Create;
  try
    { filling the string list with items }
    if Count <> 0 then
     for I := 0 to Count - 1 do
      with TDiskScannerPath(Items[I]) do
       begin
        St := FPathMask;
        if FIncludeSubfolders then St := St + ' /+';
        StrList.Add(St);
       end;

    { saving the list to file }
    try
      StrList.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    StrList.Free;
  end;  
end;


// TDiskScanList
function TDiskScanList.Get(Index: Integer): TDiskScannerPath;
begin
  Result := inherited Get(Index);
end;

procedure TDiskScanList.Put(Index: Integer; Item: TDiskScannerPath);
begin
  inherited Put(Index, Item);
end;


// MultiDiskScanner
constructor TdcMultiDiskScanner.Create(aOwner: TComponent);
begin
  inherited;

  FIncludeList := TDiskScanList.Create;
  FExcludeList := TDiskScanList.Create;
  FPreExcludedList := TStringList.Create;
  FExcludedWithoutPath := TStringList.Create;
end;

destructor TdcMultiDiskScanner.Destroy;
begin
  FExcludedWithoutPath.Free;
  FPreExcludedList.Free;
  FExcludeList.Free;
  FIncludeList.Free;

  inherited;
end;

procedure TdcMultiDiskScanner.ReadData(Stream: TStream);
var
  I, J: Integer;
  St: String;
  B: Boolean;
begin
  Stream.Read(I, SizeOf(I));
  if I <> 0 then
   for I := 0 to I - 1 do
    begin
     { read path }
     Stream.Read(J, SizeOf(J));
     SetLength(St, J);
     Stream.Read(St[1], J);
     { read subfolders flag }
     Stream.Read(B, SizeOf(B));     
     { add to the list }
     FIncludeList.AddPath(St, B);
    end;

  Stream.Read(I, SizeOf(I));
  if I <> 0 then
   for I := 0 to I - 1 do
    begin
     { read path }
     Stream.Read(J, SizeOf(J));
     SetLength(St, J);
     Stream.Read(St[1], J);
     { read subfolders flag }
     Stream.Read(B, SizeOf(B));
     { add to the list }
     FExcludeList.AddPath(St, B);
    end;
end;

procedure TdcMultiDiskScanner.WriteData(Stream: TStream);
var
  I, J: Integer;
begin
  I := FIncludeList.Count;
  Stream.Write(I, SizeOf(I));
  if I <> 0 then
   for I := 0 to I - 1 do
    with TDiskScannerPath(FIncludeList[I]) do
     begin
      J := Length(FPathMask);
      Stream.Write(J, SizeOf(J));
      Stream.Write(FPathMask[1], J);

      Stream.Write(FIncludeSubfolders, SizeOf(FIncludeSubfolders));
     end;

  I := FExcludeList.Count;
  Stream.Write(I, SizeOf(I));
  if I <> 0 then
   for I := 0 to I - 1 do
    with TDiskScannerPath(FExcludeList[I]) do
     begin
      J := Length(FPathMask);
      Stream.Write(J, SizeOf(J));
      Stream.Write(FPathMask[1], J);

      Stream.Write(FIncludeSubfolders, SizeOf(FIncludeSubfolders));
     end;
end;

procedure TdcMultiDiskScanner.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineBinaryProperty('ScannerLists', ReadData, WriteData, (FIncludeList.Count <> 0) or (FExcludeList.Count <> 0));
end;

procedure TdcMultiDiskScanner.ThreadExecute(Sender: TObject);

  procedure ScanFolder(const SFolder, SMask: String; IncludeSubfolders: Boolean; IsInclude: Boolean);
  var
    I: Integer;
    ExMask: String;
    FindHandle: THandle;
    FindData: TWin32FindData;

    procedure FileIsFound(QuickExclude: Boolean); {QuickExclude means exlusion for entries without path}
    var
      I: Integer;
      LCaseName: String;
    begin
      LCaseName := AnsiLowerCase(CurrentFile);
      
      if IsInclude then
       begin
        for I := 0 to FPreExcludedList.Count - 1 do
         if FPreExcludedList[I] = LCaseName then Exit;
       end;

      if IsInclude and not QuickExclude then
        ProcessFoundFile(FindData)
      else
        FPreExcludedList.Add(LCaseName);
    end;

  begin
    // Current Folder
    CurrentFolder := SFolder;
    if Assigned(FOnScanFolder) then
     begin
      if FThread.Terminated then Exit;
      FThread.Synchronize(DoScanFolder);
     end;

    // Excluding files without path
    if IsInclude then
     begin
      I := FExcludedWithoutPath.Count;
      if I <> 0 then
       for I := 0 to I - 1 do
        begin
         if FThread.Terminated then Exit;
         
         ExMask := FExcludedWithoutPath[I];
         FindHandle := FindFirstFile(PChar(SFolder + ExMask), FindData);
         if FindHandle <> INVALID_HANDLE_VALUE then
          try
            repeat
              CurrentFile := SFolder + FindData.cFileName;
              if IsGoodFile(FindData) then FileIsFound(True);
            until not FindNextFile(FindHandle, FindData) or FThread.Terminated
          finally
            Windows.FindClose(FindHandle);
          end;
        end;  
     end;

    if FThread.Terminated then Exit;

    // Files
    FindHandle := FindFirstFile(PChar(SFolder + SMask), FindData);
    if FindHandle <> INVALID_HANDLE_VALUE then
     try
       repeat
         CurrentFile := SFolder + FindData.cFileName;
         if IsGoodFile(FindData) then FileIsFound(False);
       until not FindNextFile(FindHandle, FindData) or FThread.Terminated
     finally
       Windows.FindClose(FindHandle);
     end;

    if FThread.Terminated then Exit;

    // Scan Directories
    if IncludeSubfolders then
     begin
      FindHandle := FindFirstFile(PChar(SFolder + AST_DOT_AST), FindData);
      if FindHandle <> INVALID_HANDLE_VALUE then
       try
         repeat
           CurrentFile := SFolder + FindData.cFileName;
           if IsDirectory(FindData) and
              IsGoodFileName(FindData) then
             ScanFolder(CurrentFile + '\', SMask, IncludeSubfolders, IsInclude);
          until not FindNextFile(FindHandle, FindData) or FThread.Terminated
       finally
         Windows.FindClose(FindHandle);
       end;  
     end;
  end;

  procedure ProcessList(List: TList; IsInclude: Boolean);
  var
    I, J: Integer;
    ScannerPath: TDiskScannerPath;
    Path, Mask: String;
  begin
    I := List.Count;
    if I <> 0 then
     for I := 0 to I - 1 do
      begin
       ScannerPath := List[I];
       Path := ScannerPath.PathMask;
       J := Length(Path);
       if J <> 0 then
        begin
         for J := 1 to J do
          if Path[J] = '/' then Path[J] := '\';

         Mask := ExtractFileName(Path);
         Path := ExtractFilePath(Path);

         { if doesn't contain the path info }
         if not IsInclude and (Pos('\', Path) = 0) and (Pos(':', Path) = 0) then
          begin
           FExcludedWithoutPath.Add(Path + Mask);
           Continue;
          end;
         Path := GetCorrectDirName(Path); // see notes to IncludeList in the .hlp

         if IsUNCPath(Path) or DirectoryExists(Path) then
           ScanFolder(Path, Mask, ScannerPath.IncludeSubfolders, IsInclude)
         else
          begin
           CurrentFolder := Path;
           if FThread.Terminated then Exit;
           FThread.Synchronize(DoFolderNotExist);
          end;
        end;
      end;
  end;

begin
  inherited;
  FPreExcludedList.Clear;
  FExcludedWithoutPath.Clear;

  { ** Filling the ExcludeLists ** }
  if Assigned(FOnExcludingBegin) then
    FOnExcludingBegin(Self);

  ProcessList(FExcludeList, False);

  if Assigned(FOnExcludingEnd) then
    FOnExcludingEnd(Self);
  { ** Excluding done ** }

  if FThread.Terminated then Exit;

  MultiFind := FIncludeList.Count > 1;
  { searching by IncludeList }
  ProcessList(FIncludeList, True);
end;

procedure TdcMultiDiskScanner.ThreadDone(Sender: TObject);
begin
  inherited;
  FExcludedWithoutPath.Clear;
  FPreExcludedList.Clear;
end;

end.
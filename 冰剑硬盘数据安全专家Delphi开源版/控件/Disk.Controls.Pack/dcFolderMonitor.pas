{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcFolderMonitor.pas - dcFolderMonitor component

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

unit dcFolderMonitor;

interface

uses
  Windows, Classes, Controls, Graphics,
  dcInternal, dcThread;

type
  TdcFolderMonitorFilter = (fmFileName, fmDirName, fmAttributes, fmSize,
                            fmWrite, fmAccess, fmSecurity);
  TdcFolderMonitorFilters = set of TdcFolderMonitorFilter;

  TdcFolderMonitor = class(TumdcComponent)
  private
    FFilter: TdcFolderMonitorFilters;
    FFolder: String;
    FActive: Boolean;

    FOnChange: TNotifyEvent;

    { for internal use }
    FThread: TdcCustomThread;
    FMutex: Integer;
    FNotifyFilter: DWord;

    procedure SetActive(Value: Boolean);
    procedure SetFilter(Value: TdcFolderMonitorFilters);
    procedure SetFolder(Value: String);
    function  GetThreadPriority: TThreadPriority;
    procedure SetThreadPriority(Value: TThreadPriority);

    procedure UpdateNotifyFilters;
  protected
    procedure ThreadExecute(Sender: TObject); virtual;

    procedure DoChange; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property Thread: TdcCustomThread read FThread;
  published
    property About;
    property Active: Boolean read FActive write SetActive default False;
    property Filter: TdcFolderMonitorFilters read FFilter write SetFilter default [fmFileName, fmDirName, fmSize, fmWrite];
    property Folder: String read FFolder write SetFolder;
    property ThreadPriority: TThreadPriority read GetThreadPriority write SetThreadPriority default tpIdle;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

implementation

uses SysUtils, dcUtils;

{$IFNDEF D3}
const
  FILE_NOTIFY_CHANGE_LAST_ACCESS = $00000020;
{$ENDIF}

type
  PdcFolderMonitorFileRec = ^TdcFolderMonitorFileRec;
  TdcFolderMonitorFileRec = record
    FileName: String;
    IsFolder: Boolean;
    Size: Integer;
    Attr: Integer;
    LastWrite, LastAccess: TFileTime;
  end;

{ TdcFolderMonitor }
constructor TdcFolderMonitor.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FThread := TdcCustomThread.Create(Self);
  FThread.Priority := tpIdle;
  FThread.OnExecute := ThreadExecute;
  FMutex := CreateMutex(nil, True, nil);
  WaitForSingleObject(FMutex, INFINITE);    

  FFilter := [fmFileName, fmDirName, fmSize, fmWrite];
  UpdateNotifyFilters;  
end;

destructor TdcFolderMonitor.Destroy;
begin
  FThread.Free;
  ReleaseMutex(FMutex);  
  inherited Destroy;
end;

procedure TdcFolderMonitor.ThreadExecute(Sender: TObject);
var
  ObjStatus: DWord;
  Handles: Array[0..1] of DWORD;
begin
  Handles[0] := FindFirstChangeNotification(PChar(FFolder), False, FNotifyFilter);
  if Handles[0] <> ERROR_INVALID_HANDLE then
   try
     while not FThread.Terminated do
      begin
       Handles[1] := FMutex;
       ObjStatus := WaitForMultipleObjects(2, @Handles, False, INFINITE);
       case ObjStatus of
         WAIT_OBJECT_0: begin
                         FThread.Synchronize(DoChange);
                         if not FindNextChangeNotification(Handles[0]) then Exit;
                        end;
         WAIT_OBJECT_0 + 1: ReleaseMutex(FMutex);
         WAIT_FAILED: Exit;
        end;
      end;
   finally
     FindCloseChangeNotification(Handles[0]);
   end;
end;

procedure TdcFolderMonitor.DoChange;
begin
  if not FThread.Terminated and Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TdcFolderMonitor.UpdateNotifyFilters;
begin
  { converting to DWord value of notification filter }
  FNotifyFilter := 0;
  if fmFileName in FFilter then
    FNotifyFilter := (FNotifyFilter or FILE_NOTIFY_CHANGE_FILE_NAME);
  if fmDirName in FFilter then
    FNotifyFilter := (FNotifyFilter or FILE_NOTIFY_CHANGE_DIR_NAME);
  if fmAttributes in FFilter then
    FNotifyFilter := (FNotifyFilter or FILE_NOTIFY_CHANGE_ATTRIBUTES);
  if fmSize in FFilter then
    FNotifyFilter := (FNotifyFilter or FILE_NOTIFY_CHANGE_SIZE);
  if fmWrite in FFilter then
    FNotifyFilter := (FNotifyFilter or FILE_NOTIFY_CHANGE_LAST_WRITE);
  if fmAccess in FFilter then
    FNotifyFilter := (FNotifyFilter or FILE_NOTIFY_CHANGE_LAST_ACCESS);
  if fmSecurity in FFilter then
    FNotifyFilter := (FNotifyFilter or FILE_NOTIFY_CHANGE_SECURITY);
end;

procedure TdcFolderMonitor.SetActive(Value: Boolean);
begin
  if FActive <> Value then
   begin
    FActive := Value;

    if not (csDesigning in ComponentState) then
      if FActive then FThread.Execute
      else FThread.Terminate(False);
   end;
end;

procedure TdcFolderMonitor.SetFilter(Value: TdcFolderMonitorFilters);
begin
  if FFilter <> Value then
   begin
    FFilter := Value;
    UpdateNotifyFilters;
    if not (csDesigning in ComponentState) then
      if FActive then FThread.Execute
      else FThread.Terminate(False);
   end;
end;

procedure TdcFolderMonitor.SetFolder(Value: String);
begin
  if FFolder <> Value then
   begin
    if Value = '' then
     begin
      FFolder := '';
      Exit;
     end;

    if Length(Value) > 3 then
      Value := ExcludeTrailingBackslash(Value);

    if (Value[2] <> ':') and (Value[3] <> '\') then
      raise Exception.Create('Disk Letter is not specified.');

    if not DirectoryExists(Value) then
      raise Exception.Create('Folder does not exists.');

    FFolder := Value;
   end;
end;

function  TdcFolderMonitor.GetThreadPriority: TThreadPriority;
begin
  Result := FThread.Priority;
end;

procedure TdcFolderMonitor.SetThreadPriority(Value: TThreadPriority);
begin
  FThread.Priority := Value;
end;

end.


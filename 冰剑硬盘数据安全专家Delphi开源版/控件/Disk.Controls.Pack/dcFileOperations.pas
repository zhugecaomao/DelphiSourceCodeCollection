{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcFileOperations.pas - dcFileOperations component

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

unit dcFileOperations;

interface

uses
  Windows, Classes, Controls, 
  dcInternal;

type
  TdcFileOperationsType = (foCopy, foDelete, foMove, foRename);
  TdcFileOperationsOptions = set of (fofAllowUndo, fofFilesOnly, fofNoConfirmation,
                                         fofNoConfirmMkDir, fofNoErrorUI, fofRenameCollision, fofSilent,
                                         fofSimpleProgress, fofCreateDestFolder);
  TdcFileOperationsEvent = procedure(Sender: TObject; const S: String) of object;

  TdcFileOperations = class(TumdcComponent)
  private
    FFileList: TStrings;
    FDestFolder: String;
    FProgressTitle: String;
    FOperation: TdcFileOperationsType;
    FOptions: TdcFileOperationsOptions;
    
    FOnError: TdcFileOperationsEvent;
    
    procedure SetFileList(const Value: TStrings);
  protected
    function ExecuteOperation(OperationType: TdcFileOperationsType): Boolean; virtual;
    function GetSystemError(ErrorCode: Integer): String; virtual;
    procedure Error(const S: String); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function Execute: Boolean; virtual;
    function Copy: Boolean;
    function Delete: Boolean;
    function Move: Boolean;
    function Rename: Boolean;
  published
    property About;

    property FileList: TStrings read FFileList write SetFileList;
    property DestFolder: String read FDestFolder write FDestFolder;
    property ProgressTitle: String read FProgressTitle write FProgressTitle;
    property Operation: TdcFileOperationsType read FOperation write FOperation default foCopy;
    property Options: TdcFileOperationsOptions read FOptions write FOptions default [fofAllowUndo, fofFilesOnly, fofRenameCollision, fofCreateDestFolder];

    property OnError: TdcFileOperationsEvent read FOnError write FOnError;
  end;

implementation

uses SysUtils, ShellAPI, dcUtils;

{$IFNDEF D3}
const
  FOF_NOERRORUI = $0400;
{$ENDIF}

constructor TdcFileOperations.Create(AOwner: TComponent);
begin
  inherited;
  FOperation := foCopy;
  FOptions := [fofAllowUndo, fofFilesOnly, fofRenameCollision, fofCreateDestFolder];
  FFileList := TStringList.Create;
end;

destructor TdcFileOperations.Destroy;
begin
  FFileList.Free;
  FFileList := nil;
  inherited;
end;


function TdcFileOperations.ExecuteOperation(OperationType: TdcFileOperationsType): Boolean;
var
  SHFileOpStruct: TSHFileOpStruct;
  MultipleFiles: Boolean;
  SourceStr, DestStr, ErrStr, SrcName, DstName, St: String;
  i, Position, ARes: Integer;

  procedure FillCharStr(Pch: PChar; const S: String);
  var
    Temp: PChar;
    List: TStrings;
    i, Index: Integer;
  begin
    List := TStringList.Create;
    try
      List.CommaText := S;
      Index := 0;
      for i := 0 to List.Count -1 do
       if List[i] <> '' then
        begin
         Temp := PChar(List[i]);
         System.Move(Temp^ , Pch[Index], Length(Temp));
         Inc(Index, Length(Temp) + 1);
        end;
    finally
      List.Free;
    end;
  end;

begin
  Result := False;
  if FFileList.Count = 0 then Exit;

  with SHFileOpStruct do
  begin
    if (Owner is TWinControl) then Wnd := TWinControl(Owner).Handle
    else Wnd := 0{Application.Handle};
    case OperationType of
      foCopy  : wFunc := FO_COPY;
      foDelete: wFunc := FO_DELETE;
      foMove  : wFunc := FO_MOVE;
      foRename: wFunc := FO_RENAME;
    end;
  { Prepare fFlags}
    MultipleFiles := (OperationType <> foDelete) and (Pos('=', FFileList.Text) > 0);
    fFlags := 0;
    if fofAllowUndo in FOptions       then fFlags := fFlags or FOF_ALLOWUNDO;
    if fofFilesOnly in FOptions       then fFlags := fFlags or FOF_FILESONLY;
    if fofNoConfirmation in FOptions  then fFlags := fFlags or FOF_NOCONFIRMATION;
    if fofNoConfirmMkDir in FOptions  then fFlags := fFlags or FOF_NOCONFIRMMKDIR;
    if fofNoErrorUI in FOptions       then fFlags := fFlags or FOF_NOERRORUI;
    if fofRenameCollision in FOptions then fFlags := fFlags or FOF_RENAMEONCOLLISION;
    if fofSilent in FOptions          then fFlags := fFlags or FOF_SILENT;
    if fofSimpleProgress in FOptions  then fFlags := fFlags or FOF_SIMPLEPROGRESS;
    if MultipleFiles                  then fFlags := fFlags or FOF_MULTIDESTFILES;
  { Set other fields }
    fAnyOperationsAborted := False;
    hNameMappings := nil;
    lpszProgressTitle := PChar(FProgressTitle);
  { Prepare Source and if it is needed Destination strings }
    SourceStr := '';
    DestStr := '';
    with FFileList do
     for I := 0 to Count - 1 do
      begin
       if MultipleFiles then
        begin
         Position := Pos('=', Strings[I]);
         if Position <= 0 then Position := MaxInt - 1;
         SrcName := System.Copy(Strings[I], 1, Position - 1);
         DstName := System.Copy(Strings[I], Position + 1, MaxInt);
         DestStr := DestStr + DstName + ',';
         SourceStr := SourceStr + SrcName + ',';
        end
       else SourceStr := SourceStr + Strings[I] + ',';
      end;

    { Prepare string buffers }
    I := Length(FFileList.Text) + FFileList.Count + 1;
    GetMem(pFrom, I);
    try
      FillChar(pFrom^, I, 0);
      if MultipleFiles then I := Length(DestStr) + FFileList.Count + 1
      else I := Length(FDestFolder) + 2; // must be double null terminated
      GetMem(pTo, I);
      try
        FillChar(pTo^, I, 0);
        FillCharStr(pFrom, SourceStr);
        if MultipleFiles then FillCharStr(pTo, DestStr)
        else StrCopy(pTo, PChar(FDestFolder));
        ErrStr := '';

        if fofCreateDestFolder in FOptions then
          ForceDirectories(FDestFolder);

        ARes := SHFileOperation(SHFileOpStruct);
        if (ARes <> 0) and (ARes <> ERROR_NO_MORE_FILES) then
         begin
          ErrStr := GetSystemError(ARes);
          Error(ErrStr);
         end;

        { Test is the file(s) has been successfully deleted }
        if OperationType = foDelete then
         for I := 0 to FFileList.Count - 1 do
          begin
           St := FFileList[I];
           if (St[1] = '"') and (St[Length(St)] = '"') then
            begin
             System.Delete(St, 1, 1);
             SetLength(St, Length(St) - 1);
            end;
           if ObjectExists(St) then
            begin
             ARes := -1;
             Break;
            end;
          end;
      finally
        FreeMem(pTo);
      end;
    finally
      FreeMem(pFrom);
    end;
  end;
  Result := ARes = 0;
end;


function TdcFileOperations.Execute: Boolean;
begin
  Result := ExecuteOperation(Operation);
end;

function TdcFileOperations.Copy: Boolean;
begin
  Result := ExecuteOperation(foCopy);
end;

function TdcFileOperations.Delete: Boolean;
begin
  Result := ExecuteOperation(foDelete);
end;

function TdcFileOperations.Move: Boolean;
begin
  Result := ExecuteOperation(foMove);
end;

function TdcFileOperations.Rename: Boolean;
begin
  Result := ExecuteOperation(foRename);
end;


function TdcFileOperations.GetSystemError(ErrorCode: Integer): string;
var
  Buff: Array[0..1023] of Char;
begin
  Result := '';
  if ErrorCode = 0 then Exit;
  FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, nil, ErrorCode, 0, Buff,
    SizeOf(Buff), nil);
  Result := Buff;
end;

procedure TdcFileOperations.Error(const S: String);
begin
  if Assigned(FOnError) then FOnError(Self, S);
end;

procedure TdcFileOperations.SetFileList(const Value: TStrings);
begin
  FFileList.Assign(Value);
end;

end.
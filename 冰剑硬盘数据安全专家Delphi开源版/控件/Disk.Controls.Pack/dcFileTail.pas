{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcFileTail.pas - dcFileTail component

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

unit dcFileTail;

interface

uses
  Windows, Messages, Classes, dcInternal, dcThread;

type
  TdcFileTailFileChangedEvent = procedure(Sender: TObject; OldFileSize, NewFileSize: TdcFileSize) of object;
  TdcFileTailFileAppendedEvent = procedure(Sender: TObject; AppendedData: TStream) of object;

  TdcFileTail = class(TumdcComponent)
  private
    FFileName: String;
    FFileSize: TdcFileSize;
    FLastLinesCount: Word;
    FOnFileAppended: TdcFileTailFileAppendedEvent;
    FOnFileChanged: TdcFileTailFileChangedEvent;

    { for internal use }
    FLastLines: TStringList;
    FThread: TdcCustomThread;
    FAppendedData: TMemoryStream;
    FFileSizeLow, FFileSizeHigh: DWord;
    FOldFileSize: TdcFileSize;

    procedure SetFileName(Value: String);
    procedure SetFileSize(Value: TdcFileSize);
    function  GetThreadPriority: TThreadPriority;
    procedure SetThreadPriority(Value: TThreadPriority);
    function  GetLastLines: TStrings;
    procedure SetNoneStrings(Value: TStrings);

    procedure CheckIsModified;
  protected
    procedure Loaded; override;
    procedure ThreadExecute(Sender: TObject); virtual;
    procedure DoFileAppended; virtual;
    procedure DoFileChanged; virtual;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property About;

    property FileName: String read FFileName write SetFileName;
    property FileSize: TdcFileSize read FFileSize write SetFileSize stored False;
    property LastLines: TStrings read GetLastLines write SetNoneStrings;
    property LastLinesCount: Word read FLastLinesCount write FLastLinesCount default 15;
    property ThreadPriority: TThreadPriority read GetThreadPriority write SetThreadPriority default tpIdle;

    property OnFileAppended: TdcFileTailFileAppendedEvent read FOnFileAppended write FOnFileAppended;
    property OnFileChanged: TdcFileTailFileChangedEvent read FOnFileChanged write FOnFileChanged;
  end;

implementation

uses Forms, Consts, SysUtils, dcUtils;

constructor TdcFileTail.Create(aOwner: TComponent);
begin
  inherited;
  FThread := TdcCustomThread.Create(Self);
  FThread.Priority := tpIdle;
  FThread.OnExecute := ThreadExecute;

  FLastLines := TStringList.Create;
  FLastLinesCount := 15;
end;

destructor TdcFileTail.Destroy;
begin
  FLastLines.Free;
  FThread.Free;
  inherited;
end;

procedure TdcFileTail.Loaded;
begin
  inherited;
  if not (csDesigning in ComponentState) then
    FThread.Execute;
end;

procedure TdcFileTail.CheckIsModified;
var
  FindHandle: THandle;
  FindData: TWin32FindData;
begin
  FFileSizeLow := 0;
  FFileSizeHigh := 0;
  if FFileName <> '' then
   begin
    FindHandle := FindFirstFile(PChar(FFileName), FindData);
    if FindHandle <> INVALID_HANDLE_VALUE then
     with FindData do
      begin
       Windows.FindClose(FindHandle);
       {$IFNDEF D4}
       FFileSize := Int2x32ToExt(nFileSizeHigh, nFileSizeLow);
       {$ELSE}
       FFileSize := Int2x32ToInt64(nFileSizeHigh, nFileSizeLow);
       {$ENDIF}
       FFileSizeLow := nFileSizeLow;
       FFileSizeHigh := nFileSizeHigh;
      end
    else
     FFileSize := 0;
   end
  else
   FFileSize := 0;
end;

procedure TdcFileTail.ThreadExecute(Sender: TObject);
var
  FileHandle: THandle;
  OldFileSizeLow, OldFileSizeHigh: DWord;
  DW: DWord;
begin
  while not FThread.Terminated do
   begin
    FOldFileSize := FFileSize;
    OldFileSizeLow := FFileSizeLow;
    OldFileSizeHigh := FFileSizeHigh;

    CheckIsModified;

    if FOldFileSize <> FFileSize then
     begin
      if Assigned(FOnFileChanged) then
        FThread.Synchronize(DoFileChanged);

      // if data appended
      if (FOldFileSize < FFileSize) and Assigned(FOnFileAppended) then
       begin
        FAppendedData := TMemoryStream.Create;
        try
          // read appended block
          FileHandle := CreateFile(PChar(FFileName), GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
                                   OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
          if FileHandle <> INVALID_HANDLE_VALUE then
           begin
            SetFilePointer(FileHandle, OldFileSizeLow, @OldFileSizeHigh, FILE_BEGIN);
            FAppendedData.SetSize({$IFNDEF D4}Round({$ENDIF} FFileSize - FOldFileSize {$IFNDEF D4}){$ENDIF});
            ReadFile(FileHandle, FAppendedData.Memory^, FAppendedData.Size, DW, nil);
            CloseHandle(FileHandle);
           end;

          FThread.Synchronize(DoFileAppended);
        finally
          FAppendedData.Free;
        end;
       end;
     end;
   end;
end;

procedure TdcFileTail.DoFileAppended;
begin
  if not (csDestroying in ComponentState) then
    FOnFileAppended(Self, FAppendedData);
end;

procedure TdcFileTail.DoFileChanged;
begin
  if not (csDestroying in ComponentState) then
    FOnFileChanged(Self, FOldFileSize, FFileSize);
end;

procedure TdcFileTail.SetFileName(Value: String);
begin
  Value := GetCorrectFileName(Value);

  if FFileName <> Value then
   begin
    FFileName := Value;
    CheckIsModified;
   end;
end;

procedure TdcFileTail.SetFileSize(Value: TdcFileSize); begin end;

function  TdcFileTail.GetThreadPriority: TThreadPriority;
begin
  Result := FThread.Priority;
end;

procedure TdcFileTail.SetThreadPriority(Value: TThreadPriority);
begin
  FThread.Priority := Value;
end;

function TdcFileTail.GetLastLines: TStrings;
const
  DATA_BUFFER_SIZE = 1024;
var
  FileHandle: THandle;
  FilePointer: LongInt;
  DW: DWord;

  Data, P: Pointer;
  DataSize: Word;
  IncompleteLine: Boolean;

  procedure InsertLine(const Line: String);
  begin
    if IncompleteLine then
     begin
      FLastLines[0] := Line + FLastLines[0];
      IncompleteLine := False;
     end
    else
      FLastLines.Insert(0, Line);
  end;

begin
  FLastLines.Clear;
  CheckIsModified;
  if (FFileSize <> 0) and (FLastLinesCount <> 0) then
   begin
    FileHandle := CreateFile(PChar(FFileName), GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
                             OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    if FileHandle <> INVALID_HANDLE_VALUE then
     begin
      FilePointer := 0;
      IncompleteLine := False;
      GetMem(Data, DATA_BUFFER_SIZE + 1);
      try
        while True do
         begin
          if FilePointer + DATA_BUFFER_SIZE < FFileSize then
            DataSize := DATA_BUFFER_SIZE
          else
            DataSize := {$IFNDEF D4}Round({$ENDIF} FFileSize {$IFNDEF D4}){$ENDIF} - FilePointer;
          inc(FilePointer, DataSize);

          SetFilePointer(FileHandle, -FilePointer, nil, FILE_END);
          ReadFile(FileHandle, Data^, DataSize, DW, nil);
          Char(Pointer(LongInt(Data) + DataSize)^) := #0; // last byte should be 0 

          // find the line
          P := StrRScan(Data, #10);
          while (P <> nil) and (FLastLines.Count <> FLastLinesCount) do
           begin
            InsertLine(StrPas(Pointer(LongInt(P) + 1)));
            // check string separator
            dec(LongInt(P));
            if Char(P^) <> #13 then // if this is Unix string
              inc(LongInt(P));
            // separate
            Char(P^) := #0;
            // next line
            P := StrRScan(Data, #10);
           end;

          // add last line or break loop 
          if FLastLines.Count = FLastLinesCount then
            Break
          else
           begin
            InsertLine(StrPas(Data));
            IncompleteLine := True;
           end;

          // if we have read entire file then just add last line
          if FilePointer = FFileSize then Break;
         end;
      finally
        FreeMem(Data);
        CloseHandle(FileHandle);
      end;
     end;
   end;
  
  Result := FLastLines;
end;

procedure TdcFileTail.SetNoneStrings(Value: TStrings); begin {} end;

end.
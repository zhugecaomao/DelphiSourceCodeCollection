unit ScriptParser;

interface

uses
  Windows, Classes, SysUtils, Forms, Dialogs, IniFiles;

const
  // 系统宏
  SSysMacroApp = '$(APP)';    // Application 所在路径

type

{ Classes }

  TScriptResult = class;
  TScriptParser = class;
  TMacroManager = class;

{ TScriptParser - 升级脚本分析器 }

  TScriptParser = class(TObject)
  private
    FScriptFileName: string;
    FIniFile: TIniFile;
    FMacroManager: TMacroManager;
    FScriptResult: TScriptResult;

    procedure InitSystemMacros;
    procedure InitScriptMacros;
  public
    constructor Create(const AScriptFileName: string);
    destructor Destroy; override;

    function Parse: Boolean;
    property Result: TScriptResult read FScriptResult;
  end;

{ TScriptResult - 升级脚本分析结果 }

  TScriptActionType = (satUnknown, satExecute, satReplace, satAdd, satDelete);

  TDownloadItem = record
    SourceURL: string;
    DestFile: string;
  end;
  TDownloadItems = array of TDownloadItem;

  TActionItem = record
    ActionType: TScriptActionType;
    FileName1: string;
    FileName2: string;
  end;
  TActionItems = array of TActionItem;

  TScriptResult = class(TObject)
  private
    FNewVersion: string;
    FSupportVer: TStringList;
    FRunFileName: string;
    FDownloadItems: TDownloadItems;
    FActionItems: TActionItems;
  public
    constructor Create;
    destructor Destroy; override;

    property NewVersion: string read FNewVersion;
    property SupportVer: TStringList read FSupportVer;
    property RunFileName: string read FRunFileName;
    property DownloadItems: TDownloadItems read FDownloadItems;
    property ActionItems: TActionItems read FActionItems;
  end;

{ TMacroManager - 宏管理器 }

  PMacroItem = ^TMacroItem;
  TMacroItem = record
    Src: string;
    Dest: string;
  end;

  TMacroManager = class(TObject)
  private
    FItems: TList;
    
    function GetCount: Integer;
    function GetItem(Index: Integer): TMacroItem;
  protected
    function ReplaceString(S, MacroSrc, MacroDest: string): string; virtual;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure Add(const Src, Dest: string);
    procedure Modify(const Src, Dest: string);
    procedure Clear;

    function Replace(const S: string): string;

    property Count: Integer read GetCount;
    property Items[Index: Integer]: TMacroItem read GetItem;
  end;
  
implementation

uses PubUtils;

{ TScriptParser }

constructor TScriptParser.Create(const AScriptFileName: string);
begin
  inherited Create;
  FScriptFileName := AScriptFileName;
  FMacroManager := TMacroManager.Create;
  FScriptResult := TScriptResult.Create;
  InitSystemMacros;
end;

destructor TScriptParser.Destroy;
begin
  FMacroManager.Free;
  FScriptResult.Free;
  inherited;
end;

procedure TScriptParser.InitSystemMacros;
begin
  FMacroManager.Add(SSysMacroApp, ExtractFilePath(Application.ExeName));
end;

procedure TScriptParser.InitScriptMacros;
var
  MacroList: TStringList;
  Name, Value: string;
  I: Integer;
begin
  MacroList := TStringList.Create;
  try
    FIniFile.ReadSectionValues('MACRO', MacroList);
    for I := 0 to MacroList.Count - 1 do
    begin
      Name := Format('$(%s)', [Trim(MacroList.Names[I])]);
      Value := MacroList.ValueFromIndex[I];
      Value := FMacroManager.Replace(Value);
      FMacroManager.Add(Trim(Name), Trim(Value));
    end;
  finally
    MacroList.Free;
  end;
end;

function TScriptParser.Parse: Boolean;

  // [RUN]
  procedure ParseRUN;
  begin
    FScriptResult.FRunFileName := FIniFile.ReadString('RUN', 'RUN', '');
    FScriptResult.FRunFileName := FMacroManager.Replace(FScriptResult.FRunFileName);
  end;

  // [VERSION]
  procedure ParseVERSION;
  var
    S: string;
    I: Integer;
  begin
    FScriptResult.FNewVersion := FIniFile.ReadString('VERSION', 'VERSION', '');
    S := FIniFile.ReadString('VERSION', 'SUPPORT', '');
    SplitString(S, ',', FScriptResult.FSupportVer);
    for I := 0 to FScriptResult.FSupportVer.Count - 1 do
      FScriptResult.FSupportVer[I] := Trim(FScriptResult.FSupportVer[I]);
  end;

  // [DOWNLOAD]
  procedure ParseDOWNLOAD;
  var
    Lines, Parts: TStringList;
    SourceURL, DestFile: string;
    I: Integer;
  begin
    Lines := TStringList.Create;
    Parts := TStringList.Create;
    try
      SetLength(FScriptResult.FDownloadItems, 0);
      FIniFile.ReadSectionValues('DOWNLOAD', Lines);
      for I := 0 to Lines.Count - 1 do
        Lines[I] := Lines.ValueFromIndex[I];

      for I := 0 to Lines.Count - 1 do
      begin
        SplitString(Lines[I], ',', Parts);
        if Parts.Count = 2 then
        begin
          SourceURL := FMacroManager.Replace(Trim(Parts[0]));
          DestFile := FMacroManager.Replace(Trim(Parts[1]));

          with FScriptResult do
          begin
            SetLength(FDownloadItems, Length(FDownloadItems) + 1);
            FDownloadItems[High(FDownloadItems)].SourceURL := SourceURL;
            FDownloadItems[High(FDownloadItems)].DestFile := DestFile;
          end;
        end;
      end;
    finally
      Lines.Free;
      Parts.Free;
    end;
  end;

  // [ACTION]
  procedure ParseACTION;
  var
    Lines, Parts: TStringList;
    ActTypeStr, FileName1, FileName2: string;
    I, J, K: Integer;
  begin
    Lines := TStringList.Create;
    Parts := TStringList.Create;
    try
      FIniFile.ReadSectionValues('ACTION', Lines);
      SetLength(FScriptResult.FActionItems, Lines.Count);

      for I := 0 to Lines.Count - 1 do
      begin
        J := Pos('=', Lines[I]);
        if J > 0 then
        begin
          ActTypeStr := Trim(Copy(Lines[I], 1, J - 1));
          Lines[I] := Copy(Lines[I], J + 1, MaxInt);

          K := Pos(' ', ActTypeStr);
          if K > 0 then ActTypeStr := Copy(ActTypeStr, K + 1, MaxInt);
          if SameText(ActTypeStr, 'EXECUTE') then
            FScriptResult.FActionItems[I].ActionType := satExecute
          else if SameText(ActTypeStr, 'REPLACE') then
            FScriptResult.FActionItems[I].ActionType := satReplace
          else if SameText(ActTypeStr, 'ADD') then
            FScriptResult.FActionItems[I].ActionType := satAdd
          else if SameText(ActTypeStr, 'DELETE') then
            FScriptResult.FActionItems[I].ActionType := satDelete
          else
            FScriptResult.FActionItems[I].ActionType := satUnknown;
        end;
      end;

      for I := 0 to Lines.Count - 1 do
      begin
        SplitString(Lines[I], ',', Parts);

        FileName1 := '';
        FileName2 := '';
        if Parts.Count >= 1 then
          FileName1 := FMacroManager.Replace(Trim(Parts[0]));
        if Parts.Count >= 2 then
          FileName2 := FMacroManager.Replace(Trim(Parts[1]));

        with FScriptResult do
        begin
          FActionItems[I].FileName1 := FileName1;
          FActionItems[I].FileName2 := FileName2;
        end;
      end;
    finally
      Lines.Free;
      Parts.Free;
    end;
  end;

begin
  try
    Result := True;
    FIniFile := TIniFile.Create(FScriptFileName);
    try
      InitScriptMacros;
      ParseRUN;
      ParseVERSION;
      ParseDOWNLOAD;
      ParseACTION;
    finally
      FIniFile.Free;
    end;
  except
    Result := False;
  end;
end;

{ TScriptResult }

constructor TScriptResult.Create;
begin
  inherited;
  FSupportVer := TStringList.Create;
end;

destructor TScriptResult.Destroy;
begin
  FSupportVer.Free;
  inherited;
end;

{ TMacroManager }

constructor TMacroManager.Create;
begin
  inherited;
  FItems := TList.Create;
end;

destructor TMacroManager.Destroy;
begin
  Clear;
  FItems.Free;
  inherited;
end;

function TMacroManager.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TMacroManager.GetItem(Index: Integer): TMacroItem;
begin
  if (Index >= 0) and (Index < FItems.Count) then
  begin
    Result := PMacroItem(FItems[Index])^;
  end else
  begin
    Result.Src := '';
    Result.Dest := '';
  end;
end;

function TMacroManager.ReplaceString(S, MacroSrc, MacroDest: string): string;
var
  I, Idx: Integer;
  LenSrc, LenDest: Integer;
begin
  LenSrc := Length(MacroSrc);
  LenDest := Length(MacroDest);

  Idx := 0;
  while Idx < Length(S) do
  begin
    I := Pos(MacroSrc, PChar(S) + Idx);
    if I > 0 then
    begin
      Delete(S, Idx + I, LenSrc);
      Insert(MacroDest, S, Idx + I);
      Inc(Idx, I + LenDest - 1);
    end else
      Break;
  end;
  Result := S;
end;

procedure TMacroManager.Add(const Src, Dest: string);
var
  P: PMacroItem;
begin
  New(P);
  P^.Src := Src;
  P^.Dest := Dest;
  FItems.Add(P);
end;

procedure TMacroManager.Clear;
var
  I: Integer;
begin
  for I := 0 to FItems.Count - 1 do
    Dispose(PMacroItem(FItems[I]));
  FItems.Clear;
end;

procedure TMacroManager.Modify(const Src, Dest: string);
var
  I: Integer;
begin
  for I := 0 to FItems.Count - 1 do
  begin
    if PMacroItem(FItems[I])^.Src = Src then
      PMacroItem(FItems[I])^.Dest := Dest;
  end;
end;

function TMacroManager.Replace(const S: string): string;
var
  I: Integer;
begin
  Result := S;
  for I := 0 to FItems.Count - 1 do
  begin
    Result := ReplaceString(Result, PMacroItem(FItems[I])^.Src,
      PMacroItem(FItems[I])^.Dest);
  end;
end;

end.

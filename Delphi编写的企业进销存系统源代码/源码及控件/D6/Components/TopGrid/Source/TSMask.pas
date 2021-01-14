{*******************************************************}
{                                                       }
{       Top Support Visual Components                   }
{       Classes for masked edit                         }
{                                                       }
{       Copyright (c) 1998 - 1999, Top Support          }
{                                                       }
{*******************************************************}

unit TSMask;

{$INCLUDE TSCmpVer}

interface

uses
    Windows, Classes, SysUtils {$IFDEF TSVER_V6}, Variants {$ENDIF};

type
    TtsShowThousands   = (sthParent, sthOn, sthOff);
    TtsShowTrailZeros  = (stzParent, stzOn, stzOff);
    TtsSymbolPosition  = (spoParent, spoWindows, spoBefore, spoAfter);
    TtsCaseType        = (cstNone, cstUpper, cstLower, cstSentence, cstTitle);
    TtsPictureType     = (pctText, pctDate, pctTime);
    TtsPictureNodeType = (pntNone, pntGroup, pntLiteralChars, pntMaskChars,
                          pntCase, pntRange);
    TtsMaskOption      = (moNone, moUpper, moOptUpper, moLower, moOptLower,
                          moFullCompare, moConvertInput, moInsertLiteral, moCheckUnique);
    TtsMaskOptions     = set of TtsMaskOption;
    TtsMaskCheck       = (mcOnEdit, mcOnExit);
    TtsMaskChecks      = set of TtsMaskCheck;

    EtsMaskError = class(Exception);
    TtsParsePictureEvent = procedure(Sender: TObject; Picture: string; PictureType: TtsPictureType;
                                     var Cancel: Boolean) of object;
    TtsMaskErrorEvent    = procedure(Sender: TObject; Msg: string; var RaiseError: Boolean) of object;

type
    TtsMask = class;
    TtsMaskDefs = class;
    TtsMaskCollection = class;
    TtsPictureNode = class;
    TtsMaskLink = class;
    TtsCharSet = set of Char;

    TtsPictureNode = class(TObject)
    protected
        FNodeType: TtsPictureNodeType;
        FCount: Integer;
        FOptional: Boolean;
        FComplement: Boolean;
        FStartPos: Integer;
        FEndPos: Integer;
        FCharCount: Integer;
        FSubItems: TtsPictureNode;
        FNextItem: TtsPictureNode;
        FNextAlternative: TtsPictureNode;

    public
        constructor Create(NodeType: TtsPictureNodeType); virtual;
        destructor  Destroy; override;

        property Complement: Boolean read FComplement write FComplement;
        property Count: Integer read FCount write FCount;
        property SubItems: TtsPictureNode read FSubItems write FSubItems;
        property NextItem: TtsPictureNode read FNextItem write FNextItem;
        property NextAlternative: TtsPictureNode read FNextAlternative write FNextAlternative;
        property NodeType: TtsPictureNodeType read FNodeType write FNodeType;
        property Optional: Boolean read FOptional write FOptional;
        property StartPos: Integer read FStartPos write FStartPos;
        property EndPos: Integer read FEndPos write FEndPos;
        property CharCount: Integer read FCharCount write FCharCount;
    end;

    TtsPictureList = class(TObject)
    protected
        FPictureType: TtsPictureType;
        FStartNode: TtsPictureNode;

    public
        constructor Create(PictureType: TtsPictureType); virtual;
        destructor  Destroy; override;

        property PictureType: TtsPictureType read FPictureType write FPictureType;
        property StartNode: TtsPictureNode read FStartNode write FStartNode;
    end;

    TtsParseStackElement = record
        Parent: Integer;
        Node: TtsPictureNode;
        Count: Integer;
        TextPos: Integer;
    end;

    PtsParseStackArray = ^TtsParseStackArray;
    TtsParseStackArray = array[1..(MaxListSize div ((SizeOf(TtsParseStackElement) div SizeOf(Longint)) + 1))] of TtsParseStackElement;

    TtsParseStack = class(TObject)
    protected
        FBuffer: PtsParseStackArray;
        FBufSize: Integer;
        FCount: Integer;

        function  Push(Parent: Integer; Node: TtsPictureNode; TextPos, Count: Integer): Integer;
        procedure Pop;
        procedure Reset;

        property  Count: Integer read FCount;
        property  Items: PtsParseStackArray read FBuffer;

    public
        constructor Create;
        destructor  Destroy; override;
    end;

    TtsTextCase = class(TPersistent)
    protected
        FMask: TtsMask;
        FCaseType: TtsCaseType;
        FOptional: Boolean;

        procedure SetCaseType(Value: TtsCaseType);
        procedure SetOptional(Value: Boolean);
    public
        constructor Create(Mask: TtsMask); virtual;
        procedure   Assign(Source: TPersistent); override;
    published
        property CaseType: TtsCaseType read FCaseType write SetCaseType default cstNone;
        property Optional: Boolean read FOptional write SetOptional default False;
    end;

    TtsMaskInput = record
        Text: string;
        TextPos: Integer;
        InsertPos: Integer;
        InsertLen: Integer;
        Literals: string;
        MatchedLiterals: string;
        MinMatchedLiterals: string;
        InsertChars: string;
    end;

    TtsTextMask = class(TPersistent)
    protected
        FMask: TtsMask;
        FPictureList: TtsPictureList;
        FPictureLength: Integer;
        FValidPicture: Boolean;
        FPictureParsed: Boolean;
        FCreateTree: Boolean;

        {property fields}
        FPicture: string;

        {Error detection procedures}
        procedure ErrChar(Chars: string; TextPos: Integer);

        {Create procedures}
        function  CreatePictureTree(PictureType: TtsPictureType): TtsPictureList;
        function  CreatePictureNode(NodeType: TtsPictureNodeType): TtsPictureNode;

        {Parse procedures}
        function  CharCount(const Text: string; TextPos: Integer): Integer;
        function  PictureCharCount(TextPos: Integer): Integer;
        function  IsLiteral(TextPos: Integer): Boolean;
        function  IsMaskChar(TextPos: Integer): Boolean;
        function  IsCaseChar(TextPos: Integer): Boolean;
        function  IsRangeChar(TextPos: Integer): Boolean;
        function  IsCountChar(TextPos: Integer): Boolean;
        function  IsGroupStart(TextPos: Integer): Boolean;
        function  IsGroupEnd(TextPos: Integer): Boolean;
        procedure CheckGroupEnd(var TextPos: Integer; EndChar: Char);
        function  IsRange(TextPos: Integer; var Chars: Integer): Boolean;
        function  GetItemCount(var TextPos: Integer): Integer;
        function  GetGroupType(var TextPos: Integer; var EndChar: Char): Boolean;
        function  GetItem(var TextPos: Integer; Chars: Integer; NodeType: TtsPictureNodeType): TtsPictureNode;
        function  GetNextItem(var TextPos: Integer): TtsPictureNode;
        function  GetRange(var TextPos: Integer; var Node: TtsPictureNode): Boolean;
        function  GetNextAlternative(var TextPos: Integer; EndChar: Char): TtsPictureNode;
        function  GetGroup(var TextPos: Integer): TtsPictureNode;
        procedure ParsePicture(SyntaxOnly: Boolean);
        function  CheckInput(Stack: TtsParseStack; MaskInput: TtsMaskInput;
                             Options: TtsMaskOptions; var InsertChars: string): Boolean;

        {Value check procedures}
        function  CheckCase(Text: string; TextPos: Integer; Chars: Integer; Option: TtsMaskOption): Boolean;
        function  IsWordStart(MaskInput: TtsMaskInput): Boolean;
        function  IsSentenceStart(MaskInput: TtsMaskInput): Boolean;
        function  GetCaseType(const MaskInput: TtsMaskInput; Options: TtsMaskOptions;
                              DefaultCase: TtsMaskOption): TtsMaskOption;
        function  IsInputChar(const MaskInput: TtsMaskInput): Boolean;
        function  CanConvertCase(const MaskInput: TtsMaskInput; Options: TtsMaskOptions; CaseType: TtsMaskOption): Boolean;
        procedure ConvertCase(var MaskInput: TtsMaskInput; Chars: Integer; ConvertType: TtsMaskOption);
        function  CanInsertLiteral(MaskInput: TtsMaskInput; Options: TtsMaskOptions): Boolean;
        function  CheckLiteralChar(var MaskInput: TtsMaskInput; var MaskPos: Integer;
                                   var Matched: Boolean; Node: TtsPictureNode; Options: TtsMaskOptions): Boolean;
        function  CheckLiterals(Node: TtsPictureNode; var MaskInput: TtsMaskInput;
                                Options: TtsMaskOptions; var Matched: Boolean): Boolean;
        function  CheckMaskChar(var MaskInput: TtsMaskInput; var MaskPos: Integer; Options: TtsMaskOptions): Boolean;
        function  CheckMaskChars(Node: TtsPictureNode; var MaskInput: TtsMaskInput; Options: TtsMaskOptions): Boolean;
        function  CheckRange(Node: TtsPictureNode; var MaskInput: TtsMaskInput; Options: TtsMaskOptions): Boolean;
        function  CheckItem(Node: TtsPictureNode; var MaskInput: TtsMaskInput; Options: TtsMaskOptions): Boolean;
        procedure CheckCaseOptions(Node: TtsPictureNode; var Options: TtsMaskOptions);

        function  CheckNextItems(Stack: TtsParseStack; StackPos: Integer; Options: TtsMaskOptions;
                                 var MaskInput: TtsMaskInput; var NrOfMatches: Integer): Boolean;
        function  CheckSubItems(Stack: TtsParseStack; Parent: Integer; Node: TtsPictureNode;
                                Count: Integer; Options: TtsMaskOptions;
                                var MaskInput: TtsMaskInput; var NrOfMatches: Integer): Boolean;

        {Property procedures}
        procedure SetPicture(Value: string);
        function  GetTextCase: TtsTextCase;
        function  GetPictureList: TtsPictureList;
        function  ValidText(const Text: string; FullCompare: Boolean): Boolean;
        function  ValidInput(const Text: string; var InsertChars: string; InsertPos: Integer;
                             FullCompare, AutoFill: Boolean): Boolean;

        property PictureList: TtsPictureList read GetPictureList write FPictureList;
        property Picture: string read FPicture write SetPicture;
        property TextCase: TtsTextCase read GetTextCase;

    public
        constructor Create(Mask: TtsMask); virtual;
        destructor  Destroy; override;
    end;

    TtsMaskItem = class(TCollectionItem)
    protected
        function  GetAutoFill: TtsMaskChecks; virtual; abstract;
        procedure SetAutoFill(Value: TtsMaskChecks); virtual; abstract;
        function  GetEvaluate: TtsMaskChecks; virtual; abstract;
        procedure SetEvaluate(Value: TtsMaskChecks); virtual; abstract;
        function  GetName: string; virtual; abstract;
        procedure SetName(Value: string); virtual; abstract;
        function  GetPicture: string; virtual; abstract;
        procedure SetPicture(Value: string); virtual; abstract;
        function  GetTextCase: TtsTextCase; virtual; abstract;
        procedure SetTextCase(Value: TtsTextCase); virtual; abstract;

        function  GetOnChange: TNotifyEvent; virtual; abstract;
        procedure SetOnChange(Value: TNotifyEvent); virtual; abstract;
        function  GetOnParseError: TtsMaskErrorEvent; virtual; abstract;
        procedure SetOnParseError(Value: TtsMaskErrorEvent); virtual; abstract;

    public
        function  ValidText(const Text: string; FullCompare: Boolean): Boolean; virtual; abstract;
        function  ValidInput(const Text: string; var InsertChars: string; InsertPos: Integer;
                             FullCompare, AutoFill: Boolean): Boolean; virtual; abstract;

        property OnChange: TNotifyEvent read GetOnChange write SetOnChange;
        property OnParseError: TtsMaskErrorEvent read GetOnParseError write SetOnParseError;

    published
        property AutoFill: TtsMaskChecks read GetAutoFill write SetAutoFill default [Low(TtsMaskCheck)..High(TtsMaskCheck)];
        property Evaluate: TtsMaskChecks read GetEvaluate write SetEvaluate default [Low(TtsMaskCheck)..High(TtsMaskCheck)];
        property Name: string read GetName write SetName;
        property Picture: string read GetPicture write SetPicture;
        property TextCase: TtsTextCase read GetTextCase write SetTextCase;
    end;

    TtsMask = class(TtsMaskItem)
    protected
        FName: string;
        FUpdateCount: Integer;

        {Property fields}
        FTextMask: TtsTextMask;
        FAutoFill: TtsMaskChecks;
        FEvaluate: TtsMaskChecks;
        FPicture: string;
        FTextCase: TtsTextCase;

        {Event fields}
        FOnChange: TNotifyEvent;
        FOnParseError: TtsMaskErrorEvent;

        {Error detection procedures}
        procedure InvalidOp(Msg: string);
        function  CheckRaise: Boolean;
        procedure DoParseError(Msg: string; var RaiseError: Boolean);

        function  ParentComponent: TComponent; virtual;
        procedure CheckName(Value: string);
        procedure BeginUpdate;
        procedure EndUpdate;
        procedure Changed; virtual;
        function  GetDisplayName: string; {$IFDEF TSVER_V3} override; {$ENDIF}
        procedure DoChange; virtual;

        {Property procedures}
        procedure SetAutoFill(Value: TtsMaskChecks); override;
        procedure SetEvaluate(Value: TtsMaskChecks); override;
        procedure SetName(Value: string); override;
        procedure SetPicture(Value: string); override;
        procedure SetTextCase(Value: TtsTextCase); override;
        function  GetAutoFill: TtsMaskChecks; override;
        function  GetEvaluate: TtsMaskChecks; override;
        function  GetName: string; override;
        function  GetPicture: string; override;
        function  GetTextCase: TtsTextCase; override;
        function  GetOnChange: TNotifyEvent; override;
        procedure SetOnChange(Value: TNotifyEvent); override;
        function  GetOnParseError: TtsMaskErrorEvent; override;
        procedure SetOnParseError(Value: TtsMaskErrorEvent); override;

        property TextMask: TtsTextMask read FTextMask;

    public
        constructor Create(Collection: TCollection); override;
        destructor  Destroy; override;

        procedure Assign(Source: TPersistent); override;
        function  ValidText(const Text: string; FullCompare: Boolean): Boolean; override;
        function  ValidInput(const Text: string; var InsertChars: string; InsertPos: Integer;
                             FullCompare, AutoFill: Boolean): Boolean; override;
    end;

    TtsMaskDefsComponent = class(TComponent)
    protected
        procedure RemoveLink(MaskLink: TtsMaskLink); virtual; abstract;
        procedure AddLink(MaskLink: TtsMaskLink); virtual; abstract;
        function  GetMask(Index: Variant): TtsMaskItem; virtual; abstract;
        procedure SetMask(Index: Variant; Value: TtsMaskItem); virtual; abstract;
    public
        property Mask[Index: Variant]: TtsMaskItem read GetMask write SetMask;
    end;

    TtsMaskDefs = class(TtsMaskDefsComponent)
    protected
        FMasks: TtsMaskCollection;
        FLinks: TList;

        procedure RemoveLink(MaskLink: TtsMaskLink); override;
        procedure AddLink(MaskLink: TtsMaskLink); override;
        function  GetMask(Index: Variant): TtsMaskItem; override;
        procedure SetMask(Index: Variant; Value: TtsMaskItem); override;
        procedure RemoveLinks;
        procedure SetMasks(Value: TtsMaskCollection);
        procedure CheckErrorEvent(Mask: TtsMask);
        procedure Changed(Mask: TtsMask); virtual;
        procedure DoParseError(Sender: TObject; Msg: string; var RaiseError: Boolean);

    public
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;

    published
        property Masks: TtsMaskCollection read FMasks write SetMasks;
    end;

    TtsMaskClass = class of TtsMask;

    TtsMaskCollection = class(TCollection)
    protected
        FMaskDefs: TtsMaskDefs;

        function  NameIndex(Name: string): Integer;
        function  GetMask(Index: Variant): TtsMask;
        procedure SetMask(Index: Variant; Value: TtsMask);
        procedure Update(Item: TCollectionItem); override;
        function  FindUniqueName(Item: TCollectionItem): string;
        function  GetOwner: TPersistent; {$IFDEF TSVER_V3} override; {$ENDIF}
        procedure SetItemName(Item: TCollectionItem); {$IFDEF TSVER_V3} override; {$ENDIF}

    public
        constructor Create(MaskDefs: TtsMaskDefs; MaskClass: TtsMaskClass);

        function  Add: TtsMask;

        property MaskDefs: TtsMaskDefs read FMaskDefs;
        property Items[Index: Variant]: TtsMask read GetMask write SetMask; default;
    end;

    TtsMaskLink = class(TPersistent)
    protected
        FMaskDefs: TtsMaskDefsComponent;

        procedure SetMaskDefs(Value: TtsMaskDefsComponent);
        procedure MaskChanged(Mask: TtsMaskItem); virtual;
        procedure MaskDefsDeleted; virtual;
        function  GetMask(Name: string): TtsMaskItem;

    public
        constructor Create;
        destructor Destroy; override;

        property MaskDefs: TtsMaskDefsComponent read FMaskDefs write SetMaskDefs;
        property Mask[Name: string]: TtsMaskItem read GetMask;
    end;

const
    StsPctExpChar = 'Error in mask %s, expected ''%s'' at position %d';
    StsPctErrEnd = 'Error in mask %s, unexpected end of picture';
    StsPctInvalidChar = 'Error in mask %s, invalid character ''%s'' at position %d';
    StsMaskNotUnique = 'Mask ''%s'' already exists. Mask names must be unique';

implementation

{$R *.dcr}

uses
    TSMbcs, TSGLib, Dialogs;

var
    FNodeCount: Integer = 0;

const
    VersionNumber = '2.0';
    
    {Picture mask characters}
    tsPicDigit = '#';
    tsPicLetter = '?';
    tsPicUpperLetter = '&';
    tsPicAny = '@';
    tsPicUpperAny = '!';

    tsPicOptStartChar = '[';
    tsPicOptEndChar = ']';
    tsPicNonOptStartChar = '{';
    tsPicNonOptEndChar = '}';
    tsPicAltChar = ',';
    tsPicNotChar = '^';
    tsPicRangeChar = '-';
    tsPicEscapeChar = ';';
    tsPicCountChar = '*';
    tsPicLower = '<';
    tsPicUpper = '>';

    tsPicAllChars = tsPicOptStartChar + tsPicCountChar + tsPicAny + tsPicOptEndChar;
    tsPicMaskChars = [tsPicDigit, tsPicLetter, tsPicUpperLetter, tsPicAny,
                      tsPicUpperAny];
    tsPicNonMaskChars = [tsPicAltChar, tsPicOptStartChar, tsPicOptEndChar,
                         tsPicNonOptStartChar, tsPicNonOptEndChar, tsPicNotChar,
                         tsPicEscapeChar, tsPicCountChar, tsPicLower, tsPicUpper];
    tsPicCharSet = tsPicMaskChars + tsPicNonMaskChars + [tsPicRangeChar];
    tsPicNonLiteral = tsPicMaskChars + tsPicNonMaskChars;

function SetMaskInput(Text: string; TextPos, InsertPos, InsertLen: Integer): TtsMaskInput;
begin
    Result.Text := Text;
    Result.TextPos := 1;
    Result.InsertPos := InsertPos;
    Result.InsertLen := InsertLen;
    Result.Literals := '';
    Result.MatchedLiterals := '';
    Result.MinMatchedLiterals := '';
    Result.InsertChars := '';
end;

procedure CopyMaskInput(const FromInput: TtsMaskInput; var ToInput: TtsMaskInput);
var
    Literals: string;
    MinLiterals: string;
    InsertChars: string;
begin
    Literals := ToInput.MatchedLiterals;
    MinLiterals := ToInput.MinMatchedLiterals;
    InsertChars := ToInput.InsertChars;
    ToInput := FromInput;
    ToInput.MatchedLiterals := Literals;
    ToInput.MinMatchedLiterals := MinLiterals;
    ToInput.InsertChars := InsertChars;
end;

{TtsPictureNode}

constructor TtsPictureNode.Create(NodeType: TtsPictureNodeType);
begin
    inherited Create;
    FNodeType := NodeType;
    FCount := 0;
    FOptional := False;
    FComplement := False;
    FStartPos := 0;
    FEndPos := 0;
    FCharCount := 0;
    FSubItems := nil;
    FNextItem := nil;
    FNextAlternative := nil;
    Inc(FNodeCount);
end;

destructor TtsPictureNode.Destroy;
begin
    FSubItems.Free;
    FNextItem.Free;
    FNextAlternative.Free;
    inherited;
end;

{TtsPictureList}

constructor TtsPictureList.Create(PictureType: TtsPictureType);
begin
    inherited Create;
    FPictureType := PictureType;
    FStartNode := nil;
end;

destructor TtsPictureList.Destroy;
begin
    FStartNode.Free;
    inherited;
end;

{TtsParseStack}

constructor TtsParseStack.Create;
begin
    inherited;
    FBuffer := nil;
    FBufSize := 0;
    FCount := 0;
end;

destructor TtsParseStack.Destroy;
begin
    ReallocMem(FBuffer, 0);
    inherited;
end;

function TtsParseStack.Push(Parent: Integer; Node: TtsPictureNode; TextPos, Count: Integer): Integer;
begin
    if FCount >= FBufSize then
    begin
        FBufSize := FCount + 10;
        ReallocMem(FBuffer, FBufSize * SizeOf(TtsParseStackElement));
    end;

    Inc(FCount);
    FBuffer[FCount].Parent := Parent;
    FBuffer[FCount].Node := Node;
    FBuffer[FCount].Count := Count;
    FBuffer[FCount].TextPos := TextPos;
    Result := FCount;
end;

procedure TtsParseStack.Pop;
begin
    if Count > 0 then Dec(FCount);
end;

procedure TtsParseStack.Reset;
begin
    FCount := 0;
end;

{TtsTextCase}

constructor TtsTextCase.Create(Mask: TtsMask);
begin
    inherited Create;
    FMask := Mask;
    FCaseType := cstNone;
    FOptional := False;
end;

procedure TtsTextCase.Assign(Source: TPersistent);
begin
    if Source is TtsTextCase then
    begin
        FCaseType := TtsTextCase(Source).CaseType;
        FOptional := TtsTextCase(Source).Optional;
    end
    else
        inherited;
end;

procedure TtsTextCase.SetCaseType(Value: TtsCaseType);
begin
    if FCaseType <> Value then
    begin
        FCaseType := Value;
        FMask.Changed;
    end;
end;

procedure TtsTextCase.SetOptional(Value: Boolean);
begin
    if FOptional <> Value then
    begin
        FOptional := Value;
        FMask.Changed;
    end;
end;

{TtsTextMask}

constructor TtsTextMask.Create(Mask: TtsMask);
begin
    inherited Create;
    FMask := Mask;
    FPicture := '';
    FPictureLength := Length(Picture);
    FPictureList := nil;
    FCreateTree := False;
    FValidPicture := True;
    FPictureParsed := True;
end;

destructor TtsTextMask.Destroy;
begin
    FPictureList.Free;
    inherited;
end;

procedure TtsTextMask.ErrChar(Chars: string; TextPos: Integer);
var
    Msg: string;
begin
    Msg := Format(StsPctExpChar, [FMask.Name, Chars, TextPos]);
    FMask.InvalidOp(Msg);
end;

function TtsTextMask.CreatePictureTree(PictureType: TtsPictureType): TtsPictureList;
begin
    Result := nil;
    if FCreateTree then Result := TtsPictureList.Create(PictureType);
end;

function TtsTextMask.CreatePictureNode(NodeType: TtsPictureNodeType): TtsPictureNode;
begin
    Result := nil;
    if FCreateTree then Result := TtsPictureNode.Create(NodeType);
end;

function TtsTextMask.CharCount(const Text: string; TextPos: Integer): Integer;
begin
    Result := 1;
    if tsIsFarEast then
    begin
        if StrByteType(PChar(Text) + TextPos - 1, 0) <> mbSingleByte then
            Result := 2;
    end;
end;

function TtsTextMask.PictureCharCount(TextPos: Integer): Integer;
begin
    if Picture[TextPos] = tsPicEscapeChar then
    begin
        if TextPos + 1 > FPictureLength then FMask.InvalidOp(Format(StsPctErrEnd, [FMask.Name]));
        if tsIsfarEast then Result := CharCount(Picture, TextPos + 1) + 1
                       else Result := 2;
    end
    else if Picture[TextPos] = tsPicLower then
    begin
        Result := 1;
        if (TextPos < FPictureLength) and
           (Picture[TextPos+1] in [tsPicUpper, tsPicLower]) then Inc(Result);
    end
    else if Picture[TextPos] = tsPicUpper then
    begin
        Result := 1;
        if (TextPos < FPictureLength) and
           (Picture[TextPos+1] = tsPicUpper) then Inc(Result);
    end
    else
    begin
        if tsIsFarEast then Result := CharCount(Picture, TextPos)
                       else Result := 1;
    end
end;

function TtsTextMask.IsLiteral(TextPos: Integer): Boolean;
begin
    Result := False;
    if TextPos > FPictureLength then Exit;

    Result := (Picture[TextPos] = tsPicEscapeChar) or
              not (Picture[TextPos] in tsPicNonLiteral);
end;

function TtsTextMask.IsMaskChar(TextPos: Integer): Boolean;
begin
    Result := False;
    if TextPos > FPictureLength then Exit;
    Result := Picture[TextPos] in tsPicMaskChars;
end;

function TtsTextMask.IsCaseChar(TextPos: Integer): Boolean;
begin
    Result := False;
    if TextPos > FPictureLength then Exit;
    Result := (Picture[TextPos] = tsPicUpper) or
              (Picture[TextPos] = tsPicLower);
end;

function TtsTextMask.IsRangeChar(TextPos: Integer): Boolean;
begin
    Result := False;
    if TextPos > FPictureLength then Exit;
    Result := Picture[TextPos] = tsPicRangeChar;
end;

function TtsTextMask.IsCountChar(TextPos: Integer): Boolean;
begin
    Result := False;
    if TextPos > FPictureLength then Exit;
    Result := Picture[TextPos] = tsPicCountChar;
end;

function TtsTextMask.IsGroupStart(TextPos: Integer): Boolean;
begin
    Result := False;
    if TextPos > FPictureLength then Exit;
    Result := (Picture[TextPos] = tsPicOptStartChar) or
              (Picture[TextPos] = tsPicNonOptStartChar);
end;

function TtsTextMask.IsGroupEnd(TextPos: Integer): Boolean;
begin
    Result := False;
    if TextPos > FPictureLength then Exit;
    Result := (Picture[TextPos] = tsPicOptEndChar) or
              (Picture[TextPos] = tsPicNonOptEndChar);
end;

procedure TtsTextMask.CheckGroupEnd(var TextPos: Integer; EndChar: Char);
begin
    if EndChar <> #0 then
    begin
        if (TextPos > FPictureLength) or (Picture[TextPos] <> EndChar) then
            ErrChar(EndChar, TextPos);
        Inc(TextPos);
    end;
end;

function TtsTextMask.IsRange(TextPos: Integer; var Chars: Integer): Boolean;
var
    Pos: Integer;
    RangeOk: Boolean;
begin
    Chars := 0;
    Pos := TextPos;
    Result := False;
    if Pos > FPictureLength then Exit;

    if Picture[Pos] = tsPicNotChar then Inc(Pos);
    RangeOk := IsLiteral(Pos);

    if RangeOk then
    begin
        Pos := Pos + PictureCharCount(Pos);
        RangeOk := IsRangeChar(Pos);
    end;

    if RangeOk then
    begin
        Inc(Pos);
        RangeOk := IsLiteral(Pos);
    end;

    if RangeOk then
    begin
        Pos := Pos + PictureCharCount(Pos);
        RangeOk := IsGroupEnd(Pos);
    end;

    Result := RangeOk;
    if Result then Chars := Pos - TextPos;
end;

function TtsTextMask.GetItemCount(var TextPos: Integer): Integer;
var
    Pos: Integer;
    CountStr: string;
begin
    Result := 1;
    if Picture[TextPos] <> tsPicCountChar then Exit;

    CountStr := '';
    Pos := TextPos + 1;
    while Pos <= FPictureLength do
    begin
        if not (Picture[Pos] in ['0'..'9']) then Break;
        Inc(Pos);
    end;

    if Pos > TextPos + 1 then CountStr := Copy(Picture, TextPos + 1, Pos - TextPos - 1);
    TextPos := Pos;

    if CountStr = '' then Result := -1
                     else Result := StrToInt(CountStr);
end;

function TtsTextMask.GetGroupType(var TextPos: Integer; var EndChar: Char): Boolean;
begin
    Result := False;
    EndChar := #0;
    if TextPos > FPictureLength then Exit;

    if Picture[TextPos] = tsPicOptStartChar then
    begin
        Result := True;
        TextPos := TextPos + 1;
        EndChar := tsPicOptEndChar;
    end
    else if Picture[TextPos] = tsPicNonOptStartChar then
    begin
        TextPos := TextPos + 1;
        EndChar := tsPicNonOptEndChar;
    end;
end;

function TtsTextMask.GetItem(var TextPos: Integer; Chars: Integer; NodeType: TtsPictureNodeType): TtsPictureNode;
var
    ItemNode: TtsPictureNode;
begin
    Result := nil;
    if TextPos > FPictureLength then Exit;

    ItemNode := CreatePictureNode(NodeType);
    if Assigned(ItemNode) then
    begin
        try
            ItemNode.Count := 1;
            ItemNode.Optional := False;
            ItemNode.StartPos := TextPos;
            ItemNode.CharCount := Chars;
        except
            ItemNode.Free;
            raise;
        end;
    end;

    Result := ItemNode;
end;

function TtsTextMask.GetNextItem(var TextPos: Integer): TtsPictureNode;
var
    Count: Integer;
    CountFound: Boolean;
    ItemNode: TtsPictureNode;
    Pos: Integer;
begin
    Result := nil;
    if TextPos > FPictureLength then Exit;

    ItemNode := nil;
    Count := 1;
    CountFound := False;
    if Picture[TextPos] = tsPicCountChar then
    begin
        CountFound := True;
        Count := GetItemCount(TextPos);
    end;

    if TextPos > FPictureLength then
        FMask.InvalidOp(Format(StsPctErrEnd, [FMask.Name]))
    else if IsLiteral(TextPos) then
    begin
        Pos := TextPos + PictureCharCount(TextPos);
        ItemNode := GetItem(TextPos, Pos - TextPos, pntLiteralChars);
        TextPos := Pos;
    end
    else if IsMaskChar(TextPos) then
    begin
        Pos := TextPos + PictureCharCount(TextPos);
        if not CountFound then
        begin
            while IsMaskChar(Pos) do Inc(Pos);
        end;

        ItemNode := GetItem(TextPos, Pos - TextPos, pntMaskChars);
        TextPos := Pos;
    end
    else if IsGroupStart(TextPos) then
        ItemNode := GetGroup(TextPos)
    else if (not CountFound) and IsCaseChar(TextPos) then
    begin
        Pos := TextPos + PictureCharCount(TextPos);
        ItemNode := GetItem(TextPos, Pos - TextPos, pntCase);
        TextPos := Pos;
    end
    else
    begin
        FMask.InvalidOp(Format(StsPctInvalidChar, [FMask.Name, Picture[TextPos], TextPos]));
    end;

    if ItemNode <> nil then ItemNode.Count := Count;
    Result := ItemNode;
end;

function TtsTextMask.GetRange(var TextPos: Integer; var Node: TtsPictureNode): Boolean;
var
    Chars: Integer;
begin
    Node := nil;
    Result := IsRange(TextPos, Chars);

    if Result then
    begin
        Node := CreatePictureNode(pntRange);
        try
            if Assigned(Node) then
            begin
                if Picture[TextPos] = tsPicNotChar then
                begin
                    Node.Complement := True;
                    TextPos := TextPos + 1;
                    Chars := Chars - 1;
                end;

                Node.Count := 1;
                Node.StartPos := TextPos;
                Node.CharCount := Chars;

                if Picture[Node.StartPos] = tsPicEscapeChar then
                    Node.StartPos := Node.StartPos + 1;
                Node.EndPos := Node.StartPos + CharCount(Picture, Node.StartPos) + 1;
                if Picture[Node.EndPos] = tsPicEscapeChar then
                    Node.EndPos := Node.EndPos;
            end;

            TextPos := TextPos + Chars;
        except
            Node.Free;
            raise;
        end;
    end;
end;

function TtsTextMask.GetNextAlternative(var TextPos: Integer; EndChar: Char): TtsPictureNode;
var
    PrevNode, StartNode, Node: TtsPictureNode;
begin
    Result := nil;
    if TextPos > FPictureLength then Exit;

    PrevNode := nil;
    StartNode := nil;
    try
        while (TextPos <= FPictureLength) and (Picture[TextPos] <> EndChar) and
              (Picture[TextPos] <> tsPicAltChar) do
        begin
            Node := GetNextItem(TextPos);
            if Assigned(PrevNode) then PrevNode.NextItem := Node;
            if not Assigned(StartNode) then StartNode := Node;
            PrevNode := Node;
        end;

        if (TextPos <= FPictureLength) and
           (Picture[TextPos] = tsPicAltChar) then Inc(TextPos);
    except
        StartNode.Free;
        raise;
    end;

    Result := StartNode;
end;

function TtsTextMask.GetGroup(var TextPos: Integer): TtsPictureNode;
var
    PrevNode, GroupNode, Node: TtsPictureNode;
    EndChar: Char;
    Optional: Boolean;
begin
    Result := nil;
    if TextPos > FPictureLength then Exit;

    PrevNode := nil;
    GroupNode := CreatePictureNode(pntGroup);
    try
        Optional := GetGroupType(TextPos, EndChar);
        if Assigned(GroupNode) then
        begin
            GroupNode.Count := 1;
            GroupNode.Optional := Optional;
        end;

        if GetRange(TextPos, Node) then
        begin
            if Assigned(Node) and Assigned(GroupNode) then
                GroupNode.SubItems := Node;
        end
        else
        begin
            while (TextPos <= FPictureLength) and
                  (Picture[TextPos] <> EndChar) do
            begin
                Node := GetNextAlternative(TextPos, EndChar);
                if Assigned(Node) and Assigned(GroupNode) then
                begin
                    if not Assigned(PrevNode)
                        then GroupNode.SubItems := Node
                        else PrevNode.NextAlternative := Node;
                end;
                PrevNode := Node;
            end;
        end;

        CheckGroupEnd(TextPos, EndChar);
    except
        GroupNode.Free;
        raise;
    end;

    Result := GroupNode;
end;

procedure TtsTextMask.ParsePicture(SyntaxOnly: Boolean);
var
    List: TtsPictureList;
    Node, GroupNode: TtsPictureNode;
    TextPos: Integer;
begin
    List := nil;
    FValidPicture := True;
    FPictureParsed := True;
    if (Picture <> '') then
    begin
        FCreateTree := not SyntaxOnly;
        List := CreatePictureTree(pctText);
        try
            TextPos := 1;
            Node := GetNextAlternative(TextPos, #0);
            if Assigned(List) and Assigned(Node) then
            begin
                GroupNode := CreatePictureNode(pntGroup);
                GroupNode.Count := 1;
                GroupNode.Optional := False;
                GroupNode.SubItems := Node;
                List.StartNode := GroupNode;
            end;
        except
            List.Free;
            raise;
        end;
    end;

    FPictureList := List;
    FPictureParsed := True;
end;

procedure TtsTextMask.SetPicture(Value: string);
var
    RaiseError: Boolean;
begin
    if (FPicture <> Value) or not FPictureParsed then
    begin
        FPictureList.Free;
        FPictureList := nil;

        FPicture := Value;
        FPictureLength := Length(Value);
        try
            ParsePicture(True);
        except
            on E:EtsMaskError do
            begin
                FValidPicture := False;
                FPictureParsed := True;
                FMask.DoParseError(E.Message, RaiseError);
                if RaiseError then raise;
            end;

            on Exception do raise;
        end;
    end;
end;

function TtsTextMask.GetTextCase: TtsTextCase;
begin
    Result := FMask.TextCase;
end;

function TtsTextMask.GetPictureList: TtsPictureList;
begin
    if ((not FPictureParsed) or FValidPicture) and
       (not Assigned(FPictureList)) then ParsePicture(False);
    Result := FPictureList;
end;

function TtsTextMask.CheckCase(Text: string; TextPos: Integer; Chars: Integer; Option: TtsMaskOption): Boolean;
var
    I: Integer;
    Buf: array[1..2] of Char;
begin
    if Chars > High(Buf) then Chars := High(Buf);
    for I := 1 to Chars do Buf[I] := Text[TextPos - I + 1];

    if Option in [moUpper, moOptUpper]
        then CharUpperBuff(@Buf, Chars)
        else CharLowerBuff(@Buf, Chars);

    Result := True;
    for I := 1 to Chars do
    begin
        Result := (Buf[I] = Text[TextPos - I + 1]);
        if not Result then Break;
    end;
end;

function TtsTextMask.IsWordStart(MaskInput: TtsMaskInput): Boolean;
var
    Chars: Integer;
begin
    with MaskInput do
    begin
        Result := (TextPos = 1);
        if not Result then
        begin
            Chars := PrevCharCount(PChar(Text), TextPos - 1);
            Result := not IsTextChar(PChar(Text), TextPos - 1 - Chars);
        end;
    end;
end;

function TtsTextMask.IsSentenceStart(MaskInput: TtsMaskInput): Boolean;
var
    PText: PChar;
begin
    with MaskInput do
    begin
        Result := (TextPos = 1);
        if not Result then
        begin
            PText := StrRNTextScan(PChar(Text), TextPos - 1);
            if PText <> nil then Result := (PText^ = '.');
        end;
    end;
end;

function TtsTextMask.GetCaseType(const MaskInput: TtsMaskInput; Options: TtsMaskOptions;
                                 DefaultCase: TtsMaskOption): TtsMaskOption;
begin
    with MaskInput do
    begin
        Result := DefaultCase;
        if moUpper in Options then
            Result := moUpper
        else if (moLower in Options) then
            Result := moLower
        else if (moOptUpper in Options) then
            Result := moOptUpper
        else if (moOptLower in Options) then
            Result := moOptLower
        else if (TextCase.CaseType = cstUpper) then
        begin
            if TextCase.Optional then Result := moOptUpper
                                 else Result := moUpper
        end
        else if TextCase.CaseType = cstLower then
        begin
            if TextCase.Optional then Result := moOptLower
                                 else Result := moLower
        end
        else
        begin
            case TextCase.CaseType of
                cstTitle:
                    if IsWordStart(MaskInput) then
                    begin
                        if TextCase.Optional then Result := moOptUpper
                                             else Result := moUpper;
                    end;

                cstSentence:
                    if IsSentenceStart(MaskInput) then
                    begin
                        if TextCase.Optional then Result := moOptUpper
                                             else Result := moUpper;
                    end;
            end;
        end;
    end;
end;

function TtsTextMask.IsInputChar(const MaskInput: TtsMaskInput): Boolean;
begin
    with MaskInput do
    begin
        Result := (TextPos >= InsertPos) and
                  (TextPos <= InsertPos + InsertLen - 1);
    end;
end;

function TtsTextMask.CanConvertCase(const MaskInput: TtsMaskInput; Options: TtsMaskOptions; CaseType: TtsMaskOption): Boolean;
begin
    with MaskInput do
    begin
        Result :=  IsInputChar(MaskInput) and (CaseType <> moNone) and
                   (moConvertInput in Options);
    end;
end;

procedure TtsTextMask.ConvertCase(var MaskInput: TtsMaskInput; Chars: Integer; ConvertType: TtsMaskOption);
begin
    with MaskInput do
    begin
        if ConvertType in [moUpper, moOptUpper] then
            CharUpperBuff(@Text[TextPos], Chars)
        else if ConvertType in [moLower, moOptLower] then
            CharLowerBuff(@Text[TextPos], Chars);
    end;
end;

function TtsTextMask.CanInsertLiteral(MaskInput: TtsMaskInput; Options: TtsMaskOptions): Boolean;
begin
    Result := (MaskInput.TextPos = MaskInput.InsertPos) and
              (moInsertLiteral in Options);
end;

function TtsTextMask.CheckLiteralChar(var MaskInput: TtsMaskInput; var MaskPos: Integer;
                                      var Matched: Boolean; Node: TtsPictureNode;
                                      Options: TtsMaskOptions): Boolean;
var
    Pos: Integer;
    Chars: Integer;
begin
    Result := False;
    Pos := MaskPos;
    if Picture[MaskPos] = tsPicEscapeChar then Pos := Pos + 1;

    with MaskInput do
    begin
        Chars := CharCount(Picture, Pos);
        if (not Matched) and (TextPos + Chars - 1 <= Length(Text)) then
        begin
            if IsInputChar(MaskInput) and (moConvertInput in Options) then
                Result := AnsiStrLIComp(PChar(@Text[TextPos]), PChar(@Picture[Pos]), Chars) = 0
            else
                Result := AnsiStrLComp(PChar(@Text[TextPos]), PChar(@Picture[Pos]), Chars) = 0;

            if Result then
            begin
                Text[TextPos] := Picture[Pos];
                if Chars > 1 then Text[TextPos + 1] := Picture[Pos + 1];
                MaskPos := Pos + Chars;
                TextPos := TextPos + Chars;
                Matched := True;
            end;
        end;

        if (not Result) and CanInsertLiteral(MaskInput, Options) then
        begin
            Result := True;
            MaskInput.Literals := MaskInput.Literals + Copy(Picture, Pos, Chars);
            MaskPos := Pos + Chars;
        end;
    end;
end;

function TtsTextMask.CheckLiterals(Node: TtsPictureNode; var MaskInput: TtsMaskInput;
                                   Options: TtsMaskOptions; var Matched: Boolean): Boolean;
var
    Ok: Boolean;
    MaskPos, MaxMaskPos: Integer;
    CurInput: TtsMaskInput;
begin
    Result := False;
    if not Assigned(Node) then Exit;

    if (MaskInput.TextPos > Length(MaskInput.Text)) and
       not (moFullCompare in Options) then
    begin
        Result := True;
        Exit;
    end;

    Ok := True;
    CurInput := MaskInput;
    with CurInput do
    begin
        MaskPos := Node.StartPos;
        MaxMaskPos := Node.StartPos + Node.CharCount - 1;
        while Ok and (MaskPos <= MaxMaskPos) do
        begin
            if (TextPos > Length(Text)) and not (moFullCompare in Options) then Break;
            Ok := CheckLiteralChar(CurInput, MaskPos, Matched, Node, Options);
        end;
    end;

    Result := Ok;
    if Result then MaskInput := CurInput;
end;

function TtsTextMask.CheckMaskChar(var MaskInput: TtsMaskInput; var MaskPos: Integer;
                                   Options: TtsMaskOptions): Boolean;
var
    Chars: Integer;
    ConvertType: TtsMaskOption;
begin
    Result := False;
    with MaskInput do
    begin
        if TextPos > Length(Text) then Exit;

        Chars := CharCount(Text, TextPos);
        case Picture[MaskPos] of
            tsPicDigit:
                Result := Text[TextPos] in ['0'..'9'];

            tsPicLetter:
                begin
                    Result := IsCharAlpha(Text[TextPos]);
                    if Result then
                    begin
                        ConvertType := GetCaseType(MaskInput, Options, moNone);
                        if CanConvertCase(MaskInput, Options, ConvertType) then
                            ConvertCase(MaskInput, Chars, ConvertType)
                        else if ConvertType <> moNone then
                        begin
                            if (ConvertType in [moUpper, moLower]) or
                               IsInputChar(MaskInput) then
                            begin
                                Result := CheckCase(Text, TextPos, Chars, ConvertType)
                            end;
                        end;
                    end;
                end;

            tsPicUpperLetter:
                begin
                    Result := IsCharAlpha(Text[TextPos]);
                    if Result then
                    begin
                        ConvertType := GetCaseType(MaskInput, Options, moUpper);
                        if CanConvertCase(MaskInput, Options, ConvertType) then
                            ConvertCase(MaskInput, Chars, moUpper)
                        else
                            Result := CheckCase(Text, TextPos, Chars, moUpper);
                    end;
                end;

            tsPicAny:
                begin
                    Result := not IsCharAlpha(Text[TextPos]);
                    if not Result then
                    begin
                        Result := True;
                        ConvertType := GetCaseType(MaskInput, Options, moNone);
                        if CanConvertCase(MaskInput, Options, ConvertType) then
                            ConvertCase(MaskInput, Chars, ConvertType)
                        else if ConvertType <> moNone then
                        begin
                            if (ConvertType in [moUpper, moLower]) or
                               IsInputChar(MaskInput) then
                            begin
                                Result := CheckCase(Text, TextPos, Chars, ConvertType);
                            end;
                        end;
                    end;
                end;

            tsPicUpperAny:
                begin
                    Result := not IsCharAlpha(Text[TextPos]);
                    if not Result then
                    begin
                        ConvertType := GetCaseType(MaskInput, Options, moNone);
                        if CanConvertCase(MaskInput, Options, ConvertType) then
                        begin
                            Result := True;
                            ConvertCase(MaskInput, Chars, moUpper)
                        end
                        else
                            Result := CheckCase(Text, TextPos, Chars, moUpper);
                    end;
                end;
        end;

        if Result then
        begin
            MaskPos := MaskPos + CharCount(Picture, MaskPos);
            TextPos := TextPos + Chars;
        end;
    end;
end;

function TtsTextMask.CheckMaskChars(Node: TtsPictureNode; var MaskInput: TtsMaskInput;
                                    Options: TtsMaskOptions): Boolean;
var
    Ok: Boolean;
    MaskPos, MaxMaskPos: Integer;
    CurInput: TtsMaskInput;
begin
    Ok := True;
    CurInput := MaskInput;
    with CurInput do
    begin
        MaskPos := Node.StartPos;
        MaxMaskPos := Node.StartPos + Node.CharCount - 1;

        while Ok and (MaskPos <= MaxMaskPos) do
        begin
            if (TextPos > Length(Text)) and not (moFullCompare in Options) then Break;
            Ok := CheckMaskChar(CurInput, MaskPos, Options)
        end;
    end;

    Result := Ok;
    if Result then MaskInput := CurInput;
end;

function TtsTextMask.CheckRange(Node: TtsPictureNode; var MaskInput: TtsMaskInput;
                                Options: TtsMaskOptions): Boolean;
var
    InRange: Boolean;
    Chars: Integer;
    TextChar, StartChar, EndChar: string;
begin
    Result := False;
    with MaskInput do
    begin
        if TextPos > Length(Text) then Exit;

        Chars := CharCount(Text, TextPos);
        if not tsIsFarEast or
           ((Chars = 1) and (CharCount(Picture, Node.StartPos) = 1) and
                            (CharCount(Picture, Node.EndPos) = 1)) then
        begin
            InRange := (Text[TextPos] >= Picture[Node.StartPos]) and
                       (Text[TextPos] <= Picture[Node.EndPos]);
            if (not InRange) and IsInputChar(MaskInput) and
               (moConvertInput in Options) and IsCharAlpha(Text[TextPos]) and
               (not Node.Complement) then
            begin
                if CheckCase(Text, TextPos, 1, moUpper)
                    then TextChar := LowerCase(Text[TextPos])
                    else TextChar := UpperCase(Text[TextPos]);

                InRange := (TextChar[1] >= Picture[Node.StartPos]) and
                           (TextChar[1] <= Picture[Node.EndPos]);
                if InRange then Text[TextPos]:= TextChar[1];
            end;
        end
        else
        begin
            StartChar := Copy(Picture, Node.StartPos, CharCount(Picture, Node.StartPos));
            EndChar := Copy(Picture, Node.EndPos, CharCount(Picture, Node.EndPos));
            TextChar := Copy(Text, TextPos, Chars);

            InRange := (AnsiStrComp(PChar(TextChar), PChar(StartChar)) >= 0) and
                       (AnsiStrComp(PChar(TextChar), PChar(EndChar)) <= 0);

            if (not InRange) and IsInputChar(MaskInput) and
               (moConvertInput in Options) and IsCharAlpha(TextChar[1]) and
               (not Node.Complement) then
            begin
                if CheckCase(TextChar, 1, Length(TextChar), moUpper)
                    then CharUpperBuff(PChar(TextChar), Length(TextChar))
                    else CharLowerBuff(PChar(TextChar), Length(TextChar));

                InRange := (AnsiStrComp(PChar(TextChar), PChar(StartChar)) >= 0) and
                           (AnsiStrComp(PChar(TextChar), PChar(EndChar)) <= 0);
                if InRange then
                begin
                    Text[TextPos] := TextChar[1];
                    if Length(TextChar) > 1 then Text[TextPos + 1] := TextChar[2];
                end;
            end;
        end;

        Result := InRange;
        if Node.Complement then Result := not Result;
        if Result then TextPos := TextPos + Chars;
    end;
end;

function TtsTextMask.CheckItem(Node: TtsPictureNode; var MaskInput: TtsMaskInput;
                               Options: TtsMaskOptions): Boolean;
begin
    Result := False;
    if not Assigned(Node) then Exit;

    if (MaskInput.TextPos > Length(MaskInput.Text)) and
       not (moFullCompare in Options) then
    begin
        Result := True;
        Exit;
    end;

    case Node.NodeType of
        pntMaskChars:
            Result := CheckMaskChars(Node, MaskInput, Options);
        pntRange:
            Result := CheckRange(Node, MaskInput, Options);
    else
        Result := True;
    end;
end;

function TtsTextMask.CheckNextItems(Stack: TtsParseStack; StackPos: Integer; Options: TtsMaskOptions;
                                    var MaskInput: TtsMaskInput; var NrOfMatches: Integer): Boolean;
var
    Node, NextItem: TtsPictureNode;
    Count, NextCount: Integer;
    Parent: Integer;
    CurNrOfMatches: Integer;
begin
    Result := MaskInput.TextPos > Length(MaskInput.Text);
    if StackPos = 0 then Exit;

    Node := Stack.Items[StackPos].Node;
    Parent := Stack.Items[StackPos].Parent;
    Count := Stack.Items[StackPos].Count;

    if Node.Optional and (Count > 0) and
       (Stack.Items[StackPos].TextPos = MaskInput.TextPos) then
    begin
        Result := False;
        Exit;
    end;

    NextCount := 0;
    NextItem := Node.NextItem;
    if (not Node.Optional) and (Count < Node.Count) then
    begin
        NextCount := Count + 1;
        NextItem := Node;
    end;

    CurNrOfMatches := NrOfMatches;
    if Assigned(NextItem) then
    begin
        Result := CheckSubItems(Stack, Parent, NextItem, NextCount,
                                Options, MaskInput, NrOfMatches);
    end
    else
    begin
        Result := CheckNextItems(Stack, Parent, Options, MaskInput, NrOfMatches);
    end;

    if (not Result) and (NrOfMatches <= 1) then
    begin
        if (Count = 0) or (CurNrOfMatches <> NrOfMatches) or
           (Stack.Items[StackPos].TextPos < MaskInput.TextPos) then
        begin
            Result := CheckSubItems(Stack, Parent, Node, Count + 1,
                                    Options, MaskInput, NrOfMatches);
        end;
    end;
end;

procedure TtsTextMask.CheckCaseOptions(Node: TtsPictureNode; var Options: TtsMaskOptions);
var
    Pos, Chars: Integer;
begin
    Pos := Node.StartPos;
    Chars := Node.CharCount;
    if Picture[Pos] = tsPicUpper then
    begin
        Options := Options - [moLower, moOptLower, moUpper, moOptUpper];
        if Chars = 1 then Include(Options, moOptUpper)
                     else Include(Options, moUpper);
    end
    else if Picture[Pos] = tsPicLower then
    begin
        Options := Options - [moLower, moOptLower, moUpper, moOptUpper];
        if Chars = 1 then
            Include(Options, moOptLower)
        else if Picture[Pos+1] = tsPicLower then
            Include(Options, moLower);
    end;
end;

function GetMatchedLen(Str1: string; Str2: string): Integer;
var
    Pos: Integer;
begin
    Result := 0;

    Pos := 0;
    while (Pos < Length(Str1)) and (Pos < Length(Str2)) do
    begin
        Pos := Pos + 1;
        if Str1[Pos] <> Str2[Pos] then break;
        Result := Result + 1
    end;
end;

function TtsTextMask.CheckSubItems(Stack: TtsParseStack; Parent: Integer; Node: TtsPictureNode;
                                   Count: Integer; Options: TtsMaskOptions;
                                   var MaskInput: TtsMaskInput; var NrOfMatches: Integer): Boolean;
var
    StackPos: Integer;
    CurOptions: TtsMaskOptions;
    OldInput: TtsMaskInput;
    Matched: Boolean;
    MatchLen: Integer;
    CurNrOfMatches: Integer;
begin
    Result := False;
    if not Assigned(Node) then Exit;
    if (Count = 0) and (not Node.Optional) then Inc(Count);
    if (Node.Count <> -1) and (Count > Node.Count) then Exit;

    OldInput := MaskInput;
    StackPos := Stack.Push(Parent, Node, MaskInput.TextPos, Count);
    if Count = 0 then
        Result := CheckNextItems(Stack, StackPos, Options, MaskInput, NrOfMatches)
    else if Node.NodeType = pntCase then
    begin
        CurOptions := Options;
        CheckCaseOptions(Node, CurOptions);
        Result := CheckNextItems(Stack, StackPos, CurOptions, MaskInput, NrOfMatches);
    end
    else if Node.NodeType = pntLiteralChars then
    begin
        CurNrOfMatches := NrOfMatches;
        Matched := False;
        Result := CheckLiterals(Node, MaskInput, Options, Matched);
        if Result and ((MaskInput.TextPos <= Length(MaskInput.Text)) or (moFullCompare in Options)) then
        begin
            Result := CheckNextItems(Stack, StackPos, Options, MaskInput, NrOfMatches);
            if (not Result) and Matched and (CurNrOfMatches = NrOfMatches) and
               CanInsertLiteral(OldInput, Options) then
            begin
                MaskInput := OldInput;
                Result := CheckLiterals(Node, MaskInput, Options, Matched);
                if Result and ((MaskInput.TextPos <= Length(MaskInput.Text)) or (moFullCompare in Options)) then
                    Result := CheckNextItems(Stack, StackPos, Options, MaskInput, NrOfMatches);
            end;
        end;
    end
    else if Node.NodeType <> pntGroup then
    begin
        Result := CheckItem(Node, MaskInput, Options);
        if Result and ((MaskInput.TextPos <= Length(MaskInput.Text)) or (moFullCompare in Options)) then
            Result := CheckNextItems(Stack, StackPos, Options, MaskInput, NrOfMatches);
    end
    else
    begin
        Result := CheckSubItems(Stack, StackPos, Node.SubItems, 0, Options,
                                MaskInput, NrOfMatches);
    end;

    if Result then
    begin
        if (not (moCheckUnique in Options)) and (NrOfMatches = 0) then
        begin
            Inc(NrOfMatches);
            MaskInput.MatchedLiterals := MaskInput.Literals;
            MaskInput.InsertChars := Copy(MaskInput.Text, MaskInput.InsertPos, MaskInput.InsertLen);
        end
        else if (moCheckUnique in Options) and
                ((NrOfMatches <= 1) or (MaskInput.MinMatchedLiterals <> '')) then
        begin
            if NrOfMatches = 0 then
            begin
                Result := False;
                NrOfMatches := 1;
                MaskInput.MatchedLiterals := MaskInput.Literals;
                MaskInput.MinMatchedLiterals := MaskInput.Literals;
                MaskInput.InsertChars := Copy(MaskInput.Text, MaskInput.InsertPos, MaskInput.InsertLen);
            end
            else
            begin
                if MaskInput.Literals = MaskInput.MinMatchedLiterals then
                begin
                    Result := False;
                    NrOfMatches := 1;
                    MaskInput.MatchedLiterals := MaskInput.Literals;
                end
                else
                begin
                    MatchLen := GetMatchedLen(MaskInput.MinMatchedLiterals, MaskInput.Literals);
                    if MatchLen <> 0 then
                    begin
                        Result := False;
                        if MaskInput.MatchedLiterals <> MaskInput.MinMatchedLiterals then
                            Inc(NrOfMatches);

                        if MatchLen < Length(MaskInput.MinMatchedLiterals) then
                        begin
                            MaskInput.MinMatchedLiterals := Copy(MaskInput.MinMatchedLiterals, 1, MatchLen);
                        end;

                        if MaskInput.Literals = MaskInput.MinMatchedLiterals then
                        begin
                            NrOfMatches := 1;
                            MaskInput.MatchedLiterals := MaskInput.Literals;
                        end;
                    end
                    else
                    begin
                        Inc(NrOfMatches);
                        MaskInput.MinMatchedLiterals := '';
                    end;
                end;
            end;
        end;
    end;

    if (not Result) then
    begin
        Stack.Pop;
        CopyMaskInput(OldInput, MaskInput);

        if Assigned(Node.NextAlternative) then
        begin
            Result := CheckSubItems(Stack, Parent, Node.NextAlternative, 0,
                                    Options, MaskInput, NrOfMatches);
        end;
    end;
end;

function TtsTextMask.ValidText(const Text: string; FullCompare: Boolean): Boolean;
var
    Stack: TtsParseStack;
    Options: TtsMaskOptions;
    MaskInput: TtsMaskInput;
    NrOfMatches: Integer;
begin
    Result := True;
    if Picture = '' then Picture := tsPicAllChars;
    if not Assigned(PictureList) then Exit;
    if not Assigned(PictureList.StartNode) then Exit;

    Stack := TtsParseStack.Create;
    try
        Options := [];
        if FullCompare then Include(Options, moFullCompare);

        NrOfMatches := 0;
        MaskInput := SetMaskInput(Text, 1, 0, 0);
        Result := CheckSubItems(Stack, 0, PictureList.StartNode, 0, Options,
                                MaskInput, NrOfMatches);
    finally
        Stack.Free;
    end;
end;

function TtsTextMask.CheckInput(Stack: TtsParseStack; MaskInput: TtsMaskInput;
                                Options: TtsMaskOptions; var InsertChars: string): Boolean;
var
    NrOfMatches: Integer;
begin
    Stack.Reset;
    NrOfMatches := 0;
    CheckSubItems(Stack, 0, PictureList.StartNode, 0, Options, MaskInput, NrOfMatches);

    Result := (NrOfMatches = 1);
    if Result then
    begin
        InsertChars := MaskInput.InsertChars;
        if (MaskInput.MatchedLiterals <> '') then
            InsertChars := MaskInput.MatchedLiterals + InsertChars;
    end;
end;

function TtsTextMask.ValidInput(const Text: string; var InsertChars: string; InsertPos: Integer;
                                FullCompare, AutoFill: Boolean): Boolean;
var
    Stack: TtsParseStack;
    CheckText: string;
    MaskInput: TtsMaskInput;
    CmpOptions, Options: TtsMaskOptions;
begin
    Result := True;
    if Picture = '' then Picture := tsPicAllChars;
    if not Assigned(PictureList) then Exit;
    if not Assigned(PictureList.StartNode) then Exit;

    if InsertPos <= 0 then InsertPos := 1;
    if InsertPos > Length(Text) then InsertPos := Length(Text) + 1;

    CmpOptions := [];
    if FullCompare then Include(CmpOptions, moFullCompare);
    CheckText := Copy(Text, 1, InsertPos - 1) + InsertChars;
    MaskInput := SetMaskInput(CheckText, 1, InsertPos, Length(InsertChars));

    Stack := TtsParseStack.Create;
    try
        Options := CmpOptions;
        Result := CheckInput(Stack, MaskInput, Options, InsertChars);

        if not Result then
        begin
            Options := CmpOptions + [moConvertInput];
            Result := CheckInput(Stack, MaskInput, Options, InsertChars);
        end;

        if (not Result) and AutoFill then
        begin
            Options := CmpOptions + [moInsertLiteral, moCheckUnique];
            Result := CheckInput(Stack, MaskInput, Options, InsertChars);
        end;

        if (not Result) and (AutoFill) then
        begin
            Options := CmpOptions + [moInsertLiteral, moConvertInput, moCheckUnique];
            Result := CheckInput(Stack, MaskInput, Options, InsertChars);
        end;
    finally
        Stack.Free;
    end;
end;

{TtsMask}

constructor TtsMask.Create(Collection: TCollection);
var
    Parent: TComponent;
begin
    inherited;
    FTextMask := TtsTextMask.Create(Self);
    FAutoFill := [Low(TtsMaskCheck)..High(TtsMaskCheck)];
    FEvaluate := [Low(TtsMaskCheck)..High(TtsMaskCheck)];

    FUpdateCount := 0;
    FPicture := '';
    FTextCase := TtsTextCase.Create(Self);

    Parent := ParentComponent;
    if Assigned(Parent) then
    begin
        if Parent is TtsMaskDefs then
            OnParseError := TtsMaskDefs(Parent).DoParseError;
    end;
end;

destructor TtsMask.Destroy;
begin
    FTextMask.Free;
    FTextCase.Free;
    inherited;
end;

procedure TtsMask.InvalidOp(Msg: string);
var
    Parent: TComponent;
begin
    Parent := ParentComponent;
    if Parent <> nil then Msg := Parent.Name + ': ' + Msg;
    raise EtsMaskError.Create(Msg)
end;

function TtsMask.ParentComponent: TComponent;
begin
    Result := nil;
    if Collection is TtsMaskCollection then
        Result := TtsMaskCollection(Collection).FMaskDefs;
end;

procedure TtsMask.BeginUpdate;
begin
    Inc(FUpdateCount);
end;

procedure TtsMask.EndUpdate;
begin
    Dec(FUpdateCount);
    Changed;
end;

procedure TtsMask.Assign(Source: TPersistent);
begin
    if Source is TtsMask then
    begin
        BeginUpdate;
        try
            AutoFill := TtsMask(Source).AutoFill;
            Evaluate := TtsMask(Source).Evaluate;
            Name := TtsMask(Source).Name;
            TextCase := TtsMask(Source).TextCase;
            Picture := TtsMask(Source).Picture;
        finally
            EndUpdate;
        end;
    end;
end;

function TtsMask.ValidText(const Text: string; FullCompare: Boolean): Boolean;
begin
    Result := True;
    if (Picture = '') and ((TextCase.CaseType = cstNone) or TextCase.Optional) then Exit;
    Result := TextMask.ValidText(Text, FullCompare);
end;

function TtsMask.ValidInput(const Text: string; var InsertChars: string; InsertPos: Integer;
                            FullCompare, AutoFill: Boolean): Boolean;
begin
    Result := True;
    if (Picture = '') and (TextCase.CaseType = cstNone) then Exit;
    Result := TextMask.ValidInput(Text, InsertChars, InsertPos, FullCompare, AutoFill);
end;

procedure TtsMask.SetAutoFill(Value: TtsMaskChecks);
begin
    if FAutoFill <> Value then
    begin
        FAutoFill := Value;
        Changed;
    end;
end;

procedure TtsMask.SetEvaluate(Value: TtsMaskChecks);
begin
    if FEvaluate <> Value then
    begin
        FEvaluate := Value;
        Changed;
    end;
end;

procedure TtsMask.CheckName(Value: string);
var
    Mask: TtsMask;
begin
    if Assigned(Collection) then
    begin
        if Collection is TtsMaskCollection then
        begin
            Mask := TtsMaskCollection(Collection).Items[Value];
            if Assigned(Mask) and (Mask <> Self) then
                InvalidOp(Format(StsMaskNotUnique, [Value]));
        end;
    end;
end;

procedure TtsMask.SetName(Value: string);
begin
    if FName <> Value then
    begin
        CheckName(Value);
        FName := Value;
        Changed;
    end;
end;

function TtsMask.CheckRaise: Boolean;
var
    State: TComponentState;
begin
    Result := True;
    if Collection is TtsMaskCollection then
    begin
        State := TtsMaskCollection(Collection).FMaskDefs.ComponentState;
        Result := not ((csReading in State) and (csDesigning in State));
    end;
end;

procedure TtsMask.SetPicture(Value: string);
begin
    try
        try
            TextMask.Picture := Value;
        finally
            FPicture := TextMask.Picture;
            Changed;
        end;
    except
        if CheckRaise then raise;
    end;
end;

procedure TtsMask.SetTextCase(Value: TtsTextCase);
begin
    if FTextCase <> Value then
    begin
        BeginUpdate;
        try
            TextCase.Assign(Value);
        finally
            EndUpdate;
        end;
    end;
end;

function TtsMask.GetAutoFill: TtsMaskChecks;
begin
    Result := FAutoFill;
end;

function TtsMask.GetEvaluate: TtsMaskChecks;
begin
    Result := FEvaluate;
end;

function TtsMask.GetName: string;
begin
    Result := FName;
end;

function TtsMask.GetPicture: string;
begin
    Result := FPicture;
end;

function TtsMask.GetTextCase: TtsTextCase;
begin
    Result := FTextCase;
end;

function TtsMask.GetOnChange: TNotifyEvent;
begin
    Result := FOnChange;
end;

procedure TtsMask.SetOnChange(Value: TNotifyEvent);
begin
    FOnChange := Value;
end;

function TtsMask.GetOnParseError: TtsMaskErrorEvent;
begin
    Result := FOnParseError;
end;

procedure TtsMask.SetOnParseError(Value: TtsMaskErrorEvent);
begin
    FOnParseError := Value;
end;

procedure TtsMask.Changed;
begin
    if FUpdateCount = 0 then DoChange;
end;

procedure TtsMask.DoChange;
begin
    if Assigned(FOnChange) then FOnChange(Self);
end;

function TtsMask.GetDisplayName: string;
begin
    Result := Name;
end;

procedure TtsMask.DoParseError(Msg: string; var RaiseError: Boolean);
begin
    RaiseError := True;
    if Assigned(FOnParseError) then
        FOnParseError(Self, Msg, RaiseError);
end;

{TtsMaskDefs}

constructor TtsMaskDefs.Create(AOwner: TComponent);
begin
    inherited;
    FMasks := TtsMaskCollection.Create(Self, TtsMask);
    FLinks := TList.Create;
end;

destructor TtsMaskDefs.Destroy;
begin
    RemoveLinks;
    FLinks.Free;
    FMasks.Free;
    inherited;
end;

procedure TtsMaskDefs.RemoveLink(MaskLink: TtsMaskLink);
begin
    MaskLink.FMaskDefs := nil;
    FLinks.Remove(MaskLink);
end;

procedure TtsMaskDefs.AddLink(MaskLink: TtsMaskLink);
begin
    FLinks.Add(MaskLink);
    MaskLink.FMaskDefs := Self;
end;

procedure TtsMaskDefs.RemoveLinks;
var
    I: Integer;
    Link: TtsMaskLink;
begin
    for I := FLinks.Count - 1 downto 0 do
    begin
        Link := TtsMaskLink(FLinks.Items[I]);
        RemoveLink(Link);
        Link.MaskDefsDeleted;
    end;
end;

function TtsMaskDefs.GetMask(Index: Variant): TtsMaskItem;
begin
    Result := Masks[Index];
end;

procedure TtsMaskDefs.SetMask(Index: Variant; Value: TtsMaskItem);
begin
    if Value is TtsMask then Masks[Index] := TtsMask(Value);
end;

procedure TtsMaskDefs.SetMasks(Value: TtsMaskCollection);
begin
    Masks.Assign(Value);
end;

procedure TtsMaskDefs.CheckErrorEvent(Mask: TtsMask);
var
    I: Integer;
begin
    if Mask <> nil then
        Mask.OnParseError := DoParseError
    else
    begin
        for I := 0 to Masks.Count - 1 do
            Masks[I].OnParseError := DoParseError;
    end;
end;

procedure TtsMaskDefs.Changed(Mask: TtsMask);
var
    I: Integer;
begin
    CheckErrorEvent(Mask);
    for I := 0 to FLinks.Count - 1 do
        TtsMaskLink(FLinks.Items[I]).MaskChanged(Mask);
end;

procedure TtsMaskDefs.DoParseError(Sender: TObject; Msg: string;
                                   var RaiseError: Boolean);
begin
    RaiseError := True;
    if csReading in ComponentState then
    begin
        RaiseError := False;
        if not (csDesigning in ComponentState) then
            MessageDlg(Msg, mtInformation, [mbOk], 0);
    end;
end;

{TtsMaskCollection}

constructor TtsMaskCollection.Create(MaskDefs: TtsMaskDefs; MaskClass: TtsMaskClass);
begin
    inherited Create(MaskClass);
    FMaskDefs := MaskDefs;
end;

function TtsMaskCollection.NameIndex(Name: string): Integer;
var
    I: Integer;
begin
    Result := -1;
    for I := 0 to Count - 1 do
    begin
        if AnsiStrIComp(PChar(Items[I].Name), PChar(Name)) = 0 then
        begin
            Result := I;
            Break;
        end;
    end;
end;

function TtsMaskCollection.GetMask(Index: Variant): TtsMask;
var
    IndexNr: Integer;
begin
    Result := nil;
    case VarType(Index) of
        varString:
            begin
                IndexNr := NameIndex(Index);
                if IndexNr >= 0 then Result := TtsMask(inherited Items[IndexNr]);
            end;
    else
            Result := TtsMask(inherited Items[Index]);
    end;
end;

procedure TtsMaskCollection.SetMask(Index: Variant; Value: TtsMask);
var
    Mask: TtsMask;
begin
    Mask := Items[Index];
    if Mask <> nil then
    begin
        Mask.Assign(Value);
    end;
end;

function TtsMaskCollection.GetOwner: TPersistent;
begin
    Result := MaskDefs;
end;

procedure TtsMaskCollection.Update(Item: TCollectionItem);
begin
    FMaskDefs.Changed(TtsMask(Item));
end;

function TtsMaskCollection.Add: TtsMask;
begin
    Result := TtsMask(inherited Add);
end;

function TtsMaskCollection.FindUniqueName(Item: TCollectionItem): string;
var
    Index: Integer;
begin
    Index := Item.Index;
    Result := 'Mask' + IntToStr(Index);
    while NameIndex(Result) >= 0 do
    begin
        Index := Index + 1;
        Result := 'Mask' + IntToStr(Index);
    end;
end;

procedure TtsMaskCollection.SetItemName(Item: TCollectionItem);
var
    Name: string;
begin
    if csReading in FMaskDefs.ComponentState then Exit;
    {$IFNDEF TSVER_V3}
    Name := FindUniqueName(Item);
    {$ELSE}
    Name := 'Mask' + IntToStr(Item.Index);
    if NameIndex(Name) >= 0 then Name := 'Mask' + IntToStr(Item.ID);
    {$ENDIF}
    TtsMask(Item).Name := Name;
end;

{TtsMaskLink}

constructor TtsMaskLink.Create;
begin
    inherited;
    FMaskDefs := nil;
end;

destructor TtsMaskLink.Destroy;
begin
    MaskDefs := nil;
    inherited;
end;

procedure TtsMaskLink.SetMaskDefs(Value: TtsMaskDefsComponent);
begin
    if FMaskDefs <> Value then
    begin
        if Assigned(FMaskDefs) then FMaskDefs.RemoveLink(Self);
        if Assigned(Value) then Value.AddLink(Self);
    end;
end;

procedure TtsMaskLink.MaskChanged(Mask: TtsMaskItem);
begin
end;

procedure TtsMaskLink.MaskDefsDeleted;
begin
end;

function TtsMaskLink.GetMask(Name: string): TtsMaskItem;
begin
    Result := nil;
    if (Name = '') or (not Assigned(FMaskDefs)) then Exit;
    Result := FMaskDefs.Mask[Name];
end;

end.

{*******************************************************}
{                                                       }
{       ObjectSight Visual Components                   }
{       TopGrid general classes and functions           }
{                                                       }
{       Copyright (c) 1997 - 1999, ObjectSight          }
{                                                       }
{*******************************************************}

unit TSCommon;

{$INCLUDE TSCmpVer}

interface

uses
    Classes, TypInfo, Windows, Graphics, Controls, StdCtrls, Registry, Dialogs,
    TSSetLib, TSMbcs {$IFDEF TSVER_V6}, Variants {$ENDIF};

const
    VK_A = Ord('A');
    VK_C = Ord('C');
    VK_V = Ord('V');
    VK_X = Ord('X');
    VK_Z = Ord('Z');
    CTRL_A = 1;
    CTRL_C = 3;
    CTRL_V = 22;
    CTRL_X = 24;
    CTRL_Z = 26;

    tsYMD = 0;
    tsMDY = 1;
    tsDMY = 2;

type
    TtsHorzAlignment   = (htaLeft, htaRight, htaCenter, htaDefault);
    TtsVertAlignment   = (vtaTop, vtaBottom, vtaCenter, vtaDefault);

    PtsIntegerArray = ^TtsIntegerArray;
    TtsIntegerArray = array[0..MaxListSize] of Integer;
    PtsPointerArray = ^TtsPointerArray;
    TtsPointerArray = array[0..(MaxListSize div ((SizeOf(Pointer) div SizeOf(LongInt)) + 1))] of Pointer;

    TosMaskEntry = class
    private
      FPicture : String;
      FName : String;
      FSystem : Boolean;
    protected
      function GetDisplayName : String;
      function GetStorageText : String;
      procedure SetStorageText(Value : String);
    public
      property Picture : String read FPicture write FPicture;
      property Name : String read FName write FName;
      property System : Boolean read FSystem write FSystem;
      property DisplayName : String read GetDisplayName;
      property StorageText : String read GetStorageText write SetStorageText;
    end;

    {TtsMemoryCanvas}
    {This class encapsulates an in memory canvas used by controls to
     draw on, after which the redrawn area is displayed on screen}

    TtsMemoryCanvas = class(TObject)
    protected
        FDc: Hdc;
        FWidth: Integer;
        FHeight: Integer;
        FCount: Integer;
        FMutex: THandle;
        FLockingThreadId: DWord;
        FLockingObject: TObject;

    public
        constructor Create;
        destructor  Destroy; override;

        procedure Prepare(Dc: Hdc; Width, Height: Integer);
        procedure Resize(Dc: Hdc; Width, Height: Integer);
        procedure Release;
        procedure FreeDc;
        procedure SetObjects(var Rect : TRect);
        procedure Lock(AObject: TObject);
        procedure Unlock;
        function  GetMutex: THandle;
        function  Locked(AObject: TObject): Boolean;

        property Dc: Hdc read FDc write FDc;
        property Width: Integer read FWidth write FWidth;
        property Height: Integer read FHeight write FHeight;
        property Count: Integer read FCount write FCount;
        property Mutex: THandle read GetMutex write FMutex;
    end;

    TtsBitmapElement = class(TtsSetElement)
    protected
        FBitmap: TBitmap;
        FCount: Longint;
        FBitmapID: Longint;
        FCanFree: Boolean;
    public
        constructor Create(Bitmap: TBitmap);
        destructor Destroy; override;

        function  Compare(NodeSet: TtsCustomSet; Value : TtsSetElement) : TtsSetOrder; override;
        function  CompareKey(NodeSet: TtsCustomSet; const KeyValue : array of const) : TtsSetOrder; override;

        property Bitmap: TBitmap read FBitmap;
        property BitmapID: Longint read FBitmapID write FBitmapID;
        property CanFree: Boolean read FCanFree write FCanFree;
        property Count: Longint read FCount write FCount;
    end;

    TtsBitmapSet = class(TtsObjectSet)
    protected
        procedure AddElement(Element: TtsBitmapElement);
        function  GetBitmap(Bitmap: TBitmap): TtsBitmapElement;
        function  AddBitmap(Bitmap: TBitmap): TtsBitmapElement;
        procedure RemoveBitmap(Bitmap: TBitmap);
    end;

    {Tts2DStorage}
    {This class is used for storing values in a 2-dimensional dynamic
     data structure. Cell entries are initially empty and created as
     needed.}

    TtsValueType = (vtpNone, vtpString, vtpInteger, vtpPicture, vtpPictureName, vtpNull);
    Pts2DDataStorage = ^Tts2DDataStorage;
    Pts2DDataType = ^Tts2DDataType;
    PtsRowDataType = ^TtsRowDataType;
    PtsColsInRow = ^TtsColsInRow;
    PtsRowData = ^TtsRowData;
    Tts2DDataStorage = array[0..(MaxListSize div ((SizeOf(PtsRowData) div SizeOf(LongInt)) + 1))] of PtsRowData;
    Tts2DDataType = array[0..(MaxListSize div ((SizeOf(PtsRowDataType) div SizeOf(LongInt)) + 1))] of PtsRowDataType;
    TtsRowDataType = array[0..(MaxListSize div ((SizeOf(TtsValueType) div SizeOf(LongInt)) + 1))] of TtsValueType;
    TtsRowData = array[0..(MaxListSize div ((SizeOf(Pointer) div SizeOf(LongInt)) + 1))] of Pointer;
    TtsColsInRow = array[0..MaxListSize] of Integer;

    Tts2DStorage = Class(TObject)
    protected
        FColsAllocSize: Integer;
        FRowsAllocSize: Integer;
        FData: Pts2DDataStorage;
        FDataType: Pts2DDataType;
        FRowsInData: Integer; //Nr of Rows allocated
        FColsInRow: PtsColsInRow; //Nr of cols in use per row
        FColsAllocInRow: PtsColsInRow; //Nr of cols allocated per row
        FInDesignMode: Boolean;

        procedure SetBitmapValue(DataCol, DataRow: Longint; CurValueType: TtsValueType; Bitmap: TBitmap);
        procedure CopyRow(FromRow, ToRow: Integer);
        procedure WriteInteger(Stream: TStream; Col, Row: Integer);
        procedure ReadInteger(Stream: TStream; Col, Row: Integer);
        procedure WriteString(Stream: TStream; Col, Row: Integer);
        procedure ReadString(Stream: TStream; Col, Row: Integer; ValueType: TtsValueType);
        procedure WritePicture(Stream: TStream; Col, Row: Integer; BmpSet: TtsBitmapSet; BmpList: TList);
        procedure ReadPicture(Stream: TStream; Col, Row: Integer; BmpList: TList);
        procedure WriteBitmapList(Stream: TStream; BmpList: TList);
        procedure ReadBitmapList(Stream: TStream; BmpList: TList);
        procedure CheckCreateRow(DataRow: Integer);
        procedure CheckCreateCol(DataCol, DataRow: Integer);

    public
        constructor Create(Cols, Rows: Integer);
        destructor  Destroy; override;

        procedure Assign(Source: Tts2DStorage); virtual;
        procedure BackupRow(DataRow: Integer); virtual;
        procedure Clear(StartRow: Integer; Resize: Boolean);
        procedure ClearBackupRow; virtual;
        procedure ClearRow(DataRow: Integer; ColsInRow: Integer);
        procedure ClearCol(DataCol: Integer);
        procedure ClearValue(DataCol, DataRow: Integer);
        procedure DeleteCols(FromCol, ToCol: Integer); virtual;
        procedure DeleteRows(FromRow, ToRow: Integer); virtual;
        function  GetValue(DataCol, DataRow: Integer): Variant; virtual;
        function  GetValueType(DataCol, DataRow: Integer): TtsValueType; virtual;
        procedure LoadFromStream(Stream: TStream; ColNumbers: TList); virtual;
        function  MaxColValueSet(DataRow: Integer): Integer;
        function  MaxRowSet: Integer;
        procedure ResizeRows(NewSize: Integer);
        procedure ResizeRowCols(DataRow: Integer; NewSize: Integer);
        procedure RestoreBackupRow(DataRow: Integer); virtual;
        property  RowsInData: Integer read FRowsInData;
        procedure SaveToStream(Stream: TStream); virtual;
        procedure SetValue(DataCol, DataRow: Integer; Value: Variant; ValueType: TtsValueType); virtual;

        property ColsAllocSize: Integer read FColsAllocSize write FColsAllocSize;
        property RowsAllocSize: Integer read FRowsAllocSize write FRowsAllocSize;
    end;


    TtsStack = class(TObject)
    protected
        FValueList: TList;
        function GetValueList: TList;
    public
        constructor Create;
        destructor  Destroy; override;

        procedure Push(Value: integer);
        function Pop: integer;
        function CurValue: integer;
        property ValueList: TList read GetValueList write FValueList;
    end;


function  CalcMax(First, Second: Longint): Longint;
function  CalcMin(First, Second: Longint): Longint;
procedure SwapLongint(var High, Low: Longint);
function  Sign(Value: Integer): Integer;
function  PointInRect(APoint: TPoint; ARect: TRect): Boolean;

function  StrNScan(Text : PChar; Chr : Char; Chars : Cardinal) : PChar;
function  StrRNScan(Text : PChar; Chr : Char; Chars : Cardinal): PChar;
function  AnsiStrNScan(Text : PChar; Chr : Char; Chars : Cardinal): PChar;
function  AnsiStrRNScan(Text : PChar; Chr : Char; Chars : Cardinal): PChar;
function  CheckEscapeChars(Str: string; CheckChar, EscapeChar: Char): string;

function  VariantToObject(Value: Variant): TObject;
function  ObjectToVariant(Value: TObject): Variant;
function  VariantToBitmap(Value: Variant): TBitmap;
function  BitmapToVariant(Value: TBitmap): Variant;
procedure WriteVariant(Writer: TWriter; Value: Variant);
function  ReadVariant(Reader: TReader): Variant;
function  CompareVariant(Value1, Value2: Variant): Integer;
function  IsNumVar(const Value: Variant): Boolean;
function  VariantEqual(var1, var2: variant): Boolean;
function  EqualPropValue(Var1, Var2: Variant): Boolean;

function  GetDateOrder: Integer;
function  GetEditDateFormat(IncludeCentury: Boolean): string;
function  StringToDateTime(Value: string): TDateTime;
function  VariantToDateTime(Value: Variant): TDateTime;
function  LongYearFormat(Fmt: string): string;
function  LongHourFormat(Fmt: string): string;
function  AMPMFormat: Boolean;
function  DateReplaceMonthName(DateStr: string): string;
function  DateRemoveDayName(DateStr: string): string;

function  CheckBoxValuesOk(CheckBoxValues: string): Boolean;
function  CheckBoxToString(Value: TCheckBoxState; CheckBoxValues: string): string;
function  StringToCheckBox(Value: string; CheckBoxValues: string): TCheckBoxState;
function  CheckBoxToVariant(Value: TCheckBoxState; CheckBoxValues: string): Variant;
function  VariantToCheckBox(Value: Variant; CheckBoxValues: string): TCheckBoxState;

function  ResourceStr(StrCode: Variant): string;
function  TextAccelKey(Value: string; var AccelKeyPos: Integer): string;
function  CreateStringList(Strings: string): TStringList;
function  StringInList(PName: PShortString; List: TStringList): Boolean;

procedure SeparateFirstPart(var Remainder, Item: string; Separator: string);
function  AddPictureIds(Value: string; ImageListIndex, ImageId: Integer): string;
function  SeparatePictureIds(Value: string; var ComponentId, ImageId: Integer): string;

function  GetPropertyList(Obj: TObject; TypeKinds: TTypeKinds; var PropCount: Integer): PPropList;
procedure FreePropertyList(PropList: PPropList; PropCount: Integer);
procedure AssignPropertyValue(PropInfo: PPropInfo; ToObject, FromObject: TObject);
procedure AssignNameValue(PropName: string; ToObject, FromObject: TObject);
procedure AssignObject(ToObject, FromObject: TObject; NoAssignProps: string);

function  OpenRegistryKey(const Key: string; CanCreate: Boolean): TRegistry;
function  GetRegStrValue(RootKey: HKey; const Key: string; const ValueName: string): string;
procedure InitCanvas(Canvas: TCanvas);
procedure FreeNil(var AObject: TObject);
function  AlignmentToHorzAlignment(Alignment: TAlignment; Align: Boolean): TtsHorzAlignment;
function  HorzAlignmentToAlignment(HorzAlignment: TtsHorzAlignment): TAlignment;
function  HorzAlignmentToAlign(HorzAlignment: TtsHorzAlignment): Boolean;

function ScanNum(S: string; Pos: Integer; Direction: Integer): Integer;
function ScanNumChars(S: string; Pos: Integer; Direction: Integer): Integer;
function IncStrNum(S: string; Increment: Double): string;
function IncStrAtPos(S: string; Increment: Extended; APos: Integer; var StartPos, Len: Integer): string;
function PadDecimals(Sample: string; NumStr: string): string;
function PadNumber(Sample: string; NumStr: string): string;

function ControlFocused(Control: TWinControl): Boolean;
function ControlVisible(Control: TWinControl): Boolean;
function IsControlHandle(Handle: Hwnd; Control: TWinControl): Boolean;

function CheckForWhiteSpace(theText : String) : String;
function GetCompilerVersion: string;
procedure ShowHelpTopic(Handle: Hdc; Key: string);

implementation

uses
    SysUtils;

const
    StrHKEY_CLASSES_ROOT = 'HKEY_CLASSES_ROOT';
    StrHKEY_CURRENT_USER = 'HKEY_CURRENT_USER';
    StrHKEY_LOCAL_MACHINE = 'HKEY_LOCAL_MACHINE';
    StrHKEY_USERS = 'HKEY_USERS';
    StsUnknownRegistryKey = 'Unknown registry key %s';
    IdSeparator = #1;
    CheckBoxValueSeparator = '|';
    StrCheckBoxNull = 'Null';

    HelpSubDir = 'Help';
    RootKeyName = 'RootDir';

    Delphi3RootDirKey = 'Software\Borland\Delphi\3.0';
    Delphi4RootDirKey = 'Software\Borland\Delphi\4.0';
    Delphi5RootDirKey = 'Software\Borland\Delphi\5.0';
    CBuilder3RootDirKey = 'Software\Borland\C++Builder\3.0';
    CBuilder4RootDirKey = 'Software\Borland\C++Builder\4.0';

    Delphi3Help = 'DELPHI3';
    Delphi4Help = 'DELPHI4';
    Delphi5Help = 'DELPHI5';
    CBuilder3Help = 'BCB3';
    CBuilder4Help = 'BCB4';

type
    TReader_ = class(TReader) end;

var
    FInternalBitmaps: TtsBitmapSet = nil;

function CheckForWhiteSpace(theText : String) : String;
var i, iLen : Integer;
begin
    iLen := Length(theText);
    Result := '';
    for i := 1 to iLen do
    begin
      if theText[i] = '&' then
         Result := Result + '&amp;'
      else if theText[i] = '''' then
         Result := Result + '&apos;'
      else if theText[i] = '"' then
         Result := Result + '&quot;'
      else
         Result := Result + theText[i];
    end;
end;

function GetInternalBitmap(Bitmap: TBitmap): TtsBitmapElement;
begin
    Result := nil;
    if Assigned(FInternalBitmaps) then
        Result := FInternalBitmaps.GetBitmap(Bitmap);
end;

function CreateInternalBitmap: TtsBitmapElement;
begin
    if not Assigned(FInternalBitmaps) then
        FInternalBitmaps := TtsBitmapSet.Create;
    Result := FInternalBitmaps.AddBitmap(TBitmap.Create);
    if Assigned(Result) then
    begin
        Result.CanFree := True;
    end;
end;

procedure CheckInternalBitmap(Bitmap: TBitmap; Remove: Boolean);
var
    Element: TtsBitmapElement;
begin
    if not Assigned(FInternalBitmaps) then Exit;

    if Remove then
    begin
        if Assigned(FInternalBitmaps) then
            FInternalBitmaps.RemoveBitmap(Bitmap);
    end
    else
    begin
        Element := GetInternalBitmap(Bitmap);
        if Assigned(Element) then Element.Count := Element.Count + 1;
    end;
end;

function CalcMax(First, Second: Longint): Longint;
begin
    if First >= Second then Result := First
                       else Result := Second;
end;

function CalcMin(First, Second: Longint): Longint;
begin
    if First <= Second then Result := First
                       else Result := Second;
end;

procedure SwapLongint(var High, Low: Longint);
var
    Temp: Longint;
begin
    Temp := High;
    High := Low;
    Low := Temp;
end;

function Sign(Value: Integer): Integer;
begin
    if Value > 0 then
        Result := 1
    else if Value < 0 then
        Result := -1
    else
        Result := 0;
end;

function PointInRect(APoint: TPoint; ARect: TRect): Boolean;
begin
    Result := (APoint.X >= ARect.Left) and (APoint.X <= ARect.Right) and
              (APoint.Y >= ARect.Top) and (APoint.Y <= ARect.Bottom);
end;

function StrNScan(Text : PChar; Chr : Char; Chars : Cardinal): PChar; assembler;
asm
        PUSH    EDI
        MOV     EDI,Text
        MOV     ECX,Chars
        MOV     EAX,0
        CMP     ECX,0       //Exit if Chars = 0
        JE      @@1
        MOV     AL,Chr
        REPNE   SCASB
        MOV     EAX,0
        JNE     @@1
        MOV     EAX,EDI
        DEC     EAX
@@1:    POP     EDI
end;

function StrRNScan(Text : PChar; Chr : Char; Chars : Cardinal): PChar; assembler;
asm
        PUSH    EDI
        ADD     EAX,Chars
        MOV     EDI,EAX
        MOV     ECX,Chars
        MOV     EAX,0
        CMP     ECX,0       //Exit if Chars = 0
        JE      @@1
        STD
        DEC     EDI
        MOV     AL,Chr
        REPNE   SCASB
        MOV     EAX,0
        JNE     @@1
        MOV     EAX,EDI
        INC     EAX
@@1:    CLD
        POP     EDI
end;

function AnsiStrNScan(Text : PChar; Chr : Char; Chars : Cardinal): PChar;
var
    CharsDone: Cardinal;
begin
    Result := StrNScan(Text, Chr, Chars);
    while Result <> nil do
    begin
        case StrByteType(Text, Result - Text) of
            mbSingleByte: Break;
            mbLeadByte: Inc(Result);
        end;
        CharsDone := Result - Text + 1;
        Result := StrNScan(Result + 1, Chr, Chars - CharsDone);
    end;
end;

function AnsiStrRNScan(Text : PChar; Chr : Char; Chars : Cardinal): PChar;
begin
    Result := StrRNScan(Text, Chr, Chars);
    while Result <> nil do
    begin
        case StrByteType(Text, Result - Text) of
            mbSingleByte: Break;
            mbTrailByte: Dec(Result);
        end;
        Result := StrRNScan(Text, Chr, Result - Text);
    end;
end;

function CheckEscapeChars(Str: string; CheckChar, EscapeChar: Char): string;
var
    CharPos : Integer;
begin
    Result := '';
    while Str <> '' do
    begin
        CharPos := Pos(CheckChar, Str);
        if CharPos <> 0 then
        begin
            Result := Result + Copy(Str, 1, CharPos - 1) + EscapeChar + Copy(Str, CharPos, 1);
            Str := Copy(Str, CharPos + 1, Length(Str));
        end
        else
        begin
            Result := Result + Str;
            Str := ''
        end;
    end;
end;

function VariantToObject(Value: Variant): TObject;
begin
    Result := TObject(Integer(Value));
end;

function ObjectToVariant(Value: TObject): Variant;
begin
    Result := Integer(Value);
end;

function VariantToBitmap(Value: Variant): TBitmap;
begin
    Result := TBitmap(VariantToObject(Value));
end;

function BitmapToVariant(Value: TBitmap): Variant;
begin
    Result := ObjectToVariant(Value);
end;

procedure WriteVariant(Writer: TWriter; Value: Variant);
begin
    case VarType(Value) of
        varString, varOLEStr: Writer.WriteString(Value);
        varInteger, varSmallInt: Writer.WriteInteger(Value);
        varSingle, varDouble, varDate: Writer.WriteFloat(Value);
        varBoolean: Writer.WriteBoolean(Value);
        varEmpty: Writer.WriteIdent('Empty');
        varNull: Writer.WriteIdent('Null');
    else
        Writer.WriteString('');
    end;
end;

function ReadVariant(Reader: TReader): Variant;
var
    Ident: string;
begin
    Result := Unassigned;
    case TReader_(Reader).NextValue of
        vaString, vaLString: Result := Reader.ReadString;
        vaInt8, vaInt16, vaInt32: Result := Reader.ReadInteger;
        vaExtended: Result := Reader.ReadFloat;
        vaTrue, vaFalse: Result := Reader.ReadBoolean;
        vaIdent:
            begin
                Ident := Reader.ReadIdent;
                if Ident = 'Empty' then Result := Unassigned;
                if Ident = 'Null' then Result := Null;
            end;
    end;
end;

function CompareVariant(Value1, Value2: Variant): Integer;
var
    I, Count: Integer;
    DimCount1, DimCount2: Integer;
begin
    if VarIsEmpty(Value1) then
    begin
        if VarIsEmpty(Value2)
            then begin Result := 0; Exit; end
            else begin Result := -1; Exit; end;
    end;

    if VarIsEmpty(Value2) then
    begin
        Result := -1;
        Exit;
    end;

    if VarIsNull(Value1) then
    begin
        if VarIsNull(Value2)
            then begin Result := 0; Exit; end
            else begin Result := -1; Exit; end;
    end;

    if VarIsNull(Value2) then
    begin
        Result := -1;
        Exit;
    end;

    DimCount1 := VarArrayDimCount(Value1);
    DimCount2 := VarArrayDimCount(Value2);
    if (DimCount1 = 0) and (DimCount2 = 0) then
    begin
        if Value1 < Value2 then
            Result := -1
        else if Value1 > Value2 then
            Result := 1
        else
            Result := 0;
    end
    else
    begin
        Result := 0;
        Count := CalcMax(DimCount1, DimCount2);
        for I := 1 to Count do
        begin
            Result := CompareVariant(Value1[I], Value2[I]);
            if Result <> 0 then Break;
        end;

        if Result = 0 then
        begin
            if DimCount1 < DimCount2 then
                Result := -1
            else if DimCount1 > DimCount2 then
                Result := 1
            else
                Result := 0;
        end;
    end;
end;

function IsNumVar(const Value: Variant): Boolean;
begin
    Result := VarType(Value) in [varSmallint, varInteger, varSingle, varDouble,
                                 varCurrency, varByte];
end;

function VariantEqual(var1, var2: variant): Boolean;
//can be used to compare variants which may be unassigned.
begin
    if (VarIsEmpty(var1) or VarIsEmpty(var2)) then
        Result := (VarIsEmpty(var1) = VarIsEmpty(var2))
    else
    begin
        Result := VarType(var1) = VarType(var2);
        if Result and not VarIsNull(var1) then
            Result := var1 = var2;
    end;
end;

function EqualPropValue(Var1, Var2: Variant): Boolean;
begin
    Result := VariantEqual(Var1, Var2);
    if (not Result) and (VarType(Var1) <> VarType(Var2)) and
       IsNumVar(Var1) and IsNumVar(Var2) then
        Result := Var1 = Var2;
end;

function ScanToNum(S: string; Pos: Integer): Integer;
begin
    Result := Pos;
    while (Result <= Length(S)) and not (S[Result] in ['0'..'9']) do
    begin
        if S[Result] in LeadBytes then Inc(Result);
        Inc(Result);
    end;
end;

function GetDateOrder: Integer;
var
    I: Integer;
begin
    Result := tsMDY;
    I := 1;
    while I <= Length(ShortDateFormat) do
    begin
        case Chr(Ord(ShortDateFormat[I]) and $DF) of
            'E': Result := tsYMD;
            'Y': Result := tsYMD;
            'M': Result := tsMDY;
            'D': Result := tsDMY;
        else
            Inc(I);
            Continue;
        end;
        Break;
    end;
end;

function GetEditDateFormat(IncludeCentury: Boolean): string;
var
    DayFmt, MonthFmt, YearFmt: string;
begin
    if AnsiPos('DD', UpperCase(ShortDateFormat)) <> 0
        then DayFmt := 'DD'
        else DayFmt := 'D';
    if AnsiPos('MM', UpperCase(ShortDateFormat)) <> 0
        then MonthFmt := 'MM'
        else MonthFmt := 'M';
    if IncludeCentury or (AnsiPos('YYY', UpperCase(ShortDateFormat)) <> 0)
        then YearFmt := 'YYYY'
        else YearFmt := 'YY';

    case GetDateOrder of
        tsYMD: Result := YearFmt + DateSeparator + MonthFmt + DateSeparator + DayFmt;
        tsMDY: Result := MonthFmt + DateSeparator + DayFmt + DateSeparator + YearFmt;
        tsDMY: Result := DayFmt + DateSeparator + MonthFmt + DateSeparator + YearFmt;
    else
        Result := MonthFmt + DateSeparator + DayFmt + DateSeparator + YearFmt;
    end;
end;

function GetDateYearString(Value: string): string;
var
    DateOrder: Integer;
    SPos1, SPos2, SPos3: Integer;
    EPos1, EPos2, EPos3: Integer;
begin
    DateOrder := GetDateOrder;
    SPos1 := ScanToNum(Value, 1);
    EPos1 := ScanNum(Value, SPos1, 1);
    SPos2 := ScanToNum(Value, EPos1);
    EPos2 := ScanNum(Value, SPos2, 1);
    SPos3 := ScanToNum(Value, EPos2);
    EPos3 := ScanNum(Value, SPos3, 1);

    Result := '';
    case DateOrder of
        tsYMD:
            Result := Copy(Value, SPos1, EPos1 - SPos1);

        tsMDY, tsDMY:
            if (EPos3 > SPos3) and (SPos3 < Length(Value)) then
                Result := Copy(Value, SPos3, EPos3 - SPos3);
    end;
end;

function StringToDateTime(Value: string): TDateTime;
var
    CharPos: Integer;
    Y, M, D: Word;
    CurY, CurM, CurD: Word;
    DateStr, YearStr: string;
begin
    Value := Trim(Value);
    CharPos := ScanNum(Value, 1, 1);
    if CharPos > Length(Value) then
        Result := StrToInt(Value)
    else if (CharPos >= 1) and (Value[CharPos] = TimeSeparator) then
    begin
        Result := StrToTime(Value);
    end
    else
    begin
        DateStr := DateReplaceMonthName(Value);
        DateStr := DateRemoveDayName(DateStr);
        Result := StrToDateTime(DateStr);
        
        DecodeDate(Result, Y, M, D);
        DecodeDate(Date, CurY, CurM, CurD);
        if Y div 100 = CurY div 100 then
        begin
            YearStr := GetDateYearString(Value);
            if (Length(YearStr) > 2) then
            begin
                Y := StrToInt(Copy(YearStr, 1, 4));
                if Y > 0 then Result := EncodeDate(Y, M, D) + Frac(Result);
            end;
        end;
    end;
end;

function VariantToDateTime(Value: Variant): TDateTime;
begin
    if (VarType(Value) = varString) and (Trim(Value) <> '') then
    begin
        try
            Result := StringToDateTime(Value);
        except
            Result := Date + Time;
        end;
    end
    else if VarType(Value) in [varDate, varDouble] then
        Result := Value
    else
        Result := Date + Time;
end;

function LongYearFormat(Fmt: string): string;
var
    YearPos: Integer;
begin
    Result := Fmt;
    YearPos := Pos('YY', UpperCase(Fmt));
    if YearPos <> 0 then
    begin
        if (YearPos = Length(Fmt) - 1) or
           (not (Fmt[YearPos + 2] in ['y','Y'])) then
        begin
            Result := Copy(Fmt, 1, YearPos + 1) + 'yy' + Copy(Fmt, YearPos + 2, Length(Fmt));
        end;
    end;
end;

function LongHourFormat(Fmt: string): string;
var
    APos: Integer;
    AMPMStr: string;
begin
    Result := Fmt;

    AMPMStr := 'am/pm';
    APos := Pos(AMPMStr, LowerCase(Fmt));
    if APos = 0 then
    begin
        AMPMStr := 'a/p';
        APos := Pos(AMPMStr, LowerCase(Fmt));
    end;

    if APos = 0 then
    begin
        AMPMStr := 'ampm';
        APos := Pos(AMPMStr, LowerCase(Fmt));
    end;

    if APos <> 0 then
    begin
        Result := Trim(Copy(Fmt, 1, APos - 1) + Copy(Fmt, APos + Length(AMPMStr), Length(Fmt)));
    end;
end;

function AMPMFormat: Boolean;
begin
    Result := (TimeAMString <> '') or (TimePMString <> '');
end;

function FullWord(DateStr: string; StartPos, Len: Integer): Boolean;
var
    Chars: Integer;
begin
    Result := True;
    if StartPos > 1 then
    begin
        Chars := PrevCharCount(PChar(DateStr), StartPos - 1);
        if IsCharAlphaNumeric(DateStr[StartPos-Chars]) then Result := False;
    end;

    if Result and (StartPos + Len <= Length(DateStr)) then
    begin
        if IsCharAlphaNumeric(DateStr[StartPos + Len]) then Result := False;
    end;
end;

function DateReplaceMonthName(DateStr: string): string;
var
    CompStr: string;
    MPos, I, Len: Integer;
begin
    CompStr := UpperCase(DateStr);
    for I := 1 to 12 do
    begin
        Len := 0;
        MPos := AnsiPos(UpperCase(LongMonthNames[I]), CompStr);
        if MPos <> 0 then
            Len := Length(LongMonthNames[I])
        else
        begin
            MPos := AnsiPos(UpperCase(ShortMonthNames[I]), CompStr);
            if MPos <> 0 then Len := Length(ShortMonthNames[I]);
        end;

        if (MPos <> 0) and FullWord(DateStr, MPos, Len) then
        begin
            DateStr := Copy(DateStr, 1, MPos - 1) + IntToStr(I) +
                       Copy(DateStr, MPos + Len, Length(DateStr));
            Break;
        end;
    end;
    Result := DateStr;
end;

function DateRemoveDayName(DateStr: string): string;
var
    CompStr: string;
    DPos, I, Len: Integer;
begin
    CompStr := UpperCase(DateStr);
    for I := 1 to 7 do
    begin
        Len := 0;
        DPos := AnsiPos(UpperCase(LongDayNames[I]), CompStr);
        if DPos <> 0 then
            Len := Length(LongDayNames[I])
        else
        begin
            DPos := AnsiPos(UpperCase(ShortDayNames[I]), CompStr);
            if DPos <> 0 then Len := Length(ShortDayNames[I]);
        end;

        if (DPos <> 0) and FullWord(DateStr, DPos, Len) then
        begin
            DateStr := Copy(DateStr, 1, DPos - 1) + Copy(DateStr, DPos + Len, Length(DateStr));
            Break;
        end;
    end;
    Result := DateStr;
end;

function SeparateCheckBoxValues(CheckBoxValues: string; var StrChecked, StrUnchecked, StrGrayed: string): Boolean;
var
    P, S: PChar;
    Separator: string;
begin
    Result := True;
    StrChecked := '';
    StrUnchecked := '';
    StrGrayed := '';
    if Length(CheckBoxValues) = 0 then Exit;

    S := PChar(CheckBoxValues);
    Separator := CheckBoxValueSeparator;
    P := AnsiStrPos(S, PChar(Separator));
    if P = nil then
        StrChecked := CheckBoxValues
    else
    begin
        StrChecked := Copy(CheckBoxValues, 1, Integer(P) - Integer(S));
        S := P + 1;
        P := AnsiStrPos(S, PChar(Separator));
        if P = nil then
            StrUnchecked := Copy(CheckBoxValues, Integer(S) - Integer(PChar(CheckBoxValues)) + 1, Length(CheckBoxValues))
        else
        begin
            StrUnchecked := Copy(CheckBoxValues, Integer(S) - Integer(PChar(CheckBoxValues)) + 1, Integer(P) - Integer(S));
            S := P + 1;
            P := AnsiStrPos(S, PChar(Separator));
            if P = nil then
                StrGrayed := Copy(CheckBoxValues, Integer(S) - Integer(PChar(CheckBoxValues)) + 1, Length(CheckBoxValues))
            else
                StrGrayed := Copy(CheckBoxValues, Integer(S) - Integer(PChar(CheckBoxValues)) + 1, Integer(P) - Integer(S));
        end;
    end;

    Result := (strUnchecked <> '') and (P = nil);
end;

function CheckBoxValuesOk(CheckBoxValues: string): Boolean;
var
    StrChecked, StrUnchecked, StrGrayed: string;
begin
    Result := SeparateCheckBoxValues(CheckBoxValues, StrChecked, StrUnchecked, StrGrayed);
end;

function CheckBoxToString(Value: TCheckBoxState; CheckBoxValues: string): string;
var
    StrChecked, StrUnchecked, StrGrayed: string;
begin
    Result := '';
    SeparateCheckBoxValues(CheckBoxValues, StrChecked, StrUnchecked, StrGrayed);
    case Value of
        cbChecked: Result := StrChecked;
        cbUnchecked: Result := StrUnchecked;
        cbGrayed: Result := StrGrayed;
    end;
end;

function StringToCheckBox(Value: string; CheckBoxValues: string): TCheckBoxState;
var
    StrChecked, StrUnchecked, StrGrayed: string;
begin
    Result := cbGrayed;
    if Length(CheckBoxValues) = 0 then Exit;

    SeparateCheckBoxValues(CheckBoxValues, StrChecked, StrUnchecked, StrGrayed);
    if AnsiCompareText(Value, StrChecked) = 0 then
        Result := cbChecked
    else if AnsiCompareText(Value, StrUnchecked) = 0 then
        Result := cbUnchecked
    else
        Result := cbGrayed;
end;

function CheckBoxToVariant(Value: TCheckBoxState; CheckBoxValues: string): Variant;
var
    StrChecked, StrUnchecked, StrGrayed: string;
begin
    Result := '';
    if Length(CheckBoxValues) = 0 then
    begin
      Result := Value;
      Exit;
    end;

    SeparateCheckBoxValues(CheckBoxValues, StrChecked, StrUnchecked, StrGrayed);
    case Value of
        cbChecked: Result := StrChecked;
        cbUnchecked: Result := StrUnchecked;
        cbGrayed: Result := StrGrayed;
    end;

    if AnsiCompareText(Result, StrCheckBoxNull) = 0 then Result := Null;
end;

function VariantToCheckBox(Value: Variant; CheckBoxValues: string): TCheckBoxState;
var
    StrChecked, StrUnchecked, StrGrayed: string;
begin
    if VarType(Value) = varString then
        Result := StringToCheckBox(Value, CheckBoxValues)
    else if VarType(Value) = varInteger then
        Result := Value
    else if VarIsNull(Value) then
    begin
        SeparateCheckBoxValues(CheckBoxValues, StrChecked, StrUnchecked, StrGrayed);
        if StrChecked = StrCheckBoxNull then
            Result := cbChecked
        else if StrUnchecked = StrCheckBoxNull then
            Result := cbUnchecked
        else
            Result := cbGrayed;
    end
    else
        Result := cbGrayed;
end;

function ResourceStr(StrCode: Variant): string;
begin
    if VarType(StrCode) = varInteger then
        Result := LoadStr(StrCode)
    else
        Result := StrCode
end;

function TextAccelKey(Value: string; var AccelKeyPos: Integer): string;
var
    CurPos: Integer;
    AccelStr: PChar;
begin
    Result := Value;
    AccelKeyPos := 0;

    AccelStr := AnsiStrNScan(PChar(Value), '&', Length(Value));
    if AccelStr <> nil then CurPos := AccelStr - PChar(Value) + 1
                       else CurPos := 0;
    if CurPos = 0 then Exit;

    Result := '';
    while CurPos <> 0 do
    begin
        if (CurPos < Length(Value)) and (Value[CurPos + 1] <> '&') then
            if AccelKeyPos = 0 then AccelKeyPos := Length(Result) + CurPos;

        Result := Result + Copy(Value, 1, CurPos - 1);
        if CurPos + 1 <= Length(Value) then Result := Result + Value[CurPos + 1];

        if CurPos + 2 <= Length(Value)
            then Value := Copy(Value, CurPos + 2, Length(Value) - (CurPos + 1))
            else Value := '';

        AccelStr := AnsiStrNScan(PChar(Value), '&', Length(Value));
        if AccelStr <> nil then CurPos := AccelStr - PChar(Value) + 1
                           else CurPos := 0;
    end;

    Result := Result + Value;
end;

procedure SeparateFirstPart(var Remainder, Item: string; Separator: string);
var
    Position: integer;

begin
    Position := AnsiPos(Separator, Remainder);
    if Position = 0 then
    begin
        Item := Remainder;
        Remainder := '';
    end
    else
    begin
        Item := System.Copy(Remainder, 1, Position - 1);
        Remainder := System.Copy(Remainder, Position + Length(Separator), Length(Remainder) - Position - Length(Separator) + 1);
    end;
end;

function AddPictureIds(Value: string; ImageListIndex, ImageId: Integer): string;
begin
    Result := Value + IdSeparator + IntToStr(ImageListIndex) + IdSeparator + IntToStr(ImageId);
end;

function SeparatePictureIds(Value: string; var ComponentId, ImageId: Integer): string;
var
    strValue, strCompId, strImageId: string;
begin
    strValue := Value;
    ComponentId := -1;
    ImageId := -1;
    SeparateFirstPart(strValue, Result, IdSeparator);
    if Length(strValue) > 0 then
    begin
        SeparateFirstPart(strValue, strCompId, IdSeparator);
        SeparateFirstPart(strValue, strImageId, IdSeparator);
        ComponentId := StrToInt(strCompId);
        ImageId := StrToInt(strImageId);
    end;
end;

function GetPropertyList(Obj: TObject; TypeKinds: TTypeKinds; var PropCount: Integer): PPropList;
begin
    PropCount := GetPropList(Obj.ClassInfo, TypeKinds, nil);
    GetMem(Result, PropCount * SizeOf(PPropInfo));
    GetPropList(Obj.ClassInfo, TypeKinds, Result);
end;

procedure FreePropertyList(PropList: PPropList; PropCount: Integer);
begin
    FreeMem(PropList, PropCount * SizeOf(PPropInfo));
end;

procedure AssignPropertyValue(PropInfo: PPropInfo; ToObject, FromObject: TObject);
begin
    case PropInfo^.PropType^.Kind of
        tkChar, tkWChar, tkEnumeration, tkSet, tkInteger, tkClass:
            SetOrdProp(ToObject, PropInfo, GetOrdProp(FromObject, PropInfo));

        tkFloat:
            SetFloatProp(ToObject, PropInfo, GetFloatProp(FromObject, PropInfo));

        tkMethod:
            SetMethodProp(ToObject, PropInfo, GetMethodProp(FromObject, PropInfo));

        tkString, tkLString:
            SetStrProp(ToObject, PropInfo, GetStrProp(FromObject, PropInfo));

        {$IFDEF TSVER_V3}
        tkWString:
            SetStrProp(ToObject, PropInfo, GetStrProp(FromObject, PropInfo));
        {$ENDIF}

        tkVariant:
            SetVariantProp(ToObject, PropInfo, GetVariantProp(FromObject, PropInfo));

    end;
end;

procedure AssignNameValue(PropName: string; ToObject, FromObject: TObject);
var
    PropInfo: PPropInfo;
begin
    PropInfo := GetPropInfo(FromObject.ClassInfo, PropName);
    if Assigned(PropInfo) then AssignPropertyValue(PropInfo, ToObject, FromObject);
end;

function StringInList(PName: PShortString; List: TStringList): Boolean;
var
    I, CompRes, iMaxLen: Integer;
begin
    Result := False;
    if List = nil then Exit;

    if not List.Sorted then List.Sorted := True;

    for I := 1 to List.Count do
    begin
        iMaxLen := Length(PName^);
        if Length(PChar(List[I-1])) < iMaxLen then
           iMaxLen := Length(PChar(List[I-1]));
        CompRes := AnsiStrLIComp(PChar(@PName^[1]),  PChar(List[I-1]), iMaxLen);
        if (CompRes = 0) and (Length(PName^) = Length(List[I-1])) then Result := True;
        if CompRes <= 0 then Break;
    end;
end;

function CreateStringList(Strings: string): TStringList;
var
    APos: Integer;
    Str: string;
begin
    Result := TStringList.Create;
    APos := Pos(';', Strings);
    while APos <> 0 do
    begin
        Str := Trim(Copy(Strings, 1, APos - 1));
        if Str <> '' then Result.Add(Str);

        Strings := Trim(Copy(Strings, APos + 1, Length(Strings)));
        APos := Pos(';', Strings);
    end;
    if Length(Strings) <> 0 then Result.Add(Trim(Strings));
end;

procedure AssignObject(ToObject, FromObject: TObject; NoAssignProps: string);
var
    I: Integer;
    Count: Integer;
    PropList: PPropList;
    PName: PShortString;
    ExcludeProps: TStringList;
begin
    ExcludeProps := CreateStringList(NoAssignProps);
    try
        PropList := GetPropertyList(FromObject, tkProperties, Count);
        try
            for I := 0 to Count - 1 do
            begin
              PName := @PropList[I]^.Name;
              if not StringInList(PName, ExcludeProps) then
                 AssignPropertyValue(PropList[I], ToObject, FromObject);
            end;
        finally
            FreePropertyList(PropList, Count);
        end;
    finally
        ExcludeProps.Free;
    end;
end;

function GetRootKey(const Key: string; var RootKey: HKey; var Root, SubKey: string): Boolean;
var
    APos : Integer;
begin
    Result := True;
    RootKey := 0;
    Root := '';
    SubKey := '';
    if (Length(Key) < 2) or (Copy(Key, 1, 2) <> '\\') then
    begin
        SubKey := Key;
        Exit;
    end;

    SubKey := Copy(Key, 3, Length(Key));
    APos := Pos('\', SubKey);
    if APos <> 0 then
    begin
        Root := UpperCase(Copy(SubKey, 1, APos - 1));
        SubKey := Copy(SubKey, APos, Length(SubKey));
    end
    else
    begin
        Root := UpperCase(SubKey);
        SubKey := '';
    end;

    if Root = StrHKEY_CLASSES_ROOT then RootKey := HKEY_CLASSES_ROOT
    else if Root = StrHKEY_CURRENT_USER then RootKey := HKEY_CURRENT_USER
    else if Root = StrHKEY_LOCAL_MACHINE then RootKey := HKEY_LOCAL_MACHINE
    else if Root = StrHKEY_USERS then RootKey := HKEY_USERS;

    Result := RootKey <> 0;
end;

function OpenRegistryKey(const Key: string; CanCreate: Boolean): TRegistry;
var
    Registry: TRegistry;
    RootKey: HKey;
    Root, SubKey: string;
begin
    if not GetRootKey(Key, RootKey, Root, SubKey) then
        raise ERegistryException.CreateFmt(StsUnknownRegistryKey, [Root]);

    Registry := TRegistry.Create;
    if RootKey <> 0 then
        Registry.RootKey := RootKey;

    if SubKey = '' then SubKey := '\';
    if CanCreate and not Registry.KeyExists(SubKey) then
    begin
        Registry.CreateKey(SubKey);
        Registry.LazyWrite := False;
        Registry.CloseKey;
        Registry.LazyWrite := True;
    end;

    if not Registry.OpenKey(SubKey, False) then
    begin
        Registry.Free;
        Registry := nil;
    end;

    Result := Registry;
end;

function GetRegStrValue(RootKey: HKey; const Key: string; const ValueName: string): string;
var
    Registry: TRegistry;
    Opened: Boolean;
begin
    Result := '';
    Registry := TRegistry.Create;
    try
        Registry.RootKey := RootKey;
        Opened := Registry.OpenKey(Key, False);
        try
            if Opened then
            begin
                if Registry.ValueExists(ValueName) then
                    Result := Registry.ReadString(ValueName);
            end;
        finally
            if Opened then Registry.CloseKey;
        end;
    finally
        Registry.Free;
    end;
end;

procedure InitCanvas(Canvas: TCanvas);
var
    Bmp: TBitmap;
begin
    //Procedure to provide a work-around for a Delphi canvas bug. If BrushCopy
    //is called prior to calling other Draw methods, BrushCopy will not operate
    //correctly. Call this method to initialize the canvas so drawing will
    //be correct. For each canvas, this only needs to be called once.

    Bmp := TBitmap.Create;
    try
    {$IFDEF TSVER_V3}
        Bmp.PixelFormat:=pf32bit;
    {$ENDIF}
        Bmp.Height:=1;
        Bmp.Width:=1;
        Canvas.Draw(0, 0, Bmp);
    finally
        Bmp.Free;
    end;
end;

procedure FreeNil(var AObject: TObject);
begin
    AObject.Free;
    AObject := nil;
end;

function AlignmentToHorzAlignment(Alignment: TAlignment; Align: Boolean): TtsHorzAlignment;
begin
    Result := htaDefault;
    if Align then
    begin
        case Alignment of
            taLeftJustify: Result := htaLeft;
            taCenter: Result := htaCenter;
            taRightJustify: Result := htaRight;
        end;
    end;
end;

function HorzAlignmentToAlignment(HorzAlignment: TtsHorzAlignment): TAlignment;
begin
    Result := taLeftJustify;
    case HorzAlignment of
        htaDefault, htaLeft: Result := taLeftJustify;
        htaCenter: Result := taCenter;
        htaRight: Result := taRightJustify;
    end;
end;

function HorzAlignmentToAlign(HorzAlignment: TtsHorzAlignment): Boolean;
begin
    Result := HorzAlignment <> htaDefault;
end;

function GetMainHelpDir(Version: string): string;
var
    RegKey: string;
    MainDir: string;
begin
    Result := '';
    RegKey := '';
    if Length(Version) < 2 then Exit;

    if UpperCase(Version[1]) = 'D' then
    begin
        if Version[2] = '3' then
            RegKey := Delphi3RootDirKey
        else if Version[2] = '4' then
            RegKey := Delphi4RootDirKey
        else if Version[2] = '5' then
            RegKey := Delphi5RootDirKey;
    end
    else
    begin
        if Version[2] = '3' then
            RegKey := CBuilder3RootDirKey
        else if Version[2] = '4' then
            RegKey := CBuilder4RootDirKey;
    end;

    if RegKey <> '' then
    begin
        MainDir := GetRegStrValue(HKEY_LOCAL_MACHINE, RegKey, RootKeyName);
        Result := MainDir + '\' + HelpSubDir;
    end;
end;

function GetMainHelpFile(Version: string): string;
begin
    Result := '';
    if Length(Version) < 2 then Exit;

    if UpperCase(Version[1]) = 'D' then
    begin
        if Version[2] = '3' then
            Result := Delphi3Help
        else if Version[2] = '4' then
            Result := Delphi4Help
        else if Version[2] = '5' then
            Result := Delphi5Help;
    end
    else
    begin
        if Version[2] = '3' then
            Result := CBuilder3Help
        else if Version[2] = '4' then
            Result := CBuilder4Help;
    end;
end;

function GetHelpFile(CompilerVersion: string): string;
var
    HelpDir, FileName: string;
begin
    Result := '';
    HelpDir := GetMainHelpDir(CompilerVersion);
    FileName := GetMainHelpFile(CompilerVersion);
    if (HelpDir <> '') and (FileName <> '') then
        Result := HelpDir + '\' + FileName;
end;

function GetCompilerVersion: string;
begin
    Result := '';
    {$IFDEF TSVER_DELPHI}
        {$IFDEF TSVER_V5}
            Result := 'D5';
        {$ELSE} {$IFDEF TSVER_V4}
            Result := 'D4';
        {$ELSE} {$IFDEF TSVER_V3}
            Result := 'D3';
        {$ENDIF} {$ENDIF} {$ENDIF}
    {$ENDIF}

    {$IFDEF TSVER_CBUILD}
        {$IFDEF TSVER_V4}
            Result := 'C4';
        {$ELSE} {$IFDEF TSVER_V3}
            Result := 'C3';
        {$ENDIF} {$ENDIF}
    {$ENDIF}
end;

procedure ShowHelpTopic(Handle: Hdc; Key: string);
var
    HelpFile: string;
begin
    HelpFile := GetHelpFile(GetCompilerVersion);
    if HelpFile <> '' then
        WinHelp(Handle, PChar(HelpFile), HELP_KEY, Longint(PChar(Key)));
end;

function ScanNum(S: string; Pos: Integer; Direction: Integer): Integer;
var
    Chars: Integer;
begin
    Result := Pos;
    while (Result >= 1) and (Result <= Length(S)) do
    begin
        Chars := NextCharCount(PChar(S), Result - 1);
        if Chars > 1 then Break;
        if not (S[Result] in ['0'..'9']) then Break;
        Inc(Result, Direction);
    end;
end;

function ScanNumChars(S: string; Pos: Integer; Direction: Integer): Integer;
var
    Chars: Integer;
begin
    Result := Pos;
    while (Result >= 1) and (Result <= Length(S)) do
    begin
        Chars := NextCharCount(PChar(S), Result - 1);
        if Chars > 1 then Break;
        if not (S[Result] in ['0'..'9', ThousandSeparator, DecimalSeparator, '-', '+']) then Break;
        Inc(Result, Direction);
    end;
end;

function RemoveThousandsSeparator(var S: string): Boolean;
var
    Ok: Boolean;
    Pos: Integer;
    NewStr: string;
    PrevPos: Integer;
begin
    Result := False;
    NewStr := '';

    Ok := True;
    PrevPos := 0;
    while Ok do
    begin
        Pos := ScanNum(S, PrevPos + 1, 1);
        if (Pos > Length(S)) or (S[Pos] <> ThousandSeparator) then
        begin
            if (PrevPos <> 0) and (Pos - PrevPos <> 4)
                then Ok := False
                else NewStr := NewStr + Copy(S, PrevPos + 1, Length(S));
            Break;
        end;

        if S[Pos] <> ThousandSeparator then Break;
        if (PrevPos = 0) and (Pos <= 1) then
            Ok := False
        else if (PrevPos > 0) and (Pos - PrevPos <> 4) then
            Ok := False
        else
        begin
            NewStr := NewStr + Copy(S, PrevPos + 1, Pos - PrevPos - 1);
            PrevPos := Pos;
        end;
    end;

    if Ok then
    begin
        S := NewStr;
        Result := PrevPos <> 0;
    end;
end;

procedure InsertThousands(var S: string);
var
    Pos: Integer;
begin
    Pos := ScanNum(S, 1, 1);
    Pos := Pos - 3;
    while Pos > 1 do
    begin
        S := Copy(S, 1, Pos - 1) + ThousandSeparator + Copy(S, Pos, Length(S));
        Pos := Pos - 3;
    end;
end;

function IncStrNum(S: string; Increment: Double): string;
var
    Ok: Boolean;
    ExtValue: Extended;
    Value: Double;
    HasThousands: Boolean;
begin
    Value := 0;
    Ok := True;
    Result := S;

    if S = '' then
    begin
        HasThousands := False;
        Value := Increment;
    end
    else
    begin
        HasThousands := RemoveThousandsSeparator(S);
        Ok := TextToFloat(PChar(S), ExtValue, fvExtended);
        if Ok then
        begin
            Value := ExtValue;
            Value := Value + Increment;
        end;
    end;

    if Ok then
    begin
        Result := FloatToStr(Value);
        if HasThousands then InsertThousands(Result);
    end;
end;

function ValidNum(S: string): Boolean;
var
    Value: Extended;
    NumStr: string;
begin
    NumStr := S;
    RemoveThousandsSeparator(NumStr);
    Result := TextToFloat(PChar(NumStr), Value, fvExtended);
end;

function GetNumAtPos(S: string; Pos: Integer; var StartPos, Len: Integer): Boolean;
var
    SPos, EPos: Integer;
    NumStr: string;
    Chars: Integer;
begin
    Len := 0;
    StartPos := Pos;
    Result := False;

    if Pos <= 0 then
        Pos := 0
    else if Pos > Length(S) then
        Pos := Length(S);

    Chars := NextCharCount(PChar(S), Pos);
    SPos := ScanNumChars(S, Pos, -1) + 1;
    EPos := ScanNumChars(S, Pos + Chars, 1) - 1;
    if EPos < SPos then Exit;

    NumStr := Copy(S, SPos, EPos - SPos + 1);
    Result := ValidNum(NumStr);
    if Result then
    begin
        StartPos := SPos;
        Len := EPos - SPos + 1;
        Exit;
    end;

    SPos := ScanNum(S, Pos, -1) + 1;
    EPos := ScanNum(S, Pos + Chars, 1) - 1;
    if EPos < SPos then Exit;

    if (PrevCharCount(PChar(S), SPos - 1) = 1) and (S[SPos - 1] in ['-','+']) then
    begin
        if (SPos <= 2) then
            Dec(SPos)
        else if (PrevCharCount(PChar(S), SPos - 2) <> 1) or not (S[SPos - 2] in ['0'..'9']) then
            Dec(SPos);
    end;

    NumStr := Copy(S, SPos, EPos - SPos + 1);
    StartPos := SPos;
    Len := EPos - SPos + 1;
    Result := True;
end;

function IncStrAtPos(S: string; Increment: Extended; APos: Integer; var StartPos, Len: Integer): string;
var
    NumStr, IncNum: string;
begin
    Result := S;
    if not GetNumAtPos(S, APos, StartPos, Len) then Exit;

    NumStr := Copy(S, StartPos, Len);
    IncNum := IncStrNum(NumStr, Increment);
    if IncNum <> NumStr then
    begin
        IncNum := PadDecimals(NumStr, IncNum);
        Result := Copy(S, 1, StartPos - 1) + IncNum + Copy(S, StartPos + Len, Length(S));
        Len := Length(IncNum);
    end;
end;

function PadDecimals(Sample: string; NumStr: string): string;
var
    DPos, NumDPos: Integer;
begin
    DPos := Pos(DecimalSeparator, Sample);
    NumDPos := Pos(DecimalSeparator, NumStr);
    if DPos <> 0 then
    begin
        if NumDPos = 0 then
        begin
            NumStr := NumStr + DecimalSeparator;
            NumDPos := Length(NumStr);
        end;
        while Length(Sample) - DPos > Length(NumStr) - NumDPos do
            NumStr := NumStr + '0';
    end;
    Result := NumStr;
end;

function PadNumber(Sample: string; NumStr: string): string;
var
    DPos, NumDPos: Integer;
begin
    NumStr := PadDecimals(Sample, NumStr);

    DPos := Pos(DecimalSeparator, Sample);
    NumDPos := Pos(DecimalSeparator, NumStr);
    while Length(Sample) - DPos > Length(NumStr) - NumDPos do
    begin
        if Sample[Length(Sample) - Length(NumStr)] = ThousandSeparator then
            NumStr := ThousandSeparator + NumStr
        else
            NumStr := '0' + NumStr
    end;

    Result := NumStr;
end;

function ControlFocused(Control: TWinControl): Boolean;
var
    I: Integer;
begin
    Result := Control.Focused;
    if Result then Exit;

    for I := 1 to Control.ControlCount do
    begin
        if Control.Controls[I-1] is TWinControl then
        begin
            Result := ControlFocused(TWinControl(Control.Controls[I-1]));
            if Result then Break;
        end;
    end;
end;

function ControlVisible(Control: TWinControl): Boolean;
begin
    Result := Control.Visible;
    if not Result then Exit;

    if Control.Parent <> nil then
        Result := ControlVisible(Control.Parent);
end;

function IsControlHandle(Handle: Hwnd; Control: TWinControl): Boolean;
var
    I: Integer;
begin
    Result := False;
    if not Assigned(Control) then Exit;
    if not Control.HandleAllocated then Exit;

    Result := (Control.Handle = Handle);
    if Result then Exit;

    for I := 1 to Control.ControlCount do
    begin
        if Control.Controls[I-1] is TWinControl then
        begin
            Result := IsControlHandle(Handle, TWinControl(Control.Controls[I-1]));
            if Result then Break;
        end;
    end;
end;

{TtsMemoryCanvas}

constructor TtsMemoryCanvas.Create;
begin
    inherited;

    FDc := 0;
    FWidth := 0;
    FHeight := 0;
    FCount := 0;
    FMutex := 0;
    FLockingThreadId := 0;
    FLockingObject := nil;
end;

{TtsMemoryCanvas}

destructor TtsMemoryCanvas.Destroy;
begin
    if FMutex <> 0 then
        CloseHandle(Mutex);
    FreeDc;
    inherited;
end;

procedure TtsMemoryCanvas.Resize(Dc: Hdc; Width, Height: Integer);
var
    Bmp : HBITMAP;
    OldBmp : HBITMAP;
begin
    if (FWidth < Width) or (FHeight < Height) then
    begin
        FWidth := CalcMax(FWidth,Width);
        FHeight := CalcMax(FHeight,Height);
        Bmp := CreateCompatibleBitmap(Dc, FWidth, FHeight);
        OldBmp := SelectObject(FDc, Bmp);
        DeleteObject(OldBmp);
    end;
end;

procedure TtsMemoryCanvas.Prepare(Dc: Hdc; Width, Height: Integer);
var
    Bmp: HBITMAP;
begin
    if FDc = 0 then
    begin
        FDc := CreateCompatibleDc(Dc);
        Bmp := CreateCompatibleBitmap(Dc, Width, Height);
        SelectObject(FDc, Bmp);
        FWidth := Width;
        FHeight := Height;
    end
    else if (FWidth < Width) or (FHeight < Height) then
        Resize(Dc, Width, Height);

    Inc(FCount);
end;

procedure TtsMemoryCanvas.FreeDc;
var
    Bmp : HBITMAP;
begin
    if Dc <> 0 then
    begin
        Bmp := GetCurrentObject(Dc, OBJ_BITMAP);

        //delete DC before Bmp to prevent resource leak
        DeleteDC(Dc);
        DeleteObject(Bmp);

        Dc := 0;
        Width := 0;
        Height := 0;
    end;
end;

procedure TtsMemoryCanvas.Release;
begin
    Dec(FCount);
    if (FCount = 0) then FreeDc;
end;

procedure TtsMemoryCanvas.SetObjects(var Rect : TRect);
var
    ClipRegion : HRGN;
begin
    ClipRegion := CreateRectRgn(Rect.Left, Rect.Top, Rect.Right, Rect.Bottom);
    SelectClipRgn(Dc, ClipRegion);
    DeleteObject(ClipRegion);
end;

procedure TtsMemoryCanvas.Lock(AObject: TObject);
begin
    WaitForSingleObject(Mutex, INFINITE);
    FLockingThreadId := GetCurrentThreadId;
    FLockingObject := AObject;
end;

procedure TtsMemoryCanvas.Unlock;
begin
    FLockingThreadId := 0;
    FLockingObject := nil;
    ReleaseMutex(Mutex);
end;

function TtsMemoryCanvas.GetMutex: THandle;
begin
    if FMutex = 0 then
        FMutex := CreateMutex(nil, False, nil);
    Result := FMutex;
end;

function TtsMemoryCanvas.Locked(AObject: TObject): Boolean;
begin
    Result := (FLockingObject <> AObject) and
              (FLockingThreadId = GetCurrentThreadId);

end;

{TtsBitmapElement}

constructor TtsBitmapElement.Create(Bitmap: TBitmap);
begin
    FBitmap := Bitmap;
    FCount := 0;
    FBitmapID := 0;
    FCanFree := False;
end;

destructor TtsBitmapElement.Destroy;
begin
    if FCanFree then FBitmap.Free;
    inherited;
end;

function TtsBitmapElement.Compare(NodeSet: TtsCustomSet; Value : TtsSetElement) : TtsSetOrder;
begin
    Result := CompareKey(NodeSet, [TtsBitmapElement(Value).Bitmap]);
end;

function TtsBitmapElement.CompareKey(NodeSet: TtsCustomSet; const KeyValue : array of const) : TtsSetOrder;
begin
    if Longint(KeyValue[0].VObject) > Longint(Bitmap) then
        Result := ordLarger
    else if Longint(KeyValue[0].VObject) < Longint(Bitmap) then
        Result := ordSmaller
    else
        Result := ordEqual;
end;

{TtsBitmapSet}

procedure TtsBitmapSet.AddElement(Element: TtsBitmapElement);
begin
    Add(Element);
end;

function TtsBitmapSet.GetBitmap(Bitmap: TBitmap): TtsBitmapElement;
begin
    Result := TtsBitmapElement(Get([Bitmap]));
end;

function TtsBitmapSet.AddBitmap(Bitmap: TBitmap): TtsBitmapElement;
var
    Element: TtsBitmapElement;
begin
    Element := GetBitmap(Bitmap);
    if not Assigned(Element) then
    begin
        Element := TtsBitmapElement.Create(Bitmap);
        AddElement(Element);
    end;
    Result := Element;
end;

procedure TtsBitmapSet.RemoveBitmap(Bitmap: TBitmap);
var
    Element: TtsBitmapElement;
begin
    Element := GetBitmap(Bitmap);
    if Assigned(Element) then
    begin
        Dec(Element.FCount);
        if Element.FCount <= 0 then
            Remove([Element.Bitmap]);
    end;
end;

{Tts2DStorage}

constructor Tts2DStorage.Create(Cols, Rows: Integer);
begin
    inherited Create;

    FColsAllocSize := Cols;
    FRowsAllocSize := Rows;

    FData := nil;
    FDataType := nil;
    FColsInRow := nil;
    FColsAllocInRow := nil;
    FRowsInData := 0;
    FInDesignMode := False;
end;

destructor Tts2DStorage.Destroy;
begin
    Clear(0, True);
    inherited Destroy;
end;

function Tts2DStorage.MaxRowSet: Integer;
var
    I: Integer;
begin
    Result := 0;
    for I := FRowsInData - 1 downto 1 do
    begin
        if FData[I] <> nil then
        begin
            Result := I;
            Break;
        end;
    end;
end;

procedure Tts2DStorage.Assign(Source: Tts2DStorage);
var
    Col, Row: Integer;
    NewSize, MaxCol, MaxRow: Integer;
begin
    if not Assigned(Source) then Exit;

    FInDesignMode := Source.FInDesignMode;
    MaxRow := Source.MaxRowSet;
    if MaxRow = 0 then
        Clear(0, True)
    else
    begin
        Clear(MaxRow + 1, False);
        NewSize := CalcMax(RowsAllocSize + 1, MaxRow + 1);
        ResizeRows(NewSize);
    end;

    for Row := 1 to MaxRow do
    begin
        MaxCol := Source.MaxColValueSet(Row);
        if MaxCol = 0
            then ClearRow(Row, 0)
            else ClearRow(Row, CalcMax(MaxCol, ColsAllocSize));

        for Col := MaxCol downto 1 do
            SetValue(Col, Row, Source.GetValue(Col, Row), Source.GetValueType(Col, Row));
    end;
end;

procedure Tts2DStorage.ClearValue(DataCol, DataRow: Integer);
begin
    if FDataType[DataRow][DataCol - 1] in [vtpString, vtpPictureName] then
    begin
        if FData[DataRow][DataCol - 1] <> nil then
            string(FData[DataRow][DataCol - 1]) := ''
    end
    else if FDataType[DataRow][DataCol - 1] = vtpPicture then
    begin
        if FData[DataRow][DataCol - 1] <> nil then
        begin
            CheckInternalBitmap(TBitmap(FData[DataRow][DataCol - 1]), True);
            FData[DataRow][DataCol - 1] := nil;
        end;
    end
    else
        FData[DataRow][DataCol - 1] := nil;

    FDataType[DataRow][DataCol - 1] := vtpNone;
end;

procedure Tts2DStorage.ClearRow(DataRow: Integer; ColsInRow: Integer);
var
    DataCol: Integer;
begin
    if not Assigned(FData) then Exit;
    if FData[DataRow] = nil then Exit;

    for DataCol := 1 to FColsInRow[DataRow] do
        ClearValue(DataCol, DataRow);

    if ColsInRow >= 0 then
        ResizeRowCols(DataRow, ColsInRow);
end;

procedure Tts2DStorage.ClearCol(DataCol: Integer);
var
    DataRow: Integer;
begin
    if not Assigned(FData) then Exit;

    for DataRow := 1 to FRowsInData - 1 do
    begin
        if (DataCol >= 1) and (DataCol <= FColsInRow[DataRow]) then
            ClearValue(DataCol, DataRow);
    end;
end;

procedure Tts2DStorage.Clear(StartRow: Integer; Resize: Boolean);
var
    I: Integer;
begin
    if StartRow = 1 then StartRow := 0;
    for I := StartRow to FRowsInData - 1 do ClearRow(I, 0);

    if Resize then
    begin
        if StartRow = 0 then ResizeRows(StartRow)
                        else ResizeRows(StartRow + 1);
    end;
end;

function Tts2DStorage.GetValue(DataCol, DataRow: Integer): Variant;
begin
    if DataRow > FRowsInData - 1 then
        result := Unassigned
    else if DataCol > FColsInRow[DataRow] then
        result := Unassigned
    else if FDataType[DataRow][DataCol - 1] in [vtpString, vtpPictureName] then
    begin
        if FData[DataRow][DataCol - 1] = nil then
            result := ''
        else
            result := string(FData[DataRow][DataCol - 1])
    end
    else if FDataType[DataRow][DataCol - 1] = vtpInteger then
        result := Integer(FData[DataRow][DataCol - 1])
    else if FDataType[DataRow][DataCol - 1] = vtpPicture then
        result := Integer(FData[DataRow][DataCol - 1])
    else if FDataType[DataRow][DataCol - 1] = vtpNull then
        result := Null
    else
        result := Unassigned;
end;

function Tts2DStorage.GetValueType(DataCol, DataRow: Integer): TtsValueType;
begin
    if DataRow > FRowsInData - 1 then
        result := vtpNone
    else if DataCol > FColsInRow[DataRow] then
        result := vtpNone
    else
        result := FDataType[DataRow][DataCol - 1];
end;

procedure Tts2DStorage.SetBitmapValue(DataCol, DataRow: Longint; CurValueType: TtsValueType; Bitmap: TBitmap);
begin
    if (CurValueType = vtpPicture) then
    begin
        if (FData[DataRow][DataCol - 1] = Pointer(Bitmap)) then Exit;
        ClearValue(DataCol, DataRow);
    end;

    FData[DataRow][DataCol - 1] := Pointer(Bitmap);
    CheckInternalBitmap(Bitmap, False);
end;

procedure Tts2DStorage.CheckCreateRow(DataRow: Integer);
var
    AllocRows: Integer;
begin
    if DataRow > FRowsInData - 1 then
    begin
        if DataRow < FRowsAllocSize + 1 then
            AllocRows := FRowsAllocSize + 1
        else
            AllocRows := DataRow + 10;
        ResizeRows(AllocRows);
    end;
end;

procedure Tts2DStorage.ResizeRows(NewSize: Integer);
begin
    if NewSize > FRowsInData then
    begin
        ReAllocMem(FData, NewSize * SizeOf(PtsRowData));
        ZeroMemory(@FData[FRowsInData], (NewSize - FRowsInData) * SizeOf(PtsRowData));

        ReAllocMem(FDataType, NewSize * SizeOf(PtsRowDataType));
        ZeroMemory(@FDataType[FRowsInData], (NewSize - FRowsInData) * SizeOf(PtsRowDataType));

        ReAllocMem(FColsInRow, NewSize * SizeOf(Integer));
        ZeroMemory(@FColsInRow[FRowsInData], (NewSize - FRowsInData) * SizeOf(Integer));

        ReAllocMem(FColsAllocInRow, NewSize * SizeOf(Integer));
        ZeroMemory(@FColsAllocInRow[FRowsInData], (NewSize - FRowsInData) * SizeOf(Integer));

        FRowsInData := NewSize;
    end
    else if NewSize < FRowsInData then
    begin
        ReAllocMem(FData, NewSize * SizeOf(PtsRowData));
        ReAllocMem(FDataType, NewSize * SizeOf(PtsRowDataType));
        ReAllocMem(FColsInRow, NewSize * SizeOf(Integer));
        ReAllocMem(FColsAllocInRow, NewSize * SizeOf(Integer));
        FRowsInData := NewSize;
    end;
end;

procedure Tts2DStorage.ResizeRowCols(DataRow: Integer; NewSize: Integer);
begin
    if NewSize > FColsAllocInRow[DataRow] then
    begin
        ReAllocMem(FData[DataRow], NewSize * SizeOf(Pointer));
        ZeroMemory(@(FData[DataRow][FColsInRow[DataRow]]), (NewSize - FColsInRow[DataRow]) * SizeOf(Pointer));

        ReAllocMem(FDataType[DataRow], NewSize * SizeOf(TtsValueType));
        ZeroMemory(@(FDataType[DataRow][FColsInRow[DataRow]]), (NewSize - FColsInRow[DataRow]) * SizeOf(TtsValueType));

        FColsInRow[DataRow] := NewSize;
        FColsAllocInRow[DataRow] := NewSize;
    end
    else if NewSize < FColsAllocInRow[DataRow] then
    begin
        ReAllocMem(FData[DataRow], NewSize * SizeOf(Pointer));
        ReAllocMem(FDataType[DataRow], NewSize * SizeOf(TtsValueType));
        FColsInRow[DataRow] := NewSize;
        FColsAllocInRow[DataRow] := NewSize;
    end
    else
        FColsInRow[DataRow] := NewSize;
end;

procedure Tts2DStorage.CheckCreateCol(DataCol, DataRow: Integer);
var
    AllocCols: Integer;
begin
    if DataCol > FColsInRow[DataRow] then
    begin
        if DataCol <= FColsAllocInRow[DataRow] then
            FColsInRow[DataRow] := DataCol
        else
        begin
            if DataCol < FColsAllocSize 
                then AllocCols := FColsAllocSize
                else AllocCols := DataCol + 10;
            ResizeRowCols(DataRow, AllocCols);
        end;
    end;
end;

procedure Tts2DStorage.SetValue(DataCol, DataRow: Integer; Value: Variant; ValueType: TtsValueType);
var
    CurValueType: TtsValueType;
    Temp: Integer;
begin
    CurValueType := GetValueType(DataCol, DataRow);
    if VarIsEmpty(Value) and (CurValueType = vtpNone) then Exit;

    CheckCreateRow(DataRow);
    CheckCreateCol(DataCol, DataRow);

    if VarIsEmpty(Value) or (ValueType = vtpNone) then
    begin
        ClearValue(DataCol, DataRow);
        ValueType := vtpNone;
    end
    else
    begin
        if ValueType in [vtpString, vtpPictureName] then
        begin
            if not (CurValueType in [vtpNone, vtpString, vtpPictureName]) then
                ClearValue(DataCol, DataRow);
            string(FData[DataRow][DataCol - 1]) := Value
        end
        else if ValueType = vtpInteger then
        begin
            if not (CurValueType in [vtpNone, vtpInteger]) then
                ClearValue(DataCol, DataRow);
            Integer(FData[DataRow][DataCol - 1]) := Value
        end
        else if ValueType = vtpPicture then
        begin
            if not (CurValueType in [vtpNone, vtpPicture]) then
            begin
                ClearValue(DataCol, DataRow);
                CurValueType := vtpNone;
            end;

            Temp := Value;
            SetBitmapValue(DataCol, DataRow, CurValueType, TBitmap(Temp));
        end
        else if ValueType = vtpNull then
            ClearValue(DataCol, DataRow);
    end;

    FDataType[DataRow][DataCol - 1] := ValueType;
end;

procedure Tts2DStorage.DeleteRows(FromRow, ToRow: Integer);
var
    Count: Integer;
    Row, NrOfRows: Integer;
begin
    if ToRow < FromRow then Exit;
    if FromRow > FRowsInData - 1 then Exit;

    if ToRow > FRowsInData - 1 then
        ToRow := FRowsInData - 1;

    for Row := ToRow downto FromRow do
        ClearRow(Row, 0);

    NrOfRows := ToRow - FromRow + 1;
    Count := (FRowsInData - NrOfRows) - FromRow;
    if Count > 0 then
    begin
        MoveMemory(@FData[FromRow], @FData[FromRow + NrOfRows], Count * SizeOf(PtsRowData));
        MoveMemory(@FDataType[FromRow], @FDataType[FromRow + NrOfRows], Count * SizeOf(PtsRowDataType));
        MoveMemory(@FColsInRow[FromRow], @FColsInRow[FromRow + NrOfRows], Count * SizeOf(Integer));
        MoveMemory(@FColsAllocInRow[FromRow], @FColsAllocInRow[FromRow + NrOfRows], Count * SizeOf(Integer));
    end;

    FRowsInData := FRowsInData - NrOfRows;

    ReAllocMem(FData, FRowsInData * SizeOf(PtsRowData));
    ReAllocMem(FDataType, FRowsInData * SizeOf(PtsRowDataType));
    ReAllocMem(FColsInRow, FRowsInData * SizeOf(Integer));
    ReAllocMem(FColsAllocInRow, FRowsInData * SizeOf(Integer));
end;

procedure Tts2DStorage.DeleteCols(FromCol, ToCol: Integer);
var
    Row, RowToCol, NrOfCols, Col: Integer;
    Count: Integer;
begin
    if ToCol < FromCol then Exit;

    for Row := 0 to FRowsInData - 1 do
    begin
        if FromCol <= FColsInRow[Row] then
        begin
            //Clear data
            if ToCol > FColsInRow[Row]
                then RowToCol := FColsInRow[Row]
                else RowToCol := ToCol;

            for Col := FromCol to RowToCol do
                ClearValue(Col, Row);

            NrOfCols := RowToCol - FromCol + 1;
            Count := (FColsInRow[Row] - NrOfCols) - FromCol + 1;
            if Count > 0 then
            begin
                MoveMemory(@FData[Row][FromCol - 1],
                           @FData[Row][FromCol + NrOfCols - 1],
                           Count * SizeOf(Pointer));
                MoveMemory(@FDataType[Row][FromCol - 1],
                           @FDataType[Row][FromCol + NrOfCols - 1],
                           Count * SizeOf(TtsValueType));
            end;

            FColsInRow[Row] := FColsInRow[Row] - NrOfCols;
            if (FColsAllocInRow[Row] - FColsInRow[Row] >= 8) or
               (FColsInRow[Row] = 0) then
            begin
                ReAllocMem(FData[Row], FColsInRow[Row] * SizeOf(Pointer));
                ReAllocMem(FDataType[Row], FColsInRow[Row] * SizeOf(TtsValueType));
                FColsAllocInRow[Row] := FColsInRow[Row];
            end
            else
            begin
                ZeroMemory(@(FData[Row][FColsInRow[Row]]), NrOfCols * SizeOf(Pointer));
                ZeroMemory(@(FDataType[Row][FColsInRow[Row]]), NrOfCols * SizeOf(TtsValueType));
            end;
        end;
    end;
end;

procedure Tts2DStorage.CopyRow(FromRow, ToRow: Integer);
var
    Col: Integer;
begin
    if not Assigned(FData) then Exit;
    if ToRow > FRowsInData - 1 then Exit;

    if FromRow > FRowsInData - 1 then
        ClearRow(ToRow, 0)
    else if FData[FromRow] = nil then
        ClearRow(ToRow, 0)
    else
    begin
        for Col := 1 to FColsInRow[FromRow] do
            SetValue(Col, ToRow, GetValue(Col, FromRow), GetValueType(Col, FromRow));

        for Col := FColsInRow[FromRow] + 1 to FColsInRow[ToRow] do
            ClearValue(Col, ToRow);
    end;
end;

procedure Tts2DStorage.BackupRow(DataRow: Integer);
begin
    CopyRow(DataRow, 0);
end;

procedure Tts2DStorage.RestoreBackupRow(DataRow: Integer);
begin
    CopyRow(0, DataRow);
    ClearBackupRow;
end;

procedure Tts2DStorage.ClearBackupRow;
begin
    ClearRow(0, 0);
end;

procedure Tts2DStorage.WriteInteger(Stream: TStream; Col, Row: Integer);
begin
    Stream.WriteBuffer(Integer(FData[Row][Col - 1]), SizeOf(FData[Row][Col - 1]));
end;

procedure Tts2DStorage.ReadInteger(Stream: TStream; Col, Row: Integer);
var
    Value: Integer;
begin
    Stream.ReadBuffer(Value, SizeOf(Value));
    if (Col > 0) and (Row > 0) then SetValue(Col, Row, Value, vtpInteger);
end;

procedure Tts2DStorage.WriteString(Stream: TStream; Col, Row: Integer);
var
    Value: string;
    StrLen: Integer;
begin
    Value := string(FData[Row][Col - 1]);
    StrLen := Length(Value);
    Stream.WriteBuffer(StrLen, SizeOf(StrLen));
    Stream.WriteBuffer(PChar(Value)^, StrLen);
end;

procedure Tts2DStorage.ReadString(Stream: TStream; Col, Row: Integer; ValueType: TtsValueType);
var
    Str: string;
    StrLen: Integer;
begin
    Stream.ReadBuffer(StrLen, SizeOf(StrLen));
    SetString(Str, nil, StrLen);
    Stream.ReadBuffer(Pointer(Str)^, StrLen);
    if (Col > 0) and (Row > 0) then SetValue(Col, Row, Str, ValueType);
end;

procedure Tts2DStorage.WritePicture(Stream: TStream; Col, Row: Integer;
                                    BmpSet: TtsBitmapSet; BmpList: TList);
var
    Bmp: TBitmap;
    Element: TtsBitmapElement;
begin
    Bmp := TBitmap(FData[Row][Col - 1]);
    Element := BmpSet.AddBitmap(Bmp);
    if Element.BitmapID = 0 then
    begin
        BmpList.Add(Bmp);
        Element.BitmapID := BmpList.Count;
    end;

    Stream.WriteBuffer(Element.BitmapID, SizeOf(Element.BitmapID));
end;

procedure Tts2DStorage.ReadPicture(Stream: TStream; Col, Row: Integer;
                                   BmpList: TList);
var
    Bmp: TBitmap;
    BmpID: Integer;
begin
    Stream.ReadBuffer(BmpID, SizeOf(BmpID));

    if BmpID > BmpList.Count then BmpList.Count := BmpID;
    Bmp := TBitmap(BmpList[BmpID - 1]);
    if not Assigned(Bmp) then
    begin
        Bmp := CreateInternalBitmap.Bitmap;
        BmpList[BmpID - 1] := Bmp;
    end;

    if (Col > 0) and (Row > 0) then
        SetValue(Col, Row, BitmapToVariant(Bmp), vtpPicture);
end;

procedure Tts2DStorage.WriteBitmapList(Stream: TStream; BmpList: TList);
var
    I: Integer;
begin
    Stream.WriteBuffer(BmpList.Count, SizeOf(BmpList.Count));
    for I := 1 to BmpList.Count do
        TBitmap(BmpList[I - 1]).SaveToStream(Stream);
end;

procedure Tts2DStorage.ReadBitmapList(Stream: TStream; BmpList: TList);
var
    Bmp: TBitmap;
    I, Count: Integer;
begin
    Bmp := nil;
    try
        Stream.ReadBuffer(Count, SizeOf(Count));
        for I := 1 to Count do
        begin
            if I <= BmpList.Count then
                TBitmap(BmpList[I - 1]).LoadFromStream(Stream)
            else
            begin
                if not Assigned(Bmp) then Bmp := TBitmap.Create;
                Bmp.LoadFromStream(Stream);
            end;
        end;
    finally
        Bmp.Free;
    end;
end;

function Tts2DStorage.MaxColValueSet(DataRow: Integer): Integer;
begin
    Result := 0;
    if DataRow > FRowsInData then Exit;

    Result := FColsInRow[DataRow];
    while (Result >= 1) do
    begin
        if FDataType[DataRow][Result - 1] <> vtpNone then Break;
        Result := Result - 1;
    end;
end;

procedure Tts2DStorage.SaveToStream(Stream: TStream);
var
    Row, Col: Integer;
    MaxCol, MaxRow: Integer;
    BmpSet: TtsBitmapSet;
    BmpList: TList;
begin
    BmpSet := TtsBitmapSet.Create;
    try
        BmpList := TList.Create;
        try
            MaxRow := MaxRowSet;
            for Row := 1 to MaxRow do
            begin
                MaxCol := MaxColValueSet(Row);
                if MaxCol > 0 then
                begin
                    Stream.WriteBuffer(Row, SizeOf(Row));
                    Stream.WriteBuffer(MaxCol, SizeOf(MaxCol));
                    for Col := 1 to MaxCol do
                    begin
                        Stream.WriteBuffer(FDataType[Row][Col - 1], SizeOf(FDataType[Row][Col - 1]));
                        case FDataType[Row][Col - 1] of
                            vtpString, vtpPictureName: WriteString(Stream, Col, Row);
                            vtpInteger: WriteInteger(Stream, Col, Row);
                            vtpPicture: WritePicture(Stream, Col, Row, BmpSet, BmpList);
                        end;
                    end;
                end;
            end;

            Row := 0;
            Stream.WriteBuffer(Row, SizeOf(Row));
            WriteBitmapList(Stream, BmpList);
        finally
            BmpList.Free;
        end;
    finally
        BmpSet.Free;
    end;
end;

procedure Tts2DStorage.LoadFromStream(Stream: TStream; ColNumbers: TList);
var
    I, Col, Row: Integer;
    Cols: Integer;
    ValueType: TtsValueType;
    BmpList: TList;
    DataCol: Integer;
begin
    BmpList := TList.Create;
    try
        if not Assigned(ColNumbers) then
            Clear(0, True)
        else
        begin
            for I := 1 to ColNumbers.Count do
            begin
                DataCol := Integer(ColNumbers[I-1]);
                if DataCol > 0 then ClearCol(DataCol);
            end;
        end;
        Stream.ReadBuffer(Row, SizeOf(Row));
        while Row <> 0 do
        begin
            Stream.ReadBuffer(Cols, SizeOf(Cols));
            for Col := 1 to Cols do
            begin
                DataCol := Col;
                if Assigned(ColNumbers) and (Col <= ColNumbers.Count) then
                    DataCol := Integer(ColNumbers[Col-1]);
                Stream.ReadBuffer(ValueType, SizeOf(ValueType));
                case ValueType of
                    vtpString, vtpPictureName: ReadString(Stream, DataCol, Row, ValueType);
                    vtpInteger: ReadInteger(Stream, DataCol, Row);
                    vtpPicture: ReadPicture(Stream, DataCol, Row, BmpList);
                end;
            end;
            Stream.ReadBuffer(Row, SizeOf(Row));
        end;
        ReadBitmapList(Stream, BmpList);
    finally
        BmpList.Free;
    end
end;

{TtsStack}

constructor TtsStack.Create;
begin
    inherited Create;

    FValueList := nil;
end;

destructor TtsStack.Destroy;
begin
    ValueList.Free;
    ValueList := nil;

    inherited Destroy;
end;

function TtsStack.GetValueList: TList;
begin
    if FValueList = nil then
        FValueList := TList.Create;

    result := FValueList;
end;

procedure TtsStack.Push(Value: integer);
begin
    ValueList.Add(Pointer(Value));
end;

function TtsStack.Pop: integer;
begin
    Result := integer(ValueList.Items[ValueList.Count - 1]);
    ValueList.Delete(ValueList.Count - 1);
end;

function TtsStack.CurValue: integer;
begin
    Result := integer(ValueList.Items[ValueList.Count - 1]);
end;

{End TtsStack}

function TosMaskEntry.GetDisplayName : String;
begin
  Result := FName + '     (' + FPicture + ')';
end;

function TosMaskEntry.GetStorageText : String;
begin
  Result := FName + '~' + FPicture + #13;
end;

procedure TosMaskEntry.SetStorageText(Value : String);
begin
  if (Pos('~', Value) > 0) then
  begin
    FName := Copy(Value, 1, Pos('~', Value)-1);
    FPicture := Copy(Value, Pos('~', Value)+1, Length(Value)-1);
    if FPicture[Length(FPicture)] = #13 then Delete(FPicture, Length(FPicture), 1);
  end
  else
    FName := Value;
end;

initialization
begin
    FInternalBitmaps := nil;
end;

finalization
begin
    FInternalBitmaps.Free;
    FInternalBitmaps := nil;
end;

end.

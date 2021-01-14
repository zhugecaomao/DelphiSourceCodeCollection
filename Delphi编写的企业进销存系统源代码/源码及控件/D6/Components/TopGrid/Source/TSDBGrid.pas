{*******************************************************}
{                                                       }
{       ObjectSight Visual Components                   }
{       TopGrid data bound grid component TtsDBGrid     }
{                                                       }
{       Copyright (c) 1997 - 2002, ObjectSight          }
{                                                       }
{*******************************************************}

unit TSDBGrid;

{$INCLUDE TSCmpVer}

interface

uses
    Windows, SysUtils, Messages, Classes, Controls, DB, DBTables,
    TSCommon, TSGrid, TSDateTimeDef, Bde, Grids_ts, TSSetLib, TSGLib, StdCtrls, Graphics,
    Mask, Dialogs
    {$IFDEF TSVER_V6}, FmtBcd, Variants, MaskUtils {$ENDIF};

type
    TtsFieldState          = (fsDefault, fsCustomized);
    TtsAssignedValue       = (avAlignment, avWidth, avVisible, avMaxLength,
                              avControlType, avAllowGrayed);
    TtsAssignedValues      = set of TtsAssignedValue;
    TtsDataPosition        = (dpCurrent, dpTop, dpBottom);
    TtsCursorPosition      = (cpBof, cpNormal, cpEof);
    TtsCountDirection      = (cdForward, cdBackward, cdNone);
    TtsDataEditMode        = (demNone, demEdit, demAppend, demInsert);
    TtsCompare             = (cpUnknown, cpLess, cpEqual, cpGreater);
    TtsDatasetType         = (dstStandard, dstBDE);
    TtsBkmPosOffset        = (bpoBof, bpoPrior, bpoCurrent, bpoNext, bpoEof);
    TtsCombineRange        = (crPrior, crNext, crBoth);
    TtsBookmarkType        = (bmtDefault, bmtNonOrdered);
    TtsBookmarkCompareType = (bctDefault, bctAsString);
    TtsScanState           = (sstStart, sstScan, sstSave, sstEnd);
    TtsRecordSelection     = (rseBookmarkRange, rseBookmarkSet);

type
    TtsDBField = class;
    TtsCustomDBGrid = class;
    TtsDBGrid = class;
    TtsDBCol = class;
    TtsScrollDataset = class;
    TtsDBCombo = class;
    TtsDBComboGrid = class;

    TtsDBRowLoadedEvent       = procedure (Sender: TObject; DataRow: Variant) of object;
    TtsDBCellLoadedEvent      = procedure (Sender: TObject; DataCol: Longint;
                                           DataRow: Variant; var Value: Variant) of object;
    TtsDBPaintCellEvent       = procedure (Sender: TObject; DataCol: Longint; DataRow: Variant; ARect: TRect;
                                           State: TtsPaintCellState; var Cancel: Boolean) of object;
    TtsDBDeleteRowEvent       = procedure(Sender: TObject; DataRow: Variant; ByUser: Boolean) of object;
    TtsDBInsertRowEvent       = procedure(Sender: TObject; DataRow: Variant; ByUser: Boolean) of object;
    TtsDBTopLeftChangedEvent  = procedure (Sender: TObject; OldCol: Longint; OldRow: Variant;
                                           NewCol: Longint; NewRow: Variant; ByUser: Boolean) of object;
    TtsDBCellEditingEvent     = procedure (Sender: TObject; DataCol: Longint; DataRow: Variant; var Cancel: Boolean) of object;
    TtsDBRowEditingEvent      = procedure (Sender: TObject; DataRow: Variant;
                                           var Cancel: Boolean) of object;
    TtsDBShowEditorEvent      = procedure (Sender: TObject; DataCol: Longint; DataRow: Variant; var Cancel: Boolean) of object;
    TtsDBCellEditEvent        = procedure (Sender: TObject; DataCol: Longint; DataRow: Variant; ByUser: Boolean) of object;
    TtsDBRowEditEvent         = procedure (Sender: TObject; DataRow: Variant; ByUser: Boolean) of object;
    TtsDBUndoCellEditEvent    = procedure (Sender: TObject; DataCol: Longint; DataRow: Variant; ByUser: Boolean; var Cancel: Boolean) of object;
    TtsDBUndoRowEditEvent     = procedure (Sender: TObject; DataRow: Variant; ByUser: Boolean; var Cancel: Boolean) of object;
    TtsDBCellChangedEvent     = procedure (Sender: TObject; OldCol, NewCol: Longint; OldRow, NewRow: Variant) of object;
    TtsDBRowChangedEvent      = procedure (Sender: TObject; OldRow, NewRow: Variant) of object;
    TtsDBButtonEvent          = procedure (Sender: TObject; DataCol: Longint; DataRow: Variant) of object;
    TtsDBSpinButtonEvent      = procedure (Sender: TObject; DataCol: Longint; DataRow: Variant; SpinButton: TtsSpinButton) of object;
    TtsDBSpinRepeatEvent      = procedure (Sender: TObject; DataCol: Longint; DataRow: Variant; Count: Integer; SpinButton: TtsSpinButton) of object;
    TtsDBSpinIncrementEvent   = procedure (Sender: TObject; DataCol: Longint; DataRow: Variant; SpinButton: TtsSpinButton; var Value: Variant; var Pos, Len: Integer; var Accept: Boolean) of object;
    TtsDBClickCellEvent       = procedure (Sender: TObject; DataColDown: Longint; DataRowDown: Variant;
                                           DataColUp: Longint; DataRowUp: Variant; DownPos, UpPos: TtsClickPosition) of object;
    TtsDBDblClickCellEvent    = procedure (Sender: TObject; DataCol: Longint; DataRow: Variant; Pos: TtsClickPosition) of object;
    TtsDBUpdateFieldEvent     = procedure(Sender: TObject; DataCol: Longint; DataRow: Variant;
                                          var Value: Variant; var Cancel: Boolean) of object;
    TtsDBComboCellEvent       = procedure (Sender: TObject; Combo: TtsDBComboGrid; DataCol: Longint; DataRow: Variant) of object;
    TtsDBComboCellLoadedEvent = procedure (Sender: TObject; Combo: TtsDBComboGrid; DataCol: Longint; DataRow: Variant;
                                           var Value: Variant) of object;
    TtsDBComboGetValueEvent   = procedure (Sender: TObject; Combo: TtsDBComboGrid; GridDataCol: Longint;
                                           GridDataRow, ComboDataRow: Variant; var Value: Variant) of object;
    TtsDBDateTimeCellEvent    = procedure (Sender: TObject; DateTimeDef: TtsDateTimeDefComponent; DataCol: Longint; DataRow: Variant) of object;
    TtsDBDateTimeGetValueEvent= procedure (Sender: TObject; DateTimeDef: TtsDateTimeDefComponent; DataCol: Longint; DataRow: Variant; var Value: Variant) of object;
    TtsDBGetRecordIDEvent     = procedure (Sender: TObject; DataRow: Variant; var RecordID: Variant) of object;
    TtsDBCompareRecordIDEvent = procedure (Sender: TObject; RecordID1, RecordID2: Variant; var CompRes: Integer) of object;
    TtsDBGetDrawInfoEvent     = procedure (Sender: TObject; DataCol: Longint; DataRow: Variant; var DrawInfo: TtsDrawInfo) of object;
    TtsDBScanRecordsEvent     = procedure (Sender: TObject; ScanAll: Boolean; State: TtsScanState; Count: Longint; var Cancel: Boolean) of object;
    TtsDBInvalidCellValueEvent= procedure (Sender: TObject; DataCol: Longint; DataRow: Variant; var Accept: Boolean) of object;
    TtsDBInvalidCellEditEvent = procedure (Sender: TObject; Keys: string; DataCol: Longint; DataRow: Variant; var Accept: Boolean) of object;

    TtsDBPrintRowEvent        = procedure(Sender : TObject; DataRow : Variant; var Cancel : Boolean) of object;
    TtsDBPrintCellEvent       = procedure(Sender : TObject; DataCol : Longint; DataRow : Variant; var Cancel : Boolean) of object;


    {TtsDBRect}

    TtsDBRect = record
        Left, Right: Longint;
        Top, Bottom: Variant;
    end;

    {TtsBkmPos}

    TtsBkmPos = record
        Bkm: TBookmarkStr;
        Offset: TtsBkmPosOffset;
    end;

    {TtsDatasetPosition}
    {Record type for storing the current position of the data in the grid}
    
    TtsDatasetPosition = record
        TopBkm: TBookmarkStr;
        ActiveRow: Integer;
    end;

    {TtsDBField}
    {Base field class for column fields in TtsCustomDBGrid. This class corresponds
     to the TField class for the TDBGrid component with.}

    TtsDBField = class(TPersistent)
    protected
        FGrid: TtsCustomDBGrid;
        FCol: TtsDBCol;
        FDatasetField: TField;
        FLookupOffset: Integer;

        function  IsEditField: Boolean;
        function  FieldEditOk: Boolean;
        function  GetDataSize: Word;
        function  GetSize: Word;
        procedure SetSize(Value: Word);
        procedure ClearLookup;                    
        function  GetLookupData(Buffer: Pointer): Boolean;
        procedure SetLookupData(Buffer: Pointer);
        procedure GetLookupValue;
        function  GetData(Buffer: Pointer): Boolean;
        function  GetText(DisplayText: Boolean): string; virtual;
        function  GetAsBoolean: Boolean; virtual;
        function  GetAsCurrency: Currency; virtual;
        function  GetAsDateTime: TDateTime; virtual;
        function  GetAsFloat: Double; virtual;
        function  GetAsInteger: Longint; virtual;
        function  GetAsString: string; virtual;
        function  GetAsVariant: Variant; virtual;
        function  IsBooleanField: Boolean; virtual;
        function  IsIntegerField: Boolean; virtual;

        procedure SetAsBoolean(Value: Boolean); virtual;
        procedure SetAsCurrency(Value: Currency); virtual;
        procedure SetAsDateTime(Value: TDateTime); virtual;
        procedure SetAsFloat(Value: Double); virtual;
        procedure SetAsInteger(Value: Longint); virtual;
        procedure SetAsString(const Value: string); virtual;
        procedure SetAsVariant(const Value: Variant); virtual;
        procedure SetLookupVarValue(Value: Variant); virtual;
        procedure SetLookupValue(const Value: Variant); virtual;
        function  SetField(RecBuf: PChar; Value: string): Boolean; virtual;

        function  GetDisplayText: string; virtual;
        function  GetFieldClass: TClass;
        function  GetDisplayLabel: string;
        procedure SetDisplayLabel(Value: string);
        function  GetDisplayName: string;
        function  GetFieldName: string;
        function  GetReadOnly: Boolean;
        procedure SetReadOnly(Value: Boolean);
        function  GetAlignment: TAlignment;
        procedure SetAlignment(Value: TAlignment);
        function  GetFieldNo: Integer;
        function  GetDataType: TFieldType;
        function  GetDisplayFormat: string; virtual;
        function  GetEditFormat: string; virtual;
        function  GetVisible: Boolean;
        procedure SetVisible(Value: Boolean);
        function  GetDisplayWidth: Integer;
        procedure SetDisplayWidth(Value: Integer);
        function  CanModify: Boolean;
        function  IsBlobField: Boolean;
        procedure SetEditText(Value: string); virtual;
        function  GetEditText: string; virtual;
        function  GetTransliterate: Boolean; virtual;
        procedure SetTransliterate(Value: Boolean); virtual;
        function  GetEditMask: string;
        procedure SetEditMask(Value: string);
        function  GetControlType: TtsControlType; virtual;
        function  GetMaxLength: Integer; virtual;
        function  GetIsNull: Boolean;
        function  GetLookup: Boolean;

        property FieldClass: TClass read GetFieldClass;
        property DisplayLabel: string read GetDisplayLabel write SetDisplayLabel;
        property DisplayName: string read GetDisplayName;
        property FieldName: string read GetFieldName;
        property ReadOnly: Boolean read GetReadOnly write SetReadOnly;
        property Alignment: TAlignment read GetAlignment write SetAlignment;
        property FieldNo: Integer read GetFieldNo;
        property DataType: TFieldType read GetDataType;
        property DisplayFormat: string read GetDisplayFormat;
        property EditFormat: string read GetEditFormat;
        property Visible: Boolean read GetVisible write SetVisible;
        property DisplayWidth: Integer read GetDisplayWidth write SetDisplayWidth;
        property Transliterate: Boolean read GetTransliterate write SetTransliterate;
        property EditMask: string read GetEditMask write SetEditMask;
        property DataSize: Word read GetDataSize;
        property Size: Word read GetSize write SetSize;
        property ControlType: TtsControlType read GetControlType;
        property MaxLength: Integer read GetMaxLength;
        property Lookup: Boolean read GetLookup;
        property LookupValue: Variant read GetAsVariant write SetLookupValue;

    public
        constructor Create(Grid: TtsCustomDBGrid; Col: TtsDBCol; Field: TField); virtual;
        destructor Destroy; override;

        property Text: string read GetEditText write SetEditText;
        property DisplayText: string read GetDisplayText;
        property AsString: string read GetAsString write SetAsString;
        property Value: Variant read GetAsVariant write SetAsVariant;
        property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
        property AsCurrency: Currency read GetAsCurrency write SetAsCurrency;
        property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
        property AsFloat: Double read GetAsFloat write SetAsFloat;
        property AsInteger: Longint read GetAsInteger write SetAsInteger;
        property AsVariant: Variant read GetAsVariant write SetAsVariant;
        property IsNull: Boolean read GetIsNull;

        property Col: TtsDBCol read FCol;
        property DatasetField: TField read FDatasetField;
    end;

    {TtsDBStringField}
    {String field for columns in TtsCustomDBGrid. Corresponds to TStringField.}

    TtsDBStringField = class(TtsDBField)
    protected
        function  GetAsBoolean: Boolean; override;
        function  GetAsDateTime: TDateTime; override;
        function  GetAsFloat: Double; override;
        function  GetAsInteger: Longint; override;
        function  GetAsString: string; override;
        function  GetAsVariant: Variant; override;
        function  GetMaxLength: Integer; override;

        function  GetValue(var Value: string): Boolean;
        function  GetText(DisplayText: Boolean): string; override;
        function  GetTransliterate: Boolean; override;
        procedure SetTransliterate(Value: Boolean); override;
        procedure SetLookupVarValue(Value: Variant); override;
        function  SetField(RecBuf: PChar; Value: string): Boolean; override;
    end;

    {TtsDBNumericField}
    {Numeric field for columns in TtsCustomDBGrid. Corresponds to TNumericField.}

    TtsDBNumericField = class(TtsDBField)
    protected
        function GetDisplayFormat: string; override;
        function GetEditFormat: string; override;
    end;

    {TtsDBIntegerField}
    {Integer field for columns in TtsCustomDBGrid. Corresponds to TIntegerField.}

    TtsDBIntegerField = class(TtsDBNumericField)
    protected
        function  GetAsFloat: Double; override;
        function  GetAsInteger: Longint; override;
        function  GetAsString: string; override;
        function  GetAsVariant: Variant; override;

        function  GetValue(var Value: Longint): Boolean;
        function  GetText(DisplayText: Boolean): string; override;
        procedure SetLookupVarValue(Value: Variant); override;
        function  SetField(RecBuf: PChar; Value: string): Boolean; override;
        function  IsIntegerField: Boolean; override;
    end;

    {TtsDBSmallintField}
    {Smallint field for columns in TtsCustomDBGrid. Corresponds to TSmallintField.}

    TtsDBSmallintField = class(TtsDBIntegerField)
    end;

    {TtsDBWordField}
    {Word field for columns in TtsCustomDBGrid. Corresponds to TWordField.}

    TtsDBWordField = class(TtsDBIntegerField)
    end;

    {TtsDBAutoIncField}
    {AutoInc field for columns in TtsCustomDBGrid. Corresponds to TAutoIncField.}

    TtsDBAutoIncField = class(TtsDBIntegerField)
    end;

    {TtsDBFloatField}
    {Float field for columns in TtsCustomDBGrid. Corresponds to TFloatField.}

    TtsDBFloatField = class(TtsDBNumericField)
    protected
        function  GetPrecision: Integer;
        function  GetAsFloat: Double; override;
        function  GetAsInteger: Longint; override;
        function  GetAsString: string; override;
        function  GetAsVariant: Variant; override;

        function  GetValue(var Value: Double): Boolean;
        function  GetText(DisplayText: Boolean): string; override;
        function  IsCurrency: Boolean;
        procedure SetLookupVarValue(Value: Variant); override;
        function  SetField(RecBuf: PChar; Value: string): Boolean; override;

        property  Precision: Integer read GetPrecision;
    end;

    {TtsDBCurrencyField}
    {Currency field for columns in TtsCustomDBGrid. Corresponds to TCurrencyField.}

    TtsDBCurrencyField = class(TtsDBFloatField)
    end;

    {TtsDBBCDField }
    {BCDField field for columns in TtsCustomDBGrid. Corresponds to TBCDField.}

    TtsDBBCDField = class(TtsDBNumericField)
    protected
        function  GetAsCurrency: Currency; override;
        function  GetAsFloat: Double; override;
        function  GetAsInteger: Longint; override;
        function  GetAsString: string; override;
        function  GetAsVariant: Variant; override;

        function  GetText(DisplayText: Boolean): string; override;
        function  GetValue(var Value: Currency): Boolean;
        function  IsCurrency: Boolean;
        procedure SetLookupVarValue(Value: Variant); override;
        function  SetField(RecBuf: PChar; Value: string): Boolean; override;
    end;

    {TtsDBBooleanField}
    {Boolean field for columns in TtsCustomDBGrid. Corresponds to TBooleanField.}

    TtsDBBooleanField = class(TtsDBField)
    protected
        FDisplayValues: string;
        FTextValues: array[Boolean] of string;

        procedure LoadTextValues;
        procedure GetDisplayValues;

        function  GetAsBoolean: Boolean; override;
        function  GetAsString: string; override;
        function  GetAsVariant: Variant; override;
        function  GetControlType: TtsControlType; override;
        procedure SetLookupVarValue(Value: Variant); override;
        function  SetField(RecBuf: PChar; Value: string): Boolean; override;
        function  IsBooleanField: Boolean; override;
    public
        constructor Create(Grid: TtsCustomDBGrid; Col: TtsDBCol; Field: TField); override;
    end;

    {TtsDBDateTimeField}
    {DateTime field for columns in TtsCustomDBGrid. Corresponds to TDateTimeField.}

    TtsDBDateTimeField = class(TtsDBField)
    protected
        function  GetAsDateTime: TDateTime; override;
        function  GetAsFloat: Double; override;
        function  GetAsString: string; override;
        function  GetAsVariant: Variant; override;

        function  GetValue(var Value: TDateTime): Boolean;
        function  GetText(DisplayText: Boolean): string; override;
        function  GetDisplayFormat: string; override;
        procedure SetLookupVarValue(Value: Variant); override;
        function  SetField(RecBuf: PChar; Value: string): Boolean; override;
    end;

    {TtsDBDateField}
    {Date field for columns in TtsCustomDBGrid. Corresponds to TDateField.}

    TtsDBDateField = class(TtsDBDateTimeField)
    end;

    {TtsDBTimeField}
    {Time field for columns in TtsCustomDBGrid. Corresponds to TTimeField.}

    TtsDBTimeField = class(TtsDBDateTimeField)
    end;

    {TtsDBBinaryField}
    {Binary field for columns in TtsCustomDBGrid. Corresponds to TBinaryField.}

    TtsDBBinaryField = class(TtsDBField)
    protected
        function GetAsString: string; override;
        function GetAsVariant: Variant; override;
        function GetText(DisplayText: Boolean): string; override;
    end;

    {TtsDBBytesField}
    {Bytes field for columns in TtsCustomDBGrid. Corresponds to TBytesField.}

    TtsDBBytesField = class(TtsDBBinaryField)
    end;

    {TtsDBVarBytesField}
    {VarBytes field for columns in TtsCustomDBGrid. Corresponds to TVarBytesField.}

    TtsDBVarBytesField = class(TtsDBBytesField)
    end;

    {TtsDBBlobField}
    {Blob field for columns in TtsCustomDBGrid. Corresponds to TBlobField.}

    TtsDBBlobField = class(TtsDBField)
    protected
        procedure LoadFromBlob(Blob: TtsDBBlobField);
        procedure SaveToBitmap(Bitmap: TBitmap);
        procedure SaveToStrings(Strings: TStrings);
        procedure AssignTo(Dest: TPersistent); override;
        function  GetAsString: string; override;
        function  GetAsVariant: Variant; override;

    public
        procedure Assign(Source: TPersistent); override;
        procedure SaveToFile(const FileName: string);
        procedure SaveToStream(Stream: TStream);
    end;

    {TtsDBMemoField}
    {Memo field for columns in TtsCustomDBGrid. Corresponds to TMemoField.}

    TtsDBMemoField = class(TtsDBBlobField)
    protected
        function  GetDisplayText: string; override;
        function  GetEditText: string; override;
        function  GetTransliterate: Boolean; override;
        procedure SetTransliterate(Value: Boolean); override;
    end;

    {TtsDBGraphicField}
    {Graphic field for columns in TtsCustomDBGrid. Corresponds to TGraphicField.}

    TtsDBGraphicField = class(TtsDBBlobField)
    protected
        function GetControlType: TtsControlType; override;
    end;

    {TtsDBBlobStream}
    {Blob stream for reading and writing blob fields. Corresponds to TBlobStream.}

    TtsDBBlobStream = class(TStream)
    protected
        FField: TtsDBBlobField;
        FScrollDataSet: TtsScrollDataSet;
        FBuffer: PChar;
        FOpened: Boolean;
        FPosition: Longint;
        FBlobStream: TBlobStream;

        function GetBlobSize: Longint;

    public
        constructor Create(Field: TtsDBBlobField; Mode: TBlobStreamMode);
        destructor Destroy; override;

        function  Read(var Buffer; Count: Longint): Longint; override;
        function  Write(const Buffer; Count: Longint): Longint; override;
        function  Seek(Offset: Longint; Origin: Word): Longint; override;
    end;

    {TtsFieldLayout}
    {Class for saving layout properties of TField objects}

    TtsFieldLayout = class(TObject)
    protected
        FFieldName: string;
        FDisplayLabel: string;
        FDisplayWidth: Integer;
        FReadOnly: Boolean;
        FVisible: Boolean;
        FDisplayValues: string;

        constructor Create;

        procedure AssignFieldLayout(Field: TField);
        function  FieldLayoutEqual(Field: TField): Boolean;

        property FieldName: string read FFieldName write FFieldName;
        property DisplayLabel: string read FDisplayLabel write FDisplayLabel;
        property DisplayWidth: Integer read FDisplayWidth write FDisplayWidth;
        property ReadOnly: Boolean read FReadOnly write FReadOnly;
        property Visible: Boolean read FVisible write FVisible;
        property DisplayValues: string read FDisplayValues write FDisplayValues;
    end;

    {TtsDBCol}
    {Individual column for TtsCustomDBGrid}

    TtsDBCol = class(TtsCol)
    protected
        FDBField: TtsDBField;
        FAssignedValues: TtsAssignedValues;

        procedure SetFieldName(Value: string); override;
        procedure SetDatasetField(Value: TField);
        function  GetDatasetField: TField;
        function  SetField(Value: TField): Boolean;
        procedure ResetField(ResetFieldName: Boolean);
        function  GetDBGrid: TtsCustomDBGrid;
        function  DefaultWidth: Integer;
        procedure SetDefaultWidth;
        procedure SetDefaultVisible;
        procedure SetDefaultControlType;
        procedure SetDefaultMaxLength;
        procedure SetDefaultAllowGrayed;
        procedure InitField;

        function  DefaultProps: Boolean; override;
        procedure AssignProperties(Source: TtsCol); override;
        function  GetHeading: string; override;
        function  GetAlignment: TAlignment; override;
        function  GetHorzAlignment: TtsHorzAlignment; override;
        function  GetReadOnly: Boolean; override;
        function  GetMaxTextWidth : Integer; override;
        procedure SetAlignment(Value: TAlignment); override;
        procedure SetHorzAlignment(Value: TtsHorzAlignment); override;
        procedure SetWidth(Value: Integer); override;
        procedure SetVisible(Value: Boolean); override;
        procedure SetMaxLength(Value: Integer); override;
        procedure SetControlType(Value: TtsControlType); override;
        procedure SetAllowGrayed(Value: Boolean); override;
        procedure SetDBCombo(Value: TtsDBCombo);
        function  GetDBCombo: TtsDBCombo;
        procedure SetComboDataSource(Value: TDatasource);
        function  GetComboDataSource: TDatasource;
        function  UseCheckBoxValues: Boolean; override;
        procedure WriteAssignedValues(Writer: TWriter);
        procedure ReadAssignedValues(Reader: TReader);
        procedure DefineProperties(Filer: TFiler); override;



    public
        constructor Create(Grid: TtsBaseGrid); override;
        destructor  Destroy; override;

        property Grid: TtsCustomDBGrid read GetDBGrid;
        procedure Assign(Source: TPersistent); override;
        function  Lookup: Boolean;
        procedure Reset(Properties: TtsProperties); override;
        procedure ResetAlignment;
        procedure ResetAllowGrayed;
        procedure ResetControlType;
        procedure ResetMaxLength;
        procedure ResetVisible;
        procedure ResetWidth;

        property MaxTextWidth : Integer read GetMaxTextWidth;
        property Combo: TtsDBCombo read GetDBCombo write SetDBCombo;
        property DatasetField: TField read GetDatasetField write SetDatasetField;
        property Field: TtsDBField read FDBField;

    published
        property ComboDatasource: TDatasource read GetComboDataSource write SetComboDataSource;
    end;

    {TtsDBGridCols}
    {List of all columns in TtsCustomDBGrid, implemented as an array of TtsDBCol}

    TtsDBGridCols = class(TtsGridCols)
    protected
        FFieldState: TtsFieldState;

        function  GetDBCol(DataCol: Variant): TtsDBCol;
        function  GetDBGrid: TtsCustomDBGrid;
        procedure SetFieldState(Value: TtsFieldState);
        function  FindField(Field: TField): TtsDBCol;

        function CreateCol: TtsCol; override;
        property Grid: TtsCustomDBGrid read GetDBGrid;

    public
        property Col[DataCol: Variant]: TtsDBCol read GetDBCol; default;
        property FieldState: TtsFieldState read FFieldState write SetFieldState;
    end;

    {TtsDBRowElement}
    {Element for storing row properties in a binary tree.}

    TtsDBRowElement = class(TtsCustomPropElement)
    protected
        FDataRow: Variant;

        procedure FontChange(Sender: TObject); override;
        function  GetGrid: TtsCustomDBGrid;
    public
        constructor Create(Grid: TtsBaseGrid; DataRow: Variant);
        destructor  Destroy; override;

        procedure Assign(Source: TtsCustomElement); override;
        function  Compare(NodeSet: TtsCustomSet; Value: TtsSetElement): TtsSetOrder; override;
        function  CompareKey(NodeSet: TtsCustomSet; const KeyValue: array of const): TtsSetOrder; override;

        property Grid: TtsCustomDBGrid read GetGrid;
    end;

    {TtsDBCellElement}
    {Element for storing cell properties in a binary tree.}

    TtsDBCellElement = class(TtsCustomPropElement)
    protected
        FDataCol: Longint;
        FDataRow: Variant;

        procedure FontChange(Sender: TObject); override;
        function  GetGrid: TtsCustomDBGrid;
        procedure AssignCombo; override;

    public
        constructor Create(Grid: TtsBaseGrid; DataCol: Longint; DataRow: Variant);
        destructor  Destroy; override;

        procedure Assign(Source: TtsCustomElement); override;
        function  Compare(NodeSet: TtsCustomSet; Value: TtsSetElement): TtsSetOrder; override;
        function  CompareKey(NodeSet: TtsCustomSet; const KeyValue: array of const): TtsSetOrder; override;

        property Grid: TtsCustomDBGrid read GetGrid;
    end;

    {TtsDBRowPropSet}
    {Binary tree for storage of TtsCustomDBGrid row properties}

    TtsDBRowPropSet = class(TtsCustomPropSet)
    protected
        function  CreateElement(const KeyValue: array of const): TtsCustomElement; override;
        procedure DeleteElement(Element: TtsCustomElement); override;
        function  CheckDelete(Element: TtsCustomElement): Boolean; override;
        function  SetProperty(const KeyValue: array of const; var Element: TtsCustomElement;
                              const Value: Variant; Prop: TtsProperty; PropId: Integer; Redraw: Boolean): Boolean; override;
        function  GetGrid: TtsCustomDBGrid;

        property Grid: TtsCustomDBGrid read GetGrid;
    end;

    {TtsDBCellPropSet}
    {Binary tree for storage of TtsCustomDBGrid cell properties}

    TtsDBCellPropSet = class(TtsCustomPropSet)
    protected
        procedure CheckRedraw(DataCol: Longint; DataRow: Variant; CheckInvalidate: Boolean);
        function  CreateElement(const KeyValue: array of const): TtsCustomElement; override;
        procedure DeleteElement(Element: TtsCustomElement); override;
        function  CheckDelete(Element: TtsCustomElement): Boolean; override;
        function  SetProperty(const KeyValue: array of const; var Element: TtsCustomElement;
                              const Value: Variant; Prop: TtsProperty; PropId: Integer; Redraw: Boolean): Boolean; override;
        function  GetGrid: TtsCustomDBGrid;

        property Grid: TtsCustomDBGrid read GetGrid;
    end;

    {TtsDBCell}
    {Used by the TopGrid component editor to set cell properties}

    TtsDBCell = class(TtsCell)
    protected
        FElement: TtsDBCellElement;
        FAssignedProps: TtsProperties;

        function  GetDBGrid: TtsCustomDBGrid;
        procedure SetDBGrid(Value: TtsCustomDBGrid);
        function  GetElement: TtsDBCellElement;

        function  GetColor: TColor; override;
        procedure SetColor(Value: TColor); override;
        function  GetControlType: TtsControlType; override;
        procedure SetControlType(Value: TtsControlType); override;
        function  GetSpinOptions: TtsSpinOptions; override;
        procedure SetSpinOptions(Value: TtsSpinOptions); override;
        function  GetSpinIncrement: Double; override;
        procedure SetSpinIncrement(Value: Double); override;
        function  GetFont: TFont; override;
        procedure SetFont(Value: TFont); override;
        function  GetParentFont: Boolean; override;
        procedure SetParentFont(Value: Boolean); override;
        function  GetAlignment: TAlignment; override;
        procedure SetAlignment(Value: TAlignment); override;
        function  GetAlign: Boolean; override;
        procedure SetAlign(Value: Boolean); override;
        function  GetHorzAlignment: TtsHorzAlignment; override;
        procedure SetHorzAlignment(Value: TtsHorzAlignment); override;
        function  GetVertAlignment: TtsVertAlignment; override;
        procedure SetVertAlignment(Value: TtsVertAlignment); override;
        function  GetIs3D: Boolean; override;
        procedure SetIs3D(Value: Boolean); override;
        function  GetWordWrap: TtsWordWrap; override;
        procedure SetWordWrap(Value: TtswordWrap); override;
        function  GetButtonType: TtsButtonType; override;
        procedure SetButtonType(Value: TtsButtonType); override;
        function  GetDropDownStyle: TtsDropDownStyle; override;
        procedure SetDropDownStyle(Value: TtsDropDownStyle); override;
        function  GetReadOnly: TtsReadOnly; override;
        procedure SetReadOnly(Value: TtsReadOnly); override;
        function  GetMaskName: string; override;
        procedure SetMaskName(Value: string); override;
        function  GetAutoCreateFont: Boolean; override;
        procedure SetAutoCreateFont(Value: Boolean); override;
        function  GetCombo: TtsCombo; override;
        procedure SetCombo(Value: TtsCombo); override;
        procedure AssignCombo; override;
        function  GetParentCombo: Boolean; override;
        procedure SetParentCombo(Value: Boolean); override;
        function  GetStretchPicture: TtsDrawOption; override;
        procedure SetStretchPicture(Value: TtsDrawOption); override;
        function  GetShrinkPicture: TtsDrawOption; override;
        procedure SetShrinkPicture(Value: TtsDrawOption); override;
        function  GetCenterPicture: TtsDrawOption; override;
        procedure SetCenterPicture(Value: TtsDrawOption); override;
        function  GetKeepAspectRatio: TtsDrawOption; override;
        procedure SetKeepAspectRatio(Value: TtsDrawOption); override;
        function  GetDateTimeDef: TtsDateTimeDefComponent; override;
        procedure SetDateTimeDef(Value: TtsDateTimeDefComponent); override;

        property Element: TtsDBCellElement read GetElement;

    public
        constructor Create(Grid: TtsBaseGrid; DataCol: Longint; DataRow: Variant);
        destructor  Destroy; override;
        property  Grid: TtsCustomDBGrid read GetDBGrid write SetDBGrid;
    end;

    TtsDBRow = class(TtsDesignRow)
    protected
        FSelected: Boolean;
        FElement: TtsDBRowElement;
        FAssignedProps: TtsProperties;

        function  GetGrid: TtsCustomDBGrid;
        procedure SetGrid(Value: TtsCustomDBGrid);
        function  GetElement: TtsDBRowElement;

        function  GetColor: TColor; override;
        procedure SetColor(Value: TColor); override;
        function  GetDisplayRow: Longint; override;
        procedure SetDisplayRow(Value: Longint); override;
        function  GetFont: TFont; override;
        procedure SetFont(Value: TFont); override;
        function  GetCombo: TtsCombo; override;
        procedure SetCombo(Value: TtsCombo); override;
        procedure AssignCombo; override;
        function  GetParentCombo: Boolean; override;
        procedure SetParentCombo(Value: Boolean); override;
        function  GetParentFont: Boolean; override;
        procedure SetParentFont(Value: Boolean); override;
        function  GetHeight: Integer; override;
        procedure SetHeight(Value: Integer); override;
        function  GetAlignment: TAlignment; override;
        procedure SetAlignment(Value: TAlignment); override;
        function  GetAlign: Boolean; override;
        procedure SetAlign(Value: Boolean); override;
        function  GetHorzAlignment: TtsHorzAlignment; override;
        procedure SetHorzAlignment(Value: TtsHorzAlignment); override;
        function  GetVertAlignment: TtsVertAlignment; override;
        procedure SetVertAlignment(Value: TtsVertAlignment); override;
        function  GetChanged: Boolean; override;
        procedure SetChanged(Value: Boolean); override;
        function  GetIs3D: Boolean; override;
        procedure SetIs3D(Value: Boolean); override;
        function  GetWordWrap: TtsWordWrap; override;
        procedure SetWordWrap(Value: TtswordWrap); override;
        function  GetButtonType: TtsButtonType; override;
        procedure SetButtonType(Value: TtsButtonType); override;
        function  GetReadOnly: Boolean; override;
        procedure SetReadOnly(Value: Boolean); override;
        function  GetMaskName: string; override;
        procedure SetMaskName(Value: string); override;
        function  GetSelected: Boolean; override;
        procedure SetSelected(Value: Boolean); override;
        function  GetVisible: Boolean; override;
        procedure SetVisible(Value: Boolean); override;
        function  GetAutoCreateFont: Boolean; override;
        procedure SetAutoCreateFont(Value: Boolean); override;
        function  GetId: Longint; override;
        function  GetStretchPicture: TtsDrawOption; override;
        procedure SetStretchPicture(Value: TtsDrawOption); override;
        function  GetShrinkPicture: TtsDrawOption; override;
        procedure SetShrinkPicture(Value: TtsDrawOption); override;
        function  GetCenterPicture: TtsDrawOption; override;
        procedure SetCenterPicture(Value: TtsDrawOption); override;
        function  GetKeepAspectRatio: TtsDrawOption; override;
        procedure SetKeepAspectRatio(Value: TtsDrawOption); override;
        function  GetControlType: TtsControlType; override;
        procedure SetControlType(Value: TtsControlType); override;
        function  GetSpinOptions: TtsSpinOptions; override;
        procedure SetSpinOptions(Value: TtsSpinOptions); override;
        function  GetSpinIncrement: Double; override;
        procedure SetSpinIncrement(Value: Double); override;
        function  GetDateTimeDef: TtsDateTimeDefComponent; override;
        procedure SetDateTimeDef(Value: TtsDateTimeDefComponent); override;
        function  GetDropDownStyle: TtsDropDownStyle; override;
        procedure SetDropDownStyle(Value: TtsDropDownStyle); override;

        function  StoreDisplayRow: Boolean; override;
        function  StoreHeight: Boolean; override;

        property Element: TtsDBRowElement read GetElement;

    public
        constructor Create(Grid: TtsBaseGrid; DataRow: Variant);
        destructor  Destroy; override;
        procedure Assign(Source: TPersistent); override;

        //Design time property
        property  AutoCreateFont: Boolean read GetAutoCreateFont write SetAutoCreateFont;

        property  Grid: TtsCustomDBGrid read GetGrid write SetGrid;
        property  DataRow: Variant read FDataRow write FDataRow;
    end;

    {TtsBookmarkSetNode}
    {Element for storing bookmarks in a binary tree}

    TtsBookmarkSetNode = class(TtsStringSetNode)
    public
        function Compare(NodeSet: TtsCustomSet; NodeValue : Pointer) : TtsSetOrder; override;
    end;

    {TtsBookmarkSetNode}
    {Binary tree for storing bookmarks of selected records}

    TtsBookmarkSet = class(TtsStringSet)
    protected
        FGrid: TtsCustomDBGrid;
        FBkmList: TtsSetList;
        FLastBkmListIndex: Integer;

        function  NewNode(NodeValue : Pointer) : TtsSetNode; override;
        function  GetBkmList: TtsSetList;
        procedure ResetBkmList;
        procedure GetBkmListPos(Bkm: TBookmarkStr; var Top, Bottom: Integer);

        property  Grid: TtsCustomDBGrid read FGrid write FGrid;
        property  LastBkmListIndex: Integer read FLastBkmListIndex write FLastBkmListIndex;
        property  BkmList: TtsSetList read GetBkmList;

    public
        constructor Create; override;
        destructor  Destroy; override;

        function  Add(NodeValue : string) : Pointer; override;
        procedure Assign(Source: TtsCustomSet); override;
        procedure Clear; override;
        function  First: Variant;
        function  Last: Variant;
        function  Next(Bkm: Variant): Variant;
        function  Previous(Bkm: Variant): Variant;
        function  Remove(NodeValue : string) : Pointer; override;
    end;

    TtsSelectedRange = record
        First: TtsBkmPos;
        Last: TtsBkmPos;
    end;

    TtsSelectedList = class(TStringList)
    protected
        procedure ClearList;
        function  GetItem(Index: Integer): string;
        procedure SetItem(Index: Integer; Value: string);

    public
        destructor Destroy; override;
        procedure  AddItem(Value: string);
        property   Item[Index: Integer]: string read GetItem write SetItem;
    end;

    PtsRangeBuffer = ^TtsRangeBuffer;
    TtsRangeBuffer = array[1..(MaxListSize div ((SizeOf(TtsSelectedRange) div SizeOf(Longint)) + 1))] of TtsSelectedRange;

    {TtsDBSelection}
    {Set of selected rows, implemented as an array of selected bookmark ranges.}

    TtsDBSelection = class(TObject)
    protected
        FGrid: TtsCustomDBGrid;
        FUnboundSelection: TtsSelection;
        FBookmarkSet: TtsBookmarkSet;
        FStoreUnselected: Boolean;
        FRangeBufSize: Longint;
        FRangeBuffer: PtsRangeBuffer;
        FRangeCount: Longint;
        FUseRangeSelection: Boolean;
        FAllSelected: Boolean;

        function  Assign(Source: TtsDBSelection): Boolean;
        procedure AssignRangeBuffer(Source: TtsDBSelection);
        function  RowsSelected: Boolean;
        procedure CheckRowsSelected;
        function  GetAllSelected: Boolean;
        procedure SetAllSelected(Value: Boolean);
        procedure ClearBkm(First, Last: Longint; Assign: Boolean);
        procedure ResizeRangeBuffer(NewSize: Longint);
        procedure SearchRangeIndex(Top, Bottom: Longint; DataRow: TtsBkmPos;
                                   var Position: Longint; var Found: Boolean);
        procedure AdjustRangeBuffer(NewCount: Longint);
        procedure MoveRangeBuffer(FromIndex, ToIndex: Longint; Count: Longint);
        procedure InsertNewRange(Index: Longint; Range: TtsSelectedRange; CombineRange: TtsCombineRange);
        procedure RemoveRange(FirstIndex, LastIndex: Longint; Range: TtsSelectedRange);
        procedure CombineRanges(FirstIndex, LastIndex: Longint; Range: TtsSelectedRange);
        procedure CompRangeIndexes(Range: TtsSelectedRange; var FirstIndex, LastIndex: Longint;
                                   var FirstFound, LastFound: Boolean);
        procedure AddSetSelection(const FromRow, ToRow: TtsBkmPos; var Changed: Boolean);
        procedure AddRangeSelection(const FromRow, ToRow: TtsBkmPos; var Changed: Boolean);
        procedure AddBkmPosSelection(const FromRow, ToRow: TtsBkmPos; var Changed: Boolean);
        procedure AddSelection(FromRow, ToRow: TBookmarkStr; var Changed: Boolean);
        procedure RemoveRangeSelection(const FromRow, ToRow: TtsBkmPos; var Changed: Boolean);
        procedure RemoveSetSelection(const FromRow, ToRow: TtsBkmPos; var Changed: Boolean);
        procedure RemoveBkmPosSelection(const FromRow, ToRow: TtsBkmPos; var Changed: Boolean);
        procedure RemoveSelection(FromRow, ToRow: TBookmarkStr; var Changed: Boolean);
        function  CombinePrevRange(var BkmPos: TtsBkmPos; var Index: Longint; SetToPrev: Boolean): Boolean;
        function  CombineNextRange(var BkmPos: TtsBkmPos; var Index: Longint; SetToNext: Boolean): Boolean;
        procedure CalcStartRange(BkmPos: TtsBkmPos; Index: Longint; var Range: TtsSelectedRange;
                                 var NewRange, CanCombine: Boolean; var CombineIndex: Longint);
        procedure CalcEndRange(BkmPos: TtsBkmPos; Index: Longint; var Range: TtsSelectedRange;
                               var NewRange, CanCombine: Boolean; var CombineIndex: Longint);
        procedure InvertSelection(Range: TtsSelectedRange; FirstIndex, LastIndex: Longint);
        procedure ChangeRangeSelection(const FromRow, ToRow: TtsBkmPos; CombineRange: TtsCombineRange );
        procedure ChangeSetSelection(const FromRow, ToRow: TtsBkmPos);
        procedure ChangeRownrSelection(FromRownr, ToRownr: Longint);
        procedure AddSelectedList(List: TtsSelectedList; ClearAll, SelectAll: Boolean; var Canceled: Boolean);
        procedure DeleteSelectedList(List: TtsSelectedList; SelectAll: Boolean; var Canceled: Boolean);
        procedure ChangeBkmPosSelection(const FromRow, ToRow: TtsBkmPos; CombineRange: TtsCombineRange);
        procedure ChangeSelection(FromRow, ToRow: TBookmarkStr);
        procedure UpdateBkmPosSelection(FromRow, ToRow: TtsBkmPos; Select: Boolean);
        procedure UpdateSelection(FromRow, ToRow: TBookmarkStr; Select: Boolean);
        procedure SetSelected(DataRow: TBookmarkStr; Value: Boolean);
        function  GetSelected(DataRow: Variant): Boolean;
        function  GetFirst: Variant;
        function  GetLast: Variant;
        procedure ResetAll;
        function  GetFirstBkmPos: TtsBkmPos;
        function  GetLastBkmPos: TtsBkmPos;
        procedure SetUseRangeSelection(Value: Boolean);
        function  NextInRange(Index: Variant): Variant;
        function  PreviousInRange(Index: Variant): Variant;

        property UseRangeSelection: Boolean read FUseRangeSelection write SetUseRangeSelection;
        property AllSelected: Boolean read GetAllSelected write SetAllSelected;

    public
        constructor Create(Grid: TtsCustomDBGrid; UnboundSelection: TtsSelection);
        destructor  Destroy; override;

        function Next(Index: Variant): Variant;
        function Previous(Index: Variant): Variant;
        function RangeCount(FromIndex, ToIndex: Variant): Longint;
        function Count: Longint;

        property First: Variant read GetFirst;
        property Last: Variant read GetLast;
        property Selected[DataRow: Variant]: Boolean read GetSelected; default;
    end;

    {TtsDBCurrentCell}
    {The current cell in TtsCustomDBGrid}

    TtsDBCurrentCell = class(TtsCurrentCell)
    protected
        function  SetEditValue(const Value: Variant; ByUser, Redraw: Boolean): Boolean; override;
        procedure FetchCellValue; override;
        function  GetTextHeight: Integer; override;
        function  GetTextLines: Integer; override;
        function  GetDBDataRow: Variant;
        function  GetGrid: TtsCustomDBGrid;
        function  GetTextWidth : Integer;

        property Grid: TtsCustomDBGrid read GetGrid;

    public
	      procedure MoveTo(DataCol: Longint; DataRow : Variant);
        procedure MoveToInsertRow(DataCol: Longint); override;
        procedure PutInView; override;

        property TextWidth : Integer read GetTextWidth;
        property DataRow: Variant read GetDBDataRow;
    end;

    {TtsGridDataLink}
    {DataLink for a link with the datasource. All events from the datasource
     to the TtsCustomDBGrid notifying changes in the data come through the DataLink.}

    TtsGridDataLink = class(TDataLink)
    protected
        FGrid: TtsCustomDBGrid;
        FFieldCount: Integer;
        FFieldMapSize: Integer;
        FFieldMap: Pointer;
        FInUpdateData: Boolean;
        FSparseMap: Boolean;

        function  GetFields(DataCol: Longint): TField;
        procedure ActiveChanged; override;
        procedure CheckBrowseMode; override;
        procedure DataSetChanged; override;
        procedure DataSetScrolled(Distance: Integer); override;
        procedure EditingChanged; override;
        procedure LayoutChanged; override;
        procedure RecordChanged(Field: TField); override;
        procedure UpdateData; override;
        function  GetMappedIndex(DataCol: Longint): Integer;

    public
        constructor Create(Grid: TtsCustomDBGrid);
        destructor  Destroy; override;

        function  AddMapping(const FieldName: string; Field: TField): Boolean;
        procedure ClearMapping;
        procedure Reset;

        property  FieldCount: Integer read FFieldCount;
        property  Fields[DataCol: Longint]: TField read GetFields;
        property  SparseMap: Boolean read FSparseMap write FSparseMap;
    end;

    {TtsFieldList}
    {Class for maintaining a list of all fields currently in the dataset
     attached to the grid. These fields can, but do not have to be attached to
     a column.}

    TtsFieldList = class(TList)
    protected
        FGrid: TtsCustomDBGrid;

        procedure Reset;
        function  CreateField(Value: TField): TtsDBField;
        procedure CreateFields;
        function  FindField(FieldName: string): TtsDBField;
        function  FieldIndex(Field: TField): Integer;

        property Grid: TtsCustomDBGrid read FGrid;
    public
        constructor Create(Grid: TtsCustomDBGrid);
        destructor  Destroy; override;
    end;

    {TtsDBCellCollection}
    {TCollection class for writing and reading cell properties}

    TtsDBCellCollection = class(TtsCellCollection)
    protected
        function  CreateCell(Grid: TtsBaseGrid): TtsCell; override;
    public
        procedure ApplyProps; override;
    end;

    TtsDBCellItem = class(TCollectionItem)
    protected
        FCell: TtsDBCell;
        FDataCol: Longint;
        FDataRow: Variant;
        function  GetCell: TtsDBCell;
        procedure WriteDataRow(Writer: TWriter);
        procedure ReadDataRow(Reader: TReader);
        procedure DefineProperties(Filer: TFiler); override;
    public
        constructor Create(Collection: TCollection); override;
        destructor Destroy; override;
        property DataRow: Variant read FDataRow write FDataRow;
    published
        property DataCol: Longint read FDataCol write FDataCol;
        property Cell: TtsDBCell read GetCell write FCell;
    end;

    {TtsDBRowCollection}
    {TCollection class for writing and reading row properties}

    TtsDBRowCollection = class(TtsPropCollection)
    protected
        FRow: TtsDBRow;
        function CreateRow(Grid: TtsBaseGrid): TtsDBRow; virtual;
    public
        constructor Create(Grid: TtsBaseGrid; ItemClass: TCollectionItemClass);
        destructor Destroy; override;
        procedure ApplyProps; virtual;

        property Row: TtsDBRow read FRow write FRow;
    end;

    TtsDBRowItem = class(TCollectionItem)
    protected
        FRow: TtsDBRow;
        FDataRow: Variant;

        function  GetRow: TtsDBRow;
        procedure WriteDataRow(Writer: TWriter);
        procedure ReadDataRow(Reader: TReader);
        procedure DefineProperties(Filer: TFiler); override;
    public
        constructor Create(Collection: TCollection); override;
        destructor Destroy; override;
        property DataRow: Variant read FDataRow write FDataRow;
    published
        property Row: TtsDBRow read GetRow write FRow;
    end;

    {TtsGridData}
    {Abstract base class for access to the data in the attached dataset. There
     are two derived classes, TtsStandardDataset and TtsScrollDataset.
     TtstandardDataset is used to provide support for the standard TDataset.
     TtsScrollDataset is used to provide enhanced scrolling behaviour when
     working with the BDE.}

    TtsRowProp = record
        Selected: Boolean;
        SelectedSaved: Boolean;
        Prop: TtsDBRowElement;
        PropSaved: Boolean;
    end;

    PtsPropArray = ^TtsPropArray;
    TtsPropArray = array[1..(MaxListSize div ((SizeOf(TtsRowProp) div SizeOf(Longint)) + 1))] of TtsRowProp;

    TtsGridData = class(TObject)
    protected
        FGrid: TtsCustomDBGrid;
        FDataset: TDataset;
        FDatalink: TtsGridDataLink;
        FCanDisableControls: Integer;
        FControlsDisabled: Boolean;
        FQueryText: string;
        FQueryParams: TParams;
        FFieldLayout: TList;
        FPropBuffer: PtsPropArray;
        FPropBufSize: Integer;
        FPropBufferCleared: Boolean;
        FIndexName: string;
        FIndexFieldNames: string;

        procedure ResetFieldLayout;
        procedure SaveFieldLayout;
        function  FieldLayoutChanged: Boolean;
        function  FieldOrderChanged: Boolean;
        function  DatasetIndexName: string;
        function  DatasetIndexFieldNames: string;
        function  IndexChanged: Boolean;
        procedure SaveCurIndex;
        procedure InitGridDataSet; virtual;
        function  CompareBkm(Bkm1, Bkm2: TBookmarkStr): Integer;
        function  CheckCompareBkmPos(var BkmPos1, BkmPos2: TtsBkmPos;
                                     var Found: Boolean): Integer;
        function  CompareBkmPos(var BkmPos1, BkmPos2: TtsBkmPos): Integer;
        function  GreaterEqualBkmPos(var BkmPos1, BkmPos2: TtsBkmPos): Boolean;
        function  LessEqualBkmPos(var BkmPos1, BkmPos2: TtsBkmPos): Boolean;
        function  GreaterBkmPos(var BkmPos1, BkmPos2: TtsBkmPos): Boolean;
        function  LessBkmPos(var BkmPos1, BkmPos2: TtsBkmPos): Boolean;
        function  RecIDRow(ID: Variant): Integer;
        function  BkmPosBookmark(const BkmPos: TtsBkmPos; var Bkm: TBookmarkStr): Boolean;
        function  ActualBkmPos(BkmPos: TtsBkmPos): TtsBkmPos;
        function  GetRecNo: Integer;
        procedure SetRecNo(Value: Integer);
        procedure CheckDisableControls;
        procedure SetCanDisableControls(Value: Boolean);
        function  GetCanDisableControls: Boolean;
        procedure CheckDatalinkBufferOk(OldSize: Integer);
        procedure SetDatasetBufferCount(BufSize: Integer);
        procedure LinkActive(Value: Boolean); virtual;
        procedure ClearPropBuffer(FromRow, ToRow: Integer; Reset: Boolean);
        procedure ResizePropBuffer(NewSize: Integer);

        function  GetBufferRows: Integer; virtual; abstract;
        function  GetActive: Boolean; virtual; abstract;
        procedure MoveFirst; virtual; abstract;
        procedure MoveLast; virtual; abstract;
        procedure SetActiveRecord(Value: Integer); virtual; abstract;
        function  GetActiveRecord: Integer; virtual; abstract;
        function  GetActiveRecordNumber: Longint; virtual; abstract;
        function  GetActiveBookmark: TBookmarkStr; virtual; abstract;
        function  GetRecCount: Longint; virtual; abstract;
        function  FirstRow: Longint; virtual; abstract;
        function  CurrentBufRow: Integer; virtual; abstract;
        function  BufferPos(Bkm: TBookmarkStr): Integer; virtual; abstract;
        function  BufferRow(Bkm: TBookmarkStr): Integer; virtual; abstract;
        function  BufferBkmPos(BkmPos: TtsBkmPos): Integer; virtual; abstract;
        function  MoveActive(Count: Longint; var MovedBy: Longint): Longint; virtual; abstract;
        function  GetBookmark(BufRow: Integer): TBookmarkStr; virtual; abstract;
        function  GetRecId(BufRow: Integer): Variant; virtual; abstract;
        function  GetRecordId(BufRow: Integer): Variant; virtual; abstract;
        function  ResizeBuffer(NewSize: Integer; var Redraw: Boolean): Boolean; virtual; abstract;
        function  OnLastRecord: Boolean; virtual; abstract;
        function  NextBookmark(Bkm: TBookmarkStr; var NextBkm: TBookmarkStr): Boolean; virtual; abstract;
        function  PrevBookmark(Bkm: TBookmarkStr; var PrevBkm: TBookmarkStr): Boolean; virtual; abstract;
        function  PrevBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos; virtual; abstract;
        function  NextBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos; virtual; abstract;
        function  CheckPrevBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos; virtual; abstract;
        function  CheckNextBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos; virtual; abstract;
        function  FirstBookmark: TBookmarkStr; virtual; abstract;
        function  LastBookmark: TBookmarkStr; virtual; abstract;
        function  IsSequenced: Boolean; virtual;
        function  FirstBkmPos: TtsBkmPos; virtual;
        function  LastBkmPos: TtsBkmPos; virtual;
        function  BufferPositionChanged(Value: TtsDatasetPosition): Boolean; virtual;
        function  GetDatasetPosition: TtsDatasetPosition; virtual;
        procedure SetDatasetPosition(Value: TtsDatasetPosition); virtual;
        function  MoveBy(Count: Longint): Longint; virtual; abstract;
        function  GetAtEnd: Boolean; virtual; abstract;
        procedure SetAtEnd(Value: Boolean); virtual; abstract;
        function  GetAtStart: Boolean; virtual; abstract;
        procedure SetAtStart(Value: Boolean); virtual; abstract;
        function  MoveToRecord(Bkm: TBookmarkStr): Boolean; virtual; abstract;
        procedure RereadBuffer(TopRow: Longint; ForceRead: Boolean); virtual; abstract;
        procedure SetProperties(Reread: Boolean); virtual; abstract;
        function  BookmarkValue(Fieldno: Longint; Bkm: TBookmarkStr): Variant; virtual; abstract;
        function  GetBookmarkRecID(RecBkm: TBookmarkStr; BufRownr: Integer): Variant; virtual; abstract;
        function  GetBkmValueAndRecordID(Fieldno: Integer; Bkm: TBookmarkStr; var FieldValue: Variant): Variant; virtual; abstract;
        function  DoRecCount(ReCount: Boolean): Longint; virtual; abstract;
        function  FindKey(Value: string; Fieldno: Integer; CompareType: TtsComboCompareType;
                          ParentGrid: TtsCustomDBGrid; FullCmpLen: Boolean; var Found: Boolean): TBookmarkStr; virtual; abstract;
        function  LocateValue(FromBkm, ToBkm: TBookmarkStr; Value: string; Fieldno: Integer;
                              CompareType: TtsComboCompareType; ParentGrid: TtsCustomDBGrid;
                              FullCmpLen: Boolean; var Found: Boolean): TBookmarkStr; virtual; abstract;
        function  GetPreviousBkms(var FromBkm: TBookmarkStr; ToBkm: TBookmarkStr; BkmList: TtsSelectedList;
                                  StepSize: Integer; SelectingAll: Boolean; var Found: Boolean;
                                  var Count, Total: Longint; var Canceled: Boolean): Boolean; virtual; abstract;
        function  GetNextBkms(var FromBkm: TBookmarkStr; ToBkm: TBookmarkStr; BkmList: TtsSelectedList;
                              StepSize: Integer; SelectingAll: Boolean; var Found: Boolean;
                              var Count, Total: Longint; var Canceled: Boolean): Boolean; virtual; abstract;
        procedure SetBookmarkPos(Value: TBookmarkStr); virtual; abstract;
        function  GetBookmarkPos: TBookmarkStr; virtual; abstract;

        property Dataset: TDataset read FDataset write FDataset;
        property Datalink: TtsGridDataLink read FDatalink write FDatalink;
        property BufferRows: Integer read GetBufferRows;
        property Active: Boolean read GetActive;
        property ActiveRecord: Integer read GetActiveRecord write SetActiveRecord;
        property ActiveBookmark: TBookmarkStr read GetActiveBookmark;
        property ActiveRecordNumber: Longint read GetActiveRecordNumber;
        property RecCount: Longint read GetRecCount;
        property RecId[BufRow: Integer]: Variant read GetRecId;
        property Bookmark[BufRow: Integer]: TBookmarkStr read GetBookmark;
        property RecordId[BufRow: Integer]: Variant read GetRecordId;
        property RecNo: Integer read GetRecNo write SetRecNo;
        property CanDisableControls: Boolean read GetCanDisableControls write SetCanDisableControls;
        property DatasetPosition: TtsDatasetPosition read GetDatasetPosition write SetDatasetPosition;
        property AtEnd: Boolean read GetAtEnd write SetAtEnd;
        property AtStart: Boolean read GetAtStart write SetAtStart;
        property BookmarkPos: TBookmarkStr read GetBookmarkPos write SetBookmarkPos;

    public
        constructor Create(Grid: TtsCustomDBGrid);
        destructor  Destroy; override;
    end;

    {TtsScrollDataset}
    {The ScrollDataset provides independant scrolling behaviour of the
     TtsCustomDBGrid. It maintains a clone of the original dataset which can be
     positioned independantly from the dataset. All data for the grid comes
     from the clone, except for records being edited. Edited values are read
     from and written to the original dataset.}

    PBookmarkStr = ^TBookmarkStr;

    TtsScrollDataset = class(TtsGridData)
    protected
        FHandle: HDBICur;
        FCursorProps: CurProps;
        FActive: Boolean;
        FBuffer: PChar;
        FOldBuffer: PChar;
        FReadBuffer: PChar;
        FTempBuffer: PChar;
        FLookupBuffer: PChar;
        FBufRowSize: Integer;
        FBufRecSize: Integer;
        FBufBookmarkSize: Integer;
        FBufBkmInfoSize: Integer;
        FRecInfoStart: Integer;
        FBufRecIDSize: Integer;
        FRecIDStart: Integer;
        FPBkmStart: Integer;
        FBufPBkmSize: Integer;
        FLookupSize: Integer;
        FLookupStart: Integer;
        FRecNoStatus: TRecNoStatus;
        FBufRows: Integer;
        FOldBufRows: Integer;
        FBufFirstRow: Longint;
        FBufLastRow: Longint;
        FCursorRow: Longint;
        FCursorPosition: TtsCursorPosition;
        FRecCount: Longint;
        FRowsCounted: Longint;
        FCountPos: Longint;
        FCountDirection: TtsCountDirection;
        FActiveBufIndex: Integer;
        FAtStart: Boolean;
        FAtEnd: Boolean;
        FBeenAtEnd: Boolean;
        FRepositioned: Boolean;
        FRepositionDirection: TtsCountDirection;
        FInsertBkm: TBookmarkStr;
        FActiveBookmark: TBookmarkStr;
        FRecordInserted: Boolean;
        FOnInsertRecord: Boolean;
        FEnableCheckRowsCount: Integer;
        FFilter: string;
        FFiltered: Boolean;
        FFilterOptions: TFilterOptions;
        FMasterSource: TDataSource;
        FMasterFields: string;
        FMasterFieldValues: Variant;
        FRecordTypes: Byte;

        function  CheckErr(Err: DbiResult): Boolean;
        function  DatasetHandle: HDBICur;
        function  DatasetLocale: TLocale;
        procedure InitLookupFields(var LengthOfFields: Integer);
        procedure InitGridDataSet; override;
        procedure ResetRecCount;
        procedure InitBuffer;
        function  PBookmark(BufRow: Integer): PBookmarkStr;
        function  PRecordId(BufRow: Integer): PVariant;
        procedure SetRecId(BufRow: Integer; Value: Variant);
        function  GetRecId(BufRow: Integer): Variant; override;
        procedure ClearRecIds(First, Last: Integer; Assign: Boolean);
        procedure ClearBkm(First, Last: Integer; Assign: Boolean);
        procedure CreateBuffer(Size: Integer);
        procedure FreeBuffer;
        function  RecordBuffer(BufRow: Integer): PChar;
        function  GetRecCount: Longint; override;
        function  GetBufRecCount: Integer;
        function  GetActiveRecordBuffer: PChar;
        function  GetActiveBookmark: TBookmarkStr; override;
        procedure SetActiveBookmark(Value: TBookmarkStr);
        procedure GetLookupFields(BufRow: Integer);
        procedure FetchRecordId(BufRow: Integer; Bkm: TBookmarkStr);
        function  GetRecord(BufRow: Integer; Direction: Integer): DbiResult;
        procedure CheckOnInsertRecord(BufRow: Integer);
        function  CheckInsertPassed(var Err: DbiResult; FirstBkm, LastBkm: TBookmarkStr;
                                    Direction: Integer; WasOnInsert: Boolean): Boolean;
        function  CheckInsertedRecord(PrevBkm, CurBkm: TBookmarkStr; BufRow: Integer;
                                      Direction: Integer): Boolean;
        function  GetRecords(StartRow, EndRow: Integer; Direction: Integer;
                             var Count: Longint): DbiResult;
        procedure SetToFirst(ReadData: Boolean);
        procedure SetToEnd(ReadData: Boolean);
        function  SetToRecord(BufRow: Integer): DbiResult;
        function  DoRecCount(ReCount: Boolean): Longint; override;
        procedure MoveBuffer(ToIndex, FromIndex, Count: Integer);
        procedure CheckCountPosition(Err: DbiResult; Count: Integer);
        procedure CheckCursorPosition(Err: DbiResult);
        procedure CheckRowCount(Err: DbiResult);
        procedure AdjustCountOnInsert;
        procedure AdjustCountOnCancel;
        procedure AdjustBufRange;
        function  CheckAtStart: Boolean;
        function  CheckAtEnd: Boolean;
        function  GetAtEnd: Boolean; override;
        procedure SetAtEnd(Value: Boolean); override;
        function  GetAtStart: Boolean; override;
        procedure SetAtStart(Value: Boolean); override;
        function  GetActive: Boolean; override;
        function  OnLastRecord: Boolean; override;
        function  IsSequenced: Boolean; override;
        function  MoveSequenced(Count: Longint; var MoveCount: Longint;
                                var Err: DbiResult): Boolean;
        function  MoveRelative(Count: Longint; var MoveCount: Longint): DbiResult;
        function  MoveForward(Count: Longint): Longint;
        function  MoveBackward(Count: Longint): Longint;
        function  MoveActiveBackward(Count: Longint; var MovedBy: Longint): Longint;
        function  MoveActiveForward(Count: Longint; var MovedBy: Longint): Longint;
        procedure SetActiveRecord(Value: Integer); override;
        function  GetActiveRecord: Integer; override;
        function  GetActiveRecordNumber: Longint; override;
        function  GetRowCountKnown: Boolean;
        function  GetBufferRows: Integer; override;
        function  GetBufferBookmark(BufRow: Integer): TBookmarkStr;
        function  GetBookmark(BufRow: Integer): TBookmarkStr; override;
        function  GetSeqNumber(BufRow: Integer): Longint;
        function  GetRecordId(BufRow: Integer): Variant; override;
        function  FindKey(Value: string; Fieldno: Integer; CompareType: TtsComboCompareType;
                          ParentGrid: TtsCustomDBGrid; FullCmpLen: Boolean; var Found: Boolean): TBookmarkStr; override;
        function  LocateValue(FromBkm, ToBkm: TBookmarkStr; Value: string;
                              Fieldno: Integer; CompareType: TtsComboCompareType;
                              ParentGrid: TtsCustomDBGrid; FullCmpLen: Boolean; var Found: Boolean): TBookmarkStr; override;
        function  GetPreviousBkms(var FromBkm: TBookmarkStr; ToBkm: TBookmarkStr; BkmList: TtsSelectedList;
                                  StepSize: Integer; SelectingAll: Boolean; var Found: Boolean;
                                  var Count, Total: Longint; var Canceled: Boolean): Boolean; override;
        function  GetNextBkms(var FromBkm: TBookmarkStr; ToBkm: TBookmarkStr; BkmList: TtsSelectedList;
                              StepSize: Integer; SelectingAll: Boolean; var Found: Boolean;
                              var Count, Total: Longint; var Canceled: Boolean): Boolean; override;
        procedure SetBookmarkPos(Value: TBookmarkStr); override;
        function  GetBookmarkPos: TBookmarkStr; override;
        function  BookmarkValue(Fieldno: Longint; Bkm: TBookmarkStr): Variant; override;
        procedure SetTempBuffer;
        procedure RestoreBuffer;
        function  GetBookmarkRecID(RecBkm: TBookmarkStr; BufRownr: Integer): Variant; override;
        function  GetBkmValueAndRecordID(Fieldno: Integer; Bkm: TBookmarkStr; var FieldValue: Variant): Variant; override;
        function  GetCursorBookmark(Handle: HDBICur): TBookmarkStr;
        function  InsertRecord(MoveDataUp: Boolean; CurBkm: TBookmarkStr): TBookmarkStr;
        function  AppendRecord(CurBkm: TBookmarkStr): TBookmarkStr;
        function  AppendRecordAtEnd: Boolean;
        procedure SetBookmark(BufRow: Integer; Bkm: TBookmarkStr);
        procedure SetInfo(Buffer: PChar; Info: Integer);
        procedure SetBookmarkInfo(BufRow: Integer; Info: Integer);
        function  GetBookmarkInfo(BufRow: Integer): Integer;
        function  UseRecordIds: Boolean;
        procedure ReallocBuffer(NewSize: Integer);
        function  ResizeBuffer(NewSize: Integer; var Redraw: Boolean): Boolean; override;
        procedure ResizeAppend(Delta: Integer);
        function  FirstRow: Longint; override;
        function  CurrentBufRow: Integer; override;
        function  BufferPos(Bkm: TBookmarkStr): Integer; override;
        function  BufferRow(Bkm: TBookmarkStr): Integer; override;
        function  BufferBkmPos(BkmPos: TtsBkmPos): Integer; override;
        function  PrevBookmark(Bkm: TBookmarkStr; var PrevBkm: TBookmarkStr): Boolean; override;
        function  NextBookmark(Bkm: TBookmarkStr; var NextBkm: TBookmarkStr): Boolean; override;
        function  CheckPrevBookmark(Bkm: TBookmarkStr): TBookmarkStr;
        function  CheckNextBookmark(Bkm: TBookmarkStr): TBookmarkStr;
        function  PrevBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos; override;
        function  NextBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos; override;
        function  CheckPrevBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos; override;
        function  CheckNextBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos; override;
        function  FirstBookmark: TBookmarkStr; override;
        function  LastBookmark: TBookmarkStr; override;
        function  FirstBkmPos: TtsBkmPos; override;
        function  LastBkmPos: TtsBkmPos; override;
        function  CompareBkm(Bkm1, Bkm2: TBookmarkStr): Integer;
        procedure UpdatePosition(DiffRows: Longint);
        procedure RepositionRows(DiffRows: Longint);
        procedure EstimatePosition(OldBookmark, NewBookmark: TBookmarkStr);
        function  SyncToBookmark(NewBookmark, OldBookmark: TBookmarkStr;
                                 TopRow: Integer; MoveToTop: Boolean; var RowMoved: Boolean): Boolean;
        function  InBuffer(FromRow: Integer; Bkm: TBookmarkStr): Boolean;
        function  SetPosOnBookmark(Bkm: TBookmarkStr; TopRow: Integer;
                                   MoveToTop: Boolean; var Reposition,
                                   RowMoved: Boolean; var Err: DbiResult): Boolean;
        function  RepositionBuffer(ActiveBkm: TBookmarkStr; TopRow: Integer;
                                   MoveToTop: Boolean; var Reposition, RowMoved: Boolean): Boolean;
        function  ScrollBookmark: TBookmarkStr;
        function  DataSetBookmark: TBookmarkStr;
        function  GetLocale: TLocale;
        procedure SetEnableCheckRows(Value: Boolean);
        function  GetEnableCheckRows: Boolean;
        function  GetFieldValues(FieldNames: string): Variant;
        function  DatasetMasterSource: TDataSource;
        function  DatasetMasterFields: string;
        function  DatasetMasterFieldValues: Variant;
        function  DatasetRecordTypes: Byte;
        function  FilterChanged: Boolean;
        function  PropertiesChanged: Boolean;
        function  FieldValuesEqual(Value1, Value2: Variant): Boolean;
        function  MasterChanged: Boolean;
        function  LocateBookmark(SearchBkm: TBookmarkStr; var StartBkm, LastBkm: TBookmarkStr;
                                 var Count: Longint): DbiResult;

        procedure Open;
        procedure Close;
        procedure Reopen;
        procedure LinkActive(Value: Boolean); override;
        procedure ForceReread;
        procedure RereadBuffer(TopRow: Longint; ForceRead: Boolean); override;
        procedure SetProperties(Reread: Boolean); override;
        procedure MoveFirst; override;
        procedure MoveLast; override;
        function  MoveBy(Count: Longint): Longint; override;
        function  MoveToRecnr(Row: Longint): Longint;
        procedure MoveNext;
        procedure MovePrevious;
        function  MoveActive(Count: Longint; var MovedBy: Longint): Longint; override;
        function  MoveToRecord(Bkm: TBookmarkStr): Boolean; override;
        procedure EndInsert(var NewBookmark: TBookmarkStr; Canceled: Boolean;
                            Reread: Boolean; TopRow: Integer; var RowMoved: Boolean);
        procedure EndUpdate(var NewBookmark: TBookmarkStr; TopRow: Integer;
                            var RowMoved, BufferMoved: Boolean);
        procedure CalculatePos;

        property Handle: HDBICur read FHandle;
        property BufRecCount: Integer read GetBufRecCount;
        property ActiveRecordBuffer: PChar read GetActiveRecordBuffer;
        property ActiveBookmark: TBookmarkStr read GetActiveBookmark write SetActiveBookmark;
        property ReadBuffer: PChar read FReadBuffer;
        property SeqNumber[BufRow: Integer]: Longint read GetSeqNumber;
        property RecId[BufRow: Integer]: Variant read GetRecId write SetRecId;
        property BeenAtEnd: Boolean read FBeenAtEnd;
        property RowCountKnown: Boolean read GetRowCountKnown;

        property OnInsertRecord: Boolean read FOnInsertRecord;
        property Locale: TLocale read GetLocale;
        property EnableCheckRows: Boolean read GetEnableCheckRows write SetEnableCheckRows;
        property FieldValues[FieldNames: string]: Variant read GetFieldValues;

    public
        constructor Create(Grid: TtsCustomDBGrid);
        destructor Destroy; override;
    end;

    {TtsStandardDataset}
    {The TtsStandardDataset provides support for the standard TDataset and
     TClientDataset. Access to the attached dataset is through the standard
     TDataset interface only.}

    PtsVariantArray = ^TtsVariantArray;
    TtsVariantArray = array[1..(MaxListSize div ((SizeOf(Variant) div SizeOf(Longint)) + 1))] of Variant;

    TtsStandardDataset = class(TtsGridData)
    protected
        FRecIdBuf: PtsVariantArray;
        FBkmBuf: PtsVariantArray;
        FBufSize: Integer;

        function  GetBufferRows: Integer; override;
        function  GetActive: Boolean; override;
        procedure LinkActive(Value: Boolean); override;
        procedure MoveFirst; override;
        procedure MoveLast; override;
        procedure SetActiveRecord(Value: Integer); override;
        function  GetActiveRecord: Integer; override;
        function  GetActiveRecordNumber: Longint; override;
        function  GetActiveBookmark: TBookmarkStr; override;
        function  GetRecCount: Longint; override;
        function  FirstRow: Longint; override;
        function  CurrentBufRow: Integer; override;
        function  BufferPos(Bkm: TBookmarkStr): Integer; override;
        function  BufferRow(Bkm: TBookmarkStr): Integer; override;
        function  BufferBkmPos(BkmPos: TtsBkmPos): Integer; override;
        function  MoveActive(Count: Longint; var MovedBy: Longint): Longint; override;
        function  GetBookmark(BufRow: Integer): TBookmarkStr; override;
        function  GetRecId(BufRow: Integer): Variant; override;
        function  GetRecordId(BufRow: Integer): Variant; override;
        procedure ClearIdBuffers(FromRow, ToRow: Integer; Reset: Boolean);
        procedure ResizeIdBuffers(NewSize: Integer);
        procedure MoveIdBuffers(Distance: Integer);
        function  ResizeBuffer(NewSize: Integer; var Redraw: Boolean): Boolean; override;
        function  OnLastRecord: Boolean; override;
        function  NextBufferBkm(Bkm: TBookmarkStr; var NextBkm: TBookmarkStr): Boolean;
        function  PrevBufferBkm(Bkm: TBookmarkStr; var PrevBkm: TBookmarkStr): Boolean;
        function  SetToBookmark(Bkm: TBookmarkStr; RaiseError: Boolean): Boolean;
        function  GetNextBookmark(Bkm: TBookmarkStr; var NextBkm: TBookmarkStr): Boolean;
        function  NextBookmark(Bkm: TBookmarkStr; var NextBkm: TBookmarkStr): Boolean; override;
        function  GetPrevBookmark(Bkm: TBookmarkStr; var PrevBkm: TBookmarkStr): Boolean;
        function  PrevBookmark(Bkm: TBookmarkStr; var PrevBkm: TBookmarkStr): Boolean; override;
        function  PrevBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos; override;
        function  NextBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos; override;
        function  CheckPrevBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos; override;
        function  CheckNextBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos; override;
        function  FirstBookmark: TBookmarkStr; override;
        function  LastBookmark: TBookmarkStr; override;
        function  BufferPositionChanged(Value: TtsDatasetPosition): Boolean; override;
        function  GetDatasetPosition: TtsDatasetPosition; override;
        procedure SetDatasetPosition(Value: TtsDatasetPosition); override;
        function  MoveBy(Count: Longint): Longint; override;
        function  GetAtEnd: Boolean; override;
        procedure SetAtEnd(Value: Boolean); override;
        function  GetAtStart: Boolean; override;
        procedure SetAtStart(Value: Boolean); override;
        function  MoveToRecord(Bkm: TBookmarkStr): Boolean; override;
        procedure RereadBuffer(TopRow: Longint; ForceRead: Boolean); override;
        procedure SetProperties(Reread: Boolean); override;
        function  BookmarkValue(Fieldno: Longint; Bkm: TBookmarkStr): Variant; override;
        function  GetBookmarkRecID(RecBkm: TBookmarkStr; BufRownr: Integer): Variant; override;
        function  GetBkmValueAndRecordID(Fieldno: Integer; Bkm: TBookmarkStr; var FieldValue: Variant): Variant; override;
        function  DoRecCount(ReCount: Boolean): Longint; override;
        function  KeyEqual(KeyBkm: TBookmarkStr; SearchValue: string; Fieldno: Integer;
                           CompareType: TtsComboCompareType; ParentGrid: TtsCustomDBGrid;
                           FullCmpLen: Boolean): Boolean;
        function  CanFindNearest: Boolean; virtual;
        procedure FindNearest(Value: string); virtual;
        function  FindKey(Value: string; Fieldno: Integer; CompareType: TtsComboCompareType;
                          ParentGrid: TtsCustomDBGrid; FullCmpLen: Boolean; var Found: Boolean): TBookmarkStr; override;
        function  LocateValue(FromBkm, ToBkm: TBookmarkStr; Value: string; Fieldno: Integer;
                              CompareType: TtsComboCompareType; ParentGrid: TtsCustomDBGrid;
                              FullCmpLen: Boolean; var Found: Boolean): TBookmarkStr; override;
        function  GetPreviousBkms(var FromBkm: TBookmarkStr; ToBkm: TBookmarkStr; BkmList: TtsSelectedList;
                                  StepSize: Integer; SelectingAll: Boolean; var Found: Boolean;
                                  var Count, Total: Longint; var Canceled: Boolean): Boolean; override;
        function  GetNextBkms(var FromBkm: TBookmarkStr; ToBkm: TBookmarkStr; BkmList: TtsSelectedList;
                              StepSize: Integer; SelectingAll: Boolean; var Found: Boolean;
                              var Count, Total: Longint; var Canceled: Boolean): Boolean; override;
        procedure SetBookmarkPos(Value: TBookmarkStr); override;
        function  GetBookmarkPos: TBookmarkStr; override;

    public
        constructor Create(Grid: TtsCustomDBGrid);
        destructor Destroy; override;
    end;

    TtsStoredRow = record
        DataRow: Variant;
        Element: TtsCustomElement;
    end;

    {TtsCustomDBGrid}
    {Custom class for data-aware grid component which can be used as a custom
     grid for creating visual grid components. Inherits a large part of its
     functionality from TtsBaseGrid. All data handling is implemented in the
     TtsCustomDBGrid.}

    TtsCustomDBGrid = class(TtsBaseGrid)
    protected
        FCreating: Boolean;
        FLayoutFromDataSet: Boolean;
        FDataLink: TtsGridDataLink;
        FInFieldLayout: Boolean;
        FGridData: TtsGridData;
        FStandardDataset: TtsStandardDataset;
        FScrollDataset: TtsScrollDataset;
        FLinkActive: Boolean;
        FCurBookmark: TBookmarkStr;
        FOldBookmark: TBookmarkStr;
        FEditBookmark: TBookmarkStr;
        FCanSetCurrentRec: Integer;
        FCanSetCurrentRow: Integer;
        FCanSynchronize: Integer;
        FInSyncDataset: Integer;
        FInDatasetEvent: Integer;
        FEditing: Boolean;
        FStartEditing: Boolean;
        FDataPosted: Boolean;
        FEditState: TDatasetState;
        FClosingEdit: Boolean;
        FOpeningEdit: Boolean;
        FCancelReread: Boolean;
        FDataModified: Boolean;
        FUpdateDataDone: Boolean;
        FRecordChangedDone: Boolean;
        FCheckBrowseModeDone: Boolean;
        FDataEditMode: TtsDataEditMode;
        FCellLoadBitmap: TBitmap;
        FOldRowCount: Longint;
        FOldLeftCol: Longint;
        FOldTopBkm: Variant;
        FMouseDownBkm: Variant;
        FMouseUpBkm: Variant;
        FDBSelectedRows: TtsDBSelection;
        FDBSelectedCells: TtsDBRect;
        FDBRowPropSet: TtsDBRowPropSet;
        FDBCellPropSet: TtsDBCellPropSet;
        FLastAddedBookmark: TBookmarkStr;
        FLastAddedBkmPos: TtsBkmPos;
        FSelectionStart: TBookmarkStr;
        FSavedSelectedRows: TBits;
        FLoadFirstRow: Boolean;
        FLastRowLoaded: TBookmarkStr;
        FLastRownrLoaded: Longint;
        FFieldList: TtsFieldList;
        FIgnoreDatasetScrolled: Integer;
        FScrollDirection: Integer;
        FSelectDirection: Integer;
        FScrollPosition: Integer;
        FPrevScrollPosition: Integer;
        FScrollSelected: Boolean;
        FInScanRecords: Boolean;
        FCurDatasource: TDatasource;
        FCanGetCurrentCell: Integer;
        FReadBoundProps: Boolean;
        FResetReadDataBound: Boolean;
        FCellPropCollection: TtsCellCollection;
        FRowPropCollection: TtsDBRowCollection;
        FApplyBoundProps: Boolean;
        FLastRow: TtsStoredRow;
        FLookupDatasource: TDatasource;
        FSetLookupField: Boolean;

        {Property fields}
        FActive: Boolean;
        FAutoInsert: Boolean;
        FConfirmDelete: Boolean;
        FDataBound: Boolean;
        FExactRowCount: Boolean;
        FUseRecordIds: Boolean;
        FDatasetType: TtsDatasetType;
        FUseStandardDataset: Boolean;
        FBookmarkType: TtsBookmarkType;
        FBookmarkCompareType: TtsBookmarkCompareType;
        FRecordSelection: TtsRecordSelection;

        {Event fields}
        FOnButtonClick: TtsDBButtonEvent;
        FOnButtonDown: TtsDBButtonEvent;
        FOnButtonUp: TtsDBButtonEvent;
        FOnSpinButtonClick: TtsDBSpinButtonEvent;
        FOnSpinButtonDown: TtsDBSpinButtonEvent;
        FOnSpinButtonUp: TtsDBSpinButtonEvent;
        FOnSpinRepeat: TtsDBSpinRepeatEvent;
        FOnSpinIncrement: TtsDBSpinIncrementEvent;
        FOnCellEdit: TtsDBCellEditEvent;
        FOnCellLoaded: TtsDBCellLoadedEvent;
        FOnClickCell: TtsDBClickCellEvent;
        FOnComboCellLoaded: TtsDBComboCellLoadedEvent;
        FOnComboDropDown: TtsDBComboCellEvent;
        FOnComboGetValue: TtsDBComboGetValueEvent;
        FOnComboInit: TtsDBComboCellEvent;
        FOnComboRollUp: TtsDBComboCellEvent;
        FOnDateTimeDropDown: TtsDBDateTimeCellEvent;
        FOnDateTimeGetValue: TtsDBDateTimeGetValueEvent;
        FOnDateTimeInit: TtsDBDateTimeCellEvent;
        FOnDateTimeRollUp: TtsDBDateTimeCellEvent;
        FOnCompareRecordId: TtsDBCompareRecordIDEvent;
        FOnDblClickCell: TtsDBDblClickCellEvent;
        FOnDeleteRow: TtsDBDeleteRowEvent;
        FOnEndCellEdit: TtsDBCellEditingEvent;
        FOnEndRowEdit: TtsDBRowEditingEvent;
        FOnShowEditor: TtsDBShowEditorEvent;
        FOnInvalidMaskValue: TtsDBInvalidCellValueEvent;
        FOnInvalidMaskEdit: TtsDBInvalidCellEditEvent;
        FOnGetDrawInfo: TtsDBGetDrawInfoEvent;
        FOnGetRecordId: TtsDBGetRecordIDEvent;
        FOnInsertRow: TtsDBInsertRowEvent;
        FOnPaintCell: TtsDBPaintCellEvent;
        FOnCellChanged: TtsDBCellChangedEvent;
        FOnRowChanged: TtsDBRowChangedEvent;
        FOnRowLoaded: TtsDBRowLoadedEvent;
        FOnStartCellEdit: TtsDBCellEditingEvent;
        FOnStartRowEdit: TtsDBRowEditingEvent;
        FOnTopLeftChanged: TtsDBTopLeftChangedEvent;
        FOnUndoCellEdit: TtsDBUndoCellEditEvent;
        FOnUndoRowEdit: TtsDBUndoRowEditEvent;
        FOnUpdateField: TtsDBUpdateFieldEvent;
        FOnScanRecords: TtsDBScanRecordsEvent;
        FOnFieldLayoutChange: TNotifyEvent;
        FOnPrintRow : TtsDBPrintRowEvent;
        FOnPrintCell : TtsDBPrintCellEvent;

        procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
        procedure CMParentFontChanged(var Message: TMessage); message CM_PARENTFONTCHANGED;
        procedure WMSize(var Message : TWMSize); message WM_SIZE;
        procedure WMVScroll(var Msg: TWMVScroll); message WM_VSCROLL;
        procedure WMSetCursor(var Msg: TWMSetCursor); message WM_SETCURSOR;

        {Error detection procedures}
        function  CheckIdType(const Id: Variant): Boolean;
        function  CheckBkmType(const Bkm: Variant): Boolean;
        function  CheckDataset(DatasetType: TtsDatasetType; Dataset: TDataset): Boolean;

        {Datalink procedures}
        procedure LinkActive(Value: Boolean); virtual;
        procedure CheckBrowseMode; virtual;
        procedure DataSetScrolled(Distance: Integer); virtual;
        procedure DataSetChanged; virtual;
        procedure EditingChanged; virtual;
        procedure LayoutChanged; virtual;
        procedure RecordChanged(Field: TField); virtual;
        procedure UpdateData; virtual;

        {Drawing procedures}
        procedure GetDrawInfo(DataCol, DataRow: Longint; var DrawInfo: TtsDrawInfo); override;
        procedure CellLoadedEvent(DataCol, DataRow: Longint; ControlType: TtsControlType; var Value: Variant); override;
        procedure DBCellLoaded(DataCol: Longint; DataRow: Variant; Rownr: Longint;
                               CheckRownr: Boolean; ControlType: TtsControlType; var Value: Variant);
        function  PaintCell(var DrawData: TtsDrawData; ARect: TRect; DrawSelected: Boolean): Boolean; override;
        procedure RedrawRow(DataRow: Variant; UseId: Boolean; Prop: TtsProperty);
        function  ActivateDoGetDrawInfo: Boolean; override;
        function  GiveDBCellFont(DisplayCol: Longint; DataRow: Variant): TFont;
        function  GiveDBCellWordWrap(DisplayCol: Longint; DataRow: Variant): TtsWordWrap;
        function  GiveDBCellAlignment(DisplayCol: Longint; DataRow: Variant): TAlignment;
        function  GiveDBCellButton(DisplayCol: Longint; DataRow: Variant; var Style: TtsDropDownStyle): TtsButtonType;
        function  GiveDBCellMaskName(DataCol: Longint; DataRow: Variant): string;
        function  GiveDBCellControlType(DataCol: Longint; DataRow: Variant): TtsControlType;
        function  GiveDBCellCombo(DataCol: Longint; DataRow: Variant): TtsCombo;
        function  GiveDBCellReadOnly(DataCol: Longint; DataRow: Variant): Boolean;
        function  GiveDBCellSelected(DataCol: Longint; DataRow: Variant): Boolean;
        function  GiveDBCellCheckBoxValues(DataCol: Longint; DataRow: Variant): string;
        function  CurCellMaskName: string; override;
        function  CurCellControlType: TtsControlType; override;
        function  CurCellReadOnly: Boolean; override;
        function  CurCellSelected: Boolean; override;
        function  CurCellCheckBoxValues: string; override;
        function  ButtonsActive: Boolean; override;
        function  CanDrawInsert: Boolean; override;

        {Row inversion procedures}
        procedure UpdateRowInversion(FromRow, ToRow: Longint; Select: Boolean);
        procedure InvertUnselectedRows(FromRow, ToRow: Longint); override;
        procedure InvertSelectedRows(FromRow, ToRow: Longint; Select: Boolean); override;
        procedure SaveSelectedRows(DistanceScrolled: Integer);
        procedure InvertSavedRows(FromRow, ToRow: Longint);
        procedure ToggleSavedRows(FromRow, ToRow: Longint; Select: Boolean);
        procedure ToggleChangedRows(FromRow, ToRow: Longint);

        {Current row/cell procedures}
        procedure SetCurrentPosition(DisplayCol, DisplayRow: Longint;
                                     InvalidateInsertRow, InvalidateOldCell: Boolean); override;
        procedure SetCurrentRowSelect(DisplayRow: Longint; Draw: Boolean);
        procedure SetCurrentRec(Bookmark: TBookmarkStr; BufRownr: Integer);
        function  CurrentRowChanged(DisplayRow: Longint): Boolean;
        function  CheckSetCurrent(DatasetPos: TtsDatasetPosition; DisplayRow: Longint): Boolean;
        procedure PositionRec(DisplayCol: Longint; Bookmark: TBookmarkStr;
                              Synchronize: Boolean);
        procedure PositionCurrentRec(DisplayCol: Longint; Bookmark: TBookmarkStr;
                                     Synchronize, Position: Boolean);
        procedure SetCurrentRow(PrevRecnr, Recnr: Integer);
        function  CheckClearBuffer(Col: TtsDBCol): Boolean;

        {Row selection procedures}
        procedure DeleteAllRowSelection; override;
        procedure SetScrollPosition(DisplayRow: Longint);
        function  CompareRowPos(DisplayRow: Longint): Integer; override;
        procedure GetFirstLastBkm(First, Last: Longint; var FirstBkm, LastBkm: TBookmarkStr );
        procedure GetFirstLastRow(var First, Last: Longint);
        procedure SelectCurrentRow(DisplayRow: Longint); override;
        procedure SaveDatasetPosition(var DatasetPos: TtsDatasetPosition);
        procedure RestoreDatasetPosition(DatasetPos: TtsDatasetPosition; Reset: Boolean);
        procedure SelectLargerRows(DisplayRow: Longint); override;
        procedure SelectSmallerRows(DisplayRow: Longint); override;
        procedure RowSelectScroll(CurrentBkm: TBookmarkStr; Count: Integer);
        procedure AddScrollingUp;
        procedure DeleteScrollingUp;
        procedure AddTopRowScrollingUp;
        procedure DeleteTopRowScrollingUp;
        procedure AddScrollingDown; override;
        procedure DeleteScrollingDown; override;
        procedure UpRowSelecting(CurrentPos, CheckPos: TPoint; DisplayRow: Longint); override;
        procedure DownRowSelecting(CurrentPos, CheckPos: TPoint; DisplayRow: Longint); override;
        procedure SetSelectDirection(DisplayRow: Longint);
        function  ScrollRows(X, Y: integer; var DisplayCol, DisplayRow: Longint): Boolean; override;
        procedure AddRowSelection(First, Last: Longint); override;
        procedure DeleteRowSelection(First, Last: Longint); override;
        procedure ChangeRowSelection(First, Last: Longint); override;
        procedure ScanRecordEvent(ScanAll: Boolean; State: TtsScanState; Count: Longint; var Cancel: Boolean);
        procedure DoScanRecord(ScanAll: Boolean; State: TtsScanState; var Count, Total: Longint; var Canceled: Boolean);
        procedure GetBufferList(StartRow, DisplayRow: Longint; List: TtsSelectedList;
                                SelectingAll: Boolean; var Count, Total: Longint; var Canceled: Boolean);
        function  GetDatasetList(DisplayRow: Integer; FromBkm, ToBkm: TBookmarkStr;
                                 Direction: Integer; SelectingAll: Boolean; var List: TtsSelectedList;
                                 var Canceled: Boolean): Integer;
        function  GetSelectedList(StartRow, DisplayRow: Longint; var List: TtsSelectedList;
                                  var Canceled: Boolean): Integer;
        procedure CheckEndBkmScan(ScanAll: Boolean; Activate: Boolean;
                                  BkmList: TtsSelectedList; var Canceled: Boolean);
        procedure SelectRowShiftMouseDown(DisplayRow: Longint; var Canceled: Boolean); override;
        procedure SelectRowShiftCtrlMouseDown(DisplayRow: Longint; var Canceled: Boolean); override;
        procedure SelectSingleRow(DisplayRow: Longint; Invalidate: Boolean); override;
        procedure SetNewSelectedRow(DisplayRow: Longint); override;
        procedure SelectSingleDBRow(DataRow: TBookmarkStr; Invalidate: Boolean);
        procedure CheckRowSelection(Invalidate: Boolean); override;
        procedure SetLastAddedRow(DisplayRow: Longint); override;
        procedure ResetScrollPosition;
        procedure ResetSelectionStart;
        procedure SetSelectionStartRow(DisplayRow: Longint); override;
        function  SelectionStartRownr: Integer; override;
        procedure CheckSetCurrentRow(DisplayRow: Longint); override;
        function  GetSelectionStart: TBookmarkStr;
        procedure EndRowSelecting(Select: Boolean); override;

        {Row change procedures}
        procedure CheckTopLeftChanged(ByUser: Boolean); override;
        procedure TopLeftChangedEvent(OldCol, OldRow, NewCol, NewRow: Longint;
                                      ByUser: Boolean); override;

        {Scrolling procedures}
        function  ScrollMoveUp(Count: Longint): Longint;
        function  ScrollMoveDown(Count: Longint): Longint;
        function  MoveToScrollPos(ScrollBarPos: Integer): Longint;
        procedure ScrollBarScroll(MoveBy: Longint);
        procedure KeyScroll(NewLeftCol, NewTopRow, RowScrollCount: Longint);
        function  ScrollWidth(ScrollCols: Longint): Integer;
        procedure DBScroll(ScrollCols, ScrollRows: Longint; ScrollMode: TtsScrollMode;
                           SetCurrent: Boolean);
        procedure DBScrollWindow(DX, DY: Longint);
        procedure DBScrollControl(DX, DY: Longint);
        procedure DBScrollRowSelect(DY: Longint);
        procedure ScrollDataInfo(DX, DY: Integer; var DrawInfo: TGridDrawInfo); override;
        function  ScrollLineUp(Count: Longint; CheckEdit: Boolean;
                               CheckSelect: Boolean; var ScrollCount, NewRow,
                               NewTopRow: Longint): Longint;
        function  ScrollLineDown(Count: Longint; CheckEdit: Boolean; CheckSelect: Boolean;
                                 var ScrollCount, NewRow, NewTopRow: Longint): Longint;
        procedure RepositionTopRow(OldRow, NewRow: Longint; DoPaint: Boolean);
        procedure AdjustTopLeft(ACol, ARow: Longint; DoPaint: Boolean);
        procedure ScrollToPosition(Position: TtsDataPosition);
        procedure MoveToPosition(Position: TtsDataPosition; ByUser: Boolean);
        function  CanMoveDown: Boolean;
        procedure KeyScrollRowSelect(MoveBy: Integer);
        procedure KeyFirstRowSelect(Redraw: Boolean);
        procedure KeyLastRowSelect(Redraw: Boolean);
        procedure RepositionRowSelect(ScrollCount: Integer; NewCol, NewRow,
                                      NewLeftCol, NewTopRow: Longint);
        procedure ScrollReposition(RowScrollCount: Longint; NewLeftCol, NewTopRow: Longint;
                                   NewCurrentCol, NewCurrentRow: Longint;
                                   SetScrollMode, PaintEnabled: Boolean; ByUser: Boolean);
        function  DatasetScrolledUp(Distance, Offset: Longint; var ScrollCount,
                                    NewCurRow, NewTopRow: Longint): Longint;
        function  DatasetScrolledDown(Distance, Offset: Longint; var ScrollCount,
                                      NewCurRow, NewTopRow: Longint): Longint;

        {Scrollbar procedures}
        function  ShowVertScrollBar(MaxHeight: Integer): Boolean; override;
        procedure UpdateScrollPos; override;
        function  UsePositionalScrollbar: Boolean;
        function  UseStandardScrolling: Boolean;
        procedure GetVertScrollRange(var ScrollRows, ScrollRange, StartRow,
                                     EndRow: Longint; var OutsideMaxRange: Boolean); override;
        function  GetVertScrollPos: Integer; override;
        function  GetVertScrollRow(Pos: Integer): Longint;
        function  VertScrollPageSize(ScrollRange, ScrollCount, EndRow: Longint): Integer; override;
        procedure ScrollStandardDataset(var Msg: TWMVScroll);
        procedure ScrollInternalDataset(var Msg: TWMVScroll);

        {Mouse procedures}
        procedure MDSelectAll(WithMouse: Boolean); override;
        procedure SetMouseDownColRow(DisplayCol, DisplayRow: Longint); override;
        procedure SetMouseUpColRow(DisplayCol, DisplayRow: Longint); override;
        procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
                            X, Y: Integer); override;
        function  CheckClickCell(DataColDown, DataRowDown, DataColUp, DataRowUp: Longint;
                                 DownPos, UpPos: TtsClickPosition): Boolean; override;
        procedure DblClickCell(DataCol, DataRow: Longint); override;

        {Keyboard procedures}
        function  KeyPageUp(Count: Longint; CheckEdit: Boolean; CheckSelect:
                            Boolean; var NewRow: Longint): Longint;
        function  KeyHomeUp(CheckEdit: Boolean; CheckSelect: Boolean;
                            var NewRow: Longint; var DoUpdateScrollRange: Boolean): Longint;
        function  KeyPageDown(Count: Longint; CheckEdit: Boolean; CheckSelect:
                              Boolean; var NewRow: Longint): Longint;
        function  KeyEndDown(CheckEdit: Boolean; CheckSelect: Boolean;
                             var NewRow: Longint; var DoUpdateScrollRange: Boolean): Longint;
        procedure VK_UpRowSelect; override;
        procedure KeyDownVK_Up; override;
        procedure VK_DownRowSelect; override;
        procedure KeyDownVK_Down; override;
        procedure VK_PriorRowSelect;
        procedure KeyDownVK_Prior; override;
        procedure VK_NextRowSelect;
        procedure KeyDownVK_Next; override;
        procedure VK_CtrlUpRowSelect;
        procedure KeyCtrl_Up; override;
        procedure VK_CtrlDownRowSelect;
        procedure KeyCtrl_Down; override;
        procedure VK_HomeRowSelect;
        procedure KeyCtrl_Home; override;
        procedure VK_EndRowSelect;
        procedure KeyCtrl_End; override;
        procedure KeyDownVK_Tab(Key: Word); override;
        procedure ShiftKeyDownVK_Tab; override;
        function  KeydownVK_Escape: Boolean; override;
        procedure DeleteSelectedRecords;
        function  CtrlKeyDownVK_Delete: Boolean;
        function  KeyDownVK_Insert: Boolean;
        procedure ProcessKeyDown(var Key: Word; Shift: TShiftState); override;
        procedure PutInView(DisplayCol: Longint; DataRow: Variant; Position: TtsViewPosition;
                            ResetCurrent, SetCurPos: Boolean; ChangeTopLeft: TtsChangeTopLeft);

        {Create/Destroy/Assign procedures}
        function  CreateCols: TtsGridCols; override;
        function  CreateCurrentCell: TtsCurrentCell; override;
        procedure CreateStandardDataset; virtual;
        procedure InitActiveFields;
        procedure ClearCurPosition;
        procedure CreateWnd; override;
        procedure AssignColProperties(Source: TtsBaseGrid); override;
        procedure AssignRowProperties(Source: TtsBaseGrid); override;
        procedure AssignCellProperties(Source: TtsBaseGrid); override;
        procedure AssignProperties(Source: TtsBaseGrid; ExcludeProps: string); override;
        procedure AssignRowSelections(Source: TtsBaseGrid); override;
        procedure AssignCellSelections(Source: TtsBaseGrid); override;
        procedure CheckGridStatus; override;
        function  CreateRowElement(DataRow: Variant): TtsCustomElement; virtual;
        function  CreateCellElement(DataCol: Longint; DataRow: Variant): TtsCustomElement; override;

        {Read/Write procedures}
        function  DoColProps(Ancestor: TPersistent): Boolean; override;
        procedure AddCellProps(Cells: TtsCellCollection; Node: TtsSetNode);
        function  CreateCellCollection(Writing: Boolean): TtsCellCollection; override;
        procedure ReadCells(Reader: TReader); override;
        procedure AddRowProps(Rows: TtsPropCollection; Node: TtsSetNode);
        function  CreateRowCollection(Writing: Boolean): TtsPropCollection; override;
        procedure ReadRows(Reader: TReader); override;
        procedure WriteDataBound(Writer: TWriter); virtual;
        procedure ReadDataBound(Reader: TReader); virtual;
        procedure ReadColPropCount(Reader: TReader); virtual;
        procedure WriteColPropCount(Writer: TWriter); virtual;
        procedure DefineProperties(Filer: TFiler); override;
        function  GetReadBoundProps: Boolean;
        procedure CheckApplyRowProps(Reset: Boolean);
        procedure CheckApplyCellProps(Reset: Boolean);
        procedure CheckApplyProps(Reset: Boolean);
        procedure Loaded; override;
        function  StoreRows: Boolean; override;
        function  StoreCols: Boolean; override;
        function  CreateStreamComponent: TtsGridStreamComponent; override;

        {Editing procedures}
        procedure Append;
        procedure SetInsertRowOff; override;
        procedure SetInsertRowOn; override;
        procedure UndoAppendedRow;
        function  InsertionRowIsOff: Boolean;
        function  InsertRowInView: Boolean;
        function  LastRowInView: Boolean;
        procedure StartInsert;
        procedure EndInsert;
        procedure StartAppend;
        procedure EndAppend;
        procedure EndEditing;
        procedure StartDatasetEdit(SetModified: Boolean);
        function  StartCellChange(DataCol: Longint; SetModified: Boolean): Boolean; override;
        function  CheckEndEdit(NewDataCol, NewDataRow: Longint; ByUser: Boolean): Boolean; override;
        procedure CellEdit(DataCol, DataRow: Longint; ByUser: Boolean); override;
        function  StartCellEdit: Boolean; override;
        function  StartRowEdit: Boolean; override;
        function  EndCellEdit: Boolean; override;
        function  EndRowEdit: Boolean; override;
        function  DBEndCellEdit(DataCol: Longint; DataRow: Variant): Boolean;
        function  DBEndRowEdit(DataRow: Variant): Boolean;
        function  DBStartCellEdit(DataCol: Longint; DataRow: Variant): Boolean;
        function  DBStartRowEdit(DataRow: Variant): Boolean;
        function  CheckUndoRowEdit(UndoAll: Boolean; var RowEditing: Boolean): Boolean; override;
        function  UndoRowEdit(ByUser: Boolean; RowEditing: Boolean): Boolean; override;
        function  UndoCellEdit(ByUser: Boolean): Boolean; override;
        procedure PostData(Canceled: Boolean);
        function  CheckCanceled: Boolean;
        procedure ResetInsertProperties;
        procedure GetTextSize(DataCol: Longint; DataRow: Variant; var TextLines, TextHeight: Integer); override;
        function  CanEditDBCell(DataCol: Longint; DataRow: Variant): Boolean;
        procedure CheckSetMask(DataCol: Longint; DataRow: Variant); override;
        procedure SetControlProperties(CellControl: TtsCustomGridControl); override;

        {Field layout procedures}
        procedure DefineFieldMap;
        procedure RemoveFieldLayout;
        procedure FieldLayoutChanged(SetFields, ClearAll, CreateFields: Boolean);
        procedure ResetFields(ResetFieldName: Boolean);
        function  DefaultColCount: Longint;
        function  DefaultRowCount: Longint;

        {Datasource/dataset procedures}
        procedure ClearCacheBuffers;
        procedure ResetDataset(Reposition: Boolean);
        function  GetDataset: TDataset;
        procedure SyncDataset;
        function  ReopenDataset: Boolean;
        function  ResetDatasetProperties: Boolean;
        function  GetInSyncDataset: Boolean;
        procedure SetInSyncDataset(Value: Boolean);
        function  GetInDatasetEvent: Boolean;
        procedure SetInDatasetEvent(Value: Boolean);
        function  GetIgnoreDatasetScrolled: Boolean;
        procedure SetIgnoreDatasetScrolled(Value: Boolean);
        procedure SetCanGetCurrentCell(Value: Boolean);
        function  GetCanGetCurrentCell: Boolean;
        procedure SetCanSynchronize(Value: Boolean);
        function  GetCanSynchronize: Boolean;
        procedure CheckBoundProperties;
        function  IsSameRow(Rownr1, Rownr2: Longint; Bkm1, Bkm2: TBookmarkStr;
                            CheckRownr: Boolean): Boolean;
        procedure SetFieldValue(Col: TtsDBCol; ControlType: TtsControlType; const Value: Variant);
        procedure GetFieldValue(Col: TtsDBCol; Rownr: Longint; CheckRownr: Boolean; ControlType: TtsControlType; var Value: Variant);
        procedure SetActiveRecord(Value: Integer);
        function  GetActiveRecord: Integer;
        function  MaxDisplayRows: Integer;
        procedure UpdateRowCount(DoUpdate: Boolean);
        procedure AdjustGridSize;
        procedure DoResizeGrid;
        procedure SyncBufferSize;
        procedure CheckExactRowCount(Recount: Boolean);
        procedure VerifyEditMode;
        procedure VerifyRowChanged;
        function  CompareBkmPos(var BkmPos1, BkmPos2: TtsBkmPos): Integer;
        function  BkmEqual(var Bkm1: TBookmarkStr; Bkm2: TBookmarkStr): Boolean;
        procedure SyncData(Reposition: Boolean);
        procedure ComponentRemoved(AComponent: TComponent);
        procedure ComponentInserted(AComponent: TComponent);

        {Record id procedures}
        function  CompareRecordIds(RecId1, RecId2: Variant): Integer;
        function  RecordIDRow(RecID: Variant; UseId: Boolean): Integer;
        function  IsCurrentRecord(RecordId: Variant): Boolean;
        function  CompareRecId(RecId1, RecId2: Variant): Integer;
        function  CanUseRecordIds: Boolean;
        procedure ResetRowCellProperties;

        {Combo box procedures}
        function  CreateCombo: TtsCombo; override;
        function  CreateComboGrid: ttsBaseGrid; override;
        function  GetDBCombo: TtsDBCombo;
        function  ComboInitHeight(DropDownRows: Longint): Integer; override;
        procedure InitCombo(Combo: TtsCombo); override;
        procedure InitComboData(CellHasCombo: Boolean); override;
        procedure CheckSetLookupDataset;
        function  CheckInitComboRow: Boolean; override;
        procedure ComboDropDown(DataCol, DataRow: Longint); override;
        procedure ActivateComboInit(DataCol, DataRow: Longint); override;
        procedure ActivateComboDropDown(DataCol, DataRow: Longint); override;
        procedure ActivateComboRollUp(DataCol, DataRow: Longint); override;
        procedure GetComboValue(ValueCol, DataColUp, DataRowUp: Longint; var Value: Variant); override;
        procedure SetComboValue(Value: Variant); override;
        procedure SetDBComboRow(SearchBkm: TBookmarkStr);
        function  FindDBComboRow(FromBkm, ToBkm: TBookmarkStr; Value: string;
                                 FullCmpLen: Boolean; var Found: Boolean): TBookmarkStr;
        procedure PositionComboRow; override;
        function  FindDBNextComboRow(SearchValue: string; var Found: Boolean): TBookmarkStr;
        function  FindDBComboFirstChar(Key: Char; var Found: Boolean): TBookmarkStr;
        function  FindDBComboString(Key: Char; var Found: Boolean): TBookmarkStr;
        function  PositionDropDownList(Key: Char): Variant; override;
        function  PositionAutoFill(CellExit: Boolean): Boolean; override;
        procedure CheckResetCellCombo(DataCol: Longint; DataRow: Variant);
        procedure CheckResetRowCombo(DataRow: Variant);
        procedure ScaleRows(M, D: Integer; Flags: TScalingFlags); override;
        procedure ScaleCells(M, D: Integer; Flags: TScalingFlags); override;

        {DateTime procedures}
        procedure ActivateDateTimeInit(DateTimeDef: TtsDateTimeDefComponent; DataCol, DataRow: Longint); override;
        procedure ActivateDateTimeDropDown(DateTimeDef: TtsDateTimeDefComponent; DataCol, DataRow: Longint); override;
        procedure ActivateDateTimeRollUp(DateTimeDef: TtsDateTimeDefComponent; DataCol, DataRow: Longint); override;
        procedure ActivateDateTimeGetValue(DateTimeDef: TtsDateTimeDefComponent; DataCol, DataRow: Longint; var Value: Variant); override;
        procedure RemoveRowDateTimeDef(DateTimeDef: TtsDateTimeDefComponent); override;
        procedure RemoveCellDateTimeDef(DateTimeDef: TtsDateTimeDefComponent); override;
        function  GetCurrentDateTime: Variant; override;

        {Overrides from parent class}
        procedure Paint; override;
        procedure Notification(AComponent: TComponent; Operation: TOperation); override;
        procedure ColResized(DataCol: Longint); override;
        procedure RowResized(DataRow: Longint); override;
        procedure SetHeadingOn(Value: Boolean); override;
        procedure MoveToNewRow(DisplayRow: Longint; ClearFocus, CheckEdit, CheckSelect: Boolean); override;
        procedure SetNewTopRow(DisplayRow: Longint; NewHeight: Integer; OldTop: Integer); override;
        procedure ActivateCellChanged(OldCol: Integer; OldRow: Variant); override;
        function  CheckRowChanged(var OldRow: Variant): Boolean; override;
        function  CanMoveToPos(DisplayCol, DisplayRow: Longint): Boolean; override;
        procedure CheckRowCountChanged(OldCount, NewCount: Longint); override;
        procedure RowInserted(DataRow: Longint; ByUser: Boolean); override;
        procedure RowDeleted(DataRow: Longint; ByUser: Boolean); override;
        procedure ButtonClick(DataCol, DataRow: Longint); override;
        procedure ButtonDown(DataCol, DataRow: Longint); override;
        procedure ButtonUp(DataCol, DataRow: Longint); override;
        procedure SpinButtonClick(DataCol, DataRow: Longint; SpinButton: TtsSpinButton); override;
        procedure SpinButtonDown(DataCol, DataRow: Longint; SpinButton: TtsSpinButton); override;
        procedure SpinButtonUp(DataCol, DataRow: Longint; SpinButton: TtsSpinButton); override;
        procedure SpinRepeat(DataCol, DataRow: Longint; Count: Integer; SpinButton: TtsSpinButton); override;
        procedure SpinIncrement(DataCol, DataRow: Longint; SpinButton: TtsSpinButton; var Value: Variant; var Pos, Len: Integer; var Accept: Boolean); override;

        {$IFNDEF TSVER_V3}
        procedure WriteState(Writer: TWriter); override;
        procedure ReadState(Reader: TReader); override;
        function  GetRowProperties: TCollection;
        procedure SetRowProperties(Value: TCollection);
        function  GetCellProperties: TCollection;
        procedure SetCellProperties(Value: TCollection);
        {$ENDIF}

        {Property procedures}
        procedure SetGridMode(Value: TtsGridMode); override;
        procedure SetRowChangedIndicator(Value: TtsRowChangedIndicator); override;
        function  GetDataSource: TDataSource; virtual;
        procedure SetDataSource(Value: TDataSource); virtual;
        procedure ResetLookupDatasource;
        procedure SetLookupDatasource(Value: TDatasource);
        procedure SetLookupDataset(Value: TDataset);
        function  GetLookupDataset: TDataset;
        function  GetFieldState: TtsFieldState;
        procedure SetFieldState(Value: TtsFieldState);
        procedure SetExactRowCount(Value: Boolean);
        procedure SetUseRecordIds(Value: Boolean);
        procedure SetOnGetRecordID(Value: TtsDBGetRecordIDEvent);
        procedure SetOnCompareRecordID(Value: TtsDBCompareRecordIDEvent);
        procedure SetRowMoving(Value: Boolean); override;
        function  GetRowMoving: Boolean; override;
        procedure SetDBResizeRows(Value: TtsResizeRows);
        function  GetDBResizeRows: TtsResizeRows;
        procedure SetDBFixedRowCount(Value: Integer);
        function  GetDBFixedRowCount: Integer;
        function  GetDBMaxTopRow: Longint;
        function  GetDBDataRownr(DisplayRow: Longint): Variant;
        function  GetDBCol(DataCol: Variant): TtsDBCol;
        function  GetCanSetCurrentRec: Boolean;
        procedure SetCanSetCurrentRec(Value: Boolean);
        function  GetGridDBCols: TtsDBGridCols;
        function  GetField(Index: Variant): TtsDBField;
        procedure SetDatasetType(Value: TtsDatasetType);
        procedure CheckRangeSelection;
        procedure SetBookmarkType(Value: TtsBookmarkType);
        procedure SetRecordSelection(Value: TtsRecordSelection);
        function  GetRecordSelection: TtsRecordSelection;
        procedure SetStoreData(Value: Boolean); override;

        {Row property procedures}
        procedure ResetLastRow;
        function  GetDBRowElement(DataRow: Variant): TtsDBRowElement;
        function  GetGridRowCount: Longint; override;
        procedure SetGridRowCount(Value: Longint); override;
        function  GetDBRowCount: Longint;
        procedure SetDBRowCount(Value: Longint);
        function  GetCurrentSelected: Boolean; override;
        function  GetStartRowSelected: Boolean; override;
        procedure SetCurrentSelected; override;
        function  GetCellSelectMode: TtsCellSelectMode; override;
        procedure SetCellSelectMode(Value: TtsCellSelectMode); override;
        function  GetBookmarkRecordID(Bookmark: Variant): Variant;
        function  GetDBCurrentDataRow: Variant;
        procedure SetDBCurrentDataRow(Value: Variant);
        function  GetCurrentRecordId: Variant;
        procedure SetTopRow(Value: Longint);
        function  GetTopRow: Longint;
        procedure SetDBNewTopRow(Value: Variant);
        procedure SetDBTopRow(Value: Variant);
        function  GetDBTopRow: Variant;
        function  GetRecordNumber: Longint;
        function  GetRowSelect(DataRow: Longint): Boolean;
        function  GetRowProp(DataRow: Longint): Boolean;
        function  GetRowColor(DataRow: Longint): TColor; override;
        procedure SetDBRowColor(DataRow: Variant; Value: TColor);
        function  GetDBRowColor(DataRow: Variant): TColor;
        function  GetRowFont(DataRow: Longint): TFont; override;
        procedure SetDBRowFont(DataRow: Variant; Value: TFont);
        function  GetDBRowFont(DataRow: Variant): TFont;
        function  GetRowParentFont(DataRow: Longint): Boolean; override;
        procedure SetDBRowParentFont(DataRow: Variant; Value: Boolean);
        function  GetDBRowParentFont(DataRow: Variant): Boolean;
        function  GetRowHeight(DataRow: Longint): Integer; override;
        procedure SetDBRowHeight(DataRow: Variant; Value: Integer);
        function  GetDBRowHeight(DataRow: Variant): Integer;
        function  GetDBRowId(DataRow: Variant): Longint;
        function  IsRowVisible(DataRow: Longint): Boolean; override;
        procedure SetDBRowVisible(DataRow: Variant; Value: Boolean);
        function  GetDBRowVisible(DataRow: Variant): Boolean;
        function  GetRowAlignment(DataRow: Longint): TAlignment; override;
        procedure SetDBRowAlignment(DataRow: Variant; Value: TAlignment);
        function  GetDBRowAlignment(DataRow: Variant): TAlignment;
        function  GetRowAlign(DataRow: Longint): Boolean; override;
        procedure SetDBRowAlign(DataRow: Variant; Value: Boolean);
        function  GetDBRowAlign(DataRow: Variant): Boolean;
        function  GetRowHorzAlignment(DataRow: Longint): TtsHorzAlignment; override;
        procedure SetDBRowHorzAlignment(DataRow: Variant; Value: TtsHorzAlignment);
        function  GetDBRowHorzAlignment(DataRow: Variant): TtsHorzAlignment;
        function  GetRowVertAlignment(DataRow: Longint): TtsVertAlignment; override;
        procedure SetDBRowVertAlignment(DataRow: Variant; Value: TtsVertAlignment);
        function  GetDBRowVertAlignment(DataRow: Variant): TtsVertAlignment;
        function  IsRowReadOnly(DataRow: Longint): Boolean; override;
        procedure SetDBRowReadOnly(DataRow: Variant; Value: Boolean);
        function  GetDBRowReadOnly(DataRow: Variant): Boolean;
        function  GetRowIs3D(DataRow: Longint): Boolean; override;
        procedure SetDBRowIs3D(DataRow: Variant; Value: Boolean);
        function  GetDBRowIs3D(DataRow: Variant): Boolean;
        function  GetRowDropDownStyle(DataRow: Longint): TtsDropDownStyle; override;
        function  GetDBRowDropDownStyle(DataRow: Variant): TtsDropDownStyle;
        procedure SetDBRowDropDownStyle(DataRow: Variant; Value: TtsDropDownStyle);
        function  GetRowButtonType(DataRow: Longint): TtsButtonType; override;
        procedure SetDBRowButtonType(DataRow: Variant; Value: TtsButtonType);
        function  GetDBRowButtonType(DataRow: Variant): TtsButtonType; virtual;
        function  GetRowWordWrap(DataRow: Longint): TtsWordWrap; override;
        procedure SetDBRowWordWrap(DataRow: Variant; Value: TtsWordWrap);
        function  GetDBRowWordWrap(DataRow: Variant): TtsWordWrap;
        procedure SetDBRowMaskName(DataRow: Variant; Value: string);
        function  GetDBRowMaskName(DataRow: Variant): string;
        function  GetRowCombo(DataRow: Longint): TtsCombo; override;
        procedure SetDBRowCombo(DataRow: Variant; Value: TtsDBCombo);
        function  GetDBRowCombo(DataRow: Variant): TtsDBCombo;
        procedure SetDBRowParentCombo(DataRow: Variant; Value: Boolean);
        function  GetDBRowParentCombo(DataRow: Variant): Boolean;
        function  GetRowStretchPicture(DataRow: Longint): TtsDrawOption; override;
        procedure SetDBRowStretchPicture(DataRow: Variant; Value: TtsDrawOption);
        function  GetDBRowStretchPicture(DataRow: Variant): TtsDrawOption;
        function  GetRowShrinkPicture(DataRow: Longint): TtsDrawOption; override;
        procedure SetDBRowShrinkPicture(DataRow: Variant; Value: TtsDrawOption);
        function  GetDBRowShrinkPicture(DataRow: Variant): TtsDrawOption;
        function  GetRowCenterPicture(DataRow: Longint): TtsDrawOption; override;
        procedure SetDBRowCenterPicture(DataRow: Variant; Value: TtsDrawOption);
        function  GetDBRowCenterPicture(DataRow: Variant): TtsDrawOption;
        function  GetRowKeepAspectRatio(DataRow: Longint): TtsDrawOption; override;
        procedure SetDBRowKeepAspectRatio(DataRow: Variant; Value: TtsDrawOption);
        function  GetDBRowKeepAspectRatio(DataRow: Variant): TtsDrawOption;
        function  GetRowControlType(DataRow: Longint): TtsControlType; override;
        procedure SetDBRowControlType(DataRow: Variant; Value: TtsControlType);
        function  GetDBRowControlType(DataRow: Variant): TtsControlType;
        function  GetRowSpinOptions(DataRow: Longint): TtsSpinOptions; override;
        procedure SetDBRowSpinOptions(DataRow: Variant; Value: TtsSpinOptions);
        function  GetDBRowSpinOptions(DataRow: Variant): TtsSpinOptions;
        function  GetRowSpinIncrement(DataRow: Longint): Double; override;
        procedure SetDBRowSpinIncrement(DataRow: Variant; Value: Double);
        function  GetDBRowSpinIncrement(DataRow: Variant): Double;
        function  GetRowDateTimeDef(DataRow: Longint): TtsDateTimeDefComponent; override;
        procedure SetDBRowDateTimeDef(DataRow: Variant; Value: TtsDateTimeDefComponent);
        function  GetDBRowDateTimeDef(DataRow: Variant): TtsDateTimeDefComponent;
        procedure SetDBDisplayRownr(DataRow: Variant; Value: Longint);
        function  GetDBDisplayRownr(DataRow: Variant): Longint;
        function  IsRowChanged(DataRow: Longint): Boolean; override;
        procedure SetDBRowChanged(DataRow: Variant; Value: Boolean);
        function  GetDBRowChanged(DataRow: Variant): Boolean;
        function  IsRowSelected(DataRow: Longint): Boolean; override;
        procedure SetDBRowSelected(DataRow: Variant; Value: Boolean);
        function  GetDBRowSelected(DataRow: Variant): Boolean;

        {Cell property procedures}
        function  GetDBCellElement(DataCol: Longint; DataRow: Variant; Check: Boolean): TtsDBCellElement;

        function  GetCellTag(DataCol, DataRow: Longint): Integer; override;
        function  GetDBCellTag(DataCol : Longint; DataRow: Variant): Integer;
        procedure SetDBCellTag(DataCol : Longint; DataRow: Variant; Value: Integer);
        function  GetCellData(DataCol, DataRow: Longint): Pointer; override;
        function  GetDBCellData(DataCol : Longint; DataRow: Variant): Pointer;
        procedure SetDBCellData(DataCol : Longint; DataRow: Variant; Value: Pointer);

        function  GetDbCellTextWidth(DataCol : Longint; DataRow: Variant): Integer;
        function  GetCellTextWidth(DataCol, DataRow : Longint): Integer; override;
        function  GetCellColor(DataCol, DataRow: Longint): TColor; override;
        procedure SetDBCellColor(DataCol: Longint; DataRow: Variant; Value: TColor);
        function  GetDBCellColor(DataCol: Longint; DataRow: Variant): TColor;

        function  GetCellCheckBoxState(DataCol: Longint; DataRow: Variant): TCheckBoxState;
        procedure SetCellCheckBoxState(DataCol: Longint; DataRow: Variant; Value : TCheckBoxState);

        function  GetCellControlType(DataCol, DataRow: Longint): TtsControlType; override;
        procedure SetDBCellControlType(DataCol: Longint; DataRow: Variant; Value: TtsControlType);
        function  GetDBCellControlType(DataCol: Longint; DataRow: Variant): TtsControlType;
        function  GetCellSpinOptions(DataCol, DataRow: Longint): TtsSpinOptions; override;
        procedure SetDBCellSpinOptions(DataCol: Longint; DataRow: Variant; Value: TtsSpinOptions);
        function  GetDBCellSpinOptions(DataCol: Longint; DataRow: Variant): TtsSpinOptions;
        function  GetCellSpinIncrement(DataCol, DataRow: Longint): Double; override;
        procedure SetDBCellSpinIncrement(DataCol: Longint; DataRow: Variant; Value: Double);
        function  GetDBCellSpinIncrement(DataCol: Longint; DataRow: Variant): Double;
        function  GetCellFont(DataCol, DataRow: Longint): TFont; override;
        procedure SetDBCellFont(DataCol: Longint; DataRow: Variant; Value: TFont);
        function  GetDBCellFont(DataCol: Longint; DataRow: Variant): TFont;
        function  GetCellParentFont(DataCol, DataRow: Longint): Boolean; override;
        procedure SetDBCellParentFont(DataCol: Longint; DataRow: Variant; Value: Boolean);
        function  GetDBCellParentFont(DataCol: Longint; DataRow: Variant): Boolean;
        function  GetCellAlignment(DataCol, DataRow: Longint): TAlignment; override;
        procedure SetDBCellAlignment(DataCol: Longint; DataRow: Variant; Value: TAlignment);
        function  GetDBCellAlignment(DataCol: Longint; DataRow: Variant): TAlignment;
        function  GetCellAlign(DataCol, DataRow: Longint): Boolean; override;
        procedure SetDBCellAlign(DataCol: Longint; DataRow: Variant; Value: Boolean);
        function  GetDBCellAlign(DataCol: Longint; DataRow: Variant): Boolean;
        function  GetCellHorzAlignment(DataCol, DataRow: Longint): TtsHorzAlignment; override;
        procedure SetDBCellHorzAlignment(DataCol: Longint; DataRow: Variant; Value: TtsHorzAlignment);
        function  GetDBCellHorzAlignment(DataCol: Longint; DataRow: Variant): TtsHorzAlignment;
        function  GetCellVertAlignment(DataCol, DataRow: Longint): TtsVertAlignment; override;
        procedure SetDBCellVertAlignment(DataCol: Longint; DataRow: Variant; Value: TtsVertAlignment);
        function  GetDBCellVertAlignment(DataCol: Longint; DataRow: Variant): TtsVertAlignment;
        function  GetCellIs3D(DataCol, DataRow: Longint): Boolean; override;
        procedure SetDBCellIs3D(DataCol: Longint; DataRow: Variant; Value: Boolean);
        function  GetDBCellIs3D(DataCol: Longint; DataRow: Variant): Boolean;
        function  GetCellWordWrap(DataCol, DataRow: Longint): TtsWordWrap; override;
        procedure SetDBCellWordWrap(DataCol: Longint; DataRow: Variant; Value: TtsWordWrap);
        function  GetDBCellWordWrap(DataCol: Longint; DataRow: Variant): TtsWordWrap;
        function  GetCellMaskName(DataCol, DataRow: Longint): string; override;
        procedure SetDBCellMaskName(DataCol: Longint; DataRow: Variant; Value: string);
        function  GetDBCellMaskName(DataCol: Longint; DataRow: Variant): string;
        function  GetCellButtonType(DataCol, DataRow: Longint): TtsButtonType; override;
        procedure SetDBCellButtonType(DataCol: Longint; DataRow: Variant; Value: TtsButtonType);
        function  GetDBCellButtonType(DataCol: Longint; DataRow: Variant): TtsButtonType;
        function  GetCellDropDownStyle(DataCol, DataRow: Longint): TtsDropDownStyle; override;
        procedure SetDBCellDropDownStyle(DataCol: Longint; DataRow: Variant; Value: TtsDropDownStyle);
        function  GetDBCellDropDownStyle(DataCol: Longint; DataRow: Variant): TtsDropDownStyle;
        function  GetCellCombo(DataCol, DataRow: Longint): TtsCombo; override;
        procedure SetDBCellCombo(DataCol: Longint; DataRow: Variant; Value: TtsDBCombo);
        function  GetDBCellCombo(DataCol: Longint; DataRow: Variant): TtsDBCombo;
        procedure SetDBCellParentCombo(DataCol: Longint; DataRow: Variant; Value: Boolean);
        function  GetDBCellParentCombo(DataCol: Longint; DataRow: Variant): Boolean;
        function  GetCellStretchPicture(DataCol, DataRow: Longint): TtsDrawOption; override;
        procedure SetDBCellStretchPicture(DataCol: Longint; DataRow: Variant; Value: TtsDrawOption);
        function  GetDBCellStretchPicture(DataCol: Longint; DataRow: Variant): TtsDrawOption;
        function  GetCellShrinkPicture(DataCol, DataRow: Longint): TtsDrawOption; override;
        procedure SetDBCellShrinkPicture(DataCol: Longint; DataRow: Variant; Value: TtsDrawOption);
        function  GetDBCellShrinkPicture(DataCol: Longint; DataRow: Variant): TtsDrawOption;
        function  GetCellCenterPicture(DataCol, DataRow: Longint): TtsDrawOption; override;
        procedure SetDBCellCenterPicture(DataCol: Longint; DataRow: Variant; Value: TtsDrawOption);
        function  GetDBCellCenterPicture(DataCol: Longint; DataRow: Variant): TtsDrawOption;
        function  GetCellKeepAspectRatio(DataCol, DataRow: Longint): TtsDrawOption; override;
        procedure SetDBCellKeepAspectRatio(DataCol: Longint; DataRow: Variant; Value: TtsDrawOption);
        function  GetDBCellKeepAspectRatio(DataCol: Longint; DataRow: Variant): TtsDrawOption;
        function  GetCellDateTimeDef(DataCol, DataRow: Longint): TtsDateTimeDefComponent; override;
        procedure SetDBCellDateTimeDef(DataCol: Longint; DataRow: Variant; Value: TtsDateTimeDefComponent);
        function  GetDBCellDateTimeDef(DataCol: Longint; DataRow: Variant): TtsDateTimeDefComponent;
        function  GetDBCellTextHeight(DataCol: Longint; DataRow: Variant): Integer;
        function  GetDBCellTextLines(DataCol: Longint; DataRow: Variant): Integer;
        function  IsCellReadOnly(DataCol, DataRow: Longint): TtsReadOnly; override;
        procedure SetDBCellReadOnly(DataCol: Longint; DataRow: Variant; Value: TtsReadOnly);
        function  GetDBCellReadOnly(DataCol: Longint; DataRow: Variant): TtsReadOnly;
        function  GetCellValue(DataCol: Longint; DataRow: Longint): Variant; override;
        procedure SetDBCellValue(DataCol: Longint; DataRow: Variant; const Value: Variant);
        function  GetDBCellValue(DataCol: Longint; DataRow: Variant): Variant;
        function  GetActiveCellValue(DataCol: Longint; DataRow: Variant): Variant;
        function  BookmarkValue(DataCol: Longint; DataRow: Variant): Variant;
        procedure GetBkmValueAndRecordId(DataCol: Longint; DataRow: Variant; var Value, RecId: Variant);
        function  BkmRecordId(DataRow: Variant): Variant;
        procedure SetDBCellPText(DataCol: Longint; DataRow: Variant; Value: PChar);
        function  GetSelectedCells: TtsDBRect;
        function  GetDBCurrentCell: TtsDBCurrentCell;

        {Event procedures}
        procedure ActivateInvalidMaskValue(var Accept: Boolean); override;
        procedure ActivateInvalidMaskEdit(Keys: string; var Accept: Boolean); override;
        procedure DoRowLoaded(DataRow: Variant); override;
        procedure DoStartCellEdit(DataCol: Longint; DataRow: Variant; var Cancel: Boolean); override;
        procedure DoStartRowEdit(DataRow: Variant; var Cancel: Boolean); override;
        procedure DoEndCellEdit(DataCol: Longint; DataRow: Variant; var Cancel: Boolean); override;
        procedure DoEndRowEdit(DataRow: Variant; var Cancel: Boolean); override;
        procedure DoShowEditor(DataCol: Longint; DataRow: Variant; var Cancel: Boolean); override;
        procedure DoInvalidMaskValue(DataCol: Longint; DataRow: Variant; var Accept: Boolean); override;
        procedure DoInvalidMaskEdit(Keys: string; DataCol: Longint; DataRow: Variant; var Accept: Boolean); override;
        procedure DoUndoCellEdit(DataCol: Longint; DataRow: Variant; ByUser: Boolean; var Cancel: Boolean); override;
        procedure DoUndoRowEdit(DataRow: Variant; ByUser: Boolean; var Cancel: Boolean); override;
        procedure DoCellEdit(DataCol: Longint; DataRow: Variant; ByUser: Boolean); override;
        procedure DoCellChanged(OldDataCol, NewDataCol: Longint; OldDataRow, NewDataRow: Variant); override;
        procedure DoRowChanged(OldDataRow, NewDataRow: Variant); override;
        procedure DoButtonClick(DataCol: Longint; DataRow: Variant); override;
        procedure DoButtonDown(DataCol: Longint; DataRow: Variant); override;
        procedure DoButtonUp(DataCol: Longint; DataRow: Variant); override;
        procedure DoSpinButtonClick(DataCol: Longint; DataRow: Variant; SpinButton: TtsSpinButton); override;
        procedure DoSpinButtonDown(DataCol: Longint; DataRow: Variant; SpinButton: TtsSpinButton); override;
        procedure DoSpinButtonUp(DataCol: Longint; DataRow: Variant; SpinButton: TtsSpinButton); override;
        procedure DoSpinRepeat(DataCol: Longint; DataRow: Variant; Count: Integer; SpinButton: TtsSpinButton); override;
        procedure DoSpinIncrement(DataCol: Longint; DataRow: Variant; SpinButton: TtsSpinButton; var Value: Variant; var Pos, Len: Integer; var Accept: Boolean); override;
        function  DoClickCell(DataColDown: Longint; DataRowDown: Variant; DataColUp: Longint;
                              DataRowUp: Variant; DownPos, UpPos: TtsClickPosition): Boolean; override;
        procedure DoDblClickCell(DataCol: Longint; DataRow: Variant; Pos: TtsClickPosition); override;
        procedure DoOnUpdateField(DataCol: Longint; DataRow: Variant;
                                  var Value: Variant; var Cancel: Boolean); virtual;
        procedure DoOnScanRecords(ScanAll: Boolean; State: TtsScanState; Count: Longint; var Cancel: Boolean);
        procedure DoComboInit(DataCol: Longint; DataRow: Variant); override;
        procedure DoComboDropDown(DataCol: Longint; DataRow: Variant); override;
        procedure DoComboRollUp(DataCol: Longint; DataRow: Variant); override;
        procedure DoComboGetValue(GridDataCol: Longint; GridDataRow,
                                  ComboDataRow: Variant; var Value: Variant); override;
        procedure DoDateTimeInit(DateTimeDef: TtsDateTimeDefComponent; DataCol: Longint; DataRow: Variant); override;
        procedure DoDateTimeDropDown(DateTimeDef: TtsDateTimeDefComponent; DataCol: Longint; DataRow: Variant); override;
        procedure DoDateTimeRollUp(DateTimeDef: TtsDateTimeDefComponent; DataCol: Longint; DataRow: Variant); override;
        procedure DoDateTimeGetValue(DateTimeDef: TtsDateTimeDefComponent; DataCol: Longint; DataRow: Variant; var Value: Variant); override;
        procedure DoGetDrawInfo(DataCol: Longint; DataRow: Variant; var DrawInfo: TtsDrawInfo); virtual;
        procedure DoComboCellLoaded(DataCol: Longint; DataRow: Variant; var Value: Variant); virtual;
        procedure DoTopLeftChanged(OldCol: Longint; OldRow: Variant; NewCol: Longint;
                                   NewRow: Variant; ByUser: Boolean); virtual;
        procedure DoPaintCell(DataCol: Longint; DataRow: Variant; DrawRect: TRect;
                              State: TtsPaintCellState; var Cancel: Boolean); virtual;
        procedure DoCellLoaded(DataCol: Longint; DataRow: Variant; var Value: Variant); virtual;
        procedure DoDeleteRow(DataRow: Variant; ByUser: Boolean); virtual;
        procedure DoInsertRow(DataRow: Variant; ByUser: Boolean); virtual;
        procedure DoGetRecordID(Bookmark: Variant; var RecordID: Variant); virtual;
        procedure DoCompareRecordId(RecordId1, RecordId2: Variant; var CompRes: Integer); virtual;
        procedure DoFieldLayoutChange; virtual;

        function GetXMLMetaData : String; virtual;
        function GetXMLRowData(forRow : Variant) : String; virtual;
        function GetXMLData : String;  virtual;
        function GetCSVRowData(forRow : Variant) : String; virtual;

        {Properties for protected use}
        property DataLink: TtsGridDataLink read FDataLink;
        property GridCols: TtsDBGridCols read GetGridDBCols;
        property Dataset: TDataset read GetDataset;
        property CanSetCurrentRec: Boolean read GetCanSetCurrentRec write SetCanSetCurrentRec;
        property CanSynchronize: Boolean read GetCanSynchronize write SetCanSynchronize;
        property InSyncDataset: Boolean read GetInSyncDataset write SetInSyncDataset;
        property InDatasetEvent: Boolean read GetInDatasetEvent write SetInDatasetEvent;
        property ActiveRecord: Integer read GetActiveRecord write SetActiveRecord;
        property UseStandardDataset: Boolean read FUseStandardDataset write FUseStandardDataset;
        property IgnoreDatasetScrolled: Boolean read GetIgnoreDatasetScrolled write SetIgnoreDatasetScrolled;
        property SelectionStart: TBookmarkStr read GetSelectionStart write FSelectionStart;
        property ActiveCell[DataCol: Longint; DataRow: Variant]: Variant read GetActiveCellValue;
        property CanGetCurrentCell: Boolean read GetCanGetCurrentCell write SetCanGetCurrentCell;
        property CurrentRecordId: Variant read GetCurrentRecordId;
        property ReadBoundProps: Boolean read GetReadBoundProps;
        property ApplyBoundProps: Boolean read FApplyBoundProps;
        property LookupDatasource: TDatasource read FLookupDatasource write SetLookupDatasource;
        property LookupDataset: TDataset read GetLookupDataset write SetLookupDataset;

        {Parent properties/methods, renamed for use in the TtsCustomDBGrid}
        property  GridRows: Longint read GetGridRowCount write SetGridRowCount;
        property  GridTopRow: Longint read GetTopRow write SetTopRow;

    protected
        {Properties for public use}
        property Active: Boolean read FActive;
        property BookmarkRecordId[DataRow: Variant]: Variant read GetBookmarkRecordId;
        property Cell[DataCol: Longint; DataRow: Variant]: Variant read GetDBCellValue write SetDBCellValue;
        property CellAlign[DataCol: Longint; DataRow: Variant]: Boolean read GetDBCellAlign write SetDBCellAlign;
        property CellAlignment[DataCol: Longint; DataRow: Variant]: TAlignment read GetDBCellAlignment write SetDBCellAlignment;
        property CellHorzAlignment[DataCol: Longint; DataRow: Variant]: TtsHorzAlignment read GetDBCellHorzAlignment write SetDBCellHorzAlignment;
        property CellVertAlignment[DataCol: Longint; DataRow: Variant]: TtsVertAlignment read GetDBCellVertAlignment write SetDBCellVertAlignment;
        property CellButtonType[DataCol: Longint; DataRow: Variant]: TtsButtonType read GetDBCellButtonType write SetDBCellButtonType;
        property CellData[DataCol: Longint; DataRow: Variant]: Pointer read GetDBCellData write SetDBCellData;
        property CellTag[DataCol: Longint; DataRow: Variant]: Integer read GetDBCellTag write SetDbCellTag;
        property CellColor[DataCol: Longint; DataRow: Variant]: TColor read GetDBCellColor write SetDBCellColor;
        property CellCheckBoxState[DataCol: Longint; DataRow: Variant]: TCheckBoxState read GetCellCheckBoxState write SetCellCheckBoxState;
        property CellControlType[DataCol: Longint; DataRow: Variant]: TtsControlType read GetDBCellControlType write SetDBCellControlType;
        property CellTextWidth[DataCol: Longint; DataRow: Variant]: Integer read GetDbCellTextWidth;
        property CellSpinOptions[DataCol: Longint; DataRow: Variant]: TtsSpinOptions read GetDBCellSpinOptions write SetDBCellSpinOptions;
        property CellSpinIncrement[DataCol: Longint; DataRow: Variant]: Double read GetDBCellSpinIncrement write SetDBCellSpinIncrement;
        property CellDropDownStyle[DataCol: Longint; DataRow: Variant]: TtsDropDownStyle read GetDBCellDropDownStyle write SetDBCellDropDownStyle;
        property CellFont[DataCol: Longint; DataRow: Variant]: TFont read GetDBCellFont write SetDBCellFont;
        property CellIs3D[DataCol: Longint; DataRow: Variant]: Boolean read GetDBCellIs3D write SetDBCellIs3D;
        property CellParentFont[DataCol: Longint; DataRow: Variant]: Boolean read GetDBCellParentFont write SetDBCellParentFont;
        property CellPText[DataCol: Longint; DataRow: Variant]: PChar write SetDBCellPText;
        property CellReadOnly[DataCol: Longint; DataRow: Variant]: TtsReadOnly read GetDBCellReadOnly write SetDBCellReadOnly;
        property CellTextHeight[DataCol: Longint; DataRow: Variant]: Integer read GetDBCellTextHeight;
        property CellTextLines[DataCol: Longint; DataRow: Variant]: Integer read GetDBCellTextLines;
        property CellWordWrap[DataCol: Longint; DataRow: Variant]: TtsWordWrap read GetDBCellWordWrap write SetDBCellWordWrap;
        property CellMaskName[DataCol: Longint; DataRow: Variant]: string read GetDBCellMaskName write SetDBCellMaskName;
        property CellCombo[DataCol: Longint; DataRow: Variant]: TtsDBCombo read GetDBCellCombo write SetDBCellCombo;
        property CellParentCombo[DataCol: Longint; DataRow: Variant]: Boolean read GetDBCellParentCombo write SetDBCellParentCombo;
        property CellStretchPicture[DataCol: Longint; DataRow: Variant]: TtsDrawOption read GetDBCellStretchPicture write SetDBCellStretchPicture;
        property CellShrinkPicture[DataCol: Longint; DataRow: Variant]: TtsDrawOption read GetDBCellShrinkPicture write SetDBCellShrinkPicture;
        property CellCenterPicture[DataCol: Longint; DataRow: Variant]: TtsDrawOption read GetDBCellCenterPicture write SetDBCellCenterPicture;
        property CellKeepAspectRatio[DataCol: Longint; DataRow: Variant]: TtsDrawOption read GetDBCellKeepAspectRatio write SetDBCellKeepAspectRatio;
        property CellDateTimeDef[DataCol: Longint; DataRow: Variant]: TtsDateTimeDefComponent read GetDBCellDateTimeDef write SetDBCellDateTimeDef;
        property Col[DataCol: Variant]: TtsDBCol read GetDBCol;
        property Combo: TtsDBCombo read GetDBCombo;
        property CurrentCell: TtsDBCurrentCell read GetDBCurrentCell;
        property CurrentDataRow: Variant read GetDBCurrentDataRow write SetDBCurrentDataRow;
        property DataBound: Boolean read FDataBound;
        property DataRownr[DisplayRow: Longint]: Variant read GetDBDataRownr;
        property DisplayRownr[DataRow: Variant]: Longint read GetDBDisplayRownr write SetDBDisplayRownr;
        property Editing: Boolean read FEditing;
        property Field[Index: Variant]: TtsDBField read GetField;
        property FieldState: TtsFieldState read GetFieldState write SetFieldState default fsDefault;
        property RecordNumber: Longint read GetRecordNumber;
        property RowAlign[DataRow: Variant]: Boolean read GetDBRowAlign write SetDBRowAlign;
        property RowAlignment[DataRow: Variant]: TAlignment read GetDBRowAlignment write SetDBRowAlignment;
        property RowHorzAlignment[DataRow: Variant]: TtsHorzAlignment read GetDBRowHorzAlignment write SetDBRowHorzAlignment;
        property RowVertAlignment[DataRow: Variant]: TtsVertAlignment read GetDBRowVertAlignment write SetDBRowVertAlignment;
        property RowButtonType[DataRow: Variant]: TtsButtonType read GetDBRowButtonType write SetDBRowButtonType;
        property RowChanged[DataRow: Variant]: Boolean read GetDBRowChanged write SetDBRowChanged;
        property RowColor[DataRow: Variant]: TColor read GetDBRowColor write SetDBRowColor;
        property RowDropDownStyle[DataRow: Variant]: TtsDropDownStyle read GetDBRowDropDownStyle write SetDBRowDropDownStyle;
        property RowFont[DataRow: Variant]: TFont read GetDBRowFont write SetDBRowFont;
        property RowParentFont[DataRow: Variant]: Boolean read GetDBRowParentFont write SetDBRowParentFont;
        property RowHeight[DataRow: Variant]: Integer read GetDBRowHeight write SetDBRowHeight;
        property RowId[DataRow: Variant]: Longint read GetDBRowId;
        property RowIs3D[DataRow: Variant]: Boolean read GetDBRowIs3D write SetDBRowIs3D;
        property RowReadOnly[DataRow: Variant]: Boolean read GetDBRowReadOnly write SetDBRowReadOnly;
        property RowSelected[DataRow: Variant]: Boolean read GetDBRowSelected write SetDBRowSelected;
        property RowVisible[DataRow: Variant]: Boolean read GetDBRowVisible write SetDBRowVisible;
        property RowWordWrap[DataRow: Variant]: TtsWordWrap read GetDBRowWordWrap write SetDBRowWordWrap;
        property RowMaskName[DataRow: Variant]: string read GetDBRowMaskName write SetDBRowMaskName;
        property RowCombo[DataRow: Variant]: TtsDBCombo read GetDBRowCombo write SetDBRowCombo;
        property RowParentCombo[DataRow: Variant]: Boolean read GetDBRowParentCombo write SetDBRowParentCombo;
        property RowStretchPicture[DataRow: Variant]: TtsDrawOption read GetDBRowStretchPicture write SetDBRowStretchPicture;
        property RowShrinkPicture[DataRow: Variant]: TtsDrawOption read GetDBRowShrinkPicture write SetDBRowShrinkPicture;
        property RowCenterPicture[DataRow: Variant]: TtsDrawOption read GetDBRowCenterPicture write SetDBRowCenterPicture;
        property RowKeepAspectRatio[DataRow: Variant]: TtsDrawOption read GetDBRowKeepAspectRatio write SetDBRowKeepAspectRatio;
        property RowControlType[DataRow: Variant]: TtsControlType read GetDBRowControlType write SetDBRowControlType;
        property RowSpinOptions[DataRow: Variant]: TtsSpinOptions read GetDBRowSpinOptions write SetDBRowSpinOptions;
        property RowSpinIncrement[DataRow: Variant]: Double read GetDBRowSpinIncrement write SetDBRowSpinIncrement;
        property RowDateTimeDef[DataRow: Variant]: TtsDateTimeDefComponent read GetDBRowDateTimeDef write SetDBRowDateTimeDef;
        property SelectedCells: TtsDBRect read GetSelectedCells;
        property SelectedRows: TtsDBSelection read FDBSelectedRows;
        property StartEditing: Boolean read FStartEditing;
        property TopRow: Variant read GetDBTopRow write SetDBTopRow;

        property XMLMetaData : String read GetXMLMetaData;
        property XMLData : String read GetXMLData;

        {Properties for published use}
        property AutoInsert: Boolean read FAutoInsert write FAutoInsert default True;
        property ConfirmDelete: Boolean read FConfirmDelete write FConfirmDelete default True;
        property DataSource: TDataSource read GetDataSource write SetDataSource;
        property ExactRowCount: Boolean read FExactRowCount write SetExactRowCount;
        property FixedRowCount: Integer read GetDBFixedRowCount write SetDBFixedRowCount default 0;
        property MaxTopRow: Longint read GetDBMaxTopRow;
        property ResizeRows: TtsResizeRows read GetDBResizeRows write SetDBResizeRows default rrAll;
        property Rows: Longint read GetDBRowCount write SetDBRowCount stored StoreRows;
        property UseRecordIds: Boolean read FUseRecordIds write SetUseRecordIds default False;
        property DatasetType: TtsDatasetType read FDatasetType write SetDatasetType default dstBDE;
        property BookmarkType: TtsBookmarkType read FBookmarkType write SetBookmarkType default bmtDefault;
        property BookmarkCompareType: TtsBookmarkCompareType read FBookmarkCompareType write FBookmarkCompareType default bctDefault;
        property RecordSelection: TtsRecordSelection read GetRecordSelection write SetRecordSelection default rseBookmarkRange;

        {$IFNDEF TSVER_V3}
        property RowProperties: TCollection read GetRowProperties write SetRowProperties;
        property CellProperties: TCollection read GetCellProperties write SetCellProperties;
        {$ENDIF}

        {Events for published use}
        property OnButtonClick: TtsDBButtonEvent read FOnButtonClick write FOnButtonClick;
        property OnButtonDown: TtsDBButtonEvent read FOnButtonDown write FOnButtonDown;
        property OnButtonUp: TtsDBButtonEvent read FOnButtonUp write FOnButtonUp;
        property OnSpinButtonClick: TtsDBSpinButtonEvent read FOnSpinButtonClick write FOnSpinButtonClick;
        property OnSpinButtonDown: TtsDBSpinButtonEvent read FOnSpinButtonDown write FOnSpinButtonDown;
        property OnSpinButtonUp: TtsDBSpinButtonEvent read FOnSpinButtonUp write FOnSpinButtonUp;
        property OnSpinRepeat: TtsDBSpinRepeatEvent read FOnSpinRepeat write FOnSpinRepeat;
        property OnSpinIncrement: TtsDBSpinIncrementEvent read FOnSpinIncrement write FOnSpinIncrement;
        property OnCellChanged: TtsDBCellChangedEvent read FOnCellChanged write FOnCellChanged;
        property OnCellEdit: TtsDBCellEditEvent read FOnCellEdit write FOnCellEdit;
        property OnCellLoaded: TtsDBCellLoadedEvent read FOnCellLoaded write FOnCellLoaded;
        property OnClickCell: TtsDBClickCellEvent read FOnClickCell write FOnClickCell;
        property OnComboCellLoaded: TtsDBComboCellLoadedEvent read FOnComboCellLoaded write FOnComboCellLoaded;
        property OnComboDropDown: TtsDBComboCellEvent read FOnComboDropDown write FOnComboDropDown;
        property OnComboGetValue: TtsDBComboGetValueEvent read FOnComboGetValue write FOnComboGetValue;
        property OnComboInit: TtsDBComboCellEvent read FOnComboInit write FOnComboInit;
        property OnComboRollUp: TtsDbComboCellEvent read FOnComboRollUp write FOnComboRollUp;
        property OnDateTimeDropDown: TtsDBDateTimeCellEvent read FOnDateTimeDropDown write FOnDateTimeDropDown;
        property OnDateTimeGetValue: TtsDBDateTimeGetValueEvent read FOnDateTimeGetValue write FOnDateTimeGetValue;
        property OnDateTimeInit: TtsDBDateTimeCellEvent read FOnDateTimeInit write FOnDateTimeInit;
        property OnDateTimeRollUp: TtsDBDateTimeCellEvent read FOnDateTimeRollUp write FOnDateTimeRollUp;
        property OnCompareRecordID: TtsDBCompareRecordIDEvent read FOnCompareRecordId write SetOnCompareRecordID;
        property OnDblClickCell: TtsDBDblClickCellEvent read FOnDblClickCell write FOnDblClickCell;
        property OnDeleteRow: TtsDBDeleteRowEvent read FOnDeleteRow write FOnDeleteRow;
        property OnEndCellEdit: TtsDBCellEditingEvent read FOnEndCellEdit write FOnEndCellEdit;
        property OnEndRowEdit: TtsDBRowEditingEvent read FOnEndRowEdit write FOnEndRowEdit;
        property OnShowEditor: TtsDBShowEditorEvent read FOnShowEditor write FOnShowEditor;
        property OnScanRecords: TtsDBScanRecordsEvent read FOnScanRecords write FOnScanRecords;
        property OnGetDrawInfo: TtsDBGetDrawInfoEvent read FOnGetDrawInfo write FOnGetDrawInfo;
        property OnGetRecordID: TtsDBGetRecordIDEvent read FOnGetRecordId write SetOnGetRecordID;
        property OnInsertRow: TtsDBInsertRowEvent read FOnInsertRow write FOnInsertRow;
        property OnInvalidMaskValue: TtsDBInvalidCellValueEvent read FOnInvalidMaskValue write FOnInvalidMaskValue;
        property OnInvalidMaskEdit: TtsDBInvalidCellEditEvent read FOnInvalidMaskEdit write FOnInvalidMaskEdit;
        property OnPaintCell: TtsDBPaintCellEvent read FOnPaintCell write FOnPaintCell;
        property OnRowChanged: TtsDBRowChangedEvent read FOnRowChanged write FOnRowChanged;
        property OnRowLoaded: TtsDBRowLoadedEvent read FOnRowLoaded write FOnRowLoaded;
        property OnStartCellEdit: TtsDBCellEditingEvent read FOnStartCellEdit write FOnStartCellEdit;
        property OnStartRowEdit: TtsDBRowEditingEvent read FOnStartRowEdit write FOnStartRowEdit;
        property OnTopLeftChanged: TtsDBTopLeftChangedEvent read FOnTopLeftChanged write FOnTopLeftChanged;
        property OnUndoCellEdit: TtsDBUndoCellEditEvent read FOnUndoCellEdit write FOnUndoCellEdit;
        property OnUndoRowEdit: TtsDBUndoRowEditEvent read FOnUndoRowEdit write FOnUndoRowEdit;
        property OnUpdateField: TtsDBUpdateFieldEvent read FOnUpdateField write FOnUpdateField;
        property OnFieldLayoutChange: TNotifyEvent read FOnFieldLayoutChange write FOnFieldLayoutChange;
        property OnPrintRow : TtsDBPrintRowEvent read FOnPrintRow write FOnPrintRow;
        property OnPrintCell : TtsDBPrintCellEvent read FOnPrintCell write FOnPrintCell;

    public
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;

        function  ActiveCombo(DataCol: Longint; DataRow: Variant): TtsCombo; override;
        function  ActiveControlType(DataCol: Longint; DataRow: Variant): TtsControlType; override;
        procedure Assign(Source: TPersistent); override;
        procedure AssignCellCombo(DataCol: Longint; DataRow: Variant);
        procedure AssignCellFont(DataCol: Longint; DataRow: Variant);
        procedure AssignRowCombo(DataRow: Variant);
        procedure AssignRowFont(DataRow: Variant);
        procedure CalculatePosition;
        procedure CalculateRows;
        function  CellSelected(DisplayCol: Longint; DisplayRow: Variant): Boolean;
        procedure ChangeSelection(FromRow, ToRow: Variant);
        function  CompareBkm(Bkm1, Bkm2: TBookmarkStr): Integer;
        procedure DeleteCols(FromDataCol, ToDataCol: Longint); override;
        procedure DeleteRows(FromDataRow, ToDataRow: Longint); override;
        procedure DeleteSelectedCols; override;
        procedure DeleteSelectedRows; override;
        procedure DoPrintRow(DataRow: Variant; var Cancel : Boolean); virtual;
        procedure DoPrintCell(DataCol : Longint; DataRow : Variant; var Cancel : Boolean); virtual;
        function  DoSelectRows(FromRow, ToRow: TtsBkmPos; Select: Boolean; ByUser: Boolean): Boolean;
        function  DrawCell3D(DataCol: Longint; DataRow: Variant): Boolean;
        function  Edit: Boolean; override;
        function  FindLookupDataSet : TDataSet;
        procedure Print; override;
        procedure PrintPreview; override;
        procedure ExportGrid; override;
        procedure ExportCSV(toFile : String);
        procedure ExportXML(toFile : String);
        {$IFDEF TSVER_V4}
        function  ExecuteAction(Action: TBasicAction): Boolean; override;
        {$ENDIF}
        procedure InsertCol(DisplayCol: Longint; FieldName: string);
        procedure InsertRow(DisplayRow: Longint);
        procedure MoveBy(Count: Longint);
        procedure MoveFirst;
        procedure MoveLast;
        procedure PutCellInView(DataCol: Longint; DataRow: Variant);
        function  ReadOnly: Boolean; virtual;
        procedure RefreshData(ResetOrder: TtsResetOrder; ResetPosition: TtsResetPosition);
        procedure ResetCellCombo(DataCol: Longint; DataRow: Variant);
        procedure ResetCellFont(DataCol: Longint; DataRow: Variant);
        procedure ResetCellProperties(Properties: TtsProperties); override;
        procedure ResetRowCombo(DataRow: Variant);
        procedure ResetRowFont(DataRow: Variant);
        procedure ResetRowProperties(Properties: TtsProperties); override;
        procedure RestorePosition(Position: TtsDatasetPosition);
        procedure SavePosition(var Position: TtsDatasetPosition);
        procedure SelectCells(DisplayLeft, DisplayTop, DisplayRight, DisplayBottom: Longint);
        procedure SelectRows(FromRow, ToRow: Variant; Select: Boolean);
        procedure SetTopLeft(DisplayCol: Longint; DisplayRow: Variant);
        procedure SynchronizeData;
        {$IFDEF TSVER_V4}
        function  UpdateAction(Action: TBasicAction): Boolean; override;
        {$ENDIF}
    end;

    {TtsDBCombo}
    {Combo wrapper class for TtsCustomDBGrid}

    TtsDBCombo = class(TtsCombo)
    protected
        function  GetDropDownRows: Longint; override;
        function  GetDropDownCols: Longint; override;
        function  GetValueCol: Longint; override;
        function  GetValueColSorted: Boolean; override;
        function  GetCompareType: TtsComboCompareType; override;
        function  GetAutoSearch: TtsComboAutoSearchType; override;
        function  GetAutoFill: Boolean; override;
        function  GetAutoFillConvertCase: TtsConvertCase; override;
        function  GetAutoLookup: Boolean; override;
        function  GetDropDownStyle: TtsDropDownStyle; override;
        function  GetGrid: TtsDBComboGrid;
        procedure SetDropDownRows(Value: Longint); override;
        procedure SetDropDownCols(Value: Longint); override;
        procedure SetValueCol(Value: Longint); override;
        procedure SetValueColSorted(Value: Boolean); override;
        procedure SetCompareType(Value: TtsComboCompareType); override;
        procedure SetAutoSearch(value: TtsComboAutoSearchType); override;
        procedure SetAutoFill(Value: Boolean); override;
        procedure SetAutoFillConvertCase(Value: TtsConvertCase); override;
        procedure SetAutoLookup(Value: Boolean); override;
        procedure SetDropDownStyle(Value: TtsDropDownStyle); override;
    public
        property Grid: TtsDBComboGrid read GetGrid;
    end;

    {TtsDBComboGrid}
    {Combo box class for TtsDBGrid}

    TtsDBComboGrid = class(TtsCustomDBGrid)
    protected
        FGrid: TtsBaseGrid;
        FCombo: TtsCombo;
        FParentGrid: TtsBaseGrid;
        FDropDownRows: Integer;
        FDropDownCols: Integer;
        FValueCol: Longint;
        FValueColSorted: Boolean;
        FCompareType: TtsComboCompareType;
        FAutoSearch: TtsComboAutoSearchType;
        FAutoFill: Boolean;
        FAutoFillConvertCase: TtsConvertCase;
        FDropDownStyle: TtsDropDownStyle;
        FAutoLookup: Boolean;

        function  GetDropDownRows: Longint; override;
        function  GetDropDownCols: Longint; override;
        function  GetValueCol: Longint; override;
        function  GetValueColSorted: Boolean; override;
        function  GetCompareType: TtsComboCompareType; override;
        function  GetAutoSearch: TtsComboAutoSearchType; override;
        function  GetAutoFill: Boolean; override;
        function  GetAutoFillConvertCase: TtsConvertCase;
        function  GetAutoLookup: Boolean; override;
        function  GetDropDownStyle: TtsDropDownStyle; override;
        function  GetGrid: TtsDBGrid;
        procedure SetDropDownRows(Value: Longint); override;
        procedure SetDropDownCols(Value: Longint); override;
        procedure SetValueCol(Value: Longint); override;
        procedure SetValueColSorted(Value: Boolean); override;
        procedure SetCompareType(Value: TtsComboCompareType); override;
        procedure SetAutoSearch(value: TtsComboAutoSearchType); override;
        procedure SetAutoFill(Value: Boolean); override;
        procedure SetAutoFillConvertCase(Value: TtsConvertCase);
        procedure SetAutoLookup(Value: Boolean); override;
        procedure SetDropDownStyle(Value: TtsDropDownStyle); override;
        function  GetParentGrid: TtsBaseGrid; override;
        procedure SetParentGrid(Value: TtsBaseGrid); override;
        function  GetParentGridCombo: TtsCombo; override;
        procedure SetParentGridCombo(Value: TtsCombo); override;

    public
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;

        property Active;
        property AlwaysShowEditor;
        property AlwaysShowFocus;
        property BookmarkRecordId;
        property Canvas;
        property Cell;
        property CellAlign;
        property CellAlignment;
        property CellButtonType;
        property CellCenterPicture;
        property CellTag;
        property CellData;
        property CellColor;
        property CellTextWidth;
        property CellCheckBoxState;
        property CellCombo;
        property CellControlType;
        property CellDropDownStyle;
        property CellEditing;
        property CellFont;
        property CellHorzAlignment;
        property CellIs3D;
        property CellKeepAspectRatio;
        property CellMaskName;
        property CellParentCombo;
        property CellParentFont;
        property CellPText;
        property CellReadOnly;
        property CellShrinkPicture;
        property CellSpinIncrement;
        property CellSpinOptions;
        property CellStretchPicture;
        property CellTextHeight;
        property CellTextLines;
        property CellVertAlignment;
        property CellWordWrap;
        property CheckBoxGrayedBitmap;
        property CheckBoxOffBitmap;
        property CheckBoxOnBitmap;
        property Col;
        property CurrentCell;
        property CurrentDataCol;
        property CurrentDataRow;
        property DataBound;
        property DataColnr;
        property DataRownr;
        property DisplayColnr;
        property DisplayRownr;
        property Editing;
        property EnablePaint;
        property EnableRedraw;
        property FastAssign;
        property Field;
        property FocusBorder;
        property FocusColor;
        property FocusBorderColor;
        property FocusFontColor;
        property Grid: TtsDBGrid read GetGrid;
        property GridData;
        property GridHeight;
        property GridStatus;
        property GridWidth;
        property HeadingAlignment;
        property HeadingTextHeight;
        property HeadingTextLines;
        property HorzScrollBarHeight;
        property HorzScrollBarVisible;
        property InsertionRow;
        property LeftCol;
        property MaxLeftCol;
        property MaxTopRow;
        property MouseStatus;
        property RecordNumber;
        property RowAlign;
        property RowAlignment;
        property RowButtonType;
        property RowCenterPicture;
        property RowChanged;
        property RowChangedIndicator;
        property RowColor;
        property RowCombo;
        property RowControlType;
        property RowFont;
        property RowHeight;
        property RowHorzAlignment;
        property RowId;
        property RowIs3D;
        property RowKeepAspectRatio;
        property RowMaskName;
        property RowParentCombo;
        property RowParentFont;
        property RowReadOnly;
        property RowSelected;
        property RowShrinkPicture;
        property RowSpinIncrement;
        property RowSpinOptions;
        property RowStretchPicture;
        property RowVertAlignment;
        property RowVisible;
        property RowWordWrap;
        property SelectedCells;
        property SelectedCols;
        property SelectedRows;
        property SpinButtonHeight;
        property SpinButtonWidth;
        property SpinRepeatDelay;
        property SpinStartDelay;
        property TopRow;
        property VertScrollBarVisible;
        property VertScrollBarWidth;
        property VisibleCols;
        property VisibleRows;

        property OnCellChanged;
        property OnCellLoaded;
        property OnClick;
        property OnClickCell;
        property OnColChanged;
        property OnColCountChanged;
        property OnColMoved;
        property OnColResized;
        property OnCompareRecordID;
        property OnDblClick;
        property OnDblClickCell;
        property OnDeleteCol;
        property OnDeleteRow;
        property OnFieldLayoutChange;
        property OnGetDrawInfo;
        property OnGetRecordID;
        property OnGridStatusChanged;
        property OnHeadingClick;
        property OnHeadingDown;
        property OnHeadingUp;
        property OnInsertCol;
        property OnInsertRow;
        property OnKeyDown;
        property OnKeyPress;
        property OnKeyUp;
        property OnMouseDown;
        property OnMouseMove;
        property OnMouseStatusChanged;
        property OnMouseUp;
        {$IFDEF TSVER_V4}
        property OnMouseWheel;
        property OnMouseWheelDown;
        property OnMouseWheelUp;
        {$ENDIF}
        property OnPaint;
        property OnPaintCell;
        property OnResize;
        property OnRowChanged;
        property OnRowCountChanged;
        property OnRowLoaded;
        property OnRowMoved;
        property OnRowResized;
        property OnScanRecords;
        property OnSelectChanged;
        property OnTopLeftChanged;

    published
        property AutoFill: Boolean read GetAutoFill write SetAutoFill default False;
        property AutoFillConvertCase: TtsConvertCase read GetAutoFillConvertCase write SetAutoFillConvertCase default afcOnEdit;
        property AutoLookup;
        property AutoSearch: TtsComboAutoSearchType read GetAutoSearch write SetAutoSearch default asNone;
        property CompareType: TtsComboCompareType read GetCompareType write SetCompareType default ctCaseInsensitive;
        property DropDownRows;
        property DropDownCols;
        property DropDownStyle: TtsDropDownStyle read GetDropDownStyle write SetDropDownStyle default ddDropDown;
        property ValueCol: Longint read GetValueCol write SetValueCol default 1;
        property ValueColSorted: Boolean read GetValueColSorted write SetValueColSorted default False;

        property AlwaysShowScrollBar;
        property BookmarkCompareType;
        property BookmarkType;
        property BorderStyle;
        property CenterPicture;
        property CheckBoxStyle;
        property CheckBoxValues;
        property Color;
        property Cols;
        property Ctl3D;
        property DatasetType;
        property DataSource;
        property DefaultColWidth;
        property DefaultRowHeight;
        property DrawOverlap;
        property ExactRowCount;
        property FieldState;
        property FixedColCount;
        property FixedLineColor;
        property FixedRowCount;
        property Font;
        property GridLines;
        property Heading3D;
        property HeadingHorzAlignment;
        property HeadingColor;
        property HeadingFont;
        property HeadingHeight;
        property HeadingOn;
        property HeadingParentFont;
        property HeadingVertAlignment;
        property HeadingWordWrap;
        property HorzAlignment;
        property Is3D;
        property KeepAspectRatio;
        property LineColor;
        property ParentColor;
        property ParentCtl3D;
        property ParentFont;
        property ParentShowHint;
        property RecordSelection;
        property ResizeCols;
        property ResizeColsInGrid;
        property ResizeRows;
        property ResizeRowsInGrid;
        property RowBarAlignment;
        property RowBarIndicator;
        property RowBarOn;
        property RowBarWidth;
        property Rows;
        property ScrollBars;
        property ScrollSpeed;
        property SelectionColor;
        property SelectionFontColor;
        property SelectionType;
        property ShowHint;
        property ShrinkPicture;
        property StoreData;
        property StretchPicture;
        property ThumbTracking;
        property TransparentColor;
        property UseRecordIds;
        property Version;
        property VertAlignment;
        property WordWrap;

        {$IFNDEF TSVER_V3}
        property ColProperties;
        property RowProperties;
        property CellProperties;
        {$ENDIF}
    end;

    TtsDBGridStreamComponent = class(TtsGridStreamComponent)
    protected
        function  GetDataBound: Boolean;
        procedure SetDataBound(Value: Boolean);
        procedure DefineProperties(Filer: TFiler); override;
        procedure Loaded; override;
        function  GetGrid: TtsCustomDBGrid;

        property Grid: TtsCustomDBGrid read GetGrid;
    published
        property DataBound: Boolean read GetDataBound write SetDataBound;
    end;

    {TtsDBGrid}
    {Data-aware grid component which can be used as a visual component.
     Inherits all of its functionality from the base class TtsCustomDBGrid, and
     only sets properties and event public and published.}

    TtsDBGrid = class(TtsCustomDBGrid)
    public
        property Active;
        property BookmarkRecordId;
        property Canvas;
        property Cell;
        property CellAlign;
        property CellAlignment;
        property CellButtonType;
        property CellDateTimeDef;
        property CellCenterPicture;
        property CellTag;
        property CellData;
        property CellColor;
        property CellTextWidth;
        property CellCheckBoxState;
        property CellControlType;
        property CellDropDownStyle;
        property CellEditing;
        property CellFont;
        property CellHorzAlignment;
        property CellIs3D;
        property CellKeepAspectRatio;
        property CellMaskName;
        property CellParentCombo;
        property CellParentFont;
        property CellPText;
        property CellReadOnly;
        property CellShrinkPicture;
        property CellSpinIncrement;
        property CellSpinOptions;
        property CellStretchPicture;
        property CellTextHeight;
        property CellTextLines;
        property CellVertAlignment;
        property CellWordWrap;
        property CheckBoxGrayedBitmap;
        property CheckBoxOffBitmap;
        property CheckBoxOnBitmap;
        property Col;
        property CurrentCell;
        property CurrentDataCol;
        property CurrentDataRow;
        property DataBound;
        property DataColnr;
        property DataRownr;
        property DisplayColnr;
        property DisplayRownr;
        property Editing;
        property EditMode;
        property EnablePaint;
        property EnableRedraw;
        property FastAssign;
        property Field;
        property GridData;
        property GridHeight;
        property GridStatus;
        property GridWidth;
        property HeadingAlignment;
        property HeadingTextHeight;
        property HeadingTextLines;
        property HorzScrollBarHeight;
        property HorzScrollBarVisible;
        property InsertionRow;
        property LeftCol;
        property MaxLeftCol;
        property MaxTopRow;
        property MouseStatus;
        property RecordNumber;
        property RowAlign;
        property RowAlignment;
        property RowButtonType;
        property RowDateTimeDef;
        property RowCenterPicture;
        property RowChanged;
        property RowColor;
        property RowControlType;
        property RowDropDownStyle;
        property RowFont;
        property RowHeight;
        property RowHorzAlignment;
        property RowId;
        property RowIs3D;
        property RowKeepAspectRatio;
        property RowMaskName;
        property RowParentCombo;
        property RowParentFont;
        property RowReadOnly;
        property RowSelected;
        property RowShrinkPicture;
        property RowSpinIncrement;
        property RowSpinOptions;
        property RowStretchPicture;
        property RowVertAlignment;
        property RowVisible;
        property RowWordWrap;
        property SelectedCells;
        property SelectedCols;
        property SelectedRows;
        property TopRow;
        property VertScrollBarVisible;
        property VertScrollBarWidth;
        property VisibleCols;
        property VisibleRows;
        property XMLMetaData;
        property XMLData;
    published
        property Align;
        property AlwaysShowEditor;
        property AlwaysShowFocus;
        property AlwaysShowScrollBar;
        {$IFDEF TSVER_V4}
        property Anchors;
        {$ENDIF}
        property AutoInsert;
        property AutoScale;
        property BookmarkCompareType;
        property BookmarkType;
        property BorderStyle;
        property ButtonEdgeWidth;
        property DateTimeDef;
        property CellSelectMode;
        property CenterPicture;
        property CheckBoxStyle;
        property CheckBoxValues;
        property CheckMouseFocus;
        property ColMoving;
        property Color;
        property Cols;
        property ColSelectMode;
        property ConfirmDelete;
        {$IFDEF TSVER_V4}
        property Constraints;
        {$ENDIF}
        property Ctl3D;
        property DatasetType;
        property DataSource;
        property DefaultButtonHeight;
        property DefaultButtonWidth;
        property DefaultColWidth;
        property DefaultRowHeight;
        property DragCursor;
        {$IFDEF TSVER_V4}           
        property DragKind;
        {$ENDIF}
        property DragMode;
        property DrawOverlap;
        property EditColor;
        property EditFontColor;
        property Enabled;
        property ExactRowCount;
        property ExportDelimiter;
        property FieldState;
        property FixedColCount;
        property FixedLineColor;
        property FixedRowCount;
        property FocusBorder;
        property FocusColor;
        property FocusBorderColor;
        property FocusFontColor;
        property FlatButtons;
        property Font;
        property GridLines;
        property GridMode;
        property Heading3D;
        property HeadingHorzAlignment;
        property HeadingButton;
        property HeadingColor;
        property HeadingFont;
        property HeadingHeight;
        property HeadingOn;
        property HeadingParentFont;
        property HeadingVertAlignment;
        property HeadingWordWrap;
        property HorzAlignment;
        property ImageList;
        property InactiveButtonState;
        property Is3D;
        property KeepAspectRatio;
        property LineColor;
        property MaskDefs;
        property ParentColor;
        property ParentCtl3D;
        property ParentFont;
        property ParentShowHint;
        property PopupMenu;
        property PrintTitle;
        property PrintLinesPerPage;
        property PrintOrientation;
        property PrintTotals;
        property PrintCols;
        property PrintWithGridFormats;
        property ReadOnlyButton;
        property RecordSelection;
        property ResizeCols;
        property ResizeColsInGrid;
        property ResizeRows;
        property ResizeRowsInGrid;
        property RowBarAlignment;
        property RowBarIndicator;
        property RowBarOn;
        property RowBarWidth;
        property RowChangedIndicator;
        property RowMoving;
        property Rows;
        property RowSelectMode;
        property ScrollBars;
        property ScrollSpeed;
        property SelectionColor;
        property SelectionFontColor;
        property SelectionType;
        property SelectedAreaCursor;
        property SelectFixed;
        property ShowHint;
        property ProvideGridMenu;
        property AlwaysDetectButton;
        property GridReport;
        property ShrinkPicture;
        property SkipReadOnly;
        property SpinButtonHeight;
        property SpinButtonWidth;
        property SpinRepeatDelay;
        property SpinStartDelay;
        property StoreData;
        property StretchPicture;
        property TabOrder;
        property TabRowWrap;
        property ThumbTracking;
        property TransparentColor;
        property UseRecordIds;
        property Version;
        property VertAlignment;
        property Visible;
        property WantTabs;
        property WordWrap;
        property XMLExport;

        {$IFNDEF TSVER_V3}
        property ColProperties;
        property RowProperties;
        property CellProperties;
        {$ENDIF}

        property OnButtonClick;
        property OnButtonDown;
        property OnButtonUp;
        property OnDateTimeDropDown;
        property OnDateTimeGetValue;
        property OnDateTimeInit;
        property OnDateTimeRollUp;
        property OnCanStartDrag;
        property OnCellChanged;
        property OnCellEdit;
        property OnCellLoaded;
        property OnClick;
        property OnClickCell;
        property OnColChanged;
        property OnColCountChanged;
        property OnColMoved;
        property OnColResized;
        {$IFDEF TSVER_V5}
        property OnContextPopup;
        {$ENDIF}
        property OnComboCellLoaded;
        property OnComboCompareValue;
        property OnComboLCompareValue;
        property OnComboDropDown;
        property OnComboGetValue;
        property OnComboInit;
        property OnComboRollUp;
        property OnCompareRecordID;
        property OnDblClick;
        property OnDblClickCell;
        property OnDeleteCol;
        property OnDeleteRow;
        property OnDragDrop;
        property OnDragOver;
        property OnEditTextResized;
        property OnEndCellEdit;
        {$IFDEF TSVER_V4}
        property OnEndDock;
        {$ENDIF}
        property OnEndDrag;
        property OnEndRowEdit;
        property OnEnter;
        property OnExit;
        property OnFieldLayoutChange;
        property OnGetDrawInfo;
        property OnGetRecordID;
        property OnGridStatusChanged;
        property OnHeadingClick;
        property OnHeadingDown;
        property OnHeadingUp;
        property OnInsertCol;
        property OnInsertRow;
        property OnInvalidMaskValue;
        property OnInvalidMaskEdit;
        property OnKeyDown;
        property OnKeyPress;
        property OnKeyUp;
        property OnMouseDown;
        property OnMouseMove;
        property OnMouseStatusChanged;
        property OnMouseUp;
        {$IFDEF TSVER_V4}
        property OnMouseWheel;
        property OnMouseWheelDown;
        property OnMouseWheelUp;
        {$ENDIF}
        property OnPaint;
        property OnPaintCell;
        property OnResize;
        property OnRowChanged;
        property OnRowCountChanged;
        property OnRowLoaded;
        property OnRowMoved;
        property OnRowResized;
        property OnScanRecords;
        property OnSelectChanged;
        property OnShowEditor;
        property OnSpinButtonClick;
        property OnSpinButtonDown;
        property OnSpinButtonUp;
        property OnSpinIncrement;
        property OnSpinRepeat;
        property OnStartCellEdit;
        {$IFDEF TSVER_V4}
        property OnStartDock;
        {$ENDIF}
        property OnStartDrag;
        property OnStartRowEdit;
        property OnTopLeftChanged;
        property OnUndoCellEdit;
        property OnUndoRowEdit;
        property OnUpdateField;
        property OnPrintGrid;
        property OnPrintRow;
        property OnPrintCell;
    end;


{$IFDEF TSVER_V6}
function GetBCDToCurr(const BCD: TBcd; var Curr: Currency): Boolean;
function GetCurrToBCD(Curr: Currency; var BCD: TBcd; Precision, Decimals: Integer): Boolean;
{$ELSE}
function GetBCDToCurr(const BCD: FMTBcd; var Curr: Currency): Boolean;
function GetCurrToBCD(Curr: Currency; var BCD: FMTBcd; Precision, Decimals: Integer): Boolean;
{$ENDIF}

const
    StsInvalidBookmark = 'Invalid bookmark value';

implementation

{$R *.dcr}

uses Forms, DBConsts {$IFDEF TSVER_V3}, DBCommon {$ENDIF};

const
    MaxMapSize = (MaxInt div 2) div SizeOf(Integer);
    ScrollBarMargin = 10;
    bkmNormal = 0;
    bkmInserted = 1;
    MaxSyncTry = 5;
    //EmptyBookmark = '';
    StandardScrollMin = 1;
    StandardScrollMax = 5;
    DtsAutoLookupName = 'AutoLookup';

var
    EmptyRecId: Variant;
    EmptyBookmark: Variant;

type
    TDateRec = record
        case Integer of
            0: (Date: Longint);
            1: (Time: Longint);
            2: (DateTime: TDateTime);
    end;

    TGraphicHeader = record
        Count: Word;
        HType: Word;
        Size: Longint;
    end;

    TDateTimeRec = record
    case TFieldType of
        ftDate: (Date: Longint);
        ftTime: (Time: Longint);
        ftDateTime: (DateTime: TDateTime);
    end;

function DatasetCompBkm(Dataset: TDataset; Bkm1, Bkm2: TBookmarkStr; CompareType: TtsBookmarkCompareType): Integer;
begin
    if CompareType = bctAsString then
    begin
        if Bkm1 < Bkm2 then
            Result := -1
        else if Bkm1 > Bkm2 then
            Result := 1
        else
            Result := 0;
    end
    else if (Bkm1 = Bkm2) then
        Result := 0
    else if ((VarToStr(Bkm1) = VarToStr(EmptyBookmark)) and (VarToStr(Bkm2) <> VarToStr(EmptyBookmark))) then
        Result := -1
    else if ((VarToStr(Bkm1) <> VarToStr(EmptyBookmark)) and (VarToStr(Bkm2) = VarToStr(EmptyBookmark))) then
        Result := 1
    else
    begin
{$IFDEF TSVER_V3}
        Result := Dataset.CompareBookmarks(PChar(Bkm1), PChar(Bkm2));
{$ELSE}
        Result := 0;
        DbiCompareBookMarks(Dataset.Handle, PChar(Bkm1), PChar(Bkm2), Result);
        if Result = CmpKeyEql then Result := CmpEql;
{$ENDIF}
    end;
end;

function CurBkmPos(Bkm: TBookmarkStr): TtsBkmPos;
begin
    Result.Bkm := Bkm;
    Result.Offset := bpoCurrent;
end;

function BofBkmPos: TtsBkmPos;
begin
    Result.Bkm := EmptyBookmark;
    Result.Offset := bpoBof;
end;

function EofBkmPos: TtsBkmPos;
begin
    Result.Bkm := EmptyBookmark;
    Result.Offset := bpoEof;
end;

{$IFDEF TSVER_V6}
function GetBCDToCurr(const BCD: TBcd; var Curr: Currency): Boolean;
begin
  Result := BCDToCurr(BCD, Curr);
end;

function GetCurrToBCD(Curr: Currency; var BCD: TBcd; Precision, Decimals: Integer): Boolean;
begin
  Result := CurrToBCD(Curr, BCD, Precision, Decimals);
end;
{$ELSE}
function GetBCDToCurr(const BCD: FMTBcd; var Curr: Currency): Boolean;
begin
{$IFDEF TSVER_V3}
    {$IFDEF TSVER_V5}
    Result := BCDToCurr(TBCD(BCD), Curr);
    {$ELSE}
    Result := FMTBCDToCurr(BCD, Curr);
    {$ENDIF}
{$ELSE}
    Result := BCDToCurr(BCD, Curr);
{$ENDIF}
end;

function GetCurrToBCD(Curr: Currency; var BCD: FMTBcd; Precision, Decimals: Integer): Boolean;
begin
{$IFDEF TSVER_V3}
    {$IFDEF TSVER_V5}
    Result := CurrToBCD(Curr, TBCD(BCD), Precision, Decimals);
    {$ELSE}
    Result := CurrToFMTBCD(Curr, BCD, Precision, Decimals);
    {$ENDIF}
{$ELSE}
    Result := CurrToBCD(Curr, BCD, Precision, Decimals);
{$ENDIF}
end;
{$ENDIF}

{TtsDBField}

constructor TtsDBField.Create(Grid: TtsCustomDBGrid; Col: TtsDBCol; Field: TField);
begin
    FGrid := Grid;
    FCol := Col;
    FDatasetField := Field;
end;

destructor TtsDBField.Destroy;
begin
    inherited Destroy;
end;

function TtsDBField.IsEditField: Boolean;
begin
    Result := not FGrid.ReadOnly and
              not DatasetField.ReadOnly and
              not DatasetField.Calculated and
              not DatasetField.Lookup;
end;

function TtsDBField.FieldEditOk: Boolean;
var
    DataCol: Longint;
begin
    Result := IsEditField;
    if not Result then Exit;

    if Assigned(FCol) then
    begin
        DataCol := FCol.DataCol;
        if FGrid.CurrentCell.DataCol = DataCol then Result := FGrid.StartCellEdit;
        if Result then Result := FGrid.StartRowEdit;
        if Result then Result := FGrid.StartCellChange(DataCol, False);
    end
    else
    begin
        Result := FGrid.StartRowEdit;
        if Result then FGrid.Datalink.Edit;
    end;
end;

function TtsDBField.GetDataSize: Word;
begin
    Result := DatasetField.DataSize;
end;

function TtsDBField.GetSize: Word;
begin
    Result := DatasetField.Size;
end;

procedure TtsDBField.SetSize(Value: Word);
begin
    DatasetField.Size := Value;
end;

procedure TtsDBField.ClearLookup;
var
    RecBuf: PChar;

begin
    if not Lookup then Exit;

    with FGrid.FScrollDataset do
    begin
        RecBuf := ActiveRecordBuffer;
        Boolean(RecBuf[FLookupStart + FLookupOffset]) := False;
    end;
end;

function TtsDBField.GetLookupData(Buffer: Pointer): Boolean;
var
    RecBuf: PChar;
begin
    Result := False;
    with FGrid.FScrollDataset do
    begin
        RecBuf := ActiveRecordBuffer;
        if Assigned(RecBuf) then
        begin
            Result := Boolean(RecBuf[FLookupStart + FLookupOffset]);
            if Result and Assigned(Buffer) then
                Move(RecBuf[FLookupStart + FLookupOffset + 1], Buffer^, DataSize);
        end;
    end;
end;

procedure TtsDBField.SetLookupData(Buffer: Pointer);
var
    RecBuf: PChar;
begin
    with FGrid.FScrollDataset do
    begin
        RecBuf := ActiveRecordBuffer;
        Boolean(RecBuf[FLookupStart + FLookupOffset]) := True;
        Move(Buffer^, RecBuf[FLookupStart + FLookupOffset + 1], DataSize);
    end;
end;

procedure TtsDBField.GetLookupValue;
begin
    with DatasetField do
    begin
        if Assigned(LookupDataSet) and LookupDataSet.Active then
        begin
            LookupValue := LookupDataSet.Lookup(LookupKeyFields,
                                                FGrid.FScrollDataSet.FieldValues[KeyFields],
                                                LookupResultField);
        end
        else
            LookupValue := Null;
    end;
end;

function TtsDBField.GetData(Buffer: Pointer): Boolean;
var
    RecBuf: PChar;
    IsBlank: LongBool;
begin
    Result := False;
    if FDatasetField.Calculated then Exit;

    with FGrid.FScrollDataset do
    begin
        if (FGrid.Editing or FGrid.StartEditing) and
           (CompareBkm(FDataset.Bookmark, ActiveBookmark) = 0) then
            Result := FDatasetField.GetData(Buffer)
        else if Lookup then
            Result := GetLookupData(Buffer)
        else
        begin
            RecBuf := ActiveRecordBuffer;
            if Assigned(RecBuf) then
            begin
                CheckErr(DbiGetField(FHandle, FieldNo, RecBuf, Buffer, IsBlank));
                Result := not IsBlank;
            end;
        end;
    end;
end;

function TtsDBField.GetText(DisplayText: Boolean): string;
begin
    Result := AsString;
end;

procedure TtsDBField.SetEditText(Value: string);
begin
    if not FieldEditOk then Exit;
    FDatasetField.Text := Value;
end;

function TtsDBField.GetEditText: string;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.Text
        else Result := GetText(False);
end;

function TtsDBField.GetDisplayText: string;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.DisplayText
        else Result := GetText(True);
end;

function TtsDBField.GetAsBoolean: Boolean;
begin
    Result := DatasetField.AsBoolean;
end;

function TtsDBField.GetAsCurrency: Currency;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsCurrency
        else Result := GetAsFloat;
end;

function TtsDBField.GetAsDateTime: TDateTime;
begin
    Result := DatasetField.AsCurrency;
end;

function TtsDBField.GetAsFloat: Double;
begin
    Result := DatasetField.AsFloat;
end;

function TtsDBField.GetAsInteger: Longint;
begin
    Result := DatasetField.AsInteger;
end;

function TtsDBField.GetAsString: string;
begin
    Result := DatasetField.AsString;
end;

function TtsDBField.GetAsVariant: Variant;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsVariant
        else Result := Text;
end;

function TtsDBField.IsBooleanField: Boolean;
begin
    Result := False;
end;

function TtsDBField.IsIntegerField: Boolean;
begin
    Result := False;
end;

procedure TtsDBField.SetAsBoolean(Value: Boolean);
begin
    if not FieldEditOk then Exit;
    DatasetField.AsBoolean := Value;
end;

procedure TtsDBField.SetAsCurrency(Value: Currency);
begin
    if not FieldEditOk then Exit;
    DatasetField.AsCurrency := Value;
end;

procedure TtsDBField.SetAsDateTime(Value: TDateTime);
begin
    if not FieldEditOk then Exit;
    DatasetField.AsDateTime := Value;
end;

procedure TtsDBField.SetAsFloat(Value: Double);
begin
    if not FieldEditOk then Exit;
    DatasetField.AsFloat := Value;
end;

procedure TtsDBField.SetAsInteger(Value: Longint);
begin
    if not FieldEditOk then Exit;
    DatasetField.AsInteger := Value;
end;

procedure TtsDBField.SetAsString(const Value: string);
begin
    if not FieldEditOk then Exit;
    DatasetField.AsString := Value;
end;

procedure TtsDBField.SetAsVariant(const Value: Variant);
begin
    if not FieldEditOk then Exit;
    DatasetField.AsVariant := Value;
end;

procedure TtsDBField.SetLookupVarValue(Value: Variant);
begin
end;

procedure TtsDBField.SetLookupValue(const Value: Variant);
begin
    if VarIsNull(Value) then
        ClearLookup
    else
        SetLookupVarValue(Value);
end;

function TtsDBField.SetField(RecBuf: PChar; Value: string): Boolean;
begin
    Result := False;
end;

function TtsDBField.GetFieldClass: TClass;
begin
    Result := DatasetField.ClassType;
end;

function TtsDBField.GetDisplayLabel: string;
begin
    Result := DatasetField.DisplayLabel;
end;

procedure TtsDBField.SetDisplayLabel(Value: string);
begin
    DatasetField.DisplayLabel := Value;
end;

function TtsDBField.GetDisplayName: string;
begin
    Result := DatasetField.DisplayName;
end;

function TtsDBField.GetFieldName: string;
begin
    Result := DatasetField.FieldName;
end;

function TtsDBField.GetReadOnly: Boolean;
begin
    Result := DatasetField.ReadOnly;
end;

procedure TtsDBField.SetReadOnly(Value: Boolean);
begin
    DatasetField.ReadOnly := Value;
end;

function TtsDBField.GetAlignment: TAlignment;
begin
    Result := DatasetField.Alignment;
end;

procedure TtsDBField.SetAlignment(Value: TAlignment);
begin
    DatasetField.Alignment := Value;
end;

function TtsDBField.GetFieldNo: Integer;
begin
    Result := DatasetField.FieldNo;
end;

function TtsDBField.GetDataType: TFieldType;
begin
    Result := DatasetField.DataType;
end;

function TtsDBField.GetDisplayFormat: string;
begin
    Result := '';
end;

function TtsDBField.GetEditFormat: string;
begin
    Result := '';
end;

function TtsDBField.GetVisible: Boolean;
begin
    Result := DatasetField.Visible;
end;

procedure TtsDBField.SetVisible(Value: Boolean);
begin
    DatasetField.Visible := Value;
end;

function TtsDBField.GetDisplayWidth: Integer;
begin
    Result := DatasetField.DisplayWidth;
end;

procedure TtsDBField.SetDisplayWidth(Value: Integer);
begin
    DatasetField.DisplayWidth := Value;
end;

function TtsDBField.CanModify: Boolean;
begin
    Result := DatasetField.CanModify;
end;

function TtsDBField.IsBlobField: Boolean;
begin
    Result := (DatasetField is TBlobField);
end;

function TtsDBField.GetTransliterate: Boolean;
begin
    Result := False;
end;

procedure TtsDBField.SetTransliterate(Value: Boolean);
begin
end;

function TtsDBField.GetEditMask: string;
begin
    Result := DatasetField.EditMask;
end;

procedure TtsDBField.SetEditMask(Value: string);
begin
    DatasetField.EditMask := Value;
end;

function TtsDBField.GetControlType: TtsControlType;
begin
    Result := ctText;
end;

function TtsDBField.GetMaxLength: Integer;
begin
    Result := 0;
end;

function TtsDBField.GetIsNull: Boolean;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.IsNull
        else Result := not GetData(nil);
end;

function TtsDBField.GetLookup: Boolean;
begin
    Result := DatasetField.Lookup;
end;

{TtsDBStringField}

function TtsDBStringField.GetValue(var Value: string): Boolean;
var
    Buffer: PChar;
begin
    Result := False;
    Value := '';
    with FGrid.FScrollDataset do
    begin
        Buffer := ReadBuffer;
        if (Buffer <> nil) then FillChar(Buffer^, FBufRowSize, 0);
        if GetData(Buffer) then
        begin
            Result := True;
            if Transliterate then NativeToAnsi(Locale, Buffer, Value)
                             else Value := Buffer;
        end;
    end;
end;

function TtsDBStringField.GetAsBoolean: Boolean;
var
    Value: string;
begin
    if FGrid.UseStandardScrolling then
        Result := DatasetField.AsBoolean
    else
    begin
        Value := GetAsString;
        Result := (Length(Value) > 0) and (Value[1] in ['T', 't', 'Y', 'y']);
    end;
end;

function TtsDBStringField.GetAsDateTime: TDateTime;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsDateTime
        else Result := StrToDateTime(GetAsString);
end;

function TtsDBStringField.GetAsFloat: Double;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsFloat
        else Result := StrToFloat(GetAsString);
end;

function TtsDBStringField.GetAsInteger: Longint;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsInteger
        else Result := StrToInt(GetAsString);
end;

function TtsDBStringField.GetAsString;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsString
        else if not GetValue(Result) then Result := '';
end;

function TtsDBStringField.GetAsVariant: Variant;
var
    Value: string;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsVariant
        else if GetValue(Value) then Result := Value else Result := Null;
end;

function TtsDBStringField.GetMaxLength: Integer;
begin
    Result := DatasetField.Size;
end;

function TtsDBStringField.GetText(DisplayText: Boolean): string;
begin
    if DisplayText and (EditMask <> '') then
        Result := FormatMaskText(EditMask, AsString) else
        Result := AsString;
end;

function TtsDBStringField.GetTransliterate: Boolean;
begin
    Result := TStringField(DatasetField).Transliterate;
end;

procedure TtsDBStringField.SetTransliterate(Value: Boolean);
begin
    TStringField(DatasetField).Transliterate := Value;
end;

procedure TtsDBStringField.SetLookupVarValue(Value: Variant);
var
    DataValue: string;
    Buffer: PChar;
begin
    DataValue := Value;
    Buffer := FGrid.FScrollDataset.ReadBuffer;
    FillChar(Buffer^, DataSize, 0);
    Move(PChar(DataValue)^, Buffer^, Length(DataValue));
    SetLookupData(Buffer);
end;

function TtsDBStringField.SetField(RecBuf: PChar; Value: string): Boolean;
var
    Buffer: array[0..dsMaxStringSize] of Char;
begin
    if Transliterate
        then AnsiToNative(FGrid.FScrollDataset.Locale, Value, Buffer, Size)
        else StrLCopy(Buffer, PChar(Value), Size);

    DbiPutField(FGrid.FScrollDataset.FHandle, FieldNo, RecBuf, @Buffer);
    Result := True;
end;

{TtsDBNumericField}

function TtsDBNumericField.GetDisplayFormat: string;
begin
    Result := TNumericField(DatasetField).DisplayFormat;
end;

function TtsDBNumericField.GetEditFormat: string;
begin
    Result := TNumericField(DatasetField).EditFormat;
end;

{TtsDBIntegerField}

function TtsDBIntegerField.GetValue(var Value: Longint): Boolean;
var
    Data: record
            case Integer of
                0: (I: Smallint);
                1: (W: Word);
                2: (L: Longint);
          end;
begin
    Result := False;
    Value := 0;
    if not Assigned(FGrid.FScrollDataset) then Exit;

    with FGrid.FScrollDataset do
    begin
        if GetData(@Data) then
        begin
            Result := True;
            case DataType of
                ftSmallint: Value := Data.I;
                ftWord: Value := Data.W;
            else
                Value := Data.L;
            end;
        end;
    end;
end;

function TtsDBIntegerField.GetAsFloat: Double;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsFloat
        else Result := GetAsInteger;
end;

function TtsDBIntegerField.GetAsInteger: Longint;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsInteger
        else if not GetValue(Result) then Result := 0;
end;

function TtsDBIntegerField.GetAsString: string;
var
    Value: Longint;
begin
    Result := '';
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsString
        else if GetValue(Value) then Str(Value, Result);
end;

function TtsDBIntegerField.GetAsVariant: Variant;
var
    Value: Longint;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsVariant
        else if GetValue(Value) then Result := Value else Result := Null;
end;

function TtsDBIntegerField.GetText(DisplayText: Boolean): string;
var
    Value: Longint;
    Fmt: string;
begin
    Result := '';
    if GetValue(Value) then
    begin
        if DisplayText or (TIntegerField(DatasetField).EditFormat = '') then
            Fmt := TIntegerField(DatasetField).DisplayFormat
        else
            Fmt := TIntegerField(DatasetField).EditFormat;

        if Fmt = '' then Str(Value, Result)
                    else Result := FormatFloat(Fmt, Value);
    end;
end;

procedure TtsDBIntegerField.SetLookupVarValue(Value: Variant);
var
    DataValue: Longint;
begin
    DataValue := Value;
    SetLookupData(@DataValue);
end;

function TtsDBIntegerField.SetField(RecBuf: PChar; Value: string): Boolean;
var
    Index: Integer;
    LongVal: Longint;
begin
    Result := False;
    if Value = '' then
    begin
        Result := True;
        DbiPutField(FGrid.FScrollDataset.FHandle, FieldNo, RecBuf, nil);
    end
    else
    begin
        Val(Value, LongVal, Index);
        if Index = 0 then
        begin
            Result := True;
            DbiPutField(FGrid.FScrollDataset.FHandle, FieldNo, RecBuf, @LongVal);
        end;
    end;
end;

function TtsDBIntegerField.IsIntegerField: Boolean;
begin
    Result := True;
end;

{TtsDBFloatField}

function TtsDBFloatField.GetPrecision: Integer;
begin
    Result := TFloatField(DatasetField).Precision;
end;

function TtsDBFloatField.GetValue(var Value: Double): Boolean;
begin
    Result := False;
    Value := 0;
    if not Assigned(FGrid.FScrollDataset) then Exit;
    Result := GetData(@Value);
end;

function TtsDBFloatField.GetAsFloat: Double;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsFloat
        else if not GetValue(Result) then Result := 0;
end;

function TtsDBFloatField.GetAsInteger: Longint;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsInteger
        else Result := Round(GetAsFloat);
end;

function TtsDBFloatField.GetAsString: string;
var
    Value: Double;
begin
    Result := '';
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsString
        else if GetValue(Value) then Result := FloatToStr(Value);
end;

function TtsDBFloatField.GetAsVariant: Variant;
var
    Value: Double;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsVariant
        else if GetValue(Value) then Result := Value else Result := Null;
end;

function TtsDBFloatField.GetText(DisplayText: Boolean): string;
var
    Value: Double;
    Fmt: string;
    Format: TFloatFormat;
    Digits: Integer;
begin
    Result := '';
    if GetValue(Value) then
    begin
        if DisplayText or (EditFormat = '')
            then Fmt := DisplayFormat
            else Fmt := EditFormat;

        if Fmt = '' then
        begin
            if IsCurrency then
            begin
                if DisplayText then Format := ffCurrency
                                else Format := ffFixed;
                Digits := CurrencyDecimals;
            end
            else
            begin
                Format := ffGeneral;
                Digits := 0;
            end;

            Result := FloatToStrF(Value, Format, Precision, Digits);
        end
        else
            Result := FormatFloat(Fmt, Value);
    end;
end;

function TtsDBFloatField.IsCurrency: Boolean;
begin
    Result := TFloatField(DatasetField).Currency;
end;

procedure TtsDBFloatField.SetLookupVarValue(Value: Variant);
var
    DataValue: Double;
begin
    DataValue := Value;
    SetLookupData(@DataValue);
end;

function TtsDBFloatField.SetField(RecBuf: PChar; Value: string): Boolean;
var
    FloatVal: Extended;
begin
    Result := False;
    if Value = '' then
    begin
        Result := True;
        DbiPutField(FGrid.FScrollDataset.FHandle, FieldNo, RecBuf, nil);
    end
    else if TextToFloat(PChar(Value), FloatVal, fvExtended) then
    begin
        Result := True;
        DbiPutField(FGrid.FScrollDataset.FHandle, FieldNo, RecBuf, @FloatVal);
    end;
end;

{TtsDBBCDField}

function TtsDBBCDField.GetAsCurrency: Currency;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsCurrency
        else if not GetValue(Result) then Result := 0;
end;

function TtsDBBCDField.GetAsFloat: Double;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsFloat
        else Result := GetAsCurrency;
end;

function TtsDBBCDField.GetAsInteger: Longint;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsInteger
        else Result := Round(GetAsCurrency);
end;

function TtsDBBCDField.GetAsString: string;
var
    Value: Currency;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsString
        else if GetValue(Value) then Result := CurrToStr(Value) else Result := '';
end;

function TtsDBBCDField.GetAsVariant: Variant;
var
    Value: Currency;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsVariant
        else if GetValue(Value) then Result := Value else Result := Null;
end;

function TtsDBBCDField.GetText(DisplayText: Boolean): string;
var
    Text: string;
    Format: TFloatFormat;
    Digits: Integer;
    Fmt: string;
{$IFDEF TSVER_V6}
    BCD : TBcd;
{$ELSE}
    BCD: FMTBcd;
{$ENDIF}
    Value: Currency;
begin
    Text := '';
    if GetData(@BCD) then
    begin
        if GetBCDToCurr(BCD, Value) then
        begin
            if DisplayText or (EditFormat = '') then
                Fmt := DisplayFormat
            else
                Fmt := EditFormat;

            if Fmt = '' then
            begin
                if IsCurrency then
                begin
                    if DisplayText then Format := ffCurrency
                                   else Format := ffFixed;
                    Digits := CurrencyDecimals;
                end
                else
                begin
                    Format := ffGeneral;
                    Digits := 0;
                end;

                Text := CurrToStrF(Value, Format, Digits);
            end
            else
                Text := FormatCurr(Fmt, Value);
        end
        else
            Text := ResourceStr(SBCDOverflow)
    end;

    Result := Text;
end;

function TtsDBBCDField.GetValue(var Value: Currency): Boolean;
var
{$IFDEF TSVER_V6}
    BCD : TBcd;
{$ELSE}
    BCD: FMTBcd;
{$ENDIF}
begin
    Result := GetData(@BCD);
    if Result then
        if not GetBCDToCurr(BCD, Value) then
            DatabaseError(Format(ResourceStr(SFieldOutOfRange), [DisplayName]));
end;

function TtsDBBCDField.IsCurrency: Boolean;
begin
    Result := TBCDField(DatasetField).Currency;
end;

procedure TtsDBBCDField.SetLookupVarValue(Value: Variant);
var
    DataValue: Currency;
{$IFDEF TSVER_V6}
    BCD : TBcd;
{$ELSE}
    BCD: FMTBcd;
{$ENDIF}
begin
    DataValue := Value;
    GetCurrToBCD(DataValue, BCD, 32, Size);
    SetLookupData(@BCD);
end;

function TtsDBBCDField.SetField(RecBuf: PChar; Value: string): Boolean;
var
    CurrencyVal: System.Currency;
begin
    Result := False;
    if Value = '' then
    begin
        Result := True;
        DbiPutField(FGrid.FScrollDataset.FHandle, FieldNo, RecBuf, nil);
    end
    else if TextToFloat(PChar(Value), CurrencyVal, fvCurrency) then
    begin
        Result := True;
        DbiPutField(FGrid.FScrollDataset.FHandle, FieldNo, RecBuf, @CurrencyVal);
    end;
end;

{TtsDBBooleanField}

constructor TtsDBBooleanField.Create(Grid: TtsCustomDBGrid; Col: TtsDBCol; Field: TField);
begin
    inherited Create(Grid, Col, Field);
    FDisplayValues := '';
    LoadTextValues;
end;

procedure TtsDBBooleanField.LoadTextValues;
begin
    FTextValues[False] := ResourceStr(STextFalse);
    FTextValues[True] := ResourceStr(STextTrue);
end;

procedure TtsDBBooleanField.GetDisplayValues;
var
    I: Integer;
    Value: string;
begin
    Value := TBooleanField(DatasetField).DisplayValues;
    if FDisplayValues = Value then Exit;

    FDisplayValues := Value;
    if Value = '' then
        LoadTextValues
    else
    begin
        I := Pos(';', Value);
        if I = 0 then I := 256;

        FTextValues[False] := Copy(Value, I + 1, 255);
        FTextValues[True] := Copy(Value, 1, I - 1);
    end;
end;

function TtsDBBooleanField.GetAsBoolean: Boolean;
var
    Value: WordBool;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsBoolean
        else if GetData(@Value) then Result := Value else Result := False;
end;

function TtsDBBooleanField.GetAsString: string;
var
    Value: WordBool;
begin
    if FGrid.UseStandardScrolling then
        Result := DatasetField.AsString
    else
    begin
        GetDisplayValues;
        if GetData(@Value) then Result := FTextValues[Value] else Result := '';
    end;
end;

function TtsDBBooleanField.GetAsVariant: Variant;
var
    Value: WordBool;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsVariant
        else if GetData(@Value) then Result := Value else Result := Null;
end;

function TtsDBBooleanField.IsBooleanField: Boolean;
begin
    Result := True;
end;

function TtsDBBooleanField.GetControlType: TtsControlType;
begin
    Result := ctCheck;
end;

procedure TtsDBBooleanField.SetLookupVarValue(Value: Variant);
var
    DataValue: WordBool;
begin
    DataValue := Value;
    SetLookupData(@DataValue);
end;

function TtsDBBooleanField.SetField(RecBuf: PChar; Value: string): Boolean;
var
    ValueLen: Integer;
    BoolVal: WordBool;
begin
    Result := False;
    ValueLen := Length(Value);
    if ValueLen = 0 then
    begin
        Result := True;
        if Length(FTextValues[False]) = 0 then
        begin
            BoolVal := False;
            DbiPutField(FGrid.FScrollDataset.FHandle, FieldNo, RecBuf, @BoolVal);
        end
        else if Length(FTextValues[True]) = 0 then
        begin
            BoolVal := True;
            DbiPutField(FGrid.FScrollDataset.FHandle, FieldNo, RecBuf, @BoolVal);
        end
        else
            DbiPutField(FGrid.FScrollDataset.FHandle, FieldNo, RecBuf, nil);
    end
    else
    begin
        if AnsiCompareText(Value, Copy(FTextValues[False], 1, ValueLen)) = 0 then
        begin
            Result := True;
            BoolVal := False;
            DbiPutField(FGrid.FScrollDataset.FHandle, FieldNo, RecBuf, @BoolVal);
        end
        else if AnsiCompareText(Value, Copy(FTextValues[True], 1, ValueLen)) = 0 then
        begin
            Result := True;
            BoolVal := True;
            DbiPutField(FGrid.FScrollDataset.FHandle, FieldNo, RecBuf, @BoolVal);
        end;
    end;
end;

{TtsDBDateTimeField}

function TtsDBDateTimeField.GetValue(var Value: TDateTime): Boolean;
var
    TimeStamp: TTimeStamp;
    DateRec: TDateRec;
begin
    Result := False;
    Value := 0;
    if not Assigned(FGrid.FScrollDataset) then Exit;

    with FGrid.FScrollDataset do
    begin
        if GetData(@DateRec) then
        begin
            Result := True;
            case DataType of
                ftDate:
                    begin
                        TimeStamp.Time := 0;
                        TimeStamp.Date := DateRec.Date;
                    end;

                ftTime:
                    begin
                        TimeStamp.Time := DateRec.Time;
                        TimeStamp.Date := DateDelta;
                    end;
                else
                    try
                        TimeStamp := MSecsToTimeStamp(DateRec.DateTime);
                    except
                        TimeStamp.Time := 0;
                        TimeStamp.Date := 0;
                    end;
            end;
            Value := TimeStampToDateTime(TimeStamp);
        end;
    end;
end;

function TtsDBDateTimeField.GetAsDateTime: TDateTime;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsDateTime
        else if not GetValue(Result) then Result := 0;
end;

function TtsDBDateTimeField.GetAsFloat: Double;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsFloat
        else Result := GetAsDateTime;
end;

function TtsDBDateTimeField.GetAsString: string;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsString
        else Result := GetText(False);
end;

function TtsDBDateTimeField.GetAsVariant: Variant;
var
    Value: TDateTime;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsVariant
        else if GetValue(Value) then Result := VarFromDateTime(Value) else Result := Null;
end;

function TtsDBDateTimeField.GetText(DisplayText: Boolean): string;
var
    Fmt: string;
    DateTime: TDateTime;
begin
    Result := '';
    if GetValue(DateTime) then
    begin
        Fmt := '';
        if DisplayText and (DisplayFormat <> '') then
            Fmt := DisplayFormat
        else
        begin
            case DataType of
                ftDate: Fmt := ShortDateFormat;
                ftTime: Fmt := LongTimeFormat;
            end;
        end;

        DateTimeToString(Result, Fmt, DateTime);
    end;
end;

function TtsDBDateTimeField.GetDisplayFormat: string;
begin
    Result := TDateTimeField(DatasetField).DisplayFormat;
end;

procedure TtsDBDateTimeField.SetLookupVarValue(Value: Variant);
var
    TimeStamp: TTimeStamp;
    Data: TDateTimeRec;
begin
    TimeStamp := DateTimeToTimeStamp(VarToDateTime(Value));
    case DataType of
        ftDate: Data.Date := TimeStamp.Date;
        ftTime: Data.Time := TimeStamp.Time;
    else
        Data.DateTime := TimeStampToMSecs(TimeStamp);
    end;

    SetLookupData(@Data);
end;

function TtsDBDateTimeField.SetField(RecBuf: PChar; Value: string): Boolean;
var
    DateTime: TDateTime;
    Data: TDateTimeRec;
    TimeStamp: TTimeStamp;
begin
    Result := False;
    if Value = '' then
    begin
        Result := True;
        DbiPutField(FGrid.FScrollDataset.FHandle, FieldNo, RecBuf, nil);
    end
    else
    begin
        case DataType of
            ftDate: DateTime := StrToDate(Value);
            ftTime: DateTime := StrToTime(Value);
        else
            DateTime := StrToDateTime(Value);
        end;

        TimeStamp := DateTimeToTimeStamp(DateTime);
        case DataType of
            ftDate: Data.Date := TimeStamp.Date;
            ftTime: Data.Time := TimeStamp.Time;
        else
            Data.DateTime := TimeStampToMSecs(TimeStamp);
        end;

        DbiPutField(FGrid.FScrollDataset.FHandle, FieldNo, RecBuf, @Data);
    end;
end;

{TtsDBBinaryField}

function TtsDBBinaryField.GetAsVariant: Variant;
var
    Data: Pointer;
begin
    if FGrid.UseStandardScrolling then
        Result := DatasetField.AsVariant
    else
    begin
        Result := VarArrayCreate([0, DataSize - 1], varByte);
        Data := VarArrayLock(Result);
        try
            GetData(Data);
        finally
            VarArrayUnlock(Result);
        end;
    end;
end;

function TtsDBBinaryField.GetAsString: string;
begin
    if FGrid.UseStandardScrolling then
        Result := DatasetField.AsString
    else
    begin
        SetLength(Result, DataSize);
        if not GetData(PChar(Result)) then ZeroMemory(PChar(Result), DataSize);
    end;
end;

function TtsDBBinaryField.GetText(DisplayText: Boolean): string;
begin
    Result := AsString;
end;

{TtsDBBlobField}

procedure TtsDBBlobField.Assign(Source: TPersistent);
begin
    if not FieldEditOk then Exit;
    if Source is TtsDBBlobField then
        LoadFromBlob(TtsDBBlobField(Source))
    else
        TBlobField(DatasetField).Assign(Source);
end;

procedure TtsDBBlobField.LoadFromBlob(Blob: TtsDBBlobField);
var
    BlobStream: TtsDBBlobStream;
begin
    BlobStream := TtsDBBlobStream.Create(Self, bmWrite);
    try
        Blob.SaveToStream(BlobStream);
    finally
        BlobStream.Free;
    end;
end;

procedure TtsDBBlobField.SaveToBitmap(Bitmap: TBitmap);
var
    Blob: TtsDBBlobStream;
    Size: Longint;
    Header: TGraphicHeader;
begin
    Blob := TtsDBBlobStream.Create(Self, bmRead);
    try
        Size := Blob.Size;
        if Size >= SizeOf(TGraphicHeader) then
        begin
            Blob.Read(Header, SizeOf(Header));
            if (Header.Count <> 1) or (Header.HType <> $0100) or
               (Header.Size <> Size - SizeOf(Header)) then
                Blob.Position := 0;
        end;

        Bitmap.LoadFromStream(Blob);

    finally
        Blob.Free;
    end;
end;

procedure TtsDBBlobField.SaveToFile(const FileName: string);
var
    Stream: TStream;
begin
    Stream := TFileStream.Create(FileName, fmCreate);
    try
        SaveToStream(Stream);
    finally
        Stream.Free;
    end;
end;

procedure TtsDBBlobField.SaveToStream(Stream: TStream);
var
    Blob: TStream;
begin
    if FGrid.UseStandardScrolling then
        TBlobField(DatasetField).SaveToStream(Stream)
    else
    begin
        Blob := TtsDBBlobStream.Create(Self, bmRead);
        try
            Stream.CopyFrom(Blob, 0);
        finally
            Blob.Free;
        end;
    end;
end;

procedure TtsDBBlobField.SaveToStrings(Strings: TStrings);
var
    Blob: TtsDBBlobStream;
begin
    Blob := TtsDBBlobStream.Create(Self, bmRead);
    try
        Strings.LoadFromStream(Blob);
    finally
        Blob.Free;
    end;
end;

procedure TtsDBBlobField.AssignTo(Dest: TPersistent);
begin
    if FGrid.UseStandardScrolling then
        Dest.Assign(DatasetField)
    else
    begin
        if Dest is TBitmap then
            SaveToBitmap(TBitmap(Dest))
        else if Dest is TPicture then
            SaveToBitmap(TPicture(Dest).Bitmap)
        else if Dest is TStrings then
            SaveToStrings(TStrings(Dest))
        else
            inherited AssignTo(Dest);
    end;
end;

function TtsDBBlobField.GetAsString: string;
var
    Length: Integer;
    Blob: TStream;
begin
    if FGrid.UseStandardScrolling then
        Result := TBlobField(DatasetField).AsString
    else
    begin
        Blob := TtsDBBlobStream.Create(Self, bmRead);
        try
            with Blob do
            begin
                Length := Size;
                SetString(Result, nil, Length);
                ReadBuffer(Pointer(Result)^, Length);
            end;
        finally
            Blob.Free;
        end;
    end;
end;

function TtsDBBlobField.GetAsVariant: Variant;
begin
    if FGrid.UseStandardScrolling
        then Result := DatasetField.AsVariant
        else Result := GetAsString;
end;

{TtsDBMemoField}

function TtsDBMemoField.GetDisplayText: string;
begin
    Result := '';
    if not FGrid.UseStandardScrolling then
    begin
        Result := inherited GetDisplayText;
        Exit;
    end;

    if Assigned(DatasetField.OnGetText)
        then DatasetField.OnGetText(DatasetField, Result, True)
        else Result := AsString;
end;

function TtsDBMemoField.GetEditText: string;
begin
    Result := '';
    if not FGrid.UseStandardScrolling then
    begin
        Result := inherited GetEditText;
        Exit;
    end;

    if Assigned(DatasetField.OnGetText)
        then DatasetField.OnGetText(DatasetField, Result, False)
        else Result := AsString;
end;

function TtsDBMemoField.GetTransliterate: Boolean;
begin
    Result := TMemoField(DatasetField).Transliterate;
end;

procedure TtsDBMemoField.SetTransliterate(Value: Boolean);
begin
    TMemoField(DatasetField).Transliterate := Value;
end;

{TtsDBGraphicField}

function TtsDBGraphicField.GetControlType: TtsControlType;
begin
    Result := ctPicture;
end;

{TtsDBBlobStream}

constructor TtsDBBlobStream.Create(Field: TtsDBBlobField; Mode: TBlobStreamMode);
begin
    FField := Field;
    FScrollDataset := Field.FGrid.FScrollDataset;
    FPosition := 0;
    FOpened := True;
    FBlobStream := nil;

    if (Mode <> bmRead) then
        FBlobStream := TBlobStream.Create(TBlobField(FFIeld.DatasetField), Mode)
    else
    begin
        with FScrollDataset do
        begin
            if FField.FGrid.Editing and
               (CompareBkm(FDataset.Bookmark, ActiveBookmark) = 0) then
                FBlobStream := TBlobStream.Create(TBlobField(FField.DatasetField), bmRead)
            else
            begin
                SetToRecord(ActiveRecord);
                Self.FBuffer := ActiveRecordBuffer;
                CheckErr(DbiOpenBlob(Handle, Self.FBuffer, FField.FieldNo, dbiReadOnly));
            end;
        end;
    end;
end;

destructor TtsDBBlobStream.Destroy;
begin
    if FOpened and not Assigned(FBlobStream) then
        DbiFreeBlob(FScrollDataSet.Handle, FBuffer, FField.FieldNo);
    FBlobStream.Free;
    inherited Destroy;
end;

function TtsDBBlobStream.GetBlobSize: Longint;
var
    Err: DbiResult;
begin
    Result := 0;
    if FOpened and not Assigned(FBlobStream) then
    begin
        Err := DbiGetBlobSize(FScrollDataSet.Handle, FBuffer, FField.FieldNo, Result);
        FScrollDataset.CheckErr(Err);
    end;
end;

function TtsDBBlobStream.Read(var Buffer; Count: Longint): Longint;
var
    DbiErr: DBIResult;
begin
    if Assigned(FBlobStream) then
    begin
        Result := FBlobStream.Read(Buffer, Count);
        Exit;
    end;

    Result := 0;
    if FOpened then
    begin
        DbiErr := DbiGetBlob(FScrollDataSet.Handle, FBuffer, FField.FieldNo, FPosition,
                             Count, @Buffer, Result);
        case DbiErr of
            DBIERR_NONE, DBIERR_ENDOFBLOB:
            begin
                if FField.Transliterate then
                    NativeToAnsiBuf(FScrollDataSet.Locale, @Buffer, @Buffer, Result);
                Inc(FPosition, Result);
            end;
            DBIERR_INVALIDBLOBOFFSET:;
        else
            DbiError(DbiErr);
        end;
    end;
end;

function TtsDBBlobStream.Write(const Buffer; Count: Longint): Longint;
begin
  Result := 0;
  if Assigned(FBlobStream) then Result := FBlobStream.Write(Buffer, Count);
end;

function TtsDBBlobStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
    if Assigned(FBlobStream) then
    begin
        Result := FBlobStream.Seek(Offset, Origin);
        Exit;
    end;

    case Origin of
        0: FPosition := Offset;
        1: Inc(FPosition, Offset);
        2: FPosition := GetBlobSize + Offset;
    end;

    Result := FPosition;
end;

{TtsFieldLayout}

constructor TtsFieldLayout.Create;
begin
    inherited Create;

    FFieldName := '';
    FDisplayLabel := '';
    FDisplayWidth := 0;
    FReadOnly := False;
    FVisible := False;
    FDisplayValues := '';
end;

procedure TtsFieldLayout.AssignFieldLayout(Field: TField);
begin
    FFieldName := Field.FieldName;
    FDisplayLabel := Field.DisplayLabel;
    FDisplayWidth := Field.DisplayWidth;
    FReadOnly := Field.ReadOnly;
    FVisible := Field.Visible;

    FDisplayValues := '';
    if Field is TBooleanField then FDisplayValues := TBooleanField(Field).DisplayValues;
end;

function TtsFieldLayout.FieldLayoutEqual(Field: TField): Boolean;
var
    Values: string;
begin
    Result := (FFieldName = Field.FieldName) and
              (FDisplayLabel = Field.DisplayLabel) and
              (FDisplayWidth = Field.DisplayWidth) and
              (FReadOnly = Field.ReadOnly) and
              (FVisible = Field.Visible);

    if Result then
    begin
        Values := '';
        if Field is TBooleanField then Values := TBooleanField(Field).DisplayValues;
        Result := FDisplayValues = Values;
    end;
end;

{TtsDBCol}

constructor TtsDBCol.Create(Grid: TtsBaseGrid);
begin
    inherited Create(Grid);
    FDBField := nil;
    FFieldName := '';
    FAssignedValues := [];
end;

destructor TtsDBCol.Destroy;
begin
    if Assigned(FDBField) and (FDBField.FCol = Self) then FDBField.FCol := nil;
    inherited Destroy;
end;

function TtsDBCol.DefaultProps: Boolean;
begin
    Result := inherited DefaultProps;
    if Result then Result := (FAssignedValues = []);
end;

procedure TtsDBCol.AssignProperties(Source: TtsCol);
begin
    inherited AssignProperties(Source);
    if Source is TtsDBCol then
    begin
        SetField(TtsDBCol(Source).DatasetField);
        FAssignedValues := TtsDBCol(Source).FAssignedValues;
    end;
end;

procedure TtsDBCol.Assign(Source: TPersistent);
var
    OldWidth: Integer;
    Invalidated: Boolean;
begin
    if Source is TtsDBCol then
    begin
        if Source <> Self then
        begin
            OldWidth := FWidth;
            AssignProperties(TtsDBCol(Source));
            CheckWidth(OldWidth);

            Invalidated := Grid.CheckInvalidateCol(DisplayCol);
            if Invalidated and (Grid.CurDisplayCol = DisplayCol) then
                Grid.RedisplayControl(True);
        end;
    end
    else
        inherited;
end;

function TtsDBCol.Lookup: Boolean;
begin
    Result := False;
    if not Assigned(Field) then Exit;
    Result := Field.DatasetField.Lookup;
end;

procedure TtsDBCol.Reset(Properties: TtsProperties);
begin
    inherited;

    if prWidth in Properties then ResetWidth;
    if prVisible in Properties then ResetVisible;
    if prAlignment in Properties then ResetAlignment;
    if prMaxLength in Properties then ResetMaxLength;
    if prAllowGrayed in Properties then ResetAllowGrayed;
end;

procedure TtsDBCol.SetFieldName(Value: string);
var
    AField: TField;
begin
    if FFieldName <> Value then
    begin
        AField := nil;

        if Assigned(Grid.DataLink.DataSet) and
           not (csLoading in Grid.ComponentState) and (Length(Value) > 0) then
            AField := Grid.DataLink.DataSet.FindField(Value);

        FFieldName := Value;
        SetField(AField);

        Grid.InvalidateCol(DisplayCol);
        if (Grid.CurDisplayCol = DisplayCol) then
        begin
            Grid.RedisplayControl(True);
        end;
    end;
end;

procedure TtsDBCol.ResetField(ResetFieldName: Boolean);
begin
    FDBField := nil;
    if (Grid.FieldState <> fsCustomized) and ResetFieldName then FFieldName := '';
end;

function TtsDBCol.SetField(Value: TField): Boolean;
var
    Index: Integer;
begin
    Result := False;
    if DatasetField <> Value then
    begin
        Result := True;
        ResetField(True);

        if Value <> nil then
        begin
            Index := Grid.FFieldList.FieldIndex(Value);
            if (Index >= 0) and (Index < Grid.FFieldList.Count) then
            begin
                FDBField := Grid.FFieldList[Index];
                FDBField.FCol := Self;
                FFieldName := FDBField.FieldName;
            end;
        end;
    end;
end;

procedure TtsDBCol.SetDatasetField(Value: TField);
begin
    if SetField(Value) then
    begin
        Grid.InvalidateCol(DisplayCol);
        if (Grid.CurDisplayCol = DisplayCol) then
        begin
            Grid.RedisplayControl(True);
        end;
    end;
end;

function TtsDBCol.GetDatasetField: TField;
begin
    Result := nil;
    if Assigned(Field) then Result := Field.DatasetField;
end;

function TtsDBCol.GetDBGrid: TtsCustomDBGrid;
begin
    Result := TtsCustomDBGrid(inherited Grid);
end;

function TtsDBCol.GetHeading: string;
begin
    Result := FHeading;
    if (Result = '') and Assigned(Field) then Result := Field.DisplayLabel;
    if (Result = '') and Assigned(Field) then Result := Field.FieldName;
    if (Result = '') then Result := FFieldName;
end;

function TtsDBCol.GetAlignment: TAlignment;
begin
    Result := taLeftJustify;
    if (not Assigned(Field)) or (avAlignment in FAssignedValues) then
        Result := inherited GetAlignment
    else if Assigned(Field) then
        Result := Field.Alignment;
end;

function TtsDBCol.GetHorzAlignment: TtsHorzAlignment;
begin
    Result := htaDefault;
    if (not Assigned(Field)) or (avAlignment in FAssignedValues) then
        Result := inherited GetHorzAlignment
    else if Assigned(Field) then
        Result := AlignmentToHorzAlignment(Field.Alignment, True);
end;

function TtsDBCol.GetMaxTextWidth : Integer;
var theTopRow, theCurrentRow : Variant;
    iWidth : Integer;
begin
  Result := 0;
  if (not Assigned(Field)) then
     Result := inherited GetMaxTextWidth
  else if (Grid.DataSource <> Nil) and
          (Grid.DataSource.DataSet <> Nil) and
          (Grid.DataSource.DataSet.Active) then
  begin
     theTopRow := Grid.TopRow;
     theCurrentRow := Grid.CurrentDataRow;
     with Grid do
     begin
       Grid.EnableRedraw := False;
       try
         with Grid.DataSource.DataSet do
         begin
           First;
           while not eof do
           begin
             iWidth := Grid.CellTextWidth[DataCol, Bookmark];
             if (iWidth > Result) then
                Result := iWidth;
             Next;
           end;
         end;
       finally
         Grid.TopRow := theTopRow;
         Grid.CurrentDataRow := theCurrentRow;
         Grid.EnableRedraw := True;
       end;
     end;
  end;
end;

function TtsDBCol.GetReadOnly: Boolean;
begin
    Result := inherited GetReadOnly;
    if Assigned(Field) then Result := Result or Field.ReadOnly
end;

procedure TtsDBCol.SetAlignment(Value: TAlignment);
var
    OldAlignment: TAlignment;
begin
    OldAlignment := Alignment;
    Include(FAssignedValues, avAlignment);
    inherited SetAlignment(Value);

    if OldAlignment <> Alignment then
    begin
        Grid.InvalidateCol(DisplayCol);
        if (Grid.CurDisplayCol = DisplayCol) then Grid.RedisplayControl(True);
    end;
end;

procedure TtsDBCol.SetHorzAlignment(Value: TtsHorzAlignment);
var
    OldAlignment: TtsHorzAlignment;
begin
    OldAlignment := HorzAlignment;
    Include(FAssignedValues, avAlignment);
    inherited SetHorzAlignment(Value);

    if OldAlignment <> HorzAlignment then
    begin
        Grid.InvalidateCol(DisplayCol);
        if (Grid.CurDisplayCol = DisplayCol) then Grid.RedisplayControl(True);
    end;
end;

procedure TtsDBCol.SetWidth(Value: Integer);
begin
    Include(FAssignedValues, avWidth);
    inherited SetWidth(Value);
end;

procedure TtsDBCol.SetVisible(Value: Boolean);
begin
    Include(FAssignedValues, avVisible);
    inherited SetVisible(Value);
end;

procedure TtsDBCol.SetMaxLength(Value: Integer);
begin
    Include(FAssignedValues, avMaxLength);
    inherited SetMaxLength(Value);
end;

procedure TtsDBCol.SetControlType(Value: TtsControlType);
begin
    Include(FAssignedValues, avControlType);
    inherited SetControlType(Value);
end;

procedure TtsDBCol.SetAllowGrayed(Value: Boolean);
begin
    Include(FAssignedValues, avAllowGrayed);
    inherited SetAllowGrayed(Value);
end;

procedure TtsDBCol.SetDBCombo(Value: TtsDBCombo);
begin
    inherited SetCombo(Value);
end;

function TtsDBCol.GetDBCombo: TtsDBCombo;
begin
    Result := TtsDBCombo(inherited GetCombo);
end;

procedure TtsDBCol.SetComboDataSource(Value: TDatasource);
begin
    if Assigned(Combo) then Combo.Grid.Datasource := Value;
end;

function TtsDBCol.GetComboDataSource: TDatasource;
begin
    Result := nil;
    if Assigned(Combo) then Result := Combo.Grid.Datasource;
end;

function TtsDBCol.UseCheckBoxValues: Boolean;
begin
    Result := inherited UseCheckBoxValues;
    if Result and Assigned(Field) then Result := not (Field.IsIntegerField or Field.IsBooleanField);
end;

procedure TtsDBCol.WriteAssignedValues(Writer: TWriter);
var
    PropStr: string;
begin
    SetString(PropStr, PChar(@FAssignedValues), SizeOf(FAssignedValues));
    Writer.WriteString(PropStr);
end;

procedure TtsDBCol.ReadAssignedValues(Reader: TReader);
var
    PropStr: string;
begin
    PropStr := Reader.ReadString;
    FAssignedValues := [];
    CopyMemory(@FAssignedValues, PChar(PropStr), CalcMin(SizeOf(FAssignedValues), Length(PropStr)));
    InitField;
end;

procedure TtsDBCol.DefineProperties(Filer: TFiler);
begin
    inherited;
    with Filer do
    begin
        DefineProperty('AssignedValues', ReadAssignedValues, WriteAssignedValues, True);
    end;
end;

procedure TtsDBCol.ResetAlignment;
begin
    if avAlignment in FAssignedValues then
    begin
        Exclude(FAssignedValues, avAlignment);
        Grid.InvalidateCol(DisplayCol);
        if (Grid.CurDisplayCol = DisplayCol) then Grid.RedisplayControl(True);
    end;
end;

procedure TtsDBCol.ResetAllowGrayed;
begin
    if avAllowGrayed in FAssignedValues then
    begin
        Exclude(FAssignedValues, avAllowGrayed);
        SetDefaultAllowGrayed;
    end;
end;

procedure TtsDBCol.ResetControlType;
begin
    if avControlType in FAssignedValues then
    begin
        Exclude(FAssignedValues, avControlType);
        SetDefaultControlType;
    end;
end;

procedure TtsDBCol.ResetWidth;
begin
    if avWidth in FAssignedValues then
    begin
        Exclude(FAssignedValues, avWidth);
        SetDefaultWidth;
    end;
end;

procedure TtsDBCol.ResetVisible;
begin
    if avVisible in FAssignedValues then
    begin
        Exclude(FAssignedValues, avVisible);
        if Field <> nil then inherited SetVisible(Field.Visible);
    end;
end;

procedure TtsDBCol.ResetMaxLength;
begin
    if avMaxLength in FAssignedValues then
    begin
        Exclude(FAssignedValues, avMaxLength);
        if Field <> nil then inherited SetMaxLength(Field.MaxLength);
    end;
end;

function TtsDBCol.DefaultWidth: Integer;
var
    Width: Integer;
    RestoreCanvas: Boolean;
    Tm: TTextMetric;
begin
    if not Assigned(Field) then
    begin
        Result := Grid.DefaultColWidth;
        Exit;
    end;

    RestoreCanvas := not Grid.HandleAllocated;
    if RestoreCanvas then Grid.Canvas.Handle := GetDC(0);

    try
        if (FFont <> nil) and (not ParentFont) then
            Grid.Canvas.Font := Self.FFont
        else
            Grid.Canvas.Font := Grid.Font;

        GetTextMetrics(Grid.Canvas.Handle, TM);
        Result := Field.DisplayWidth * (Grid.Canvas.TextWidth('0') - TM.tmOverhang) + TM.tmOverhang + 6;
        if Grid.HeadingOn then
        begin
            Width := Grid.Canvas.TextWidth(Heading) + 6;
            if Result < Width then Result := Width;
        end;
    finally
        if RestoreCanvas then
        begin
            ReleaseDC(0, Grid.Canvas.Handle);
            Grid.Canvas.Handle := 0;
        end;
    end;
end;

procedure TtsDBCol.SetDefaultWidth;
begin
    if not (avWidth in FAssignedValues) then
    begin
        inherited SetWidth(DefaultWidth);
        Exclude(FAssignedValues, avWidth);
    end;
end;

procedure TtsDBCol.SetDefaultVisible;
begin
    if not (avVisible in FAssignedValues) then
    begin
        if Assigned(Field) then
        begin
            inherited SetVisible(Field.Visible);
            Exclude(FAssignedValues, avVisible);
        end;
    end;
end;

procedure TtsDBCol.SetDefaultControlType;
begin
    if not (avControlType in FAssignedValues) then
    begin
        if Assigned(Field) then
        begin
            inherited ControlType := Field.ControlType;
            Exclude(FAssignedValues, avControlType);
        end;
    end;
end;

procedure TtsDBCol.SetDefaultMaxLength;
begin
    if not (avMaxLength in FAssignedValues) then
    begin
        if Assigned(Field) then
        begin
            inherited MaxLength := Field.MaxLength;
            Exclude(FAssignedValues, avMaxLength);
        end;
    end;
end;

procedure TtsDBCol.SetDefaultAllowGrayed;
begin
    if not (avAllowGrayed in FAssignedValues) then
    begin
        if Assigned(Field) then
        begin
            if DatasetField is TBooleanField then
                inherited AllowGrayed := not TBooleanField(DatasetField).Required;
            Exclude(FAssignedValues, avAllowGrayed);
        end;
    end;
end;

procedure TtsDBCol.InitField;
begin
    if Assigned(Field) then
    begin
        SetDefaultWidth;
        SetDefaultVisible;
        SetDefaultControlType;
        SetDefaultMaxLength;
        SetDefaultAllowGrayed;
    end;
end;

{TtsFieldList}

constructor TtsFieldList.Create(Grid: TtsCustomDBGrid);
begin
    inherited Create;
    FGrid := Grid;
end;

destructor TtsFieldList.Destroy;
begin
    Reset;
    inherited Destroy;
end;

procedure TtsFieldList.Reset;
var
    I: Integer;
begin
    for I := 1 to Count do
    begin
        TtsDBField(Items[I-1]).Free;
        Items[I-1] := nil;
    end;
    Count := 0;
end;

function TtsFieldList.CreateField(Value: TField): TtsDBField;
begin
    if Value is TStringField then
        Result := TtsDBStringField.Create(Grid, nil, Value)
    else if Value is TIntegerField then
        Result := TtsDBIntegerField.Create(Grid, nil, Value)
    else if Value is TSmallintField then
        Result := TtsDBSmallintField.Create(Grid, nil, Value)
    else if Value is TWordField then
        Result := TtsDBWordField.Create(Grid, nil, Value)
    else if Value is TAutoIncField then
        Result := TtsDBAutoIncField.Create(Grid, nil, Value)
    else if Value is TFloatField then
        Result := TtsDBFloatField.Create(Grid, nil, Value)
    else if Value is TCurrencyField then
        Result := TtsDBCurrencyField.Create(Grid, nil, Value)
    else if Value is TBCDField then
        Result := TtsDBBCDField.Create(Grid, nil, Value)
    else if Value is TBooleanField then
        Result := TtsDBBooleanField.Create(Grid, nil, Value)
    else if Value is TDateTimeField then
        Result := TtsDBDateTimeField.Create(Grid, nil, Value)
    else if Value is TDateField then
        Result := TtsDBDateField.Create(Grid, nil, Value)
    else if Value is TTimeField then
        Result := TtsDBTimeField.Create(Grid, nil, Value)
    else if Value is TBinaryField then
        Result := TtsDBBinaryField.Create(Grid, nil, Value)
    else if Value is TBytesField then
        Result := TtsDBBytesField.Create(Grid, nil, Value)
    else if Value is TVarBytesField then
        Result := TtsDBVarBytesField.Create(Grid, nil, Value)
    else if Value is TMemoField then
        Result := TtsDBMemoField.Create(Grid, nil, Value)
    else if Value is TGraphicField then
        Result := TtsDBGraphicField.Create(Grid, nil, Value)
    else if Value is TBlobField then
    begin
      if TBlobField(Value).BlobType = ftGraphic then
         Result := TtsDBGraphicField.Create(Grid, nil, Value)
      else
         Result := TtsDBBlobField.Create(Grid, nil, Value);
    end
    else
        Result := TtsDBField.Create(Grid, nil, Value);
end;

procedure TtsFieldList.CreateFields;
var
    I: Integer;
    Cnt: Integer;
begin
    Reset;
    if not Assigned(Grid.Dataset) then Exit;
    if not Grid.Dataset.Active and Grid.Dataset.DefaultFields then Exit;

    with Grid.Dataset do
    begin
        Cnt := FieldCount;
        for I := 1 to Cnt do
        begin
            Self.Count := Self.Count + 1;
            Items[I-1] := CreateField(Fields[I-1]);
        end;
    end;
end;

function TtsFieldList.FindField(FieldName: string): TtsDBField;
var
    I: Integer;
begin
    Result := nil;
    I := 0;
    while I < Count do
    begin
        if AnsiCompareText(FieldName, TtsDBField(Items[I]).FieldName) = 0 then
        begin
            Result := Items[I];
            Break;
        end;
        Inc(I);
    end;
end;

function TtsFieldList.FieldIndex(Field: TField): Integer;
var
    I: Integer;
begin
    Result := -1;
    for I := 0 to Count - 1 do
    begin
        if TtsDBField(Items[I]).DatasetField = Field then
        begin
            Result := I;
            Break;
        end;
    end;
end;

{TtsDBCellCollection}

function TtsDBCellCollection.CreateCell(Grid: TtsBaseGrid): TtsCell;
begin
    Result := TtsDBCell.Create(Grid, 0, '');
end;

procedure TtsDBCellCollection.ApplyProps;
var
    I: Integer;
    Cell: TtsDBCell;
begin
    TtsCustomDBGrid(Grid).FApplyBoundProps := True;
    try
        for I := 0 to Count - 1 do
        begin
            Cell := TtsDBCellItem(Items[0]).Cell;
            Cell.DataCol := TtsDBCellItem(Items[0]).DataCol;
            Cell.DataRow := TtsDBCellItem(Items[0]).DataRow;

            Cell.Assign(Cell);
            Items[0].Destroy;
        end;
    finally
        TtsCustomDBGrid(Grid).FApplyBoundProps := False;
    end;
end;

{TtsDBCellItem}

constructor TtsDBCellItem.Create(Collection: TCollection);
begin
    inherited;
    if (not TtsDBCellCollection(Collection).Grid.Reading)
        then FCell := TtsDBCell(TtsDBCellCollection(Collection).Cell)
        else FCell := TtsDBCell.Create(TtsDBCellCollection(Collection).Grid, 0, '');

    FDataCol := 0;
    FDataRow := '';
end;

destructor TtsDBCellItem.Destroy;
begin
    if FCell <> TtsDBCellCollection(Collection).Cell then
        FCell.Free;
    inherited;
end;

function TtsDBCellItem.GetCell: TtsDBCell;
begin
    FCell.DataCol := FDataCol;
    FCell.DataRow := FDataRow;
    Result := FCell;
end;

procedure TtsDBCellItem.WriteDataRow(Writer: TWriter);
begin
    WriteVariant(Writer, DataRow);
end;

procedure TtsDBCellItem.ReadDataRow(Reader: TReader);
begin
    DataRow := ReadVariant(Reader);
end;

procedure TtsDBCellItem.DefineProperties(Filer: TFiler);
begin
    inherited;
    with Filer do
    begin
        DefineProperty('DataRow', ReadDataRow, WriteDataRow, True);
    end;
end;

{TtsDBRowCollection}

constructor TtsDBRowCollection.Create(Grid: TtsBaseGrid; ItemClass: TCollectionItemClass);
begin
    inherited Create(Grid, ItemClass);
    FRow := CreateRow(Grid);
end;

function TtsDBRowCollection.CreateRow(Grid: TtsBaseGrid): TtsDBRow;
begin
    Result := TtsDBRow.Create(Grid, '');
end;

destructor TtsDBRowCollection.Destroy;
begin
    FRow.Free;
    inherited;
end;

procedure TtsDBRowCollection.ApplyProps;
var
    I: Integer;
    Row: TtsDBRow;
begin
    TtsCustomDBGrid(Grid).FApplyBoundProps := True;
    try
        for I := 0 to Count - 1 do
        begin
            Row := TtsDBRowItem(Items[0]).Row;
            Row.DataRow := TtsDBRowItem(Items[0]).DataRow;

            Row.Assign(Row);
            Items[0].Destroy;
        end;
    finally
        TtsCustomDBGrid(Grid).FApplyBoundProps := False;
    end;
end;

{TtsDBRowItem}

constructor TtsDBRowItem.Create(Collection: TCollection);
begin
    inherited;
    if (not TtsDBRowCollection(Collection).Grid.Reading)
        then FRow := TtsDBRow(TtsDBRowCollection(Collection).Row)
        else FRow := TtsDBRow.Create(TtsDBRowCollection(Collection).Grid, '');
    FDataRow := '';
end;

destructor TtsDBRowItem.Destroy;
begin
    if FRow <> TtsDBRowCollection(Collection).Row then FRow.Free;
    inherited;
end;

function TtsDBRowItem.GetRow: TtsDBRow;
begin
    FRow.DataRow := FDataRow;
    Result := FRow;
end;

procedure TtsDBRowItem.WriteDataRow(Writer: TWriter);
begin
    WriteVariant(Writer, DataRow);
end;

procedure TtsDBRowItem.ReadDataRow(Reader: TReader);
begin
    DataRow := ReadVariant(Reader);
end;

procedure TtsDBRowItem.DefineProperties(Filer: TFiler);
begin
    inherited;
    with Filer do
    begin
        DefineProperty('DataRow', ReadDataRow, WriteDataRow, True);
    end;
end;

{TtsGridData}

constructor TtsGridData.Create(Grid: TtsCustomDBGrid);
begin
    inherited Create;
    FGrid := Grid;
    FDataset := nil;
    FDatalink := Grid.Datalink;
    FFieldLayout := TList.Create;
    FPropBuffer := nil;
    FPropBufSize := 0;
    FPropBufferCleared := False;
    FIndexName := '';
    FIndexFieldNames := '';
end;

destructor TtsGridData.Destroy;
begin
    ResetFieldLayout;
    FFieldLayout.Free;
    ReallocMem(FPropBuffer, 0);
    inherited Destroy;
end;

procedure TtsGridData.ResetFieldLayout;
var
    I: Integer;
begin
    for I := 1 to FFieldLayout.Count do TtsFieldLayout(FFieldLayout[I-1]).Free;
    FFieldLayout.Count := 0;
end;

procedure TtsGridData.SaveFieldLayout;
var
    I: Integer;
begin
    if not Assigned(Dataset) then begin ResetFieldLayout; Exit; end;

    try
        FFieldLayout.Count := Dataset.FieldCount;
        for I := 1 to Dataset.FieldCount do
        begin
            if not Assigned(FFieldLayout[I-1]) then FFieldLayout[I-1] := TtsFieldLayout.Create;
            TtsFieldLayout(FFieldLayout[I-1]).AssignFieldLayout(Dataset.Fields[I-1]);
        end;
    except
        on Exception do begin ResetFieldLayout; raise; end;
    end;
end;

function TtsGridData.FieldLayoutChanged: Boolean;
var
    I: Integer;
    Layout: TtsFieldLayout;
    Changed: Boolean;
begin
    if not Assigned(Dataset) then
    begin
        Result := FFieldLayout.Count <> 0;
        Exit;
    end;

    Changed := FFieldLayout.Count <> Dataset.FieldCount;
    if not Changed then
    begin
        for I := 1 to Dataset.FieldCount do
        begin
            Layout := FFieldLayout[I-1];
            Changed := not Layout.FieldLayoutEqual(Dataset.Fields[I-1]);
            if Changed then Break;
        end;
    end;

    Result := Changed;
end;

function TtsGridData.FieldOrderChanged: Boolean;
var
    I, Count: Integer;
    Layout: TtsFieldLayout;
    Changed: Boolean;
begin
    Result := False;
    if not Assigned(Dataset) then Exit;

    Changed := False;
    Count := CalcMin(FFieldLayout.Count, Dataset.FieldCount);
    for I := 1 to Count do
    begin
        Layout := FFieldLayout[I-1];
        Changed := Layout.FieldName <> Dataset.Fields[I-1].FieldName;
        if Changed then Break;
    end;

    Result := Changed;
end;

function TtsGridData.DatasetIndexName: string;
begin
    Result := '';
    if not Assigned(FDataset) then Exit;
    if FDataset is TTable then Result := TTable(FDataset).IndexName;
end;

function TtsGridData.DatasetIndexFieldNames: string;
begin
    Result := '';
    if not Assigned(FDataset) then Exit;
    if FDataset is TTable then Result := TTable(FDataset).IndexFieldNames;
end;

function TtsGridData.IndexChanged: Boolean;
begin
    Result := False;
    if not Active then Exit;
    Result := (FIndexName <> DatasetIndexName) or
              (FIndexFieldNames <> DatasetIndexFieldNames);
end;

procedure TtsGridData.SaveCurIndex;
begin
    FIndexName := DatasetIndexName;
    FIndexFieldNames := DatasetIndexFieldNames;
end;

procedure TtsGridData.InitGridDataSet;
begin
    FIndexName := '';
    FIndexFieldNames := '';
end;

function TtsGridData.CompareBkm(Bkm1: TBookmarkStr; Bkm2: TBookmarkStr): Integer;
begin
    Result := DatasetCompBkm(FGrid.Datalink.Dataset, Bkm1, Bkm2, FGrid.BookmarkCompareType);
end;

function TtsGridData.CheckCompareBkmPos(var BkmPos1, BkmPos2: TtsBkmPos;
                                        var Found: Boolean): Integer;
begin
    Result := 0;
    Found := True;

    if (BkmPos1.Offset = bpoBof) and (BkmPos2.Offset = bpoBof) then
        Result := 0
    else if (BkmPos1.Offset = bpoEof) and (BkmPos2.Offset = bpoEof) then
        Result := 0
    else if (BkmPos1.Offset = bpoBof) then
    begin
        if BkmPos2.Offset <> bpoPrior
            then Result := -1
            else Found := False;
    end
    else if BkmPos1.Offset = bpoEof then
    begin
        if BkmPos2.Offset <> bpoNext
            then Result := 1
            else Found := False;
    end
    else if (BkmPos2.Offset = bpoBof) then
    begin
        if BkmPos1.Offset <> bpoPrior
            then Result := 1
            else Found := False;
    end
    else if BkmPos2.Offset = bpoEof then
    begin
        if BkmPos1.Offset <> bpoNext
            then Result := -1
            else Found := False;
    end
    else
    begin
        Result := CompareBkm(BkmPos1.Bkm, BkmPos2.Bkm);
        if (BkmPos1.Offset <> BkmPos2.Offset) then
        begin
            if Result = 0 then
            begin
                if (BkmPos1.Offset = bpoPrior) then
                    Result := -1
                else if BkmPos1.Offset = bpoNext then
                    Result := 1
                else if BkmPos2.Offset = bpoPrior then
                    Result := 1
                else if BkmPos2.Offset = bpoNext then
                    Result := -1;
            end
            else
                Found := False;
        end;
    end;
end;

function TtsGridData.CompareBkmPos(var BkmPos1, BkmPos2: TtsBkmPos): Integer;
var
    Found: Boolean;
begin
    Result := CheckCompareBkmPos(BkmPos1, BkmPos2, Found);
    if not Found then
    begin
        if (Result < 0) and ((BkmPos1.Offset = bpoNext) or (BkmPos2.Offset = bpoPrior)) then
        begin
            BkmPos1 := ActualBkmPos(BkmPos1);
            BkmPos2 := ActualBkmPos(BkmPos2);
            Result := CompareBkmPos(BkmPos1, BkmPos2);
        end
        else if (Result > 0) and ((BkmPos1.Offset = bpoPrior) or (BkmPos2.Offset = bpoNext)) then
        begin
            BkmPos1 := ActualBkmPos(BkmPos1);
            BkmPos2 := ActualBkmPos(BkmPos2);
            Result := CompareBkmPos(BkmPos1, BkmPos2);
        end
        else if (BkmPos1.Offset in [bpoBof, bpoEof]) or (BkmPos2.Offset in [bpoBof, bpoEof]) then
        begin
            BkmPos1 := ActualBkmPos(BkmPos1);
            BkmPos2 := ActualBkmPos(BkmPos2);
            Result := CompareBkmPos(BkmPos1, BkmPos2);
        end;
    end;
end;

function TtsGridData.GreaterEqualBkmPos(var BkmPos1, BkmPos2: TtsBkmPos): Boolean;
var
    Found: Boolean;
    CompRes: Integer;
begin
    CompRes := CheckCompareBkmPos(BkmPos1, BkmPos2, Found);
    if Found then
        Result := (CompRes >= 0)
    else
    begin
        if (CompRes > 0) and (BkmPos1.Offset = bpoPrior) and (BkmPos2.Offset <> bpoNext) then
            Result := True
        else
        begin
            CompRes := CompareBkmPos(BkmPos1, BkmPos2);
            Result := (CompRes >= 0)
        end
    end;
end;

function TtsGridData.LessEqualBkmPos(var BkmPos1, BkmPos2: TtsBkmPos): Boolean;
var
    Found: Boolean;
    CompRes: Integer;
begin
    CompRes := CheckCompareBkmPos(BkmPos1, BkmPos2, Found);
    if Found then
        Result := (CompRes <= 0)
    else
    begin
        if (CompRes < 0) and (BkmPos1.Offset = bpoNext) and (BkmPos2.Offset <> bpoPrior) then
            Result := True
        else
        begin
            CompRes := CompareBkmPos(BkmPos1, BkmPos2);
            Result := (CompRes <= 0)
        end
    end;
end;

function TtsGridData.GreaterBkmPos(var BkmPos1, BkmPos2: TtsBkmPos): Boolean;
begin
    Result := not LessEqualBkmPos(Bkmpos1, BkmPos2);
end;

function TtsGridData.LessBkmPos(var BkmPos1, BkmPos2: TtsBkmPos): Boolean;
begin
    Result := not GreaterEqualBkmPos(BkmPos1, BkmPos2);
end;

function TtsGridData.RecIDRow(ID: Variant): Integer;
var
    CurRec: Integer;
    CurID: Variant;
begin
    Result := 0;
    if not Active then Exit;

    CurRec := 0;
    while CurRec < BufferRows do
    begin
        Inc(CurRec);
        CurID := RecID[CurRec];
        if FGrid.CompareRecId(CurID, ID) = 0 then
        begin
            Result := CurRec;
            Break;
        end
    end;
end;

function TtsGridData.BkmPosBookmark(const BkmPos: TtsBkmPos; var Bkm: TBookmarkStr): Boolean;
begin
    Result := True;
    Bkm := BkmPos.Bkm;
    case BkmPos.Offset of
        bpoBof: Result := False;
        bpoNext: Result := NextBookmark(BkmPos.Bkm, Bkm);
        bpoPrior: Result := PrevBookmark(BkmPos.Bkm, Bkm);
        bpoEof: Result := False;
    end;
end;

function TtsGridData.ActualBkmPos(BkmPos: TtsBkmPos): TtsBkmPos;
var
    Bkm: TBookmarkStr;
begin
    Result := BkmPos;
    case BkmPos.Offset of
        bpoPrior:
            if not BkmPosBookmark(BkmPos, Bkm)
                then Result := BofBkmPos
                else Result := CurBkmPos(Bkm);

        bpoNext:
            if not BkmPosBookmark(BkmPos, Bkm)
                then Result := EofBkmPos
                else Result := CurBkmPos(Bkm);
    end;
end;

function TtsGridData.IsSequenced: Boolean;
begin
{$IFDEF TSVER_V3}
    Result := False;
    if (not Assigned(FGrid.Datalink.Dataset)) or (not FGrid.Datalink.Dataset.Active) then Exit;
    Result := FGrid.Datalink.Dataset.IsSequenced;
{$ELSE}
    Result := False;
{$ENDIF}
end;

function TtsGridData.FirstBkmPos: TtsBkmPos;
begin
    if FGrid.UseStandardScrolling
        then Result := BofBkmPos
        else Result := CurBkmPos(FirstBookmark);
end;

function TtsGridData.LastBkmPos: TtsBkmPos;
begin
    if FGrid.UseStandardScrolling
        then Result := EofBkmPos
        else Result := CurBkmPos(LastBookmark);
end;

function TtsGridData.BufferPositionChanged(Value: TtsDatasetPosition): Boolean;
begin
    Result := False;
end;

function TtsGridData.GetDatasetPosition: TtsDatasetPosition;
begin
    Result.ActiveRow := 0;
    Result.TopBkm := EmptyBookmark;
end;

procedure TtsGridData.SetDatasetPosition(Value: TtsDatasetPosition);
begin
end;

function TtsGridData.GetRecNo: Integer;
begin
    Result := FGrid.Datalink.Dataset.RecNo;
end;

procedure TtsGridData.SetRecNo(Value: Integer);
begin
{$IFDEF TSVER_V3}
    FGrid.Datalink.Dataset.RecNo := Value;
{$ENDIF}
end;

procedure TtsGridData.CheckDisableControls;
begin
    if CanDisableControls and not FControlsDisabled then
    begin
        try
            FGrid.Datalink.Dataset.DisableControls;
        finally
            FControlsDisabled := True;
        end;
    end;
end;

procedure TtsGridData.SetCanDisableControls(Value: Boolean);
begin
    if Value then
        Inc(FCanDisableControls)
    else if FCanDisableControls > 0 then
    begin
        Dec(FCanDisableControls);
        if (FCanDisableControls = 0) and FControlsDisabled then
        begin
            try
                FGrid.Datalink.Dataset.EnableControls;
            finally
                FControlsDisabled := False;
            end;
        end;
    end;
end;

function TtsGridData.GetCanDisableControls: Boolean;
begin
    Result := (FCanDisableControls > 0);
end;

procedure TtsGridData.CheckDatalinkBufferOk(OldSize: Integer);
const
    MaxRetry = 1000;

var
    Empty: Boolean;
    Count: Integer;
    CurBufSize: Integer;
    OldActive: Integer;

begin
    //Datalink bug work-around: FFirstRecord is not always correct after
    //increasing the buffer size. Check and force to correct position by
    //testing for empty records at the end of the buffer.

    CurBufSize := Datalink.BufferCount;
    if OldSize >= CurBufSize then Exit;

    try
        Count := 0;
        while Count < MaxRetry do
        begin
            OldActive := ActiveRecord;
            try
                ActiveRecord := BufferRows;
                {$IFDEF TSVER_V3}
                    Empty := Dataset.IsEmpty;
                {$ELSE}
                    Empty := False;
                {$ENDIF}
            finally
                ActiveRecord := OldActive;
            end;

            if not Empty then Break;

            Datalink.BufferCount := Datalink.BufferCount + 1;
            Inc(Count);
        end;
    finally
        Datalink.BufferCount := CurBufSize;
    end;
end;

procedure TtsGridData.SetDatasetBufferCount(BufSize: Integer);
var
    OldSize: Integer;
begin
    if not FGrid.HandleAllocated then Exit;

    OldSize := Datalink.BufferCount;
    Datalink.BufferCount := BufSize;
    CheckDatalinkBufferOk(OldSize);
end;

procedure TtsGridData.LinkActive(Value: Boolean);
begin
    SaveFieldLayout;
end;

procedure TtsGridData.ClearPropBuffer(FromRow, ToRow: Integer; Reset: Boolean);
var
    I: Integer;
    ClearAll: Boolean;
begin
    if FromRow <= 0 then FromRow := 1;
    if (ToRow <= 0) or (ToRow > FPropBufSize) then ToRow := FPropBufSize;

    ClearAll := (FromRow <= 1) and (ToRow >= FPropBufSize) and Reset;
    if (not ClearAll) or (not FPropBufferCleared) then
    begin
        for I := FromRow to ToRow do
        begin
            FPropBuffer[I].SelectedSaved := False;
            FPropBuffer[I].PropSaved := False;
            FPropBuffer[I].Selected := False;
            FPropBuffer[I].Prop := nil;
        end;

        FPropBufferCleared := ClearAll;
    end;
end;

procedure TtsGridData.ResizePropBuffer(NewSize: Integer);
var
    OldSize: Integer;
begin
    if NewSize = FPropBufSize then Exit;

    OldSize := FPropBufSize;
    ClearPropBuffer(NewSize + 1, OldSize, True);
    ReallocMem(FPropBuffer, NewSize * SizeOf(TtsRowProp));
    FPropBufSize := NewSize;
    ClearPropBuffer(OldSize + 1, NewSize, False);
end;

{TtsScrollDataset}

constructor TtsScrollDataset.Create(Grid: TtsCustomDBGrid);
begin
    inherited Create(Grid);

    FActive := False;
    FBuffer := nil;
    FReadBuffer := nil;
    FTempBuffer := nil;
    FLookupBuffer := nil;
    FEnableCheckRowsCount := 0;

    InitGridDataSet;
    InitBuffer;
end;

destructor TtsScrollDataset.Destroy;
begin
    Close;
    inherited Destroy;
end;

function TtsScrollDataset.CheckErr(Err: DbiResult): Boolean;
begin
    Result := True;
    try
        Check(Err);
    except
        On E:Exception do
        begin
            Result := False;
            FGrid.InvalidOp(E.Message);
        end;
    end;
end;

function TtsScrollDataset.DatasetHandle: HDBICur;
begin
{$IFDEF TSVER_V3}
    Result := TBDEDataset(FDataset).Handle;
{$ELSE}
    Result := FDataset.Handle;
{$ENDIF}
end;

function TtsScrollDataset.DatasetLocale: TLocale;
begin
{$IFDEF TSVER_V3}
    Result := TBDEDataset(FDataset).Locale;
{$ELSE}
    Result := FDataset.Locale;
{$ENDIF}
end;

procedure TtsScrollDataset.Open;
begin
    if Active then Exit;
    FDataset := FGrid.Dataset;

    if Assigned(FDataset) and FDataset.Active then
    begin
        SaveCurIndex;
        FFilter := FDataset.Filter;
        FFiltered := FDataset.Filtered;
        FFilterOptions := FDataset.FilterOptions;
        FMasterSource := DatasetMasterSource;
        FMasterFields := DatasetMasterFields;
        FMasterFieldValues := DatasetMasterFieldValues;

        CheckErr(DbiCloneCursor(DatasetHandle, True, False, FHandle));
        CheckErr(DbiGetCursorProps(FHandle, FCursorProps));
        SetProperties(False);

        FRecNoStatus := TRecNoStatus(FCursorProps.ISeqNums);
        CreateBuffer(FGrid.MaxDisplayRows);
        FActive := True;
    end;
end;

procedure TtsScrollDataset.Close;
begin
    if not Active then Exit;

    FActive := False;
    FDataset := nil;
    CheckErr(DbiCloseCursor(FHandle));
    FreeBuffer;
    InitGridDataSet;
end;

procedure TtsScrollDataset.Reopen;
begin
    Close;
    Open;
end;

procedure TtsScrollDataset.InitGridDataSet;
begin
    inherited;
    FFilter := '';
    FFiltered := False;
    FFilterOptions := [];
    FMasterSource := nil;
    FMasterFields := '';
    FMasterFieldValues := Unassigned;
    FRecNoStatus := rnNotSupported;
    FRecordTypes := 0;
end;

procedure TtsScrollDataset.ResetRecCount;
begin
    FRecCount := -1;
    FRowsCounted := 0;
end;

procedure TtsScrollDataset.InitBuffer;
begin
    FBufRecSize := 0;
    FBufBookmarkSize := 0;
    FBufBkmInfoSize := 0;
    FRecInfoStart := 0;
    FLookupSize := 0;
    FLookupStart := 0;
    FBufRowSize := 0;
    FBufRows := 0;
    FBufFirstRow := 1;
    FBufLastRow := 0;
    FCursorRow := 0;
    FCursorPosition := cpBof;
    FCountPos := 0;
    FCountDirection := cdForward;
    FActiveBufIndex := -1;
    FAtStart := False;
    FAtEnd := False;
    FBeenAtEnd := False;
    FRepositioned := False;
    FRepositionDirection := cdNone;
    FRecordInserted := False;
    FOnInsertRecord := False;
    FActiveBookmark := EmptyBookmark;

    ResetRecCount;
end;

procedure TtsScrollDataset.InitLookupFields(var LengthOfFields: Integer);
var
    I: Integer;
    Field: TtsDBField;
begin
    LengthOfFields := 0;
    for I := 1 to FGrid.FFieldList.Count do
    begin
        Field := FGrid.FFieldList.Items[I-1];
        if Assigned(Field) and Field.Lookup then
        begin
            Field.FLookupOffset := LengthOfFields;
            Inc(LengthOfFields, Field.DataSize + 1);
        end;
    end;
end;

function TtsScrollDataset.PBookmark(BufRow: Integer): PBookmarkStr;
begin
    Result := PBookmarkStr(RecordBuffer(BufRow) + FPBkmStart);
end;

function TtsScrollDataset.PRecordId(BufRow: Integer): PVariant;
begin
    Result := PVariant(RecordBuffer(BufRow) + FRecIDStart);
end;

procedure TtsScrollDataset.SetRecId(BufRow: Integer; Value: Variant);
begin
    PVariant(RecordBuffer(BufRow) + FRecIDStart)^ := Value;
end;

function TtsScrollDataset.GetRecId(BufRow: Integer): Variant;
begin
    Result := PVariant(RecordBuffer(BufRow) + FRecIDStart)^;
end;

procedure TtsScrollDataset.ClearRecIds(First, Last: Integer; Assign: Boolean);
var
    P: PVariant;
    I: Integer;
begin
    for I := First to Last do
    begin
        P := PRecordId(I);
        if Assign then P^ := Unassigned
                  else ZeroMemory(P, FBufRecIDSize);
    end;
end;

procedure TtsScrollDataset.ClearBkm(First, Last: Integer; Assign: Boolean);
var
    P: PBookmarkStr;
    I: Integer;
begin
    for I := First to Last do
    begin
        P := PBookmark(I);
        if Assign then P^ := EmptyBookmark
                  else ZeroMemory(P, FBufPBkmSize);
    end;
end;

procedure TtsScrollDataset.CreateBuffer(Size: Integer);
begin
    InitBuffer;
    FBufRows := Size;

    FBufRecSize := FCursorProps.IRecBufSize;
    FBufBookmarkSize := FCursorProps.IBookmarkSize;
    FBufBkmInfoSize := 1;
    FBufPBkmSize := SizeOf(TBookmarkStr);
    FPBkmStart := FBufRecSize + FBufBookmarkSize + FBufBkmInfoSize;
    FBufRecIDSize := SizeOf(Variant);
    FRecIDStart := FPBkmStart + FBufPBkmSize;
    FRecInfoStart := FRecIDStart + FBufRecIDSize;
    FLookupStart := FRecInfoStart + SizeOf(TRecInfo);
    InitLookupFields(FLookupSize);
    FBufRowSize := FLookupStart + FLookupSize;

    FBufFirstRow := 0;
    FBufLastRow := -1;
    ResizePropBuffer(Size);
    ClearPropBuffer(0, 0, True);
    ReallocMem(FBuffer, Size * FBufRowSize);
    ReallocMem(FReadBuffer, FBufRowSize);
    ReallocMem(FTempBuffer, FBufRowSize);
    ReallocMem(FLookupBuffer, FBufRowSize);
    ClearRecIds(1, Size, False);
    ClearBkm(1, Size, False);
end;

procedure TtsScrollDataset.FreeBuffer;
begin
    ClearRecIds(1, FBufRows, True);
    ClearBkm(1, FBufRows, True);

    ReallocMem(FBuffer, 0);
    ReallocMem(FReadBuffer, 0);
    ReallocMem(FTempBuffer, 0);
    ReallocMem(FLookupBuffer, 0);
    InitBuffer;
end;

procedure TtsScrollDataset.ReallocBuffer(NewSize: Integer);
var
    OldSize: Integer;
begin
    OldSize := FBufRows;
    FBufRows := NewSize;
    ClearRecIds(NewSize + 1, OldSize, True);
    ClearBkm(NewSize + 1, OldSize, True);
    ReallocMem(FBuffer, NewSize * FBufRowSize);
    ClearBkm(OldSize + 1, NewSize, False);
    ClearRecIds(OldSize + 1, NewSize, False);

    if not Assigned(FReadBuffer) then ReallocMem(FReadBuffer, FBufRowSize);
    if not Assigned(FTempBuffer) then ReallocMem(FTempBuffer, FBufRowSize);
    if not Assigned(FLookupBuffer) then ReallocMem(FLookupBuffer, FBufRowSize);
end;

function TtsScrollDataset.ResizeBuffer(NewSize: Integer; var Redraw: Boolean): Boolean;
var
    Err: DbiResult;
    MoveCount: Longint;
begin
    Redraw := False;
    Result := False;
    if not Active then Exit;
    if NewSize = FBufRows then Exit;

    ResizePropBuffer(NewSize);
    ClearPropBuffer(0, 0, True);
    ReallocBuffer(NewSize);

    if BufferRows > NewSize then
        FBufLastRow := FBufFirstRow + NewSize - 1
    else if (BufferRows > 0) and (BufferRows < FBufRows) then
    begin
        SetToRecord(BufferRows);
        Err := GetRecords(BufferRows + 1, NewSize, 1, MoveCount);
        if Err <> DbiErr_Eof then CheckErr(Err);
        if Err = DbiErr_Eof then
        begin
            Redraw := True;
            MoveLast;
        end;
    end
    else if BufferRows = 0 then
    begin
        Redraw := True;
        MoveFirst;
    end;

    Result := True;
end;

procedure TtsScrollDataset.ResizeAppend(Delta: Integer);
var
    DiffRows: Integer;
begin
    if not Active then Exit;
    if (Delta > 0) and (BufferRows + Delta < FBufRows) then Exit;

    if (Delta < 0) and (FBufRows + Delta < BufferRows) then
    begin
        DiffRows := BufferRows - (FBufRows + Delta);
        MoveBuffer(1, DiffRows + 1, BufferRows - DiffRows);
        FBufFirstRow := FBufFirstRow + DiffRows;
    end;

    ResizePropBuffer(FBufRows + Delta);
    ReallocBuffer(FBufRows + Delta);
end;

function TtsScrollDataset.GetRecCount: Longint;
begin
    if FRecCount >= 0 then
        Result := FRecCount
    else if FBufRows > FRowsCounted div ScrollBarMargin then
        Result := FRowsCounted + FBufRows
    else
        Result := FRowsCounted + FRowsCounted div ScrollBarMargin;
end;

function TtsScrollDataset.GetBufRecCount: Integer;
begin
    Result := FBufLastRow - FBufFirstRow + 1;
end;

procedure TtsScrollDataset.LinkActive(Value: Boolean);
begin
    if Value and (not Active) then Open;
    if (not Value) and Active then Close;

    SetDatasetBufferCount(1);
    inherited;
end;

function TtsScrollDataset.RecordBuffer(BufRow: Integer): PChar;
begin
    Result := FBuffer + ((BufRow - 1) * FBufRowSize);
end;

function TtsScrollDataset.GetActiveRecordBuffer;
begin
    Result := nil;
    if (FActiveBufIndex >= 1) and (FActiveBufIndex <= FBufRows) then
        Result := RecordBuffer(FActiveBufIndex);
end;

function TtsScrollDataset.GetActiveBookmark: TBookmarkStr;
begin
    Result := FActiveBookmark;
end;

procedure TtsScrollDataset.SetActiveBookmark(Value: TBookmarkStr);
begin
    FActiveBookmark := Value;
end;

procedure TtsScrollDataset.GetLookupFields(BufRow: Integer);
var
    I: Integer;
    Field: TtsDBField;
begin
    for I := 1 to FGrid.FFieldList.Count do
    begin
        Field := FGrid.FFieldList.Items[I-1];
        if Assigned(Field) and Field.Lookup then
            Field.GetLookupValue;
    end;
end;

procedure TtsScrollDataset.FetchRecordId(BufRow: Integer; Bkm: TBookmarkStr);
var
    Id: Variant;
begin
    if not UseRecordIds then Exit;

    Id := Unassigned;
    FGrid.DoGetRecordId(Bkm, Id);
    RecId[BufRow] := Id;
end;

function TtsScrollDataset.GetRecord(BufRow: Integer; Direction: Integer): DbiResult;
var
    Buffer: PChar;
    Info: RecProps;
    OldActive: Integer;
    OldActiveBkm: TBookmarkStr;
    PBkm: PBookmarkStr;
begin
    Buffer := RecordBuffer(BufRow);
    if Direction > 0 then
        Result := DbiGetNextRecord(FHandle, dbiNoLock, Buffer, @Info)
    else if Direction < 0 then
        Result := DbiGetPriorRecord(FHandle, dbiNoLock, Buffer, @Info)
    else
        Result := DbiGetRecord(FHandle, dbiNoLock, Buffer, @Info);

    if Result = DbiErr_None then
    begin
        with PRecInfo(Buffer + FRecInfoStart)^ do
        begin
            UpdateStatus := TUpdateStatus(Info.iRecStatus);
            case FRecNoStatus of
                rnParadox: RecordNumber := Info.iSeqNum;
                rnDBase: RecordNumber := Info.iPhyRecNum;
            else
                RecordNumber := -1;
            end;
        end;

        DbiGetBookMark(FHandle, Buffer + FBufRecSize);
        PBkm := PBookmarkStr(Buffer + FPBkmStart);
        SetString(PBkm^, Buffer + FBufRecSize, FBufBookmarkSize);
        SetInfo(Buffer, bkmNormal);

        OldActive := FActiveBufIndex;
        OldActiveBkm := ActiveBookmark;
        FActiveBufIndex := BufRow;
        ActiveBookmark := GetBufferBookmark(BufRow);
        try
            GetLookupFields(BufRow);
            FetchRecordId(BufRow, ActiveBookmark);
        finally
            FActiveBufIndex := OldActive;
            ActiveBookmark := OldActiveBkm;
        end;
    end;
end;

function TtsScrollDataset.CheckInsertedRecord(PrevBkm, CurBkm: TBookmarkStr; BufRow: Integer;
                                              Direction: Integer): Boolean;
var
    CompPrev, CompNext: Integer;
begin
    Result := False;

    if FRecordInserted then
    begin
        CompPrev := CompareBkm(PrevBkm, FInsertBkm);
        CompNext := CompareBkm(CurBkm, FInsertBkm);

        if Direction > 0 then
        begin
            if (CompPrev <> 1) and (CompNext = 1) then
            begin
                SetBookmark(BufRow, EmptyBookmark);
                SetBookmarkInfo(BufRow, bkmInserted);
                RecId[BufRow] := EmptyRecId;

                DbiGetPriorRecord(FHandle, dbiNoLock, nil, nil);
                Result := True;
            end;
        end
        else if Direction < 0 then
        begin
            if (CompPrev = 1) and (CompNext <> 1) then
            begin
                SetBookmark(BufRow, EmptyBookmark);
                SetBookmarkInfo(BufRow, bkmInserted);
                RecId[BufRow] := EmptyRecId;
                Result := True;
            end;
        end;
    end;
end;

function TtsScrollDataset.GetRecords(StartRow, EndRow: Integer; Direction: Integer;
                                     var Count: Longint): DbiResult;
var
    Err: DbiResult;
    BufRow: Integer;
    PrevBkm: TBookmarkStr;
    CurBkm: TBookmarkStr;
begin
    Count := 0;
    Result := DbiErr_None;
    ClearPropBuffer(0, 0, True);
    if (Direction > 0) and (StartRow > EndRow) then Exit;
    if (Direction < 0) and (StartRow < EndRow) then Exit;

    Err := DbiErr_None;
    BufRow := StartRow;
    PrevBkm := ScrollBookmark;
    while (Count < Abs(EndRow - StartRow) + 1) and
          (Err <> DbiErr_Eof) and (Err <> DbiErr_Bof) do
    begin
        if OnInsertRecord and (Direction < 0) then
            Err := GetRecord(BufRow, 0)
        else
            Err := GetRecord(BufRow, Direction);

        CurBkm := ScrollBookmark;
        if (not OnInsertRecord) and
           CheckInsertedRecord(PrevBkm, CurBkm, BufRow, Direction) then
        begin
            Err := DbiErr_None;
        end;

        CheckOnInsertRecord(BufRow);
        Inc(FCursorRow, Direction);
        CheckCountPosition(Err, Direction);
        if Err <> DbiErr_None then Break;

        Inc(Count);
        Inc(BufRow, Direction);

        if (Direction > 0) then Inc(FBufLastRow)
                           else Dec(FBufFirstRow);
        PrevBkm := CurBkm;
    end;

    if (Err = DbiErr_Eof) and (Direction < 0) then
        Err := DbiErr_Bof
    else if (Err = DbiErr_Bof) and (Direction > 0) then
        Err := DbiErr_Eof;

    CheckRowCount(Err);
    Result := Err;
end;

function TtsScrollDataset.SetToRecord(BufRow: Integer): DbiResult;
var
    I: Integer;
    Count: Integer;
    Direction: Integer;
    Bkm: TBookmarkStr;
begin
    if GetBookmarkInfo(BufRow) = bkmInserted
        then Bkm := FInsertBkm
        else Bkm := Bookmark[BufRow];

    if (BufRow > 0) or (Bkm <> '')
        then Result := DbiSetToBookMark(FHandle, PChar(Bkm))
        else Result := DbiSetToBegin(FHandle);
    Count := (FBufFirstRow + BufRow - 1) - FCursorRow;
    FCursorRow := FBufFirstRow + BufRow - 1;
    CheckOnInsertRecord(BufRow);

    Direction := 1;
    if Count < 0 then Direction := -1;
    for I := 1 to Abs(Count) do CheckCountPosition(DbiErr_None, Direction);
end;

procedure TtsScrollDataset.CheckOnInsertRecord(BufRow: Integer);
begin
    if FRecordInserted and (GetBookmarkInfo(BufRow) = bkmInserted) then
        FOnInsertRecord := True
    else
        FOnInsertRecord := False;
end;

procedure TtsScrollDataset.SetToFirst(ReadData: Boolean);
var
    BufRows: Integer;
begin
    CheckErr(DbiSetToBegin(FHandle));

    BufRows := 0;
    if not ReadData then BufRows := BufferRows;

    FOnInsertRecord := False;
    FRepositioned := False;
    FRepositionDirection := cdNone;
    FCursorRow := 0;
    FCursorPosition := cpBof;
    FBufFirstRow := 1;
    FBufLastRow := FBufFirstRow + BufRows - 1;
    FCountDirection := cdForward;
    FCountPos := 0;
    FAtStart := True;
    FAtEnd := False;
end;

procedure TtsScrollDataset.SetToEnd(ReadData: Boolean);
var
    BufRows: Integer;
begin
    CheckErr(DbiSetToEnd(FHandle));

    BufRows := 0;
    if not ReadData then BufRows := BufferRows;

    FOnInsertRecord := False;
    FRepositioned := False;
    FRepositionDirection := cdNone;
    FCursorRow := RecCount + 1;
    FCursorPosition := cpEof;
    FBufLastRow := RecCount;
    FBufFirstRow := FBufLastRow - BufRows + 1;
    FCountDirection := cdBackward;
    FCountPos := 0;
    FAtEnd := True;
    FBeenAtEnd := True;
    FAtStart := False;
end;

function TtsScrollDataset.CheckAtStart: Boolean;
var
    Err: DbiResult;
    MoveCount: Longint;
begin
    Result := FAtStart;
    if Result then Exit;

    if BufferRows > 0 then
    begin
        SetToRecord(1);
        Err := MoveRelative(-1, MoveCount);

        FAtStart := Err = DbiErr_Bof;
        Result := FAtStart;
        if Result then SetToFirst(False);
    end;
end;

function TtsScrollDataset.CheckAtEnd: Boolean;
var
    Err: DbiResult;
    MoveCount: Longint;
begin
    Result := FAtEnd;
    if Result then Exit;

    if BufferRows > 0 then
    begin
        SetToRecord(BufferRows);
        Err := MoveRelative(1, MoveCount);

        FAtEnd := (Err = DbiErr_Eof);
        if FAtEnd then SetToEnd(False);
        Result := FAtEnd;
    end;
end;

function  TtsScrollDataset.OnLastRecord: Boolean;
begin
    Result := CheckAtEnd;
    if Result then Result := (ActiveRecord = BufferRows);
end;

function TtsScrollDataset.GetAtEnd: Boolean;
begin
    Result := FAtEnd;
end;

procedure TtsScrollDataset.SetAtEnd(Value: Boolean);
begin
    FAtEnd := Value;
end;

function TtsScrollDataset.GetAtStart: Boolean;
begin
    Result := FAtStart;
end;

procedure TtsScrollDataset.SetAtStart(Value: Boolean);
begin
    FAtStart := Value;
end;

function TtsScrollDataset.GetActive: Boolean;
begin
    Result := FActive;
end;

function TtsScrollDataset.IsSequenced: Boolean;
begin
    Result := (FRecNoStatus = rnParadox) and (not FFiltered);
end;

function TtsScrollDataset.MoveSequenced(Count: Longint; var MoveCount: Longint;
                                        var Err: DbiResult): Boolean;
var
    SeqNo, NewSeqNo: Longint;
    EndSeqNo: Longint;
    OldBkm: TBookmarkStr;
    Direction: Integer;
    Offset: Integer;
begin
    Result := False;
    if not IsSequenced then Exit;

    Err := DbiGetSeqNo(FHandle, SeqNo);
    if Err <> DbiErr_None then SeqNo := -1;

    Offset := 0;
    if Err = DbiErr_KeyOrRecDeleted then
    begin
        Err := DbiGetPriorRecord(FHandle, dbiNoLock, nil, nil);
        if (Err <> DbiErr_Bof) and (Count < 0) then Inc(Offset);

        if Err = DbiErr_Bof then
        begin
            Err := DbiGetNextRecord(FHandle, dbiNoLock, nil, nil);
            if (Err <> DbiErr_Eof) and (Count > 0) then Dec(Offset);
        end;
    end;

    if SeqNo = -1 then Err := DbiGetSeqNo(FHandle, SeqNo);
    if Err <> DbiErr_None then Exit;

    OldBkm := ScrollBookmark;
    NewSeqNo := SeqNo + Count + Offset;
    Err := DbiSetToSeqNo(FHandle, NewSeqNo);

    if Err = DbiErr_None then
        MoveCount := Count
    else if Err = DbiErr_Bof then
        MoveCount := -(SeqNo - 1)
    else if Err = DbiErr_Eof then
    begin
        Err := DbiGetPriorRecord(FHandle, dbiNoLock, nil, nil);
        if Err = DbiErr_None then
        begin
            Err := DbiGetSeqNo(FHandle, EndSeqNo);
            if Err = DbiErr_None then MoveCount := EndSeqNo - SeqNo;
        end
        else if Err = DbiErr_Bof then
            MoveCount := 0;

        if (Err = DbiErr_None) then
        begin
            DbiSetToEnd(FHandle);
            Err := DbiErr_Eof;
        end
        else if Err <> DbiErr_Bof then
            Err := DbiErr_NotSupported;
    end;

    if Count < 0 then Direction := -1 else Direction := 1;
    if (Err = DbiErr_None) or (Err = DbiErr_Bof) or (Err = DbiErr_Eof) then
    begin
        Result := True;

        Inc(FCursorRow, MoveCount);
        if Abs(MoveCount) > 0 then
        begin
            CheckCountPosition(DbiErr_None, Direction);
            CheckCountPosition(DbiErr_None, MoveCount - Direction);
        end;

        if (Err <> DbiErr_None) then
        begin
            Inc(FCursorRow, Direction);
            CheckCountPosition(Err, Direction);
        end;

        FOnInsertRecord := False;
    end
    else
    begin
        Result := False;
        DbiSetToBookmark(FHandle, PChar(OldBkm));
    end;
end;

function TtsScrollDataset.MoveRelative(Count: Longint; var MoveCount: Longint): DbiResult;
var
    I: Integer;
    OldErr, Err: DbiResult;
    Direction: Integer;
    StartBkm: TBookmarkStr;
    WasOnInsert: Boolean;
    Moved: Boolean;
begin
    Result := DbiErr_None;
    MoveCount := 0;
    Err := DbiErr_None;
    if Count = 0 then Exit;

    Direction := 1;
    if Count < 0 then Direction := -Direction;
    StartBkm := ScrollBookmark;
    WasOnInsert := OnInsertRecord;

    Moved := False;
    if (Abs(Count) > FBufRows) then
    begin
        Moved := MoveSequenced(Count, MoveCount, Err);
    end;

    if not Moved then
    begin
        I := 0;
        Err := DbiErr_None;

        while I < Abs(Count) do
        begin
            if Direction > 0 then
                Err := DbiGetNextRecord(FHandle, dbiNoLock, nil, nil)
            else if not OnInsertRecord then
                Err := DbiGetPriorRecord(FHandle, dbiNoLock, nil, nil)
            else
                Err := DbiGetRecord(FHandle, dbiNoLock, nil, nil);

            Inc(I);
            Inc(FCursorRow, Direction);
            FOnInsertRecord := False;

            CheckCountPosition(Err, Direction);
            if Err <> DbiErr_None then Break;
            Inc(MoveCount, Direction);
        end;
    end;

    OldErr := Err;
    if CheckInsertPassed(Err, StartBkm, ScrollBookmark, Direction, WasOnInsert) then
    begin
        if (OldErr = DbiErr_Eof) then Inc(MoveCount, Direction);
    end;

    CheckRowCount(Err);
    Result := Err;
end;

function TtsScrollDataset.CheckInsertPassed(var Err: DbiResult; FirstBkm, LastBkm: TBookmarkStr;
                                            Direction: Integer; WasOnInsert: Boolean): Boolean;
begin
    Result := False;
    if FRecordInserted then
    begin
        FOnInsertRecord := False;
        if Direction > 0 then
        begin
            if (CompareBkm(FirstBkm, FInsertBkm) <> 1) and
               (CompareBkm(LastBkm, FInsertBkm) = 1) and
               (not WasOnInsert) then
            begin
                Result := True;
                Err := DbiGetPriorRecord(FHandle, dbiNoLock, nil, nil);
                if CompareBkm(ScrollBookmark, FInsertBkm) = 0 then
                    FOnInsertRecord := True;
            end;
        end
        else if Direction < 0 then
        begin
            if (CompareBkm(FirstBkm, FInsertBkm) = 1) and
               (CompareBkm(LastBkm, FInsertBkm) <> 1) then
            begin
                Result := True;
                if CompareBkm(LastBkm, FInsertBkm) <> 0 then
                    Err := DbiGetNextRecord(FHandle, dbiNoLock, nil, nil)
                else
                begin
                    FOnInsertRecord := True;
                    Err := DbiErr_None;
                end;
            end;
        end;
    end;
end;

function TtsScrollDataset.DoRecCount(ReCount: Boolean): Longint;
begin
    Result := 0;
    if not Active then Exit;
    if ReCount or (FRecCount < 0) then
        FRecCount := FDataset.RecordCount;
    Result := FRecCount;
end;

procedure TtsScrollDataset.MoveBuffer(ToIndex, FromIndex, Count: Integer);
var
    StartIndex, EndIndex: Integer;
begin
    if (ToIndex = FromIndex) then Exit;

    if Count + (ToIndex - 1) > FBufRows then Count := FBufRows - (ToIndex - 1);
    if Count + (FromIndex - 1) > FBufRows then Count := FBufRows - (FromIndex - 1);

    if ToIndex < FromIndex then
    begin
        StartIndex := ToIndex;
        EndIndex := CalcMin(ToIndex + Count - 1, FromIndex - 1)
    end
    else
    begin
        StartIndex := CalcMax(FromIndex + Count, ToIndex);
        EndIndex := ToIndex + Count - 1;
    end;

    ClearBkm(StartIndex, EndIndex, True);
    if UseRecordIds then
    begin
        ClearRecIds(StartIndex, EndIndex, True);
    end;

    MoveMemory(FBuffer + ((ToIndex-1) * FBufRowSize),
               FBuffer + ((FromIndex-1) * FBufRowSize),
               Count * FBufRowSize);

    if ToIndex < FromIndex then
    begin
        StartIndex := CalcMax(FromIndex, ToIndex + Count);
        EndIndex := FromIndex + Count - 1;
    end
    else
    begin
        StartIndex := FromIndex;
        EndIndex := CalcMin(FromIndex + Count - 1, ToIndex - 1);
    end;

    ClearBkm(StartIndex, EndIndex, False);
    if UseRecordIds then
    begin
        ClearRecIds(StartIndex, EndIndex, False);
    end;
end;

procedure TtsScrollDataset.CheckCountPosition(Err: DbiResult; Count: Integer);
var
    OldPos, NewPos: TtsCursorPosition;
begin
    OldPos := FCursorPosition;
    CheckCursorPosition(Err);
    NewPos := FCursorPosition;

    case NewPos of
        cpNormal:
            case OldPos of
                cpNormal: Inc(FCountPos, Count);
                cpBof: if (FCountDirection = cdForward) then Inc(FCountPos, Count);
                cpEof: if (FCountDirection = cdBackward) then Inc(FCountPos, Count);
            end;
        cpBof: if (FCountDirection = cdForward) then Inc(FCountPos, Count);
        cpEof: if (FCountDirection = cdBackward) then Inc(FCountPos, Count);
    end;
end;

procedure TtsScrollDataset.CheckCursorPosition(Err: DbiResult);
begin
    case Err of
        DbiErr_Bof: FCursorPosition := cpBof;
        DbiErr_Eof: FCursorPosition := cpEof;
    else
        FCursorPosition := cpNormal;
    end;
end;

procedure TtsScrollDataset.CheckRowCount(Err: DbiResult);
var
    OldCount: Longint;
    DiffCount: Longint;
    Bof, Eof: Boolean;
begin
    if not EnableCheckRows then Exit;

    OldCount := RecCount;
    Bof := (Err = DbiErr_Bof);
    Eof := (Err = DbiErr_Eof);

    if FCountDirection = cdForward then
    begin
        if FCountPos < 0 then
        begin
            Inc(FRowsCounted, Abs(FCountPos));
            FCountPos := 0;
        end
        else if (FRowsCounted < FCountPos) then
            FRowsCounted := FCountPos
        else if Eof then
            FRowsCounted := FCountPos;

        if (Eof and (not FRepositioned)) or
           ((FRecCount >= 0) and (FRecCount < FRowsCounted)) then
            FRecCount := FRowsCounted;
    end
    else if FCountDirection = cdBackward then
    begin
        if FCountPos > 0 then
        begin
            Inc(FRowsCounted, FCountPos);
            FCountPos := 0;
        end
        else if (FRowsCounted < Abs(FCountPos)) then
            FRowsCounted := Abs(FCountPos)
        else if Bof then
            FRowsCounted := Abs(FCountPos);

        if (Bof and (not FRepositioned)) or
           ((FRecCount >= 0) and (FRecCount < FRowsCounted)) then
            FRecCount := FRowsCounted;
    end;

    if (FCountDirection = cdBackward) and (OldCount <> RecCount) then
    begin
        DiffCount := RecCount - OldCount;
        Inc(FBufFirstRow, DiffCount);
        Inc(FBufLastRow, DiffCount);
        Inc(FCursorRow, DiffCount);
    end;

    AdjustBufRange;
end;

procedure TtsScrollDataset.AdjustCountOnInsert;
var
    Cmp: Integer;
begin
    Inc(FRowsCounted);
    if FRecCount >= 0 then Inc(FRecCount);

    Cmp := CompareBkm(ScrollBookmark, FInsertBkm);
    if (FCountDirection = cdBackward) and not (Cmp = 1) then Dec(FCountPos);
    if (FCountDirection = cdForward) and (Cmp = 1) then Inc(FCountPos);
    if (Cmp = 1) then Inc(FCursorRow);
end;

procedure TtsScrollDataset.AdjustCountOnCancel;
var
    Cmp: Integer;
    Count: Longint;
begin
    Dec(FRowsCounted);
    if FRecCount >= 0 then Dec(FRecCount);

    if OnInsertRecord then MoveRelative(-1, Count);
    Cmp := CompareBkm(ScrollBookmark, FInsertBkm);

    if (FCountDirection = cdBackward) and (Cmp = -1) then Inc(FCountPos);
    if (FCountDirection = cdForward) and (Cmp = 1) then Dec(FCountPos);
    if (Cmp = 1) then Dec(FCursorRow);
end;

procedure TtsScrollDataset.MoveFirst;
var
    Err: DbiResult;
    Count: Longint;
begin
    if not Active then Exit;

    SetToFirst(True);
    Err := GetRecords(1, FBufRows, 1, Count);
    if (Err <> DbiErr_Eof) and (Err <> DbiErr_Bof) then CheckErr(Err);

    if (BufferRows <> FBufRows) then
    begin
        FRowsCounted := BufferRows;
        CheckRowCount(Err);
    end;
end;

procedure TtsScrollDataset.MoveLast;
var
    Err: DbiResult;
    Count: Longint;
    DiffRows: Integer;
begin
    if not Active then Exit;

    SetToEnd(True);
    Err := GetRecords(FBufRows, 1, -1, Count);

    DiffRows := FBufFirstRow - (RecCount - Count + 1);
    FBufFirstRow := FBufFirstRow - DiffRows;
    FCursorRow := FCursorRow - DiffRows;
    FBufLastRow := FBufLastRow - DiffRows;

    if Err = DbiErr_Bof then MoveBuffer(1, FBufRows - Count + 1, Count)
                        else CheckErr(Err);

    if (BufferRows <> FBufRows) then
    begin
        FRowsCounted := BufferRows;
        CheckRowCount(Err);
    end;
end;

procedure TtsScrollDataset.AdjustBufRange;
var
    DiffCount: Longint;
begin
    if FRepositioned then
    begin
        if FBufFirstRow < (RecCount div ScrollBarMargin) then
        begin
            DiffCount := (RecCount div ScrollBarMargin) - FBufFirstRow;
            FBufFirstRow := RecCount div ScrollBarMargin;
            Inc(FBufLastRow, DiffCount);
            Inc(FCursorRow, DiffCount);
        end
        else if (FBufLastRow) > (RecCount - (RecCount div ScrollBarMargin)) then
        begin
            DiffCount := FBufLastRow - (RecCount - (RecCount div ScrollBarMargin));
            FBufLastRow := RecCount - (RecCount div ScrollBarMargin);
            Dec(FBufFirstRow, DiffCount);
            Dec(FCursorRow, DiffCount);
        end;
    end;

    if FBufFirstRow < 1 then
    begin
        DiffCount := 1 - FBufFirstRow;
        FBufFirstRow := 1;
        Inc(FBufLastRow, DiffCount);
        Inc(FCursorRow, DiffCount);
    end
    else if FBufLastRow > RecCount then
    begin
        DiffCount := FBufLastRow - RecCount;
        FBufLastRow := RecCount;
        Dec(FBufFirstRow, DiffCount);
        Dec(FCursorRow, DiffCount);
    end;
end;

function TtsScrollDataset.MoveForward(Count: Longint): Longint;
var
    Err: DbiResult;
    StartRow: Integer;
    MovedBy: Longint;
    MoveCount: Longint;
    RowCount: Integer;
begin
    FAtStart := False;
    FAtEnd := False;
    MovedBy := 0;
    Err := DbiErr_None;

    if BufferRows > 0 then
    begin
        SetToRecord(BufferRows);
        if Count >= BufferRows then
        begin
            Err := MoveRelative(Count - BufferRows, MoveCount);
            Inc(MovedBy, MoveCount);
        end;

        if Err <> DbiErr_Eof then
        begin
            CheckErr(Err);
            StartRow := 1;

            RowCount := BufferRows;
            FBufLastRow := FCursorRow;
            FBufFirstRow := FBufFirstRow + Count;
            if Count < RowCount then
            begin
                MoveBuffer(1, Count + 1, RowCount - Count);
                StartRow := RowCount - Count + 1;
            end;

            Err := GetRecords(StartRow, FBufRows, 1, MoveCount);
            Inc(MovedBy, MoveCount);
            if Err <> DbiErr_Eof then CheckErr(Err);
        end;

        if Err = DbiErr_Eof then MoveLast;
    end;

    Result := MovedBy;
end;

function TtsScrollDataset.MoveBackward(Count: Longint): Longint;
var
    Err: DbiResult;
    MoveCount: Longint;
    EndRow: Integer;
    MovedBy: Longint;
    RowCount: Integer;
begin
    FAtStart := False;
    FAtEnd := False;
    MovedBy := 0;
    Err := DbiErr_None;

    if BufferRows > 0 then
    begin
        SetToRecord(1);
        if Count >= BufferRows then
        begin
            Err := MoveRelative(-Count + BufferRows, MoveCount);
            Inc(MovedBy, MoveCount);
        end;

        if Err <> DbiErr_Bof then
        begin
            CheckErr(Err);
            EndRow := FBufRows;

            RowCount := BufferRows;
            FBufFirstRow := FCursorRow;
            FBufLastRow := FBufLastRow - Count;
            if Count < RowCount then
            begin
                MoveBuffer(Count + 1, 1, RowCount - Count);
                EndRow := Count;
            end;

            Err := GetRecords(EndRow, 1, -1, MoveCount);
            Dec(MovedBy, MoveCount);
            if Err <> DbiErr_Bof then CheckErr(Err);
        end;

        if Err = DbiErr_Bof then MoveFirst;
    end;

    Result := MovedBy;
end;

function TtsScrollDataset.MoveBy(Count: Longint): Longint;
begin
    Result := 0;
    if not Active then Exit;

    Result := 0;
    if (Count > 0) and (not CheckAtEnd) then
        Result := MoveForward(Count)
    else if (Count < 0) and (not CheckAtStart) then
        Result := MoveBackward(-Count);
end;

function TtsScrollDataset.MoveActiveBackward(Count: Longint; var MovedBy: Longint): Longint;
begin
    Result := 0;
    MovedBy := 0;
    if (not Active) or (FActiveBufIndex < 0) then Exit;

    if Count < FActiveBufIndex then
    begin
        Result := -Count;
        Dec(FActiveBufIndex, Count)
    end
    else
    begin
        Result := -FActiveBufIndex + 1;
        Count := Count + Result;
        FActiveBufIndex := 1;
        MovedBy := MoveBy(-Count);
        Result := Result + MovedBy;
    end;
end;

function TtsScrollDataset.MoveActiveForward(Count: Longint; var MovedBy: Longint): Longint;
begin
    Result := 0;
    MovedBy := 0;
    if (not Active) or (FActiveBufIndex < 0) then Exit;

    if FActiveBufIndex + Count <= BufferRows then
    begin
        Result := Count;
        Inc(FActiveBufIndex, Count)
    end
    else
    begin
        Result := BufferRows - FActiveBufIndex;
        FActiveBufIndex := BufferRows;
        MovedBy := MoveBy(Count - Result);
        Result := Result + MovedBy;
    end;
end;

function TtsScrollDataset.MoveActive(Count: Longint; var MovedBy: Longint): Longint;
begin
    Result := 0;

    if Count > 0 then
        Result := MoveActiveForward(Count, MovedBy)
    else if Count < 0 then
        Result := MoveActiveBackward(-Count, MovedBy);
end;

function TtsScrollDataset.MoveToRecnr(Row: Longint): Longint;
var
    Count: Longint;
begin
    Result := 0;
    if not Active then Exit;

    Count := Row - FBufFirstRow;
    Result := MoveBy(Count);
end;

procedure TtsScrollDataset.MoveNext;
begin
    if not Active then Exit;
    MoveBy(1);
end;

procedure TtsScrollDataset.MovePrevious;
begin
    if not Active then Exit;
    MoveBy(-1);
end;

procedure TtsScrollDataset.SetActiveRecord(Value: Integer);
begin
    if not Active then Exit;

    FActiveBufIndex := -1;
    ActiveBookmark := EmptyBookmark;
    if (Value >= 1) and (Value <= BufferRows) then
    begin
        FActiveBufIndex := Value;
        ActiveBookmark := Bookmark[FActiveBufIndex];
    end;
end;

function TtsScrollDataset.GetActiveRecord: Integer;
begin
    Result := -1;
    if not Active then Exit;
    if FActiveBufIndex > 0 then Result := FActiveBufIndex;
end;

function TtsScrollDataset.GetActiveRecordNumber: Longint;
begin
    Result := -1;
    if not IsSequenced then Exit;
    Result := SeqNumber[ActiveRecord];
    if Result < 0 then Result := -1;
end;

function TtsScrollDataset.GetRowCountKnown: Boolean;
begin
    Result := FRecCount >= 0;
end;

function TtsScrollDataset.GetBufferRows: Integer;
begin
    Result := FBufLastRow - FBufFirstRow + 1;
end;

function TtsScrollDataset.FirstRow: Longint;
begin
    Result := FBufFirstRow;
end;

function TtsScrollDataset.CurrentBufRow: Integer;
begin
    Result := BufferRow(FGrid.FCurBookmark);
end;

function TtsScrollDataset.BufferPos(Bkm: TBookmarkStr): Integer;
var
    CurBkm: TBookmarkStr;
    CompRes: Integer;
begin
    Result := 0;
    if not Active then Exit;

    if BufferRows > 0 then
    begin
        Result := 0;
        CurBkm := Bookmark[1];
        CompRes := CompareBkm(Bkm, CurBkm);
        if (CompRes = -1) and
           ((VarToStr(Bkm) <> VarToStr(EmptyBookmark)) or (not FRecordInserted)) then Exit;

        Inc(Result);
        if CompRes = 0 then Exit;

        Inc(Result);
        while Result <= BufferRows do
        begin
            CurBkm := Bookmark[Result];
            if CompareBkm(CurBkm, Bkm) = 0 then Break;
            Inc(Result);
        end;
    end;
end;

function TtsScrollDataset.BufferRow(Bkm: TBookmarkStr): Integer;
begin
    Result := BufferPos(Bkm);
    if Result > BufferRows then Result := 0;
end;

function TtsScrollDataset.BufferBkmPos(BkmPos: TtsBkmPos): Integer;
begin
    Result := BufferPos(ActualBkmPos(BkmPos).Bkm);
end;

function TtsScrollDataset.PrevBookmark(Bkm: TBookmarkStr; var PrevBkm: TBookmarkStr): Boolean;
var
    OldBkm: TBookmarkStr;
begin
    OldBkm := ScrollBookmark;
    try
        DbiSetToBookmark(FHandle, PChar(Bkm));
        DbiGetPriorRecord(FHandle, dbiNoLock, nil, nil);
        PrevBkm := ScrollBookmark;
        Result := True;
    finally
        DbiSetToBookmark(FHandle, PChar(OldBkm));
    end;
end;

function TtsScrollDataset.NextBookmark(Bkm: TBookmarkStr; var NextBkm: TBookmarkStr): Boolean;
var
    OldBkm: TBookmarkStr;
begin
    OldBkm := ScrollBookmark;
    try
        DbiSetToBookmark(FHandle, PChar(Bkm));
        DbiGetNextRecord(FHandle, dbiNoLock, nil, nil);
        NextBkm := ScrollBookmark;
        Result := True;
    finally
        DbiSetToBookmark(FHandle, PChar(OldBkm));
    end;
end;

function TtsScrollDataset.CheckPrevBookmark(Bkm: TBookmarkStr): TBookmarkStr;
var
    Err: DbiResult;
    OldBkm: TBookmarkStr;
begin
    OldBkm := ScrollBookmark;
    try
        DbiSetToBookmark(FHandle, PChar(Bkm));
        Err := DbiGetPriorRecord(FHandle, dbiNoLock, nil, nil);
        if Err = DbiErr_None
            then Result := ScrollBookmark
            else Result := Bkm;
    finally
        DbiSetToBookmark(FHandle, PChar(OldBkm));
    end;
end;

function TtsScrollDataset.CheckNextBookmark(Bkm: TBookmarkStr): TBookmarkStr;
var
    Err: DbiResult;
    OldBkm: TBookmarkStr;
begin
    OldBkm := ScrollBookmark;
    try
        DbiSetToBookmark(FHandle, PChar(Bkm));
        Err := DbiGetNextRecord(FHandle, dbiNoLock, nil, nil);
        if Err = DbiErr_None
            then Result := ScrollBookmark
            else Result := Bkm;
    finally
        DbiSetToBookmark(FHandle, PChar(OldBkm));
    end;
end;

function TtsScrollDataset.PrevBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos;
begin
    if BkmPos.Offset = bpoCurrent
        then PrevBookmark(BkmPos.Bkm, Result.Bkm)
        else PrevBookmark(ActualBkmPos(BkmPos).Bkm, Result.Bkm);
    Result.Offset := bpoCurrent;
end;

function TtsScrollDataset.NextBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos;
begin
    if BkmPos.Offset = bpoCurrent
        then NextBookmark(BkmPos.Bkm, Result.Bkm)
        else NextBookmark(ActualBkmPos(BkmPos).Bkm, Result.Bkm);
    Result.Offset := bpoCurrent;
end;

function TtsScrollDataset.CheckPrevBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos;
begin
    if BkmPos.Offset = bpoCurrent
        then Result.Bkm := CheckPrevBookmark(BkmPos.Bkm)
        else Result.Bkm := CheckPrevBookmark(ActualBkmPos(BkmPos).Bkm);
    Result.Offset := bpoCurrent;
end;

function TtsScrollDataset.CheckNextBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos;
begin
    if BkmPos.Offset = bpoCurrent
        then Result.Bkm := CheckNextBookmark(BkmPos.Bkm)
        else Result.Bkm := CheckNextBookmark(ActualBkmPos(BkmPos).Bkm);
    Result.Offset := bpoCurrent;
end;

function TtsScrollDataset.FirstBookmark: TBookmarkStr;
var
    OldBkm: TBookmarkStr;
begin
    Result := EmptyBookmark;
    if RecCount = 0 then Exit;

    OldBkm := ScrollBookmark;
    try
        DbiSetToBegin(FHandle);
        DbiGetNextRecord(FHandle, dbiNoLock, nil, nil);
        Result := ScrollBookmark;
    finally
        DbiSetToBookmark(FHandle, PChar(OldBkm));
    end;
end;

function TtsScrollDataset.LastBookmark: TBookmarkStr;
var
    OldBkm: TBookmarkStr;
begin
    Result := EmptyBookmark;
    if RecCount = 0 then Exit;

    OldBkm := ScrollBookmark;
    try
        DbiSetToEnd(FHandle);
        DbiGetPriorRecord(FHandle, dbiNoLock, nil, nil);
        Result := ScrollBookmark;
    finally
        DbiSetToBookmark(FHandle, PChar(OldBkm));
    end;
end;

function TtsScrollDataset.FirstBkmPos: TtsBkmPos;
begin
    Result := CurBkmPos(FirstBookmark);
end;

function TtsScrollDataset.LastBkmPos: TtsBkmPos;
begin
    Result := CurBkmPos(LastBookmark);
end;

function TtsScrollDataset.CompareBkm(Bkm1, Bkm2: TBookmarkStr): Integer;
begin
    Result := inherited CompareBkm(Bkm1, Bkm2);
end;

function TtsScrollDataset.GetBufferBookmark(BufRow: Integer): TBookmarkStr;
begin
    Result := PBookmark(BufRow)^;
end;

function TtsScrollDataset.GetBookmark(BufRow: Integer): TBookmarkStr;
begin
    Result := EmptyBookmark;
    if not Active then Exit;
    if (BufRow <= 0) or (BufRow > BufferRows) then Exit;

    if (GetBookmarkInfo(BufRow) = bkmInserted)
        then Result := EmptyBookmark
        else Result := GetBufferBookmark(BufRow);
end;

function TtsScrollDataset.GetSeqNumber(BufRow: Integer): Longint;
begin
    Result := -1;
    if not Active then Exit;
    if BufRow < 0 then Exit;

    if (GetBookmarkInfo(BufRow) <> bkmInserted) then
    begin
        Result := PRecInfo(RecordBuffer(BufRow) + FRecInfoStart)^.RecordNumber;
    end;
end;

procedure TtsScrollDataset.SetTempBuffer;
begin
    FOldBufRows := FBufRows;
    FOldBuffer := FBuffer;
    FBuffer := FTempBuffer;
    FBufRows := 1;
    ClearRecIds(1, 1, False);
    ClearBkm(1, 1, False);
end;

procedure TtsScrollDataset.RestoreBuffer;
begin
    ClearRecIds(1, 1, True);
    ClearBkm(1, 1, True);
    FBuffer := FOldBuffer;
    FBufRows := FOldBufRows;
end;

function TtsScrollDataset.GetBookmarkRecID(RecBkm: TBookmarkStr; BufRownr: Integer): Variant;
var
    Err: DbiResult;
    OldBkm: TBookmarkStr;
    OldActiveIndex: Integer;
begin
    if BufRownr > 0 then
    begin
        Result := RecId[BufRownr];
        Exit;
    end;

    if VarToStr(RecBkm) = VarToStr(EmptyBookmark) then
    begin
        Result := EmptyRecId;
        Exit;
    end;

    Result := Unassigned;
    OldBkm := ScrollBookmark;
    OldActiveIndex := FActiveBufIndex;
    SetTempBuffer;

    try
        FActiveBufIndex := 1;
        Err := DbiSetToBookmark(FHandle, PChar(RecBkm));
        if Err = DbiErr_None then
        begin
            try
                RecId[1] := Unassigned;
                GetRecord(1, 0);
                Result := RecId[1];
            except
                Result := Unassigned;
            end;
        end;
    finally
        FActiveBufIndex := OldActiveIndex;
        RestoreBuffer;
        DbiSetToBookmark(FHandle, PChar(OldBkm));
    end;
end;

function TtsScrollDataset.GetBkmValueAndRecordID(Fieldno: Integer; Bkm: TBookmarkStr; var FieldValue: Variant): Variant;
var
    OldBkm: TBookmarkStr;
    OldActiveBkm: TBookmarkStr;
    OldActiveIndex: Integer;
begin
    if VarToStr(Bkm) = VarToStr(EmptyBookmark) then
    begin
        if UseRecordIds
            then Result := EmptyRecId
            else Result := EmptyBookmark;

        OldActiveBkm := ActiveBookmark;
        try
            ActiveBookmark := Bkm;
            FieldValue := FGrid.ActiveCell[Fieldno, Bkm]
        finally
            ActiveBookmark := OldActiveBkm;
        end;
    end
    else
    begin
        OldBkm := ScrollBookmark;
        OldActiveIndex := FActiveBufIndex;
        OldActiveBkm := ActiveBookmark;
        SetTempBuffer;
        try
            FActiveBufIndex := 1;
            DbiSetToBookmark(FHandle, PChar(Bkm));
            GetRecord(1, 0);
            ActiveBookmark := Bookmark[1];
            FieldValue := FGrid.ActiveCell[Fieldno, Bkm];
            Result := RecordId[1];
        finally
            ActiveBookmark := OldActiveBkm;
            FActiveBufIndex := OldActiveIndex;
            RestoreBuffer;
            DbiSetToBookmark(FHandle, PChar(OldBkm));
        end;
    end;
end;

function TtsScrollDataset.GetCursorBookmark(Handle: HDBICur): TBookmarkStr;
begin
    Result := EmptyBookmark;
    if not Active then Exit;

    DbiGetBookMark(Handle, ReadBuffer);
    SetString(Result, ReadBuffer, FBufBookmarkSize);
end;

function TtsScrollDataset.DataSetBookmark: TBookmarkStr;
begin
    Result := GetCursorBookmark(DatasetHandle);
end;

function TtsScrollDataset.GetLocale: TLocale;
begin
    Result := nil;
    if Active and Assigned(FDataset) then Result := DatasetLocale;
end;

procedure TtsScrollDataset.SetEnableCheckRows(Value: Boolean);
begin
    if not Value then
        Inc(FEnableCheckRowsCount)
    else if FEnableCheckRowsCount > 0 then
        Dec(FEnableCheckRowsCount);
end;

function  TtsScrollDataset.GetEnableCheckRows: Boolean;
begin
    Result := (FEnableCheckRowsCount = 0);
end;

function TtsScrollDataset.GetFieldValues(FieldNames: string): Variant;
var
    I: Integer;
    StrPos: Integer;
    Field: TtsDBField;
    FieldList: TList;
begin
    Result := Unassigned;
    if Pos(';', FieldNames) = 0 then
    begin
        Field := FGrid.Field[FieldNames];
        if Assigned(Field) then Result := Field.Value;
    end
    else
    begin
        FieldList := TList.Create;
        try
            StrPos := 1;
            while StrPos <= Length(FieldNames) do
            begin
                Field := FGrid.Field[ExtractFieldName(FieldNames, StrPos)];
                if Assigned(Field) then FieldList.Add(Field);
            end;

            Result := VarArrayCreate([0, FieldList.Count - 1], varVariant);
            for I := 0 to FieldList.Count - 1 do
                Result[I] := TtsDBField(FieldList[I]).Value;
        finally
            FieldList.Free;
        end;
    end;
end;

function  TtsScrollDataset.DatasetMasterSource: TDataSource;
begin
    Result := nil;
    if FDataset is TTable then Result := TTable(FDataset).MasterSource;
end;

function  TtsScrollDataset.DatasetMasterFields: string;
begin
    Result := '';
    if FDataset is TTable then Result := TTable(FDataset).MasterFields;
end;

function TtsScrollDataset.DatasetMasterFieldValues: Variant;
var
    Fields: string;
    DataSource: TDataSource;
begin
    Result := Unassigned;
    if FDataset is TTable then
    begin
        DataSource := DatasetMasterSource;
        if Assigned(DataSource) and Assigned(DataSource.Dataset) then
        begin
            if DataSource.Dataset.Active then
            begin
                Fields := DatasetMasterFields;
                if (Fields <> '') then
                    Result := DataSource.Dataset.FieldValues[Fields];
            end;
        end;
    end;
end;

function TtsScrollDataset.DatasetRecordTypes: Byte;
var
    Value: Longint;
    Length: Word;
begin
    Value := 0;
    DbiGetProp(HDBIObj(DatasetHandle), curDELAYUPDDISPLAYOPT, @Value, SizeOf(Value), Length);
    Result := Byte(Value);
end;

function TtsScrollDataset.FilterChanged: Boolean;
begin
    Result := False;
    if not Active then Exit;
    Result := (FFiltered <> FDataset.Filtered) or
              (FFiltered and ((FFilter <> FDataset.Filter) or
                              (FFilterOptions <> FDataset.FilterOptions)));
end;

function TtsScrollDataset.PropertiesChanged: Boolean;
begin
    Result := False;
    if not Active then Exit;
    Result := (FRecordTypes <> DatasetRecordTypes);
end;

function TtsScrollDataset.FieldValuesEqual(Value1, Value2: Variant): Boolean;
var
    I: Integer;
begin
    try
        if VarType(Value1) <> VarType(Value2) then
            Result := False
        else if VarIsEmpty(Value1) and VarIsEmpty(Value2) then
            Result := True
        else if VarIsNull(Value1) and VarIsNull(Value2) then
            Result := True
        else if VarArrayDimCount(Value1) = 0 then
            Result := (Value1 = Value2)
        else if (VarArrayLowBound(Value1, 1) <> VarArrayLowBound(Value2, 1)) or
                (VarArrayHighBound(Value1, 1) <> VarArrayHighBound(Value2, 1)) then
            Result := False
        else
        begin
            Result := True;
            for I := VarArrayLowBound(Value1, 1) to VarArrayHighBound(Value1, 1) do
            begin
                Result := (Value1[I] = Value2[I]);
                if not Result then Break;
            end;
        end;
    except
        Result := False;
    end;
end;

function TtsScrollDataset.MasterChanged: Boolean;
begin
    Result := False;
    if not Active then Exit;
    Result := (FMasterSource <> DatasetMasterSource) or
              (Assigned(FMasterSource) and (FMasterFields <> DatasetMasterFields));
    if (not Result) and Assigned(FMasterSource) then
        Result := not FieldValuesEqual(FMasterFieldValues, DatasetMasterFieldValues);
end;

function TtsScrollDataset.LocateBookmark(SearchBkm: TBookmarkStr; var StartBkm, LastBkm: TBookmarkStr;
                                         var Count: Longint): DbiResult;
var
    Err: DbiResult;
    CurBkm: TBookmarkStr;
    Comp: Integer;
begin
    if FCountDirection = cdForward then DbiSetToBegin(FHandle)
                                   else DbiSetToBookmark(FHandle, PChar(SearchBkm));
    StartBkm := DatasetBookmark;

    Count := 0;
    Err := DbiErr_None;
    while Err = DbiErr_None do
    begin
        Err := DbiGetNextRecord(FHandle, dbiNoLock, nil, nil);

        if (Err = DbiErr_None) or
           ((Err = DbiErr_Eof) and (FCountDirection = cdBackward)) then
        begin
            Inc(Count);
            CurBkm := ScrollBookmark;
            Comp := CompareBkm(CurBkm, SearchBkm);
            if (FCountDirection = cdForward) and (Comp <> -1) then Break;
        end;
    end;


    if ((Err = DbiErr_Eof) and (FCountDirection = cdBackward)) then
        Err := DbiErr_None;

    LastBkm := ScrollBookmark;
    Result := Err;
end;

procedure TtsScrollDataset.CalculatePos;
var
    OldBkm: TBookmarkStr;
    SearchBkm: TBookmarkStr;
    StartBkm, LastBkm: TBookmarkStr;
    Count: Longint;
    Err: DbiResult;
    DiffRows: Longint;
begin
    if not Active then Exit;
    if BufferRows <= 0 then Exit;

    OldBkm := ScrollBookmark;
    try
        SearchBkm := Bookmark[1];
        Err := LocateBookmark(SearchBkm, StartBkm, LastBkm, Count);
        if Err = DbiErr_None then
        begin
            if FCountDirection = cdForward then
            begin
                if CheckInsertPassed(Err, StartBkm, LastBkm, 1, False) then Inc(Count);
                DiffRows := FBufFirstRow - Count;
            end
            else
            begin
                if CheckInsertPassed(Err, StartBkm, LastBkm, -1, False) then Inc(Count);
                DiffRows := FBufFirstRow - (RecCount + 1 - Count);
            end;

            UpdatePosition(-DiffRows);
            FRepositioned := False;
        end;
    finally
        DbiSetToBookmark(FHandle, PChar(OldBkm));
    end;
end;

function TtsScrollDataset.ScrollBookmark: TBookmarkStr;
begin
    Result := GetCursorBookmark(FHandle);
end;

function TtsScrollDataset.GetRecordId(BufRow: Integer): Variant;
begin
    Result := EmptyBookmark;
    if UseRecordIds then Result := Unassigned;
    if not Active then Exit;
    if (BufRow <= 0) or (BufRow > BufferRows) then Exit;

    if not UseRecordIds
        then Result := Bookmark[BufRow]
        else Result := RecId[BufRow];
end;

function TtsScrollDataset.FindKey(Value: string; Fieldno: Integer; CompareType: TtsComboCompareType;
                                  ParentGrid: TtsCustomDBGrid; FullCmpLen: Boolean; var Found: Boolean): TBookmarkStr;
var
    Err: DbiResult;
    Len: Integer;
    OldBkm: TBookmarkStr;
    CellValue: string;
begin
    Result := EmptyBookmark;
    OldBkm := ScrollBookmark;
    if not Assigned(FGrid.GridCols[Fieldno]) then Exit;
    if not Assigned(FGrid.GridCols[Fieldno].Field) then Exit;

    try
        Err := DbiErr_None;
        if FGrid.GridCols[Fieldno].Field.SetField(FReadBuffer, Value) then
        begin
            Err := DbiSetToKey(FHandle, keySEARCHGEQ, False, 1, 0, FReadBuffer);
            if Err = DbiErr_None then
            begin
                if DbiGetNextRecord(FHandle, dbiNoLock, FReadBuffer, nil) = DbiErr_None then
                begin
                    Result := ScrollBookmark;
                end;
            end;
        end;
    finally
        DbiSetToBookmark(FHandle, PChar(OldBkm));
    end;

    if Err <> DbiErr_None then
    begin
        Result := LocateValue(EmptyBookmark, EmptyBookmark, Value, Fieldno,
                              CompareType, ParentGrid, FullCmpLen, Found);
    end
    else if VarToStr(Result) <> VarToStr(EmptyBookmark) then
    begin
        CellValue := FGrid.BookmarkValue(Fieldno, Result);
        Len := CalcMin(Length(Value), Length(CellValue));
        if FullCmpLen then Len := Length(Value);

        case CompareType of
            ctCaseSensitive: Found := FGrid.CompCaseSensitive(Value, CellValue, Len) = 0;
            ctCaseInsensitive: Found := FGrid.CompCaseInsensitive(Value, CellValue, Len) = 0;
            ctOwn: Found := ParentGrid.CompOwn(Value, CellValue, Len) = 0;
        end;
    end;
end;

function TtsScrollDataset.GetPreviousBkms(var FromBkm: TBookmarkStr; ToBkm: TBookmarkStr;
                                          BkmList: TtsSelectedList;  StepSize: Integer;
                                          SelectingAll: Boolean; var Found: Boolean;
                                          var Count, Total: Longint; var Canceled: Boolean): Boolean;
var
    Err: DbiResult;
    CurBkm: TBookmarkStr;
    CntBkm: Integer;
    Info: RecProps;
    Buffer: PChar;
    CompRes: Integer;
begin
    Found := False;
    CntBkm := 0;
    CurBkm := FromBkm;
    Buffer := FTempBuffer;

    Err := DbiSetToBookmark(FHandle, PChar(CurBkm));
    while (Err = 0) and not Found and ((CntBkm < StepSize) or (StepSize = 0)) do
    begin
        FGrid.DoScanRecord(SelectingAll, sstScan, Count, Total, Canceled);
        if Canceled and (Count >= Total) then Break;

        Inc(CntBkm);
        Err := DbiGetPriorRecord(FHandle, dbiNoLock, Buffer, @Info);
        if Err = 0 then
        begin
            DbiGetBookMark(FHandle, Buffer + FBufRecSize);
            SetString(CurBkm, Buffer + FBufRecSize, FBufBookmarkSize);
            CompRes := CompareBkm(CurBkm, ToBkm);
            if CompRes >= 0 then BkmList.AddItem(CurBkm);
            Found := CompRes <= 0;
        end;
    end;

    Result := (Err <> 0);
    FromBkm := CurBkm;
end;

function TtsScrollDataset.GetNextBkms(var FromBkm: TBookmarkStr; ToBkm: TBookmarkStr;
                                      BkmList: TtsSelectedList; StepSize: Integer;
                                      SelectingAll: Boolean; var Found: Boolean;
                                      var Count, Total: Longint; var Canceled: Boolean): Boolean;
var
    Err: DbiResult;
    CurBkm: TBookmarkStr;
    CntBkm: Integer;
    Info: RecProps;
    Buffer: PChar;
    CompRes: Integer;
begin
    Found := False;
    CntBkm := 0;
    CurBkm := FromBkm;
    Buffer := FTempBuffer;

    if FromBkm <> ''
        then Err := DbiSetToBookmark(FHandle, PChar(CurBkm))
        else Err := DbiSetToBegin(FHandle);

    while (Err = 0) and not Found and ((CntBkm < StepSize) or (StepSize = 0)) do
    begin
        FGrid.DoScanRecord(SelectingAll, sstScan, Count, Total, Canceled);
        if Canceled and (Count >= Total) then Break;

        Inc(CntBkm);
        Err := DbiGetNextRecord(FHandle, dbiNoLock, Buffer, @Info);
        if Err = 0 then
        begin
            DbiGetBookMark(FHandle, Buffer + FBufRecSize);
            SetString(CurBkm, Buffer + FBufRecSize, FBufBookmarkSize);
            CompRes := -1;
            if ToBkm <> '' then CompRes := CompareBkm(CurBkm, ToBkm);
            if CompRes <= 0 then BkmList.AddItem(CurBkm);
            Found := CompRes >= 0;
        end;
    end;

    FromBkm := CurBkm;
    Result := (Err <> 0);
    if (Err = DbiErr_Eof) and (ToBkm = '') then Found := True;
end;

procedure TtsScrollDataset.SetBookmarkPos(Value: TBookmarkStr);
begin
    DbiSetToBookmark(FHandle, PChar(Value));
end;

function TtsScrollDataset.GetBookmarkPos: TBookmarkStr;
begin
    Result := ScrollBookmark;
end;

function TtsScrollDataset.LocateValue(FromBkm, ToBkm: TBookmarkStr; Value: string; Fieldno: Integer;
                                      CompareType: TtsComboCompareType; ParentGrid: TtsCustomDBGrid;
                                      FullCmpLen: Boolean; var Found: Boolean): TBookmarkStr;
var
    Err: DbiResult;
    CurBkm, OldBkm: TBookmarkStr;
    CellValue: string;
    Len: Integer;
    OldActiveIndex: Integer;
    CompLen, CompRes: Integer;
begin
    Found := False;
    if Value = '' then
    begin
        Result := FromBkm;
        Exit;
    end;

    Result := EmptyBookmark;
    OldBkm := ScrollBookmark;
    OldActiveIndex := FActiveBufIndex;
    SetTempBuffer;

    try
        CompLen := 0;
        FActiveBufIndex := 1;
        if VarToStr(FromBkm) <> VarToStr(EmptyBookmark) then
            Err := DbiSetToBookmark(FHandle, PChar(FromBkm))
        else
        begin
            DbiSetToBegin(FHandle);
            Err := DbiGetNextRecord(FHandle, dbiNoLock, nil, nil);
        end;

        while (Err = DbiErr_None) do
        begin
            CurBkm := ScrollBookmark;
            if (VarToStr(ToBkm) <> VarToStr(EmptyBookmark)) and (CompareBkm(CurBkm, ToBkm) = 1) then Break;

            GetRecord(1, 0);
            CellValue := FGrid.ActiveCell[Fieldno, CurBkm];

            CompRes := -2;
            Len := CalcMin(Length(Value), Length(CellValue));
            if FullCmpLen then Len := Length(Value);

            case CompareType of
                ctCaseSensitive: CompRes := FGrid.CompCaseSensitive(Value, CellValue, Len);
                ctCaseInsensitive: CompRes := FGrid.CompCaseInsensitive(Value, CellValue, Len);
                ctOwn: CompRes := ParentGrid.CompOwn(Value, CellValue, Len);
            end;

            if (CompRes = 0) and (Len > CompLen) then
            begin
                Found := True;
                CompLen := Len;
                Result := CurBkm;
                if CompLen = Length(Value) then Break;
            end;

            Err := DbiGetNextRecord(FHandle, dbiNoLock, nil, nil);
        end;
    finally
        FActiveBufIndex := OldActiveIndex;
        RestoreBuffer;
        DbiSetToBookmark(FHandle, PChar(OldBkm));
    end;
end;

function TtsScrollDataset.BookmarkValue(Fieldno: Longint; Bkm: TBookmarkStr): Variant;
var
    OldBkm: TBookmarkStr;
    OldActiveBkm: TBookmarkStr;
    OldActiveIndex: Integer;
begin
    Result := Unassigned;
    if Bkm = '' then
    begin
        OldActiveBkm := ActiveBookmark;
        try
            ActiveBookmark := Bkm;
            Result := FGrid.ActiveCell[Fieldno, Bkm]
        finally
            ActiveBookmark := OldActiveBkm;
        end;
    end
    else
    begin
        OldBkm := ScrollBookmark;
        OldActiveIndex := FActiveBufIndex;
        OldActiveBkm := ActiveBookmark;
        SetTempBuffer;
        try
            FActiveBufIndex := 1;
            DbiSetToBookmark(FHandle, PChar(Bkm));
            GetRecord(1, 0);
            ActiveBookmark := Bookmark[1];
            Result := FGrid.ActiveCell[Fieldno, Bkm];
        finally
            ActiveBookmark := OldActiveBkm;
            FActiveBufIndex := OldActiveIndex;
            RestoreBuffer;
            DbiSetToBookmark(FHandle, PChar(OldBkm));
        end;
    end;
end;

procedure TtsScrollDataset.SetBookmark(BufRow: Integer; Bkm: TBookmarkStr);
begin
    CopyMemory(RecordBuffer(BufRow) + FBufRecSize, PChar(Bkm), FBufBookmarkSize);
end;

procedure TtsScrollDataset.SetInfo(Buffer: PChar; Info: Integer);
begin
    (Buffer + FBufRecSize + FBufBookmarkSize)^ := Char(Info);
end;

procedure TtsScrollDataset.SetBookmarkInfo(BufRow: Integer; Info: Integer);
begin
    if (BufRow <= 0) or (BufRow > FBufRows) then Exit;
    SetInfo(RecordBuffer(BufRow), Info);
end;

function TtsScrollDataset.GetBookmarkInfo(BufRow: Integer): Integer;
begin
    Result := bkmNormal;
    if (BufRow <= 0) or (BufRow > FBufRows) then Exit;
    Result := Integer((RecordBuffer(BufRow) + FBufRecSize + FBufBookmarkSize)^);
end;

function TtsScrollDataset.UseRecordIds: Boolean;
begin
    Result := FGrid.CanUseRecordIds;
end;

function TtsScrollDataset.InsertRecord(MoveDataUp: Boolean; CurBkm: TBookmarkStr): TBookmarkStr;
var
    OldActive: Integer;
    MoveCount: Longint;
    OldBkm: TBookmarkStr;
begin
    Result := EmptyBookmark;
    if not Active then Exit;

    ActiveRecord := BufferRow(CurBkm);
    if ActiveRecord < 0 then
    begin
        OldBkm := ScrollBookmark;
        try
            if VarToStr(CurBkm) <> VarToStr(EmptyBookmark) then
            begin
                DbiSetToBookmark(FHandle, PChar(CurBkm));
                DbiGetPriorRecord(FHandle, dbiNoLock, nil, nil);
            end
            else
                DbiSetToBegin(FHandle);

            FInsertBkm := ScrollBookmark;
        finally
            DbiSetToBookmark(FHandle, PChar(OldBkm));
        end;
    end
    else
    begin
        if ActiveRecord = 1 then SetToRecord(1);
        if MoveDataUp and (ActiveRecord > 1) and (BufferRows = FBufRows) then
        begin
            MoveBuffer(1, 2, ActiveRecord - 2);
            Inc(FBufFirstRow);
            Inc(FBufLastRow);
            ActiveRecord := ActiveRecord - 1;
        end
        else
        begin
            MoveBuffer(ActiveRecord + 1, ActiveRecord, BufferRows - ActiveRecord + 1);
            if BufferRows < FBufRows then Inc(FBufLastRow);
        end;

        if ActiveRecord > 1 then
        begin
            OldActive := ActiveRecord;
            ActiveRecord := ActiveRecord - 1;
            FInsertBkm := Bookmark[ActiveRecord];
            ActiveRecord := OldActive;
        end
        else
        begin
            MoveRelative(-1, MoveCount);
            FInsertBkm := ScrollBookmark;
        end;

        SetBookmark(ActiveRecord, EmptyBookmark);
        SetBookmarkInfo(ActiveRecord, bkmInserted);
        RecId[ActiveRecord] := EmptyRecId;
    end;

    AdjustCountOnInsert;
    FAtEnd := False;
    FAtStart := False;
    FRecordInserted := True;
    Result := EmptyBookmark;
end;

function TtsScrollDataset.AppendRecord(CurBkm: TBookmarkStr): TBookmarkStr;
var
    Redraw: Boolean;
begin
    if FBufRows <= 0 then ResizeBuffer(1, Redraw);
    if not CheckAtEnd then MoveLast;

    if BufferRows = 0 then
    begin
        FInsertBkm := ScrollBookmark;
        FBufFirstRow := 1;
        FBufLastRow := 1;
    end
    else
    begin
        SetToRecord(BufferRows);
        FInsertBkm := ScrollBookmark;

        if BufferRows < FBufRows then
            Inc(FBufLastRow)
        else
        begin
            MoveBuffer(1, 2, BufferRows - 1);
            Inc(FBufFirstRow);
            Inc(FBufLastRow);
        end;
    end;

    AdjustCountOnInsert;
    ActiveRecord := BufferRows;
    SetBookmark(ActiveRecord, EmptyBookmark);
    SetBookmarkInfo(ActiveRecord, bkmInserted);
    RecId[ActiveRecord] := EmptyRecId;

    FRecordInserted := True;
    Result := EmptyBookmark;
end;

function TtsScrollDataset.AppendRecordAtEnd: Boolean;
begin
    Result := False;
    if (not Active) then Exit;
    Result := not (CompareBkm(Bookmark[BufferRows], FInsertBkm) = 1);
end;

procedure TtsScrollDataset.UpdatePosition(DiffRows: Longint);
begin
    Inc(FBufFirstRow, DiffRows);
    Inc(FCursorRow, DiffRows);
    Inc(FBufLastRow, DiffRows);
    Inc(FCountPos, DiffRows);
end;

procedure TtsScrollDataset.RepositionRows(DiffRows: Longint);
begin
    if DiffRows <> 0 then
    begin
        FAtStart := False;
        FAtEnd := False;
        UpdatePosition(DiffRows);
    end;
end;

procedure TtsScrollDataset.EstimatePosition(OldBookmark, NewBookmark: TBookmarkStr);
var
    OldActiveRec: Integer;
    DiffRows: Longint;
    CurRow: Integer;
begin
    OldActiveRec := ActiveRecord;
    try
        CurRow := BufferRow(NewBookmark);
        if (CurRow > 0) and IsSequenced then
        begin
            DiffRows := SeqNumber[ActiveRecord] - (FBufFirstRow + CurRow - 1);
            RepositionRows(DiffRows);
        end
        else if BufferRow(OldBookmark) = 0 then
        begin
            if BufferRows > 0 then
            begin
                FRepositioned := True;
                if CompareBkm(OldBookmark, Bookmark[1]) = 1 then
                begin
                    DiffRows := (FBufFirstRow - 1) div 2;
                    RepositionRows(-DiffRows);
                    FRepositionDirection := cdBackward;
                end
                else
                begin
                    DiffRows := (RecCount - FBufLastRow) div 2;
                    RepositionRows(DiffRows);
                    FRepositionDirection := cdForward;
                end;

                CheckRowCount(DbiErr_None);
            end;
        end;
    finally
        ActiveRecord := OldActiveRec;
    end;
end;

function TtsScrollDataset.SyncToBookmark(NewBookmark, OldBookmark: TBookmarkStr;
                                         TopRow: Integer; MoveToTop: Boolean;
                                         var RowMoved: Boolean): Boolean;
var
    OldCountPos: Longint;
    OldCursorRow: Longint;
    Reposition: Boolean;
begin
    OldCountPos := FCountPos;
    OldCursorRow := FCursorRow;

    Reposition := False;
    Result := RepositionBuffer(NewBookmark, TopRow, MoveToTop, Reposition, RowMoved);

    if Reposition then
    begin
        FCountPos := OldCountPos;
        FCursorRow := OldCursorRow;
        EstimatePosition(OldBookmark, Bookmark[ActiveRecord]);
    end;
end;

function TtsScrollDataset.MoveToRecord(Bkm: TBookmarkStr): Boolean;
var
    RowMoved: Boolean;
begin
    ActiveRecord := FGrid.GridTopRow;
    Result := SyncToBookmark(Bkm, Bookmark[ActiveRecord], CalcMin(1, ActiveRecord), True, RowMoved);
end;

procedure TtsScrollDataset.EndInsert(var NewBookmark: TBookmarkStr; Canceled: Boolean;
                                     Reread: Boolean; TopRow: Integer; var RowMoved: Boolean);
var
    StartRow: Integer;
    OldBookmark: TBookmarkStr;
begin
    RowMoved := False;
    NewBookmark := EmptyBookmark;
    if not Active then Exit;

    if Canceled then
    begin
        StartRow := 1;
        if BufferRows = 1 then
            StartRow := 0
        else if (BufferRows > 1) then
        begin
            CheckOnInsertRecord(1);
            if OnInsertRecord then
            begin
                FOnInsertRecord := False;
                MoveBuffer(1, 2, BufferRows - 1);
                Dec(FBufLastRow);
                if FCursorRow > 1 then Dec(FCursorRow);
            end;
        end;

        FRecordInserted := False;
        NewBookmark := DataSetBookmark;
        AdjustCountOnCancel;
        ActiveRecord := 1;
        if Reread then RereadBuffer(StartRow, False);
    end
    else
    begin
        ActiveRecord := BufferRow(EmptyBookmark);
        FRecordInserted := False;
        NewBookmark := DataSetBookmark;

        if ActiveRecord < 0 then Exit;
        OldBookmark := FInsertBkm;
        SyncToBookmark(NewBookmark, OldBookmark, TopRow, False, RowMoved);
    end;
end;

procedure TtsScrollDataset.EndUpdate(var NewBookmark: TBookmarkStr; TopRow: Integer;
                                     var RowMoved, BufferMoved: Boolean);
var
    OldBookmark: TBookmarkStr;
begin
    RowMoved := False;
    BufferMoved := False;
    if not Active then Exit;
    if (ActiveRecord <= 0) or (ActiveRecord > BufferRows) then Exit;

    FRecordInserted := False;
    OldBookmark := Bookmark[ActiveRecord];
    NewBookmark := DataSetBookmark;

    if (CompareBkm(OldBookmark, NewBookmark) = 0) and (VarToStr(NewBookmark) <> VarToStr(EmptyBookmark)) then
        RereadBuffer(1, False)
    else
    begin
        RowMoved := True;
        SyncToBookmark(NewBookmark, OldBookmark, TopRow, False, BufferMoved);
    end;
end;

procedure TtsScrollDataset.ForceReread;
begin
    DbiForceReread(FHandle);
end;

procedure TtsScrollDataset.RereadBuffer(TopRow: Longint; ForceRead: Boolean);
var
    Err: DbiResult;
    MoveCount: Longint;
begin
    if not Active then Exit;
    if ForceRead then ForceReread;
    if BufferRows > 0 then
    begin
        SetToRecord(TopRow);
        if TopRow > 1 then AtEnd := False;
        if TopRow = 1 then AtStart := False;

        Err := MoveRelative(-1, MoveCount);
        if Err = DbiErr_Bof then
            MoveFirst
        else
        begin
            Err := MoveRelative(FBufRows, MoveCount);
            if Err = DbiErr_Eof then
                MoveLast
            else
            begin
                MoveRelative(1, MoveCount);
                FBufFirstRow := FBufLastRow + 1;
                Err := GetRecords(FBufRows, 1, -1, MoveCount);
                if Err <> DbiErr_Bof then CheckErr(Err);
                if Err = DbiErr_Bof then MoveFirst;
            end;
        end;
    end
    else
    begin
        MoveFirst;
    end;
end;

procedure TtsScrollDataset.SetProperties(Reread: Boolean);
begin
    FRecordTypes := DatasetRecordTypes;
    DbiSetProp(hDbiObj(FHandle), curDELAYUPDDISPLAYOPT, Longint(FRecordTypes));
    if Reread then RereadBuffer(1, True);
end;

function TtsScrollDataset.InBuffer(FromRow: Integer; Bkm: TBookmarkStr): Boolean;
var
    OldBkm, StartBkm, EndBkm: TBookmarkStr;
begin
    Result := (VarToStr(Bkm) <> VarToStr(EmptyBookmark)) and (BufferRows >= FromRow);
    if not Result then Exit;

    StartBkm := Bookmark[FromRow];
    EndBkm := Bookmark[BufferRows];

    if (VarToStr(EndBkm) <> VarToStr(EmptyBookmark)) then
    begin
        Result := (CompareBkm(Bkm, StartBkm) <> -1) and
                  (CompareBkm(Bkm, EndBkm) <> 1);
    end
    else
    begin
        OldBkm := ScrollBookmark;
        try
            DbiSetToBookmark(FHandle, PChar(FInsertBkm));
            DbiGetNextRecord(FHandle, dbiNoLock, nil, nil);
            EndBkm := ScrollBookmark;
        finally
            DbiSetToBookmark(FHandle, PChar(OldBkm));
        end;

        Result := (CompareBkm(Bkm, StartBkm) <> -1);
        if FRecordInserted then
            Result := Result and (CompareBkm(Bkm, EndBkm) = -1)
        else
            Result := Result and (CompareBkm(Bkm, EndBkm) <> 1);
    end;
end;

function TtsScrollDataset.SetPosOnBookmark(Bkm: TBookmarkStr; TopRow: Integer;
                                           MoveToTop: Boolean; var Reposition,
                                           RowMoved: Boolean; var Err: DbiResult): Boolean;
var
    MoveCount: Longint;
begin
    Err := DbiErr_None;
    Result := False;
    Reposition := True;
    RowMoved := True;

    EnableCheckRows := False;
    try
        if MoveToTop then
        begin
            if FRecordInserted and (VarToStr(Bkm) = VarToStr(EmptyBookmark)) then
            begin
                Result := True;
                Reposition := True;
                RowMoved := True;
                DbiSetToBookMark(FHandle, PChar(FInsertBkm));
                Err := MoveRelative(-TopRow + 1, MoveCount);
            end
            else if VarToStr(Bkm) <> VarToStr(EmptyBookmark) then
            begin
                Result := True;
                Reposition := True;
                RowMoved := True;
                DbiSetToBookMark(FHandle, PChar(Bkm));
                Err := MoveRelative(-TopRow, MoveCount);
            end
        end
        else
        begin
            if InBuffer(TopRow, Bkm) then
            begin
                Result := True;
                Reposition := False;
                RowMoved := False;
                SetToRecord(TopRow);
                if GetBookmarkInfo(1) = bkmInserted then
                    Err := MoveRelative(-TopRow + 1, MoveCount)
                else
                    Err := MoveRelative(-TopRow, MoveCount);
            end
            else
            begin
                Result := True;
                DbiSetToBookMark(FHandle, PChar(Bkm));
                Err := MoveRelative(-1, MoveCount);
            end;
        end;
    finally
        EnableCheckRows := True;
    end;
end;

function TtsScrollDataset.RepositionBuffer(ActiveBkm: TBookmarkStr; TopRow: Integer;
                                           MoveToTop: Boolean; var Reposition, RowMoved: Boolean): Boolean;
var
    Err: DbiResult;
    MoveCount: Longint;
begin
    Result := SetPosOnBookmark(ActiveBkm, TopRow, MoveToTop, Reposition,
                               RowMoved, Err);
    if not Result then Exit;

    if Err = DbiErr_Bof then
    begin
        MoveFirst;
        Reposition := False;
    end
    else
    begin
        EnableCheckRows := False;
        try
            FBufLastRow := FBufFirstRow - 1;
            Err := GetRecords(1, FBufRows, 1, MoveCount);
        finally
            EnableCheckRows := True;
        end;

        if Err <> DbiErr_Eof then CheckErr(Err);
        if Err = DbiErr_Eof then
        begin
            MoveLast;
            Reposition := False;
        end;
    end;

    ActiveRecord := BufferRow(ActiveBkm);
end;

{TtsDBGridCols}

function TtsDBGridCols.CreateCol: TtsCol;
begin
    Result := TtsDBCol.Create(Grid);
end;

function TtsDBGridCols.GetDBCol(DataCol: Variant): TtsDBCol;
begin
    Result := TtsDBCol(GetCol(DataCol));
end;

function TtsDBGridCols.GetDBGrid: TtsCustomDBGrid;
begin
    Result := TtsCustomDBGrid(inherited Grid);
end;

procedure TtsDBGridCols.SetFieldState(Value: TtsFieldState);
begin
    if Value <> FFieldState then
    begin
        FFieldState := Value;
        if FFieldState = fsDefault then
        begin
            Grid.FieldLayoutChanged(True, False, False);
            Grid.DoFieldLayoutChange;
        end;
    end;
end;

function TtsDBGridCols.FindField(Field: TField): TtsDBCol;
var
    DataCol: Longint;
begin
    Result := nil;
    DataCol := 0;
    while DataCol < Size - 1 do
    begin
        Inc(DataCol);
        if Field = Col[DataCol].DatasetField then
        begin
            Result := Col[DataCol];
            Break;
        end;
    end;
end;

{TtsDBRowElement}

procedure TtsDBRowElement.Assign(Source: TtsCustomElement);
begin
    if Source is TtsDBRowElement then
    begin
        FDataRow := TtsDBRowElement(Source).FDataRow;
    end;
    inherited;
end;

constructor TtsDBRowElement.Create(Grid: TtsBaseGrid; DataRow: Variant);
begin
    inherited Create(Grid);
    FDataRow := DataRow;
    Self.Grid.ResetLastRow;
end;

destructor TtsDBRowElement.Destroy;
begin
    Grid.ResetLastRow;
    inherited;
end;

procedure TtsDBRowElement.FontChange(Sender: TObject);
var
    DisplayRow: Longint;
    Invalidated: Boolean;
begin
    DisplayRow := Grid.RecordIDRow(FDataRow, True);
    if DisplayRow > 0 then
    begin
        Invalidated := Grid.CheckInvalidateRow(DisplayRow);
        if Invalidated and (Grid.CurDisplayRow = DisplayRow) then
            Grid.RedisplayControl(True);
    end;
end;

function TtsDBRowElement.GetGrid: TtsCustomDBGrid;
begin
    Result := TtsCustomDBGrid(inherited Grid);
end;

function TtsDBRowElement.Compare(NodeSet: TtsCustomSet; Value: TtsSetElement): TtsSetOrder;
begin
    Result := CompareKey(NodeSet, [TtsDBRowElement(Value).FDataRow]);
end;

function TtsDBRowElement.CompareKey(NodeSet: TtsCustomSet; const KeyValue: array of const): TtsSetOrder;
var
    CompRes: Integer;
begin
    CompRes := Grid.CompareRecordIds(KeyValue[0].VVariant^, FDataRow);
    if CompRes > 0 then
        Result := ordLarger
    else if CompRes < 0 then
        Result := ordSmaller
    else
        Result := ordEqual;
end;

{TtsDBCellElement}

procedure TtsDBCellElement.Assign(Source: TtsCustomElement);
begin
    if Source is TtsDBCellElement then
    begin
        FDataCol := TtsDBCellElement(Source).FDataCol;
        FDataRow := TtsDBCellElement(Source).FDataRow;
    end;
    inherited;
end;

constructor TtsDBCellElement.Create(Grid: TtsBaseGrid; DataCol: Longint; DataRow: Variant);
begin
    inherited Create(Grid);
    FDataCol := DataCol;
    FDataRow := DataRow;
    TtsCustomDBGrid(FGrid).ResetLastCell;
end;

destructor TtsDBCellElement.Destroy;
begin
    TtsCustomDBGrid(FGrid).ResetLastCell;
    inherited;
end;

procedure TtsDBCellElement.FontChange(Sender: TObject);
var
    DisplayCol, DisplayRow: Longint;
    Invalidated: Boolean;
begin
    DisplayRow := Grid.RecordIDRow(FDataRow, True);
    if (FDataCol > 0) and (FDataCol <= Grid.ColCount - 1) and (DisplayRow > 0) then
    begin
        DisplayCol := Grid.GetDisplayCol(FDataCol);
        Invalidated := Grid.CheckInvalidateCell(DisplayCol, DisplayRow);
        if Invalidated and (Grid.CurDisplayCol = DisplayCol) and
           (Grid.CurDisplayRow = DisplayRow) then
        begin
            Grid.RedisplayControl(True);
        end;
    end;
end;

function TtsDBCellElement.GetGrid: TtsCustomDBGrid;
begin
    Result := TtsCustomDBGrid(inherited Grid);
end;

function TtsDBCellElement.Compare(NodeSet: TtsCustomSet; Value: TtsSetElement): TtsSetOrder;
begin
    Result := CompareKey(NodeSet, [TtsDBCellElement(Value).FDataCol,
                         TtsDBCellElement(Value).FDataRow]);
end;

function TtsDBCellElement.CompareKey(NodeSet: TtsCustomSet; const KeyValue: array of const): TtsSetOrder;
var
    CompRes: Integer;
begin
    if KeyValue[0].VInteger > FDataCol then
        Result := ordLarger
    else if KeyValue[0].VInteger < FDataCol then
        Result := ordSmaller
    else
    begin
        CompRes := Grid.CompareRecordIds(KeyValue[1].VVariant^, FDataRow);
        if CompRes > 0 then
            Result := ordLarger
        else if CompRes < 0 then
            Result := ordSmaller
        else
            Result := ordEqual;
    end;
end;

procedure TtsDBCellElement.AssignCombo;
begin
    if not Assigned(FCombo) then
    begin
        inherited;
        if (FDataCol >= 1) and (FDataCol <= Grid.Cols) then
            FCombo.Grid.DefaultColWidth := Grid.Col[FDataCol].Width + 10;
    end;
end;

{TtsDBRowPropSet}

function TtsDBRowPropSet.CreateElement(const KeyValue: array of const): TtsCustomElement;
begin
    Result := TtsDBRowElement.Create(Grid, KeyValue[0].VVariant^);
end;

procedure TtsDBRowPropSet.DeleteElement(Element: TtsCustomElement);
begin
    Remove([TtsDBRowElement(Element).FDataRow]);
end;

function TtsDBRowPropSet.CheckDelete(Element: TtsCustomElement): Boolean;
begin
    Result := Element.Empty;
    if Result then DeleteElement(Element);
end;

function TtsDBRowPropSet.SetProperty(const KeyValue: array of const; var Element: TtsCustomElement;
                                     const Value: Variant; Prop: TtsProperty; PropId: Integer; Redraw: Boolean): Boolean;
var
    DataRow: Variant;
begin
    if Element <> nil
        then DataRow := TtsDBRowElement(Element).FDataRow
        else DataRow := KeyValue[0].VVariant^;

    Grid.FGridData.ClearPropBuffer(0, 0, True);
    Result := inherited SetProperty(KeyValue, Element, Value, Prop, PropId, False);
    if Result then
    begin
        if Prop = prMask then
            Grid.CheckSetMask(Grid.CurDataCol, DataRow)
        else if Redraw then
            Grid.RedrawRow(DataRow, True, Prop);
    end;
end;

function TtsDBRowPropSet.GetGrid: TtsCustomDBGrid;
begin
    Result := TtsCustomDBGrid(inherited Grid);
end;

{TtsDBCellPropSet}

procedure TtsDBCellPropSet.CheckRedraw(DataCol: Longint; DataRow: Variant; CheckInvalidate: Boolean);
var
    DisplayCol, DisplayRow: Longint;
    Invalidated: Boolean;
begin
    DisplayCol := Grid.GetDisplayCol(DataCol);
    DisplayRow := Grid.RecordIDRow(DataRow, True);
    if (DisplayRow > 0) and (DisplayRow <= Grid.RowCount - 1) then
    begin
        if CheckInvalidate then
            Invalidated := Grid.CheckInvalidateCell(DisplayCol, DisplayRow)
        else
        begin
            Invalidated := True;
            Grid.InvalidateCell(DisplayCol, DisplayRow);
        end;

        if Invalidated and (Grid.CurDisplayCol = DisplayCol) and
           (Grid.CurDisplayRow = DisplayRow) then
        begin
            Grid.RedisplayControl(True);
        end;
    end;
end;

function TtsDBCellPropSet.CreateElement(const KeyValue: array of const): TtsCustomElement;
begin
    Result := TtsDBCellElement.Create(Grid, KeyValue[0].VInteger, KeyValue[1].VVariant^);
end;

procedure TtsDBCellPropSet.DeleteElement(Element: TtsCustomElement);
begin
    Remove([TtsDBCellElement(Element).FDataCol, TtsDBCellElement(Element).FDataRow]);
end;

function TtsDBCellPropSet.CheckDelete(Element: TtsCustomElement): Boolean;
begin
    Result := Element.Empty;
    if Result then DeleteElement(Element);
end;

function TtsDBCellPropSet.SetProperty(const KeyValue: array of const; var Element: TtsCustomElement;
                                      const Value: Variant; Prop: TtsProperty; PropId: Integer; Redraw: Boolean): Boolean;
var
    DataCol: Longint;
    DataRow: Variant;
begin
    if Element <> nil then
    begin
        DataCol := TtsDBCellElement(Element).FDataCol;
        DataRow := TtsDBCellElement(Element).FDataRow;
    end
    else
    begin
        DataCol := KeyValue[0].VInteger;
        DataRow := KeyValue[1].VVariant^;
    end;

    Result := inherited SetProperty(KeyValue, Element, Value, Prop, PropId, Redraw);
    if Result then
    begin
        if not (csDestroying in Grid.ComponentState) then
        begin
            if (DataCol > 0) and (DataCol <= Grid.ColCount - 1) then
            begin
                if Prop = prMask then
                    Grid.CheckSetMask(DataCol, DataRow)
                else if Redraw then
                    CheckRedraw(DataCol, DataRow, Grid.IsDrawProp(Prop));
            end;
        end;
    end;
end;

function TtsDBCellPropSet.GetGrid: TtsCustomDBGrid;
begin
    Result := TtsCustomDBGrid(inherited Grid);
end;

{TtsDBCell}

constructor TtsDBCell.Create(Grid: TtsBaseGrid; DataCol: Longint; DataRow: Variant);
begin
    inherited;
    FAssignedProps := [];
    FElement := nil;
end;

destructor TtsDBCell.Destroy;
begin
    FElement.Free;
    inherited;
end;

function TtsDBCell.GetDBGrid: TtsCustomDBGrid;
begin
    Result := TtsCustomDBGrid(FGrid);
end;

procedure TtsDBCell.SetDBGrid(Value: TtsCustomDBGrid);
begin
    FGrid := Value;
end;

function TtsDBCell.GetElement: TtsDBCellElement;
begin
    if not Assigned(FElement) then
        FElement := TtsDBCellElement.Create(Grid, DataCol, DataRow);
    Result := FElement;
end;

function TtsDBCell.GetColor: TColor;
begin
    if (Grid.ReadBoundProps or Grid.ApplyBoundProps)
        then Result := Element.FColor
        else Result := Grid.CellColor[DataCol, DataRow];
end;

procedure TtsDBCell.SetColor(Value: TColor);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FColor := Value;
        Include(FAssignedProps, prColor);
    end
    else if (not Grid.ApplyBoundProps) or (prColor in FAssignedProps) then
        Grid.CellColor[DataCol, DataRow] := Value
end;

function TtsDBCell.GetControlType: TtsControlType;
begin
    if (Grid.ReadBoundProps or Grid.ApplyBoundProps)
        then Result := Element.FControlType
        else Result := Grid.CellControlType[DataCol, DataRow];
end;

procedure TtsDBCell.SetControlType(Value: TtsControlType);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FControlType := Value;
        Include(FAssignedProps, prControlType);
    end
    else if (not Grid.ApplyBoundProps) or (prControlType in FAssignedProps) then
        Grid.CellControlType[DataCol, DataRow] := Value
end;

function TtsDBCell.GetSpinOptions: TtsSpinOptions;
begin
    if (Grid.ReadBoundProps or Grid.ApplyBoundProps)
        then Result := Element.FSpinOptions
        else Result := Grid.CellSpinOptions[DataCol, DataRow];
end;

procedure TtsDBCell.SetSpinOptions(Value: TtsSpinOptions);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FSpinOptions := Value;
        Include(FAssignedProps, prSpinOptions);
    end
    else if (not Grid.ApplyBoundProps) or (prSpinOptions in FAssignedProps) then
        Grid.CellSpinOptions[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetSpinIncrement: Double;
begin
    if (Grid.ReadBoundProps or Grid.ApplyBoundProps)
        then Result := Element.FSpinIncrement
        else Result := Grid.CellSpinIncrement[DataCol, DataRow];
end;

procedure TtsDBCell.SetSpinIncrement(Value: Double);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FSpinIncrement := Value;
        Include(FAssignedProps, prSpinIncrement);
    end
    else if (not Grid.ApplyBoundProps) or (prSpinIncrement in FAssignedProps) then
        Grid.CellSpinIncrement[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetFont: TFont;
begin
    if Grid.ReadBoundProps then
    begin
        if not Assigned(Element.FFont) then Element.FFont := TFont.Create;
        Result := Element.FFont;
        Include(FAssignedProps, prFont);
    end
    else if Grid.ApplyBoundProps then
        Result := Element.FFont
    else
        Result := Grid.CellFont[DataCol, DataRow];
end;

procedure TtsDBCell.SetFont(Value: TFont);
begin
    if Grid.ReadBoundProps then
    begin
        if not Assigned(Element.FFont) then Element.FFont := TFont.Create;
        Element.FFont.Assign(Value);
        Include(FAssignedProps, prFont);
    end
    else if (not Grid.ApplyBoundProps) or (prFont in FAssignedProps) then
        Grid.CellFont[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetParentFont: Boolean;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FParentFont
        else Result := Grid.CellParentFont[DataCol, DataRow];
end;

procedure TtsDBCell.SetParentFont(Value: Boolean);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FParentFont := Value;
        Include(FAssignedProps, prParentFont);
    end
    else if (not Grid.ApplyBoundProps) or (prParentFont in FAssignedProps) then
        Grid.CellParentFont[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetAlignment: TAlignment;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FAlignment
        else Result := Grid.CellAlignment[DataCol, DataRow];
end;

procedure TtsDBCell.SetAlignment(Value: TAlignment);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FAlignment := Value;
        Include(FAssignedProps, prAlignment);
    end
    else if (not Grid.ApplyBoundProps) or (prAlignment in FAssignedProps) then
        Grid.CellAlignment[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetAlign: Boolean;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FAlign
        else Result := Grid.CellAlign[DataCol, DataRow];
end;

procedure TtsDBCell.SetAlign(Value: Boolean);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FAlign := Value;
        Include(FAssignedProps, prAlign);
    end
    else if (not Grid.ApplyBoundProps) or (prAlign in FAssignedProps) then
        Grid.CellAlign[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetHorzAlignment: TtsHorzAlignment;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FHorzAlignment
        else Result := Grid.CellHorzAlignment[DataCol, DataRow];
end;

procedure TtsDBCell.SetHorzAlignment(Value: TtsHorzAlignment);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FHorzAlignment := Value;
        Include(FAssignedProps, prHorzAlignment);
    end
    else if (not Grid.ApplyBoundProps) or (prHorzAlignment in FAssignedProps) then
        Grid.CellHorzAlignment[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetVertAlignment: TtsVertAlignment;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FVertAlignment
        else Result := Grid.CellVertAlignment[DataCol, DataRow];
end;

procedure TtsDBCell.SetVertAlignment(Value: TtsVertAlignment);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FVertAlignment := Value;
        Include(FAssignedProps, prVertAlignment);
    end
    else if (not Grid.ApplyBoundProps) or (prVertAlignment in FAssignedProps) then
        Grid.CellVertAlignment[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetIs3D: Boolean;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FIs3D
        else Result := Grid.CellIs3D[DataCol, DataRow];
end;

procedure TtsDBCell.SetIs3D(Value: Boolean);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FIs3D := Value;
        Include(FAssignedProps, prIs3D);
    end
    else if (not Grid.ApplyBoundProps) or (prIs3D in FAssignedProps) then
        Grid.CellIs3D[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetWordWrap: TtsWordWrap;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FWordWrap
        else Result := Grid.CellWordWrap[DataCol, DataRow];
end;

procedure TtsDBCell.SetWordWrap(Value: TtswordWrap);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FWordWrap := Value;
        Include(FAssignedProps, prWordWrap);
    end
    else if (not Grid.ApplyBoundProps) or (prWordWrap in FAssignedProps) then
        Grid.CellWordWrap[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetButtonType: TtsButtonType;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FButtonType
        else Result := Grid.CellButtonType[DataCol, DataRow];
end;

procedure TtsDBCell.SetButtonType(Value: TtsButtonType);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FButtonType := Value;
        Include(FAssignedProps, prButtonType);
    end
    else if (not Grid.ApplyBoundProps) or (prButtonType in FAssignedProps) then
        Grid.CellButtonType[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetDropDownStyle: TtsDropDownStyle;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.DropDownStyle
        else Result := Grid.CellDropDownStyle[DataCol, DataRow];
end;

procedure TtsDBCell.SetDropDownStyle(Value: TtsDropDownStyle);
begin
    if Grid.ReadBoundProps then
    begin
        Element.DropDownStyle := Value;
        Include(FAssignedProps, prDropDownStyle);
    end
    else if (not Grid.ApplyBoundProps) or (prDropDownStyle in FAssignedProps) then
        Grid.CellDropDownStyle[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetReadOnly: TtsReadOnly;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FCellReadOnly
        else Result := Grid.CellReadOnly[DataCol, DataRow];
end;

procedure TtsDBCell.SetReadOnly(Value: TtsReadOnly);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FCellReadOnly := Value;
        Include(FAssignedProps, prReadOnly);
    end
    else if (not Grid.ApplyBoundProps) or (prReadOnly in FAssignedProps) then
        Grid.CellReadOnly[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetMaskName: string;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FMaskName
        else Result := Grid.CellMaskName[DataCol, DataRow];
end;

procedure TtsDBCell.SetMaskName(Value: string);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FMaskName := Value;
        Include(FAssignedProps, prMask);
    end
    else if (not Grid.ApplyBoundProps) or (prMask in FAssignedProps) then
        Grid.CellMaskName[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetAutoCreateFont: Boolean;
var
    Element: TtsDBCellElement;
begin
    Result := False;
    if not Grid.DataBound then begin Result := inherited GetAutoCreateFont; Exit; end;
    if Grid.FDBCellPropSet.Count = 0 then Exit;

    Element := TtsDBCellElement(Grid.FDBCellPropSet.Get([DataCol, DataRow]));
    if Element <> nil then Result := Element.FAutoCreateFont;
end;

procedure TtsDBCell.SetAutoCreateFont(Value: Boolean);
var
    Element: TtsCustomElement;
begin
    if not Grid.DataBound then begin inherited SetAutoCreateFont(Value); Exit; end;
    Element := TtsCustomElement(Grid.FDBCellPropSet.Get([DataCol, DataRow]));
    Grid.FDBCellPropSet.SetAutoCreateFont([DataCol, DataRow], Element, Value);
end;

function TtsDBCell.GetCombo: TtsCombo;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FCombo
        else Result := Grid.CellCombo[DataCol, DataRow];
end;

procedure TtsDBCell.SetCombo(Value: TtsCombo);
begin
    if Grid.ReadBoundProps then
    begin
        if not Assigned(Element.FCombo) then Element.AssignCombo;
        Element.FCombo.Assign(Value);
        Include(FAssignedProps, prCombo);
    end
    else if (not Grid.ApplyBoundProps) or (prCombo in FAssignedProps) then
        Grid.CellCombo[DataCol, DataRow] := TtsDBCombo(Value);
end;

procedure TtsDBCell.AssignCombo;
begin
    if Grid.ReadBoundProps then
    begin
        if not Assigned(Element.FCombo) then Element.AssignCombo;
        Include(FAssignedProps, prCombo);
    end
    else
        Grid.AssignCellCombo(DataCol, DataRow);
end;

function TtsDBCell.GetParentCombo: Boolean;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FParentCombo
        else Result := Grid.CellParentCombo[DataCol, DataRow];
end;

procedure TtsDBCell.SetParentCombo(Value: Boolean);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FParentCombo := Value;
        Include(FAssignedProps, prParentCombo);
    end
    else if (not Grid.ApplyBoundProps) or (prParentCombo in FAssignedProps) then
        Grid.CellParentCombo[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetStretchPicture: TtsDrawOption;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FStretchPicture
        else Result := Grid.CellStretchPicture[DataCol, DataRow];
end;

procedure TtsDBCell.SetStretchPicture(Value: TtsDrawOption);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FStretchPicture := Value;
        Include(FAssignedProps, prPicture);
    end
    else if (not Grid.ApplyBoundProps) or (prPicture in FAssignedProps) then
        Grid.CellStretchPicture[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetShrinkPicture: TtsDrawOption;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FShrinkPicture
        else Result := Grid.CellShrinkPicture[DataCol, DataRow];
end;

procedure TtsDBCell.SetShrinkPicture(Value: TtsDrawOption);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FShrinkPicture := Value;
        Include(FAssignedProps, prPicture);
    end
    else if (not Grid.ApplyBoundProps) or (prPicture in FAssignedProps) then
        Grid.CellShrinkPicture[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetCenterPicture: TtsDrawOption;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FCenterPicture
        else Result := Grid.CellCenterPicture[DataCol, DataRow];
end;

procedure TtsDBCell.SetCenterPicture(Value: TtsDrawOption);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FCenterPicture := Value;
        Include(FAssignedProps, prPicture);
    end
    else if (not Grid.ApplyBoundProps) or (prPicture in FAssignedProps) then
        Grid.CellCenterPicture[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetKeepAspectRatio: TtsDrawOption;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FKeepAspectRatio
        else Result := Grid.CellKeepAspectRatio[DataCol, DataRow];
end;

procedure TtsDBCell.SetKeepAspectRatio(Value: TtsDrawOption);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FKeepAspectRatio := Value;
        Include(FAssignedProps, prPicture);
    end
    else if (not Grid.ApplyBoundProps) or (prPicture in FAssignedProps) then
        Grid.CellKeepAspectRatio[DataCol, DataRow] := Value;
end;

function TtsDBCell.GetDateTimeDef: TtsDateTimeDefComponent;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FDateTimeDef
        else Result := Grid.CellDateTimeDef[DataCol, DataRow];
end;

procedure TtsDBCell.SetDateTimeDef(Value: TtsDateTimeDefComponent);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FDateTimeDef := Value;
        Include(FAssignedProps, prDateTime);
    end
    else if (not Grid.ApplyBoundProps) or (prDateTime in FAssignedProps) then
        Grid.CellDateTimeDef[DataCol, DataRow] := Value;
end;

{TtsDBRow}

constructor TtsDBRow.Create(Grid: TtsBaseGrid; DataRow: Variant);
begin
    inherited;
    FAssignedProps := [];
    FElement := nil;
end;

destructor TtsDBRow.Destroy;
begin
    FElement.Free;
    inherited;
end;

procedure TtsDBRow.Assign(Source: TPersistent);
begin
    if not Grid.DataBound then begin inherited; Exit; end;

    if Source is TtsDBRow then
    begin
        AssignObject(Self, Source, 'Font;ParentFont');
        Combo := TtsDBRow(Source).Combo;
        ParentFont := TtsDBRow(Source).ParentFont;
        if not ParentFont then Font := TtsDBRow(Source).Font;
    end
    else
        inherited;
end;

function TtsDBRow.GetGrid: TtsCustomDBGrid;
begin
    Result := TtsCustomDBGrid(FGrid);
end;

procedure TtsDBRow.SetGrid(Value: TtsCustomDBGrid);
begin
    FGrid := Value;
end;

function TtsDBRow.GetElement: TtsDBRowElement;
begin
    if not Assigned(FElement) then
        FElement := TtsDBRowElement.Create(Grid, DataRow);
    Result := FElement;
end;

function TtsDBRow.GetColor: TColor;
begin
    if (Grid.ReadBoundProps or Grid.ApplyBoundProps)
        then Result := Element.FColor
        else Result := Grid.RowColor[DataRow];
end;

procedure TtsDBRow.SetColor(Value: TColor);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FColor := Value;
        Include(FAssignedProps, prColor);
    end
    else if (not Grid.ApplyBoundProps) or (prColor in FAssignedProps) then
        Grid.RowColor[DataRow] := Value
end;

function TtsDBRow.GetDisplayRow: Longint;
begin
    Result := Grid.DisplayRownr[DataRow];
end;

procedure TtsDBRow.SetDisplayRow(Value: Longint);
begin
    if (not Grid.ReadBoundProps) and (not Grid.ApplyBoundProps) then
        Grid.DisplayRownr[DataRow] := Value;
end;

function TtsDBRow.GetFont: TFont;
begin
    if Grid.ReadBoundProps then
    begin
        if not Assigned(Element.FFont) then Element.FFont := TFont.Create;
        Result := Element.FFont;
        Include(FAssignedProps, prFont);
    end
    else if Grid.ApplyBoundProps then
        Result := Element.FFont
    else
        Result := Grid.RowFont[DataRow];
end;

procedure TtsDBRow.SetFont(Value: TFont);
begin
    if Grid.ReadBoundProps then
    begin
        if not Assigned(Element.FFont) then Element.FFont := TFont.Create;
        Element.FFont.Assign(Value);
        Include(FAssignedProps, prFont);
    end
    else if (not Grid.ApplyBoundProps) or (prFont in FAssignedProps) then
        Grid.RowFont[DataRow] := Value;
end;

function TtsDBRow.GetCombo: TtsCombo;
begin
    if (Grid.ReadBoundProps or Grid.ApplyBoundProps)
        then Result := Element.FCombo
        else Result := Grid.RowCombo[DataRow];
end;

procedure TtsDBRow.SetCombo(Value: TtsCombo);
begin
    if Grid.ReadBoundProps then
    begin
        if not Assigned(Element.FCombo) then Element.AssignCombo;
        Element.FCombo.Assign(Value);
        Include(FAssignedProps, prCombo);
    end
    else if (not Grid.ApplyBoundProps) or (prCombo in FAssignedProps) then
        Grid.RowCombo[DataRow] := TtsDBCombo(Value);
end;

procedure TtsDBRow.AssignCombo;
begin
    if Grid.ReadBoundProps then
    begin
        if not Assigned(Element.FCombo) then Element.AssignCombo;
        Include(FAssignedProps, prCombo);
    end
    else
        Grid.AssignRowCombo(DataRow);
end;

function TtsDBRow.GetParentCombo: Boolean;
begin
    if (Grid.ReadBoundProps or Grid.ApplyBoundProps)
        then Result := Element.FParentCombo
        else Result := Grid.RowParentCombo[DataRow];
end;

procedure TtsDBRow.SetParentCombo(Value: Boolean);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FParentCombo := Value;
        Include(FAssignedProps, prParentCombo);
    end
    else if (not Grid.ApplyBoundProps) or (prParentCombo in FAssignedProps) then
        Grid.RowParentCombo[DataRow] := Value;
end;

function TtsDBRow.GetParentFont: Boolean;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FParentFont
        else Result := Grid.RowParentFont[DataRow];
end;

procedure TtsDBRow.SetParentFont(Value: Boolean);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FParentFont := Value;
        Include(FAssignedProps, prParentFont);
    end
    else if (not Grid.ApplyBoundProps) or (prParentFont in FAssignedProps) then
        Grid.RowParentFont[DataRow] := Value;
end;

function TtsDBRow.GetHeight: Integer;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Grid.DefaultRowHeight
        else Result := Grid.RowHeight[DataRow];
end;

procedure TtsDBRow.SetHeight(Value: Integer);
begin
    if (not Grid.ReadBoundProps) and (not Grid.ApplyBoundProps) then
        Grid.RowHeight[DataRow] := Value;
end;

function TtsDBRow.GetAlignment: TAlignment;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FAlignment
        else Result := Grid.RowAlignment[DataRow];
end;

procedure TtsDBRow.SetAlignment(Value: TAlignment);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FAlignment := Value;
        Include(FAssignedProps, prAlignment);
    end
    else if (not Grid.ApplyBoundProps) or (prAlignment in FAssignedProps) then
        Grid.RowAlignment[DataRow] := Value;
end;

function TtsDBRow.GetAlign: Boolean;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FAlign
        else Result := Grid.RowAlign[DataRow];
end;

procedure TtsDBRow.SetAlign(Value: Boolean);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FAlign := Value;
        Include(FAssignedProps, prAlign);
    end
    else if (not Grid.ApplyBoundProps) or (prAlign in FAssignedProps) then
        Grid.RowAlign[DataRow] := Value;
end;

function TtsDBRow.GetHorzAlignment: TtsHorzAlignment;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FHorzAlignment
        else Result := Grid.RowHorzAlignment[DataRow];
end;

procedure TtsDBRow.SetHorzAlignment(Value: TtsHorzAlignment);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FHorzAlignment := Value;
        Include(FAssignedProps, prHorzAlignment);
    end
    else if (not Grid.ApplyBoundProps) or (prHorzAlignment in FAssignedProps) then
        Grid.RowHorzAlignment[DataRow] := Value;
end;

function TtsDBRow.GetVertAlignment: TtsVertAlignment;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FVertAlignment
        else Result := Grid.RowVertAlignment[DataRow];
end;

procedure TtsDBRow.SetVertAlignment(Value: TtsVertAlignment);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FVertAlignment := Value;
        Include(FAssignedProps, prVertAlignment);
    end
    else if (not Grid.ApplyBoundProps) or (prVertAlignment in FAssignedProps) then
        Grid.RowVertAlignment[DataRow] := Value;
end;

function TtsDBRow.GetChanged: Boolean;
begin
    Result := False;
    if (not Grid.ReadBoundProps) and (not Grid.ApplyBoundProps) then
        Result := Grid.RowChanged[DataRow];
end;

procedure TtsDBRow.SetChanged(Value: Boolean);
begin
    if (not Grid.ReadBoundProps) and (not Grid.ApplyBoundProps) then
        Grid.RowChanged[DataRow] := Value;
end;

function TtsDBRow.GetIs3D: Boolean;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FIs3D
        else Result := Grid.RowIs3D[DataRow];
end;

procedure TtsDBRow.SetIs3D(Value: Boolean);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FIs3D := Value;
        Include(FAssignedProps, prIs3D);
    end
    else if (not Grid.ApplyBoundProps) or (prIs3D in FAssignedProps) then
        Grid.RowIs3D[DataRow] := Value;
end;

function TtsDBRow.GetWordWrap: TtsWordWrap;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FWordWrap
        else Result := Grid.RowWordWrap[DataRow];
end;

procedure TtsDBRow.SetWordWrap(Value: TtswordWrap);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FWordWrap := Value;
        Include(FAssignedProps, prWordWrap);
    end
    else if (not Grid.ApplyBoundProps) or (prWordWrap in FAssignedProps) then
        Grid.RowWordWrap[DataRow] := Value;
end;

function TtsDBRow.GetButtonType: TtsButtonType;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FButtonType
        else Result := Grid.RowButtonType[DataRow];
end;

procedure TtsDBRow.SetButtonType(Value: TtsButtonType);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FButtonType := Value;
        Include(FAssignedProps, prButtonType);
    end
    else if (not Grid.ApplyBoundProps) or (prButtonType in FAssignedProps) then
        Grid.RowButtonType[DataRow] := Value;
end;

function TtsDBRow.GetReadOnly: Boolean;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FReadOnly
        else Result := Grid.RowReadOnly[DataRow];
end;

procedure TtsDBRow.SetReadOnly(Value: Boolean);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FReadOnly := Value;
        Include(FAssignedProps, prReadOnly);
    end
    else if (not Grid.ApplyBoundProps) or (prReadOnly in FAssignedProps) then
        Grid.RowReadOnly[DataRow] := Value;
end;

function TtsDBRow.GetMaskName: string;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FMaskName
        else Result := Grid.RowMaskName[DataRow];
end;

procedure TtsDBRow.SetMaskName(Value: string);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FMaskName := Value;
        Include(FAssignedProps, prMask);
    end
    else if (not Grid.ApplyBoundProps) or (prMask in FAssignedProps) then
        Grid.RowMaskName[DataRow] := Value;
end;

function TtsDBRow.GetSelected: Boolean;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := FSelected
        else Result := Grid.RowSelected[DataRow];
end;

procedure TtsDBRow.SetSelected(Value: Boolean);
begin
    if Grid.ReadBoundProps then
    begin
        FSelected := Value;
        Include(FAssignedProps, prSelected);
    end
    else if (not Grid.ApplyBoundProps) or (prSelected in FAssignedProps) then
        Grid.RowSelected[DataRow] := Value;
end;

function TtsDBRow.GetVisible: Boolean;
begin
    Result := Grid.RowVisible[DataRow];
end;

procedure TtsDBRow.SetVisible(Value: Boolean);
begin
    Grid.RowVisible[DataRow] := Value;
end;

function TtsDBRow.GetAutoCreateFont: Boolean;
var
    Element: TtsDBRowElement;
begin
    Result := False;
    if not Grid.DataBound then begin Result := inherited GetAutoCreateFont; Exit; end;
    if Grid.FDBRowPropSet.Count = 0 then Exit;

    Element := TtsDBRowElement(Grid.FDBRowPropSet.Get([DataRow]));
    if Element <> nil then Result := Element.FAutoCreateFont;
end;

procedure TtsDBRow.SetAutoCreateFont(Value: Boolean);
var
    Element: TtsCustomElement;
begin
    if not Grid.DataBound then begin inherited SetAutoCreateFont(Value); Exit; end;
    Element := TtsCustomElement(Grid.FDBRowPropSet.Get([DataRow]));
    Grid.FDBRowPropSet.SetAutoCreateFont([DataRow], Element, Value);
end;

function TtsDBRow.GetId: Longint;
begin
    Result := Grid.RowId[DataRow];
end;

function TtsDBRow.GetStretchPicture: TtsDrawOption;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FStretchPicture
        else Result := Grid.RowStretchPicture[DataRow];
end;

procedure TtsDBRow.SetStretchPicture(Value: TtsDrawOption);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FStretchPicture := Value;
        Include(FAssignedProps, prPicture);
    end
    else if (not Grid.ApplyBoundProps) or (prPicture in FAssignedProps) then
        Grid.RowStretchPicture[DataRow] := Value;
end;

function TtsDBRow.GetShrinkPicture: TtsDrawOption;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FShrinkPicture
        else Result := Grid.RowShrinkPicture[DataRow];
end;

procedure TtsDBRow.SetShrinkPicture(Value: TtsDrawOption);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FShrinkPicture := Value;
        Include(FAssignedProps, prPicture);
    end
    else if (not Grid.ApplyBoundProps) or (prPicture in FAssignedProps) then
        Grid.RowShrinkPicture[DataRow] := Value;
end;

function TtsDBRow.GetCenterPicture: TtsDrawOption;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FCenterPicture
        else Result := Grid.RowCenterPicture[DataRow];
end;

procedure TtsDBRow.SetCenterPicture(Value: TtsDrawOption);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FCenterPicture := Value;
        Include(FAssignedProps, prPicture);
    end
    else if (not Grid.ApplyBoundProps) or (prPicture in FAssignedProps) then
        Grid.RowCenterPicture[DataRow] := Value;
end;

function TtsDBRow.GetKeepAspectRatio: TtsDrawOption;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FKeepAspectRatio
        else Result := Grid.RowKeepAspectRatio[DataRow];
end;

procedure TtsDBRow.SetKeepAspectRatio(Value: TtsDrawOption);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FKeepAspectRatio := Value;
        Include(FAssignedProps, prPicture);
    end
    else if (not Grid.ApplyBoundProps) or (prPicture in FAssignedProps) then
        Grid.RowKeepAspectRatio[DataRow] := Value;
end;

function TtsDBRow.GetControlType: TtsControlType;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FControlType
        else Result := Grid.RowControlType[DataRow];
end;

procedure TtsDBRow.SetControlType(Value: TtsControlType);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FControlType := Value;
        Include(FAssignedProps, prControlType);
    end
    else if (not Grid.ApplyBoundProps) or (prControlType in FAssignedProps) then
        Grid.RowControlType[DataRow] := Value;
end;

function TtsDBRow.GetSpinOptions: TtsSpinOptions;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FSpinOptions
        else Result := Grid.RowSpinOptions[DataRow];
end;

procedure TtsDBRow.SetSpinOptions(Value: TtsSpinOptions);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FSpinOptions := Value;
        Include(FAssignedProps, prSpinOptions);
    end
    else if (not Grid.ApplyBoundProps) or (prSpinOptions in FAssignedProps) then
        Grid.RowSpinOptions[DataRow] := Value;
end;

function TtsDBRow.GetSpinIncrement: Double;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FSpinIncrement
        else Result := Grid.RowSpinIncrement[DataRow];
end;

procedure TtsDBRow.SetSpinIncrement(Value: Double);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FSpinIncrement := Value;
        Include(FAssignedProps, prSpinIncrement);
    end
    else if (not Grid.ApplyBoundProps) or (prSpinIncrement in FAssignedProps) then
        Grid.RowSpinIncrement[DataRow] := Value;
end;

function TtsDBRow.GetDateTimeDef: TtsDateTimeDefComponent;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.FDateTimeDef
        else Result := Grid.RowDateTimeDef[DataRow];
end;

procedure TtsDBRow.SetDateTimeDef(Value: TtsDateTimeDefComponent);
begin
    if Grid.ReadBoundProps then
    begin
        Element.FDateTimeDef := Value;
        Include(FAssignedProps, prDateTime);
    end
    else if (not Grid.ApplyBoundProps) or (prDateTime in FAssignedProps) then
        Grid.RowDateTimeDef[DataRow] := Value;
end;

function TtsDBRow.GetDropDownStyle: TtsDropDownStyle;
begin
    if Grid.ReadBoundProps or Grid.ApplyBoundProps
        then Result := Element.DropDownStyle
        else Result := Grid.RowDropDownStyle[DataRow];
end;

procedure TtsDBRow.SetDropDownStyle(Value: TtsDropDownStyle);
begin
    if Grid.ReadBoundProps then
    begin
        Element.DropDownStyle := Value;
        Include(FAssignedProps, prDropDownStyle);
    end
    else if (not Grid.ApplyBoundProps) or (prDropDownStyle in FAssignedProps) then
        Grid.RowDropDownStyle[DataRow] := Value;
end;

function TtsDBRow.StoreDisplayRow: Boolean;
begin
    Result := (not Grid.DataBound);
end;

function TtsDBRow.StoreHeight: Boolean;
begin
    Result := (not Grid.DataBound);
end;

{TtsBookmarkSetNode}

function TtsBookmarkSetNode.Compare(NodeSet: TtsCustomSet; NodeValue : Pointer) : TtsSetOrder;
var
    CompRes: Integer;
begin
    CompRes := TtsBookmarkSet(NodeSet).Grid.CompareBkm(string(NodeValue^), FNodeValue);
    if CompRes = 0 then
        Result := ordEqual
    else if CompRes < 0 then
        Result := ordSmaller
    else
        Result := ordLarger
end;

{TtsBookmarkSet}

constructor TtsBookmarkSet.Create;
begin
    inherited Create;
    FBkmList := nil;
    FLastBkmListIndex := 0;
end;

destructor TtsBookmarkSet.Destroy;
begin
    FBkmList.Free;
    inherited Destroy;
end;

procedure TtsBookmarkSet.ResetBkmList;
begin
    if Assigned(FBkmList) then
    begin
        FBkmList.Free;
        FBkmList := nil;
        FLastBkmListIndex := 0;
    end;
end;

function TtsBookmarkSet.NewNode(NodeValue : Pointer) : TtsSetNode;
begin
    NewNode := TtsBookmarkSetNode.Create(string(NodeValue^));
end;

function TtsBookmarkSet.GetBkmList: TtsSetList;
begin
    if not Assigned(FBkmList) then FBkmList := List;
    Result := FBkmList;
end;

procedure TtsBookmarkSet.Clear;
begin
    ResetBkmList;
    inherited;
end;

function TtsBookmarkSet.Add(NodeValue : string) : Pointer;
begin
    Result := inherited Add(NodeValue);
    ResetBkmList;
end;

function TtsBookmarkSet.Remove(NodeValue : string) : Pointer;
begin
    Result := inherited Remove(NodeValue);
    ResetBkmList;
end;

procedure TtsBookmarkSet.GetBkmListPos(Bkm: TBookmarkStr; var Top, Bottom: Integer);
var
    Val: TBookmarkStr;
    CompareRes: Integer;
begin
    if Top <= Bottom then
    begin
        Val := string(BkmList.Items[(Top + Bottom) div 2]^);
        CompareRes := Grid.CompareBkm(Val, Bkm);

        if CompareRes > 0 then
        begin
            Bottom := ((Top + Bottom) div 2) - 1;
            GetBkmListPos(Bkm, Top, Bottom);
        end
        else if (CompareRes < 0) then
        begin
            Top := ((Top + Bottom) div 2) + 1;
            GetBkmListPos(Bkm, Top, Bottom);
        end
        else
        begin
            Top := (Top + Bottom) div 2;
            Bottom := Top;
        end;
    end;
end;

procedure TtsBookmarkSet.Assign(Source: TtsCustomSet);
begin
    if Source is TtsBookmarkSet then
    begin
        FBkmList := nil;
        FLastBkmListIndex := 0;
        inherited;
    end;
end;

function TtsBookmarkSet.First: Variant;
begin
    Result := Unassigned;
    if Count > 0 then
    begin
        FLastBkmListIndex := 1;
        Result := string(BkmList.Items[1]^);
    end;
end;

function TtsBookmarkSet.Last: Variant;
begin
    Result := Unassigned;
    if Count > 0 then
    begin
        FLastBkmListIndex := BkmList.Count;
        Result := string(BkmList.Items[BkmList.Count]^);
    end;
end;

function TtsBookmarkSet.Next(Bkm: Variant): Variant;
var
    Found: Boolean;
    LastBkm: TBookmarkStr;
    BPos, EPos: Integer;
begin
    Result := Unassigned;
    Found := False;
    if (FLastBkmListIndex >= 1) and
       (FLastBkmListIndex <= BkmList.Count) then
    begin
        LastBkm := string(BkmList.Items[FLastBkmListIndex]^);
        if LastBkm = Bkm then Found := True;
    end;

    if not Found then
    begin
        BPos := 1;
        EPos := BkmList.Count;
        GetBkmListPos(Bkm, BPos, EPos);
        FLastBkmListIndex := EPos;
    end;

    if (FLastBkmListIndex >= 0) and
       (FLastBkmListIndex < BkmList.Count) then
    begin
        Inc(FLastBkmListIndex);
        Result := string(BkmList.Items[FLastBkmListIndex]^);
    end;
end;

function TtsBookmarkSet.Previous(Bkm: Variant): Variant;
var
    Found: Boolean;
    BPos, EPos: Integer;
    LastBkm: TBookmarkStr;
begin
    Result := Unassigned;
    Found := False;
    if (FLastBkmListIndex >= 1) and
       (FLastBkmListIndex <= BkmList.Count) then
    begin
        LastBkm := string(BkmList.Items[FLastBkmListIndex]^);
        if LastBkm = Bkm then Found := True;
    end;

    if not Found then
    begin
        BPos := 1;
        EPos := BkmList.Count;
        GetBkmListPos(Bkm, BPos, EPos);
        FLastBkmListIndex := BPos;
    end;

    if (FLastBkmListIndex > 1) and
       (FLastBkmListIndex <= BkmList.Count + 1) then
    begin
        Dec(FLastBkmListIndex);
        Result := string(BkmList.Items[FLastBkmListIndex]^);
    end;
end;

{TtsDBSelection}

constructor TtsDBSelection.Create(Grid: TtsCustomDBGrid; UnboundSelection: TtsSelection);
begin
    inherited Create;
    FGrid := Grid;
    FUnboundSelection := UnboundSelection;
    FStoreUnselected := False;

    FRangeBufSize := 0;
    FRangeCount := 0;
    FRangeBuffer := nil;
    FUseRangeSelection := True;
    FAllSelected := False;
    FBookmarkSet := TtsBookmarkSet.Create;
    FBookmarkSet.Grid := Grid;
end;

destructor TtsDBSelection.Destroy;
begin
    ResizeRangeBuffer(0);
    FBookmarkSet.Free;
    inherited Destroy;
end;

procedure TtsDBSelection.AssignRangeBuffer(Source: TtsDBSelection);
var
    I: Integer;
begin
    ResizeRangeBuffer(Source.FRangeBufSize);
    FRangeCount := Source.FRangeCount;
    for I := 1 to FRangeCount do
    begin
        FRangeBuffer[I] := Source.FRangeBuffer[I];
    end;
end;

function TtsDBSelection.Assign(Source: TtsDBSelection): Boolean;
var
    Changed: Boolean;
begin
    Changed := RowsSelected or Source.RowsSelected;
    ResetAll;

    FStoreUnselected := Source.FStoreUnselected;
    FUseRangeSelection := Source.FUseRangeSelection;
    FAllSelected := Source.FAllSelected;

    if Source.FBookmarkSet.Count <> 0 then
        FBookmarkSet.Assign(Source.FBookmarkSet);
    if Source.FRangeCount <> 0 then
        AssignRangeBuffer(Source);

    Result := Changed;
end;

procedure TtsDBSelection.ClearBkm(First, Last: Longint; Assign: Boolean);
var
    I: Integer;
begin
    for I := First to Last do
    begin
        if Assign then
        begin
            FRangeBuffer[I].First.Bkm := EmptyBookmark;
            FRangeBuffer[I].Last.Bkm := EmptyBookmark;
        end
        else
            ZeroMemory(@FRangeBuffer[I], SizeOf(TtsSelectedRange));
    end;
end;

procedure TtsDBSelection.ResizeRangeBuffer(NewSize: Longint);
begin
    if FRangeBufSize <> NewSize then
    begin
        if NewSize < FRangeBufSize then
            ClearBkm(NewSize + 1, FRangeBufSize, True);

        ReallocMem(FRangeBuffer, NewSize * SizeOf(TtsSelectedRange));

        if NewSize > FRangeBufSize then
            ClearBkm(FRangeBufSize + 1, NewSize, False);

        FRangeBufSize := NewSize;
    end;
end;

function TtsDBSelection.RowsSelected: Boolean;
begin
    Result := (FRangeCount > 0) or (FBookmarkSet.Count > 0);
end;

procedure TtsDBSelection.CheckRowsSelected;
begin
    if RowsSelected then FGrid.FGridStatus := grRowSelect
                    else FGrid.FGridStatus := grNormal;
    FGrid.FGridData.ClearPropBuffer(0, 0, True);
end;

procedure TtsDBSelection.SetAllSelected(Value: Boolean);
begin
    FAllSelected := Value;
end;

function TtsDBSelection.GetAllSelected: Boolean;
var
    DatasetPos: TtsDatasetPosition;
    FirstBkm, LastBkm: TtsBkmPos;
    StartBkm, EndBkm: TtsBkmPos;
begin
    if not UseRangeSelection then
    begin
        Result := FAllSelected;
    end
    else
    begin
        Result := FRangeCount = 1;
        if not Result then Exit;

        FGrid.SaveDatasetPosition(DatasetPos);
        try
            with FGrid.FGridData do
            begin
                FirstBkm := FirstBkmPos;
                LastBkm := LastBkmPos;
                StartBkm := PrevBkmPos(FRangeBuffer[1].First);
                EndBkm := NextBkmPos(FRangeBuffer[1].Last);
                Result := (CompareBkmPos(FirstBkm, StartBkm) <> -1) and
                          (CompareBkmPos(LastBkm, EndBkm) <> 1);
            end;
        finally
            FGrid.RestoreDatasetPosition(DatasetPos, True);
        end;
    end;
end;

procedure TtsDBSelection.SearchRangeIndex(Top, Bottom: Longint; DataRow: TtsBkmPos;
                                          var Position: Longint; var Found: Boolean);
var
    CompareRes: Boolean;
    CurPos: Longint;
begin
    Found := False;
    if Top <= Bottom then
    begin
        CurPos := (Top + Bottom) div 2;
        with FGrid.FGridData do
            CompareRes := LessBkmPos(DataRow, FRangeBuffer[CurPos].First);
        if CompareRes then
        begin
            if Top > CurPos - 1
                then Position := CurPos
                else SearchRangeIndex(Top, CurPos - 1, DataRow, Position, Found);
        end
        else
        begin
            with FGrid.FGridData do
                CompareRes := GreaterBkmPos(DataRow, FRangeBuffer[CurPos].Last);
            if CompareRes then
            begin
                if Bottom < CurPos + 1
                    then Position := CurPos
                    else SearchRangeIndex(CurPos + 1, Bottom, DataRow, Position, Found)
            end
            else
            begin
                Found := True;
                Position := CurPos;
            end;
        end;
    end
    else
        Position := 0;
end;

procedure TtsDBSelection.CompRangeIndexes(Range: TtsSelectedRange; var FirstIndex, LastIndex: Longint;
                                          var FirstFound, LastFound: Boolean);
begin
    FirstIndex := 0;
    LastIndex := 0;

    SearchRangeIndex(1, FRangeCount, Range.First, FirstIndex, FirstFound);
    if (not FirstFound) and (FirstIndex >= 1) and (FirstIndex <= FRangeCount) and
       FGrid.FGridData.GreaterBkmPos(Range.First, FRangeBuffer[FirstIndex].Last) then Inc(FirstIndex);

    SearchRangeIndex(1, FRangeCount, Range.Last, LastIndex, LastFound);
    if (not LastFound) and (LastIndex >= 1) and (LastIndex <= FRangeCount) and
       FGrid.FGridData.LessBkmPos(Range.Last, FRangeBuffer[LastIndex].First) then Dec(LastIndex);
end;

procedure TtsDBSelection.AdjustRangeBuffer(NewCount: Longint);
begin
    if FRangeBufSize < NewCount then ResizeRangeBuffer(NewCount + 4);
end;

procedure TtsDBSelection.MoveRangeBuffer(FromIndex, ToIndex: Longint; Count: Longint);
var
    StartIndex, EndIndex: Longint;
begin
    if (Count > 0) and (FromIndex <> ToIndex) then
    begin
        if ToIndex < FromIndex then
        begin
            StartIndex := ToIndex;
            EndIndex := CalcMin(ToIndex + Count - 1, FromIndex - 1)
        end
        else
        begin
            StartIndex := CalcMax(FromIndex + Count, ToIndex);
            EndIndex := ToIndex + Count - 1;
        end;
        ClearBkm(StartIndex, EndIndex, True);

        MoveMemory(PChar(FRangeBuffer) + ((ToIndex-1) * SizeOf(TtsSelectedRange)),
                   PChar(FRangeBuffer) + ((FromIndex-1) * SizeOf(TtsSelectedRange)),
                   Count * SizeOf(TtsSelectedRange));

        if ToIndex < FromIndex then
        begin
            StartIndex := CalcMax(FromIndex, ToIndex + Count);
            EndIndex := FromIndex + Count - 1;
        end
        else
        begin
            StartIndex := FromIndex;
            EndIndex := CalcMin(FromIndex + Count - 1, ToIndex - 1);
        end;
        ClearBkm(StartIndex, EndIndex, False);
    end;
end;

procedure TtsDBSelection.InsertNewRange(Index: Longint; Range: TtsSelectedRange;
                                        CombineRange: TtsCombineRange);
var
    First, Last: Longint;
begin
    if FRangeCount = 0 then
    begin
        AdjustRangeBuffer(FRangeCount + 1);
        Inc(FRangeCount);
        FRangeBuffer[FRangeCount] := Range;
    end
    else
    begin
        First := Index;
        Last := Index - 1;

        if CombineRange in [crBoth, crPrior] then
            CombinePrevRange(Range.First, First, False);
        if CombineRange in [crBoth, crNext] then
            CombineNextRange(Range.Last, Last, False);

        if First > Last then
        begin
            if Index = 0 then Inc(Index);
            AdjustRangeBuffer(FRangeCount + 1);
            MoveRangeBuffer(Index, Index + 1, FRangeCount - Index + 1);
            FRangeBuffer[Index] := Range;
            Inc(FRangeCount);
        end
        else
            CombineRanges(First, Last, Range);
    end;
end;

procedure TtsDBSelection.CombineRanges(FirstIndex, LastIndex: Longint; Range: TtsSelectedRange);
var
    NewRange: TtsSelectedRange;
begin
    if FirstIndex < 1 then
        NewRange.First := Range.First
    else if FGrid.CompareBkmPos(Range.First, FRangeBuffer[FirstIndex].First) = -1 then
        NewRange.First := Range.First
    else
        NewRange.First := FRangeBuffer[FirstIndex].First;

    if LastIndex > FRangeCount then
        NewRange.Last := Range.Last
    else if FGrid.CompareBkmPos(Range.Last, FRangeBuffer[LastIndex].Last) = 1 then
        NewRange.Last := Range.Last
    else
        NewRange.Last := FRangeBuffer[LastIndex].Last;

    if FirstIndex = 0 then Inc(FirstIndex);
    FRangeBuffer[FirstIndex] := NewRange;

    MoveRangeBuffer(LastIndex+1, FirstIndex+1, FRangeCount - LastIndex);
    FRangeCount := FRangeCount - (CalcMin(LastIndex, FRangeCount) - CalcMax(1, FirstIndex));
end;

procedure TtsDBSelection.RemoveRange(FirstIndex, LastIndex: Longint; Range: TtsSelectedRange);
var
    StartRange, EndRange: TtsSelectedRange;
    NewStartRange, NewEndRange: Boolean;
begin
    NewStartRange := False;
    NewEndRange := False;

    if FirstIndex >= 1 then
    begin
        if FGrid.CompareBkmPos(Range.First, FRangeBuffer[FirstIndex].First) = 1 then
        begin
            StartRange.First := FRangeBuffer[FirstIndex].First;
            StartRange.Last := FGrid.FGridData.PrevBkmPos(Range.First);
            NewStartRange := True;
        end;
    end;

    if LastIndex <= FRangeCount then
    begin
        if FGrid.CompareBkmPos(Range.Last, FRangeBuffer[LastIndex].Last) = -1 then
        begin
            EndRange.First := FGrid.FGridData.NextBkmPos(Range.Last);
            EndRange.Last := FRangeBuffer[LastIndex].Last;
            NewEndRange := True;
        end;
    end;

    if NewStartRange and NewEndRange and (FirstIndex = LastIndex) then
    begin
        AdjustRangeBuffer(FRangeCount + 1);
        MoveRangeBuffer(FirstIndex + 1, FirstIndex + 2, FRangeCount - FirstIndex);
        LastIndex := FirstIndex + 1;
        Inc(FRangeCount);
    end;

    if NewStartRange
        then FRangeBuffer[FirstIndex] := StartRange
        else Dec(FirstIndex);

    if NewEndRange
        then FRangeBuffer[LastIndex] := EndRange
        else Inc(LastIndex);

    MoveRangeBuffer(LastIndex, FirstIndex + 1, FRangeCount - LastIndex + 1);
    FRangeCount := FRangeCount + FirstIndex - LastIndex + 1;
end;

procedure TtsDBSelection.AddRangeSelection(const FromRow, ToRow: TtsBkmPos; var Changed: Boolean);
var
    FirstIndex, LastIndex: Longint;
    FirstFound, LastFound: Boolean;
    Range: TtsSelectedRange;
begin
    try
        Changed := False;
        Range.First := FromRow;
        Range.Last := ToRow;
        CompRangeIndexes(Range, FirstIndex, LastIndex, FirstFound, LastFound);

        Changed := True;
        if FirstIndex > LastIndex then
            InsertNewRange(FirstIndex, Range, crBoth)
        else if (FirstIndex = 0) and (LastIndex = 0) then
            InsertNewRange(1, Range, crBoth)
        else if (FirstIndex > FRangeCount) and (LastIndex > FRangeCount) then
            InsertNewRange(FRangeCount + 1, Range, crBoth)
        else if FirstIndex < LastIndex then
        begin
            CombinePrevRange(Range.First, FirstIndex, False);
            CombineNextRange(Range.Last, LastIndex, False);
            CombineRanges(FirstIndex, LastIndex, Range)
        end
        else if (not FirstFound) or (not LastFound) then
            InsertNewRange(FirstIndex, Range, crBoth)
        else
            Changed := False;
    finally
        CheckRowsSelected;
    end;
end;

procedure TtsDBSelection.AddSetSelection(const FromRow, ToRow: TtsBkmPos; var Changed: Boolean);
var
    OldCount: Integer;
    StartBkm, EndBkm: TBookmarkStr;
begin
    try
        OldCount := FBookmarkSet.Count;
        StartBkm := FGrid.FGridData.ActualBkmPos(FromRow).Bkm;
        EndBkm := FGrid.FGridData.ActualBkmPos(ToRow).Bkm;
        if FGrid.CompareBkm(StartBkm, EndBkm) = 0 then
            FBookmarkSet.Add(StartBkm);
        Changed := OldCount <> FBookmarkSet.Count;
    finally
        CheckRowsSelected;
    end;
end;

procedure TtsDBSelection.AddBkmPosSelection(const FromRow, ToRow: TtsBkmPos; var Changed: Boolean);
begin
    if UseRangeSelection
        then AddRangeSelection(FromRow, ToRow, Changed)
        else AddSetSelection(FromRow, ToRow, Changed);
end;

procedure TtsDBSelection.AddSelection(FromRow, ToRow: TBookmarkStr; var Changed: Boolean);
begin
    Changed := False;
    if (FGrid.BookmarkType = bmtDefault) and (FGrid.CompareBkm(FromRow, ToRow) = 1) then Exit;
    AddBkmPosSelection(CurBkmPos(FromRow), CurBkmPos(ToRow), Changed);
end;

procedure TtsDBSelection.RemoveRangeSelection(const FromRow, ToRow: TtsBkmPos; var Changed: Boolean);
var
    FirstIndex, LastIndex: Longint;
    Range: TtsSelectedRange;
    FirstFound, LastFound: Boolean;
begin
    try
        Changed := False;
        Range.First := FromRow;
        Range.Last := ToRow;
        CompRangeIndexes(Range, FirstIndex, LastIndex, FirstFound, LastFound);

        if (FirstIndex > LastIndex) then Exit;
        if (FirstIndex = 0) and (LastIndex = 0) then Exit;
        if (FirstIndex > FRangeCount) and (LastIndex > FRangeCount) then Exit;

        Changed := True;
        RemoveRange(FirstIndex, LastIndex, Range);
    finally
        CheckRowsSelected;
    end;
end;

procedure TtsDBSelection.RemoveSetSelection(const FromRow, ToRow: TtsBkmPos; var Changed: Boolean);
var
    OldCount: Integer;
    StartBkm, EndBkm: TBookmarkStr;
begin
    try
        OldCount := FBookmarkSet.Count;
        StartBkm := FGrid.FGridData.ActualBkmPos(FromRow).Bkm;
        EndBkm := FGrid.FGridData.ActualBkmPos(ToRow).Bkm;
        if FGrid.CompareBkm(StartBkm, EndBkm) = 0 then
            FBookmarkSet.Remove(StartBkm);
        Changed := OldCount <> FBookmarkSet.Count;
        if Changed then AllSelected := False;
    finally
        CheckRowsSelected;
    end;
end;

procedure TtsDBSelection.RemoveBkmPosSelection(const FromRow, ToRow: TtsBkmPos; var Changed: Boolean);
begin
    if UseRangeSelection
        then RemoveRangeSelection(FromRow, ToRow, Changed)
        else RemoveSetSelection(FromRow, ToRow, Changed);
end;

procedure TtsDBSelection.RemoveSelection(FromRow, ToRow: TBookmarkStr; var Changed: Boolean);
begin
    Changed := False;
    if (FGrid.BookmarkType = bmtDefault) and (FGrid.CompareBkm(FromRow, ToRow) = 1) then Exit;
    RemoveBkmPosSelection(CurBkmPos(FromRow), CurBkmPos(ToRow), Changed);
end;

function TtsDBSelection.CombinePrevRange(var BkmPos: TtsBkmPos; var Index: Longint;
                                         SetToPrev: Boolean): Boolean;
var
    PrevBkm: TtsBkmPos;
begin
    Result := False;
    if Index <= 1 then Exit;

    with FGrid.FGridData do
    begin
        PrevBkm := PrevBkmPos(BkmPos);
        if LessEqualBkmPos(PrevBkm, FRangeBuffer[Index - 1].Last) then
        begin
            Result := True;
            if SetToPrev then BkmPos := PrevBkm;
            Dec(Index);

            while Index - 1 >= 1 do
            begin
                if GreaterBkmPos(BkmPos, FRangeBuffer[Index - 1].Last) then Break;
                Dec(Index);
            end;
        end;
    end;
end;

function TtsDBSelection.CombineNextRange(var BkmPos: TtsBkmPos;
                                         var Index: Longint; SetToNext: Boolean): Boolean;
var
    NextBkm: TtsBkmPos;
begin
    Result := False;
    if Index >= FRangeCount then Exit;

    with FGrid.FGridData do
    begin
        NextBkm := NextBkmPos(BkmPos);
        if GreaterEqualBkmPos(NextBkm, FRangeBuffer[Index + 1].First) then
        begin
            Result := True;
            if SetToNext then BkmPos := NextBkm;
            Inc(Index);

            while Index + 1 <= FRangeCount do
            begin
                if LessBkmPos(BkmPos, FRangeBuffer[Index + 1].First) then Break;
                Inc(Index);
            end;
        end;
    end;
end;

procedure TtsDBSelection.CalcStartRange(BkmPos: TtsBkmPos; Index: Longint;
                                        var Range: TtsSelectedRange;
                                        var NewRange, CanCombine: Boolean;
                                        var CombineIndex: Longint);
var
    CompareRes: Integer;
begin
    NewRange := False;
    CanCombine := False;

    CompareRes := FGrid.CompareBkmPos(BkmPos, FRangeBuffer[Index].First);
    if CompareRes = -1 then
    begin
        CombineIndex := Index;
        CanCombine := CombinePrevRange(BkmPos, CombineIndex, True);
        Range.First := BkmPos;
        Range.Last := FGrid.FGridData.PrevBkmPos(FRangeBuffer[Index].First);
        NewRange := not CanCombine;
    end
    else if CompareRes = 1 then
    begin
        NewRange := True;
        Range.First := FRangeBuffer[Index].First;
        Range.Last := FGrid.FGridData.PrevBkmPos(BkmPos);
    end;
end;

procedure TtsDBSelection.CalcEndRange(BkmPos: TtsBkmPos; Index: Longint;
                                      var Range: TtsSelectedRange;
                                      var NewRange, CanCombine: Boolean;
                                      var CombineIndex: Longint);
var
    CompareRes: Integer;
begin
    NewRange := False;
    CanCombine := False;

    CompareRes := FGrid.CompareBkmPos(BkmPos, FRangeBuffer[Index].Last);
    if CompareRes = 1 then
    begin
        CombineIndex := Index;
        CanCombine := CombineNextRange(BkmPos, CombineIndex, True);
        Range.First := FGrid.FGridData.NextBkmPos(FRangeBuffer[Index].Last);
        Range.Last := BkmPos;
        NewRange := not CanCombine;
    end
    else if CompareRes = -1 then
    begin
        NewRange := True;
        Range.First := FGrid.FGridData.NextBkmPos(BkmPos);
        Range.Last := FRangeBuffer[Index].Last;
    end;
end;

procedure TtsDBSelection.InvertSelection(Range: TtsSelectedRange; FirstIndex, LastIndex: Longint);
var
    I: Longint;
    NewRange: TtsSelectedRange;
    StartRange, EndRange: TtsSelectedRange;
    NewStartRange, NewEndRange: Boolean;
    CombineFirst, CombineLast: Boolean;
    CombineFirstIndex, CombineLastIndex: Longint;
begin
    CalcStartRange(Range.First, FirstIndex, StartRange, NewStartRange,
                   CombineFirst, CombineFirstIndex);
    CalcEndRange(Range.Last, LastIndex, EndRange, NewEndRange,
                 CombineLast, CombineLastIndex);

    if FirstIndex < LastIndex then
    begin
        if not NewStartRange then
        begin
            for I := FirstIndex to LastIndex - 1 do
            begin
                NewRange.First := FGrid.FGridData.NextBkmPos(FRangeBuffer[I].Last);
                NewRange.Last := FGrid.FGridData.PrevBkmPos(FRangeBuffer[I+1].First);
                FRangeBuffer[I] := NewRange;
            end
        end
        else
        begin
            for I := LastIndex downto FirstIndex + 1 do
            begin
                NewRange.First := FGrid.FGridData.NextBkmPos(FRangeBuffer[I-1].Last);
                NewRange.Last := FGrid.FGridData.PrevBkmPos(FRangeBuffer[I].First);
                FRangeBuffer[I] := NewRange;
            end;
        end;
    end;

    if NewStartRange and NewEndRange then
    begin
        AdjustRangeBuffer(FRangeCount + 1);
        MoveRangeBuffer(LastIndex + 1, LastIndex + 2, FRangeCount - LastIndex);
        LastIndex := LastIndex + 1;
        Inc(FRangeCount);
    end;

    if not NewStartRange and not NewEndRange then
    begin
        MoveRangeBuffer(LastIndex + 1, LastIndex, FRangeCount - LastIndex);
        Dec(FRangeCount);
        Dec(LastIndex);
        Dec(CombineLastIndex);
    end;

    if NewStartRange then FRangeBuffer[FirstIndex] := StartRange;
    if NewEndRange then FRangeBuffer[LastIndex] := EndRange;
    if CombineFirst then CombineRanges(CombineFirstIndex, FirstIndex - 1, StartRange);
    if CombineLast then CombineRanges(LastIndex + 1, CombineLastIndex, EndRange);
end;

procedure TtsDBSelection.ChangeRangeSelection(const FromRow, ToRow: TtsBkmPos;
                                              CombineRange: TtsCombineRange );
var
    Range: TtsSelectedRange;
    FirstIndex, LastIndex: Longint;
    FirstFound, LastFound: Boolean;
begin
    try
        Range.First := FromRow;
        Range.Last := ToRow;
        CompRangeIndexes(Range, FirstIndex, LastIndex, FirstFound, LastFound);

        if (FirstIndex > LastIndex) then
            InsertNewRange(FirstIndex, Range, CombineRange)
        else if (FirstIndex = 0) and (LastIndex = 0) then
            InsertNewRange(1, Range, CombineRange)
        else if (FirstIndex > FRangeCount) and (LastIndex > FRangeCount) then
            InsertNewRange(FRangeCount + 1, Range, CombineRange)
        else
            InvertSelection(Range, FirstIndex, LastIndex);

        FGrid.SetSelectChanged(stRowSelect);
    finally
        CheckRowsSelected;
    end;
end;

procedure TtsDBSelection.ChangeSetSelection(const FromRow, ToRow: TtsBkmPos);
var
    StartBkm, EndBkm: TBookmarkStr;
begin
    try
        StartBkm := FGrid.FGridData.ActualBkmPos(FromRow).Bkm;
        EndBkm := FGrid.FGridData.ActualBkmPos(ToRow).Bkm;
        if FGrid.CompareBkm(StartBkm, EndBkm) = 0 then
        begin
            if FBookmarkSet.Get(StartBkm) <> nil then
            begin
                FBookmarkSet.Remove(StartBkm);
                AllSelected := False;
            end
            else
                FBookmarkSet.Add(StartBkm);
        end;

        FGrid.SetSelectChanged(stRowSelect);
    finally
        CheckRowsSelected;
    end;
end;

procedure TtsDBSelection.ChangeRownrSelection(FromRownr, ToRownr: Longint);
var
    I: Longint;
    Bkm: TBookmarkStr;
begin
    if FromRownr > ToRownr then Exit;

    try
        with FGrid.FGridData do
        begin
            if FromRownr <= 0 then FromRownr := 1;
            if ToRownr >= BufferRows then ToRownr := BufferRows;

            for I := FromRownr to ToRownr do
            begin
                Bkm := Bookmark[I];
                if FBookmarkSet.Get(Bkm) <> nil then
                begin
                    FBookmarkSet.Remove(Bkm);
                    AllSelected := False;
                end
                else
                    FBookmarkSet.Add(Bkm);
            end;
        end;

        FGrid.SetSelectChanged(stRowSelect);
    finally
        CheckRowsSelected;
    end;
end;

procedure TtsDBSelection.AddSelectedList(List: TtsSelectedList; ClearAll, SelectAll: Boolean;
                                         var Canceled: Boolean);
var
    I, Count, Total: Longint;
    OldSet: TtsBookmarkSet;
begin
    if not Assigned(List) then Exit;
    if List.Count = 0 then Exit;

    try
        OldSet := TtsBookmarkSet.Create;
        try
            OldSet.Assign(FBookmarkSet);
            try
                if ClearAll then ResetAll;
                Total := 0;
                Count := 0;
                for I := 1 to List.Count do
                begin
                    FGrid.DoScanRecord(SelectAll, sstSave, Count, Total, Canceled);
                    if Canceled then Break;
                    FBookmarkSet.Add(List.Item[I-1]);
                end;
                FGrid.SetSelectChanged(stRowSelect);
            except
                Canceled := True;
                raise;
            end;
        finally
            if Canceled then
            begin
                FBookmarkSet.Free;
                FBookmarkSet := OldSet;
            end
            else
                OldSet.Free;
        end;
    finally
        CheckRowsSelected;
    end;
end;

procedure TtsDBSelection.DeleteSelectedList(List: TtsSelectedList; SelectAll: Boolean;
                                            var Canceled: Boolean);
var
    I, Count, Total: Longint;
    OldSet: TtsBookmarkSet;
begin
    if not Assigned(List) then Exit;
    if List.Count = 0 then Exit;

    try
        OldSet := TtsBookmarkSet.Create;
        try
            OldSet.Assign(FBookmarkSet);
            try
                Total := 0;
                Count := 0;
                for I := 1 to List.Count do
                begin
                    FGrid.DoScanRecord(SelectAll, sstSave, Count, Total, Canceled);
                    if Canceled then Break;
                    FBookmarkSet.Remove(List.Item[I-1]);
                end;
                AllSelected := False;
                FGrid.SetSelectChanged(stRowSelect);
            except
                Canceled := True;
                raise;
            end;
        finally
            if Canceled then
            begin
                FBookmarkSet.Free;
                FBookmarkSet := OldSet;
            end
            else
                OldSet.Free;
        end;
    finally
        CheckRowsSelected;
    end;
end;

procedure TtsDBSelection.ChangeBkmPosSelection(const FromRow, ToRow: TtsBkmPos;
                                               CombineRange: TtsCombineRange );
begin
    if UseRangeSelection
        then ChangeRangeSelection(FromRow, ToRow, CombineRange)
        else ChangeSetSelection(FromRow, ToRow)
end;

procedure TtsDBSelection.ChangeSelection(FromRow, ToRow: TBookmarkStr);
begin
    if (FGrid.BookmarkType = bmtDefault) and (FGrid.CompareBkm(FromRow, ToRow) = 1) then Exit;
    ChangeBkmPosSelection(CurBkmPos(FromRow), CurBkmPos(ToRow), crBoth);
end;

procedure TtsDBSelection.UpdateBkmPosSelection(FromRow, ToRow: TtsBkmPos; Select: Boolean);
var
    Changed: Boolean;
begin
    if Select then AddBkmPosSelection(FromRow, ToRow, Changed)
              else RemoveBkmPosSelection(FromRow, ToRow, Changed);
    if Changed then FGrid.SetSelectChanged(stRowSelect);
end;

procedure TtsDBSelection.UpdateSelection(FromRow, ToRow: TBookmarkStr; Select: Boolean);
begin
    if (FGrid.BookmarkType = bmtDefault) and (FGrid.CompareBkm(FromRow, ToRow) = 1) then Exit;
    UpdateBkmPosSelection(CurBkmPos(FromRow), CurBkmPos(ToRow), Select);
end;

procedure TtsDBSelection.SetSelected(DataRow: TBookmarkStr; Value: Boolean);
var
    DatasetPos: TtsDatasetPosition;
begin
    FGrid.SaveDatasetPosition(DatasetPos);
    try
        UpdateSelection(DataRow, DataRow, Value);
    finally
        FGrid.RestoreDatasetPosition(DatasetPos, True);
    end;
end;

function TtsDBSelection.GetSelected(DataRow: Variant): Boolean;
var
    Position: Longint;
    Found: Boolean;
    DataRowBkmPos: TtsBkmPos;
    DatasetPos: TtsDatasetPosition;
begin
    Result := FStoreUnselected;
    if not FGrid.DataBound then begin Result := FUnboundSelection.Selected[DataRow]; Exit end;
    if not RowsSelected then Exit;

    FGrid.SaveDatasetPosition(DatasetPos);
    try
        if UseRangeSelection then
        begin
            SearchRangeIndex(1, FRangeCount, CurBkmPos(DataRow), Position, Found);
            if Found then
                Result := True xor FStoreUnselected
            else if (Position >= 1) and (Position <= FRangeCount) then
            begin
                DataRowBkmPos := CurBkmPos(DataRow);
                if (FGrid.CompareBkmPos(DataRowBkmPos, FRangeBuffer[Position].First) <> -1) and
                   (FGrid.CompareBkmPos(DataRowBkmPos, FRangeBuffer[Position].Last) <> 1) then
                begin
                    Result := True xor FStoreUnselected;
                end;
            end;
        end
        else
        begin
            if FBookmarkSet.Get(DataRow) <> nil then
                Result := True xor FStoreUnselected
        end;
    finally
        FGrid.RestoreDatasetPosition(DatasetPos, True);
    end;
end;

function TtsDBSelection.GetFirst: Variant;
var
    Bkm: TBookmarkStr;
begin
    Result := Unassigned;
    if not FGrid.DataBound then begin Result := FUnboundSelection.First; Exit end;

    if UseRangeSelection then
    begin
        if (FRangeCount > 0) then
        begin
            if FRangeBuffer[1].First.Offset = bpoBof then
                Result := FGrid.FGridData.FirstBookmark
            else if FGrid.FGridData.BkmPosBookmark(FRangeBuffer[1].First, Bkm) then
                Result := Bkm;
        end;
    end
    else
        Result := FBookmarkSet.First;
end;

function TtsDBSelection.GetLast: Variant;
var
    Bkm: TBookmarkStr;
begin
    Result := Unassigned;
    if not FGrid.DataBound then begin Result := FUnboundSelection.Last; Exit end;

    if UseRangeSelection then
    begin
        if FRangeCount > 0 then
        begin
            if FRangeBuffer[FRangeCount].Last.Offset = bpoEof then
                Result := FGrid.FGridData.LastBookmark
            else if FGrid.FGridData.BkmPosBookmark(FRangeBuffer[FRangeCount].Last, Bkm) then
                Result := Bkm;
        end;
    end
    else
        Result := FBookmarkSet.Last;
end;

function TtsDBSelection.GetFirstBkmPos: TtsBkmPos;
begin
    Result := CurBkmPos(EmptyBookmark);
    if not FGrid.DataBound then Exit;
    if not RowsSelected then Exit;

    if UseRangeSelection
        then Result := FRangeBuffer[1].First
        else Result := CurBkmPos(First);
end;

function TtsDBSelection.GetLastBkmPos: TtsBkmPos;
begin
    Result := CurBkmPos(EmptyBookmark);
    if not FGrid.DataBound then Exit;
    if not RowsSelected then Exit;

    if UseRangeSelection
        then Result := FRangeBuffer[FRangeCount].Last
        else Result := CurBkmPos(Last);
end;

procedure TtsDBSelection.ResetAll;
begin
    if RowsSelected then FGrid.SetSelectChanged(stRowSelect);

    FBookmarkSet.Clear;
    ClearBkm(1, FRangeCount, True);
    FRangeCount := 0;
    if FRangeCount > 10 then ResizeRangeBuffer(0);

    AllSelected := False;
    CheckRowsSelected;
end;

procedure TtsDBSelection.SetUseRangeSelection(Value: Boolean);
begin
    if FUseRangeSelection <> Value then
    begin
        if RowsSelected then ResetAll;
        FUseRangeSelection := Value;
    end;
end;

function TtsDBSelection.NextInRange(Index: Variant): Variant;
var
    Bkm, NextBkm: TBookmarkStr;
    BkmPos, NewBkmPos: TtsBkmPos;
    RangeIndex: Longint;
    Found: Boolean;
begin
    Result := Unassigned;
    Bkm := Index;
    BkmPos := CurBkmPos(Bkm);
    SearchRangeIndex(1, FRangeCount, BkmPos, RangeIndex, Found);

    with FGrid.FGridData do
    begin
        NewBkmPos := EofBkmPos;
        if Found then
        begin
            if CompareBkmPos(BkmPos, FRangeBuffer[RangeIndex].Last) = -1 then
                NewBkmPos := NextBkmPos(BkmPos)
            else if RangeIndex < FRangeCount then
                NewBkmPos := FRangeBuffer[RangeIndex + 1].First
        end
        else if (RangeIndex >= 1) and (RangeIndex <= FRangeCount) then
        begin
            if CompareBkmPos(BkmPos, FRangeBuffer[RangeIndex].First) = -1 then
                NewBkmPos := FRangeBuffer[RangeIndex].First
            else if RangeIndex < FRangeCount then
                NewBkmPos := FRangeBuffer[RangeIndex + 1].First
        end;

        if BkmPosBookmark(NewBkmPos, NextBkm) then Result := NextBkm;
    end;
end;

function TtsDBSelection.Next(Index: Variant): Variant;
begin
    Result := Unassigned;
    if not FGrid.DataBound then begin Result := FUnboundSelection.Next(Index); Exit end;

    if UseRangeSelection
        then Result := NextInRange(Index)
        else Result := FBookmarkSet.Next(Index);
end;

function TtsDBSelection.PreviousInRange(Index: Variant): Variant;
var
    Bkm, PrevBkm: TBookmarkStr;
    BkmPos, NewBkmPos: TtsBkmPos;
    RangeIndex: Longint;
    Found: Boolean;
begin
    Result := Unassigned;
    Bkm := Index;
    BkmPos := CurBkmPos(Bkm);
    SearchRangeIndex(1, FRangeCount, BkmPos, RangeIndex, Found);

    with FGrid.FGridData do
    begin
        NewBkmPos := BofBkmPos;
        if Found then
        begin
            if CompareBkmPos(BkmPos, FRangeBuffer[RangeIndex].First) = 1 then
                NewBkmPos := PrevBkmPos(BkmPos)
            else if RangeIndex > 1 then
                NewBkmPos := FRangeBuffer[RangeIndex - 1].Last;
        end
        else if (RangeIndex >= 1) and (RangeIndex <= FRangeCount) then
        begin
            if CompareBkmPos(BkmPos, FRangeBuffer[RangeIndex].Last) = 1 then
                NewBkmPos := FRangeBuffer[RangeIndex].Last
            else if RangeIndex > 1 then
                NewBkmPos := FRangeBuffer[RangeIndex - 1].Last;
        end;

        if BkmPosBookmark(NewBkmPos, PrevBkm) then Result := PrevBkm;
    end;
end;

function TtsDBSelection.Previous(Index: Variant): Variant;
begin
    Result := Unassigned;
    if not FGrid.DataBound then begin Result := FUnboundSelection.Previous(Index); Exit end;

    if UseRangeSelection
        then Result := PreviousInRange(Index)
        else Result := FBookmarkSet.Previous(Index);
end;

function TtsDBSelection.RangeCount(FromIndex, ToIndex: Variant): Longint;
var
    CurBkm: Variant;
begin
    Result := 0;
    if not FGrid.DataBound then
        begin Result := FUnboundSelection.RangeCount(FromIndex, ToIndex); Exit; end;
    if VarIsEmpty(FromIndex) or VarIsEmpty(ToIndex) then Exit;
    if (FGrid.BookmarkType = bmtDefault) and (FGrid.CompareBkm(FromIndex, ToIndex) = 1) then Exit;

    CurBkm := FromIndex;
    if GetSelected(FromIndex) then Inc(Result);
    if FGrid.CompareBkm(CurBkm, ToIndex) = 0 then Exit;

    while True do
    begin
        CurBkm := Next(CurBkm);
        if VarIsEmpty(CurBkm) then
        begin
            if (FGrid.BookmarkType = bmtNonOrdered) then Result := 0;
            Break;
        end;

        if FGrid.BookmarkType = bmtDefault then
        begin
            if FGrid.CompareBkm(CurBkm, ToIndex) = 1 then Break;
            Inc(Result);
        end
        else
        begin
            Inc(Result);
            if FGrid.CompareBkm(CurBkm, ToIndex) = 0 then Break;
        end;
    end;
end;

function TtsDBSelection.Count: Longint;
var
    CurBkm: Variant;
begin
    Result := 0;
    if not FGrid.DataBound then begin Result := FUnboundSelection.Count; Exit; end;

    if UseRangeSelection then
    begin
        CurBkm := First;
        if VarIsEmpty(CurBkm) then Exit;

        Result := 1;
        while True do
        begin
            CurBkm := Next(CurBkm);
            if VarIsEmpty(CurBkm) then Exit;
            Inc(Result);
        end;
    end
    else
        Result := FBookmarkSet.Count;
end;

{TtsSelectedList}

destructor TtsSelectedList.Destroy;
begin
    ClearList;
    inherited;
end;

procedure TtsSelectedList.ClearList;
var
    I: Integer;
begin
    for I := 1 to Count do Item[I-1] := '';
end;

function TtsSelectedList.GetItem(Index: Integer): string;
begin
    Result := Strings[Index];
end;

procedure TtsSelectedList.SetItem(Index: Integer; Value: string);
begin
    Strings[Index] := Value;
end;

procedure TtsSelectedList.AddItem(Value: string);
begin
    Add(Value);
end;

{TtsDBCurrentCell}

function TtsDBCurrentCell.SetEditValue(const Value: Variant; ByUser, Redraw: Boolean): Boolean;
var
    Ok: Boolean;
begin
    Result := False;
    if not Grid.DataBound then begin Result := inherited SetEditValue(Value, ByUser, Redraw); Exit; end;
    if not Grid.Active then Exit;
    if Grid.CurrentCellInView then begin Result := inherited SetEditValue(Value, ByUser, Redraw); Exit; end;

    if (Grid.InEditState) then
    begin
        if not Grid.CheckVarType(ControlType, Value) then Exit;

        Ok := Grid.StartEdit;
        if Ok then Ok := Grid.StartCellChange(DataCol, True);

        if Ok then
        begin
            if ByUser then Grid.InternalShowEditor(tsAll, False);
            ClearBuffer;
            Grid.SetControlSelectMode(tsCurrent);
            Grid.Cell[DataCol, DataRow] := Value;
            Grid.DoCellEdit(DataCol, DataRow, ByUser);
        end;

        Result := Ok;
    end;
end;

procedure TtsDBCurrentCell.FetchCellValue;
begin
    if not Grid.DataBound then begin inherited; Exit; end;
    if not ValueSet(DataCol, inherited DataRow) then
    begin
        Grid.EnableStartEdit := False;
        try
            Grid.SetControlValue(Grid.BookmarkValue(DataCol, DataRow), False, False);
        finally
            Grid.EnableStartEdit := True;
        end;
    end;
end;

function TtsDBCurrentCell.GetTextHeight: Integer;
begin
    Result := 0;
    if (Grid.InEditState) then
    begin
        FetchCellValue;
        Result := Grid.CellTextHeight[DataCol, DataRow];
    end;
end;

function TtsDBCurrentCell.GetTextWidth : Integer;
begin
  Result := Grid.CellTextWidth[DataCol, DataRow];
end;

function TtsDBCurrentCell.GetTextLines: Integer;
begin
    Result := 0;
    if (Grid.InEditState) then
    begin
        FetchCellValue;
        Result := Grid.CellTextLines[DataCol, DataRow];
    end;
end;

function TtsDBCurrentCell.GetDBDataRow: Variant;
begin
    if not Grid.DataBound then begin Result := inherited DataRow; Exit end;
    Result := Grid.CurrentDataRow;
end;

function TtsDBCurrentCell.GetGrid: TtsCustomDBGrid;
begin
    Result := TtsCustomDBGrid(inherited Grid);
end;

procedure TtsDBCurrentCell.PutInView;
begin
    if not Grid.DataBound then begin inherited; Exit end;
    if not Grid.Active then Exit;

    if (Grid.CurDisplayCol < 1) or (Grid.CurDisplayCol > Grid.ColCount - 1) then Exit;

   // if (Grid.InEditState) then
   // begin  // Removed as part of release 2.20.11
        Grid.PutInView(Grid.CurDisplayCol, Grid.CurrentDataRow, vpNone,
                       True, False, ctlBoth);
        Grid.Update;
   // end;
end;

procedure TtsDBCurrentCell.MoveTo(DataCol: Longint; DataRow : Variant);
var
    DisplayCol: Longint;
    NewRownr: Longint;
    InCurRow: Boolean;
begin
    if not Grid.DataBound then begin inherited MoveTo(DataCol, DataRow); Exit end;

    if not Grid.Active then Exit;
    if not Grid.CheckIndex(itCol, DataCol, 1, Grid.Cols) then Exit;
    if not Grid.CheckBkmType(DataRow) then Exit;

    if Grid.InGridMode then
    begin
        InCurRow := (Grid.CompareBkm(DataRow, Grid.CurrentDataRow) = 0);
        DisplayCol := Grid.GetDisplayCol(DataCol);
        if (Grid.CurDisplayCol <> DisplayCol) or (not InCurRow) then
        begin
            NewRownr := Grid.CurDataRow;
            if not InCurRow then NewRownr := -1;
            if not Grid.CheckEndEdit(DataCol, NewRownr, False) then Exit;

            Grid.CheckHideControl(True);
            Grid.SetCurrentPosition(DisplayCol, Grid.CurDisplayRow, True, True);
            if not InCurRow then Grid.CurrentDataRow := DataRow;
            Grid.SetControlSelectMode(tsCurrent);
            Grid.ShowGridControl;
            if not Grid.InSetFocus then Grid.Update;
        end;
    end;
end;

procedure TtsDBCurrentCell.MoveToInsertRow(DataCol: Longint);
var
    NewLeftCol: Longint;
begin
    with Grid do
    begin
        if not DataBound then begin inherited; Exit; end;
        if not Active then Exit;
        if (GridMode <> gmEditInsert) or (GridStatus <> grNormal) then Exit;
        if IsInsertRow(CurDisplayRow) then Exit;
        if not CheckIndex(itCol, DataCol, 1, Cols) then Exit;
        if not CheckEndEdit(0, -1, False) then Exit;

        EnablePaint := False;
        try
            NewLeftCol := MoveToDisplayCol(LeftCol, GetDisplayCol(DataCol), vpRight);
            MoveTopLeft(NewLeftCol, GridTopRow);
            Append;
            SetCurrentPosition(GetDisplayCol(DataCol), CurDisplayRow, True, True);
        finally
            EnablePaint := True;
        end;
        Update;
    end;
end;

{TtsDBCombo}

function TtsDBCombo.GetDropDownRows: Longint;
begin
    Result := Grid.DropDownRows;
end;

function TtsDBCombo.GetDropDownCols: Longint;
begin
    Result := Grid.DropDownCols;
end;

function TtsDBCombo.GetValueCol: Longint;
begin
    Result := Grid.ValueCol;
end;

function TtsDBCombo.GetValueColSorted: Boolean;
begin
    Result := Grid.ValueColSorted;
end;

function TtsDBCombo.GetCompareType: TtsComboCompareType;
begin
    Result := Grid.CompareType;
end;

function TtsDBCombo.GetAutoSearch: TtsComboAutoSearchType;
begin
    Result := Grid.AutoSearch;
end;

function TtsDBCombo.GetAutoFill: Boolean;
begin
    Result := Grid.AutoFill;
end;

function TtsDBCombo.GetAutoFillConvertCase: TtsConvertCase;
begin
    Result := Grid.AutoFillConvertCase;
end;

function TtsDBCombo.GetAutoLookup: Boolean;
begin
    Result := Grid.AutoLookup;
end;

function TtsDBCombo.GetDropDownStyle: TtsDropDownStyle;
begin
    Result := Grid.DropDownStyle;
end;

function TtsDBCombo.GetGrid: TtsDBComboGrid;
begin
    Result := TtsDBComboGrid(FGrid);
end;

procedure TtsDBCombo.SetDropDownRows(Value: Longint);
begin
    if Value <> Grid.DropDownRows then Grid.DropDownRows := Value;
end;

procedure TtsDBCombo.SetDropDownCols(Value: Longint);
begin
    if Value <> Grid.DropDownCols then Grid.DropDownCols := Value;
end;

procedure TtsDBCombo.SetValueCol(Value: Longint);
begin
    if Value <> Grid.ValueCol then Grid.ValueCol := Value;
end;

procedure TtsDBCombo.SetValueColSorted(Value: Boolean);
begin
    if Value <> Grid.ValueColSorted then Grid.ValueColSorted := Value;
end;

procedure TtsDBCombo.SetCompareType(Value: TtsComboCompareType);
begin
    if Value <> Grid.CompareType then Grid.CompareType := Value;
end;

procedure TtsDBCombo.SetAutoSearch(Value: TtsComboAutoSearchType);
begin
    if Value <> Grid.AutoSearch then Grid.AutoSearch := Value;
end;

procedure TtsDBCombo.SetAutoFill(Value: Boolean);
begin
    if Value <> Grid.AutoFill then Grid.AutoFill := Value;
end;

procedure TtsDBCombo.SetAutoFillConvertCase(Value: TtsConvertCase);
begin
    if Value <> Grid.AutoFillConvertCase then Grid.AutoFillConvertCase := Value;
end;

procedure TtsDBCombo.SetAutoLookup(Value: Boolean);
begin
    if Value <> Grid.AutoLookup then Grid.AutoLookup := Value;
end;

procedure TtsDBCombo.SetDropDownStyle(Value: TtsDropDownStyle);
begin
    if Value <> Grid.DropDownStyle then Grid.DropDownStyle := Value;
end;

{TtsDBComboGrid}

constructor TtsDBComboGrid.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);

    FAsCombo := True;
    FGrid := Self;
    Parent := TWinControl(AOwner);
    ParentGrid := TtsBaseGrid(Parent.Owner);
    FDesigning := TtsCustomDBGrid(ParentGrid).InDesignMode;

    if not Reading then
    begin
        Ctl3D := False;
        ParentCtl3D := False;
    end;

    FDropDownRows := 4;
    FDropDownCols := 1;
    FDropDownStyle := ddDropDown;
    FValueCol := 1;
    FCompareType := ctCaseInsensitive;
    FAutoSearch := asNone;
    FAutoFill := False;
    FAutoFillConvertCase := afcOnEdit;
    FAutoLookup := True;
end;

destructor TtsDBComboGrid.Destroy;
begin
    FGrid := nil;
    inherited Destroy;
end;

function TtsDBComboGrid.GetDropDownRows: Longint;
begin
    Result := FDropDownRows;
end;

function TtsDBComboGrid.GetDropDownCols: Longint;
begin
    Result := FDropDownCols;
end;

function TtsDBComboGrid.GetValueCol: Longint;
begin
    Result := FValueCol;
end;

function TtsDBComboGrid.GetValueColSorted: Boolean;
begin
    Result := FValueColSorted;
end;

function TtsDBComboGrid.GetCompareType: TtsComboCompareType;
begin
    Result := FCompareType;
end;

function TtsDBComboGrid.GetAutoSearch: TtsComboAutoSearchType;
begin
    Result := FAutoSearch;
end;

function TtsDBComboGrid.GetAutoFill: Boolean;
begin
    Result := FAutoFill;
end;

function TtsDBComboGrid.GetAutoFillConvertCase: TtsConvertCase;
begin
    Result := FAutoFillConvertCase;
end;

function TtsDBComboGrid.GetAutoLookup: Boolean;
begin
    Result := FAutoLookup;
end;

function TtsDBComboGrid.GetDropDownStyle: TtsDropDownStyle;
begin
    Result := FDropDownStyle;
end;

function TtsDBComboGrid.GetGrid: TtsDBGrid;
begin
    Result := TtsDBGrid(FGrid);
end;

procedure TtsDBComboGrid.SetDropDownRows(Value: Longint);
begin
    if Value <> FDropDownRows then
    begin
        FDropDownRows := Value;
        if CanSetComboExtents then
            SetComboGridExtents(DropDownCols, DropDownRows);
    end;
end;

procedure TtsDBComboGrid.SetDropDownCols(Value: Longint);
begin
    if Value <> FDropDownCols then
    begin
        FDropDownCols := Value;
        AdjustComboGridExtents(DropDownCols, DropDownRows);
    end;
end;

procedure TtsDBComboGrid.SetValueCol(Value: Longint);
begin
    if Value <> FValueCol then FValueCol := Value;
end;

procedure TtsDBComboGrid.SetValueColSorted(Value: Boolean);
begin
    if Value <> FValueColSorted then FValueColSorted := Value;
end;

procedure TtsDBComboGrid.SetCompareType(Value: TtsComboCompareType);
begin
    if Value <> FCompareType then FCompareType := Value;
end;

procedure TtsDBComboGrid.SetAutoSearch(Value: TtsComboAutoSearchType);
begin
    if Value <> FAutoSearch then FAutoSearch := Value;
end;

procedure TtsDBComboGrid.SetAutoFill(Value: Boolean);
begin
    if Value <> FAutoFill then
    begin
        FAutoFill := Value;
        if FAutoFill and not (csLoading in ComponentState) then
        begin
            if (AutoSearch = asNone) then AutoSearch := asTop;
        end;
    end;
end;

procedure TtsDBComboGrid.SetAutoFillConvertCase(Value: TtsConvertCase);
begin
    if FAutoFillConvertCase <> Value then FAutoFillConvertCase := Value;
end;

procedure TtsDBComboGrid.SetAutoLookup(Value: Boolean);
begin
    if Value <> FAutoLookup then
    begin
        if not Value then
        begin
            FAutoLookup:= Value;
            if Assigned(FLookupDatasource) then Datasource := nil;
        end
        else
        begin
            StoreData := False;
            DataSource := nil;
            FAutoLookup:= Value;
            if InDesignMode and Visible then
            begin
                TtsCustomDBGrid(ParentGrid).InitComboData(False);
                AdjustComboGridExtents(DropDownCols, DropDownRows);
                CheckSetLookupDataset;
            end;
        end;
    end;
end;

procedure TtsDBComboGrid.SetDropDownStyle(Value: TtsDropDownStyle);
begin
    if Value <> FDropDownStyle then
    begin
        FDropDownStyle := Value;
        TtsCustomDBGrid(ParentGrid).RedisplayControl(True);
    end;
end;

function TtsDBComboGrid.GetParentGrid: TtsBaseGrid;
begin
    Result := FParentGrid;
end;

procedure TtsDBComboGrid.SetParentGrid(Value: TtsBaseGrid);
begin
    FParentGrid := Value;
end;

function TtsDBComboGrid.GetParentGridCombo: TtsCombo;
begin
    Result := FCombo;
end;

procedure TtsDBComboGrid.SetParentGridCombo(Value: TtsCombo);
begin
    FCombo := Value;
end;

{TtsDBGridStreamComponent}

function TtsDBGridStreamComponent.GetDataBound: Boolean;
begin
    Result := Grid.DataBound;
end;

procedure TtsDBGridStreamComponent.SetDataBound(Value: Boolean);
begin
    Grid.FReadBoundProps := Value;
end;

procedure TtsDBGridStreamComponent.DefineProperties(Filer: TFiler);
begin
    inherited;
end;

procedure TtsDBGridStreamComponent.Loaded;
begin
    if FGrid is TtsCustomDBGrid then
    begin
        Grid.FReadBoundProps := False;
        Grid.CheckApplyProps(not Grid.DataBound);
    end;
end;

function TtsDBGridStreamComponent.GetGrid: TtsCustomDBGrid;
begin
    Result := TtsCustomDBGrid(FGrid);
end;

{TtsGridDataLink}

type
  TIntArray = array[0..MaxMapSize] of Integer;
  PIntArray = ^TIntArray;

constructor TtsGridDataLink.Create(Grid: TtsCustomDBGrid);
begin
    inherited Create;
    FGrid := Grid;
end;

destructor TtsGridDataLink.Destroy;
begin
    ClearMapping;
    inherited Destroy;
end;

function TtsGridDataLink.AddMapping(const FieldName: string; Field: TField): Boolean;
var
    NewSize: Integer;
begin
    Result := True;
    if FFieldCount >= MaxMapSize then Exit;

    if SparseMap then
    begin
        if not Assigned(Field) then Field := DataSet.FindField(FieldName)
    end
    else
    begin
        if not Assigned(Field) then Field := DataSet.FieldByName(FieldName);
    end;

    if FFieldCount = FFieldMapSize then
    begin
        NewSize := FFieldMapSize;
        if NewSize = 0 then NewSize := 8
                       else Inc(NewSize, NewSize);

        if (NewSize < FFieldCount) then NewSize := FFieldCount + 1;
        if (NewSize > MaxMapSize)  then NewSize := MaxMapSize;

        ReallocMem(FFieldMap, NewSize * SizeOf(Integer));
        FFieldMapSize := NewSize;
    end;

    if Assigned(Field) then PIntArray(FFieldMap)^[FFieldCount] := Field.Index
                       else PIntArray(FFieldMap)^[FFieldCount] := -1;
    Inc(FFieldCount);
end;

procedure TtsGridDataLink.ClearMapping;
begin
    if FFieldMap <> nil then
    begin
        FreeMem(FFieldMap, FFieldMapSize * SizeOf(Integer));
        FFieldMap := nil;
        FFieldMapSize := 0;
        FFieldCount := 0;
    end;
end;

function TtsGridDataLink.GetFields(DataCol: Longint): TField;
begin
    Result := nil;
    if (DataCol >= 0) and (DataCol < FFieldCount) and
       (PIntArray(FFieldMap)^[DataCol] >= 0) then
        Result := DataSet.Fields[PIntArray(FFieldMap)^[DataCol]];
end;

procedure TtsGridDataLink.ActiveChanged;
begin
    FGrid.LinkActive(Active);
end;

procedure TtsGridDataLink.CheckBrowseMode;
begin
    FGrid.CheckBrowseMode;
end;

procedure TtsGridDataLink.DataSetScrolled(Distance: Integer);
begin
    FGrid.DataSetScrolled(Distance);
end;

procedure TtsGridDataLink.DataSetChanged;
begin
    FGrid.DataSetChanged;
end;

procedure TtsGridDataLink.LayoutChanged;
var
    SaveState: Boolean;
begin
    SaveState := FGrid.FLayoutFromDataset;
    FGrid.FLayoutFromDataset := True;
    try
        FGrid.LayoutChanged;
    finally
        FGrid.FLayoutFromDataset := SaveState;
    end;
end;

procedure TtsGridDataLink.EditingChanged;
begin
    FGrid.EditingChanged;
end;

procedure TtsGridDataLink.RecordChanged(Field: TField);
begin
    FGrid.RecordChanged(Field);
end;

procedure TtsGridDataLink.UpdateData;
begin
    FInUpdateData := True;
    try
        FGrid.UpdateData;
    finally
        FInUpdateData := False;
    end;
end;

function TtsGridDataLink.GetMappedIndex(DataCol: Longint): Integer;
begin
    if (0 <= DataCol) and (DataCol < FFieldCount) then
        Result := PIntArray(FFieldMap)^[DataCol]
    else
        Result := -1;
end;

procedure TtsGridDataLink.Reset;
begin
    if FGrid.FDataModified then RecordChanged(nil) else Dataset.Cancel;
end;

{TtsStandardDataset}

constructor TtsStandardDataset.Create(Grid: TtsCustomDBGrid);
begin
    inherited Create(Grid);
    FRecIdBuf := nil;
    FBkmBuf := nil;
    FBufSize := 0;

    FCanDisableControls := 0;
    FControlsDisabled := False;
end;

destructor TtsStandardDataset.Destroy;
begin
    ClearIdBuffers(0, 0, True);
    ClearPropBuffer(0, 0, True);
    ReallocMem(FRecIdBuf, 0);
    ReallocMem(FBkmBuf, 0);
    inherited Destroy;
end;

function TtsStandardDataset.GetBufferRows: Integer;
begin
    Result := DataLink.RecordCount;
end;

function TtsStandardDataset.GetActive: Boolean;
begin
    Result := Assigned(Dataset) and Dataset.Active;
end;

procedure TtsStandardDataset.LinkActive(Value: Boolean);
begin
    if Value then
    begin
        Dataset := FGrid.Dataset;
        SaveCurIndex;
        ResizeIdBuffers(FGrid.MaxDisplayRows);
        ClearIdBuffers(0, 0, True);
        ResizePropBuffer(FGrid.MaxDisplayRows);
        ClearPropBuffer(0, 0, True);
        SetDatasetBufferCount(FGrid.MaxDisplayRows);
    end
    else
    begin
        Dataset := nil;
        InitGridDataset;
    end;

    inherited;
end;

procedure TtsStandardDataset.MoveFirst;
begin
    Dataset.First;
end;

procedure TtsStandardDataset.MoveLast;
begin
    Dataset.Last;
end;

procedure TtsStandardDataset.SetActiveRecord(Value: Integer);
begin
    DataLink.ActiveRecord := Value - 1;
end;

function TtsStandardDataset.GetActiveRecord: Integer;
begin
    Result := DataLink.ActiveRecord + 1;
end;

function TtsStandardDataset.GetActiveRecordNumber: Longint;
begin
    Result := Dataset.Recno;
end;

function TtsStandardDataset.GetActiveBookmark: TBookmarkStr;
begin
    Result := Bookmark[ActiveRecord];
end;

function TtsStandardDataset.GetRecCount: Longint;
begin
    Result := 0;
    if not Assigned(Dataset) then Exit;
    Result := Dataset.RecordCount;
end;

function TtsStandardDataset.FirstRow: Longint;
var
    OldActive: Integer;
begin
    if not Assigned(Dataset) then
        Result := 0
    else
    begin
        OldActive := ActiveRecord;
        try
            ActiveRecord := 1;
            Result := Dataset.RecNo;
        finally
            ActiveRecord := OldActive;
        end
    end;
end;

function TtsStandardDataset.CurrentBufRow: Integer;
begin
    Result := ActiveRecord;
end;

function TtsStandardDataset.BufferPos(Bkm: TBookmarkStr): Integer;
var
    Count: Integer;
    OldActive: Integer;
    CompRes: Integer;
begin
    if not Active then
        Result := 0
    else if Dataset.Bookmark = Bkm then
        Result := ActiveRecord
    else with Dataset do
    begin
        Result := 0;
        CompRes := CompareBkm(Bkm, Self.Bookmark[1]);
        if (FGrid.BookmarkType = bmtDefault) and (CompRes < 0) then Exit;

        if CompRes = 0 then
        begin
            Result := 1;
            Exit;
        end;

        CompRes := CompareBkm(Bkm, Self.Bookmark[BufferRows]);
        if CompRes = 0 then
        begin
            Result := BufferRows;
            Exit;
        end;

        if (FGrid.BookmarkType = bmtDefault) and (CompRes > 0) then
        begin
            Result := BufferRows + 1;
            Exit;
        end;

        Count := BufferRows - 2;
        if Count > 0 then
        begin
            OldActive := Self.ActiveRecord;
            try
                Result := 2;
                while Result <= Count + 1 do
                begin
                    Self.ActiveRecord := Result;
                    if CompareBkm(Bookmark, Bkm) = 0 then Break;
                    Inc(Result);
                end;
            finally
                if Result > Count + 1 then Result := BufferRows + 1;
                if (Result > BufferRows) and (FGrid.BookmarkType = bmtNonOrdered) then
                    Result := 0;

                Self.ActiveRecord := OldActive;
            end;
        end;
    end;
end;

function TtsStandardDataset.BufferRow(Bkm: TBookmarkStr): Integer;
begin
    Result := BufferPos(Bkm);
    if Result > Datalink.RecordCount then Result := 0;
end;

function TtsStandardDataset.BufferBkmPos(BkmPos: TtsBkmPos): Integer;
var
    Bkm: TBookmarkStr;
begin
    Result := 0;
    if not Active then Exit;

    case BkmPos.Offset of
        bpoBof: Result := 0;
        bpoEof: Result := BufferRows + 1;
        bpoCurrent: Result := BufferPos(BkmPos.Bkm);
        bpoPrior:
            begin
                Result := BufferPos(BkmPos.Bkm);
                if (Result > 0) and (Result <= BufferRows) then
                    Dec(Result)
                else if not GetPrevBookmark(BkmPos.Bkm, Bkm) then
                    Result := 0
                else if CompareBkm(Bookmark[BufferRows], Bkm) = 0 then
                    Result := BufferRows
                else
                    Result := BufferRows + 1;
            end;

        bpoNext:
            begin
                Result := BufferPos(BkmPos.Bkm);
                if (Result > 0) and (Result <= BufferRows) then
                    Inc(Result)
                else if not GetNextBookmark(BkmPos.Bkm, Bkm) then
                    Result := BufferRows + 1
                else if CompareBkm(Bookmark[1], Bkm) = 0 then
                    Result := 1
                else
                    Result := 0;
            end;
    end;
end;

function TtsStandardDataset.MoveActive(Count: Longint; var MovedBy: Longint): Longint;
var
    OldActive: Integer;
begin
    Result := 0;
    MovedBy := 0;
    if Active then
    begin
        OldActive := ActiveRecord;
        Result := Dataset.MoveBy(Count);
        if Count > 0
            then MovedBy := CalcMax(Count - (BufferRows - OldActive), 0)
            else MovedBy := CalcMin(Count + OldActive - 1, 0)
    end;
end;

function TtsStandardDataset.GetBookmark(BufRow: Integer): TBookmarkStr;
var
    OldActive: Integer;
begin
    Result := '';
    if Active and (BufRow >= 1) and (BufRow <= Datalink.BufferCount) then
    begin
        if (not Dataset.ControlsDisabled) and
           (BufRow <= FBufSize) and (not VarIsEmpty(FBkmBuf[BufRow])) then
            Result := FBkmBuf[BufRow]
        else
        begin
            OldActive := ActiveRecord;
            try
                ActiveRecord := BufRow;
                Result := Dataset.Bookmark;
                if BufRow <= FBufSize then FBkmBuf[BufRow] := Result;
            finally
                ActiveRecord := OldActive;
            end;
        end;
    end;
end;

function TtsStandardDataset.GetRecId(BufRow: Integer): Variant;
var
    OldActive: Integer;
begin
    Result := Unassigned;
    if (BufRow < 1) or (BufRow > BufferRows) then Exit;

    OldActive := ActiveRecord;
    try
        ActiveRecord := BufRow;
        if BufRow > FBufSize then
            FGrid.DoGetRecordId(Bookmark[BufRow], Result)
        else if (not Dataset.ControlsDisabled) and
                (not VarIsEmpty(FRecIdBuf[BufRow])) then
            Result := FRecIdBuf[BufRow]
        else
        begin
            FGrid.DoGetRecordId(Bookmark[BufRow], Result);
            if BufRow <= BufferRows then FRecIdBuf[BufRow] := Result;
        end;
    finally
        ActiveRecord := OldActive;
    end;
end;

function TtsStandardDataset.GetRecordId(BufRow: Integer): Variant;
begin
    if FGrid.CanUseRecordIds
        then Result := RecId[BufRow]
        else Result := Bookmark[BufRow];
end;

procedure TtsStandardDataset.ClearIdBuffers(FromRow, ToRow: Integer; Reset: Boolean);
var
    I: Integer;
begin
    if FromRow <= 0 then FromRow := 1;
    if (ToRow <= 0) or (ToRow > FBufSize) then ToRow := FBufSize;

    for I := FromRow to ToRow do
    begin
        if Reset then
        begin
            FRecIdBuf[I] := Unassigned;
            FBkmBuf[I] := Unassigned;
        end
        else
        begin
            ZeroMemory(@FRecIdBuf[I], SizeOf(Variant));
            ZeroMemory(@FBkmBuf[I], SizeOf(Variant));
        end;
    end;
end;

procedure TtsStandardDataset.ResizeIdBuffers(NewSize: Integer);
var
    OldSize: Integer;
begin
    if NewSize = FBufSize then Exit;

    OldSize := FBufSize;
    ClearIdBuffers(NewSize + 1, OldSize, True);
    ReallocMem(FRecIdBuf, NewSize * SizeOf(Variant));
    ReallocMem(FBkmBuf, NewSize * SizeOf(Variant));

    FBufSize := NewSize;
    ClearIdBuffers(OldSize + 1, NewSize, False);
end;

procedure TtsStandardDataset.MoveIdBuffers(Distance: Integer);
var
    ToIndex, FromIndex, Count: Integer;
    StartIndex, EndIndex: Integer;
begin
    if not Active then Exit;
    if (Distance = 0) then Exit;

    if Abs(Distance) >= FBufSize then
    begin
        ClearIdBuffers(0, 0, True);
        Exit;
    end;

    if Distance < 0 then
    begin
        FromIndex := 1;
        ToIndex := FromIndex + Abs(Distance);
    end
    else
    begin
        ToIndex := 1;
        FromIndex := ToIndex + Distance;
    end;

    Count := FBufSize - Abs(Distance);
    if Count + (ToIndex - 1) > FBufSize then Count := FBufSize - (ToIndex - 1);
    if Count + (FromIndex - 1) > FBufSize then Count := FBufSize - (FromIndex - 1);

    if ToIndex < FromIndex then
    begin
        StartIndex := ToIndex;
        EndIndex := FromIndex - 1;
    end
    else
    begin
        StartIndex := FromIndex + Count;
        EndIndex := ToIndex + Count - 1;
    end;

    ClearIdBuffers(StartIndex, EndIndex, True);
    MoveMemory(@FRecIdBuf[ToIndex], @FRecIdBuf[FromIndex], Count * SizeOf(Variant));
    MoveMemory(@FBkmBuf[ToIndex], @FBkmBuf[FromIndex], Count * SizeOf(Variant));

    if ToIndex < FromIndex then
    begin
        StartIndex := CalcMax(FromIndex, ToIndex + Count);
        EndIndex := FBufSize;
    end
    else
    begin
        StartIndex := 1;
        EndIndex := CalcMin(FromIndex + Count - 1, ToIndex - 1);
    end;

    ClearIdBuffers(StartIndex, EndIndex, False);
end;

function TtsStandardDataset.ResizeBuffer(NewSize: Integer; var Redraw: Boolean): Boolean;
var
    OldBufferCount: Longint;
begin
    Result := True;

    ResizeIdBuffers(NewSize);
    ClearIdBuffers(0, 0, True);
    ResizePropBuffer(NewSize);
    ClearPropBuffer(0, 0, True);

    OldBufferCount := Datalink.BufferCount;
    if not Active
        then Result := False
        else SetDatasetBufferCount(NewSize);
    Redraw := OldBufferCount < Datalink.BufferCount;
end;

function TtsStandardDataset.OnLastRecord: Boolean;
begin
    Result := Dataset.EOF;
end;

function TtsStandardDataset.NextBufferBkm(Bkm: TBookmarkStr; var NextBkm: TBookmarkStr): Boolean;
var
    BufIndex: Integer;
begin
    Result := False;
    BufIndex := BufferRow(Bkm);
    if (BufIndex >= 1) and (BufIndex < BufferRows) then
    begin
        Result := True;
        NextBkm := Bookmark[BufIndex + 1];
    end;
end;

function TtsStandardDataset.PrevBufferBkm(Bkm: TBookmarkStr; var PrevBkm: TBookmarkStr): Boolean;
var
    BufIndex: Integer;
begin
    Result := False;
    BufIndex := BufferRow(Bkm);
    if (BufIndex > 1) and (BufIndex <= BufferRows) then
    begin
        Result := True;
        PrevBkm := Bookmark[BufIndex - 1];
    end;
end;

function TtsStandardDataset.SetToBookmark(Bkm: TBookmarkStr; RaiseError: Boolean): Boolean;
begin
    Result := True;
    try
        if Dataset.Bookmark <> Bkm then
            Dataset.Bookmark := Bkm;
    except
        if RaiseError then raise;
        Result := False;
        Dataset.Resync([]);
    end;
end;

function TtsStandardDataset.GetNextBookmark(Bkm: TBookmarkStr; var NextBkm: TBookmarkStr): Boolean;
var
    Count: Integer;
    OldBkm: TBookmarkStr;
    Deleted: Boolean;
begin
    NextBkm := '';
    CheckDisableControls;
    Dataset.DisableControls;
    try
        OldBkm := Dataset.Bookmark;
        try
            Result := True;
            Deleted := not SetToBookmark(Bkm, False);
            if (not Deleted) or
               ((FGrid.BookmarkType = bmtDefault) and
                (CompareBkm(Bkm, Dataset.Bookmark) >= 0)) then
            begin
                Count := Dataset.MoveBy(1);
                Result := Count <> 0;
            end;

            if Result then NextBkm := Dataset.Bookmark;
        finally
            Dataset.Bookmark := OldBkm;
        end;
    finally
        Dataset.EnableControls;
    end;
end;

function TtsStandardDataset.NextBookmark(Bkm: TBookmarkStr; var NextBkm: TBookmarkStr): Boolean;
begin
    NextBkm := '';
    Result := NextBufferBkm(Bkm, NextBkm);
    if not Result then
        Result := GetNextBookmark(Bkm, NextBkm);
end;

function TtsStandardDataset.GetPrevBookmark(Bkm: TBookmarkStr; var PrevBkm: TBookmarkStr): Boolean;
var
    Count: Integer;
    OldBkm: TBookmarkStr;
    Deleted: Boolean;
begin
    PrevBkm := '';
    CheckDisableControls;
    Dataset.DisableControls;
    try
        OldBkm := Dataset.Bookmark;
        try
            Result := True;
            Deleted := not SetToBookmark(Bkm, False);
            if (not Deleted) or (FGrid.BookmarkType = bmtNonOrdered) or
               (CompareBkm(Bkm, Dataset.Bookmark) <= 0) then
            begin
                Count := Dataset.MoveBy(-1);
                Result := Count <> 0;
            end;

            if Result then PrevBkm := Dataset.Bookmark;
        finally
            Dataset.Bookmark := OldBkm;
        end;
    finally
        Dataset.EnableControls;
    end;
end;

function TtsStandardDataset.PrevBookmark(Bkm: TBookmarkStr; var PrevBkm: TBookmarkStr): Boolean;
begin
    PrevBkm := '';
    Result := PrevBufferBkm(Bkm, PrevBkm);
    if not Result then
        Result := GetPrevBookmark(Bkm, PrevBkm);
end;

function TtsStandardDataset.PrevBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos;
var
    Bkm: TBookmarkStr;
begin
    case BkmPos.Offset of
        bpoBof: Result := BkmPos;
        bpoPrior:
            begin
                if not BkmPosBookmark(BkmPos, Bkm) then
                    Result := BofBkmPos
                else
                begin
                    Result.Bkm := Bkm;
                    Result.Offset := bpoPrior;
                end;
            end;
        bpoNext:
            begin
                Result.Bkm := BkmPos.Bkm;
                Result.Offset := bpoCurrent;
            end;
    else
        Result.Bkm := BkmPos.Bkm;
        Result.Offset := bpoPrior;
    end;
end;

function TtsStandardDataset.NextBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos;
var
    Bkm: TBookmarkStr;
begin
    case BkmPos.Offset of
        bpoEof: Result := BkmPos;
        bpoNext:
            begin
                if not BkmPosBookmark(BkmPos, Bkm) then
                    Result := EofBkmPos
                else
                begin
                    Result.Bkm := Bkm;
                    Result.Offset := bpoNext;
                end;
            end;
        bpoPrior:
            begin
                Result.Bkm := BkmPos.Bkm;
                Result.Offset := bpoCurrent;
            end;
    else
        Result.Bkm := BkmPos.Bkm;
        Result.Offset := bpoNext;
    end;
end;

function TtsStandardDataset.CheckPrevBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos;
var
    Bkm: TBookmarkStr;
begin
    case BkmPos.Offset of
        bpoPrior:
            begin
                if not BkmPosBookmark(BkmPos, Bkm) then
                    Result := BkmPos
                else
                begin
                    Result.Bkm := Bkm;
                    Result.Offset := bpoPrior;
                end;
            end;

        bpoNext:
            begin
                Result.Bkm := BkmPos.Bkm;
                Result.Offset := bpoCurrent;
            end;
    else
        if Dataset.BOF and
           (CompareBkm(Dataset.Bookmark, BkmPos.Bkm) = 0) then
            Result := BkmPos
        else
        begin
            Result.Bkm := BkmPos.Bkm;
            Result.Offset := bpoPrior;
        end;
    end;
end;

function TtsStandardDataset.CheckNextBkmPos(const BkmPos: TtsBkmPos): TtsBkmPos;
var
    Bkm: TBookmarkStr;
begin
    case BkmPos.Offset of
        bpoNext:
            begin
                if not BkmPosBookmark(BkmPos, Bkm)
                    then Result := BkmPos
                    else Result := CheckNextBkmPos(CurBkmPos(Bkm));
            end;

        bpoPrior:
            begin
                Result.Bkm := BkmPos.Bkm;
                Result.Offset := bpoCurrent;
            end;
    else
        if Dataset.EOF and
           (CompareBkm(Dataset.Bookmark, BkmPos.Bkm) = 0) then
            Result := BkmPos
        else
        begin
            Result.Bkm := BkmPos.Bkm;
            Result.Offset := bpoNext;
        end;
    end;
end;

function TtsStandardDataset.FirstBookmark: TBookmarkStr;
begin
    if not Dataset.BOF then
    begin
        CheckDisableControls;
        Dataset.First;
    end;
    Result := Dataset.Bookmark;
end;

function TtsStandardDataset.LastBookmark: TBookmarkStr;
begin
    if not Dataset.EOF then
    begin
        CheckDisableControls;
        Dataset.Last;
    end;
    Result := Dataset.Bookmark;
end;

function TtsStandardDataset.BufferPositionChanged(Value: TtsDatasetPosition): Boolean;
var
    TopBkm: TBookmarkStr;
begin
    Result := (Value.ActiveRow <> CurrentBufRow);
    if not Result then
    begin
        TopBkm := FGrid.TopRow;
        Result := TopBkm <> Value.TopBkm;
        if Result then
            Result := CompareBkm(FGrid.TopRow, Value.TopBkm) <> 0;
    end;
end;

function TtsStandardDataset.GetDatasetPosition: TtsDatasetPosition;
begin
    Result := inherited GetDatasetPosition;
    if not Active then Exit;

    Result.ActiveRow := CurrentBufRow;
    Result.TopBkm := FGrid.TopRow;
end;

procedure TtsStandardDataset.SetDatasetPosition(Value: TtsDatasetPosition);
begin
    if not Active then Exit;

    if BufferPositionChanged(Value) then
    begin
        CheckDisableControls;
        Dataset.DisableControls;
        try
            MoveToRecord(Value.TopBkm);
            Value.ActiveRow := CalcMin(Value.ActiveRow, BufferRows);
            if Value.ActiveRow <> CurrentBufRow then
                Dataset.MoveBy(Value.ActiveRow - CurrentBufRow);
        finally
            Dataset.EnableControls;
        end;
    end;
end;

function TtsStandardDataset.MoveBy(Count: Longint): Longint;
begin
    Result := Dataset.MoveBy(Count);
end;

function TtsStandardDataset.GetAtEnd: Boolean;
begin
    Result := Dataset.Eof;
end;

procedure TtsStandardDataset.SetAtEnd(Value: Boolean);
begin
end;

function TtsStandardDataset.GetAtStart: Boolean;
begin
    Result := Dataset.Bof;
end;

procedure TtsStandardDataset.SetAtStart(Value: Boolean);
begin
end;

function TtsStandardDataset.MoveToRecord(Bkm: TBookmarkStr): Boolean;
var
    Count: Integer;
    OldBufferCount: Integer;
begin
    Result := False;
    if BufferRows = 0 then Exit;

    Dataset.DisableControls;
    try
        if CompareBkm(Bookmark[1], Bkm) <> 0 then
        begin
            OldBufferCount := Datalink.BufferCount;
            try
                //When a dataset's controls are disabled, moving the current record in
                //the dataset does not update the FFirstRecord position in the attached
                //data-links. This is an error in the Delphi TDataset class. This error
                //can cause an exception to be raised with some dataset types when setting
                //the dataset's BufferCount to a smaller size. Setting the ActiveRecord
                //to 1 before resizing the BufferCount prevents the exception from
                //occurring.
                ActiveRecord := 1;

                Datalink.BufferCount := 1;
                SetToBookmark(Bkm, False);
            finally
                Datalink.BufferCount := OldBufferCount;
            end;

            if CurrentBufRow > 1 then
            begin
                Count := Dataset.MoveBy(BufferRows - 1);
                if Count <> 0 then Dataset.MoveBy(-Count)
            end;
        end;
    finally
        Dataset.EnableControls;
    end;

    Result := True;
end;

procedure TtsStandardDataset.RereadBuffer(TopRow: Longint; ForceRead: Boolean);
begin
end;

procedure TtsStandardDataset.SetProperties(Reread: Boolean);
begin
end;

function TtsStandardDataset.BookmarkValue(Fieldno: Longint; Bkm: TBookmarkStr): Variant;
begin
    if CompareBkm(Dataset.Bookmark, Bkm) <> 0 then Dataset.Bookmark := Bkm;
    Result := FGrid.ActiveCell[Fieldno, Bkm];
end;

function TtsStandardDataset.GetBookmarkRecID(RecBkm: TBookmarkStr; BufRownr: Integer): Variant;
var
    OldDatasetPos: TtsDatasetPosition;
begin
    if BufRownr > 0 then
    begin
        Result := RecId[BufRownr];
        Exit;
    end;

    if VarToStr(RecBkm) = VarToStr(EmptyBookmark) then
    begin
        Result := EmptyRecId;
        Exit;
    end;

    Result := Unassigned;
    FGrid.SaveDatasetPosition(OldDatasetPos);
    try
        CheckDisableControls;
        Dataset.Bookmark := RecBkm;
        Result := RecId[CurrentBufRow];
    finally
        FGrid.RestoreDatasetPosition(OldDatasetPos, True);
    end;
end;

function TtsStandardDataset.GetBkmValueAndRecordID(Fieldno: Integer; Bkm: TBookmarkStr; var FieldValue: Variant): Variant;
var
    DatasetPos: TtsDatasetPosition;
begin
    FGrid.SaveDatasetPosition(DatasetPos);
    try
        CheckDisableControls;
        Dataset.Bookmark := Bkm;
        FieldValue := FGrid.ActiveCell[Fieldno, Bkm];
        Result := RecordId[CurrentBufRow];
    finally
        FGrid.RestoreDatasetPosition(DatasetPos, True);
    end;
end;

function TtsStandardDataset.DoRecCount(ReCount: Boolean): Longint;
begin
    Result := Dataset.RecordCount;
end;

function TtsStandardDataset.KeyEqual(KeyBkm: TBookmarkStr; SearchValue: string; Fieldno: Integer;
                                     CompareType: TtsComboCompareType; ParentGrid: TtsCustomDBGrid;
                                     FullCmpLen: Boolean): Boolean;
var
    KeyValue: string;
    Len: Integer;
begin
    Result := False;
    if VarToStr(KeyBkm) <> VarToStr(EmptyBookmark) then
    begin
        KeyValue := FGrid.BookmarkValue(Fieldno, KeyBkm);
        Len := CalcMin(Length(SearchValue), Length(KeyValue));
        if FullCmpLen then Len := Length(SearchValue);

        case CompareType of
            ctCaseSensitive: Result := FGrid.CompCaseSensitive(SearchValue, KeyValue, Len) = 0;
            ctCaseInsensitive: Result := FGrid.CompCaseInsensitive(SearchValue, KeyValue, Len) = 0;
            ctOwn: Result := ParentGrid.CompOwn(SearchValue, KeyValue, Len) = 0;
        end;
    end;
end;

function TtsStandardDataset.CanFindNearest: Boolean;
begin
    Result := False;
    if FGrid.Dataset is TTable then Result := True;
end;

procedure TtsStandardDataset.FindNearest(Value: string);
begin
    if FGrid.Dataset is TTable then
    begin
        TTable(FGrid.Dataset).FindNearest([Value]);
    end;
end;

function TtsStandardDataset.FindKey(Value: string; Fieldno: Integer; CompareType: TtsComboCompareType;
                                    ParentGrid: TtsCustomDBGrid; FullCmpLen: Boolean; var Found: Boolean): TBookmarkStr;
begin
    Result := EmptyBookmark;
    Dataset.DisableControls;
    try
        try
            if CanFindNearest then
            begin
                FindNearest(Value);
                Result := Dataset.Bookmark;
            end
            else
            begin
                Result := LocateValue(EmptyBookmark, EmptyBookmark, Value, Fieldno,
                                      CompareType, ParentGrid, FullCmpLen, Found);
            end;
        except
            Result := EmptyBookmark;
        end;
    finally
        Dataset.EnableControls;
    end;

    Found := KeyEqual(Result, Value, Fieldno, CompareType, ParentGrid, FullCmpLen);
end;

function TtsStandardDataset.GetPreviousBkms(var FromBkm: TBookmarkStr; ToBkm: TBookmarkStr;
                                            BkmList: TtsSelectedList;  StepSize: Integer;
                                            SelectingAll: Boolean; var Found: Boolean;
                                            var Count, Total: Longint; var Canceled: Boolean): Boolean;
var
    CurBkm: TBookmarkStr;
    MoveCnt, CntBkm: Integer;
    GetPrev: Boolean;
    CompRes: Integer;
begin
    Found := False;
    CntBkm := 0;
    CurBkm := FromBkm;

    CheckDisableControls;
    GetPrev := SetToBookmark(CurBkm, (FGrid.BookmarkType = bmtNonOrdered));
    if not GetPrev then
        GetPrev := (FGrid.BookmarkType = bmtNonOrdered) or
                   (CompareBkm(CurBkm, Dataset.Bookmark) <= 0);

    while not Dataset.Bof and not Found and ((CntBkm < StepSize) or (StepSize = 0)) do
    begin
        FGrid.DoScanRecord(SelectingAll, sstScan, Count, Total, Canceled);
        if Canceled and (Count >= Total) then Break;

        Inc(CntBkm);
        MoveCnt := -1;
        if GetPrev then MoveCnt := Dataset.MoveBy(-1);

        if MoveCnt <> 0 then
        begin
            CurBkm := Dataset.Bookmark;
            CompRes := CompareBkm(CurBkm, ToBkm);
            if FGrid.BookmarkType = bmtDefault then
            begin
                if CompRes >= 0 then BkmList.AddItem(CurBkm);
                Found := CompRes <= 0;
            end
            else
            begin
                BkmList.AddItem(CurBkm);
                Found := CompRes = 0;
            end;
        end;

        GetPrev := True;
    end;

    Result := Dataset.Bof;
    FromBkm := CurBkm;
end;

function TtsStandardDataset.GetNextBkms(var FromBkm: TBookmarkStr; ToBkm: TBookmarkStr;
                                        BkmList: TtsSelectedList; StepSize: Integer;
                                        SelectingAll: Boolean; var Found: Boolean;
                                        var Count, Total: Longint; var Canceled: Boolean): Boolean;
var
    CurBkm: TBookmarkStr;
    MoveCnt, CntBkm: Integer;
    GetNext: Boolean;
    CompRes: Integer;
begin
    Found := False;
    CntBkm := 0;
    CurBkm := FromBkm;

    CheckDisableControls;
    if FromBkm = '' then
    begin
        Dataset.First;
        GetNext := False;
    end
    else
    begin
        GetNext := SetToBookmark(CurBkm, False);
        if not GetNext then
            GetNext := (FGrid.BookmarkType = bmtDefault) and
                       (CompareBkm(CurBkm, Dataset.Bookmark) >= 0);
    end;

    while not Dataset.Eof and not Found and
          ((CntBkm < StepSize) or (StepSize = 0)) do
    begin
        FGrid.DoScanRecord(SelectingAll, sstScan, Count, Total, Canceled);
        if Canceled and (Count >= Total) then Break;

        Inc(CntBkm);
        MoveCnt := 1;
        if GetNext then MoveCnt := Dataset.MoveBy(1);

        if MoveCnt <> 0 then
        begin
            CurBkm := Dataset.Bookmark;
            CompRes := -1;
            if ToBkm <> '' then CompRes := CompareBkm(CurBkm, ToBkm);
            if FGrid.BookmarkType = bmtDefault then
            begin
                if CompRes <= 0 then BkmList.AddItem(CurBkm);
                Found := CompRes >= 0;
            end
            else
            begin
                BkmList.AddItem(CurBkm);
                Found := CompRes = 0;
            end;
        end;

        GetNext := True;
    end;

    FromBkm := CurBkm;
    Result := Dataset.Eof;
    if Dataset.Eof and (ToBkm = '') then Found := True;
end;

procedure TtsStandardDataset.SetBookmarkPos(Value: TBookmarkStr);
begin
    SetToBookmark(Value, False);
end;

function TtsStandardDataset.GetBookmarkPos: TBookmarkStr;
begin
    Result := Dataset.Bookmark;
end;

function TtsStandardDataset.LocateValue(FromBkm, ToBkm: TBookmarkStr; Value: string; Fieldno: Integer;
                                        CompareType: TtsComboCompareType; ParentGrid: TtsCustomDBGrid;
                                        FullCmpLen: Boolean; var Found: Boolean): TBookmarkStr;
var
    CurBkm: TBookmarkStr;
    CellValue: string;
    Len: Integer;
    CompLen, CompRes: Integer;
begin
    Found := False;
    if Value = '' then
    begin
        Result := FromBkm;
        Exit;
    end;

    Dataset.DisableControls;
    try
        try
            CompLen := 0;
            if VarToStr(FromBkm) <> VarToStr(EmptyBookmark)
                then Dataset.Bookmark := FromBkm
                else Dataset.First;

            while not Dataset.Eof do
            begin
                CurBkm := Dataset.Bookmark;
                CellValue := FGrid.ActiveCell[Fieldno, CurBkm];
                CompRes := -2;
                Len := CalcMin(Length(Value), Length(CellValue));
                if FullCmpLen then Len := Length(Value);

                case CompareType of
                    ctCaseSensitive: CompRes := FGrid.CompCaseSensitive(Value, CellValue, Len);
                    ctCaseInsensitive: CompRes := FGrid.CompCaseInsensitive(Value, CellValue, Len);
                    ctOwn: CompRes := ParentGrid.CompOwn(Value, CellValue, Len);
                end;

                if (CompRes = 0) and (Len > CompLen) then
                begin
                    Found := True;
                    CompLen := Len;
                    Result := CurBkm;
                    if CompLen = Length(Value) then Break;
                end;

                if (VarToStr(ToBkm) <> VarToStr(EmptyBookmark)) and
                   (CompareBkm(CurBkm, ToBkm) = 0) then Break;
                Dataset.Next;
            end;
        except
            Result := EmptyBookmark;
            Found := False;
        end;
    finally
        Dataset.EnableControls;
    end;
end;

{TtsCustomDBGrid}

constructor TtsCustomDBGrid.Create(AOwner: TComponent);
begin
    FCreating := True;

    inherited Create(AOwner);
    ResizeRows := rrAll;

    FDataLink := TtsGridDataLink.Create(Self);
    CreateStandardDataset;
    FScrollDataset := TtsScrollDataset.Create(Self);
    FGridData := FScrollDataset;
    ResetLastRow;

    FDBSelectedRows := TtsDBSelection.Create(Self, FSelectedRows);
    FDBRowPropSet := TtsDBRowPropSet.CreateNew(Self);
    FDBCellPropSet := TtsDBCellPropSet.CreateNew(Self);
    FFieldList := TtsFieldList.Create(Self);

    FieldState := fsDefault;
    FInFieldLayout := False;
    FExactRowCount := True;
    FAutoInsert := True;
    FConfirmDelete := True;
    FLinkActive := False;
    FCanSetCurrentRec := 0;
    FCanSetCurrentRow := 0;
    FCanSynchronize := 0;
    FInSyncDataset := 0;
    FInDatasetEvent := 0;
    FCellLoadBitmap := nil;
    FUseRecordIds := False;
    FDatasetType := dstBDE;
    FUseStandardDataset := False;
    FBookmarkType := bmtDefault;
    FBookmarkCompareType := bctDefault;
    FRecordSelection := rseBookmarkRange;
    FIgnoreDatasetScrolled := 0;
    FScrollDirection := 0;
    FSelectDirection := 0;
    FScrollPosition := 0;
    FPrevScrollPosition := 0;
    FScrollSelected := False;
    FInScanRecords := False;
    FCanGetCurrentCell := 0;
    FReadBoundProps := False;
    FResetReadDataBound := False;
    FApplyBoundProps := False;
    FCellPropCollection := TtsDBCellCollection.Create(Self, TtsDBCellItem);
    FRowPropCollection := TtsDBRowCollection.Create(Self, TtsDBRowItem);
    FLookupDatasource := nil;
    FSetLookupField := False;

    FLastAddedBookmark := EmptyBookmark;
    FLastAddedBkmPos := CurBkmPos(EmptyBookmark);
    FSelectionStart := EmptyBookmark;
    FSavedSelectedRows := nil;
    FDataBound := False;
    FActive := False;

    InitActiveFields;
    FCreating := False;
end;

destructor TtsCustomDBGrid.Destroy;
begin
    if not (csDestroying in ComponentState) then Destroying;

    FDBSelectedRows.Free;
    FStandardDataset.Free;
    FScrollDataset.Free;
    FDataLink.Free;
    FCellLoadBitmap.Free;
    FDBRowPropSet.Free;
    FDBCellPropSet.Free;
    FSavedSelectedRows.Free;
    FCellPropCollection.Free;
    FRowPropCollection.Free;

    ResetFields(True);
    FFieldList.Reset;
    FFieldList.Free;

    inherited Destroy;
end;

procedure TtsCustomDBGrid.InitActiveFields;
begin
    ClearCurPosition;
    FEditing := False;
    FStartEditing := False;
    FDataPosted := False;
    FEditState := dsBrowse;
    FClosingEdit := False;
    FOpeningEdit := False;
    FCancelReread := False;
    FDataEditMode := demNone;
    FOldRowCount := 0;
    FOldLeftCol := 0;
    FMouseDownBkm := Unassigned;
    FMouseUpBkm := Unassigned;
    FUpdateDataDone := False;
    FRecordChangedDone := False;
    FCheckBrowseModeDone := False;
    FDataModified := False;
end;

procedure TtsCustomDBGrid.ClearCurPosition;
begin
    FCurBookmark := EmptyBookmark;
    FOldBookmark := EmptyBookmark;
    FEditBookmark := EmptyBookmark;
    FOldTopBkm := EmptyBookmark;
    FLastRowLoaded := EmptyBookmark;
    FLastRownrLoaded := -1;
    FLoadFirstRow := True;
end;

procedure TtsCustomDBGrid.CreateWnd;
var
    Redraw: Boolean;
begin
    inherited;
    FGridData.ResizeBuffer(MaxDisplayRows, Redraw);
    if not UseStandardScrolling then FGridData.SetDatasetBufferCount(1);

    UpdateRowCount(True);
    CheckRowColChanged;
    CheckRowSelection(True);
    SelectionsChanged(False);
    CheckTopLeftChanged(False);
    GridStatusChanged;
end;

procedure TtsCustomDBGrid.Assign(Source: TPersistent);
begin
    if not (Source is TtsCustomDBGrid) then
        InvalidOp(Format(StsInvalidAssign, [Source.ClassName, ClassName]));
    inherited;
end;

procedure TtsCustomDBGrid.AssignColProperties(Source: TtsBaseGrid);
begin
    inherited;
end;

procedure TtsCustomDBGrid.AssignRowProperties(Source: TtsBaseGrid);
begin
    if not DataBound then begin inherited; Exit; end;

    FDBRowPropSet.Free;
    FDBRowPropSet := TtsDBRowPropSet.CreateNew(Self);
    FDBRowPropSet.Assign(TtsCustomDBGrid(Source).FDBRowPropSet);
end;

procedure TtsCustomDBGrid.AssignCellProperties(Source: TtsBaseGrid);
begin
    if not DataBound then begin inherited; Exit; end;

    FDBCellPropSet.Free;
    FDBCellPropSet := TtsDBCellPropSet.CreateNew(Self);
    FDBCellPropSet.Assign(TtsCustomDBGrid(Source).FDBCellPropSet);
end;

procedure TtsCustomDBGrid.AssignProperties(Source: TtsBaseGrid; ExcludeProps: string);
var
    SourceGrid: TtsCustomDBGrid;
begin
    inherited;
    ExcludeProps := AnsiLowerCase(ExcludeProps);
    if (Pos('datasource', ExcludeProps) = 0) then
    begin
        SourceGrid := TtsCustomDBGrid(Source);
        if SourceGrid.Datasource <> SourceGrid.LookupDataSource
            then Datasource := SourceGrid.Datasource
            else Datasource := nil;
    end;
end;

procedure TtsCustomDBGrid.AssignRowSelections(Source: TtsBaseGrid);
var
    Changed: Boolean;
begin
    if not DataBound then begin inherited; Exit; end;
    Changed := SelectedRows.Assign(TtsCustomDBGrid(Source).SelectedRows);
    if Changed then SetSelectChanged(stRowSelect);
end;

procedure TtsCustomDBGrid.AssignCellSelections(Source: TtsBaseGrid);
begin
    if not DataBound then begin inherited; Exit; end;
end;

procedure TtsCustomDBGrid.CheckGridStatus;
begin
    if not DataBound then begin inherited; Exit; end;

    if FSelectedCols.Count <> 0 then
        FGridStatus := grColSelect
    else if FDBSelectedRows.RowsSelected then
        FGridStatus := grRowSelect
    else
        FGridStatus := grNormal;
end;

function TtsCustomDBGrid.CreateRowElement(DataRow: Variant): TtsCustomElement;
begin
    Result := FDBRowPropSet.CreateElement([DataRow]);
    FDBRowPropSet.AddElement(Result);
end;

function TtsCustomDBGrid.CreateCellElement(DataCol: Longint; DataRow: Variant): TtsCustomElement;
begin
    if not DataBound then begin Result := inherited CreateCellElement(DataCol, DataRow); Exit; end;

    Result := FDBCellPropSet.CreateElement([DataCol, DataRow]);
    FDBCellPropSet.AddElement(Result);
end;

function TtsCustomDBGrid.DoColProps(Ancestor: TPersistent): Boolean;
begin
    Result := False;
    if (not (csWriting in ComponentState)) or (not SaveAllProps) then Exit;

    if not DataBound then
    begin
        Result := inherited DoColProps(Ancestor);
        Exit;
    end;

    if Ancestor = nil then
    begin
        Result := FieldState = fsCustomized;
        if Result then Result := inherited DoColProps(Ancestor);
    end
    else
    begin
        Result := FieldState = fsCustomized;
        if Result then
        begin
            if FieldState <> TtsCustomDBGrid(Ancestor).FieldState
                then FWriteCols := CreateColCollection(True)
                else Result := inherited DoColProps(Ancestor);
        end;
    end;
end;

procedure TtsCustomDBGrid.AddCellProps(Cells: TtsCellCollection; Node: TtsSetNode);
var
    CellItem: TtsDBCellItem;
    Element: TtsDBCellElement;
begin
    if Node = nil then Exit;

    Element := TtsDBCellElement(TtsObjectSetNode(Node).NodeValue);
    if not Element.Empty then
    begin
        CellItem := TtsDBCellItem(Cells.Add);
        CellItem.DataCol := Element.FDataCol;
        CellItem.DataRow := Element.FDataRow;
    end;

    AddCellProps(Cells, Node.Left);
    AddCellProps(Cells, Node.Right);
end;

function TtsCustomDBGrid.CreateCellCollection(Writing: Boolean): TtsCellCollection;
begin
    if not DataBound and not ReadBoundProps then
    begin
        Result := inherited CreateCellCollection(Writing);
        Exit;
    end;

    Result := TtsDBCellCollection.Create(Self, TtsDBCellItem);
    if Writing then AddCellProps(Result, FDBCellPropSet.TopNode);
end;

procedure TtsCustomDBGrid.ReadCells(Reader: TReader);
begin
    if not DataBound and not ReadBoundProps then begin inherited; Exit; end;

    if Assigned(FCellPropCollection) then FCellPropCollection.Free;
    FCellPropCollection := CreateCellCollection(False);

    {$IFDEF TSVER_V3}
    Reader.ReadValue;
    Reader.ReadCollection(FCellPropCollection);
    {$ENDIF}
end;

procedure TtsCustomDBGrid.AddRowProps(Rows: TtsPropCollection; Node: TtsSetNode);
var
    RowItem: TtsDBRowItem;
begin
    if Node = nil then Exit;
    RowItem := TtsDBRowItem(Rows.Add);
    RowItem.DataRow := TtsDBRowElement(TtsObjectSetNode(Node).NodeValue).FDataRow;

    AddRowProps(Rows, Node.Left);
    AddRowProps(Rows, Node.Right);
end;

function TtsCustomDBGrid.CreateRowCollection(Writing: Boolean): TtsPropCollection;
begin
    if not DataBound and not ReadBoundProps then
    begin
        Result := inherited CreateRowCollection(Writing);
        Exit;
    end;

    Result := TtsDBRowCollection.Create(Self, TtsDBRowItem);
    if Writing then AddRowProps(Result, FDBRowPropSet.TopNode);
end;

procedure TtsCustomDBGrid.ReadRows(Reader: TReader);
begin
    if not DataBound and not ReadBoundProps then begin inherited; Exit; end;

    if Assigned(FRowPropCollection) then FRowPropCollection.Free;
    FRowPropCollection := TtsDBRowCollection(CreateRowCollection(False));

    {$IFDEF TSVER_V3}
    Reader.ReadValue;
    Reader.ReadCollection(FRowPropCollection);
    {$ENDIF}
end;

procedure TtsCustomDBGrid.WriteDataBound(Writer: TWriter);
begin
    Writer.WriteBoolean(DataBound);
end;

procedure TtsCustomDBGrid.ReadDataBound(Reader: TReader);
begin
    if Reader.ReadBoolean then
    begin
        if not FReadBoundProps then FResetReadDataBound := True;
        FReadBoundProps := True;
    end;
    if not FReadBoundProps and DataBound then Datasource := nil;
end;

procedure TtsCustomDBGrid.ReadColPropCount(Reader: TReader);
begin
    Cols := Reader.ReadInteger;
end;

procedure TtsCustomDBGrid.WriteColPropCount(Writer: TWriter);
begin
    Writer.WriteInteger(Cols);
end;

procedure TtsCustomDBGrid.DefineProperties(Filer: TFiler);
begin
    with Filer do
    begin
        DefineProperty('DataBound', ReadDataBound, WriteDataBound, True);
        DefineProperty('ColPropCount', ReadColPropCount, WriteColPropCount, SaveAllProps and (FieldState = fsCustomized) and Assigned(Ancestor));
    end;

    inherited;
end;

function TtsCustomDBGrid.GetReadBoundProps: Boolean;
begin
    Result := FReadBoundProps;
end;

procedure TtsCustomDBGrid.CheckApplyRowProps(Reset: Boolean);
begin
    if Assigned(FRowPropCollection) then
    begin
        try
            if Active then FRowPropCollection.ApplyProps;
        finally
            if Active or Reset then
            begin
                FRowPropCollection.Clear;
            end;
        end
    end
end;

procedure TtsCustomDBGrid.CheckApplyCellProps(Reset: Boolean);
begin
    if Assigned(FCellPropCollection) then
    begin
        try
            if Active then FCellPropCollection.ApplyProps;
        finally
            if Active or Reset then
            begin
                FCellPropCollection.Clear;
            end;
        end
    end
end;

procedure TtsCustomDBGrid.CheckApplyProps(Reset: Boolean);
var
    SetUpdating: Boolean;
begin
    if ReadBoundProps then Exit;

    SetUpdating := not (csUpdating in ComponentState);
    if SetUpdating then Updating;
    try
        CheckApplyRowProps(Reset);
        CheckApplyCellProps(Reset);
    finally
        if SetUpdating then Updated;
    end;
end;

procedure TtsCustomDBGrid.Loaded;
begin
    if ReadBoundProps then
    begin
        if FResetReadDataBound then
        begin
            FReadBoundProps := False;
            FResetReadDataBound := False;
            CheckApplyProps(False);
        end;
    end;
    inherited;
    FieldLayoutChanged(True, True, True);
end;

function TtsCustomDBGrid.StoreRows: Boolean;
begin
    Result := not DataBound;
end;

function TtsCustomDBGrid.StoreCols: Boolean;
begin
    if not DataBound
        then Result := inherited StoreCols
        else Result := FieldState <> fsDefault;
end;

function TtsCustomDBGrid.CreateStreamComponent: TtsGridStreamComponent;
begin
    Result := TtsDBGridStreamComponent.Create(Self);
end;

function TtsCustomDBGrid.DefaultColCount: Longint;
begin
    if not DataBound then Result := inherited DefaultColCount
                     else Result := 1;
end;

function TtsCustomDBGrid.DefaultRowCount: Longint;
begin
    if not DataBound then Result := inherited DefaultRowCount
                     else Result := 1;
end;

procedure TtsCustomDBGrid.ScrollStandardDataset(var Msg: TWMVScroll);
var
    Info: TScrollInfo;
begin
    if not CheckEndEdit(GetDataCol(CurDisplayCol), -1, True) then Exit;

    Info.cbSize := SizeOf(Info);
    Info.fMask := SIF_ALL;
    GetScrollInfo(Handle, SB_VERT, Info);

    with Dataset do
    begin
        case Msg.ScrollCode of
            SB_LINEUP: if not BOF then Prior;
            SB_PAGEUP: MoveBy(-VisibleRowCount);
            SB_LINEDOWN: if not EOF then Next;

            SB_PAGEDOWN:
                begin
                    EnablePaint := False;
                    try
                        MoveBy(VisibleRowCount);
                        if EOF and (GridTopRow <> GetMaxTopRow) then
                            GridTopRow := GetMaxTopRow;
                    finally
                        EnablePaint := True;
                    end;
                end;

            SB_THUMBPOSITION, SB_THUMBTRACK:
                if FGridData.IsSequenced and
                   ((Msg.ScrollCode <> SB_THUMBTRACK) or ThumbTracking) then
                begin
                    if Info.nTrackPos <= 1 then
                        First
                    else if Info.nTrackPos >= RecordCount then
                        Last
                    else
                        FGridData.RecNo := Info.nTrackPos;
                end
                else if Msg.ScrollCode <> SB_THUMBTRACK then
                case Msg.Pos of
                    1: First;
                    2: MoveBy(-VisibleRowCount);
                    3: Exit;
                    4: MoveBy(VisibleRowCount);
                    5: Last;
                end;

            SB_BOTTOM: Last;
            SB_TOP: First;
        end;
    end;
end;

procedure TtsCustomDBGrid.ScrollInternalDataset(var Msg: TWMVScroll);
var
    Info: TScrollInfo;
begin
    Info.cbSize := SizeOf(Info);
    Info.fMask := SIF_ALL;
    GetScrollInfo(Handle, SB_VERT, Info);

    case Msg.ScrollCode of
        SB_LINEUP: ScrollBarScroll(ScrollMoveUp(1));
        SB_PAGEUP: ScrollBarScroll(ScrollMoveUp(CalcMax(1, VisibleRowCount)));
        SB_LINEDOWN: ScrollBarScroll(ScrollMoveDown(1));
        SB_PAGEDOWN: ScrollBarScroll(ScrollMoveDown(CalcMax(1, VisibleRowCount)));
        SB_THUMBPOSITION, SB_THUMBTRACK:
            if ThumbTracking or (Msg.ScrollCode = SB_THUMBPOSITION) then
            begin
                if Msg.Pos = Info.nMin then
                    ScrollToPosition(dpTop)
                else if Msg.Pos >= Info.nMax - Integer(Info.nPage) then
                begin
                    if FScrollDataset.BeenAtEnd or FScrollDataset.RowCountKnown then
                        ScrollToPosition(dpBottom)
                    else
                        ScrollBarScroll(MoveToScrollPos(Msg.Pos));
                end
                else
                    ScrollBarScroll(MoveToScrollPos(Msg.Pos));
            end;

        SB_BOTTOM: if FScrollDataset.RowCountKnown then ScrollToPosition(dpBottom);
        SB_TOP: if FScrollDataset.RowCountKnown then ScrollToPosition(dpTop);
    end;
end;

procedure TtsCustomDBGrid.WMVScroll(var Msg: TWMVScroll);
var
    DoInvalidate: Boolean;
begin
    CheckDropDownOff(False);
    if not DataBound then begin inherited; Exit end;
    if not Active then Exit;

    DoInvalidate := (not IsFocused) and InEditMode;
    if Visible then
    begin
        if CanFocus and (not IsFocused) and not (csDesigning in ComponentState) then
            SetGridFocus;
    end;

    FInScrolling := True;
    try
        if UseStandardScrolling
            then ScrollStandardDataset(Msg)
            else ScrollInternalDataset(Msg);
        DrawCurrentFocusRect(True);

        if (Msg.ScrollCode = SB_ENDSCROLL) then
        begin
            ShowControlAfterScroll;
            Update;
        end;

        UpdateScrollRange;
        if DoInvalidate then InvalidateCell(CurDisplayCol, CurDisplayRow);
        Update;
    finally
        FInScrolling := False;
    end;
end;

procedure TtsCustomDBGrid.WMSetCursor(var Msg: TWMSetCursor);
begin
    FSetCursor := not FInScanRecords;
    inherited
end;

procedure TtsCustomDBGrid.CMFontChanged(var Message: TMessage);
begin
    inherited;
    FieldLayoutChanged(True, False, False);
    DoFieldLayoutChange;
end;

procedure TtsCustomDBGrid.CMParentFontChanged(var Message: TMessage);
begin
    inherited;
    if ParentFont then
    begin
        FieldLayoutChanged(True, False, False);
        DoFieldLayoutChange;
    end;
end;

procedure TtsCustomDBGrid.WMSize(var Message : TWMSize);
begin
    inherited;
    if not DataBound then Exit;
    if not Active then Exit;
    DoResizeGrid;
end;

function TtsCustomDBGrid.CheckIdType(const Id: Variant): Boolean;
begin
    Result := CanUseRecordIds or (VarType(Id) = varString);
    if (not Result) and FRaiseErrors then
        InvalidOp(StsInvalidBookmark);
end;

function TtsCustomDBGrid.CheckBkmType(const Bkm: Variant): Boolean;
begin
    Result := (VarType(Bkm) = varString);
    if (not Result) and FRaiseErrors then
        InvalidOp(StsInvalidBookmark);
end;

function TtsCustomDBGrid.CheckDataset(DatasetType: TtsDatasetType; Dataset: TDataset): Boolean;
begin
{$IFDEF TSVER_V3}
    Result := (Dataset = nil) or ((Dataset is TBDEDataset) or (DatasetType <> dstBDE));
{$ELSE}
    Result := True;
{$ENDIF}
end;

procedure TtsCustomDBGrid.UpdateRowCount(DoUpdate: Boolean);
begin
    if DataBound then
    begin
        if not Active
            then GridRows := DefaultRowCount - InsertionRow
            else GridRows := FGridData.BufferRows;
    end;

    if DoUpdate then UpdateScrollRange;
end;

procedure TtsCustomDBGrid.CheckExactRowCount(ReCount: Boolean);
begin
    if Active and ExactRowCount and (not UseStandardScrolling) then
    begin
        FGridData.DoRecCount(ReCount);
        UpdateRowCount(True);
    end;
end;

procedure TtsCustomDBGrid.VerifyEditMode;
begin
    if UseStandardScrolling and DataBound and (GridMode = gmEditInsert) then
        GridMode := gmEdit;
end;

procedure TtsCustomDBGrid.VerifyRowChanged;
begin
    if DataBound and (RowChangedIndicator = riOn) then
        RowChangedIndicator := riAutoReset;
end;

procedure TtsCustomDBGrid.Paint;
begin
    FLoadFirstRow := True;
    FLastRowLoaded := EmptyBookmark;
    FLastRownrLoaded := -1;
    inherited;
end;

procedure TtsCustomDBGrid.LinkActive(Value: Boolean);
var
    SetUpdating: Boolean;
begin
    if FLinkActive <> Value then
    begin
        if not Active then
        begin
            if not CheckDataset(DatasetType, Dataset) then DatasetType := dstStandard;
        end;

        SetUpdating := not (csUpdating in ComponentState);
        if SetUpdating then Updating;
        try
            SetComboExtents := False;
            EnablePaint := False;
            try
                ResetLastRow;
                ResetLastCell;
                InitActiveFields;
                ClearCellBuffer;
                HideGridControl(True);
                if not FLinkActive then
                begin
                    UndoInsertRow;
                    SetCurrentPosition(CurDisplayCol, 0, True, True);
                end;

                if InRowSelectMode then DeleteAllRowSelection;
                FLinkActive := Value;

                if not FLinkActive then
                begin
                    FGridData.LinkActive(Value);
                    FActive := False;
                    UpdateRowCount(True);
                    FieldLayoutChanged(True, True, True);
                end
                else
                begin
                    FieldLayoutChanged(True, True, True);
                    FGridData.LinkActive(Value);
                    FActive := FGridData.Active;
                    if not UseStandardScrolling then FGridData.MoveFirst;
                    UpdateRowCount(True);
                end;

                ShowGridControl;
                DisplayAsControl := True;

                if Active then
                    PositionCurrentRec(CurDisplayCol, DataLink.Dataset.Bookmark, False, False)
                else
                begin
                    if GridRows > 0
                        then SetCurrentPosition(CurDisplayCol, 1, True, True)
                        else SetCurrentPosition(CurDisplayCol, 0, True, True);
                end;

                CheckExactRowCount(True);
                CheckApplyProps(True);
            finally
                SetComboExtents := True;
                EnablePaint := True;
                AdjustComboGridExtents(DropDownCols, DropDownRows);
            end;
        finally
            if SetUpdating then Updated;
            DoFieldLayoutChange;
            if InRowSelectMode then DeleteAllRowSelection;

            UpdateScrollRange;
            CheckRowColChanged;
            CheckRowSelection(True);
            SelectionsChanged(False);
            CheckTopLeftChanged(False);
            GridStatusChanged;
        end;
    end;
end;

procedure TtsCustomDBGrid.CheckBrowseMode;
begin
    FCheckBrowseModeDone := True;
end;

function TtsCustomDBGrid.DatasetScrolledUp(Distance, Offset: Longint; var ScrollCount,
                                     NewCurRow, NewTopRow: Longint): Longint;
begin
    Result := Abs(Distance + Offset);
    NewCurRow := CalcMax(FixedRows, FCurDataRow + Offset);
    NewTopRow := GridTopRow;
    ScrollCount := Abs(Distance);
end;

function TtsCustomDBGrid.DatasetScrolledDown(Distance, Offset: Longint; var ScrollCount,
                                       NewCurRow, NewTopRow: Longint): Longint;
begin
    Result := Distance + Offset;
    ScrollCount := Distance;
    NewCurRow := CalcMin(GridRows, FCurDataRow + Offset);
    NewTopRow := GridTopRow;
end;

procedure TtsCustomDBGrid.DataSetScrolled(Distance: Integer);
var
    CurRow: Integer;
    Offset, MovedBy: Longint;
    ScrollCount: Longint;
    NewCurRow, NewTopRow: Longint;
begin
    if UseStandardScrolling then FStandardDataset.MoveIdBuffers(Distance);
    FGridData.ClearPropBuffer(0, 0, True);

    if IgnoreDatasetScrolled then Exit;
    if InSyncDataset then Exit;

    InDatasetEvent := True;
    try
        CanSynchronize := False;
        try
            CurRow := FGridData.CurrentBufRow;
            if CurRow = 0 then
            begin
                if (GridStatus = grRowSelect) and InRowSelectMode then FDBSelectedRows.ResetAll;
                PositionCurrentRec(CurDisplayCol, DataLink.Dataset.Bookmark, False, True);
                if FGridData.CurrentBufRow <> 0 then ShowGridControl;
            end
            else
            begin
                Offset := 0;
                if UseStandardScrolling and (CompareBkm(Datalink.Dataset.Bookmark, FCurBookmark) <> 0) then
                    Offset := FGridData.BufferRow(Datalink.Dataset.Bookmark) - FCurDataRow;

                if (Distance < 0) or ((Distance = 0) and (Offset < 0)) then
                begin
                    if InRowSelectMode or FScrollSelected then SaveSelectedRows(Distance);
                    if UseStandardScrolling then
                        MovedBy := DatasetScrolledUp(Distance, Offset, ScrollCount, NewCurRow, NewTopRow)
                    else
                        MovedBy := ScrollLineUp(Abs(Distance + Offset), False, False, ScrollCount,
                                                NewCurRow, NewTopRow);
                    if MovedBy > 0 then
                    begin
                        if InRowSelectMode or FScrollSelected then
                            RepositionRowSelect(-ScrollCount, CurDisplayCol, NewCurRow,
                                                LeftCol, NewTopRow)
                        else
                            ScrollReposition(-ScrollCount, LeftCol, NewTopRow, CurDisplayCol,
                                             NewCurRow, False, True, False);
                    end;

                    PositionCurrentRec(CurDisplayCol, DataLink.Dataset.Bookmark, False, True);
                end
                else if (Distance > 0) or ((Distance = 0) and (Offset > 0)) then
                begin
                    if InRowSelectMode or FScrollSelected then SaveSelectedRows(Distance);
                    if UseStandardScrolling then
                        MovedBy := DatasetScrolledDown(Distance, Offset, ScrollCount, NewCurRow, NewTopRow)
                    else
                        MovedBy := ScrollLineDown(Abs(Distance + Offset), False, False, ScrollCount, NewCurRow, NewTopRow);

                    if MovedBy > 0 then
                    begin
                        if InRowSelectMode or FScrollSelected then
                            RepositionRowSelect(ScrollCount, CurDisplayCol, NewCurRow,
                                                LeftCol, NewTopRow)
                        else
                            ScrollReposition(ScrollCount, LeftCol, NewTopRow, CurDisplayCol,
                                             NewCurRow, False, True, False);
                    end;

                    PositionCurrentRec(CurDisplayCol, DataLink.Dataset.Bookmark, False, True);
                end
                else {Distance = 0 and Offset = 0}
                begin
                    PositionCurrentRec(CurDisplayCol, DataLink.Dataset.Bookmark, False, True);
                end;
            end;

        finally
            CanSynchronize := True;
        end;
    finally
        InDatasetEvent := False;
    end;

    UpdateScrollRange;
    FDataModified := False;
    CheckRowColChanged;
    CheckRowSelection(False);
    SelectionsChanged(False);
    CheckTopLeftChanged(False);
end;

procedure TtsCustomDBGrid.DataSetChanged;
begin
    ClearCacheBuffers;
    if InSyncDataset then Exit;

    InDatasetEvent := True;
    try
        if not Editing then
        begin
            if ResetDatasetProperties then
                FGridData.SetProperties(False);

            if ReopenDataset then
            begin
                if InRowSelectMode then FDBSelectedRows.ResetAll;
                ResetDataset(True);
            end
            else
            begin
                if FGridData.IndexChanged then
                begin
                    FGridData.SaveCurIndex;
                    ClearCurPosition;
                end;
                if not BkmEqual(FCurBookmark, Dataset.Bookmark) then
                begin
                    if InRowSelectMode or FScrollSelected then FDBSelectedRows.ResetAll;
                    if DataLink.Dataset.Bof then
                    begin
                        if not UseStandardScrolling then MoveFirst
                    end
                    else if DataLink.Dataset.Eof then
                    begin
                        if not UseStandardScrolling then MoveLast
                    end
                    else
                    begin
                        if not FCancelReread then FGridData.RereadBuffer(1, False);
                        ClearCellBuffer;
                    end;

                    UpdateRowCount(True);
                    PositionCurrentRec(CurDisplayCol, Dataset.Bookmark, False, False);
                    Invalidate;
                end
                else
                begin
                    if not FCancelReread then
                    begin
                        FGridData.RereadBuffer(GridTopRow, True);
                        UpdateRowCount(True);
                        Invalidate;
                        if (GridTopRow > 1) and (not FGridData.AtEnd) then
                        begin
                            EnablePaint := False;
                            try GridTopRow := 1; finally EnablePaint := True; end;
                        end;
                    end;

                    if not FClosingEdit then
                        ClearCellBuffer
                    else if UseStandardScrolling then
                        Invalidate;

                    PositionCurrentRec(CurDisplayCol, Dataset.Bookmark, False, False);
                end;
            end;
        end
        else
            PositionCurrentRec(CurDisplayCol, Dataset.Bookmark, False, False);

        if ((not FClosingEdit) and (not FOpeningEdit)) or (CurDataRow = 0) then
            HideGridControl(True);
        ShowGridControl;

        FDataModified := False;
        FClosingEdit := False;
        FOpeningEdit := False;
        FCancelReread := False;
        UpdateRowCount(True);
    finally
        InDatasetEvent := False;
    end;

    CheckRowColChanged;
    CheckRowSelection(UseStandardScrolling);
    SelectionsChanged(False);
    CheckTopLeftChanged(False);
end;

procedure TtsCustomDBGrid.UndoAppendedRow;
var
    Redraw: Boolean;
begin
    EnablePaint := False;
    try
        if FScrollDataSet.BufferRows > MaxDisplayRows then
        begin
            if GridTopRow > FixedRows then
                FScrollDataSet.ResizeAppend(MaxDisplayRows - FScrollDataSet.BufferRows)
            else
            begin
                FScrollDataSet.ResizeBuffer(MaxDisplayRows, Redraw);
                if Redraw then Invalidate;
            end;
        end;

        if GridRows > MaxDisplayRows then
        begin
            GridRows := MaxDisplayRows;
            CheckTopLeft(True);
        end;

    finally
        EnablePaint := True;
    end;
end;

procedure TtsCustomDBGrid.SetLastAddedRow(DisplayRow: Longint);
begin
    inherited;
    if DataBound and Active then
    begin
        FLastAddedBookmark := FGridData.Bookmark[DisplayRow];
        FLastAddedBkmPos := CurBkmPos(FLastAddedBookmark);
    end;
end;

procedure TtsCustomDBGrid.ResetScrollPosition;
begin
    FSelectDirection := 0;
    FScrollPosition := 0;
    FPrevScrollPosition := 0;
end;

procedure TtsCustomDBGrid.ResetSelectionStart;
begin
    SelectionStart := EmptyBookmark;
end;

procedure TtsCustomDBGrid.SetSelectionStartRow(DisplayRow: Longint);
begin
    inherited;
    if (not DataBound) or (not Active) then Exit;

    ResetScrollPosition;
    SelectionStart := FGridData.Bookmark[DisplayRow];
end;

function TtsCustomDBGrid.SelectionStartRownr: Integer;
begin
    Result := inherited SelectionStartRownr;
    if (not DataBound) or (not Active) then Exit;
    Result := FGridData.BufferRow(SelectionStart);
end;

procedure TtsCustomDBGrid.CheckSetCurrentRow(DisplayRow: Longint);
begin
    if (not DataBound) then begin inherited; Exit end;
    if (not Active) then Exit;
    CheckSetCurrent(FGridData.DatasetPosition, DisplayRow);
end;

function TtsCustomDBGrid.GetSelectionStart: TBookmarkStr;
begin
    if VarToStr(FSelectionStart) = VarToStr(EmptyBookmark)
        then Result := FCurBookmark
        else Result := FSelectionStart;
end;

procedure TtsCustomDBGrid.EndRowSelecting(Select: Boolean);
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;

    if (not Select) then MouseCapture := False;
    SelectionsChanged(True);
end;

function TtsCustomDBGrid.InsertionRowIsOff: Boolean;
begin
    Result := (GridMode = gmEditInsert) and (InsertionRow = 0);
end;

function TtsCustomDBGrid.CanMoveToPos(DisplayCol, DisplayRow: Longint): Boolean;
begin
    Result := inherited CanMoveToPos(DisplayCol, DisplayRow);
    if not DataBound then Exit;

    if Result then Result := Active or InDesignMode;
    if Result then Result := not (IsAppendRow(DisplayRow) and ReadOnly);
end;

procedure TtsCustomDBGrid.CheckRowCountChanged(OldCount, NewCount: Longint);
begin
    if not DataBound then inherited;
end;

procedure TtsCustomDBGrid.RowDeleted(DataRow: Longint; ByUser: Boolean);
begin
    if DataBound then Exit;
    DoDeleteRow(DataRow, ByUser);
end;

procedure TtsCustomDBGrid.RowInserted(DataRow: Longint; ByUser: Boolean);
begin
    if DataBound then Exit;
    DoInsertRow(DataRow, ByUser);
end;

procedure TtsCustomDBGrid.ButtonClick(DataCol, DataRow: Longint);
begin
    if not DataBound then begin inherited; Exit end;
    DoButtonClick(DataCol, FGridData.Bookmark[DataRow]);
end;

procedure TtsCustomDBGrid.ButtonDown(DataCol, DataRow: Longint);
begin
    if not DataBound then begin inherited; Exit end;
    DoButtonDown(DataCol, FGridData.Bookmark[DataRow]);
end;

procedure TtsCustomDBGrid.ButtonUp(DataCol, DataRow: Longint);
begin
    if not DataBound then begin inherited; Exit end;
    DoButtonUp(DataCol, FGridData.Bookmark[DataRow]);
end;

procedure TtsCustomDBGrid.SpinButtonClick(DataCol, DataRow: Longint; SpinButton: TtsSpinButton);
begin
    if not DataBound then begin inherited; Exit end;
    DoSpinButtonClick(DataCol, FGridData.Bookmark[DataRow], SpinButton);
end;

procedure TtsCustomDBGrid.SpinButtonDown(DataCol, DataRow: Longint; SpinButton: TtsSpinButton);
begin
    if not DataBound then begin inherited; Exit end;
    DoSpinButtonDown(DataCol, FGridData.Bookmark[DataRow], SpinButton);
end;

procedure TtsCustomDBGrid.SpinButtonUp(DataCol, DataRow: Longint; SpinButton: TtsSpinButton);
begin
    if not DataBound then begin inherited; Exit end;
    DoSpinButtonUp(DataCol, FGridData.Bookmark[DataRow], SpinButton);
end;

procedure TtsCustomDBGrid.SpinRepeat(DataCol, DataRow: Longint; Count: Integer; SpinButton: TtsSpinButton);
begin
    if not DataBound then begin inherited; Exit end;
    DoSpinRepeat(DataCol, FGridData.Bookmark[DataRow], Count, SpinButton);
    CheckSpinIncrement(DataCol, DataRow, SpinButton);
end;

procedure TtsCustomDBGrid.SpinIncrement(DataCol, DataRow: Longint; SpinButton: TtsSpinButton; var Value: Variant; var Pos, Len: Integer; var Accept: Boolean);
begin
    if not DataBound then begin inherited; Exit end;
    DoSpinIncrement(DataCol, FGridData.Bookmark[DataRow], SpinButton, Value, Pos, Len, Accept);
end;

{$IFNDEF TSVER_V3}
procedure TtsCustomDBGrid.WriteState(Writer: TWriter);
begin
    if DataBound and (InDesignMode or (pkRows in FStoredPropKinds)) then
    begin
        FRowPropCollection.Free;
        FRowPropCollection := TtsDBRowCollection(CreateRowCollection(True));
    end
    else
        FRowPropCollection.Clear;

    if DataBound and (InDesignMode or (pkCells in FStoredPropKinds)) then
    begin
        FCellPropCollection.Free;
        FCellPropCollection := CreateCellCollection(True);
    end
    else
        FCellPropCollection.Clear;

    inherited;
end;

procedure TtsCustomDBGrid.ReadState(Reader: TReader);
begin
    FRowPropCollection.Clear;
    FCellPropCollection.Clear;
    inherited;
end;

function TtsCustomDBGrid.GetRowProperties: TCollection;
begin
    Result := TCollection(FRowPropCollection);
end;

procedure TtsCustomDBGrid.SetRowProperties(Value: TCollection);
begin
    FRowPropCollection := TtsDBRowCollection(Value);
end;

function TtsCustomDBGrid.GetCellProperties: TCollection;
begin
    Result := TCollection(FCellPropCollection);
end;

procedure TtsCustomDBGrid.SetCellProperties(Value: TCollection);
begin
    FCellPropCollection := TtsDBCellCollection(Value);
end;
{$ENDIF}

function TtsCustomDBGrid.CheckClickCell(DataColDown, DataRowDown, DataColUp, DataRowUp: Longint;
                                        DownPos, UpPos: TtsClickPosition): Boolean;
begin
    if not DataBound then
    begin
        Result := inherited CheckClickCell(DataColDown, DataRowDown, DataColUp,
                                           DataRowUp, DownPos, UpPos);
        Exit;
    end;

    Result := True;
    if Active then
        Result := DoClickCell(DataColDown, FMouseDownBkm, DataColUp, FMouseUpBkm,
                              DownPos, UpPos);
end;

procedure TtsCustomDBGrid.DblClickCell(DataCol, DataRow: Longint);
begin
    if not DataBound then begin inherited; Exit end;
    if not Active then Exit;
    DoDblClickCell(DataCol, FMouseDownBkm, ClickPos(DataCol, DataRow));
end;

procedure TtsCustomDBGrid.GetDrawInfo(DataCol, DataRow: Longint; var DrawInfo: TtsDrawInfo);
var
    OldActive: Integer;
begin
    if (not DataBound) or (DataRow = 0) then
        DoGetDrawInfo(DataCol, DataRow, DrawInfo)
    else if Active then
    begin
        OldActive := FGridData.ActiveRecord;
        try
            FGridData.ActiveRecord := DataRow;
            DoGetDrawInfo(DataCol, FGridData.RecordId[DataRow], DrawInfo);
        finally
            FGridData.ActiveRecord := OldActive;
        end;
    end;
end;

function TtsCustomDBGrid.CheckCanceled: Boolean;
begin
    Result := (not FUpdateDataDone) or (not FRecordChangedDone);
end;

function TtsCustomDBGrid.InsertRowInView: Boolean;
begin
    Result := (GridMode = gmEditInsert) and (GridTopRow + VisibleRowCount - 1 > GridRows);
end;

function TtsCustomDBGrid.LastRowInView: Boolean;
begin
    Result := (GridTopRow > 1) and
              (GridTopRow + VisibleRowCount - 1 > GridRows - 1);
end;

procedure TtsCustomDBGrid.StartInsert;
var
    MoveDataUp: Boolean;
    NewRow, CurRow: Longint;
begin
    FDataEditMode := demInsert;

    if UseStandardScrolling then
    begin
        ClearCellBuffer;
        UpdateRowCount(True);
        Invalidate;
    end
    else
    begin
        CurRow := FScrollDataset.BufferRow(FCurBookmark);
        MoveDataUp := InsertRowInView or LastRowInView;
        FEditBookmark := FScrollDataset.InsertRecord(MoveDataUp, FCurBookmark);

        NewRow := FScrollDataset.BufferRow(FEditBookmark);
        UpdateRowCount(True);
        RepositionTopRow(CurRow, NewRow, False);

        ClearCellBuffer;
        Invalidate;
    end;
end;

procedure TtsCustomDBGrid.EndInsert;
var
    NewBkm: TBookmarkStr;
    NewRow: Longint;
    RowMoved: Boolean;
begin
    FCancelReread := True;
    FScrollDataset.EndInsert(NewBkm, CheckCanceled, True, GridTopRow, RowMoved);
    UpdateRowCount(False);

    NewRow := FScrollDataset.BufferRow(NewBkm);
    if not CheckCanceled and RowMoved then
        AdjustTopLeft(LeftCol, NewRow, False)
    else if CheckCanceled and FScrollDataset.AtEnd then
        AdjustTopLeft(LeftCol, GridTopRow + 1, False);

    Invalidate;
    FDataEditMode := demNone;
end;

procedure TtsCustomDBGrid.StartAppend;
var
    NewRow, CurRow: Longint;
    ScrollCount: Integer;
    OldTopRow: Longint;
begin
    FDataEditMode := demAppend;

    if UseStandardScrolling then
    begin
        ClearCellBuffer;
        UpdateRowCount(True);
        Invalidate;
    end
    else
    begin
        if GridMode = gmEditInsert then
        begin
            SetInsertRowOff;
            FScrollDataset.ResizeAppend(1);
        end;

        CurRow := FScrollDataset.BufferRow(FCurBookmark);
        FEditBookmark := FScrollDataset.AppendRecord(FCurBookmark);
        NewRow := FScrollDataset.BufferRow(FEditBookmark);
        UpdateRowCount(True);
        if CurRow = 0 then Invalidate;

        ScrollCount := 0;
        if GridMode = gmEditInsert then
        begin
            if (NewRow = GridTopRow) or (GridTopRow = GetMaxTopRow) then ClearCurrent(CurDisplayRow);
            PositionCell(CurDisplayCol, NewRow);
            SetScrollMode(smGridControl);
            try
                RepositionTopRow(GridTopRow, GetMaxTopRow, True);
            finally
                SetScrollMode(smWindow);
            end;
        end
        else
        begin
            OldTopRow := GridTopRow;
            PositionCell(CurDisplayCol, CurRow);
            RepositionTopRow(GridTopRow, GetMaxTopRow, False);
            Inc(ScrollCount, GridTopRow - OldTopRow);
        end;

        ClearCellBuffer;
        if GridMode <> gmEditInsert then
        begin
            Inc(ScrollCount, 1 - (GridTopRow + VisibleRowCount - 1 - CurDataRow));
            if ScrollCount > 0 then KeyScroll(LeftCol, GridTopRow, ScrollCount);
        end;
    end;

    InvalidateRow(GridRows);
    CheckTopLeftChanged(True);
end;

procedure TtsCustomDBGrid.EndAppend;
var
    NewBkm: TBookmarkStr;
    NewRow, CurRow: Longint;
    OldTopRow: Longint;
    RowMoved: Boolean;
begin
    FCancelReread := True;
    if not UseStandardScrolling then
    begin
        OldTopRow := GridTopRow;
        CurRow := FGridData.BufferRow(FEditBookmark);

        SetInsertRowOn;
        UndoAppendedRow;

        FScrollDataset.EndInsert(NewBkm, CheckCanceled, True, CalcMax(1, GridTopRow - 1), RowMoved);
        NewRow := FGridData.BufferRow(NewBkm);
        UpdateRowCount(False);

        if not CheckCanceled and (NewRow <> 0) then
        begin
            if RowMoved and (CurRow = NewRow + 1) then
                AdjustTopLeft(LeftCol, CalcMax(1, OldTopRow - 1), False)
            else if RowMoved then
                AdjustTopLeft(LeftCol, NewRow, False)
            else
                AdjustTopLeft(LeftCol, CalcMax(1, OldTopRow - 1), False);
        end
        else if (VisibleRows <= 1) and (InsertionRow <> 0) and (GridTopRow > 1) then
            AdjustTopLeft(LeftCol, 1, False);
    end;

    Invalidate;
    FDataEditMode := demNone;
end;

procedure TtsCustomDBGrid.EndEditing;
var
    NewBkm: TBookmarkStr;
    NewRow, CurRow: Longint;
    RowMoved: Boolean;
    BufferMoved: Boolean;
begin
    FCancelReread := True;
    if UseStandardScrolling then
        InvalidateRow(FGridData.ActiveRecord)
    else
    begin
        CurRow := FGridData.BufferRow(FEditBookmark);
        FGridData.ActiveRecord := FGridData.BufferRow(FEditBookmark);
        FScrollDataset.EndUpdate(NewBkm, GridTopRow, RowMoved, BufferMoved);

        if BufferMoved then
        begin
            Invalidate;
            NewRow := FGridData.BufferRow(NewBkm);
            AdjustTopLeft(LeftCol, NewRow, False);
        end
        else if RowMoved then
            Invalidate
        else
            InvalidateRow(CurRow);
    end;
end;

function TtsCustomDBGrid.ReopenDataset: Boolean;
begin
    Result := False;
    if not UseStandardScrolling then
    begin
        Result := FScrollDataset.FilterChanged or FScrollDataset.IndexChanged or
                  FScrollDataset.MasterChanged;
    end;
end;

function TtsCustomDBGrid.ResetDatasetProperties: Boolean;
begin
    Result := False;
    if not UseStandardScrolling then
        Result := FScrollDataset.PropertiesChanged;
end;

function TtsCustomDBGrid.IsCurrentRecord(RecordId: Variant): Boolean;
begin
    Result := VarType(FCurBookmark) = VarType(RecordId);
    if Result then Result := (FCurBookmark = RecordId);
end;

function TtsCustomDBGrid.CompareRecId(RecId1, RecId2: Variant): Integer;
begin
    try
        Result := -2;
        DoCompareRecordId(RecId1, RecId2, Result);
        if Result = -2 then Result := CompareVariant(RecId1, RecId2);
    except
        on E:Exception do InvalidOp(E.Message);
    end;
end;

procedure TtsCustomDBGrid.ResetRowCellProperties;
begin
    if FDBRowPropSet.Count <> 0 then
    begin
        FDBRowPropSet.Free;
        FDBRowPropSet := TtsDBRowPropSet.CreateNew(Self);
    end;

    if FDBCellPropSet.Count <> 0 then
    begin
        FDBCellPropSet.Free;
        FDBCellPropSet := TtsDBCellPropSet.CreateNew(Self);
    end;

    FGridData.RereadBuffer(1, False);
    Invalidate;
    RedisplayControl(True);
end;

function TtsCustomDBGrid.CanUseRecordIds: Boolean;
begin
    Result := DataBound and FUseRecordIds and Assigned(FOnGetRecordId);
end;

procedure TtsCustomDBGrid.SetUseRecordIds(Value: Boolean);
var
    OldUseRecordIds: Boolean;
begin
    if FUseRecordIds <> Value then
    begin
        OldUseRecordIds := CanUseRecordIds;
        FUseRecordIds := Value;
        if OldUseRecordIds <> CanUseRecordIds then ResetRowCellProperties;
    end;
end;

procedure TtsCustomDBGrid.SetOnGetRecordID(Value: TtsDBGetRecordIDEvent);
var
    OldUseRecordIds: Boolean;
begin
    if @FOnGetRecordId <> @Value then
    begin
        OldUseRecordIds := CanUseRecordIds;
        FOnGetRecordId := Value;
        if OldUseRecordIds <> CanUseRecordIds then ResetRowCellProperties;
    end;
end;

procedure TtsCustomDBGrid.SetOnCompareRecordID(Value: TtsDBCompareRecordIDEvent);
begin
    if (@FOnCompareRecordId <> @Value) then
        FOnCompareRecordId := Value;
end;

procedure TtsCustomDBGrid.ResetInsertProperties;
var
    I: Longint;
    DataRow: Variant;
    RowElement: TtsDBRowElement;
    CellElement: TtsDBCellElement;
begin
    if CanUseRecordIds
        then DataRow := EmptyRecId
        else DataRow := EmptyBookmark;

    RowElement := TtsDBRowElement(FDBRowPropSet.Get([DataRow]));
    if RowElement <> nil then
        FDBRowPropSet.ResetElement(RowElement, tsAllProperties, True);

    for I := 1 to Cols do
    begin
        CellElement := TtsDBCellElement(FDBCellPropSet.Get([I, DataRow]));
        if CellElement <> nil then
            FDBCellPropSet.ResetElement(CellElement, tsAllProperties, True);
    end;
end;

procedure TtsCustomDBGrid.EditingChanged;
begin
    if Editing <> DataLink.Editing then
    begin
        FClosingEdit := FEditing;
        FOpeningEdit := DataLink.Editing;
        FEditing := DataLink.Editing;
        FEditState := DataLink.Dataset.State;

        if FOpeningEdit then
        begin
            if DataLink.Dataset.State = dsInsert then
            begin
                CheckDropDownOff(False);
                ClearCacheBuffers;
                if not DataLink.Dataset.Eof then StartInsert
                                            else StartAppend;
            end
            else
            begin
                FDataEditMode := demEdit;
                FEditBookmark := FCurBookmark;
            end;
        end
        else
        begin
            RowChanged[CurDataRow] := False;
            ResetEdit(CurDataRow);
            FDataPosted := not CheckCanceled;

            case FDataEditMode of
                demInsert: EndInsert;
                demAppend: EndAppend;
                demEdit:   EndEditing;
            end;

            if FDataEditMode <> demEdit then ResetInsertProperties;

            FDataEditMode := demNone;
            ClearCellBuffer;
            CheckDisableControl;
        end;

        DrawCurrentFocusRect(False);
        FUpdateDataDone := False;
        FRecordChangedDone := False;
        FCheckBrowseModeDone := False;
    end;
end;

procedure TtsCustomDBGrid.LayoutChanged;
var
    Changed: Boolean;
    OldLeftCol, OldTopRow: Longint;
    ClearAll: Boolean;
begin
    Changed := FGridData.FieldLayoutChanged;
    ClearAll := FGridData.FieldOrderChanged;
    if Changed then FGridData.SaveFieldLayout;

    EnablePaint := False;
    try
        OldLeftCol := LeftCol;
        OldTopRow := GridTopRow;
        FieldLayoutChanged(True, ClearAll, True);
        if (not Changed) or UseStandardScrolling
            then SyncData(False)
            else GridTopRow := OldTopRow;

        LeftCol := OldLeftCol;
    finally
        EnablePaint := True;
    end;

    DoFieldLayoutChange;
end;

function TtsCustomDBGrid.CheckClearBuffer(Col: TtsDBCol): Boolean;
var
    OldActive: Integer;
    FieldValue: Variant;
begin
    Result := False;
    if (Col.DisplayCol = CurDisplayCol) then
    begin
        Result := CurrentCell.IsClear;
        if not Result then Result := not Assigned(Col.Field);
        
        if not Result then
        begin
            if CurCellControlType = ctText then
                try
                    OldActive := FGridData.ActiveRecord;
                    try
                        FGridData.ActiveRecord := FGridData.BufferRow(FCurBookmark);
                        CanGetCurrentCell := False;
                        try
                            FieldValue := Cell[Col.DataCol, FCurBookmark];
                        finally
                            CanGetCurrentCell := True;
                        end;
                    finally
                        FGridData.ActiveRecord := OldActive;
                    end;

                    Result := (CurrentCell.BufferValue <> FieldValue);
                    if Result and not VarIsNull(FieldValue) then
                    begin
                        Result := False;
                        FGridControl.Value := FieldValue;
                    end;
                except
                    Result := True;
                end
            else
                Result := True;

            if Result then ClearCellBuffer;
        end;
    end;
end;

procedure TtsCustomDBGrid.RecordChanged(Field: TField);
var
    FieldCol: TtsDBCol;
begin
    if (not FDataModified) and InEditMode then
    begin
        if Assigned(Field) then
        begin
            FieldCol := GridCols.FindField(Field);
            if Assigned(FieldCol) then
            begin
                if CheckClearBuffer(FieldCol) then SetControlSelectMode(tsCurrent);
            end;
        end;

        if (CurDataRow > GridRows) then GridRows := GridRows + 1;
    end;

    if (not FOpeningEdit or (Dataset.State <> dsInsert)) and
       (not RowEditing) and Dataset.Modified then
    begin
        FRowEditing := True;
        FCurRowChanged := True;
    end;

    InvalidateRow(CurDataRow);
    if not FInCheckEndEdit then FDataModified := False;
    FRecordChangedDone := (not FOpeningEdit or (Dataset.State <> dsInsert)) and
                          Dataset.Modified;
end;

procedure TtsCustomDBGrid.UpdateData;
var
    Column: TtsDBCol;
    Value: Variant;
    Cancel: Boolean;
begin
    FUpdateDataDone := FDataModified or Dataset.Modified;
    if not FCheckBrowseModeDone then
        FRecordChangedDone := FDataModified or Dataset.Modified;

    if FDataModified then
    begin
        Column := GridCols[GetDataCol(CurDisplayCol)];
        if CurrentCell.IsClear then
            Value := Unassigned
        else
        begin
            if CellEditing and not FInCheckEndEdit then
            begin
                if not CheckMaskValue then
                    InvalidMaskOp(Format(ResourceStr(SFieldValueError), [Column.FieldName]));
            end;

            Value := CurrentCell.Value;
            if CurCellControlType = ctPicture then
                if VariantToBitmap(CurrentCell.Value).Empty then Value := Null;
        end;

        DoOnUpdateField(CurDataCol, FCurBookmark, Value, Cancel);
        if (not Cancel) then SetFieldValue(Column, CurCellControlType, Value);
        FDataModified := False;
    end;
end;

{$IFDEF TSVER_V4}
function TtsCustomDBGrid.ExecuteAction(Action: TBasicAction): Boolean;
begin
    Result := (DataLink <> nil) and DataLink.ExecuteAction(Action);
end;

function TtsCustomDBGrid.UpdateAction(Action: TBasicAction): Boolean;
begin
    Result := (DataLink <> nil) and DataLink.UpdateAction(Action);
end;
{$ENDIF}

procedure TtsCustomDBGrid.ClearCacheBuffers;
begin
    if UseStandardScrolling then FStandardDataset.ClearIdBuffers(0, 0, True);
    FGridData.ClearPropBuffer(0, 0, True);
end;

procedure TtsCustomDBGrid.ResetDataset(Reposition: Boolean);
begin
    ClearCacheBuffers;
    if not UseStandardScrolling then
    begin
        FScrollDataset.Reopen;
        FGridData.MoveFirst;
    end;

    CheckExactRowCount(True);
    UpdateRowCount(True);
    if Reposition then AdjustTopLeft(LeftCol, 1, False);

    if FGridData.IndexChanged then
    begin
        FGridData.SaveCurIndex;
        ClearCurPosition;
    end;

    PositionCurrentRec(CurDisplayCol, DataLink.Dataset.Bookmark, False, False);
    Invalidate;
end;

procedure TtsCustomDBGrid.RefreshData(ResetOrder: TtsResetOrder; ResetPosition: TtsResetPosition);
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;

    ClearControlBuffer;
    SetControlSelectMode(tsAll);

    case ResetOrder of
        roCols, roBoth: ResetColProperties([prDisplayNumber]);
    end;

    EnablePaint := False;
    try
        DataSource.Dataset.Refresh;
        case ResetPosition of
            rpLeft: LeftCol := FixedCols;

            rpTop:
                begin
                    GridTopRow := FixedRows;
                    if not FGridData.AtStart then FGridData.MoveFirst;
                end;

            rpTopLeft:
                begin
                    MoveTopLeft(FixedCols, FixedRows);
                    if not FGridData.AtStart then FGridData.MoveFirst;
                end;
        end;

        UpdateRowCount(True);
        PositionCurrentRec(CurDisplayCol, DataLink.Dataset.Bookmark, False, False);
        Invalidate;

        CheckTopLeftChanged(False);
    finally
        EnablePaint := True;
    end;

    Refresh;
end;

function TtsCustomDBGrid.IsSameRow(Rownr1, Rownr2: Longint; Bkm1, Bkm2: TBookmarkStr;
                                   CheckRownr: Boolean): Boolean;
begin
    if CheckRownr
        then Result := Rownr1 = Rownr2
        else Result := CompareBkm(Bkm1, Bkm2) = 0
end;

procedure TtsCustomDBGrid.SetFieldValue(Col: TtsDBCol; ControlType: TtsControlType; const Value: Variant);
begin
    if not Assigned(Col.Field) then Exit;

    if VarIsNull(Value) then
        Col.Field.Value := Value
    else if VarIsEmpty(Value) and not (ControlType = ctText) then
        Col.Field.Value := Value
    else
    case ControlType of
        ctText:
            if Col.Field is TtsDBBlobField then
               Col.Field.Value := Value
            else
               Col.Field.Text := Value;
        ctCheck:
            if Col.Field.IsBooleanField then
            begin
                if VarIsNull(Value) then
                    Col.Field.Value := Null
                else
                case Value of
                    Ord(cbChecked)  : Col.Field.Value := True;
                    Ord(cbUnchecked): Col.Field.Value := False;
                    Ord(cbGrayed)   : Col.Field.Value := Null;
                end;
            end
            else
                Col.Field.Value := Value;

        ctPicture:
            Col.Field.Assign(VariantToBitmap(Value));
    end;
end;

procedure TtsCustomDBGrid.GetFieldValue(Col: TtsDBCol; Rownr: Longint; CheckRownr: Boolean; ControlType: TtsControlType; var Value: Variant);
var
    Bool: Boolean;
begin
    if (Col.Field <> nil) and
       (UseStandardScrolling or not Col.DatasetField.Calculated) then
    begin
        case ControlType of
            ctText:
                begin
                    if EditorActive and InEditMode and (Col.DisplayCol = CurDisplayCol) and
                       IsSameRow(Rownr, CurDataRow, FGridData.ActiveBookmark, FCurBookmark, CheckRownr) and
                       (not (csDesigning in ComponentState)) then
                        Value := Col.Field.Text
                    else
                        Value := Col.Field.DisplayText;
                end;

            ctCheck:
                begin
                    if Col.Field.IsBooleanField then
                    begin
                        if Col.Field.IsNull then
                            Value := Integer(cbGrayed)
                        else
                        begin
                            Bool := Col.Field.AsBoolean;
                            if Bool then Value := Integer(cbChecked)
                                    else Value := Integer(cbUnchecked);
                        end;
                    end
                    else
                        Value := Col.Field.AsVariant;
                end;

            ctPicture:
                begin
                    if Col.Field.ControlType = ctPicture then
                    begin
                        if not Assigned(FCellLoadBitmap) then
                            FCellLoadBitmap := TBitmap.Create;

                        FCellLoadBitmap.Assign(Col.Field);
                        Value := BitmapToVariant(FCellLoadBitmap);
                    end
                    else if Col.Field.ControlType = ctText then
                        Value := Col.Field.Text;
                end;
        end;
    end;
end;

function TtsCustomDBGrid.CreateCols;
begin
    Result := TtsDBGridCols.Create(ColCount, Self);
end;

function TtsCustomDBGrid.CreateCurrentCell: TtsCurrentCell;
begin
    Result := TtsDBCurrentCell.Create(Self);
end;

procedure TtsCustomDBGrid.CreateStandardDataset;
begin
    FStandardDataset := TtsStandardDataset.Create(Self);
end;

procedure TtsCustomDBGrid.ColResized(DataCol: Longint);
begin
    if (not FCreating) and (DataCol <> -1) then
        Include(GridCols[DataCol].FAssignedValues, avWidth);
    inherited ColResized(DataCol);
end;

procedure TtsCustomDBGrid.AdjustGridSize;
var
    NewTopRow: Longint;
    Count: Integer;
begin
    UpdateRowCount(True);
    FGridData.AtEnd := False;

    if GridTopRow > FixedRows then
    begin
        NewTopRow := GridTopRow;
        while (NewTopRow > FixedRows) do
        begin
            Count := FGridData.MoveBy(1);
            if Count = 0 then Break;
            NewTopRow := NewTopRow - Count;
        end;

        if NewTopRow <> GridTopRow then AdjustTopLeft(LeftCol, NewTopRow, False);
    end;
end;

procedure TtsCustomDBGrid.DoResizeGrid;
var
    Resized: Boolean;
    Redraw: Boolean;
begin
    Redraw := False;
    HideGridControl(True);
    Resized := FGridData.ResizeBuffer(MaxDisplayRows, Redraw);
    if Resized then AdjustGridSize;

    if UseStandardScrolling
        then PositionCurrentRec(CurDisplayCol, Dataset.Bookmark, False, False)
        else PositionCurrentRec(CurDisplayCol, FCurBookmark, False, False);

    ShowGridControl;
    if Redraw then Invalidate;
end;

procedure TtsCustomDBGrid.SyncBufferSize;
var
    Redraw: Boolean;
begin
    if FGridData.ResizeBuffer(MaxDisplayRows, Redraw) then
    begin
        if UseStandardScrolling
            then PositionCurrentRec(CurDisplayCol, Dataset.Bookmark, False, False)
            else PositionCurrentRec(CurDisplayCol, FCurBookmark, False, False);
            
        AdjustGridSize;
        if Redraw then Invalidate;
    end;
end;

procedure TtsCustomDBGrid.RowResized(DataRow: Longint);
begin
    if not DataBound then begin inherited; Exit; end;

    if Active then
    begin
        if (not FCreating) then
        begin
            SyncBufferSize;
            PositionCurrentRec(CurDisplayCol, FCurBookmark, False, True);
        end;
    end;

    if DataRow = 0 then inherited RowResized(0)
                   else inherited RowResized(-1);
end;

procedure TtsCustomDBGrid.SetHeadingOn(Value: Boolean);
begin
    inherited;
    if (not DataBound) or (not Active) then Exit;

    if (not FCreating) then
    begin
        SyncBufferSize;
        PositionCurrentRec(CurDisplayCol, FCurBookmark, False, True);
    end;
end;

procedure TtsCustomDBGrid.MoveToNewRow(DisplayRow: Longint; ClearFocus, CheckEdit, CheckSelect: Boolean);
begin
    if not DataBound then begin inherited; Exit; end;
end;

procedure TtsCustomDBGrid.SetNewTopRow(DisplayRow: Longint; NewHeight: Integer; OldTop: Integer);
begin
    if not DataBound then begin inherited; Exit; end;
end;

function TtsCustomDBGrid.ShowVertScrollBar(MaxHeight: Integer): Boolean;
var
    RowHeights: Integer;
begin
    Result := False;
    if not HandleAllocated then Exit;
    if not (FScrollBars in [ssBoth, ssVertical]) then Exit;
    if not DataBound then begin Result := inherited ShowVertScrollBar(MaxHeight); Exit end;
    if not Active then Exit;

    if UseStandardScrolling then
        Result := True
    else
    begin
        try
            RowHeights := ((FGridData.RecCount + InsertionRow) * DefaultRowHeight);
            Result := MaxHeight < FVertFixedHeight + RowHeights;
        except
            Result := True;
        end;
    end;
end;

procedure TtsCustomDBGrid.UpdateScrollPos;
var
    Position: Integer;
begin
    if (not HandleAllocated) or (ScrollBars = ssNone) then Exit;
    if not CanPaint then begin FDoUpdateScrollPos := True; Exit end;

    try
        Position := GetHorzScrollPos;
        if GetScrollPos(Handle, SB_HORZ) <> Position then
            SetScrollPos(Handle, SB_HORZ, Position, True);

        Position := GetVertScrollPos;
        if GetScrollPos(Handle, SB_VERT) <> Position then
            SetScrollPos(Handle, SB_VERT, Position, True);
    finally
        FDoUpdateScrollPos := False;
    end;
end;

function TtsCustomDBGrid.UsePositionalScrollbar: Boolean;
begin
    Result := not (UseStandardScrolling and
                   ((not Assigned(FDatalink.Dataset)) or
                   (not FGridData.IsSequenced)))
end;

function TtsCustomDBGrid.UseStandardScrolling: Boolean;
begin
    Result := UseStandardDataset;
end;

procedure TtsCustomDBGrid.GetVertScrollRange(var ScrollRows, ScrollRange, StartRow,
                                             EndRow: Longint; var OutsideMaxRange: Boolean);
begin
    if not DataBound then
    begin
        inherited GetVertScrollRange(ScrollRows, ScrollRange, StartRow, EndRow,
                                     OutsideMaxRange);
        Exit;
    end;

    if not UsePositionalScrollbar then
    begin
        StartRow := StandardScrollMin;
        EndRow := StandardScrollMax;
        OutsideMaxRange := False;
        ScrollRows := EndRow - StartRow + 1;
        ScrollRange := ScrollRows;
    end
    else if UseStandardScrolling then
    begin
        StartRow := 1;
        EndRow := FGridData.RecCount + VisibleRowCount - 1 + InsertionRow;
        OutsideMaxRange := False;
        ScrollRows := EndRow - StartRow + 1;
        ScrollRange := ScrollRows;
    end
    else
    begin
        StartRow := 1;
        EndRow := FGridData.RecCount + InsertionRow;
        OutsideMaxRange := False;
        ScrollRows := EndRow - StartRow + 1;
        ScrollRange := CalcMin(tsMaxScrollRange, ScrollRows);
        if ScrollRows > ScrollRange then
        begin
            OutsideMaxRange := True;
            ScrollRows := EndRow - VisibleRowCount - StartRow + 1;
            ScrollRange := CalcMin(ScrollRange, ScrollRows);
        end;
    end;
end;

function TtsCustomDBGrid.GetVertScrollPos: Integer;
var
    ScrollRange: Longint;
    ScrollRows: Longint;
    StartRow, EndRow: Longint;
    OutsideMaxRange: Boolean;
begin
    Result := 0;
    if not DataBound then begin Result := inherited GetVertScrollPos; Exit end;
    if not Active then Exit;

    if not UsePositionalScrollbar then
    begin
        if Datalink.Dataset.BOF then
            Result := StandardScrollMin
        else if Datalink.Dataset.EOF then
            Result := StandardScrollMax
        else
            Result := (StandardScrollMin + StandardScrollMax) div 2;
    end
    else
    begin
        Result := 1;
        GetVertScrollRange(ScrollRows, ScrollRange, StartRow, EndRow, OutsideMaxRange);

        if ScrollRows > 0 then
        begin
            if OutsideMaxRange then
                Result := Round((FGridData.FirstRow - StartRow + GridTopRow) * (ScrollRange / ScrollRows))
            else if UseStandardScrolling then
            begin
                Result := Datalink.Dataset.RecNo + (GridTopRow - FixedRows);
                if Result < 0 then Result := CurrentScrollInfo(SB_VERT).nPos;
            end
            else
                Result := FGridData.FirstRow - StartRow + GridTopRow;
        end;
    end;
end;

function TtsCustomDBGrid.GetVertScrollRow(Pos: Integer): Longint;
var
    ScrollRows, ScrollRange: Longint;
    StartRow, EndRow: Longint;
    OutsideMaxRange: Boolean;
begin
    GetVertScrollRange(ScrollRows, ScrollRange, StartRow, EndRow, OutsideMaxRange);
    if not OutsideMaxRange then
        Result := StartRow - 1 + Pos
    else
        Result := StartRow + Round(Pos * (ScrollRows / ScrollRange));
end;

function TtsCustomDBGrid.VertScrollPageSize(ScrollRange, ScrollCount, EndRow: Longint): Integer;
begin
    if not DataBound then
    begin
        Result := inherited VertScrollPageSize(ScrollRange, ScrollCount, EndRow);
        Exit;
    end;

    if not UsePositionalScrollbar
        then Result := 0
        else Result := CalcMax(1, Round(ScrollRange * (Trunc(VisibleRows) / ScrollCount)));
end;

procedure TtsCustomDBGrid.ActivateCellChanged(OldCol: Integer; OldRow: Variant);
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;
    DoCellChanged(OldCol, CurDataCol, OldRow, FCurBookmark);
end;

function TtsCustomDBGrid.CheckRowChanged(var OldRow: Variant): Boolean;
begin
    Result := False;
    if not DataBound then begin Result := inherited CheckRowChanged(OldRow); Exit; end;
    if not Active then Exit;

    OldRow := FOldBookmark;
    if FOldBookmark <> FCurBookmark then
    begin
        FOldBookmark := FCurBookmark;
        DoRowChanged(OldRow, FCurBookmark);
        Result := True;
    end;
end;

procedure TtsCustomDBGrid.SetCurrentPosition(DisplayCol, DisplayRow: Longint;
                                             InvalidateInsertRow, InvalidateOldCell: Boolean);
var
    OldDataCol: Longint;
    OldDataRow: Longint;
begin
    if not DataBound then begin inherited; Exit; end;

    OldDataCol := CurDataCol;
    OldDataRow := CurDataRow;
    PositionCell(DisplayCol, DisplayRow);
    if DisplayRow > 0 then SetCurrentRow(OldDataRow, GetDataRow(DisplayRow));

    if (OldDataCol <> CurDataCol) or
       (FOldBookmark <> FCurBookmark) then
    begin
        ClearCellBuffer;
        FControlEnabled := AlwaysShowEditor;
        if InvalidateOldCell and
           (OldDataCol >= 0) and (OldDataCol <= ColCount - 1) and
           (OldDataRow >= 0) and (OldDataRow <= RowCount - 1) then
        begin
            InvalidateCell(GetDisplayCol(OldDataCol), GetDisplayRow(OldDataRow));
        end;
    end;
end;

procedure TtsCustomDBGrid.SetCurrentRowSelect(DisplayRow: Longint; Draw: Boolean);
begin
    IgnoreDatasetScrolled := True;
    try
        SetCurrentPosition(CurDisplayCol, DisplayRow, True, True);
    finally
        IgnoreDatasetScrolled := False;
        if Draw then DrawCurrent(CurDisplayRow);
    end;
end;

procedure TtsCustomDBGrid.StartDatasetEdit(SetModified: Boolean);
begin
    Datalink.Edit;
    if (Datalink.Editing) and (CurDataRow <= GridRows) then
    begin
        if SetModified then FDataModified := True;
        if InsertionRowIsOff then SetInsertRowOn;
    end;
    FEditBookmark := FCurBookmark;
end;

function TtsCustomDBGrid.StartCellChange(DataCol: Longint; SetModified: Boolean): Boolean;
var
    ACol: TtsDBCol;
    ReadOnlyCell: TtsReadOnly;
begin
    if (not DataBound) then
    begin
        Result := inherited StartCellChange(DataCol, SetModified);
        Exit;
    end;

    Result := False;
    if (not Active) then Exit;

    ACol := GridCols[DataCol];
    ReadOnlyCell := CellReadOnly[DataCol, CurrentRecordId];
    if (not ReadOnly) and ((not ACol.ReadOnly) or (ReadOnlyCell = roOff)) and
       (ReadOnlyCell <> roOn) then
    begin
      if (ACol.DataSetField <> Nil) then
         StartDatasetEdit(SetModified);
      Result := True;
    end;
end;

function TtsCustomDBGrid.Edit: Boolean;
begin
    Result := StartEdit;
    if Result then StartDatasetEdit(False);
end;

function TtsCustomDBGrid.DBEndCellEdit(DataCol: Longint; DataRow: Variant): Boolean;
var
    Cancel: Boolean;
begin
    DoEndCellEdit(DataCol, DataRow, Cancel);
    Result := not Cancel;
end;

function TtsCustomDBGrid.DBEndRowEdit(DataRow: Variant): Boolean;
var
    Cancel: Boolean;
begin
    DoEndRowEdit(DataRow, Cancel);
    Result := not Cancel;
end;

function TtsCustomDBGrid.DBStartCellEdit(DataCol: Longint; DataRow: Variant): Boolean;
var
    Cancel: Boolean;
begin
    DoStartCellEdit(DataCol, DataRow, Cancel);
    Result := not Cancel;
end;

function TtsCustomDBGrid.DBStartRowEdit(DataRow: Variant): Boolean;
var
    Cancel: Boolean;
begin
    DoStartRowEdit(DataRow, Cancel);
    Result := not Cancel;
end;

procedure TtsCustomDBGrid.CellEdit(DataCol, DataRow: Longint; ByUser: Boolean);
begin
    if not DataBound then begin inherited; Exit end;
    if Active then DoCellEdit(DataCol, FCurBookmark, ByUser);
end;

function TtsCustomDBGrid.StartCellEdit: Boolean;
var
    Field: TtsDBField;
begin
    Result := True;
    if CellEditing then Exit;
    if not DataBound then begin Result := inherited StartCellEdit; Exit end;
    if not Active then Exit;

    Field := GridCols[CurDataCol].Field;
    if Assigned(Field) and
       (not (Field.IsEditField or FSetLookupField)) then Result := False;

    if Result then
    begin
        FStartEditing := True;
        try
            ActiveRecord := -1;
            Result := DBStartCellEdit(CurDataCol, FCurBookmark);
        finally
            FStartEditing := False;
        end;
    end;
end;

function TtsCustomDBGrid.StartRowEdit: Boolean;
begin
    Result := True;
    if RowEditing then Exit;
    if not DataBound then begin Result := inherited StartRowEdit; Exit end;

    if Active then
    begin
        FStartEditing := True;
        try
            ActiveRecord := -1;
            Result := DBStartRowEdit(FCurBookmark);
        finally
            FStartEditing := False;
        end;
    end;
end;

function TtsCustomDBGrid.EndCellEdit: Boolean;
begin
    Result := True;
    if not DataBound then begin Result := inherited EndCellEdit; Exit end;
    if not Active then Exit;

    ActiveRecord := -1;
    Result := DBEndCellEdit(CurDataCol, FCurBookmark);
    if Result and Editing then UpdateData;
end;

function TtsCustomDBGrid.EndRowEdit: Boolean;
begin
    Result := True;
    if not DataBound then begin Result := inherited EndRowEdit; Exit end;
    if not Active then Exit;

    ActiveRecord := -1;
    Result := DBEndRowEdit(FCurBookmark);
    if Result and Editing then
    begin
        UpdateData;
        PostData(False);
        Result := (DataLink.Dataset.State = dsBrowse);
    end;
end;

function TtsCustomDBGrid.UndoCellEdit(ByUser: Boolean): Boolean;
var
    Cancel: Boolean;
begin
    Result := True;
    if not DataBound then begin Result := inherited UndoCellEdit(ByUser); Exit end;
    if not Active then Exit;

    ActiveRecord := -1;
    DoUndoCellEdit(CurDataCol, FCurBookmark, ByUser, Cancel);
    Result := not Cancel;
end;

function TtsCustomDBGrid.CheckUndoRowEdit(UndoAll: Boolean; var RowEditing: Boolean): Boolean;
begin
    Result := inherited CheckUndoRowEdit(UndoAll, RowEditing);
    if DataBound then Result := Result and Editing;
end;

function TtsCustomDBGrid.UndoRowEdit(ByUser: Boolean; RowEditing: Boolean): Boolean;
var
    Cancel: Boolean;
begin
    Result := True;
    if not DataBound then begin Result := inherited UndoRowEdit(ByUser, RowEditing); Exit end;
    if not Active then Exit;

    ActiveRecord := -1;
    Result := True;
    if RowEditing then
    begin
        DoUndoRowEdit(FCurBookmark, ByUser, Cancel);
        Result := not Cancel;
    end;
    if Result and Editing then PostData(True);
    if Result then Result := (FDataLink.Dataset.State = dsBrowse);
end;

function TtsCustomDBGrid.CheckEndEdit(NewDataCol, NewDataRow: Longint; ByUser: Boolean): Boolean;
begin
    Result := True;
    if FInCheckEndEdit then Exit;

    if not DataBound then begin Result := inherited CheckEndEdit(NewDataCol, NewDataRow, ByUser); Exit end;
    if not Active then Exit;

    FInCheckEndEdit := True;
    try
        if CellEditing or RowEditing then
        begin
            if (NewDataRow = -1) or (NewDataRow <> CurDataRow) then
                Result := CanEndEdit(ByUser)
            else if NewDataCol <> CurDataCol then
                Result := CanEndCellEdit(ByUser);
        end
        else if Editing and ((NewDataRow = -1) or (NewDataRow <> CurDataRow)) then
            PostData(True)
    finally
        FInCheckEndEdit := False;
    end;
end;

function TtsCustomDBGrid.CreateCombo: TtsCombo;
begin
    Result := TtsDBCombo.Create(Self);
end;

function TtsCustomDBGrid.CreateComboGrid: TtsBaseGrid;
begin
    Result := TtsDBComboGrid.Create(ComboForm);
end;

function TtsCustomDBGrid.GetDBCombo: TtsDBCombo;
begin
    if FCombo = nil then CheckComboCreated;
    Result := TtsDBCombo(FCombo);
end;

function TtsCustomDBGrid.ComboInitHeight(DropDownRows: Longint): Integer;
var
    Offset: Integer;
    NewHeight: Integer;
    Redraw: Boolean;
begin
    if not DataBound then begin Result := inherited ComboInitHeight(DropDownRows); Exit; end;

    Offset := 0;
    if BorderStyle = bsSingle then Offset := 2*GetSystemMetrics(SM_CYBORDER);
    if HeadingOn then Offset := Offset + HeadingHeight;

    NewHeight := (DropDownRows * DefaultRowHeight) + Offset;
    FGridData.ResizeBuffer(DropDownRows, Redraw);
    UpdateRowCount(False);
    FGridData.AtEnd := False;

    if FGridData.BufferRows < DropDownRows then
        NewHeight := (CalcMax(1, FGridData.BufferRows) * DefaultRowHeight) + Offset;
    Result := NewHeight;
end;

procedure TtsCustomDBGrid.InitCombo(Combo: TtsCombo);
begin
    if Combo <> nil then
    begin
        TtsDBCombo(Combo).Grid.DataSource := nil;
        TtsDBCombo(Combo).Grid.FAutoLookup := True;
        TtsDBCombo(Combo).Grid.DatasetType := DatasetType;
        TtsDBCombo(Combo).Grid.BookmarkType := BookmarkType;
        TtsDBCombo(Combo).Grid.BookmarkCompareType := BookmarkCompareType;
        TtsDBCombo(Combo).Grid.RecordSelection := RecordSelection;
    end;

    inherited;
end;

procedure TtsCustomDBGrid.InitComboData(CellHasCombo: Boolean);
var
    Field: TtsDBField;
begin
    if not DataBound then begin inherited; Exit; end;
    if Combo.Grid.Datasource <> nil then Exit;
    if Combo.Grid.StoreData then Exit;
    if not Col[CurDataCol].Lookup then Exit;
    if not Combo.AutoLookup then exit;

    Field := Col[CurDataCol].Field;
    Combo.Grid.LookupDataset := Field.DatasetField.LookupDataset;

    if not CellHasCombo then
    begin
        Combo.Grid.FieldState := fsCustomized;
        Combo.Grid.Cols := 0;
        Combo.Grid.InsertCol(1, Field.DatasetField.LookupResultField);
        Combo.AutoSearch := asTop;
        Combo.DropDownCols := 1;
    end;
end;

procedure TtsCustomDBGrid.CheckSetLookupDataset;
var
    ParentGrid: TtsCustomDBGrid;
begin
    if (not InDesignMode) or (not Visible) then Exit;
    if not FAsCombo then Exit;
    if Datasource <> nil then Exit;
    if StoreData then Exit;
    if not AutoLookup then Exit;

    ParentGrid := TtsCustomDBGrid(Self.ParentGrid);
    if ParentGrid.Col[ParentGrid.CurDataCol].Lookup then
        LookupDataset := ParentGrid.Col[ParentGrid.CurDataCol].Field.DatasetField.LookupDataset;
end;

function TtsCustomDBGrid.CheckInitComboRow: Boolean;
begin
    Result := True;
    if not Databound then begin Result := inherited CheckInitComboRow; Exit; end;
    if Assigned(Combo.Grid.Datasource) then
        Result := Combo.Grid.Datasource <> Datasource;
end;

procedure TtsCustomDBGrid.ComboDropDown(DataCol, DataRow: Longint);
begin
    if not Combo.Grid.DataBound then begin inherited; Exit end;

    if (FDropDownCol = -1) and (FDropDownCol = -1) then
    begin
        if Combo.Grid.Active and CheckInitComboRow then
        with Combo.Grid do
        begin
            MoveFirst;
            if FGridData.BufferRows > 0 then
                CurrentDataRow := FGridData.Bookmark[1];
        end;
        inherited;
    end;
end;

procedure TtsCustomDBGrid.ActivateComboInit(DataCol, DataRow: Longint);
begin
    if not DataBound then begin inherited; Exit end;
    DoComboInit(DataCol, FCurBookmark);
end;

procedure TtsCustomDBGrid.ActivateComboDropDown(DataCol, DataRow: Longint);
begin
    if not DataBound then begin inherited; Exit end;
    DoComboDropDown(DataCol, FCurBookmark);
end;

procedure TtsCustomDBGrid.ActivateComboRollUp(DataCol, DataRow: Longint);
begin
    if not DataBound then begin inherited; Exit end;
    DoComboRollUp(DataCol, FCurBookmark);
end;

procedure TtsCustomDBGrid.GetComboValue(ValueCol, DataColUp, DataRowUp: Longint; var Value: Variant);
var
    CurBkm: Variant;
    CurRow: Longint;
    OldActive: Integer;
    ControlType: TtsControlType;
    LookupValue: Variant;
begin
    Value := Unassigned;
    if not Combo.Grid.DataBound then begin inherited; Exit end;
    if not Combo.Grid.Active then Exit;

    DataColUp := 0;
    CurBkm := Combo.Grid.CurrentDataRow;
    CurRow := Combo.Grid.FGridData.BufferRow(CurBkm);
    if CurRow <= 0 then
    begin
        Combo.Grid.FGridData.MoveToRecord(CurBkm);
        CurRow := Combo.Grid.FGridData.BufferRow(CurBkm);
    end;

    OldActive := Combo.Grid.FGridData.ActiveRecord;
    try
        Combo.Grid.FGridData.ActiveRecord := CurRow;
        if (CurRow > 0) and (DataColUp >= 0) then
        begin
            DoComboGetValue(FCurDataCol, CurrentDataRow, CurBkm, Value);

            ControlType := CurCellControlType;
            if VarIsEmpty(Value) and (ControlType <> ctNone) and (ValueCol <> 0) then
            begin
                if Col[CurDataCol].Lookup and
                   Assigned(Combo.Grid.LookupDataSource) and
                   (Combo.Grid.Datasource = Combo.Grid.LookupDatasource) then
                begin
                    with Col[CurDataCol].Field.DatasetField do
                        LookupValue := LookupDataSet.FieldValues[LookupKeyFields];
                    Value := LookupValue;
                end
                else
                    Value := Combo.Grid.ActiveCell[ValueCol, CurBkm]
            end
            else if ControlType = ctText then
                Value := CheckStrValue(ControlType, Value);
        end;
    finally
        Combo.Grid.FGridData.ActiveRecord := OldActive;
    end;
end;

procedure TtsCustomDBGrid.SetComboValue(Value: Variant);
var KeyFields: string;
begin
    if not Combo.Grid.DataBound then begin inherited; Exit; end;
    if not Combo.Grid.Active then Exit;

    if (not Col[CurDataCol].Lookup) or
       (not Assigned(Combo.Grid.LookupDatasource)) or
       (Combo.Grid.Datasource <> Combo.Grid.LookupDatasource) then
    begin
        inherited;
    end
    else if not VarIsEmpty(Value) then
    begin
        FSetLookupField := True;
        try
            if StartShowEditor(True) then
            begin
              //SearchBkm := FindDBComboRow(EmptyBookmark, EmptyBookmark, Value, False, Found);
              //SetDBComboRow(SearchBkm);
              KeyFields := Col[CurDataCol].Field.DatasetField.KeyFields;
              Datasource.Dataset.FieldValues[KeyFields] := Value;
              ClearCellBuffer;
              Self.InvalidateRow(CurDataRow);
            end;
        finally
            FSetLookupField := False;
        end;
    end;
end;

procedure TtsCustomDBGrid.SetDBComboRow(SearchBkm: TBookmarkStr);
var
    CurRow: Longint;
begin
    if VarToStr(SearchBkm) <> VarToStr(EmptyBookmark) then
    begin
        with Combo.Grid do
        begin
            EnablePaint := False;
            try
                SelectedRows.ResetAll;
                SetDBNewTopRow(SearchBkm);

                case Self.Combo.AutoSearch of
                    asBottom:
                        begin
                            CurRow := FGridData.BufferRow(SearchBkm);
                            if CurRow < VisibleRowCount then
                            begin
                                FGridData.MoveBy(-(VisibleRowCount - CurRow));
                                SetDBNewTopRow(FGridData.Bookmark[1]);
                            end;
                        end;

                    asCenter:
                        begin
                            CurRow := FGridData.BufferRow(SearchBkm);
                            if CurRow < VisibleRowCount div 2 then
                            begin
                                FGridData.MoveBy(-((VisibleRowCount - CurRow) div 2));
                                SetDBNewTopRow(FGridData.Bookmark[1]);
                            end;
                        end;
                end;

                CurrentDataRow := SearchBkm;
                CheckRowSelection(True);
                SelectionsChanged(True);
                CheckTopLeftChanged(True);
            finally
                EnablePaint := True;
            end;
        end;
    end;
end;

function TtsCustomDBGrid.FindDBComboRow(FromBkm, ToBkm: TBookmarkStr; Value: string;
                                        FullCmpLen: Boolean; var Found: Boolean): TBookmarkStr;
begin
    Found := False;
    Result := EmptyBookmark;

    with Combo.Grid.FGridData do
    begin
        if Combo.ValueColSorted then
            Result := FindKey(Value, Combo.ValueCol, Combo.CompareType, Self,
                              FullCmpLen, Found)
        else
            Result := LocateValue(FromBkm, ToBkm, Value, Combo.ValueCol,
                                  Combo.CompareType, Self, FullCmpLen, Found);
    end;
end;

procedure TtsCustomDBGrid.PositionComboRow;
var
    SearchBkm: TBookmarkStr;
    CurValue: string;
    Found: Boolean;
    Reset: Boolean;
    OldDatasetPos: TtsDatasetPosition;
begin
    if not Combo.Grid.DataBound then begin inherited; Exit; end;
    if not Combo.Grid.Active then Exit;
    if (Combo.ValueCol < 1) or (Combo.ValueCol > Combo.Grid.Cols) then Exit;

    if Combo.AutoSearch <> asNone then
    begin
        Combo.Grid.SaveDatasetPosition(OldDatasetPos);
        try
            Combo.Grid.FGridData.CheckDisableControls;
            CurValue := string(CurrentCell.Value);
            SearchBkm := FindDBComboRow(EmptyBookmark, EmptyBookmark, CurValue, False, Found);
            SetDBComboRow(SearchBkm);
        finally
            Reset := (VarToStr(SearchBkm) = VarToStr(EmptyBookmark));
            Combo.Grid.RestoreDatasetPosition(OldDatasetPos, Reset);
        end;
    end;
end;

function TtsCustomDBGrid.FindDBNextComboRow(SearchValue: string; var Found: Boolean): TBookmarkStr;
var
    CurBkm, NewBkm, NextBkm: TBookmarkStr;
    ComboValue: string;
begin
    Found := False;
    Result := EmptyBookmark;
    CurBkm := Combo.Grid.CurrentDataRow;

    if Combo.ValueColSorted then
    begin
        if CurBkm = Combo.Grid.FGridData.LastBookmark then
            NewBkm := FindDBComboRow(EmptyBookmark, EmptyBookmark, SearchValue, False, Found)
        else
        begin
            Combo.Grid.FGridData.NextBookmark(CurBkm, NextBkm);
            ComboValue := Combo.Grid.BookmarkValue(Combo.ValueCol, NextBkm);
            if (ComboValue = '') or not ComboValueEqual(ComboValue[1], SearchValue) then
                NewBkm := FindDBComboRow(EmptyBookmark, EmptyBookmark, SearchValue, False, Found)
            else
            begin
                NewBkm := NextBkm;
                Found := True;
            end;
        end;
    end
    else
    begin
        Found := False;
        Combo.Grid.FGridData.NextBookmark(CurBkm, NextBkm);
        NewBkm := FindDBComboRow(NextBkm, EmptyBookmark, SearchValue, False, Found);
        if not Found then NewBkm := FindDBComboRow(EmptyBookmark, CurBkm, SearchValue, False, Found);
    end;

    if Found then Result := NewBkm;
end;

function TtsCustomDBGrid.FindDBComboFirstChar(Key: Char; var Found: Boolean): TBookmarkStr;
var
    SearchBkm: TBookmarkStr;
    CurValue, ComboValue: string;
begin
    Found := False;
    CurValue := string(CurrentCell.Value);
    if (CurValue = '') or (not ComboValueEqual(CurValue[1], Key)) then
        SearchBkm := FindDBComboRow(EmptyBookmark, EmptyBookmark, Key, False, Found)
    else
    begin
        ComboValue := '';
        SearchBkm := Combo.Grid.CurrentDataRow;
        if SearchBkm <> EmptyBookmark then
            ComboValue := Combo.Grid.BookmarkValue(Combo.ValueCol, SearchBkm);

        if not ComboValueEqual(CurValue, ComboValue) then
        begin
            SearchBkm := FindDBComboRow(EmptyBookmark, EmptyBookmark, CurValue, False, Found);
            Found := False;
            ComboValue := '';
            if VarToStr(SearchBkm) <> VarToStr(EmptyBookmark) then
                ComboValue := Combo.Grid.BookmarkValue(Combo.ValueCol, SearchBkm);
            if (ComboValue = '') or (not ComboValueEqual(ComboValue[1], Key))
                then SearchBkm := FindDBComboRow(EmptyBookmark, EmptyBookmark, Key, False, Found)
                else SearchBkm := FindDBNextComboRow(Key, Found);
        end
        else
            SearchBkm := FindDBNextComboRow(Key, Found);
    end;
    Result := SearchBkm;
end;

function TtsCustomDBGrid.FindDBComboString(Key: Char; var Found: Boolean): TBookmarkStr;
var
    SearchValue: string;
    ComboValue: string;
    SearchBkm: TBookmarkStr;
begin
    Found := False;
    CheckResetComboSearchValue;
    SearchValue := FComboSearchValue;

    if SearchValue = '' then
    begin
        SearchBkm := FindDBComboRow(EmptyBookmark, EmptyBookmark, Key, True, Found);
        if Found then FComboSearchValue := Key;
    end
    else
    begin
        SearchValue := FComboSearchValue + Key;
        SearchBkm := FindDBComboRow(EmptyBookmark, EmptyBookmark, SearchValue, True, Found);
        if Found then
        begin
            ComboValue := Combo.Grid.BookmarkValue(Combo.ValueCol, SearchBkm);
            Found := (Length(SearchValue) <= Length(ComboValue)) and
                     (ComboValueEqual(Copy(ComboValue, 1, Length(SearchValue)), SearchValue));
        end;

        if Found then
            FComboSearchValue := SearchValue
        else if (Length(FComboSearchValue) = 1) and
                ComboValueEqual(FComboSearchValue[1], Key) then
        begin
            SearchBkm := FindDBComboFirstChar(Key, Found);
            if Found then FComboSearchValue := Key;
        end;
    end;

    FLastIncrSearchTime := GetTickCount;
    Result := SearchBkm;
end;

function TtsCustomDBGrid.PositionDropDownList(Key: Char): Variant;
var
    SearchBkm: TBookmarkStr;
    ComboValue: string;
    Found: Boolean;
    Reset: Boolean;
    OldDatasetPos: TtsDatasetPosition;
begin
    if not Combo.Grid.DataBound then
        begin Result := inherited PositionDropDownList(Key); Exit; end;
    if not Combo.Grid.Active then exit;

    Result := Unassigned;
    if Combo.AutoSearch = asNone then Exit;

    Found := False;
    Combo.Grid.SaveDatasetPosition(OldDatasetPos);
    try
        Combo.Grid.FGridData.CheckDisableControls;
        if not Combo.ValueColSorted
            then SearchBkm := FindDBComboFirstChar(Key, Found)
            else SearchBkm := FindDBComboString(Key, Found);

        if (not Found) or (VarToStr(SearchBkm) = VarToStr(EmptyBookmark)) then
            Result := Unassigned
        else
        begin
            SetDBComboRow(SearchBkm);
            DoComboGetValue(CurDataCol, CurrentDataRow, Combo.Grid.CurrentDataRow, Result);
            if VarIsEmpty(Result) then
            begin
                ComboValue := Combo.Grid.BookmarkValue(Combo.ValueCol, SearchBkm);
                if Col[CurDataCol].Lookup and
                   Assigned(Combo.Grid.LookupDataSource) and
                   (Combo.Grid.Datasource = Combo.Grid.LookupDatasource) then
                begin
                   with Col[CurDataCol].Field.DatasetField do
                      Result := LookupDataSet.FieldValues[LookupKeyFields];
                end;

               if VarIsEmpty(Result) then
               begin
                 if VarIsEmpty(ComboValue) or VarIsNull(ComboValue) then
                    Result := Unassigned
                 else if ComboValue = '' then
                    Result := Unassigned
                 else if (not Combo.ValueColSorted) and (not ComboValueEqual(ComboValue[1], Key)) then
                    Result := Unassigned
                 else
                    Result := ComboValue;
               end;
            end;
        end;
    finally
        Reset := (not Found) or (VarToStr(SearchBkm) = VarToStr(EmptyBookmark));
        Combo.Grid.RestoreDatasetPosition(OldDatasetPos, Reset);
    end;
end;

function TtsCustomDBGrid.PositionAutoFill(CellExit: Boolean): Boolean;
var
    SearchBkm: TBookmarkStr;
    ComboValue: string;
    NewValue: Variant;
    Found: Boolean;
    OldDatasetPos: TtsDatasetPosition;
begin
    Result := False;
    ComboInit(CurDataCol, CurDataRow);
    if not Combo.Grid.DataBound then
        begin Result := inherited PositionAutoFill(CellExit); Exit; end;
    if not Combo.Grid.Active then exit;
    if not Combo.AutoFill then Exit;
    if CellExit and (Combo.AutoFillConvertCase <> afcOnExit) then Exit;
    if Combo.AutoSearch = asNone then Exit;
    if GiveCellControlType(CurDataCol, CurDataRow) <> ctText then Exit;
    if CurrentCell.Value = '' then Exit;

    Found := False;
    Combo.Grid.SaveDatasetPosition(OldDatasetPos);
    try
        Combo.Grid.FGridData.CheckDisableControls;
        SearchBkm := FindDBComboRow(EmptyBookmark, EmptyBookmark, CurrentCell.Value, True, Found);
        Result := Found and (VarToStr(SearchBkm) <> VarToStr(EmptyBookmark));
        if Result then
        begin
            SetDBComboRow(SearchBkm);
            NewValue := Unassigned;
            DoComboGetValue(CurDataCol, CurrentDataRow, Combo.Grid.CurrentDataRow, NewValue);
            if VarIsEmpty(NewValue) then
            begin
                ComboValue := Combo.Grid.BookmarkValue(Combo.ValueCol, SearchBkm);
                if VarIsEmpty(ComboValue) or VarIsNull(ComboValue) then
                    NewValue := Unassigned
                else if ComboValue = '' then
                    NewValue := Unassigned
                else
                    NewValue := ComboValue;
            end;
            SetAutoFillValue(NewValue, Combo.AutoFillConvertCase, CellExit);
        end;
    finally
        Combo.Grid.RestoreDatasetPosition(OldDatasetPos, not Result);
    end;
end;

procedure TtsCustomDBGrid.ActivateDateTimeInit(DateTimeDef: TtsDateTimeDefComponent; DataCol, DataRow: Longint);
begin
    if not DataBound then begin inherited; Exit end;
    DoDateTimeInit(DateTimeDef, DataCol, FCurBookmark);
end;

procedure TtsCustomDBGrid.ActivateDateTimeDropDown(DateTimeDef: TtsDateTimeDefComponent; DataCol, DataRow: Longint);
begin
    if not DataBound then begin inherited; Exit end;
    DoDateTimeDropDown(DateTimeDef, DataCol, FCurBookmark);
end;

procedure TtsCustomDBGrid.ActivateDateTimeRollUp(DateTimeDef: TtsDateTimeDefComponent; DataCol, DataRow: Longint);
begin
    if not DataBound then begin inherited; Exit end;
    DoDateTimeRollUp(DateTimeDef, DataCol, FCurBookmark);
end;

procedure TtsCustomDBGrid.ActivateDateTimeGetValue(DateTimeDef: TtsDateTimeDefComponent; DataCol, DataRow: Longint; var Value: Variant);
begin
    if not DataBound then begin inherited; Exit end;
    DoDateTimeGetValue(DateTimeDef, DataCol, FCurBookmark, Value);
end;

procedure TtsCustomDBGrid.RemoveRowDateTimeDef(DateTimeDef: TtsDateTimeDefComponent);
var
    I: Longint;
    AList: TtsSetList;
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited; Exit; end;

    AList := FDBRowPropSet.List;
    try
        for I := 1 to AList.Count do
        begin
            Element := TtsCustomElement(AList.Items[I]);
            if TtsDBRowElement(Element).FDateTimeDef = DateTimeDef then
                FDBRowPropSet.SetProperty([0], Element, ObjectToVariant(nil), prDateTime, 0, False);
        end;
    finally
        AList.Free;
    end;
end;

procedure TtsCustomDBGrid.RemoveCellDateTimeDef(DateTimeDef: TtsDateTimeDefComponent);
var
    I: Longint;
    AList: TtsSetList;
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited; Exit; end;

    AList := FDBCellPropSet.List;
    try
        for I := 1 to AList.Count do
        begin
            Element := TtsCustomElement(AList.Items[I]);
            if TtsDBCellElement(Element).FDateTimeDef = DateTimeDef then
                FDBCellPropSet.SetProperty([0,0], Element, ObjectToVariant(nil), prDateTime, 0, False);
        end;
    finally
        AList.Free;
    end;
end;

function TtsCustomDBGrid.GetCurrentDateTime: Variant;
var
    OldActive: Integer;
begin
    if (not DataBound) or FDataModified or (GridCols[CurrentDataCol].Field = nil) then
        begin Result := inherited GetCurrentDateTime; Exit; end;

    OldActive := FGridData.ActiveRecord;
    try
        FGridData.ActiveRecord := CurDataRow;
        Result := VariantToDateTime(Col[CurDataCol].Field.Value);
    finally
        FGridData.ActiveRecord := OldActive;
    end;
end;

function TtsCustomDBGrid.MaxDisplayRows: Integer;
var
    MaxRows: Double;
begin
    Result := 0;
    try
        if (not HandleAllocated) then Exit;

        if UseStandardScrolling then
        begin
            MaxRows := (ClientHeight + FHorzLineWidth - FVertFixedHeight) / DefaultRowHeight;
            Result := Trunc(MaxRows)
        end
        else
        begin
            MaxRows := (ClientHeight - FVertFixedHeight) / DefaultRowHeight;
            if MaxRows = Trunc(MaxRows)
                then Result := Trunc(MaxRows)
                else Result := Trunc(MaxRows + 1);
        end;

        if Result <= 0 then Result := 1;
    except
    end;
end;

procedure TtsCustomDBGrid.DBCellLoaded(DataCol: Longint; DataRow: Variant;
                                       Rownr: Longint; CheckRownr: Boolean;
                                       ControlType: TtsControlType; var Value: Variant);
begin
    if FLoadFirstRow or
       not IsSameRow(Rownr, FLastRownrLoaded, DataRow, FLastRowLoaded, CheckRownr) then
    begin
        FLastRowLoaded := DataRow;
        FLastRownrLoaded := Rownr;
        FLoadFirstRow := False;
        DoRowLoaded(DataRow);
    end;

    FInDoCellLoaded := True;
    try
        DoCellLoaded(DataCol, DataRow, Value);
        if FAsCombo then
            TtsCustomDBGrid(ParentGrid).DoComboCellLoaded(DataCol, DataRow, Value);
    finally
        FInDoCellLoaded := False;
    end;

    if not VarIsEmpty(Value) then
    begin
        CheckVarType(ControlType, Value);
        if (ControlType = ctText) and (VarType(Value) <> varString) then
            Value := CheckStrValue(ControlType, Value);
    end;
end;

procedure TtsCustomDBGrid.CellLoadedEvent(DataCol, DataRow: Longint; ControlType: TtsControlType; var Value: Variant);
var
    OldActive: Integer;
begin
    if not DataBound then begin DBCellLoaded(DataCol, DataRow, DataRow, True, ControlType, Value); Exit end;
    if not Active then Exit;

    OldActive := FGridData.ActiveRecord;
    try
        FGridData.ActiveRecord := DataRow;
        GetFieldValue(GridCols[DataCol], DataRow, True, ControlType, Value);
        DBCellLoaded(DataCol, FGridData.Bookmark[DataRow], DataRow, True, ControlType, Value);
    finally
        FGridData.ActiveRecord := OldActive;
    end;
end;

function TtsCustomDBGrid.PaintCell(var DrawData: TtsDrawData; ARect: TRect; DrawSelected: Boolean): Boolean;
var
    State: TtsPaintCellState;
    OldFont: TFont;
    OldColor: TColor;
    OldActive: Integer;
begin
    Result := False;
    if DataBound and not Active then Exit;

    with DrawData do
    begin
        if (DisplayCol >= 1) and (DisplayRow >= 0) then
        begin
            GetPaintCellPars(DisplayCol, DisplayRow, State);
            if DrawRect.Right > DrawRect.Left then
            begin
                OldFont := Canvas.Font;
                OldColor := Canvas.Brush.Color;
                if DisplayRow = 0 then
                begin
                    Canvas.Brush.Color := HeadingColor;
                    Canvas.Font := HeadingFont;
                end
                else
                begin
                    Canvas.Brush.Color := Self.Color;
                    Canvas.Font := Self.Font;
                end;

                if DataBound and (DataRow > 0) then
                begin
                    OldActive := FGridData.ActiveRecord;
                    try
                        FGridData.ActiveRecord := DataRow;
                        DoPaintCell(DataCol, FGridData.Bookmark[DataRow], DrawRect, State, Result);
                    finally
                        FGridData.ActiveRecord := OldActive;
                    end;
                end
                else
                    DoPaintCell(DataCol, DataRow, DrawRect, State, Result);

                if Canvas.Font <> OldFont then Canvas.Font := OldFont;
                if Canvas.Brush.Color <> OldColor then Canvas.Brush.Color := OldColor;
            end;

            if DrawButton and Result then
            begin
                UpdateDrawData(DrawData, False);
                DrawButtonInCell(DrawData, DrawSelected);
            end;
        end;
    end;
end;

function TtsCustomDBGrid.GetCanSetCurrentRec: Boolean;
begin
    Result := (FCanSetCurrentRec = 0)
end;

procedure TtsCustomDBGrid.SetCanSetCurrentRec(Value: Boolean);
begin
    if not Value then
        Inc(FCanSetCurrentRec)
    else if FCanSetCurrentRec > 0 then
        Dec(FCanSetCurrentRec);
end;

procedure TtsCustomDBGrid.SetCanSynchronize(Value: Boolean);
begin
    if not Value then
        Inc(FCanSynchronize)
    else if FCanSynchronize > 0 then
        Dec(FCanSynchronize);
end;

function TtsCustomDBGrid.GetCanSynchronize: Boolean;
begin
    Result := (FCanSynchronize = 0)
end;

function  TtsCustomDBGrid.GetInSyncDataset: Boolean;
begin
    Result := (FInSyncDataset <> 0)
end;

procedure TtsCustomDBGrid.SetInSyncDataset(Value: Boolean);
begin
    if Value then
        Inc(FInSyncDataset)
    else if FInSyncDataset > 0 then
        Dec(FInSyncDataset);
end;

function  TtsCustomDBGrid.GetInDatasetEvent: Boolean;
begin
    Result := (FInDatasetEvent <> 0)
end;

procedure TtsCustomDBGrid.SetInDatasetEvent(Value: Boolean);
begin
    if Value then
        Inc(FInDatasetEvent)
    else if FInDatasetEvent > 0 then
        Dec(FInDatasetEvent);
end;

procedure TtsCustomDBGrid.SetIgnoreDatasetScrolled(Value: Boolean);
begin
    if Value then
        Inc(FIgnoreDatasetScrolled)
    else if FIgnoreDatasetScrolled > 0 then
        Dec(FIgnoreDatasetScrolled);
end;

function TtsCustomDBGrid.GetIgnoreDatasetScrolled: Boolean;
begin
    Result := (FIgnoreDatasetScrolled <> 0)
end;

procedure TtsCustomDBGrid.SetCanGetCurrentCell(Value: Boolean);
begin
    if not Value then
        Inc(FCanGetCurrentCell)
    else if FCanGetCurrentCell > 0 then
        Dec(FCanGetCurrentCell);
end;

function TtsCustomDBGrid.GetCanGetCurrentCell: Boolean;
begin
    Result := (FCanGetCurrentCell = 0)
end;

procedure TtsCustomDBGrid.AdjustTopLeft(ACol, ARow: Longint; DoPaint: Boolean);
begin
    if (GridTopRow = ARow) and (LeftCol = ACol) then Exit;

    if not DoPaint then EnablePaint := False;
    try
        MoveTopLeft(ACol, ARow);
    finally
        if not DoPaint then EnablePaint := True;
    end;
end;

procedure TtsCustomDBGrid.ScrollToPosition(Position: TtsDataPosition);
begin
    if (Position = dpBottom) and (FGridData.AtEnd) and (GridTopRow >= GetMaxTopRow) then Exit;
    if (Position = dpTop) and (FGridData.AtStart) and (GridTopRow = FixedRows) then Exit;

    HideControlBeforeScroll(not IsFocused);
    MoveToPosition(Position, True);
end;

procedure TtsCustomDBGrid.MoveToPosition(Position: TtsDataPosition; ByUser: Boolean);
var
    DoUpdate: Boolean;
begin
    DoUpdate := False;
    if (Position = dpBottom) and
       ((not ByUser) or (not FGridData.AtEnd) or (GridTopRow < GetMaxTopRow)) then
    begin
        if (not ByUser) or (not FGridData.AtEnd) then FGridData.MoveLast;
        UpdateRowCount(False);
        AdjustTopLeft(LeftCol, FGridData.BufferRows - VisibleRowCount + 1 + InsertionRow, False);
        UpdateScrollRange;
        DoUpdate := True;
    end
    else if (Position = dpTop) and
            ((not ByUser) or (not FGridData.AtStart) or (GridTopRow <> FixedRows)) then
    begin
        if (not ByUser) or (not FGridData.AtStart) then FGridData.MoveFirst;
        UpdateRowCount(False);
        AdjustTopLeft(LeftCol, FixedRows, False);
        UpdateScrollRange;
        DoUpdate := True;
    end;

    if DoUpdate then
    begin
        EnablePaint := False;
        try
            PositionCurrentRec(CurDisplayCol, FCurBookmark, False, True);
        finally
            EnablePaint := True;
        end;
        Invalidate;
    end;

    CheckTopLeftChanged(ByUser);
end;

procedure TtsCustomDBGrid.ScrollBarScroll(MoveBy: Longint);
begin
    if MoveBy = 0 then Exit;
    HideControlBeforeScroll(not IsFocused);
    DBScroll(0, MoveBy, smWindow, True);
    CheckTopLeftChanged(True);
end;

procedure TtsCustomDBGrid.DBScrollWindow(DX, DY: Longint);
begin
    if (DX = 0) then
    begin
        if DY < 0 then
            ScrollUp(DY)
        else if DY > 0 then
            ScrollDown(DY);
    end
    else
        ScrollData(DX, DY);
end;

procedure TtsCustomDBGrid.DBScrollControl(DX, DY: Longint);
begin
    if DX = 0 then
    begin
        if EqualRect(FGridControlRect, FNullRect)
            then ScrollRowSelect(DY)
            else ScrollControlVertical(DY)
    end
    else
        ScrollData(DX, DY);
end;

procedure TtsCustomDBGrid.DBScrollRowSelect(DY: Longint);
begin
    ScrollRowSelect(DY);
end;

function TtsCustomDBGrid.ScrollWidth(ScrollCols: Longint): Integer;
var
    I: Longint;
begin
    Result := 0;
    if ScrollCols > 0 then
    begin
        for I := 1 to ScrollCols do
        begin
            if LeftCol + I - 1 > Cols then Break;
            Result := Result - ColWidths[LeftCol + I - 1];
        end;
    end
    else if ScrollCols < 0 then
    begin
        for I := 1 to Abs(ScrollCols) do
        begin
            if LeftCol - I < 1 then Break;
            Result := Result + ColWidths[LeftCol - I];
        end;
    end;
end;

procedure TtsCustomDBGrid.DBScroll(ScrollCols, ScrollRows: Longint; ScrollMode: TtsScrollMode;
                                   SetCurrent: Boolean);
var
    DX, DY: Integer;
    NewRow: Longint;
    DisableFocus: Boolean;
begin
    if not CanPaint then
    begin
        Invalidate;
        if SetCurrent then PositionCurrentRec(CurDisplayCol, FCurBookmark, False, False);
        Exit;
    end;

    if ((ScrollRows <> 0) and (Abs(ScrollRows) >= VisibleRowCount)) or
       ((ScrollCols <> 0) and (Abs(ScrollCols) >= VisibleColCount)) then
    begin
        Invalidate;
        if SetCurrent then PositionCurrentRec(CurDisplayCol, FCurBookmark, False, False);
        Update;
        Exit;
    end;

    DY := -ScrollRows * DefaultRowHeight;
    DX := ScrollWidth(ScrollCols);

    DisableFocus := False;
    if SetCurrent then
    begin
        NewRow := FGridData.BufferRow(FCurBookmark);
        if (NewRow = 0) and (CurDisplayRow <> 0) then
        begin
            PositionCurrentRec(CurDisplayCol, FCurBookmark, False, (Abs(ScrollRows) = 1));
            SetCurrent := False;
        end
        else if (NewRow <> 0) and (NewRow <> CurDisplayRow) then
            DisableFocus := True;
    end;

    if (DX <> 0) or (DY <> 0) then ResetButton;
    SetScrollMode(ScrollMode);
    if DisableFocus then FocusRectDisabled := True;
    try
        case ScrollMode of
            smWindow:      DBScrollWindow(DX, DY);
            smGridControl: DBScrollControl(DX, DY);
            smRowSelect:   DBScrollRowSelect(DY);
        end;
    finally
        if DisableFocus then FocusRectDisabled := False;
        ResetScrollMode;
    end;

    if SetCurrent then
        PositionCurrentRec(CurDisplayCol, FCurBookmark, False, (Abs(ScrollRows) = 1));
end;

function TtsCustomDBGrid.ScrollLineUp(Count: Longint; CheckEdit: Boolean;
                                      CheckSelect: Boolean; var ScrollCount, NewRow,
                                      NewTopRow: Longint): Longint;
var
    MoveCount: Longint;
    MovedByActive: Longint;
    prevBkm : String;
begin
    Result := 0;
    if UseStandardScrolling then
    begin
        if Datalink.Active and
           (not Datalink.Dataset.BOF and
            Self.FGridData.PrevBookmark(VarToStr(CurrentDataRow), prevBkm)) then
           Result := Count;
        ScrollCount := Result;
        NewRow := CurDataRow;
        NewTopRow := GridTopRow;
    end
    else
    begin
        FGridData.ActiveRecord := CurDataRow;
        MoveCount := FGridData.MoveActive(-Count, MovedByActive);
        UpdateRowCount(True);

        if MoveCount <> 0 then
        begin
            NewRow := CurDataRow + MoveCount - MovedByActive;
            if NewRow < 1 then NewRow := 1;

            Result := Abs(MoveCount);
            ScrollCount := CalcMax(0, Result - (CurDataRow - GridTopRow));
            NewTopRow := GridTopRow;
            if NewRow < GridTopRow then NewTopRow := CalcMax(NewRow, FixedRows);
        end;
    end;

    if Result = 0 then UpdateScrollPos;
end;

function TtsCustomDBGrid.KeyPageUp(Count: Longint; CheckEdit: Boolean;
                                   CheckSelect: Boolean; var NewRow: Longint): Longint;
var
    MoveCount: Longint;
    MovedBy: Longint;
    MovedByActive: Longint;
    DiffTop: Integer;
begin
    Result := 0;
    if Count = 0 then Exit;

    if UseStandardScrolling then
    begin
        DiffTop := 0;
        MoveCount := 0;
        if Datalink.Active and not Datalink.Dataset.BOF then MoveCount := Count;
        NewRow := CurDataRow;
    end
    else
    begin
        DiffTop := GridTopRow - FixedRows;
        Dec(Count, DiffTop);
        NewRow := CurDataRow - DiffTop;
        MoveCount := FGridData.MoveBy(-Count);

        if Abs(MoveCount) <> Count then
        begin
            FGridData.ActiveRecord := CurDataRow;
            MovedBy := FGridData.MoveActive(-Count + Abs(MoveCount), MovedByActive);
            NewRow := NewRow + MovedBy;
            Inc(MoveCount, MovedBy);
        end;
    end;

    UpdateRowCount(True);
    if MoveCount <> 0 then
    begin
        if NewRow < 1 then NewRow := 1;
        Result := Abs(MoveCount) + DiffTop;
    end;
end;

function TtsCustomDBGrid.KeyHomeUp(CheckEdit: Boolean; CheckSelect: Boolean;
                                   var NewRow: Longint; var DoUpdateScrollRange: Boolean): Longint;
begin
    NewRow := 1;
    Result := Abs(NewRow - CurDataRow);
    DoUpdateScrollRange := False;

    if UseStandardScrolling then
    begin
        if not Datalink.Dataset.BOF then Result := MaxShortInt;
    end
    else if (not FGridData.AtStart) then
    begin
        FGridData.MoveFirst;
        UpdateRowCount(False);
        DoUpdateScrollRange := True;
        Result := MaxShortInt;
    end;
end;

function TtsCustomDBGrid.ScrollLineDown(Count: Longint; CheckEdit: Boolean; CheckSelect: Boolean;
                                        var ScrollCount, NewRow, NewTopRow: Longint): Longint;
var
    MoveCount: Longint;
    MovedByActive, MovedBy: Longint;
    VisibleRows: Integer;
    nextBkm : String;
begin
    Result := 0;

    if UseStandardScrolling then
    begin
        if Datalink.Active and
           (not Datalink.Dataset.EOF and
            Self.FGridData.NextBookmark(VarToStr(CurrentDataRow), nextBkm)) then
           Result := Count;
        ScrollCount := Result;
        NewRow := CurDataRow;
        NewTopRow := GridTopRow;
    end
    else
    begin
        FGridData.ActiveRecord := CurDataRow;
        MoveCount := FGridData.MoveActive(Count, MovedByActive);
        UpdateRowCount(True);

        if MoveCount <> 0 then
        begin
            NewRow := CurDataRow + MoveCount - MovedByActive;
            VisibleRows := CalcMax(1, VisibleRowCount);
            if (NewRow > VisibleRows) then
            begin
                MovedBy := FGridData.MoveBy(NewRow - VisibleRows);
                UpdateRowCount(True);
                NewRow := CalcMin(NewRow - MovedBy, FGridData.BufferRows);
            end;

            Result := Abs(MoveCount);
            if Result = 0 then UpdateScrollPos;

            ScrollCount := CalcMax(0, Result - (GridTopRow + VisibleRows - 1 - CurDataRow));
            NewTopRow := GridTopRow;
            if NewRow >= GridTopRow + VisibleRows then
                NewTopRow := CalcMax(NewRow - VisibleRows + 1, FixedRows);
        end;
    end;

    if Result = 0 then UpdateScrollPos;
end;

function TtsCustomDBGrid.KeyPageDown(Count: Longint; CheckEdit: Boolean;
                                     CheckSelect: Boolean; var NewRow: Longint): Longint;
var
    MoveCount: Longint;
    MovedBy: Longint;
    MovedByActive: Longint;
begin
    Result := 0;
    if Count = 0 then Exit;

    if UseStandardScrolling then
    begin
        MoveCount := 0;
        if Datalink.Active and not Datalink.Dataset.EOF then MoveCount := Count;
        NewRow := CurDataRow;
    end
    else
    begin
        NewRow := CurDataRow;
        MoveCount := FGridData.MoveBy(Count);
        if MoveCount <> Count then
        begin
            FGridData.ActiveRecord := CurDataRow;
            MovedBy := FGridData.MoveActive(Count - MoveCount, MovedByActive);
            NewRow := NewRow + MovedBy;
            Inc(MoveCount, MovedBy);
        end;
    end;

    UpdateRowCount(True);
    Result := Abs(MoveCount);
end;

function  TtsCustomDBGrid.KeyEndDown(CheckEdit: Boolean; CheckSelect: Boolean;
                                     var NewRow: Longint; var DoUpdateScrollRange: Boolean): Longint;
begin
    DoUpdateScrollRange := False;
    if UseStandardScrolling then
    begin
        Result := 0;
        NewRow := GridRows;
        if not Datalink.Dataset.EOF then Result := MaxShortInt;
    end
    else
    begin
        NewRow := FGridData.BufferRows;
        Result := Abs(NewRow - CurDataRow);

        if (not FGridData.AtEnd) then
        begin
            FGridData.MoveLast;
            UpdateRowCount(False);
            DoUpdateScrollRange := True;
            Result := MaxShortInt;
        end;
    end;
end;

function TtsCustomDBGrid.ScrollMoveUp(Count: Longint): Longint;
var
    ScrollCount: Longint;
begin
    ScrollCount := CalcMax(0, Count - (GridTopRow - FixedRows));
    Result := FGridData.MoveBy(-ScrollCount);
    UpdateRowCount(True);

    if (Result = 0) then
    begin
        if GridTopRow > FixedRows then
            AdjustTopLeft(LeftCol, CalcMax(FixedRows, GridTopRow - Count), True);
    end
    else
        AdjustTopLeft(LeftCol, FixedRows, False);
end;

function TtsCustomDBGrid.ScrollMoveDown(Count: Longint): Longint;
begin
    Result := FGridData.MoveBy(Count);
    UpdateRowCount(True);
    if (Result <> Count) and FGridData.AtEnd then
        AdjustTopLeft(LeftCol, GridTopRow + Count - Result, (Count = 1));
end;

function TtsCustomDBGrid.MoveToScrollPos(ScrollBarPos: Integer): Longint;
var
    Position: Longint;
    NewTopRow: Longint;
    Count: Longint;
begin
    Position := GetVertScrollRow(ScrollBarPos);
    Result := 0;
    Count := Position - (FScrollDataset.FBufFirstRow + GridTopRow - 1);
    if Count = 0 then Exit;

    if Count < 0 then
    begin
        NewTopRow := GridTopRow + Count;
        Result := FScrollDataset.MoveToRecnr(Position);
        UpdateRowCount(False);
        AdjustTopLeft(LeftCol, NewTopRow, False);
        UpdateScrollRange;
    end
    else
    begin
        Result := FScrollDataset.MoveToRecnr(Position);
        UpdateRowCount(False);
        if (Result <> Count) then
            AdjustTopLeft(LeftCol, GridTopRow + Count - Result, True);
        UpdateScrollRange;
    end;
end;

procedure TtsCustomDBGrid.CheckTopLeftChanged(ByUser: Boolean);
var
    TopBkm: Variant;
begin
    if not DataBound then begin inherited; Exit; end;

    TopBkm := FGridData.Bookmark[GridTopRow];
    try
        if (FOldLeftCol <> LeftCol) or (Active and (CompareBkm(FOldTopBkm, TopBkm) <> 0)) then
        begin
            UpdateScrollPos;
            DoTopLeftChanged(FOldLeftCol, FOldTopBkm, LeftCol, TopBkm, ByUser);
        end;
    finally
        FOldLeftCol := LeftCol;
        FOldTopBkm := TopBkm;
    end;
end;

procedure TtsCustomDBGrid.TopLeftChangedEvent(OldCol, OldRow, NewCol, NewRow: Longint;
                                              ByUser: Boolean);
begin
    if not DataBound then
    begin
        if (OldCol <> NewCol) or (OldRow <> NewRow) then
            DoTopLeftChanged(OldCol, OldRow, NewCol, NewRow, ByUser);
        Exit;
    end;
    CheckTopLeftChanged(ByUser);
end;

function TtsCustomDBGrid.CompareRecordIds(RecId1, RecId2: Variant): Integer;
begin
    Result := -2;
    try
        if CanUseRecordIds
            then Result := CompareRecId(RecId1, RecId2)
            else Result := CompareBkm(RecId1, RecId2);
    except
        on E:Exception do InvalidOp(E.Message);
    end;
end;

function TtsCustomDBGrid.RecordIDRow(RecID: Variant; UseId: Boolean): Integer;
begin
    if CanUseRecordIds and UseId then
        Result := FGridData.RecIDRow(RecID)
    else
        Result := FGridData.BufferRow(RecID);
end;

procedure TtsCustomDBGrid.RedrawRow(DataRow: Variant; UseId: Boolean; Prop: TtsProperty);
var
    Invalidated: Boolean;
    DisplayRow: Longint;
begin
    begin
        if not (csDestroying in ComponentState) then
        begin
            DisplayRow := RecordIDRow(DataRow, UseId);
            if (DisplayRow > 0) and (DisplayRow <= RowCount - 1) then
            begin
                if IsDrawProp(Prop) then
                    Invalidated := CheckInvalidateRow(DisplayRow)
                else
                begin
                    Invalidated := True;
                    InvalidateRow(DisplayRow)
                end;

                if Invalidated and (CurDisplayRow = DisplayRow) then
                    RedisplayControl(True);
            end;
        end;
    end;
end;

procedure TtsCustomDBGrid.ScrollDataInfo(DX, DY: Integer; var DrawInfo: TGridDrawInfo);
begin
    inherited ScrollDataInfo(DX, DY, DrawInfo);
end;

procedure TtsCustomDBGrid.SetGridMode(Value: TtsGridMode);
begin
    if (GridMode <> Value) and
       ((not UseStandardScrolling) or (Value <> gmEditInsert)) then
    begin
        inherited SetGridMode(Value);
        UpdateRowCount(True);
    end;
end;

procedure TtsCustomDBGrid.SetRowChangedIndicator(Value: TtsRowChangedIndicator);
begin
    if RowChangedIndicator <> Value then
    begin
        if (not DataBound) or (Value <> riOn)
            then inherited SetRowChangedIndicator(Value)
            else inherited SetRowChangedIndicator(riAutoReset);
    end;
end;

procedure TtsCustomDBGrid.PostData(Canceled: Boolean);
begin
    with DataLink.Dataset do
    begin
        if Canceled then Cancel
                    else CheckBrowseMode;
    end;
end;

function TtsCustomDBGrid.CanMoveDown: Boolean;
begin
    Result := True;
    if (FGridData.OnLastRecord) and
       (not DataLink.DataSet.Modified) and
       (not FDataModified) and
       (DataLink.DataSet.State = dsInsert) then Result := False;
end;

procedure TtsCustomDBGrid.KeyScrollRowSelect(MoveBy: Integer);
begin
    FScrollSelected := True;
    try
        Datalink.Dataset.MoveBy(MoveBy)
    finally
        FScrollSelected := False;
    end;
end;

procedure TtsCustomDBGrid.KeyFirstRowSelect(Redraw: Boolean);
begin
    if not Redraw then EnablePaint := False;
    FScrollSelected := True;
    try
        Datalink.Dataset.First;
    finally
        if not Redraw then EnablePaint := True;
        FScrollSelected := False;
    end;
end;

procedure TtsCustomDBGrid.KeyLastRowSelect(Redraw: Boolean);
begin
    if not Redraw then EnablePaint := False;
    FScrollSelected := True;
    try
        Datalink.Dataset.Last;
    finally
        if not Redraw then EnablePaint := True;
        FScrollSelected := False;
    end;
end;

procedure TtsCustomDBGrid.RepositionRowSelect(ScrollCount: Integer; NewCol, NewRow,
                                              NewLeftCol, NewTopRow: Longint);
var
    NewBkm: TBookmarkStr;
    CompRes: Integer;
    RowsSelected: Boolean;
begin
    RowsSelected := (GridStatus = grRowSelect);
    if (ScrollCount <> 0) then
    begin
        if RowsSelected then
        begin
            InvertSavedRows(1, FCurDisplayRow - 1);
            InvertSavedRows(FCurDisplayRow + 1, RowCount - 1);
            FDBSelectedRows.ResetAll;
            NewBkm := FGridData.Bookmark[NewRow];
            FDBSelectedRows.UpdateSelection(NewBkm, NewBkm, True);
            FLastAddedBookmark := NewBkm;
            FLastAddedBkmPos := CurBkmPos(FLastAddedBookmark);
        end;

        SetCurrentPosition(NewCol, NewRow, True, False);
        KeyScroll(NewLeftCol, NewTopRow, ScrollCount);
    end
    else
    begin
        NewBkm := FGridData.Bookmark[NewRow];
        CompRes := CompareBkm(NewBkm, FCurBookmark);

        if RowsSelected then
        begin
            if CompRes = 0 then
            begin
                InvertSavedRows(1, FCurDisplayRow - 1);
                InvertSavedRows(FCurDisplayRow + 1, RowCount - 1);
            end
            else
                InvertSavedRows(1, RowCount - 1);
            FDBSelectedRows.ResetAll;
        end;

        if (CompRes <> 0) and
           ((LeftCol <> NewLeftCol) or (GridTopRow <> NewTopRow)) then
        begin
            MoveTopLeft(NewLeftCol, NewTopRow);
            Update;
        end;

        if CompRes <> 0 then
        begin
            ClearCurrent(FCurDisplayRow);
            SetCurrentPositionAndDraw(NewCol, NewRow, True, True);
        end
        else
            SetCurrentPosition(NewCol, NewRow, True, False);

        if RowsSelected then
        begin
            FDBSelectedRows.UpdateSelection(NewBkm, NewBkm, True);
            if CompRes <> 0 then InvertSelectedRows(NewRow, NewRow, True);
            FLastAddedBookmark := NewBkm;
            FLastAddedBkmPos := CurBkmPos(FLastAddedBookmark);
        end;

        if (CompRes = 0) and
           ((LeftCol <> NewLeftCol) or (GridTopRow <> NewTopRow)) then
        begin
            MoveTopLeft(NewLeftCol, NewTopRow);
            Update;
        end;
    end;

    CheckRowColChanged;
    CheckTopLeftChanged(True);
end;

procedure TtsCustomDBGrid.ScrollReposition(RowScrollCount, NewLeftCol, NewTopRow: Longint;
                                           NewCurrentCol, NewCurrentRow: Longint;
                                           SetScrollMode, PaintEnabled: Boolean; ByUser: Boolean);
var
    Clear: Boolean;
    OldCurrentRow: Longint;
begin
    InScrollingMode := SetScrollMode;
    Clear := ((RowScrollCount = 0) and (NewLeftCol = LeftCol)) or
             ((CurDisplayRow <> NewCurrentRow) and (NewLeftCol <> LeftCol));

    if InEditMode then HideGridControl(Clear);

    if Clear then ClearCurrentFocusRect(True);
    OldCurrentRow := CurDisplayRow;
    SetControlSelectMode(tsAll);
    SetCurrentPosition(NewCurrentCol, NewCurrentRow, True, False);
    if OldCurrentRow = NewCurrentRow then ClearCellBuffer;

    if not PaintEnabled then EnablePaint := False;
    try
        KeyScroll(NewLeftCol, NewTopRow, RowScrollCount);
        ShowGridControl;
        DrawCurrentFocusRect(False);
        CheckRowColChanged;
        Update;

        if Clear then ClearCurrent(OldCurrentRow);
        if IsRowSelected(CurDisplayRow) then DrawCurrentSelected(CurDisplayRow)
                                        else DrawCurrent(CurDisplayRow);
    finally
        if not PaintEnabled then EnablePaint := True;
    end;

    CheckTopLeftChanged(ByUser);
end;

procedure TtsCustomDBGrid.VK_UpRowSelect;
var
    NewCurrentRow: Longint;
    NewTopRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
    InAppend: Boolean;
begin
    if not DataBound then begin inherited; Exit end;
    if not CanMoveToPos(CurDisplayCol, CurDisplayRow) then Exit;

    if CurDisplayRow <= 0 then Exit;
    InAppend := FDataEditMode = demAppend;
    if not CheckEndEdit(GetDataCol(CurDisplayCol), -1, True) then Exit;
    if InAppend and not FDataPosted then Exit;

    SaveSelectedRows(0);
    MovedBy := ScrollLineUp(1, CanSkipReadOnly, False, ScrollCount, NewCurrentRow, NewTopRow);
    if MovedBy = 0 then Exit;

    if UseStandardScrolling 
        then KeyScrollRowSelect(-1)
        else RepositionRowSelect(-ScrollCount, CurDisplayCol, NewCurrentRow,
                                 LeftCol, NewTopRow);
end;

procedure TtsCustomDBGrid.KeyDownVK_Up;
var
    NewCurrentRow: Longint;
    NewTopRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
    InAppend: Boolean;
begin
    if not DataBound then begin inherited; Exit end;
    if not CanMoveToPos(CurDisplayCol, CurDisplayRow) then Exit;

    if not InEditMode and not FocusRectActive then
    begin
        VK_UpRowSelect;
        Exit;
    end;

    if CurDisplayRow <= 0 then Exit;
    InAppend := FDataEditMode = demAppend;
    if not CheckEndEdit(GetDataCol(CurDisplayCol), -1, True) then Exit;
    if InAppend and not FDataPosted then Exit;

    MovedBy := ScrollLineUp(1, CanSkipReadOnly, False, ScrollCount, NewCurrentRow, NewTopRow);
    if MovedBy = 0 then Exit;

    if UseStandardScrolling
        then Datalink.Dataset.Prior
        else ScrollReposition(-ScrollCount, LeftCol, NewTopRow, CurDisplayCol,
                              NewCurrentRow, True, True, True);
end;

procedure TtsCustomDBGrid.VK_PriorRowSelect;
var
    NewTopRow: Longint;
    NewCurrentRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
begin
    SaveSelectedRows(0);
    MovedBy := KeyPageUp(VisibleRowCount, CanSkipReadOnly, False, NewCurrentRow);
    if MovedBy = 0 then Exit;

    if UseStandardScrolling then
        KeyScrollRowSelect(-MovedBy)
    else
    begin
        ScrollCount := CalcMax(0, MovedBy - (CurDataRow - NewCurrentRow));
        NewTopRow := GridTopRow;
        if CurDataRow - MovedBy < GridTopRow then
            NewTopRow := CalcMax(CurDataRow - MovedBy, FixedRows);
        RepositionRowSelect(-ScrollCount, CurDisplayCol, NewCurrentRow, LeftCol, NewTopRow);
    end;
end;

procedure TtsCustomDBGrid.KeyDownVK_Prior;
var
    NewCurrentRow: Longint;
    NewTopRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
begin
    if not DataBound then begin inherited; Exit end;
    if not CanMoveToPos(CurDisplayCol, CurDisplayRow) then Exit;

    if not InEditMode and not FocusRectActive then
    begin
        VK_PriorRowSelect;
        Exit;
    end;

    if CurDisplayRow <= 0 then Exit;
    if not CheckEndEdit(GetDataCol(CurDisplayCol), -1, True) then Exit;

    MovedBy := KeyPageUp(VisibleRowCount, CanSkipReadOnly, False, NewCurrentRow);
    if MovedBy = 0 then Exit;

    if UseStandardScrolling then
        Datalink.Dataset.MoveBy(-MovedBy)
    else
    begin
        ScrollCount := CalcMax(0, MovedBy - (CurDataRow - NewCurrentRow));
        NewTopRow := GridTopRow;
        if CurDataRow - MovedBy < GridTopRow then
            NewTopRow := CalcMax(CurDataRow - MovedBy, FixedRows);
        ScrollReposition(-ScrollCount, LeftCol, NewTopRow, CurDisplayCol,
                         NewCurrentRow, True, True, True);
    end;
end;

procedure TtsCustomDBGrid.VK_CtrlUpRowSelect;
var
    NewTopRow: Longint;
    NewCurrentRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
    DoUpdateScrollRange: Boolean;
begin
    SaveSelectedRows(0);
    DoUpdateScrollRange := False;
    try
        MovedBy := KeyHomeUp(CanSkipReadOnly, False, NewCurrentRow, DoUpdateScrollRange);
        if MovedBy = 0 then Exit;

        if UseStandardScrolling then
            KeyFirstRowSelect(False)
        else
        begin
            ScrollCount := CalcMax(0, MovedBy - (CurDataRow - NewCurrentRow));
            NewTopRow := FixedRows;
            RepositionRowSelect(-ScrollCount, CurDisplayCol, NewCurrentRow, LeftCol,
                                NewTopRow);
        end;
    finally
        if DoUpdateScrollRange then UpdateScrollRange;
    end;
end;

procedure TtsCustomDBGrid.KeyCtrl_Up;
var
    NewCurrentRow: Longint;
    NewTopRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
    DoUpdateScrollRange: Boolean;
begin
    if not DataBound then begin inherited; Exit end;
    if not CanMoveToPos(CurDisplayCol, CurDisplayRow) then Exit;

    if not InEditMode and not FocusRectActive then
    begin
        VK_CtrlUpRowSelect;
        Exit;
    end;

    if not CheckEndEdit(GetDataCol(CurDisplayCol), -1, True) then Exit;

    DoUpdateScrollRange := False;
    try
        MovedBy := KeyHomeUp(CanSkipReadOnly, False, NewCurrentRow, DoUpdateScrollRange);
        if MovedBy = 0 then Exit;

        if UseStandardScrolling then
            Datalink.Dataset.First
        else
        begin
            ScrollCount := CalcMax(0, MovedBy - (CurDataRow - NewCurrentRow));
            NewTopRow := FixedRows;
            ScrollReposition(-ScrollCount, LeftCol, NewTopRow, CurDisplayCol,
                             NewCurrentRow, True, True, True);
        end;
    finally
        if DoUpdateScrollRange then UpdateScrollRange;
    end;
end;

procedure TtsCustomDBGrid.VK_HomeRowSelect;
var
    NewLeftCol: Longint;
    NewCurrentCol, NewCurrentRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
    DoUpdateScrollRange: Boolean;
begin
    SaveSelectedRows(0);
    DoUpdateScrollRange := False;
    try
        NewCurrentCol := LeftMostCol(InEditMode, False);
        NewLeftCol := MoveToDisplayCol(LeftCol, NewCurrentCol, vpRight);
        MovedBy := KeyHomeUp(CanSkipReadOnly, False, NewCurrentRow, DoUpdateScrollRange);
        if (MovedBy = 0) and (NewLeftCol = LeftCol) then Exit;

        NewLeftCol := MoveToDisplayCol(LeftCol, NewCurrentCol, vpRight);

        if UseStandardScrolling then
        begin
            EnablePaint := False;
            try
                ScrollReposition(0, NewLeftCol, FixedRows, NewCurrentCol,
                                 CurDisplayRow, True, True, True);
                KeyFirstRowSelect(False);
            finally
                EnablePaint := True;
            end;
        end
        else
        begin
            ScrollCount := CalcMax(0, MovedBy - (CurDataRow - NewCurrentRow));
            RepositionRowSelect(-ScrollCount, NewCurrentCol, NewCurrentRow,
                                NewLeftCol, FixedRows);
        end;
    finally
        if DoUpdateScrollRange then UpdateScrollRange;
    end;
end;

procedure TtsCustomDBGrid.KeyCtrl_Home;
var
    NewCurrentCol, NewCurrentRow: Longint;
    NewLeftCol: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
    DoUpdateScrollRange: Boolean;
begin
    if not DataBound then begin inherited; Exit end;
    if not CanMoveToPos(CurDisplayCol, CurDisplayRow) then Exit;

    if not InEditMode and not FocusRectActive then
    begin
        VK_HomeRowSelect;
        Exit;
    end;

    if not CheckEndEdit(GetDataCol(CurDisplayCol), -1, True) then Exit;

    DoUpdateScrollRange := False;
    try
        NewCurrentCol := LeftMostCol(InEditMode, False);
        MovedBy := KeyHomeUp(CanSkipReadOnly, False, NewCurrentRow, DoUpdateScrollRange);
        if (MovedBy = 0) and (NewCurrentCol = CurDisplayCol) then Exit;

        NewLeftCol := MoveToDisplayCol(LeftCol, NewCurrentCol, vpRight);

        if UseStandardScrolling then
        begin
            EnablePaint := False;
            try
                ScrollReposition(0, NewLeftCol, FixedRows, NewCurrentCol,
                                 CurDisplayRow, True, True, True);
                Datalink.Dataset.First;
            finally
                EnablePaint := True;
            end;
        end
        else
        begin
            ScrollCount := CalcMax(0, MovedBy - (CurDataRow - NewCurrentRow));
            ScrollReposition(-ScrollCount, NewLeftCol, FixedRows, NewCurrentCol,
                             NewCurrentRow, True, True, True);
        end;
    finally
        if DoUpdateScrollRange then UpdateScrollRange;
    end;
end;

procedure TtsCustomDBGrid.SaveSelectedRows(DistanceScrolled: Integer);
var
    I: Longint;
    Offset: Integer;
    StartRow, EndRow: Integer;
begin
    if not Assigned(FSavedSelectedRows) then
        FSavedSelectedRows := TBits.Create;
    if FSavedSelectedRows.Size <> GridRows + 1 then
        FSavedSelectedRows.Size := GridRows + 1;

    with FGridData, FDBSelectedRows do
    begin
        StartRow := 1;
        EndRow := GridRows;
        Offset := 0;
        if UseStandardScrolling and (DistanceScrolled <> 0) then
        begin
            Offset := DistanceScrolled;
            StartRow := CalcMax(1, 1 - Offset);
            EndRow := CalcMin(GridRows, GridRows - Offset);
        end;

        for I := 1 to GridRows do
            FSavedSelectedRows[I] := False;

        for I := StartRow to EndRow do
        begin
            if GetSelected(Bookmark[I])
                then FSavedSelectedRows[I + Offset] := True
                else FSavedSelectedRows[I + Offset] := False;
        end;
    end;
end;

procedure TtsCustomDBGrid.InvertSavedRows(FromRow, ToRow: Longint);
var
    I: Longint;
    Dc: Hdc;
begin
    Dc := GetDC(Handle);
    try
        for I := FromRow to ToRow do
        begin
            if (I > 0) and (I < FSavedSelectedRows.Size) and (I <= GridRows) then
            begin
                if FSavedSelectedRows[I] then InvertRow(I, False, Dc);
            end;
        end;
    finally
        ReleaseDC(Handle, Dc);
    end;
end;

procedure TtsCustomDBGrid.ToggleSavedRows(FromRow, ToRow: Longint; Select: Boolean);
var
    I: Longint;
    Dc: Hdc;
begin
    Dc := GetDC(Handle);
    try
        for I := FromRow to ToRow do
        begin
            if (I > 0) and (I < FSavedSelectedRows.Size) and (I <= GridRows) then
            begin
                with FGridData, FDBSelectedRows do
                begin
                    if (FSavedSelectedRows[I] <> Select) and
                       (IsRowSelected(I) = Select) then
                    begin
                        InvertRow(I, Select, Dc);
                    end;
                end;
            end;
        end;
    finally
        ReleaseDC(Handle, Dc);
    end;
end;

procedure TtsCustomDBGrid.ToggleChangedRows(FromRow, ToRow: Longint);
var
    I: Longint;
    Dc: Hdc;
begin
    Dc := GetDC(Handle);
    try
        for I := FromRow to ToRow do
        begin
            if (I > 0) and (I < FSavedSelectedRows.Size) and (I <= GridRows) then
            begin
                with FGridData, FDBSelectedRows do
                begin
                    if FSavedSelectedRows[I] <> IsRowSelected(I) then
                        InvertRow(I, not FSavedSelectedRows[I], Dc);
                end;
            end;
        end;
    finally
        ReleaseDC(Handle, Dc);
    end;
end;

function TtsCustomDBGrid.ActivateDoGetDrawInfo: Boolean;
begin
    Result := Assigned(OnGetDrawInfo);
end;

function TtsCustomDBGrid.GiveDBCellFont(DisplayCol: Longint; DataRow: Variant): TFont;
var
    DataCol: Longint;
begin
    DataCol := GetDataCol(DisplayCol);
    Result := CellFont[DataCol, DataRow];

    if Result = nil then
    begin
        if FDrawOverlap = doDrawColOnTop then
        begin
            Result := GridCols[DataCol].Font;
            if Result = nil then Result := RowFont[DataRow];
            if Result = nil then Result := Font;
        end
        else
        begin
            Result := RowFont[DataRow];
            if Result = nil then Result := GridCols[DataCol].Font;
            if Result = nil then Result := Font;
        end;
    end;
end;

function TtsCustomDBGrid.GiveDBCellWordWrap(DisplayCol: Longint; DataRow: Variant): TtsWordWrap;
var
    DataCol: Longint;
begin
    DataCol := GetDataCol(DisplayCol);
    Result := CellWordWrap[DataCol, DataRow];

    if Result = wwDefault then
    begin
        if FDrawOverlap = doDrawColOnTop then
        begin
            Result := GridCols[DataCol].WordWrap;
            if Result = wwDefault then Result := RowWordWrap[DataRow];
            if Result = wwDefault then Result := WordWrap;
        end
        else
        begin
            Result := RowWordWrap[DataRow];
            if Result = wwDefault then Result := GridCols[DataCol].WordWrap;
            if Result = wwDefault then Result := WordWrap;
        end;
    end;
end;

function TtsCustomDBGrid.GiveDBCellAlignment(DisplayCol: Longint; DataRow: Variant): TAlignment;
var
    DataCol: Longint;
begin
    DataCol := GetDataCol(DisplayCol);

    if CellAlign[DataCol, DataRow] then
        Result := CellAlignment[DataCol, DataRow]
    else if FDrawOverlap = doDrawColOnTop then
    begin
        if GridCols[DataCol].Align then
            Result := GridCols[DataCol].Alignment
        else if RowAlign[DataRow] then
            Result := RowAlignment[DataRow]
        else
            Result := GridCols[DataCol].Alignment;
    end
    else
    begin
        if RowAlign[DataRow] then
            Result := RowAlignment[DataRow]
        else
            Result := GridCols[DataCol].Alignment;
    end;
end;

function TtsCustomDBGrid.GiveDBCellButton(DisplayCol: Longint; DataRow: Variant; var Style: TtsDropDownStyle): TtsButtonType;
var
    DataCol : Longint;
    ButtonType: TtsButtonType;
begin
    Result := btNone;
    Style := ddDropDown;

    DataCol := GetDataCol(DisplayCol);
    if FReadOnlyButton or CanEditDBCell(DataCol, DataRow) then
    begin
        ButtonType := CellButtonType[DataCol, DataRow];
        if ButtonType <> btDefault then
        begin
            Result := ButtonType;
            Style := CellDropDownStyle[DataCol, DataRow];
        end
        else if DrawOverlap = doDrawColOnTop then
        begin
            if GridCols[DataCol].ButtonType <> btDefault then
            begin
                Result := GridCols[DataCol].ButtonType;
                Style := GridCols[DataCol].DropDownStyle;
            end
            else if RowButtonType[DataRow] <> btDefault then
            begin
                Result := RowButtonType[DataRow];
                Style := RowDropDownStyle[DataRow];
            end;
        end
        else
        begin
            if RowButtonType[DataRow] <> btDefault then
            begin
                Result := RowButtonType[DataRow];
                Style := RowDropDownStyle[DataRow];
            end
            else if GridCols[DataCol].ButtonType <> btDefault then
            begin
                Result := GridCols[DataCol].ButtonType;
                Style := GridCols[DataCol].DropDownStyle;
            end
        end;
    end;
end;

function TtsCustomDBGrid.GiveDBCellMaskName(DataCol: Longint; DataRow: Variant): string;
begin
    Result := '';
    if (DataCol <= 0) or (DataCol > Cols) then Exit;

    Result := CellMaskName[DataCol, DataRow];
    if Result = '' then
    begin
        if FDrawOverlap = doDrawColOnTop then
        begin
            Result := GridCols[DataCol].MaskName;
            if Result = '' then Result := RowMaskName[DataRow];
        end
        else
        begin
            Result := RowMaskName[DataRow];
            if Result = '' then Result := GridCols[DataCol].MaskName;
        end;
    end;
end;

function TtsCustomDBGrid.GiveDBCellControlType(DataCol: Longint; DataRow: Variant): TtsControlType;
begin
    Result := ctNone;
    if (DataCol <= 0) or (DataCol > Cols) then Exit;

    Result := CellControlType[DataCol, DataRow];
    if Result = ctDefault then
    begin
        if FDrawOverlap = doDrawColOnTop then
        begin
            Result := GridCols[DataCol].ControlType;
            if Result = ctDefault then Result := RowControlType[DataRow];
        end
        else
        begin
            Result := RowControlType[DataRow];
            if Result = ctDefault then Result := GridCols[DataCol].ControlType;
        end;
    end;

    if Result = ctDefault then Result := ctText;
end;

function TtsCustomDBGrid.GiveDBCellCombo(DataCol: Longint; DataRow: Variant): TtsCombo;
begin
    Result := nil;
    if (DataCol <= 0) or (DataCol > Cols) then Exit;

    if (CellButtonType[DataCol,DataRow] = btCombo) and
       (not CellParentCombo[DataCol,DataRow] or InDesignMode) then
    begin
        Result := CellCombo[DataCol, DataRow]
    end
    else
    begin
        if FDrawOverlap = doDrawColOnTop then
        begin
            if (GridCols[DataCol].ButtonType = btCombo) and
               (not GridCols[DataCol].ParentCombo or InDesignMode) then
                Result := GridCols[DataCol].Combo
            else if RowButtonType[DataRow] = btCombo then
                Result := RowCombo[DataRow];
        end
        else
        begin
            if (RowButtonType[DataRow] = btCombo) and
               (not RowParentCombo[DataRow] or InDesignMode) then
                Result := RowCombo[DataRow]
            else if GridCols[DataCol].ButtonType = btCombo then
                Result := GridCols[DataCol].Combo;
        end;
    end;
end;

function TtsCustomDBGrid.GiveDBCellReadOnly(DataCol: Longint; DataRow: Variant): Boolean;
var
    ReadOnly: TtsReadOnly;
    IsVisible: Boolean;
begin
    Result := False;
    if (DataCol <= 0) or (DataCol > Cols) then Exit;

    ReadOnly := CellReadOnly[DataCol, DataRow];
    IsVisible := Col[DataCol].Visible and RowVisible[DataRow];
    if ReadOnly = roDefault
        then Result := (not IsVisible) or Col[DataCol].ReadOnly or RowReadOnly[DataRow]
        else Result := (not IsVisible) and (ReadOnly = roOn);
end;

function TtsCustomDBGrid.GiveDBCellSelected(DataCol: Longint; DataRow: Variant): Boolean;
begin
    Result := False;
    if (DataCol <= 0) or (DataCol > Cols) then Exit;
    Result := Col[DataCol].Selected or RowSelected[DataRow];
end;

function TtsCustomDBGrid.GiveDBCellCheckBoxValues(DataCol: Longint; DataRow: Variant): string;
begin
    Result := '';
    if not GridCols[DataCol].UseCheckBoxValues then Exit;

    Result := GridCols[DataCol].CheckBoxValues;
    if Result = '' then Result := CheckBoxValues;
end;

function TtsCustomDBGrid.ActiveControlType(DataCol: Longint; DataRow: Variant): TtsControlType;
begin
    Result := ctNone;
    if not DataBound then begin Result := inherited ActiveControlType(DataCol, DataRow); Exit; end;

    if CheckIndex(itCol, DataCol, 1, Cols) and CheckIdType(DataRow) then
        Result := GiveDBCellControlType(DataCol, DataRow);
end;

function TtsCustomDBGrid.ActiveCombo(DataCol: Longint; DataRow: Variant): TtsCombo;
begin
    Result := nil;
    if not DataBound then begin Result := inherited ActiveCombo(DataCol, DataRow); Exit; end;

    if CheckIndex(itCol, DataCol, 1, Cols) and CheckIdType(DataRow) then
        Result := GiveDBCellCombo(DataCol, DataRow);
end;

function TtsCustomDBGrid.CurCellMaskName: string;
begin
    if not DataBound then begin Result := inherited CurCellMaskName; Exit; end;
    Result := GiveDBCellMaskName(CurDataCol, CurrentRecordId);
end;

function TtsCustomDBGrid.CurCellControlType: TtsControlType;
begin
    if not DataBound then begin Result := inherited CurCellControlType; Exit; end;
    Result := GiveDBCellControlType(CurDataCol, CurrentRecordId);
end;

function  TtsCustomDBGrid.CurCellReadOnly: Boolean;
begin
    if not DataBound then begin Result := inherited CurCellReadOnly; Exit; end;
    Result := GiveDBCellReadOnly(CurDataCol, CurrentRecordId);
end;

function  TtsCustomDBGrid.CurCellSelected: Boolean;
begin
    if not DataBound then begin Result := inherited CurCellSelected; Exit; end;
    Result := GiveDBCellSelected(CurDataCol, FCurBookmark);
end;

function TtsCustomDBGrid.CurCellCheckBoxValues: string;
begin
    if not DataBound then begin Result := inherited CurCellCheckBoxValues; Exit; end;
    Result := GiveDBCellCheckBoxValues(CurDataCol, CurrentRecordId);
end;

function TtsCustomDBGrid.CanDrawInsert: Boolean;
begin
    Result := (Databound and not Active and InDesignMode and (EditMode = emEditInsert));
end;

function TtsCustomDBGrid.ButtonsActive: Boolean;
begin
    if not Databound then begin Result := inherited ButtonsActive; Exit; end;
    Result := Active or InDesignMode;
end;

procedure TtsCustomDBGrid.VK_DownRowSelect;
var
    NewCurrentRow: Longint;
    NewTopRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
    InInsert: Boolean;
begin
    if not DataBound then begin inherited; Exit end;
    if not CanMoveToPos(CurDisplayCol, CurDisplayRow) then Exit;

    FGridData.ActiveRecord := CurDataRow;
    if not CanMoveDown then Exit;

    InInsert := FDataEditMode = demInsert;
    if not CheckEndEdit(GetDataCol(CurDisplayCol), -1, True) then Exit;
    if InInsert and not FDataPosted then Exit;

    SaveSelectedRows(0);
    MovedBy := ScrollLineDown(1, CanSkipReadOnly, False, ScrollCount, NewCurrentRow, NewTopRow);
    if MovedBy = 0 then Exit;

    if UseStandardScrolling
        then KeyScrollRowSelect(MovedBy)
        else RepositionRowSelect(ScrollCount, CurDisplayCol, NewCurrentRow, LeftCol, NewTopRow);
end;

procedure TtsCustomDBGrid.KeyDownVK_Down;
var
    NewCurrentRow: Longint;
    NewTopRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
    InInsert: Boolean;
begin
    if not DataBound then begin inherited; Exit end;
    if not CanMoveToPos(CurDisplayCol, CurDisplayRow) then Exit;

    if not InEditMode and not FocusRectActive then
    begin
        VK_DownRowSelect;
        Exit;
    end;

    if CurDisplayRow <= 0 then Exit;
    FGridData.ActiveRecord := CurDataRow;
    if not CanMoveDown then Exit;

    InInsert := FDataEditMode = demInsert;
    if not CheckEndEdit(GetDataCol(CurDisplayCol), -1, True) then Exit;
    if InInsert and not FDataPosted then Exit;

    MovedBy := ScrollLineDown(1, CanSkipReadOnly, False, ScrollCount, NewCurrentRow, NewTopRow);
    if MovedBy = 0 then
    begin
        if (not FAsCombo) and (AutoInsert or (GridMode = gmEditInsert)) then
            Append;
        Exit;
    end;

    if UseStandardScrolling then
    begin
        MovedBy := Datalink.Dataset.MoveBy(MovedBy);
        if (MovedBy = 0) and (AutoInsert or (GridMode = gmEditInsert)) then
            Append;
    end
    else
        ScrollReposition(ScrollCount, LeftCol, NewTopRow, CurDisplayCol,
                         NewCurrentRow, True, True, True);
end;

procedure TtsCustomDBGrid.VK_NextRowSelect;
var
    NewCurrentRow: Longint;
    NewTopRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
begin
    SaveSelectedRows(0);
    MovedBy := KeyPageDown(VisibleRowCount, CanSkipReadOnly, False, NewCurrentRow);
    if MovedBy = 0 then Exit;

    if UseStandardScrolling then
        KeyScrollRowSelect(MovedBy)
    else
    begin
        ScrollCount := CalcMax(0, MovedBy - (NewCurrentRow - CurDataRow));
        NewTopRow := GridTopRow;
        if NewCurrentRow >= GridTopRow + VisibleRowCount then
            NewTopRow := CalcMax(NewCurrentRow - VisibleRowCount + 1, FixedRows);

        RepositionRowSelect(ScrollCount, CurDisplayCol, NewCurrentRow, LeftCol, NewTopRow);
    end;
end;

procedure TtsCustomDBGrid.KeyDownVK_Next;
var
    NewCurrentRow: Longint;
    NewTopRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
begin
    if not DataBound then begin inherited; Exit end;
    if not CanMoveToPos(CurDisplayCol, CurDisplayRow) then Exit;

    if not InEditMode and not FocusRectActive then
    begin
        VK_NextRowSelect;
        Exit;
    end;

    if CurDisplayRow <= 0 then Exit;
    if not CheckEndEdit(GetDataCol(CurDisplayCol), -1, True) then Exit;
    MovedBy := KeyPageDown(VisibleRowCount, CanSkipReadOnly, False, NewCurrentRow);
    if MovedBy = 0 then Exit;

    if UseStandardScrolling then
        Datalink.Dataset.MoveBy(MovedBy)
    else
    begin
        ScrollCount := CalcMax(0, MovedBy - (NewCurrentRow - CurDataRow));
        NewTopRow := GridTopRow;
        if NewCurrentRow >= GridTopRow + VisibleRowCount then
            NewTopRow := CalcMax(NewCurrentRow - VisibleRowCount + 1, FixedRows);

        ScrollReposition(ScrollCount, LeftCol, NewTopRow, CurDisplayCol,
                         NewCurrentRow, True, True, True);
    end;
end;

procedure TtsCustomDBGrid.VK_CtrlDownRowSelect;
var
    NewCurrentRow: Longint;
    NewTopRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
    DoUpdateScrollRange: Boolean;
begin
    SaveSelectedRows(0);
    DoUpdateScrollRange := False;
    try
        MovedBy := KeyEndDown(CanSkipReadOnly, False, NewCurrentRow, DoUpdateScrollRange);
        if MovedBy = 0 then Exit;

        if UseStandardScrolling then
            KeyLastRowSelect(False)
        else
        begin
            ScrollCount := CalcMax(0, MovedBy - (NewCurrentRow - CurDataRow));
            NewTopRow := CalcMax(NewCurrentRow - VisibleRowCount + 1, FixedRows);
            RepositionRowSelect(ScrollCount, CurDisplayCol, NewCurrentRow,
                                LeftCol, NewTopRow);
        end;
    finally
        if DoUpdateScrollRange then UpdateScrollRange;
    end;
end;

procedure TtsCustomDBGrid.KeyCtrl_Down;
var
    NewCurrentRow: Longint;
    NewTopRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
    DoUpdateScrollRange: Boolean;
begin
    if not DataBound then begin inherited; Exit end;
    if not CanMoveToPos(CurDisplayCol, CurDisplayRow) then Exit;

    if not InEditMode and not FocusRectActive then
    begin
        VK_CtrlDownRowSelect;
        Exit;
    end;

    if not CheckEndEdit(GetDataCol(CurDisplayCol), -1, True) then Exit;

    DoUpdateScrollRange := False;
    try
        MovedBy := KeyEndDown(CanSkipReadOnly, False, NewCurrentRow, DoUpdateScrollRange);
        if MovedBy = 0 then Exit;

        if UseStandardScrolling then
            Datalink.Dataset.Last
        else
        begin
            ScrollCount := CalcMax(0, MovedBy - (NewCurrentRow - CurDataRow));
            NewTopRow := CalcMax(NewCurrentRow - VisibleRowCount + 1, FixedRows);
            ScrollReposition(ScrollCount, LeftCol, NewTopRow, CurDisplayCol,
                             NewCurrentRow, True, True, True);
        end;
    finally
        if DoUpdateScrollRange then UpdateScrollRange;
    end;
end;

procedure TtsCustomDBGrid.VK_EndRowSelect;
var
    NewCurrentCol, NewCurrentRow: Longint;
    NewLeftCol, NewTopRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
    DoUpdateScrollRange: Boolean;
begin
    SaveSelectedRows(0);
    DoUpdateScrollRange := False;
    try
        NewCurrentCol := RightMostCol(InEditMode, False);
        NewLeftCol := MoveToDisplayCol(LeftCol, NewCurrentCol, vpNone);
        MovedBy := KeyEndDown(CanSkipReadOnly, False, NewCurrentRow, DoUpdateScrollRange);
        if (MovedBy = 0) and (NewLeftCol = LeftCol) then Exit;

        if UseStandardScrolling then
        begin
            EnablePaint := False;
            try
                ScrollReposition(0, NewLeftCol, FixedRows, NewCurrentCol,
                                 CurDisplayRow, True, True, True);
                KeyLastRowSelect(False);
            finally
                EnablePaint := True;
            end;
        end
        else
        begin
            ScrollCount := CalcMax(0, MovedBy - (NewCurrentRow - CurDataRow));
            NewTopRow := NewCurrentRow - VisibleRowCount + 1;
            RepositionRowSelect(ScrollCount, NewCurrentCol, NewCurrentRow,
                                NewLeftCol, NewTopRow);
        end;
    finally
        if DoUpdateScrollRange then UpdateScrollRange;
    end;
end;

procedure TtsCustomDBGrid.KeyCtrl_End;
var
    NewCurrentCol, NewCurrentRow: Longint;
    NewLeftCol, NewTopRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
    DoUpdateScrollRange: Boolean;
begin
    if not DataBound then begin inherited; Exit end;
    if not CanMoveToPos(CurDisplayCol, CurDisplayRow) then Exit;

    if not InEditMode and not FocusRectActive then
    begin
        VK_EndRowSelect;
        Exit;
    end;

    if not CheckEndEdit(GetDataCol(CurDisplayCol), -1, True) then Exit;

    DoUpdateScrollRange := False;
    try
        NewCurrentCol := RightMostCol(InEditMode, False);
        MovedBy := KeyEndDown(CanSkipReadOnly, False, NewCurrentRow, DoUpdateScrollRange);
        if (MovedBy = 0) and (NewCurrentCol = CurDisplayCol) then Exit;

        NewLeftCol := MoveToDisplayCol(LeftCol, NewCurrentCol, vpNone);

        if UseStandardScrolling then
        begin
            EnablePaint := False;
            try
                ScrollReposition(0, NewLeftCol, FixedRows, NewCurrentCol,
                                 CurDisplayRow, True, True, True);
                Datalink.Dataset.Last;
            finally
                EnablePaint := True;
            end;
        end
        else
        begin
            ScrollCount := CalcMax(0, MovedBy - (NewCurrentRow - CurDataRow));
            NewTopRow := NewCurrentRow - VisibleRowCount + 1;
            ScrollReposition(ScrollCount, NewLeftCol, NewTopRow, NewCurrentCol,
                             NewCurrentRow, True, True, True);
        end;
    finally
        if DoUpdateScrollRange then UpdateScrollRange;
    end;
end;

procedure TtsCustomDBGrid.KeyDownVK_Tab(Key: Word);
var
    oldCol, NewCurrentCol, NewCurrentRow: Longint;
    NewLeftCol, NewTopRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
    InInsert, DoAppend: Boolean;
begin
    if not DataBound then begin inherited; Exit end;
    if CurDisplayRow <= 0 then Exit;

    oldCol := CurDisplayCol;
    if (CurDisplayCol < RightMostCol(True, False)) then
    begin
        inherited KeyDownVK_Tab(Key);
        if (oldCol <> CurDisplayCol) then Exit;  // Read Only cell would not scroll dataset
    end;

    if not CanMoveToPos(CurDisplayCol, CurDisplayRow) then Exit;
    if (not TabRowWrap) or (not CanMoveDown) then
    begin
        if Key = VK_RETURN then
        begin
            if not CheckEndEdit(-1, -1, True) then Exit;
            CurrentCell.SelectAll;
        end;
        Exit;
    end;

    InInsert := FDataEditMode = demInsert;
    if not CheckEndEdit(GetDataCol(CurDisplayCol), -1, True) then Exit;

    NewCurrentCol := LeftMostCol(True, False);
    if (NewCurrentCol < 1) or (NewCurrentCol > Cols) then NewCurrentCol := 1;
    NewLeftCol := MoveToDisplayCol(LeftCol, NewCurrentCol, vpRight);

    DoAppend := False;
    if not InInsert or FDataPosted then
    begin
        MovedBy := ScrollLineDown(1, CanSkipReadOnly, False, ScrollCount, NewCurrentRow, NewTopRow);
        if MovedBy = 0 then DoAppend := True;
    end
    else
    begin
        ScrollReposition(0, NewLeftCol, GridTopRow, NewCurrentCol,
                         CurDisplayRow, True, True, True);
        Exit;
    end;

    if not DoAppend then
    begin
        if UseStandardScrolling then
        begin
            EnablePaint := False;
            try
                ScrollReposition(0, NewLeftCol, GridTopRow, NewCurrentCol, CurDisplayRow, True, True, True);
                MovedBy := Datalink.Dataset.MoveBy(MovedBy);
                if MovedBy = 0 then DoAppend := True;
            finally
                EnablePaint := True;
            end;
        end
        else
        begin
            ScrollReposition(ScrollCount, NewLeftCol, NewTopRow, NewCurrentCol,
                             NewCurrentRow, True, False, True);
        end;
    end;

    if DoAppend then
    begin
        EnablePaint := False;
        try
            if (not ReadOnly) and (AutoInsert or (GridMode = gmEditInsert)) then
            begin
                ScrollReposition(0, NewLeftCol, GridTopRow, NewCurrentCol, CurDisplayRow, True, True, True);
                Append;
            end;
        finally
            EnablePaint := True;
        end;
    end;
end;

procedure TtsCustomDBGrid.ShiftKeyDownVK_Tab;
var
    NewCurrentCol, NewCurrentRow: Longint;
    NewLeftCol, NewTopRow: Longint;
    MovedBy: Longint;
    ScrollCount: Longint;
    InAppend: Boolean;
begin
    if not DataBound then begin inherited; Exit end;
    if CurDisplayRow <= 0 then Exit;

    if CurDisplayCol > LeftMostCol(True, False) then
    begin
        inherited ShiftKeyDownVK_Tab;
        Exit;
    end;

    if not TabRowWrap then Exit;
    if not CanMoveToPos(CurDisplayCol, CurDisplayRow) then Exit;

    InAppend := FDataEditMode = demAppend;
    if not CheckEndEdit(GetDataCol(CurDisplayCol), -1, True) then Exit;

    NewCurrentCol := RightMostCol(True, False);
    if (NewCurrentCol < 1) or (NewCurrentCol > Cols) then NewCurrentCol := 1;
    NewLeftCol := MoveToDisplayCol(LeftCol, NewCurrentCol, vpNone);

    if (not InAppend) or FDataPosted then
    begin
        MovedBy := ScrollLineUp(1, CanSkipReadOnly, False, ScrollCount, NewCurrentRow, NewTopRow);
        if MovedBy = 0 then Exit;
    end
    else
    begin
        ScrollReposition(0, NewLeftCol, GridTopRow, NewCurrentCol,
                         CurDisplayRow, True, True, True);
        Exit;
    end;

    if UseStandardScrolling then
    begin
        EnablePaint := False;
        try
            ScrollReposition(0, NewLeftCol, GridTopRow, NewCurrentCol, CurDisplayRow, True, True, True);
            Datalink.Dataset.Prior
        finally
            EnablePaint := True;
        end;
    end
    else
        ScrollReposition(-ScrollCount, NewLeftCol, NewTopRow, NewCurrentCol,
                         NewCurrentRow, True, False, True);
end;

function TtsCustomDBGrid.KeydownVK_Escape: Boolean;
begin
    if not DataBound then begin Result := inherited KeydownVK_Escape; Exit end;

    if Editing then PostData(True);
    if not AlwaysShowEditor then
    begin
        HideEditor;
        CurrentCell.SelectAll;
    end;
    Result := True;
end;

procedure TtsCustomDBGrid.DeleteSelectedRecords;
var
    Bkm, PrevBkm: Variant;
begin
    with Dataset do
    begin
        DisableControls;
        try
            Bkm := SelectedRows.Last;
            while not VarIsEmpty(Bkm) do
            begin
                PrevBkm := SelectedRows.Previous(Bkm);
                if CompareBkm(Bookmark, Bkm) <> 0 then Bookmark := Bkm;
                Delete;
                Bkm := PrevBkm;
            end;
        finally
            DeleteAllRowSelection;
            EnableControls;
            ShowGridControl;
            CheckRowColChanged;
            CheckRowSelection(False);
            SelectionsChanged(False);
            CheckTopLeftChanged(False);
            GridStatusChanged;
        end;
    end;
end;

function TtsCustomDBGrid.CtrlKeyDownVK_Delete: Boolean;
var
    Msg: string;
    FirstBkmPos, LastBkmPos: TtsBkmPos;
    DatasetPos: TtsDatasetPosition;
begin
    Result := False;
    if not Active then Exit;
    if ReadOnly then Exit;
    if (GridStatus <> grRowSelect) then Exit;

    SaveDatasetPosition(DatasetPos);
    EnablePaint := False;
    try
        FirstBkmPos := SelectedRows.GetFirstBkmPos;
        if (VarToStr(FirstBkmPos.Bkm) = VarToStr(EmptyBookmark)) and
           (FirstBkmPos.Offset = bpoCurrent) then Exit;

        LastBkmPos := SelectedRows.GetLastBkmPos;
        if CompareBkmPos(FirstBkmPos, LastBkmPos) = 0
            then Msg := ResourceStr(SDeleteRecordQuestion)
            else Msg := ResourceStr(SDeleteMultipleRecordsQuestion);
    finally
        EnablePaint := True;
        RestoreDatasetPosition(DatasetPos, True);
    end;

    Result := True;
    if (not ConfirmDelete) or
       (MessageDlg(Msg, mtConfirmation, mbOKCancel, 0) <> idCancel) then
    begin
        DeleteSelectedRecords;
    end;
end;

function TtsCustomDBGrid.KeyDownVK_Insert: Boolean;
begin
    Result := False;
    if not Active then Exit;
    if (GridMode in [gmBrowse, gmListBox]) or ReadOnly then Exit;

    FDataLink.DataSet.Insert;
    Result := True;
end;

procedure TtsCustomDBGrid.ProcessKeyDown(var Key: Word; Shift: TShiftState);
begin
    if Key = 0 then Exit;
    if not DataBound then begin inherited; Exit end;

    inherited ProcessKeyDown(Key, Shift);
    if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    begin
        if CtrlKeyDownVK_Delete then Key := 0;
    end;

    if (Shift = []) and (Key = VK_INSERT) then
    begin
        if KeyDownVK_Insert then Key := 0;
    end;
end;

procedure TtsCustomDBGrid.PutInView(DisplayCol: Longint; DataRow: Variant; Position: TtsViewPosition;
                                    ResetCurrent, SetCurPos: Boolean; ChangeTopLeft: TtsChangeTopLeft);
var
    DisplayRow: Longint;
    NewLeftCol: Longint;
    Count: Integer;
begin
    if not DataBound then
    begin
        inherited PutInView(DisplayCol, DataRow, Position, ResetCurrent, SetCurPos, ChangeTopLeft);
        Exit;
    end;
    if not Active then Exit;

    CheckHideControl(True);
    NewLeftCol := MoveToDisplayCol(LeftCol, DisplayCol, Position);

    SetControlSelectMode(tsAll);
    if (ChangeTopLeft in [ctlBoth, ctlTop]) then
    begin
        DisplayRow := FGridData.BufferPos(DataRow);
        if (DisplayRow <= GridTopRow) or
           (DisplayRow >= GridTopRow + VisibleRowCount) then
        begin
            EnablePaint := False;
            try
                SetDBNewTopRow(DataRow);
                if (DisplayRow >= GridTopRow + VisibleRowCount) or
                   (Position in [vpBottom, vpBoth]) then
                begin
                    DisplayRow := FGridData.BufferPos(DataRow);
                    if DisplayRow < VisibleRowCount then
                    begin
                        Count := FGridData.MoveBy(-(VisibleRowCount - DisplayRow));
                        if UseStandardScrolling
                            then Dataset.MoveBy(-Count)
                            else SetDBNewTopRow(FGridData.Bookmark[1]);
                    end;
                end;

                if (ChangeTopLeft = ctlBoth) and (LeftCol <> NewLeftCol) then
                    LeftCol := NewLeftCol;
            finally
                EnablePaint := True;
            end;
        end
        else if (ChangeTopLeft = ctlBoth) and (LeftCol <> NewLeftCol) then
            LeftCol := NewLeftCol;
    end
    else if (ChangeTopLeft in [ctlBoth, ctlLeft]) and (LeftCol <> NewLeftCol) then
        LeftCol := NewLeftCol;

    UpdateScrollRange;
    CheckTopLeftChanged(False);
    ShowGridControl;
    DrawCurrentFocusRect(False);
end;

procedure TtsCustomDBGrid.PutCellInView(DataCol: Longint; DataRow: Variant);
begin
    if not DataBound then begin inherited PutCellInView(DataCol, DataRow); Exit; end;
    if not Active then Exit;
    if not CheckIndex(itCol, DataCol, 1, Cols) then Exit;
    if not CheckBkmType(DataRow) then Exit;

    PutInView(DisplayColnr[DataCol], DataRow, vpNone, True, False, ctlBoth);
end;

procedure TtsCustomDBGrid.MDSelectAll(WithMouse: Boolean);
var
    DatasetPos: TtsDatasetPosition;
    AllSelected: Boolean;
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;
    if FGridData.BufferRows = 0 then Exit;

    if RowSelectMode <> rsMulti then Exit;
    if not CheckEndEdit(-1, -1, True) then Exit;

    SaveDatasetPosition(DatasetPos);
    try
        with FGridData do
        begin
            if WithMouse then SetMouseStatus(msAllRowSelect);
            try
                AllSelected := FDBSelectedRows.AllSelected;
                if DoSelectRows(FirstBkmPos, LastBkmPos, (not WithMouse) or (not AllSelected), True) then
                    FDBSelectedRows.AllSelected := (not WithMouse) or (not AllSelected);
            finally
                if WithMouse then SetMouseStatus(msNormal);
            end;
        end;
    finally
        RestoreDatasetPosition(DatasetPos, True);
    end;
end;

procedure TtsCustomDBGrid.SetMouseDownColRow(DisplayCol, DisplayRow: Longint);
begin
    if DataBound and Active then
    begin
        if DisplayRow < 1 then FMouseDownBkm := DisplayRow
                          else FMouseDownBkm := FGridData.Bookmark[DisplayRow];
    end;
    inherited;
end;

procedure TtsCustomDBGrid.SetMouseUpColRow(DisplayCol, DisplayRow: Longint);
begin
    if DataBound and Active then
    begin
        if DisplayRow < 1 then FMouseUpBkm := DisplayRow
                          else FMouseUpBkm := FGridData.Bookmark[DisplayRow];
    end;
    inherited;
end;

procedure TtsCustomDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState;
                              X, Y: Integer);
begin
    inherited MouseDown(Button, Shift, X, Y);
end;

procedure TtsCustomDBGrid.KeyScroll(NewLeftCol, NewTopRow, RowScrollCount: Longint);
var
    ScrollMode: TtsScrollMode;
begin
    if not InEditMode and not FocusRectActive
        then ScrollMode := smRowSelect
        else ScrollMode := smGridControl;

    SetScrollMode(ScrollMode);
    try
        if NewLeftCol = LeftCol then
        begin
            if GridTopRow = NewTopRow then
                DBScroll(0, RowScrollCount, ScrollMode, False)
            else
                AdjustTopLeft(NewLeftCol, NewTopRow, (GridTopRow + RowScrollCount = NewTopRow));
        end
        else if RowScrollCount = 0 then
            AdjustTopLeft(NewLeftCol, NewTopRow, True)
        else
            AdjustTopLeft(NewLeftCol, NewTopRow, False);

    finally
        SetScrollMode(smWindow);
    end;
end;

function TtsCustomDBGrid.GetDBCol(DataCol: Variant): TtsDBCol;
begin
    Result := TtsDBCol(GetCol(DataCol));
end;

function TtsCustomDBGrid.GetFieldState: TtsFieldState;
begin
    Result := GridCols.FieldState;
end;

procedure TtsCustomDBGrid.SetFieldState(Value: TtsFieldState);
begin
    GridCols.FieldState := Value;
end;

procedure TtsCustomDBGrid.CheckBoundProperties;
begin
    if FixedRowCount > 0 then FixedRowCount := 0;
    if ResizeRows = rrSingle then ResizeRows := rrAll;
    RowMoving := False;
end;

procedure TtsCustomDBGrid.SetDataSource(Value: TDataSource);
var
    OldDatasource: TDatasource;
begin
    if Value = FCurDatasource then Exit;

    OldDatasource := FCurDatasource;
    SetComboExtents := False;
    EnablePaint := False;
    try
        ClearCellBuffer;
        HideGridControl(True);
        ResetLastRow;
        ResetLastCell;
        DeleteSelections([], False);
        LinkActive(False);

        if Assigned(Value) then CheckBoundProperties;
        FDataBound := Assigned(Value);

        try
            DataLink.DataSource := Value;
            FCurDatasource := DataLink.DataSource;
        except
            on Exception do
            begin
                FDataBound := False;
                DataLink.DataSource := nil;
                FCurDatasource := DataLink.DataSource;
                raise;
            end;
        end;

        StoreData := False;
        if DataBound and not Active then
        begin
            FieldLayoutChanged(True, True, True);
            UpdateRowCount(True);
            if (GridRows > 0) and InDesignMode
                then SetCurrentPosition(CurDisplayCol, 1, True, True)
                else SetCurrentPosition(CurDisplayCol, 0, True, True);
        end
        else if not DataBound then
            RemoveFieldLayout;

        if DataBound and InDesignMode then
        begin
            CellSelectMode := cmNone;
            RowMoving := False;
        end;

        if FieldState <> fsCustomized then
            ResetProperties(tsAllProperties)
        else
        begin
            ResetRowProperties(tsAllProperties);
            ResetCellProperties(tsAllProperties);
        end;

        if LeftCol > 1 then LeftCol := 1;
        if not CheckDataset(DatasetType, Dataset) then DatasetType := dstStandard;

        VerifyEditMode;
        VerifyRowChanged;
        UpdateRowCount(False);
        CheckRowSelection(False);
        SelectionsChanged(False);
        GridStatusChanged;

    finally
        SetComboExtents := True;
        EnablePaint := True;
        AdjustComboGridExtents(DropDownCols, DropDownRows);
        if Assigned(OldDatasource) and (OldDatasource = FLookupDatasource) then
        begin
            ResetLookupDatasource;
            if Assigned(Datasource) and (Datasource <> FLookupDatasource) then
                AutoLookup := False;
        end
        else if not Assigned(Datasource) then
            CheckSetLookupDataset;
    end;

    DoFieldLayoutChange;
end;

function TtsCustomDBGrid.GetDataSource: TDataSource;
begin
    Result := DataLink.DataSource;
end;

procedure TtsCustomDBGrid.ResetLookupDatasource;
begin
    FLookupDatasource.Free;
    FLookupDatasource := nil;
end;

procedure TtsCustomDBGrid.SetLookupDatasource(Value: TDatasource);
begin
    if LookupDatasource <> Value then
    begin
        FLookupDatasource := Value;
        Datasource := Value;
    end;
end;

procedure TtsCustomDBGrid.SetLookupDataset(Value: TDataset);
var
    NewDatasource: TDatasource;
begin
    if LookupDataset <> Value then
    begin
        NewDatasource := TDatasource.Create(Self);
        NewDatasource.Name := DtsAutoLookupName;
        NewDataSource.Dataset := Value;
        LookupDatasource := NewDatasource;
    end;
end;

function TtsCustomDBGrid.GetLookupDataset: TDataset;
begin
    Result := nil;
    if not Assigned(LookupDatasource) then Exit;
    Result := LookupDatasource.Dataset;
end;

function  TtsCustomDBGrid.FindLookupDataSet : TDataSet;
begin
  Result := GetLookupDataset;
end;

function TtsCustomDBGrid.GetGridDBCols: TtsDBGridCols;
begin
    Result := TtsDBGridCols(inherited GridCols);
end;

function TtsCustomDBGrid.GetField(Index: Variant): TtsDBField;
var iIndex : Integer;
begin
    Result := nil;
    case VarType(Index) of
        varString:
            Result := FFieldList.FindField(Index);
    else
       begin
         iIndex := Integer(Index);
         if (iIndex >= 1) and (iIndex <= FFieldList.Count) then
            Result := FFieldList.Items[iIndex-1];
       end;
    end;
end;

procedure TtsCustomDBGrid.SetDatasetType(Value: TtsDatasetType);
begin
    if FDatasetType <> Value then
    begin
        if not CheckDataset(Value, Dataset) then Exit;

        FDatasetType := Value;
        FUseStandardDataset := (DatasetType = dstStandard);
        if UseStandardDataset then FGridData := FStandardDataset
                              else FGridData := FScrollDataset;

        if Active then
        begin
            if UseStandardScrolling then
            begin
                FScrollDataset.Close;
                FStandardDataset.LinkActive(True);
            end
            else
            begin
                FStandardDataset.LinkActive(False);
                FScrollDataset.LinkActive(True);
                FScrollDataset.MoveFirst;
            end;

            UpdateRowCount(True);
            HideGridControl(True);
            PositionCurrentRec(CurDisplayCol, FCurBookmark, False, False);
            ShowGridControl;
            DisplayAsControl := True;

            CheckExactRowCount(True);
            Invalidate;
        end;

        VerifyEditMode;
        if (DatasetType = dstBDE) and (BookmarkType = bmtNonOrdered) then
            BookmarkType := bmtDefault;
    end;
end;

procedure TtsCustomDBGrid.CheckRangeSelection;
begin
    FDBSelectedRows.UseRangeSelection := (FBookmarkType = bmtDefault) and
                                         (FRecordSelection = rseBookmarkRange);
end;

procedure TtsCustomDBGrid.SetBookmarkType(Value: TtsBookmarkType);
begin
    if FBookmarkType <> Value then
    begin
        FBookmarkType := Value;
        CheckRangeSelection;
        if FBookmarkType = bmtNonOrdered then
        begin
            DatasetType := dstStandard;
        end;

        CheckRowSelection(True);
        SelectionsChanged(False);
        GridStatusChanged;
    end;
end;

procedure TtsCustomDBGrid.SetRecordSelection(Value: TtsRecordSelection);
begin
    if RecordSelection <> Value then
    begin
        FRecordSelection := Value;
        CheckRangeSelection;

        CheckRowSelection(True);
        SelectionsChanged(False);
        GridStatusChanged;
    end;
end;

function TtsCustomDBGrid.GetRecordSelection: TtsRecordSelection;
begin
    if FDBSelectedRows.UseRangeSelection
        then Result := rseBookmarkRange
        else Result := rseBookmarkSet;
end;

procedure TtsCustomDBGrid.SetStoreData(Value: Boolean);
begin
    if DataBound and Value then
    begin
        if (not FAsCombo) then Exit;
        if (DataSource <> LookupDatasource) then Exit;
        AutoLookup := False;
        DataSource := nil;
    end;
    inherited;
end;

function TtsCustomDBGrid.GetDataset: TDataset;
begin
    Result := nil;
    if Assigned(DataLink) then Result := DataLink.Dataset;
end;

procedure TtsCustomDBGrid.DefineFieldMap;
var
  I: Integer;
begin
    if FieldState = fsCustomized then
    begin
        DataLink.SparseMap := True;
        for I := 1 to Cols do
            DataLink.AddMapping(GridCols[I].FieldName, nil);
    end
    else
    begin
        FDataLink.SparseMap := False;
        with Datalink.Dataset do
        for I := 0 to FieldCount - 1 do
            Datalink.AddMapping(Fields[I].FieldName, Fields[I]);
    end;
end;

procedure TtsCustomDBGrid.RemoveFieldLayout;
begin
    HideGridControl(True);

    if FieldState = fsDefault then
    begin
        Cols := DefaultColCount;
        DefaultColWidth := DefaultColWidth;
    end;

    Rows := DefaultRowCount;
    ResetFields(True);
    SetCurrentPositionAndDraw(1, 1, True, True);
    ShowGridControl;
    Invalidate;
end;

procedure TtsCustomDBGrid.FieldLayoutChanged(SetFields, ClearAll, CreateFields: Boolean);
var
    I: Longint;
    Field: TField;
    FieldCol: TtsDBCol;
    Count, FieldCount: Longint;
    ColsEmpty: Boolean;
begin
    if not DataBound then Exit;
    if FInFieldLayout then Exit;

    FInFieldLayout := True;
    try
        EnablePaint := False;
        try
            DataLink.ClearMapping;
            if DataLink.Active then DefineFieldMap;
            if CreateFields or ClearAll then
            begin
                ResetFields(False);
                FFieldList.CreateFields;
            end;

            if FieldState = fsDefault then
            begin
                if ClearAll or (not SetFields) or (not DataLink.Active) then
                begin
                    {Remove all fields}
                    Cols := 0;
                end
                else
                begin
                    {Remove fields that are no longer in the fieldmap}
                    I := 1;
                    FieldCount := Cols;
                    for Count := 1 to FieldCount do
                    begin
                        Field := Dataset.FindField(GridCols[I].FieldName);
                        if not Assigned(Field) then
                            DoDeleteCols(I, I)
                        else
                        begin
                            Col[I].ResetField(True);
                            Col[I].SetField(Field);
                            Inc(I);
                        end;
                    end;
                end;

                if SetFields and DataLink.Active then
                begin
                    {Add fields that are not yet in the cols list}
                    FieldCount := DataLink.FieldCount;
                    ColsEmpty := (Cols = 0);
                    if ColsEmpty then Cols := FieldCount;

                    for I := 0 to FieldCount - 1 do
                    begin
                        Field := DataLink.Fields[I];
                        if ColsEmpty
                            then FieldCol := nil
                            else FieldCol := GridCols.FindField(Field);

                        if (not Assigned(FieldCol)) then
                        begin
                            if not ColsEmpty then AddColumn(I + 1);

                            FieldCol := GridCols[I + 1];
                            FieldCol.SetField(Field);
                            FieldCol.InitField;
                            DoInsertCol(I + 1, False);
                        end
                        else
                        begin
                            FieldCol.SetDefaultWidth;
                            FieldCol.SetDefaultVisible;
                        end;
                    end;
                end;
            end
            else
            begin
                if SetFields and Assigned(DataLink.DataSet) and
                   (DataLink.Active or (not DataLink.Dataset.DefaultFields)) then
                begin
                    for I := 1 to Cols do
                    begin
                        FieldCol := GridCols[I];
                        FieldCol.ResetField(True);
                        if FieldCol.FieldName <> '' then
                            FieldCol.SetField(DataLink.DataSet.FindField(FieldCol.FieldName));
                        FieldCol.InitField;
                    end;
                end
                else
                    ResetFields(True);
            end;

            if (Cols = 0) and ((not SetFields) or (not DataLink.Active)) and
               (FieldState = fsDefault) then
            begin
                Cols := DefaultColCount;
            end;
            Invalidate;

        finally
            EnablePaint := True;
        end;
    finally
        FInFieldLayout := False;
    end;
end;

procedure TtsCustomDBGrid.ResetFields(ResetFieldName: Boolean);
var
    I: Longint;
begin
    for I := 1 to Cols do GridCols[I].ResetField(ResetFieldName);
end;

procedure TtsCustomDBGrid.SetExactRowCount(Value: Boolean);
begin
    if (FExactRowCount <> Value) then
    begin
        FExactRowCount := Value;
    end;
end;

procedure TtsCustomDBGrid.SyncDataset;
var
    Count: Integer;
begin
    if (not DataLink.Active) or (not Assigned(DataLink.Dataset)) then Exit;
    if InSyncDataset then Exit;

    InSyncDataset := True;
    try
        Count := 0;
        while (Count < MaxSyncTry) and
              (CompareBkm(DataLink.Dataset.Bookmark, FCurBookmark) <> 0) do
        begin
            try
                Inc(Count);
                if Count = MaxSyncTry then
                begin
                   ResetRowProperties([prSelected]);
                   PositionRec(FCurDisplayCol, DataLink.Dataset.Bookmark, False);
                   Invalidate;
                end
                else
                   DataLink.Dataset.Bookmark := FCurBookmark;
            except
                FGridData.RereadBuffer(1, False);
                UpdateRowCount(False);
                Invalidate;

                if (FGridData.BufferRows > 0) and (Count < MaxSyncTry) then
                begin
                    if (CurDataRow > 0) and (CurDataRow < GridRows) then
                        SetCurrentRec(FGridData.Bookmark[CurDataRow], -1)
                    else if (CurDataRow > GridRows) and (GridRows > 0) then
                        PositionRec(FCurDisplayCol, FGridData.Bookmark[GridRows], False)
                    else
                        PositionRec(FCurDisplayCol, DataLink.Dataset.Bookmark, False);
                end
                else
                    PositionRec(FCurDisplayCol, DataLink.Dataset.Bookmark, False);
            end;
        end;
    finally
        InSyncDataset := False;
    end;
end;

procedure TtsCustomDBGrid.PositionRec(DisplayCol: Longint; Bookmark: TBookmarkStr;
                                      Synchronize: Boolean);
var
    OldRow, NewRow: Longint;
begin
    if not Synchronize then CanSynchronize := False;
    try
        OldRow := CurDataRow;
        NewRow := FGridData.BufferRow(Bookmark);
        if DisplayCol <> CurDisplayCol then ClearCellBuffer;

        if OldRow <> NewRow then
        begin
            ClearCurrent(CurDisplayRow);
            PositionCell(DisplayCol, NewRow);
            SetCurrentRec(Bookmark, NewRow);
            if RowSelected[FCurBookmark] then DrawCurrentSelected(NewRow)
                                         else DrawCurrent(NewRow);
        end
        else
        begin
            if CurDisplayCol <> DisplayCol then PositionCell(DisplayCol, NewRow);
            SetCurrentRec(Bookmark, NewRow);
        end;

        if OldRow <> CurDataRow then
        begin
            DisplayAsControl := True;
            MoveCellBuffer(GetDataCol(DisplayCol), NewRow);
        end;
    finally
        if not Synchronize then CanSynchronize := True;
    end;

    CheckRowColChanged;
end;

procedure TtsCustomDBGrid.PositionCurrentRec(DisplayCol: Longint; Bookmark: TBookmarkStr;
                                             Synchronize, Position: Boolean);
begin
    if not CanSetCurrentRec then Exit;

    CanSetCurrentRec := False;
    if not Position then EnablePaint := False;
    try
        PositionRec(DisplayCol, Bookmark, Synchronize);
    finally
        CanSetCurrentRec := True;
        if not Position then EnablePaint := True;
    end;
end;

procedure TtsCustomDBGrid.SetCurrentRec(Bookmark: TBookmarkStr; BufRownr: Integer);
begin
    if CompareBkm(FCurBookmark, Bookmark) <> 0 then
    begin
        ClearCellBuffer;
        CheckDisableControl;
        FCurBookmark := Bookmark;
        if (GridStatus <> grRowSelect) and (MouseStatus <> msRowSelect) then
            ResetSelectionStart;
        if CanSynchronize then SyncDataset;
    end;
end;

function TtsCustomDBGrid.CurrentRowChanged(DisplayRow: Longint): Boolean;
begin
    Result := False;
    if not UseStandardScrolling and not InRowSelectMode then Exit;

    if DisplayRow = 0 then
        DisplayRow := 1
    else if DisplayRow > FGridData.BufferRows then
        DisplayRow := FGridData.BufferRows;

    Result := DisplayRow <> CurDisplayRow;
end;

function TtsCustomDBGrid.CheckSetCurrent(DatasetPos: TtsDatasetPosition; DisplayRow: Longint): Boolean;
begin
    Result := False;
    if not UseStandardScrolling then Exit;

    if DisplayRow = 0 then
        DisplayRow := 1
    else if DisplayRow > FGridData.BufferRows then
        DisplayRow := FGridData.BufferRows;

    if (DisplayRow <> CurDisplayRow) then
    begin
        FGridData.DatasetPosition := DatasetPos;
        ClearCurrent(CurDisplayRow);
        SetCurrentPosition(CurDisplayCol, DisplayRow, True, True);
        if IsRowSelected(DisplayRow)
            then DrawCurrentSelected(DisplayRow)
            else DrawCurrent(DisplayRow);
        Result := True;
    end;
end;

function TtsCustomDBGrid.GetBookmarkRecordID(Bookmark: Variant): Variant;
var
    BufRow: Longint;
begin
    Result := Unassigned;
    if not DataBound or not Active then Exit;
    if not CanUseRecordIds then Exit;
    if VarToStr(Bookmark) = VarToStr(EmptyBookmark) then
    begin Result := EmptyRecId; Exit; end;

    EnablePaint := False;
    try
        BufRow := FGridData.BufferRow(Bookmark);
        Result := FGridData.GetBookmarkRecID(Bookmark, BufRow);
    finally
        EnablePaint := True;
    end;
end;

procedure TtsCustomDBGrid.SetCurrentRow(PrevRecnr, Recnr: Integer);
begin
    if Active then
    begin
        if Recnr <= FGridData.BufferRows then
        begin
            if UseStandardScrolling and not InDatasetEvent then
            begin
                if Recnr <> PrevRecnr then
                   try
                      Datalink.Dataset.MoveBy(Recnr - PrevRecnr);
                   except on E:Exception do
                     begin
                       ResetRowProperties([prSelected]);
                       Invalidate;
                     end;
                   end;
            end;
            SetCurrentRec(FGridData.Bookmark[Recnr], Recnr)
        end
        else if not ReadOnly then
            Append;
    end
    else if not InDesignMode then
        SetCurrentDataRow(0)
    else
    begin
        SetCurrentDataRow(Recnr);
        CheckInsertionRow(False);
    end;
end;

procedure TtsCustomDBGrid.SetActiveRecord(Value: Integer);
begin
    if (Value >= 0) and (Value <> FGridData.ActiveRecord) then
        FGridData.ActiveRecord := Value;
    if (Value < 0) and not UseStandardScrolling then
        FScrollDataset.SetActiveBookmark(FCurBookmark);
end;

function  TtsCustomDBGrid.GetActiveRecord: Integer;
begin
    Result := FGridData.ActiveRecord;
end;

procedure TtsCustomDBGrid.RepositionTopRow(OldRow, NewRow: Longint; DoPaint: Boolean);
var
    MovedBy: Longint;
begin
    if not Active then Exit;

    if (OldRow = 0) or (NewRow = 0) then MovedBy := 0
                                    else MovedBy := OldRow - NewRow;

    if not DoPaint then EnablePaint := False;
    try
        if not FScrollDataset.CheckAtEnd then MoveTopLeft(LeftCol, FixedRows)
                                         else MoveTopLeft(LeftCol, GridTopRow - MovedBy);
    finally
        if not DoPaint then EnablePaint := True;
    end;
end;

procedure TtsCustomDBGrid.Append;
begin
    if ReadOnly or (GridMode in [gmBrowse, gmListBox]) then Exit;

    with DataLink do
    begin
        if not DataLink.Active then Exit;
        DataSet.Append;
    end;
end;

procedure TtsCustomDBGrid.SetInsertRowOff;
begin
    EnablePaint := False;
    try
        inherited SetInsertRowOff;
    finally
        EnablePaint := True;
    end;
end;

procedure TtsCustomDBGrid.SetInsertRowOn;
begin
    EnablePaint := False;
    try
        inherited SetInsertRowOn;
    finally
        EnablePaint := True;
    end;
end;

function TtsCustomDBGrid.DrawCell3D(DataCol: Longint; DataRow: Variant): Boolean;
begin
    Result := False;
    if not DataBound then begin Result := inherited DrawCell3D(DataCol, DataRow); Exit; end;
    if not Active then Exit;

    if CheckIndex(itCol, DataCol, 1, Cols) and CheckIdType(DataRow) then
    begin
        Result := Is3D or
                  GridCols[DataCol].Is3D or
                  RowIs3D[DataRow] or
                  CellIs3D[DataCol, DataRow];
    end;
end;

procedure TtsCustomDBGrid.InsertCol(DisplayCol: Longint; FieldName: string);
begin
    if not CheckIndex(itCol, DisplayCol, 1, Cols + 1) then Exit;

    if AddColumn(DisplayCol) then
    begin
        GridCols[Cols].FieldName := FieldName;
        if Assigned(Datalink) and Assigned(Datalink.DataSet) then
        begin
            if FieldName <> ''
                then Col[Cols].SetField(DataLink.DataSet.FindField(FieldName))
                else Col[Cols].ResetField(True);
            Col[Cols].InitField;
        end;
        DoInsertCol(Cols, False);
    end;
end;

procedure TtsCustomDBGrid.InsertRow(DisplayRow: Longint);
begin
    if not DataBound then begin inherited; Exit end;
end;

procedure TtsCustomDBGrid.MoveFirst;
begin
    HideGridControl(True);
    MoveToPosition(dpTop, False);
    ShowGridControl;
end;

procedure TtsCustomDBGrid.MoveLast;
begin
    HideGridControl(True);
    MoveToPosition(dpBottom, False);
    ShowGridControl;
end;

procedure TtsCustomDBGrid.MoveBy(Count: Longint);
var
    CurActive: Integer;
begin
    if Count = 0 then Exit;

    if UseStandardScrolling then
    begin
        CurActive := FGridData.ActiveRecord;
        if Count > 0
            then Dataset.MoveBy(GridRows - CurActive + Count)
            else Dataset.MoveBy(-(CurActive - 1) + Count);
    end
    else
    begin
        if Count > 0
            then ScrollBarScroll(ScrollMoveDown(Count))
            else ScrollBarScroll(ScrollMoveUp(-Count));
    end;
end;

procedure TtsCustomDBGrid.SelectCells(DisplayLeft, DisplayTop, DisplayRight,
                                      DisplayBottom: Longint);
begin
    if not DataBound then begin inherited; Exit end;
end;

function TtsCustomDBGrid.CellSelected(DisplayCol: Longint; DisplayRow: Variant): Boolean;
begin
    Result := False;
    if not DataBound then begin Result := inherited CellSelected(DisplayCol, DisplayRow); Exit end;

    if CheckIndex(itCol, DisplayCol, 1, Cols) and CheckIdType(DisplayRow) then
    begin
        if Col[GetDataCol(DisplayCol)].Selected or RowSelected[DisplayRow] then
            Result := True;
    end;
end;

procedure TtsCustomDBGrid.DeleteCols(FromDataCol, ToDataCol: Longint);
begin
    inherited DeleteCols(FromDataCol, ToDataCol);
end;

procedure TtsCustomDBGrid.DeleteRows(FromDataRow, ToDataRow: Longint);
begin
    if DataBound then Exit;
    inherited;
end;

procedure TtsCustomDBGrid.DeleteSelectedCols;
begin
    inherited;
end;

procedure TtsCustomDBGrid.DeleteSelectedRows;
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;
    if GridStatus <> grRowSelect then Exit;
    DeleteSelectedRecords;
end;

procedure TtsCustomDBGrid.ComponentRemoved(AComponent: TComponent);
var
    FieldCol: TtsDBCol;
begin
    if FDatalink <> nil then
    begin
        if (AComponent is TDatasource) and (AComponent = FCurDataSource)  then
            DataSource := nil
        else if (AComponent is TField) then
        begin
            FieldCol := GridCols.FindField(TField(AComponent));
            if Assigned(FieldCol) then
            begin
                FieldCol.ResetField(True);
                FieldLayoutChanged(True, False, True);
                DoFieldLayoutChange;
            end;
        end;
    end;
end;

procedure TtsCustomDBGrid.ComponentInserted(AComponent: TComponent);
begin
    if (csLoading in ComponentState) then Exit;
    if Dataset <> nil then
    begin
        if (AComponent is TField) then
        begin
            FieldLayoutChanged(True, False, True);
            DoFieldLayoutChange;
        end;
    end;
end;

procedure TtsCustomDBGrid.Notification(AComponent: TComponent; Operation: TOperation);
begin
    inherited Notification(AComponent, Operation);
    if (Operation = opRemove) then ComponentRemoved(AComponent);
    if (Operation = opInsert) then ComponentInserted(AComponent);
end;

procedure TtsCustomDBGrid.ResetLastRow;
begin
    FLastRow.DataRow := Unassigned;
    FLastRow.Element := nil;
end;

function TtsCustomDBGrid.GetGridRowCount: Longint;
begin
    Result := inherited GetGridRowCount;
end;

procedure TtsCustomDBGrid.SetGridRowCount(Value: Longint);
var
    I: Integer;
begin
    if not DataBound then begin inherited; Exit end;

    if Value < 0 then Value := 0;
    if GridRows <> Value then
    begin
        if (Value < GridRows) then
        begin
            for I := (RowCount - 1 - InsertionRow) downto (Value + 1) do
                DeleteAllAtRow(I, I + InsertionRow);
        end;

        EnablePaint := False;
        try
            SetNewRowCount(Value);
            CheckTopLeft(True);
        finally
            EnablePaint := True;
        end;
    end;
end;

function TtsCustomDBGrid.GetDBRowCount: Longint;
begin
    if (not DataBound) or (csWriting in ComponentState) then
    begin
        Result := GetGridRowCount;
        Exit;
    end;

    if InDesignMode
        then Result := -1
        else Result := FGridData.RecCount;
end;

procedure TtsCustomDBGrid.SetDBRowCount(Value: Longint);
begin
    if (not DataBound) or (csReading in ComponentState) then
    begin
        inherited SetGridRowCount(Value);
        Exit;
    end;
end;

function TtsCustomDBGrid.GetCurrentSelected: Boolean;
begin
    Result := False;
    if not DataBound then begin Result := inherited GetCurrentSelected; Exit; end;
    if not Active then Exit;
    Result := RowSelected[CurrentDataRow];
end;

function TtsCustomDBGrid.GetStartRowSelected: Boolean;
begin
    Result := False;
    if not DataBound then begin Result := inherited GetStartRowSelected; Exit; end;
    if not Active then Exit;
    Result := RowSelected[SelectionStart];
end;

procedure TtsCustomDBGrid.SetCurrentSelected;
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;
    FDBSelectedRows.SetSelected(FCurBookmark, True);
end;

function TtsCustomDBGrid.GetCellSelectMode: TtsCellSelectMode;
begin
    if not DataBound then begin Result := inherited GetCellSelectMode; Exit end;
    Result := cmNone;
end;

procedure TtsCustomDBGrid.SetCellSelectMode(Value: TtsCellSelectMode);
begin
    if not DataBound then begin inherited; Exit; end;
    if Value <> cmNone then Exit;
    inherited;
end;

function TtsCustomDBGrid.GetDBCurrentDataRow: Variant;
begin
    if not DataBound then begin Result := inherited CurrentDataRow; Exit end;
    Result := FCurBookmark;
end;

function TtsCustomDBGrid.GetCurrentRecordId: Variant;
begin
    if not DataBound then begin Result := inherited CurrentDataRow; Exit end;

    if not CanUseRecordIds then
        Result := FCurBookmark
    else
    begin
        if CurDataRow > 0
            then Result := FGridData.RecordId[CurDataRow]
            else Result := BookmarkRecordId[FCurBookmark];
    end;
end;

procedure TtsCustomDBGrid.SetDBCurrentDataRow(Value: Variant);
var
    DisplayRow: Longint;
begin
    if not DataBound then begin inherited CurrentDataRow := Value; Exit end;
    if not Active then Exit;

    if CompareBkm(FCurBookmark, Value) <> 0 then
    begin
        HideGridControl(True);
        if InRowSelectMode then
        begin
            DisplayRow := FGridData.BufferRow(FCurBookmark);
            if (DisplayRow >= 1) and (DisplayRow <= MaxVisibleRow) then
            begin
                Update;
                InvertRow(DisplayRow, False, 0);
            end;
            FDBSelectedRows.ResetAll;
        end;

        if UseStandardScrolling then
        begin
            DisplayRow := FGridData.BufferRow(Value);
            if (DisplayRow >= 1) and (DisplayRow <= MaxVisibleRow)
                then Dataset.MoveBy(DisplayRow - CurDataRow)
                else Dataset.Bookmark := Value;
        end
        else
            PositionCurrentRec(CurDisplayCol, Value, True, True);

        ShowGridControl;
        CheckRowSelection(False);
        SelectionsChanged(False);
    end;
end;

procedure TtsCustomDBGrid.SetTopRow(Value: Longint);
begin
    inherited TopRow := Value;
end;

function TtsCustomDBGrid.GetTopRow: Longint;
begin
    Result := inherited TopRow;
end;

procedure TtsCustomDBGrid.SetDBNewTopRow(Value: Variant);
var
    CurRow: Integer;
begin
    HideGridControl(True);
    if FGridData.MoveToRecord(Value) then
    begin
        UpdateRowCount(True);
        CurRow := FGridData.BufferRow(Value);
        if (CurRow > 0) and (CurRow <> GridTopRow) and FGridData.AtEnd
            then AdjustTopLeft(LeftCol, CurRow, False)
            else AdjustTopLeft(LeftCol, 1, False);

        if UseStandardScrolling
            then PositionCurrentRec(CurDisplayCol, Dataset.Bookmark, False, False)
            else PositionCurrentRec(CurDisplayCol, FCurBookmark, False, False);

        ShowGridControl;
        Invalidate;
    end;
end;

procedure TtsCustomDBGrid.SetDBTopRow(Value: Variant);
begin
    if not DataBound then begin inherited; Exit end;
    if not Active then Exit;
    if CompareBkm(Value, TopRow) = 0 then Exit;
    SetDBNewTopRow(Value);
    CheckTopLeftChanged(False);
end;

function TtsCustomDBGrid.GetDBTopRow: Variant;
begin
    if not DataBound then begin Result := inherited TopRow; Exit end;
    Result := Unassigned;
    if Active then Result := FGridData.Bookmark[GridTopRow];
end;

function TtsCustomDBGrid.GetRecordNumber: Longint;
begin
    Result := 0;
    if not Active then Exit;
    Result := FGridData.ActiveRecordNumber;
end;

function TtsCustomDBGrid.GetRowProp(DataRow: Longint): Boolean;
begin
    with FGridData do
    begin
        Result := Assigned(FPropBuffer);
        if not Result then Exit;

        if not FPropBuffer[DataRow].PropSaved then
        begin
            FPropBuffer[DataRow].Prop := TtsDBRowElement(FDBRowPropSet.Get([RecordId[DataRow]]));
            FPropBuffer[DataRow].PropSaved := True;
            FPropBufferCleared := False;
        end;
        Result := Assigned(FPropBuffer[DataRow].Prop);
    end;
end;

function TtsCustomDBGrid.GetDBRowElement(DataRow: Variant): TtsDBRowElement;
begin
    Result := nil;
    if not VarIsEmpty(FLastRow.DataRow) then
    begin
        if (VarToStr(DataRow) = VarToStr(FLastRow.DataRow)) then
        begin
            Result := TtsDBRowElement(FLastRow.Element);
            Exit;
        end;
    end;

    if CheckIdType(DataRow) then
    begin
        if FDBRowPropSet.Count = 0 then Exit;
        Result := TtsDBRowElement(FDBRowPropSet.Get([DataRow]));
        FLastRow.DataRow := DataRow;
        FLastRow.Element := Result;
    end;
end;

function TtsCustomDBGrid.GetRowColor(DataRow: Longint): TColor;
begin
    Result := clNone;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowColor(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FColor;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowColor(DataRow: Variant; Value: TColor);
var
    Element: TtsCustomElement;
begin
    if (not DataBound) then begin inherited SetRowColor(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prColor, 0, True);
end;

function TtsCustomDBGrid.GetDBRowColor(DataRow: Variant): TColor;
var
    Element: TtsDBRowElement;
begin
    Result := clNone;
    if not DataBound then begin Result := inherited GetRowColor(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FColor;
end;

function TtsCustomDBGrid.GetRowFont(DataRow: Longint): TFont;
begin
    Result := nil;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowFont(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FFont;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowFont(DataRow: Variant; Value: TFont);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowFont(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, ObjectToVariant(Value), prFont, 0, True);
end;

function TtsCustomDBGrid.GetDBRowFont(DataRow: Variant): TFont;
var
    Element: TtsDBRowElement;
begin
    Result := nil;
    if not DataBound then begin Result := inherited GetRowFont(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FFont;
end;

function TtsCustomDBGrid.GetRowParentFont(DataRow: Longint): Boolean;
begin
    Result := True;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowParentFont(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FParentFont;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowParentFont(DataRow: Variant; Value: Boolean);
var
    Element: TtsCustomElement;
    CurParentFont: Boolean;
begin
    if not DataBound then begin inherited SetRowParentFont(DataRow, Value); Exit end;

    CurParentFont := True;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    if Element <> nil then CurParentFont := TtsDBRowElement(Element).FParentFont;

    if CurParentFont <> Value then
    begin
        FDBRowPropSet.SetProperty([DataRow], Element, Value, prParentFont, 0, False);
        if Value then RowFont[DataRow] := nil
                 else RowFont[DataRow] := Font;
    end;
end;

function TtsCustomDBGrid.GetDBRowParentFont(DataRow: Variant): Boolean;
var
    Element: TtsDBRowElement;
begin
    Result := True;
    if not DataBound then begin Result := inherited GetRowParentFont(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FParentFont;
end;

function TtsCustomDBGrid.GetRowHeight(DataRow: Longint): Integer;
begin
    Result := DefaultRowHeight;
    if (not DataBound) or (DataRow = 0) then
        Result := inherited GetRowHeight(DataRow);
end;

procedure TtsCustomDBGrid.SetDBRowHeight(DataRow: Variant; Value: Integer);
begin
    if not DataBound then begin inherited SetRowHeight(DataRow, Value); Exit end;
end;

function TtsCustomDBGrid.GetDBRowHeight(DataRow: Variant): Integer;
begin
    if not DataBound then begin Result := inherited GetRowHeight(DataRow); Exit end;
    Result := DefaultRowHeight;
end;

function TtsCustomDBGrid.GetDBRowId(DataRow: Variant): Longint;
begin
    Result := -1;
    if not DataBound then begin Result := inherited GetRowId(DataRow); Exit end;
end;

function TtsCustomDBGrid.IsRowVisible(DataRow: Longint): Boolean;
begin
    Result := True;
    if (not DataBound) or (DataRow = 0) then
    begin
        Result := inherited IsRowVisible(DataRow);
        Exit;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowVisible(DataRow: Variant; Value: Boolean);
begin
    if not DataBound then begin inherited SetRowVisible(DataRow, Value); Exit end;
end;

function TtsCustomDBGrid.GetDBRowVisible(DataRow: Variant): Boolean;
begin
    Result := True;
    if not DataBound then begin Result := inherited GetRowVisible(DataRow); Exit end;
end;

function TtsCustomDBGrid.GetRowAlignment(DataRow: Longint): TAlignment;
begin
    Result := taLeftJustify;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowAlignment(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FAlignment;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowAlignment(DataRow: Variant; Value: TAlignment);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowAlignment(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prAlignment, 0, True);
end;

function TtsCustomDBGrid.GetDBRowAlignment(DataRow: Variant): TAlignment;
var
    Element: TtsDBRowElement;
begin
    Result := taLeftJustify;
    if not DataBound then begin Result := inherited GetRowAlignment(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FAlignment;
end;

function TtsCustomDBGrid.GetRowAlign(DataRow: Longint): Boolean;
begin
    Result := False;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowAlign(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FAlign;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowAlign(DataRow: Variant; Value: Boolean);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowAlign(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prAlign, 0, True);
end;

function TtsCustomDBGrid.GetDBRowAlign(DataRow: Variant): Boolean;
var
    Element: TtsDBRowElement;
begin
    Result := False;
    if not DataBound then begin Result := inherited GetRowAlign(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FAlign;
end;

function TtsCustomDBGrid.GetRowHorzAlignment(DataRow: Longint): TtsHorzAlignment;
begin
    Result := htaDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowHorzAlignment(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FHorzAlignment;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowHorzAlignment(DataRow: Variant; Value: TtsHorzAlignment);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowHorzAlignment(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prHorzAlignment, 0, True);
end;

function TtsCustomDBGrid.GetDBRowHorzAlignment(DataRow: Variant): TtsHorzAlignment;
var
    Element: TtsDBRowElement;
begin
    Result := htaDefault;
    if not DataBound then begin Result := inherited GetRowHorzAlignment(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FHorzAlignment;
end;

function TtsCustomDBGrid.GetRowVertAlignment(DataRow: Longint): TtsVertAlignment;
begin
    Result := vtaDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowVertAlignment(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FVertAlignment;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowVertAlignment(DataRow: Variant; Value: TtsVertAlignment);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowVertAlignment(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prVertAlignment, 0, True);
end;

function TtsCustomDBGrid.GetDBRowVertAlignment(DataRow: Variant): TtsVertAlignment;
var
    Element: TtsDBRowElement;
begin
    Result := vtaDefault;
    if not DataBound then begin Result := inherited GetRowVertAlignment(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FVertAlignment;
end;

function TtsCustomDBGrid.IsRowReadOnly(DataRow: Longint): Boolean;
begin
    Result := False;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited IsRowReadOnly(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FReadOnly;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowReadOnly(DataRow: Variant; Value: Boolean);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowReadOnly(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prReadOnly, 0, True);
end;

function TtsCustomDBGrid.GetDBRowReadOnly(DataRow: Variant): Boolean;
var
    Element: TtsDBRowElement;
begin
    Result := False;
    if not DataBound then begin Result := GetRowReadOnly(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FReadOnly;
end;

function TtsCustomDBGrid.GetRowIs3D(DataRow: Longint): Boolean;
begin
    Result := False;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowIs3D(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FIs3D;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowIs3D(DataRow: Variant; Value: Boolean);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowIs3D(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prIs3D, 0, True);
end;

function TtsCustomDBGrid.GetDBRowIs3D(DataRow: Variant): Boolean;
var
    Element: TtsDBRowElement;
begin
    Result := False;
    if not DataBound then begin Result := inherited GetRowIs3D(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FIs3D;
end;

function TtsCustomDBGrid.GetRowDropDownStyle(DataRow: Longint): TtsDropDownStyle;
begin
    Result := ddDropDown;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowDropDownStyle(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.DropDownStyle;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowDropDownStyle(DataRow: Variant; Value: TtsDropDownStyle);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowDropDownStyle(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prDropDownStyle, 0, True);
end;

function TtsCustomDBGrid.GetDBRowDropDownStyle(DataRow: Variant): TtsDropDownStyle;
var
    Element: TtsDBRowElement;
begin
    Result := ddDropDown;
    if not DataBound then begin Result := inherited GetRowDropDownStyle(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.DropDownStyle;
end;

function TtsCustomDBGrid.GetRowButtonType(DataRow: Longint): TtsButtonType;
begin
    Result := btDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowButtonType(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FButtonType;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowButtonType(DataRow: Variant; Value: TtsButtonType);
var
    Element: TtsCustomElement;
begin
    if FAsCombo then Exit;
    if not DataBound then begin inherited SetRowButtonType(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prButtonType, 0, True);
end;

function TtsCustomDBGrid.GetDBRowButtonType(DataRow: Variant): TtsButtonType;
var
    Element: TtsDBRowElement;
begin
    Result := btDefault;
    if not DataBound then begin Result := inherited GetRowButtonType(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FButtonType;
end;

function TtsCustomDBGrid.GetRowWordWrap(DataRow: Longint): TtsWordWrap;
begin
    Result := wwDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowWordWrap(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FWordWrap;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowWordWrap(DataRow: Variant; Value: TtsWordWrap);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowWordWrap(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prWordWrap, 0, True);
end;

function TtsCustomDBGrid.GetDBRowWordWrap(DataRow: Variant): TtsWordWrap;
var
    Element: TtsDBRowElement;
begin
    Result := wwDefault;
    if not DataBound then begin Result := inherited GetRowWordWrap(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FWordWrap;
end;

procedure TtsCustomDBGrid.SetDBRowMaskName(DataRow: Variant; Value: string);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowMaskName(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prMask, 0, True);
end;

function TtsCustomDBGrid.GetDBRowMaskName(DataRow: Variant): string;
var
    Element: TtsDBRowElement;
begin
    Result := '';
    if not DataBound then begin Result := inherited GetRowMaskName(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FMaskName;
end;

function TtsCustomDBGrid.GetRowCombo(DataRow: Longint): TtsCombo;
begin
    Result := nil;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowCombo(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FCombo;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowCombo(DataRow: Variant; Value: TtsDBCombo);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowCombo(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, ObjectToVariant(Value), prCombo, 0, True);
end;

function TtsCustomDBGrid.GetDBRowCombo(DataRow: Variant): TtsDBCombo;
var
    Element: TtsDBRowElement;
begin
    Result := nil;
    if not DataBound then begin Result := TtsDBCombo(inherited GetRowCombo(DataRow)); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := TtsDBCombo(Element.FCombo);
end;

procedure TtsCustomDBGrid.SetDBRowParentCombo(DataRow: Variant; Value: Boolean);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowParentCombo(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prParentCombo, 0, True);
end;

function  TtsCustomDBGrid.GetDBRowParentCombo(DataRow: Variant): Boolean;
var
    Element: TtsDBRowElement;
begin
    Result := True;
    if not DataBound then begin Result := inherited GetRowParentCombo(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FParentCombo;
end;

function TtsCustomDBGrid.GetRowStretchPicture(DataRow: Longint): TtsDrawOption;
begin
    Result := dopDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowStretchPicture(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FStretchPicture;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowStretchPicture(DataRow: Variant; Value: TtsDrawOption);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowStretchPicture(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prPicture, tsStretchId, True);
end;

function TtsCustomDBGrid.GetDBRowStretchPicture(DataRow: Variant): TtsDrawOption;
var
    Element: TtsDBRowElement;
begin
    Result := dopDefault;
    if not DataBound then begin Result := inherited GetRowStretchPicture(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FStretchPicture;
end;

function TtsCustomDBGrid.GetRowShrinkPicture(DataRow: Longint): TtsDrawOption;
begin
    Result := dopDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowShrinkPicture(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FShrinkPicture;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowShrinkPicture(DataRow: Variant; Value: TtsDrawOption);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowShrinkPicture(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prPicture, tsShrinkId, True);
end;

function TtsCustomDBGrid.GetDBRowShrinkPicture(DataRow: Variant): TtsDrawOption;
var
    Element: TtsDBRowElement;
begin
    Result := dopDefault;
    if not DataBound then begin Result := inherited GetRowShrinkPicture(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FShrinkPicture;
end;

function TtsCustomDBGrid.GetRowCenterPicture(DataRow: Longint): TtsDrawOption;
begin
    Result := dopDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowCenterPicture(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FCenterPicture;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowCenterPicture(DataRow: Variant; Value: TtsDrawOption);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowCenterPicture(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prPicture, tsCenterId, True);
end;

function TtsCustomDBGrid.GetDBRowCenterPicture(DataRow: Variant): TtsDrawOption;
var
    Element: TtsDBRowElement;
begin
    Result := dopDefault;
    if not DataBound then begin Result := inherited GetRowCenterPicture(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FCenterPicture;
end;

function TtsCustomDBGrid.GetRowKeepAspectRatio(DataRow: Longint): TtsDrawOption;
begin
    Result := dopDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowKeepAspectRatio(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FKeepAspectRatio;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowKeepAspectRatio(DataRow: Variant; Value: TtsDrawOption);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowKeepAspectRatio(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prPicture, tsRatioId, True);
end;

function TtsCustomDBGrid.GetDBRowKeepAspectRatio(DataRow: Variant): TtsDrawOption;
var
    Element: TtsDBRowElement;
begin
    Result := dopDefault;
    if not DataBound then begin Result := inherited GetRowKeepAspectRatio(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FKeepAspectRatio;
end;

function TtsCustomDBGrid.GetRowControlType(DataRow: Longint): TtsControlType; 
begin
    Result := ctDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowControlType(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FControlType;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowControlType(DataRow: Variant; Value: TtsControlType);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowControlType(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prControlType, 0, True);
end;

function TtsCustomDBGrid.GetDBRowControlType(DataRow: Variant): TtsControlType;
var
    Element: TtsDBRowElement;
begin
    Result := ctDefault;
    if not DataBound then begin Result := inherited GetRowControlType(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FControlType;
end;

function TtsCustomDBGrid.GetRowSpinOptions(DataRow: Longint): TtsSpinOptions;
begin
    Result := [spoAutoRepeat, spoAutoIncrement, spoKeyEdit];
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowSpinOptions(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FSpinOptions;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowSpinOptions(DataRow: Variant; Value: TtsSpinOptions);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowSpinOptions(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Byte(Value), prSpinOptions, 0, True);
end;

function TtsCustomDBGrid.GetDBRowSpinOptions(DataRow: Variant): TtsSpinOptions;
var
    Element: TtsDBRowElement;
begin
    Result := [spoAutoRepeat, spoAutoIncrement, spoKeyEdit];
    if not DataBound then begin Result := inherited GetRowSpinOptions(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FSpinOptions;
end;

function TtsCustomDBGrid.GetRowSpinIncrement(DataRow: Longint): Double;
begin
    Result := 1;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowSpinIncrement(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FSpinIncrement;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowSpinIncrement(DataRow: Variant; Value: Double);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowSpinIncrement(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, Value, prSpinIncrement, 0, True);
end;

function TtsCustomDBGrid.GetDBRowSpinIncrement(DataRow: Variant): Double;
var
    Element: TtsDBRowElement;
begin
    Result := 1;
    if not DataBound then begin Result := inherited GetRowSpinIncrement(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FSpinIncrement;
end;

function TtsCustomDBGrid.GetRowDateTimeDef(DataRow: Longint): TtsDateTimeDefComponent;
begin
    Result := nil;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetRowDateTimeDef(DataRow); Exit end;

    if Active then
    begin
        if GetRowProp(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Prop.FDateTimeDef;
    end;
end;

procedure TtsCustomDBGrid.SetDBRowDateTimeDef(DataRow: Variant; Value: TtsDateTimeDefComponent);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetRowDateTimeDef(DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBRowElement(DataRow));
    FDBRowPropSet.SetProperty([DataRow], Element, ObjectToVariant(Value), prDateTime, 0, False);
end;

function TtsCustomDBGrid.GetDBRowDateTimeDef(DataRow: Variant): TtsDateTimeDefComponent;
var
    Element: TtsDBRowElement;
begin
    Result := nil;
    if not DataBound then begin Result := inherited GetRowDateTimeDef(DataRow); Exit end;
    Element := GetDBRowElement(DataRow);
    if Element <> nil then Result := Element.FDateTimeDef;
end;

procedure TtsCustomDBGrid.SetDBDisplayRownr(DataRow: Variant; Value: Longint);
begin
    if not DataBound then begin inherited SetDisplayRownr(DataRow, Value); Exit end;
end;

function TtsCustomDBGrid.GetDBDisplayRownr(DataRow: Variant): Longint;
begin
    if not DataBound then begin Result := inherited GetDisplayRownr(DataRow); Exit end;
    Result := FGridData.BufferRow(DataRow);
    if Result <= 0 then Result := -1;
end;

function TtsCustomDBGrid.IsRowChanged(DataRow: Longint): Boolean;
begin
    Result := False;
    if (not DataBound) or (DataRow <= 0) then
        begin Result := inherited IsRowChanged(DataRow); Exit end;
    if Active then Result := RowChanged[FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBRowChanged(DataRow: Variant; Value: Boolean);
begin
    if not DataBound then begin inherited SetRowChanged(DataRow, Value); Exit end;
end;

function TtsCustomDBGrid.GetDBRowChanged(DataRow: Variant): Boolean;
begin
    Result := False;
    if not DataBound then begin Result := GetRowChanged(DataRow); Exit end;
end;

function TtsCustomDBGrid.GetRowSelect(DataRow: Longint): Boolean;
begin
    with FGridData do
    begin
        Result := Assigned(FPropBuffer);
        if not Result then Exit;

        if not FPropBuffer[DataRow].SelectedSaved then
        begin
            FPropBuffer[DataRow].Selected := RowSelected[Bookmark[DataRow]];
            FPropBuffer[DataRow].SelectedSaved := True;
            FPropBufferCleared := False;
        end;
    end;
end;

function TtsCustomDBGrid.IsRowSelected(DataRow: Longint): Boolean;
begin
    Result := False;
    if (not DataBound) or (DataRow <= 0) then
        begin Result := inherited IsRowSelected(DataRow); Exit end;

    if Active and (DataRow <= FGridData.BufferRows) then
    begin
        if GetRowSelect(DataRow) then
            Result := FGridData.FPropBuffer[DataRow].Selected;
    end;
end;

procedure TtsCustomDBGrid.Print;
begin
  if GridReport = Nil then
     raise Exception.Create('TopGrid requires a GridReport component to be associated to this grid to support printing !');

  GridReport.Print(Self);
end;

procedure TtsCustomDBGrid.PrintPreview;
begin
  if GridReport = Nil then
     raise Exception.Create('TopGrid requires a GridReport component to be associated to this grid to support printing !');

  GridReport.PrintPreview(Self);
end;

procedure TtsCustomDBGrid.ExportGrid;
var expDialog : TSaveDialog;
    sExt : String;
begin
  if (FGridData.Dataset = Nil) or
     (not FGridData.Dataset.Active) then
     raise Exception.Create('No active Dataset to Export!');

  expDialog := TSaveDialog.Create(Self);
  try
    expDialog.Filter := 'CSV File (*.csv)|*.csv|XML File (*.xml)|*.xml';
    expDialog.FilterIndex := 0;
    expDialog.DefaultExt := 'csv';
    expDialog.Title := 'Grid Export';
    if expDialog.Execute and
       (Length(expDialog.FileName) > 3) then
    begin
      sExt := Lowercase(Copy(expDialog.FileName, Length(expDialog.FileName) - 2, 3));
      if (sExt = 'xml') then
         ExportXML(expDialog.FileName)
      else 
         ExportCSV(expDialog.FileName);
    end;
  finally
    expDialog.Free;
  end;
end;

function TtsCustomDBGrid.DoSelectRows(FromRow, ToRow: TtsBkmPos; Select: Boolean; ByUser: Boolean): Boolean;
var
    CompRes: Integer;
    StartRow, EndRow: Longint;
    OldDatasetPos: TtsDatasetPosition;
    BkmList: TtsSelectedList;
    SelectAll, ClearAll: Boolean;
    Canceled: Boolean;
    BkmEventDone: Boolean;
    DisablePaint: Boolean;
begin
    Result := False;
    if VarIsEmpty(FromRow.Bkm) or VarIsEmpty(ToRow.Bkm) then Exit;
    if VarIsNull(FromRow.Bkm) or VarIsNull(ToRow.Bkm) then Exit;
    if (VarToStr(FromRow.Bkm) = VarToStr(EmptyBookmark)) and not (FromRow.Offset in [bpoBof, bpoEof]) then Exit;
    if (VarToStr(ToRow.Bkm) = VarToStr(EmptyBookmark)) and not (ToRow.Offset in [bpoBof, bpoEof]) then Exit;
    if RowSelectMode in [rsNone] then Exit;
    if (not Select) and (FGridStatus <> grRowSelect) then Exit;

    if not CheckEndEdit(-1, -1, False) then Exit;

    Canceled := False;
    BkmList := nil;
    try
        SelectAll := Select and (FromRow.Offset = bpoBof) and (ToRow.Offset = bpoEof);
        ClearAll := (not Select) and (FromRow.Offset = bpoBof) and (ToRow.Offset = bpoEof);
        BkmEventDone := False;
        try
            if not ClearAll then
            begin
                SaveDatasetPosition(OldDatasetPos);
                try
                    if FDBSelectedRows.UseRangeSelection then
                        CompRes := CompareBkmPos(FromRow, ToRow)
                    else
                    begin
                        BkmEventDone := True;
                        ScanRecordEvent(SelectAll, sstStart, 0, Canceled);
                        if Canceled then Exit;

                        ToRow := FGridData.ActualBkmPos(ToRow);
                        FromRow := FGridData.ActualBkmPos(FromRow);
                        CompRes := GetDatasetList(0, FromRow.Bkm, ToRow.Bkm, 1,
                                                  SelectAll, BkmList, Canceled);
                        if Canceled then Exit;
                    end;

                    if CompRes = 1 then Exit;
                    if (CompRes <> 0) and (RowSelectMode = rsSingle) and
                       (GridMode = gmListBox) then Exit;

                    if (CompRes = 0) and (RowSelectMode = rsSingle) and Select then
                    begin
                        FromRow := FGridData.ActualBkmPos(FromRow);
                        ToRow := FromRow;
                        if RowSelected[FromRow.Bkm] then Exit;
                    end;
                finally
                    RestoreDatasetPosition(OldDatasetPos, True);
                end;
            end;

            DisablePaint := SelectionColorEnabled;
            if DisablePaint then EnablePaint := False;
            try
                if CheckHideControl(True) then Update;
                ClearCurrentFocusRect(True);

                if (GridStatus = grRowSelect) and (RowSelectMode = rsSingle) and
                   Select then
                begin
                    InvertSelectedRows(1, GridRows, False);
                    FDBSelectedRows.ResetAll;
                end;

                DeleteSelections([grColSelect, grCellSelect], True);
                SelectionsChanged(ByUser);

                SaveDatasetPosition(OldDatasetPos);
                try
                    if RecordSelection = rseBookmarkSet then
                        SaveSelectedRows(0)
                    else with FGridData do
                    begin
                        StartRow := BufferBkmPos(FromRow);
                        EndRow := BufferBkmPos(ToRow);

                        DatasetPosition := OldDatasetPos;
                        if (StartRow >= 1) and (StartRow <= BufferRows) then
                        begin
                            if (EndRow > BufferRows) then EndRow := BufferRows;
                            UpdateRowInversion(StartRow, EndRow, Select);
                        end
                        else if (EndRow >= 1) and (EndRow <= BufferRows) then
                        begin
                            if (StartRow < 1) then StartRow := 1;
                            UpdateRowInversion(StartRow, EndRow, Select);
                        end
                        else if (StartRow < 1) and (EndRow > BufferRows) then
                            UpdateRowInversion(1, BufferRows, Select);
                    end;

                    if FDBSelectedRows.UseRangeSelection then
                        FDBSelectedRows.UpdateBkmPosSelection(FromRow, ToRow, Select)
                    else
                    begin
                        if ClearAll then
                            FDBSelectedRows.ResetAll
                        else if Select then
                            FDBSelectedRows.AddSelectedList(BkmList, False, SelectAll, Canceled)
                        else
                            FDBSelectedRows.DeleteSelectedList(BkmList, SelectAll, Canceled);
                    end;

                    if (RecordSelection = rseBookmarkSet) and not Canceled then
                        ToggleSavedRows(1, GridRows, Select);
                finally
                    RestoreDatasetPosition(OldDatasetPos, True);
                end;
            finally
                if DisablePaint then begin EnablePaint := True; Update; end;
            end;
        finally
            CheckEndBkmScan(SelectAll, BkmEventDone, BkmList, Canceled);
        end;
    finally
        BkmList.Free;
    end;

    ShowGridControl;
    DrawCurrentFocusRect(False);
    CheckRowColChanged;
    CheckRowSelection(False);
    SelectionsChanged(ByUser);
    GridStatusChanged;
    Result := not Canceled;
end;

procedure TtsCustomDBGrid.SelectRows(FromRow, ToRow: Variant; Select: Boolean);
begin
    if not DataBound then begin inherited SelectRows(ToRow, FromRow, Select); Exit end;
    if not CheckBkmType(FromRow) or not CheckBkmType(ToRow) then Exit;

    DoSelectRows(CurBkmPos(FromRow), CurBkmPos(ToRow), Select, False);
end;

procedure TtsCustomDBGrid.ChangeSelection(FromRow, ToRow: Variant);
begin
    FDBSelectedRows.ChangeSelection(FromRow, ToRow);
    Invalidate;
    Update;
end;

procedure TtsCustomDBGrid.SetDBRowSelected(DataRow: Variant; Value: Boolean);
var
    DisplayRow: Longint;
begin
    if not DataBound then begin inherited SetRowSelected(DataRow, Value); Exit end;

    if not CheckBkmType(DataRow) then Exit;
{$IFDEF TSVER_V6}
    if VarToStr(DataRow) = VarToStr(EmptyBookmark) then exit;
{$ELSE}
    if DataRow = EmptyBookmark then Exit;
{$ENDIF}
    if RowSelectMode in [rsNone] then Exit;
    if (not Value) and (FGridStatus <> grRowSelect) then Exit;
    if Value and RowSelected[DataRow] then Exit;
    if not CheckEndEdit(-1, -1, False) then Exit;

    if CheckHideControl(True) then Update;

    if (GridStatus = grRowSelect) and (RowSelectMode = rsSingle) and Value then
    begin
        InvertSelectedRows(1, GridRows, False);
        FDBSelectedRows.ResetAll;
    end;

    DeleteSelections([grColSelect, grCellSelect], True);
    SelectionsChanged(False);
    FDBSelectedRows.SetSelected(DataRow, Value);
    DisplayRow := FGridData.BufferRow(DataRow);
    if DisplayRow > 0 then InvertRow(DisplayRow, Value, 0);

    ShowGridControl;
    CheckRowColChanged;
    CheckRowSelection(False);
    SelectionsChanged(False);
    GridStatusChanged;
end;

procedure TtsCustomDBGrid.DeleteAllRowSelection;
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;
    FDBSelectedRows.ResetAll;
end;

procedure TtsCustomDBGrid.SetScrollPosition(DisplayRow: Longint);
var
    IsSelectionStart: Boolean;
    NewScrollPosition: Integer;
    SelStartPos: Integer;
begin
    NewScrollPosition := FScrollPosition;
    if (FSelectDirection <> 0) or (FScrollDirection <> 0) then
    begin
        if FScrollDirection <> 0 then
        begin
            IsSelectionStart := CompareBkm(FGridData.Bookmark[DisplayRow], SelectionStart) = 0;
            if FScrollPosition = 0 then
            begin
                if not IsSelectionStart then NewScrollPosition := FScrollDirection
            end
            else if IsSelectionStart then
                NewScrollPosition := 0;
        end
        else
        begin
            SelStartPos := FGridData.BufferRow(SelectionStart);
            if SelStartPos <> 0 then
            begin
                if DisplayRow < SelStartPos then
                    NewScrollPosition := -1
                else if DisplayRow > SelStartPos then
                    NewScrollPosition := 1
                else
                    NewScrollPosition := 0;
            end;
        end;
    end;

    FPrevScrollPosition := FScrollPosition;
    FScrollPosition := NewScrollPosition;
end;

function TtsCustomDBGrid.CompareRowPos(DisplayRow: Longint): Integer;
begin
    Result := -1;
    if not DataBound then
        begin Result := inherited CompareRowPos(DisplayRow); Exit; end;
    if (not Active) or (DisplayRow > GridRows) then Exit;

    SetScrollPosition(DisplayRow);
    Result := FScrollPosition;
end;

procedure TtsCustomDBGrid.GetFirstLastBkm(First, Last: Longint; var FirstBkm, LastBkm: TBookmarkStr );
var
    Temp: string;
begin
    with FGridData do
    begin
        if First > GridRows then First := GridRows;
        if Last > GridRows then Last := GridRows;
        if First = 0 then FirstBkm := SelectionStart
                     else FirstBkm := Bookmark[First];
        if Last = 0 then LastBkm := SelectionStart
                    else LastBkm := Bookmark[Last];
    end;

    if (BookmarkType = bmtDefault) and (CompareBkm(FirstBkm, LastBkm) > 0) then
    begin
        Temp := FirstBkm;
        FirstBkm := LastBkm;
        LastBkm := Temp;
    end;
end;

procedure TtsCustomDBGrid.GetFirstLastRow(var First, Last: Longint);
begin
    with FGridData do
    begin
        if First = 0 then
        begin
            if CompareBkm(SelectionStart, Bookmark[1]) = -1
                then First := GridTopRow
                else First := MaxVisibleRow;
        end;

        if Last = 0 then
        begin
            if CompareBkm(SelectionStart, Bookmark[1]) = 1
                then Last := GridTopRow
                else Last := MaxVisibleRow;
        end;
    end;

    if First > Last then SwapLongint(First, Last);
end;

procedure TtsCustomDBGrid.SelectCurrentRow(DisplayRow: Longint);
var
    CompRes: Integer;
    LastRow: Longint;
    DatasetPos: TtsDatasetPosition;
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;

    SaveDatasetPosition(DatasetPos);
    try
        CompRes := Sign(DisplayRow - FLastAddedRow);
        LastRow := FLastAddedRow;
        if (CompRes > 0) then
        begin
            if CheckSetCurrent(DatasetPos, DisplayRow) then
                DatasetPos.ActiveRow := FGridData.ActiveRecord;

            if (DisplayRow > 1) then
            begin
                ChangeRowInversion(CalcMax(LastRow, 1), DisplayRow - 1, False);
                ChangeRowSelection(CalcMax(LastRow, 1), DisplayRow - 1);
            end;
            SetLastAddedRow(DisplayRow);
        end
        else if CompRes < 0 then
        begin
            if CheckSetCurrent(DatasetPos, DisplayRow) then
                DatasetPos.ActiveRow := FGridData.ActiveRecord;

            if (DisplayRow < GridRows) then
            begin
                ChangeRowInversion(DisplayRow + 1, CalcMin(LastRow, GridRows), False);
                ChangeRowSelection(DisplayRow + 1, CalcMin(LastRow, GridRows));
            end;
            SetLastAddedRow(DisplayRow);
        end
        else if FAsCombo and (RowSelectMode = rsSingle) then
        begin
            if ((not FMouseOverGrid) and IsRowSelected(DisplayRow)) or
               (FMouseOverGrid and (not IsRowSelected(DisplayRow))) then
            begin
                ChangeRowInversion(DisplayRow, DisplayRow, False);
                ChangeRowSelection(DisplayRow, DisplayRow);
            end;
        end;
    finally
        RestoreDatasetPosition(DatasetPos, True);
    end;

    SelectionsChanged(True);
end;

procedure TtsCustomDBGrid.SaveDatasetPosition(var DatasetPos: TtsDatasetPosition);
begin
    DatasetPos := FGridData.DatasetPosition;
    FGridData.CanDisableControls := True;
end;

procedure TtsCustomDBGrid.RestoreDatasetPosition(DatasetPos: TtsDatasetPosition; Reset: Boolean);
begin
    try
        if Reset then FGridData.DatasetPosition := DatasetPos;
    finally
        FGridData.CanDisableControls := False;
    end;
end;

procedure TtsCustomDBGrid.SavePosition(var Position: TtsDatasetPosition);
begin
    Position := FGridData.DatasetPosition;
end;

procedure TtsCustomDBGrid.RestorePosition(Position: TtsDatasetPosition);
begin
    FGridData.DatasetPosition := Position;
end;

procedure TtsCustomDBGrid.SelectLargerRows(DisplayRow: Longint);
var
    DisplayBkm: TtsBkmPos;
    StartBkmPos: TtsBkmPos;
    CurCompRes: Integer;
    LastGreaterEqual: Boolean;
    LastRow, CurRow: Longint;
    SetLastAdded: Boolean;
    OldDatasetPos: TtsDatasetPosition;
    CombineRange: TtsCombineRange;
    LastAddedRownr: Longint;
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;

    SaveDatasetPosition(OldDatasetPos);
    try
        if DisplayRow > GridRows then Dec(DisplayRow);

        with FGridData do
        begin
            if DisplayRow < 1 then
                DisplayBkm := CheckPrevBkmPos(CurBkmPos(Bookmark[1]))
            else if DisplayRow > GridRows then
                DisplayBkm := CheckNextBkmPos(CurBkmPos(Bookmark[GridRows]))
            else
                DisplayBkm := CurBkmPos(Bookmark[DisplayRow]);
        end;

        if FScrollDirection = -1
            then CombineRange := crNext
        else if FScrollDirection = 1
            then CombineRange := crPrior
            else CombineRange := crBoth;

        CurCompRes := Sign(DisplayRow - FLastAddedRow);
        if CurCompRes = 0 then
        begin
            if (RowSelectMode = rsSingle) and FAsCombo then
                SelectCurrentRow(DisplayRow);
            Exit;
        end;

        if CurrentRowChanged(DisplayRow) then
            if not CheckEndEdit(-1, -1, True) then Exit;

        with FGridData, FDBSelectedRows do
        begin
            SetLastAdded := False;
            LastAddedRownr := FLastAddedRow;
            LastRow := FLastAddedRow;
            CurRow := BufferPos(SelectionStart);
            if (BookmarkType = bmtNonOrdered) and (CurRow = 0) and (FScrollPosition = -1) then
                CurRow := BufferRows + 1;

            StartBkmPos := CurBkmPos(SelectionStart);
            LastGreaterEqual := FPrevScrollPosition >= 0;

            if RowSelectMode = rsMulti then
            begin
                if (CurCompRes <> 0) then
                begin
                    if CheckSetCurrent(OldDatasetPos, DisplayRow) then
                        OldDatasetPos.ActiveRow := ActiveRecord;
                end;

                if (CurCompRes > 0) and LastGreaterEqual then
                begin
                    if UseRangeSelection
                        then ChangeBkmPosSelection(NextBkmPos(FLastAddedBkmPos), DisplayBkm, CombineRange)
                        else ChangeRownrSelection(LastAddedRownr + 1, DisplayRow);
                    ChangeRowInversion(LastRow + 1, DisplayRow, True);
                    SetLastAdded := True;
                end
                else if (CurCompRes > 0) and not LastGreaterEqual then
                begin
                    ChangeRowInversion(LastRow, CurRow - 1, False);
                    if UseRangeSelection then
                    begin
                        ChangeBkmPosSelection(FLastAddedBkmPos, PrevBkmPos(CurBkmPos(SelectionStart)), CombineRange);
                        ChangeBkmPosSelection(NextBkmPos(CurBkmPos(SelectionStart)), DisplayBkm, CombineRange);
                    end
                    else
                    begin
                        ChangeRownrSelection(LastAddedRownr, CurRow - 1);
                        ChangeRownrSelection(CurRow + 1, DisplayRow);
                    end;
                    ChangeRowInversion(CurRow + 1, DisplayRow, True);
                    SetLastAdded := True;
                end
                else if (CurCompRes < 0) then
                begin
                    ChangeRowInversion(LastRow, DisplayRow + 1, False);
                    if UseRangeSelection
                        then ChangeBkmPosSelection(NextBkmPos(DisplayBkm), FLastAddedBkmPos, CombineRange)
                        else ChangeRownrSelection(DisplayRow + 1, LastAddedRownr);
                    SetLastAdded := True;
                end;
            end
            else
            begin
                if (LastRow < GridRows) then
                begin
                    if (LastRow > 0) and IsRowSelected(LastRow) then
                        InvertRow(LastRow, False, 0);
                    ResetAll;

                    ClearCurrent(LastRow);
                    SetCurrentRowSelect(DisplayRow, True);
                    OldDatasetPos.ActiveRow := DisplayRow;

                    if FMouseOverGrid or not FAsCombo then
                    begin
                        if UseRangeSelection
                            then UpdateBkmPosSelection(DisplayBkm, DisplayBkm, True)
                            else ChangeRownrSelection(DisplayRow, DisplayRow);

                        if (DisplayRow > 0) and (DisplayRow <= GridRows) then
                            InvertRow(DisplayRow, True, 0);
                    end;

                    SelectionStart := ActualBkmPos(DisplayBkm).Bkm;
                    SetLastAdded := True;
                end;
            end;

            if SetLastAdded then
            begin
                FLastAddedRow := DisplayRow;
                FLastAddedBookmark := DisplayBkm.Bkm;
                FLastAddedBkmPos := DisplayBkm;
            end;
        end;
    finally
        RestoreDatasetPosition(OldDatasetPos, True);
    end;

    UpdateScrollPos;
    CheckRowColChanged;
    SelectionsChanged(True);
end;

procedure TtsCustomDBGrid.SelectSmallerRows(DisplayRow: Longint);
var
    DisplayBkm: TtsBkmPos;
    StartBkmPos: TtsBkmPos;
    CurCompRes: Integer;
    LastLessEqual: Boolean;
    LastRow, CurRow: Longint;
    SetLastAdded: Boolean;
    OldDatasetPos: TtsDatasetPosition;
    CombineRange: TtsCombineRange;
    LastAddedRownr: Longint;
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;

    SaveDatasetPosition(OldDatasetPos);
    try
        with FGridData do
        begin
            if DisplayRow < 1 then
                DisplayBkm := CheckPrevBkmPos(CurBkmPos(Bookmark[1]))
            else if DisplayRow > GridRows then
                DisplayBkm := CheckNextBkmPos(CurBkmPos(Bookmark[GridRows]))
            else
                DisplayBkm := CurBkmPos(Bookmark[DisplayRow]);
        end;

        if FScrollDirection = -1
            then CombineRange := crNext
        else if FScrollDirection = 1
            then CombineRange := crPrior
            else CombineRange := crBoth;

        CurCompRes := Sign(DisplayRow - FLastAddedRow);
        if CurCompRes = 0 then
        begin
            if (RowSelectMode = rsSingle) and FAsCombo then
                SelectCurrentRow(DisplayRow);
            Exit;
        end;

        if CurrentRowChanged(DisplayRow) then
            if not CheckEndEdit(-1, -1, True) then Exit;

        with FGridData, FDBSelectedRows do
        begin
            SetLastAdded := False;
            LastAddedRownr := FLastAddedRow;
            LastRow := FLastAddedRow;
            CurRow := BufferPos(SelectionStart);
            if (BookmarkType = bmtNonOrdered) and (CurRow = 0) and (FScrollPosition = -1) then
                CurRow := BufferRows + 1;

            StartBkmPos := CurBkmPos(SelectionStart);
            LastLessEqual := FPrevScrollPosition <= 0;
            if RowSelectMode = rsMulti then
            begin
                if CurCompRes <> 0 then
                begin
                    if CheckSetCurrent(OldDatasetPos, DisplayRow) then
                        OldDatasetPos.ActiveRow := ActiveRecord;
                end;

                if (CurCompRes < 0) and LastLessEqual then
                begin
                    if UseRangeSelection
                        then ChangeBkmPosSelection(DisplayBkm, PrevBkmPos(FLastAddedBkmPos), CombineRange)
                        else ChangeRownrSelection(DisplayRow, LastAddedRownr - 1);
                    ChangeRowInversion(LastRow - 1, DisplayRow, True);
                    SetLastAdded := True;
                end
                else if (CurCompRes < 0) and not LastLessEqual then
                begin
                    ChangeRowInversion(LastRow, CurRow + 1, False);
                    if UseRangeSelection then
                    begin
                        ChangeBkmPosSelection(NextBkmPos(CurBkmPos(SelectionStart)), FLastAddedBkmPos, CombineRange);
                        ChangeBkmPosSelection(DisplayBkm, PrevBkmPos(CurBkmPos(SelectionStart)), CombineRange);
                    end
                    else
                    begin
                        ChangeRownrSelection(CurRow + 1, LastAddedRownr);
                        ChangeRownrSelection(DisplayRow, CurRow - 1);
                    end;
                    ChangeRowInversion(CurRow - 1, DisplayRow, True);
                    SetLastAdded := True;
                end
                else if (CurCompRes > 0) then
                begin
                    ChangeRowInversion(LastRow, DisplayRow - 1, False);
                    if UseRangeSelection
                        then ChangeBkmPosSelection(FLastAddedBkmPos, PrevBkmPos(DisplayBkm), CombineRange)
                        else ChangeRownrSelection(LastAddedRownr, DisplayRow - 1);
                    SetLastAdded := True;
                end;
            end
            else
            begin
                if (LastRow > 1) then
                begin
                    if (LastRow <= GridRows) and IsRowSelected(LastRow) then
                        InvertRow(LastRow, False, 0);
                    ResetAll;

                    ClearCurrent(LastRow);
                    SetCurrentRowSelect(DisplayRow, True);
                    OldDatasetPos.ActiveRow := DisplayRow;

                    if FMouseOverGrid or not FAsCombo then
                    begin
                        if UseRangeSelection
                            then UpdateBkmPosSelection(DisplayBkm, DisplayBkm, True)
                            else ChangeRownrSelection(DisplayRow, DisplayRow);

                        if (DisplayRow > 0) and (DisplayRow <= GridRows) then
                            InvertRow(DisplayRow, True, 0);
                    end;

                    SelectionStart := ActualBkmPos(DisplayBkm).Bkm;
                    SetLastAdded := True;
                end;
            end;

            if SetLastAdded then
            begin
                FLastAddedRow := DisplayRow;
                FLastAddedBookmark := DisplayBkm.Bkm;
                FLastAddedBkmPos := DisplayBkm;
            end;
        end;
    finally
        RestoreDatasetPosition(OldDatasetPos, True);
    end;

    UpdateScrollPos;
    CheckRowColChanged;
    SelectionsChanged(True);
end;

procedure TtsCustomDBGrid.RowSelectScroll(CurrentBkm: TBookmarkStr; Count: Integer);
begin
    if UseStandardScrolling then
    begin
        FPrevDisplayRow := CurDisplayRow;
        SetCurrentRec(CurrentBkm, 0);
        DBScroll(0, Count, smRowSelect, False);
    end
    else
        DBScroll(0, Count, smWindow, True);
end;

procedure TtsCustomDBGrid.AddScrollingUp;
var
    TopBkmPos: TtsBkmPos;
    OldDatasetPos: TtsDatasetPosition;
begin
    SaveDatasetPosition(OldDatasetPos);
    try
        with FGridData, FDBSelectedRows do
        begin
            TopBkmPos := CurBkmPos(TopRow);
            if (FSelectDirection < 0) or (FScrollDirection < 0) then
            begin
                if UseRangeSelection
                    then ChangeBkmPosSelection(TopBkmPos, PrevBkmPos(FLastAddedBkmPos), crNext)
                    else ChangeRownrSelection(GridTopRow, FLastAddedRow);
                FLastAddedBookmark := TopBkmPos.Bkm;
                FLastAddedBkmPos := TopBkmPos;
                FLastAddedRow := GridTopRow;
            end;
        end;
    finally
        RestoreDatasetPosition(OldDatasetPos, True);
    end;

    RowSelectScroll(TopBkmPos.Bkm, -1);
    Update;
    CheckTopLeftChanged(True);
    SelectionsChanged(True);
end;

procedure TtsCustomDBGrid.DeleteScrollingUp;
var
    TopBkmPos: TtsBkmPos;
    OldDatasetPos: TtsDatasetPosition;
begin
    SaveDatasetPosition(OldDatasetPos);
    try
        with FGridData, FDBSelectedRows do
        begin
            TopBkmPos := CurBkmPos(Bookmark[1]);
            FLastAddedBkmPos := ActualBkmPos(FLastAddedBkmPos);
            if RowSelectMode = rsMulti then
            begin
                if UseRangeSelection
                    then ChangeBkmPosSelection(TopBkmPos, FLastAddedBkmPos, crNext)
                    else ChangeRownrSelection(GridTopRow, FLastAddedRow + 1);
                DatasetPosition := OldDatasetPos;
                RowSelectScroll(FirstBkmPos.Bkm, -1);
                FLastAddedBookmark := PrevBkmPos(TopBkmPos).Bkm;
                FLastAddedBkmPos := PrevBkmPos(TopBkmPos);
                FLastAddedRow := GridTopRow - 1;
            end
            else
            begin
                ResetAll;
                if FMouseOverGrid or not FAsCombo then
                begin
                    if UseRangeSelection
                        then UpdateBkmPosSelection(TopBkmPos, TopBkmPos, True)
                        else ChangeRownrSelection(1, 1);
                end;

                DatasetPosition := OldDatasetPos;
                PositionCell(LeftCol, 1);
                SetCurrentRec(TopBkmPos.Bkm, 1);
                DBScroll(0, -1, smRowSelect, True);

                FLastAddedBookmark := TopBkmPos.Bkm;
                FLastAddedBkmPos := TopBkmPos;
                SelectionStart := TopBkmPos.Bkm;
            end;
        end;
    finally
        RestoreDatasetPosition(OldDatasetPos, True);
    end;

    Update;
    CheckRowColChanged;
    CheckTopLeftChanged(True);
    SelectionsChanged(True);
end;

procedure TtsCustomDBGrid.AddTopRowScrollingUp;
var
    TopBkmPos: TtsBkmPos;
begin
    with FGridData, FDBSelectedRows do
    begin
        TopBkmPos := CurBkmPos(Bookmark[GridTopRow - 1]);
        if FSelectDirection < 0 then
        begin
            if UseRangeSelection
                then ChangeBkmPosSelection(TopBkmPos, PrevBkmPos(FLastAddedBkmPos), crBoth)
                else ChangeRownrSelection(GridTopRow - 1, FLastAddedRow - 1);
            FLastAddedBookmark := TopBkmPos.Bkm;
            FLastAddedBkmPos := TopBkmPos;
            FLastAddedRow := GridTopRow - 1;
        end;
    end;

    AdjustTopLeft(LeftCol, GridTopRow - 1, True);
    Update;
    SelectionsChanged(True);
end;

procedure TtsCustomDBGrid.DeleteTopRowScrollingUp;
var
    TopBkmPos: TtsBkmPos;
begin
    with FGridData, FDBSelectedRows do
    begin
        TopBkmPos := CurBkmPos(Bookmark[GridTopRow - 1]);
        if RowSelectMode = rsMulti then
        begin
            if UseRangeSelection
                then ChangeBkmPosSelection(TopBkmPos, FLastAddedBkmPos, crBoth)
                else ChangeRownrSelection(GridTopRow - 1, FLastAddedRow);
            AdjustTopLeft(LeftCol, GridTopRow - 1, True);
            FLastAddedBookmark := PrevBkmPos(TopBkmPos).Bkm;
            FLastAddedBkmPos := PrevBkmPos(TopBkmPos);
            FLastAddedRow := GridTopRow - 1;
        end
        else
        begin
            ResetAll;
            if UseRangeSelection
                then UpdateBkmPosSelection(TopBkmPos, TopBkmPos, True)
                else ChangeRownrSelection(GridTopRow - 1, GridTopRow - 1);

            FLastAddedBookmark := TopBkmPos.Bkm;
            FLastAddedBkmPos := TopBkmPos;
            FLastAddedRow := GridTopRow - 1;

            PositionCell(LeftCol, GridTopRow - 1);
            SetCurrentRec(TopBkmPos.Bkm, GridTopRow - 1);

            SetScrollMode(smRowSelect);
            try
                AdjustTopLeft(LeftCol, GridTopRow - 1, True);
            finally
                SetScrollMode(smWindow);
            end;
        end;

        Update;
        CheckRowColChanged;
        SelectionsChanged(True);
    end;
end;

procedure TtsCustomDBGrid.AddScrollingDown;
var
    LastRow: Longint;
    LastBkm: TtsBkmPos;
    OldDatasetPos: TtsDatasetPosition;
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;

    SaveDatasetPosition(OldDatasetPos);
    try
        with FGridData, FDBSelectedRows do
        begin
            LastRow := LastVisibleRow(GridTopRow);
            if IsInsertRow(LastRow) then Dec(LastRow);
            LastBkm := CurBkmPos(Bookmark[LastRow]);

            if RowSelectMode = rsMulti then
            begin
                if UseRangeSelection
                    then ChangeBkmPosSelection(CheckNextBkmPos(FLastAddedBkmPos), LastBkm, crPrior)
                    else ChangeRownrSelection(FLastAddedRow, LastRow);
                DatasetPosition := OldDatasetPos;
                RowSelectScroll(LastBkm.Bkm, 1);
                FLastAddedBookmark := LastBkm.Bkm;
                FLastAddedBkmPos := LastBkm;
                FLastAddedRow := LastRow;
            end
            else
            begin
                ResetAll;
                if FMouseOverGrid or not FAsCombo then
                begin
                    if UseRangeSelection
                        then UpdateBkmPosSelection(LastBkm, LastBkm, True)
                        else ChangeRownrSelection(LastRow, LastRow);
                end;

                DatasetPosition := OldDatasetPos;
                PositionCell(LeftCol, LastRow);
                SetCurrentRec(LastBkm.Bkm, LastRow);
                DBScroll(0, 1, smRowSelect, True);

                FLastAddedBookmark := LastBkm.Bkm;
                FLastAddedBkmPos := LastBkm;
                FLastAddedRow := LastRow;
                SelectionStart := LastBkm.Bkm;
            end;
        end;
    finally
        RestoreDatasetPosition(OldDatasetPos, True);
    end;

    Update;
    CheckRowColChanged;
    CheckTopLeftChanged(True);
    SelectionsChanged(True);
end;

procedure TtsCustomDBGrid.DeleteScrollingDown;
var
    LastBkm: TtsBkmPos;
    LastRow: Longint;
    DatasetPos: TtsDatasetPosition;
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;

    SaveDatasetPosition(DatasetPos);
    try
        with FGridData, FDBSelectedRows do
        begin
            LastRow := LastVisibleRow(GridTopRow);
            if IsInsertRow(LastRow) then Dec(LastRow);
            LastBkm := CurBkmPos(Bookmark[LastRow]);

            if (FSelectDirection >= 0) or (FScrollDirection > 0) then
            begin
                if UseRangeSelection
                    then ChangeBkmPosSelection(FLastAddedBkmPos, LastBkm, crPrior)
                    else ChangeRownrSelection(FLastAddedRow - 1, LastRow);
                FLastAddedBookmark := NextBkmPos(LastBkm).Bkm;
                FLastAddedBkmPos := NextBkmPos(LastBkm);
                FLastAddedRow := LastRow + 1;
            end;
        end;
    finally
        RestoreDatasetPosition(DatasetPos, True);
    end;

    RowSelectScroll(LastBkm.Bkm, 1);
    Update;
    CheckTopLeftChanged(True);
    SelectionsChanged(True);
end;

procedure TtsCustomDBGrid.UpRowSelecting(CurrentPos, CheckPos: TPoint; DisplayRow: Longint);
var
    Msg: TMsg;
    CompRes: Integer;
    MoveCount: Integer;
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;

    CompRes := CompareRowPos(GridTopRow);
    FScrollDirection := -1;
    try
        if CompRes > 0 then
            SelectLargerRows(GridTopRow - 1)
        else if CompRes < 0 then
            SelectSmallerRows(GridTopRow)
        else
            SelectCurrentRow(GridTopRow);

        while CurrentPos.Y = CheckPos.Y do
        begin
            if PeekMessage(Msg, Handle, WM_MouseFirst, WM_MouseLast, PM_NoRemove) then Break;
            if CheckEscape then Break;
            if not ScrollDelay(CurrentPos.X, CurrentPos.Y, 1) then Break;

            with FGridData, FDBSelectedRows do
            begin
                if GridTopRow > 1 then
                begin
                    CompRes := CompareRowPos(GridTopRow - 1);
                    if CompRes > 0 then
                        DeleteTopRowScrollingUp
                    else if CompRes < 0 then
                    begin
                        if RowSelectMode = rsMulti then
                            AddTopRowScrollingUp
                        else
                            DeleteTopRowScrollingUp;
                    end
                    else if CompRes = 0 then
                    begin
                        if RowSelectMode = rsMulti then
                        begin
                            AdjustTopLeft(LeftCol, GridTopRow - 1, True);
                            FLastAddedBookmark := TopRow;
                            FLastAddedBkmPos := CurBkmPos(FLastAddedBookmark);
                            FLastAddedRow := GridTopRow;
                            Update;
                        end
                        else
                            DeleteTopRowScrollingUp;
                    end;
                end
                else
                begin
                    IgnoreDatasetScrolled := True;
                    try
                        MoveCount := MoveBy(-1);
                        UpdateRowCount(True);
                    finally
                        IgnoreDatasetScrolled := False;
                    end;

                    if MoveCount = 0 then
                    begin
                        if CompareRowPos(GridTopRow) = 0 then SelectCurrentRow(1);
                        Break;
                    end;

                    CompRes := CompareRowPos(GridTopRow);
                    if CompRes > 0 then
                        DeleteScrollingUp
                    else if CompRes < 0 then
                    begin
                        if RowSelectMode = rsMulti then
                            AddScrollingUp
                        else
                            DeleteScrollingUp;
                    end
                    else if CompRes = 0 then
                    begin
                        if RowSelectMode = rsMulti then
                        begin
                            RowSelectScroll(TopRow, -1);
                            FLastAddedBookmark := TopRow;
                            FLastAddedBkmPos := CurBkmPos(FLastAddedBookmark);
                            FLastAddedRow := GridTopRow;
                            Update;
                            CheckTopLeftChanged(True);
                        end
                        else
                            DeleteScrollingUp;
                    end;
                end;
            end;

            GetCursorPos(CurrentPos);
        end;
    finally
        FScrollDirection := 0;
    end;
end;

procedure TtsCustomDBGrid.DownRowSelecting(CurrentPos, CheckPos: TPoint; DisplayRow: Longint);
var
    Msg: TMsg;
    CompRes: Integer;
    MoveCount: Integer;
    CurRow: Longint;
    BottomBkm: TBookmarkStr;
    MaxRow: Longint;
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;

    MaxRow := CalcMin(MaxVisibleRow, GridRows);
    CompRes := CompareRowPos(MaxRow);

    FScrollDirection := 1;
    try
        if CompRes > 0 then
            SelectLargerRows(MaxRow)
        else if CompRes < 0 then
            SelectSmallerRows(MaxRow + 1)
        else
            SelectCurrentRow(MaxRow);

        while CurrentPos.Y = CheckPos.Y do
        begin
            if PeekMessage(Msg, Handle, WM_MouseFirst, WM_MouseLast, PM_NoRemove) then Break;
            if CheckEscape then Break;
            if not ScrollDelay(CurrentPos.X, CurrentPos.Y, 1) then Break;

            with FGridData do
            begin
                IgnoreDatasetScrolled := True;
                try
                    MoveCount := MoveBy(1);
                    UpdateRowCount(True);
                finally
                    IgnoreDatasetScrolled := False;
                end;

                CurRow := CalcMin(GridRows, GridTopRow + VisibleRowCount);
                BottomBkm := Bookmark[CurRow];
                if MoveCount = 0 then
                begin
                    if CompareRowPos(CurRow) = 0 then SelectCurrentRow(CurRow);

                    if GridTopRow < GetMaxTopRow then
                    begin
                        AdjustTopLeft(LeftCol, GridTopRow + 1, True);
                        Update;
                    end
                    else
                        Break;
                end
                else
                begin
                    CompRes := CompareRowPos(CurRow);
                    if CompRes > 0 then
                        AddScrollingDown
                    else if CompRes < 0 then
                    begin
                        if RowSelectMode = rsMulti
                            then DeleteScrollingDown
                            else AddScrollingDown;
                    end
                    else if CompRes = 0 then
                    begin
                        if RowSelectMode = rsMulti then
                        begin
                            RowSelectScroll(BottomBkm, 1);
                            FLastAddedBookmark := BottomBkm;
                            FLastAddedBkmPos := CurBkmPos(FLastAddedBookmark);
                            FLastAddedRow := CurRow;
                            Update;
                            CheckTopLeftChanged(True);
                        end
                        else
                            AddScrollingDown;
                    end;
                end;

                GetCursorPos(CurrentPos);
            end;
        end;
    finally
        FScrollDirection := 0;
    end;
end;

procedure TtsCustomDBGrid.SetSelectDirection(DisplayRow: Longint);
begin
    FSelectDirection := Sign(DisplayRow - FLastAddedRow);
end;

function TtsCustomDBGrid.ScrollRows(X, Y: integer; var DisplayCol, DisplayRow: Longint): Boolean;
var
    OldColumn: Longint;
begin
    Result := False;
    if not DataBound then
        begin Result := inherited ScrollRows(X, Y, DisplayCol, DisplayRow); Exit; end;
    if not Active then Exit;

    if (Y >= GetMaxScrollHeight) then
    begin
        Result := True;
        if FIgnoreScrolling then Exit;

        OldColumn := DisplayCol;
        SetSelectDirection(DisplayRow);
        MoveView(mdUp, DisplayCol, DisplayRow);

        if (DisplayRow >= RowCount) or (DisplayRow < 0) then
        begin
            DisplayRow := RowCount - 1;
        end;

        DisplayCol := OldColumn;
    end
    else if (Y < FVertFixedHeight) then
    begin
        Result := True;
        if FIgnoreScrolling then Exit;

        OldColumn := DisplayCol;
        SetSelectDirection(DisplayRow);
        MoveView(mdDown, DisplayCol, DisplayRow);

        if (DisplayRow >= RowCount) or (DisplayRow < 0) then
        begin
            DisplayRow := 1;
        end;

        DisplayCol := OldColumn;
    end
    else if FIgnoreScrolling then
    begin
        FIgnoreScrolling := False;
    end;

    if not Result then SetSelectDirection(DisplayRow);
end;

procedure TtsCustomDBGrid.AddRowSelection(First, Last: Longint);
var
    FirstBkm, LastBkm: TBookmarkStr;
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;

    GetFirstLastBkm(First, Last, FirstBkm, LastBkm);
    FDBSelectedRows.UpdateSelection(FirstBkm, LastBkm, True);
end;

procedure TtsCustomDBGrid.InvertUnselectedRows(FromRow, ToRow: Longint);
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;

    GetFirstLastRow(FromRow, ToRow);
    UpdateRowInversion(FromRow, ToRow, True);
end;

procedure TtsCustomDBGrid.DeleteRowSelection(First, Last: Longint);
var
    FirstBkm, LastBkm: TBookmarkStr;
begin
    if not DataBound then begin; inherited; Exit; end;
    if not Active then Exit;

    GetFirstLastBkm(First, Last, FirstBkm, LastBkm);
    FDBSelectedRows.UpdateSelection(FirstBkm, LastBkm, False);
end;

procedure TtsCustomDBGrid.ChangeRowSelection(First, Last: Longint);
var
    FirstBkm, LastBkm: TBookmarkStr;
begin
    if not DataBound then begin; inherited; Exit; end;
    if not Active then Exit;

    if FDBSelectedRows.UseRangeSelection then
    begin
        GetFirstLastBkm(First, Last, FirstBkm, LastBkm);
        if not FDBSelectedRows.RowsSelected
            then FDBSelectedRows.UpdateSelection(FirstBkm, LastBkm, True)
            else FDBSelectedRows.ChangeSelection(FirstBkm, LastBkm);
    end
    else
    begin
        if First > Last then SwapLongint(First, Last);
        FDBSelectedRows.ChangeRownrSelection(First, Last);
    end;
end;

procedure TtsCustomDBGrid.ScanRecordEvent(ScanAll: Boolean; State: TtsScanState; Count: Longint; var Cancel: Boolean);
begin
    if State = sstStart then FInScanRecords := True;
    DoOnScanRecords(ScanAll, State, Count, Cancel);
    if State = sstEnd then FInScanRecords := False;
end;

procedure TtsCustomDBGrid.DoScanRecord(ScanAll: Boolean; State: TtsScanState;
                                       var Count, Total: Longint; var Canceled: Boolean);
begin
    if (not Canceled) or (Count < Total) then Count := Count + 1;
    if Count > Total then
    begin
        Total := Count;
        ScanRecordEvent(ScanAll, State, Total, Canceled);
    end;
end;

procedure TtsCustomDBGrid.GetBufferList(StartRow, DisplayRow: Longint; List: TtsSelectedList;
                                        SelectingAll: Boolean; var Count, Total: Longint; var Canceled: Boolean);
var
    I: Longint;
    FromRow, ToRow: Longint;
begin
    FromRow := StartRow;
    ToRow := DisplayRow;
    if FromRow > ToRow then SwapLongint(FromRow, ToRow);
    for I := FromRow to ToRow do
    begin
        DoScanRecord(SelectingAll, sstScan, Count, Total, Canceled);
        if Canceled and (Count >= Total) then Break;
        List.AddItem(FGridData.Bookmark[I]);
    end;
end;

function TtsCustomDBGrid.GetDatasetList(DisplayRow: Integer; FromBkm, ToBkm: TBookmarkStr;
                                        Direction: Integer; SelectingAll: Boolean; var List: TtsSelectedList;
                                        var Canceled: Boolean): Integer;
var
    UpList, DownList: TtsSelectedList;
    Eof, Bof: Boolean;
    StepSize: Integer;
    UpFound, DownFound: Boolean;
    UpBkm, DownBkm: TBookmarkStr;
    OldBookmark: TBookmarkStr;
    Total, UpCount, DownCount: Longint;
    GoUp, GoDown: Boolean;
begin
    List := nil;
    try
        UpList := nil;
        DownList := nil;
        try
            UpList := TtsSelectedList.Create;
            DownList := TtsSelectedList.Create;
            with FGridData do
            begin
                Result := 0;
                UpFound := False;
                DownFound := False;
                Total := 0;
                UpCount := 0;
                DownCount := 0;
                Canceled := False;

                if (Direction = 0) and (BookmarkType = bmtDefault) and
                   (FromBkm <> '') and (ToBkm <> '') then
                begin
                    Direction := -CompareBkm(FromBkm, ToBkm);
                end;

                if DisplayRow <> 0 then
                begin
                    UpBkm := Bookmark[1];
                    DownBkm := Bookmark[BufferRows];

                    if Direction <= 0 then
                    begin
                        GetBufferList(1, DisplayRow, UpList, SelectingAll, UpCount, Total, Canceled);
                        if Canceled and (UpCount >= Total) and (DownCount >= Total) then Exit;
                    end;

                    if Direction >= 0 then
                    begin
                        GetBufferList(DisplayRow, BufferRows, DownList, SelectingAll, DownCount, Total, Canceled);
                        if Canceled and (UpCount >= Total) and (DownCount >= Total) then Exit;
                    end;
                end
                else
                begin
                    UpBkm := FromBkm;
                    DownBkm := FromBkm;
                    if FromBkm <> '' then
                    begin
                        UpList.Add(FromBkm);
                        DoScanRecord(SelectingAll, sstScan, UpCount, Total, Canceled);
                        if Canceled and (UpCount >= Total) and (DownCount >= Total) then Exit;

                        DownList.Add(FromBkm);
                        DoScanRecord(SelectingAll, sstScan, DownCount, Total, Canceled);
                        if Canceled and (UpCount >= Total) and (DownCount >= Total) then Exit;

                        UpFound := CompareBkm(UpBkm, ToBkm) = 0;
                        if not UpFound then DownFound := CompareBkm(DownBkm, ToBkm) = 0;
                    end;
                end;

                Eof := False;
                Bof := False;
                StepSize := 10;
                if Direction <> 0 then StepSize := 0;

                OldBookmark := FGridData.BookmarkPos;
                try
                    GoUp := (Direction <= 0) and not Bof and not (Canceled and (UpCount >= Total));
                    GoDown := (Direction >= 0) and not Eof and not (Canceled and (DownCount >= Total));
                    while not UpFound and not DownFound do
                    begin
                        if not GoUp or not GoDown then StepSize := 0;
                        if GoUp then
                        begin
                            Bof := GetPreviousBkms(UpBkm, ToBkm, UpList, StepSize, SelectingAll,
                                                   UpFound, UpCount, Total, Canceled);
                            if Canceled and (UpCount >= Total) then GoUp := False;
                            if Bof then GoUp := False;
                        end;

                        if GoDown and (not UpFound) then
                        begin
                            Eof := GetNextBkms(DownBkm, ToBkm, DownList, StepSize, SelectingAll,
                                               DownFound, DownCount, Total, Canceled);
                            if Canceled and (DownCount >= Total) then GoDown := False;
                            if Eof then GoDown := False;
                        end;

                        if UpFound or DownFound then Canceled := False;
                        if Canceled and not GoUp and not GoDown then Exit;
                        if not GoUp and not GoDown then Break;
                    end;
                finally
                    FGridData.BookmarkPos := OldBookmark;
                end;

                if Eof and (ToBkm = '') then DownFound := True;
                if UpFound then List := UpList;
                if DownFound then List := DownList;

                if CompareBkm(FromBkm, ToBkm) = 0 then
                    Result := 0
                else if UpFound then
                    Result := 1
                else if DownFound then
                    Result := -1
                else
                    Result := 0;
            end;
        finally
            if List <> DownList then DownList.Free;
            if List <> UpList then UpList.Free;
        end;
    except
        FGridData.ClearPropBuffer(0, 0, True);
        Invalidate;
        raise;
    end;
end;

function TtsCustomDBGrid.GetSelectedList(StartRow, DisplayRow: Longint; var List: TtsSelectedList;
                                         var Canceled: Boolean): Integer;
var
    DatasetPos: TtsDatasetPosition;
    Count, Total: Longint;
    FromBkm: TBookmarkStr;
begin
    if StartRow <> 0 then
    begin
        Count := 0;
        Total := 0;
        Canceled := False;
        List := TtsSelectedList.Create;
        GetBufferList(StartRow, DisplayRow, List, False, Count, Total, Canceled);

        if Canceled then
        begin
            List.Free;
            List := nil;
        end;
        Result := Sign(DisplayRow - StartRow);
    end
    else
    begin
        SaveDatasetPosition(DatasetPos);
        try
            FromBkm := '';
            if (DisplayRow > 0) and (DisplayRow <= FGridData.BufferRows) then
                FromBkm := FGridData.Bookmark[DisplayRow];
            Result := GetDatasetList(DisplayRow, FromBkm, SelectionStart, 0,
                                     False, List, Canceled);
        finally
            RestoreDatasetPosition(DatasetPos, True);
        end;
    end;
end;

procedure TtsCustomDBGrid.CheckEndBkmScan(ScanAll: Boolean; Activate: Boolean;
                                          BkmList: TtsSelectedList; var Canceled: Boolean);
var
    Count: Longint;
begin
    if Activate then
    begin
        Count := 0;
        if (not Canceled) and Assigned(BkmList) then Count := BkmList.Count;
        ScanRecordEvent(ScanAll, sstEnd, Count, Canceled);
    end;
end;

procedure TtsCustomDBGrid.SelectRowShiftMouseDown(DisplayRow: Longint; var Canceled: Boolean);
var
    StartRow: Longint;
    BkmList: TtsSelectedList;
    CompRes: Integer;
    BkmEventDone: Boolean;
    DisablePaint: Boolean;
    OldRow: Longint;
begin
    Canceled := False;
    if not DataBound then begin; inherited; Exit; end;
    if not Active then Exit;
    if IsAppendRow(DisplayRow) then Exit;

    DisablePaint := SelectionColorEnabled;
    StartRow := SelectionStartRownr;
    if GetStartRowSelected then
    begin
        BkmList := nil;
        try
            BkmEventDone := False;
            try
                CompRes := 0;
                if FDBSelectedRows.UseRangeSelection then
                    CompRes := CompareBkm(FGridData.Bookmark[DisplayRow], SelectionStart)
                else
                begin
                    BkmEventDone := True;
                    ScanRecordEvent(False, sstStart, 0, Canceled);
                    if not Canceled then
                        CompRes := GetSelectedList(StartRow, DisplayRow, BkmList, Canceled);
                end;

                if (not Canceled) and
                   ((BkmList <> nil) or FDBSelectedRows.UseRangeSelection) then
                begin
                    if DisablePaint then EnablePaint := False;
                    try
                        if not FDBSelectedRows.UseRangeSelection then
                            SaveSelectedRows(0)
                        else if CompRes >= 0 then
                        begin
                            if StartRow > GridTopRow then
                                InvertSelectedRows(1, StartRow - 1, False);
                            if (DisplayRow < MaxVisibleRow) and (DisplayRow > 0) then
                                InvertSelectedRows(DisplayRow + 1, MaxVisibleRow, False);
                        end
                        else
                        begin
                            if DisplayRow > GridTopRow then
                                InvertSelectedRows(1, DisplayRow - 1, False);
                            if (StartRow < MaxVisibleRow) and (StartRow > 0) then
                                InvertSelectedRows(StartRow + 1, MaxVisibleRow, False);
                        end;

                        if (StartRow <> DisplayRow) and
                           FDBSelectedRows.UseRangeSelection then
                        begin
                            if StartRow <> 0 then
                                InvertUnselectedRows(StartRow, DisplayRow)
                             else if CompRes >= 0 then
                                InvertUnselectedRows(1, DisplayRow)
                             else
                                InvertUnselectedRows(DisplayRow, MaxVisibleRow);
                        end;

                        if FDBSelectedRows.UseRangeSelection then
                        begin
                            DeleteAllRowSelection;
                            AddRowSelection(StartRow, DisplayRow);
                        end
                        else
                        begin
                            FDBSelectedRows.AddSelectedList(BkmList, True, False, Canceled);
                            if not Canceled then ToggleChangedRows(1, GridRows);
                        end;
                    finally
                        if DisablePaint then begin EnablePaint := True; Update; end;
                    end;

                    if not Canceled then
                    begin
                        CheckSetCurrentRow(DisplayRow);
                        FScrollPosition := Sign(CompRes);
                    end;
                end;
            finally
                CheckEndBkmScan(False, BkmEventDone, BkmList, Canceled);
                if Canceled then CancelMouseAction;
            end;
        finally
            BkmList.Free;
        end;
    end
    else
    begin
        OldRow := FCurDisplayRow;
        if DisablePaint then EnablePaint := False;
        try
            InvertSelectedRows(1, MaxVisibleRow, False);
            DeleteAllRowSelection;
            if DisplayRow <> FCurDisplayRow then
                SetCurrentPosition(FCurDisplayCol, DisplayRow, True, True);
        finally
            if DisablePaint then begin EnablePaint := True; Update; end;
        end;

        if OldRow <> FCurDisplayRow then
        begin
            ClearCurrent(OldRow);
            DrawCurrent(FCurDisplayRow);
            CheckRowColChanged;
        end;
    end;

    if FDBSelectedRows.RowsSelected then FGridStatus := grRowSelect;
end;

procedure TtsCustomDBGrid.SelectRowShiftCtrlMouseDown(DisplayRow: Longint; var Canceled: Boolean);
var
    CompRes: Integer;
    StartRow: Longint;
    BkmList: TtsSelectedList;
    BkmEventDone: Boolean;
    DisablePaint: Boolean;
    OldRow: Longint;
begin
    Canceled := False;
    if not DataBound then begin; inherited; Exit; end;
    if not Active then Exit;
    if IsAppendRow(DisplayRow) then Exit;

    DisablePaint := SelectionColorEnabled;
    StartRow := SelectionStartRownr;
    if GetStartRowSelected then
    begin
        BkmList := nil;
        try
            BkmEventDone := False;
            try
                CompRes := 0;
                if FDBSelectedRows.UseRangeSelection then
                    CompRes := CompareBkm(FGridData.Bookmark[DisplayRow], SelectionStart)
                else
                begin
                    BkmEventDone := True;
                    ScanRecordEvent(False, sstStart, 0, Canceled);
                    if not Canceled then
                        CompRes := GetSelectedList(StartRow, DisplayRow, BkmList, Canceled);
                end;

                if (not Canceled) and
                   ((BkmList <> nil) or FDBSelectedRows.UseRangeSelection) then
                begin
                    if DisablePaint then EnablePaint := False;
                    try
                        if not FDBSelectedRows.UseRangeSelection then
                            SaveSelectedRows(0)
                        else if StartRow <> 0 then
                            InvertUnselectedRows(StartRow, DisplayRow)
                        else if CompRes >= 0 then
                            InvertUnselectedRows(1, DisplayRow)
                        else
                            InvertUnselectedRows(DisplayRow, MaxVisibleRow);

                        if FDBSelectedRows.UseRangeSelection then
                            AddRowSelection(StartRow, DisplayRow)
                        else
                        begin
                            FDBSelectedRows.AddSelectedList(BkmList, False, False, Canceled);
                            if not Canceled then ToggleChangedRows(1, GridRows);
                        end;
                    finally
                        if DisablePaint then begin EnablePaint := True; Update; end;
                    end;

                    if (DisplayRow <> FCurDisplayRow) and not Canceled then
                    begin
                        ClearCurrent(FCurDisplayRow);
                        SetCurrentPosition(FCurDisplayCol, DisplayRow, True, True);
                        DrawCurrentSelected(DisplayRow);
                    end;
                end;
            finally
                CheckEndBkmScan(False, BkmEventDone, BkmList, Canceled);
                if Canceled then CancelMouseAction;
            end;
        finally
            BkmList.Free;
        end;
    end
    else
    begin
        BkmList := nil;
        try
            BkmEventDone := False;
            try
                CompRes := 0;
                if FDBSelectedRows.UseRangeSelection then
                    CompRes := CompareBkm(FGridData.Bookmark[DisplayRow], SelectionStart)
                else
                begin
                    BkmEventDone := True;
                    ScanRecordEvent(False, sstStart, 0, Canceled);
                    if not Canceled then
                        CompRes := GetSelectedList(StartRow, DisplayRow, BkmList, Canceled);
                end;

                if (not Canceled) and
                   ((BkmList <> nil) or FDBSelectedRows.UseRangeSelection) then
                begin
                    OldRow := FCurDisplayRow;
                    if DisablePaint then EnablePaint := False;
                    try
                        if not FDBSelectedRows.UseRangeSelection then
                            SaveSelectedRows(0)
                        else if CompRes > 0 then
                            InvertSelectedRows(StartRow + 1, DisplayRow, False)
                        else if CompRes < 0 then
                        begin
                            if StartRow = 0 then
                                InvertSelectedRows(DisplayRow, MaxVisibleRow, False)
                            else
                                InvertSelectedRows(CalcMin(StartRow - 1, MaxVisibleRow),
                                                   DisplayRow, False);
                        end;

                        if FDBSelectedRows.UseRangeSelection then
                            DeleteRowSelection(StartRow, DisplayRow)
                        else
                        begin
                            FDBSelectedRows.DeleteSelectedList(BkmList, False, Canceled);
                            if not Canceled then ToggleChangedRows(1, GridRows);
                        end;

                        if (FCurDisplayRow <> DisplayRow) and not Canceled then
                            SetCurrentPosition(FCurDisplayCol, DisplayRow, True, True);
                    finally
                        if DisablePaint then begin EnablePaint := True; Update; end;
                    end;

                    if (FCurDisplayRow <> OldRow) and not Canceled then
                    begin
                        ClearCurrent(OldRow);
                        DrawCurrent(FCurDisplayRow);
                    end;
                end;
            finally
                CheckEndBkmScan(False, BkmEventDone, BkmList, Canceled);
                if Canceled then CancelMouseAction;
            end;
        finally
            BkmList.Free;
        end;
    end;

    if not Canceled then SetSelectionStartRow(DisplayRow);
    CheckRowColChanged;
end;

procedure TtsCustomDBGrid.SelectSingleRow(DisplayRow: Longint; Invalidate: Boolean);
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;
    SelectSingleDBRow(FGridData.Bookmark[DisplayRow], Invalidate);
    UpdateScrollPos;
end;

procedure TtsCustomDBGrid.SetNewSelectedRow(DisplayRow: Longint);
begin
    if not DataBound then begin inherited; Exit; end;
    if not Active then Exit;
    SelectSingleDBRow(FGridData.Bookmark[DisplayRow], False);
    UpdateScrollPos;
end;

procedure TtsCustomDBGrid.SelectSingleDBRow(DataRow: TBookmarkStr; Invalidate: Boolean);
var
    DisplayRow: Longint;
    DisablePaint: Boolean;
    IsRowSelected: Boolean;
    OldRow: Longint;
    DataRowChanged: Boolean;
begin
    if (RowCount <= 1) or (VarToStr(DataRow) = VarToStr(EmptyBookmark)) then Exit;

    OldRow := CurDisplayRow;
    DataRowChanged := DataRow <> FCurBookmark;
    IsRowSelected := RowSelected[DataRow];
    DisablePaint := SelectionColorEnabled;
    DisplayRow := FGridData.BufferRow(DataRow);

    if DisablePaint then EnablePaint := False;
    try
        if not Invalidate then
        begin
            if DisplayRow > 1 then InvertSelectedRows(1, DisplayRow - 1, False);
            if DisplayRow < MaxVisibleRow then InvertSelectedRows(DisplayRow + 1, MaxVisibleRow, False);
        end;
        DeleteAllRowSelection;
        if IsRowSelected then FDBSelectedRows.SetSelected(DataRow, True);
        SetCurrentRowSelect(DisplayRow, False);
    finally
        if DisablePaint then
        begin
            EnablePaint := True;
            if not Invalidate then Update;
        end;
    end;


    if DataRowChanged then
    begin
        if OldRow > 0 then
        begin
            if not Invalidate then ClearCurrent(OldRow)
                              else InvalidateCell(0, OldRow);
        end;
        
        if DisplayRow > 0 then
        begin
            if not Invalidate then
            begin
                if IsRowSelected then DrawCurrentSelected(DisplayRow)
                                 else DrawCurrent(DisplayRow);
            end
            else InvalidateCell(0, DisplayRow);
        end;
    end;

    if not IsRowSelected then
    begin
        FDBSelectedRows.SetSelected(DataRow, True);
        if DisplayRow > 0 then
        begin
            if not Invalidate then InvertSelectedRows(DisplayRow, DisplayRow, True)
                              else InvalidateRow(DisplayRow);
        end;
    end;

    FLastAddedCol := FCurDisplayCol;
    FLastAddedBookmark := FCurBookmark;
    FLastAddedBkmPos := CurBkmPos(FLastAddedBookmark);

    CheckRowColChanged;
end;

procedure TtsCustomDBGrid.CheckRowSelection(Invalidate: Boolean);
begin
    if not DataBound then begin inherited; Exit end;
    if not Active then Exit;

    if (InRowSelectMode or FScrollSelected) then
    begin
       if (GridStatus = grNormal) or
          ((GridStatus = grRowSelect) and not RowSelected[FCurBookmark]) then
        SelectSingleDBRow(FCurBookmark, Invalidate);
    end;
end;

procedure TtsCustomDBGrid.UpdateRowInversion(FromRow, ToRow: Longint; Select: Boolean);
var
    I: Longint;
    Dc: Hdc;
begin
    if not HandleAllocated then Exit;
    Dc := GetDC(Handle);
    try
        with FGridData do
        begin
            for I := FromRow to ToRow do
            begin
                if IsRowSelected(I) <> Select then InvertRow(I, Select, Dc);
            end;
        end;
    finally
        ReleaseDC(Handle, Dc);
    end;
end;

procedure TtsCustomDBGrid.InvertSelectedRows(FromRow, ToRow: Longint; Select: Boolean);
var
    I: integer;
    Dc: HDC;
begin
    if not HandleAllocated then Exit;
    if not DataBound then begin inherited; Exit; End;
    if not Active then Exit;

    GetFirstLastRow(FromRow, ToRow);
    Dc := GetDC(Handle);
    try
        for I := FromRow to ToRow do
        begin
            if IsRowSelected(I) then InvertRow(I, Select, Dc);
        end;
    finally
        ReleaseDC(Handle, Dc);
    end;
end;

function TtsCustomDBGrid.GetDBRowSelected(DataRow: Variant): Boolean;
begin
    Result := False;
    if not DataBound then begin Result := GetRowSelected(DataRow); Exit end;
    if CheckBkmType(DataRow) then Result := FDBSelectedRows.GetSelected(DataRow);
end;

procedure TtsCustomDBGrid.SetRowMoving(Value: Boolean);
begin
    if not DataBound then begin inherited; Exit; end;
    if Value <> False then Exit;
    inherited;
end;

function TtsCustomDBGrid.GetRowMoving: Boolean;
begin
    if not DataBound then begin Result := inherited GetRowMoving; Exit end;
    Result := False;
end;

procedure TtsCustomDBGrid.SetDBResizeRows(Value: TtsResizeRows);
begin
    if (not DataBound) or (Value <> rrSingle) then inherited ResizeRows := Value;
end;

function TtsCustomDBGrid.GetDBResizeRows: TtsResizeRows;
begin
    Result := inherited ResizeRows;
end;

procedure TtsCustomDBGrid.SetDBFixedRowCount(Value: Integer);
begin
    if (not DataBound) or (Value = 0) then inherited FixedRowCount := Value;
end;

function TtsCustomDBGrid.GetDBFixedRowCount: Integer;
begin
    Result := inherited FixedRowCount;
end;

function TtsCustomDBGrid.GetDBMaxTopRow: Longint;
begin
    Result := 0;
    if (not DataBound) then begin Result := inherited GetMaxTopRow; Exit; end;
end;

function TtsCustomDBGrid.GetDBDataRownr(DisplayRow: Longint): Variant;
begin
    Result := Unassigned;
    if not DataBound then begin Result := inherited DataRowNr[DisplayRow]; Exit end;
    if not Active then Exit;
    if (DisplayRow < 1) or (DisplayRow > GridRows + InsertionRow) then Exit;
    Result := FGridData.Bookmark[DisplayRow];
end;

procedure TtsCustomDBGrid.CheckResetRowCombo(DataRow: Variant);
var
    DisplayRow: Longint;
begin
    DisplayRow := RecordIDRow(DataRow, True);
    if (DisplayRow > 0) and (DisplayRow <= RowCount - 1) then
        if (CurDisplayRow = DisplayRow) then ResetComboInit(False);
end;

procedure TtsCustomDBGrid.ScaleRows(M, D: Integer; Flags: TScalingFlags);
var
    I: Integer;
    List: TtsSetList;
    Element: TtsDBRowElement;
begin
    if not DataBound then begin inherited; Exit; end;
    if M = D then Exit;

    FSkipRowHeightsChanged := True;
    try
        if sfHeight in Flags then DefaultRowHeight := MulDiv(DefaultRowHeight, M, D);
    finally
        FSkipRowHeightsChanged := False;
        if sfHeight in Flags then RowHeightsChanged;
    end;

    List := FDBRowPropSet.List;
    for I := 1 to List.Count do
    begin
        Element := TtsDBRowElement(List.Items[I]);
        if (sfFont in Flags) and not Element.FParentFont then
            if Assigned(Element.FFont) then Element.FFont.Size := MulDiv(Element.FFont.Size, M, D);
        if Element.FCombo <> nil then
            TtsDBCombo(Element.FCombo).Grid.ChangeScale(M, D);
    end;
end;

procedure TtsCustomDBGrid.ScaleCells(M, D: Integer; Flags: TScalingFlags);
var
    I: Integer;
    List: TtsSetList;
    Element: TtsDBCellElement;
begin
    if not DataBound then begin inherited; Exit; end;
    if M = D then Exit;

    List := FDBCellPropSet.List;
    for I := 1 to List.Count do
    begin
        Element := TtsDBCellElement(List.Items[I]);
        if (sfFont in Flags) and not Element.FParentFont then
            if Assigned(Element.FFont) then Element.FFont.Size := MulDiv(Element.FFont.Size, M, D);
        if Element.FCombo <> nil then
            TtsDBCombo(Element.FCombo).Grid.ChangeScale(M, D);
    end;
end;

procedure TtsCustomDBGrid.AssignRowCombo(DataRow: Variant);
var
    Element: TtsDBRowElement;
begin
    if not DataBound then begin inherited AssignRowCombo(DataRow); Exit end;

    Element := GetDBRowElement(DataRow);
    if not Assigned(Element) then
        Element := TtsDBRowElement(CreateRowElement(DataRow));
    if Assigned(Element) then
    begin
        Element.AssignCombo;
        CheckResetRowCombo(DataRow);
    end;
end;

procedure TtsCustomDBGrid.ResetRowCombo(DataRow: Variant);
begin
    RowCombo[DataRow] := nil
end;

procedure TtsCustomDBGrid.AssignRowFont(DataRow: Variant);
begin
    if not DataBound then begin inherited AssignRowFont(DataRow); Exit end;
    if CheckIdType(DataRow) and (RowFont[DataRow] = nil) then
        SetDBRowFont(DataRow, Font);
end;

procedure TtsCustomDBGrid.ResetRowFont(DataRow: Variant);
begin
    if not DataBound then begin inherited ResetRowFont(DataRow); Exit end;
    if CheckIdType(DataRow) then SetDBRowFont(DataRow, nil);
end;

procedure TtsCustomDBGrid.CheckResetCellCombo(DataCol: Longint; DataRow: Variant);
var
    DisplayCol, DisplayRow: Longint;
begin
    DisplayCol := GetDisplayCol(DataCol);
    DisplayRow := RecordIDRow(DataRow, True);
    if (DisplayRow > 0) and (DisplayRow <= RowCount - 1) then
    begin
        if (CurDisplayCol = DisplayCol) and
           (CurDisplayRow = DisplayRow) then
        begin
            ResetComboInit(False);
        end;
    end;
end;

procedure TtsCustomDBGrid.AssignCellCombo(DataCol: Longint; DataRow: Variant);
var
    Element: TtsDBCellElement;
begin
    if not DataBound then begin inherited AssignCellCombo(DataCol, DataRow); Exit end;

    Element := GetDBCellElement(DataCol,DataRow, True);
    if not Assigned(Element) then
        Element := TtsDBCellElement(CreateCellElement(DataCol, DataRow));
    if Assigned(Element) then
    begin
        Element.AssignCombo;
        CheckResetCellCombo(DataCol, DataRow);
    end;
end;

procedure TtsCustomDBGrid.ResetCellCombo(DataCol: Longint; DataRow: Variant);
begin
    CellCombo[DataCol, DataRow] := nil;
end;

procedure TtsCustomDBGrid.AssignCellFont(DataCol: Longint; DataRow: Variant);
begin
    if not DataBound then begin inherited AssignCellFont(DataCol, DataRow); Exit end;
    if CheckIndex(itCol, DataCol, 1, Cols) and CheckIdType(DataRow) then
    begin
        if CellFont[DataCol, DataRow] = nil then SetDBCellFont(DataCol, DataRow, Font);
    end;
end;

procedure TtsCustomDBGrid.ResetCellFont(DataCol: Longint; DataRow: Variant);
begin
    if not DataBound then begin inherited ResetCellFont(DataCol, DataRow); Exit end;
    SetDBCellFont(DataCol, DataRow, nil);
end;

function TtsCustomDBGrid.GetDBCellElement(DataCol: Longint; DataRow: Variant; Check: Boolean): TtsDBCellElement;
begin
    Result := nil;
    if Check and not (CheckIndex(itCol, DataCol, 1, Cols) and CheckIdType(DataRow)) then Exit;
    if FDBCellPropSet.Count = 0 then Exit;

    if not FLastCell.Empty then
    begin
        if (DataCol = FLastCell.DataCol) and (DataRow = FLastCell.DataRow) then
        begin
            Result := TtsDBCellElement(FLastCell.Element);
            Exit;
        end;
    end;

    Result := TtsDBCellElement(FDBCellPropSet.Get([DataCol,DataRow]));
    FLastCell.DataCol := DataCol;
    FLastCell.DataRow := DataRow;
    FLastCell.Element := Result;
end;

function  TtsCustomDBGrid.GetCellTag(DataCol, DataRow: Longint): Integer;
begin
    Result := 0;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellTag(DataCol, DataRow); Exit end;
    if Active then Result := CellTag[DataCol, FGridData.RecordId[DataRow]];
end;

function  TtsCustomDBGrid.GetDBCellTag(DataCol : Longint; DataRow: Variant): Integer;
var
    Element: TtsDBCellElement;
begin
    Result := 0;
    if not DataBound then begin Result := inherited GetCellTag(DataCol, DataRow); Exit; end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FTag;
end;

procedure TtsCustomDBGrid.SetDBCellTag(DataCol : Longint; DataRow: Variant; Value: Integer);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellTag(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prTag, 0, True);
end;

function  TtsCustomDBGrid.GetCellData(DataCol, DataRow: Longint): Pointer;
begin
    Result := Nil;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellData(DataCol, DataRow); Exit end;
    if Active then Result := CellData[DataCol, FGridData.RecordId[DataRow]];
end;

function  TtsCustomDBGrid.GetDBCellData(DataCol : Longint; DataRow: Variant): Pointer;
var
    Element: TtsDBCellElement;
begin
    Result := Nil;
    if not DataBound then begin Result := inherited GetCellData(DataCol, DataRow); Exit; end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FData;
end;

procedure TtsCustomDBGrid.SetDBCellData(DataCol : Longint; DataRow: Variant; Value: Pointer);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellData(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, ObjectToVariant(Value), prData, 0, True);
end;

function TtsCustomDBGrid.GetCellColor(DataCol, DataRow: Longint): TColor;
begin
    Result := clNone;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellColor(DataCol, DataRow); Exit end;
    if Active then Result := CellColor[DataCol, FGridData.RecordId[DataRow]];
end;

function TtsCustomDBGrid.GetCellCheckBoxState(DataCol: Longint; DataRow: Variant): TCheckBoxState;
begin
  Result := VariantToCheckBox(Cell[DataCol, DataRow], GiveCellCheckBoxValues(DataCol, 0));
end;

procedure TtsCustomDBGrid.SetCellCheckBoxState(DataCol: Longint; DataRow: Variant; Value : TCheckBoxState);
begin
  Cell[DataCol, DataRow] := CheckBoxToVariant(Value, GiveCellCheckBoxValues(DataCol, 0));
end;

procedure TtsCustomDBGrid.SetDBCellColor(DataCol: Longint; DataRow: Variant; Value: TColor);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellColor(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prColor, 0, True);
end;

function TtsCustomDBGrid.GetDBCellColor(DataCol: Longint; DataRow: Variant): TColor;
var
    Element: TtsDBCellElement;
begin
    Result := clNone;
    if not DataBound then begin Result := inherited GetCellColor(DataCol, DataRow); Exit; end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FColor;
end;

function TtsCustomDBGrid.GetDbCellTextWidth(DataCol : Longint; DataRow: Variant): Integer;
var Value: string;
    Metric: TTextMetric;
    bMultiLine : Boolean;
begin
   GetTextMetrics(Canvas.Handle, Metric);
   Value := Cell[DataCol, DataRow];
   bMultiLine := (CellWordWrap[DataCol, DataRow] = wwOn) or
                 ((Self.WordWrap = wwOn) and (CellWordWrap[DataCol, DataRow] = wwDefault));
   GetPrintCharWidth(Canvas, Metric, Pchar(Value),
                     Length(Value), bMultiLine, False, Result);
end;

function TtsCustomDBGrid.GetCellTextWidth(DataCol, DataRow : Longint) : Integer;
begin
  if not Databound then
     Result := inherited GetCellTextWidth(DataCol, DataRow)
  else if Active then
     Result := GetDbCellTextWidth(DataCol, FGridData.RecordId[DataRow])
  else
     Result := 0;
end;

function TtsCustomDBGrid.GetCellControlType(DataCol, DataRow: Longint): TtsControlType;
begin
    Result := ctDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellControlType(DataCol, DataRow); Exit end;
    if Active then Result := CellControlType[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellControlType(DataCol: Longint; DataRow: Variant; Value: TtsControlType);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellControlType(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prControlType, 0, True);
end;

function TtsCustomDBGrid.GetDBCellControlType(DataCol: Longint; DataRow: Variant): TtsControlType;
var
    Element: TtsDBCellElement;
begin
    Result := ctDefault;
    if not DataBound then begin Result := inherited GetCellControlType(DataCol, DataRow); Exit; end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FControlType;
end;

function TtsCustomDBGrid.GetCellSpinOptions(DataCol, DataRow: Longint): TtsSpinOptions;
begin
    Result := [spoAutoRepeat, spoAutoIncrement, spoKeyedit];
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellSpinOptions(DataCol, DataRow); Exit end;
    if Active then Result := CellSpinOptions[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellSpinOptions(DataCol: Longint; DataRow: Variant; Value: TtsSpinOptions);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellSpinOptions(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Byte(Value), prSpinOptions, 0, True);
end;

function TtsCustomDBGrid.GetDBCellSpinOptions(DataCol: Longint; DataRow: Variant): TtsSpinOptions;
var
    Element: TtsDBCellElement;
begin
    Result := [spoAutoRepeat, spoAutoIncrement, spoKeyEdit];
    if not DataBound then begin Result := inherited GetCellSpinOptions(DataCol, DataRow); Exit; end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FSpinOptions;
end;

function TtsCustomDBGrid.GetCellSpinIncrement(DataCol, DataRow: Longint): Double;
begin
    Result := 1;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellSpinIncrement(DataCol, DataRow); Exit end;
    if Active then Result := CellSpinIncrement[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellSpinIncrement(DataCol: Longint; DataRow: Variant; Value: Double);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellSpinIncrement(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prSpinIncrement, 0, True);
end;

function TtsCustomDBGrid.GetDBCellSpinIncrement(DataCol: Longint; DataRow: Variant): Double;
var
    Element: TtsDBCellElement;
begin
    Result := 1;
    if not DataBound then begin Result := inherited GetCellSpinIncrement(DataCol, DataRow); Exit; end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FSpinIncrement;
end;

function TtsCustomDBGrid.GetCellFont(DataCol, DataRow: Longint): TFont;
begin
    Result := nil;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellFont(DataCol, DataRow); Exit end;
    if Active then Result := CellFont[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellFont(DataCol: Longint; DataRow: Variant; Value: TFont);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellFont(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, ObjectToVariant(Value), prFont, 0, True);
end;

function TtsCustomDBGrid.GetDBCellFont(DataCol: Longint; DataRow: Variant): TFont;
var
    Element: TtsDBCellElement;
begin
    Result := nil;
    if not DataBound then begin Result := inherited GetCellFont(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FFont;
end;

function TtsCustomDBGrid.GetCellParentFont(DataCol, DataRow: Longint): Boolean;
begin
    Result := True;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellParentFont(DataCol, DataRow); Exit end;
    if Active then Result := CellParentFont[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellParentFont(DataCol: Longint; DataRow: Variant; Value: Boolean);
var
    Element: TtsCustomElement;
    CurParentFont: Boolean;
begin
    if not DataBound then begin inherited SetCellParentFont(DataCol, DataRow, Value); Exit end;

    CurParentFont := True;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    if Element <> nil then CurParentFont := TtsDBCellElement(Element).FParentFont;

    if CurParentFont <> Value then
    begin
        FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prParentFont, 0, True);
        if Value then CellFont[DataCol, DataRow] := nil
                 else CellFont[DataCol, DataRow] := GiveDBCellFont(DataCol, DataRow);
    end;
end;

function  TtsCustomDBGrid.GetDBCellParentFont(DataCol: Longint; DataRow: Variant): Boolean;
var
    Element: TtsDBCellElement;
begin
    Result := True;
    if not DataBound then begin Result := inherited GetCellParentFont(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FParentFont;
end;

function TtsCustomDBGrid.GetCellAlignment(DataCol, DataRow: Longint): TAlignment;
begin
    Result := taLeftJustify;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellAlignment(DataCol, DataRow); Exit end;
    if Active then Result := CellAlignment[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellAlignment(DataCol: Longint; DataRow: Variant; Value: TAlignment);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellAlignment(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prAlignment, 0, True);
end;

function TtsCustomDBGrid.GetDBCellAlignment(DataCol: Longint; DataRow: Variant): TAlignment;
var
    Element: TtsDBCellElement;
begin
    Result := taLeftJustify;
    if not DataBound then begin Result := inherited GetCellAlignment(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FAlignment;
end;

function TtsCustomDBGrid.GetCellAlign(DataCol, DataRow: Longint): Boolean;
begin
    Result := False;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellAlign(DataCol, DataRow); Exit end;
    if Active then Result := CellAlign[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellAlign(DataCol: Longint; DataRow: Variant; Value: Boolean);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellAlign(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prAlign, 0, True);
end;

function TtsCustomDBGrid.GetDBCellAlign(DataCol: Longint; DataRow: Variant): Boolean;
var
    Element: TtsDBCellElement;
begin
    Result := False;
    if not DataBound then begin Result := inherited GetCellAlign(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FAlign;
end;

function TtsCustomDBGrid.GetCellHorzAlignment(DataCol, DataRow: Longint): TtsHorzAlignment;
begin
    Result := htaDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellHorzAlignment(DataCol, DataRow); Exit end;
    if Active then Result := CellHorzAlignment[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellHorzAlignment(DataCol: Longint; DataRow: Variant; Value: TtsHorzAlignment);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellHorzAlignment(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prHorzAlignment, 0, True);
end;

function TtsCustomDBGrid.GetDBCellHorzAlignment(DataCol: Longint; DataRow: Variant): TtsHorzAlignment;
var
    Element: TtsDBCellElement;
begin
    Result := htaDefault;
    if not DataBound then begin Result := inherited GetCellHorzAlignment(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FHorzAlignment;
end;

function TtsCustomDBGrid.GetCellVertAlignment(DataCol, DataRow: Longint): TtsVertAlignment;
begin
    Result := vtaDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellVertAlignment(DataCol, DataRow); Exit end;
    if Active then Result := CellVertAlignment[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellVertAlignment(DataCol: Longint; DataRow: Variant; Value: TtsVertAlignment);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellVertAlignment(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prVertAlignment, 0, True);
end;

function TtsCustomDBGrid.GetDBCellVertAlignment(DataCol: Longint; DataRow: Variant): TtsVertAlignment;
var
    Element: TtsDBCellElement;
begin
    Result := vtaDefault;
    if not DataBound then begin Result := inherited GetCellVertAlignment(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FVertAlignment;
end;

function TtsCustomDBGrid.GetCellIs3D(DataCol, DataRow: Longint): Boolean;
begin
    Result := False;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellIs3D(DataCol, DataRow); Exit end;
    if Active then Result := CellIs3D[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellIs3D(DataCol: Longint; DataRow: Variant; Value: Boolean);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellIs3D(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prIs3D, 0, True);
end;

function TtsCustomDBGrid.GetDBCellIs3D(DataCol: Longint; DataRow: Variant): Boolean;
var
    Element: TtsDBCellElement;
begin
    Result := False;
    if not DataBound then begin Result := inherited GetCellIs3D(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FIs3D;
end;

function TtsCustomDBGrid.GetCellWordWrap(DataCol, DataRow: Longint): TtsWordWrap;
begin
    Result := wwDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellWordWrap(DataCol, DataRow); Exit end;
    if Active then Result := CellWordWrap[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellWordWrap(DataCol: Longint; DataRow: Variant; Value: TtsWordWrap);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellWordWrap(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prWordWrap, 0, True);
end;

function TtsCustomDBGrid.GetDBCellWordWrap(DataCol: Longint; DataRow: Variant): TtsWordWrap;
var
    Element: TtsDBCellElement;
begin
    Result := wwDefault;
    if not DataBound then begin Result := inherited GetCellWordWrap(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FWordWrap;
end;

function TtsCustomDBGrid.GetCellMaskName(DataCol, DataRow: Longint): string;
begin
    Result := '';
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellMaskName(DataCol, DataRow); Exit end;
    if Active then Result := CellMaskName[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellMaskName(DataCol: Longint; DataRow: Variant; Value: string);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellMaskName(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prMask, 0, True);
end;

function TtsCustomDBGrid.GetDBCellMaskName(DataCol: Longint; DataRow: Variant): string;
var
    Element: TtsDBCellElement;
begin
    Result := '';
    if not DataBound then begin Result := inherited GetCellMaskName(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FMaskName;
end;

function TtsCustomDBGrid.GetCellButtonType(DataCol, DataRow: Longint): TtsButtonType;
begin
    Result := btDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellButtonType(DataCol, DataRow); Exit end;
    if Active then Result := CellButtonType[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellButtonType(DataCol: Longint; DataRow: Variant; Value: TtsButtonType);
var
    Element: TtsCustomElement;
begin
    if FAsCombo then Exit;
    if not DataBound then begin inherited SetCellButtonType(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prButtonType, 0, True);
    if (Value = btCombo) then CheckComboCreated;
end;

function TtsCustomDBGrid.GetDBCellButtonType(DataCol: Longint; DataRow: Variant): TtsButtonType;
var
    Element: TtsDBCellElement;
begin
    Result := btDefault;
    if not DataBound then begin Result := inherited GetCellButtonType(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FButtonType;
end;

function TtsCustomDBGrid.GetCellDropDownStyle(DataCol, DataRow: Longint): TtsDropDownStyle;
begin
    Result := ddDropDown;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellDropDownStyle(DataCol, DataRow); Exit end;
    if Active then Result := CellDropDownStyle[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellDropDownStyle(DataCol: Longint; DataRow: Variant; Value: TtsDropDownStyle);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellDropDownStyle(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prDropDownStyle, 0, True);
end;

function TtsCustomDBGrid.GetDBCellDropDownStyle(DataCol: Longint; DataRow: Variant): TtsDropDownStyle;
var
    Element: TtsDBCellElement;
begin
    Result := ddDropDown;
    if not DataBound then begin Result := inherited GetCellDropDownStyle(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.DropDownStyle;
end;

function TtsCustomDBGrid.GetCellCombo(DataCol, DataRow: Longint): TtsCombo;
begin
    Result := nil;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellCombo(DataCol, DataRow); Exit end;
    if Active then Result := CellCombo[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellCombo(DataCol: Longint; DataRow: Variant; Value: TtsDBCombo);
var
    Element: TtsCustomElement;
begin
    if FAsCombo then Exit;
    if not DataBound then begin inherited SetCellCombo(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, ObjectToVariant(Value), prCombo, 0, True);
end;

function TtsCustomDBGrid.GetDBCellCombo(DataCol: Longint; DataRow: Variant): TtsDBCombo;
var
    Element: TtsDBCellElement;
begin
    Result := nil;
    if not DataBound then begin Result := TtsDBCombo(inherited GetCellCombo(DataCol, DataRow)); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := TtsDBCombo(Element.FCombo);
end;

procedure TtsCustomDBGrid.SetDBCellParentCombo(DataCol: Longint; DataRow: Variant; Value: Boolean);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellParentCombo(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prParentCombo, 0, True);
end;

function TtsCustomDBGrid.GetDBCellParentCombo(DataCol: Longint; DataRow: Variant): Boolean;
var
    Element: TtsDBCellElement;
begin
    Result := False;
    if not DataBound then begin Result := inherited GetCellParentCombo(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FParentCombo;
end;

function TtsCustomDBGrid.GetCellStretchPicture(DataCol, DataRow: Longint): TtsDrawOption;
begin
    Result := dopDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellStretchPicture(DataCol, DataRow); Exit end;
    if Active then Result := CellStretchPicture[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellStretchPicture(DataCol: Longint; DataRow: Variant; Value: TtsDrawOption);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellStretchPicture(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prPicture, tsStretchId, True);
end;

function TtsCustomDBGrid.GetDBCellStretchPicture(DataCol: Longint; DataRow: Variant): TtsDrawOption;
var
    Element: TtsDBCellElement;
begin
    Result := dopDefault;
    if not DataBound then begin Result := inherited GetCellStretchPicture(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FStretchPicture;
end;

function TtsCustomDBGrid.GetCellShrinkPicture(DataCol, DataRow: Longint): TtsDrawOption;
begin
    Result := dopDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellShrinkPicture(DataCol, DataRow); Exit end;
    if Active then Result := CellShrinkPicture[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellShrinkPicture(DataCol: Longint; DataRow: Variant; Value: TtsDrawOption);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellShrinkPicture(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prPicture, tsShrinkId, True);
end;

function TtsCustomDBGrid.GetDBCellShrinkPicture(DataCol: Longint; DataRow: Variant): TtsDrawOption;
var
    Element: TtsDBCellElement;
begin
    Result := dopDefault;
    if not DataBound then begin Result := inherited GetCellShrinkPicture(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FShrinkPicture;
end;

function TtsCustomDBGrid.GetCellCenterPicture(DataCol, DataRow: Longint): TtsDrawOption;
begin
    Result := dopDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellCenterPicture(DataCol, DataRow); Exit end;
    if Active then Result := CellCenterPicture[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellCenterPicture(DataCol: Longint; DataRow: Variant; Value: TtsDrawOption);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellCenterPicture(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prPicture, tsCenterId, True);
end;

function TtsCustomDBGrid.GetDBCellCenterPicture(DataCol: Longint; DataRow: Variant): TtsDrawOption;
var
    Element: TtsDBCellElement;
begin
    Result := dopDefault;
    if not DataBound then begin Result := inherited GetCellCenterPicture(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FCenterPicture;
end;

function TtsCustomDBGrid.GetCellKeepAspectRatio(DataCol, DataRow: Longint): TtsDrawOption;
begin
    Result := dopDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellKeepAspectRatio(DataCol, DataRow); Exit end;
    if Active then Result := CellKeepAspectRatio[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellKeepAspectRatio(DataCol: Longint; DataRow: Variant; Value: TtsDrawOption);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellKeepAspectRatio(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prPicture, tsRatioId, True);
end;

function TtsCustomDBGrid.GetDBCellKeepAspectRatio(DataCol: Longint; DataRow: Variant): TtsDrawOption;
var
    Element: TtsDBCellElement;
begin
    Result := dopDefault;
    if not DataBound then begin Result := inherited GetCellKeepAspectRatio(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FKeepAspectRatio;
end;

function TtsCustomDBGrid.GetCellDateTimeDef(DataCol, DataRow: Longint): TtsDateTimeDefComponent;
begin
    Result := nil;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited GetCellDateTimeDef(DataCol, DataRow); Exit end;
    if Active then Result := CellDateTimeDef[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellDateTimeDef(DataCol: Longint; DataRow: Variant; Value: TtsDateTimeDefComponent);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellDateTimeDef(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, ObjectToVariant(Value), prDateTime, 0, False);
end;

function TtsCustomDBGrid.GetDBCellDateTimeDef(DataCol: Longint; DataRow: Variant): TtsDateTimeDefComponent;
var
    Element: TtsDBCellElement;
begin
    Result := nil;
    if not DataBound then begin Result := inherited GetCellDateTimeDef(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FDateTimeDef;
end;

procedure TtsCustomDBGrid.GetTextSize(DataCol: Longint; DataRow: Variant; var TextLines, TextHeight: Integer);
var
    Value: Variant;
    RecId: Variant;
    DisplayCol: Longint;
    Font: TFont;
    Alignment: TAlignment;
    WordWrap: TtsWordWrap;
    DropDownStyle: TtsDropDownStyle;
    ButtonType: TtsButtonType;
    DrawWidth: Integer;
    Button: TtsCustomButton;
begin
    if not DataBound then begin inherited; Exit; end;

    if CheckIndex(itCol, DataCol, 1, Cols) and CheckIdType(DataRow) then
    begin
        TextLines := 0;
        TextHeight := 0;
        if not Active then Exit;

        GetBkmValueAndRecordId(DataCol, DataRow, Value, RecId);
        if VarType(Value) <> varString then Exit;
        if GiveDBCellControlType(DataCol, RecId) <> ctText then Exit;

        DisplayCol := DisplayColnr[DataCol];
        Font := GiveDBCellFont(DisplayCol, RecId);
        Alignment := GiveDBCellAlignment(DisplayCol, RecId);
        WordWrap := GiveDBCellWordWrap(DisplayCol, RecId);
        ButtonType := GiveDBCellButton(DisplayCol, RecId, DropDownStyle);

        DrawWidth := GridCols[DataCol].Width - tsRangeSelectWidth - FVertLineWidth;
        if (ButtonType <> btNone) then
        begin
            Button := GridCellButton(DisplayColnr[DataCol], ButtonType);
            if Assigned(Button) then
                DrawWidth := DrawWidth - Button.FullWidth;
        end;

        ComputeTextSize(DataCol, DrawWidth, Value, Font, Alignment, WordWrap, ButtonType,
                        TextLines, TextHeight);
    end;
end;

function TtsCustomDBGrid.CanEditDBCell(DataCol: Longint; DataRow: Variant): Boolean;
var
    ReadOnly: TtsReadOnly;
    IsVisible: Boolean;
begin
    ReadOnly := CellReadOnly[DataCol, DataRow];
    IsVisible := GridCols[DataCol].Visible and RowVisible[DataRow];
    if ReadOnly = roDefault then
        Result := IsVisible and not GridCols[DataCol].ReadOnly and not RowReadOnly[DataRow]
    else
        Result := IsVisible and (ReadOnly = roOff);
end;

procedure TtsCustomDBGrid.CheckSetMask(DataCol: Longint; DataRow: Variant);
var
    SetMask: Boolean;
begin
    if not DataBound then begin inherited; Exit; end;

    if not (csDestroying in ComponentState) then
    begin
        if (DataCol >= 0) and (DataCol <= ColCount - 1) then
        begin
            if (CurDataCol = DataCol) then
            begin
                if not CanUseRecordIds
                    then SetMask := CompareBkm(FCurBookmark, DataRow) = 0
                    else SetMask := CompareRecordIds(CurrentRecordId, DataRow) = 0;
                if SetMask then SetControlMask;
            end;
        end;
    end;
end;

procedure TtsCustomDBGrid.SetControlProperties(CellControl: TtsCustomGridControl);
var
    Field: TtsDBField;
begin
    inherited;
    if DataBound and Active then
    begin
        Field := Col[CurDataCol].Field;
        if Assigned(Field) and not Field.IsEditField then
            CellControl.KeyEdit := Field.IsEditField;
    end;
end;

function TtsCustomDBGrid.GetDBCellTextHeight(DataCol: Longint; DataRow: Variant): Integer;
var
    TextLines: Integer;
begin
    GetTextSize(DataCol, DataRow, TextLines, Result);
end;

function TtsCustomDBGrid.GetDBCellTextLines(DataCol: Longint; DataRow: Variant): Integer;
var
    TextHeight: Integer;
begin
    GetTextSize(DataCol, DataRow, Result, TextHeight);
end;

function TtsCustomDBGrid.IsCellReadOnly(DataCol, DataRow: Longint): TtsReadOnly;
begin
    Result := roDefault;
    if (not DataBound) or (DataRow <= 0) or (DataRow > GridRows) then
        begin Result := inherited IsCellReadOnly(DataCol, DataRow); Exit end;
    if Active and (DataCol > 0) then Result := CellReadOnly[DataCol, FGridData.RecordId[DataRow]];
end;

procedure TtsCustomDBGrid.SetDBCellReadOnly(DataCol: Longint; DataRow: Variant; Value: TtsReadOnly);
var
    Element: TtsCustomElement;
begin
    if not DataBound then begin inherited SetCellReadOnly(DataCol, DataRow, Value); Exit end;
    Element := TtsCustomElement(GetDBCellElement(DataCol, DataRow, True));
    FDBCellPropSet.SetProperty([DataCol, DataRow], Element, Value, prCellReadOnly, 0, True);
end;

function TtsCustomDBGrid.GetDBCellReadOnly(DataCol: Longint; DataRow: Variant): TtsReadOnly;
var
    Element: TtsDBCellElement;
begin
    Result := roDefault;
    if not DataBound then begin Result := GetCellReadOnly(DataCol, DataRow); Exit end;
    Element := GetDBCellElement(DataCol, DataRow, False);
    if Element <> nil then Result := Element.FCellReadOnly;
end;

function TtsCustomDBGrid.GetCellValue(DataCol: Longint; DataRow: Longint): Variant;
var
    OldActive: Integer;
begin
    Result := Unassigned;
    if not DataBound then begin Result := inherited GetCellValue(DataCol, DataRow); Exit end;
    if not Active then Exit;

    OldActive := ActiveRecord;
    try
        ActiveRecord := DataRow;
        Result := ActiveCell[DataCol, FGridData.Bookmark[DataRow]];
    finally
        ActiveRecord := OldActive;
    end;
end;

procedure TtsCustomDBGrid.SetDBCellValue(DataCol: Longint; DataRow: Variant; const Value: Variant);
var
    BufRow: Integer;
    ControlType: TtsControlType;
begin
    if not DataBound then begin inherited SetCellValue(DataCol, DataRow, Value); Exit end;

    if (DataCol < 1) or (DataCol > Cols) then Exit;
    if not IsCurrentRecord(DataRow) then Exit;

    ControlType := GiveDBCellControlType(DataCol, CurrentRecordId);
    if ControlType = ctNone then Exit;

    if Assigned(GridCols[DataCol].Field) then
        SetFieldValue(GridCols[DataCol], ControlType, CheckStrValue(ControlType, Value))
    else
    begin
        BufRow := FGridData.BufferRow(FCurBookmark);
        if BufRow > 0 then inherited SetCellValue(DataCol, BufRow, Value);
    end;
end;

function TtsCustomDBGrid.GetDBCellValue(DataCol: Longint; DataRow: Variant): Variant;
begin
    Result := Unassigned;
    if not DataBound then begin Result := inherited GetCellValue(DataCol, DataRow); Exit end;
    if (DataCol < 1) or (DataCol > Cols) then Exit;

    if not CheckGetCell then Exit;
    if (ActiveRecord >= 1) and (ActiveRecord <= FGridData.BufferRows) and
       (CompareBkm(FGridData.Bookmark[ActiveRecord], DataRow) = 0) then
        Result := ActiveCell[DataCol, DataRow]
    else
        Result := BookmarkValue(DataCol, DataRow);
end;

function TtsCustomDBGrid.GetActiveCellValue(DataCol: Longint; DataRow: Variant): Variant;
var
    ControlType: TtsControlType;
begin
    Result := Unassigned;
    if not DataBound then begin Result := inherited GetCellValue(DataCol, DataRow); Exit end;
    if (DataCol < 1) or (DataCol > Cols) then Exit;

    if CanGetCurrentCell and (not CurrentCell.IsClear) and (DataCol = CurDataCol) and
       (CompareBkm(FCurBookmark, DataRow) = 0) then
    begin
        Result := CurrentCell.Value;
        Exit;
    end;

    if not CheckGetCell then Exit;

    ControlType := GiveDBCellControlType(DataCol, BkmRecordId(DataRow));
    GetFieldValue(GridCols[DataCol], 0, False, ControlType, Result);
    DBCellLoaded(DataCol, DataRow, 0, False, ControlType, Result);
end;

function TtsCustomDBGrid.BookmarkValue(DataCol: Longint; DataRow: Variant): Variant;
var
    DisplayRow: Longint;
    OldActive: Integer;
begin
    Result := Unassigned;
    if not Active then Exit;
    if (DataCol < 1) or (DataCol > Cols) then Exit;
    if GridCols[DataCol].ControlType = ctNone then Exit;

    DisplayRow := FGridData.BufferRow(DataRow);
    if DisplayRow <> 0 then
    begin
        OldActive := FGridData.ActiveRecord;
        try
            FGridData.ActiveRecord := DisplayRow;
            Result := ActiveCell[DataCol, DataRow];
        finally
            FGridData.ActiveRecord := OldActive;
        end;
    end
    else if CanGetCurrentCell and (not CurrentCell.IsClear) and (DataCol = CurDataCol) and
            (CompareBkm(FCurBookmark, DataRow) = 0) then
    begin
        Result := CurrentCell.Value;
    end
    else
        Result := FGridData.BookmarkValue(DataCol, DataRow);
end;

procedure TtsCustomDBGrid.GetBkmValueAndRecordId(DataCol: Longint; DataRow: Variant; var Value, RecId: Variant);
var
    DisplayRow: Longint;
    OldActive: Integer;
begin
    DisplayRow := FGridData.BufferRow(DataRow);
    if DisplayRow <> 0 then
    begin
        OldActive := FGridData.ActiveRecord;
        try
            FGridData.ActiveRecord := DisplayRow;
            Value := ActiveCell[DataCol, DataRow];
            RecId := FGridData.RecordId[DisplayRow];
        finally
            FGridData.ActiveRecord := OldActive;
        end;
    end
    else
        RecId := FGridData.GetBkmValueAndRecordId(DataCol, DataRow, Value);
end;

function TtsCustomDBGrid.BkmRecordId(DataRow: Variant): Variant;
begin
    if not CanUseRecordIds
        then Result := DataRow
        else result := BookmarkRecordId[DataRow];
end;

procedure TtsCustomDBGrid.SetDBCellPText(DataCol: Longint; DataRow: Variant; Value: PChar);
begin
    if not DataBound then begin inherited SetCellPText(DataCol, DataRow, Value); Exit end;
end;

function TtsCustomDBGrid.GetSelectedCells: TtsDBRect;
begin
    if not DataBound then
    begin
        Result.Left := inherited SelectedCells.Left;
        Result.Right := inherited SelectedCells.Right;
        Result.Top := inherited SelectedCells.Top;
        Result.Bottom := inherited SelectedCells.Bottom;
        Exit;
    end;

    Result := FDBSelectedCells;
end;

function TtsCustomDBGrid.GetDBCurrentCell: TtsDBCurrentCell;
begin
    Result := TtsDBCurrentCell(inherited CurrentCell);
end;

function TtsCustomDBGrid.ReadOnly: Boolean;
begin
    Result := False;
    if Active then Result := not DataLink.Dataset.CanModify;
end;

function TtsCustomDBGrid.CompareBkm(Bkm1, Bkm2: TBookmarkStr): Integer;
begin
    Result := -2;
    if not DataBound or not Active then Exit;
    Result := FGridData.CompareBkm(Bkm1, Bkm2);
end;

function TtsCustomDBGrid.BkmEqual(var Bkm1: TBookmarkStr; Bkm2: TBookmarkStr): Boolean;
begin
    Result := False;
    if not DataBound or not Active then Exit;

    Result := FGridData.CompareBkm(Bkm1, Bkm2) = 0;
    if Result and (Bkm1 <> Bkm2) then
    begin
        if (Bkm1 = FCurBookmark) and (FOldBookmark = FCurBookmark) then
            FOldBookmark := Bkm2;
        Bkm1 := Bkm2;
    end;
end;

function TtsCustomDBGrid.CompareBkmPos(var BkmPos1, BkmPos2: TtsBkmPos): Integer;
begin
    Result := -2;
    if not DataBound or not Active then Exit;
    Result := FGridData.CompareBkmPos(BkmPos1, BkmPos2);
end;

procedure TtsCustomDBGrid.CalculateRows;
begin
    if not Active then Exit;
    FGridData.DoRecCount(True);
    UpdateRowCount(True);
end;

procedure TtsCustomDBGrid.CalculatePosition;
begin
    if not Active then Exit;
    if UseStandardScrolling then Exit;
    FScrollDataset.CalculatePos;
    UpdateRowCount(True);
end;

procedure TtsCustomDBGrid.SyncData(Reposition: Boolean);
begin
    if not DataBound then Exit;
    if not Active then Exit;

    if InRowSelectMode then FDBSelectedRows.ResetAll;
    HideGridControl(True);
    ResetDataset(Reposition);
    ShowGridControl;

    CheckRowColChanged;
    CheckRowSelection(False);
    SelectionsChanged(False);
    CheckTopLeftChanged(False);
end;

procedure TtsCustomDBGrid.SynchronizeData;
begin
    SyncData(True);
end;

procedure TtsCustomDBGrid.ResetRowProperties(Properties: TtsProperties);
begin
    if not DataBound then begin inherited; Exit; end;

    EnablePaint := False;
    try
        if prSelected in Properties then
        begin
            if Active then
                DoSelectRows(FGridData.FirstBkmPos, FGridData.LastBkmPos, False, False)
            else
            begin
                FDBSelectedRows.ResetAll;
                GridStatusChanged;
            end;
        end;

        FDBRowPropSet.ResetProperties(Properties, True);
    finally
        EnablePaint := True;
    end;
end;

procedure TtsCustomDBGrid.ResetCellProperties(Properties: TtsProperties);
begin
    if not DataBound then begin inherited; Exit; end;

    EnablePaint := False;
    try
        FDBCellPropSet.ResetProperties(Properties, True);
    finally
        EnablePaint := True;
    end;
end;

procedure TtsCustomDBGrid.SetTopLeft(DisplayCol: Longint; DisplayRow: Variant);
begin
    if not DataBound then begin inherited SetTopLeft(DisplayCol, DisplayRow); Exit; end;
    if not Active then Exit;

    EnablePaint := False;
    try
        LeftCol := DisplayCol;
        TopRow := DisplayRow;
    finally
        EnablePaint := True;
    end;
end;

function TtsCustomDBGrid.GetXMLMetaData : String;
var i : Integer;
begin
  Result := '<METADATA><FIELDS>';
  for i := 1 to Cols do
  begin
    if Col[i].ControlType = ctPicture then
       Continue
    else
    begin
      Result := Result + '<FIELD attrname=' + AnsiQuotedStr(Col[i].XMLHeading, '"') + ' fieldtype=';
      if Col[i].FDBField = Nil then
         Result := Result + '"string"'
      else
        case Col[i].FDBField.DataType of
          ftString    : Result := Result + '"string" WIDTH="' + IntToStr(Col[i].FDBField.Size) + '"';
          ftSmallint  : Result := Result + '"i4"';
          ftInteger   : Result := Result + '"i4"';
          ftWord      : Result := Result + '"i4"';
          ftBoolean   : Result := Result + '"boolean"';
          ftAutoInc   : Result := Result + '"i4" SUBTYPE="Autoinc"';
          ftFloat     : Result := Result + '"r8"';
          ftCurrency  : Result := Result + '"r8" SUBTYPE="Money"';
          ftBCD       : Result := Result + '"r8"';
          ftDate      : Result := Result + '"date"';
          ftTime      : Result := Result + '"time"';
          ftDateTime  : Result := Result + '"datetime"';
          ftMemo      : Result := Result + '"string" WIDTH="' + IntToStr(Col[i].FDBField.Size) + '"';
        end;
      Result := Result + ' />';
    end;
  end;
  Result := Result + '</FIELDS><PARAMS LCID="1033"/></METADATA>';
end;

function TtsCustomDBGrid.GetXMLRowData(forRow : Variant) : String;
var i : Integer;

  function XMLValue(iCol : Integer) : String;
  var Value : Variant;
      theField : TField;
  begin
    Value := GetDBCellValue(iCol, forRow);
    if (Col[iCol].FDBField <> Nil) then
    begin
      theField := DataSet.FieldByName(Col[iCol].FieldName);
      if (theField <> Nil) and
         (theField.DataType = ftDateTime) then
         Result := FormatDateTime('yyyymmddThh:nn:sszzz', theField.AsDateTime)
      else if (theField <> Nil) and
              (theField.DataType = ftDate) then
         Result := FormatDateTime('yyyymmdd', theField.AsDateTime)
      else if VarType(Value) <> varNull then
         Result := CheckForWhiteSpace(Value)
      else
         Result := '';
    end
    else if CellControlType[iCol, forRow] = ctPicture then
       Result := ''
    else
       Result := CheckForWhiteSpace(Value);
  end;
begin
  Result := '<ROW ';
  for i := 1 to Cols do
    if Col[i].ControlType <> ctPicture then
       Result := Result + Col[i].XMLHeading + '=' + AnsiQuotedStr(XMLValue(i), '"') + ' ';
  Result := Result + '/>';
end;

function TtsCustomDBGrid.GetXMLData : String;
var origBookmark : String;
    i : Integer;

  function xmlEncoding : String;
  begin
    if FXMLExport.Encoding = '' then
       Result := ''
    else
       Result := 'encoding="' + FXMLExport.Encoding + '"';
  end;
  function xmlStandAlone : String;
  begin
    if FXMLExport.StandAlone then
       Result := 'yes'
    else
       Result := 'no';
  end;
  function xmlDataPacket : String;
  begin
    if FXMLExport.DataPacketVersion = '' then
       Result := ''
    else
       Result := '<DATAPACKET Version="' + FXMLExport.DataPacketVersion + '">';
  end;
begin
  Result := Format('<?xml version="%s" %s standalone="%s"?> %s', [FXMLExport.Version, xmlEncoding, xmlStandAlone, xmlDataPacket]);
  Result := Result + XMLMetaData;
  Result := Result + ' <ROWDATA> ';
  origBookmark := Self.Dataset.Bookmark;
  EnableRedraw := False;
  EnablePaint := False;
  DataSet.DisableControls;
  i := 1;
  try
    DataSet.First;
    while not DataSet.eof do
    begin
      Result := Result + #10#13 + GetXMLRowData(DataSet.Bookmark);
      DataSet.Next;
      Inc(i);
    end;
  finally
    Self.Dataset.Bookmark := origBookmark;
    EnableRedraw := True;
    EnablePaint := True;
    DataSet.EnableControls;
  end;
  if i > 20 then BEEP;
  Result := Result + '</ROWDATA></DATAPACKET>';
end;

procedure TtsCustomDBGrid.ExportXML(toFile : String);
var exportFile : TStringList;
begin
  exportFile := TStringList.Create;
  try
    exportFile.Text := GetXMLData;
    exportFile.SaveToFile(toFile);
  finally
    exportFile.Free;
  end;
end;

function TtsCustomDBGrid.GetCSVRowData(forRow : Variant) : String;
var i : Integer;

  function CSVValue(iCol : Integer) : String;
  {var Value : Variant;
      theField : TField; }
  begin
    Result := GetDBCellValue(iCol, forRow);

    // Following code removed as part of release 2.20.14
    {if (Col[iCol].FDBField <> Nil) then
    begin
      theField := DataSet.FieldByName(Col[iCol].FieldName);
      if (theField <> Nil) and
         (theField.DataType = ftDateTime) then
         Result := FormatDateTime('yyyymmdd hhnnsszzz', theField.AsDateTime)
      else if (theField <> Nil) and
              (theField.DataType = ftDate) then
         Result := FormatDateTime('yyyymmdd', theField.AsDateTime)
      else
         Result := Value;
    end
    else
       Result := Value; }
  end;
begin
  Result := '';
  for i := 1 to Cols do
    if (Col[DataColnr[i]].ControlType <> ctPicture) and
       (Col[DataColnr[i]].Visible) then
    begin
      Result := Result + AnsiQuotedStr(CSVValue(DataColnr[i]), '"');
      if FExportDelimiter = '#9' then
        Result := Result + #9
      else if FExportDelimiter = '#10' then
        Result := Result + #10
      else if FExportDelimiter = '#13' then
        Result := Result + #13
      else if FExportDelimiter = '#10#13' then
        Result := Result + #10#13
      else
        Result := Result + FExportDelimiter;
    end;
end;

procedure TtsCustomDBGrid.ExportCSV(toFile : String);
var origBookmark : String;
    exportFile : TStringList;
    sRowText : String;
    i : Integer;
begin
  origBookmark := Self.Dataset.Bookmark;
  EnableRedraw := False;
  EnablePaint := False;
  DataSet.DisableControls;
  exportFile := TStringList.Create;
  try
    sRowText := '';
    for i := 1 to Cols do
      if (Col[DataColnr[i]].Visible) and
         (Col[DataColnr[i]].ControlType <> ctPicture) then
      begin
        sRowText := sRowText + AnsiQuotedStr(Col[DataColnr[i]].Heading, '"');
        if FExportDelimiter = '#9' then
          sRowText := sRowText + #9
        else if FExportDelimiter = '#10' then
          sRowText := sRowText + #10
        else if FExportDelimiter = '#13' then
          sRowText := sRowText + #13
        else if FExportDelimiter = '#10#13' then
          sRowText := sRowText + #10#13
        else
          sRowText := sRowText + FExportDelimiter;
      end;
    exportFile.Add(sRowText);
    DataSet.First;
    while not DataSet.eof do
    begin
      exportFile.Add(GetCSVRowData(DataSet.Bookmark));
      DataSet.Next;
    end;
    exportFile.SaveToFile(toFile);
  finally
    exportFile.Free;
    Self.Dataset.Bookmark := origBookmark;
    EnableRedraw := True;
    EnablePaint := True;
    DataSet.EnableControls;
  end;
end;

procedure TtsCustomDBGrid.ActivateInvalidMaskValue(var Accept: Boolean);
begin
    DoInvalidMaskValue(CurDataCol, CurrentDataRow, Accept)
end;

procedure TtsCustomDBGrid.ActivateInvalidMaskEdit(Keys: string; var Accept: Boolean);
begin
    DoInvalidMaskEdit(Keys, CurDataCol, CurrentDataRow, Accept)
end;

procedure TtsCustomDBGrid.DoRowLoaded(DataRow: Variant);
begin
    if Assigned(FOnRowLoaded) then FOnRowLoaded(Self, DataRow);
end;

procedure TtsCustomDBGrid.DoEndCellEdit(DataCol: Longint; DataRow: Variant; var Cancel: Boolean);
begin
    Cancel := False;
    if Assigned(FOnEndCellEdit) then FOnEndCellEdit(Self, DataCol, DataRow, Cancel);
end;

procedure TtsCustomDBGrid.DoEndRowEdit(DataRow: Variant; var Cancel: Boolean);
begin
    Cancel := False;
    if Assigned(FOnEndRowEdit) then FOnEndRowEdit(Self, DataRow, Cancel);
end;

procedure TtsCustomDBGrid.DoShowEditor(DataCol: Longint; DataRow: Variant; var Cancel: Boolean);
begin
    Cancel := False;
    if Assigned(FOnShowEditor) then FOnShowEditor(Self, DataCol, DataRow, Cancel);
end;

procedure TtsCustomDBGrid.DoInvalidMaskValue(DataCol: Longint; DataRow: Variant; var Accept: Boolean);
begin
    Accept := False;
    if Assigned(FOnInvalidMaskValue) then FOnInvalidMaskValue(Self, DataCol, DataRow, Accept);
end;

procedure TtsCustomDBGrid.DoInvalidMaskEdit(Keys: string; DataCol: Longint; DataRow: Variant; var Accept: Boolean);
begin
    Accept := False;
    if Assigned(FOnInvalidMaskEdit) then FOnInvalidMaskEdit(Self, Keys, DataCol, DataRow, Accept);
end;

procedure TtsCustomDBGrid.DoStartCellEdit(DataCol: Longint; DataRow: Variant; var Cancel: Boolean);
begin
    Cancel := False;
    if Assigned(FOnStartCellEdit) then FOnStartCellEdit(Self, DataCol, DataRow, Cancel);
end;

procedure TtsCustomDBGrid.DoStartRowEdit(DataRow: Variant; var Cancel: Boolean);
begin
    Cancel := False;
    if Assigned(FOnStartRowEdit) then FOnStartRowEdit(Self, DataRow, Cancel);
end;

procedure TtsCustomDBGrid.DoUndoCellEdit(DataCol: Longint; DataRow: Variant; ByUser: Boolean; var Cancel: Boolean);
begin
    Cancel := False;
    if Assigned(FOnUndoCellEdit) then FOnUndoCellEdit(Self, DataCol, DataRow, ByUser, Cancel);
end;

procedure TtsCustomDBGrid.DoUndoRowEdit(DataRow: Variant; ByUser: Boolean; var Cancel: Boolean);
begin
    Cancel := False;
    if Assigned(FOnUndoRowEdit) then FOnUndoRowEdit(Self, DataRow, ByUser, Cancel);
end;

procedure TtsCustomDBGrid.DoCellEdit(DataCol: Longint; DataRow: Variant; ByUser: Boolean);
begin
    if Assigned(FOnCellEdit) then FOnCellEdit(Self, DataCol, DataRow, ByUser);
end;

procedure TtsCustomDBGrid.DoCellChanged(OldDataCol, NewDataCol: Longint; OldDataRow, NewDataRow: Variant);
begin
    if Assigned(FOnCellChanged) then FOnCellChanged(Self, OldDataCol, NewDataCol, OldDataRow, NewDataRow);
end;

procedure TtsCustomDBGrid.DoRowChanged(OldDataRow, NewDataRow: Variant);
begin
    if Assigned(FOnRowChanged) and CanActivateEvent then FOnRowChanged(Self, OldDataRow, NewDataRow);
end;

procedure TtsCustomDBGrid.DoPrintRow(DataRow: Variant; var Cancel : Boolean);
begin
    if Assigned(FOnPrintRow) and CanActivateEvent then FOnPrintRow(Self, DataRow, Cancel);
end;

procedure TtsCustomDBGrid.DoPrintCell(DataCol : Longint; DataRow: Variant; var Cancel : Boolean);
begin
    if Assigned(FOnPrintCell) and CanActivateEvent then FOnPrintCell(Self, DataCol, DataRow, Cancel);
end;

procedure TtsCustomDBGrid.DoButtonClick(DataCol: Longint; DataRow: Variant);
begin
    if Assigned(FOnButtonClick) then FOnButtonClick(Self, DataCol, DataRow);
end;

procedure TtsCustomDBGrid.DoButtonDown(DataCol: Longint; DataRow: Variant);
begin
    if Assigned(FOnButtonDown) then FOnButtonDown(Self, DataCol, DataRow);
end;

procedure TtsCustomDBGrid.DoButtonUp(DataCol: Longint; DataRow: Variant);
begin
    if Assigned(FOnButtonUp) then FOnButtonUp(Self, DataCol, DataRow);
end;

procedure TtsCustomDBGrid.DoSpinButtonClick(DataCol: Longint; DataRow: Variant; SpinButton: TtsSpinButton);
begin
    if Assigned(FOnSpinButtonClick) then FOnSpinButtonClick(Self, DataCol, DataRow, SpinButton);
end;

procedure TtsCustomDBGrid.DoSpinButtonDown(DataCol: Longint; DataRow: Variant; SpinButton: TtsSpinButton);
begin
    if Assigned(FOnSpinButtonDown) then FOnSpinButtonDown(Self, DataCol, DataRow, SpinButton);
end;

procedure TtsCustomDBGrid.DoSpinButtonUp(DataCol: Longint; DataRow: Variant; SpinButton: TtsSpinButton);
begin
    if Assigned(FOnSpinButtonUp) then FOnSpinButtonUp(Self, DataCol, DataRow, SpinButton);
end;

procedure TtsCustomDBGrid.DoSpinRepeat(DataCol: Longint; DataRow: Variant; Count: Integer; SpinButton: TtsSpinButton);
begin
    if Assigned(FOnSpinRepeat) then FOnSpinRepeat(Self, DataCol, DataRow, Count, SpinButton);
end;

procedure TtsCustomDBGrid.DoSpinIncrement(DataCol: Longint; DataRow: Variant; SpinButton: TtsSpinButton; var Value: Variant; var Pos, Len: Integer; var Accept: Boolean); 
begin
    if Assigned(FOnSpinIncrement) then FOnSpinIncrement(Self, DataCol, DataRow, SpinButton, Value, Pos, Len, Accept);
end;

function TtsCustomDBGrid.DoClickCell(DataColDown: Longint; DataRowDown: Variant;
                                     DataColUp: Longint; DataRowUp: Variant;
                                     DownPos, UpPos: TtsClickPosition): Boolean;
begin
    Result := Assigned(FOnClickCell);
    if Result then
        FOnClickCell(Self, DataColDown, DataRowDown, DataColUp, DataRowUp, DownPos, UpPos)
end;

procedure TtsCustomDBGrid.DoDblClickCell(DataCol: Longint; DataRow: Variant; Pos: TtsClickPosition);
begin
    if Assigned(FOnDblClickCell) then FOnDblClickCell(Self, DataCol, DataRow, Pos);
end;

procedure TtsCustomDBGrid.DoOnUpdateField(DataCol: Longint; DataRow: Variant;
                                          var Value: Variant; var Cancel: Boolean);
begin
    Cancel := False;
    if Assigned(FOnUpdateField) then FOnUpdateField(Self, DataCol, DataRow, Value, Cancel);
end;

procedure TtsCustomDBGrid.DoOnScanRecords(ScanAll: Boolean; State: TtsScanState; Count: Longint; var Cancel: Boolean);
begin
    if Assigned(FOnScanRecords) then FOnScanRecords(Self, ScanAll, State, Count, Cancel);
end;

procedure TtsCustomDBGrid.DoComboInit(DataCol: Longint; DataRow: Variant);
begin
    if Assigned(FOnComboInit) then FOnComboInit(Self, Combo.Grid, DataCol, DataRow);
end;

procedure TtsCustomDBGrid.DoComboDropDown(DataCol: Longint; DataRow: Variant);
begin
    if Assigned(FOnComboDropDown) then FOnComboDropDown(Self, Combo.Grid, DataCol, DataRow);
end;

procedure TtsCustomDBGrid.DoComboRollUp(DataCol: Longint; DataRow: Variant);
begin
    if Assigned(FOnComboRollUp) then FOnComboRollUp(Self, Combo.Grid, DataCol, DataRow);
end;

procedure TtsCustomDBGrid.DoComboGetValue(GridDataCol: Longint;
                                          GridDataRow, ComboDataRow: Variant; var Value: Variant);
begin
    if Assigned(FOnComboGetValue) then
        FOnComboGetValue(Self, Combo.Grid, GridDataCol, GridDataRow, ComboDataRow, Value);
end;

procedure TtsCustomDBGrid.DoDateTimeInit(DateTimeDef: TtsDateTimeDefComponent; DataCol: Longint; DataRow: Variant);
begin
    if Assigned(FOnDateTimeInit) then
        FOnDateTimeInit(Self, DateTimeDef, DataCol, DataRow);
end;

procedure TtsCustomDBGrid.DoDateTimeDropDown(DateTimeDef: TtsDateTimeDefComponent; DataCol: Longint; DataRow: Variant);
begin
    if Assigned(FOnDateTimeDropDown) then
        FOnDateTimeDropDown(Self, DateTimeDef, DataCol, DataRow);
end;

procedure TtsCustomDBGrid.DoDateTimeRollUp(DateTimeDef: TtsDateTimeDefComponent; DataCol: Longint; DataRow: Variant);
begin
    if Assigned(FOnDateTimeRollUp) then
        FOnDateTimeRollUp(Self, DateTimeDef, DataCol, DataRow);
end;

procedure TtsCustomDBGrid.DoDateTimeGetValue(DateTimeDef: TtsDateTimeDefComponent; DataCol: Longint; DataRow: Variant; var Value: Variant);
begin
    if Assigned(FOnDateTimeGetValue) then
        FOnDateTimeGetValue(Self, DateTimeDef, DataCol, DataRow, Value);
end;

procedure TtsCustomDBGrid.DoGetDrawInfo(DataCol: Longint; DataRow: Variant; var DrawInfo: TtsDrawInfo);
begin
    if Assigned(FOnGetDrawInfo) then FOnGetDrawInfo(Self, DataCol, DataRow, DrawInfo);
end;

procedure TtsCustomDBGrid.DoComboCellLoaded(DataCol: Longint; DataRow: Variant; var Value: Variant);
begin
    if Assigned(FOnComboCellLoaded) then
        FOnComboCellLoaded(Self, Combo.Grid, DataCol, DataRow, Value);
end;

procedure TtsCustomDBGrid.DoTopLeftChanged(OldCol: Longint; OldRow: Variant;
                                           NewCol: Longint; NewRow: Variant; ByUser: Boolean);
begin
    if Assigned(FOnTopLeftChanged) and CanActivateEvent then
        FOnTopLeftChanged(Self, OldCol, OldRow, NewCol, NewRow, ByUser);
end;

procedure TtsCustomDBGrid.DoPaintCell(DataCol: Longint; DataRow: Variant; DrawRect: TRect;
                                State: TtsPaintCellState; var Cancel: Boolean);
begin
    if Assigned(FOnPaintCell) then
        FOnPaintCell(Self, DataCol, DataRow, DrawRect, State, Cancel);
end;

procedure TtsCustomDBGrid.DoCellLoaded(DataCol: Longint; DataRow: Variant; var Value: Variant);
begin
    if Assigned(FOnCellLoaded) then FOnCellLoaded(Self, DataCol, DataRow, Value);
end;

procedure TtsCustomDBGrid.DoDeleteRow(DataRow: Variant; ByUser: Boolean);
begin
    if Assigned(FOnDeleteRow) and CanActivateEvent then FOnDeleteRow(Self, DataRow, ByUser);
end;

procedure TtsCustomDBGrid.DoInsertRow(DataRow: Variant; ByUser: Boolean);
begin
    if Assigned(FOnInsertRow) and CanActivateEvent then FOnInsertRow(Self, DataRow, ByUser);
end;

procedure TtsCustomDBGrid.DoGetRecordID(Bookmark: Variant; var RecordId: Variant);
begin
    RecordId := Unassigned;
    if CanUseRecordIds then FOnGetRecordId(Self, Bookmark, RecordId);
end;

procedure TtsCustomDBGrid.DoCompareRecordId(RecordId1, RecordId2: Variant; var CompRes: Integer);
begin
    if Assigned(FOnCompareRecordId) then
        FOnCompareRecordId(Self, RecordId1, RecordId2, CompRes)
end;

procedure TtsCustomDBGrid.DoFieldLayoutChange;
begin
    if Assigned(FOnFieldLayoutChange) and CanActivateEvent then FOnFieldLayoutChange(Self);
end;

initialization
begin
    EmptyRecId := Null;
    EmptyBookmark := '';
end;

end.

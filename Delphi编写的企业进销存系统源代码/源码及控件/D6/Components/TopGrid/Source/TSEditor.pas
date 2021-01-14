{*******************************************************}
{                                                       }
{       Top Support Visual Components                   }
{       TopGrid Component Editor                        }
{                                                       }
{       Copyright (c) 1997 - 1999 Top Support           }
{                                                       }
{*******************************************************}

unit TsEditor;

{$INCLUDE TSCmpVer}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MMSystem,
  ComCtrls, TsDesign, TSDBGrid, StdCtrls, Grids_ts, TSGrid, ExtCtrls,
  {$IFDEF TSVER_V6} Variants, DesignIntf, DesignEditors, VCLEditors, {$ELSE} DsgnIntf, {$ENDIF}
  TypInfo, TSSetLib, ClipBrd,
  {$IFDEF TSVER_V3} ToolWin, {$ELSE} TSD3EditorControls, Menus, Buttons, {$ENDIF}
  RichEdit, Buttons, Db, Menus, TSMask, TSImagelistEditor,
  TSImageList, TSCommon, TSMbcs, TSDateTimeDef, TSDateTime;

const
    WM_UPDATEINSPECTOR = WM_USER + 1;
    WM_ROWCHANGED = WM_USER + 2;
    WM_SETTOGRIDEDITOR = WM_USER + 3;

    MaxDisplayModeIndex = 1;
    AlwaysUseCellPropListCount = 1000;

type
    TtsDesignInfo = class;
    TtsDBDesignInfo = class;

    TtsGridEditor = class(TComponentEditor)
    public
        procedure Edit; override;
        function GetVerbCount: Integer; override;
        function GetVerb(Index: integer): string; override;
        procedure ExecuteVerb(Index: integer); override;
    end;

    PGridData = ^TGridData;
    PRowData = ^TRowData;
    PCurColsInRowData = ^TCurColsInRowData;
    TGridData = array[0..(MaxListSize div ((SizeOf(PRowData) div SizeOf(LongInt)) + 1))] of PRowData;
    TRowData = array[0..(MaxListSize div ((SizeOf(Variant) div SizeOf(LongInt)) + 1))] of Variant;
    TCurColsInRowData = array[0..MaxListSize] of integer;

    TGridValues = Class(TObject)
    protected
        FCols: integer;
        FRows: integer;
        GridData: PGridData;
        CurRowsInGridData: integer; //Nr of Rows allocated
        CurColsInRowData: PCurColsInRowData; //Nr of Cols allocated per row
    public
        constructor Create(Cols, Rows: integer);
        destructor  Destroy; override;

        function GetValue(DataCol, DataRow: Integer): Variant;
        procedure SetValue(DataCol, DataRow: Integer; Value: Variant);
        procedure DeleteRows(FromRow, ToRow: integer);
        procedure DeleteCols(FromCol, ToCol: integer);
    end;

    TtsTabElement = record
        ComponentEditor: TtsComponentEditor;
        TopRow: integer;
        CurRow: integer;
        DisplayModeName: string;
        NumberofToggleValues: integer;
        NumberofInvisibleValues: integer;
    end;

    PtsTabList = ^TtsTabList;
    TtsTabList = array[0..(MaxListSize div ((SizeOf(TtsTabElement) div SizeOf(Longint)) + 1))] of TtsTabElement;

    TtsGridSelection = record
        GridStatus: TtsGridStatus;
        SelectedCells: integer;
        SelectedCols: integer;
        SelectedRows: integer;
        SelectedFrom: TList;
        SelectedTo: TList;
    end;
    PtsGridSelection = ^TtsGridSelection;

    TtsBaseGridClass = class of TtsBaseGrid;

    PEditor = ^TEditor;
    TEditor = class(TObject)
    protected
        FComboGrid: Boolean;
        FDesignInfo: TtsDesignInfo;
        grdExampleClass : TtsBaseGridClass;
        grdExample: TtsBaseGrid;
        CurrentTab: integer;

        FTabInfo: PtsTabList;
        FTabInfoCount: Integer;
        FCellPropList: TtsSetList;
        UseCellPropList: Boolean;
        CellPropListIndex: integer;
        FirstEditorCell: TPersistent;
        NextEditorCell: TPersistent;
        IdEditorCell: TPersistent;
        FirstEditorRow: TPersistent;
        NextEditorRow: TPersistent;
        IdEditorRow: TPersistent;
        ExampleKeyIsDown: Boolean;
        ExampleMouseIsDown: Boolean;
        UpdateComponentsOnUp: Boolean;
        ScanCanceled: Boolean;
        InColResize: Boolean;
        FieldNames: TStringList;
        ValColumns: TGridValues;

        function  GetDesignInfo: TtsDesignInfo;
        procedure SetGrdExample;
        function  GetDataBound: Boolean;
        procedure GetFieldNames;
        procedure SetRightTabsVisible;
        procedure CreateTabInfo;
        procedure ResetTabInfo;
        function  GetTabInfo: PtsTabList;
        function  GetCellPropList: TtsSetList;

        property TabInfo: PtsTabList read GetTabInfo;
        property CellPropList: TtsSetList read GetCellPropList;
        property DataBound: Boolean read GetDataBound;
        property DesignInfo: TtsDesignInfo read GetDesignInfo;
    public
        constructor Create(grdClass : TtsBaseGridClass; ComboGrid: Boolean);
        destructor  Destroy; override;
    end;

    {TtsDesignInfo}
    TtsDesignInfo = class(TObject)
    protected
        FBaseGrid: TtsBaseGrid;

        function  GetCellButtonType(DataCol: LongInt; DataRow: Variant): TtsButtonType; virtual;
        function  GetCellCombo(DataCol: LongInt; DataRow: Variant): TtsCombo; virtual;
        procedure SetCellCombo(DataCol: LongInt; DataRow: Variant; Value: TtsCombo); virtual;
        function  GetCellControlType(DataCol: LongInt; DataRow: Variant): TtsControlType; virtual;
        function  GetCombo: TtsCombo;
        function  GetCurrentDataRow: Variant; virtual;
        procedure SetCurrentDataRow(Value: Variant); virtual;
        function  GetRowButtonType(DataRow: Variant): TtsButtonType; virtual;
        function  GetRowCombo(DataRow: Variant): TtsCombo; virtual;
        procedure SetRowCombo(DataRow: Variant; Value: TtsCombo); virtual;
        function  GetRowControlType(DataRow: Variant): TtsControlType; virtual;
        function  GetSelectedCells: TRect;
        function  GetSelectedRows: TtsSelection;
    public
        constructor Create(BaseGrid: TtsBaseGrid);

        procedure GetFirstSelectedCell(var DataCol: integer; var DataRow: Variant; StatusSet: TtsGridStats); virtual;
        procedure GetNextSelectedCell(var DataCol: integer; var DataRow: Variant; StatusSet: TtsGridStats); virtual;
        function CellSelected(DataCol: integer; DataRow: Variant; StatusSet: TtsGridStats): Boolean; virtual;
        function CellSelectedCount(StatusSet: TtsGridStats): integer; virtual;
        function GetVisibleRowCount(FromRow, ToRow: Variant): integer; virtual;
        function GetFirstVisibleRow: Variant; virtual;
        function GetNextVisibleRow(DataRow: Variant): Variant; virtual;
        function GetVisibleColCount: integer;
        function GetFirstVisibleCol: integer;
        function GetNextVisibleCol(DataCol: integer): integer;

        property CellButtonType[DataCol: LongInt; DataRow: Variant]: TtsButtonType read GetCellButtonType;
        property CellCombo[DataCol: LongInt; DataRow: Variant]: TtsCombo read GetCellCombo write SetCellCombo;
        property CellControlType[DataCol: LongInt; DataRow: Variant]: TtsControlType read GetCellControlType;
        property Combo: TtsCombo read GetCombo;
        property CurrentDataRow : Variant read GetCurrentDataRow write SetCurrentDataRow;
        property RowButtonType[DataRow: Variant]: TtsButtonType read GetRowButtonType;
        property RowCombo[DataRow: Variant]: TtsCombo read GetRowCombo write SetRowCombo;
        property RowControlType[DataRow: Variant]: TtsControlType read GetRowControlType;
        property SelectedCells: TRect read GetSelectedCells;
        property SelectedRows: TtsSelection read GetSelectedRows;
    end;

    {TtsDBDesignInfo}

    TtsDBDesignInfo = class(TtsDesignInfo)
    protected
        function  GetCustomDBGrid: TtsCustomDBGrid;
        procedure SetCustomDBGrid(CustomDBGrid: TtsCustomDBGrid);

        function  GetCellButtonType(DataCol: LongInt; DataRow: Variant): TtsButtonType; override;
        function  GetCellCombo(DataCol: LongInt; DataRow: Variant): TtsCombo; override;
        procedure SetCellCombo(DataCol: LongInt; DataRow: Variant; Value: TtsCombo); override;
        function  GetCellControlType(DataCol: LongInt; DataRow: Variant): TtsControlType; override;
        function  GetCurrentCell: TtsDBCurrentCell;
        function  GetCurrentDataRow: Variant; override;
        procedure SetCurrentDataRow(Value: Variant); override;
        function  GetDataBound: Boolean;
        function  GetDataSource: TDataSource;
        procedure SetDataSource(Value: TDataSource);
        function  GetFieldState: TtsFieldState;
        procedure SetFieldState(Value: TtsFieldState);
        function  GetRowButtonType(DataRow: Variant): TtsButtonType; override;
        function  GetRowCombo(DataRow: Variant): TtsCombo; override;
        function  GetRowControlType(DataRow: Variant): TtsControlType; override;
        procedure SetRowCombo(DataRow: Variant; Value: TtsCombo); override;

    public
        procedure GetFirstSelectedCell(var DataCol: integer; var DataRow: Variant; StatusSet: TtsGridStats); override;
        procedure GetNextSelectedCell(var DataCol: integer; var DataRow: Variant; StatusSet: TtsGridStats); override;
        function CellSelected(DataCol: integer; DataRow: Variant; StatusSet: TtsGridStats): Boolean; override;
        function CellSelectedCount(StatusSet: TtsGridStats): integer; override;
        function GetVisibleRowCount(FromRow, ToRow: Variant): integer; override;
        function GetFirstVisibleRow: Variant; override;
        function GetNextVisibleRow(DataRow: Variant): Variant; override;

        property Grid: TtsCustomDBGrid read GetCustomDBGrid write SetCustomDBGrid;

        property CellButtonType[DataCol: LongInt; DataRow: Variant]: TtsButtonType read GetCellButtonType;
        property CellCombo[DataCol: LongInt; DataRow: Variant]: TtsCombo read GetCellCombo write SetCellCombo;
        property CurrentDataRow: Variant read GetCurrentDataRow;
        property DataBound: Boolean read GetDataBound;
        property DataSource: TDataSource read GetDataSource write SetDataSource;
        property FieldState: TtsFieldState read GetFieldState write SetFieldState;
        property RowButtonType[DataRow: Variant]: TtsButtonType read GetRowButtonType;
        property RowCombo[DataRow: Variant]: TtsCombo read GetRowCombo write SetRowCombo;
    end;

    tsUserShowOptions = set of (suoDesignBehaviour, suoShowInvisibleGrid, suoShowInvisibleCombo);

  TfrmInspector = class(TForm)
    Splitter1: TSplitter;
    pnlInspectorWTabs: TPanel;
    tabInspector: TPageControl;
    tabGridProperties: TTabSheet;
    tabColumnProperties: TTabSheet;
    tabRowProperties: TTabSheet;
    tabCellProperties: TTabSheet;
    Panel3: TPanel;
    pnlGrdExample: TPanel;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    butCancel: TButton;
    butOK: TButton;
    ToolButton3: TToolButton;
    ceGrid: TtsComponentEditor;
    ceColumn: TtsComponentEditor;
    ceRow: TtsComponentEditor;
    ceCell: TtsComponentEditor;
    ceComboGrid: TtsComponentEditor;
    ceComboColumn: TtsComponentEditor;
    ceComboRow: TtsComponentEditor;
    ceComboCell: TtsComponentEditor;
    pnlScanning: TPanel;
    lblScanning: TLabel;
    prbScanning: TProgressBar;
    butStop: TSpeedButton;
    pnlCustomizeColumns: TPanel;
    pnlInspector: TPanel;
    Panel8: TPanel;
    splInspector: TSplitter;
    Panel11: TPanel;
    lblGridColumns: TLabel;
    lblFieldState: TLabel;
    grdColumns: TtsGrid;
    butAdd: TBitBtn;
    butRemove: TBitBtn;
    cmbFieldState: TComboBox;
    tabCustomizeColumns: TTabSheet;
    Panel10: TPanel;
    grdHeading: TtsGrid;
    grdInspector: TtsGridInspector;
    pmnGrid: TPopupMenu;
    mnuDelColumns: TMenuItem;
    mnuInsColumns: TMenuItem;
    N1: TMenuItem;
    mnuInsRow: TMenuItem;
    mnuDelRows: TMenuItem;
    pmnGridInspector: TPopupMenu;
    munReset: TMenuItem;
    mnuAddColumn: TMenuItem;
    mnuAddRow: TMenuItem;
    pnlInvisible: TPanel;
    sepSizer: TToolButton;
    Label1: TLabel;
    grdDatafields: TtsGrid;
    butAll: TSpeedButton;
    butUnselected: TSpeedButton;
    butAddSelected: TBitBtn;
    butAddAll: TBitBtn;
    Label2: TLabel;
    ToolButton1: TToolButton;
    pnlInspectorGrid: TPanel;
    Panel9: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    chkDesignBehaviour: TCheckBox;
    chkInvisibleRowsCols: TCheckBox;
    butNew: TSpeedButton;
    butOpen: TSpeedButton;
    butSave: TSpeedButton;
    butReset: TSpeedButton;
    ToolButton4: TToolButton;
    butLoadPicture: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    butClearPicture: TSpeedButton;
    lblDesignProperty: TLabel;
    butHelp: TButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    grdSample: TtsGrid;
    procedure WndProc(var Message: TMessage); override;
    procedure FormResize(Sender: TObject);
    procedure tabInspectorChange(Sender: TObject);
    procedure tabInspectorChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure SendUpdateComponents;
    procedure RegisterPropEditors;
    procedure FormActivate(Sender: TObject);
    procedure InsertField(FieldName: string);
    function GetEditorCol(SenderEditor: TEditor; DisplayCol: integer): TPersistent;
    function GetFirstEditorRow(SenderEditor: TEditor; DataRow: Variant): TPersistent;
    function GetNextEditorRow(SenderEditor: TEditor; DataRow: Variant): TPersistent;
    function GetFirstEditorCell(SenderEditor: TEditor; DataCol: integer; DataRow: Variant): TPersistent;
    function GetNextEditorCell(SenderEditor: TEditor; DataCol: integer; DataRow: Variant): TPersistent;
    procedure StartScanComponents(lbl: string; Writing: Boolean; MaxCount: integer; var Cancel: Boolean);
    procedure NextScannedComponent(Writing: Boolean; CurCount, MaxCount: integer; var Cancel: Boolean);
    procedure EndScanComponents;
    procedure CheckButStopClick;
    procedure GetFirstSelectedCol(SenderEditor: TEditor; var DisplayCol: integer);
    procedure GetNextSelectedCol(SenderEditor: TEditor; var DisplayCol: integer);
    procedure GetFirstSelectedRow(SenderEditor: TEditor; var DataRow: Variant);
    procedure GetNextSelectedRow(SenderEditor: TEditor; var DataRow: Variant);
    procedure GetFirstSelectedCell(SenderEditor: TEditor; var DataCol: integer; var DataRow: Variant);
    procedure GetNextSelectedCell(SenderEditor: TEditor; var DataCol: integer; var DataRow: Variant);
    procedure GetNextCellProp(SenderEditor: TEditor; var DataCol: integer; var DataRow: Variant);

    function CellType(Editor: TEditor; DataCol: integer; DataRow: variant): TtsControlType;
    procedure Splitter1Moved(Sender: TObject);
    procedure splInspectorMoved(Sender: TObject);
    procedure SetDisplayModes;
    procedure ceGridGetComponentInfo(Sender: TObject;
      DisplayMode: TtsGroupElement);
    procedure ceColumnGetComponentInfo(Sender: TObject;
      DisplayMode: TtsGroupElement);
    procedure ceGridGetFirstSelectedComponent(Sender: TObject;
      var Component: TPersistent);
    procedure ceColumnGetFirstSelectedComponent(Sender: TObject;
      var Component: TPersistent);
    procedure ceRowGetFirstSelectedComponent(Sender: TObject;
      var Component: TPersistent);
    procedure ceCellGetFirstSelectedComponent(Sender: TObject;
      var Component: TPersistent);
    procedure ceColumnGetNextSelectedComponent(Sender: TObject;
      var Component: TPersistent);
    procedure ceRowGetNextSelectedComponent(Sender: TObject;
      var Component: TPersistent);
    procedure ceCellGetNextSelectedComponent(Sender: TObject;
      var Component: TPersistent);
    procedure ceGridGetComponentListChanged(Sender: TObject;
      CurComponenListId: TStringList; var Changed: Variant);
    procedure ceColumnGetComponentListChanged(Sender: TObject;
      CurComponenListId: TStringList; var Changed: Variant);
    procedure ceRowGetComponentListChanged(Sender: TObject;
      CurComponenListId: TStringList; var Changed: Variant);
    procedure ceCellGetComponentListChanged(Sender: TObject;
      CurComponenListId: TStringList; var Changed: Variant);
    procedure butStopClick(Sender: TObject);
    procedure ScanObjects(ce: TtsComponentEditor; lbl: string;
      State: tsScanObjectsState; Writing: Boolean; Count: Integer;
      var Cancel: Boolean);
    procedure ceGridGetComponentSelectionChanged(Sender: TObject;
      CurSelection: Pointer; var Changed: Boolean);
    procedure ceGridGetComponentSelection(Sender: TObject;
      var ComponentSelection: Pointer; var ComponentCount: Integer);
    procedure ceCellGetComponentSelection(Sender: TObject;
      var ComponentSelection: Pointer; var ComponentCount: Integer);
    procedure GetGridSelection(SenderEditor: TEditor; var ComponentSelection: PtsGridSelection);
    procedure ceColumnGetComponentSelection(Sender: TObject;
      var ComponentSelection: Pointer; var ComponentCount: Integer);
    procedure ceRowGetComponentSelection(Sender: TObject;
      var ComponentSelection: Pointer; var ComponentCount: Integer);
    procedure ceRowScanObjects(Sender: TObject; State: tsScanObjectsState;
      Writing: Boolean; Count: Longint; var Cancel: Boolean);
    procedure ceCellScanObjects(Sender: TObject;
      State: tsScanObjectsState; Writing: Boolean; Count: Longint;
      var Cancel: Boolean);
    procedure ceColumnScanObjects(Sender: TObject;
      State: tsScanObjectsState; Writing: Boolean; Count: Longint;
      var Cancel: Boolean);
    procedure ceGridGetComponentId(Sender: TObject; Component: TPersistent;
      var ComponentId: String);
    procedure ceColumnGetComponentId(Sender: TObject;
      Component: TPersistent; var ComponentId: String);
    procedure ceRowGetComponentId(Sender: TObject; Component: TPersistent;
      var ComponentId: String);
    procedure ceCellGetComponentId(Sender: TObject; Component: TPersistent;
      var ComponentId: String);
    procedure ceGridGetComponentWithId(Sender: TObject;
      ComponentId: String; var Component: TPersistent);
    procedure ceColumnGetComponentWithId(Sender: TObject;
      ComponentId: String; var Component: TPersistent);
    procedure ceRowGetComponentWithId(Sender: TObject; ComponentId: String;
      var Component: TPersistent);
    procedure ceCellGetComponentWithId(Sender: TObject;
      ComponentId: String; var Component: TPersistent);
    procedure butAllClick(Sender: TObject);
    procedure butUnselectedClick(Sender: TObject);
    procedure grdDatafieldsCellLoaded(Sender: TObject; DataCol,
      DataRow: Longint; var Value: Variant);
    procedure grdDatafieldsDblClickCell(Sender: TObject; DataCol,
      DataRow: Longint; Pos: TtsClickPosition);
    procedure butAddSelectedClick(Sender: TObject);
    procedure butAddAllClick(Sender: TObject);
    procedure grdColumnsCellLoaded(Sender: TObject; DataCol,
      DataRow: Longint; var Value: Variant);
    procedure grdColumnsDblClickCell(Sender: TObject; DataCol,
      DataRow: Longint; Pos: TtsClickPosition);
    procedure grdColumnsDeleteRow(Sender: TObject; DataRow: Longint;
      ByUser: Boolean);
    procedure grdColumnsEndCellEdit(Sender: TObject; DataCol,
      DataRow: Longint; var Cancel: Boolean);
    procedure grdColumnsRowCountChanged(Sender: TObject; OldCount,
      NewCount: Longint);
    procedure grdColumnsRowMoved(Sender: TObject; ToDisplayRow,
      Count: Longint; ByUser: Boolean);
    procedure butAddClick(Sender: TObject);
    procedure butRemoveClick(Sender: TObject);
    procedure cmbFieldStateChange(Sender: TObject);

    procedure SetGridsDisplayProp;
    procedure SetFieldName(DataCol: Integer; FieldName: string);
    procedure InitCustomizeColumns;
    procedure grdColumnsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdExampleInsertRow(Sender: TObject; DataRow: Variant;
      ByUser: Boolean);
    procedure grdExampleRowChanged(Sender: TObject; OldRow,
      NewRow: Variant);
    procedure grdExampleCellLoaded(Sender: TObject; DataCol: Longint;
      DataRow: Variant; var Value: Variant);
    procedure grdExampleCellEdit(Sender: TObject;
      DataCol: Longint; DataRow: Variant; ByUser: Boolean);
    procedure grdExampleStartCellEdit(Sender: TObject; DataCol: Longint;
      DataRow: Variant; var Cancel: Boolean);
    procedure grdExampleGetDrawInfo(Sender: TObject; DataCol: Longint;
      DataRow: Variant; var DrawInfo: TtsDrawInfo);

    procedure grdExampleColMoved(Sender: TObject; ToDisplayCol,
      Count: Longint; ByUser: Boolean);
    procedure grdExampleRowMoved(Sender: TObject; ToDisplayRow,
      Count: Longint; ByUser: Boolean);
    procedure grdExampleColResized(Sender: TObject; RowColnr: Longint);
    procedure grdExampleColChanged(Sender: TObject; OldCol,
      NewCol: Longint);
    procedure grdExampleGridStatusChanged(Sender: TObject; OldStatus,
      NewStatus: TtsGridStatus);
    procedure grdExampleInsertCol(Sender: TObject; DataCol: Longint;
      ByUser: Boolean);
    procedure grdExampleMouseStatusChanged(Sender: TObject; OldStatus,
      NewStatus: TtsMouseStatus);
    procedure grdExampleExit(Sender: TObject);
    procedure grdExampleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdExampleKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdExampleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure grdExampleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure grdExampleComboDropDown(Sender: TObject;
      Combo: TtsDBComboGrid; DataCol: Longint; DataRow: Variant);
    procedure grdExampleComboRollUp(Sender: TObject; Combo: TtsDBComboGrid;
      DataCol: Longint; DataRow: Variant);
    procedure grdExampleDblClickCell(Sender: TObject;
      DataCol: Longint; DataRow: Variant; Pos: TtsClickPosition);

    procedure grdExampleDblClickCell_Unbound(Sender: TObject; DataCol,
      DataRow: Longint; Pos: TtsClickPosition);
    procedure grdExampleInsertRow_Unbound(Sender: TObject; DataRow: Longint;
      ByUser: Boolean);
    procedure grdExampleRowChanged_Unbound(Sender: TObject; OldRow,
      NewRow: Longint);
    procedure grdExampleCellLoaded_Unbound(Sender: TObject; DataCol: Longint;
      DataRow: Longint; var Value: Variant);
    procedure grdExampleCellEdit_Unbound(Sender: TObject; DataCol,
      DataRow: Longint; ByUser: Boolean);
    procedure grdExampleStartCellEdit_Unbound(Sender: TObject; DataCol: Longint;
      DataRow: Longint; var Cancel: Boolean);
    procedure grdExampleComboDropDown_Unbound(Sender: TObject; Combo: TtsComboGrid;
      DataCol, DataRow: Longint);
    procedure grdExampleComboRollUp_Unbound(Sender: TObject; Combo: TtsComboGrid;
      DataCol, DataRow: Longint);
    procedure grdExampleGetDrawInfo_Unbound(Sender: TObject; DataCol,
      DataRow: Longint; var DrawInfo: TtsDrawInfo);


    procedure pnlCustomizeColumnsResize(Sender: TObject);
    procedure InitgrdHeading;
    procedure grdHeadingComboInit(Sender: TObject; Combo: TtsComboGrid;
      DataCol, DataRow: Longint);
    procedure grdHeadingComboCellLoaded(Sender: TObject;
      Combo: TtsComboGrid; DataCol, DataRow: Longint; var Value: Variant);
    procedure grdHeadingComboRollUp(Sender: TObject; Combo: TtsComboGrid;
      DataCol, DataRow: Longint);
    procedure grdHeadingCellLoaded(Sender: TObject; DataCol,
      DataRow: Longint; var Value: Variant);
    procedure mnuInsColumnsClick(Sender: TObject);
    procedure mnuDelColumnsClick(Sender: TObject);
    procedure AddNewColumn(Inserting: Boolean);
    procedure grdInspectorColResized(Sender: TObject; RowColnr: Longint);
    procedure grdHeadingColResized(Sender: TObject; RowColnr: Longint);
    procedure SetToGridEditor;
    procedure SetToComboEditor(DataCol: LongInt; DataRow: Variant);
    function  SendersEditor(Sender: TObject): TEditor;
    procedure ceComboGridGetComponentInfo(Sender: TObject;
      DisplayMode: TtsGroupElement);
    procedure RemoveRowChangedUpdates;
    procedure ceRowGetComponentInfo(Sender: TObject;
      DisplayMode: TtsGroupElement);
    procedure NumberofToggleValuesChanged(Sender: TObject);
    procedure NumberofInvisibleValuesChanged(Sender: TObject);
    procedure SetEnableDesignBehaviour;
    procedure SetEnableInvisible;
    procedure ceComboColumnGetComponentInfo(Sender: TObject;
      DisplayMode: TtsGroupElement);
    procedure grdHeadingClickCell(Sender: TObject; DataColDown,
      DataRowDown, DataColUp, DataRowUp: Longint; DownPos,
      UpPos: TtsClickPosition);
    procedure grdInspectorSelectChanged(Sender: TObject;
      SelectType: TtsSelectType; ByUser: Boolean);
    procedure mnuResetClick(Sender: TObject);
    function ResetProperty(Component: TPersistent; Row: integer): Boolean;
    function GetDefaultComponent: TPersistent;
    function GetDefaultGrid: TPersistent;
    function GetDefaultCol: TPersistent;
    function GetDefaultRow: TPersistent;
    function GetDefaultCell: TPersistent;
    function GetComboDefaultGrid: TPersistent;
    function GetComboDefaultCol: TPersistent;
    function GetComboDefaultRow: TPersistent;
    function GetComboDefaultCell: TPersistent;
    procedure mnuAddColumnClick(Sender: TObject);
    procedure mnuInsRowClick(Sender: TObject);
    procedure mnuAddRowClick(Sender: TObject);
    procedure AddNewRow(Inserting: Boolean);
    procedure mnuDelRowsClick(Sender: TObject);
    procedure pmnGridPopup(Sender: TObject);
    function ValidDataRow(DataRow: Variant; DataBound: Boolean): Boolean;
    procedure butOKClick(Sender: TObject);
    procedure butCancelClick(Sender: TObject);
    procedure SetgrdExampleWidthAndHeight;
    procedure pnlGrdExampleResize(Sender: TObject);
    procedure grdExampleColCountChanged(Sender: TObject; OldCount,
      NewCount: Longint);
    procedure grdExampleRowCountChanged(Sender: TObject; OldCount,
      NewCount: Longint);
    procedure UnassignComponent(Editor: TEditor);
    procedure grdInspectorResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure chkDesignBehaviourClick(Sender: TObject);
    procedure chkInvisibleRowsColsClick(Sender: TObject);
    procedure ComboRollUp(DataCol: Longint; DataRow: Variant);
    procedure grdExampleRowResized(Sender: TObject; RowColnr: Longint);
    procedure SetActualValuesGrid;
    procedure SetActualValuesCombo;
    function HasReadOnlyCol(grd: TtsBaseGrid): Boolean;
    function HasReadOnlyRow(grd: TtsBaseGrid): Boolean;
    procedure ceGridSetValues(Sender: TObject; State: tsScanObjectsState;
      Component: Tpersistent; PropertyElement: TtsPropertyElement;
      strValue: String; Value: Variant; ValueSource: tsValueSource;
      FirstSet: Boolean; var Cancel: Boolean);
    procedure ChangeCols(Sender: TObject; PropertyElement: TtsPropertyElement; NewCols: integer);
    procedure ChangeRows(Sender: TObject; PropertyElement: TtsPropertyElement; NewRows: integer);
    procedure FreeActualValuesGrid;
    procedure FreeActualValuesCombo;
    procedure FormCreate(Sender: TObject);
    procedure ceCellGetComponentInfo(Sender: TObject;
      DisplayMode: TtsGroupElement);
    procedure ceComboCellGetComponentInfo(Sender: TObject;
      DisplayMode: TtsGroupElement);
    procedure ShowMoreButtonsWarning(DataCol: LongInt; DataRow: Variant);
    procedure InitVars;
    procedure FreeAll;
    procedure ceComboRowGetComponentInfo(Sender: TObject;
      DisplayMode: TtsGroupElement);
    procedure ceGridGetPropertiesComponent(Sender: TObject;
      var Component: TPersistent);
    procedure ceComboGridGetPropertiesComponent(Sender: TObject;
      var Component: TPersistent);
    procedure ceColumnGetPropertiesComponent(Sender: TObject;
      var Component: TPersistent);
    procedure ceComboColumnGetPropertiesComponent(Sender: TObject;
      var Component: TPersistent);
    procedure ceRowGetPropertiesComponent(Sender: TObject;
      var Component: TPersistent);
    procedure ceComboRowGetPropertiesComponent(Sender: TObject;
      var Component: TPersistent);
    procedure ceCellGetPropertiesComponent(Sender: TObject;
      var Component: TPersistent);
    procedure ceComboCellGetPropertiesComponent(Sender: TObject;
      var Component: TPersistent);
    procedure grdExampleEnter(Sender: TObject);
    procedure grdInspectorEnter(Sender: TObject);
    procedure grdHeadingEnter(Sender: TObject);
    procedure tabInspectorEnter(Sender: TObject);
    procedure grdExampleCellChanged_Unbound(Sender: TObject; OldCol, NewCol,
      OldRow, NewRow: Longint);
    procedure grdExampleCellChanged(Sender: TObject; OldCol,
      NewCol: Longint; OldRow, NewRow: Variant);
    procedure butNewClick(Sender: TObject);
    procedure ResetGrid;
    procedure SetEnablebutLoadPicture;
    procedure butLoadPictureClick(Sender: TObject);
    procedure SetPicture;
    procedure butClearPictureClick(Sender: TObject);
    procedure ClearPicture;
    procedure Panel8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure butOpenClick(Sender: TObject);
    procedure butSaveClick(Sender: TObject);
    procedure GetDefaultExtandFilter(var DefaultExt: string; var Filter: string);
    procedure ceComponentSetValues(Sender: TObject; State: tsScanObjectsState;
      Component: TPersistent; PropertyElement: TtsPropertyElement;
      strValue: String; Value: Variant; ValueSource: tsValueSource;
      ValueSet: Boolean; var Cancel: Boolean);
    procedure grdInspectorGetDrawInfo(Sender: TObject; DataCol,
      DataRow: Longint; var DrawInfo: TtsDrawInfo);
    procedure grdInspectorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function GetHelpKey: string;
    procedure butHelpClick(Sender: TObject);
    procedure ceColumnDestroyComponentSelection(Sender: TObject;
      ComponentSelection: Pointer);
    procedure ceRowDestroyComponentSelection(Sender: TObject;
      ComponentSelection: Pointer);
    procedure ceCellDestroyComponentSelection(Sender: TObject;
      ComponentSelection: Pointer);
  private
    FShowDesignValueGrid: tsShowPropertyValueSet;
    FShowDesignValueCombo: tsShowPropertyValueSet;
    FUserShowOptions: tsUserShowOptions;
    FShowAlwaysStateGrid: Boolean;
    FShowAlwaysStateCombo: Boolean;
    procedure SetShowDesignValueGrid;
    procedure SetShowDesignValueCombo;
    procedure ApplyShowDesignValueGrid;
    procedure ApplyShowDesignValueCombo;
    procedure CheckInsertRow(Grid: TtsBaseGrid);
    procedure SetUserShowOptions(Value: tsUserShowOptions);
    procedure SetShowAlwaysStateGrid(Value: Boolean);
    procedure SetShowAlwaysStateCombo(Value: Boolean);

    property  ShowDesignValueGrid: tsShowPropertyValueSet read FShowDesignValueGrid write FShowDesignValueGrid;
    property  ShowDesignValueCombo: tsShowPropertyValueSet read FShowDesignValueCombo write FShowDesignValueCombo;
    property  UserShowOptions: tsUserShowOptions read FUserShowOptions write SetUserShowOptions;
    property  ShowAlwaysStateGrid: Boolean read FShowAlwaysStateGrid write SetShowAlwaysStateGrid;
    property  ShowAlwaysStateCombo: Boolean read FShowAlwaysStateCombo write SetShowAlwaysStateCombo;
  public
    { Public declarations }
  end;


const
    BoundValue = '       Y';
    BoundValueDouble  = '       Y*';
    UnBoundValue = '       N';
    UnBoundValueDouble = '       N*';

var
    frmInspector: TfrmInspector;
    CurGrid: TtsBaseGrid = nil;
    CurGridName: string;
    CurGridWidth: integer;
    CurGridHeight: integer;
    CurGridVisible: Boolean;
    StartedFromDesigntime: Boolean = False;
    ButtonedExit: Boolean = False;
    SaveResult: Boolean = False;
    ChangesMade: Boolean;

    InitHeightgrdColumns: Integer;
    InitHeightpnlCustomizeColumns: Integer;
    MoveComboBack: Boolean = False;
    InspectorLastUpdated: integer = 0;
    grdInspectorAllRowsSelected: Boolean = False;
    FirstActivate: Boolean = True;

    sepSizerWidthDif: integer = -1;
    TotalWidthGridsDif: integer = -1;
    grdDataFieldsWidthShare: Single = -1;
    grdColumnsDif: integer = -1;
    butRemoveDif: integer = -1;
    lblFieldStateDif: integer = -1;
    grdColumnsFirstColShare: Single = -1;
    grdInspectorFirstColShare: Single = -1;
    pnlInspectorGridAutoWidthMax: integer = -1;

    DisplayModeNames: array[0..MaxDisplayModeIndex] of string;
    CurDisplayModeName: string = 'Structured';
    PrevDisplayModeName: string;

    GridEditor: TEditor;
    ComboEditor: TEditor;
    CurEditor: TEditor; //Contains a pointer to either GridEditor or ComboEditor

    CurGridColor: TColor;
    Resetting: Boolean = False;

    //Components used for retrieving default values for properties:
    grdDefault: TtsBaseGrid = nil;
    grdComboDefault: TtsBaseGrid = nil;
    ColDefault: TPersistent = nil;
    ColComboDefault: TPersistent = nil;
    CellDefault: TPersistent = nil;
    CellComboDefault: TPersistent = nil;
    RowDefault: TPersistent = nil;
    RowComboDefault: TPersistent = nil;

    DesignActivatesFirstTime: Boolean = True;
    PrevLeft: Integer = 0;
    PrevTop: Integer = 0;
    PrevWidth: Integer = 0;
    PrevHeight: Integer = 0;
    PrevState: TWindowState = wsNormal;

implementation

type
    TtsBaseGrid_ = class(TtsBaseGrid) end;
    TtsCustomGrid_ = class(TtsCustomGrid) end;
    TtsCustomDBGrid_ = class(TtsCustomDBGrid) end;


{$R *.DFM}

{TtsDesignInfo}

constructor TtsDesignInfo.Create(BaseGrid: TtsBaseGrid);
begin
    inherited Create;

    FBaseGrid := BaseGrid;
end;

function TtsDesignInfo.GetSelectedRows: TtsSelection;
begin
    result := TtsBaseGrid_(FBaseGrid).FSelectedRows;
end;

function TtsDesignInfo.GetSelectedCells: TRect;
begin
    result := TtsBaseGrid_(FBaseGrid).FSelectedCells;
end;

function  TtsDesignInfo.GetCurrentDataRow: Variant;
begin
    result := TtsBaseGrid_(FBaseGrid).GetCurrentDataRow;
end;

procedure TtsDesignInfo.SetCurrentDataRow(Value: Variant);
begin
    TtsBaseGrid_(FBaseGrid).SetCurrentDataRow(Value);
end;

function  TtsDesignInfo.GetRowControlType(DataRow: Variant): TtsControlType;
begin
    result := TtsBaseGrid_(FBaseGrid).RowControlType[DataRow];
end;

function  TtsDesignInfo.GetCellControlType(DataCol: LongInt; DataRow: Variant): TtsControlType;
begin
    result := TtsBaseGrid_(FBaseGrid).CellControlType[DataCol, DataRow];
end;

function  TtsDesignInfo.GetCellButtonType(DataCol: LongInt; DataRow: Variant): TtsButtonType;
begin
    result := TtsBaseGrid_(FBaseGrid).CellButtonType[DataCol, DataRow];
end;

function  TtsDesignInfo.GetRowButtonType(DataRow: Variant): TtsButtonType;
begin
    result := TtsBaseGrid_(FBaseGrid).RowButtonType[DataRow];
end;

function  TtsDesignInfo.GetRowCombo(DataRow: Variant): TtsCombo;
begin
    result := TtsBaseGrid_(FBaseGrid).RowCombo[DataRow];
end;

procedure TtsDesignInfo.SetRowCombo(DataRow: Variant; Value: TtsCombo);
begin
    TtsBaseGrid_(FBaseGrid).RowCombo[DataRow] := Value;
end;

function  TtsDesignInfo.GetCellCombo(DataCol: LongInt; DataRow: Variant): TtsCombo;
begin
    result := TtsBaseGrid_(FBaseGrid).CellCombo[DataCol, DataRow];
end;

procedure TtsDesignInfo.SetCellCombo(DataCol: LongInt; DataRow: Variant; Value: TtsCombo);
begin
    TtsBaseGrid_(FBaseGrid).CellCombo[DataCol, DataRow] := Value;
end;

function TtsDesignInfo.GetCombo: TtsCombo;
begin
    result := TtsBaseGrid_(FBaseGrid).Combo;
end;

procedure TtsDesignInfo.GetFirstSelectedCell(var DataCol: integer; var DataRow: Variant; StatusSet: TtsGridStats);
begin
    with TtsBaseGrid_(FBaseGrid) do
    begin
        if not (GridStatus in StatusSet) then
        begin
            DataCol := -1;
            DataRow := -1;
            exit;
        end;

        case GridStatus of
            grNormal:
            begin
                DataCol := CurrentCell.DataCol;
                DataRow := CurrentCell.DataRow;
            end;
            grRowSelect:
            begin
                DataCol := GetFirstVisibleCol;
                DataRow := DataRownr[SelectedRows.First];
            end;
            grColSelect:
            begin
                DataCol := DataColnr[SelectedCols.First];
                DataRow := GetFirstVisibleRow;
            end;
            grCellSelect:
            begin
                DataCol := DataColnr[SelectedCells.Left];
                DataRow := DataRownr[SelectedCells.Top];
            end;
        end;
    end;
end;

procedure TtsDesignInfo.GetNextSelectedCell(var DataCol: integer; var DataRow: Variant; StatusSet: TtsGridStats);
var
    DisplayCol, DisplayRow: integer;
begin
    with TtsBaseGrid_(FBaseGrid) do
    begin
        if not (GridStatus in StatusSet) then
        begin
            DataCol := -1;
            DataRow := -1;
            exit;
        end;

        case GridStatus of
            grNormal:
            begin
                DataCol := -1;
                DataRow := -1;
            end;
            grColSelect:
            begin
                DisplayCol := SelectedCols.Next(DisplayColnr[DataCol]);
                if DisplayCol <> -1 then
                    DataCol := DataColnr[DisplayCol]
                else
                begin
                    DisplayRow := DisplayRowNr[DataRow];
                    repeat
                        DisplayRow := DisplayRow + 1;
                        if DisplayRow > Rows then
                            break;
                    until RowVisible[DisplayRow];

                    if DisplayRow > Rows then
                    begin
                        DataCol := -1;
                        DataRow := -1;
                    end
                    else
                    begin
                        DataCol := DataColnr[SelectedCols.First];
                        DataRow := DataRowNr[DisplayRow];
                    end;
                end;
            end;
            grRowSelect:
            begin
                DataCol := GetNextVisibleCol(DataCol);
                if DataCol = -1 then
                begin
                    DisplayRow := SelectedRows.Next(DisplayRowNr[DataRow]);
                    if DisplayRow = -1 then
                    begin
                        DataRow := -1;
                        DataCol := -1;
                    end
                    else
                    begin
                        DataCol := GetFirstVisibleCol;
                        DataRow := DataRowNr[DisplayRow];
                    end;
                end;
            end;
            grCellSelect:
            begin
                DataCol := GetNextVisibleCol(DataCol);
                if DataCol <> -1 then
                    if DisplayColnr[DataCol] > SelectedCells.Right then
                        DataCol := -1;

                if DataCol = -1 then
                begin
                    DataRow := GetNextVisibleRow(DataRow);
                    if DataRow <> -1 then
                        if DisplayRownr[DataRow] > SelectedCells.Bottom then
                            DataRow := -1;

                    if DataRow = -1 then
                        DataCol := -1
                    else
                        DataCol := DataColnr[SelectedCells.Left];
                end;
            end;
        end;
    end;
end;

function TtsDesignInfo.CellSelected(DataCol: integer; DataRow: Variant; StatusSet: TtsGridStats): Boolean;
begin
    with TtsBaseGrid_(FBaseGrid) do
    begin
        if not (GridStatus in StatusSet) then
            result := False
        else if (DataCol = CurrentCell.DataCol) and (DataRow = CurrentCell.DataRow) and (DataCol <> -1) and (DataRow <> -1) and (GridStatus = grNormal) then
            result := True
        else
            result := CellSelected(DisplayColnr[DataCol], DisplayRownr[DataRow]);
    end;
end;

function TtsDesignInfo.CellSelectedCount(StatusSet: TtsGridStats): integer;
begin
    with TtsBaseGrid_(FBaseGrid) do
    begin
        if not (GridStatus in StatusSet) then
        begin
            result := 0;
            exit;
        end;

        case GridStatus of
            grNormal:
                result := 1;
            grRowSelect:
                result := FVisibleCols.Count * SelectedRows.Count;
            grColSelect:
                result := FVisibleRows.Count * SelectedCols.Count;
            grCellSelect:
                with SelectedCells do
                    result := (Bottom - Top) * (Right - Left);
            else
                result := 0;
        end;
    end;
end;

function TtsDesignInfo.GetFirstVisibleCol: integer;
var
    DisplayCol: integer;
begin
    with TtsBaseGrid_(FBaseGrid) do
    begin
        DisplayCol := 1;
        while DisplayCol <= Cols do
        begin
            if Col[DataColnr[DisplayCol]].Visible then
                break;

            DisplayCol := DisplayCol + 1;
        end;
        if DisplayCol <= Cols then
            result := DataColnr[DisplayCol]
        else
            result := -1;
    end;
end;

function TtsDesignInfo.GetNextVisibleCol(DataCol: integer): integer;
var
    DisplayCol: integer;
begin
    with TtsBaseGrid_(FBaseGrid) do
    begin
        DisplayCol := DisplayColnr[DataCol] + 1;
        while DisplayCol <= Cols do
        begin
            if Col[DataColnr[DisplayCol]].Visible then
                break;

            DisplayCol := DisplayCol + 1;
        end;

        if DisplayCol <= Cols then
            result := DataColnr[DisplayCol]
        else
            result := -1;
    end;
end;

function TtsDesignInfo.GetFirstVisibleRow: Variant;
var
    DisplayRow: integer;
begin
    with TtsBaseGrid_(FBaseGrid) do
    begin
        DisplayRow := 1;
        while DisplayRow <= Rows do
        begin
            if RowVisible[DataRownr[DisplayRow]] then
                break;

            DisplayRow := DisplayRow + 1;
        end;

        if DisplayRow <= Rows then
            result := DataRownr[DisplayRow]
        else
            result := -1;
    end;
end;

function TtsDesignInfo.GetNextVisibleRow(DataRow: Variant): Variant;
var
    DisplayRow: integer;
begin
    with TtsBaseGrid_(FBaseGrid) do
    begin
        DisplayRow := DisplayRownr[DataRow] + 1;
        while DisplayRow <= Rows do
        begin
            if RowVisible[DataRownr[DisplayRow]] then
                break;

            DisplayRow := DisplayRow + 1;
        end;

        if DisplayRow <= Rows then
            result := DataRownr[DisplayRow]
        else
            result := -1;
    end;
end;

function TtsDesignInfo.GetVisibleColCount: integer;
var
    DataCol: integer;
begin
    with TtsBaseGrid_(FBaseGrid) do
    begin
        result := 0;
        for DataCol := 1 to Cols do
            if Col[DataCol].Visible then
                result := result + 1;
    end;
end;

function TtsDesignInfo.GetVisibleRowCount(FromRow, ToRow: Variant): integer;
var
    DataRow: integer;
begin
    with TtsBaseGrid_(FBaseGrid) do
    begin
        result := 0;
        for DataRow := FromRow to ToRow do
            if RowVisible[DataRow] then
                result := result + 1;
    end;
end;

{End TtsDesignInfo}

{TtsDBDesignInfo}

function  TtsDBDesignInfo.GetCustomDBGrid: TtsCustomDBGrid;
begin
    result := TtsCustomDBGrid(FBaseGrid);
end;

procedure TtsDBDesignInfo.SetCustomDBGrid(CustomDBGrid: TtsCustomDBGrid);
begin
    FBaseGrid := CustomDBGrid;
end;

function  TtsDBDesignInfo.GetDataBound: Boolean;
begin
    result := TtsCustomDBGrid_(Grid).FDataBound;
end;

function  TtsDBDesignInfo.GetFieldState: TtsFieldState;
begin
    result := TtsCustomDBGrid_(Grid).GetFieldState;
end;

procedure TtsDBDesignInfo.SetFieldState(Value: TtsFieldState);
begin
    TtsCustomDBGrid_(Grid).SetFieldState(Value);
end;

function  TtsDBDesignInfo.GetCurrentDataRow: Variant;
begin
    result := TtsCustomDBGrid_(Grid).CurrentDataRow;
end;

procedure TtsDBDesignInfo.SetCurrentDataRow(Value: Variant);
begin
    TtsCustomDBGrid_(Grid).CurrentDataRow := Value;
end;

function  TtsDBDesignInfo.GetCurrentCell: TtsDBCurrentCell;
begin
    result := TtsCustomDBGrid_(Grid).CurrentCell;
end;

function  TtsDBDesignInfo.GetCellButtonType(DataCol: LongInt; DataRow: Variant): TtsButtonType;
begin
    result := TtsCustomDBGrid_(Grid).CellButtonType[DataCol, DataRow];
end;

function  TtsDBDesignInfo.GetCellControlType(DataCol: LongInt; DataRow: Variant): TtsControlType;
begin
    result := TtsCustomDBGrid_(Grid).CellControlType[DataCol, DataRow];
end;

function  TtsDBDesignInfo.GetRowControlType(DataRow: Variant): TtsControlType;
begin
    result := TtsCustomDBGrid_(Grid).RowControlType[DataRow];
end;

function  TtsDBDesignInfo.GetRowButtonType(DataRow: Variant): TtsButtonType;
begin
    result := TtsCustomDBGrid_(Grid).RowButtonType[DataRow];
end;

function  TtsDBDesignInfo.GetRowCombo(DataRow: Variant): TtsCombo;
begin
    result := TtsCombo(TtsCustomDBGrid_(Grid).RowCombo[DataRow]);
end;

procedure TtsDBDesignInfo.SetRowCombo(DataRow: Variant; Value: TtsCombo);
begin
    TtsCustomDBGrid_(Grid).RowCombo[DataRow] := TtsDBCombo(Value);
end;

function  TtsDBDesignInfo.GetCellCombo(DataCol: LongInt; DataRow: Variant): TtsCombo;
begin
    result := TtsCombo(TtsCustomDBGrid_(Grid).CellCombo[DataCol, DataRow]);
end;

procedure TtsDBDesignInfo.SetCellCombo(DataCol: LongInt; DataRow: Variant; Value: TtsCombo);
begin
    TtsCustomDBGrid_(Grid).CellCombo[DataCol, DataRow] := TtsDBCombo(Value);
end;

function  TtsDBDesignInfo.GetDataSource: TDataSource;
begin
    result := TtsCustomDBGrid_(Grid).DataSource;
end;

procedure TtsDBDesignInfo.SetDataSource(Value: TDataSource);
begin
    TtsCustomDBGrid_(Grid).DataSource := Value;
end;

procedure TtsDBDesignInfo.GetFirstSelectedCell(var DataCol: integer; var DataRow: Variant; StatusSet: TtsGridStats);
begin
    if not TtsCustomDBGrid_(Grid).DataBound then begin inherited GetFirstSelectedCell(DataCol, DataRow, StatusSet); Exit end;

    with TtsCustomDBGrid_(Grid) do
    begin
        if not (GridStatus in StatusSet) then
        begin
            DataCol := -1;
            DataRow := UnAssigned;
            exit;
        end;

        case GridStatus of
            grNormal:
            begin
                DataCol := CurrentCell.DataCol;
                DataRow := CurrentCell.DataRow;
            end;
            grRowSelect:
            begin
                DataCol := GetFirstVisibleCol;
                DataRow := SelectedRows.First;
            end;
            grColSelect:
            begin
                DataCol := DataColnr[SelectedCols.First];
                DataRow := GetFirstVisibleRow;
            end;
            grCellSelect:
            begin
                DataCol := DataColnr[SelectedCells.Left];
                DataRow := SelectedCells.Top;
            end;
        end;
    end;
end;

procedure TtsDBDesignInfo.GetNextSelectedCell(var DataCol: integer; var DataRow: Variant; StatusSet: TtsGridStats);
var
    DisplayCol: integer;
    strDataRow, strBottom: string;
begin
    if not TtsCustomDBGrid_(Grid).DataBound then begin inherited GetNextSelectedCell(DataCol, DataRow, StatusSet); Exit end;

    with TtsCustomDBGrid_(Grid) do
    begin
        if not (GridStatus in StatusSet) then
        begin
            DataCol := -1;
            DataRow := UnAssigned;
            exit;
        end;

        case GridStatus of
            grNormal:
            begin
                DataCol := -1;
                DataRow := UnAssigned;
            end;
            grColSelect:
            begin
                DisplayCol := SelectedCols.Next(DisplayColnr[DataCol]);
                if DisplayCol <> -1 then
                    DataCol := DataColnr[DisplayCol]
                else
                begin
                    DataRow := GetNextVisibleRow(DataRow);
                    if VarIsEmpty(DataRow) then
                        DataCol := -1
                    else
                        DataCol := DataColnr[SelectedCols.First];
                end;
            end;
            grRowSelect:
            begin
                DataCol := GetNextVisibleCol(DataCol);
                if DataCol = -1 then
                begin
                    DataRow := SelectedRows.Next(DataRow);

                    if VarIsEmpty(DataRow) then
                        DataCol := -1
                    else
                        DataCol := GetFirstVisibleCol;
                end;
            end;
            grCellSelect:
            begin
                DataCol := GetNextVisibleCol(DataCol);
                if DataCol <> -1 then
                    if DisplayColnr[DataCol] > SelectedCells.Right then
                        DataCol := -1;

                if DataCol = -1 then
                begin
                    DataRow := GetNextVisibleRow(DataRow);
                    if not VarIsEmpty(DataRow) then
                    begin
                        strDataRow := DataRow;
                        strBottom := SelectedCells.Bottom;
                        if CompareBkm(strDataRow, strBottom) = 1 then
                            DataRow := UnAssigned;
                    end;

                    if VarIsEmpty(DataRow) then
                        DataCol := -1
                    else
                        DataCol := DataColnr[SelectedCells.Left];
                end;
            end;
        end;
    end;
end;

function TtsDBDesignInfo.CellSelected(DataCol: integer; DataRow: Variant; StatusSet: TtsGridStats): Boolean;
begin
    if not TtsCustomDBGrid_(Grid).DataBound then begin result := inherited CellSelected(DataCol, DataRow, StatusSet); Exit end;

    with TtsCustomDBGrid_(Grid) do
    begin
        if not (GridStatus in StatusSet) then
            result := False
        else if (DataCol = CurrentCell.DataCol) and (DataRow = CurrentCell.DataRow) and (DataCol <> -1) and (DataRow <> -1) and (GridStatus = grNormal) then
            result := True
        else
            result := CellSelected(DisplayColnr[DataCol], DataRow);
    end;
end;

function TtsDBDesignInfo.CellSelectedCount(StatusSet: TtsGridStats): integer;
var
    FirstRow, LastRow: Variant;
begin
    if not TtsCustomDBGrid_(Grid).DataBound then begin result := inherited CellSelectedCount(StatusSet); Exit end;

    with TtsCustomDBGrid_(Grid) do
    begin
        if not (GridStatus in StatusSet) then
        begin
            result := 0;
            exit;
        end;

        case GridStatus of
            grNormal:
                result := 1;
            grRowSelect:
                result := GetVisibleColCount * SelectedRows.Count;
            grColSelect:
                begin
                    DataSource.DataSet.First;
                    FirstRow := DataSource.DataSet.Bookmark;
                    DataSource.DataSet.Last;
                    LastRow := DataSource.DataSet.Bookmark;
                    result := Self.GetVisibleRowCount(FirstRow, LastRow) * SelectedCols.Count;
                end;
            grCellSelect:
                with SelectedCells do
                    result := Self.GetVisibleRowCount(Top, Bottom) * (Right - Left);
            else
                result := 0;
        end;
    end;
end;

function TtsDBDesignInfo.GetVisibleRowCount(FromRow, ToRow: Variant): integer;
var
    strCurrentRow, strToRow: string;
begin
    if not TtsCustomDBGrid_(Grid).DataBound then begin result := inherited GetVisibleRowCount(FromRow, ToRow); Exit end;

    result := 0;
    DataSource.DataSet.Bookmark := FromRow;
    strToRow := ToRow;
    while not DataSource.DataSet.EOF do
    begin
        result := result + 1;

        strCurrentRow := DataSource.DataSet.Bookmark;
        if TtsCustomDBGrid_(Grid).CompareBkm(strCurrentRow, strToRow) <= 0 then
            break;

        DataSource.DataSet.Next;
    end;
end;

function TtsDBDesignInfo.GetFirstVisibleRow: Variant;
begin
    if not TtsCustomDBGrid_(Grid).DataBound then begin result := inherited GetFirstVisibleRow; Exit end;

    DataSource.DataSet.First;
    result := DataSource.DataSet.Bookmark;
end;

function TtsDBDesignInfo.GetNextVisibleRow(DataRow: Variant): Variant;
var
    strCurrentBookmark, strDataRow: string;
begin
    if not TtsCustomDBGrid_(Grid).DataBound then begin result := inherited GetNextVisibleRow(DataRow); Exit end;

    strCurrentBookmark := DataSource.DataSet.Bookmark;
    strDataRow := DataRow;
    if TtsCustomDBGrid_(Grid).CompareBkm(strDataRow, strCurrentBookmark) <> 0 then
        DataSource.DataSet.Bookmark := DataRow;

    DataSource.DataSet.Next;
    if DataSource.DataSet.EOF then
        result := DataSource.DataSet.Bookmark
    else
        result := UnAssigned;
end;


{TtsGridEditor}

procedure TtsGridEditor.Edit;
begin
    ShowMessage('Edit');
    StartedFromDesigntime := True;
    FirstActivate := True;
    TsDesign.Designer := Designer;
    Screen.Cursor := crHourglass;
    try
        ShowMessage('TfrmInspector.Create');
        frmInspector := TfrmInspector.Create(Application);
    except
        Screen.Cursor := crDefault;
        frmInspector.Free;
        frmInspector := nil;
        raise;
    end;

    try
{$IFDEF TSVER_V6}
        frmInspector.pnlGrdExample.Font := TForm(Designer.Root).Font;
        frmInspector.Caption := TForm(Designer.Root).Name + '.' + Component.Name + ' - TopGrid Editor';
{$ELSE}
        frmInspector.pnlGrdExample.Font := Designer.Form.Font;
        frmInspector.Caption := Designer.Form.Name + '.' + Component.Name + ' - TopGrid Editor';
{$ENDIF}
        ShowMessage('DesignActivatesFirstTime');
        if DesignActivatesFirstTime then
        begin
            frmInspector.Left := Trunc((Screen.Width - frmInspector.Width)/2);
            frmInspector.Top := Trunc((Screen.Height - frmInspector.Height)/2);
            CurDisplayModeName := 'Structured';

            PrevLeft := frmInspector.Left;
            PrevTop := frmInspector.Top;
            PrevWidth := frmInspector.Width;
            PrevHeight := frmInspector.Height;

            DesignActivatesFirstTime := False;
        end
        else
        begin
            frmInspector.Left := PrevLeft;
            frmInspector.Top := PrevTop;
            CurDisplayModeName := PrevDisplayModeName;
        end;

        CurGrid := TtsBaseGrid(Component);
        ShowMessage('ShowModal');
        frmInspector.ShowModal;

        PrevState := frmInspector.WindowState;
        if PrevState = wsNormal then
        begin
            PrevLeft := frmInspector.Left;
            PrevTop := frmInspector.Top;
            PrevWidth := frmInspector.Width;
            PrevHeight := frmInspector.Height;
        end;

        PrevDisplayModeName := frmInspector.grdInspector.DisplayModeName;

        if SaveResult then
        begin
            frmInspector.ShowAlwaysStateGrid := True;
            frmInspector.ApplyShowDesignValueGrid;
            frmInspector.CheckInsertRow(GridEditor.grdExample);
            CurGrid.Assign(GridEditor.grdExample);
            CurGrid.Name := CurGridName;
            CurGrid.Width := CurGridWidth;
            CurGrid.Height := CurGridHeight;
            CurGrid.Visible := CurGridVisible;
            TsDesign.Designer.Modified;
        end;
    finally
        TsDesign.Designer := nil;
        frmInspector.FreeActualValuesGrid;
        frmInspector.FreeAll;
        FreeNil(TObject(frmInspector));

        Screen.Cursor := crDefault;
    end;
end;

function TtsGridEditor.GetVerbCount: Integer;
begin
    result := 1;
end;

function TtsGridEditor.GetVerb(Index: integer): string;
begin
    result := '&TopGrid Editor'
end;

procedure TtsGridEditor.ExecuteVerb(Index: integer);
begin
    Edit;
end;

{TGridValues}

constructor TGridValues.Create(Cols, Rows: integer);
begin
    inherited Create;

    FCols := Cols;
    FRows := Rows;

    GridData := nil;
    CurRowsInGridData := 0;
end;

destructor TGridValues.Destroy;
var
    i, j: integer;

begin
    for i := 0 to CurRowsInGridData - 1 do
    begin
        for j := 0 to CurColsInRowData[i] - 1 do
            GridData[i][j] := Unassigned;

        ReAllocMem(GridData[i], 0);
    end;
    ReAllocMem(GridData, 0);
    ReAllocMem(CurColsInRowData, 0);

    inherited Destroy;
end;

function TGridValues.GetValue(DataCol, DataRow: Integer): Variant;
begin
    if DataRow > CurRowsInGridData then
        result := Unassigned
    else if DataCol > CurColsInRowData[DataRow - 1] then
        result := Unassigned
    else
        result := GridData[DataRow - 1][DataCol - 1];
end;

procedure TGridValues.SetValue(DataCol, DataRow: Integer; Value: Variant);
var
    Row: integer;
    AllocRows: integer;
    AllocCols: integer;

begin
    if DataRow > CurRowsInGridData then
    begin
        if DataRow < FRows then
            AllocRows := FRows
        else
            AllocRows := DataRow + 10;

        ReAllocMem(GridData, AllocRows * SizeOf(PRowData));
        ReAllocMem(CurColsInRowData, AllocRows * SizeOf(integer));
        for Row := CurRowsInGridData + 1 to AllocRows do
        begin
            GridData[Row - 1] := nil;
            CurColsInRowData[Row - 1] := 0;
        end;
        CurRowsInGridData := AllocRows;
    end;

    if DataCol > CurColsInRowData[DataRow - 1] then
    begin
        if DataCol < FCols then
            AllocCols := FCols
        else
            AllocCols := DataCol + 10;

        ReAllocMem(GridData[DataRow - 1], AllocCols * SizeOf(Variant));
        ZeroMemory(@(GridData[DataRow - 1][CurColsInRowData[DataRow - 1]]), (AllocCols - CurColsInRowData[DataRow - 1]) * SizeOf(Variant));
        CurColsInRowData[DataRow - 1] := AllocCols;
    end;

    GridData[DataRow - 1][DataCol - 1] := Value;
end;

procedure TGridValues.DeleteRows(FromRow, ToRow: integer);
var
    Row, Col, NrOfRows: integer;

begin
    if ToRow < FromRow then
        exit;

    if FromRow > CurRowsInGridData then
        exit;

    if ToRow > CurRowsInGridData then
        ToRow := CurRowsInGridData;

    for Row := ToRow downto FromRow do
    begin
        for Col := 1 to CurColsInRowData[Row - 1] do
            GridData[Row - 1][Col - 1] := Unassigned;

        ReAllocMem(GridData[Row - 1], 0);
    end;

    NrOfRows := ToRow - FromRow + 1;
    for Row := FromRow to CurRowsInGridData - NrOfRows do
    begin
        GridData[Row - 1] := GridData[Row + NrOfRows - 1];
        CurColsInRowData[Row - 1] := CurColsInRowData[Row + NrOfRows - 1];
    end;

    CurRowsInGridData := CurRowsInGridData - NrOfRows;

    ReAllocMem(GridData, CurRowsInGridData * SizeOf(PRowData));
    ReAllocMem(CurColsInRowData, CurRowsInGridData * SizeOf(integer));
end;

procedure TGridValues.DeleteCols(FromCol, ToCol: integer);
var
    Row, RowToCol, NrOfCols, Col: integer;

begin
    if ToCol < FromCol then
        exit;

    for Row := 1 to CurRowsInGridData do
    begin
        if FromCol <= CurColsInRowData[Row - 1] then
        begin
            if ToCol > CurColsInRowData[Row - 1] then
                RowToCol := CurColsInRowData[Row - 1]
            else
                RowToCol := ToCol;

            NrOfCols := RowToCol - FromCol + 1;
            for Col := FromCol to CurColsInRowData[Row - 1] - NrOfCols do
                GridData[Row - 1][Col - 1] := GridData[Row - 1][Col + NrOfCols - 1];

            for Col := CurColsInRowData[Row - 1] - NrOfCols + 1 to CurColsInRowData[Row - 1] do
                GridData[Row - 1][Col - 1] := Unassigned;

            CurColsInRowData[Row - 1] := CurColsInRowData[Row - 1] - NrOfCols;

            ReAllocMem(GridData[Row - 1], CurColsInRowData[Row - 1] * SizeOf(Variant));
        end;
    end;
end;
// End GridValues Implementation

// Start TEditor

constructor TEditor.Create(grdClass : TtsBaseGridClass; ComboGrid: Boolean);
begin
    inherited Create;

    FComboGrid := ComboGrid;
    FDesignInfo := nil;
    grdExampleClass := grdClass;
    grdExample := nil;
    FirstEditorCell := nil;
    NextEditorCell := nil;
    IdEditorCell := nil;
    FirstEditorRow := nil;
    NextEditorRow := nil;
    IdEditorRow := nil;
    FCellPropList := nil;
    UseCellPropList := False;
    CellPropListIndex := -1;
    ExampleKeyIsDown := False;
    ExampleMouseIsDown := False;
    UpdateComponentsOnUp := False;
    InColResize := False;
    ValColumns := TGridValues.Create(2, 20);
    FTabInfo := nil;
    FTabInfoCount := 0;
    CurrentTab := 0;
    FieldNames := nil;

    SetGrdExample;
end;

destructor  TEditor.Destroy;
begin
    FDesignInfo.Free;
    FDesignInfo := nil;

    ResetTabInfo;
    ReAllocMem(FTabInfo, 0);

    FirstEditorCell.Free;
    FirstEditorCell := nil;
    NextEditorCell.Free;
    NextEditorCell := nil;
    IdEditorCell.Free;
    IdEditorCell := nil;
    FirstEditorRow.Free;
    FirstEditorRow := nil;
    NextEditorRow.Free;
    NextEditorRow := nil;
    IdEditorRow.Free;
    IdEditorRow := nil;
    FieldNames.Free;
    FieldNames := nil;
    ValColumns.Free;

    inherited Destroy;
end;

function TEditor.GetDesignInfo: TtsDesignInfo;
begin
    if FDesignInfo = nil then
    begin
        if grdExample is TtsCustomGrid then
            FDesignInfo := TtsDesignInfo.Create(grdExample as TtsCustomGrid)
        else
            FDesignInfo := TtsDBDesignInfo.Create(grdExample as TtsCustomDBGrid);
    end;
    result := FDesignInfo;
end;

procedure TEditor.GetFieldNames;
begin
    FieldNames.Free;
    FieldNames := TStringList.Create;

    if DataBound then
    begin
        try
            if TtsCustomDBGrid_(grdExample as TtsCustomDBGrid).DataSource.DataSet <> nil then
            begin
                try
                    TtsCustomDBGrid_(grdExample as TtsCustomDBGrid).DataSource.DataSet.GetFieldNames(FieldNames);
                except
                end;
            end;
        finally
            frmInspector.grdDatafields.Rows := FieldNames.Count;
        end;
    end;
end;

function  TEditor.GetCellPropList: TtsSetList;
begin
    if FCellPropList = nil then
        FCellPropList := grdExample.GetCellPropSet.List;

    result := FCellPropList;
end;

function  TEditor.GetTabInfo: PtsTabList;
begin
    if FTabInfo = nil then
        CreateTabInfo;

    result := FTabInfo;
end;

procedure TEditor.CreateTabInfo;
var
    i: integer;

begin
    with frmInspector do
    begin
        FTabInfoCount := tabInspector.PageCount;
        ReAllocMem(FTabInfo, tabInspector.PageCount * SizeOf(TtsTabElement));
        ZeroMemory(FTabInfo, tabInspector.PageCount * SizeOf(TtsTabElement));

        for i := 0 to tabInspector.PageCount - 1 do
        begin
            with FTabInfo[i] do
            begin
                TopRow := 2;
                CurRow := 2;
                DisplayModeName := '';
                NumberofToggleValues := 0;
                NumberofInvisibleValues := 0;
                if TtsBaseGrid_(grdExample).FAsCombo then
                begin
                    if tabinspector.pages[i] = tabGridProperties then
                        ComponentEditor := ceComboGrid
                    else if tabinspector.pages[i] = tabColumnProperties then
                        ComponentEditor := ceComboColumn
                    else if tabinspector.pages[i] = tabRowProperties then
                        ComponentEditor := ceComboRow
                    else if tabinspector.pages[i] = tabCellProperties then
                        ComponentEditor := ceComboCell
                    else
                        ComponentEditor := nil;
                end
                else
                begin
                    if tabinspector.pages[i] = tabGridProperties then
                        ComponentEditor := ceGrid
                    else if tabinspector.pages[i] = tabColumnProperties then
                        ComponentEditor := ceColumn
                    else if tabinspector.pages[i] = tabRowProperties then
                        ComponentEditor := ceRow
                    else if tabinspector.pages[i] = tabCellProperties then
                        ComponentEditor := ceCell
                    else
                        ComponentEditor := nil;
                end;
            end;
        end;
    end;
end;

procedure TEditor.ResetTabInfo;
var
    I: Integer;
begin
    for I := 0 to FTabInfoCount - 1 do
    begin
        FTabInfo[I].DisplayModeName := '';
    end;
end;

procedure TEditor.SetGrdExample;
begin
    with frmInspector do
    begin
        if FComboGrid then
        begin
            if GridEditor.grdExample is TtsCustomGrid then
                grdExample := TtsCustomGrid_(GridEditor.grdExample as TtsCustomGrid).Combo.Grid
            else
                grdExample := TtsCustomDBGrid_(GridEditor.grdExample as TtsCustomDBGrid).Combo.Grid;

            TtsBaseGrid_(grdExample).InDesignMode := True;
            grdExample.Name := 'ComboGrid';
        end
        else
        begin
            grdExample := grdExampleClass.Create(frmInspector);
            TtsBaseGrid_(grdExample).InDesignMode := True;

            try
                grdExample.Assign(CurGrid);
            except
                on E:Exception do ShowMessage(E.Message);
            end;

            grdExample.Name := 'DesignGrid';
            CurGridName := CurGrid.Name;
            CurGridWidth := CurGrid.Width;
            CurGridHeight := CurGrid.Height;
            CurGridVisible := CurGrid.Visible;
            grdExample.Top := 1;
            grdExample.Left := 1;
        end;

        if grdExample is TtsCustomDBGrid then
        begin
            with TtsCustomDBGrid_(grdExample) do
            begin
                OnInsertRow := grdExampleInsertRow;
                OnRowChanged := grdExampleRowChanged;
                OnCellLoaded := grdExampleCellLoaded;
                OnCellEdit := grdExampleCellEdit;
                OnStartCellEdit := grdExampleStartCellEdit;
                OnComboDropDown := grdExampleComboDropDown;
                OnComboRollUp := grdExampleComboRollUp;
                OnDblClickCell := grdExampleDblClickCell;
                OnGetDrawInfo := grdExampleGetDrawInfo;
                OnCellChanged := grdExampleCellChanged;
            end;
        end
        else if grdExample is TtsCustomGrid then
        begin
            with TtsCustomGrid_(grdExample) do
            begin
                OnInsertRow := grdExampleInsertRow_Unbound;
                OnRowChanged := grdExampleRowChanged_Unbound;
                OnCellLoaded := grdExampleCellLoaded_Unbound;
                OnCellEdit := grdExampleCellEdit_Unbound;
                OnStartCellEdit := grdExampleStartCellEdit_Unbound;
                OnComboDropDown := grdExampleComboDropDown_Unbound;
                OnComboRollUp := grdExampleComboRollUp_Unbound;
                OnDblClickCell := grdExampleDblClickCell_Unbound;
                OnGetDrawInfo := grdExampleGetDrawInfo_Unbound;
                OnCellChanged := grdExampleCellChanged_Unbound;
            end;
        end
        else
            ShowMessage('The TopGrid component editor can only be used with components derived directly or indirectly from either the TtsCustomGrid or TtsCustomDBGrid.');

        with TtsBaseGrid_(grdExample as TtsBaseGrid) do
        begin
            OnColMoved := grdExampleColMoved;
            OnRowMoved := grdExampleRowMoved;
            OnColResized := grdExampleColResized;
            OnRowResized := grdExampleRowResized;
            OnColChanged := grdExampleColChanged;
            OnGridStatusChanged := grdExampleGridStatusChanged;
            OnInsertCol := grdExampleInsertCol;
            OnMouseStatusChanged := grdExampleMouseStatusChanged;
            OnExit := grdExampleExit;
            OnKeyDown := grdExampleKeyDown;
            OnKeyUp := grdExampleKeyUp;
            OnMouseDown := grdExampleMouseDown;
            OnMouseUp := grdExampleMouseUp;
            OnColCountChanged := grdExampleColCountChanged;
            OnRowCountChanged := grdExampleRowCountChanged;
            OnEnter := grdExampleEnter;
        end;
    end;
end;

function TEditor.GetDataBound: Boolean;
begin
    if grdExample is TtsCustomGrid then
        result := false
    else if grdExample is TtsCustomDBGrid then
        result := TtsCustomDBGrid_(grdExample as TtsCustomDBGrid).Databound
    else
    begin
        ShowMessage('The TopGrid component editor can only be used with components derived directly or indirectly from either the TtsCustomGrid or TtsCustomDBGrid.');
        result := false;
    end;
end;

// End TEditor

procedure TfrmInspector.SetGridsDisplayProp;
var
    FieldNr: Integer;
    DataRow, DisplayRow: Integer;
    i: Integer;
    Found: Boolean;
    ShowAllDataFields: Boolean;

begin
    if not CurEditor.DataBound then
        exit;

    grdColumns.EnablePaint := False;
    grdDatafields.EnablePaint := False;
    grdDataFields.ResetCellProperties([prFont]);
    grdDatafields.ResetRowProperties([prVisible]);

    ShowAllDataFields := butAll.Down;

    if TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState = fsDefault then
        grdColumns.Rows := 0
    else
        grdColumns.Rows := TtsBaseGrid_(CurEditor.grdExample).Cols;

    for i := 1 to TtsCustomDBGrid_(CurEditor.grdExample).Cols do
        CurEditor.ValColumns.SetValue(1, i, TtsCustomDBGrid_(CurEditor.grdExample).Col[i].FieldName);

    try
        for DisplayRow := 1 to grdColumns.Rows do
        begin
            DataRow := grdColumns.DataRownr[DisplayRow];

            FieldNr := CurEditor.FieldNames.IndexOf(CurEditor.ValColumns.GetValue(1, DataRow));
            if FieldNr <> -1 then
            begin
                SetFieldName(DataRow, CurEditor.FieldNames[FieldNr]);
                if grdDatafields.CellFont[1, FieldNr + 1] = nil then
                    CurEditor.ValColumns.SetValue(2, DataRow, BoundValue)
                else
                    CurEditor.ValColumns.SetValue(2, DataRow, BoundValueDouble);

                grdDatafields.AssignCellFont(1, FieldNr + 1);
                grdDatafields.CellFont[1, FieldNr + 1].Color := clGray;
                if not ShowAllDataFields then
                    grdDatafields.RowVisible[FieldNr + 1] := False;
            end
            else if VarIsEmpty(CurEditor.ValColumns.GetValue(1, DataRow)) then
                CurEditor.ValColumns.SetValue(2, DataRow, UnBoundValue)
            else if CurEditor.ValColumns.GetValue(1, DataRow) = '' then
                CurEditor.ValColumns.SetValue(2, DataRow, UnBoundValue)
            else
            begin
                Found := False;
                for i := 1 to DisplayRow -1 do
                    if LowerCase(CurEditor.ValColumns.GetValue(1, grdColumns.DataRownr[i])) = LowerCase(CurEditor.ValColumns.GetValue(1, DataRow)) then
                    begin
                        Found := True;
                        break;
                    end;

                if Found then
                    CurEditor.ValColumns.SetValue(2, DataRow, UnBoundValueDouble)
                else
                    CurEditor.ValColumns.SetValue(2, DataRow, UnBoundValue);
            end;
        end;

        with TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid) do
            for i:= 1 to Cols do
                if grdColumns.DisplayRownr[i] <> Col[i].DisplayCol then
                    grdColumns.DisplayRownr[i] := Col[i].DisplayCol;

        grdInspector.UpdateComponents;
    finally
        grdColumns.Invalidate;
        grdDatafields.Invalidate;
        grdColumns.EnablePaint := True;
        grdDatafields.EnablePaint := True;
    end;
end;

procedure TfrmInspector.SetFieldName(DataCol: Integer; FieldName: string);
begin
    CurEditor.ValColumns.SetValue(1, DataCol, FieldName);
    TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).Col[DataCol].FieldName := FieldName;
end;

procedure TfrmInspector.InsertField(FieldName: string);
begin
    if TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState = fsDefault then
    begin
        TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState := fsCustomized;
        cmbFieldState.ItemIndex := cmbFieldState.Items.IndexOf('fsCustomized');
        TtsBaseGrid_(CurEditor.grdExample).Cols := 0;
    end;

    grdColumns.Rows := grdColumns.Rows + 1;
    CurEditor.ValColumns.SetValue(1, grdColumns.Rows, FieldName);
    (CurEditor.grdExample as TtsCustomDBGrid).InsertCol(grdColumns.Rows, FieldName);
end;

procedure TfrmInspector.InitCustomizeColumns;
begin
    grdDataFields.ResetProperties(tsAllProperties);
    grdColumns.ResetProperties(tsAllProperties);

    grdDatafields.Col[1].Heading := 'Field name';
    grdDatafields.Col[1].Width := 1000;

    with grdColumns do
    begin
        Cols := 2;

        Col[1].Heading := 'Field name';
        Col[1].Width := grdColumns.Width - 80;
        Col[2].Heading := '  Bound';
        Col[2].ReadOnly := True;
        Col[2].Is3D := True;

        Col[2].Width := grdColumns.ClientWidth - Col[1].Width - RowBarWidth + 1000;
    end;
end;

procedure TfrmInspector.FormResize(Sender: TObject);
begin
    if sepSizerWidthDif <> -1 then
    begin
        sepSizer.Width := CalcMax(1, ClientWidth - sepSizerWidthDif);

        grdDatafields.Width := Round(grdDataFieldsWidthShare * CalcMax(1, ClientWidth - TotalWidthGridsDif));
        grdColumns.Width := Round((1 - grdDataFieldsWidthShare) * CalcMax(1, ClientWidth - TotalWidthGridsDif));
        grdColumns.Left := (grdDataFields.Left + grdDataFields.Width) + grdColumnsDif;
        grdColumns.Col[1].Width := Round(grdColumnsFirstColShare * grdColumns.Width);
        lblGridColumns.Left := grdColumns.Left;
        butAddSelected.Left := Round((grdDataFields.Left + grdDataFields.Width) + (grdColumns.Left - (grdDataFields.Left + grdDataFields.Width) - butAddSelected.Width)/2);
        butAddAll.Left := butAddSelected.Left;
        butAdd.Left := grdColumns.Left + Round((grdColumns.Width - (butRemove.Left - butAdd.Left) - butRemove.Width)/2);
        butRemove.Left := butAdd.Left + butRemoveDif;
        butUnselected.Width := Round(grdDatafields.Width * 0.4);
        butUnselected.Left := Round(grdDatafields.Left + (grdDatafields.Width * (1 - 0.4)));
        butAll.Width := Round(grdDatafields.Width * 0.32);
        butAll.Left := butUnselected.Left - butAll.Width;//- Round(grdDatafields.Left + (grdDatafields.Width * (1 - 0.32 - 0.4)));
        lblFieldState.Left := (grdColumns.Left + grdColumns.Width) - lblFieldStateDif;
        cmbFieldState.Left := (grdColumns.Left + grdColumns.Width) - cmbFieldState.Width;
        pnlInspectorGrid.Width := CalcMin(ClientWidth, pnlInspectorGridAutoWidthMax);
        grdInspector.Col[1].Width := Round(grdInspectorFirstColShare * grdInspector.Width);
    end;
end;

procedure TfrmInspector.tabInspectorChange(Sender: TObject);
begin
    grdInspectorAllRowsSelected := False;

    if tabInspector.ActivePage = tabCustomizeColumns then
    begin
        if TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState = fsDefault then
            cmbFieldState.ItemIndex := cmbFieldState.Items.IndexOf('fsDefault')
        else
            cmbFieldState.ItemIndex := cmbFieldState.Items.IndexOf('fsCustomized');

        SetGridsDisplayProp;

        pnlCustomizeColumns.Align := alClient;
        pnlCustomizeColumns.Visible := True;
        pnlInspector.Visible := False;
    end
    else
    begin
        pnlCustomizeColumns.Visible := False;
        pnlInspector.Visible := True;

        with CurEditor.TabInfo[tabInspector.ActivePage.PageIndex] do
        begin
            grdInspector.EnablePaint := False;
            try
                grdInspector.ComponentEditor := ComponentEditor;
                UnassignComponent(CurEditor);
                grdInspector.ComponentEditor.GetComponents;

                if (DisplayModeName = grdInspector.DisplayModeName) and (grdInspector.Rows > 0) then
                begin
                    grdInspector.TopRow := TopRow;
                    grdInspector.CurrentDataRow := CurRow;
                    grdInspector.PutCellInView(2, grdInspector.CurrentDataRow);
                end;
            finally
                grdInspector.EnablePaint := True;
            end;
        end;
    end;
    tabInspector.ActivePage.SetFocus;
end;

procedure TfrmInspector.tabInspectorChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
    AllowChange := True; //required when called from program
    try
        if grdInspector.EndEdit(False) then
        begin
            with CurEditor.TabInfo[tabInspector.ActivePage.PageIndex] do
            begin
                if grdInspector.Rows > 0 then
                begin
                    TopRow := grdInspector.TopRow;
                    CurRow := grdInspector.CurrentDataRow;
                    DisplayModeName := grdInspector.DisplaymodeName;
                end;
            end;
        end
        else
            AllowChange := False;
    except
        raise;
        AllowChange := False;
    end;
end;

procedure TfrmInspector.WndProc(var Message: TMessage);
begin
    case Message.Msg of
        WM_SETTOGRIDEDITOR:
            SetToGridEditor;
        WM_UPDATEINSPECTOR, WM_ROWCHANGED:
        begin
            if Message.WParam > InspectorLastUpdated then
            begin
                if CurEditor.ExampleKeyIsDown or CurEditor.ExampleMouseIsDown then
                    CurEditor.UpdateComponentsOnUp := True
                else
                begin
                    InspectorLastUpdated := Message.WParam;
                    grdInspector.UpdateComponents;
                end;
            end;
        end;
    end;
    inherited WndProc(Message);
end;

procedure TfrmInspector.SendUpdateComponents;
begin
    if not PostMessage(Self.Handle, WM_UPDATEINSPECTOR, InspectorLastUpdated + 1, 0) then
        grdInspector.UpdateComponents;
end;

procedure TfrmInspector.grdExampleColChanged(Sender: TObject; OldCol,
  NewCol: Longint);
begin
    SendUpdateComponents;
end;

procedure TfrmInspector.grdExampleGridStatusChanged(Sender: TObject;
  OldStatus, NewStatus: TtsGridStatus);
begin
    SendUpdateComponents;
end;

procedure TfrmInspector.grdExampleInsertCol(Sender: TObject;
  DataCol: Longint; ByUser: Boolean);
begin
    SendUpdateComponents;
end;

procedure TfrmInspector.grdExampleInsertRow(Sender: TObject;
  DataRow: Variant; ByUser: Boolean);
begin
    SendUpdateComponents;
end;

procedure TfrmInspector.grdExampleMouseStatusChanged(Sender: TObject;
  OldStatus, NewStatus: TtsMouseStatus);
begin
    if (NewStatus in [msNormal, msRowSelect, msColSelect, msCellSelect, msAllRowSelect]) then
        SendUpdateComponents;
end;

procedure TfrmInspector.grdExampleRowChanged(Sender: TObject; OldRow,
  NewRow: Variant);
begin
    PostMessage(Self.Handle, WM_ROWCHANGED, InspectorLastUpdated + 1, 0);
end;

procedure TfrmInspector.RegisterPropEditors;
begin
    RegisterPropertyEditor(TypeInfo(TFont), nil, '', TFontProperty);
    RegisterPropertyEditor(TypeInfo(TFontName), nil, '', TFontNameProperty);
    RegisterPropertyEditor(TypeInfo(TColor), nil, '', TColorProperty);

    RegisterPropertyEditor(TypeInfo(TDataSource), nil, '', TComponentProperty);
    RegisterPropertyEditor(TypeInfo(TtsMaskDefs), nil, '', TComponentProperty);
    RegisterPropertyEditor(TypeInfo(TPopupMenu), nil, '', TComponentProperty);
    RegisterPropertyEditor(TypeInfo(TtsImageList), nil, '', TComponentProperty);
end;

procedure TfrmInspector.FormActivate(Sender: TObject);
var
    TextHeight: integer;
begin
    if FirstActivate then
    begin
        ShowMessage('Form Activate');
        InitVars;

        if PrevWidth <> 0 then
        begin
            frmInspector.Width := PrevWidth;
            frmInspector.Height := PrevHeight;
            if PrevState = wsMinimized
                then frmInspector.WindowState := wsNormal
                else frmInspector.WindowState := PrevState;
        end;

        ShowMessage('Form Activate');
        initgrdHeading;
        grdInspector.ResizeColsInGrid := True;
        grdHeading.ResizeColsInGrid := True;

        ShowMessage('RegisterPropEditors');
        Screen.Cursor := crDefault;
        if CurGrid = nil then    // Tells if in runtime or not!
        begin
{$IFDEF TSVER_V6}
            //TsDesign.Designer.r
{$ELSE}
            TsDesign.Designer.Form := Self;
{$ENDIF}
            CurGrid := grdSample;
            RegisterPropEditors;
        end;

        ShowMessage('GridEditor');
        GridEditor := TEditor.Create(TtsBaseGridClass(CurGrid.ClassType), False);
        CurEditor := GridEditor;
        ShowMessage('SetActualValuesGrid');
        SetActualValuesGrid;
        ShowMessage('SetgrdExampleWidthAndHeight');
        SetgrdExampleWidthAndHeight;
        CurEditor.grdExample.Update;

        CurEditor.grdExample.Parent := pnlGrdExample;

        Update;

        InitHeightgrdColumns := grdColumns.Height;
        InitHeightpnlCustomizeColumns := pnlCustomizeColumns.Height;

        grdInspector.DisplayModeName := CurDisplayModeName;
        grdInspector.ComponentEditor := ceGrid;

        TextHeight := grdHeading.CellTextHeight[1,1] + 1;
        grdHeading.DefaultRowHeight := CalcMax(grdHeading.DefaultRowHeight, TextHeight + 1);
        grdHeading.ClientHeight := grdHeading.DefaultRowHeight;
        grdHeading.HeadingHeight := CalcMax(grdHeading.HeadingHeight, grdHeading.DefaultRowHeight);
        grdInspector.DefaultRowHeight := CalcMax(grdInspector.DefaultRowHeight, TextHeight);
        grdInspector.HeadingHeight := CalcMax(grdInspector.HeadingHeight, grdInspector.DefaultRowHeight);
        grdColumns.DefaultRowHeight := CalcMax(grdColumns.DefaultRowHeight, TextHeight);
        grdColumns.HeadingHeight := CalcMax(grdColumns.HeadingHeight, grdColumns.DefaultRowHeight);
        grdDataFields.DefaultRowHeight := CalcMax(grdDataFields.DefaultRowHeight, TextHeight);
        grdDataFields.HeadingHeight := CalcMax(grdDataFields.HeadingHeight, grdDataFields.DefaultRowHeight);

        grdHeading.Refresh;

        InitCustomizeColumns;

        CurEditor.GetFieldNames;
        CurEditor.SetRightTabsVisible;

        SetEnableDesignBehaviour;
        SetEnableInvisible;
        SetEnablebutLoadPicture;

        FirstActivate := False;
    end;
end;

function TfrmInspector.GetEditorCol(SenderEditor: TEditor; DisplayCol: integer): TPersistent;
begin
    if SenderEditor.grdExample is TtsCustomDBGrid then
        result := TtsCustomDBGrid_(SenderEditor.grdExample as TtsCustomDBGrid).Col[TtsBaseGrid_(SenderEditor.grdExample).DataColnr[DisplayCol]]
    else
        result := TtsBaseGrid_(SenderEditor.grdExample).Col[TtsBaseGrid_(SenderEditor.grdExample).DataColnr[DisplayCol]];

    (result as TtsCol).AutoCreateFont := True;
end;

function TfrmInspector.GetFirstEditorRow(SenderEditor: TEditor; DataRow: Variant): TPersistent;
begin
    if SenderEditor.DataBound then
    begin
        result := nil;
        exit;
    end;

    if SenderEditor.FirstEditorRow = nil then
    begin
        SenderEditor.FirstEditorRow := TtsDesignRow.Create(SenderEditor.grdExample, DataRow);

        if not Resetting then
            (SenderEditor.FirstEditorRow as TtsDesignRow).AutoCreateFont := True;
    end
    else
    begin
        if not ((SenderEditor.FirstEditorRow as TtsDesignRow).DataRow = DataRow) then
        begin
            if not Resetting then
                (SenderEditor.FirstEditorRow as TtsDesignRow).AutoCreateFont := False;

            (SenderEditor.FirstEditorRow as TtsDesignRow).DataRow := DataRow;
        end;

        if not Resetting then
            (SenderEditor.FirstEditorRow as TtsDesignRow).AutoCreateFont := True;
    end;

    result := SenderEditor.FirstEditorRow;
end;

function TfrmInspector.GetNextEditorRow(SenderEditor: TEditor; DataRow: Variant): TPersistent;
begin
    if SenderEditor.DataBound then
    begin
        result := nil;
        exit;
    end;

    if SenderEditor.NextEditorRow = nil then
        SenderEditor.NextEditorRow := TtsDesignRow.Create(SenderEditor.grdExample, DataRow)
    else
    begin
        if (not ((SenderEditor.NextEditorRow as TtsDesignRow).DataRow = (SenderEditor.FirstEditorRow as TtsDesignRow).DataRow))
            and not Resetting then
            (SenderEditor.NextEditorRow as TtsDesignRow).AutoCreateFont := False;

        (SenderEditor.NextEditorRow as TtsDesignRow).DataRow := DataRow;
    end;

    if not Resetting then
        (SenderEditor.NextEditorRow as TtsDesignRow).AutoCreateFont := True;

    result := SenderEditor.NextEditorRow;
end;

function TfrmInspector.GetFirstEditorCell(SenderEditor: TEditor; DataCol: integer; DataRow: Variant): TPersistent;
begin
    if SenderEditor.DataBound then
    begin
        result := nil;
        exit;
    end;

    if SenderEditor.FirstEditorCell = nil then
    begin
        SenderEditor.FirstEditorCell := TtsCell.Create(SenderEditor.grdExample, DataCol, DataRow);

        if not Resetting then
            (SenderEditor.FirstEditorCell as TtsCell).AutoCreateFont := True;
    end
    else
    begin
        if not (((SenderEditor.FirstEditorCell as TtsCell).DataCol = DataCol)
            and ((SenderEditor.FirstEditorCell as TtsCell).DataRow = DataRow)) then
        begin
            if not Resetting then
                (SenderEditor.FirstEditorCell as TtsCell).AutoCreateFont := False;

            (SenderEditor.FirstEditorCell as TtsCell).DataCol := DataCol;
            (SenderEditor.FirstEditorCell as TtsCell).DataRow := DataRow;
        end;

        if not Resetting then
            (SenderEditor.FirstEditorCell as TtsCell).AutoCreateFont := True;
    end;

    result := SenderEditor.FirstEditorCell;
end;

function TfrmInspector.GetNextEditorCell(SenderEditor: TEditor; DataCol: integer; DataRow: Variant): TPersistent;
begin
    if SenderEditor.DataBound then
    begin
        result := nil;
        exit;
    end;

    if SenderEditor.NextEditorCell = nil then
        SenderEditor.NextEditorCell := TtsCell.Create(SenderEditor.grdExample, DataCol, DataRow)
    else
    begin
        if (not (((SenderEditor.NextEditorCell as TtsCell).DataCol = (SenderEditor.FirstEditorCell as TtsCell).DataCol)
            and ((SenderEditor.NextEditorCell as TtsCell).DataRow = (SenderEditor.FirstEditorCell as TtsCell).DataRow)))
            and not Resetting then
            (SenderEditor.NextEditorCell as TtsCell).AutoCreateFont := False;

        (SenderEditor.NextEditorCell as TtsCell).DataCol := DataCol;
        (SenderEditor.NextEditorCell as TtsCell).DataRow := DataRow;
    end;

    if not Resetting then
        (SenderEditor.NextEditorCell as TtsCell).AutoCreateFont := True;

    result := SenderEditor.NextEditorCell;
end;

procedure TfrmInspector.StartScanComponents(lbl: string; Writing: Boolean; MaxCount: integer; var Cancel: Boolean);
var
    dblMaxCount: double;
    msg: string;
begin
    CurEditor.ScanCanceled := False;

    if Writing and (MaxCount > 1000) then
    begin
        if (MaxCount > 1000) and not Resetting then
        begin
            dblMaxCount := MaxCount;
            msg := 'You are about to update properties for %1.0n objects. ' + #13 + #13 +
                   'Setting properties for a lot of objects can result in bad performance, both at designtime, as well as runtime.' + #13 + #13 +
                   'We highly recommend trying to set properties at as high a level as possible. This means setting properties at the row or column level instead of the cell level if possible, or at the grid level instead of the row or column level if possible.' + #13 + #13 +
                   'If this cannot be done we advise to set the properties at runtime in the OnGetDrawInfo or else the OnRowLoaded event for this many objects.';

            if MessageDlg(Format(msg, [dblMaxCount]), mtWarning, [mbOK, mbCancel], 0) = mrCancel then
            begin
                Cancel := True;
                exit;
            end;
        end;

        ReleaseCapture;

        lblScanning.Caption := lbl;
        prbScanning.Position := 0;
        pnlScanning.Visible := True;
        pnlScanning.BringToFront;
        Update;
    end;
end;

procedure TfrmInspector.NextScannedComponent(Writing: Boolean; CurCount, MaxCount: integer; var Cancel: Boolean);
begin
    if ((CurCount mod 100) = 0) and (MaxCount > 1000) then
    begin
        CheckButStopClick;

        if CurEditor.ScanCanceled then
            Cancel := True
        else
        begin
            prbScanning.Position := (CurCount div (MaxCount div prbScanning.Max));
            prbScanning.Update;
        end;
    end;
end;

procedure TfrmInspector.EndScanComponents;
begin
    pnlScanning.Visible := False;
end;

procedure TfrmInspector.CheckButStopClick;
var
    Msg: TMsg;
begin
    while PeekMessage(Msg, 0, WM_MouseFirst, WM_MouseLast, PM_Remove) do
    begin
        if Msg.hWnd = pnlScanning.Handle then
        begin
            DispatchMessage(Msg);
            butStop.Update;
        end;
    end;
end;


procedure TfrmInspector.GetFirstSelectedCol(SenderEditor: TEditor; var DisplayCol: integer);
begin
    case TtsBaseGrid_(SenderEditor.grdExample).GridStatus of
        grNormal:
            DisplayCol := TtsBaseGrid_(SenderEditor.grdExample).DisplayColnr[TtsBaseGrid_(SenderEditor.grdExample).CurrentDataCol];
        grColSelect:
            DisplayCol := TtsBaseGrid_(SenderEditor.grdExample).SelectedCols.First;
        else
            DisplayCol := -1;
    end;
end;

procedure TfrmInspector.GetNextSelectedCol(SenderEditor: TEditor; var DisplayCol: integer);
begin
    case TtsBaseGrid_(SenderEditor.grdExample).GridStatus of
        grColSelect:
            DisplayCol := TtsBaseGrid_(SenderEditor.grdExample).SelectedCols.Next(DisplayCol);
        else
            DisplayCol := -1;
    end;
end;

procedure TfrmInspector.GetFirstSelectedRow(SenderEditor: TEditor; var DataRow: Variant);
begin
    case TtsBaseGrid_(SenderEditor.grdExample).GridStatus of
        grNormal:
            if SenderEditor.grdExample is TtsCustomDBGrid then
                with TtsCustomDBGrid_(SenderEditor.grdExample as TtsCustomDBGrid) do
                    DataRow := CurrentDataRow
            else
                with TtsCustomGrid_(SenderEditor.grdExample as TtsCustomGrid) do
                    DataRow := CurrentDataRow;
        grRowSelect:
            if SenderEditor.grdExample is TtsCustomDBGrid then
            begin
                with TtsCustomDBGrid_(SenderEditor.grdExample as TtsCustomDBGrid) do
                    if SenderEditor.DataBound then
                        DataRow := SelectedRows.First
                    else
                        DataRow := DataRownr[SelectedRows.First];
            end
            else
                with TtsCustomGrid_(SenderEditor.grdExample as TtsCustomGrid) do
                    DataRow := DataRownr[SelectedRows.First];
        else
            DataRow := Unassigned;
    end;
end;

procedure TfrmInspector.GetNextSelectedRow(SenderEditor: TEditor; var DataRow: Variant);
begin
    case TtsBaseGrid_(SenderEditor.grdExample).GridStatus of
        grRowSelect:
            if SenderEditor.grdExample is TtsCustomDBGrid then
            begin
                with TtsCustomDBGrid_(SenderEditor.grdExample as TtsCustomDBGrid) do
                begin
                    if SenderEditor.DataBound then
                    begin
                        DataRow := SelectedRows.Next(DataRow);
                        RemoveRowChangedUpdates;
                    end
                    else
                    begin
                        DataRow := DataRownr[SelectedRows.Next(DisplayRownr[DataRow])];
                        if DataRow <= 0 then
                            DataRow := Unassigned;
                    end;
                end;
            end
            else
                with TtsCustomGrid_(SenderEditor.grdExample as TtsCustomGrid) do
                begin
                    DataRow := DataRownr[SelectedRows.Next(DisplayRownr[DataRow])];
                    if DataRow <= 0 then
                        DataRow := Unassigned;
                end;
        else
            DataRow := Unassigned;
    end;
end;

procedure TfrmInspector.GetFirstSelectedCell(SenderEditor: TEditor; var DataCol: integer; var DataRow: Variant);
begin
    with SenderEditor.grdExample do
    begin
        SenderEditor.UseCellPropList := False;

        if Resetting then
        begin
            if GetCellPropSet.Count <= AlwaysUseCellPropListCount then
                // AlwaysUseCellPropListCount avoides counting the cells with CellSelectedCount below.
                SenderEditor.UseCellPropList := True
            else if GetCellPropSet.Count < SenderEditor.DesignInfo.CellSelectedCount(tsAllGridStatus) then
                SenderEditor.UseCellPropList := True;
        end;

        if SenderEditor.UseCellPropList then
        begin
            if GetCellPropSet.Count <> SenderEditor.CellPropList.Count then
            begin
                SenderEditor.FCellPropList.Free;
                SenderEditor.FCellPropList := GetCellPropSet.List;
            end;

            SenderEditor.CellPropListIndex := 0;
            GetNextCellProp(SenderEditor, DataCol, DataRow);
        end
        else
            SenderEditor.DesignInfo.GetFirstSelectedCell(DataCol, DataRow, tsAllGridStatus);

        if SenderEditor.DataBound then
            RemoveRowChangedUpdates;
    end;
end;

procedure TfrmInspector.GetNextSelectedCell(SenderEditor: TEditor; var DataCol: integer; var DataRow: Variant);
begin
    if SenderEditor.UseCellPropList then
        GetNextCellProp(SenderEditor, DataCol, DataRow)
    else
        SenderEditor.DesignInfo.GetNextSelectedCell(DataCol, DataRow, tsAllGridStatus);

    if SenderEditor.DataBound then
        RemoveRowChangedUpdates;
end;

procedure TfrmInspector.GetNextCellProp(SenderEditor: TEditor; var DataCol: integer; var DataRow: Variant);
begin
    with SenderEditor do
    begin
        repeat
            CellPropListIndex := CellPropListIndex + 1;
            if CellPropListIndex > CellPropList.Count then
            begin
                DataCol := -1;
                DataRow := -1;
                break;
            end;
            DataCol := TtsCellElement(CellPropList.Items[CellPropListIndex]).DataCol;
            DataRow := TtsCellElement(CellPropList.Items[CellPropListIndex]).DataRow;
        until SenderEditor.DesignInfo.CellSelected(DataCol, DataRow, tsAllGridStatus);
    end;
end;

procedure TfrmInspector.grdExampleCellLoaded(Sender: TObject;
  DataCol: Longint; DataRow: Variant; var Value: Variant);
begin
    if MoveComboBack then
    begin
        if SendersEditor(Sender) = ComboEditor then
        begin
            MoveComboBack := False;
        end;
    end;

    if SendersEditor(Sender).DataBound then
        exit;

    if TtsBaseGrid_(SendersEditor(Sender).grdExample).StoreData then
        exit;

    case CellType(SendersEditor(Sender), DataCol, DataRow) of
        ctCheck : Value := DataRow mod 2;
    end;
end;

procedure TfrmInspector.grdExampleExit(Sender: TObject);
begin
    SendersEditor(Sender).ExampleKeyIsDown := False;
    SendersEditor(Sender).ExampleMouseIsDown := False;
    if SendersEditor(Sender).UpdateComponentsOnUp then
    begin
        SendUpdateComponents;
        SendersEditor(Sender).UpdateComponentsOnUp := False;
    end;
end;

procedure TfrmInspector.grdExampleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    SendersEditor(Sender).ExampleKeyIsDown := True;

    if CurEditor.DataBound and (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    begin
        Key := 0;
        MessageDlg('It is not allowed to delete records from within the ComponentEditor', mtWarning, [mbOK], 0)
    end;
end;

procedure TfrmInspector.grdExampleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    SendersEditor(Sender).ExampleKeyIsDown := False;
    if SendersEditor(Sender).UpdateComponentsOnUp then
    begin
        SendUpdateComponents;
        SendersEditor(Sender).UpdateComponentsOnUp := False;
    end;
end;

procedure TfrmInspector.grdExampleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    GridPoint: TPoint;
    ScreenPoint: TPoint;
begin
    if Button = mbRight then
    begin
        GridPoint.X := X;
        GridPoint.Y := Y;
        ScreenPoint := CurEditor.grdExample.ClientToScreen(GridPoint);

        pmnGrid.Popup(ScreenPoint.X, ScreenPoint.Y);
    end
    else
        SendersEditor(Sender).ExampleMouseIsDown := True;
end;

procedure TfrmInspector.grdExampleMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    SendersEditor(Sender).ExampleMouseIsDown := False;
    if SendersEditor(Sender).UpdateComponentsOnUp then
    begin
        SendUpdateComponents;
        SendersEditor(Sender).UpdateComponentsOnUp := False;
    end;
end;

procedure TfrmInspector.grdExampleComboDropDown(Sender: TObject;
  Combo: TtsDBComboGrid; DataCol: Longint; DataRow: Variant);
begin
    SetToComboEditor(DataCol, DataRow);
end;

procedure TfrmInspector.grdExampleComboRollUp(Sender: TObject;
  Combo: TtsDBComboGrid; DataCol: Longint; DataRow: Variant);
begin
    ComboRollUp(DataCol, DataRow);
end;

function TfrmInspector.CellType(Editor: TEditor; DataCol: integer; DataRow: variant): TtsControlType;
begin
    if Editor.DesignInfo.CellControlType[DataCol, DataRow] <> ctDefault then
        result := Editor.DesignInfo.CellControlType[DataCol, DataRow]
    else if (TtsBaseGrid_(Editor.grdExample).DrawOverlap = doDrawColOnTop) and (TtsBaseGrid_(Editor.grdExample).Col[DataCol].ControlType <> ctDefault) then
        result := TtsBaseGrid_(Editor.grdExample).Col[DataCol].ControlType
    else if (TtsBaseGrid_(Editor.grdExample).DrawOverlap <> doDrawColOnTop) and (Editor.DesignInfo.RowControlType[DataRow] <> ctDefault) then
        result := Editor.DesignInfo.RowControlType[DataRow]
    else if (TtsBaseGrid_(Editor.grdExample).Col[DataCol].ControlType <> ctDefault) then
        result := TtsBaseGrid_(Editor.grdExample).Col[DataCol].ControlType
    else if (Editor.DesignInfo.RowControlType[DataRow] <> ctDefault) then
        result := Editor.DesignInfo.RowControlType[DataRow]
    else
        result := ctText;
end;

procedure TfrmInspector.Splitter1Moved(Sender: TObject);
begin
    FormResize(Sender);
end;

procedure TfrmInspector.splInspectorMoved(Sender: TObject);
begin
    pnlInspectorGridAutoWidthMax := pnlInspectorGrid.Width;
    FormResize(Sender);
end;

procedure TfrmInspector.SetDisplayModes;
begin
    DisplayModeNames[0] := 'Alphabetical';
    DisplayModeNames[1] := 'Structured';
end;

procedure TfrmInspector.ceGridGetComponentInfo(Sender: TObject;
  DisplayMode: TtsGroupElement);
begin
    DisplayMode.AddGroup('', 'INVISIBLE PROPERTIES', False);
    ceGrid.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'Top');
    ceGrid.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'Left');

    if DisplayMode.Name = 'Structured' then
    begin
        ceGrid.AddProperty(DisplayMode, '', 'Name');
        ceGrid.AddProperty(DisplayMode, '', 'Cols');
        ceGrid.AddProperty(DisplayMode, '', 'Rows');
        ceGrid.AddProperty(DisplayMode, '', 'GridMode');
        ceGrid.AddProperty(DisplayMode, '', 'DefaultColWidth');
        ceGrid.AddProperty(DisplayMode, '', 'DefaultRowHeight');
        ceGrid.AddProperty(DisplayMode, '', 'Version');

        DisplayMode.AddGroup('', 'Control Type Settings', False);
        DisplayMode.AddGroup('Control Type Settings', 'Button', False);
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Button', 'ButtonEdgeWidth');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Button', 'DefaultButtonHeight');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Button', 'DefaultButtonWidth');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Button', 'FlatButtons');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Button', 'InactiveButtonState');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Button', 'ReadOnlyButton');

        DisplayMode.AddGroup('Control Type Settings', 'Check box', False);
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Check box', 'CheckBoxStyle');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Check box', 'CheckBoxValues');

        DisplayMode.AddGroup('Control Type Settings', 'DateTime', False);
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.DateTime', 'DateTimeDef');

        DisplayMode.AddGroup('Control Type Settings', 'Picture', False);
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'ImageList');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'CenterPicture');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'KeepAspectRatio');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'StretchPicture');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'ShrinkPicture');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'TransparentColor');

        DisplayMode.AddGroup('Control Type Settings', 'Spin buttons', False);
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Spin buttons', 'SpinButtonHeight');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Spin buttons', 'SpinButtonWidth');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Spin buttons', 'SpinRepeatDelay');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Spin buttons', 'SpinStartDelay');

        DisplayMode.AddGroup('Control Type Settings', 'Text box', False);
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'WordWrap');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'MaskDefs');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'HorzAlignment');
        ceGrid.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'VertAlignment');

        DisplayMode.AddGroup('', 'Cursors', False);
        ceGrid.AddProperty(DisplayMode, 'Cursors', 'Cursor');
        ceGrid.AddProperty(DisplayMode, 'Cursors', 'DragCursor');
        ceGrid.AddProperty(DisplayMode, 'Cursors', 'SelectedAreaCursor');

        DisplayMode.AddGroup('', 'Appearance', False);
        ceGrid.AddProperty(DisplayMode, 'Appearance', 'BorderStyle');
        ceGrid.AddProperty(DisplayMode, 'Appearance', 'GridLines');
        ceGrid.AddProperty(DisplayMode, 'Appearance', 'Font');
        ceGrid.AddProperty(DisplayMode, 'Appearance', 'ParentFont');

        DisplayMode.AddGroup('Appearance', '3D', False);
        ceGrid.AddProperty(DisplayMode, 'Appearance.3D', 'Ctl3D');
        ceGrid.AddProperty(DisplayMode, 'Appearance.3D', 'ParentCtl3D');
        ceGrid.AddProperty(DisplayMode, 'Appearance.3D', 'Is3D');
        ceGrid.AddProperty(DisplayMode, 'Appearance.3D', 'Heading3D');

        DisplayMode.AddGroup('Appearance', 'Color', False);
        ceGrid.AddProperty(DisplayMode, 'Appearance.Color', 'Color');
        ceGrid.AddProperty(DisplayMode, 'Appearance.Color', 'ParentColor');
        ceGrid.AddProperty(DisplayMode, 'Appearance.Color', 'EditColor');
        ceGrid.AddProperty(DisplayMode, 'Appearance.Color', 'EditFontColor');
        ceGrid.AddProperty(DisplayMode, 'Appearance.Color', 'FixedLineColor');
        ceGrid.AddProperty(DisplayMode, 'Appearance.Color', 'LineColor');
        ceGrid.AddProperty(DisplayMode, 'Appearance.Color', 'FocusColor');
        ceGrid.AddProperty(DisplayMode, 'Appearance.Color', 'FocusFontColor');

        DisplayMode.AddGroup('', 'Heading', False);
        ceGrid.AddProperty(DisplayMode, 'Heading', 'HeadingHorzAlignment');
        ceGrid.AddProperty(DisplayMode, 'Heading', 'HeadingVertAlignment');
        ceGrid.AddProperty(DisplayMode, 'Heading', 'HeadingButton');
        ceGrid.AddProperty(DisplayMode, 'Heading', 'HeadingColor');
        ceGrid.AddProperty(DisplayMode, 'Heading', 'HeadingFont');
        ceGrid.AddProperty(DisplayMode, 'Heading', 'HeadingParentFont');
        ceGrid.AddProperty(DisplayMode, 'Heading', 'HeadingHeight');
        ceGrid.AddProperty(DisplayMode, 'Heading', 'HeadingOn');
        ceGrid.AddProperty(DisplayMode, 'Heading', 'HeadingWordWrap');

        DisplayMode.AddGroup('', 'RowBar', False);
        ceGrid.AddProperty(DisplayMode, 'RowBar', 'RowBarAlignment');
        ceGrid.AddProperty(DisplayMode, 'RowBar', 'RowBarIndicator');
        ceGrid.AddProperty(DisplayMode, 'RowBar', 'RowChangedIndicator');
        ceGrid.AddProperty(DisplayMode, 'RowBar', 'RowBarOn');
        ceGrid.AddProperty(DisplayMode, 'RowBar', 'RowBarWidth');

        DisplayMode.AddGroup('', 'Options', False);
        ceGrid.AddProperty(DisplayMode, 'Options', 'AlwaysShowEditor');
        ceGrid.AddProperty(DisplayMode, 'Options', 'AlwaysShowFocus');
        ceGrid.AddProperty(DisplayMode, 'Options', 'AutoScale');
        ceGrid.AddProperty(DisplayMode, 'Options', 'DrawOverlap');
        ceGrid.AddProperty(DisplayMode, 'Options', 'SkipReadOnly');
        ceGrid.AddProperty(DisplayMode, 'Options', 'CheckMouseFocus');

        DisplayMode.AddGroup('Options', 'FocusRect', False);
        ceGrid.AddProperty(DisplayMode, 'Options.FocusRect', 'FocusBorder');
        ceGrid.AddProperty(DisplayMode, 'Options.FocusRect', 'FocusColor');
        ceGrid.AddProperty(DisplayMode, 'Options.FocusRect', 'FocusFontColor');

        DisplayMode.AddGroup('Options', 'Fixed', False);
        ceGrid.AddProperty(DisplayMode, 'Options.Fixed', 'FixedLineColor');
        ceGrid.AddProperty(DisplayMode, 'Options.Fixed', 'FixedColCount');
        ceGrid.AddProperty(DisplayMode, 'Options.Fixed', 'FixedRowCount');

        DisplayMode.AddGroup('Options', 'Moving', False);
        ceGrid.AddProperty(DisplayMode, 'Options.Moving', 'ColMoving');
        ceGrid.AddProperty(DisplayMode, 'Options.Moving', 'RowMoving');

        DisplayMode.AddGroup('Options', 'Resizing', False);
        ceGrid.AddProperty(DisplayMode, 'Options.Resizing', 'ResizeCols');
        ceGrid.AddProperty(DisplayMode, 'Options.Resizing', 'ResizeRows');
        ceGrid.AddProperty(DisplayMode, 'Options.Resizing', 'ResizeColsInGrid');
        ceGrid.AddProperty(DisplayMode, 'Options.Resizing', 'ResizeRowsInGrid');

        DisplayMode.AddGroup('Options', 'Selection', False);
        ceGrid.AddProperty(DisplayMode, 'Options.Selection', 'SelectionType');
        ceGrid.AddProperty(DisplayMode, 'Options.Selection', 'SelectionColor');
        ceGrid.AddProperty(DisplayMode, 'Options.Selection', 'SelectionFontColor');
        ceGrid.AddProperty(DisplayMode, 'Options.Selection', 'CellSelectMode');
        ceGrid.AddProperty(DisplayMode, 'Options.Selection', 'ColSelectMode');
        ceGrid.AddProperty(DisplayMode, 'Options.Selection', 'RowSelectMode');
        ceGrid.AddProperty(DisplayMode, 'Options.Selection', 'SelectFixed');

        DisplayMode.AddGroup('Options', 'TabBehaviour', False);
        ceGrid.AddProperty(DisplayMode, 'Options.TabBehaviour', 'TabRowWrap');
        ceGrid.AddProperty(DisplayMode, 'Options.TabBehaviour', 'WantTabs');

        DisplayMode.AddGroup('', 'Scrolling', False);
        ceGrid.AddProperty(DisplayMode, 'Scrolling', 'AlwaysShowScrollBar');
        ceGrid.AddProperty(DisplayMode, 'Scrolling', 'ScrollBars');
        ceGrid.AddProperty(DisplayMode, 'Scrolling', 'ScrollSpeed');
        ceGrid.AddProperty(DisplayMode, 'Scrolling', 'ThumbTracking');

        DisplayMode.AddGroup('', 'Standard', False);
        ceGrid.AddProperty(DisplayMode, 'Standard', 'Align');
        {$IFDEF TSVER_V4}
        ceGrid.AddProperty(DisplayMode, 'Standard', 'Anchors');
        ceGrid.AddProperty(DisplayMode, 'Standard', 'Constraints');
        ceGrid.AddProperty(DisplayMode, 'Standard', 'DragKind');
        {$ENDIF}
        ceGrid.AddProperty(DisplayMode, 'Standard', 'DragMode');
        ceGrid.AddProperty(DisplayMode, 'Standard', 'Enabled');
        ceGrid.AddProperty(DisplayMode, 'Standard', 'HelpContext');
        ceGrid.AddProperty(DisplayMode, 'Standard', 'PopupMenu');
        ceGrid.AddProperty(DisplayMode, 'Standard', 'TabOrder');
        ceGrid.AddProperty(DisplayMode, 'Standard', 'TabStop');
        ceGrid.AddProperty(DisplayMode, 'Standard', 'Tag');
        ceGrid.AddProperty(DisplayMode, 'Standard', 'Visible');

        ceGrid.AddProperty(DisplayMode, 'Standard', 'Height');
        ceGrid.AddProperty(DisplayMode, 'Standard', 'Width');

        DisplayMode.AddGroup('Standard', 'Hint', False);
        ceGrid.AddProperty(DisplayMode, 'Standard.Hint', 'Hint');
        ceGrid.AddProperty(DisplayMode, 'Standard.Hint', 'ParentShowHint');
        ceGrid.AddProperty(DisplayMode, 'Standard.Hint', 'ShowHint');

        if ceGrid.Component is TtsCustomDBGrid then
        begin
            ceGrid.AddProperty(DisplayMode, 'Options', 'AutoInsert');
            ceGrid.AddProperty(DisplayMode, 'Options', 'ConfirmDelete');

            DisplayMode.AddGroup('', 'Data', False);
            ceGrid.AddProperty(DisplayMode, 'Data', 'FieldState');
            ceGrid.AddProperty(DisplayMode, 'Data', 'StoreData');
            ceGrid.AddProperty(DisplayMode, 'Data', 'BookmarkType');
            ceGrid.AddProperty(DisplayMode, 'Data', 'BookmarkCompareType');
            ceGrid.AddProperty(DisplayMode, 'Data', 'DatasetType');
            ceGrid.AddProperty(DisplayMode, 'Data', 'DataSource');
            ceGrid.AddProperty(DisplayMode, 'Data', 'ExactRowCount');
            ceGrid.AddProperty(DisplayMode, 'Data', 'RecordSelection');
            ceGrid.AddProperty(DisplayMode, 'Data', 'UseRecordIds');
        end
        else
            ceGrid.AddProperty(DisplayMode, '', 'StoreData');
    end;
end;

procedure TfrmInspector.ceColumnGetComponentInfo(Sender: TObject;
  DisplayMode: TtsGroupElement);
begin
    if not ceColumn.DesignValuePropertiesInitialized then
    begin
        ceColumn.SetDesignProperty('Visible', pvShowToggle2, 'True');
        ceColumn.SetDesignProperty('ReadOnly', pvShowNever, 'False');
        ceColumn.DesignValuePropertiesInitialized := True;
    end;

    DisplayMode.AddGroup('', 'INVISIBLE PROPERTIES', False);
    ceColumn.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'ComboDatasource');

    if DisplayMode.Name = 'Structured' then
    begin
        ceColumn.AddProperty(DisplayMode, '', 'FieldName');

        ceColumn.AddProperty(DisplayMode, '', 'DisplayCol');
        ceColumn.AddProperty(DisplayMode, '', 'ReadOnly');
        ceColumn.AddProperty(DisplayMode, '', 'Visible');
        ceColumn.AddProperty(DisplayMode, '', 'Width');

        DisplayMode.AddGroup('', 'Control Type Settings', True);
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings', 'ButtonType');
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings', 'ControlType');

        DisplayMode.AddGroup('Control Type Settings', 'Check box', False);
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Check box', 'AllowGrayed');
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Check box', 'CheckBoxValues');

        DisplayMode.AddGroup('Control Type Settings', 'DateTime', False);
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.DateTime', 'DateTimeDef');

        DisplayMode.AddGroup('Control Type Settings', 'Combo', False);
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Combo', 'DropDownStyle');
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Combo', 'ParentCombo');

        DisplayMode.AddGroup('Control Type Settings', 'Spin buttons', False);
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Spin buttons', 'SpinIncrement');
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Spin buttons', 'SpinOptions');

        DisplayMode.AddGroup('Control Type Settings', 'Text box', False);
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'HorzAlignment');
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'VertAlignment');
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'MaxLength');
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'WordWrap');
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'MaskName');

        DisplayMode.AddGroup('Control Type Settings', 'Picture', False);
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'CenterPicture');
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'KeepAspectRatio');
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'StretchPicture');
        ceColumn.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'ShrinkPicture');

        DisplayMode.AddGroup('', 'Appearance', False);
        ceColumn.AddProperty(DisplayMode, 'Appearance', 'Color');
        ceColumn.AddProperty(DisplayMode, 'Appearance', 'Font');
        ceColumn.AddProperty(DisplayMode, 'Appearance', 'ParentFont');
        ceColumn.AddProperty(DisplayMode, 'Appearance', 'Is3D');

        DisplayMode.AddGroup('', 'Heading', False);
        ceColumn.AddProperty(DisplayMode, 'Heading', 'SortPicture');
        ceColumn.AddProperty(DisplayMode, 'Heading', 'Heading');
        ceColumn.AddProperty(DisplayMode, 'Heading', 'HeadingHorzAlignment');
        ceColumn.AddProperty(DisplayMode, 'Heading', 'HeadingVertAlignment');
        ceColumn.AddProperty(DisplayMode, 'Heading', 'HeadingButton');
        ceColumn.AddProperty(DisplayMode, 'Heading', 'HeadingColor');
        ceColumn.AddProperty(DisplayMode, 'Heading', 'HeadingFont');
        ceColumn.AddProperty(DisplayMode, 'Heading', 'HeadingParentFont');
        ceColumn.AddProperty(DisplayMode, 'Heading', 'HeadingWordWrap');
    end;
end;

procedure TfrmInspector.ceGridGetFirstSelectedComponent(Sender: TObject;
  var Component: TPersistent);
begin
    Component := SendersEditor(Sender).grdExample;
end;

procedure TfrmInspector.ceColumnGetFirstSelectedComponent(Sender: TObject;
  var Component: TPersistent);
var
    DisplayCol: integer;

begin
    GetFirstSelectedCol(SendersEditor(Sender), DisplayCol);

    if DisplayCol > 0 then
        Component := GetEditorCol(SendersEditor(Sender), DisplayCol)
    else
        Component := nil;
end;

procedure TfrmInspector.ceRowGetFirstSelectedComponent(Sender: TObject;
  var Component: TPersistent);
var
    DataRow: Variant;

begin
    GetFirstSelectedRow(SendersEditor(Sender), DataRow);

    if ValidDataRow(DataRow, SendersEditor(Sender).DataBound) then
        Component := GetFirstEditorRow(SendersEditor(Sender), DataRow)
    else
        Component := nil;
end;

procedure TfrmInspector.ceCellGetFirstSelectedComponent(Sender: TObject;
  var Component: TPersistent);
var
    DataCol: integer;
    DataRow: Variant;

begin
    GetFirstSelectedCell(SendersEditor(Sender), DataCol, DataRow);

    if (DataCol > 0) and (DataRow > 0) then
        Component := GetFirstEditorCell(SendersEditor(Sender), DataCol, DataRow)
    else
        Component := nil;
end;

procedure TfrmInspector.ceColumnGetNextSelectedComponent(Sender: TObject;
  var Component: TPersistent);
var
    DisplayCol: integer;

begin
    DisplayCol := (Component as TtsCol).DisplayCol;

    GetNextSelectedCol(SendersEditor(Sender), DisplayCol);

    if DisplayCol > 0 then
        Component := GetEditorCol(SendersEditor(Sender), DisplayCol)
    else
        Component := nil;
end;

procedure TfrmInspector.ceRowGetNextSelectedComponent(Sender: TObject;
  var Component: TPersistent);
var
    DataRow: Variant;

begin
    DataRow := (Component as TtsDesignRow).DataRow;
    GetNextSelectedRow(SendersEditor(Sender), DataRow);

    if ValidDataRow(DataRow, SendersEditor(Sender).DataBound) then
        Component := GetNextEditorRow(SendersEditor(Sender), DataRow)
    else
        Component := nil;
end;

procedure TfrmInspector.ceCellGetNextSelectedComponent(Sender: TObject;
  var Component: TPersistent);
var
    DataCol: integer;
    DataRow: Variant;

begin
    if SendersEditor(Sender).DataBound then
    begin
        Component := nil;
        exit;
    end;

    DataCol := (Component as TtsCell).DataCol;
    DataRow := (Component as TtsCell).DataRow;

    GetNextSelectedCell(SendersEditor(Sender), DataCol, DataRow);

    if (DataCol > 0) and (DataRow > 0) then
        Component := GetNextEditorCell(SendersEditor(Sender), DataCol, DataRow)
    else
        Component := nil;
end;

procedure TfrmInspector.butStopClick(Sender: TObject);
begin
    CurEditor.ScanCanceled := True;
    pnlScanning.Visible := False;
end;

procedure TfrmInspector.ScanObjects(ce: TtsComponentEditor; lbl: string;
  State: tsScanObjectsState; Writing: Boolean; Count: Integer;
  var Cancel: Boolean);
begin
    if (State = soStart) then
    begin
        if Writing then
        begin
            SendersEditor(ce).grdExample.Update;
            TtsBaseGrid_(SendersEditor(ce).grdExample).EnablePaint := False;
        end;

        StartScanComponents(lbl, Writing, ce.ComponentCount, Cancel)
    end
    else if (State = soScan) then
        NextScannedComponent(Writing, Count, ce.ComponentCount, Cancel)
    else if (State = soEnd) then
    begin
        if Writing then
        begin
            TtsBaseGrid_(SendersEditor(ce).grdExample).Invalidate;
            TtsBaseGrid_(SendersEditor(ce).grdExample).EnablePaint := True;
        end;

        EndScanComponents;
    end;
end;



procedure TfrmInspector.ceGridGetComponentListChanged(Sender: TObject;
  CurComponenListId: TStringList; var Changed: Variant);
begin
    if CurComponenListId.Count = 1 then
        Changed := False
    else
        Changed := True;
end;

procedure TfrmInspector.ceColumnGetComponentListChanged(Sender: TObject;
  CurComponenListId: TStringList; var Changed: Variant);
var
    DisplayCol: integer;
    NrOfCols: integer;
begin
    GetFirstSelectedCol(SendersEditor(Sender), DisplayCol);
    NrOfCols := 0;

    while DisplayCol > 0 do
    begin
        NrOfCols := NrOfCols + 1;

        if NrOfCols > CurComponenListId.Count then
        begin
            Changed := True;
            exit;
        end;

        if CurComponenListId[NrOfCols - 1] <> IntToStr(TtsBaseGrid_(SendersEditor(Sender).grdExample).DataColnr[DisplayCol]) then
        begin
            Changed := True;
            exit;
        end;

        GetNextSelectedCol(SendersEditor(Sender), DisplayCol);
    end;

    Changed := (NrOfCols <> CurComponenListId.Count);
end;

procedure TfrmInspector.ceRowGetComponentListChanged(Sender: TObject;
  CurComponenListId: TStringList; var Changed: Variant);
var
    DataRow: Variant;
    NrOfRows: integer;
begin
    GetFirstSelectedRow(SendersEditor(Sender), DataRow);
    NrOfRows := 0;

    while ValidDataRow(DataRow, SendersEditor(Sender).DataBound) do
    begin
        NrOfRows := NrOfRows + 1;

        if NrOfRows > CurComponenListId.Count then
        begin
            Changed := True;
            exit;
        end;

        if CurComponenListId[NrOfRows - 1] <> IntToStr(TtsBaseGrid_(SendersEditor(Sender).grdExample).IdDataRow[DataRow]) then
        begin
            Changed := True;
            exit;
        end;

        GetNextSelectedRow(SendersEditor(Sender), DataRow);
    end;

    Changed := (NrOfRows <> CurComponenListId.Count);
end;

procedure TfrmInspector.ceCellGetComponentListChanged(Sender: TObject;
  CurComponenListId: TStringList; var Changed: Variant);
var
    DisplayCol: integer;
    DisplayRow: Variant;
    NrOfCells: integer;

begin
    GetFirstSelectedCell(SendersEditor(Sender), DisplayCol, DisplayRow);
    NrOfCells := 0;

    while (DisplayCol > 0) and (DisplayRow > 0) do
    begin
        NrOfCells := NrOfCells + 1;

        if NrOfCells > CurComponenListId.Count then
        begin
            Changed := True;
            exit;
        end;

        if CurComponenListId[NrOfCells - 1] <> (IntToStr(TtsBaseGrid_(SendersEditor(Sender).grdExample).DataRownr[DisplayRow]) + ',' + IntToStr(TtsBaseGrid_(SendersEditor(Sender).grdExample).DataColnr[DisplayCol])) then
        begin
            Changed := True;
            exit;
        end;

        GetNextSelectedCell(SendersEditor(Sender), DisplayCol, DisplayRow);
    end;

    Changed := (NrOfCells <> CurComponenListId.Count);
end;

procedure TfrmInspector.ceGridGetComponentSelectionChanged(Sender: TObject;
  CurSelection: Pointer; var Changed: Boolean);
begin
    Changed := False;
end;

procedure TfrmInspector.ceGridGetComponentSelection(Sender: TObject;
  var ComponentSelection: Pointer; var ComponentCount: Integer);
begin
    ComponentCount := 1;
    ComponentSelection := nil;
end;

procedure TfrmInspector.GetGridSelection(SenderEditor: TEditor; var ComponentSelection: PtsGridSelection);
var
    CurDisplayCol, CurDisplayRow, CurDataCol, CurDataRow: integer;
    NextDisplayCol, NextDisplayRow, NextDataCol, NextDataRow: integer;

begin
    if ComponentSelection = nil then
    begin
        new(ComponentSelection);
        ComponentSelection.SelectedFrom := TList.Create;
        ComponentSelection.SelectedTo := TList.Create
    end
    else
    begin
        ComponentSelection.SelectedFrom.Clear;
        ComponentSelection.SelectedTo.Clear;
    end;

    with ComponentSelection^ do
    begin
        GridStatus := TtsBaseGrid_(SenderEditor.grdExample).GridStatus;
        case GridStatus of
            grNormal:
            begin
                SelectedFrom.Add(Pointer(TtsBaseGrid_(SenderEditor.grdExample).CurrentDataCol));

                if not SenderEditor.DataBound then
                begin
                    CurDataRow := SenderEditor.DesignInfo.CurrentDataRow;
                    SelectedFrom.Add(Pointer(CurDataRow));
                end;
                SelectedCells := 1;
                SelectedCols := 1;
                SelectedRows := 1;
            end;
            grCellSelect:
            begin
                if not SenderEditor.DataBound then
                begin
                    SelectedFrom.Add(Pointer(TtsBaseGrid_(SenderEditor.grdExample).DataColnr[SenderEditor.DesignInfo.SelectedCells.Left]));
                    CurDataRow := TtsBaseGrid_(SenderEditor.grdExample).DataRownr[SenderEditor.DesignInfo.SelectedCells.Top];
                    SelectedFrom.Add(Pointer(CurDataRow));
                    SelectedTo.Add(Pointer(TtsBaseGrid_(SenderEditor.grdExample).DataColnr[SenderEditor.DesignInfo.SelectedCells.Right]));
                    CurDataRow := TtsBaseGrid_(SenderEditor.grdExample).DataRownr[SenderEditor.DesignInfo.SelectedCells.Bottom];
                    SelectedFrom.Add(Pointer(CurDataRow));
                    with SenderEditor.DesignInfo.SelectedCells do
                        SelectedCells := (Right - Left + 1) * (Bottom - Top + 1);
                end
                else
                    SelectedCells := 0;

                SelectedCols := 0;
                SelectedRows := 0;
            end;
            grColSelect:
            begin
                CurDisplayCol := TtsBaseGrid_(SenderEditor.grdExample).SelectedCols.First;
                CurDataCol := TtsBaseGrid_(SenderEditor.grdExample).DataColnr[CurDisplayCol];

                SelectedFrom.Add(Pointer(CurDataCol));
                SelectedCols := 1;
                NextDisplayCol := TtsBaseGrid_(SenderEditor.grdExample).SelectedCols.Next(CurDisplayCol);
                while NextDisplayCol > 0 do
                begin
                    NextDataCol := TtsBaseGrid_(SenderEditor.grdExample).DataColnr[NextDisplayCol];
                    SelectedCols := SelectedCols + 1;

                    if (NextDisplayCol <> CurDisplayCol + 1) or
                       (NextDataCol <> CurDataCol + 1) then
                    begin
                        SelectedTo.Add(Pointer(CurDataCol));
                        SelectedFrom.Add(Pointer(NextDataCol));
                    end;

                    CurDisplayCol := NextDisplayCol;
                    CurDataCol := NextDataCol;
                    NextDisplayCol := TtsBaseGrid_(SenderEditor.grdExample).SelectedCols.Next(CurDisplayCol);
                end;

                SelectedTo.Add(Pointer(TtsBaseGrid_(SenderEditor.grdExample).DataColnr[TtsBaseGrid_(SenderEditor.grdExample).SelectedCols.Last]));

                SelectedCells := TtsBaseGrid_(SenderEditor.grdExample).Rows * SelectedCols;
                SelectedRows := 0;

            end;
            grRowSelect:
            begin
                if not SenderEditor.DataBound then
                begin
                    CurDisplayRow := SenderEditor.DesignInfo.SelectedRows.First;
                    CurDataRow := TtsBaseGrid_(SenderEditor.grdExample).DataRownr[CurDisplayRow];

                    SelectedFrom.Add(Pointer(CurDataRow));
                    SelectedRows := 1;
                    NextDisplayRow := SenderEditor.DesignInfo.SelectedRows.Next(CurDisplayRow);
                    while NextDisplayRow > 0 do
                    begin
                        NextDataRow := TtsBaseGrid_(SenderEditor.grdExample).DataRownr[NextDisplayRow];
                        SelectedRows := SelectedRows + 1;

                        if (NextDisplayRow <> CurDisplayRow + 1) or
                           (NextDataRow <> CurDataRow + 1) then
                        begin
                            SelectedTo.Add(Pointer(CurDataRow));
                            SelectedFrom.Add(Pointer(NextDataRow));
                        end;

                        CurDisplayRow := NextDisplayRow;
                        CurDataRow := NextDataRow;
                        NextDisplayRow := SenderEditor.DesignInfo.SelectedRows.Next(CurDisplayRow);
                    end;

                    CurDataRow := TtsBaseGrid_(SenderEditor.grdExample).DataRownr[SenderEditor.DesignInfo.SelectedRows.Last];
                    SelectedTo.Add(Pointer(CurDataRow));
                end
                else
                    SelectedRows := 0;

                SelectedCells := TtsBaseGrid_(SenderEditor.grdExample).Cols * SelectedRows;
                SelectedCols := 0;
            end;
        end;
    end;
end;

procedure TfrmInspector.ceCellGetComponentSelection(Sender: TObject;
  var ComponentSelection: Pointer; var ComponentCount: Integer);
begin
    GetGridSelection(SendersEditor(Sender), PtsGridSelection(ComponentSelection));
    ComponentCount := PtsGridSelection(ComponentSelection)^.SelectedCells;
end;


procedure TfrmInspector.ceColumnGetComponentSelection(Sender: TObject;
  var ComponentSelection: Pointer; var ComponentCount: Integer);
begin
    GetGridSelection(SendersEditor(Sender), PtsGridSelection(ComponentSelection));
    ComponentCount := PtsGridSelection(ComponentSelection)^.SelectedCols;
end;

procedure TfrmInspector.ceRowGetComponentSelection(Sender: TObject;
  var ComponentSelection: Pointer; var ComponentCount: Integer);
begin
    GetGridSelection(SendersEditor(Sender), PtsGridSelection(ComponentSelection));
    ComponentCount := PtsGridSelection(ComponentSelection)^.SelectedRows;
end;

var
    CurBookmark: Variant;


procedure TfrmInspector.ceCellScanObjects(Sender: TObject;
  State: tsScanObjectsState; Writing: Boolean; Count: Longint;
  var Cancel: Boolean);
begin
    if SendersEditor(Sender).DataBound then
    begin
        with TtsCustomDBGrid_(SendersEditor(Sender).grdExample as TtsCustomDBGrid) do
            if State = soStart then
            begin
                Datasource.Dataset.DisableControls;
                CurBookMark := Datasource.Dataset.Bookmark;
            end
            else if State = soEnd then
            begin
                Datasource.Dataset.Bookmark := CurBookMark;
                Datasource.Dataset.EnableControls;
            end;

            RemoveRowChangedUpdates;
    end;

    if Resetting then
        ScanObjects(TtsComponentEditor(Sender), 'Resetting Cells:', State, Writing, Count, Cancel)
    else if Writing then
        ScanObjects(TtsComponentEditor(Sender), 'Setting Cells:', State, Writing, Count, Cancel)
    else
        ScanObjects(TtsComponentEditor(Sender), 'Reading Cells:', State, Writing, Count, Cancel);
end;


procedure TfrmInspector.ceRowScanObjects(Sender: TObject;
  State: tsScanObjectsState; Writing: Boolean; Count: Longint;
  var Cancel: Boolean);
begin
    if Writing then
        ScanObjects(TtsComponentEditor(Sender), 'Setting Rows:', State, Writing, Count, Cancel)
    else
        ScanObjects(TtsComponentEditor(Sender), 'Reading Rows:', State, Writing, Count, Cancel);
end;

procedure TfrmInspector.ceColumnScanObjects(Sender: TObject;
  State: tsScanObjectsState; Writing: Boolean; Count: Longint;
  var Cancel: Boolean);
begin
    if Writing then
        ScanObjects(TtsComponentEditor(Sender), 'Setting Cols:', State, Writing, Count, Cancel)
    else
        ScanObjects(TtsComponentEditor(Sender), 'Reading Cols:', State, Writing, Count, Cancel);
end;

procedure TfrmInspector.ceGridGetComponentId(Sender: TObject;
  Component: TPersistent; var ComponentId: String);
begin
    ComponentId := SendersEditor(Sender).grdExample.Name;
end;

procedure TfrmInspector.ceColumnGetComponentId(Sender: TObject;
  Component: TPersistent; var ComponentId: String);
begin
    ComponentId := IntToStr((Component as TtsCol).Id);
end;

procedure TfrmInspector.ceRowGetComponentId(Sender: TObject;
  Component: TPersistent; var ComponentId: String);
begin
    ComponentId := IntToStr((Component as TtsDesignRow).Id);
end;

procedure TfrmInspector.ceCellGetComponentId(Sender: TObject;
  Component: TPersistent; var ComponentId: String);
begin
    ComponentId := IntToStr(TtsBaseGrid_(SendersEditor(Sender).grdExample).Col[(Component as TtsCell).DataCol].Id) + ';' + IntToStr(TtsBaseGrid_(SendersEditor(Sender).grdExample).RowId[(Component as TtsCell).DataRow]);
end;

procedure TfrmInspector.ceGridGetComponentWithId(Sender: TObject;
  ComponentId: String; var Component: TPersistent);
begin
    Component := SendersEditor(Sender).grdExample;
end;

procedure TfrmInspector.ceColumnGetComponentWithId(Sender: TObject;
  ComponentId: String; var Component: TPersistent);
var
    DataCol: integer;
begin
    DataCol := TtsBaseGrid_(SendersEditor(Sender).grdExample).IdDataCol[StrToInt(ComponentId)];

    if DataCol = -1 then
        Component := nil
    else
        Component := TtsBaseGrid_(SendersEditor(Sender).grdExample).Col[DataCol];
end;

procedure TfrmInspector.ceRowGetComponentWithId(Sender: TObject;
  ComponentId: String; var Component: TPersistent);
var
    DataRow: Longint;
begin
    DataRow := TtsBaseGrid_(SendersEditor(Sender).grdExample).IdDataRow[StrToInt(ComponentId)];

    if DataRow = -1 then
        Component := nil
    else
    begin
        if SendersEditor(Sender).IdEditorRow = nil then
        begin
            if SendersEditor(Sender).grdExample is TtsCustomDBGrid then
                SendersEditor(Sender).IdEditorRow := TtsDBRow.Create(SendersEditor(Sender).grdExample, DataRow)
            else
                SendersEditor(Sender).IdEditorRow := TtsDesignRow.Create(SendersEditor(Sender).grdExample, DataRow)
        end
        else
            (SendersEditor(Sender).IdEditorRow as TtsDesignRow).DataRow := DataRow;

        Component := SendersEditor(Sender).IdEditorRow;
    end;
end;

procedure TfrmInspector.ceCellGetComponentWithId(Sender: TObject;
  ComponentId: String; var Component: TPersistent);
var
    DataCol, DataRow: integer;
    SeperatorPos: integer;
begin
    SeperatorPos := AnsiPos(';', ComponentId);
    DataCol := TtsBaseGrid_(SendersEditor(Sender).grdExample).IdDataCol[StrToInt(Copy(ComponentId, 1, SeperatorPos - 1))];
    DataRow := TtsBaseGrid_(SendersEditor(Sender).grdExample).IdDataRow[StrToInt(Copy(ComponentId, SeperatorPos + 1, Length(ComponentId) - SeperatorPos))];

    if (DataCol = -1) or (DataRow = -1) then
        Component := nil
    else
    begin
        if SendersEditor(Sender).IdEditorCell = nil then
        begin
            if SendersEditor(Sender).grdExample is TtsCustomDBGrid then
                SendersEditor(Sender).IdEditorCell := TtsDBCell.Create(SendersEditor(Sender).grdExample, DataCol, DataRow)
            else
                SendersEditor(Sender).IdEditorCell := TtsCell.Create(SendersEditor(Sender).grdExample, DataCol, DataRow)
        end
        else
        begin
            (SendersEditor(Sender).IdEditorCell as TtsCell).DataCol := DataCol;
            (SendersEditor(Sender).IdEditorCell as TtsCell).DataRow := DataRow;
        end;

        Component := SendersEditor(Sender).IdEditorCell;
    end;
end;

procedure TfrmInspector.grdExampleCellEdit(Sender: TObject;
  DataCol: Longint; DataRow: Variant; ByUser: Boolean);
begin
    SetEnablebutLoadPicture;
end;

procedure TfrmInspector.grdExampleStartCellEdit(Sender: TObject;
  DataCol: Longint; DataRow: Variant; var Cancel: Boolean);
begin
    if (SendersEditor(Sender) = ComboEditor) and (ComboEditor <> CurEditor) then
        exit;

    if TtsBaseGrid_(SendersEditor(Sender).grdExample).StoreData then
    begin
        TsDesign.ChangesMade := True;
        exit;
    end;

    if SendersEditor(Sender).DataBound then
        MessageDlg('Editing in the ComponentEditor is only allowed when the grid is not databound and StoreData = ''True''', mtWarning, [mbOK], 0)
    else
        MessageDlg('Editing in the ComponentEditor is only allowed when StoreData = ''True''', mtWarning, [mbOK], 0);

    Cancel := True;
end;

procedure TfrmInspector.butAllClick(Sender: TObject);
begin
    SetGridsDisplayProp;
end;

procedure TfrmInspector.butUnselectedClick(Sender: TObject);
begin
    SetGridsDisplayProp;
end;

procedure TfrmInspector.grdDatafieldsCellLoaded(Sender: TObject; DataCol,
  DataRow: Longint; var Value: Variant);
begin
    Value := CurEditor.FieldNames[DataRow - 1];
end;

procedure TfrmInspector.grdDatafieldsDblClickCell(Sender: TObject; DataCol,
  DataRow: Longint; Pos: TtsClickPosition);
begin
    if DataRow < 1 then
        exit;

    grdColumns.EnablePaint := False;
    grdDatafields.EnablePaint := False;
    try
        InsertField(grdDatafields.Cell[1, DataRow]);
        SetGridsDisplayProp;
    finally
        grdColumns.EnablePaint := True;
        grdDatafields.EnablePaint := True;
    end;
end;

procedure TfrmInspector.butAddSelectedClick(Sender: TObject);
var
    DisplayRow, DataRow: integer;
begin
    if (grdDatafields.CurrentDataRow < 1) and (grdDatafields.SelectedRows.Count <= 0) then
        exit;

    grdColumns.EndEdit(False);
    grdColumns.EnablePaint := False;
    grdDatafields.EnablePaint := False;
    TtsBaseGrid_(CurEditor.grdExample).EnablePaint := False;
    try
        if grdDatafields.SelectedRows.Count <= 0 then
            InsertField(grdDatafields.Cell[1, grdDatafields.CurrentDataRow])
        else
        begin
            DisplayRow := grdDatafields.SelectedRows.First;
            while DisplayRow > 0 do
            begin
                DataRow := grdDatafields.DataRownr[DisplayRow];
                DisplayRow := grdDatafields.SelectedRows.Next(DisplayRow);

                InsertField(grdDatafields.Cell[1, DataRow]);
            end;
        end;
        SetGridsDisplayProp;
        grdColumns.ResetSelection;
        grdDatafields.ResetSelection;
    finally
        grdColumns.EnablePaint := True;
        grdDatafields.EnablePaint := True;
        TtsBaseGrid_(CurEditor.grdExample).EnablePaint := True;
    end;
end;

procedure TfrmInspector.butAddAllClick(Sender: TObject);
var
    i: integer;
begin
    if grdDatafields.VisibleRows = 0 then
        exit;

    grdColumns.EnablePaint := False;
    grdDatafields.EnablePaint := False;
    TtsBaseGrid_(CurEditor.grdExample).EnablePaint := False;
    try
        for i := 1 to grdDatafields.Rows do
        begin
            if grdDatafields.RowVisible[i] then
                InsertField(grdDatafields.Cell[1, i]);
        end;
        SetGridsDisplayProp;
        grdColumns.ResetSelection;
        grdDatafields.ResetSelection;
    finally
        grdColumns.EnablePaint := True;
        grdDatafields.EnablePaint := True;
        TtsBaseGrid_(CurEditor.grdExample).EnablePaint := True;
    end;
end;

procedure TfrmInspector.grdColumnsCellLoaded(Sender: TObject; DataCol,
  DataRow: Longint; var Value: Variant);
begin
    Value := CurEditor.ValColumns.GetValue(DataCol, DataRow);
end;

procedure TfrmInspector.grdColumnsDblClickCell(Sender: TObject; DataCol,
  DataRow: Longint; Pos: TtsClickPosition);
begin
    if (DataRow < 1) then
        exit
    else if CurEditor.ValColumns.GetValue(2,  DataRow) = UnboundValue then
        exit
    else if CurEditor.ValColumns.GetValue(2,  DataRow) = UnboundValueDouble then
        exit;

    TsDesign.ChangesMade := True;
    grdColumns.EnablePaint := False;
    grdDatafields.EnablePaint := False;
    try
        grdColumns.DeleteRows(grdColumns.CurrentDataRow, grdColumns.CurrentDataRow);
        SetGridsDisplayProp;
    finally
        grdColumns.EnablePaint := True;
        grdDatafields.EnablePaint := True;
    end;
end;

procedure TfrmInspector.grdColumnsDeleteRow(Sender: TObject;
  DataRow: Longint; ByUser: Boolean);
begin
    TsDesign.ChangesMade := True;
    CurEditor.ValColumns.DeleteRows(DataRow, DataRow);

    if TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState = fsCustomized then
    begin
        CurEditor.grdExample.DeleteCols(DataRow, DataRow);

        //This code forces deleted cols to be removed from the ActualValueSet
        if CurEditor = GridEditor then
            ceColumn.ShowDesignValue := ceColumn.ShowDesignValue
        else
            ceComboColumn.ShowDesignValue := ceComboColumn.ShowDesignValue;
        //
    end;
end;

procedure TfrmInspector.grdColumnsEndCellEdit(Sender: TObject; DataCol,
  DataRow: Longint; var Cancel: Boolean);
begin
    TsDesign.ChangesMade := True;
    grdColumns.RowChanged[DataRow] := False;

    if (not VarIsEmpty(CurEditor.ValColumns.GetValue(DataCol, DataRow))) and not VarIsEmpty(grdColumns.CurrentCell.Value) then
        if CurEditor.ValColumns.GetValue(DataCol, DataRow) = grdColumns.CurrentCell.Value then
            exit;

    SetFieldName(DataRow, grdColumns.CurrentCell.Value);
    grdColumns.RowChanged[DataRow] := False;
    SetGridsDisplayProp;
end;

procedure TfrmInspector.grdColumnsRowCountChanged(Sender: TObject;
  OldCount, NewCount: Longint);
begin
    if grdColumns.Rows <> 0 then
    begin
        cmbFieldState.ItemIndex := cmbFieldState.Items.IndexOf('fsCustomized');
        TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState := fsCustomized;
    end;

    tabColumnProperties.TabVisible := not (CurEditor.DataBound and (TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState = fsDefault));
    FormResize(Sender);
end;

procedure TfrmInspector.grdColumnsRowMoved(Sender: TObject; ToDisplayRow,
  Count: Longint; ByUser: Boolean);
var
    i: Integer;
begin
    if not ByUser then exit;

    TsDesign.ChangesMade := True;
    for i:= 1 to grdColumns.Rows do
        if TtsBaseGrid_(CurEditor.grdExample).Col[i].DisplayCol <> grdColumns.DisplayRownr[i] then
            TtsBaseGrid_(CurEditor.grdExample).Col[i].DisplayCol := grdColumns.DisplayRownr[i];

    SetGridsDisplayProp;
end;

procedure TfrmInspector.butAddClick(Sender: TObject);
begin
    if TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState = fsDefault then
    begin
        TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState := fsCustomized;
        cmbFieldState.ItemIndex := cmbFieldState.Items.IndexOf('fsCustomized');
        TtsBaseGrid_(CurEditor.grdExample).Cols := 0;
    end;

    grdColumns.Rows := grdColumns.Rows + 1;
    TtsBaseGrid_(CurEditor.grdExample).Cols := TtsBaseGrid_(CurEditor.grdExample).Cols + 1;
    SetFieldName(grdColumns.Rows, '');
    SetGridsDisplayProp;
end;

procedure TfrmInspector.butRemoveClick(Sender: TObject);
begin
    if (grdColumns.CurrentDataRow < 1) and (grdColumns.SelectedRows.Count <= 0) then
        exit;

    grdColumns.EnablePaint := False;
    grdDatafields.EnablePaint := False;
    try
        if grdColumns.SelectedRows.Count <= 0 then
            grdColumns.DeleteRows(grdColumns.CurrentDataRow, grdColumns.CurrentDataRow)
        else
            grdColumns.DeleteSelectedRows;

        SetGridsDisplayProp;

        grdColumns.ResetSelection;
        grdDatafields.ResetSelection;
    finally
        grdColumns.EnablePaint := True;
        grdDatafields.EnablePaint := True;
    end;
end;

procedure TfrmInspector.cmbFieldStateChange(Sender: TObject);
begin
    TsDesign.ChangesMade := True;

    TtsBaseGrid_(CurEditor.grdExample).EnablePaint := False;
    try
        if cmbFieldState.ItemIndex = cmbFieldState.Items.IndexOf('fsDefault') then
        begin
            if TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState <> fsDefault then
            begin
                TtsBaseGrid_(CurEditor.grdExample).Cols := 0;
                TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState := fsDefault;
            end;
        end
        else
        begin
            TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState := fsCustomized;
            TtsBaseGrid_(CurEditor.grdExample).Cols := 0;
        end;

        tabColumnProperties.TabVisible := not (CurEditor.DataBound and (TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState = fsDefault));
        FormResize(Sender);

        if cmbFieldState.ItemIndex = cmbFieldState.Items.IndexOf('fsDefault') then
            grdColumns.DeleteRows(1, grdColumns.Rows);

        SetGridsDisplayProp;
    finally
        TtsBaseGrid_(CurEditor.grdExample).EnablePaint := True;
    end;
end;

procedure TfrmInspector.grdExampleRowMoved(Sender: TObject; ToDisplayRow,
  Count: Longint; ByUser: Boolean);
begin
    if (SendersEditor(Sender) = ComboEditor) and (ComboEditor <> CurEditor) then
        exit;

    TsDesign.ChangesMade := True;
end;

procedure TfrmInspector.grdExampleColMoved(Sender: TObject; ToDisplayCol,
  Count: Longint; ByUser: Boolean);
var
    OldChangesMade: Boolean;
begin
    if not ByUser then exit;
    if not SendersEditor(Sender).DataBound then exit;

    if (SendersEditor(Sender) = ComboEditor) and (ComboEditor <> CurEditor) then
        exit;

    OldChangesMade := TsDesign.ChangesMade;
    TsDesign.ChangesMade := True;

    with TtsCustomDBGrid_(SendersEditor(Sender).grdExample as TtsCustomDBGrid) do
    begin
        EnablePaint := False;

        try
            if FieldState = fsDefault then
            begin
                if MessageDlg(
                        'This operation requires that the grid''s FieldState property is ' +
                        'fsCustomized. Currently the FieldState is fsDefault.' +
                        chr(10) + chr(10) +
                        'Do you want the FieldSate property to be changed to fsCustomized?',
                        mtWarning, [mbOK, mbCancel], 0) = mrOk
                then
                    FieldState := fsCustomized
                else
                begin
                    TsDesign.ChangesMade := OldChangesMade;

                    FieldState := fsCustomized;
                    Cols := 0;
                    FieldState := fsDefault;
                end;
            end;

            SetGridsDisplayProp;
        finally
            EnablePaint := True;
        end;
    end;
end;

procedure TfrmInspector.grdColumnsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then
        grdColumns.EndEdit(False);
end;

procedure TfrmInspector.grdExampleColResized(Sender: TObject;
  RowColnr: Longint);
var
    OldChangesMade: Boolean;
begin
    if (SendersEditor(Sender) = ComboEditor) and (ComboEditor <> CurEditor) then
        exit;

    OldChangesMade := TsDesign.ChangesMade;
    TsDesign.ChangesMade := True;

    if not SendersEditor(Sender).DataBound then
    begin
        grdInspector.UpdateComponents;
        exit;
    end;

    with TtsCustomDBGrid_(SendersEditor(Sender).grdExample as TtsCustomDBGrid) do
    begin
        if (MouseStatus <> msColResize) or SendersEditor(Sender).InColResize then
            exit;

        SendersEditor(Sender).InColResize := true;

        EnablePaint := False;
        try
            if FieldState = fsDefault then
            begin
                if MessageDlg(
                        'This operation requires that the grid''s FieldState property is ' +
                        'fsCustomized. Currently the FieldState is fsDefault.' +
                        chr(10) + chr(10) +
                        'Do you want the FieldSate property to be changed to fsCustomized?',
                        mtWarning, [mbOK, mbCancel], 0) = mrOk
                then
                    FieldState := fsCustomized
                else
                begin
                    TsDesign.ChangesMade := OldChangesMade;

                    ResetColProperties(TsAllProperties);
                    FieldState := fsDefault;
                end;
            end;

            SetGridsDisplayProp;
        finally
            EnablePaint := True;
            SendersEditor(Sender).InColResize := false;
        end;
    end;
end;

procedure TfrmInspector.pnlCustomizeColumnsResize(Sender: TObject);
var
    CurTopDif: Integer;
begin
    grdColumns.Height := CalcMax(0, InitHeightgrdColumns + pnlCustomizeColumns.Height - InitHeightpnlCustomizeColumns);
    grdDatafields.Height := grdColumns.Height;

    butAdd.Top := grdColumns.Top + grdColumns.Height + 7;
    butRemove.Top := butAdd.Top;

    CurTopDif := butAddAll.Top - butAddSelected.Top;
    butAddSelected.Top := grdColumns.Top + CalcMax(0, grdColumns.Height - (butAddAll.Top + butAddAll.Height - butAddSelected.Top)) div 2;
    butAddAll.Top := butAddSelected.Top + CurTopDif;
end;

procedure TfrmInspector.grdExampleInsertRow_Unbound(Sender: TObject; DataRow: Longint;
  ByUser: Boolean);
begin
    grdExampleInsertRow(Sender, DataRow, ByUser);
end;

procedure TfrmInspector.grdExampleRowChanged_Unbound(Sender: TObject; OldRow,
  NewRow: Longint);
begin
    grdExampleRowChanged(Sender, OldRow, NewRow);
end;

procedure TfrmInspector.grdExampleCellLoaded_Unbound(Sender: TObject; DataCol: Longint;
  DataRow: Longint; var Value: Variant);
begin
    grdExampleCellLoaded(Sender, DataCol, DataRow, Value);
end;

procedure TfrmInspector.grdExampleStartCellEdit_Unbound(Sender: TObject; DataCol: Longint;
  DataRow: Longint; var Cancel: Boolean);
begin
    grdExampleStartCellEdit(Sender, DataCol, DataRow, Cancel);
end;

procedure TfrmInspector.grdExampleCellEdit_Unbound(Sender: TObject; DataCol,
  DataRow: Longint; ByUser: Boolean);
begin
    grdExampleCellEdit(Sender, DataCol, DataRow, ByUser);
end;

procedure TfrmInspector.grdExampleComboDropDown_Unbound(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Longint);
begin
    SetToComboEditor(DataCol, DataRow);
end;

procedure TfrmInspector.grdExampleComboRollUp_Unbound(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Longint);
begin
    ComboRollUp(DataCol, DataRow);
end;

procedure TfrmInspector.SetToGridEditor;
var
    AllowChange: Boolean;

begin
    pnlInspectorWTabs.Update;

    tabInspectorChanging(Self, AllowChange);
    if not AllowChange then exit;

    TtsBaseGrid_(GridEditor.grdExample).Color := CurGridColor;
    GridEditor.grdExample.Update;

    tabGridProperties.Caption := 'Grid Properties';
    tabColumnProperties.Caption := 'Column Properties';
    tabRowProperties.Caption := 'Row Properties';
    tabCellProperties.Caption := 'Cell Properties';
    tabCustomizeColumns.Caption := 'Customize Columns';

    CurEditor.CurrentTab := tabInspector.ActivePage.PageIndex;
    CurEditor := GridEditor;
    SetEnableDesignBehaviour;
    SetEnableInvisible;
    SetEnablebutLoadPicture;

    GridEditor.GetFieldNames;
    GridEditor.SetRightTabsVisible;
    tabInspector.ActivePage := tabInspector.Pages[GridEditor.CurrentTab];
    tabInspectorChange(Self);

    chkInvisibleRowsCols.Caption := 'Show Invisible Cols/Rows Grid';
    chkInvisibleRowsCols.Checked := suoShowInvisibleGrid in UserShowOptions;

    with GridEditor.TabInfo[tabInspector.ActivePage.PageIndex] do
    begin
        grdInspector.EnablePaint := False;
        try
            if ComponentEditor = nil then
                grdInspector.ComponentEditor := ceGrid
            else
            begin
                grdInspector.ComponentEditor := ComponentEditor;

                if (DisplayModeName = grdInspector.DisplayModeName) and (grdInspector.Rows > 0) then
                begin
                    grdInspector.TopRow := TopRow;
                    grdInspector.CurrentDataRow := CurRow;
                    grdInspector.PutCellInView(2, grdInspector.CurrentDataRow);
                end;
            end;
        finally
            grdInspector.EnablePaint := True;
        end;
    end;
end;

procedure TfrmInspector.SetToComboEditor(DataCol: LongInt; DataRow: Variant);
var
    Msg: TMsg;
    ComboAlreadyDisplayed: Boolean;
    AllowChange: Boolean;
begin
    ComboAlreadyDisplayed := PeekMessage(Msg, Handle, WM_SETTOGRIDEDITOR, WM_SETTOGRIDEDITOR, PM_Remove);

    tabInspectorChanging(Self, AllowChange);
    if not AllowChange then exit;

    ShowMoreButtonsWarning(DataCol, DataRow);

    if ComboEditor = nil then
    begin
        if GridEditor.grdExample is TtsCustomGrid then
            ComboEditor := TEditor.Create(TtsBaseGridClass(TtsCustomGrid_(GridEditor.grdExample as TtsCustomGrid).Combo.Grid.ClassType), True)
        else
            ComboEditor := TEditor.Create(TtsBaseGridClass(TtsCustomDBGrid_(GridEditor.grdExample as TtsCustomDBGrid).Combo.Grid.ClassType), True);

        TtsBaseGrid_(ComboEditor.grdExample).FAsCombo := True;
    end;

    GridEditor.CurrentTab := tabInspector.ActivePage.PageIndex;
    CurEditor := ComboEditor;
    (ComboEditor.grdExample).ResetProperties([prSelected]);
    SetActualValuesCombo;
    SetEnableDesignBehaviour;
    SetEnableInvisible;
    SetEnablebutLoadPicture;

    tabGridProperties.Caption := 'Combo Properties';
    tabColumnProperties.Caption := 'Combo Columns';
    tabRowProperties.Caption := 'Combo Rows';
    tabCellProperties.Caption := 'Combo Cells';
    tabCustomizeColumns.Caption := 'Customize Combo Columns';

    ComboEditor.GetFieldNames;
    ComboEditor.SetRightTabsVisible;
    tabInspector.ActivePage := tabGridProperties;

    tabInspectorChange(Self);
    MoveComboBack := True;

    if TtsBaseGrid_(ComboEditor.grdExample).Cols > 0 then
    begin
        TtsBaseGrid_(ComboEditor.grdExample).CurrentDataCol := 1;
        TtsBaseGrid_(ComboEditor.grdExample).LeftCol := 1;
    end;

    if not ComboEditor.DataBound then
    begin
        if TtsBaseGrid_(ComboEditor.grdExample).Rows > 0 then
        begin
            TtsBaseGrid_(ComboEditor.grdExample).CurrentDataRow := 1;
            TtsBaseGrid_(ComboEditor.grdExample).TopRow := 1;
        end;
    end;

    ChangesMade := TsDesign.ChangesMade;
    TsDesign.ChangesMade := False;

    if not ComboAlreadyDisplayed then
    begin
        chkInvisibleRowsCols.Caption := 'Show Invisible Cols/Rows Combo';
        chkInvisibleRowsCols.Checked := suoShowInvisibleCombo in UserShowOptions;

        CurGridColor := TtsBaseGrid_(GridEditor.grdExample).Color;
        TtsBaseGrid_(GridEditor.grdExample).Color := cl3DLight;
    end
    else if (GridEditor.grdExample.ActiveCombo(TtsBaseGrid_(GridEditor.grdExample).CurrentDataCol, GridEditor.DesignInfo.CurrentDataRow) = nil) then
        TtsGrid(GridEditor.grdExample).Combo.Grid.Color := CurGridColor;

    with ComboEditor.TabInfo[tabInspector.ActivePage.PageIndex] do
    begin
        grdInspector.EnablePaint := False;
        try
            if ComponentEditor = nil then
                grdInspector.ComponentEditor := ceComboGrid
            else
            begin
                grdInspector.ComponentEditor := ComponentEditor;

                if (DisplayModeName = grdInspector.DisplayModeName) and (grdInspector.Rows > 0) then
                begin
                    grdInspector.TopRow := TopRow;
                    grdInspector.CurrentDataRow := CurRow;
                    grdInspector.PutCellInView(2, grdInspector.CurrentDataRow);
                end;
            end;
        finally
            grdInspector.EnablePaint := True;
        end;
    end;
end;

procedure TfrmInspector.InitgrdHeading;
begin
    grdHeading.Col[2].Width := Screen.Width;
    grdHeading.Col[2].ReadOnly := true;

    grdHeading.ButtonEdgeWidth := 3;
    grdHeading.InactiveButtonState := ibsBackGround;
    grdHeading.FlatButtons := false;

    grdHeading.Col[1].Align:= true;
    grdHeading.Col[1].Alignment := taCenter; //taRightJustify;
    grdHeading.Col[1].ButtonType := btCombo;
    grdHeading.Col[1].DropDownStyle := ddDropDownList;

    grdHeading.CurrentCell.MoveTo(3, 1);
end;

procedure TfrmInspector.grdHeadingComboInit(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Longint);
begin
    Combo.DefaultRowHeight := grdHeading.DefaultRowHeight;
    Combo.DropDownRows := 5;
    Combo.ValueCol := 1;

    Combo.AutoSearch := asTop;

    Combo.Grid.HeadingOn := False;
    Combo.Grid.RowBarOn := False;
    Combo.DropDownCols := 1;
    Combo.Grid.Cols := 1;
    Combo.Grid.Rows := 2;
end;

procedure TfrmInspector.grdHeadingComboCellLoaded(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Longint; var Value: Variant);
begin
    if DataRow = 1 then
        Value := 'Alphabetical'
    else
        Value := 'Structured';
end;

procedure TfrmInspector.grdHeadingComboRollUp(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Longint);
begin
    Screen.Cursor := crHourGlass;
    try
        grdInspector.DisplayModeName := grdHeading.CurrentCell.Value;
        grdInspectorAllRowsSelected := False;
        grdHeading.CurrentCell.MoveTo(3, 1);
        grdInspector.SetFocus;
    finally
        Screen.Cursor := crDefault;
    end;
end;

procedure TfrmInspector.grdHeadingCellLoaded(Sender: TObject; DataCol,
  DataRow: Longint; var Value: Variant);
begin
    if DataCol = 1 then
        Value := grdInspector.DisplayModeName;
end;

procedure TfrmInspector.mnuInsColumnsClick(Sender: TObject);
begin
    AddNewColumn(True);
end;

procedure TfrmInspector.mnuAddColumnClick(Sender: TObject);
begin
    AddNewColumn(False);
end;

procedure TfrmInspector.AddNewColumn(Inserting: Boolean);
var
    i: integer;
    NewDisplayCol: integer;
    NewColCount: integer;
    GridStatus: TtsGridStatus;
begin
    TtsBaseGrid_(CurEditor.grdExample).EnablePaint := False;
    try
        if CurEditor.DataBound then
        begin
            with TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid) do
            begin
                if FieldState = fsDefault then
                begin
                    if MessageDlg(
                            'This operation requires that the grid''s FieldState property is ' +
                            'fsCustomized. Currently the FieldState is fsDefault.' +
                            chr(10) + chr(10) +
                            'Do you want the FieldSate property to be changed to fsCustomized?',
                            mtWarning, [mbOK, mbCancel], 0) = mrOk
                    then
                        FieldState := fsCustomized
                    else
                    begin
                        grdInspector.UpdateComponents;
                        exit;
                    end;
                end;
            end;
        end;

        GridStatus := TtsBaseGrid_(CurEditor.grdExample).GridStatus;
        if Inserting then
        begin
            case TtsBaseGrid_(CurEditor.grdExample).GridStatus of
                grNormal:
                begin
                    if TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol <= 0 then
                        NewDisplayCol := 1
                    else
                        NewDisplayCol := TtsBaseGrid_(CurEditor.grdExample).DisplayColnr[TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol];
                    NewColCount := 1;
                end;
                grColSelect:
                begin
                    NewDisplayCol := TtsBaseGrid_(CurEditor.grdExample).SelectedCols.First;
                    NewColCount := TtsBaseGrid_(CurEditor.grdExample).SelectedCols.Count;
                end;
                grCellSelect:
                begin
                    with CurEditor.DesignInfo.SelectedCells do
                    begin
                        NewDisplayCol := Left;
                        NewColCount := Right - Left + 1;
                    end;
                end;
                else
                    exit;
            end;

            if GridStatus = grColSelect then
                CurEditor.grdExample.ResetColProperties([prSelected]);
        end
        else
        begin
            NewDisplayCol := TtsBaseGrid_(CurEditor.grdExample).Cols + 1;
            NewColCount := 1;
        end;

        for i:= 0 to NewColCount -1 do
        begin
            TtsBaseGrid_(CurEditor.grdExample).Cols := TtsBaseGrid_(CurEditor.grdExample).Cols + 1;
            TtsBaseGrid_(CurEditor.grdExample).Col[TtsBaseGrid_(CurEditor.grdExample).Cols].DisplayCol := NewDisplayCol + i;

            if Inserting and (GridStatus = grColSelect) then
                TtsBaseGrid_(CurEditor.grdExample).Col[TtsBaseGrid_(CurEditor.grdExample).Cols].Selected := True;
        end;

        TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol := TtsBaseGrid_(CurEditor.grdExample).Cols;
        TtsBaseGrid_(CurEditor.grdExample).CurrentCell.PutInView;

        if CurEditor.DataBound then
        begin
            SetGridsDisplayProp;

            grdColumns.CurrentDataRow := grdColumns.DataRownr[NewDisplayCol];
            grdColumns.CurrentCell.PutInView;
        end
        else
            grdInspector.UpdateComponents;
    finally
        TtsBaseGrid_(CurEditor.grdExample).EnablePaint := True;
    end;
    SendUpdateComponents;
end;

procedure TfrmInspector.mnuDelColumnsClick(Sender: TObject);
begin
    if CurEditor.DataBound then
    begin
        with TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid) do
        begin
            if FieldState = fsDefault then
            begin
                if MessageDlg(
                        'This operation requires that the grid''s FieldState property is ' +
                        'fsCustomized. Currently the FieldState is fsDefault.' +
                        chr(10) + chr(10) +
                        'Do you want the FieldSate property to be changed to fsCustomized?',
                        mtWarning, [mbOK, mbCancel], 0) = mrOk
                then
                    FieldState := fsCustomized
                else
                    exit;
            end;
        end;
    end;

    if (TtsBaseGrid_(CurEditor.grdExample).GridStatus = grNormal) and (TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol > 0) then
        CurEditor.grdExample.DeleteCols(TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol, TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol)
    else if TtsBaseGrid_(CurEditor.grdExample).SelectedCols.Count > 0 then
        CurEditor.grdExample.DeleteSelectedCols;

    //This code forces deleted cols to be removed from the ActualValueSet
    if CurEditor = GridEditor then
        ceColumn.ShowDesignValue := ceColumn.ShowDesignValue
    else
        ceComboColumn.ShowDesignValue := ceComboColumn.ShowDesignValue;
    //

    if CurEditor.DataBound then
        SetGridsDisplayProp
    else
        grdInspector.UpdateComponents;

    SendUpdateComponents;
end;

procedure TfrmInspector.grdInspectorColResized(Sender: TObject;
  RowColnr: Longint);
begin
    if RowColnr = 1 then
        grdInspectorFirstColShare := grdInspector.Col[1].Width / grdInspector.Width;

    if RowColnr >= 0 then
    begin
        grdHeading.RowBarWidth := grdInspector.RowBarWidth;
        grdHeading.Col[1].Width := grdInspector.Col[1].Width;
    end;
end;

procedure TfrmInspector.grdHeadingColResized(Sender: TObject;
  RowColnr: Longint);
begin
    if not Assigned(grdInspector) then
        Exit;

    if RowColnr >= 0 then
    begin
        grdHeading.EnablePaint := False;
        try
            grdInspector.RowBarWidth := grdHeading.RowBarWidth;
            grdInspector.Col[1].Width := grdHeading.Col[1].Width;
            grdInspector.Update;
        finally
            grdHeading.EnablePaint := True;
        end;
    end;
end;

function  TfrmInspector.SendersEditor(Sender: TObject): TEditor;
begin
    if Sender is TtsBaseGrid then
    begin
        if TtsBaseGrid_(Sender as TtsBaseGrid).FAsCombo then
            result := ComboEditor
        else
            result := GridEditor;
    end
    else //if Sender is TtsComponentEditor then
    begin
        if StrPos(PChar((Sender as TtsComponentEditor).Name), 'Combo') <> nil then
            result := ComboEditor
        else
            result := GridEditor;
    end;
end;

procedure TfrmInspector.ceComboGridGetComponentInfo(Sender: TObject;
  DisplayMode: TtsGroupElement);
begin
    DisplayMode.AddGroup('', 'INVISIBLE PROPERTIES', False);
    ceComboGrid.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'Name');
    ceComboGrid.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'TabStop');
    ceComboGrid.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'Top');
    ceComboGrid.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'Height');
    ceComboGrid.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'Left');
    ceComboGrid.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'Width');

    if DisplayMode.Name = 'Structured' then
    begin
        ceComboGrid.AddProperty(DisplayMode, '', 'Cols');
        ceComboGrid.AddProperty(DisplayMode, '', 'Rows');
        ceComboGrid.AddProperty(DisplayMode, '', 'DropDownCols');
        ceComboGrid.AddProperty(DisplayMode, '', 'DropDownRows');
        ceComboGrid.AddProperty(DisplayMode, '', 'DropDownStyle');
        ceComboGrid.AddProperty(DisplayMode, '', 'ValueCol');
        ceComboGrid.AddProperty(DisplayMode, '', 'DefaultColWidth');
        ceComboGrid.AddProperty(DisplayMode, '', 'DefaultRowHeight');
        ceComboGrid.AddProperty(DisplayMode, '', 'Version');

        DisplayMode.AddGroup('', ' Search properties', True);
        ceComboGrid.AddProperty(DisplayMode, ' Search properties', 'AutoFill');
        ceComboGrid.AddProperty(DisplayMode, ' Search properties', 'AutoFillConvertCase');
        ceComboGrid.AddProperty(DisplayMode, ' Search properties', 'AutoSearch');
        ceComboGrid.AddProperty(DisplayMode, ' Search properties', 'CompareType');
        ceComboGrid.AddProperty(DisplayMode, ' Search properties', 'ValueColSorted');

        DisplayMode.AddGroup('', 'Control Type Settings', False);
        DisplayMode.AddGroup('Control Type Settings', 'Check box', False);
        ceComboGrid.AddProperty(DisplayMode, 'Control Type Settings.Check box', 'CheckBoxStyle');
        ceComboGrid.AddProperty(DisplayMode, 'Control Type Settings.Check box', 'CheckBoxValues');

        DisplayMode.AddGroup('Control Type Settings', 'Picture', False);
        ceComboGrid.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'CenterPicture');
        ceComboGrid.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'KeepAspectRatio');
        ceComboGrid.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'StretchPicture');
        ceComboGrid.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'ShrinkPicture');
        ceComboGrid.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'TransparentColor');

        DisplayMode.AddGroup('Control Type Settings', 'Text box', False);
        ceComboGrid.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'HorzAlignment');
        ceComboGrid.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'VertAlignment');
        ceComboGrid.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'WordWrap');

        DisplayMode.AddGroup('', 'Cursors', False);
        ceComboGrid.AddProperty(DisplayMode, 'Cursors', 'Cursor');

        DisplayMode.AddGroup('', 'Appearance', False);
        ceComboGrid.AddProperty(DisplayMode, 'Appearance', 'BorderStyle');
        ceComboGrid.AddProperty(DisplayMode, 'Appearance', 'GridLines');
        ceComboGrid.AddProperty(DisplayMode, 'Appearance', 'Font');
        ceComboGrid.AddProperty(DisplayMode, 'Appearance', 'ParentFont');

        DisplayMode.AddGroup('Appearance', '3D', False);
        ceComboGrid.AddProperty(DisplayMode, 'Appearance.3D', 'Ctl3D');
        ceComboGrid.AddProperty(DisplayMode, 'Appearance.3D', 'ParentCtl3D');
        ceComboGrid.AddProperty(DisplayMode, 'Appearance.3D', 'Is3D');
        ceComboGrid.AddProperty(DisplayMode, 'Appearance.3D', 'Heading3D');

        DisplayMode.AddGroup('Appearance', 'Color', False);
        ceComboGrid.AddProperty(DisplayMode, 'Appearance.Color', 'Color');
        ceComboGrid.AddProperty(DisplayMode, 'Appearance.Color', 'ParentColor');
        ceComboGrid.AddProperty(DisplayMode, 'Appearance.Color', 'FixedLineColor');
        ceComboGrid.AddProperty(DisplayMode, 'Appearance.Color', 'LineColor');

        DisplayMode.AddGroup('', 'Heading', False);
        ceComboGrid.AddProperty(DisplayMode, 'Heading', 'HeadingHorzAlignment');
        ceComboGrid.AddProperty(DisplayMode, 'Heading', 'HeadingVertAlignment');
        ceComboGrid.AddProperty(DisplayMode, 'Heading', 'HeadingColor');
        ceComboGrid.AddProperty(DisplayMode, 'Heading', 'HeadingFont');
        ceComboGrid.AddProperty(DisplayMode, 'Heading', 'HeadingParentFont');
        ceComboGrid.AddProperty(DisplayMode, 'Heading', 'HeadingHeight');
        ceComboGrid.AddProperty(DisplayMode, 'Heading', 'HeadingOn');
        ceComboGrid.AddProperty(DisplayMode, 'Heading', 'HeadingWordWrap');

        DisplayMode.AddGroup('', 'RowBar', False);
        ceComboGrid.AddProperty(DisplayMode, 'RowBar', 'RowBarAlignment');
        ceComboGrid.AddProperty(DisplayMode, 'RowBar', 'RowBarIndicator');
        ceComboGrid.AddProperty(DisplayMode, 'RowBar', 'RowBarOn');
        ceComboGrid.AddProperty(DisplayMode, 'RowBar', 'RowBarWidth');

        DisplayMode.AddGroup('', 'Options', False);
        ceComboGrid.AddProperty(DisplayMode, 'Options', 'DrawOverlap');

        DisplayMode.AddGroup('Options', 'Fixed', False);
        ceComboGrid.AddProperty(DisplayMode, 'Options.Fixed', 'FixedLineColor');
        ceComboGrid.AddProperty(DisplayMode, 'Options.Fixed', 'FixedColCount');
        ceComboGrid.AddProperty(DisplayMode, 'Options.Fixed', 'FixedRowCount');

        DisplayMode.AddGroup('Options', 'Resizing', False);
        ceComboGrid.AddProperty(DisplayMode, 'Options.Resizing', 'ResizeCols');
        ceComboGrid.AddProperty(DisplayMode, 'Options.Resizing', 'ResizeRows');
        ceComboGrid.AddProperty(DisplayMode, 'Options.Resizing', 'ResizeColsInGrid');
        ceComboGrid.AddProperty(DisplayMode, 'Options.Resizing', 'ResizeRowsInGrid');

        DisplayMode.AddGroup('Options', 'Selection', False);
        ceComboGrid.AddProperty(DisplayMode, 'Options.Selection', 'SelectionType');
        ceComboGrid.AddProperty(DisplayMode, 'Options.Selection', 'SelectionColor');
        ceComboGrid.AddProperty(DisplayMode, 'Options.Selection', 'SelectionFontColor');

        DisplayMode.AddGroup('', 'Scrolling', False);
        ceComboGrid.AddProperty(DisplayMode, 'Scrolling', 'AlwaysShowScrollBar');
        ceComboGrid.AddProperty(DisplayMode, 'Scrolling', 'ScrollBars');
        ceComboGrid.AddProperty(DisplayMode, 'Scrolling', 'ScrollSpeed');
        ceComboGrid.AddProperty(DisplayMode, 'Scrolling', 'ThumbTracking');

        DisplayMode.AddGroup('', 'Standard', False);
        ceComboGrid.AddProperty(DisplayMode, 'Standard', 'HelpContext');
        ceComboGrid.AddProperty(DisplayMode, 'Standard', 'Tag');
        ceComboGrid.AddProperty(DisplayMode, 'Standard', 'Height');
        ceComboGrid.AddProperty(DisplayMode, 'Standard', 'Width');

        DisplayMode.AddGroup('Standard', 'Hint', False);
        ceComboGrid.AddProperty(DisplayMode, 'Standard.Hint', 'Hint');
        ceComboGrid.AddProperty(DisplayMode, 'Standard.Hint', 'ParentShowHint');
        ceComboGrid.AddProperty(DisplayMode, 'Standard.Hint', 'ShowHint');

        if ceComboGrid.Component is TtsCustomDBGrid then
        begin
            ceComboGrid.AddProperty(DisplayMode, '', 'AutoLookup');

            DisplayMode.AddGroup('', 'Data', False);
            ceComboGrid.AddProperty(DisplayMode, 'Data', 'FieldState');
            ceComboGrid.AddProperty(DisplayMode, 'Data', 'StoreData');
            ceComboGrid.AddProperty(DisplayMode, 'Data', 'BookmarkType');
            ceComboGrid.AddProperty(DisplayMode, 'Data', 'BookmarkCompareType');
            ceComboGrid.AddProperty(DisplayMode, 'Data', 'DatasetType');
            ceComboGrid.AddProperty(DisplayMode, 'Data', 'DataSource');
            ceComboGrid.AddProperty(DisplayMode, 'Data', 'ExactRowCount');
            ceComboGrid.AddProperty(DisplayMode, 'Data', 'RecordSelection');
            ceComboGrid.AddProperty(DisplayMode, 'Data', 'UseRecordIds');
        end
        else
            ceComboGrid.AddProperty(DisplayMode, '', 'StoreData');
    end;
end;

procedure TfrmInspector.RemoveRowChangedUpdates;
var
    Msg: TMsg;
begin
    repeat
        Msg.hwnd := 0;
        PeekMessage(Msg, Handle, WM_ROWCHANGED, WM_ROWCHANGED, PM_Remove);
    until Msg.hwnd = 0;
end;

procedure TfrmInspector.ceRowGetComponentInfo(Sender: TObject;
  DisplayMode: TtsGroupElement);
begin
    if not ceRow.DesignValuePropertiesInitialized then
    begin
        ceRow.SetDesignProperty('Visible', pvShowToggle2, 'True');
        ceRow.SetDesignProperty('ReadOnly', pvShowNever, 'False');
        ceRow.DesignValuePropertiesInitialized := True;
    end;

    if DisplayMode.Name = 'Structured' then
    begin
        ceRow.AddProperty(DisplayMode, '', 'DisplayRow');
        ceRow.AddProperty(DisplayMode, '', 'ReadOnly');
        ceRow.AddProperty(DisplayMode, '', 'Visible');
        ceRow.AddProperty(DisplayMode, '', 'Height');

        DisplayMode.AddGroup('', 'Control Type Settings', True);
        ceRow.AddProperty(DisplayMode, 'Control Type Settings', 'ButtonType');
        ceRow.AddProperty(DisplayMode, 'Control Type Settings', 'ControlType');

        DisplayMode.AddGroup('Control Type Settings', 'DateTime', False);
        ceRow.AddProperty(DisplayMode, 'Control Type Settings.DateTime', 'DateTimeDef');

        DisplayMode.AddGroup('Control Type Settings', 'Combo', False);
        ceRow.AddProperty(DisplayMode, 'Control Type Settings.Combo', 'DropDownStyle');
        ceRow.AddProperty(DisplayMode, 'Control Type Settings.Combo', 'ParentCombo');

        DisplayMode.AddGroup('Control Type Settings', 'Spin buttons', False);
        ceRow.AddProperty(DisplayMode, 'Control Type Settings.Spin buttons', 'SpinIncrement');
        ceRow.AddProperty(DisplayMode, 'Control Type Settings.Spin buttons', 'SpinOptions');

        DisplayMode.AddGroup('Control Type Settings', 'Text box', False);
        ceRow.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'HorzAlignment');
        ceRow.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'VertAlignment');
        ceRow.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'WordWrap');
        ceRow.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'MaskName');

        DisplayMode.AddGroup('Control Type Settings', 'Picture', False);
        ceRow.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'CenterPicture');
        ceRow.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'KeepAspectRatio');
        ceRow.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'StretchPicture');
        ceRow.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'ShrinkPicture');

        DisplayMode.AddGroup('', 'Appearance', False);
        ceRow.AddProperty(DisplayMode, 'Appearance', 'Color');
        ceRow.AddProperty(DisplayMode, 'Appearance', 'Font');
        ceRow.AddProperty(DisplayMode, 'Appearance', 'ParentFont');
        ceRow.AddProperty(DisplayMode, 'Appearance', 'Is3D');
    end;
end;

procedure TfrmInspector.NumberofToggleValuesChanged(Sender: TObject);
begin
    SetEnableDesignBehaviour;
end;

procedure TfrmInspector.NumberofInvisibleValuesChanged(Sender: TObject);
begin
    CurEditor.grdExample.Refresh;
    SetEnableInvisible;
end;

procedure TfrmInspector.SetEnableDesignBehaviour;
var
    i: integer;
    TotalNumberofToggleValues: integer;

begin
    TotalNumberofToggleValues := 0;
    for i := 0 to tabInspector.PageCount - 1 do
    begin
        if tabInspector.Pages[i] <> tabCustomizeColumns then
        begin
            TotalNumberofToggleValues := TotalNumberofToggleValues + GridEditor.TabInfo[i].ComponentEditor.ActualValueSet.NumberofToggleValues;
            if CurEditor = ComboEditor then
                TotalNumberofToggleValues := TotalNumberofToggleValues + ComboEditor.TabInfo[i].ComponentEditor.ActualValueSet.NumberofToggleValues;
        end;
    end;
    chkDesignBehaviour.Enabled := TotalNumberofToggleValues > 0;
end;

procedure TfrmInspector.SetEnableInvisible;
var
    i: integer;
    TotalNumberofInvisibleValues: integer;

begin
    TotalNumberofInvisibleValues := 0;
    for i := 0 to tabInspector.PageCount - 1 do
        if tabInspector.Pages[i] <> tabCustomizeColumns then
            TotalNumberofInvisibleValues := TotalNumberofInvisibleValues + CurEditor.TabInfo[i].ComponentEditor.ActualValueSet.NumberofInvisibleValues;

    chkInvisibleRowsCols.Enabled := TotalNumberofInvisibleValues > 0;
end;

procedure TfrmInspector.ceComboColumnGetComponentInfo(Sender: TObject;
  DisplayMode: TtsGroupElement);
begin
    if not ceComboColumn.DesignValuePropertiesInitialized then
    begin
        ceComboColumn.SetDesignProperty('Visible', pvShowToggle2, 'True');
        ceComboColumn.SetDesignProperty('ReadOnly', pvShowNever, 'False');
        ceComboColumn.DesignValuePropertiesInitialized := True;
    end;

    DisplayMode.AddGroup('', 'INVISIBLE PROPERTIES', False);
    ceComboColumn.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'ButtonType');
    ceComboColumn.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'ReadOnly');
    ceComboColumn.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'AllowGrayed');
    ceComboColumn.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'MaxLength');
    ceComboColumn.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'MaskName');
    ceComboColumn.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'ParentCombo');
    ceComboColumn.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'ComboDatasource');
    ceComboColumn.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'SpinOptions');
    ceComboColumn.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'SpinIncrement');
    ceComboColumn.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'DateTimeDef');
    ceComboColumn.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'DropDownStyle');

    if DisplayMode.Name = 'Structured' then
    begin
        ceComboColumn.AddProperty(DisplayMode, '', 'FieldName');
        ceComboColumn.AddProperty(DisplayMode, '', 'DisplayCol');
        ceComboColumn.AddProperty(DisplayMode, '', 'Visible');
        ceComboColumn.AddProperty(DisplayMode, '', 'Width');

        DisplayMode.AddGroup('', 'Control Type Settings', True);
        ceComboColumn.AddProperty(DisplayMode, 'Control Type Settings', 'ControlType');

        DisplayMode.AddGroup('Control Type Settings', 'Text box', False);
        ceComboColumn.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'HorzAlignment');
        ceComboColumn.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'VertAlignment');
        ceComboColumn.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'WordWrap');

        DisplayMode.AddGroup('Control Type Settings', 'Picture', False);
        ceComboColumn.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'CenterPicture');
        ceComboColumn.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'KeepAspectRatio');
        ceComboColumn.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'StretchPicture');
        ceComboColumn.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'ShrinkPicture');

        DisplayMode.AddGroup('Control Type Settings', 'Check box', False);
        ceComboColumn.AddProperty(DisplayMode, 'Control Type Settings.Check box', 'CheckBoxValues');

        DisplayMode.AddGroup('', 'Appearance', True);
        ceComboColumn.AddProperty(DisplayMode, 'Appearance', 'Color');
        ceComboColumn.AddProperty(DisplayMode, 'Appearance', 'Font');
        ceComboColumn.AddProperty(DisplayMode, 'Appearance', 'ParentFont');
        ceComboColumn.AddProperty(DisplayMode, 'Appearance', 'Is3D');

        DisplayMode.AddGroup('', 'Heading', False);
        ceComboColumn.AddProperty(DisplayMode, 'Heading', 'SortPicture');
        ceComboColumn.AddProperty(DisplayMode, 'Heading', 'Heading');
        ceComboColumn.AddProperty(DisplayMode, 'Heading', 'HeadingHorzAlignment');
        ceComboColumn.AddProperty(DisplayMode, 'Heading', 'HeadingVertAlignment');
        ceComboColumn.AddProperty(DisplayMode, 'Heading', 'HeadingButton');
        ceComboColumn.AddProperty(DisplayMode, 'Heading', 'HeadingColor');
        ceComboColumn.AddProperty(DisplayMode, 'Heading', 'HeadingFont');
        ceComboColumn.AddProperty(DisplayMode, 'Heading', 'HeadingParentFont');
        ceComboColumn.AddProperty(DisplayMode, 'Heading', 'HeadingWordWrap');
    end;
end;

procedure TfrmInspector.grdHeadingClickCell(Sender: TObject; DataColDown,
  DataRowDown, DataColUp, DataRowUp: Longint; DownPos,
  UpPos: TtsClickPosition);
var
    Row: integer;
begin
    if (DataColDown = DataColUp) and (DataColDown = 0) and
       (DataRowDown = DataRowUp) and (DataRowDown = 1) then
    begin
        grdInspectorAllRowsSelected := not grdInspectorAllRowsSelected;
        grdInspector.EnablePaint := False;
        try
            grdInspector.SelectRows(1, grdInspector.Rows, grdInspectorAllRowsSelected);
            for Row := 1 to grdInspector.InspectorRowCount do
                if grdInspector.InspectorRows[Row].Selected <> grdInspectorAllRowsSelected then
                    grdInspector.InspectorRows[Row].Selected := grdInspectorAllRowsSelected;
        finally
            grdInspector.EnablePaint := True;
        end;
    end;
end;

procedure TfrmInspector.grdInspectorSelectChanged(Sender: TObject;
  SelectType: TtsSelectType; ByUser: Boolean);
begin
    if ByUser then
        grdInspectorAllRowsSelected := False;
end;

procedure TfrmInspector.mnuResetClick(Sender: TObject);
var
    Row: integer;
    DefaultComponent: TPersistent;
    Value: Variant;
    CurComponent: TPersistent;

begin
    if grdInspector.ComponentEditor.Component = nil then
        exit;

    if grdInspector.ComponentEditor.Component is TtsCell then
    begin
        CurEditor.FCellPropList.Free;
        CurEditor.FCellPropList := nil;
    end;

    Resetting := True;
    DefaultComponent := GetDefaultComponent;

    TtsBaseGrid_(CurEditor.grdExample).EnablePaint := False;
    try
        for Row := 1 to grdInspector.InspectorRowCount do
        begin
            with grdInspector.InspectorRows[Row] do
            begin
                if ResetProperty(grdInspector.ComponentEditor.Component, Row) then
                begin
                    grdInspector.ComponentEditor.DoGetFirstSelectedComponent(CurComponent);
                    if CurComponent = nil then
                        break;

                    if PropertyElement.PropertyNil <> pnFalse then
                        Value := 0
                    else
                        Value := PropertyElement.GetPropertyValue(DefaultComponent, False);

                    grdInspector.SetValues(PropertyElement, '', Value, vsValue, False);
                end;
            end;
        end;
    finally
        Resetting := False;
        grdInspector.ColInvalidate(2);
        TtsBaseGrid_(CurEditor.grdExample).EnablePaint := True;
        Update;
    end;
end;

function TfrmInspector.ResetProperty(Component: TPersistent; Row: integer): Boolean;
begin
    with grdInspector.InspectorRows[Row] do
    begin
        if (InspectorElementType <> iePropertyElement) then
            result := false
        else if (Component is TtsBaseGrid) and (PropertyElement.Parent = nil) and (PropertyElement.Name = 'Name') then
            result := false
        else if (Component is TtsDesignRow) and (PropertyElement.Parent = nil) and (PropertyElement.Name = 'DisplayRow') then
            result := false
        else if (Component is TtsCol) and (PropertyElement.Parent = nil) and (PropertyElement.Name = 'DisplayCol') then
            result := false
        else
        begin
            SubFullySelected := grdInspector.GetSubFullySelected(Row);

            if grdInspector.SelectedRows.Count = 0 then
                result := (Row = grdInspector.CurrentDataRow)
            else if not grdInspector.RowVisible[Row] then
            begin
                if Parent = -1 then
                    result := grdInspector.Selected(Row)
                else if (grdInspector.InspectorRows[Parent].InspectorElementType <> iePropertyElement) then
                    result := grdInspector.Selected(Row)
                else
                    result := grdInspector.Selected(Row) and not grdInspector.InspectorRows[Parent].SubFullySelected;
            end
            else
            begin
                if Parent = -1 then
                    result := SubFullySelected
                else if (grdInspector.InspectorRows[Parent].InspectorElementType <> iePropertyElement) then
                    result := SubFullySelected
                else
                    result := SubFullySelected and not grdInspector.InspectorRows[Parent].SubFullySelected;
            end;
        end;
    end;
end;

function TfrmInspector.GetDefaultComponent: TPersistent;
begin
    if CurEditor = GridEditor then
    begin
        if tabInspector.ActivePage = tabGridProperties then
            result := GetDefaultGrid
        else if tabInspector.ActivePage = tabColumnProperties then
            result := GetDefaultCol
        else if tabInspector.ActivePage = tabRowProperties then
            result := GetDefaultRow
        else if tabInspector.ActivePage = tabCellProperties then
            result := GetDefaultCell
        else
            result := nil;
    end
    else
    begin
        if tabInspector.ActivePage = tabGridProperties then
            result := GetComboDefaultGrid
        else if tabInspector.ActivePage = tabColumnProperties then
            result := GetComboDefaultCol
        else if tabInspector.ActivePage = tabRowProperties then
            result := GetComboDefaultRow
        else if tabInspector.ActivePage = tabCellProperties then
            result := GetComboDefaultCell
        else
            result := nil;
    end;
end;


procedure TfrmInspector.mnuInsRowClick(Sender: TObject);
begin
    AddNewRow(True);
end;

procedure TfrmInspector.mnuAddRowClick(Sender: TObject);
begin
    AddNewRow(False);
end;

procedure TfrmInspector.AddNewRow(Inserting: Boolean);
var
    i: integer;
    NewDisplayRow: integer;
    NewRowCount: integer;
    GridStatus: TtsGridStatus;
begin
    TtsBaseGrid_(CurEditor.grdExample).EnablePaint := False;
    try
        GridStatus := TtsBaseGrid_(CurEditor.grdExample).GridStatus;
        if Inserting then
        begin
            case TtsBaseGrid_(CurEditor.grdExample).GridStatus of
                grNormal:
                begin
                    if CurEditor.DesignInfo.CurrentDataRow <= 0 then
                        NewDisplayRow := 1
                    else
                        NewDisplayRow := TtsBaseGrid_(CurEditor.grdExample).DisplayRownr[CurEditor.DesignInfo.CurrentDataRow];
                    NewRowCount := 1;
                end;
                grRowSelect:
                begin
                    NewDisplayRow := CurEditor.DesignInfo.SelectedRows.First;
                    NewRowCount := CurEditor.DesignInfo.SelectedRows.Count;
                end;
                grCellSelect:
                begin
                    with CurEditor.DesignInfo.SelectedCells do
                    begin
                        NewDisplayRow := Top;
                        NewRowCount := Bottom - Top + 1;
                    end;
                end;
                else
                begin
                    grdInspector.UpdateComponents;
                    exit;
                end;
            end;

            if GridStatus = grRowSelect then
                CurEditor.grdExample.ResetRowProperties([prSelected]);
        end
        else
        begin
            NewDisplayRow := TtsBaseGrid_(CurEditor.grdExample).Rows + 1;
            NewRowCount := 1;
        end;

        for i:= 0 to NewRowCount - 1 do
        begin
            TtsBaseGrid_(CurEditor.grdExample).Rows := TtsBaseGrid_(CurEditor.grdExample).Rows + 1;
            TtsBaseGrid_(CurEditor.grdExample).DisplayRowNr[TtsBaseGrid_(CurEditor.grdExample).Rows] := NewDisplayRow + i;

            if Inserting and (GridStatus = grRowSelect) then
                TtsBaseGrid_(CurEditor.grdExample).RowSelected[TtsBaseGrid_(CurEditor.grdExample).Rows] := True;
        end;

        TtsBaseGrid_(CurEditor.grdExample).CurrentDataRow := TtsBaseGrid_(CurEditor.grdExample).Rows;

    finally
        TtsBaseGrid_(CurEditor.grdExample).EnablePaint := True;
    end;
    SendUpdateComponents;
end;

procedure TfrmInspector.mnuDelRowsClick(Sender: TObject);
begin
    if CurEditor.DataBound then
        exit;

    if (TtsBaseGrid_(CurEditor.grdExample).GridStatus = grNormal) and (CurEditor.DesignInfo.CurrentDataRow > 0) then
        CurEditor.grdExample.DeleteRows(CurEditor.DesignInfo.CurrentDataRow, CurEditor.DesignInfo.CurrentDataRow)
    else if CurEditor.DesignInfo.SelectedRows.Count > 0 then
        CurEditor.grdExample.DeleteSelectedRows;

    //This code forces deleted rows to be removed from the ActualValueSet
    if CurEditor = GridEditor then
        ceRow.ShowDesignValue := ceRow.ShowDesignValue
    else
        ceComboRow.ShowDesignValue := ceComboRow.ShowDesignValue;
    //

    SendUpdateComponents;
end;

procedure TfrmInspector.pmnGridPopup(Sender: TObject);
var
    Multiple: Boolean;
    Extrastring: string;
begin
    Multiple := False;
    case TtsBaseGrid_(CurEditor.grdExample).GridStatus of
        grNormal:
        begin
            mnuAddColumn.Enabled := True;
            mnuInsColumns.Enabled := True;
            mnuDelColumns.Enabled := (TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol > 0) and (TtsBaseGrid_(CurEditor.grdExample).CurrentDataRow > 0);
            mnuAddRow.Enabled := (not CurEditor.DataBound);
            mnuInsRow.Enabled := (not CurEditor.DataBound);
            mnuDelRows.Enabled := (not CurEditor.DataBound) and (TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol > 0) and (TtsBaseGrid_(CurEditor.grdExample).CurrentDataRow > 0);
        end;
        grColSelect:
        begin
            mnuAddColumn.Enabled := True;
            mnuInsColumns.Enabled := True;
            mnuDelColumns.Enabled := True;
            mnuAddRow.Enabled := (not CurEditor.DataBound);
            mnuInsRow.Enabled := False;
            mnuDelRows.Enabled := False;

            Multiple := TtsBaseGrid_(CurEditor.grdExample).SelectedCols.Count > 1;
        end;
        grRowSelect:
        begin
            mnuAddColumn.Enabled := True;
            mnuInsColumns.Enabled := False;
            mnuDelColumns.Enabled := False;
            mnuAddRow.Enabled := (not CurEditor.DataBound);
            mnuInsRow.Enabled := (not CurEditor.DataBound);
            mnuDelRows.Enabled := (not CurEditor.DataBound);

            Multiple := CurEditor.DesignInfo.SelectedRows.Count > 1;
        end;
        grCellSelect:
        begin
            mnuAddColumn.Enabled := True;
            mnuInsColumns.Enabled := True;
            mnuDelColumns.Enabled := False;
            mnuAddRow.Enabled := (not CurEditor.DataBound);
            mnuInsRow.Enabled := (not CurEditor.DataBound);
            mnuDelRows.Enabled := False;

            with CurEditor.DesignInfo.SelectedCells do
                if (Left <> Right) or (Top <> Bottom) then
                    Multiple := True;
        end;
    end;
    if Multiple then
        Extrastring := 's'
    else
        Extrastring := '';


    if CurEditor.DataBound then
    begin
        mnuAddRow.Enabled := False;
        mnuInsRow.Enabled := False;
        mnuDelRows.Enabled := False;
    end;

    mnuInsColumns.Caption := 'Insert Column' + Extrastring;
    mnuDelColumns.Caption := 'Delete Column' + Extrastring;
    mnuInsRow.Caption := 'Insert Row' + Extrastring;
    mnuDelRows.Caption := 'Delete Row' + Extrastring;
end;

function TfrmInspector.ValidDataRow(DataRow: Variant; DataBound: Boolean): Boolean;
begin
    if VarIsEmpty(DataRow) then
        result := False
    else if DataBound then
        result := True
    else
        result := (DataRow > 0);
end;

procedure TfrmInspector.grdExampleDblClickCell(Sender: TObject;
  DataCol: Longint; DataRow: Variant; Pos: TtsClickPosition);
begin
    if (SendersEditor(Sender) = ComboEditor) and (ComboEditor <> CurEditor) then
        exit;

    if Pos <> cpCell then exit;

    if CellType(SendersEditor(Sender), DataCol, DataRow) = ctPicture then
    begin
        if not TtsBaseGrid_(SendersEditor(Sender).grdExample).StoreData then
        begin
            if SendersEditor(Sender).DataBound then
                ShowMessage('Setting of a picture in the ComponentEditor is only allowed when the grid is not databound and StoreData = ''True''')
            else
                ShowMessage('Setting of a picture in the ComponentEditor is only allowed when StoreData = ''True''');
        end
        else if (TtsBaseGrid_(GridEditor.grdExample).ImageList <> nil) then
            SetPicture;
    end;
end;

procedure TfrmInspector.grdExampleDblClickCell_Unbound(Sender: TObject; DataCol,
  DataRow: Longint; Pos: TtsClickPosition);
begin
    grdExampleDblClickCell(Sender, DataCol, DataRow, Pos);
end;

procedure TfrmInspector.butOKClick(Sender: TObject);
begin
    ButtonedExit := True;
    if not Assigned(GridEditor.grdExample) then Exit;

    SaveResult := True;
    if not StartedFromDesigntime then
    begin
        TsDesign.Designer.Modified;
        frmInspector.ShowAlwaysStateGrid := True;
        frmInspector.ApplyShowDesignValueGrid;
        frmInspector.CheckInsertRow(GridEditor.grdExample);
        CurGrid.Assign(GridEditor.grdExample);
        CurGrid.Name := CurGridName;
        CurGrid.Width := CurGridWidth;
        CurGrid.Height := CurGridHeight;
        CurGrid.Visible := CurGridVisible;

        FreeActualValuesGrid;
        GridEditor.grdExample.Assign(CurGrid);
        SetActualValuesGrid;
        GridEditor.grdExample.Refresh;

        ShowMessage('grdExample assigned to CurGrid and back to grdExample');
    end
    else if TtsBaseGrid_(GridEditor.grdExample).ComboVisible then
        TtsBaseGrid_(GridEditor.grdExample).Color := CurGridColor;
end;

procedure TfrmInspector.butCancelClick(Sender: TObject);
begin
    ButtonedExit := True;

    if not StartedFromDesigntime then
        Close;
end;

procedure TfrmInspector.SetgrdExampleWidthAndHeight;
begin
    if GridEditor = nil then
        exit;

    if CurGrid = nil then
        exit;

    GridEditor.grdExample.Width := CalcMin(pnlGrdExample.Width - (2*GridEditor.grdExample.Left), CurGridWidth);
    GridEditor.grdExample.Height := CalcMin(pnlGrdExample.Height - (2*GridEditor.grdExample.Top), CurGridHeight);
end;


procedure TfrmInspector.pnlGrdExampleResize(Sender: TObject);
begin
    SetgrdExampleWidthAndHeight;
end;

procedure TfrmInspector.grdExampleColCountChanged(Sender: TObject;
  OldCount, NewCount: Longint);
begin
    if (SendersEditor(Sender) = ComboEditor) and (ComboEditor <> CurEditor) then
        exit;

    TsDesign.ChangesMade := True;
    UnassignComponent(SendersEditor(Sender));
end;

procedure TfrmInspector.grdExampleRowCountChanged(Sender: TObject;
  OldCount, NewCount: Longint);
begin
    if (SendersEditor(Sender) = ComboEditor) and (ComboEditor <> CurEditor) then
        exit;

    TsDesign.ChangesMade := True;
    UnassignComponent(SendersEditor(Sender));
end;

procedure TfrmInspector.UnassignComponent(Editor: TEditor);
begin
    if Editor = GridEditor then
    begin
        ceRow.ComponentAssigned := False;
        ceCell.ComponentAssigned := False;
    end
    else
    begin
        ceComboRow.ComponentAssigned := False;
        ceComboCell.ComponentAssigned := False;
    end;

    Editor.FirstEditorCell.Free;
    Editor.NextEditorCell.Free;
    Editor.IdEditorCell.Free;
    Editor.FirstEditorRow.Free;
    Editor.NextEditorRow.Free;
    Editor.IdEditorRow.Free;

    Editor.FirstEditorCell := nil;
    Editor.NextEditorCell := nil;
    Editor.IdEditorCell := nil;
    Editor.FirstEditorRow := nil;
    Editor.NextEditorRow := nil;
    Editor.IdEditorRow := nil;
end;

procedure TfrmInspector.grdInspectorResize(Sender: TObject);
begin
    grdInspector.Col[2].Width := grdInspector.ClientWidth - grdInspector.Col[1].Width - grdInspector.RowBarWidth + 1;
    grdInspector.Refresh;
end;

procedure TfrmInspector.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
    Answer: word;
begin
    if not Assigned(GridEditor.grdExample) then Exit;
    TtsBaseGrid_(GridEditor.grdExample).CheckDropDownOff(False);

    if TsDesign.ChangesMade and not ButtonedExit then
    begin
        Answer := MessageDlg('Do you want to save the changes made to ' + CurGrid.Name + '?', mtWarning, [mbYes, mbNo, mbCancel], 0);
        case Answer of
            mrYes    : SaveResult := True;
            mrCancel : CanClose := False;
        end;
    end;
end;

procedure TfrmInspector.chkDesignBehaviourClick(Sender: TObject);
begin
    pnlInspectorWTabs.BringToFront;
    pnlInspectorWTabs.Update;

    if chkDesignBehaviour.Checked then
        UserShowOptions := UserShowOptions + [suoDesignBehaviour]
    else
        UserShowOptions := UserShowOptions - [suoDesignBehaviour];

    ApplyShowDesignValueGrid;
    if CurEditor = ComboEditor then
        ApplyShowDesignValueCombo;

    lblDesignProperty.Visible := chkDesignBehaviour.Checked;
    grdInspector.Invalidate;
end;

procedure TfrmInspector.chkInvisibleRowsColsClick(Sender: TObject);
begin
    pnlInspectorWTabs.BringToFront;
    pnlInspectorWTabs.Update;

    TtsBaseGrid_(CurEditor.grdExample).EnablePaint := False;
    TtsBaseGrid_(CurEditor.grdExample).FastAssign := True;
    try
        if CurEditor = GridEditor then
        begin
            if chkInvisibleRowsCols.Checked then
                UserShowOptions := UserShowOptions + [suoShowInvisibleGrid]
            else
                UserShowOptions := UserShowOptions - [suoShowInvisibleGrid];
        end
        else
        begin
            if chkInvisibleRowsCols.Checked then
                UserShowOptions := UserShowOptions + [suoShowInvisibleCombo]
            else
                UserShowOptions := UserShowOptions - [suoShowInvisibleCombo];

            ApplyShowDesignValueCombo;
        end;

        ApplyShowDesignValueGrid;
    finally
        TtsBaseGrid_(CurEditor.grdExample).EnablePaint := True;
        TtsBaseGrid_(CurEditor.grdExample).FastAssign := False;
    end;
end;

procedure TfrmInspector.grdExampleGetDrawInfo(Sender: TObject;
  DataCol: Longint; DataRow: Variant; var DrawInfo: TtsDrawInfo);
var
    invisible: boolean;
begin
    invisible := false;

    with TtsBaseGrid_(SendersEditor(Sender).grdExample) do
    begin
        if TtsBaseGrid(Sender).Name <> 'ComboGrid' then
        begin
            if ((ceColumn.ActualValueSet.GetItem([IntToStr(Col[DataCol].Id), 'Visible'])) <> nil) then
                invisible := true
            else
            begin
                if not SendersEditor(Sender).DataBound then
                    if ((ceRow.ActualValueSet.GetItem([IntToStr(RowId[DataRow]), 'Visible'])) <> nil) then
                        invisible := true;
            end;
        end
        else
        begin
            if ((ceComboColumn.ActualValueSet.GetItem([IntToStr(Col[DataCol].Id), 'Visible'])) <> nil) then
                invisible := true
            else
            begin
                if not SendersEditor(Sender).DataBound then
                    if ((ceComboRow.ActualValueSet.GetItem([IntToStr(RowId[DataRow]), 'Visible'])) <> nil) then
                        invisible := true;
            end;
        end;
    end;

    if invisible then
    begin
        DrawInfo.Color := cl3DLight;
        DrawInfo.Font.Color := clGray;
    end;
end;

procedure TfrmInspector.grdExampleGetDrawInfo_Unbound(Sender: TObject; DataCol,
  DataRow: Longint; var DrawInfo: TtsDrawInfo);
begin
    grdExampleGetDrawInfo(Sender, DataCol, DataRow, DrawInfo);
end;

procedure TfrmInspector.ComboRollUp(DataCol: Longint; DataRow: Variant);
begin
    PostMessage(Self.Handle, WM_SETTOGRIDEDITOR, 0, 0);

    ShowAlwaysStateCombo := True;
    ApplyShowDesignValueCombo;

    if GridEditor.Databound then
    begin
        if TsDesign.ChangesMade or (TtsBaseGrid_( GridEditor.grdExample).Col[DataCol].Combo <> nil) then
            TtsBaseGrid_( GridEditor.grdExample).Col[DataCol].Combo := GridEditor.DesignInfo.Combo;
    end
    else
    begin
        if GridEditor.DesignInfo.CellButtonType[DataCol, DataRow] = btCombo then
        begin
            if TsDesign.ChangesMade or (GridEditor.DesignInfo.CellCombo[DataCol, DataRow] <> nil) then
                GridEditor.DesignInfo.CellCombo[DataCol, DataRow] := GridEditor.DesignInfo.Combo;
        end
        else if (TtsBaseGrid_( GridEditor.grdExample).DrawOverlap = doDrawColOnTop) and (TtsBaseGrid_(GridEditor.grdExample).Col[DataCol].ButtonType = btCombo ) then
        begin
            if TsDesign.ChangesMade or (TtsBaseGrid_( GridEditor.grdExample).Col[DataCol].Combo <> nil) then
               TtsBaseGrid_( GridEditor.grdExample).Col[DataCol].Combo := GridEditor.DesignInfo.Combo;
        end
        else if (TtsBaseGrid_(GridEditor.grdExample).DrawOverlap <> doDrawColOnTop) and (GridEditor.DesignInfo.RowButtonType[DataRow] = btCombo ) then
        begin
            if TsDesign.ChangesMade or (GridEditor.DesignInfo.RowCombo[DataRow] <> nil) then
                GridEditor.DesignInfo.RowCombo[DataRow] := GridEditor.DesignInfo.Combo;
        end
        else if (TtsBaseGrid_(GridEditor.grdExample).Col[DataCol].ButtonType = btCombo) then
        begin
            if TsDesign.ChangesMade or (TtsBaseGrid_(GridEditor.grdExample).Col[DataCol].Combo <> nil) then
                TtsBaseGrid_(GridEditor.grdExample).Col[DataCol].Combo := GridEditor.DesignInfo.Combo;
        end
        else //if (GridEditor.DesignInfo.RowButtonType[DataRow] = btCombo) then
        begin
            if TsDesign.ChangesMade or (GridEditor.DesignInfo.RowCombo[DataRow] <> nil) then
                GridEditor.DesignInfo.RowCombo[DataRow] := GridEditor.DesignInfo.Combo;
        end;
    end;

    FreeActualValuesCombo;

    ChangesMade := TsDesign.ChangesMade or ChangesMade;
    TsDesign.ChangesMade := ChangesMade;
end;

procedure TfrmInspector.grdExampleRowResized(Sender: TObject;
  RowColnr: Longint);
begin
    if (SendersEditor(Sender) = ComboEditor) and (ComboEditor <> CurEditor) then
        exit;

    TsDesign.ChangesMade := True;
end;


procedure TfrmInspector.SetActualValuesGrid;
var
    ComponentId: string;
    PropertyElement: TtsPropertyElement;
    i: integer;

begin
    if not ceGrid.DesignValuePropertiesInitialized then
    begin
        ceGrid.DesignValuePropertiesInitialized := True;

        ceGrid.SetDesignProperty('Visible', pvShowNever, 'True');
        ceGrid.SetDesignProperty('RowSelectMode', pvShowToggle1, 'rsMulti');
        ceGrid.SetDesignProperty('ColSelectMode', pvShowToggle1, 'csMulti');
        ceGrid.SetDesignProperty('ColMoving', pvShowToggle1, 'True');
        ceGrid.SetDesignProperty('ResizeCols', pvShowToggle1, 'rcSingle');
        ceGrid.SetDesignProperty('Enabled', pvShowToggle1, 'True');
        ceGrid.SetDesignProperty('HeadingOn', pvShowToggle1, 'True');
        ceGrid.SetDesignProperty('RowBarOn', pvShowToggle1, 'True');
        ceGrid.SetDesignProperty('Width', pvShowNever, '0');
        ceGrid.SetDesignProperty('Height', pvShowNever, '0');
        ceGrid.SetDesignProperty('Name', pvShowNever, 'DesignGrid');

        ceGrid.SetDesignProperty('AlwaysShowEditor', pvShowToggle1, 'False');
        ceGrid.SetDesignProperty('AlwaysShowFocus', pvShowToggle1, 'True');
        ceGrid.SetDesignProperty('FocusBorder', pvShowToggle1, 'fbDouble');
        ceGrid.SetDesignProperty('GridMode', pvShowToggle1, 'gmEdit');

        if GridEditor.DataBound then
        begin
            ceGrid.SetDesignProperty('CellSelectMode', pvShowAlways, 'cmNone');
            ceGrid.SetDesignProperty('RowMoving', pvShowAlways, 'False');
        end
        else
        begin
            ceGrid.SetDesignProperty('CellSelectMode', pvShowToggle1, 'cmRange');
            ceGrid.SetDesignProperty('RowMoving', pvShowToggle1, 'True');
        end;
    end;

    ceGrid.DoGetComponentId(GridEditor.grdExample, ComponentId);

    with TtsBaseGrid_(GridEditor.grdExample) do
    begin
        PropertyElement := ceGrid.PropertySet.GetItem(['Visible']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(Visible));

        PropertyElement := ceGrid.PropertySet.GetItem(['RowSelectMode']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(RowSelectMode));

        PropertyElement := ceGrid.PropertySet.GetItem(['ColSelectMode']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(ColSelectMode));

        PropertyElement := ceGrid.PropertySet.GetItem(['CellSelectMode']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(CellSelectMode));

        PropertyElement := ceGrid.PropertySet.GetItem(['RowMoving']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(RowMoving));

        PropertyElement := ceGrid.PropertySet.GetItem(['ColMoving']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(ColMoving));

        PropertyElement := ceGrid.PropertySet.GetItem(['Enabled']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(Enabled));

        PropertyElement := ceGrid.PropertySet.GetItem(['HeadingOn']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(HeadingOn));

        PropertyElement := ceGrid.PropertySet.GetItem(['RowBarOn']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(RowBarOn));

        PropertyElement := ceGrid.PropertySet.GetItem(['Name']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, CurGridName);

        PropertyElement := ceGrid.PropertySet.GetItem(['Width']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(CurGridWidth));

        PropertyElement := ceGrid.PropertySet.GetItem(['Height']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(CurGridHeight));

        PropertyElement := ceGrid.PropertySet.GetItem(['Visible']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(CurGridVisible));

        PropertyElement := ceGrid.PropertySet.GetItem(['AlwaysShowEditor']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(AlwaysShowEditor));

        PropertyElement := ceGrid.PropertySet.GetItem(['AlwaysShowFocus']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(AlwaysShowFocus));

        PropertyElement := ceGrid.PropertySet.GetItem(['FocusBorder']);
        if PropertyElement <> nil then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(FocusBorder));

        PropertyElement := ceGrid.PropertySet.GetItem(['EditMode']);
        if (PropertyElement <> nil) and (PopupMenu <> nil) then
            ceGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(EditMode));

        Visible := True;
        if Cols > 0 then
        begin
            if (FVisibleCols.Count <> Cols) or HasReadOnlyCol(GridEditor.grdExample) then
            begin
                ceColumn.SetDesignProperty('Visible', pvShowToggle2, 'True');
                ceColumn.SetDesignProperty('ReadOnly', pvShowNever, 'False');
                ceColumn.DesignValuePropertiesInitialized := True;

                PropertyElement := ceColumn.PropertySet.GetItem(['Visible']);
                if PropertyElement <> nil then
                begin
                    for i:= 1 to Cols do
                    begin
                        if not Col[i].Visible then
                            ceColumn.SetActualValue(IntToStr(Col[i].Id), PropertyElement, 'False');
                    end;
                end;

                PropertyElement := ceColumn.PropertySet.GetItem(['ReadOnly']);
                if PropertyElement <> nil then
                begin
                    for i:= 1 to Cols do
                    begin
                        if Col[i].ReadOnly then
                            ceColumn.SetActualValue(IntToStr(Col[i].Id), PropertyElement, 'True');
                    end;
                end;
            end;
        end;

        if not (GridEditor.DataBound) then
        begin
            if (FVisibleRows.Count <> Rows) or HasReadOnlyRow(GridEditor.grdExample) then
            begin
                ceRow.SetDesignProperty('Visible', pvShowToggle2, 'True');
                ceRow.SetDesignProperty('ReadOnly', pvShowNever, 'False');
                ceRow.DesignValuePropertiesInitialized := True;

                PropertyElement := ceRow.PropertySet.GetItem(['Visible']);
                if PropertyElement <> nil then
                begin
                    for i:= 1 to Rows do
                    begin
                        if not RowVisible[i] then
                            ceRow.SetActualValue(IntToStr(RowId[i]), PropertyElement, 'False');
                    end;
                end;

                PropertyElement := ceRow.PropertySet.GetItem(['ReadOnly']);
                if PropertyElement <> nil then
                begin
                    for i:= 1 to Rows do
                    begin
                        if RowReadOnly[i] then
                            ceRow.SetActualValue(IntToStr(RowId[i]), PropertyElement, 'True');
                    end;
                end;
            end;
        end;
    end;
    ShowAlwaysStateGrid := False;
    ApplyShowDesignValueGrid;
end;

procedure TfrmInspector.SetActualValuesCombo;
var
    ComponentId: string;
    PropertyElement: TtsPropertyElement;
    i: integer;
begin
    if not ceComboGrid.DesignValuePropertiesInitialized then
    begin
        ceComboGrid.SetDesignProperty('HeadingOn', pvShowToggle1, 'True');
        ceComboGrid.SetDesignProperty('RowBarOn', pvShowToggle1, 'True');
        ceComboGrid.SetDesignProperty('ResizeCols', pvShowToggle1, 'rcSingle');
        ceComboGrid.DesignValuePropertiesInitialized := True;
    end;

    ceComboGrid.DoGetComponentId(ComboEditor.grdExample, ComponentId);
    with TtsBaseGrid_(ComboEditor.grdExample) do
    begin
        PropertyElement := ceComboGrid.PropertySet.GetItem(['HeadingOn']);
        if PropertyElement <> nil then
            ceComboGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(HeadingOn));

        PropertyElement := ceComboGrid.PropertySet.GetItem(['RowBarOn']);
        if PropertyElement <> nil then
            ceComboGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(RowBarOn));

        PropertyElement := ceComboGrid.PropertySet.GetItem(['ResizeCols']);
        if PropertyElement <> nil then
            ceComboGrid.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(ResizeCols));

        if Cols > 0 then
        begin
            if (FVisibleCols.Count <> Cols) or HasReadOnlyCol(ComboEditor.grdExample) then
            begin
                ceComboColumn.SetDesignProperty('Visible', pvShowToggle2, 'True');
                ceComboColumn.SetDesignProperty('ReadOnly', pvShowNever, 'False');
                ceComboColumn.DesignValuePropertiesInitialized := True;

                PropertyElement := ceComboColumn.PropertySet.GetItem(['Visible']);
                if PropertyElement <> nil then
                begin
                    for i:= 1 to Cols do
                    begin
                        if not Col[i].Visible then
                        begin
                            ceComboColumn.SetActualValue(IntToStr(Col[i].Id), PropertyElement, 'False');
                        end;
                    end;
                end;

                PropertyElement := ceComboColumn.PropertySet.GetItem(['ReadOnly']);
                if PropertyElement <> nil then
                begin
                    for i:= 1 to Cols do
                    begin
                        if Col[i].ReadOnly then
                            ceComboColumn.SetActualValue(IntToStr(Col[i].Id), PropertyElement, 'True');
                    end;
                end;
            end;
        end;

        if not (ComboEditor.DataBound) then
        begin
            if (FVisibleRows.Count <> Rows) or HasReadOnlyRow(ComboEditor.grdExample) then
            begin
                ceComboRow.SetDesignProperty('Visible', pvShowToggle2, 'True');
                ceComboRow.SetDesignProperty('ReadOnly', pvShowNever, 'False');
                ceComboRow.DesignValuePropertiesInitialized := True;

                PropertyElement := ceComboRow.PropertySet.GetItem(['Visible']);
                if PropertyElement <> nil then
                begin
                    for i:= 1 to Rows do
                    begin
                        if not RowVisible[i] then
                            ceComboRow.SetActualValue(IntToStr(RowId[i]), PropertyElement, 'False');
                    end;
                end;

                PropertyElement := ceComboRow.PropertySet.GetItem(['ReadOnly']);
                if PropertyElement <> nil then
                begin
                    for i:= 1 to Rows do
                    begin
                        if RowReadOnly[i] then
                            ceComboRow.SetActualValue(IntToStr(RowId[i]), PropertyElement, 'True');
                    end;
                end;
            end;
        end;
    end;
    ShowAlwaysStateCombo := False;
    ApplyShowDesignValueCombo;
end;

function TfrmInspector.HasReadOnlyCol(grd: TtsBaseGrid): Boolean;
var
    i: integer;
begin
    with TtsBaseGrid_(grd) do
    begin
        result := False;
        for i := 1 to Cols do
        begin
            if Col[i].ReadOnly then
            begin
                result := True;
                exit;
            end;
        end;
    end;
end;

function TfrmInspector.HasReadOnlyRow(grd: TtsBaseGrid): Boolean;
var
    i: integer;
begin
    with TtsBaseGrid_(grd) do
    begin
        result := False;
        for i := 1 to Rows do
        begin
            if RowReadOnly[i] then
            begin
                result := True;
                exit;
            end;
        end;
    end;
end;

function TfrmInspector.GetDefaultGrid: TPersistent;
begin
    if grdDefault = nil then
    begin
        grdDefault := GridEditor.grdExampleClass.Create(frmInspector);

        grdDefault.Name := 'DefaultGrid';
        grdDefault.Parent := pnlInvisible;
        grdDefault.Visible := True;
        TtsBaseGrid_(grdDefault).InDesignMode := True;
    end;
    result := grdDefault;
end;

function TfrmInspector.GetDefaultCol: TPersistent;
begin
    if ColDefault = nil then
    begin
        if GetDefaultGrid is TtsCustomDBGrid then
            ColDefault := TtsCustomDBGrid_(GetDefaultGrid as TtsCustomDBGrid).Col[1]
        else
            ColDefault := TtsBaseGrid_(GetDefaultGrid).Col[1];

        (ColDefault as TtsCol).AutoCreateFont := True;
    end;
    result := ColDefault;
end;

function TfrmInspector.GetDefaultRow: TPersistent;
begin
    if RowDefault = nil then
    begin
        RowDefault := TtsDesignRow.Create(TtsBaseGrid(GetDefaultGrid), 1);
        (RowDefault as TtsDesignRow).AutoCreateFont := True;
    end;
    result := RowDefault;
end;

function TfrmInspector.GetDefaultCell: TPersistent;
begin
    if CellDefault = nil then
    begin
        CellDefault := TtsCell.Create(TtsBaseGrid(GetDefaultGrid), 1, 1);
        (CellDefault as TtsCell).AutoCreateFont := True;
    end;
    result := CellDefault;
end;

function TfrmInspector.GetComboDefaultGrid: TPersistent;
begin
    if grdComboDefault = nil then
    begin
        if GetDefaultGrid is TtsCustomGrid then
            grdComboDefault := TtsCustomGrid_(GetDefaultGrid as TtsCustomGrid).Combo.Grid
        else
            grdComboDefault := TtsCustomDBGrid_(GetDefaultGrid as TtsCustomDBGrid).Combo.Grid;

        grdComboDefault.Name := 'DefaultComboGrid';
        TtsBaseGrid_(grdComboDefault).Cols := 2;
        TtsBaseGrid_(grdComboDefault).Rows := 4;
    end;
    TtsBaseGrid_(grdComboDefault).InitComboColWidth(TtsBaseGrid_(GridEditor.grdExample).Col[TtsBaseGrid_(GridEditor.grdExample).CurrentDataCol].Width);
    result := grdComboDefault;
end;

function TfrmInspector.GetComboDefaultCol: TPersistent;
begin
    if ColComboDefault = nil then
    begin
        if GetComboDefaultGrid is TtsCustomDBGrid then
            ColComboDefault := TtsCustomDBGrid_(GetComboDefaultGrid as TtsCustomDBGrid).Col[1]
        else
            ColComboDefault := TtsBaseGrid_(GetComboDefaultGrid).Col[1];

        (ColComboDefault as TtsCol).AutoCreateFont := True;
    end;
    result := ColComboDefault;
end;

function TfrmInspector.GetComboDefaultRow: TPersistent;
begin
    if RowComboDefault = nil then
    begin
        RowComboDefault := TtsDesignRow.Create(TtsBaseGrid(GetComboDefaultGrid), 1);
        (RowComboDefault as TtsDesignRow).AutoCreateFont := True;
    end;
    result := RowComboDefault;
end;

function TfrmInspector.GetComboDefaultCell: TPersistent;
begin
    if CellComboDefault = nil then
    begin
        CellComboDefault := TtsCell.Create(TtsBaseGrid(GetComboDefaultGrid), 1, 1);
        (CellComboDefault as TtsCell).AutoCreateFont := True;
    end;
    result := CellComboDefault;
end;

procedure TfrmInspector.ceGridSetValues(Sender: TObject; State: tsScanObjectsState;
  Component: Tpersistent; PropertyElement: TtsPropertyElement;
  strValue: String; Value: Variant; ValueSource: tsValueSource;
  FirstSet: Boolean; var Cancel: Boolean);
var
    APropertyElement: TtsPropertyElement;
    ComponentId: string;
    OldName: string;
    Success: Boolean;
    CurValuestr: string;

begin
    if State = soStart then
    begin
        if (PropertyElement.Name = 'AutoLookup') then
        begin
            if ValueSource = vsValue then
                strValue := GetEnumName(PropertyElement.PropType, Value);

            if LowerCase(strValue) = 'true' then
                if MessageDlg('All data will be cleared.' + chr(10) + chr (10) + 'Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                    Cancel := True;
        end
        else if (PropertyElement.Parent = nil) and (PropertyElement.Name = 'Name')then
        begin
            if FirstSet then exit;

            OldName := CurGrid.Name;
            Success := True;
            try
                if (ValueSource = vsValue) then
                    strValue := Value;
                CurGrid.Name := strValue
            except
                raise;
                Success := False;
            end;
            CurGrid.Name := OldName;
            if Success then
            begin
                CurGridName := strValue;

                ceGrid.DoGetComponentId(GridEditor.grdExample, ComponentId);
                PropertyElement := ceGrid.PropertySet.GetItem(['Name']);
                if PropertyElement <> nil then
                    ceGrid.SetActualValue(ComponentId, PropertyElement, CurGridName);
            end;

            Cancel := true;
        end
        else if (PropertyElement.Name = 'Cols') or (PropertyElement.Name = 'Rows') then
        begin
            if (ValueSource = vsstrValue) then
                Value := StrToInt(strValue);

            if (PropertyElement.Name = 'Cols') then
                ChangeCols(Sender, PropertyElement, Value)
            else if (PropertyElement.Name = 'Rows') then
                ChangeRows(Sender, PropertyElement, Value);

            Cancel := True;
        end;
    end
    else if State = soEnd then
    begin
        FormResize(Sender);
        if (PropertyElement.Name = 'FieldState') then
        begin
            if CurEditor.DataBound then
            begin
                TtsBaseGrid_(CurEditor.grdExample).EnablePaint := False;
                try
                    if ValueSource = vsValue then
                        strValue := GetEnumName(PropertyElement.PropType, Value);

                    TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState := fsCustomized;
                    TtsBaseGrid_(CurEditor.grdExample).Cols := 0;
                    if LowerCase(strValue) = 'fsdefault' then
                        TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState := fsDefault;

                    tabColumnProperties.TabVisible := not (CurEditor.DataBound and (TtsCustomDBGrid_(CurEditor.grdExample as TtsCustomDBGrid).FieldState = fsDefault));
                    FormResize(Sender);
                finally
                    TtsBaseGrid_(CurEditor.grdExample).EnablePaint := True;
                end;
            end;
        end
        else if (PropertyElement.Parent = nil) and (PropertyElement.Name = 'Visible') then
        begin
            PropertyElement := ceGrid.PropertySet.GetItem(['Visible']);
            if PropertyElement <> nil then
                CurGridVisible := PropertyElement.GetPropertyValue(GridEditor.grdExample, True);
        end
        else if PropertyElement.Name = 'Align' then
        begin
            if ValueSource = vsValue then
                strValue := GetEnumName(PropertyElement.PropType, Value);

            if LowerCase(strValue) = 'alnone' then
                exit;

            ceGridGetComponentId(Sender, GridEditor.grdExample, ComponentId);
            if (GridEditor.grdExample.Align = alClient) or (GridEditor.grdExample.Align = alTop) or (GridEditor.grdExample.Align = alBottom) then
                ceGrid.ActualValueSet.Remove([ComponentId, 'Width']);
            if (GridEditor.grdExample.Align = alClient) or (GridEditor.grdExample.Align = alLeft) or (GridEditor.grdExample.Align = alRight) then
                ceGrid.ActualValueSet.Remove([ComponentId, 'Height']);

            PropertyElement := ceGrid.PropertySet.GetItem(['Width']);
            if PropertyElement <> nil then
                CurGridWidth := PropertyElement.GetPropertyValue(GridEditor.grdExample, True);

            PropertyElement := ceGrid.PropertySet.GetItem(['Height']);
            if PropertyElement <> nil then
                CurGridHeight := PropertyElement.GetPropertyValue(GridEditor.grdExample, True);

            SetgrdExampleWidthAndHeight;
        end
        else if (PropertyElement.Name = 'Width') or (PropertyElement.Name = 'Height') then
        begin
            PropertyElement := ceGrid.PropertySet.GetItem(['Width']);
            if PropertyElement <> nil then
                CurGridWidth := PropertyElement.GetPropertyValue(GridEditor.grdExample, True);

            PropertyElement := ceGrid.PropertySet.GetItem(['Height']);
            if PropertyElement <> nil then
                CurGridHeight := PropertyElement.GetPropertyValue(GridEditor.grdExample, True);

            SetgrdExampleWidthAndHeight;
        end
        else if (PropertyElement.Name = 'DataSource') or (PropertyElement.Name = 'AutoLookup') then
        begin
            UnassignComponent(SendersEditor(Sender));
            if SendersEditor(Sender) = GridEditor then
            begin
                ceRow.ActualValueSet.Free;
                ceRow.ActualValueSet := nil;
                ceCell.ActualValueSet.Free;
                ceCell.ActualValueSet := nil;
            end
            else
            begin
                ceComboRow.ActualValueSet.Free;
                ceComboRow.ActualValueSet := nil;
                ceComboCell.ActualValueSet.Free;
                ceComboCell.ActualValueSet := nil;
            end;

            SetEnableDesignBehaviour;
            SetEnableInvisible;

            SendersEditor(Sender).GetFieldNames;
            SendersEditor(Sender).SetRightTabsVisible;

            if GridEditor.DataBound then
            begin
                ceGrid.SetDesignProperty('CellSelectMode', pvShowAlways, 'cmNone');
                ceGrid.SetDesignProperty('RowMoving', pvShowAlways, 'False');
            end
            else
            begin
                ceGrid.SetDesignProperty('CellSelectMode', pvShowToggle1, 'cmRange');
                ceGrid.SetDesignProperty('RowMoving', pvShowToggle1, 'True');
            end;

            ceGrid.DoGetComponentId(GridEditor.grdExample, ComponentId);

            with TtsBaseGrid_(GridEditor.grdExample) do
            begin
                APropertyElement := ceGrid.PropertySet.GetItem(['CellSelectMode']);
                if APropertyElement <> nil then
                begin
                    CurValuestr := grdInspector.GetPropertyDisplayValue(APropertyElement);
                    if (not GridEditor.DataBound) and (not (APropertyElement.ShowPropertyValue in ceGrid.ShowDesignValue)) then
                        APropertyElement.SetPropertyValue(GridEditor.grdExample, cmRange);
                    ceGrid.SetActualValue(ComponentId, APropertyElement, CurValuestr);
                end;

                APropertyElement := ceGrid.PropertySet.GetItem(['RowMoving']);
                if APropertyElement <> nil then
                begin
                    CurValuestr := grdInspector.GetPropertyDisplayValue(APropertyElement);
                    if (not GridEditor.DataBound) and (not (APropertyElement.ShowPropertyValue in ceGrid.ShowDesignValue)) then
                        APropertyElement.SetPropertyValue(GridEditor.grdExample, True);
                    ceGrid.SetActualValue(ComponentId, APropertyElement, CurValuestr);
                end;
            end;

            SetEnableDesignBehaviour;
        end;
        SetEnablebutLoadPicture;
    end;
end;

procedure TfrmInspector.ChangeCols(Sender: TObject; PropertyElement: TtsPropertyElement; NewCols: integer);
var
    ColsToDelete: integer;
    DataCol, FromCol, ToCol: integer;
begin
    if NewCols > TtsBaseGrid_(SendersEditor(Sender).grdExample).Cols then
        TtsBaseGrid_(SendersEditor(Sender).grdExample).Cols := NewCols
    else if NewCols < TtsBaseGrid_(SendersEditor(Sender).grdExample).Cols then
    begin
        FromCol := -1;
        ToCol := -1;
        ColsToDelete := 0;
        DataCol := TtsBaseGrid_(SendersEditor(Sender).grdExample).Cols;
        while (TtsBaseGrid_(SendersEditor(Sender).grdExample).Cols + ColsToDelete) > NewCols do
        begin
            if TtsBaseGrid_(SendersEditor(Sender).grdExample).DisplayColnr[DataCol] > NewCols then
            begin
                ColsToDelete := ColsToDelete + 1;
                ToCol := DataCol;
                if FromCol = -1 then
                    FromCol := DataCol;
            end
            else if ColsToDelete > 0 then
            begin
                if FromCol = TtsBaseGrid_(SendersEditor(Sender).grdExample).Cols then
                    TtsBaseGrid_(SendersEditor(Sender).grdExample).Cols := ToCol - 1
                else
                    SendersEditor(Sender).grdExample.DeleteCols(ToCol, FromCol);

                FromCol := -1;
                ColsToDelete := 0;
            end;
            DataCol := DataCol - 1;
        end;

        if ColsToDelete > 0 then
            if FromCol = TtsBaseGrid_(SendersEditor(Sender).grdExample).Cols then
                TtsBaseGrid_(SendersEditor(Sender).grdExample).Cols := ToCol - 1
            else
                SendersEditor(Sender).grdExample.DeleteCols(ToCol, FromCol);
    end;

    //This code forces deleted cols to be removed from the ActualValueSet
    if CurEditor = GridEditor then
        ceColumn.ShowDesignValue := ceColumn.ShowDesignValue
    else
        ceComboColumn.ShowDesignValue := ceComboColumn.ShowDesignValue;
    //
end;

procedure TfrmInspector.ChangeRows(Sender: Tobject; PropertyElement: TtsPropertyElement; NewRows: integer);
var
    RowsToDelete: integer;
    DataRow, FromRow, ToRow: integer;
begin
    if SendersEditor(Sender).DataBound then
        exit;

    if NewRows > TtsBaseGrid_(SendersEditor(Sender).grdExample).Rows then
        TtsBaseGrid_(SendersEditor(Sender).grdExample).Rows := NewRows
    else if NewRows < TtsBaseGrid_(SendersEditor(Sender).grdExample).Rows then
    begin
        FromRow := -1;
        ToRow := -1;
        RowsToDelete := 0;
        DataRow := TtsBaseGrid_(SendersEditor(Sender).grdExample).Rows;

        TtsBaseGrid_(SendersEditor(Sender).grdExample).FastAssign := True;
        try
            while (TtsBaseGrid_(SendersEditor(Sender).grdExample).Rows + RowsToDelete) > NewRows do
            begin
                if TtsBaseGrid_(SendersEditor(Sender).grdExample).DisplayRownr[DataRow] > NewRows then
                begin
                    RowsToDelete := RowsToDelete + 1;
                    ToRow := DataRow;
                    if FromRow = -1 then
                        FromRow := DataRow;
                end
                else if RowsToDelete > 0 then
                begin
                    if FromRow = TtsBaseGrid_(SendersEditor(Sender).grdExample).Rows then
                        TtsBaseGrid_(SendersEditor(Sender).grdExample).Rows := ToRow - 1
                    else
                        SendersEditor(Sender).grdExample.DeleteRows(ToRow, FromRow);

                    FromRow := -1;
                    RowsToDelete := 0;
                end;
                DataRow := DataRow - 1;
            end;

            if RowsToDelete > 0 then
            begin
                if FromRow = TtsBaseGrid_(SendersEditor(Sender).grdExample).Rows then
                    TtsBaseGrid_(SendersEditor(Sender).grdExample).Rows := ToRow - 1
                else
                    SendersEditor(Sender).grdExample.DeleteRows(ToRow, FromRow);
            end;
        finally
            TtsBaseGrid_(SendersEditor(Sender).grdExample).FastAssign := False;
        end;
    end;

    //This code forces deleted rows to be removed from the ActualValueSet
    if CurEditor = GridEditor then
        ceRow.ShowDesignValue := ceRow.ShowDesignValue
    else
        ceComboRow.ShowDesignValue := ceComboRow.ShowDesignValue;
    //
end;

procedure TfrmInspector.FreeActualValuesGrid;
begin
    ceGrid.ActualValueSet.Free;
    ceColumn.ActualValueSet.Free;
    ceRow.ActualValueSet.Free;
    ceCell.ActualValueSet.Free;
    ceGrid.ActualValueSet := nil;
    ceColumn.ActualValueSet := nil;
    ceRow.ActualValueSet := nil;
    ceCell.ActualValueSet := nil;
end;

procedure TfrmInspector.FreeActualValuesCombo;
begin
    ceComboGrid.ActualValueSet.Free;
    ceComboColumn.ActualValueSet.Free;
    ceComboRow.ActualValueSet.Free;
    ceComboCell.ActualValueSet.Free;
    ceComboGrid.ActualValueSet := nil;
    ceComboColumn.ActualValueSet := nil;
    ceComboRow.ActualValueSet := nil;
    ceComboCell.ActualValueSet := nil;
end;

procedure TEditor.SetRightTabsVisible;
begin
    with frmInspector do
    begin
        tabCellProperties.TabVisible := not DataBound;
        tabRowProperties.TabVisible := not DataBound;

        if DataBound then
            tabColumnProperties.TabVisible := (TtsCustomDBGrid_(grdExample as TtsCustomDBGrid).FieldState = fsCustomized)
        else
            tabColumnProperties.TabVisible := True;

        tabCustomizeColumns.TabVisible := DataBound;
    end;
end;

procedure TfrmInspector.FormCreate(Sender: TObject);
begin
    FUserShowOptions := [suoShowInvisibleGrid] + [suoShowInvisibleCombo];
    FShowAlwaysStateGrid := False;
    FShowAlwaysStateCombo := False;
end;

procedure TfrmInspector.SetShowDesignValueGrid;
begin
    if ShowAlwaysStateGrid then
        ShowDesignValueGrid := [Low(tsShowPropertyValueType)..High(tsShowPropertyValueType)]
    else
    begin
        ShowDesignValueGrid := [pvShowAlways];
        if not (suoDesignBehaviour in UserShowOptions) then
            ShowDesignValueGrid := ShowDesignValueGrid + [pvShowToggle1];

        if not (suoShowInvisibleGrid in UserShowOptions) then
            ShowDesignValueGrid := ShowDesignValueGrid + [pvShowToggle2];
    end;
end;

procedure TfrmInspector.SetShowDesignValueCombo;
begin
    if ShowAlwaysStateCombo then
        ShowDesignValueCombo := [Low(tsShowPropertyValueType)..High(tsShowPropertyValueType)]
    else
    begin
        ShowDesignValueCombo := [pvShowAlways];
        if not (suoDesignBehaviour in UserShowOptions) then
            ShowDesignValueCombo := ShowDesignValueCombo + [pvShowToggle1];

        if not (suoShowInvisibleCombo in UserShowOptions) then
            ShowDesignValueCombo := ShowDesignValueCombo + [pvShowToggle2];
    end;
end;

procedure TfrmInspector.ApplyShowDesignValueGrid;
begin
    ceGrid.ShowDesignValue := FShowDesignValueGrid;
    ceColumn.ShowDesignValue := FShowDesignValueGrid;
    ceRow.ShowDesignValue := FShowDesignValueGrid;
    ceCell.ShowDesignValue := FShowDesignValueGrid;
end;

procedure TfrmInspector.ApplyShowDesignValueCombo;
begin
    TtsBaseGrid_(ComboEditor.grdExample).EnablePaint := False;
    try
        ceComboGrid.ShowDesignValue := FShowDesignValueCombo;
        ceComboColumn.ShowDesignValue := FShowDesignValueCombo;
        ceComboRow.ShowDesignValue := FShowDesignValueCombo;
        ceComboCell.ShowDesignValue := FShowDesignValueCombo;

        TtsBaseGrid_(GridEditor.grdExample).SetComboFormExtents(ComboEditor.grdExample);
    finally
        TtsBaseGrid_(ComboEditor.grdExample).EnablePaint := True;
    end;
end;

procedure TfrmInspector.CheckInsertRow(Grid: TtsBaseGrid);
begin
    if Grid is TtsBaseGrid then
    begin
        with TtsBaseGrid_(Grid) do
        begin
            if IsInsertRow(CurDisplayRow) then
                SetCurrentCell(LeftCol, CurDisplayRow - 1);
        end;
    end;
end;

procedure TfrmInspector.SetUserShowOptions(Value: tsUserShowOptions);
begin
    FUserShowOptions := Value;
    SetShowDesignValueGrid;
    SetShowDesignValueCombo;
end;

procedure TfrmInspector.SetShowAlwaysStateGrid(Value: Boolean);
begin
    FShowAlwaysStateGrid := Value;
    SetShowDesignValueGrid;
end;

procedure TfrmInspector.SetShowAlwaysStateCombo(Value: Boolean);
begin
    FShowAlwaysStateCombo := Value;
    SetShowDesignValueCombo;
end;


procedure TfrmInspector.ceCellGetComponentInfo(Sender: TObject;
  DisplayMode: TtsGroupElement);
begin
    if DisplayMode.Name = 'Structured' then
    begin
        ceCell.AddProperty(DisplayMode, '', 'ReadOnly');

        DisplayMode.AddGroup('', 'Control Type Settings', True);
        ceCell.AddProperty(DisplayMode, 'Control Type Settings', 'ButtonType');
        ceCell.AddProperty(DisplayMode, 'Control Type Settings', 'ControlType');

        DisplayMode.AddGroup('Control Type Settings', 'DateTime', False);
        ceCell.AddProperty(DisplayMode, 'Control Type Settings.DateTime', 'DateTimeDef');

        DisplayMode.AddGroup('Control Type Settings', 'Combo', False);
        ceCell.AddProperty(DisplayMode, 'Control Type Settings.Combo', 'DropDownStyle');
        ceCell.AddProperty(DisplayMode, 'Control Type Settings.Combo', 'ParentCombo');

        DisplayMode.AddGroup('Control Type Settings', 'Spin buttons', False);
        ceCell.AddProperty(DisplayMode, 'Control Type Settings.Spin buttons', 'SpinIncrement');
        ceCell.AddProperty(DisplayMode, 'Control Type Settings.Spin buttons', 'SpinOptions');

        DisplayMode.AddGroup('Control Type Settings', 'Text box', False);
        ceCell.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'HorzAlignment');
        ceCell.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'VertAlignment');
        ceCell.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'WordWrap');
        ceCell.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'MaskName');

        DisplayMode.AddGroup('Control Type Settings', 'Picture', False);
        ceCell.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'CenterPicture');
        ceCell.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'KeepAspectRatio');
        ceCell.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'StretchPicture');
        ceCell.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'ShrinkPicture');

        DisplayMode.AddGroup('', 'Appearance', True);
        ceCell.AddProperty(DisplayMode, 'Appearance', 'Color');
        ceCell.AddProperty(DisplayMode, 'Appearance', 'Font');
        ceCell.AddProperty(DisplayMode, 'Appearance', 'ParentFont');
        ceCell.AddProperty(DisplayMode, 'Appearance', 'Is3D');
    end;
end;

procedure TfrmInspector.ceComboCellGetComponentInfo(Sender: TObject;
  DisplayMode: TtsGroupElement);
begin
    DisplayMode.AddGroup('', 'INVISIBLE PROPERTIES', False);
    ceComboCell.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'ButtonType');
    ceComboCell.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'ReadOnly');
    ceComboCell.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'MaskName');
    ceComboCell.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'ParentCombo');
    ceComboCell.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'SpinOptions');
    ceComboCell.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'SpinIncrement');
    ceComboCell.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'DateTimeDef');
    ceComboCell.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'DropDownStyle');

    if DisplayMode.Name = 'Structured' then
    begin
        DisplayMode.AddGroup('', 'Control Type Settings', True);
        ceComboCell.AddProperty(DisplayMode, 'Control Type Settings', 'ControlType');

        DisplayMode.AddGroup('Control Type Settings', 'Text box', False);
        ceComboCell.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'HorzAlignment');
        ceComboCell.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'VertAlignment');
        ceComboCell.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'WordWrap');

        DisplayMode.AddGroup('Control Type Settings', 'Picture', False);
        ceComboCell.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'CenterPicture');
        ceComboCell.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'KeepAspectRatio');
        ceComboCell.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'StretchPicture');
        ceComboCell.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'ShrinkPicture');

        DisplayMode.AddGroup('', 'Appearance', True);
        ceComboCell.AddProperty(DisplayMode, 'Appearance', 'Color');
        ceComboCell.AddProperty(DisplayMode, 'Appearance', 'Font');
        ceComboCell.AddProperty(DisplayMode, 'Appearance', 'ParentFont');
        ceComboCell.AddProperty(DisplayMode, 'Appearance', 'Is3D');
    end;
end;

procedure TfrmInspector.ShowMoreButtonsWarning(DataCol: LongInt; DataRow: Variant);
var
    NrOfButtons: integer;
    CellButton: Boolean;

begin
    if GridEditor.DataBound then exit;

    NrOfButtons := 0;
    CellButton := False;
    if GridEditor.DesignInfo.GetCellButtonType(DataCol, DataRow) = btCombo then
    begin
        NrOfButtons := NrOfButtons + 1;
        CellButton := True;
    end;

    if GridEditor.DesignInfo.GetRowButtonType(DataRow) = btCombo then
        NrOfButtons := NrOfButtons + 1;

    if TtsBaseGrid_(GridEditor.grdExample).Col[DataCol].ButtonType = btCombo then
        NrOfButtons := NrOfButtons + 1;

    if NrOfButtons > 1 then
    begin
        if CellButton then
            ShowMessage('You will be editing the combo of the Cell')
        else if TtsBaseGrid_(GridEditor.grdExample).DrawOverlap = doDrawColOnTop then
            ShowMessage('You will be editing the combo of the Column')
        else
            ShowMessage('You will be editing the combo of the Row')
    end;
end;

procedure TfrmInspector.InitVars;
begin
    ButtonedExit := False;
    SaveResult := False;
    ChangesMade := False;
    TsDesign.ChangesMade := False;
    InspectorLastUpdated := 0;
    MoveComboBack := False;
    grdInspectorAllRowsSelected := False;
    SetDisplayModes;
    Resetting := False;
    ShowAlwaysStateGrid := False;

    sepSizerWidthDif := ClientWidth - sepSizer.Width;
    TotalWidthGridsDif := ClientWidth - grdDataFields.Width - grdColumns.Width;
    grdDataFieldsWidthShare := grdDataFields.Width / (grdDataFields.Width + grdColumns.Width);
    grdColumnsDif := grdColumns.Left - (grdDataFields.Left + grdDataFields.Width);
    butRemoveDif := butRemove.Left - butAdd.Left;
    lblFieldStateDif := (grdColumns.Left + grdColumns.Width) - lblFieldState.Left;
    grdColumnsFirstColShare := grdColumns.Col[1].Width / grdColumns.Width;
    pnlInspectorGridAutoWidthMax := pnlInspectorGrid.Width;
    grdInspectorFirstColShare := grdInspector.Col[1].Width / grdInspector.Width;
end;

procedure TfrmInspector.FreeAll;
begin
    CurGrid := nil;

    FreeNil(TObject(GridEditor));
    FreeNil(TObject(ComboEditor));

    FreeNil(TObject(CellComboDefault));
    FreeNil(TObject(RowComboDefault));

    FreeNil(TObject(CellDefault));
    FreeNil(TObject(RowDefault));
    FreeNil(TObject(grdDefault));
    ColDefault := nil;
end;


procedure TfrmInspector.ceComboRowGetComponentInfo(Sender: TObject;
  DisplayMode: TtsGroupElement);
begin
    if not ceComboRow.DesignValuePropertiesInitialized then
    begin
        ceComboRow.SetDesignProperty('Visible', pvShowToggle2, 'True');
        ceComboRow.SetDesignProperty('ReadOnly', pvShowNever, 'False');
        ceComboRow.DesignValuePropertiesInitialized := True;
    end;

    DisplayMode.AddGroup('', 'INVISIBLE PROPERTIES', False);
    ceComboRow.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'ButtonType');
    ceComboRow.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'ReadOnly');
    ceComboRow.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'MaskName');
    ceComboRow.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'ParentCombo');
    ceComboRow.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'SpinOptions');
    ceComboRow.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'SpinIncrement');
    ceComboRow.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'DateTimeDef');
    ceComboRow.AddProperty(DisplayMode, 'INVISIBLE PROPERTIES', 'DropdownStyle');

    if DisplayMode.Name = 'Structured' then
    begin
        ceComboRow.AddProperty(DisplayMode, '', 'DisplayRow');
        ceComboRow.AddProperty(DisplayMode, '', 'Visible');
        ceComboRow.AddProperty(DisplayMode, '', 'Height');

        DisplayMode.AddGroup('', 'Control Type Settings', True);
        ceComboRow.AddProperty(DisplayMode, 'Control Type Settings', 'ControlType');

        DisplayMode.AddGroup('Control Type Settings', 'Text box', False);
        ceComboRow.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'HorzAlignment');
        ceComboRow.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'VertAlignment');
        ceComboRow.AddProperty(DisplayMode, 'Control Type Settings.Text box', 'WordWrap');

        DisplayMode.AddGroup('Control Type Settings', 'Picture', False);
        ceComboRow.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'CenterPicture');
        ceComboRow.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'KeepAspectRatio');
        ceComboRow.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'StretchPicture');
        ceComboRow.AddProperty(DisplayMode, 'Control Type Settings.Picture', 'ShrinkPicture');

        DisplayMode.AddGroup('', 'Appearance', True);
        ceComboRow.AddProperty(DisplayMode, 'Appearance', 'Color');
        ceComboRow.AddProperty(DisplayMode, 'Appearance', 'Font');
        ceComboRow.AddProperty(DisplayMode, 'Appearance', 'ParentFont');
        ceComboRow.AddProperty(DisplayMode, 'Appearance', 'Is3D');
    end;
end;

procedure TfrmInspector.ceGridGetPropertiesComponent(Sender: TObject;
  var Component: TPersistent);
begin
    Component := GetDefaultGrid;
end;

procedure TfrmInspector.ceComboGridGetPropertiesComponent(Sender: TObject;
  var Component: TPersistent);
begin
    Component := GetComboDefaultGrid;
end;

procedure TfrmInspector.ceColumnGetPropertiesComponent(Sender: TObject;
  var Component: TPersistent);
begin
    Component := GetDefaultCol;
end;

procedure TfrmInspector.ceComboColumnGetPropertiesComponent(
  Sender: TObject; var Component: TPersistent);
begin
    Component := GetComboDefaultCol;
end;

procedure TfrmInspector.ceRowGetPropertiesComponent(Sender: TObject;
  var Component: TPersistent);
begin
    Component := GetDefaultRow;
end;

procedure TfrmInspector.ceComboRowGetPropertiesComponent(Sender: TObject;
  var Component: TPersistent);
begin
    Component := GetComboDefaultRow;
end;

procedure TfrmInspector.ceCellGetPropertiesComponent(Sender: TObject;
  var Component: TPersistent);
begin
    Component := GetDefaultCell;
end;

procedure TfrmInspector.ceComboCellGetPropertiesComponent(Sender: TObject;
  var Component: TPersistent);
begin
    Component := GetComboDefaultCell;
end;

procedure TfrmInspector.grdExampleEnter(Sender: TObject);
begin
    pnlInspectorWTabs.SendToBack;
end;

procedure TfrmInspector.grdInspectorEnter(Sender: TObject);
begin
    pnlInspectorWTabs.BringToFront;
    pnlInspectorWTabs.Update;
end;

procedure TfrmInspector.grdHeadingEnter(Sender: TObject);
begin
    pnlInspectorWTabs.BringToFront;
    pnlInspectorWTabs.Update;
end;

procedure TfrmInspector.tabInspectorEnter(Sender: TObject);
begin
    pnlInspectorWTabs.BringToFront;
    pnlInspectorWTabs.Update;
end;

procedure TfrmInspector.grdExampleCellChanged_Unbound(Sender: TObject; OldCol,
  NewCol, OldRow, NewRow: Longint);
begin
    grdExampleCellChanged(Sender, OldCol, NewCol, OldRow, NewRow);
end;


procedure TfrmInspector.grdExampleCellChanged(Sender: TObject; OldCol,
  NewCol: Longint; OldRow, NewRow: Variant);
begin
    SetEnablebutLoadPicture;
end;

procedure TfrmInspector.butNewClick(Sender: TObject);
begin
    ResetGrid;
end;

procedure TfrmInspector.ResetGrid;
var
    strMessage: string;
begin
    if CurEditor = GridEditor then
        strMessage := 'Is it ok to reset the current Grid?'
    else
        strMessage := 'Is it ok to reset the current Combo?';

    if MessageDlg(strMessage, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        UnassignComponent(CurEditor);
        if CurEditor = GridEditor then
        begin
            FreeActualValuesGrid;
            CurEditor.grdExample.Reset;
            SetActualValuesGrid;
        end
        else
        begin
            FreeActualValuesCombo;
            CurEditor.grdExample.Reset;
            TtsBaseGrid_(CurEditor.grdExample).Color := CurGridColor;
            SetActualValuesCombo;
        end;

        CurEditor.GetFieldNames;
        CurEditor.SetRightTabsVisible;
        tabInspector.ActivePage := tabInspector.Pages[0];
        tabInspectorChange(Self);

        SetEnableDesignBehaviour;
        SetEnableInvisible;
        SetEnablebutLoadPicture;
    end;
end;

procedure TfrmInspector.SetEnablebutLoadPicture;
begin
    if TtsBaseGrid_(GridEditor.grdExample).ImageList = nil then
        butLoadPicture.Enabled := False
    else if TtsBaseGrid_(CurEditor.grdExample).StoreData then
    begin
        if TtsBaseGrid_(CurEditor.grdExample).Cols <= 0 then
            butLoadPicture.Enabled := False
        else if TtsBaseGrid_(CurEditor.grdExample).Rows <= 0 then
            butLoadPicture.Enabled := False
        else if TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol <= 0 then
            butLoadPicture.Enabled := False
        else if TtsBaseGrid_(CurEditor.grdExample).CurrentDataRow <= 0 then
            butLoadPicture.Enabled := False
        else
            butLoadPicture.Enabled := (CellType(CurEditor, TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol, CurEditor.DesignInfo.CurrentDataRow) = ctPicture)
    end
    else
        butLoadPicture.Enabled := False;

    if butLoadPicture.Enabled then
    begin
        if VarIsEmpty(TtsBaseGrid_(CurEditor.grdExample).Cell[TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol, CurEditor.DesignInfo.CurrentDataRow]) then
            butClearPicture.Enabled := False
        else
            butClearPicture.Enabled := True;
    end
    else
        butClearPicture.Enabled := False;
end;

procedure TfrmInspector.butLoadPictureClick(Sender: TObject);
begin
    SetPicture;
end;

procedure TfrmInspector.SetPicture;
var
    dlgImages: TtsImageListDlg;
    Image: TtsImageItem;
begin
    dlgImages := TtsImageListDlg.Create(Application);

    try
        dlgImages.ImageCollection.Assign(TtsBaseGrid_(GridEditor.grdExample).ImageList.ImageCollection);
        dlgImages.Caption := CurGrid.Name + '.' + TtsBaseGrid_(GridEditor.grdExample).ImageList.Name;
        dlgImages.ItemIndex := TtsBaseGrid_(CurEditor.grdExample).Cell[TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol, CurEditor.DesignInfo.CurrentDataRow];

        if dlgImages.ShowModal = mrOK Then
        begin
            TsDesign.ChangesMade := True;

            TtsBaseGrid_(GridEditor.grdExample).ImageList.ImageCollection.Assign(dlgImages.ImageCollection);
            Image := TtsBaseGrid_(GridEditor.grdExample).ImageList.Image[dlgImages.ItemIndex];
            if Assigned(Image) then
                TtsBaseGrid_(CurEditor.grdExample).Cell[TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol, CurEditor.DesignInfo.CurrentDataRow] := TtsBaseGrid_(GridEditor.grdExample).ImageList.Image[dlgImages.ItemIndex].SetName + '.' + TtsBaseGrid_(GridEditor.grdExample).ImageList.Image[dlgImages.ItemIndex].Name
            else
                TtsBaseGrid_(CurEditor.grdExample).Cell[TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol, CurEditor.DesignInfo.CurrentDataRow] := Unassigned;
            TsDesign.Designer.Modified;
        end;
    finally
        dlgImages.Free;
    end;
    SetEnablebutLoadPicture;
end;

procedure TfrmInspector.butClearPictureClick(Sender: TObject);
begin
    ClearPicture;
end;

procedure TfrmInspector.ClearPicture;
begin
    TtsBaseGrid_(CurEditor.grdExample).Cell[TtsBaseGrid_(CurEditor.grdExample).CurrentDataCol, CurEditor.DesignInfo.CurrentDataRow] := Unassigned;
    SetEnablebutLoadPicture;
end;

procedure TfrmInspector.Panel8MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    grdInspector.SetFocus;
end;

procedure TfrmInspector.butOpenClick(Sender: TObject);
var
    DefaultExt, Filter: string;
begin
    GetDefaultExtandFilter(DefaultExt, Filter);
    OpenDialog1.DefaultExt := DefaultExt;
    OpenDialog1.Filter := Filter;

    OpenDialog1.Options := [ofFileMustExist, ofHideReadOnly, ofNoChangeDir];
    OpenDialog1.Filename := '';
    if OpenDialog1.Execute then
    begin
        UnassignComponent(CurEditor);
        if CurEditor = GridEditor then
        begin
            FreeActualValuesGrid;
            CurEditor.grdExample.LoadFromFile(OpenDialog1.Filename, cmaNone);
            SetActualValuesGrid;
        end
        else
        begin
            FreeActualValuesCombo;
            CurEditor.grdExample.LoadFromFile(OpenDialog1.Filename, cmaNone);
            SetActualValuesCombo;
        end;

        CurEditor.GetFieldNames;
        CurEditor.SetRightTabsVisible;
        tabInspector.ActivePage := tabInspector.Pages[0];
        tabInspectorChange(Self);

        SetEnableDesignBehaviour;
        SetEnableInvisible;
        SetEnablebutLoadPicture;

        TsDesign.Designer.Modified;
    end;
end;

procedure TfrmInspector.GetDefaultExtandFilter(var DefaultExt: string; var Filter: string);
begin
    if CurEditor = ComboEditor then
    begin
        if CurEditor.grdExample is TtsCustomGrid then
        begin
            DefaultExt := 'TCU';
            Filter := 'TtsGrid Combo files (*.tcu)|*.TCU';
        end
        else
        begin
            DefaultExt := 'TCB';
            Filter := 'TtsDBGrid Combo files (*.tcb)|*.TCB';
        end;
    end
    else
    begin
        if CurEditor.grdExample is TtsCustomGrid then
        begin
            DefaultExt := 'TGU';
            Filter := 'TtsGrid files (*.tgu)|*.TGU';
        end
        else
        begin
            DefaultExt := 'TGB';
            Filter := 'TtsDBGrid files (*.tgb)|*.TGB';
        end;
    end;
end;

procedure TfrmInspector.butSaveClick(Sender: TObject);
var
    DefaultExt, Filter: string;
begin
    GetDefaultExtandFilter(DefaultExt, Filter);
    SaveDialog1.DefaultExt := DefaultExt;
    SaveDialog1.Filter := Filter;

    SaveDialog1.Options := [ofFileMustExist, ofHideReadOnly, ofNoChangeDir];
    SaveDialog1.Filename := '';
    if SaveDialog1.Execute then
        CurEditor.grdExample.SaveToFile(SaveDialog1.Filename, TtsBaseGrid_(CurEditor.grdExample).StoreData);
end;

procedure TfrmInspector.ceComponentSetValues(Sender: TObject;
  State: tsScanObjectsState; Component: TPersistent;
  PropertyElement: TtsPropertyElement; strValue: String; Value: Variant;
  ValueSource: tsValueSource; ValueSet: Boolean; var Cancel: Boolean);
var
    ParentComboProperty: TtsPropertyElement;
begin
    if State in [soStart, soScan] then
    begin
        if PropertyElement.Name = 'ButtonType' then
        begin
            if PropertyElement.GetPropertyValue(Component, True) = GetEnumValue(PropertyElement.PropType, 'btCombo') then
            begin
                ParentComboProperty := TtsComponentEditor(Sender).PropertySet.GetItem(['ParentCombo']);
                if not (ParentComboProperty.GetPropertyValue(Component, True) = 1) then
                    ParentComboProperty.SetPropertyValue(Component, 1)
            end;
        end;
    end
    else if State = soEnd then
        SetEnablebutLoadPicture;
end;

procedure TfrmInspector.grdInspectorGetDrawInfo(Sender: TObject; DataCol,
  DataRow: Longint; var DrawInfo: TtsDrawInfo);
var
    ComponentId: string;
begin
    if DataCol <> 2 then exit;

    with grdInspector.InspectorRows[DataRow] do
    begin
        if InspectorElementType = iePropertyElement then
        begin
            if (PropertyElement.ShowPropertyValue = pvShowToggle1) and chkDesignBehaviour.Checked then
            begin
                if (grdInspector.ComponentEditor = ceGrid) or (grdInspector.ComponentEditor = ceComboGrid) then
                begin
                    with grdInspector.ComponentEditor do
                    begin
                        DoGetComponentId(CurEditor.grdExample, ComponentId);
                        if ActualValueSet.GetItem([ComponentId, PropertyElement.Name]) <> nil then
                            DrawInfo.Font.Style := [fsBold];
                    end;
                end;
            end;
        end;
    end;
end;

procedure TfrmInspector.grdInspectorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    HelpKey: string;
begin
    if Key = VK_F1 then
    begin
        HelpKey := GetHelpKey;
        if HelpKey <> '' then
            ShowHelpTopic(Handle, HelpKey)
    end;
end;

function TfrmInspector.GetHelpKey: string;
begin
    result := '';
    if grdInspector.CurrentDataRow <= 0 then exit;

    with grdInspector.InspectorRows[grdInspector.CurrentDataRow] do
    begin
        if InspectorElementType = iePropertyElement then
        begin
            result := PropertyElement.Name;

            if tabInspector.ActivePage = tabRowProperties then
                result := 'Row'+ result
            else if tabInspector.ActivePage = tabCellProperties then
                result := 'Cell'+ result;
        end;
    end;
end;

procedure TfrmInspector.butHelpClick(Sender: TObject);
begin
    ShowHelpTopic(Handle, 'TopGrid Component Editor');
end;

procedure TfrmInspector.ceColumnDestroyComponentSelection(Sender: TObject;
  ComponentSelection: Pointer);
begin
    if ComponentSelection <> nil then
    begin
        PtsGridSelection(ComponentSelection).SelectedFrom.Free;
        PtsGridSelection(ComponentSelection).SelectedTo.Free;
        Dispose(ComponentSelection);
    end;
end;

procedure TfrmInspector.ceRowDestroyComponentSelection(Sender: TObject;
  ComponentSelection: Pointer);
begin
    if ComponentSelection <> nil then
    begin
        PtsGridSelection(ComponentSelection).SelectedFrom.Free;
        PtsGridSelection(ComponentSelection).SelectedTo.Free;
        Dispose(ComponentSelection);
    end;
end;

procedure TfrmInspector.ceCellDestroyComponentSelection(Sender: TObject;
  ComponentSelection: Pointer);
begin
    if ComponentSelection <> nil then
    begin
        PtsGridSelection(ComponentSelection).SelectedFrom.Free;
        PtsGridSelection(ComponentSelection).SelectedTo.Free;
        Dispose(ComponentSelection);
    end;
end;

initialization
begin
end;

finalization
begin
    GridEditor.Free;
    ComboEditor.Free;
end;

end.

unit osGridEditor;

interface

{$INCLUDE TSCmpVer}
//{$DEFINE rtTest}
                  
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, TypInfo, ExtCtrls, Grids_ts, Registry,
  ComCtrls, ToolWin, DB, DBTables, ImgList, Menus, TSGrid, TSDBGrid, TSCommon, TsMask,
  propertyDescs, TSImageList, Buttons, osColorComboBox, TsDateTimeDef
  {$IFNDEF rtTest}
  {$IFDEF TSVER_V6}
     , Variants, ValEdit, DesignIntf, DesignEditors, VCLEditors, TsImageListEditor
  {$ELSE}
     , DsgnIntf, TSImagelistEditor
  {$ENDIF}
  {$ELSE}
  {$IFDEF TSVER_V6}, Variants, ValEdit {$ENDIF}
  {$ENDIF};

const
  SNoMaskDefs = 'Cannot adjust mask properties - please add a TtsMaskDefs component and associate with your grid first!';
  MaxComboRows = 50;
  TG_REGENTRIES = '\Software\ObjectSight\TopGrid\';

type
  TosGridPropertyView = (gpAll, gpFont, gpColor, gpVCL, gpControls, gpBasic, gpHeading, gpDragging, gpBooleans, gpData, gpCustom, gpModified);
  TosColPropertyView = (cpAll, cpHeading, cpBasic, cpControls, cpCustom, cpModified);
  TosPropertyType = (ptEdit, ptSpin, ptBoolean, ptCombo, ptColor, ptButton);

{$IFNDEF rtTest}
  TosGridEditor = class(TComponentEditor)
  public
    procedure GetDatasourceName(const sValue : String);
    procedure GetDateTimeDefName(const sValue : String);
    procedure Edit; override;
    function GetVerbCount: Integer; override;
    function GetVerb(Index: integer): string; override;
    procedure ExecuteVerb(Index: integer); override;
    procedure ApplyDbColumns;
  end;
{$ENDIF}

  TosSelectedColumn = class(TObject)
  private
    FCol : Integer;
    FFieldName : String;
    FHeading  : String;
  protected
  public
    property Col : Integer read FCol write FCol;
    property FieldName : String read FFieldName write FFieldName;
    property Heading : String read FHeading write FHeading;
  end;

  TfmOsGridEditor = class(TForm)
    sampleGrid: TtsGrid;
    tbEditor: TToolBar;
    tbSave: TToolButton;
    tbDeleteColumn: TToolButton;
    Splitter: TSplitter;
    pgEditor: TPageControl;
    tsAdvanced: TTabSheet;
    tsCommon: TTabSheet;
    tsColumns: TTabSheet;
    pnPropertyEditor: TPanel;
    veEditor: TtsGrid;
    Panel2: TPanel;
    Label2: TLabel;
    cbPropertyView: TComboBox;
    sbStatus: TStatusBar;
    gbProperty: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edPropertyValue: TEdit;
    cbBoolean: TComboBox;
    cbEnum: TComboBox;
    gbColumn: TGroupBox;
    gbFields: TGroupBox;
    lbFields: TListBox;
    Panel1: TPanel;
    veColEditor: TtsGrid;
    Panel3: TPanel;
    Label7: TLabel;
    edColHeading: TEdit;
    Label8: TLabel;
    cbColPropertyView: TComboBox;
    pmOptions: TPopupMenu;
    ilImages: TImageList;
    ilHotImages: TImageList;
    ToolButton1: TToolButton;
    tbClose: TToolButton;
    ToolButton2: TToolButton;
    tbAddColumn: TToolButton;
    dgFont: TFontDialog;
    rgGridMode: TRadioGroup;
    gbFont: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    laFontSummary: TLabel;
    Label10: TLabel;
    laHeadingFontSummary: TLabel;
    pmReset: TPopupMenu;
    miResetGridProperty: TMenuItem;
    miResetAllGridProperties: TMenuItem;
    N1: TMenuItem;
    miResetColumnProperty: TMenuItem;
    miResetAllColumnProperties: TMenuItem;
    gbMisc: TGroupBox;
    chShowEditor: TCheckBox;
    chHeadingOn: TCheckBox;
    chShowFocus: TCheckBox;
    chRowBarOn: TCheckBox;
    chWantTabs: TCheckBox;
    laFocusColor: TLabel;
    laFocusFontColor: TLabel;
    gbLayout: TGroupBox;
    udDefaultRowHeight: TUpDown;
    udDefaultColWidth: TUpDown;
    Label4: TLabel;
    cbGridLines: TComboBox;
    Label13: TLabel;
    cbVertAlignment: TComboBox;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    cbColSelect: TComboBox;
    cbRowSelect: TComboBox;
    btAddAllColumns: TButton;
    tsCombos: TTabSheet;
    cbControlType: TComboBox;
    cbButtonType: TComboBox;
    Label14: TLabel;
    Label15: TLabel;
    chColMoving: TCheckBox;
    chRowMoving: TCheckBox;
    tbReset: TToolButton;
    sampleDbGrid: TtsDBGrid;
    cbMask: TComboBox;
    tbRightJustify: TToolButton;
    tbLeftJustify: TToolButton;
    tbCenterJustify: TToolButton;
    ToolButton7: TToolButton;
    tbDefaultJustify: TToolButton;
    ToolButton3: TToolButton;
    qyTest: TQuery;
    DataSource1: TDataSource;
    btCustomMasks: TSpeedButton;
    btEditCustomColProperties: TSpeedButton;
    btCustomGridEdit: TSpeedButton;
    btEditMask: TSpeedButton;
    gbCombos: TGroupBox;
    lbCombos: TListBox;
    gdTest: TtsDBGrid;
    gbCombo: TGroupBox;
    AddCombo1: TMenuItem;
    RemoveCombo1: TMenuItem;
    pgCombo: TPageControl;
    tsComboData: TTabSheet;
    tsGridProperties: TTabSheet;
    tsComboColumns: TTabSheet;
    gdComboData: TtsGrid;
    veComboProperties: TtsGrid;
    pnComboColumnUd: TPanel;
    udComboFields: TUpDown;
    tbSaveFile: TToolButton;
    tbOpenFile: TToolButton;
    ToolButton6: TToolButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    N2: TMenuItem;
    miAddColumn: TMenuItem;
    RemoveColumn1: TMenuItem;
    N3: TMenuItem;
    miClearAllColumns: TMenuItem;
    GroupBox2: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    edCols: TEdit;
    edRows: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    btInsertField: TBitBtn;
    btAddField: TBitBtn;
    moPropertyDesc: TMemo;
    Splitter1: TSplitter;
    tsRowProperties: TTabSheet;
    tsCellProperties: TTabSheet;
    gbRow: TGroupBox;
    veRowEditor: TtsGrid;
    btShowHiddenRows: TButton;
    gbCell: TGroupBox;
    veCellEditor: TtsGrid;
    cbGridColor: TosColorComboBox;
    cbHeadingColor: TosColorComboBox;
    cbFocusColor: TosColorComboBox;
    cbFocusFontColor: TosColorComboBox;
    cbColors: TosColorComboBox;
    edDefaultRowHeight: TEdit;
    Label27: TLabel;
    edDefaultColWidth: TEdit;
    Label28: TLabel;
    tbSetPicture: TToolButton;
    tbClearPicture: TToolButton;
    ToolButton8: TToolButton;
    chStoreData: TCheckBox;
    chGridMenu: TCheckBox;
    chPrintTotals: TCheckBox;
    tsComboColProperties: TTabSheet;
    veComboColEditor: TtsGrid;
    Panel5: TPanel;
    lbColumns2: TListBox;
    chColPropertiesShortList: TCheckBox;
    Panel6: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label16: TLabel;
    chAutoFill: TCheckBox;
    chValueColSorted: TCheckBox;
    cbConvertCase: TComboBox;
    cbCompareType: TComboBox;
    cbAutoSearch: TComboBox;
    cbComboDataSource: TComboBox;
    edValueCol: TEdit;
    edDropDownRows: TEdit;
    edDropDownCols: TEdit;
    udDropDownCols: TUpDown;
    udDropDownRows: TUpDown;
    udValueCol: TUpDown;
    chAutoLookup: TCheckBox;
    cbDropDownStyle: TComboBox;
    chComboStoreData: TCheckBox;
    N4: TMenuItem;
    miResetGridColumns: TMenuItem;
    miSortedFieldList: TMenuItem;
    pnTop: TPanel;
    pnIndicator: TPanel;
    chParentCombo: TCheckBox;
    miAddRow: TMenuItem;
    miRemoveRow: TMenuItem;
    pnComboColumns: TPanel;
    lbAllComboFields: TListBox;
    btAddComboColumn: TButton;
    btRemoveComboColumn: TButton;
    lbComboFields: TListBox;

    procedure FormCreate(Sender: TObject);
    procedure veEditorEndCellEdit(Sender: TObject; DataCol,
      DataRow: Integer; var Cancel: Boolean);
    procedure veEditorComboDropDown(Sender: TObject; Combo: TtsComboGrid;
      DataCol, DataRow: Integer);
    procedure veEditorComboCellLoaded(Sender: TObject; Combo: TtsComboGrid;
      DataCol, DataRow: Integer; var Value: Variant);
    procedure veEditorDblClick(Sender: TObject);
    procedure cbPropertyViewChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure veEditorCellChanged(Sender: TObject; OldCol, NewCol, OldRow,
      NewRow: Integer);
    procedure veEditorComboInit(Sender: TObject; Combo: TtsComboGrid;
      DataCol, DataRow: Integer);
    procedure veEditorComboGetValue(Sender: TObject; Combo: TtsComboGrid;
      GridDataCol, GridDataRow, ComboDataRow: Integer; var Value: Variant);
    procedure veEditorRowChanged(Sender: TObject; OldRow, NewRow: Integer);
    procedure edPropertyValueKeyPress(Sender: TObject; var Key: Char);
    procedure edPropertyValueExit(Sender: TObject);
    procedure cbBooleanChange(Sender: TObject);
    procedure cbBooleanEnter(Sender: TObject);
    procedure cbBooleanExit(Sender: TObject);
    procedure cbEnumEnter(Sender: TObject);
    procedure cbEnumExit(Sender: TObject);
    procedure cbEnumChange(Sender: TObject);
    procedure sampleGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btAddFieldClick(Sender: TObject);
    procedure edColHeadingChange(Sender: TObject);
    procedure edColHeadingEnter(Sender: TObject);
    procedure edColHeadingExit(Sender: TObject);
    procedure lbFieldsDblClick(Sender: TObject);
    procedure cbColPropertyViewClick(Sender: TObject);
    procedure tbCloseClick(Sender: TObject);
    procedure veEditorButtonClick(Sender: TObject; DataCol,
      DataRow: Integer);
    procedure tbDeleteColumnClick(Sender: TObject);
    procedure veColEditorButtonClick(Sender: TObject; DataCol,
      DataRow: Integer);
    procedure tbAddColumnClick(Sender: TObject);
    procedure veColEditorComboDropDown(Sender: TObject;
      Combo: TtsComboGrid; DataCol, DataRow: Integer);
    procedure veColEditorComboGetValue(Sender: TObject;
      Combo: TtsComboGrid; GridDataCol, GridDataRow, ComboDataRow: Integer;
      var Value: Variant);
    procedure veColEditorComboCellLoaded(Sender: TObject;
      Combo: TtsComboGrid; DataCol, DataRow: Integer; var Value: Variant);
    procedure veColEditorComboInit(Sender: TObject; Combo: TtsComboGrid;
      DataCol, DataRow: Integer);
    procedure tbSaveClick(Sender: TObject);
    procedure rgGridModeClick(Sender: TObject);
    procedure laFontSummaryDblClick(Sender: TObject);
    procedure laHeadingFontSummaryDblClick(Sender: TObject);
    procedure pgEditorChange(Sender: TObject);
    procedure chShowEditorClick(Sender: TObject);
    procedure chShowFocusClick(Sender: TObject);
    procedure chHeadingOnClick(Sender: TObject);
    procedure chRowBarOnClick(Sender: TObject);
    procedure chWantTabsClick(Sender: TObject);
    procedure cbVertAlignmentChange(Sender: TObject);
    procedure cbGridLinesChange(Sender: TObject);
    procedure sampleGridCellLoaded(Sender: TObject; DataCol,
      DataRow: Integer; var Value: Variant);
    procedure sampleGridColResized(Sender: TObject; RowColnr: Integer);
    procedure cbColSelectChange(Sender: TObject);
    procedure cbRowSelectChange(Sender: TObject);
    procedure veColEditorEndCellEdit(Sender: TObject; DataCol,
      DataRow: Integer; var Cancel: Boolean);
    procedure btAddAllColumnsClick(Sender: TObject);
    procedure miResetGridPropertyClick(Sender: TObject);
    procedure miResetAllGridPropertiesClick(Sender: TObject);
    procedure miResetColumnPropertyClick(Sender: TObject);
    procedure miResetAllColumnPropertiesClick(Sender: TObject);
    procedure pmResetPopup(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure sampleGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sampleGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sampleGridKeyPress(Sender: TObject; var Key: Char);
    procedure cbControlTypeChange(Sender: TObject);
    procedure cbButtonTypeChange(Sender: TObject);
    procedure chColMovingClick(Sender: TObject);
    procedure chRowMovingClick(Sender: TObject);
    procedure sampleDbGridColResized(Sender: TObject; RowColnr: Integer);
    procedure FormShow(Sender: TObject);
    procedure btCustomGridEditClick(Sender: TObject);
    procedure btEditCustomColPropertiesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SplitterMoved(Sender: TObject);
    procedure edDefaultRowHeightExit(Sender: TObject);
    procedure edDefaultColWidthExit(Sender: TObject);
    procedure edDefaultColWidthKeyPress(Sender: TObject; var Key: Char);
    procedure edDefaultRowHeightKeyPress(Sender: TObject; var Key: Char);
    procedure tbLeftJustifyClick(Sender: TObject);
    procedure tbCenterJustifyClick(Sender: TObject);
    procedure tbRightJustifyClick(Sender: TObject);
    procedure tbDefaultJustifyClick(Sender: TObject);
    procedure sampleDbGridColMoved(Sender: TObject; ToDisplayCol,
      Count: Integer; ByUser: Boolean);
    procedure sampleDbGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbMaskKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btEditMaskClick(Sender: TObject);
    procedure cbMaskClick(Sender: TObject);
    procedure cbMaskExit(Sender: TObject);
    procedure btCustomMasksClick(Sender: TObject);
    procedure AddCombo1Click(Sender: TObject);
    procedure RemoveCombo1Click(Sender: TObject);
    procedure lbCombosClick(Sender: TObject);
    procedure edDropDownColsChange(Sender: TObject);
    procedure edValueColChange(Sender: TObject);
    procedure edDropDownRowsChange(Sender: TObject);
    procedure chValueColSortedClick(Sender: TObject);
    procedure chAutoFillClick(Sender: TObject);
    procedure cbConvertCaseChange(Sender: TObject);
    procedure cbCompareTypeChange(Sender: TObject);
    procedure cbAutoSearchChange(Sender: TObject);
    procedure chAutoLookupClick(Sender: TObject);
    procedure cbDropDownStyleChange(Sender: TObject);
    procedure chComboStoreDataClick(Sender: TObject);
    procedure cbComboDataSourceClick(Sender: TObject);
    procedure gdComboDataCellLoaded(Sender: TObject; DataCol,
      DataRow: Integer; var Value: Variant);
    procedure gdComboDataColResized(Sender: TObject; RowColnr: Integer);
    procedure veComboPropertiesButtonClick(Sender: TObject; DataCol,
      DataRow: Integer);
    procedure veComboPropertiesEndCellEdit(Sender: TObject; DataCol,
      DataRow: Integer; var Cancel: Boolean);
    procedure veComboPropertiesComboDropDown(Sender: TObject;
      Combo: TtsComboGrid; DataCol, DataRow: Integer);
    procedure veComboPropertiesComboCellLoaded(Sender: TObject;
      Combo: TtsComboGrid; DataCol, DataRow: Integer; var Value: Variant);
    procedure veComboPropertiesComboGetValue(Sender: TObject;
      Combo: TtsComboGrid; GridDataCol, GridDataRow, ComboDataRow: Integer;
      var Value: Variant);
    procedure veComboPropertiesComboInit(Sender: TObject;
      Combo: TtsComboGrid; DataCol, DataRow: Integer);
    procedure pgComboChange(Sender: TObject);
    procedure btAddComboColumnClick(Sender: TObject);
    procedure lbAllComboFieldsClick(Sender: TObject);
    procedure lbComboFieldsClick(Sender: TObject);
    procedure lbAllComboFieldsDblClick(Sender: TObject);
    procedure btRemoveComboColumnClick(Sender: TObject);
    procedure lbComboFieldsDblClick(Sender: TObject);
    procedure udComboFieldsClick(Sender: TObject; Button: TUDBtnType);
    procedure gdComboDataEndCellEdit(Sender: TObject; DataCol,
      DataRow: Integer; var Cancel: Boolean);
    procedure tbOpenFileClick(Sender: TObject);
    procedure tbSaveFileClick(Sender: TObject);
    procedure veColEditorDblClick(Sender: TObject);
    procedure veComboPropertiesDblClick(Sender: TObject);
    procedure miAddColumnClick(Sender: TObject);
    procedure RemoveColumn1Click(Sender: TObject);
    procedure miClearAllColumnsClick(Sender: TObject);
    procedure edColsExit(Sender: TObject);
    procedure edRowsExit(Sender: TObject);
    procedure edColsKeyPress(Sender: TObject; var Key: Char);
    procedure edRowsKeyPress(Sender: TObject; var Key: Char);
    procedure udDefaultRowHeightClick(Sender: TObject; Button: TUDBtnType);
    procedure udDefaultColWidthClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Exit(Sender: TObject);
    procedure gdComboDataInsertRow(Sender: TObject; DataRow: Integer;
      ByUser: Boolean);
    procedure sampleGridEndCellEdit(Sender: TObject; DataCol,
      DataRow: Integer; var Cancel: Boolean);
    procedure gdComboDataDeleteRow(Sender: TObject; DataRow: Integer;
      ByUser: Boolean);
    procedure btInsertFieldClick(Sender: TObject);
    procedure tsAdvancedResize(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure cbMaskDropDown(Sender: TObject);
    procedure cbMaskCloseUp(Sender: TObject);
    procedure veRowEditorButtonClick(Sender: TObject; DataCol,
      DataRow: Integer);
    procedure sampleGridRowChanged(Sender: TObject; OldRow,
      NewRow: Integer);
    procedure veRowEditorComboCellLoaded(Sender: TObject;
      Combo: TtsComboGrid; DataCol, DataRow: Integer; var Value: Variant);
    procedure veRowEditorComboDropDown(Sender: TObject;
      Combo: TtsComboGrid; DataCol, DataRow: Integer);
    procedure veRowEditorComboGetValue(Sender: TObject;
      Combo: TtsComboGrid; GridDataCol, GridDataRow, ComboDataRow: Integer;
      var Value: Variant);
    procedure veRowEditorComboInit(Sender: TObject; Combo: TtsComboGrid;
      DataCol, DataRow: Integer);
    procedure veRowEditorDblClick(Sender: TObject);
    procedure veRowEditorEndCellEdit(Sender: TObject; DataCol,
      DataRow: Integer; var Cancel: Boolean);
    procedure btShowHiddenRowsClick(Sender: TObject);
    procedure sampleGridCellChanged(Sender: TObject; OldCol, NewCol,
      OldRow, NewRow: Integer);
    procedure sampleDbGridCellChanged(Sender: TObject; OldCol,
      NewCol: Integer; OldRow, NewRow: Variant);
    procedure sampleGridColMoved(Sender: TObject; ToDisplayCol,
      Count: Integer; ByUser: Boolean);
    procedure veCellEditorButtonClick(Sender: TObject; DataCol,
      DataRow: Integer);
    procedure veCellEditorComboCellLoaded(Sender: TObject;
      Combo: TtsComboGrid; DataCol, DataRow: Integer; var Value: Variant);
    procedure veCellEditorComboDropDown(Sender: TObject;
      Combo: TtsComboGrid; DataCol, DataRow: Integer);
    procedure veCellEditorComboGetValue(Sender: TObject;
      Combo: TtsComboGrid; GridDataCol, GridDataRow, ComboDataRow: Integer;
      var Value: Variant);
    procedure veCellEditorDblClick(Sender: TObject);
    procedure veCellEditorEndCellEdit(Sender: TObject; DataCol,
      DataRow: Integer; var Cancel: Boolean);
    procedure cbHeadingColorClick(Sender: TObject);
    procedure cbGridColorClick(Sender: TObject);
    procedure cbFocusColorClick(Sender: TObject);
    procedure cbFocusFontColorClick(Sender: TObject);
    procedure cbColorsClick(Sender: TObject);
    procedure sampleDbGridHeadingClick(Sender: TObject; DataCol: Integer);
    procedure sampleGridHeadingClick(Sender: TObject; DataCol: Integer);
    procedure tbSetPictureClick(Sender: TObject);
    procedure tbClearPictureClick(Sender: TObject);
    procedure chStoreDataClick(Sender: TObject);
    procedure chGridMenuClick(Sender: TObject);
    procedure chPrintTotalsClick(Sender: TObject);
    procedure veComboColEditorButtonClick(Sender: TObject; DataCol,
      DataRow: Integer);
    procedure lbColumns2Click(Sender: TObject);
    procedure veComboColEditorComboDropDown(Sender: TObject;
      Combo: TtsComboGrid; DataCol, DataRow: Integer);
    procedure veComboColEditorComboGetValue(Sender: TObject;
      Combo: TtsComboGrid; GridDataCol, GridDataRow, ComboDataRow: Integer;
      var Value: Variant);
    procedure veComboColEditorComboInit(Sender: TObject;
      Combo: TtsComboGrid; DataCol, DataRow: Integer);
    procedure veComboColEditorDblClick(Sender: TObject);
    procedure veComboColEditorEndCellEdit(Sender: TObject; DataCol,
      DataRow: Integer; var Cancel: Boolean);
    procedure chColPropertiesShortListClick(Sender: TObject);
    procedure miResetGridColumnsClick(Sender: TObject);
    procedure miSortedFieldListClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sampleDbGridTopLeftChanged(Sender: TObject; OldCol: Integer;
      OldRow: Variant; NewCol: Integer; NewRow: Variant; ByUser: Boolean);
    procedure sampleGridTopLeftChanged(Sender: TObject; OldCol, OldRow,
      NewCol, NewRow: Integer; ByUser: Boolean);
    procedure veColEditorRowChanged(Sender: TObject; OldRow,
      NewRow: Integer);
    procedure veCellEditorRowChanged(Sender: TObject; OldRow,
      NewRow: Integer);
    procedure veRowEditorRowChanged(Sender: TObject; OldRow,
      NewRow: Integer);
    procedure chParentComboClick(Sender: TObject);
    procedure miAddRowClick(Sender: TObject);
    procedure miRemoveRowClick(Sender: TObject);
    procedure pmOptionsPopup(Sender: TObject);
    procedure sampleGridRowMoved(Sender: TObject; ToDisplayRow,
      Count: Integer; ByUser: Boolean);
    procedure lbFieldsClick(Sender: TObject);
    procedure tsComboColumnsResize(Sender: TObject);
    procedure UpDown2Changing(Sender: TObject; var AllowChange: Boolean);
    procedure gdComboDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    FSelectedCol, FSelectedColProperty : Integer;
    FSelectedRow, FSelectedRowProperty, FSelectedCellProperty : Integer;
    FSelectedCombo : TtsCombo;
    FTargetGrid : TtsBaseGrid;
    FColumnsChanged, FColPropertiesRefresh, FRowPropertiesRefresh, FCellPropertiesRefresh : Boolean;
    FStartup, FBinding, FSelecting : Boolean;

    procedure OpenGridFile;
    procedure SaveGridFile;
    procedure ResetWindowState;
    procedure SaveWindowState;

    // Grid Routines
    procedure BindGridProperty(DataRow : Integer);
    procedure BindGridVarProperty(PropertyName : String; Value : Variant);
    procedure LoadCustomGridProperties;
    function  GetGridPropertyType(sPropName : String) : TosPropertyType;
    procedure GetDefaultExtendFilter(var DefaultExt: string; var Filter: string);
    procedure RefreshPropertyDisplay(DataRow : Integer);
    procedure UpdatePropertyFromEdit;
    procedure UpdatePropertyFromColor;
    procedure UpdatePropertyFromBoolean;
    procedure UpdatePropertyFromEnum;
    function  GetDataBound : Boolean;
    procedure SetupPropertyLists;
    function LoadEnumList(anObject : TPersistent; sProperty : String) : Integer;
    procedure GridModified;
    function  GetDemoGridPropertyValue(PropertyName : String) : Variant;
    procedure RefreshGridProperties;
    function GetGridPropertyValueText(forEditor : TtsGrid; AnObject: TComponent; PropertyName: String ) : String;
    procedure SetFieldSort(aValue : Boolean);
    function GetFieldSort : Boolean;
    function GetGridView : String;
    procedure SetGridView(aValue : String);
    function GetColumnView : String;
    procedure SetColumnView(aValue : String);

    // Test routines for property displays
    function TestGridPropertyView(sPropertyName : String) : Boolean;
    function TestGridColorProperty(PropertyName : String) : Boolean;
    function TestColPropertyView(sPropertyName : String) : Boolean;
    function TestComboPropertyView(sPropertyName : String) : Boolean;
    function TestColColorProperty(PropertyName : String) : Boolean;
    function TestGridBooleanProperty(PropertyName : String) : Boolean;
    function TestComboBooleanProperty(PropertyName : String) : Boolean;
    function TestColBooleanProperty(PropertyName : String) : Boolean;

    // Col and Field Routines
    function  GetSelectedtsCol : TtsCol;
    procedure LoadCustomColProperties;
    procedure BindColProperty(DataRow : Integer);
    procedure BindColVarProperty(PropertyName : String; Value : Variant);
    function  GetColPropertyValueText(PropertyName: String; forRow : Integer) : String;
    procedure UpdateColPropertyFromEnum;
    procedure HideColumn;
    procedure ShowColumn;
    procedure AddModifiedColProperty(sPropertyName : String);
    function  SourceColFor(aCol : TtsCol) : TtsCol;
    procedure SetColJustification;
    procedure SetColumnsProperty(sPropName : String; Value : Variant);
    procedure SetSelectedCol(Value : Integer);
    procedure AdustColumnButtons;
    procedure ClearFieldNames;
    procedure LoadFieldNames;
    procedure LoadSelectableFields;
    procedure ReloadSelectableFields;
    function  FieldInGrid(sFieldname : String) : Boolean;
    function  AddField : Boolean;
    function  InsertField : Boolean;
    function  FieldForName(sFieldName : String) : TField;
    procedure AddBlankColumn;
    procedure IncCols;    
    procedure RemoveCol;
    procedure RemoveSelectedCols;
    function  ReplaceDbField(sFieldName : String) : Boolean;
    function  GetColPropertyType(sPropName : String) : TosPropertyType;
    procedure RefreshColProperties;
    procedure SetSelectedColProperty(aValue : Integer);

    // Row Properties Routines
    procedure BindRowProperty(PropertyName : String; Value : Variant);
    function  GetRowProperty(PropertyName : String) : Variant;
    procedure RefreshRowProperties;
    procedure RefreshRowProperty(PropertyName : String);
    procedure SetSelectedRow(Value : Integer);
   // function  TextToButtonType(Value : String) : TtsButtonType;
    function  ButtonTypeToText(Value : TtsButtonType) : String;
   // function  TextToControlType(Value : String) : TtsControlType;
    function  ReadOnlyToText(Value : TtsReadOnly) : String;
    function  ControlTypeToText(Value : TtsControlType) : String;
    function  HorzAlignmentToText(Value : TtsHorzAlignment) : String;
    function  VertAlignmentToText(Value : TtsVertAlignment) : String;
    function  WordWrapToText(Value : TtsWordWrap) : String;
    function  DrawOptionToText(Value : TtsDrawOption) : String;
    function  DropDownStyleToText(Value : TtsDropDownStyle) : String;
    function  SpinOptionToText(Value : TtsSpinOptions) : String;
    procedure SetSelectedRowProperty(aValue : Integer);

    // Cell Properties Routines
    procedure AddCellCombo;
    procedure RemoveCellCombo;
    procedure RefreshCellProperties;
    procedure RefreshCellProperty(PropertyName : String);
    function  GetCellProperty(PropertyName : String) : Variant;
    procedure BindCellProperty(PropertyName : String; Value : Variant);
    function  ComboCellText : String;
    procedure SetEnablebutLoadPicture;
    function  CellType(DataCol: integer; DataRow: variant): TtsControlType;
    {$IFNDEF rtTest}
    procedure SetPicture;
    procedure ClearPicture;
    {$ENDIF}
    procedure SetSelectedCellProperty(aValue : Integer);

    // Combo procedures
    procedure BindComboProperty(DataRow : Integer);
    procedure SetSelectedCombo(Value : TtsCombo);
    function  GetSelectedCombo : TtsCombo;
    procedure RefreshComboProperties;
    function  GetComboPropertyValueText(PropertyName: String ) : String;
    procedure EnableComboControls(bEnabled : Boolean);
    procedure AddCombo(toCol : TtsCol);
    procedure RemoveCombo(toCol : TtsCol);
    procedure SelectItemCombo;
    procedure ExtractColRow(var DataCol, DataRow : Integer; CellText : String);
    procedure ResetComboGrid;
    procedure LoadComboDataSources;
    function  ComboIndex(aCol : TtsCol) : Integer;
    procedure AdjustComboProperties;
    function  GetFullName(aComponent : TComponent) : String;
    procedure ClearComboProperties;
    procedure EnsureCombos;
    procedure SetComboDataSource;
    procedure LoadComboDataBookmarks(fromDataSet : TDataSet);
    procedure ResetComboColumns;
    procedure CheckCombos;
    function  ComboLookupDataSet : TDataSet;
    procedure AdjustComboFieldButtons;
    procedure UpdateComboPropertyFromEnum;
    function  GetComboPropertyType(sPropName : String) : TosPropertyType;
    procedure ResetComboColProperties;
    procedure RefreshComboColProperties;
    function  TestComboColPropertyView(sPropName : String) : Boolean;
    function  GetComboColPropertyValueText(PropertyName: String ) : String;
    function  GetComboColPropertyType(sPropName : String) : TosPropertyType;
    procedure BindComboColProperty(DataRow : Integer);

    // General routines
    procedure Apply;
    procedure Initialize;
    procedure MoveTo(DataCol : Integer; DataRow : Variant);
    function  XforCol(DisplayCol : Integer) : Integer;
    procedure AdjustToolbar;
    procedure AdjustFieldButtons;
    procedure AdjustFocusColors;
    function  FontDisplay(aFont : TFont) : String;
    procedure AdjustCommonProperties;
    procedure SetTargetGrid(Value : TtsBaseGrid);
    procedure SetPropertyValueText(AnObject: TPersistent; PropertyName: String; value: variant);
    function  FullColorName(colorValue : String) : String;

    // Get Sample Grid Property functions
    function GetGridMode : TtsGridMode;
    function GetGridFont : TFont;
    function GetGridHeadingFont : TFont;
    function GetGridHeadingColor : TColor;
    function GetGridColor : TColor;
    //function GetGridDisplayColnr(iCol : Integer) : Integer;
    function GetGridDataColnr(iDisplayCol : Integer) : Integer;
    function GetGridCol(iCol : Integer) : TtsCol;
    function GetGridCurrentDataRow : Variant;
    function GetGridLeftCol : Integer;
    function GetGridFixedColCount : Integer;
    function GetGridCols : Integer;
    function GetGridSelectedCols : TtsSelection;
    function GetGridRows : Integer;
    function GetGridDefaultColWidth : Integer;
    function GetGridDefaultRowHeight : Integer;

    // Mask routines
    procedure LoadSystemMasks;
    function  IndexOfMask(sName : String) : Integer;
    procedure AppendCustomMasks;
    procedure AppendTtsMaskMasks;
    function  AddMaskEntry(sName, sPicture : String; bSystem : Boolean) : TosMaskEntry;
    function  AddMask(theMask : TosMaskEntry) : Boolean;
    procedure DefineNewMask;
    procedure EditMask(anEntry : TosMaskEntry);
    procedure SetMask;
    function  SourceMaskDefs : TtsMaskDefs;
    procedure PostionOnMaskName;
    procedure AdjustMaskCombo(sName : String);
  public
    { Public declarations }

    property  SelectedRow : Integer read FSelectedRow write SetSelectedRow;
    property  SelectedCol : Integer read FSelectedCol write SetSelectedCol;
    property  SelectedColProperty : Integer read FSelectedColProperty write SetSelectedColProperty;
    property  SelectedtsCol : TtsCol read GetSelectedtsCol;
    property  SelectedCombo : TtsCombo read GetSelectedCombo write SetSelectedCombo;
    property  SelectedRowProperty : Integer read FSelectedRowProperty write SetSelectedRowProperty;
    property  SelectedCellProperty : Integer read FSelectedCellProperty write SetSelectedCellProperty;
    property  DataBound : Boolean read GetDataBound;
    property  ColumnView : String read GetColumnView write SetColumnView;
    property  GridView : String read GetGridView write SetGridView;
    property  TargetGrid : TtsBaseGrid read FTargetGrid write SetTargetGrid;
  end;

function  BooleanToStr(Value : Boolean) : String;
procedure RunTimeEditor(aGrid : TtsBaseGrid);
procedure ApplyChanges;
procedure CustomAssign(tgtGrid, srcGrid : TtsBaseGrid);
procedure CustomColumnDbAssign(tgtGrid, srcGrid : TtsDbGrid);
procedure CustomColumnAssign(tgtGrid, srcGrid : TtsGrid);
procedure CustomRowAssign(tgtGrid, srcGrid : TtsGrid);
procedure CustomCellAssign(tgtGrid, srcGrid : TtsGrid);

{$IFNDEF TSVER_V5}
function GetPropValue(Instance: TObject; const PropName: string;
  PreferStrings: Boolean = True): Variant;
procedure SetPropValue(Instance: TObject; const PropName: string;
  const Value: Variant);
function PropType(Instance: TObject; const PropName: string): TTypeKind;
function GetEnumProp(Instance: TObject; const PropName: string): string;
function GetEnumProp2(Instance: TObject; PropInfo: PPropInfo): string;
function PropertyIsBoolean(Instance: TObject; const PropName: string) : Boolean;
{$ENDIF}

var
  fmOsGridEditor : TfmOsGridEditor;
  demoGrid : TtsBaseGrid;
  ControlProperties, BasicProperties, VCLProperties, EnumList, FieldNames, DataProperties : TStringList;
  ColControlProperties, ColBasicProperties, ColCustomProperties : TStringList;
  GridCustomProperties, GridModifiedProperties, ColModifiedProperties : TStringList;
  comboDataBookmarks, comboGridProperties : TStringList;
  lsDataSources, lsDateTimeDefs : TStringList;

  StartedFromDesigntime: Boolean = False;
  DesignActivatesFirstTime: Boolean = True;
  FirstActivate: Boolean = False;
  PrevLeft: Integer = 0;
  PrevTop: Integer = 0;
  PrevWidth: Integer = 0;
  PrevHeight: Integer = 0;
  PrevState: TWindowState = wsNormal;
  SourceGrid: TtsBaseGrid = nil;
  SaveResult : Boolean;
  srcFieldNames : TStringList;

implementation

uses {$IFDEF TSVER_V6} Types, {$ENDIF}
     duCustomGridProperties, duCustomColProperties, duDefineMask, duCustomMasks, duSpinOptions;

type
    TtsBaseGrid_ = class(TtsBaseGrid) end;
    TtsCustomGrid_ = class(TtsCustomGrid) end;
    TtsCustomDBGrid_ = class(TtsCustomDBGrid) end;

{TosGridEditor}

{$IFNDEF TSVER_V5}
function PropType(Instance: TObject; const PropName: string): TTypeKind;
var pInfo : PPropInfo;
begin
  pInfo := GetPropInfo(PTypeInfo(Instance.ClassInfo), PropName);
  Result := pInfo^.PropType^^.Kind;
end;

function GetPropValue(Instance: TObject; const PropName: string;
  PreferStrings: Boolean = True): Variant;
var pInfo : PPropInfo;
    sEnumText : String;
    iVal : Integer;
begin
  pInfo := GetPropInfo(PTypeInfo(Instance.ClassInfo), PropName);
  if pInfo = Nil then
     raise Exception.Create('Unable to locate property ' + PropName);
  if (PropType(Instance, PropName) = tkEnumeration) then
  begin
     iVal := GetOrdProp(Instance, pInfo);
     sEnumText := GetEnumName(pInfo^.PropType^, iVal);
     Result := sEnumText;
  end
  else if (PropType(Instance, PropName) = tkInteger) then
     Result := GetOrdProp(Instance, pInfo)
  else if (PropType(Instance, PropName) = tkClass) then
     Result := GetOrdProp(Instance, pInfo)
  else if (PropType(Instance, PropName) = tkLString) or
          (PropType(Instance, PropName) = tkWString) then
     Result := GetStrProp(Instance, pInfo)
  else
     Result := GetVariantProp(Instance, pInfo);
end;

procedure SetPropValue(Instance: TObject; const PropName: string;
  const Value: Variant);
var pInfo : PPropInfo;
    iEnumValue : Integer;
begin
  pInfo := GetPropInfo(PTypeInfo(Instance.ClassInfo), PropName);
  if pInfo = Nil then
     raise Exception.Create('Unable to locate property ' + PropName);
  if (PropType(Instance, PropName) = tkEnumeration) then
  begin
    iEnumValue := GetEnumValue(pInfo^.PropType^, Value);
    SetOrdProp(Instance, pInfo, iEnumValue)
  end
  else if (PropType(Instance, PropName) = tkInteger) then
     SetOrdProp(Instance, pInfo, Value)
  else if (PropType(Instance, PropName) = tkClass) then
     SetOrdProp(Instance, pInfo, Value)
  else if (PropType(Instance, PropName) = tkLString) or
          (PropType(Instance, PropName) = tkWString) then
     SetStrProp(Instance, pInfo, Value)
  else
     SetVariantProp(Instance, pInfo, Value);
end;

function GetEnumProp(Instance: TObject; const PropName: string): string;
var pInfo : PPropInfo;
begin
  pInfo := GetPropInfo(PTypeInfo(Instance.ClassInfo), PropName);
  if pInfo = Nil then
     raise Exception.Create('Unable to locate property ' + PropName);
  Result := GetEnumProp2(Instance, pInfo);
end;

function GetEnumProp2(Instance: TObject; PropInfo: PPropInfo): string;
begin
  Result := GetEnumName(PropInfo^.PropType^, GetOrdProp(Instance, PropInfo));
end;

function PropertyIsBoolean(Instance: TObject; const PropName: string) : Boolean;
var pInfo : PPropInfo;
begin
  pInfo := GetPropInfo(PTypeInfo(Instance.ClassInfo), PropName);
  if pInfo = Nil then
     raise Exception.Create('Unable to locate property ' + PropName);
  Result := (pInfo^.PropType^^.Name = 'Boolean');
end;

{$ENDIF}

{$IFNDEF rtTest}

procedure TosGridEditor.GetDateTimeDefName(const sValue : String);
var aDateTimeDef : TComponent;
begin
  aDateTimeDef := Designer.GetComponent(sValue);
  lsDateTimeDefs.AddObject(sValue, aDateTimeDef)
end;

procedure TosGridEditor.GetDatasourceName(const sValue : String);
var aDs : TComponent;
begin
  aDs := Designer.GetComponent(sValue);
  lsDataSources.AddObject(sValue, aDs)
end;

procedure TosGridEditor.ApplyDbColumns;
var i : Integer;
begin
  TtsDbGrid(SourceGrid).Cols := 0;
  TtsDbGrid(SourceGrid).Cols := fmOsGridEditor.sampleDbGrid.Cols;
  for i := 1 to fmOsGridEditor.sampleDbGrid.Cols do
    TtsDbGrid(SourceGrid).Col[i].Assign(fmOsGridEditor.sampleDbGrid.Col[i]);
end;

procedure TosGridEditor.Edit;
var i : integer;
    pInfo : PPropInfo;
    T: PTypeData;
begin
    SaveResult := False;
    StartedFromDesigntime := True;
    FirstActivate := True;
    srcFieldNames := TStringList.Create;
    lsDataSources := TStringList.Create;
    lsDateTimeDefs := TStringList.Create;
    Screen.Cursor := crHourglass;
    try
        SourceGrid := TtsBaseGrid(Component);
        fmOsGridEditor := TfmOsGridEditor.Create(Application);
    except
        Screen.Cursor := crDefault;
        fmOsGridEditor.Free;
        fmOsGridEditor := nil;
        raise;
    end;

    if SourceGrid is TtsDbGrid then
    begin
      {$IFNDEF TSVER_V5}
      pInfo := GetPropInfo(PTypeInfo(TtsDbGrid(SourceGrid).ClassInfo), 'DataSource');
      {$ELSE}
      pInfo := GetPropInfo(TtsDbGrid(SourceGrid), 'DataSource');
      {$ENDIF}
      T := GetTypeData(pInfo^.PropType^);
      Designer.GetComponentNames(T, GetDatasourceName);
    end;
    // Now Load DateTimeDefs
    {$IFNDEF TSVER_V5}
    pInfo := GetPropInfo(PTypeInfo(TtsDbGrid(SourceGrid).ClassInfo), 'DateTimeDef');
    {$ELSE}
    pInfo := GetPropInfo(TtsDbGrid(SourceGrid), 'DateTimeDef');
    {$ENDIF}
    T := GetTypeData(pInfo^.PropType^);
    Designer.GetComponentNames(T, GetDateTimeDefName);
          
    try
{$IFDEF TSVER_V6}
        fmOsGridEditor.Caption := TForm(Designer.Root).Name + '.' + Component.Name + ' - TopGrid Editor';
{$ELSE}
        fmOsGridEditor.Caption := Designer.Form.Name + '.' + Component.Name + ' - TopGrid Editor';
{$ENDIF}
        if DesignActivatesFirstTime then
        begin
            fmOsGridEditor.Left := Trunc((Screen.Width - fmOsGridEditor.Width)/2);
            fmOsGridEditor.Top  := Trunc((Screen.Height - fmOsGridEditor.Height)/2);

            PrevLeft := fmOsGridEditor.Left;
            PrevTop   := fmOsGridEditor.Top;
            PrevWidth := fmOsGridEditor.Width;
            PrevHeight := fmOsGridEditor.Height;

            DesignActivatesFirstTime := False;
        end
        else
        begin
            fmOsGridEditor.Left := PrevLeft;
            fmOsGridEditor.Top := PrevTop;
        end;

        if (SourceGrid is TtsDbGrid) and
           (TtsDbGrid(SourceGrid).DataSource <> Nil) then
        begin
          if TtsDbGrid(SourceGrid).DataSource.DataSet = Nil then
             raise Exception.Create('Unable to open TopGrid Designer - no dataset associated to TDatasource!');
           for i := 0 to TtsDbGrid(SourceGrid).DataSource.DataSet.FieldCount - 1 do
              srcFieldNames.Add(TtsDbGrid(SourceGrid).DataSource.DataSet.Fields.Fields[i].FieldName);
        end;
        
        //ShowMessage('ShowModal');
        fmOsGridEditor.ShowModal;
        if (not SaveResult) and
           (fmOsGridEditor.tbSave.Enabled) and
           (MessageDlg('You have unapplied changes - apply them?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
           SaveResult := True;

        //ShowMessage('Exiting Editor');

        PrevState := fmOsGridEditor.WindowState;
        if PrevState = wsNormal then
        begin
            PrevLeft := fmOsGridEditor.Left;
            PrevTop := fmOsGridEditor.Top;
            PrevWidth := fmOsGridEditor.Width;
            PrevHeight := fmOsGridEditor.Height;
        end;

        if SaveResult then
        begin
            //ShowMessage('Assigning Grid Properties');
            ApplyChanges;
            Designer.Modified;
        end;
    finally
        srcFieldNames.Free;
        srcFieldNames := Nil;
        lsDateTimeDefs.Free;
        lsDateTimeDefs := Nil;
        lsDataSources.Free;
        lsDataSources := Nil;
        fmOsGridEditor.Free;
        fmOsGridEditor := Nil;

        Screen.Cursor := crDefault;
    end;
end;

function TosGridEditor.GetVerbCount: Integer;
begin
    result := 1;
end;

function TosGridEditor.GetVerb(Index: integer): string;
begin
    result := '&TopGrid Editor'
end;

procedure TosGridEditor.ExecuteVerb(Index: integer);
begin
    Edit;
end;
{$ENDIF}

{$R *.dfm}

procedure RunTimeEditor(aGrid : TtsBaseGrid);
var i : Integer;
begin
    srcFieldNames := TStringList.Create;
    Screen.Cursor := crHourglass;
    try
        SourceGrid := aGrid;
        fmOsGridEditor := TfmOsGridEditor.Create(Application);
    except
        Screen.Cursor := crDefault;
        fmOsGridEditor.Free;
        fmOsGridEditor := nil;
        raise;
    end;

    try
      if (SourceGrid is TtsDbGrid) then
      begin
         if (TtsDbGrid(SourceGrid).DataSource <> Nil) then
         begin
           if TtsDbGrid(SourceGrid).DataSource.DataSet = Nil then
              raise Exception.Create('Unable to open TopGrid editor - no Dataset is associated with the DataSource!');

            for i := 0 to TtsDbGrid(SourceGrid).DataSource.DataSet.FieldCount - 1 do
               srcFieldNames.Add(TtsDbGrid(SourceGrid).DataSource.DataSet.Fields.Fields[i].FieldName);
         end;
      end;


      fmOsGridEditor.ShowModal;
      if (not SaveResult) and
         (fmOsGridEditor.tbSave.Enabled) and
         (MessageDlg('You have unapplied changes - Apply them?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
         ApplyChanges;
    finally
        srcFieldNames.Free;
        srcFieldNames := Nil;
        fmOsGridEditor.Free;
        fmOsGridEditor := Nil;
        Screen.Cursor := crDefault;
    end;
end;

procedure ApplyChanges;
begin
  TtsBaseGrid_(demoGrid).InDesignMode := True;
  if fmOsGridEditor.FColumnsChanged then
  begin
    if (SourceGrid is TtsDbGrid) then
       TtsDbGrid(SourceGrid).FieldState := fsCustomized;
  end;
  TtsBaseGrid_(SourceGrid).InDesignMode := True;
  CustomAssign(SourceGrid, demoGrid);
  if SourceGrid is TtsDbGrid then
  begin
    CustomColumnDbAssign(TtsDbGrid(SourceGrid), TtsDbGrid(demoGrid));
    if (fmOsGridEditor.FColumnsChanged) and
       (SourceGrid is TtsDbGrid) then
       TtsDbGrid(SourceGrid).FieldState := fsCustomized;
  end
  else
  begin
    CustomColumnAssign(TtsGrid(SourceGrid), TtsGrid(demoGrid));
    CustomRowAssign(TtsGrid(SourceGrid), TtsGrid(demoGrid));
    CustomCellAssign(TtsGrid(SourceGrid), TtsGrid(demoGrid));
  end;
end;

procedure CustomRowAssign(tgtGrid, srcGrid : TtsGrid);
var iRow, srcRow : Integer;
begin
  tgtGrid.ResetRowProperties(tsAllProperties);
  for iRow := 1 to srcGrid.Rows do
  begin
    srcRow := srcGrid.DataRownr[iRow];
    tgtGrid.RowButtonType[iRow]    := srcGrid.RowButtonType[srcRow];
    tgtGrid.RowControlType[iRow]   := srcGrid.RowControlType[srcRow];
    tgtGrid.RowDateTimeDef[iRow]   := srcGrid.RowDateTimeDef[srcRow];
    tgtGrid.RowColor[iRow]         := srcGrid.RowColor[srcRow];
    tgtGrid.RowParentFont[iRow]    := srcGrid.RowParentFont[srcRow];
    if srcGrid.RowFont[srcRow] = Nil then
       tgtGrid.ResetRowFont(iRow)
    else
    begin
       tgtGrid.AssignRowFont(iRow);
       tgtGrid.RowFont[iRow].Assign(srcGrid.RowFont[srcRow]);
    end;
    tgtGrid.RowHeight[iRow]    := srcGrid.RowHeight[srcRow];
    tgtGrid.RowIs3D[iRow]      := srcGrid.RowIs3D[srcRow];
    tgtGrid.RowVisible[iRow]   := srcGrid.RowVisible[srcRow];
    tgtGrid.RowReadOnly[iRow]  := srcGrid.RowReadOnly[srcRow];
    tgtGrid.RowMaskName[iRow]  := srcGrid.RowMaskName[srcRow];
    if srcGrid.RowControlType[srcRow] = ctPicture then
    begin
      tgtGrid.RowCenterPicture[iRow]    := srcGrid.RowCenterPicture[srcRow];
      tgtGrid.RowStretchPicture[iRow]   := srcGrid.RowStretchPicture[srcRow];
      tgtGrid.RowKeepAspectRatio[iRow]  := srcGrid.RowKeepAspectRatio[srcRow];
      tgtGrid.RowShrinkPicture[iRow]    := srcGrid.RowShrinkPicture[srcRow];
    end
    else if (srcGrid.RowControlType[srcRow] in [ctText, ctDefault]) then
    begin
      tgtGrid.RowHorzAlignment[iRow]    := srcGrid.RowHorzAlignment[srcRow];
      tgtGrid.RowVertAlignment[iRow]    := srcGrid.RowVertAlignment[srcRow];
      tgtGrid.RowWordWrap[iRow]         := srcGrid.RowWordWrap[srcRow];
    end;
    if srcGrid.RowButtonType[srcRow] = btCombo then
    begin
      tgtGrid.RowParentCombo[iRow]    := srcGrid.RowParentCombo[srcRow];
      tgtGrid.RowDropDownStyle[iRow]  := srcGrid.RowDropDownStyle[srcRow];
    end
    else if (srcGrid.RowButtonType[iRow] = btVertSpin) or
            (srcGrid.RowButtonType[iRow] = btHorzSpin) then
    begin
      tgtGrid.RowSpinIncrement[iRow] := srcGrid.RowSpinIncrement[srcRow];
    end;
  end;
end;

procedure CustomCellAssign(tgtGrid, srcGrid : TtsGrid);
var iRow, iCol, jCol, dataCol, dataRow : Integer;
begin
  tgtGrid.ResetCellProperties(tsAllProperties);
  for iRow := 1 to srcGrid.Rows do
  begin
    for iCol := 1 to srcGrid.Cols do
    begin
      tgtGrid.CellButtonType[iCol, iRow]   := srcGrid.CellButtonType[iCol, iRow];
      tgtGrid.CellControlType[iCol, iRow]  := srcGrid.CellControlType[iCol, iRow];
      tgtGrid.CellDateTimeDef[iCol, iRow]  := srcGrid.CellDateTimeDef[iCol, iRow];
      tgtGrid.CellColor[iCol, iRow]        := srcGrid.CellColor[iCol, iRow];
      tgtGrid.CellParentFont[iCol, iRow]   := srcGrid.CellParentFont[iCol, iRow];
      if srcGrid.CellFont[iCol, iRow] = Nil then
         tgtGrid.ResetCellFont(iCol, iRow)
      else
      begin
         tgtGrid.AssignCellFont(iCol, iRow);
         tgtGrid.CellFont[iCol, iRow].Assign(srcGrid.CellFont[iCol, iRow]);
      end;
      tgtGrid.CellIs3D[iCol, iRow]      := srcGrid.CellIs3D[iCol, iRow];
      tgtGrid.CellReadOnly[iCol, iRow]  := srcGrid.CellReadOnly[iCol, iRow];
      tgtGrid.CellMaskName[iCol, iRow]  := srcGrid.CellMaskName[iCol, iRow];
      if srcGrid.CellControlType[iCol, iRow] = ctPicture then
      begin
        tgtGrid.CellCenterPicture[iCol, iRow]    := srcGrid.CellCenterPicture[iCol, iRow];
        tgtGrid.CellStretchPicture[iCol, iRow]   := srcGrid.CellStretchPicture[iCol, iRow];
        tgtGrid.CellKeepAspectRatio[iCol, iRow]  := srcGrid.CellKeepAspectRatio[iCol, iRow];
        tgtGrid.CellShrinkPicture[iCol, iRow]    := srcGrid.CellShrinkPicture[iCol, iRow];
      end
      else if srcGrid.CellControlType[iCol, iRow] in [ctText, ctDefault] then
      begin
        tgtGrid.CellHorzAlignment[iCol, iRow]    := srcGrid.CellHorzAlignment[iCol, iRow];
        tgtGrid.CellVertAlignment[iCol, iRow]    := srcGrid.CellVertAlignment[iCol, iRow];
        tgtGrid.CellWordWrap[iCol, iRow]         := srcGrid.CellWordWrap[iCol, iRow];
      end;
      if srcGrid.CellButtonType[iCol, iRow] = btCombo then
      begin
        tgtGrid.CellParentCombo[iCol, iRow]    := srcGrid.CellParentCombo[iCol, iRow];
        tgtGrid.CellDropDownStyle[iCol, iRow]  := srcGrid.CellDropDownStyle[iCol, iRow];
      end
      else if (srcGrid.CellButtonType[iCol, iRow] = btVertSpin) or
              (srcGrid.CellButtonType[iCol, iRow] = btHorzSpin) then
      begin
        tgtGrid.CellSpinIncrement[iCol, iRow] := srcGrid.CellSpinIncrement[iCol, iRow];
        tgtGrid.CellSpinOptions[iCol, iRow]   := srcGrid.CellSpinOptions[iCol, iRow];
      end;
      if srcGrid.StoreData then
         tgtGrid.Cell[iCol, iRow] := srcGrid.Cell[iCol, iRow];
      if tgtGrid.CellButtonType[iCol, iRow] = btCombo then
      begin
        tgtGrid.AssignCellCombo(iCol, iRow);
        tgtGrid.CellCombo[iCol, iRow].Assign(srcGrid.CellCombo[iCol, iRow]);
        for jCol := 1 to srcGrid.CellCombo[iCol, iRow].Grid.Cols do
          tgtGrid.CellCombo[iCol, iRow].Grid.Col[jCol].Assign(srcGrid.CellCombo[iCol, iRow].Grid.Col[jCol]);
        if srcGrid.CellCombo[iCol, iRow].Grid.StoreData then
           for dataRow := 1 to srcGrid.CellCombo[iCol, iRow].Grid.Rows do
              for dataCol := 1 to srcGrid.CellCombo[iCol, iRow].Grid.Cols do
                tgtGrid.CellCombo[iCol, iRow].Grid.Cell[dataCol, dataRow] := srcGrid.CellCombo[iCol, iRow].Grid.Cell[dataCol, dataRow];
      end;
    end;
  end;
end;

procedure CustomColumnAssign(tgtGrid, srcGrid : TtsGrid);
var
  PropertyIndex, PropertyCount, iCol, jCol, dataCol, dataRow : Integer;
  PropList      : TPropList;
  sName : String;
  aCol : TtsCol;
  Value : Variant;
  Columns : TStringList;
begin
  tgtGrid.EnableRedraw := False;
  Columns := TStringList.Create;
  try
    tgtGrid.Cols := 0;
    tgtGrid.Cols := srcGrid.Cols;
    if tgtGrid.Cols = 0 then exit;
    PropertyCount := GetPropList(srcGrid.Col[1].ClassInfo, tkProperties, @PropList);
    for iCol := 1 to srcGrid.Cols do
      Columns.AddObject(Format('%8.7d', [srcGrid.Col[iCol].DisplayCol]), srcGrid.Col[iCol]);
    Columns.Sort;
    for iCol := 1 to srcGrid.Cols do
    begin
      aCol := TtsCol(Columns.Objects[iCol-1]);
      for PropertyIndex := 0 to PropertyCount - 1 do
      begin
        sName := PropList[PropertyIndex].Name;
        if aCol.Tag = 1 then
          tgtGrid.Col[iCol].Visible := False;
        if (AnsiCompareText(sName, 'Font') = 0) then
        begin
          if (aCol.ParentFont = False) then
          begin
            tgtGrid.Col[iCol].ParentFont := False;
            tgtGrid.Col[iCol].Font.Assign(aCol.Font);
          end
          else Continue;
        end
        else if (AnsiCompareText(sName, 'HeadingFont') = 0) then
        begin
          if (aCol.HeadingParentFont = False) then
          begin
            tgtGrid.Col[iCol].HeadingParentFont := False;
            tgtGrid.Col[iCol].HeadingFont.Assign(aCol.HeadingFont);
          end
          else Continue;
        end
        else if (AnsiCompareText(sName, 'DateTimeDef') = 0) then
          tgtGrid.Col[iCol].DateTimeDef := aCol.DateTimeDef
        else if (sName <> 'ComboDatasource') and
                //(sName <> 'DateTimeDef') and
                (sName <> 'DisplayCol') then
           try
             Value := GetPropValue(aCol, sName, False);
             if VarType(Value) <> varEmpty then
             begin
               if VarType(Value) = varBoolean then
                  SetPropValue(tgtGrid.Col[iCol], sName, BooleanToStr(Value))
               else
                  SetPropValue(tgtGrid.Col[iCol], sName, Value);
             end;
           except on E:Exception do
             //ShowMessage('Error setting col property ' + sName);
           end;
      end;  // Property assignments...
      // Now Combo properties if present...
      if aCol.ButtonType = btCombo then
      begin
        if (aCol.Combo <> Nil) then
        begin
          tgtGrid.Col[iCol].AssignCombo;
          tgtGrid.Col[iCol].Combo.Assign(aCol.Combo);
          for jCol := 1 to aCol.Combo.Grid.Cols do
            tgtGrid.Col[iCol].Combo.Grid.Col[jCol].Assign(aCol.Combo.Grid.Col[jCol]);
          if aCol.Combo.Grid.StoreData then
             for dataRow := 1 to aCol.Combo.Grid.Rows do
                for dataCol := 1 to aCol.Combo.Grid.Cols do
                  tgtGrid.Col[iCol].Combo.Grid.Cell[dataCol, dataRow] := aCol.Combo.Grid.Cell[dataCol, dataRow];
        end;
      end;
    end;
    if srcGrid.StoreData then
       for dataRow := 1 to srcGrid.Rows do
          for dataCol := 1 to srcGrid.Cols do
             tgtGrid.Cell[dataCol, dataRow] := srcGrid.Cell[dataCol, dataRow];
  finally
    Columns.Free;
    tgtGrid.EnableRedraw := True;
    tgtGrid.Invalidate;
  end;
end;

procedure CustomColumnDbAssign(tgtGrid, srcGrid : TtsDbGrid);
var
  PropertyIndex, PropertyCount, iCol, jCol, dataCol, dataRow : Integer;
  PropList      : TPropList;
  sName : String;
  Value : Variant;
  aCol : TtsDbCol;
  Columns : TStringList;
begin
  tgtGrid.EnableRedraw := False;
  Columns := TStringList.Create;
  try
    tgtGrid.Cols := 0;
    tgtGrid.Cols := srcGrid.Cols;
    if tgtGrid.Cols = 0 then exit;
    PropertyCount := GetPropList(srcGrid.Col[1].ClassInfo, tkProperties, @PropList);
    // Load the columns by displaycol to sort by the displayCol...
    for iCol := 1 to srcGrid.Cols do
      Columns.AddObject(Format('%8.7d', [srcGrid.Col[iCol].DisplayCol]), srcGrid.Col[iCol]);
    Columns.Sort;
    for iCol := 1 to srcGrid.Cols do
    begin
      aCol := TtsDbCol(Columns.Objects[iCol-1]);
      for PropertyIndex := 0 to PropertyCount - 1 do
      begin
        sName := PropList[PropertyIndex].Name;
        if aCol.Tag = 1 then
          tgtGrid.Col[iCol].Visible := False;
        if (AnsiCompareText(sName, 'Font') = 0) then
        begin
          if (aCol.ParentFont = False) then
          begin
            tgtGrid.Col[iCol].ParentFont := False;
            tgtGrid.Col[iCol].Font.Assign(aCol.Font);
          end
          else Continue;
        end
        else if (AnsiCompareText(sName, 'DateTimeDef') = 0) then
          tgtGrid.Col[iCol].DateTimeDef := aCol.DateTimeDef
        else if (AnsiCompareText(sName, 'HeadingFont') = 0) then
        begin
          if (aCol.HeadingParentFont = False) then
          begin
            tgtGrid.Col[iCol].HeadingParentFont := False;
            tgtGrid.Col[iCol].HeadingFont.Assign(aCol.HeadingFont);
          end
          else Continue;
        end
        else if (sName <> 'ComboDatasource') and (sName <> 'DateTimeDef') and
                (sName <> 'DisplayCol') then
           try
             Value := GetPropValue(aCol, sName, False);
             if VarType(Value) <> varEmpty then
             begin
               if VarType(Value) = varBoolean then
                  SetPropValue(tgtGrid.Col[iCol], sName, BooleanToStr(Value))
               else
                  SetPropValue(tgtGrid.Col[iCol], sName, Value);
             end;
           except on E:Exception do
             //ShowMessage('Error setting col property ' + sName);
           end;
      end; // Property assignments...
      // Now Combo properties if present...
      if aCol.ButtonType = btCombo then
      begin
        if (aCol.Combo <> Nil) then
        begin
          tgtGrid.Col[iCol].AssignCombo;
          tgtGrid.Col[iCol].Combo.Assign(aCol.Combo);
          for jCol := 1 to aCol.Combo.Grid.Cols do
            tgtGrid.Col[iCol].Combo.Grid.Col[jCol].Assign(aCol.Combo.Grid.Col[jCol]);
          if aCol.Combo.Grid.StoreData then
             for dataRow := 1 to aCol.Combo.Grid.Rows do
                for dataCol := 1 to aCol.Combo.Grid.Cols do
                  tgtGrid.Col[iCol].Combo.Grid.Cell[dataCol, dataRow] := aCol.Combo.Grid.Cell[dataCol, dataRow];
        end;
      end;
    end;
  finally
    Columns.Free;
    tgtGrid.EnableRedraw := True;
    tgtGrid.Invalidate;
  end;
end;

procedure CustomAssign(tgtGrid, srcGrid : TtsBaseGrid);
var
  PropertyIndex, PropertyCount : Integer;
  PropList      : TPropList;
  sName : String;
  Value : Variant;
begin
  PropertyCount := GetPropList(srcGrid.ClassInfo, tkProperties, @PropList);
  for PropertyIndex := 0 to PropertyCount -1 do
  begin
    sName := PropList[PropertyIndex].Name;
    if (sName = 'Font') then
      TtsBaseGrid_(tgtGrid).Font.Assign(TtsBaseGrid_(srcGrid).Font)
    else if (sName = 'HeadingFont') then
      TtsBaseGrid_(tgtGrid).HeadingFont.Assign(TtsBaseGrid_(srcGrid).HeadingFont)
    else if (sName = 'ImageList') then
      TtsBaseGrid_(tgtGrid).ImageList := TtsBaseGrid_(srcGrid).ImageList
    else if (sName <> 'Align') and (sName <> 'Top') and
       (sName <> 'Left') and (sName <> 'Height') and
       (sName <> 'Anchors') and (sName <> 'Constraints') and
       (sName <> 'Width') and //(sName <> 'Cols') and
       (sName <> 'DataSource') and (sName <> 'DateTimeDef') and
       (sName <> 'Enabled') and (sName <> 'Name') and
       (sName <> 'PopupMenu') and (sName <> 'Name') and
       (sName <> 'ImageList') and (sName <> 'MaskDefs') and
       (sName <> 'GridReport') then
    begin
      try
        Value := GetPropValue(srcGrid, sName, False);
        if VarType(Value) <> varEmpty then
        begin
          if VarType(Value) = varBoolean then
             SetPropValue(tgtGrid, sName, BooleanToStr(Value))
          else if (sName = 'TosXMLExport') then
             TtsBaseGrid_(tgtGrid).XMLExport := TtsBaseGrid_(srcGrid).XMLExport
          else
             SetPropValue(tgtGrid, sName, Value);
        end;
      except on E:Exception do
        //ShowMessage('Error assigning property ' + sName);
      end;
    end;
  end;
end;

function  BooleanToStr(Value : Boolean) : String;
begin
  if Value then
     Result := 'True'
  else
     Result := 'False';
end;

procedure TfmOsGridEditor.SetTargetGrid(Value : TtsBaseGrid);
{$IFDEF rtTest}
var i : integer;
{$ENDIF}
begin
  //ShowMessage('SetTargetGrid');
  FTargetGrid := Value;
  if (FTargetGrid <> Nil) and
     (FTargetGrid is TtsDbGrid) then
  begin
    sampleDbGrid.BringToFront;
    demoGrid := sampleDbGrid;
    CustomAssign(sampleDbGrid, TtsDbGrid(FTargetGrid));
    tsRowProperties.TabVisible := False;
    tsCellProperties.TabVisible := False;
    sampleDbGrid.PopupMenu := pmOptions;
    sampleDbGrid.Align := alClient;
    //sampleDbGrid.ProvideGridMenu := False;
  end
  else
  begin
    sampleDbGrid.DataSource := Nil;
    sampleGrid.BringToFront;
    demoGrid := sampleGrid;
    CustomAssign(sampleGrid, TtsGrid(FTargetGrid));
    CustomColumnAssign(sampleGrid, TtsGrid(FTargetGrid));
    CustomRowAssign(sampleGrid, TtsGrid(FTargetGrid));
    CustomCellAssign(sampleGrid, TtsGrid(FTargetGrid));
    //sampleGrid.ProvideGridMenu := False;
    sampleGrid.Align := alClient;
    sampleGrid.PopupMenu := pmOptions;
  end;

  sbStatus.Panels[0].Text := 'Source: ' + Value.Name;
{$IFDEF rtTest}
  if (SourceGrid is TtsDbGrid) and
     (TtsDbGrid(SourceGrid).DataSource <> Nil) then
  begin
     srcFieldNames := TStringList.Create;
     for i := 0 to TtsDbGrid(SourceGrid).DataSource.DataSet.FieldCount - 1 do
        srcFieldNames.Add(TtsDbGrid(SourceGrid).DataSource.DataSet.Fields.Fields[i].FieldName);
  end;
{$ENDIF}
end;

procedure TfmOsGridEditor.Initialize;
var theCol : TtsCol;
    i : Integer;
begin
  FBinding := True;
  FColumnsChanged := False;
  miSortedFieldList.Checked := GetFieldSort;
  if SourceGrid <> Nil then
     TargetGrid := SourceGrid;
  //ShowMessage('Initialize');
  try
  veEditor.EnableRedraw := False;
  veEditor.EnablePaint := False;
  try
    veEditor.Rows := 0;
    theCol := veEditor.Col[1];
    theCol.ReadOnly := True;
    theCol.Heading := 'Property';
    sleep(50);
    theCol := veEditor.Col[2];
    theCol.Heading := 'Value';
  finally
    veEditor.EnableRedraw := True;
    veEditor.EnablePaint := True;
    veEditor.Invalidate;
  end;
  veColEditor.EnableRedraw := False;
  veColEditor.EnablePaint := False;
  try
    veColEditor.Rows := 0;
    sleep(50);
    theCol := veColEditor.Col[1];
    theCol.Heading := 'Key';
    theCol.ReadOnly := True;
    sleep(50);
    theCol := veColEditor.Col[2];
    theCol.Heading := 'Value';
  finally
    veColEditor.EnableRedraw := True;
    veColEditor.EnablePaint := True;
    veColEditor.Invalidate;
  end;

  finally
    //ShowMessage('SetupPropertyLists');
    SetupPropertyLists;
    EnumList := TStringList.Create;
    GridModifiedProperties := TStringList.Create;
    GridCustomProperties := TStringList.Create;
    LoadCustomGridProperties;
    GridModifiedProperties.Duplicates := dupIgnore;
    ColModifiedProperties := TStringList.Create;
    ColModifiedProperties.Duplicates := dupIgnore;
    cbPropertyView.ItemIndex := cbPropertyView.Items.IndexOf(GridView);
    if cbPropertyView.ItemIndex = -1 then
       cbPropertyView.ItemIndex := 0;
    cbColPropertyView.ItemIndex := cbColPropertyView.Items.IndexOf(ColumnView);
    if cbColPropertyView.ItemIndex = -1 then
       cbColPropertyView.ItemIndex := 0;
    //ShowMessage('RefreshGridProperties');
    RefreshGridProperties;
    comboDataBookmarks := TStringList.Create;
    LoadFieldNames;
    LoadSystemMasks;
    AppendCustomMasks;
    AppendTtsMaskMasks;
    EnsureCombos;
    ResetWindowState;
    
    FBinding := False;
    if GetGridCols > 0 then
       SelectedCol := 1;
    AdjustCommonProperties;
    for i := 1 to GetGridCols do
      if not GetGridCol(i).Visible then
      begin
        GetGridCol(i).Visible := True;
        GetGridCol(i).Tag := 1;
        GetGridCol(i).HeadingColor := clWindow;
      end;
    tbSave.Enabled := False;
  end;
  AdjustToolbar;
end;

procedure TfmOsGridEditor.FormCreate(Sender: TObject);
begin
  FStartup := True;
  FBinding := True;
{$IFDEF rtTest}
  //SourceGrid := gdTest;
  //demoGrid := sampleDbGrid;
{$ELSE}
  //ShowMessage('Source Grid is Set');
  demoGrid := SourceGrid;
{$ENDIF}
  demoGrid := SourceGrid;
  if demoGrid is TtsDbGrid then
     sampleDbGrid.DataSource := TtsDbGrid(demoGrid).DataSource;
  ResetWindowState;
end;

procedure TfmOsGridEditor.FormActivate(Sender: TObject);
begin
  if Self.Tag = 0 then
     Initialize;
  Self.Tag := 1;
end;

procedure TfmOsGridEditor.FormDestroy(Sender: TObject);
var i : integer;
begin
  //ShowMessage('FormDestroy');
  SaveWindowState;
  
  ControlProperties.Free;
  BasicProperties.Free;
  VCLProperties.Free;
  DataProperties.Free;
  ColControlProperties.Free;
  ColBasicProperties.Free;
  ColCustomProperties.Free;
  EnumList.Free;
  GridModifiedProperties.Free;
  GridCustomProperties.Free;
  ColModifiedProperties.Free;
  comboDataBookmarks.Free;
  comboGridProperties.Free;
  ClearFieldNames;
  for i := 0 to cbMask.Items.Count - 1 do
    TosMaskEntry(cbMask.Items.Objects[i]).Free;

end;

procedure TfmOsGridEditor.ClearFieldNames;
var i : Integer;
begin
  if Fieldnames <> Nil then
  begin
    for i := 0 to FieldNames.Count - 1 do
      FieldNames.Objects[i].Free;
    FieldNames.Free;
    FieldNames := Nil;
  end;
end;

procedure TfmOsGridEditor.Apply;
begin
  SaveResult := True;
  ApplyChanges;
  //FTargetGrid.Assign(demoGrid);
{$IFNDEF rtTest}
 // Designer.Modified;
{$ENDIF}
end;

function TfmOsGridEditor.GetGridMode : TtsGridMode;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).GridMode
  else Result := TtsGrid(demoGrid).GridMode;
end;

function TfmOsGridEditor.GetGridFont : TFont;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).Font
  else Result := TtsGrid(demoGrid).Font;
end;

function TfmOsGridEditor.GetGridHeadingFont : TFont;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).HeadingFont
  else Result := TtsGrid(demoGrid).HeadingFont;
end;

function TfmOsGridEditor.GetGridColor : TColor;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).Color
  else Result := TtsGrid(demoGrid).Color;
end;

function TfmOsGridEditor.GetGridHeadingColor : TColor;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).HeadingColor
  else Result := TtsGrid(demoGrid).HeadingColor;
end;

{function TfmOsGridEditor.GetGridDisplayColnr(iCol : Integer) : Integer;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).DisplayColnr[iCol]
  else Result := TtsGrid(demoGrid).DisplayColnr[iCol];
end;}

function TfmOsGridEditor.GetGridDataColnr(iDisplayCol : Integer) : Integer;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).DataColnr[iDisplayCol]
  else Result := TtsGrid(demoGrid).DataColnr[iDisplayCol];
end;

function TfmOsGridEditor.GetGridCol(iCol : Integer) : TtsCol;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).Col[iCol]
  else Result := TtsGrid(demoGrid).Col[iCol];
end;

function TfmOsGridEditor.GetGridCurrentDataRow : Variant;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).CurrentDataRow
  else Result := TtsGrid(DemoGrid).CurrentDataRow;
end;

function TfmOsGridEditor.GetGridFixedColCount : Integer;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).FixedColCount
  else Result := TtsGrid(DemoGrid).FixedColCount;
end;

function TfmOsGridEditor.GetGridLeftCol : Integer;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).LeftCol
  else Result := TtsGrid(DemoGrid).LeftCol;
end;

function TfmOsGridEditor.GetGridSelectedCols : TtsSelection;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).SelectedCols
  else Result := TtsGrid(demoGrid).SelectedCols;
end;

function TfmOsGridEditor.GetGridCols : Integer;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).Cols
  else Result := TtsGrid(demoGrid).Cols;
end;

function TfmOsGridEditor.GetGridRows : Integer;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).Rows
  else Result := TtsGrid(demoGrid).Rows;
end;

function TfmOsGridEditor.GetGridDefaultColWidth : Integer;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).DefaultColWidth
  else Result := TtsGrid(demoGrid).DefaultColWidth;
end;

function TfmOsGridEditor.GetGridDefaultRowHeight : Integer;
begin
  if demoGrid is TtsDbGrid then Result := TtsDbGrid(demoGrid).DefaultRowHeight
  else Result := TtsGrid(demoGrid).DefaultRowHeight;
end;

procedure TfmOsGridEditor.AdjustCommonProperties;
var Val : Variant;
begin
  ////ShowMessage('GridMode');
  sampleDbGrid.EnablePaint := False;
  sampleDbGrid.EnableRedraw := False;
  FBinding := True;
  try
    rgGridMode.ItemIndex := Integer(GetGridMode);
    laFontSummary.Caption := FontDisplay(GetGridFont);
    laFontSummary.Font.Color := GetGridFont.Color;
    laHeadingFontSummary.Caption := FontDisplay(GetGridHeadingFont);
    laHeadingFontSummary.Font.Color := GetGridHeadingFont.Color;
    cbGridColor.ColorValue := GetGridColor;
    cbHeadingColor.ColorValue := GetGridHeadingColor;
    chWantTabs.Checked   := GetDemoGridPropertyValue('WantTabs');

    chRowBarOn.Checked   := GetDemoGridPropertyValue('RowBarOn');
    chHeadingOn.Checked  := GetDemoGridPropertyValue('HeadingOn');
    chShowFocus.Checked  := GetDemoGridPropertyValue('AlwaysShowFocus');
    chShowEditor.Checked := GetDemoGridPropertyValue('AlwaysShowEditor');
    chRowMoving.Checked  := GetDemoGridPropertyValue('RowMoving');
    chColMoving.Checked  := GetDemoGridPropertyValue('ColMoving');
    chStoreData.Checked  := GetDemoGridPropertyValue('StoreData');
    chGridMenu.Checked   := GetDemoGridPropertyValue('ProvideGridMenu');
    chPrintTotals.Checked  := GetDemoGridPropertyValue('PrintTotals');

    Val := GetDemoGridPropertyValue('VertAlignment');
    if VarType(Val) = varInteger then
       cbVertAlignment.ItemIndex := Val
    else
       cbVertAlignment.ItemIndex := cbVertAlignment.Items.IndexOf(Val);
    Val := GetDemoGridPropertyValue('GridLines');
    if VarType(Val) = varInteger then
       cbGridLines.ItemIndex     := Val
    else
       cbGridLines.ItemIndex     := cbGridLines.Items.IndexOf(Val);

    udDefaultColWidth.Position := GetGridDefaultColWidth;
    edDefaultColWidth.Text     := IntToStr(GetGridDefaultColWidth);
    udDefaultRowHeight.Position := GetGridDefaultRowHeight;
    edDefaultRowHeight.Text := IntToStr(GetGridDefaultRowHeight);
    Val := GetDemoGridPropertyValue('ColSelectMode');
    if VarType(Val) = varInteger then
       cbColSelect.ItemIndex   := Val
    else
       cbColSelect.ItemIndex   := cbColSelect.Items.IndexOf(Val);
    Val := GetDemoGridPropertyValue('RowSelectMode');
    if VarType(Val) = varInteger then
       cbRowSelect.ItemIndex   := Val
    else
       cbRowSelect.ItemIndex   := cbRowSelect.Items.IndexOf(Val);

    edCols.Text := IntToStr(GetGridCols);
    edRows.Text := IntToStr(GetGridRows);

    ////ShowMessage('AdjustFocusColors');
    AdjustFocusColors;
  finally
    sampleDbGrid.EnablePaint := True;
    sampleDbGrid.EnableRedraw := True;
    sampleDbGrid.Invalidate;
    FBinding := False;
  end;
end;

procedure TfmOsGridEditor.AdjustFocusColors;
begin
  if GetGridMode = gmListBox then
  begin
    laFocusColor.Caption := 'Selection Color:';
    laFocusFontColor.Caption := 'Selection Font Color:';
    cbFocusColor.ColorValue := GetDemoGridPropertyValue('SelectionColor');
    cbFocusFontColor.ColorValue := GetDemoGridPropertyValue('SelectionFontColor');
  end
  else
  begin
    laFocusColor.Caption := 'Focus Color:';
    laFocusFontColor.Caption := 'Focus Font Color:';
    cbFocusColor.ColorValue := GetDemoGridPropertyValue('FocusColor');
    cbFocusFontColor.ColorValue := GetDemoGridPropertyValue('FocusFontColor');
  end;
end;


function TfmOsGridEditor.GetGridPropertyType(sPropName : String) : TosPropertyType;
begin
  if TestGridColorProperty(sPropName) then
     Result := ptColor
  else if TestGridBooleanProperty(sPropName) then
     Result := ptBoolean
  else if PropType(demoGrid, sPropName) = tkEnumeration then
     Result := ptCombo
  else if PropType(demoGrid, sPropName) = tkClass then
     Result := ptButton
  else if PropType(demoGrid, sPropName) = tkInteger then
     Result := ptSpin
  else
     Result := ptEdit;
end;

function TfmOsGridEditor.GetColPropertyType(sPropName : String) : TosPropertyType;
begin
  if TestColColorProperty(sPropName) then
     Result := ptColor
  else if TestColBooleanProperty(sPropName) then
     Result := ptBoolean
  else if PropType(SelectedtsCol, sPropName) = tkEnumeration then
     Result := ptCombo
  else if (sPropName = 'DateTimeDef') then 
     Result := ptCombo
  else if PropType(SelectedtsCol, sPropName) = tkClass then
     Result := ptButton
  else if PropType(SelectedtsCol, sPropName) = tkInteger then
     Result := ptSpin
  else
     Result := ptEdit;
end;

function TfmOsGridEditor.GetComboPropertyType(sPropName : String) : TosPropertyType;
begin
  if TestGridColorProperty(sPropName) then
     Result := ptColor
  else if TestComboBooleanProperty(sPropName) then
     Result := ptBoolean
  else if PropType(SelectedCombo.Grid, sPropName) = tkEnumeration then
     Result := ptCombo
  else if PropType(SelectedCombo.Grid, sPropName) = tkClass then
     Result := ptButton
  else if PropType(SelectedCombo.Grid, sPropName) = tkInteger then
     Result := ptSpin
  else
     Result := ptEdit;
end;

procedure TfmOsGridEditor.RefreshGridProperties;
var
  PropertyIndex,
  PropertyCount, iIndex : Integer;
  PropList      : TPropList;
  sName, sText : String;
begin
  veEditor.Rows := 0;
  PropertyCount := GetPropList(demoGrid.ClassInfo, tkProperties, @PropList) ;
  // the second parameter could be also tkProperties for only get the
  // property names or tkMethods to get the methods names.

  for PropertyIndex := 0 to PropertyCount -1 do
  begin
    sName := PropList[PropertyIndex].Name;
    if TestGridPropertyView(sName) then
    begin
      veEditor.Rows := veEditor.Rows + 1;
      iIndex := veEditor.Rows;
      sText := GetGridPropertyValueText(veEditor, demoGrid, sName);
      veEditor.Cell[1, iIndex] := sName;
      veEditor.Cell[2, iIndex] := sText;
    end;
  end;
  if veEditor.Rows > 0 then
  begin
    veEditor.CurrentCell.MoveTo(2, 1);
    RefreshPropertyDisplay(1);
  end;
end;

function TfmOsGridEditor.TestGridPropertyView(sPropertyName : String) : Boolean;
begin
  Result := False;
  case TosGridPropertyView(cbPropertyView.ItemIndex) of
    gpAll      : Result := (sPropertyName <> 'DataSource') and (sPropertyName <> 'ImageList') and
                           (sPropertyName <> 'MaskDefs') and (sPropertyName <> 'DateTimeDef') and
                           (sPropertyName <> 'PopupMenu');
    gpFont     : Result := (Pos('Font', sPropertyName) > 0);
    gpColor    : Result := (Pos('Color', sPropertyName) > 0);
    gpVCL      : Result := (VCLProperties.IndexOf(sPropertyName) >= 0);
    gpControls : Result := (ControlProperties.IndexOf(sPropertyName) >= 0);
    gpBasic    : Result := (BasicProperties.IndexOf(sPropertyName) >= 0);
    gpHeading  : Result := (Pos('Heading', sPropertyName) > 0);
    gpDragging : Result := (Pos('Drag', sPropertyName) > 0);
    gpBooleans : Result := (PropType(demoGrid, sPropertyName) = tkEnumeration) and
                 (
                  (LowerCase(GetEnumProp(demoGrid, sPropertyName)) = 'true') or
                  (LowerCase(GetEnumProp(demoGrid, sPropertyName)) = 'false')
                  );
    gpData     : Result := (DataProperties.IndexOf(sPropertyName) >= 0);
    gpCustom   : Result := (GridCustomProperties.IndexOf(sPropertyName) >= 0);
    gpModified : Result := (GridModifiedProperties.IndexOf(sPropertyName) >= 0);
  end;
  if Result and
     ((sPropertyName = 'Align') or (sPropertyName = 'Anchors') or
      (sPropertyName = 'Constraints')) then
     Result := False;
end;

function TfmOsGridEditor.GetDemoGridPropertyValue(PropertyName : String) : Variant;
begin
  Result := GetPropValue(demoGrid, PropertyName, False);
end;

function TfmOsGridEditor.GetGridPropertyValueText(forEditor : TtsGrid; AnObject: TComponent; PropertyName: String ) : String;
begin
  Result := VarToStr(GetPropValue(AnObject, PropertyName, False));
  case GetGridPropertyType(PropertyName) of
    ptSpin    : forEditor.CellButtonType[2, forEditor.Rows] := btVertSpin;
    ptCombo   :
        begin
          Result := GetEnumProp(AnObject, PropertyName);
          forEditor.CellButtonType[2, forEditor.Rows] := btCombo;
        end;
    ptBoolean :
        begin
          Result := GetEnumProp(AnObject, PropertyName);
          forEditor.CellButtonType[2, forEditor.Rows] := btCombo;
        end;
    ptButton  :
        begin
          forEditor.CellButtonType[2, forEditor.Rows] := btNormal;
          Result := '(' + PropertyName + ')';
        end;
    ptColor   :
        begin
          ColorToIdent(StrToint(Result), Result);
          forEditor.CellButtonType[2, forEditor.Rows] := btCombo;
        end;
  end;
end;

procedure TfmOsGridEditor.SetPropertyValueText(AnObject: TPersistent; PropertyName: String; value: variant);
begin
  SetPropValue(AnObject, PropertyName, Value);
end;

procedure TfmOsGridEditor.veEditorEndCellEdit(Sender: TObject; DataCol,
  DataRow: Integer; var Cancel: Boolean);
begin
  BindGridProperty(DataRow);
end;

procedure TfmOsGridEditor.BindColVarProperty(PropertyName : String; Value : Variant);
begin
  if SelectedtsCol <> Nil then
  begin
    GridModified;
    SetPropertyValueText(SelectedtsCol, PropertyName, Value);
    AddModifiedColProperty(PropertyName);
  end;
end;

procedure TfmOsGridEditor.BindGridVarProperty(PropertyName : String; Value : Variant);
begin
  GridModified;
  GridModifiedProperties.Add(PropertyName);
  if GetGridPropertyType(PropertyName) = ptColor then
     SetPropertyValueText(demoGrid, PropertyName, StringToColor(Value))
  else if VarType(Value) = varBoolean then
     SetPropertyValueText(demoGrid, PropertyName, BooleanToStr(Value))
  else
     SetPropertyValueText(demoGrid, PropertyName, Value);
  if PropertyName = 'Cols' then
  begin
    ReloadSelectableFields;
    CheckCombos;
    if (SelectedCol > GetGridCols) then
       SelectedCol := GetGridCols;
  end;
end;

procedure TfmOsGridEditor.BindGridProperty(DataRow : Integer);
begin
  {if GetGridPropertyType(veEditor.Cell[1, DataRow]) = ptColor then
     SetPropertyValueText(demoGrid, veEditor.Cell[1, DataRow], StringToColor(veEditor.Cell[2, DataRow]))
  else
     SetPropertyValueText(demoGrid, veEditor.Cell[1, DataRow], veEditor.Cell[2, DataRow]); }
  BindGridVarProperty(veEditor.Cell[1, DataRow], veEditor.Cell[2, DataRow]);
  GridModifiedProperties.Add(veEditor.Cell[1, DataRow]);
end;

procedure TfmOsGridEditor.ShowColumn;
begin
  SelectedtsCol.Tag := 0;
  SelectedtsCol.HeadingColor := clNone;
end;

procedure TfmOsGridEditor.HideColumn;
begin
  SelectedtsCol.Tag := 1;
  SelectedtsCol.HeadingColor := clWindow;
end;

procedure TfmOsGridEditor.BindColProperty(DataRow : Integer);
var iIndex : Integer;
begin
  GridModified;
  if (SelectedtsCol.ButtonType = btCombo) and
     (AnsiCompareText(veColEditor.Cell[1, DataRow], 'ButtonType') = 0) and
     (AnsiCompareText(veColEditor.Cell[2, DataRow], 'btCombo') <> 0) then
     RemoveCombo(SelectedtsCol);
  if GetColPropertyType(veColEditor.Cell[1, DataRow]) = ptColor then
     SetPropertyValueText(SelectedtsCol, veColEditor.Cell[1, DataRow], StringToColor(FullColorName(veColEditor.Cell[2, DataRow])))
  else
  begin
    if (AnsiCompareText(veColEditor.Cell[1, DataRow], 'ReadOnly') = 0) then
    begin
      FSelecting := True;
      try
        SetPropertyValueText(SelectedtsCol, veColEditor.Cell[1, DataRow], veColEditor.Cell[2, DataRow]);
      finally
        FSelecting := False;
      end;
    end
    else if (AnsiCompareText(veColEditor.Cell[1, DataRow], 'Visible') = 0) then
    begin
      if LowerCase(veColEditor.Cell[2, DataRow]) = 'true' then
         ShowColumn
      else
         HideColumn;
    end
    else if (AnsiCompareText(veColEditor.Cell[1, DataRow], 'DateTimeDef') = 0) then
    begin
      iIndex := lsDateTimeDefs.IndexOf(veColEditor.Cell[2, DataRow]);
      if (veColEditor.Cell[2, DataRow] = '') or
         (iIndex = -1) then
         SelectedtsCol.DateTimeDef := Nil
      else
         SelectedtsCol.DateTimeDef := TtsDateTimeDefComponent(lsDateTimeDefs.Objects[iIndex]);
    end
    else
       SetPropertyValueText(SelectedtsCol, veColEditor.Cell[1, DataRow], veColEditor.Cell[2, DataRow]);
  end;
  AddModifiedColProperty(veColEditor.Cell[1, DataRow]);
  if (AnsiCompareText(veColEditor.Cell[1, DataRow], 'DisplayCol') = 0) then
     FColumnsChanged := True;
end;

procedure TfmOsGridEditor.AddModifiedColProperty(sPropertyName : String);
begin
  GridModified;
  if SelectedtsCol.FieldName <> '' then
     ColModifiedProperties.Add(SelectedtsCol.FieldName + '.' + sPropertyName)
  else
     ColModifiedProperties.Add(SelectedtsCol.Heading + '.' + sPropertyName);
  FColumnsChanged := True;
end;


procedure TfmOsGridEditor.veEditorComboDropDown(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer);
var sPropName, sValue : String;
begin
  sPropName := veEditor.Cell[1, DataRow];
  Combo.Tag := 0;
  if GetGridPropertyType(sPropName) = ptColor then
  begin
    Combo.Tag := 2;
    Combo.Rows := 42;
    Combo.DropDownRows := 12;
  end
  else if GetGridPropertyType(sPropName) = ptBoolean then
  begin
    Combo.Tag := 1;
    Combo.Rows := 2;
    if LowerCase(sValue) = 'true' then
       Combo.Grid.CurrentDataRow := 1
    else
       Combo.Grid.CurrentDataRow := 2;
   end
   else if GetGridPropertyType(sPropName) = ptCombo then
   begin
     Combo.Rows := LoadEnumList(demoGrid, sPropName);
     if Combo.Rows <= 8 then
        Combo.DropDownRows := Combo.Rows
     else
        Combo.DropDownRows := 8;
     sValue := GetEnumProp(demoGrid, sPropName);
     Combo.Grid.CurrentDataRow := EnumList.IndexOf(sValue) + 1;
     Combo.Tag := 3;
   end
   else sbStatus.Panels[3].Text := 'Unknown GridPropertyType';
end;

procedure TfmOsGridEditor.veEditorComboCellLoaded(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer; var Value: Variant);

begin
  if Combo.Tag = 1 then // Boolean
  begin
    if DataRow = 1 then
       Value := 'True'
    else
       Value := 'False';
  end
  else if Combo.Tag = 2 then // Colors
  begin
    Value := 'cl' + cbColors.Items.Strings[DataRow-1];
  end
  else if (Combo.Tag = 3) and
          (DataRow <= EnumList.Count) then // Enumerated list
    Value := EnumList.Strings[DataRow-1]
  else if (Combo.Tag = 4) then
    Value := cbPropertyView.Items.Strings[DataRow-1];
end;

procedure TfmOsGridEditor.veEditorDblClick(Sender: TObject);
begin
  if LowerCase(veEditor.Cell[veEditor.CurrentDataCol, veEditor.CurrentDataRow]) = 'true' then
  begin
     veEditor.Cell[veEditor.CurrentDataCol, veEditor.CurrentDataRow] := 'False';
     BindGridProperty(veEditor.CurrentDataRow);
  end
  else if LowerCase(veEditor.Cell[veEditor.CurrentDataCol, veEditor.CurrentDataRow]) = 'false' then
  begin
     veEditor.Cell[veEditor.CurrentDataCol, veEditor.CurrentDataRow] := 'True';
     BindGridProperty(veEditor.CurrentDataRow);
  end
  else if (GetGridPropertyType(veEditor.Cell[1, veEditor.CurrentDataRow]) = ptCombo) and
          (cbEnum.ItemIndex < cbEnum.Items.Count - 1) then
  begin
    cbEnum.ItemIndex := cbEnum.ItemIndex + 1;
    UpdatePropertyFromEnum;
  end;
end;

procedure TfmOsGridEditor.cbPropertyViewChange(Sender: TObject);
begin
  veEditor.Rows := 0;
  RefreshGridProperties;
  btCustomGridEdit.Visible := (cbPropertyView.ItemIndex = Integer(gpCustom));
  GridView := cbPropertyView.Text;
end;


procedure TfmOsGridEditor.SetupPropertyLists;
begin
  ControlProperties := TStringList.Create;
  BasicProperties   := TStringList.Create;
  VCLProperties     := TStringList.Create;
  ColControlProperties := TStringList.Create;
  ColBasicProperties := TStringList.Create;
  ColCustomProperties := TStringList.Create;
  DataProperties := TStringList.Create;
  comboGridProperties := TStringList.Create;

  LoadCustomColProperties;
  
  ControlProperties.Add('CheckBoxStyle');
  ControlProperties.Add('CheckBoxValues');
  ControlProperties.Add('FlatButtons');
  ControlProperties.Add('DefaultButtonWidth');
  ControlProperties.Add('SpinButtonHeight');
  ControlProperties.Add('SpinButtonHeight');
  ControlProperties.Add('SpinButtonWidth');
  ControlProperties.Add('SpinRepeatDelay');
  ControlProperties.Add('SpinStartDelay');

  VCLProperties.Add('Align');
  VCLProperties.Add('Anchors');
  VCLProperties.Add('BorderStyle');
  VCLProperties.Add('Color');
  VCLProperties.Add('Ctl3D');
  VCLProperties.Add('Constraints');
  VCLProperties.Add('Cursor');
  VCLProperties.Add('Enabled');
  VCLProperties.Add('Font');
  VCLProperties.Add('Height');
  VCLProperties.Add('Hint');
  VCLProperties.Add('Is3D');
  VCLProperties.Add('KeepAspectRatio');
  VCLProperties.Add('Left');
  VCLProperties.Add('ParentColor');
  VCLProperties.Add('ParentCtl3D');
  VCLProperties.Add('ParentShowHint');
  VCLProperties.Add('ParentFont');
  VCLProperties.Add('ScrollBars');
  VCLProperties.Add('ShowHint');
  VCLProperties.Add('TabOrder');
  VCLProperties.Add('TabStop');
  VCLProperties.Add('Top');
  VCLProperties.Add('Tag');
  VCLProperties.Add('WantTabs');
  VCLProperties.Add('Width');
  VCLProperties.Add('Visible');

  BasicProperties.Add('AlwaysShowEditor');
  BasicProperties.Add('AlwaysShowFocus');
  BasicProperties.Add('ColMoving');
  BasicProperties.Add('Cols');
  BasicProperties.Add('DefaultRowHeight');
  BasicProperties.Add('DefaultColWidth');
  BasicProperties.Add('GridMode');
  BasicProperties.Add('RowMoving');
  BasicProperties.Add('RowBarOn');
  BasicProperties.Add('RowBarWidth');
  BasicProperties.Add('RowChangedIndicator');
  BasicProperties.Add('RowBarAlignment');
  BasicProperties.Add('RowBarIndicator');
  BasicProperties.Add('Rows');
  BasicProperties.Add('TabRowWrap');

  ColControlProperties.Add('AllowGrayed');
  ColControlProperties.Add('ButtonType');
  ColControlProperties.Add('CheckBoxValues');
  ColControlProperties.Add('ControlType');
  ColControlProperties.Add('DropDownStyle');
  ColControlProperties.Add('HeadingButton');
  ColControlProperties.Add('ParentCombo');
  ColControlProperties.Add('SpinIncrement');
  ColControlProperties.Add('SpinOptions');
  ColControlProperties.Add('SpinIncrement');
  ColControlProperties.Add('MaskName');

  ColBasicProperties.Add('AllowGrayed');
  ColBasicProperties.Add('Color');
  ColBasicProperties.Add('DisplayCol');
  ColBasicProperties.Add('FieldName');
  ColBasicProperties.Add('Font');
  ColBasicProperties.Add('Is3D');
  ColBasicProperties.Add('KeepAspectRatio');
  ColBasicProperties.Add('MaxLength');
  ColBasicProperties.Add('ParentFont');
  ColBasicProperties.Add('ReadOnly');
  ColBasicProperties.Add('ShrinkPicture');
  ColBasicProperties.Add('SortPicture');
  ColBasicProperties.Add('HorzAlignment');
  ColBasicProperties.Add('VertAlignment');
  ColBasicProperties.Add('Width');
  ColBasicProperties.Add('WordWrap');

  comboGridProperties.Add('Color');
  comboGridProperties.Add('Font');
  comboGridProperties.Add('DefaultRowHeight');
  comboGridProperties.Add('DefaultColWidth');
  comboGridProperties.Add('GridLines');
  comboGridProperties.Add('HorzAlignment');
  comboGridProperties.Add('VertAlignment');
  comboGridProperties.Add('Is3D');
  comboGridProperties.Add('Rows');
  comboGridProperties.Add('LineColor');
  comboGridProperties.Add('SelectionColor');
  comboGridProperties.Add('SelectionFontColor');
  comboGridProperties.Add('WordWrap');
  comboGridProperties.Add('HeadingOn');
  comboGridProperties.Add('HeadingColor');
  comboGridProperties.Add('HeadingFont');
  comboGridProperties.Add('FixedRowCount');
  comboGridProperties.Add('ParentFont');

  DataProperties.Add('ConfirmDelete');
  DataProperties.Add('DataSetType');
  DataProperties.Add('RecordSelection');
  DataProperties.Add('StoreData');
  DataProperties.Add('BookmarkCompareType');
  DataProperties.Add('BookmarkType');
  DataProperties.Add('UseRecordIds');
  DataProperties.Add('ExactRowCount');
end;

function TfmOsGridEditor.LoadEnumList(anObject : TPersistent; sProperty : String) : Integer;
var pInfo : PPropInfo;
    sCode, sName : String;
    Value, iCount : Integer;
begin
  EnumList.Clear;
  Result := 0;
  if sProperty = '' then exit;
  {$IFNDEF TSVER_V5}
  pInfo := GetPropInfo(PTypeInfo(anObject.ClassInfo), sProperty);
  {$ELSE}
  pInfo := GetPropInfo(anObject, sProperty);
  {$ENDIF}
  if pInfo.PropType^.Kind = tkEnumeration then
  begin
    //T := GetTypeData(@pInfo^.PropType^);
    iCount := GetTypeData(pInfo^.PropType^).MaxValue;
    for Value := 0 to iCount do
    begin
      sName := GetEnumName(pInfo^.PropType^, Value);
      if (Value = 0) or
         ((Value > 0) and
          (Copy(sName, 1, 2) = sCode)) then
         EnumList.Add(sName);
      if Value = 0 then
         sCode := Copy(sName, 1, 2);
    end;
    Result := EnumList.Count;
  end;
end;

procedure TfmOsGridEditor.veEditorCellChanged(Sender: TObject; OldCol, NewCol,
  OldRow, NewRow: Integer);
begin
 // if EnumList <> Nil then
 //    LoadEnumList(veEditor.Cell[1, NewRow]);
end;

function TfmOsGridEditor.TestColBooleanProperty(PropertyName : String) : Boolean;
var sValue : String;
begin
  Result := False;
  if PropType(SelectedtsCol, PropertyName) = tkEnumeration then
  begin
    sValue := GetEnumProp(SelectedtsCol, PropertyName);
    Result := (LowerCase(sValue) = 'true') or (Lowercase(sValue) = 'false');
  end;
end;

function TfmOsGridEditor.TestGridBooleanProperty(PropertyName : String) : Boolean;
var sValue : String;
begin
  Result := False;
  {$IFNDEF TSVER_V5}
  Result := PropertyIsBoolean(demoGrid, PropertyName);
  {$ELSE}
  if PropType(demoGrid, PropertyName) = tkEnumeration then
  begin
    sValue := GetEnumProp(demoGrid, PropertyName);
    Result := (LowerCase(sValue) = 'true') or (Lowercase(sValue) = 'false');
  end;
  {$ENDIF}
end;

function TfmOsGridEditor.TestComboBooleanProperty(PropertyName : String) : Boolean;
var sValue : String;
begin
  Result := False;
  if PropType(SelectedCombo.Grid, PropertyName) = tkEnumeration then
  begin
    sValue := GetEnumProp(SelectedCombo.Grid, PropertyName);
    Result := (LowerCase(sValue) = 'true') or (Lowercase(sValue) = 'false');
  end;
end;

function TfmOsGridEditor.TestGridColorProperty(PropertyName : String) : Boolean;
begin
  if (PropertyName = 'Color') or
     (PropertyName = 'EditColor') or
     (PropertyName = 'EditFontColor') or
     (PropertyName = 'FocusColor') or
     (PropertyName = 'FocusFontColor') or
     (PropertyName = 'FixedLineColor') or
     (PropertyName = 'LineColor') or
     (PropertyName = 'HeadingColor') or
     (PropertyName = 'TransparentColor') or
     (PropertyName = 'SelectionColor') or
     (PropertyName = 'SelectionFontColor') or
     (PropertyName = 'FixedFontColor') then
     Result := True
  else
     Result := False;
end;

function TfmOsGridEditor.TestColColorProperty(PropertyName : String) : Boolean;
begin
  if (PropertyName = 'Color') or
     (PropertyName = 'HeadingColor') then
     Result := True
  else
     Result := False;
end;

procedure TfmOsGridEditor.veEditorComboInit(Sender: TObject; Combo: TtsComboGrid;
  DataCol, DataRow: Integer);
begin
  Combo.Grid.Width := veEditor.Col[2].Width - 15;
  Combo.Color := clWindow;
  Combo.DropDownStyle := ddDropDownList;
  Combo.GridLines := glNone;
  Combo.AutoSearch := asTop;
end;

procedure TfmOsGridEditor.veEditorComboGetValue(Sender: TObject;
  Combo: TtsComboGrid; GridDataCol, GridDataRow, ComboDataRow: Integer;
  var Value: Variant);
begin
  if GetGridPropertyType(veEditor.Cell[1, GridDataRow]) = ptColor then
     Value := FullColorName(Combo.Cell[1, ComboDataRow])
  else
     Value := Combo.Cell[1, ComboDataRow];
  veEditor.Cell[GridDataCol, GridDataRow] := Value;
  BindGridProperty(GridDataRow);
  if GetGridPropertyType(veEditor.Cell[1, GridDataRow]) = ptCombo then
     cbEnum.ItemIndex := cbEnum.Items.IndexOf(Value)
  else if GetGridPropertyType(veEditor.Cell[1, GridDataRow]) = ptBoolean then
     cbBoolean.ItemIndex := cbBoolean.Items.IndexOf(Value)
  else if GetGridPropertyType(veEditor.Cell[1, GridDataRow]) = ptColor then
     cbColors.ColorValue := StringToColor(FullColorName(Value));
end;

function TfmOsGridEditor.FullColorName(colorValue : String) : String;
begin
  if Lowercase(Copy(colorValue, 1, 2)) <> 'cl'  then
     Result := 'cl' + colorValue
  else
     Result := colorValue;
end;
    

procedure TfmOsGridEditor.RefreshPropertyDisplay(DataRow : Integer);
begin
  if (DataRow = 0) or
     (VarType(veEditor.Cell[1, DataRow]) = varEmpty) then exit;

  if TestGridColorProperty(veEditor.Cell[1, DataRow]) then
  begin
     cbColors.BringToFront;
     cbColors.ColorValue := StringToColor(FullColorName(veEditor.Cell[2, DataRow]));
  end
  else if TestGridBooleanProperty(veEditor.Cell[1, DataRow]) then
  begin
     cbBoolean.BringToFront;
     if LowerCase(veEditor.Cell[2, DataRow]) = 'true' then
        cbBoolean.ItemIndex := 0
     else
        cbBoolean.Itemindex := 1;
  end
  else if PropType(demoGrid, VarToStr(veEditor.Cell[1, DataRow])) = tkEnumeration then
  begin
    cbEnum.Items.Clear;
    cbEnum.BringToFront;
    LoadEnumList(demoGrid, veEditor.Cell[1, DataRow]);
    cbEnum.Items.AddStrings(EnumList);
    cbEnum.ItemIndex := cbEnum.Items.IndexOf(veEditor.Cell[2, DataRow]);
  end
  else
  begin
    edPropertyValue.BringToFront;
    edPropertyValue.Text := veEditor.Cell[2, DataRow];
  end;
  moPropertyDesc.Lines.Text := GetGridPropertyDesc(veEditor.Cell[1, DataRow]);
  gbProperty.Caption := 'Property ' + veEditor.Cell[1, DataRow] + ' ';
end;

procedure TfmOsGridEditor.veEditorRowChanged(Sender: TObject; OldRow,
  NewRow: Integer);
begin
  RefreshPropertyDisplay(NewRow);
end;

procedure TfmOsGridEditor.edPropertyValueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     UpdatePropertyFromEdit;
end;

procedure TfmOsGridEditor.UpdatePropertyFromEdit;
begin
  veEditor.Cell[2, veEditor.CurrentDataRow] := edPropertyValue.Text;
  BindGridProperty(veEditor.CurrentDataRow);
end;

procedure TfmOsGridEditor.UpdatePropertyFromColor;
begin
  veEditor.Cell[2, veEditor.CurrentDataRow] := ColorToString(cbColors.ColorValue);
  BindGridProperty(veEditor.CurrentDataRow);
end;

procedure TfmOsGridEditor.UpdatePropertyFromBoolean;
begin
  veEditor.Cell[2, veEditor.CurrentDataRow] := cbBoolean.Items[cbBoolean.ItemIndex];
  BindGridProperty(veEditor.CurrentDataRow);
end;

procedure TfmOsGridEditor.UpdatePropertyFromEnum;
begin
  veEditor.Cell[2, veEditor.CurrentDataRow] := cbEnum.Items[cbEnum.ItemIndex];
  BindGridProperty(veEditor.CurrentDataRow);
end;

procedure TfmOsGridEditor.UpdateColPropertyFromEnum;
begin
  veColEditor.Cell[2, veColEditor.CurrentDataRow] := cbEnum.Items[cbEnum.ItemIndex];
  BindColProperty(veColEditor.CurrentDataRow);
end;

procedure TfmOsGridEditor.UpdateComboPropertyFromEnum;
begin
  veComboProperties.Cell[2, veComboProperties.CurrentDataRow] := cbEnum.Items[cbEnum.ItemIndex];
  BindComboProperty(veComboProperties.CurrentDataRow);
end;

procedure TfmOsGridEditor.edPropertyValueExit(Sender: TObject);
begin
  UpdatePropertyFromEdit;
end;

procedure TfmOsGridEditor.cbBooleanChange(Sender: TObject);
begin
  if cbBoolean.Tag = 1 then
     UpdatePropertyFromBoolean;
end;

procedure TfmOsGridEditor.cbBooleanEnter(Sender: TObject);
begin
  cbBoolean.Tag := 1;
end;

procedure TfmOsGridEditor.cbBooleanExit(Sender: TObject);
begin
  cbBoolean.Tag := 0;
end;

procedure TfmOsGridEditor.cbEnumEnter(Sender: TObject);
begin
  cbEnum.Tag := 1;
end;

procedure TfmOsGridEditor.cbEnumExit(Sender: TObject);
begin
  cbEnum.Tag := 0;
end;

procedure TfmOsGridEditor.cbEnumChange(Sender: TObject);
begin
  if cbEnum.Tag = 1 then
     UpdatePropertyFromEnum;
end;

procedure TfmOsGridEditor.sampleGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var iCol, iRow : Integer;
begin
  if Button = mbLeft then
  begin
    demoGrid.CellFromXY(X, Y, iCol, iRow);
    if (iCol <= 0) then
       exit;

    if (sampleGrid.GridMode = gmListBox) or
       (sampleGrid.Col[sampleGrid.DataColnr[iCol]].ReadOnly) then
       SelectedCol := sampleGrid.DataColnr[iCol];
    //SelectedCol := sampleGrid.DataColnr[iCol];
  end;
end;

function  TfmOsGridEditor.GetSelectedtsCol : TtsCol;
begin
  Result := Nil;
  if SelectedCol > 0 then
     Result := GetGridCol(SelectedCol);
end;

procedure TfmOsGridEditor.MoveTo(DataCol : Integer; DataRow : Variant);
begin
  if DataCol <= GetGridCols then
  begin
    pnIndicator.Left := XforCol(DataCol);
    pnIndicator.Width := GetGridCol(GetGridDataColnr(DataCol)).Width;
  end;
  if GetGridRows > 0 then
  begin
    if demoGrid is TtsDbGrid then
    begin
      sampleDbGrid.CurrentCell.MoveTo(GetGridDataColnr(DataCol), DataRow);
      sampleDbGrid.PutCellInView(GetGridDataColnr(DataCol), DataRow);
    end
    else
    begin
      sampleGrid.CurrentCell.MoveTo(GetGridDataColnr(DataCol), DataRow);
      sampleGrid.PutCellInView(GetGridDataColnr(DataCol), DataRow);
    end;
  end;
end;

function TfmOsGridEditor.XforCol(DisplayCol : Integer) : Integer;
var i, j, iLeftCol, iFixCols : Integer;
    theCol : TtsCol;
begin
  Result := 1;
  if (demoGrid is TtsDbGrid) and
     (TtsDbGrid(demoGrid).RowBarOn) then
    Result := Result + TtsDbGrid(demoGrid).RowBarWidth
  else if (demoGrid is TtsGrid) and
          (TtsGrid(demoGrid).RowBarOn) then
    Result := Result + TtsGrid(DemoGrid).RowBarWidth;
  iLeftCol := GetGridLeftCol;
  iFixCols := 0;
  if DisplayCol > GetGridFixedColCount then
     iFixCols := GetGridFixedColCount
  else if DisplayCol <= GetGridFixedColCount then
     iFixCols := DisplayCol - 1;
  for i := 1 to iFixCols do
  begin
    j := Self.GetGridDataColnr(i);
    theCol := Self.GetGridCol(j);
    Result := Result + theCol.Width;
  end;
  for i := iLeftCol to DisplayCol - 1 do
  begin
    j := Self.GetGridDataColnr(i);
    theCol := Self.GetGridCol(j);
    Result := Result + theCol.Width;
  end;
end;

procedure TfmOsGridEditor.AdjustMaskCombo(sName : String);
begin
  cbMask.ItemIndex := -1;
  if IndexOfMask(sName) > 0 then
     cbMask.ItemIndex := IndexOfMask(sName);
  btEditMask.Enabled := (cbMask.ItemIndex > 0) and (not TosMaskEntry(cbMask.Items.Objects[cbMask.ItemIndex]).System);
end;

procedure TfmOsGridEditor.AdustColumnButtons;
begin
  if SelectedtsCol <> Nil then
  begin
    Case SelectedtsCol.HeadingHorzAlignment of
      htaDefault : tbDefaultJustify.Down := True;
      htaLeft    : tbLeftJustify.Down := True;
      htaCenter  : tbCenterJustify.Down := True;
      htaRight   : tbRightJustify.Down := True;
    end;
    btEditMask.Enabled := True;
    cbControlType.Enabled := True;
    cbButtonType.Enabled := True;
    cbMask.Enabled := True;
    edColHeading.Enabled := True;
  end
  else
  begin
    tbDefaultJustify.Enabled := False;
    tbLeftJustify.Enabled := False;
    tbCenterJustify.Enabled := False;
    tbRightJustify.Enabled := False;
    btEditMask.Enabled := False;
    cbControlType.Enabled := False;
    cbButtonType.Enabled := False;
    cbMask.Enabled := False;
    edColHeading.Enabled := False;
  end;
end;

procedure TfmOsGridEditor.SetSelectedCol(Value : Integer);
begin
  if FSelecting then exit;

  FSelecting := True;
  try
  if FSelectedCol <> Value then
  begin
    FSelectedCol := Value;
    sampleDbGrid.ResetSelection;
    sampleGrid.ResetSelection;
    if Value > 0 then
    begin
      gbColumn.Caption := 'Column ' + IntToStr(SelectedtsCol.DisplayCol) + ' - ' + SelectedtsCol.Heading + ' ';
      RefreshColProperties;
      edColHeading.Text := SelectedtsCol.Heading;
      edColHeading.SelectAll;
      cbControlType.ItemIndex := Integer(SelectedtsCol.ControlType);
      cbButtonType.ItemIndex := Integer(SelectedtsCol.ButtonType);
      MoveTo(SelectedtsCol.DisplayCol, GetGridCurrentDataRow);
      sbStatus.Panels[1].Text := 'Col: ' + IntToStr(SelectedtsCol.DisplayCol);
      AdustColumnButtons;
      AdjustMaskCombo(SelectedtsCol.MaskName);
    end
    else
    begin
      gbColumn.Caption := '';
      edColHeading.Text := '';
    end;
    edColHeading.Enabled := (FSelectedCol > 0);
    if (edColHeading.Enabled) and
       (pgEditor.ActivePage = tsColumns) then
       edColHeading.SetFocus;
    cbControlType.Enabled := (FSelectedCol > 0);
    cbButtonType.Enabled := (FSelectedCol > 0);
    if ComboIndex(SelectedtsCol) >= 0 then
    begin
      lbCombos.ItemIndex := ComboIndex(SelectedtsCol);
      SelectItemCombo;
    end;
    if FSelectedColProperty > 0 then
       SelectedColProperty := FSelectedColProperty;
  end;
  finally
    FSelecting := False;
  end;
end;

function TfmOsGridEditor.FieldInGrid(sFieldname : String) : Boolean;
var i : Integer;
begin
  Result := False;
  with sampleDbGrid do
  begin
    BeginUpdate;
    try
    for i := 1 to Cols do
      if (Col[i].FieldName = sFieldName) then
      begin
        Result := True;
        break;
      end;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TfmOsGridEditor.LoadFieldNames;
begin
  ClearFieldNames;
  FieldNames := TStringList.Create;
  if (SourceGrid = Nil) or
     (SourceGrid is TtsGrid) then exit;

  try
    CustomColumnDbAssign(sampleDbGrid, TtsDbGrid(SourceGrid));
  except on E:Exception do
    ShowMessage('Error configuring grid columns within TopGrid Editor ' + E.Message);
  end;
  LoadSelectableFields;
end;

procedure TfmOsGridEditor.LoadSelectableFields;
var i : integer;
    newColumn : TosSelectedColumn;
begin
  try
    lbFields.Sorted := miSortedFieldList.Checked;
    for i := 0 to srcFieldNames.Count - 1 do
    begin
      newColumn := TosSelectedColumn.Create;
      newColumn.FieldName := srcFieldNames.Strings[i];
      newColumn.Heading := newColumn.FieldName;
      FieldNames.AddObject(newColumn.FieldName, newColumn);
      if (not FieldInGrid(newColumn.FieldName)) then
         lbFields.Items.AddObject(newColumn.Heading, newColumn);
    end;
  except on E:Exception do
    //ShowMessage('Error loading fields ' + E.Message);
  end;
  gbFields.Caption := IntToStr(lbFields.Items.Count) + ' Selectable Fields ';
end;

procedure TfmOsGridEditor.ReloadSelectableFields;
begin
  ClearFieldNames;
  FieldNames := TStringList.Create;
  lbFields.Items.Clear;
  LoadSelectableFields;
end;

function  TfmOsGridEditor.GetDataBound : Boolean;
begin
  Result := (TargetGrid is TtsDbGrid);
end;

procedure TfmOsGridEditor.btAddFieldClick(Sender: TObject);
begin
  AddField;
end;

procedure TfmOsGridEditor.IncCols;
begin
  if demoGrid is TtsDbGrid then TtsDbGrid(demoGrid).Cols := TtsDbGrid(demoGrid).Cols + 1
  else TtsGrid(demoGrid).Cols := TtsGrid(demoGrid).Cols + 1;
end;

procedure TfmOsGridEditor.AddBlankColumn;
begin
  GridModified;
  IncCols;
  SelectedCol := GetDemoGridPropertyValue('Cols');
  SelectedtsCol.Heading := 'Column ' + IntToStr(SelectedCol);
  RefreshColProperties;
  MoveTo(SelectedCol, GetGridCurrentDataRow);
  edColHeading.Text := SelectedtsCol.Heading;
end;

function TfmOsGridEditor.InsertField : Boolean;
var i, toPos : Integer;
    selColumn : TosSelectedColumn;
begin
  Result := False;
  if lbFields.ItemIndex >= 0 then
  begin
    GridModified;
    i := lbFields.ItemIndex;
    selColumn := TosSelectedColumn(lbFields.Items.Objects[i]);
    demoGrid.BeginUpdate;
    FBinding := True;
    demoGrid.ResetColProperties([prSelected]);
    try
      IncCols;
      toPos := 1;
      if SelectedtsCol <> Nil then
         toPos := SelectedtsCol.DisplayCol;
      GetGridCol(GetGridCols).Heading := selColumn.Heading;
      GetGridCol(GetGridCols).FieldName := selColumn.FieldName;
      GetGridCol(GetGridCols).displayCol := toPos;
      if (FieldForName(selColumn.FieldName) <> Nil) and
         (FieldForName(selColumn.FieldName).DataType = ftString) then
         GetGridCol(GetGridCols).MaxLength := FieldForName(selColumn.FieldName).Size;
    finally
      demoGrid.EndUpdate;
      FBinding := False;
    end;
    selColumn.Col := Self.GetGridDataColnr(toPos);
    SelectedCol := Self.GetGridDataColnr(toPos);
    lbFields.Items.Delete(i);
    if lbFields.items.Count < i then
       lbFields.ItemIndex := i - 1
    else
       lbFields.ItemIndex := i;
    Result := True;
    FColumnsChanged := True;
  end;
  gbFields.Caption := IntToStr(lbFields.Items.Count) + ' Selectable Fields ';
  AdjustFieldButtons;
end;

function TfmOsGridEditor.FieldForName(sFieldName : String) : TField;
begin
  Result := Nil;
  if (sampleDbGrid.DataSource <> Nil) and
     (sampleDbGrid.DataSource.DataSet <> Nil) then
     Result := sampleDbGrid.DataSource.DataSet.FieldList.Find(sFieldName);
end;

function TfmOsGridEditor.AddField : Boolean;
var i : Integer;
    selColumn : TosSelectedColumn;
begin
  Result := False;
  if lbFields.ItemIndex >= 0 then
  begin
    GridModified;
    demoGrid.BeginUpdate;
    try
    i := lbFields.ItemIndex;
    selColumn := TosSelectedColumn(lbFields.Items.Objects[i]);
    IncCols;
    demoGrid.ResetColProperties([prSelected]);
    GetGridCol(GetGridCols).Heading := selColumn.Heading;
    if (FieldForName(selColumn.FieldName) <> Nil) and
       (FieldForName(selColumn.FieldName).DataType = ftString) then
       GetGridCol(GetGridCols).MaxLength := FieldForName(selColumn.FieldName).Size;
    GetGridCol(GetGridCols).FieldName := selColumn.FieldName;
    selColumn.Col := GetDemoGridPropertyValue('Cols');
    SelectedCol := GetDemoGridPropertyValue('Cols');
    lbFields.Items.Delete(i);
    if lbFields.items.Count < i then
       lbFields.ItemIndex := i - 1
    else
       lbFields.ItemIndex := i;
    Result := True;
    finally
      demoGrid.EndUpdate;
      FColumnsChanged := True;
    end;
  end;
  gbFields.Caption := IntToStr(lbFields.Items.Count) + ' Selectable Fields ';
  AdjustFieldButtons;
end;

procedure TfmOsGridEditor.edColHeadingChange(Sender: TObject);
begin
  if (edColHeading.Tag >= 1) and
     (SelectedCol > 0) then
  begin
    GetGridCol(SelectedCol).Heading := edColHeading.Text;
    edColHeading.Tag := 2;
    GridModified;
  end;
end;

procedure TfmOsGridEditor.edColHeadingEnter(Sender: TObject);
begin
  edColHeading.Tag := 1;
end;

procedure TfmOsGridEditor.edColHeadingExit(Sender: TObject);
begin
  if (edColHeading.Tag = 2) and
     (SelectedCol > 0) then
  begin
    AddModifiedColProperty('Heading');
    RefreshColProperties;
    if (SelectedtsCol.ButtonType = btCombo) and
       (ComboIndex(SelectedtsCol) >= 0) then
       lbCombos.Items.Strings[ComboIndex(SelectedtsCol)] := edColHeading.Text;
  end;
  edColHeading.Tag := 0;
end;

procedure TfmOsGridEditor.lbFieldsDblClick(Sender: TObject);
begin
  AddField;
end;

procedure TfmOsGridEditor.GridModified;
begin
  tbSave.Enabled := True;
end;

procedure TfmOsGridEditor.RemoveSelectedCols;
var i, iCol : integer;
    sList : TStringList;
begin
  sList := TStringList.Create;
  iCol := GetGridSelectedCols.First;
  demoGrid.BeginUpdate;
  try
    while (iCol > 0) do
    begin
      ReplaceDbField(GetGridCol(GetGridDataColnr(iCol)).FieldName);
      if GetGridCol(GetGridDataColnr(iCol)).ButtonType = btCombo then
         RemoveCombo(GetGridCol(GetGridDataColnr(iCol)));
      GridModified;
      sList.AddObject(IntToStr(GetGridDataColnr(iCol)), GetGridCol(GetGridDataColnr(iCol)));
      iCol := GetGridSelectedCols.Next(iCol);
    end;
  finally
    // Now delete the columns...
    for i := 0 to sList.Count - 1 do
    begin
      iCol := TtsCol(sList.Objects[i]).DisplayCol;
      demoGrid.DeleteCols(iCol, iCol);
    end;
    demoGrid.EndUpdate;
    GridModified;
    sList.Free;
    SelectedCol := -1;
    if demoGrid is TtsDbGrid then
       SelectedCol := sampleDbGrid.CurrentDataCol
    else
       SelectedCol := sampleGrid.CurrentDataCol;
  end;
  gbFields.Caption := IntToStr(lbFields.Items.Count) + ' Selectable Fields ';
end;

function TfmOsGridEditor.ReplaceDbField(sFieldName : String) : Boolean;
var selColumn : TosSelectedColumn;
begin
  selColumn := Nil;
  if (sFieldName <> '') and
     (FieldNames.IndexOf(sFieldName) >= 0) then
     selColumn := TosSelectedColumn(FieldNames.Objects[FieldNames.IndexOf(sFieldName)]);
  if selColumn <> Nil then
  begin
    selColumn.Col := 0;
    lbFields.Items.AddObject(sFieldName, selColumn);
    Result := True
  end
  else
    Result := False;
end;

procedure TfmOsGridEditor.RemoveCol;
var iCol : integer;
begin
  // Remove either a db field column or just a computed column...
  ReplaceDbField(GetGridCol(SelectedCol).FieldName);

  if ComboIndex(SelectedtsCol) >= 0 then
     RemoveCombo(SelectedtsCol);
  iCol := SelectedCol;
  GridModified;
  demoGrid.DeleteCols(SelectedCol, SelectedCol);
  //ResequenceColumns;
  SelectedCol := -1;
  if iCol > GetGridCols then
     SelectedCol := iCol - 1
  else
     SelectedCol := iCol;
  SelectedCombo := Nil;
  CheckCombos;
  FColumnsChanged := True;
  gbFields.Caption := IntToStr(lbFields.Items.Count) + ' Selectable Fields ';
end;

procedure TfmOsGridEditor.SetSelectedColProperty(aValue : Integer);
begin
  FSelectedColProperty := aValue;
  if (veColEditor.Rows >= aValue) and
     (aValue > 0) then
  begin
     veColEditor.CurrentDataRow := aValue;
     veColEditor.PutCellInView(2, aValue);
  end;
end;

procedure TfmOsGridEditor.RefreshColProperties;
var
  PropertyIndex,
  PropertyCount, iIndex : Integer;
  PropList      : TPropList;
  sName, sText : String;
begin
  if SelectedtsCol = Nil then exit;

  FColPropertiesRefresh := True;
  veColEditor.BeginUpdate;
  try
    PropertyCount := GetPropList(SelectedtsCol.ClassInfo, tkProperties, @PropList) ;
    veColEditor.Rows := 0;
    for PropertyIndex := 0 to PropertyCount -1 do
    begin
      sName := PropList[PropertyIndex].Name;
      if TestColPropertyView(sName) then
      begin
        veColEditor.Rows := veColEditor.Rows + 1;
        iIndex := veColEditor.Rows;
        sText := GetColPropertyValueText(sName, iIndex);
        veColEditor.Cell[1, iIndex] := sName;
        if (sName = 'Visible') and
           (SelectedtsCol.Tag = 1) then
          veColEditor.Cell[2, iIndex] := 'False'
        else
          veColEditor.Cell[2, iIndex] := sText;
      end;
    end;
  finally
    veColEditor.EndUpdate;
    FColPropertiesRefresh := False;
  end;
end;
  
function TfmOsGridEditor.GetColPropertyValueText(PropertyName: String; forRow : Integer) : String;
begin
  Result := VarToStr(GetPropValue(SelectedtsCol, PropertyName, False));
  if (AnsiCompareText(PropertyName, 'DateTimeDef') = 0) then
  begin
    Result := '';
    if SelectedtsCol.DateTimeDef <> Nil then
       Result := SelectedtsCol.DateTimeDef.Name;
    veColEditor.CellButtonType[2, forRow] := btCombo;
  end
  else
  case GetColPropertyType(PropertyName) of
    ptSpin    : veColEditor.CellButtonType[2, forRow] := btVertSpin;
    ptCombo   :
        begin
          Result := GetEnumProp(SelectedtsCol, PropertyName);
          veColEditor.CellButtonType[2, forRow] := btCombo;
        end;
    ptBoolean :
        begin
          Result := GetEnumProp(SelectedtsCol, PropertyName);
          veColEditor.CellButtonType[2, forRow] := btCombo;
        end;
    ptButton  :
        begin
          veColEditor.CellButtonType[2, forRow] := btNormal;
          Result := '(' + PropertyName + ')';
        end;
    ptColor   :
        begin
          ColorToIdent(StrToint(Result), Result);
          veColEditor.CellButtonType[2, forRow] := btCombo;
        end;
    ptEdit :
        begin
          if PropertyName = 'SpinOptions' then
          begin
            Result := Self.SpinOptionToText(SelectedtsCol.SpinOptions);
            veColEditor.CellButtonType[2, forRow] := btNormal;
          end;
        end;
  end;
end;

function TfmOsGridEditor.TestColPropertyView(sPropertyName : String) : Boolean;
var sModLookup : String;
begin
  Result := False;
  case TosColPropertyView(cbColPropertyView.ItemIndex) of
    cpAll      : Result := (sPropertyName <> 'ComboDatasource');
    cpHeading  : Result := (Pos('Head', sPropertyName) > 0);
    cpControls : Result := (ColControlProperties.IndexOf(sPropertyName) >= 0);
    cpBasic    : Result := (ColBasicProperties.IndexOf(sPropertyName) >= 0);
    cpCustom   : Result := (ColCustomProperties.IndexOf(sPropertyName) >= 0);
    cpModified :
       begin
         if selectedtsCol.FieldName <> '' then
            sModLookup := selectedtsCol.FieldName + '.' + sPropertyName
         else
            sModLookup := selectedtsCol.Heading + '.' + sPropertyName;
         Result := (ColModifiedProperties.IndexOf(sModLookup) >= 0);
       end;
  end;
end;

procedure TfmOsGridEditor.cbColPropertyViewClick(Sender: TObject);
begin
  veColEditor.Rows := 0;
  RefreshColProperties;
  btEditCustomColProperties.Visible := (cbColPropertyView.Itemindex = Integer(cpCustom));
  ColumnView := cbColPropertyView.Text;
end;

procedure TfmOsGridEditor.tbCloseClick(Sender: TObject);
begin
{$IFDEF rtTest}
  Close;
{$ELSE}
  ModalResult := mrOk;
{$ENDIF}
end;

procedure TfmOsGridEditor.veEditorButtonClick(Sender: TObject; DataCol,
  DataRow: Integer);
begin
  if (AnsiCompareText(veEditor.Cell[1, DataRow], 'Font') = 0) then
     dgFont.Font := GetGridFont
  else if (AnsiCompareText(veEditor.Cell[1, DataRow], 'HeadingFont') = 0) then
     dgFont.Font := GetGridHeadingFont
  else
     exit;
  if dgFont.Execute then
  begin
    if (AnsiCompareText(veEditor.Cell[1, DataRow], 'Font') = 0) then
    begin
       if demoGrid is TtsDbGrid then TtsDbGrid(demoGrid).Font := dgFont.Font
       else TtsGrid(demoGrid).Font := dgFont.Font;
       GridModifiedProperties.Add('Font');
       GridModified;
    end
    else if (AnsiCompareText(veEditor.Cell[1, DataRow], 'HeadingFont') = 0) then
    begin
       if demoGrid is TtsDbGrid then TtsDbGrid(demoGrid).HeadingFont := dgFont.Font
       else TtsGrid(demoGrid).HeadingFont := dgFont.Font;
       GridModifiedProperties.Add('HeadingFont');
       GridModified;
    end;
  end;
end;

procedure TfmOsGridEditor.tbDeleteColumnClick(Sender: TObject);
begin
  if GetGridSelectedCols.Count > 0 then
     RemoveSelectedCols
  else if SelectedCol > 0 then
     RemoveCol;
end;

procedure TfmOsGridEditor.veColEditorButtonClick(Sender: TObject; DataCol,
  DataRow: Integer);
begin
  if (AnsiCompareText(veColEditor.Cell[1, DataRow], 'Font') = 0) then
  begin
     SelectedtsCol.ParentFont := False;
     dgFont.Font := SelectedtsCol.Font;
  end
  else if (AnsiCompareText(veColEditor.Cell[1, DataRow], 'HeadingFont') = 0) then
  begin
     SelectedtsCol.HeadingParentFont := False;
     dgFont.Font := SelectedtsCol.HeadingFont;
  end
  else if (AnsiCompareText(veColEditor.Cell[1, DataRow], 'SpinOptions') = 0) then
  begin
    dgSpinOptions := TdgSpinOptions.Create(Self);
    try
      if dgSpinOptions.EditOptions(SelectedtsCol.SpinOptions) then
      begin
        SelectedtsCol.SpinOptions := dgSpinOptions.GetSpinOptions;
        veColEditor.Cell[2, DataRow] := Self.SpinOptionToText(dgSpinOptions.GetSpinOptions);
        GridModified;
      end;
    finally
      dgSpinOptions.Free;
    end;
    exit;
  end
  else
     exit;
     
  if dgFont.Execute then
  begin
    if (AnsiCompareText(veColEditor.Cell[1, DataRow], 'Font') = 0) then
    begin
       SelectedtsCol.Font := dgFont.Font;
       AddModifiedColProperty('Font');
    end
    else if (AnsiCompareText(veColEditor.Cell[1, DataRow], 'HeadingFont') = 0) then
    begin
       SelectedtsCol.HeadingFont := dgFont.Font;
       AddModifiedColProperty('HeadingFont');
    end;
  end;
end;

procedure TfmOsGridEditor.tbAddColumnClick(Sender: TObject);
begin
  AddBlankColumn;
end;

procedure TfmOsGridEditor.veColEditorComboDropDown(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer);
var sPropName, sValue : String;
begin
  sPropName := veColEditor.Cell[1, DataRow];
  Combo.Tag := 0;
  if GetColPropertyType(sPropName) = ptColor then
  begin
    Combo.Tag := 2;
    Combo.Rows := 42;
    Combo.DropDownRows := 12;
  end
  else if GetColPropertyType(sPropName) = ptBoolean then
  begin
    Combo.Tag := 1;
    Combo.Rows := 2;
    if LowerCase(sValue) = 'true' then
       Combo.Grid.CurrentDataRow := 1
    else
       Combo.Grid.CurrentDataRow := 2;
   end
   else if (AnsiCompareText(sPropName, 'DateTimeDef') = 0) then
   begin
     Combo.Rows := lsDateTimeDefs.Count;
     Combo.Tag := 5;
   end
   else if GetColPropertyType(sPropName) = ptCombo then
   begin
     Combo.Rows := LoadEnumList(SelectedtsCol, sPropName);
     if Combo.Rows <= 8 then
        Combo.DropDownRows := Combo.Rows
     else
        Combo.DropDownRows := 8;
     sValue := GetEnumProp(SelectedtsCol, sPropName);
     Combo.Grid.CurrentDataRow := EnumList.IndexOf(sValue) + 1;
     Combo.Tag := 3;
   end;
end;

procedure TfmOsGridEditor.veColEditorComboGetValue(Sender: TObject;
  Combo: TtsComboGrid; GridDataCol, GridDataRow, ComboDataRow: Integer;
  var Value: Variant);
begin
  Value := Combo.Cell[1, ComboDataRow];
  veColEditor.Cell[GridDataCol, GridDataRow] := Value;
  BindColProperty(GridDataRow);
end;

procedure TfmOsGridEditor.veColEditorComboCellLoaded(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer; var Value: Variant);
begin
  if Combo.Tag = 1 then // Boolean
  begin
    if DataRow = 1 then
       Value := 'True'
    else
       Value := 'False';
  end
  else if Combo.Tag = 2 then // Colors
    Value := 'cl' + cbColors.Items.Strings[DataRow-1]
  else if (Combo.Tag = 3) and
          (DataRow <= EnumList.Count) then // Enumerated list
    Value := EnumList.Strings[DataRow-1]
  else if (Combo.Tag = 4) then
    Value := cbPropertyView.Items.Strings[DataRow-1]
  else if (Combo.Tag = 5) then
    Value := lsDateTimeDefs.Strings[DataRow-1];
end;


procedure TfmOsGridEditor.veColEditorComboInit(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer);
begin
  Combo.Grid.Width := veColEditor.Col[2].Width - 15;
  Combo.Color := clWindow;
  Combo.DropDownStyle := ddDropDownList;
  Combo.GridLines := glNone;
  Combo.AutoSearch := asTop;
end;

procedure TfmOsGridEditor.tbSaveClick(Sender: TObject);
begin
  Apply;
  tbSave.Enabled := False;
end;

procedure TfmOsGridEditor.rgGridModeClick(Sender: TObject);
begin
  if TtsGridMode(rgGridMode.ItemIndex) <> GetGridMode then
  begin
    if demoGrid is TtsDbGrid then TtsDbGrid(demoGrid).GridMode := TtsGridMode(rgGridMode.ItemIndex)
    else TtsGrid(demoGrid).GridMode := TtsGridMode(rgGridMode.ItemIndex);
    GridModified;
    AdjustFocusColors;
    GridModifiedProperties.Add('GridMode');
  end;
end;

procedure TfmOsGridEditor.laFontSummaryDblClick(Sender: TObject);
begin
  dgFont.Font := GetGridFont;
  if dgFont.Execute then
  begin
    if demoGrid is TtsDbGrid then TtsDbGrid(demoGrid).Font := dgFont.Font
    else TtsGrid(demoGrid).Font := dgFont.Font;
    laFontSummary.Caption := FontDisplay(GetGridFont);
    laFontSummary.Font.Color := dgFont.Font.Color;
    GridModifiedProperties.Add('Font');
    GridModified;
  end;
end;

procedure TfmOsGridEditor.laHeadingFontSummaryDblClick(Sender: TObject);
begin
  dgFont.Font := GetGridHeadingFont;
  if dgFont.Execute then
  begin
    if demoGrid is TtsDbGrid then TtsDbGrid(demoGrid).HeadingFont := dgFont.Font
    else TtsGrid(demoGrid).HeadingFont := dgFont.Font;
    laHeadingFontSummary.Caption := FontDisplay(GetGridHeadingFont);
    laHeadingFontSummary.Font.Color := dgFont.Font.Color;
    GridModifiedProperties.Add('HeadingFont');
    GridModified;
  end;
end;

function TfmOsGridEditor.FontDisplay(aFont : TFont) : String;
begin
  Result := aFont.Name + ' (' + IntToStr(aFont.Size) + ') - ';
  if fsBold in aFont.Style then
     Result := Result + 'Bold' + ',';
  if fsItalic in aFont.Style then
     Result := Result + 'Italic' + ',';
  if fsUnderline in aFont.Style then
     Result := Result + 'Underline' + ',';
  if fsStrikeout in aFont.Style then
     Result := Result + 'Strikeout' + ',';
  if Result[Length(Result)] = ',' then
     System.Delete(Result, Length(Result), 1);
end;

procedure TfmOsGridEditor.pgEditorChange(Sender: TObject);
begin
  if pgEditor.ActivePage = tsCommon then
     AdjustCommonProperties
  else if pgEditor.ActivePage = tsAdvanced then
  begin
     RefreshGridProperties;
  end
  else if pgEditor.ActivePage = tsColumns then
  begin
     if cbColPropertyView.ItemIndex = -1 then
        cbColPropertyView.ItemIndex := cbColPropertyView.Items.IndexOf(ColumnView);
     RefreshColProperties;
     AdjustFieldButtons;
  end
  else if pgEditor.ActivePage = tsCombos then
  begin
     LoadComboDataSources;
     if (lbCombos.Items.Count > 0) then
     begin
       lbCombos.ItemIndex := 0;
       SelectItemCombo;
     end
     else
       SelectedCombo := Nil;
  end
  else if pgEditor.ActivePage = tsRowProperties then
  begin
    if (sampleGrid.Rows > 0) and (SelectedRow = 0) then
       SelectedRow := 1;
    RefreshRowProperties;
  end
  else if pgEditor.ActivePage = tsCellProperties then
  begin
    if (sampleGrid.Rows > 0) and (SelectedRow = 0) then
       SelectedRow := 1;
    RefreshCellProperties;
  end;
  AdjustToolbar;
end;

procedure TfmOsGridEditor.AdjustFieldButtons;
begin
  btAddField.Enabled := (lbFields.ItemIndex >= 0);
  btInsertField.Enabled := (lbFields.ItemIndex >= 0);
  btAddAllColumns.Enabled := (lbFields.Items.Count > 0);
end;

procedure TfmOsGridEditor.AdjustToolbar;
begin
  tbDefaultJustify.Enabled := (pgEditor.ActivePage = tsColumns);
  tbLeftJustify.Enabled := (pgEditor.ActivePage = tsColumns);
  tbCenterJustify.Enabled := (pgEditor.ActivePage = tsColumns);
  tbRightJustify.Enabled := (pgEditor.ActivePage = tsColumns);
  SetEnablebutLoadPicture;
end;

procedure TfmOsGridEditor.chShowEditorClick(Sender: TObject);
begin
  if GetDemoGridPropertyValue('AlwaysShowEditor') <> chShowEditor.Checked then
  begin
    BindGridVarProperty('AlwaysShowEditor', chShowEditor.Checked);
    GridModifiedProperties.Add('AlwaysShowEditor');
  end;
end;

procedure TfmOsGridEditor.chShowFocusClick(Sender: TObject);
begin
  if GetDemoGridPropertyValue('AlwaysShowFocus') <> chShowFocus.Checked then
  begin
    BindGridVarProperty('AlwaysShowFocus', chShowFocus.Checked);
    GridModifiedProperties.Add('AlwaysShowFocus');
  end;
end;

procedure TfmOsGridEditor.chHeadingOnClick(Sender: TObject);
begin
  if GetDemoGridPropertyValue('HeadingOn') <> chHeadingOn.Checked then
  begin
    BindGridVarProperty('HeadingOn', chHeadingOn.Checked);
    GridModifiedProperties.Add('HeadingOn');
  end;
end;

procedure TfmOsGridEditor.chRowBarOnClick(Sender: TObject);
begin
  if GetDemoGridPropertyValue('RowBarOn') <> chRowBarOn.Checked then
  begin
    BindGridVarProperty('RowBarOn', chRowBarOn.Checked);
    GridModifiedProperties.Add('RowBarOn');
  end;
end;

procedure TfmOsGridEditor.chWantTabsClick(Sender: TObject);
begin
  if GetDemoGridPropertyValue('WantTabs') <> chWantTabs.Checked then
  begin
    BindGridVarProperty('WantTabs', chWantTabs.Checked);
    GridModifiedProperties.Add('WantTabs');
  end;
end;

procedure TfmOsGridEditor.cbVertAlignmentChange(Sender: TObject);
var Val : Variant;
begin
  if FBinding then exit;
  
  Val := GetDemoGridPropertyValue('VertAlignment');
  if ((VarType(Val) = varInteger) and
      (Val <> TtsVertAlignment(cbVertAlignment.ItemIndex))) then
      BindGridVarProperty('VertAlignment', cbVertAlignment.ItemIndex)
  else if ((VarType(Val) = varString) and
           (Val <> cbVertAlignment.Items[cbVertAlignment.ItemIndex])) then
      BindGridVarProperty('VertAlignment', cbVertAlignment.Items[cbVertAlignment.ItemIndex]);
end;

procedure TfmOsGridEditor.cbGridLinesChange(Sender: TObject);
var Val : Variant;
begin
  if FBinding then exit;

  Val := GetDemoGridPropertyValue('GridLines');
  if ((VarType(Val) = varInteger) and
      (Val <> TtsGridLines(cbGridLines.ItemIndex))) then
      BindGridVarProperty('GridLines', cbGridLines.ItemIndex)
  else if ((VarType(Val) = varString) and
           (Val <> cbGridLines.Items[cbGridLines.ItemIndex])) then
      BindGridVarProperty('GridLines', cbGridLines.Items[cbGridLines.ItemIndex]);
end;

procedure TfmOsGridEditor.sampleGridCellLoaded(Sender: TObject; DataCol,
  DataRow: Integer; var Value: Variant);
begin
  if not sampleGrid.StoreData then
     Value := IntToStr(DataCol) + ', ' + IntToStr(DataRow);
end;

procedure TfmOsGridEditor.sampleGridColResized(Sender: TObject;
  RowColnr: Integer);
begin
  if (RowColnr <= 0) or FBinding then exit;

  SelectedCol := RowColnr;
  SelectedtsCol.Width := GetGridCol(RowColnr).Width;
  AddModifiedColProperty('Width');
  RefreshColProperties;
  pnIndicator.Left := XforCol(SelectedtsCol.DisplayCol);
  if SelectedtsCol.DisplayCol < GetGridLeftCol then
     pnIndicator.Width := 0
  else
     pnIndicator.Width := GetGridCol(SelectedCol).Width;  
end;

procedure TfmOsGridEditor.cbColSelectChange(Sender: TObject);
var Val : Variant;
begin
  if FBinding then exit;

  Val := GetDemoGridPropertyValue('ColSelectMode');
  if ((VarType(Val) = varInteger) and
      (Val <> TtsColSelectMode(cbColSelect.ItemIndex))) then
      BindGridVarProperty('ColSelectMode', cbColSelect.ItemIndex)
  else if ((VarType(Val) = varString) and
           (Val <> cbColSelect.Items[cbColSelect.ItemIndex])) then
      BindGridVarProperty('ColSelectMode', cbColSelect.Items[cbColSelect.ItemIndex]);
end;

procedure TfmOsGridEditor.cbRowSelectChange(Sender: TObject);
var Val : Variant;
begin
  if FBinding then exit;

  Val := GetDemoGridPropertyValue('RowSelectMode');
  if ((VarType(Val) = varInteger) and
      (Val <> TtsRowSelectMode(cbRowSelect.ItemIndex))) then
      BindGridVarProperty('RowSelectMode', cbRowSelect.ItemIndex)
  else if ((VarType(Val) = varString) and
           (Val <> cbRowSelect.Items[cbRowSelect.ItemIndex])) then
      BindGridVarProperty('RowSelectMode', cbRowSelect.Items[cbRowSelect.ItemIndex]);
end;

procedure TfmOsGridEditor.veColEditorEndCellEdit(Sender: TObject; DataCol,
  DataRow: Integer; var Cancel: Boolean);
begin
  BindColProperty(DataRow);
end;

procedure TfmOsGridEditor.btAddAllColumnsClick(Sender: TObject);
var bResult : Boolean;
begin
  demoGrid.BeginUpdate;
  FBinding := True;
  try
    lbFields.ItemIndex := 0;
    repeat
       bResult := AddField;
    until not bResult;
  finally
    FBinding := False;
    demoGrid.EndUpdate;
  end;
end;

procedure TfmOsGridEditor.miResetGridPropertyClick(Sender: TObject);
begin
  SetPropertyValueText(demoGrid, veEditor.Cell[1, veEditor.CurrentDataRow], GetPropValue(TargetGrid, veEditor.Cell[1, veEditor.CurrentDataRow], False));
  if GridModifiedProperties.IndexOf(veEditor.Cell[1, veEditor.CurrentDataRow]) >= 0 then
     GridModifiedProperties.Delete(GridModifiedProperties.IndexOf(veEditor.Cell[1, veEditor.CurrentDataRow]));
  veEditor.DeleteRows(veEditor.CurrentDataRow, veEditor.CurrentDataRow);
end;

procedure TfmOsGridEditor.miResetAllGridPropertiesClick(Sender: TObject);
var i : integer;
begin
  for i := 0 to GridModifiedProperties.Count - 1 do
    SetPropertyValueText(demoGrid, GridModifiedProperties.Strings[i], GetPropValue(TargetGrid, GridModifiedProperties.Strings[i], False));
  GridModifiedProperties.Clear;
  RefreshGridProperties;
end;

procedure TfmOsGridEditor.miResetColumnPropertyClick(Sender: TObject);
var srcCol : TtsCol;
    curCol : Integer;

  procedure RemoveProperty(sProperty : String);
  var i : Integer;
      sFldProperty : String;
  begin
    sFldProperty := SelectedtsCol.FieldName + '.' + sProperty;
    i := ColModifiedProperties.IndexOf(sFldProperty);
    if i >= 0 then
       ColModifiedProperties.Delete(i)
    else
    begin
      sFldProperty := SelectedtsCol.Heading + '.' + sProperty;
      i := ColModifiedProperties.IndexOf(sFldProperty);
      if i >= 0 then
         ColModifiedProperties.Delete(i)
    end;
  end;
begin
  srcCol := SourceColFor(SelectedtsCol);
  if srcCol <> Nil then
     SetPropertyValueText(SelectedtsCol, veColEditor.Cell[1, veColEditor.CurrentDataRow], GetPropValue(srcCol, veColEditor.Cell[1, veColEditor.CurrentDataRow], False))
  else
     Beep;
  RemoveProperty(veColEditor.Cell[1, veColEditor.CurrentDataRow]);
  veColEditor.DeleteRows(veColEditor.CurrentDataRow, veColEditor.CurrentDataRow);
  curCol := SelectedCol;
  FSelectedCol := 0;
  SelectedCol := curCol;  
end;

procedure TfmOsGridEditor.miResetAllColumnPropertiesClick(Sender: TObject);
var i, curCol : integer;
    srcCol : TtsCol;

  function PropertyText(sText : String) : String;
  begin
    Result := Copy(sText, Pos('.', sText) + 1, 100);
  end;
begin
  srcCol := SourceColFor(SelectedtsCol);

  for i := 0 to ColModifiedProperties.Count - 1 do
    if srcCol <> Nil then
       SetPropertyValueText(SelectedtsCol, PropertyText(ColModifiedProperties.Strings[i]), GetPropValue(srcCol, PropertyText(ColModifiedProperties.Strings[i]), False))
    else
       SelectedtsCol.Reset(tsAllProperties);
  ColModifiedProperties.Clear;
  RefreshColProperties;
  curCol := SelectedCol;
  FSelectedCol := 0;
  SelectedCol := curCol;
end;

function TfmOsGridEditor.SourceColFor(aCol : TtsCol) : TtsCol;
var i, iCols : integer;
    srcCol : TtsCol;
begin
  Result := Nil;
  if TargetGrid is TtsGrid then
     iCols := TtsGrid(TargetGrid).Cols
  else
     iCols := TtsDbGrid(TargetGrid).Cols;
  // find the column with this field name...
  for i := 1 to iCols do
  begin
    if TargetGrid is TtsGrid then
       srcCol := TtsGrid(TargetGrid).Col[i]
    else
       srcCol := TtsDbGrid(TargetGrid).Col[i];
    if (srcCol.FieldName = aCol.FieldName) then
    begin
      Result := srcCol;
      break;
    end;
  end;
  if Result = Nil then // try by heading now...
  begin
    for i := 1 to iCols do
    begin
      if TargetGrid is TtsGrid then
         srcCol := TtsGrid(TargetGrid).Col[i]
      else
         srcCol := TtsDbGrid(TargetGrid).Col[i];
      if (srcCol.Heading = aCol.Heading) then
      begin
        Result := srcCol;
        break;
      end;
    end;
  end;
end;

procedure TfmOsGridEditor.pmResetPopup(Sender: TObject);
begin
  // Only enable if Modified property in view and selected...
  miResetAllGridProperties.Enabled := (pgEditor.ActivePage = tsAdvanced) and (cbPropertyView.Text = 'Modified');
  if miResetAllGridProperties.Enabled and
     (veEditor.CurrentDataRow > 0) then
  begin
    miResetGridProperty.Caption := 'Reset Grid Property ' + veEditor.Cell[1, veEditor.CurrentDataRow];
    miResetGridProperty.Enabled := True;
  end
  else
  begin
    miResetGridProperty.Caption := 'Reset Grid Property';
    miResetGridProperty.Enabled := False;
  end;
  miResetAllColumnProperties.Enabled := (pgEditor.ActivePage = tsAdvanced) and (cbColPropertyView.Text = 'Modified') and (SelectedtsCol <> Nil);
  miResetColumnProperty.Enabled := miResetAllColumnProperties.Enabled and (veColEditor.Rows > 0);
  miResetColumnProperty.Caption := 'Reset Column Property';
  if miResetColumnProperty.Enabled and
     (veColEditor.CurrentDataRow > 0) then
     miResetColumnProperty.Caption := 'Reset Column Property ' + veColEditor.Cell[1, veColEditor.CurrentDataRow];

  miSortedFieldList.Enabled := (demoGrid = sampleDbGrid);   
end;

procedure TfmOsGridEditor.ToolButton3Click(Sender: TObject);
begin
  demoGrid.ResetColProperties([prDisplayNumber]);
end;

procedure TfmOsGridEditor.sampleGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 // if not sampleGrid.StoreData then
 //    Key := 0;
end;

procedure TfmOsGridEditor.sampleGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 // if not sampleGrid.StoreData then
 //   Key := 0;
end;

procedure TfmOsGridEditor.sampleGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not sampleGrid.StoreData then
     Key := #0;
end;

procedure TfmOsGridEditor.cbControlTypeChange(Sender: TObject);
begin
  if GetGridSelectedCols.Count > 0 then
  begin
    SetColumnsProperty('ControlType', TtsControlType(cbControlType.ItemIndex));
    RefreshColProperties;
    AddModifiedColProperty('ButtonType');
  end
  else if (SelectedCol > 0) and
          (TtsControlType(cbControlType.ItemIndex) <> SelectedtsCol.ControlType) then
  begin
    SelectedtsCol.ControlType := TtsControlType(cbControlType.ItemIndex);
    AddModifiedColProperty('ControlType');
    RefreshColProperties;
  end;
end;

procedure TfmOsGridEditor.cbButtonTypeChange(Sender: TObject);
begin
  if GetGridSelectedCols.Count > 0 then
  begin
    SetColumnsProperty('ButtonType', TtsButtonType(cbButtonType.ItemIndex));
    RefreshColProperties;
    AddModifiedColProperty('ButtonType');
  end
  else if (SelectedCol > 0) and
     (TtsButtonType(cbButtonType.ItemIndex) <> SelectedtsCol.ButtonType) then
  begin
    SelectedtsCol.ButtonType := TtsButtonType(cbButtonType.ItemIndex);
    AddModifiedColProperty('ButtonType');
    RefreshColProperties;
    if SelectedtsCol.ButtonType = btCombo then
       AddCombo(SelectedtsCol)
    else if ComboIndex(SelectedtsCol) >= 0 then
       RemoveCombo(SelectedtsCol);
  end;
end;

procedure TfmOsGridEditor.chColMovingClick(Sender: TObject);
begin
  if GetDemoGridPropertyValue('ColMoving') <> chColMoving.Checked then
  begin
    BindGridVarProperty('ColMoving', chColMoving.Checked);
    GridModifiedProperties.Add('ColMoving');
  end;
end;

procedure TfmOsGridEditor.chRowMovingClick(Sender: TObject);
begin
  if GetDemoGridPropertyValue('RowMoving') <> chRowMoving.Checked then
  begin
    BindGridVarProperty('RowMoving', chRowMoving.Checked);
    GridModifiedProperties.Add('RowMoving');
  end;
end;

procedure TfmOsGridEditor.sampleDbGridColResized(Sender: TObject;
  RowColnr: Integer);
var i, newWidth : Integer;
begin
  if (RowColnr <= 0) or FBinding then exit;
  
  SelectedCol := RowColnr;
  newWidth := GetGridCol(RowColnr).Width;
  SelectedtsCol.Width := newWidth;
  AddModifiedColProperty('Width');
  RefreshColProperties;
  pnIndicator.Left := XforCol(SelectedtsCol.DisplayCol);
  if SelectedtsCol.DisplayCol < GetGridLeftCol then
     pnIndicator.Width := 0
  else
     pnIndicator.Width := GetGridCol(SelectedCol).Width;

  // Check to see if other columns are selected to change their widths as well...
  if (sampleDbGrid.SelectedCols.Count > 1) then
     for i := 1 to sampleDbGrid.Cols do
       if (sampleDbGrid.Col[i].Selected) then
          sampleDbGrid.Col[i].Width := newWidth;
end;

procedure TfmOsGridEditor.FormShow(Sender: TObject);
begin
  FStartup := False;
  sampleDbGrid.Align := alClient;
  sampleGrid.Align := alClient;
end;

procedure TfmOsGridEditor.btCustomGridEditClick(Sender: TObject);
begin
  dgCustomGridProperties := TdgCustomGridProperties.Create(Self);
  try
    dgCustomGridProperties.Edit(demoGrid);
  finally
    dgCustomGridProperties.Free;
    LoadCustomGridProperties;
    RefreshGridProperties;
  end;
end;

procedure TfmOsGridEditor.SetColumnView(aValue : String);
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey(TG_REGENTRIES + 'Designer', True);
    Reg.WriteString('ColumnView', aValue);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

function TfmOsGridEditor.GetColumnView : String;
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey(TG_REGENTRIES + 'Designer', True);
    Result := '';
    try
      if Reg.ValueExists('ColumnView') then
         Result := Reg.ReadString('ColumnView');
    except on E:Exception do
      Result := '';
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TfmOsGridEditor.SetGridView(aValue : String);
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey(TG_REGENTRIES + 'Designer', True);
    Reg.WriteString('GridView', aValue);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

function TfmOsGridEditor.GetGridView : String;
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey(TG_REGENTRIES + 'Designer', True);
    Result := '';
    try
      if Reg.ValueExists('GridView') then
         Result := Reg.ReadString('GridView');
    except on E:Exception do
      Result := '';
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TfmOsGridEditor.SetFieldSort(aValue : Boolean);
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey(TG_REGENTRIES + 'Designer', True);
    Reg.WriteBool('FieldSort', aValue);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

function TfmOsGridEditor.GetFieldSort : Boolean;
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey(TG_REGENTRIES + 'Designer', True);
    Result := True;
    try
      if Reg.KeyExists('FieldSort') then
         Result := Reg.ReadBool('FieldSort');
    except on E:Exception do
      Result := True;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TfmOsGridEditor.LoadCustomGridProperties;
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey(TG_REGENTRIES + 'CustomGridProperties', True);
    GridCustomProperties.CommaText := Reg.ReadString('CustomGridProperties');
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TfmOsGridEditor.LoadCustomColProperties;
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey(TG_REGENTRIES + 'CustomColProperties', True);
    ColCustomProperties.CommaText := Reg.ReadString('CustomColProperties');
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TfmOsGridEditor.btEditCustomColPropertiesClick(Sender: TObject);
var aCol : TtsCol; aGrid : TtsDbGrid;
begin
  dgCustomColProperties := TdgCustomColProperties.Create(Self);
  aGrid := TtsDbGrid.Create(Self);
  aGrid.InsertCol(1, 'test');
  aCol := aGrid.Col[1];
  try
    dgCustomColProperties.Edit(aCol);
  finally
    dgCustomColProperties.Free;
    aGrid.Free;
    LoadCustomColProperties;
    RefreshColProperties;
  end;
end;

procedure TfmOsGridEditor.SplitterMoved(Sender: TObject);
begin
  sampleDbGrid.Align := alClient;
  sampleGrid.Align := alClient;
  SaveWindowState;
end;

procedure TfmOsGridEditor.edDefaultRowHeightExit(Sender: TObject);
begin
  if FBinding then exit;
  if StrToInt(edDefaultRowHeight.Text) <> GetGridDefaultRowHeight then
  begin
    BindGridVarProperty('DefaultRowHeight', StrToInt(edDefaultRowHeight.Text));
    GridModifiedProperties.Add('DefaultRowHeight');
  end;
end;

procedure TfmOsGridEditor.edDefaultColWidthExit(Sender: TObject);
begin
  if FBinding then exit;
  if StrToInt(edDefaultColWidth.Text) <> GetGridDefaultColWidth then
  begin
    BindGridVarProperty('DefaultColWidth', StrToInt(edDefaultColWidth.Text));
    GridModifiedProperties.Add('DefaultColWidth');
  end;
end;

procedure TfmOsGridEditor.edDefaultColWidthKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    edDefaultColWidthExit(Self);
    Key := #0;
  end;
end;

procedure TfmOsGridEditor.edDefaultRowHeightKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    edDefaultRowHeightExit(Self);
    Key := #0;
  end;
end;

procedure TfmOsGridEditor.tbLeftJustifyClick(Sender: TObject);
begin
  tbLeftJustify.Down := True;
  SetColJustification;
end;

procedure TfmOsGridEditor.SetColJustification;
var Val : Variant;
begin
  if tbLeftJustify.Down then
    {$IFNDEF TSVER_V5}
    Val := 'htaLeft'
    {$ELSE}
    Val := htaLeft
    {$ENDIF}
  else if tbCenterJustify.Down then
    {$IFNDEF TSVER_V5}
    Val := 'htaCenter'
    {$ELSE}
    Val := htaCenter
    {$ENDIF}
  else if tbRightJustify.Down then
    {$IFNDEF TSVER_V5}
    Val := 'htaRight'
    {$ELSE}
    Val := htaRight
    {$ENDIF}
  else
  begin
    {$IFNDEF TSVER_V5}
    Val := 'htaDefault'
    {$ELSE}
    Val := htaDefault
    {$ENDIF}
  end;
  SetColumnsProperty('HorzAlignment', Val);
  SetColumnsProperty('HeadingHorzAlignment', Val);
  RefreshColProperties;
end;

procedure TfmOsGridEditor.SetColumnsProperty(sPropName : String; Value : Variant);
var iCol : Integer;
begin
  if GetGridSelectedCols.Count = 0 then
     BindColVarProperty(sPropName, Value)
  else
  begin
    iCol := GetGridSelectedCols.First;
    while (iCol > 0) do
    begin
      SetPropertyValueText(GetGridCol(GetGridDataColnr(iCol)), sPropName, Value);
      if (sPropName = 'ButtonType') then
      begin
        if TtsButtonType(Value) = btCombo then
           AddCombo(GetGridCol(GetGridDataColnr(iCol)))
        else if ComboIndex(GetGridCol(GetGridDataColnr(iCol))) >= 0 then
           RemoveCombo(GetGridCol(GetGridDataColnr(iCol)));
      end;
      iCol := GetGridSelectedCols.Next(iCol)
    end;
  end;
  FColumnsChanged := True;
end;

procedure TfmOsGridEditor.tbCenterJustifyClick(Sender: TObject);
begin
  tbCenterJustify.Down := True;
  SetColJustification;
end;

procedure TfmOsGridEditor.tbRightJustifyClick(Sender: TObject);
begin
  tbRightJustify.Down := True;
  SetColJustification;
end;

procedure TfmOsGridEditor.tbDefaultJustifyClick(Sender: TObject);
begin
  tbDefaultJustify.Down := True;
  SetColJustification;
end;

procedure TfmOsGridEditor.sampleDbGridColMoved(Sender: TObject;
  ToDisplayCol, Count: Integer; ByUser: Boolean);
begin
  AddModifiedColProperty('DisplayCol');
  GridModified;
  FColumnsChanged := True;
end;

procedure TfmOsGridEditor.sampleDbGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var iCol, iRow : Integer;
begin
  if Button = mbLeft then
  begin
    sampleDbGrid.CellFromXY(X, Y, iCol, iRow);
    if (iCol = 0) then
       exit;

    if (sampleDbGrid.DataSource <> Nil) and
       ((sampleDbGrid.DataSource.DataSet = Nil) or
        (not sampleDbGrid.DataSource.DataSet.Active)) then
       SelectedCol := sampleDbGrid.DataColnr[iCol]
    else if (sampleDbGrid.GridMode = gmListBox) or
            (sampleDbGrid.Col[sampleDbGrid.DataColnr[iCol]].ReadOnly) then
       SelectedCol := sampleDbGrid.DataColnr[iCol];
  end;
end;

function TfmOsGridEditor.IndexOfMask(sName : String) : Integer;
var i : integer;
begin
  Result := -1;
  for i := 0 to cbMask.Items.Count - 1 do
    if (cbMask.Items.Objects[i] <> Nil) and
       (TosMaskEntry(cbMask.Items.Objects[i]).Name = sName) then
    begin
      Result := i;
      break;
    end;
end;

function TfmOsGridEditor.AddMaskEntry(sName, sPicture : String; bSystem : Boolean) : TosMaskEntry;
begin
  if IndexOfMask(sName) = -1 then
  begin
    Result := TosMaskEntry.Create;
    Result.Name := sName;
    Result.Picture := sPicture;
    Result.System := bSystem;
    cbMask.Items.AddObject(Result.DisplayName, Result);
  end
  else
  begin
    Result := Nil;
    Beep;
    sbStatus.Panels[3].Text := 'Mask with Name ' + sName + ' already exists - new entry ignored!';
  end;
end;

procedure TfmOsGridEditor.LoadSystemMasks;
begin
  cbMask.Items.Clear;
  AddMaskEntry('sysDateEntry', '##/##/[##]##', True);
  AddMaskEntry('sysShortDecimal', '#*5[#][.##]', True);
  AddMaskEntry('sysLongDecimal', '#*7[#][.##]', True);
  AddMaskEntry('sysMoney', '[$]#*7[#][.##]', True);
  AddMaskEntry('sysEuroMoney', '#*7[#][;,[##,#]]', True);
  AddMaskEntry('sysTimeEntry', '[#]#:##[:##] [AM,PM]', True);
  AddMaskEntry('sysConvertUpper', '>>*[?]', True);
  AddMaskEntry('sysPhone', '(###) ### - ####', True);
  AddMaskEntry('sysColors', '{Black,Blue,Green,Red,Yellow,Orange,Navy}', True);
  AddMaskEntry('sysShortInteger', '*3[#]', True);
  AddMaskEntry('sysLongInteger', '*9[#]', True);
end;

procedure TfmOsGridEditor.AppendTtsMaskMasks;
var newMask : TtsMask;
    i : Integer;
begin
  if SourceMaskDefs <> Nil then
  begin
    for i := 0 to SourceMaskDefs.Masks.Count - 1 do
    begin
      newMask := SourceMaskDefs.Masks.Items[i];
      if (newMask <> Nil) and
         (IndexOfMask(newMask.Name) = -1) then
         AddMaskEntry(newMask.Name, newMask.Picture, False);
    end;
  end;
end;

function TfmOsGridEditor.SourceMaskDefs : TtsMaskDefs;
begin
  Result := Nil;
  if (SourceGrid is TtsGrid) then
    Result := TtsMaskDefs(TtsGrid(SourceGrid).MaskDefs)
  else if (SourceGrid is TtsDbGrid) then
    Result := TtsMaskDefs(TtsDbGrid(SourceGrid).MaskDefs);
end;

function TfmOsGridEditor.AddMask(theMask : TosMaskEntry) : Boolean;
var newMask : TtsMask;
begin
  Result := False;
  if SourceMaskDefs = Nil then
    MessageDlg(SNoMaskDefs, mtError, [mbOk], 0)
  else
  begin
    // Check to see if this mask is already in the maskDefs component first...
    if SourceMaskDefs.Mask[theMask.Name] = Nil then
    begin
      newMask := SourceMaskDefs.Masks.Add;
      newMask.Name := theMask.Name;
      newMask.Picture := theMask.Picture;
    end;
    SelectedtsCol.MaskName := theMask.Name;
    Result := True;
  end;
end;

procedure TfmOsGridEditor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and
     (SelectedtsCol <> Nil) and
     (pgEditor.ActivePage = tsColumns) then
  begin
    if (Key = vk_Right) and
       (SelectedtsCol.DisplayCol < GetGridCols) then
    begin
       SelectedCol := GetGridDataColnr(SelectedtsCol.DisplayCol + 1);
       Key := 0;
    end
    else if (Key = vk_Left) and
            (SelectedtsCol.DisplayCol > 1) then
    begin
       SelectedCol := GetGridDataColnr(SelectedtsCol.DisplayCol - 1);
       Key := 0;
    end;
  end;
end;

procedure TfmOsGridEditor.cbMaskKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_Insert) and
     (SelectedtsCol <> Nil) then
  begin
    if SourceMaskDefs = Nil then
       MessageDlg(SNoMaskDefs, mtError, [mbOk], 0)
    else
       DefineNewMask;
  end;
end;

procedure TfmOsGridEditor.DefineNewMask;
begin
  dgDefineMask := TdgDefineMask.Create(Self);
  try
    if dgDefineMask.ShowModal = mrOk then
    begin
      AddMaskEntry(dgDefineMask.edName.Text, dgDefineMask.edPicture.Text, False);
      cbMask.ItemIndex := IndexOfMask(dgDefineMask.edName.Text);
      SetMask;
    end;
  finally
    dgDefineMask.Free;
  end;
end;

procedure TfmOsGridEditor.btEditMaskClick(Sender: TObject);
begin
  if (SelectedtsCol = Nil) then exit;
  if Self.SourceMaskDefs = Nil then
  begin
    MessageDlg(SNoMaskDefs, mtError, [mbOk], 0);
    exit;
  end;

  if SelectedtsCol.MaskName = '' then
     DefineNewMask
  else if (cbMask.Items.Objects[cbMask.ItemIndex] <> Nil) Then
     EditMask(TosMaskEntry(cbMask.Items.Objects[cbMask.ItemIndex]));
end;

procedure TfmOsGridEditor.EditMask(anEntry : TosMaskEntry);
var aMask : TtsMask;
    i : Integer;
begin
  dgDefineMask := TdgDefineMask.Create(Self);
  try
    dgDefineMask.edName.Text     := anEntry.Name;
    dgDefineMask.edPicture.Text  := anEntry.Picture;
    if dgDefineMask.ShowModal = mrOk then
    begin
      aMask := SourceMaskDefs.Masks.Items[anEntry.Name];
      anEntry.Name := dgDefineMask.edName.Text;
      anEntry.Picture := dgDefineMask.edPicture.Text;
      i := cbMask.ItemIndex;
      cbMask.Items.Strings[cbMask.ItemIndex] := anEntry.DisplayName;
      cbMask.ItemIndex := i;
      if aMask <> Nil then
      begin
        aMask.Name := anEntry.Name;
        aMask.Picture := anEntry.Picture;
      end;
      SelectedtsCol.MaskName := anEntry.Name;
      SetMask;
    end;
  finally
    dgDefineMask.Free;
  end;
end;

procedure TfmOsGridEditor.cbMaskClick(Sender: TObject);
begin
  SetMask;
  btEditMask.Enabled := (cbMask.ItemIndex > 0) and (not TosMaskEntry(cbMask.Items.Objects[cbMask.ItemIndex]).System);
  cbMask.Width := 145;
end;

procedure TfmOsGridEditor.cbMaskDropDown(Sender: TObject);
begin
  PostionOnMaskName;
  cbMask.Width := 300;
end;

procedure TfmOsGridEditor.cbMaskCloseUp(Sender: TObject);
begin
  cbMask.Width := 145;
end;

procedure TfmOsGridEditor.PostionOnMaskName;
var i : integer;
begin
  if veColEditor.Cell[1, veColEditor.CurrentDataRow] = 'MaskName' then
     exit;

  for i := 1 to veColEditor.Rows do
    if veColEditor.Cell[1, i] = 'MaskName' then
    begin
      veColEditor.CurrentCell.MoveTo(2, i);
      veColEditor.CurrentCell.PutInView;
      break;
    end;
end;

procedure TfmOsGridEditor.cbMaskExit(Sender: TObject);
begin
  SetMask;
  cbMask.Width := 145;
  btEditMask.Enabled := (cbMask.ItemIndex > 0) and (not TosMaskEntry(cbMask.Items.Objects[cbMask.ItemIndex]).System);
end;

procedure TfmOsGridEditor.SetMask;
var bMod : Boolean;
    sName : String;
begin
  sName := '';
  if cbMask.ItemIndex > 0 then
     sName := TosMaskEntry(cbMask.Items.Objects[cbMask.ItemIndex]).Name;
  if (not FBinding) and
     (SelectedtsCol <> Nil) and
     (SelectedtsCol.MaskName <> sName) then
  begin
    bMod := False;
    if (cbMask.ItemIndex <= 0) and
       (SelectedtsCol.MaskName <> '') then
    begin
       SelectedtsCol.MaskName := '';
       bMod := True;
       cbMask.ItemIndex := -1;
       cbColPropertyView.SetFocus;
    end
    else if (cbMask.ItemIndex > 0) then
      bMod := AddMask(TosMaskEntry(cbMask.Items.Objects[cbMask.ItemIndex]));
    if bMod then
    begin
      AddModifiedColProperty('MaskName');
      PostionOnMaskName;
      veColEditor.Cell[2, veColEditor.CurrentDataRow] := SelectedtsCol.MaskName;
    end;
  end;
end;

procedure TfmOsGridEditor.btCustomMasksClick(Sender: TObject);
begin
  dgCustomMasks := TdgCustomMasks.Create(Self);
  try
    dgCustomMasks.Edit(cbMask.Items);
  finally
    dgCustomMasks.Free;
  end;
end;

procedure TfmOsGridEditor.AppendCustomMasks;
var Reg: TRegistry;
    sText, sMask : String;
    i, iLen : Integer;
    Mask : TosMaskEntry;

  procedure IncludeMask;
  begin
    Mask := TosMaskEntry.Create;
    Mask.StorageText := sMask;
    if IndexOfMask(Mask.Name) = -1 then
       cbMask.Items.AddObject(Mask.Name, Mask);
    sMask := '';
  end;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey(TG_REGENTRIES + 'CustomMasks', True);
    sText := Reg.ReadString('CustomMasks');
    iLen := Length(sText);
    i := 1;
    sMask := '';
    while (i <= iLen) do
    begin
      sMask := sMask + sText[i];
      if (sText[i] = #13) then
         IncludeMask;
      Inc(i);
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
    cbMask.Items.Add(' Clear Mask');
  end;
end;

procedure TfmOsGridEditor.EnsureCombos;
var i, j : Integer;
    sText : String;
begin
  for i := 1 to GetGridCols do
  begin
    if (GetGridCol(i).ButtonType = btCombo) and
       (ComboIndex(GetGridCol(i)) = -1) then
       lbCombos.ItemIndex := lbCombos.Items.AddObject(GetGridCol(i).Heading, GetGridCol(i));
    if demoGrid = sampleGrid then
    begin
      for j := 1 to sampleGrid.Rows do
         if sampleGrid.CellButtonType[i, j] = btCombo then
         begin
           sText := 'Cell ' + IntToStr(i) + ', ' + IntToStr(j);
           lbCombos.ItemIndex := lbCombos.Items.Add(sText);
           if sampleGrid.CellCombo[i, j] = Nil then
              sampleGrid.AssignCellCombo(i, j);
         end;
    end;
  end;
end;

procedure TfmOsGridEditor.ClearComboProperties;
begin
  FBinding := True;
  try
    edDropDownCols.Text := '';
    udDropDownCols.Position := 0;
    edValueCol.Text := '';
    udValueCol.Position := 0;
    edDropDownRows.Text := '';
    udDropDownRows.Position := 0;
    chValueColSorted.Checked := False;
    chAutoFill.Checked := False;
    chAutoLookup.Checked := False;
    cbConvertCase.ItemIndex := -1;
    cbCompareType.ItemIndex := -1;
    cbAutoSearch.ItemIndex := -1;
    cbDropDownStyle.ItemIndex := -1;
    chComboStoreData.Checked := False;
  finally
    EnableComboControls(False);
    FBinding := False;
  end;
end;

function TfmOsGridEditor.GetFullName(aComponent : TComponent) : String;
begin
  Result := aComponent.Name;
  if (aComponent.Owner <> TargetGrid.Owner) and
     (aComponent.Owner <> Nil) then
     Result := aComponent.Owner.Name + '.' + Result;
end;

procedure TfmOsGridEditor.AdjustComboProperties;
var sComboFullName : String;
begin
  FBinding := True;
  try
    edDropDownCols.Text := IntToStr(SelectedCombo.DropDownCols);
    udDropDownCols.Position := SelectedCombo.DropDownCols;
    edValueCol.Text := IntToStr(SelectedCombo.ValueCol);
    udValueCol.Position := SelectedCombo.ValueCol;
    udValueCol.Min := 1;
    udValueCol.Max := SelectedCombo.DropDownCols;
    edDropDownRows.Text := IntToStr(SelectedCombo.DropDownRows);
    udDropDownRows.Position := SelectedCombo.DropDownRows;
    chValueColSorted.Checked := SelectedCombo.ValueColSorted;
    chAutoFill.Checked := SelectedCombo.AutoFill;
    chAutoLookup.Checked := SelectedCombo.AutoLookup;
    cbConvertCase.ItemIndex := Integer(SelectedCombo.AutoFillConvertCase);
    cbCompareType.ItemIndex := Integer(SelectedCombo.CompareType);
    cbAutoSearch.ItemIndex := Integer(SelectedCombo.AutoSearch);
    cbDropDownStyle.ItemIndex := Integer(SelectedCombo.DropDownStyle);
    chComboStoreData.Checked := SelectedCombo.Grid.StoreData;
    chAutoLookup.Enabled := (SelectedCombo is TtsDbCombo) and
       (SelectedtsCol <> Nil) and (TtsDbCol(SelectedtsCol).DatasetField <> Nil) and
       (TtsDbCol(SelectedtsCol).DatasetField.FieldKind = fkLookup);
    cbComboDataSource.Enabled := (SelectedCombo is TtsDbCombo) and (not chAutoLookup.Checked);
    if lbCombos.ItemIndex >= 0 then
       gbCombo.Caption := lbCombos.Items.Strings[lbCombos.ItemIndex] + ' Combo ';

    cbComboDataSource.ItemIndex := -1;
    if (SelectedCombo is TtsDbCombo) and
       (TtsDbCombo(SelectedCombo).Grid.DataSource <> Nil) then
    begin
       sComboFullName := GetFullName(TtsDbCombo(SelectedCombo).Grid.DataSource);
       cbComboDataSource.ItemIndex := cbComboDataSource.Items.IndexOf(sComboFullName);
       //ShowMessage(sComboFullName + '  ' + IntToStr(cbComboDataSource.ItemIndex));
       LoadComboDataBookmarks(TtsDbCombo(SelectedCombo).Grid.DataSource.DataSet);
    end
    else if chAutoLookup.Checked and
            (ComboLookupDataSet <> Nil) then
       LoadComboDataBookmarks(ComboLookupDataSet);

    ResetComboGrid;
  finally
    EnableComboControls(True);
    FBinding := False;
  end;
end;

procedure TfmOsGridEditor.EnableComboControls(bEnabled : Boolean);
begin
    edDropDownCols.Enabled := bEnabled;
    edValueCol.Enabled := bEnabled;
    edDropDownRows.Enabled := bEnabled;
    udDropDownCols.Enabled := bEnabled;
    udValueCol.Enabled := bEnabled;
    udDropDownRows.Enabled := bEnabled;
    chValueColSorted.Enabled := bEnabled;
    chAutoFill.Enabled := bEnabled;
    chAutoLookup.Enabled := bEnabled;
    cbConvertCase.Enabled := bEnabled;
    cbCompareType.Enabled := bEnabled;
    cbAutoSearch.Enabled := bEnabled;
    cbDropDownStyle.Enabled := bEnabled;
    chComboStoreData.Enabled := bEnabled;
    veComboProperties.Enabled := bEnabled;
    veComboColEditor.Enabled := bEnabled;
    chColPropertiesShortList.Enabled := bEnabled;
    gdComboData.Enabled := bEnabled;
end;

procedure TfmOsGridEditor.SetSelectedCombo(Value : TtsCombo);
begin
  if (Value <> FSelectedCombo) then
  begin
    FSelectedCombo := Value;
    //ShowMessage('AdjustComboProperties');
    if FSelectedCombo = Nil then
    begin
       //ShowMessage('ClearComboProperties');
       ClearComboProperties;
    end
    else
       AdjustComboProperties;
    //ShowMessage('ResetComboGrid');
    ResetComboGrid;
    // ShowMessage('RefreshComboProperties');
    RefreshComboProperties;
    //ShowMessage('ResetComboColumns');
    ResetComboColumns;
    ResetComboColProperties;  
  end
  else if Value = Nil then
    ClearComboProperties;
end;

function  TfmOsGridEditor.GetSelectedCombo : TtsCombo;
begin
  Result := FSelectedCombo;
end;

procedure TfmOsGridEditor.AddCombo1Click(Sender: TObject);
begin
  AddCombo(SelectedtsCol);
  GridModified;
end;

procedure TfmOsGridEditor.RemoveCombo1Click(Sender: TObject);
begin
  RemoveCombo(SelectedtsCol);
  GridModified;
end;

procedure TfmOsGridEditor.AddCellCombo;
begin
  sampleGrid.AssignCellCombo(SelectedCol, SelectedRow);
  lbCombos.ItemIndex := lbCombos.Items.Add(ComboCellText);
end;

procedure TfmOsGridEditor.RemoveCellCombo;
begin
  SelectedCombo := nil;
  sampleGrid.ResetCellCombo(SelectedCol, SelectedRow);
  if lbCombos.Items.IndexOf(ComboCellText) >= 0 then
     lbCombos.Items.Delete(lbCombos.Items.IndexOf(ComboCellText));
end;

procedure TfmOsGridEditor.AddCombo(toCol : TtsCol);
begin
  if ComboIndex(toCol) = -1 then
  begin
    toCol.AssignCombo;
    toCol.ButtonType := btCombo;
    toCol.Combo.AutoLookup := (ComboLookupDataSet <> Nil);
    lbCombos.ItemIndex := lbCombos.Items.AddObject(toCol.Heading, toCol);
  end;
  SelectItemCombo;
end;

procedure TfmOsGridEditor.RemoveCombo(toCol : TtsCol);
var i, iIndex : Integer;
begin
  iIndex := lbCombos.ItemIndex;
  toCol.ResetCombo;
  toCol.ButtonType := btDefault;
  for i := 0 to lbCombos.Items.Count - 1 do
    if (lbCombos.Items.Objects[i] = toCol) then
    begin
      if i = iIndex then
         SelectedCombo := Nil;
      lbCombos.Items.Delete(i);
      if i = lbCombos.Items.Count then
         lbCombos.ItemIndex := i - 1
      else
         lbCombos.ItemIndex := i;
      break;
    end;
end;

procedure TfmOsGridEditor.lbCombosClick(Sender: TObject);
begin
  SelectItemCombo;
end;

procedure TfmOsGridEditor.ExtractColRow(var DataCol, DataRow : Integer; CellText : String);
var i : Integer;
    sValue : String;
begin
  DataCol := 0;
  DataRow := 0;
  i := Pos(',', CellText);
  sValue := Trim(Copy(CellText, 6, i-6));
  DataCol := StrToInt(sValue);
  sValue := Trim(Copy(CellText, i+1, 3));
  DataRow := StrToInt(sValue);
end;

procedure TfmOsGridEditor.SelectItemCombo;
var iCol, iRow : Integer;
begin
  if lbCombos.ItemIndex = -1 then
  begin
     SelectedCombo := Nil;
     gbCombo.Caption := 'No Combo defined ';
  end
  else if (TObject(lbCombos.Items.Objects[lbCombos.ItemIndex]) <> Nil) then
  begin
     chParentCombo.Visible := True;
     SelectedCol := TtsCol(lbCombos.Items.Objects[lbCombos.ItemIndex]).DisplayCol;
     chParentCombo.Checked := SelectedtsCol.ParentCombo;
     SelectedCombo := TtsCol(lbCombos.Items.Objects[lbCombos.ItemIndex]).Combo;
     if SelectedCombo = Nil then
        gbCombo.Caption := 'No Combo defined ';
  end
  else if (Copy(lbCombos.Items.Strings[lbCombos.ItemIndex], 1, 4) = 'Cell') then
  begin
     chParentCombo.Visible := False;
     ExtractColRow(iCol, iRow, lbCombos.Items.Strings[lbCombos.ItemIndex]);
     SelectedCombo := sampleGrid.CellCombo[iCol, iRow];
  end;
end;

function TfmOsGridEditor.ComboIndex(aCol : TtsCol) : Integer;
var i : Integer;
begin
  Result := -1;
  for i := 0 to lbCombos.Items.Count - 1 do
    if (lbCombos.Items.Objects[i] = aCol) and
       (lbCombos.Items.Objects[i] <> Nil) then
    begin
      Result := i;
      break;
    end;
end;

procedure TfmOsGridEditor.edDropDownColsChange(Sender: TObject);
begin
  if (not FBinding) and (SelectedCombo <> Nil) and
     (StrToInt(edDropDownCols.Text) <> SelectedCombo.DropDownCols) then
  begin
     SelectedCombo.DropDownCols := StrToInt(edDropDownCols.Text);
     SelectedCombo.Grid.Cols := SelectedCombo.DropDownCols;
     ResetComboGrid;
     if (SelectedCombo is TtsDbCombo) and
        (TtsDbCombo(SelectedCombo).Grid.DataSource <> Nil) and
        (TtsDbCombo(SelectedCombo).Grid.DataSource.DataSet.FieldCount >= StrToInt(edDropDownCols.Text)) then
     begin
       SelectedCombo.Grid.Col[SelectedCombo.DropDownCols].FieldName :=
           TtsDbCombo(SelectedCombo).Grid.DataSource.DataSet.Fields.Fields[SelectedCombo.DropDownCols].FieldName;
       ResetComboColumns;
     end;
     ResetComboColProperties;
     udValueCol.Max := SelectedCombo.DropDownCols;
     GridModified;
  end;
end;

procedure TfmOsGridEditor.edValueColChange(Sender: TObject);
begin
  if (not FBinding) and  (SelectedCombo <> Nil) and
     (StrToInt(edValueCol.Text) <> SelectedCombo.ValueCol) then
  begin
     SelectedCombo.ValueCol := StrToInt(edValueCol.Text);
     GridModified;
  end;
end;

procedure TfmOsGridEditor.edDropDownRowsChange(Sender: TObject);
begin
  if (not FBinding) and (SelectedCombo <> Nil) and
     (StrToInt(edDropDownRows.Text) <> SelectedCombo.DropDownRows) then
  begin
     SelectedCombo.DropDownRows := StrToInt(edDropDownRows.Text);
     ResetComboGrid;
     GridModified;
  end;
end;

procedure TfmOsGridEditor.chValueColSortedClick(Sender: TObject);
begin
  if (not FBinding) and (SelectedCombo <> Nil) then
  begin
     SelectedCombo.ValueColSorted := chValueColSorted.Checked;
     GridModified;
  end;
end;

procedure TfmOsGridEditor.chAutoFillClick(Sender: TObject);
begin
  if (not FBinding) and (SelectedCombo <> Nil) then
  begin
     SelectedCombo.AutoFill := chAutoFill.Checked;
     GridModified;
  end;
end;

procedure TfmOsGridEditor.cbConvertCaseChange(Sender: TObject);
begin
  if (not FBinding) and (SelectedCombo <> Nil) then
  begin
     SelectedCombo.AutoFillConvertCase := TtsConvertCase(cbConvertCase.ItemIndex);
     GridModified;
  end;
end;

procedure TfmOsGridEditor.cbCompareTypeChange(Sender: TObject);
begin
  if (not FBinding) and (SelectedCombo <> Nil) then
  begin
     SelectedCombo.CompareType := TtsComboCompareType(cbCompareType.ItemIndex);
     GridModified;
  end;
end;

procedure TfmOsGridEditor.cbAutoSearchChange(Sender: TObject);
begin
  if (not FBinding) and (SelectedCombo <> Nil) then
  begin
     SelectedCombo.AutoSearch := TtsComboAutoSearchType(cbAutoSearch.ItemIndex);
     GridModified;
  end;
end;

procedure TfmOsGridEditor.ResetComboGrid;

  procedure ResetGrid;
  var i : Integer;
  begin
    gdComboData.Cols := 0;
    for i := 1 to gdComboData.Cols do
      gdComboData.Col[i].Heading := '';
    gdComboData.Cols := SelectedCombo.DropDownCols;
    gdComboData.StoreData := SelectedCombo.Grid.StoreData;
  end;

  procedure ResetColumns;
  var i : Integer;
      theCol : TtsCol;
  begin
    FBinding := True;
    try
      for i := 1 to gdComboData.Cols do
      begin
        if i <= SelectedCombo.Grid.Cols then
        begin
          if SelectedCombo is TtsDbCombo then
             theCol := TtsDbCombo(SelectedCombo).Grid.Col[TtsDbCombo(SelectedCombo).Grid.DataColnr[i]]
          else
             theCol := TtsCombo(SelectedCombo).Grid.Col[i];
          gdComboData.Col[i].Heading := theCol.Heading;
          gdComboData.Col[i].Width   := theCol.Width;
          gdComboData.Col[i].Color   := theCol.Color;
          gdComboData.Col[i].HeadingColor := theCol.HeadingColor;
          gdComboData.Col[i].HeadingParentFont := theCol.HeadingParentFont;
          if not theCol.HeadingParentFont then
             gdComboData.Col[i].HeadingFont.Assign(theCol.HeadingFont);
          gdComboData.Col[i].ParentFont := theCol.ParentFont;
          if not theCol.ParentFont then
             gdComboData.Col[i].Font.Assign(theCol.Font);
          gdComboData.Col[i].WordWrap := theCol.WordWrap;
          gdComboData.Col[i].HeadingWordWrap := theCol.HeadingWordWrap;
          gdComboData.Col[i].HeadingHorzAlignment := theCol.HeadingHorzAlignment;
          gdComboData.Col[i].HorzAlignment := theCol.HorzAlignment;
          gdComboData.Col[i].Alignment := theCol.Alignment;
          gdComboData.Col[i].ControlType := theCol.ControlType;
        end;
      end;
    finally
      FBinding := False;
    end;
  end;

  procedure ResetColWidths;
  var i : Integer;
  begin
    for i := 1 to gdComboData.Cols do
    begin
      if i <= SelectedCombo.Grid.Cols then
         gdComboData.Col[i].Width := TtsCombo(SelectedCombo).Grid.Col[i].Width;
    end;
  end;

  procedure ResetComboData;
  var i, j : Integer;
  begin
    for i := 1 to SelectedCombo.Grid.Rows do
       for j := 1 to SelectedCombo.DropDownCols do
         gdComboData.Cell[j, i] := SelectedCombo.Grid.Cell[SelectedCombo.Grid.DataColnr[j], i];
  end;
begin
  if SelectedCombo = Nil then
  begin
     gdComboData.Rows := 0;
     gdComboData.Cols := 0;
  end
  else
  begin
    gdComboData.DefaultColWidth := SelectedCombo.Grid.DefaultColWidth;
    if SelectedCombo is TtsDbCombo then
       TtsCustomDBGrid_(SelectedCombo.Grid).FieldState := fsCustomized;
    ResetGrid;
    if gdComboData.StoreData then
    begin
       gdComboData.GridMode := gmEditInsert;
       gdComboData.Rows := SelectedCombo.Grid.Rows;
    end
    else if SelectedCombo.DropDownStyle = ddDropDown then
       gdComboData.GridMode := gmEdit
    else
       gdComboData.GridMode := gmListBox;

    try
      ResetColumns;
      if (SelectedCombo is TtsDbCombo) then
      begin
        if (TtsDbCombo(SelectedCombo).Grid.DataSource <> Nil) then
        begin
          gdComboData.Rows := 0;
          if TtsDbCombo(SelectedCombo).Grid.DataSource.DataSet.Active then
          begin
            gdComboData.Rows := TtsDbCombo(SelectedCombo).Grid.DataSource.DataSet.RecordCount;
            if gdComboData.Rows > MaxComboRows then
               gdComboData.Rows := MaxComboRows;
          end;
        end
        else if (Self.ComboLookupDataSet <> Nil) then
        begin
          gdComboData.Rows := ComboLookupDataSet.RecordCount;
          if gdComboData.Rows > MaxComboRows then
             gdComboData.Rows := MaxComboRows;
        end;
      end
      else
      begin
        if not gdComboData.StoreData then
           gdComboData.Rows := SelectedCombo.DropDownRows;
        ResetColWidths;
      end;
    except on E:exception do
      raise Exception.Create('Error Resetting ComboGrid Rows ! ' + E.Message);
    end;
    gdComboData.EnableRedraw := False;
    try
      gdComboData.Font.Assign(SelectedCombo.Grid.Font);
      gdComboData.Color := SelectedCombo.Grid.Color;
      gdComboData.SelectionColor := SelectedCombo.Grid.SelectionColor;
      gdComboData.SelectionFontColor := SelectedCombo.Grid.SelectionFontColor;
      gdComboData.DefaultRowHeight := SelectedCombo.Grid.DefaultRowHeight;
      gdComboData.GridLines := SelectedCombo.Grid.GridLines;
      gdComboData.HorzAlignment := SelectedCombo.Grid.HorzAlignment;
      gdComboData.VertAlignment := SelectedCombo.Grid.VertAlignment;
      gdComboData.Is3D := SelectedCombo.Grid.Is3D;
      gdComboData.LineColor := SelectedCombo.Grid.LineColor;
      gdComboData.WordWrap := SelectedCombo.Grid.WordWrap;
      if gdComboData.StoreData then
         ResetComboData;
    finally
      gdComboData.EnableRedraw := True;
    end;
  end;
  gdComboData.Invalidate;
end;

procedure TfmOsGridEditor.chAutoLookupClick(Sender: TObject);
begin
  if (not FBinding) and (SelectedCombo <> Nil) then
  begin
     if chAutoLookup.Checked and
        (ComboLookupDataSet = Nil) then
        raise Exception.Create('AutoLookup is only applicable to LookupFields on the underlying dataset!');
     SelectedCombo.AutoLookup := chAutoLookup.Checked;
     if chAutoLookup.Checked then
     begin
       if (ComboLookupDataSet <> Nil) then
          LoadComboDataBookmarks(ComboLookupDataSet);
       cbComboDataSource.ItemIndex := -1;
       cbComboDataSource.Enabled := False;
     end
     else cbComboDataSource.Enabled := True;
     GridModified;
  end;
end;

procedure TfmOsGridEditor.cbDropDownStyleChange(Sender: TObject);
begin
  if (not FBinding) and (SelectedCombo <> Nil) then
  begin
    SelectedCombo.DropDownStyle := TtsDropDownStyle(cbDropDownStyle.ItemIndex);
    ResetComboGrid;
    GridModified;
  end;
end;

procedure TfmOsGridEditor.chComboStoreDataClick(Sender: TObject);
begin
  if (not FBinding) and (SelectedCombo <> Nil) then
  begin
    SelectedCombo.Grid.StoreData := chComboStoreData.Checked;
    if chComboStoreData.Checked then
    begin
      cbComboDataSource.ItemIndex := -1;
      if demoGrid is TtsDbGrid then
         TtsDbCombo(SelectedCombo).Grid.DataSource := Nil;
    end;
    gdComboData.StoreData := chComboStoreData.Checked;
    ResetComboGrid;
    GridModified;
  end;
end;

procedure TfmOsGridEditor.LoadComboDataSources;
begin
  if (SourceGrid = Nil) or
     (SourceGrid.Owner = Nil) then exit;

  if (cbComboDataSource.Items.Count = 0) and
     (lsDataSources <> Nil) then
     cbComboDataSource.Items.AddStrings(lsDataSources);
  if (lbCombos.ItemIndex = -1) and
     (lbCombos.Items.Count > 0) then
  begin
    if ComboIndex(SelectedtsCol) >= 0 then
       lbCombos.ItemIndex := ComboIndex(SelectedtsCol)
    else
       lbCombos.ItemIndex := 0;
    SelectItemCombo;
  end;

  veComboProperties.EnableReDraw := False;
  try
    veComboProperties.Col[1].Heading := 'Property';
    veComboProperties.Col[1].ReadOnly := True;
    veComboProperties.Col[2].Heading := 'Value';
  finally
    veComboProperties.EnableReDraw := True;
  end;
end;

procedure TfmOsGridEditor.cbComboDataSourceClick(Sender: TObject);
begin
  if (not FBinding) and
     (cbComboDataSource.ItemIndex >= 0) and
     (SelectedCombo <> Nil) then
     SetComboDataSource;
end;

procedure TfmOsGridEditor.LoadComboDataBookmarks(fromDataSet : TDataSet);
var i : Integer;
begin
  comboDataBookmarks.Clear;
  if fromDataSet = Nil then exit;
  if fromDataSet.Active then
  begin
    i := 1;
    if fromDataSet = Nil then beep;
    if (fromDataSet <> Nil) and
       fromDataSet.Active then
    begin
      fromDataSet.First;
      while (i <= MaxComboRows) and (not fromDataSet.Eof) do
      begin
        comboDataBookmarks.Add(fromDataSet.Bookmark);
        fromDataSet.Next;
        Inc(i);
      end;
    end;
  end;
end;

procedure TfmOsGridEditor.SetComboDataSource;
var theDataSet : TDataSet;
begin
  if (SelectedCombo is TtsDbCombo) then
  begin
    try
      TtsDbCombo(SelectedCombo).Grid.DataSource := TDataSource(cbComboDataSource.Items.Objects[cbComboDataSource.ItemIndex]);
      SelectedCombo.Grid.Cols := 0;
    except on E:Exception do
      raise Exception.Create('Unable to set combo datasource! ' + E.Message);
    end;
    theDataSet := TDataSource(cbComboDataSource.Items.Objects[cbComboDataSource.ItemIndex]).DataSet;
    LoadComboDataBookmarks(theDataSet);
    ResetComboGrid;
    ResetComboColumns;
  end
  else
  begin
    Beep;
    comboDataBookmarks.Clear;
    sbStatus.Panels[3].Text := 'Cannot set datasource for a TtsCombo';
  end;
  GridModified;
end;

procedure TfmOsGridEditor.gdComboDataCellLoaded(Sender: TObject; DataCol,
  DataRow: Integer; var Value: Variant);
var theCol : TtsCol;
begin
  if (SelectedCombo = Nil) or
     (SelectedCombo.Grid.Cols < DataCol) or
     (SelectedCombo.Grid.StoreData) then exit;

  try
    theCol := TtsDbCombo(SelectedCombo).Grid.Col[DataCol];
    if (SelectedCombo is TtsDbCombo) and
       (TtsDbCombo(SelectedCombo).Grid.DataSource <> Nil) then
    begin
      TtsDbCombo(SelectedCombo).Grid.DataSource.DataSet.Bookmark := comboDataBookmarks.Strings[DataRow-1];
      if (DataCol <= SelectedCombo.Grid.Cols) and
         (TtsDbCombo(SelectedCombo).Grid.Col[DataCol] <> Nil) and
         (TtsDbCombo(SelectedCombo).Grid.Col[DataCol].FieldName <> '') then
         Value := TtsDbCombo(SelectedCombo).Grid.DataSource.DataSet.FieldByName(TtsDbCombo(SelectedCombo).Grid.Col[DataCol].FieldName).AsString;
    end
    else if (SelectedCombo is TtsDbCombo) and
            (TtsDbCombo(SelectedCombo).AutoLookup) and
            (ComboLookupDataSet <> Nil) and
            (theCol.FieldName <> '') then
    begin
      ComboLookupDataSet.Bookmark := comboDataBookmarks.Strings[DataRow-1];
      Value := ComboLookupDataSet.FieldByName(TtsDbCombo(SelectedCombo).Grid.Col[DataCol].FieldName).AsString;
    end;
  except on E:Exception do
    begin
      gdComboData.Rows := 0;
      sbStatus.Panels[3].Text := 'Error in ComboDataCellLoaded for loading datasource contents';
    end;
  end;
end;

procedure TfmOsGridEditor.gdComboDataColResized(Sender: TObject;
  RowColnr: Integer);
begin
  if FBinding then exit;
    
  if (SelectedCombo <> Nil) and
     (RowColnr > 0) and
     (gdComboData.Cols >= RowColnr) and
     (gdComboData.Col[RowColnr] <> Nil) then
  begin
    SelectedCombo.Grid.Col[RowColnr].Width := gdComboData.Col[RowColnr].Width;
    GridModified;
    FColumnsChanged := True;
  end;
end;

procedure TfmOsGridEditor.RefreshComboProperties;
var
  PropertyIndex,
  PropertyCount, iIndex : Integer;
  PropList      : TPropList;
  sName, sText : String;
begin
  if SelectedCombo = Nil then exit;

  veComboProperties.Rows := 0;
  PropertyCount := GetPropList(SelectedCombo.Grid.ClassInfo, tkProperties, @PropList) ;
  for PropertyIndex := 0 to PropertyCount -1 do
  begin
    sName := PropList[PropertyIndex].Name;
    if TestComboPropertyView(sName) then
    begin
      veComboProperties.Rows := veComboProperties.Rows + 1;
      iIndex := veComboProperties.Rows;
      sText := GetComboPropertyValueText(sName);
      veComboProperties.Cell[1, iIndex] := sName;
      veComboProperties.Cell[2, iIndex] := sText;
    end;
  end;
end;

function TfmOsGridEditor.TestComboPropertyView(sPropertyName : String) : Boolean;
begin
  Result := (comboGridProperties.IndexOf(sPropertyName) >= 0);
end;

function TfmOsGridEditor.GetComboPropertyValueText(PropertyName: String ) : String;
begin
  Result := VarToStr(GetPropValue(SelectedCombo.Grid, PropertyName, False));
  case GetComboPropertyType(PropertyName) of
    ptSpin    : veComboProperties.CellButtonType[2, veComboProperties.Rows] := btVertSpin;
    ptCombo   :
        begin
          Result := GetEnumProp(SelectedCombo.Grid, PropertyName);
          veComboProperties.CellButtonType[2, veComboProperties.Rows] := btCombo;
        end;
    ptBoolean :
        begin
          Result := GetEnumProp(SelectedCombo.Grid, PropertyName);
          veComboProperties.CellButtonType[2, veComboProperties.Rows] := btCombo;
        end;
    ptButton  :
        begin
          veComboProperties.CellButtonType[2, veComboProperties.Rows] := btNormal;
          Result := '(' + PropertyName + ')';
        end;
    ptColor   :
        begin
          ColorToIdent(StrToint(Result), Result);
          veComboProperties.CellButtonType[2, veComboProperties.Rows] := btCombo;
        end;
  end;
end;

procedure TfmOsGridEditor.veComboPropertiesButtonClick(Sender: TObject;
  DataCol, DataRow: Integer);
begin
  if (AnsiCompareText(veComboProperties.Cell[1, DataRow], 'Font') = 0) then
  begin
     SelectedCombo.Grid.ParentFont := False;
     dgFont.Font := SelectedCombo.Grid.Font;
  end
  else if (AnsiCompareText(veComboProperties.Cell[1, DataRow], 'HeadingFont') = 0) then
  begin
     SelectedCombo.Grid.HeadingParentFont := False;
     dgFont.Font := SelectedCombo.Grid.HeadingFont;
  end
  else
     exit;
  if dgFont.Execute then
  begin
    if (AnsiCompareText(veComboProperties.Cell[1, DataRow], 'Font') = 0) then
       SelectedCombo.Grid.Font := dgFont.Font
    else if (AnsiCompareText(veComboProperties.Cell[1, DataRow], 'HeadingFont') = 0) then
       SelectedCombo.Grid.HeadingFont := dgFont.Font;
    ResetComboGrid;
  end;
end;

procedure TfmOsGridEditor.veComboPropertiesEndCellEdit(Sender: TObject;
  DataCol, DataRow: Integer; var Cancel: Boolean);
begin
  BindComboProperty(DataRow);
end;

procedure TfmOsGridEditor.BindComboProperty(DataRow : Integer);
begin
  GridModified;
  if GetComboPropertyType(veComboProperties.Cell[1, DataRow]) = ptColor then
     SetPropertyValueText(SelectedCombo.Grid, veComboProperties.Cell[1, DataRow], StringToColor(FullColorName(veComboProperties.Cell[2, DataRow])))
  else
     SetPropertyValueText(SelectedCombo.Grid, veComboProperties.Cell[1, DataRow], veComboProperties.Cell[2, DataRow]);
  FColumnsChanged := True;
  ResetComboGrid;
end;

procedure TfmOsGridEditor.veComboPropertiesComboDropDown(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer);
var sPropName, sValue : String;
begin
  sPropName := veComboProperties.Cell[1, DataRow];
  Combo.Tag := 0;
  if GetComboPropertyType(sPropName) = ptColor then
  begin
    Combo.Tag := 2;
    Combo.Rows := 42;
    Combo.DropDownRows := 12;
  end
  else if GetComboPropertyType(sPropName) = ptBoolean then
  begin
    Combo.Tag := 1;
    Combo.Rows := 2;
    if LowerCase(sValue) = 'true' then
       Combo.Grid.CurrentDataRow := 1
    else
       Combo.Grid.CurrentDataRow := 2;
   end
   else if GetComboPropertyType(sPropName) = ptCombo then
   begin
     Combo.Rows := LoadEnumList(SelectedCombo.Grid, sPropName);
     if Combo.Rows <= 8 then
        Combo.DropDownRows := Combo.Rows
     else
        Combo.DropDownRows := 8;
     sValue := GetEnumProp(SelectedCombo.Grid, sPropName);
     Combo.Grid.CurrentDataRow := EnumList.IndexOf(sValue) + 1;
     Combo.Tag := 3;
   end;

end;

procedure TfmOsGridEditor.veComboPropertiesComboCellLoaded(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer; var Value: Variant);
begin
  if Combo.Tag = 1 then // Boolean
  begin
    if DataRow = 1 then
       Value := 'True'
    else
       Value := 'False';
  end
  else if Combo.Tag = 2 then // Colors
  begin
    Value := 'cl' + cbColors.Items.Strings[DataRow-1];
  end
  else if (Combo.Tag = 3) and
          (DataRow <= EnumList.Count) then // Enumerated list
    Value := EnumList.Strings[DataRow-1];
end;

procedure TfmOsGridEditor.veComboPropertiesComboGetValue(Sender: TObject;
  Combo: TtsComboGrid; GridDataCol, GridDataRow, ComboDataRow: Integer;
  var Value: Variant);
begin
  Value := Combo.Cell[1, ComboDataRow];
  veComboProperties.Cell[GridDataCol, GridDataRow] := Value;
  BindComboProperty(GridDataRow);
end;

procedure TfmOsGridEditor.veComboPropertiesComboInit(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer);
begin
  Combo.Grid.Width := veComboProperties.Col[2].Width - 15;
  Combo.Color := clWindow;
  Combo.DropDownStyle := ddDropDownList;
  Combo.GridLines := glNone;
end;

procedure TfmOsGridEditor.pgComboChange(Sender: TObject);
begin
  if pgCombo.ActivePage = tsComboData then
     ResetComboGrid
  else if pgCombo.ActivePage = tsGridProperties then
  begin
     ResetComboColumns;
     if (lbComboFields.ItemIndex = -1) and
        (lbComboFields.Items.Count >= 0) then
        lbComboFields.ItemIndex := 0;
  end
  else if pgCombo.ActivePage = tsComboColProperties then
     ResetComboColProperties;
end;

function TfmOsGridEditor.ComboLookupDataSet : TDataSet;
begin
  Result := Nil;
  if (demoGrid is TtsDbGrid) and
     (SelectedtsCol.FieldName <> '') and
     (TtsDbGrid(demoGrid).Field[SelectedtsCol.FieldName] <> Nil) and
     (TtsDbGrid(demoGrid).Field[SelectedtsCol.FieldName].DatasetField <> Nil) then
     Result := TtsDbGrid(demoGrid).Field[SelectedtsCol.FieldName].DatasetField.LookupDataSet;
end;

procedure TfmOsGridEditor.CheckCombos;
begin
  lbCombos.Items.Clear;
  EnsureCombos;
  FSelectedCombo := Nil;
end;

procedure TfmOsGridEditor.ResetComboColumns;
var i : Integer;
begin
  lbComboFields.Items.Clear;
  lbAllComboFields.Items.Clear;
  btAddComboColumn.Enabled := False;
  btRemoveComboColumn.Enabled := False;

  if (SelectedCombo <> Nil) then
  begin
    for i := 1 to SelectedCombo.Grid.Cols do
      if (SelectedCombo.Grid.Col[i].FieldName <> '') then
         lbComboFields.Items.Add(SelectedCombo.Grid.Col[i].FieldName);

    if (cbComboDataSource.ItemIndex >= 0) and
       (TtsDbCombo(SelectedCombo).Grid.DataSource.DataSet <> Nil) then
    begin
       for i := 0 to TtsDbCombo(SelectedCombo).Grid.DataSource.DataSet.FieldCount - 1 do
          if lbComboFields.Items.IndexOf(TtsDbCombo(SelectedCombo).Grid.DataSource.DataSet.Fields.Fields[i].FieldName) = -1 then
            lbAllComboFields.Items.Add(TtsDbCombo(SelectedCombo).Grid.DataSource.DataSet.Fields.Fields[i].FieldName);
    end
    else if (chAutoLookup.Checked) and
            (ComboLookupDataSet <> Nil) then
    begin
       for i := 0 to ComboLookupDataSet.FieldCount - 1 do
          if lbComboFields.Items.IndexOf(ComboLookupDataSet.Fields.Fields[i].FieldName) = -1 then
            lbAllComboFields.Items.Add(ComboLookupDataSet.Fields.Fields[i].FieldName);
    end;
  end;
  if (lbComboFields.Items.Count > 0) then
     lbComboFields.ItemIndex := 0;
  if (lbAllComboFields.Items.Count > 0) then
  begin
    lbAllComboFields.ItemIndex := 0;
    // No Columns selected - then select the first one...
    if (lbComboFields.Items.Count = 0) then
    begin
      lbComboFields.ItemIndex := 0;
      btAddComboColumnClick(Self);
    end;
  end;

  AdjustComboFieldButtons;
end;

procedure TfmOsGridEditor.btAddComboColumnClick(Sender: TObject);
var j : Integer;
    sFldName : String;
begin
  if lbAllComboFields.ItemIndex >= 0 then
  begin
    j := lbAllComboFields.ItemIndex;
    sFldName := lbAllComboFields.Items[j];
    lbComboFields.Items.Add(sFldName);
    SelectedCombo.DropDownCols := lbComboFields.Items.Count;
    SelectedCombo.Grid.Cols := SelectedCombo.DropDownCols;
    SelectedCombo.Grid.Col[lbComboFields.Items.Count].FieldName := sFldName;

    lbAllComboFields.Items.Delete(j);
    if j < lbAllComboFields.Items.Count then
       lbAllComboFields.ItemIndex := j
    else
       lbAllComboFields.ItemIndex := lbAllComboFields.Items.Count - 1;
    AdjustComboProperties;
    AdjustComboFieldButtons;
    ResetComboGrid;
    GridModified;
  end;
end;

procedure TfmOsGridEditor.lbAllComboFieldsClick(Sender: TObject);
begin
  btAddComboColumn.Enabled := (lbAllComboFields.ItemIndex >= 0);
end;

procedure TfmOsGridEditor.lbComboFieldsClick(Sender: TObject);
begin
  btRemoveComboColumn.Enabled := (lbComboFields.ItemIndex >= 0);
end;

procedure TfmOsGridEditor.lbAllComboFieldsDblClick(Sender: TObject);
begin
  btAddComboColumnClick(Self);
end;

procedure TfmOsGridEditor.btRemoveComboColumnClick(Sender: TObject);
var j, iCol : Integer;
    sFldName : String;
begin
  if lbComboFields.ItemIndex >= 0 then
  begin
    j := lbComboFields.ItemIndex;
    sFldName := lbComboFields.Items[j];
    lbAllComboFields.Items.Add(sFldName);
    if (SelectedCombo.DropDownCols > 0) and
       (SelectedCombo.Grid.Col[sFldName] <> Nil) then
    begin
      iCol := SelectedCombo.Grid.Col[sFldName].DisplayCol;
      SelectedCombo.Grid.DeleteCols(iCol, iCol);
    end;

    SelectedCombo.Grid.DropDownCols := SelectedCombo.Grid.Cols;
    lbComboFields.Items.Delete(j);
    if j < lbComboFields.Items.Count then
       lbComboFields.ItemIndex := j
    else
       lbComboFields.ItemIndex := lbComboFields.Items.Count - 1;
    AdjustComboProperties;
    AdjustComboFieldButtons;
    ResetComboGrid;
    GridModified;
  end;
end;

procedure TfmOsGridEditor.AdjustComboFieldButtons;
begin
  btAddComboColumn.Enabled := (lbAllComboFields.ItemIndex >= 0);
  btRemoveComboColumn.Enabled := (lbComboFields.ItemIndex >= 0);
  udComboFields.Max := lbComboFields.Items.Count;
end;

procedure TfmOsGridEditor.lbComboFieldsDblClick(Sender: TObject);
begin
  btRemoveComboColumnClick(Self);
end;

procedure TfmOsGridEditor.udComboFieldsClick(Sender: TObject;
  Button: TUDBtnType);

  procedure AdjustGridFields;
  var i : Integer;
  begin
    for i := 1 to lbComboFields.items.Count do
      SelectedCombo.Grid.Col[i].FieldName := lbComboFields.Items[i-1];
    ResetComboGrid;
  end;
begin
  if (Button = btNext) and
     (lbComboFields.ItemIndex >= 1) then // Up
  begin
    lbComboFields.Items.Move(lbComboFields.ItemIndex, lbComboFields.ItemIndex-1);
    lbComboFields.Invalidate;
    AdjustGridFields;
  end
  else if (Button = btPrev) and
          (lbComboFields.ItemIndex < lbComboFields.Items.Count - 1) then // Down
  begin
    lbComboFields.Items.Move(lbComboFields.ItemIndex, lbComboFields.ItemIndex+1);
    lbComboFields.Invalidate;
    AdjustGridFields;
  end;
end;

procedure TfmOsGridEditor.gdComboDataEndCellEdit(Sender: TObject; DataCol,
  DataRow: Integer; var Cancel: Boolean);
begin
  if (SelectedCombo <> Nil) and
     SelectedCombo.Grid.StoreData then
  begin
    if SelectedCombo.Grid.Rows <> gdComboData.Rows then
       SelectedCombo.Grid.Rows := gdComboData.Rows;
    SelectedCombo.Grid.Cell[DataCol, DataRow] := gdComboData.Cell[DataCol, DataRow];
    GridModified;
  end;
end;

procedure TfmOsGridEditor.OpenGridFile;
var
    DefaultExt, Filter: string;
begin
    GetDefaultExtendFilter(DefaultExt, Filter);
    OpenDialog1.DefaultExt := DefaultExt;
    OpenDialog1.Filter := Filter;

    OpenDialog1.Options := [ofFileMustExist, ofHideReadOnly, ofNoChangeDir];
    OpenDialog1.Filename := '';
    if OpenDialog1.Execute then
    begin
        demoGrid.LoadFromFile(OpenDialog1.Filename, cmaNone);
        pgEditor.ActivePage := tsCommon;
        RefreshGridProperties;
        GridModified;
    end;
end;

procedure TfmOsGridEditor.GetDefaultExtendFilter(var DefaultExt: string; var Filter: string);
begin
   { if CurEditor = ComboEditor then
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
    begin   }
        if demoGrid is TtsCustomGrid then
        begin
            DefaultExt := 'TGU';
            Filter := 'TtsGrid files (*.tgu)|*.TGU';
        end
        else
        begin
            DefaultExt := 'TGB';
            Filter := 'TtsDBGrid files (*.tgb)|*.TGB';
        end;
    //end;
end;

procedure TfmOsGridEditor.SaveGridFile;
var
    DefaultExt, Filter: string;
begin
    GetDefaultExtendFilter(DefaultExt, Filter);
    SaveDialog1.DefaultExt := DefaultExt;
    SaveDialog1.Filter := Filter;

    SaveDialog1.Options := [ofFileMustExist, ofHideReadOnly, ofNoChangeDir];
    SaveDialog1.Filename := '';
    if SaveDialog1.Execute then
       demoGrid.SaveToFile(SaveDialog1.Filename, TtsBaseGrid_(demoGrid).StoreData);
end;

procedure TfmOsGridEditor.tbOpenFileClick(Sender: TObject);
begin
  OpenGridFile;
end;

procedure TfmOsGridEditor.tbSaveFileClick(Sender: TObject);
begin
  SaveGridFile;
end;

procedure TfmOsGridEditor.veColEditorDblClick(Sender: TObject);
begin
  if LowerCase(veColEditor.Cell[veColEditor.CurrentDataCol, veColEditor.CurrentDataRow]) = 'true' then
  begin
     veColEditor.Cell[veColEditor.CurrentDataCol, veColEditor.CurrentDataRow] := 'False';
     BindColProperty(veColEditor.CurrentDataRow);
  end
  else if LowerCase(veColEditor.Cell[veColEditor.CurrentDataCol, veColEditor.CurrentDataRow]) = 'false' then
  begin
     veColEditor.Cell[veColEditor.CurrentDataCol, veColEditor.CurrentDataRow] := 'True';
     BindColProperty(veColEditor.CurrentDataRow);
  end
  else if (GetColPropertyType(veColEditor.Cell[1, veColEditor.CurrentDataRow]) = ptCombo) and
          (cbEnum.ItemIndex < cbEnum.Items.Count - 1) then
  begin
    cbEnum.ItemIndex := cbEnum.ItemIndex + 1;
    UpdateColPropertyFromEnum;
  end;
end;

procedure TfmOsGridEditor.veComboPropertiesDblClick(Sender: TObject);
begin
  if LowerCase(veComboProperties.Cell[veComboProperties.CurrentDataCol, veComboProperties.CurrentDataRow]) = 'frue' then
  begin
     veComboProperties.Cell[veComboProperties.CurrentDataCol, veComboProperties.CurrentDataRow] := 'False';
     BindComboProperty(veComboProperties.CurrentDataRow);
  end
  else if LowerCase(veComboProperties.Cell[veComboProperties.CurrentDataCol, veComboProperties.CurrentDataRow]) = 'false' then
  begin
     veComboProperties.Cell[veComboProperties.CurrentDataCol, veComboProperties.CurrentDataRow] := 'True';
     BindComboProperty(veComboProperties.CurrentDataRow);
  end
  else if (GetComboPropertyType(veComboProperties.Cell[1, veComboProperties.CurrentDataRow]) = ptCombo) and
          (cbEnum.ItemIndex < cbEnum.Items.Count - 1) then
  begin
    cbEnum.ItemIndex := cbEnum.ItemIndex + 1;
    UpdateComboPropertyFromEnum;
  end;
end;

procedure TfmOsGridEditor.miAddColumnClick(Sender: TObject);
begin
  AddBlankColumn;
end;

procedure TfmOsGridEditor.RemoveColumn1Click(Sender: TObject);
begin
  if SelectedCol > 0 then
     RemoveCol;
end;

procedure TfmOsGridEditor.miClearAllColumnsClick(Sender: TObject);
begin
  FBinding := True;
  try
    BindGridVarProperty('Cols', 0);
    GridModifiedProperties.Add('Cols');
    SelectedCol := -1;
    ReloadSelectableFields;
  finally
    FBinding := False;
  end;
end;

procedure TfmOsGridEditor.edColsExit(Sender: TObject);
begin
  if FBinding then exit;
  if StrToInt(edCols.Text) <> Self.GetGridCols then
  begin
    BindGridVarProperty('Cols', StrToInt(edCols.Text));
    GridModifiedProperties.Add('Cols');
    GridModified;
  end;
end;

procedure TfmOsGridEditor.edRowsExit(Sender: TObject);
begin
  if FBinding then exit;
  if StrToInt(edRows.Text) <> Self.GetGridRows then
  begin
    BindGridVarProperty('Rows', StrToInt(edRows.Text));
    GridModifiedProperties.Add('Rows');
    GridModified;
  end;
end;

procedure TfmOsGridEditor.edColsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    edColsExit(Self);
    Key := #0;
  end;
end;

procedure TfmOsGridEditor.edRowsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    edRowsExit(Self);
    Key := #0;
  end;
end;

procedure TfmOsGridEditor.udDefaultRowHeightClick(Sender: TObject;
  Button: TUDBtnType);
begin
  edDefaultRowHeightExit(Self);
end;

procedure TfmOsGridEditor.udDefaultColWidthClick(Sender: TObject;
  Button: TUDBtnType);
begin
  edDefaultColWidthExit(Self);
end;

procedure TfmOsGridEditor.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  edColsExit(Self);
end;

procedure TfmOsGridEditor.UpDown2Exit(Sender: TObject);
begin
  edRowsExit(Self);
end;

procedure TfmOsGridEditor.gdComboDataInsertRow(Sender: TObject;
  DataRow: Integer; ByUser: Boolean);
begin
  if gdComboData.StoreData and
     (SelectedCombo <> Nil) then
  begin
    SelectedCombo.Grid.Rows := gdComboData.Rows;
    GridModified;
  end;
end;

procedure TfmOsGridEditor.sampleGridEndCellEdit(Sender: TObject; DataCol,
  DataRow: Integer; var Cancel: Boolean);
begin
  if sampleGrid.StoreData then
     GridModified;
end;

procedure TfmOsGridEditor.gdComboDataDeleteRow(Sender: TObject;
  DataRow: Integer; ByUser: Boolean);
begin
  if gdComboData.StoreData and
     (SelectedCombo <> Nil) then
  begin
    SelectedCombo.Grid.Rows := gdComboData.Rows;
    GridModified;
  end;
end;

procedure TfmOsGridEditor.btInsertFieldClick(Sender: TObject);
begin
  InsertField;
end;

procedure TfmOsGridEditor.tsAdvancedResize(Sender: TObject);
begin
  moPropertyDesc.Width := gbProperty.Width - 20;
  moPropertyDesc.Height := gbProperty.Height - 62;
end;

procedure TfmOsGridEditor.Splitter1Moved(Sender: TObject);
begin
  moPropertyDesc.Width := gbProperty.Width - 20;
  moPropertyDesc.Height := gbProperty.Height - 62;
end;

procedure TfmOsGridEditor.SetSelectedCellProperty(aValue : Integer);
begin
  FSelectedCellProperty := aValue;
  if (veCellEditor.Rows >= aValue) and
     (aValue > 0) then
  begin
     veCellEditor.CurrentDataRow := aValue;
     veCellEditor.PutCellInView(2, aValue);
  end;
end;

procedure TfmOsGridEditor.SetSelectedRowProperty(aValue : Integer);
begin
  FSelectedRowProperty := aValue;
  if (veRowEditor.Rows >= aValue) and
     (aValue > 0) then
  begin
     veRowEditor.CurrentDataRow := aValue;
     veRowEditor.PutCellInView(2, aValue);
  end;
end;

procedure TfmOsGridEditor.SetSelectedRow(Value : Integer);
begin
  if Value = -1 then
  begin
    FSelectedRow := Value;
    tsRowProperties.Caption := 'Row Properties';
    veRowEditor.GridMode := gmBrowse;
    gbRow.Caption := 'Row ';
  end
  else
  begin
    FSelectedRow := Value;
    tsRowProperties.Caption := 'Row ' + IntToStr(FSelectedRow) + ' Properties';
    veRowEditor.GridMode := gmEdit;
    RefreshRowProperties;
    veRowEditor.CurrentDataRow := 1;
    gbRow.Caption := 'Row ' + IntToStr(FSelectedRow) + ' ';
    SelectedRowProperty := FSelectedRowProperty;
  end;
end;

procedure TfmOsGridEditor.RefreshRowProperties;
var iCurrRow : Integer;

  procedure LoadRowProperty(sName : String);
  begin
    veRowEditor.Rows := veRowEditor.Rows + 1;
    veRowEditor.Cell[1, veRowEditor.Rows] := sName;
    if (AnsiCompareText(sName, 'Font') = 0) then
    begin
      veRowEditor.Cell[2, veRowEditor.Rows] := '(Font)';
      veRowEditor.CellButtonType[2, veRowEditor.Rows] := btNormal;
    end;
  end;
begin
  if sampleGrid.Rows = 0 then exit;
  if (SelectedRow <= 0) then
     FSelectedRow := 1;

  FRowPropertiesRefresh := True;
  iCurrRow := veRowEditor.CurrentDataRow;
  veRowEditor.BeginUpdate;
  try
  veRowEditor.Rows := 0;
  LoadRowProperty('ControlType');
  RefreshRowProperty('ControlType');
  LoadRowProperty('ButtonType');
  RefreshRowProperty('ButtonType');
  LoadRowProperty('Color');
  RefreshRowProperty('Color');
  LoadRowProperty('Font');
  LoadRowProperty('Height');
  RefreshRowProperty('Height');  
  LoadRowProperty('Is3D');
  RefreshRowProperty('Is3D');
  LoadRowProperty('ParentFont');
  RefreshRowProperty('ParentFont');
  LoadRowProperty('ReadOnly');
  RefreshRowProperty('ReadOnly');
  LoadRowProperty('MaskName');
  RefreshRowProperty('MaskName');
  LoadRowProperty('DateTimeDef');
  RefreshRowProperty('DateTimeDef');
  LoadRowProperty('Visible');
  RefreshRowProperty('Visible');
  case sampleGrid.RowControlType[SelectedRow] of
    ctText, ctDefault :    begin
                  LoadRowProperty('HorzAlignment');
                  RefreshRowProperty('HorzAlignment');
                  LoadRowProperty('VertAlignment');
                  RefreshRowProperty('VertAlignment');
                  LoadRowProperty('WordWrap');
                  RefreshRowProperty('WordWrap');
                end;
    ctPicture : begin
                  LoadRowProperty('CenterPicture');
                  RefreshRowProperty('CenterPicture');
                  LoadRowProperty('KeepAspectRatio');
                  RefreshRowProperty('KeepAspectRatio');
                  LoadRowProperty('ShrinkPicture');
                  RefreshRowProperty('ShrinkPicture');
                  LoadRowProperty('StretchPicture');
                  RefreshRowProperty('StretchPicture');
                end;
  end;
  case sampleGrid.RowButtonType[SelectedRow] of
     btCombo : begin
                  LoadRowProperty('DropDownStyle');
                  RefreshRowProperty('DropDownStyle');
                  LoadRowProperty('ParentCombo');
                  RefreshRowProperty('ParentCombo');
               end;
     btHorzSpin, btVertSpin :
               begin
                  LoadRowProperty('SpinIncrement');
                  RefreshRowProperty('SpinIncrement');
               end;
  end;
  finally
    veRowEditor.CurrentDataRow := iCurrRow;
    veRowEditor.EndUpdate;
    FRowPropertiesRefresh := False;
  end;
end;

procedure TfmOsGridEditor.RefreshRowProperty(PropertyName : String);
var iRow : Integer;
    Value : Variant;
begin
  iRow := 0;
  repeat
    Inc(iRow)
  until (AnsiCompareText(veRowEditor.Cell[1, iRow], PropertyName) = 0) or
        (iRow > veRowEditor.Rows);
  if iRow <= veRowEditor.Rows then
  begin
    Value := GetRowProperty(PropertyName);
    if VarType(Value) = varBoolean then
    begin
      if Value then
         veRowEditor.Cell[2, iRow] := 'True'
      else
         veRowEditor.Cell[2, iRow] := 'False';
      veRowEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'Color') = 0) then
    begin
       veRowEditor.Cell[2, iRow] := ColorToString(TColor(Value));
       veRowEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'MaskName') = 0) then
    begin
       veRowEditor.Cell[2, iRow] := GetRowProperty(PropertyName);
       veRowEditor.CellButtonType[2, iRow] := btNone;
    end
    else if (AnsiCompareText(PropertyName, 'DateTimeDef') = 0) then
    begin
       veRowEditor.Cell[2, iRow] := GetRowProperty(PropertyName);
       veRowEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'ButtonType') = 0) then
    begin
       veRowEditor.Cell[2, iRow] := ButtonTypeToText(GetRowProperty(PropertyName));
       veRowEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'ControlType') = 0) then
    begin
       veRowEditor.Cell[2, iRow] := ControlTypeToText(GetRowProperty(PropertyName));
       veRowEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'HorzAlignment') = 0) then
    begin
       veRowEditor.Cell[2, iRow] := HorzAlignmentToText(GetRowProperty(PropertyName));
       veRowEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'VertAlignment') = 0) then
    begin
       veRowEditor.Cell[2, iRow] := VertAlignmentToText(GetRowProperty(PropertyName));
       veRowEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'WordWrap') = 0) then
    begin
       veRowEditor.Cell[2, iRow] := WordWrapToText(GetRowProperty(PropertyName));
       veRowEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'CenterPicture') = 0) or (AnsiCompareText(PropertyName, 'KeepAspectRatio') = 0) or
            (AnsiCompareText(PropertyName, 'StretchPicture') = 0) or (AnsiCompareText(PropertyName, 'ShrinkPicture') = 0) then
    begin
       veRowEditor.Cell[2, iRow] := DrawOptionToText(GetRowProperty(PropertyName));
       veRowEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'DropDownStyle') = 0) then
    begin
       veRowEditor.Cell[2, iRow] := DropDownStyleToText(GetRowProperty(PropertyName));
       veRowEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'SpinIncrement') = 0) then
    begin
       veRowEditor.Cell[2, iRow] := Value;
       veRowEditor.CellButtonType[2, iRow] := btVertSpin;
    end
    else if (VarType(Value) = varInteger) then
    begin
      veRowEditor.Cell[2, iRow] := IntToStr(Value);
      veRowEditor.CellButtonType[2, iRow] := btVertSpin;
    end       
  end;
end;

procedure TfmOsGridEditor.veRowEditorButtonClick(Sender: TObject; DataCol, DataRow: Integer);
var bOrig : Boolean;
begin
  if (AnsiCompareText(veRowEditor.Cell[1, DataRow], 'Font') = 0) then
  begin
     bOrig := sampleGrid.RowParentFont[SelectedRow];
     if sampleGrid.RowFont[SelectedRow] = Nil then
        sampleGrid.RowParentFont[SelectedRow] := False;
     dgFont.Font := sampleGrid.RowFont[SelectedRow];
     if dgFont.Execute then
     begin
       sampleGrid.RowParentFont[SelectedRow] := False;
       sampleGrid.RowFont[SelectedRow] := dgFont.Font;
       GridModified;
     end
     else
       sampleGrid.RowParentFont[SelectedRow] := bOrig;
  end;
end;

procedure TfmOsGridEditor.sampleGridRowChanged(Sender: TObject; OldRow,
  NewRow: Integer);
begin
  SelectedRow := sampleGrid.CurrentDataRow;
end;

procedure TfmOsGridEditor.veRowEditorComboCellLoaded(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer; var Value: Variant);
begin
  if Combo.Tag = 1 then // Boolean
  begin
    if DataRow = 1 then
       Value := 'True'
    else
       Value := 'False';
  end
  else if Combo.Tag = 2 then // Colors
  begin
    Value := 'cl' + cbColors.Items.Strings[DataRow-1];
  end
  else if (Combo.Tag = 3) and
          (DataRow <= EnumList.Count) then // Enumerated list
    Value := EnumList.Strings[DataRow-1]
  else if (Combo.Tag = 4) then
    Value := cbPropertyView.Items.Strings[DataRow-1]
  else if (Combo.Tag = 5) then
    Value := lsDateTimeDefs.Strings[DataRow-1];
end;

procedure TfmOsGridEditor.veRowEditorComboDropDown(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer);
var sPropName, sValue : String;
begin
  sPropName := veRowEditor.Cell[1, DataRow];
  Combo.Tag := 0;
  if sPropName = 'Color' then
  begin
    Combo.Tag := 2;
    Combo.Rows := 42;
    Combo.DropDownRows := 12;
  end
  else if (AnsiCompareText(sPropName, 'DateTimeDef') = 0) then
  begin
     Combo.Rows := lsDateTimeDefs.Count;
     Combo.Tag := 5;
  end
  else if (LowerCase(veRowEditor.Cell[2, DataRow]) = 'talse') or
          (LowerCase(veRowEditor.Cell[2, DataRow]) = 'true') then
  begin
    Combo.Tag := 1;
    Combo.Rows := 2;
    if LowerCase(sValue) = 'true' then
       Combo.Grid.CurrentDataRow := 1
    else
       Combo.Grid.CurrentDataRow := 2;
   end
   else if (veRowEditor.CellButtonType[2, DataRow] = btCombo) and
           (sampleGrid.Cols > 0) then // Need to use Col object for ButtonType/ControlType
   begin
     Combo.Rows := LoadEnumList(sampleGrid.Col[1], sPropName);
     if Combo.Rows <= 8 then
        Combo.DropDownRows := Combo.Rows
     else
        Combo.DropDownRows := 8;
     sValue := GetEnumProp(sampleGrid.Col[1], sPropName);
     Combo.Grid.CurrentDataRow := EnumList.IndexOf(sValue) + 1;
     Combo.Tag := 3;
   end;
end;

procedure TfmOsGridEditor.veRowEditorComboGetValue(Sender: TObject;
  Combo: TtsComboGrid; GridDataCol, GridDataRow, ComboDataRow: Integer;
  var Value: Variant);
begin
  Value := Combo.Cell[1, ComboDataRow];
  veRowEditor.Cell[GridDataCol, GridDataRow] := Value;
  if (LowerCase(Value) = 'true') or (LowerCase(Value) = 'false') then
     BindRowProperty(veRowEditor.Cell[1, GridDataRow], Value)
  else if (AnsiCompareText(veRowEditor.Cell[1, GridDataRow], 'Color') = 0) then
    BindRowProperty('Color', Value)
  else if (Combo.Tag = 5) then
    BindRowProperty(veRowEditor.Cell[1, GridDataRow], Value)    
  else
  begin
    BindRowProperty(veRowEditor.Cell[1, GridDataRow], EnumList.IndexOf(Value));
    if (veRowEditor.Cell[1, GridDataRow] = 'ControlType') or
       (veRowEditor.Cell[1, GridDataRow] = 'ButtonType') then
       RefreshRowProperties;
  end;
end;

function  TfmOsGridEditor.GetRowProperty(PropertyName : String) : Variant;
begin
  if (AnsiCompareText(PropertyName, 'Height') = 0) then
     Result := sampleGrid.RowHeight[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'ReadOnly') = 0) then
     Result := sampleGrid.RowReadOnly[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'MaskName') = 0) then
     Result := sampleGrid.RowMaskName[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'DateTimeDef') = 0) then
  begin
    if sampleGrid.RowDateTimeDef[SelectedRow] <> Nil then
       Result := sampleGrid.RowDateTimeDef[SelectedRow].Name
    else
       Result := '';
  end
  else if (AnsiCompareText(PropertyName, 'Visible') = 0) then
     Result := sampleGrid.RowVisible[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'Color') = 0) then
     Result := sampleGrid.RowColor[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'Is3D') = 0) then
     Result := sampleGrid.RowIs3D[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'ParentFont') = 0) then
     Result := sampleGrid.RowParentFont[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'ButtonType') = 0) then
     Result := sampleGrid.RowButtonType[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'ControlType') = 0) then
     Result := sampleGrid.RowControlType[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'HorzAlignment') = 0) then
     Result := sampleGrid.RowHorzAlignment[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'VertAlignment') = 0) then
     Result := sampleGrid.RowVertAlignment[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'WordWrap') = 0) then
     Result := sampleGrid.RowWordWrap[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'ShrinkPicture') = 0) then
     Result := sampleGrid.RowShrinkPicture[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'StretchPicture') = 0) then
     Result := sampleGrid.RowStretchPicture[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'KeepAspectRatio') = 0) then
     Result := sampleGrid.RowKeepAspectRatio[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'CenterPicture') = 0) then
     Result := sampleGrid.RowCenterPicture[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'ParentCombo') = 0) then
     Result := sampleGrid.RowParentCombo[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'SpinIncrement') = 0) then
     Result := sampleGrid.RowSpinIncrement[SelectedRow]
  else if (AnsiCompareText(PropertyName, 'DropDownStyle') = 0) then
     Result := sampleGrid.RowDropDownStyle[SelectedRow];
end;

procedure TfmOsGridEditor.BindRowProperty(PropertyName : String; Value : Variant);
begin             
  GridModified;
  if (AnsiCompareText(PropertyName, 'Height') = 0) then
     sampleGrid.RowHeight[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'ReadOnly') = 0) then
     sampleGrid.RowReadOnly[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'MaskName') = 0) then
     sampleGrid.RowMaskName[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'DateTimeDef') = 0) then
  begin
    if (Value = '') or
       (lsDateTimeDefs.IndexOf(Value) = -1) then
        sampleGrid.RowDateTimeDef[SelectedRow] := Nil
     else
        sampleGrid.RowDateTimeDef[SelectedRow] := TtsDateTimeDefComponent(lsDateTimeDefs.Objects[lsDateTimeDefs.IndexOf(Value)]);
  end
  else if (AnsiCompareText(PropertyName, 'Visible') = 0) then
     sampleGrid.RowVisible[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'Color') = 0) then
     sampleGrid.RowColor[SelectedRow] := StringToColor((FullColorName(Value)))
  else if (AnsiCompareText(PropertyName, 'Is3D') = 0) then
     sampleGrid.RowIs3D[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'ParentFont') = 0) then
     sampleGrid.RowParentFont[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'ButtonType') = 0) then
     sampleGrid.RowButtonType[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'ControlType') = 0) then
     sampleGrid.RowControlType[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'HorzAlignment') = 0) then
     sampleGrid.RowHorzAlignment[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'VertAlignment') = 0) then
     sampleGrid.RowVertAlignment[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'WordWrap') = 0) then
     sampleGrid.RowWordWrap[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'ShrinkPicture') = 0) then
     sampleGrid.RowShrinkPicture[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'StretchPicture') = 0) then
     sampleGrid.RowStretchPicture[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'KeepAspectRatio') = 0) then
     sampleGrid.RowKeepAspectRatio[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'CenterPicture') = 0) then
     sampleGrid.RowCenterPicture[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'ParentCombo') = 0) then
     sampleGrid.RowParentCombo[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'SpinIncrement') = 0) then
     sampleGrid.RowSpinIncrement[SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'DropDownStyle') = 0) then
     sampleGrid.RowDropDownStyle[SelectedRow] := Value;
end;

procedure TfmOsGridEditor.veRowEditorComboInit(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer);
begin
  Combo.Grid.Width := veEditor.Col[2].Width - 15;
  Combo.Color := clWindow;
  Combo.DropDownStyle := ddDropDownList;
  Combo.GridLines := glNone;
  Combo.AutoSearch := asTop;
end;

procedure TfmOsGridEditor.veRowEditorDblClick(Sender: TObject);
begin
  if LowerCase(veRowEditor.Cell[veRowEditor.CurrentDataCol, veRowEditor.CurrentDataRow]) = 'true' then
  begin
     veRowEditor.Cell[veRowEditor.CurrentDataCol, veRowEditor.CurrentDataRow] := 'False';
     BindRowProperty(veRowEditor.Cell[1, veRowEditor.CurrentDataRow], False);
  end
  else if LowerCase(veRowEditor.Cell[veRowEditor.CurrentDataCol, veRowEditor.CurrentDataRow]) = 'false' then
  begin
     veRowEditor.Cell[veRowEditor.CurrentDataCol, veRowEditor.CurrentDataRow] := 'True';
     BindRowProperty(veRowEditor.Cell[1, veRowEditor.CurrentDataRow], True);
  end;
end;

procedure TfmOsGridEditor.veRowEditorEndCellEdit(Sender: TObject; DataCol,
  DataRow: Integer; var Cancel: Boolean);
var Value : Variant;
begin
  Value := veRowEditor.Cell[DataCol, DataRow];
  if (LowerCase(Value) = 'true') or (LowerCase(Value) = 'false') then
     BindRowProperty(veRowEditor.Cell[1, DataRow], Value)
  else if (AnsiCompareText(veRowEditor.Cell[1, DataRow], 'Color') = 0) then
     BindRowProperty('Color', Value)
  else if (AnsiCompareText(veRowEditor.Cell[1, DataRow], 'SpinIncrement') = 0) then
     BindRowProperty('SpinIncrement', Value)
  else if (AnsiCompareText(veRowEditor.Cell[1, DataRow], 'Height') = 0) then
     BindRowProperty(veRowEditor.Cell[1, DataRow], Value)
  else if VarType(Value) = varInteger then
     BindRowProperty(veRowEditor.Cell[1, DataRow], Value)
  else if VarType(Value) = varString then
     BindRowProperty(veRowEditor.Cell[1, DataRow], Value)
  else
  begin
    BindRowProperty(veRowEditor.Cell[1, DataRow], EnumList.IndexOf(Value));
    if (veRowEditor.Cell[1, DataRow] = 'ControlType') or
       (veRowEditor.Cell[1, DataRow] = 'ButtonType') then
       RefreshRowProperties;
  end;
end;

function TfmOsGridEditor.ReadOnlyToText(Value : TtsReadOnly) : String;
begin
  case Value of
    roOn      : Result := 'roOn';
    roOff     : Result := 'roOff';
    roDefault : Result := 'roDefault';
  end;
end;

function TfmOsGridEditor.ButtonTypeToText(Value : TtsButtonType) : String;
begin
  case Value of
    btCombo     : Result := 'btCombo';
    btNormal    : Result := 'btNormal';
    btNone      : Result := 'btNone';
    btDefault   : Result := 'btDefault';
    btVertSpin  : Result := 'btVertSpin';
    btHorzSpin  : Result := 'btHorzSpin';
    btDateTimeDropDown : Result := 'btDateTimeDropDown';
    btDateTimePopup    : Result := 'btDateTimePopup';
  end;
end;

{function TfmOsGridEditor.TextToButtonType(Value : String) : TtsButtonType;
begin
  if Value = 'btCombo' then
     Result := btCombo
  else if Value = 'btNormal' then
     Result := btNormal
  else if Value = 'btNone' then
     Result := btNone
  else if Value = 'btDefault' then
     Result := btDefault
  else if Value = 'btVertSpin' then
     Result := btVertSpin
  else if Value = 'btHorzSpin' then
     Result := btHorzSpin
  else if Value = 'btDateTimeDropDown' then
     Result := btDateTimeDropDown
  else if Value = 'btDateTimePopup' then
     Result := btDateTimePopup
  else
     Result := btDefault;
end;}

{function  TfmOsGridEditor.TextToControlType(Value : String) : TtsControlType;
begin
  if Value = 'ctNone' then
     Result := ctNone
  else if Value = 'ctText' then
     Result := ctText
  else if Value = 'ctCheck' then
     Result := ctCheck
  else if Value = 'ctPicture' then
     Result := ctPicture
  else Result := ctDefault;
end; }

function  TfmOsGridEditor.ControlTypeToText(Value : TtsControlType) : String;
begin
  case Value of
    ctNone    : Result := 'ctNone';
    ctText    : Result := 'ctText';
    ctCheck   : Result := 'ctCheck';
    ctPicture : Result := 'ctPicture';
    ctDefault : Result := 'ctDefault';
  end;
end;

function  TfmOsGridEditor.HorzAlignmentToText(Value : TtsHorzAlignment) : String;
begin
  case Value of
    htaLeft    : Result := 'htaLeft';
    htaCenter  : Result := 'htaCenter';
    htaRight   : Result := 'htaRight';
    htaDefault : Result := 'htaDefault';
  end;
end;

function  TfmOsGridEditor.VertAlignmentToText(Value : TtsVertAlignment) : String;
begin
  case Value of
    vtaTop     : Result := 'vtaTop';
    vtaBottom  : Result := 'vtaBottom';
    vtaCenter  : Result := 'vtaCenter';
    vtaDefault : Result := 'vtaDefault';
  end;
end;

function  TfmOsGridEditor.WordWrapToText(Value : TtsWordWrap) : String;
begin
  case Value of
    wwOn  : Result := 'wwOn';
    wwOff : Result := 'wwOff';
    wwDefault : Result := 'wwDefault';
  end;
end;

function  TfmOsGridEditor.DrawOptionToText(Value : TtsDrawOption) : String;
begin
  case Value of
    dopOn  : Result := 'dopOn';
    dopOff : Result := 'dopOff';
    dopDefault : Result := 'dopDefault';
  end;
end;

function  TfmOsGridEditor.DropDownStyleToText(Value : TtsDropDownStyle) : String;
begin
  case Value of
    ddDropDown     : Result := 'ddDropDown';
    ddDropDownList : Result := 'ddDropDownList';
  end;
end;

function  TfmOsGridEditor.SpinOptionToText(Value : TtsSpinOptions) : String;
begin
  Result := '[';
  if spoAutoRepeat in Value then
     Result := Result + 'AutoRepeat,';
  if spoAutoIncrement in Value then
     Result := Result + 'AutoIncrement,';
  if spoKeyEdit in Value then
     Result := Result + 'KeyEdit,';
  if Result = '[' then
     Result := ''
  else
  begin
    Delete(Result, Length(Result), 1);
    Result := Result + ']';
  end;
end;

procedure TfmOsGridEditor.btShowHiddenRowsClick(Sender: TObject);
var iRow : Integer;
begin
  for iRow := 1 to sampleGrid.Rows do
    sampleGrid.RowVisible[iRow] := True;
end;

procedure TfmOsGridEditor.RefreshCellProperties;
var iCurrRow : Integer;

  procedure LoadCellProperty(sName : String);
  begin
    veCellEditor.Rows := veCellEditor.Rows + 1;
    veCellEditor.Cell[1, veCellEditor.Rows] := sName;
    if (AnsiCompareText(sName, 'Font') = 0) then
    begin
      veCellEditor.Cell[2, veCellEditor.Rows] := '(Font)';
      veCellEditor.CellButtonType[2, veCellEditor.Rows] := btNormal;
    end;
  end;
begin
  if (SelectedRow <= 0) and
     (sampleGrid.Rows > 0) then
     FSelectedRow := 1;

  FCellPropertiesRefresh := True;
  iCurrRow := veCellEditor.CurrentDataRow;
  veCellEditor.BeginUpdate;
  try
  gbCell.Caption := 'Cell ' + IntToStr(SelectedCol) + ', ' + IntToStr(SelectedRow) + ' ';
  veCellEditor.Rows := 0;
  LoadCellProperty('ControlType');
  RefreshCellProperty('ControlType');
  LoadCellProperty('ButtonType');
  RefreshCellProperty('ButtonType');
  LoadCellProperty('Color');
  RefreshCellProperty('Color');
  LoadCellProperty('Font');
  LoadCellProperty('Is3D');
  RefreshCellProperty('Is3D');
  LoadCellProperty('ParentFont');
  RefreshCellProperty('ParentFont');
  LoadCellProperty('ReadOnly');
  RefreshCellProperty('ReadOnly');
  LoadCellProperty('MaskName');
  RefreshCellProperty('MaskName');
  LoadCellProperty('DateTimeDef');
  RefreshCellProperty('DateTimeDef');
  case sampleGrid.CellControlType[SelectedCol, SelectedRow] of
    ctText, ctDefault :    begin
                  LoadCellProperty('HorzAlignment');
                  RefreshCellProperty('HorzAlignment');
                  LoadCellProperty('VertAlignment');
                  RefreshCellProperty('VertAlignment');
                  LoadCellProperty('WordWrap');
                  RefreshCellProperty('WordWrap');
                end;
    ctPicture : begin
                  LoadCellProperty('CenterPicture');
                  RefreshCellProperty('CenterPicture');
                  LoadCellProperty('KeepAspectRatio');
                  RefreshCellProperty('KeepAspectRatio');
                  LoadCellProperty('ShrinkPicture');
                  RefreshCellProperty('ShrinkPicture');
                  LoadCellProperty('StretchPicture');
                  RefreshCellProperty('StretchPicture');
                end;
  end;
  case sampleGrid.CellButtonType[SelectedCol, SelectedRow] of
     btCombo : begin
                  LoadCellProperty('DropDownStyle');
                  RefreshCellProperty('DropDownStyle');
                  LoadCellProperty('ParentCombo');
                  RefreshCellProperty('ParentCombo');
               end;
     btHorzSpin, btVertSpin :
               begin
                  LoadCellProperty('SpinIncrement');
                  RefreshCellProperty('SpinIncrement');
                  LoadCellProperty('SpinOptions');
                  RefreshCellProperty('SpinOptions');
               end;
  end;
  SetEnablebutLoadPicture;
  finally
    veCellEditor.CurrentDataRow := iCurrRow;
    veCellEditor.EndUpdate;
    FCellPropertiesRefresh := False;
  end;
  SelectedCellProperty := FSelectedCellProperty;
end;

procedure TfmOsGridEditor.RefreshCellProperty(PropertyName : String);
var iRow : Integer;
    Value : Variant;
begin
  iRow := 0;
  repeat
    Inc(iRow)
  until (AnsiCompareText(veCellEditor.Cell[1, iRow], PropertyName) = 0) or
        (iRow > veCellEditor.Rows);
  if iRow <= veCellEditor.Rows then
  begin
    Value := GetCellProperty(PropertyName);
    if VarType(Value) = varBoolean then
    begin
      if Value then
         veCellEditor.Cell[2, iRow] := 'True'
      else
         veCellEditor.Cell[2, iRow] := 'False';
      veCellEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'Color') = 0) then
    begin
       veCellEditor.Cell[2, iRow] := ColorToString(TColor(Value));
       veCellEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'MaskName') = 0) then
    begin
       veCellEditor.Cell[2, iRow] := GetCellProperty(PropertyName);
       veCellEditor.CellButtonType[2, iRow] := btNone;
    end
    else if (AnsiCompareText(PropertyName, 'DateTimeDef') = 0) then
    begin
       veCellEditor.Cell[2, iRow] := GetCellProperty(PropertyName);
       veCellEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'ReadOnly') = 0) then
    begin
       veCellEditor.Cell[2, iRow] := ReadOnlyToText(GetCellProperty(PropertyName));
       veCellEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'ButtonType') = 0) then
    begin
       veCellEditor.Cell[2, iRow] := ButtonTypeToText(GetCellProperty(PropertyName));
       veCellEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'ControlType') = 0) then
    begin
       veCellEditor.Cell[2, iRow] := ControlTypeToText(GetCellProperty(PropertyName));
       veCellEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'HorzAlignment') = 0) then
    begin
       veCellEditor.Cell[2, iRow] := HorzAlignmentToText(GetCellProperty(PropertyName));
       veCellEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'VertAlignment') = 0) then
    begin
       veCellEditor.Cell[2, iRow] := VertAlignmentToText(GetCellProperty(PropertyName));
       veCellEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'WordWrap') = 0) then
    begin
       veCellEditor.Cell[2, iRow] := WordWrapToText(GetCellProperty(PropertyName));
       veCellEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'CenterPicture') = 0) or (AnsiCompareText(PropertyName, 'KeepAspectRatio') = 0) or
            (AnsiCompareText(PropertyName, 'StretchPicture') = 0) or (AnsiCompareText(PropertyName, 'ShrinkPicture') = 0) then
    begin
       veCellEditor.Cell[2, iRow] := DrawOptionToText(GetCellProperty(PropertyName));
       veCellEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'DropDownStyle') = 0) then
    begin
       veCellEditor.Cell[2, iRow] := DropDownStyleToText(GetCellProperty(PropertyName));
       veCellEditor.CellButtonType[2, iRow] := btCombo;
    end
    else if (AnsiCompareText(PropertyName, 'SpinIncrement') = 0) then
    begin
       veCellEditor.Cell[2, iRow] := Value;
       veCellEditor.CellButtonType[2, iRow] := btVertSpin;
    end
    else if (AnsiCompareText(PropertyName, 'SpinOptions') = 0) then
    begin
       veCellEditor.Cell[2, iRow] := SpinOptionToText(sampleGrid.CellSpinOptions[SelectedCol, SelectedRow]);
       veCellEditor.CellButtonType[2, iRow] := btNormal;
    end
    else if (VarType(Value) = varInteger) then
    begin
      veCellEditor.Cell[2, iRow] := IntToStr(Value);
      veCellEditor.CellButtonType[2, iRow] := btVertSpin;
    end
  end;
end;

function TfmOsGridEditor.GetCellProperty(PropertyName : String) : Variant;
begin
  if (AnsiCompareText(PropertyName, 'ReadOnly') = 0) then
     Result := sampleGrid.CellReadOnly[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'MaskName') = 0) then
     Result := sampleGrid.CellMaskName[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'DateTimeDef') = 0) then
  begin
    if sampleGrid.CellDateTimeDef[SelectedCol, SelectedRow] <> Nil then
       Result := sampleGrid.CellDateTimeDef[SelectedCol, SelectedRow].Name
    else
       Result := '';
  end
  else if (AnsiCompareText(PropertyName, 'Color') = 0) then
     Result := sampleGrid.CellColor[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'Is3D') = 0) then
     Result := sampleGrid.CellIs3D[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'ParentFont') = 0) then
     Result := sampleGrid.CellParentFont[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'ButtonType') = 0) then
     Result := sampleGrid.CellButtonType[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'ControlType') = 0) then
     Result := sampleGrid.CellControlType[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'HorzAlignment') = 0) then
     Result := sampleGrid.CellHorzAlignment[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'VertAlignment') = 0) then
     Result := sampleGrid.CellVertAlignment[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'WordWrap') = 0) then
     Result := sampleGrid.CellWordWrap[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'ShrinkPicture') = 0) then
     Result := sampleGrid.CellShrinkPicture[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'StretchPicture') = 0) then
     Result := sampleGrid.CellStretchPicture[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'KeepAspectRatio') = 0) then
     Result := sampleGrid.CellKeepAspectRatio[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'CenterPicture') = 0) then
     Result := sampleGrid.CellCenterPicture[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'ParentCombo') = 0) then
     Result := sampleGrid.CellParentCombo[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'SpinIncrement') = 0) then
     Result := sampleGrid.CellSpinIncrement[SelectedCol, SelectedRow]
  else if (AnsiCompareText(PropertyName, 'DropDownStyle') = 0) then
     Result := sampleGrid.CellDropDownStyle[SelectedCol, SelectedRow];
end;

procedure TfmOsGridEditor.BindCellProperty(PropertyName : String; Value : Variant);
begin
  GridModified;
  if (AnsiCompareText(PropertyName, 'ReadOnly') = 0) then
     sampleGrid.CellReadOnly[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'DateTimeDef') = 0) then
  begin
    if (Value = '') or
       (lsDateTimeDefs.IndexOf(Value) = -1) then
        sampleGrid.CellDateTimeDef[SelectedCol, SelectedRow] := Nil
     else
        sampleGrid.CellDateTimeDef[SelectedCol, SelectedRow] := TtsDateTimeDefComponent(lsDateTimeDefs.Objects[lsDateTimeDefs.IndexOf(Value)]);
  end
  else if (AnsiCompareText(PropertyName, 'Color') = 0) then
     sampleGrid.CellColor[SelectedCol, SelectedRow] := StringToColor(FullColorName(Value))
  else if (AnsiCompareText(PropertyName, 'MaskName') = 0) then
     sampleGrid.CellMaskName[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'Is3D') = 0) then
     sampleGrid.CellIs3D[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'ParentFont') = 0) then
     sampleGrid.CellParentFont[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'ButtonType') = 0) then
     sampleGrid.CellButtonType[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'ControlType') = 0) then
     sampleGrid.CellControlType[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'HorzAlignment') = 0) then
     sampleGrid.CellHorzAlignment[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'VertAlignment') = 0) then
     sampleGrid.CellVertAlignment[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'WordWrap') = 0) then
     sampleGrid.CellWordWrap[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'ShrinkPicture') = 0) then
     sampleGrid.CellShrinkPicture[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'StretchPicture') = 0) then
     sampleGrid.CellStretchPicture[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'KeepAspectRatio') = 0) then
     sampleGrid.CellKeepAspectRatio[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'CenterPicture') = 0) then
     sampleGrid.CellCenterPicture[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'ParentCombo') = 0) then
     sampleGrid.CellParentCombo[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'SpinIncrement') = 0) then
     sampleGrid.CellSpinIncrement[SelectedCol, SelectedRow] := Value
  else if (AnsiCompareText(PropertyName, 'DropDownStyle') = 0) then
     sampleGrid.CellDropDownStyle[SelectedCol, SelectedRow] := Value;
end;

procedure TfmOsGridEditor.sampleGridCellChanged(Sender: TObject; OldCol,
  NewCol, OldRow, NewRow: Integer);
begin
  if not FBinding then
  begin
    SelectedCol := NewCol;
    RefreshCellProperties;
    SetEnablebutLoadPicture;
    if sampleGrid.CellCombo[NewCol, SelectedRow] <> Nil then
    begin
      lbCombos.ItemIndex := lbCombos.Items.IndexOf(ComboCellText);
      SelectedCombo := sampleGrid.CellCombo[NewCol, SelectedRow];
    end;
  end;
end;

function TfmOsGridEditor.ComboCellText : String;
begin
  Result := 'Cell ' + IntToStr(SelectedCol) + ', ' + IntToStr(SelectedRow);
end;

procedure TfmOsGridEditor.sampleDbGridCellChanged(Sender: TObject; OldCol,
  NewCol: Integer; OldRow, NewRow: Variant);
begin
  if not FBinding then
     SelectedCol := NewCol;
end;

procedure TfmOsGridEditor.sampleGridColMoved(Sender: TObject; ToDisplayCol,
  Count: Integer; ByUser: Boolean);
var sText : String;
begin
  sText := 'Move Col ' + IntToStr(SelectedCol) + ' to ' + IntToStr(ToDisplayCol) + ' Count ' + IntToStr(Count);
  sbStatus.Panels[3].Text := sText;
  AddModifiedColProperty('DisplayCol');
  GridModified;
  FColumnsChanged := True;
  CheckCombos;
end;

procedure TfmOsGridEditor.veCellEditorButtonClick(Sender: TObject; DataCol,
  DataRow: Integer);
var bOrig : Boolean;
begin
  if (AnsiCompareText(veCellEditor.Cell[1, DataRow], 'Font') = 0) then
  begin
     bOrig := sampleGrid.CellParentFont[SelectedCol, SelectedRow];
     if sampleGrid.CellFont[SelectedCol, SelectedRow] = Nil then
        sampleGrid.CellParentFont[SelectedCol, SelectedRow] := False;
     dgFont.Font := sampleGrid.CellFont[SelectedCol, SelectedRow];
     if dgFont.Execute then
     begin
       sampleGrid.CellParentFont[SelectedCol, SelectedRow] := False;
       sampleGrid.CellFont[SelectedCol, SelectedRow] := dgFont.Font;
       GridModified;
     end
     else
       sampleGrid.CellParentFont[SelectedCol, SelectedRow] := bOrig;
  end
  else if (AnsiCompareText(veCellEditor.Cell[1, DataRow], 'SpinOptions') = 0) then
  begin
    dgSpinOptions := TdgSpinOptions.Create(Self);
    try
      if dgSpinOptions.EditOptions(sampleGrid.CellSpinOptions[SelectedCol, SelectedRow]) then
      begin
        sampleGrid.CellSpinOptions[SelectedCol, SelectedRow] := dgSpinOptions.GetSpinOptions;
        veCellEditor.Cell[DataCol, DataRow] := Self.SpinOptionToText(dgSpinOptions.GetSpinOptions);
        GridModified;
      end;
    finally
      dgSpinOptions.Free;
    end;
  end;
end;

procedure TfmOsGridEditor.veCellEditorComboCellLoaded(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer; var Value: Variant);
begin
  if Combo.Tag = 1 then // Boolean
  begin
    if DataRow = 1 then
       Value := 'True'
    else
       Value := 'False';
  end
  else if Combo.Tag = 2 then // Colors
  begin
    Value := 'cl' + cbColors.Items.Strings[DataRow-1];
  end
  else if (Combo.Tag = 3) and
          (DataRow <= EnumList.Count) then // Enumerated list
    Value := EnumList.Strings[DataRow-1]
  else if (Combo.Tag = 4) then
    Value := cbPropertyView.Items.Strings[DataRow-1]
  else if (Combo.Tag = 5) then
    Value := lsDateTimeDefs.Strings[DataRow-1];
end;

procedure TfmOsGridEditor.veCellEditorComboDropDown(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer);
var sPropName, sValue : String;
begin
  sPropName := veCellEditor.Cell[1, DataRow];
  Combo.Tag := 0;
  if (AnsiCompareText(sPropName, 'Color') = 0) then
  begin
    Combo.Tag := 2;
    Combo.Rows := 42;
    Combo.DropDownRows := 12;
  end
  else if (LowerCase(veCellEditor.Cell[2, DataRow]) = 'false') or
          (LowerCase(veCellEditor.Cell[2, DataRow]) = 'true') then
  begin
    Combo.Tag := 1;
    Combo.Rows := 2;
    if LowerCase(sValue) = 'true' then
       Combo.Grid.CurrentDataRow := 1
    else
       Combo.Grid.CurrentDataRow := 2;
   end
   else if (AnsiCompareText(sPropName, 'DateTimeDef') = 0) then
   begin
     Combo.Rows := lsDateTimeDefs.Count;
     Combo.Tag := 5;
   end
   else if (AnsiCompareText(sPropName, 'ReadOnly') = 0) then
   begin
     Combo.Rows := 3;
     EnumList.Clear;
     EnumList.Add('roOn'); EnumList.Add('roOff'); EnumList.Add('roDefault');
     Combo.Grid.CurrentDataRow := EnumList.IndexOf(veCellEditor.Cell[2,DataRow]) + 1;
     Combo.Tag := 3;
   end
   else if (veCellEditor.CellButtonType[2, DataRow] = btCombo) and
           (sampleGrid.Cols > 0) then // Need to use Col object for ButtonType/ControlType
   begin
     Combo.Rows := LoadEnumList(sampleGrid.Col[1], sPropName);
     if Combo.Rows <= 8 then
        Combo.DropDownRows := Combo.Rows
     else
        Combo.DropDownRows := 8;
     sValue := GetEnumProp(sampleGrid.Col[1], sPropName);
     Combo.Grid.CurrentDataRow := EnumList.IndexOf(sValue) + 1;
     Combo.Tag := 3;
   end;
end;

procedure TfmOsGridEditor.veCellEditorComboGetValue(Sender: TObject;
  Combo: TtsComboGrid; GridDataCol, GridDataRow, ComboDataRow: Integer;
  var Value: Variant);
begin
  Value := Combo.Cell[1, ComboDataRow];
  veCellEditor.Cell[GridDataCol, GridDataRow] := Value;
  if (LowerCase(Value) = 'true') or (LowerCase(Value) = 'false') then
     BindCellProperty(veCellEditor.Cell[1, GridDataRow], Value)
  else if (AnsiCompareText(veCellEditor.Cell[1, GridDataRow], 'Color') = 0) then
     BindCellProperty('Color', Value)
  else if (Combo.Tag = 5) then
    BindCellProperty(veCellEditor.Cell[1, GridDataRow], Value)
  else
  begin
    BindCellProperty(veCellEditor.Cell[1, GridDataRow], EnumList.IndexOf(Value));
    if (veCellEditor.Cell[1, GridDataRow] = 'ControlType') or
       (veCellEditor.Cell[1, GridDataRow] = 'ButtonType') then
       RefreshCellProperties;
    if (veCellEditor.Cell[1, GridDataRow] = 'ButtonType') then
    begin
      if (veCellEditor.Cell[2, GridDataRow] = 'btCombo') then
         AddCellCombo
      else
         RemoveCellCombo;
    end;
  end;
end;

procedure TfmOsGridEditor.veCellEditorDblClick(Sender: TObject);
begin
  if LowerCase(veCellEditor.Cell[veCellEditor.CurrentDataCol, veCellEditor.CurrentDataRow]) = 'true' then
  begin
     veCellEditor.Cell[veCellEditor.CurrentDataCol, veCellEditor.CurrentDataRow] := 'False';
     BindCellProperty(veCellEditor.Cell[1, veCellEditor.CurrentDataRow], False);
  end
  else if LowerCase(veCellEditor.Cell[veCellEditor.CurrentDataCol, veCellEditor.CurrentDataRow]) = 'false' then
  begin
     veCellEditor.Cell[veCellEditor.CurrentDataCol, veCellEditor.CurrentDataRow] := 'True';
     BindCellProperty(veCellEditor.Cell[1, veCellEditor.CurrentDataRow], True);
  end;
end;

procedure TfmOsGridEditor.veCellEditorEndCellEdit(Sender: TObject; DataCol,
  DataRow: Integer; var Cancel: Boolean);
var Value : Variant;
begin
  Value := veCellEditor.Cell[DataCol, DataRow];
  if (LowerCase(Value) = 'true') or (LowerCase(Value) = 'false') then
     BindCellProperty(veCellEditor.Cell[1, DataRow], Value)
  else if (AnsiCompareText(veCellEditor.Cell[1, DataRow], 'Color') = 0) then
     BindCellProperty('Color', Value)
  else if (AnsiCompareText(veCellEditor.Cell[1, DataRow], 'SpinIncrement') = 0) then
     BindCellProperty('SpinIncrement', Value)
  else if VarType(Value) = varInteger then
     BindCellProperty(veCellEditor.Cell[1, DataRow], Value)
  else if VarType(Value) = varString then
     BindCellProperty(veCellEditor.Cell[1, DataRow], Value)
  else
  begin
    BindCellProperty(veCellEditor.Cell[1, DataRow], EnumList.IndexOf(Value));
    if (veCellEditor.Cell[1, DataRow] = 'ControlType') or
       (veCellEditor.Cell[1, DataRow] = 'ButtonType') then
       RefreshCellProperties;
  end;
end;

procedure TfmOsGridEditor.cbHeadingColorClick(Sender: TObject);
begin
  if GetDemoGridPropertyValue('HeadingColor') <> cbHeadingColor.ColorValue then
  begin
    BindGridVarProperty('HeadingColor', cbHeadingColor.ColorValue);
    GridModifiedProperties.Add('HeadingColor');
  end;
end;

procedure TfmOsGridEditor.cbGridColorClick(Sender: TObject);
begin
  if GetDemoGridPropertyValue('Color') <> cbGridColor.ColorValue then
  begin
    BindGridVarProperty('Color', cbGridColor.ColorValue);
    GridModifiedProperties.Add('Color');
  end;
end;

procedure TfmOsGridEditor.cbFocusColorClick(Sender: TObject);
begin
  if GetGridMode = gmListBox then
  begin
     if GetDemoGridPropertyValue('SelectionColor') <> cbFocusColor.ColorValue then
     begin
       BindGridVarProperty('SelectionColor', cbFocusColor.ColorValue);
       GridModifiedProperties.Add('SelectionColor');
     end;
  end
  else
  begin
     if GetDemoGridPropertyValue('FocusColor') <> cbFocusColor.ColorValue then
     begin
       BindGridVarProperty('FocusColor', ColorToString(cbFocusColor.ColorValue));
       GridModifiedProperties.Add('FocusColor');
     end;
  end;
end;

procedure TfmOsGridEditor.cbFocusFontColorClick(Sender: TObject);
begin
  if GetGridMode = gmListBox then
  begin
     if GetDemoGridPropertyValue('SelectionFontColor') <> cbFocusFontColor.ColorValue then
     begin
       BindGridVarProperty('SelectionFontColor', cbFocusFontColor.ColorValue);
       GridModifiedProperties.Add('SelectionFontColor');
     end;
  end
  else
  begin
     if GetDemoGridPropertyValue('FocusFontColor') <> cbFocusFontColor.ColorValue then
     begin
       BindGridVarProperty('FocusFontColor', cbFocusFontColor.ColorValue);
       GridModifiedProperties.Add('FocusFontColor');
     end;
  end;
end;

procedure TfmOsGridEditor.cbColorsClick(Sender: TObject);
begin
  UpdatePropertyFromColor;
end;

procedure TfmOsGridEditor.sampleDbGridHeadingClick(Sender: TObject;
  DataCol: Integer);
begin
  if not FBinding then
     SelectedCol := DataCol;
end;

procedure TfmOsGridEditor.sampleGridHeadingClick(Sender: TObject;
  DataCol: Integer);
begin
  if not FBinding then
     SelectedCol := sampleGrid.DataColnr[DataCol];
end;

function TfmOsGridEditor.CellType(DataCol: integer; DataRow: variant): TtsControlType;
begin
    if TtsBaseGrid_(demoGrid).CellControlType[DataCol, DataRow] <> ctDefault then
        Result := TtsBaseGrid_(demoGrid).CellControlType[DataCol, DataRow]
    else if (TtsBaseGrid_(demoGrid).DrawOverlap = doDrawColOnTop) and
            (TtsBaseGrid_(demoGrid).Col[DataCol].ControlType <> ctDefault) then
        Result := TtsBaseGrid_(demoGrid).Col[DataCol].ControlType
    else if (TtsBaseGrid_(demoGrid).DrawOverlap <> doDrawColOnTop) and
            (TtsBaseGrid_(demoGrid).RowControlType[DataRow] <> ctDefault) then
        Result := TtsBaseGrid_(demoGrid).RowControlType[DataRow]
    else if (TtsBaseGrid_(demoGrid).Col[DataCol].ControlType <> ctDefault) then
        Result := TtsBaseGrid_(demoGrid).Col[DataCol].ControlType
    else if (TtsBaseGrid_(demoGrid).RowControlType[DataRow] <> ctDefault) then
        Result := TtsBaseGrid_(demoGrid).RowControlType[DataRow]
    else
        Result := ctText;
end;

procedure TfmOsGridEditor.SetEnablebutLoadPicture;
begin
    if TtsBaseGrid_(demoGrid).ImageList = nil then
        tbSetPicture.Enabled := False
    else if (TtsBaseGrid_(demoGrid).StoreData) and
            ((pgEditor.ActivePage = tsCellProperties) or
             (pgEditor.ActivePage = tsRowProperties) or
             (pgEditor.ActivePage = tsColumns)) then
    begin
        if GetGridCols <= 0 then
            tbSetPicture.Enabled := False
        else if GetGridRows <= 0 then
            tbSetPicture.Enabled := False
        else if FSelectedCol <= 0 then
            tbSetPicture.Enabled := False
        else if FSelectedRow <= 0 then
            tbSetPicture.Enabled := False
        else
            tbSetPicture.Enabled := (CellType(FSelectedCol, FSelectedRow) = ctPicture);
    end
    else
        tbSetPicture.Enabled := False;

    if tbSetPicture.Enabled then
    begin
        if VarIsEmpty(TtsBaseGrid_(demoGrid).Cell[FSelectedCol, FSelectedRow]) then
            tbClearPicture.Enabled := False
        else
            tbClearPicture.Enabled := True;
    end
    else
        tbClearPicture.Enabled := False;
end;

{$IFNDEF rtTest}
procedure TfmOsGridEditor.SetPicture;
var dlgImages: TtsImageListDlg;
    Image: TtsImageItem;
begin
    dlgImages := TtsImageListDlg.Create(Application);
    try
      dlgImages.ImageCollection.Assign(TtsBaseGrid_(demoGrid).ImageList.ImageCollection);
      dlgImages.Caption := demoGrid.Name + '.' + TtsBaseGrid_(demoGrid).ImageList.Name;
      dlgImages.ItemIndex := TtsBaseGrid_(demoGrid).Cell[FSelectedCol, FSelectedRow];

      if dlgImages.ShowModal = mrOK Then
      begin
        TtsBaseGrid_(demoGrid).ImageList.ImageCollection.Assign(dlgImages.ImageCollection);
        Image := TtsBaseGrid_(demoGrid).ImageList.Image[dlgImages.ItemIndex];
        if Assigned(Image) then
           TtsBaseGrid_(demoGrid).Cell[FSelectedCol, FSelectedRow] :=
              TtsBaseGrid_(demoGrid).ImageList.Image[dlgImages.ItemIndex].SetName + '.' + TtsBaseGrid_(demoGrid).ImageList.Image[dlgImages.ItemIndex].Name
        else
           TtsBaseGrid_(demoGrid).Cell[FSelectedCol, FSelectedRow] := Unassigned;
      end;
    finally
      dlgImages.Free;
    end;
    SetEnablebutLoadPicture;
    GridModified;
end;


procedure TfmOsGridEditor.ClearPicture;
begin
    TtsBaseGrid_(demoGrid).Cell[FSelectedCol, FSelectedRow] := Unassigned;
    SetEnablebutLoadPicture;
    GridModified;
end;
{$ENDIF}

procedure TfmOsGridEditor.tbSetPictureClick(Sender: TObject);
begin
{$IFNDEF rtTest}
  SetPicture;
{$ENDIF}
end;

procedure TfmOsGridEditor.tbClearPictureClick(Sender: TObject);
begin
{$IFNDEF rtTest}
  ClearPicture;
{$ENDIF}
end;


procedure TfmOsGridEditor.chStoreDataClick(Sender: TObject);
begin
  if GetDemoGridPropertyValue('StoreData') <> chStoreData.Checked then
  begin
    BindGridVarProperty('StoreData', chStoreData.Checked);
    GridModifiedProperties.Add('StoreData');
  end;
end;

procedure TfmOsGridEditor.chGridMenuClick(Sender: TObject);
begin
  if GetDemoGridPropertyValue('ProvideGridMenu') <> chGridMenu.Checked then
  begin
    BindGridVarProperty('ProvideGridMenu', chGridMenu.Checked);
    GridModifiedProperties.Add('ProvideGridMenu');
  end;
end;

procedure TfmOsGridEditor.chPrintTotalsClick(Sender: TObject);
begin
  if GetDemoGridPropertyValue('PrintTotals') <> chPrintTotals.Checked then
  begin
    BindGridVarProperty('PrintTotals', chPrintTotals.Checked);
    GridModifiedProperties.Add('PrintTotals');
  end;
end;

procedure TfmOsGridEditor.ResetComboColProperties;
var i : Integer;
    sText : String;
begin
  lbColumns2.Items.Clear;
  if SelectedCombo <> Nil then
  begin
    for i := 1 to SelectedCombo.Grid.Cols do
    begin
      if SelectedCombo.Grid.Col[i].FieldName = '' then
         sText := 'Column ' + IntToStr(i)
      else
         sText := SelectedCombo.Grid.Col[i].FieldName;
      lbColumns2.Items.AddObject(sText, SelectedCombo.Grid.Col[i]);
    end;
    lbColumns2.ItemIndex := -1;
    if lbColumns2.Items.Count > 0 then
       lbColumns2.ItemIndex := 0;
    RefreshComboColProperties;
  end;
end;

function TfmOsGridEditor.TestComboColPropertyView(sPropName : String) : Boolean;
begin
  if chColPropertiesShortList.Checked then
     Result := (sPropName = 'Visible') or (sPropName = 'Heading') or
               (sPropName = 'HeadingHorzAlignment') or (sPropName = 'HorzAlignment') or
               (sPropName = 'Color') or
               (sPropName = 'HeadingColor') or (sPropName = 'Font') or
               (sPropName = 'Width') or (sPropName = 'HeadingWordWrap')
  else
     Result := TestColPropertyView(sPropName);
end;

procedure TfmOsGridEditor.RefreshComboColProperties;
var
  PropertyIndex,
  PropertyCount, iIndex : Integer;
  PropList      : TPropList;
  sName, sText : String;
  theCol : TtsCol;
begin
  veComboColEditor.Rows := 0;
  if (SelectedCombo = Nil) or
     (lbColumns2.ItemIndex = -1) then exit;

  theCol := TtsCol(lbColumns2.Items.Objects[lbColumns2.ItemIndex]);
  PropertyCount := GetPropList(TheCol.ClassInfo, tkProperties, @PropList) ;
  for PropertyIndex := 0 to PropertyCount -1 do
  begin
    sName := PropList[PropertyIndex].Name;
    if TestComboColPropertyView(sName) then
    begin
      veComboColEditor.Rows := veComboColEditor.Rows + 1;
      iIndex := veComboColEditor.Rows;
      sText := GetComboColPropertyValueText(sName);
      veComboColEditor.Cell[1, iIndex] := sName;
      veComboColEditor.Cell[2, iIndex] := sText;
    end;
  end;
end;

function TfmOsGridEditor.GetComboColPropertyValueText(PropertyName: String ) : String;
var theCol : TtsCol;
begin
  theCol := TtsCol(lbColumns2.Items.Objects[lbColumns2.ItemIndex]);
  Result := VarToStr(GetPropValue(theCol, PropertyName, False));
  if PropertyName = 'DateTimeDef' then
  begin
    Result := '';
    exit;
  end;
  case GetColPropertyType(PropertyName) of
    ptSpin    : veComboColEditor.CellButtonType[2, veComboColEditor.Rows] := btVertSpin;
    ptCombo   :
        begin
          Result := GetEnumProp(theCol, PropertyName);
          veComboColEditor.CellButtonType[2, veComboColEditor.Rows] := btCombo;
        end;
    ptBoolean :
        begin
          Result := GetEnumProp(theCol, PropertyName);
          veComboColEditor.CellButtonType[2, veComboColEditor.Rows] := btCombo;
        end;
    ptButton  :
        begin
          veComboColEditor.CellButtonType[2, veComboColEditor.Rows] := btNormal;
          Result := '(' + PropertyName + ')';
        end;
    ptColor   :
        begin
          ColorToIdent(StrToint(Result), Result);
          veComboColEditor.CellButtonType[2, veComboColEditor.Rows] := btCombo;
        end;
  end;
end;

procedure TfmOsGridEditor.veComboColEditorButtonClick(Sender: TObject;
  DataCol, DataRow: Integer);
var theCol : TtsCol;
begin
  if lbColumns2.ItemIndex = -1 then exit;

  theCol := TtsCol(lbColumns2.Items.Objects[lbColumns2.ItemIndex]);
  if (veComboColEditor.Cell[1, DataRow] = 'Font') then
  begin
     theCol.ParentFont := False;
     dgFont.Font := theCol.Font;
  end
  else if (veComboColEditor.Cell[1, DataRow] = 'HeadingFont') then
  begin
     theCol.HeadingParentFont := False;
     dgFont.Font := theCol.HeadingFont;
  end
  else
     exit;
  if dgFont.Execute then
  begin
    if (veComboColEditor.Cell[1, DataRow] = 'Font') then
       theCol.Font := dgFont.Font
    else if (veComboColEditor.Cell[1, DataRow] = 'HeadingFont') then
       theCol.HeadingFont := dgFont.Font;
    GridModified;
  end;
end;

procedure TfmOsGridEditor.lbColumns2Click(Sender: TObject);
begin
  if lbColumns2.ItemIndex >= 0 then
     RefreshComboColProperties;
end;

procedure TfmOsGridEditor.veComboColEditorComboDropDown(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer);
var sPropName, sValue : String;
   theCol : TtsCol;
begin
  if lbColumns2.ItemIndex = -1 then exit;

  theCol := TtsCol(lbColumns2.Items.Objects[lbColumns2.ItemIndex]);

  sPropName := veComboColEditor.Cell[1, DataRow];
  Combo.Tag := 0;
  if GetComboColPropertyType(sPropName) = ptColor then
  begin
    Combo.Tag := 2;
    Combo.Rows := 42;
    Combo.DropDownRows := 12;
  end
  else if GetComboColPropertyType(sPropName) = ptBoolean then
  begin
    Combo.Tag := 1;
    Combo.Rows := 2;
    if LowerCase(sValue) = 'true' then
       Combo.Grid.CurrentDataRow := 1
    else
       Combo.Grid.CurrentDataRow := 2;
   end
   else if GetComboColPropertyType(sPropName) = ptCombo then
   begin
     Combo.Rows := LoadEnumList(theCol, sPropName);
     if Combo.Rows <= 8 then
        Combo.DropDownRows := Combo.Rows
     else
        Combo.DropDownRows := 8;
     sValue := GetEnumProp(theCol, sPropName);
     Combo.Grid.CurrentDataRow := EnumList.IndexOf(sValue) + 1;
     Combo.Tag := 3;
   end;
end;

procedure TfmOsGridEditor.veComboColEditorComboGetValue(Sender: TObject;
  Combo: TtsComboGrid; GridDataCol, GridDataRow, ComboDataRow: Integer;
  var Value: Variant);
begin
  Value := Combo.Cell[1, ComboDataRow];
  veComboColEditor.Cell[GridDataCol, GridDataRow] := Value;
  BindComboColProperty(GridDataRow);
end;

procedure TfmOsGridEditor.BindComboColProperty(DataRow : Integer);
var theCol : TtsCol;
begin
  if lbColumns2.ItemIndex = -1 then exit;

  theCol := TtsCol(lbColumns2.Items.Objects[lbColumns2.ItemIndex]);
  GridModified;
  if GetColPropertyType(veComboColEditor.Cell[1, DataRow]) = ptColor then
     SetPropertyValueText(theCol, veComboColEditor.Cell[1, DataRow], StringToColor(FullColorName(veComboColEditor.Cell[2, DataRow])))
  else
     SetPropertyValueText(theCol, veComboColEditor.Cell[1, DataRow], veComboColEditor.Cell[2, DataRow]);
end;

procedure TfmOsGridEditor.veComboColEditorComboInit(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer);
begin
  Combo.Grid.Width := veComboColEditor.Col[2].Width - 15;
  Combo.Color := clWindow;
  Combo.DropDownStyle := ddDropDownList;
  Combo.GridLines := glNone;
end;

procedure TfmOsGridEditor.veComboColEditorDblClick(Sender: TObject);
begin
  if LowerCase(veComboColEditor.Cell[veComboColEditor.CurrentDataCol, veComboColEditor.CurrentDataRow]) = 'true' then
  begin
     veComboColEditor.Cell[veComboColEditor.CurrentDataCol, veComboColEditor.CurrentDataRow] := 'False';
     BindComboColProperty(veComboColEditor.CurrentDataRow);
  end
  else if LowerCase(veComboColEditor.Cell[veComboColEditor.CurrentDataCol, veComboColEditor.CurrentDataRow]) = 'false' then
  begin
     veComboColEditor.Cell[veComboColEditor.CurrentDataCol, veComboColEditor.CurrentDataRow] := 'True';
     BindComboColProperty(veComboColEditor.CurrentDataRow);
  end;
end;

procedure TfmOsGridEditor.veComboColEditorEndCellEdit(Sender: TObject;
  DataCol, DataRow: Integer; var Cancel: Boolean);
begin
  BindComboColProperty(DataRow);
end;

procedure TfmOsGridEditor.chColPropertiesShortListClick(Sender: TObject);
begin
  if (ActiveControl = chColPropertiesShortList) and
     (lbColumns2.ItemIndex >= 0) then
     RefreshComboColProperties;
end;

function TfmOsGridEditor.GetComboColPropertyType(sPropName : String) : TosPropertyType;
var theCol : TtsCol;
begin
  Result := ptBoolean;
  if lbColumns2.ItemIndex = -1 then exit;

  theCol := TtsCol(lbColumns2.Items.Objects[lbColumns2.ItemIndex]);
  if TestColColorProperty(sPropName) then
     Result := ptColor
  else if TestColBooleanProperty(sPropName) then
     Result := ptBoolean
  else if PropType(theCol, sPropName) = tkEnumeration then
     Result := ptCombo
  else if PropType(theCol, sPropName) = tkClass then
     Result := ptButton
  else if PropType(theCol, sPropName) = tkInteger then
     Result := ptSpin
  else
     Result := ptEdit;
end;

procedure TfmOsGridEditor.miResetGridColumnsClick(Sender: TObject);
begin
  if demoGrid = sampleGrid then
     sampleGrid.Cols := 0
  else
  begin
    sampleDbGrid.BeginUpdate;
    try
      FBinding := True;
      FSelecting := True;
      sampleDbGrid.Cols := 0;
      sampleDbGrid.FieldState := fsCustomized;
      sampleDbGrid.FieldState := fsDefault;
      ReloadSelectableFields;
    finally
      FBinding := False;
      FSelecting := False;
      if sampleDbGrid.Cols > 0 then
         SelectedCol := 1;
      sampleDbGrid.EndUpdate;
    end;
  end;
end;

procedure TfmOsGridEditor.miSortedFieldListClick(Sender: TObject);
var currCol : Integer;
begin
  if demoGrid = sampleGrid then exit;

  currCol := Self.SelectedCol;
  sampleDbGrid.BeginUpdate;
  FSelecting := True;
  FBinding := True;
  try
    miSortedFieldList.Checked := not miSortedFieldList.Checked;
    lbFields.Sorted := miSortedFieldList.Checked;
    ReloadSelectableFields;
    SetFieldSort(miSortedFieldList.Checked);
  finally
    FSelecting := False;
    SelectedCol := currCol;
    sampleDbGrid.EndUpdate;
    FBinding := False;
  end;
end;

procedure TfmOsGridEditor.SaveWindowState;
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey(TG_REGENTRIES + 'Designer', True);
    Reg.WriteInteger('EditorHeight', pgEditor.Height);
    Reg.WriteInteger('FormHeight', Self.Height);
    Reg.WriteInteger('FormWidth', Self.Width);
    Reg.WriteInteger('FormLeft', Self.Left);
    Reg.WriteInteger('FormTop', Self.Top);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TfmOsGridEditor.ResetWindowState;
var Reg: TRegistry;
    iVal : Integer;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if not Reg.OpenKey(TG_REGENTRIES + 'Designer', False) then
       Reg.CreateKey(TG_REGENTRIES + 'Designer')
    else
    begin
      if Reg.ValueExists('FormHeight') then
      begin
        iVal   := Reg.ReadInteger('FormHeight');
        if iVal > 300 then
           Self.Height := iVal;
      end;
      if Reg.ValueExists('FormWidth') then
      begin
        iVal := Reg.ReadInteger('FormWidth');
        if iVal > 300 then
           Self.Width := iVal;
      end;
      if Reg.ValueExists('EditorHeight') then
      begin
        iVal := Reg.ReadInteger('EditorHeight');
        if iVal > 200 then
           pgEditor.Height := iVal;
      end;
      if Reg.ValueExists('FormLeft') then
      begin
        iVal   := Reg.ReadInteger('FormLeft');
        if (iVal > 0) and (iVal < Screen.Width - Self.Width) then
           Self.Left := iVal;
      end;
      if Reg.ValueExists('FormTop') then
      begin
        iVal   := Reg.ReadInteger('FormTop');
        if (iVal > 0) and (iVal < Screen.Height - Self.Height) then
           Self.Top := iVal;
      end;
      Splitter.Align := alNone;
      pgEditor.Align := alNone;
      sbStatus.Align := alNone;
      sbStatus.Align := alBottom;
      pgEditor.Align := alBottom;
      Splitter.Align := alBottom;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TfmOsGridEditor.FormResize(Sender: TObject);
begin
  if not FBinding then
     SaveWindowState;
end;

procedure TfmOsGridEditor.sampleDbGridTopLeftChanged(Sender: TObject;
  OldCol: Integer; OldRow: Variant; NewCol: Integer; NewRow: Variant;
  ByUser: Boolean);
begin
  if FBinding or FStartup then exit;

  if (Self.SelectedCol >= 0) and
     (Self.SelectedCol < GetGridCols) and
     (SelectedtsCol <> Nil) then
  begin
    pnIndicator.Left := XforCol(SelectedtsCol.DisplayCol);
    if (SelectedtsCol.DisplayCol < GetGridLeftCol) and
       (SelectedtsCol.DisplayCol > GetGridFixedColCount) then
       pnIndicator.Width := 0
    else
       pnIndicator.Width := GetGridCol(SelectedCol).Width;
  end;
end;

procedure TfmOsGridEditor.sampleGridTopLeftChanged(Sender: TObject; OldCol,
  OldRow, NewCol, NewRow: Integer; ByUser: Boolean);
begin
  if FBinding or FStartup then exit;
  
  if Self.SelectedCol >= 0 then
  begin
    pnIndicator.Left := XforCol(SelectedtsCol.DisplayCol);
    if (SelectedtsCol.DisplayCol < GetGridLeftCol) and
       (SelectedtsCol.DisplayCol > GetGridFixedColCount) then
       pnIndicator.Width := 0
    else
       pnIndicator.Width := GetGridCol(SelectedCol).Width;
  end;
end;

procedure TfmOsGridEditor.veColEditorRowChanged(Sender: TObject; OldRow,
  NewRow: Integer);
begin
  if not FColPropertiesRefresh then
     FSelectedColProperty := NewRow;
end;

procedure TfmOsGridEditor.veCellEditorRowChanged(Sender: TObject; OldRow,
  NewRow: Integer);
begin
  if not FCellPropertiesRefresh then
     FSelectedCellProperty := NewRow;
end;

procedure TfmOsGridEditor.veRowEditorRowChanged(Sender: TObject; OldRow,
  NewRow: Integer);
begin
  if not FRowPropertiesRefresh then
     FSelectedRowProperty := NewRow;
end;

procedure TfmOsGridEditor.chParentComboClick(Sender: TObject);
begin
  if FBinding or
     (SelectedtsCol = Nil) then exit;

  if chParentCombo.Checked then
  begin
    SelectedtsCol.ParentCombo := True;
    SelectedCombo := Nil;
    gbCombo.Caption := 'No Combo defined ';
  end
  else
  begin
    SelectedtsCol.ParentCombo := False;
    SelectedtsCol.AssignCombo;
    SelectedCombo := SelectedtsCol.Combo;
  end;
  GridModified;
end;

procedure TfmOsGridEditor.miAddRowClick(Sender: TObject);
begin
  sampleGrid.InsertRow(sampleGrid.CurrentDataRow);
  GridModified;
end;

procedure TfmOsGridEditor.miRemoveRowClick(Sender: TObject);
begin
  if sampleGrid.SelectedRows.Count > 0 then
     sampleGrid.DeleteSelectedRows
  else
     sampleGrid.DeleteRows(sampleGrid.CurrentDataRow, sampleGrid.CurrentDataRow);
  GridModified;
end;

procedure TfmOsGridEditor.pmOptionsPopup(Sender: TObject);
begin
  miRemoveRow.Enabled := (pgEditor.ActivePage = tsRowProperties) and (sampleGrid.CurrentDataRow > 0);
  miAddRow.Enabled := (pgEditor.ActivePage = tsRowProperties);
end;

procedure TfmOsGridEditor.sampleGridRowMoved(Sender: TObject; ToDisplayRow,
  Count: Integer; ByUser: Boolean);
begin
  GridModified;
end;

procedure TfmOsGridEditor.lbFieldsClick(Sender: TObject);
begin
  AdjustFieldButtons;
end;

procedure TfmOsGridEditor.tsComboColumnsResize(Sender: TObject);
begin
  lbAllComboFields.Width := Round(pnComboColumns.Width / 2) - 17;
  lbComboFields.Width := lbAllComboFields.Width;
  btAddComboColumn.Left := lbAllComboFields.Width + 7;
  btRemoveComboColumn.Left := btAddComboColumn.Left;
  pnComboColumnUd.Align := alRight;
end;

procedure TfmOsGridEditor.UpDown2Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if Self.FBinding then exit;

  AllowChange := (Self.FTargetGrid is TtsGrid);
  if AllowChange then
  begin
    edRows.Text := IntToStr(upDown2.Position);
    edRowsExit(Self);
    GridModified;
  end;
end;

procedure TfmOsGridEditor.gdComboDataKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Insert) and
     (chComboStoreData.Checked) then
     gdComboData.InsertRow(gdComboData.CurrentDataRow);
end;

end.

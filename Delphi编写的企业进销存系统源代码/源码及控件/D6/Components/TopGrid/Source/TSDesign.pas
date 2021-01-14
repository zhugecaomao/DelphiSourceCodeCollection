{*******************************************************}
{                                                       }
{       ObjectSight Visual Components                   }
{       TopGrid Component Editor                        }
{                                                       }
{       Copyright (c) 1997 - 2001 ObjectSight           }
{                                                       }
{*******************************************************}

unit TsDesign;

{$INCLUDE TSCmpVer}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MMSystem,
  ComCtrls, TSDBGrid, StdCtrls, Grids_ts, TSGrid, ExtCtrls, TypInfo, TSSetLib, ClipBrd,
  RichEdit,
  {$IFDEF TSVER_V6} Variants, IniFiles, DesignIntf, DesignEditors, {$ELSE} DsgnIntf, {$ENDIF}
  {$IFDEF TSVER_V5} Contnrs, Menus, {$ENDIF} TSCommon;

type
    TtsGridInspector = class;
    TtsComponentEditor = class;
    TtsPropertySet = class;
    TtsPropertyElement = class;
    TtsPropertyPointerElement = class;
    TtsPropertyPointerSet = class;
    TtsActualValueElement = class;
    TtsActualValueSet = class;
    TtsGroupSet = class;
    TtsGroupElement = class;

    tsScanObjectsState = (soStart, soScan, soEnd);
    tsShowPropertyValueType = (pvShowAlways, pvShowNever, pvShowToggle1, pvShowToggle2);
    tsShowPropertyValueSet = set of tsShowPropertyValueType;
    tsInspectorElementType = (iePropertyElement, ieGroupElement);
    tsPropertyNilType = (pnUnKnown, pnAuto, pnTrue, pnFalse);
    tsValueSource = (vsComponent, vsValue, vsstrValue);

    TtsGetComponentEvent = procedure (Sender: TObject; var Component: TPersistent) of object;
    TtsGetComponentIdEvent = procedure (Sender: TObject; Component: TPersistent; var ComponentId: string) of object;
    TtsGetComponentWithIdEvent = procedure (Sender: TObject; ComponentId: string; var Component: TPersistent) of object;
    TtsGetComponentInfoEvent = procedure (Sender: TObject; DisplayMode: TtsGroupElement) of object;
    TtsGetComponentSelectionEvent = procedure (Sender: TObject; var ComponentSelection: Pointer; var ComponentCount: integer) of object;
    TtsGetComponentSelectionChangedEvent = procedure (Sender: TObject; CurSelection: Pointer; var Changed: Boolean) of object;
    TtsDestroyComponentSelectionEvent = procedure (Sender: TObject; ComponentSelection: Pointer) of object;
    TtsGetStringEvent = procedure (Sender: TObject; var Value: string) of object;
    TtsScanObjectsEvent = procedure (Sender: TObject; State: tsScanObjectsState; Writing: Boolean; Count: Longint; var Cancel: Boolean) of object;
    TtsSetValuesEvent = procedure (Sender: TObject; State: tsScanObjectsState; Component: Tpersistent; PropertyElement: TtsPropertyElement; strValue: string; Value: Variant; ValueSource: tsValueSource; ValueSet: Boolean; var Cancel: Boolean) of object;

    {TtsInspectorRow}
    {Contains information on each row in the TtsGridInspector}
    TtsInspectorRow = record
        Level: integer;
        Opened: Boolean;
        ButtonSet: Boolean;
        Deleted: Boolean;
        Selected: Boolean;
        SelectedChanged: integer;
        Parent: integer;
        SubFullySelected: Boolean;
        InspectorElementType: tsInspectorElementType;
        PropertyElement: TtsPropertyElement;
        GroupElement: TtsGroupElement;
    end;

    PtsInspectorRows = ^TtsInspectorRows;
    TtsInspectorRows = array[0..(MaxListSize div ((SizeOf(TtsInspectorRow) div SizeOf(Longint)) + 1))] of TtsInspectorRow;

    {TtsGridInspector}
    {Object inspector type component. Used to display and set the component
    properties and their values}

    TtsGridInspector = class(TtsGrid)
    protected
        FComponentEditor: TtsComponentEditor;
        CurrentComponentEditor: TtsComponentEditor;
        PropertyValueList: TStringList;
        FInspectorRows: PtsInspectorRows;
        FCurMaxInspectorRowCount: integer;
        FInspectorRowCount: integer;
        SelectedLastChanged: integer;
        SelectedLastUpdated: integer;

        InspectorKeyIsDown: Boolean;
        FComboOpen: Boolean;
        FDisplayModeName: string;

        procedure DoButtonClick(DataCol: Longint; DataRow: Variant); override;
        procedure DoDblClickCell(DataCol: Longint; DataRow: Variant; Pos: TtsClickPosition); override;
        procedure DoComboInit(DataCol: Longint; DataRow: Variant); override;
        procedure DoComboCellLoaded(DataCol, DataRow: Longint; var Value: Variant); override;
        procedure DoComboGetValue(GridDataCol: Longint; GridDataRow, ComboDataRow: Variant; var Value: Variant); override;
        procedure DoComboRollUp(DataCol: Longint; DataRow: Variant); override;
        procedure DoCellEdit(DataCol: Longint; DataRow: Variant; ByUser: Boolean); override;
        procedure DoEndCellEdit(DataCol: Longint; DataRow: Variant; var Cancel: Boolean); override;
        procedure DoKeyDown(var Key: Word; Shift: TShiftState); override;
        procedure DoKeyUp(var Key: Word; Shift: TShiftState); override;
        procedure DoComboDropDown(DataCol: Longint; DataRow: Variant); override;
        procedure DoStartCellEdit(DataCol: Longint; DataRow: Variant; var Cancel: Boolean); override;
        procedure DoColResized(RowColnr: Longint); override;
        procedure DoRowChanged(OldDataRow, NewDataRow: Variant); override;
        procedure DoExit; override;
        procedure DoCellLoaded(DataCol, DataRow: Longint; var Value: Variant); override;
        function  ActivateDoGetDrawInfo: Boolean; override;
        procedure DoGetDrawInfo(DataCol, DataRow: Longint; var DrawInfo: TtsDrawInfo); override;
        procedure DoMouseStatusChanged(OldStatus, NewStatus: TtsMouseStatus); override;

        procedure SetButton(DataRow: Integer);
        procedure GetMultiValue;
        procedure SetDisplayModeName(Value: string);
        procedure SetRowProperties;
        function GetInspectorRowCount: integer;
        procedure SetInspectorRowCount(NewValue: integer);
        procedure PlaceGroupSetInInspectorList(Node : TtsSetNode; Parent : integer);
        procedure PlacePropertiesInInspectorList(Node : TtsSetNode; Parent : integer; SubProperties: Boolean);
        procedure PlaceGroupElementInInspectorList(Group: TtsGroupElement; Parent: integer);
        procedure PlaceMarkedPropertiesInInspectorList(Node : TtsSetNode; Parent: integer);
        function GetInspectorRows: PtsInspectorRows;
        procedure SetInspectorRows;
        procedure GetDisplayName(InspectorRow: TtsInspectorRow; var DisplayName, IndentValue: string);
        procedure GetPropertyValues(const Value: string);
        procedure SetComponentEditor(Value: TtsComponentEditor);
        procedure UpdateContents(PropertiesChanged, SelectedComponentsChanged: Boolean);
        procedure RemoveEmptyGroups;
        function  IsEmptyGroup(GroupRow: integer): Boolean;
    public
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;

        procedure UpdateComponents;
        procedure UpdateSelectedRows;
        procedure OpenCurPropertyElement(var CurPropertyDataRow: integer);
        function GetPropertyDisplayValue(PropertyElement: TtsPropertyElement): string;

        procedure SetValues(PropertyElement: TtsPropertyElement; strValue: string; Value: Variant; ValueSource: tsValueSource; FirstSet: Boolean);
        function GetSubFullySelected(Row: integer): Boolean;
        function Selected(Row: integer): Boolean;

        property InspectorRows: PtsInspectorRows read GetInspectorRows write FInspectorRows;
        property InspectorRowCount: integer read GetInspectorRowCount write SetInspectorRowCount;
        property ComponentEditor: TtsComponentEditor read FComponentEditor write SetComponentEditor;
        property DisplayModeName: string read FDisplayModeName write SetDisplayModeName;
    end;

    {TtsPropertyElement}
    {Contains information for each property}

    TtsPropertyElement = class(TtsSetElement)
    protected
        FName: string;
        PropInfo: PPropInfo;
        FEditor: TPropertyEditor;
        FEditorComponent: TPersistent;
        FShowPropertyValue: tsShowPropertyValueType;
        DesignstrValue: string;
        PropertyLevel: Integer;
        FParent: TtsPropertyElement;
        ComponentEditor: TtsComponentEditor;
        FSubProperties: TtsPropertySet;
        SubPropertiesUpdated: Boolean;
        Mark: Boolean;
        MultiValue: Boolean;
        FPropertyNil: tsPropertyNilType;
        SetElementNumber: integer;
        function GetSubProperties: TtsPropertySet;
        function GetEditor: TPropertyEditor;
        function GetPropType: PTypeInfo;
        {$IFDEF TSVER_V6}
        procedure SetPropertyEditor(const Prop: IProperty);
        {$ELSE}
        procedure SetPropertyEditor(Prop: TPropertyEditor);
        {$ENDIF}
        function GetPropertyNil: tsPropertyNilType;
    public
        {$IFDEF TSVER_V6}
        constructor Create(Prop: IProperty; CurComponentEditor: TtsComponentEditor; ParentProperty: TtsPropertyElement);
        {$ELSE}
        constructor Create(Prop: TPropertyEditor; CurComponentEditor: TtsComponentEditor; ParentProperty: TtsPropertyElement);
        {$ENDIF}
        destructor  Destroy; override;

        procedure SetPropertyValue(Component: TPersistent; Value: Variant);
        function  GetPropertyValue(Component: TPersistent; FirstFromActualValueSet: Boolean): Variant;
        function  Compare(NodeSet: TtsCustomSet; Value : TtsSetElement) : TtsSetOrder; override;
        function  CompareKey(NodeSet: TtsCustomSet; const KeyValue : array of const) : TtsSetOrder; override;
        function ConvertDesignPropertystrValueToValue(const strValue: string): Variant;
        function ConvertDesignPropertyValueTostrValue(const Value: Variant): string;

        property Editor: TPropertyEditor read GetEditor write FEditor;
        property PropType: PTypeInfo read GetPropType;
        property SubProperties: TtsPropertySet read GetSubProperties write FSubProperties;
        property PropertyNil: tsPropertyNilType read GetPropertyNil write FPropertyNil;
        property Name: string read FName write FName;
        property ShowPropertyValue: tsShowPropertyValueType read FShowPropertyValue write FShowPropertyValue;
        property Parent: TtsPropertyElement read FParent write FParent;
    end;

    {TtsPropertySet}
    {Contains TtsPropertyElement information for all properties of a component
    or all subproperties of a property}

    TtsPropertySet = class(TtsObjectSet)
    protected
        procedure MarkAll(Node : TtsSetNode);
    public
        function GetItem(KeyValue : array of const) : TtsPropertyElement;
    end;

    {TtsPropertyPointerElement}
    {Containts a pointer to a TtsPropertyElement}

    TtsPropertyPointerElement = class(TtsSetElement)
    protected
        FElement: TtsPropertyElement;
    public
        function Compare(NodeSet: TtsCustomSet; Value : TtsSetElement) : TtsSetOrder; override;
        function CompareKey(NodeSet: TtsCustomSet; const KeyValue : array of const) : TtsSetOrder; override;
    end;

    {TtsPropertyPointerSet}
    {Contains a set of TtsPropertyPointerElement-s, used within a group}

    TtsPropertyPointerSet = class(TtsObjectSet)
    public
        function GetItem(KeyValue : array of const) : TtsPropertyPointerElement;
    end;

    {TtsGroupElement}
    {Used within the TtsInspectorGrid is logical elements to logically group
    properties. Also use to contain a display modes, such as 'alphbetical' or 'structured'}

    TtsGroupElement = class(TtsSetElement)
    protected
        FName: string;
        FSubGroups: TtsGroupSet;
        FPropertySet: TtsPropertyPointerSet;
        FGroupSet: TtsGroupSet;
        FOpened: Boolean;
        procedure SetName(NewName: string);
    public
        constructor Create;
        destructor  Destroy; override;

        function Release(DestroyingSet : Boolean) : TtsSetElement; override;
        function Compare(NodeSet: TtsCustomSet; Value : TtsSetElement) : TtsSetOrder; override;
        function CompareKey(NodeSet: TtsCustomSet; const KeyValue : array of const) : TtsSetOrder; override;
        function FindSubGroup(GroupName: string): TtsGroupElement;
        procedure AddGroup(Parent: string; Name: string; Opened: boolean);
        property Name: string read FName write SetName;
    end;

    {TtsGroupSet}
    {Contains the subgroups of a group elements or the displaymodes of a
    component editor}

    TtsGroupSet = class(TtsObjectSet)
    protected
        FInSetName: Boolean;
    public
        function GetItem(KeyValue : array of const) : TtsGroupElement;
        function Add(Element : TtsSetElement): Pointer; override;
    end;

    {TtsActualValueElement}
    {Used to contain the actual value of a property, when the value in the
    example component is not set directly always, such as the HeadingOn in the
    grdExample}

    TtsActualValueElement = class(TtsSetElement)
    protected
        FComponentId: string;
        FProperty: TtsPropertyElement;
        FActualstrValue: string;
    public
        property ActualValue: string read FActualstrValue;

        function Compare(NodeSet: TtsCustomSet; Value : TtsSetElement) : TtsSetOrder; override;
        function CompareKey(NodeSet: TtsCustomSet; const KeyValue : array of const) : TtsSetOrder; override;
    end;

    {TtsActualValueSet}
    {Contains all property values of properties in the component which are not
    always set in the example component}

    TtsActualValueSet = class(TtsObjectSet)
    protected
        FNumberOfToggleValues: integer;
        FNumberOfInvisibleValues: integer;
        FComponentEditor: TtsComponentEditor;
        procedure SetNumberOfToggleValues(Value: integer);
        procedure SetNumberOfInvisibleValues(Value: integer);
    public
        constructor Create; override;

        function Add(NodeValue : TtsSetElement) : Pointer; override;
        function Remove(KeyValue : array of const) : Pointer; override;
        function GetItem(KeyValue : array of const) : TtsActualValueElement;

        property NumberOfToggleValues: integer read FNumberOfToggleValues write SetNumberOfToggleValues;
        property NumberOfInvisibleValues: integer read FNumberOfInvisibleValues write SetNumberOfInvisibleValues;
    end;

    {TtsComponentEditor}
    {Contains all the information for retrieving and setting the properties of
    a component}
    TtsComponentEditor = class(TComponent)
    protected
        FComponent: TPersistent;
        FPropertySet: TtsPropertySet;
        FDisplayModes: TtsGroupSet;
        ComponentSelected: Boolean;
        MultipleComponentSelected: Boolean;
        FComponentAssigned: Boolean;
        FOnGetComponentInfo: TtsGetComponentInfoEvent;
        FOnGetFirstSelectedComponent: TtsGetComponentEvent;
        FOnGetNextSelectedComponent: TtsGetComponentEvent;
        FOnGetComponentWithId: TtsGetComponentWithIdEvent;
        FOnGetComponentId: TtsGetComponentIdEvent;
        FOnScanObjects: TtsScanObjectsEvent;
        FOnSetValues: TtsSetValuesEvent;
        FOnNumberofToggleValuesChanged: TNotifyEvent;
        FOnNumberofInvisibleValuesChanged: TNotifyEvent;
        FOnGetComponentSelection: TtsGetComponentSelectionEvent;
        FOnDestroyComponentSelection: TtsDestroyComponentSelectionEvent;
        FOnGetComponentSelectionChanged: TtsGetComponentSelectionChangedEvent;
        FCurPropertyElement: TtsPropertyElement;
        FComponentSelection: pointer;
        FComponentCount: integer;
        FActualValueSet: TtsActualValueSet;
        FShowDesignValue: tsShowPropertyValueSet;
        FDesignValuePropertiesInitialized: Boolean;
        procedure SetShowDesignValue(Value: tsShowPropertyValueSet);
        {$IFDEF TSVER_V6}
        procedure SetPropertyEditor(const Prop: IProperty);
        {$ELSE}
        procedure SetPropertyEditor(Prop: TPropertyEditor);
        {$ENDIF}
        function AssignComponent: TPersistent;
        function GetPropertySet: TtsPropertySet;
        function GetDisplayModes: TtsGroupSet;
        procedure DoGetComponentInfo(DisplayMode: TtsGroupElement); virtual;
        procedure DoGetComponentWithId(ComponentId: string; var Component: TPersistent); virtual;
        procedure DoGetComponentSelection(var ComponentSelection: Pointer; var ComponentCount: integer); virtual;
        procedure DoGetComponentSelectionChanged(CurSelection: Pointer; var Changed: Boolean); virtual;
        procedure DoDestroyComponentSelection(var ComponentSelection: Pointer; var ComponentCount: Integer);
        procedure DoScanObjects(State: tsScanObjectsState; Writing: Boolean; Count: Longint; var Cancel: Boolean); virtual;
        procedure DoSetValues(State: tsScanObjectsState; Component: Tpersistent; PropertyElement: TtsPropertyElement; strValue: string; Value: Variant; ValueSource: tsValueSource; ValueSet: Boolean; var Cancel: Boolean);
        procedure DoNumberofToggleValuesChanged; virtual;
        procedure DoNumberofInvisibleValuesChanged; virtual;
        function GetActualValueSet: TtsActualValueSet;
        procedure SetPropertyList;
        function AddDisplayMode(DisplayModeName: string): TtsGroupElement;
        property DisplayModes: TtsGroupSet read GetDisplayModes write FDisplayModes;
    public
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;

        procedure DoGetFirstSelectedComponent(var Component: TPersistent); virtual;
        procedure DoGetNextSelectedComponent(var Component: TPersistent); virtual;
        procedure DoGetComponentId(Component: TPersistent; var ComponentId: string); virtual;

        procedure AddProperty(DisplayMode: TtsGroupElement; GroupName: string; Name: string);
        procedure SetDesignProperty(PropertyName: string; ShowPropertyValue: tsShowPropertyValueType; DesignstrValue: string);
        procedure GetComponents;
        procedure SetActualValue(ComponentId: string; PropertyElement: TtsPropertyElement; strValue: string);

        property PropertySet: TtsPropertySet read GetPropertySet write FPropertySet;
        property ShowDesignValue: tsShowPropertyValueSet read FShowDesignValue write SetShowDesignValue;
        property DesignValuePropertiesInitialized: Boolean read FDesignValuePropertiesInitialized write FDesignValuePropertiesInitialized;
        property CurPropertyElement: TtsPropertyElement read FCurPropertyElement write FCurPropertyElement;
        property Component: TPersistent read AssignComponent write FComponent;
        property ComponentCount: integer read FComponentCount;
        property ActualValueSet: TtsActualValueSet read GetActualValueSet write FActualValueSet;
        property ComponentAssigned: Boolean read FComponentAssigned write FComponentAssigned;
    published
        property OnGetComponentInfo: TtsGetComponentInfoEvent read FOnGetComponentInfo write FOnGetComponentInfo;
        property OnGetFirstSelectedComponent: TtsGetComponentEvent read FOnGetFirstSelectedComponent write FOnGetFirstSelectedComponent;
        property OnGetNextSelectedComponent: TtsGetComponentEvent read FOnGetNextSelectedComponent write FOnGetNextSelectedComponent;
        property OnGetComponentWithId: TtsGetComponentWithIdEvent read FOnGetComponentWithId write FOnGetComponentWithId;
        property OnGetComponentId: TtsGetComponentIdEvent read FOnGetComponentId write FOnGetComponentId;
        property OnScanObjects: TtsScanObjectsEvent read FOnScanObjects write FOnScanObjects;
        property OnSetValues: TtsSetValuesEvent read FOnSetValues write FOnSetValues;
        property OnNumberofToggleValuesChanged: TNotifyEvent read FOnNumberofToggleValuesChanged write FOnNumberofToggleValuesChanged;
        property OnNumberofInvisibleValuesChanged: TNotifyEvent read FOnNumberofInvisibleValuesChanged write FOnNumberofInvisibleValuesChanged;
        property OnGetComponentSelection: TtsGetComponentSelectionEvent read FOnGetComponentSelection write FOnGetComponentSelection;
        property OnGetComponentSelectionChanged: TtsGetComponentSelectionChangedEvent read FOnGetComponentSelectionChanged write FOnGetComponentSelectionChanged;
        property OnDestroyComponentSelection: TtsDestroyComponentSelectionEvent read FOnDestroyComponentSelection write FOnDestroyComponentSelection;
    end;

    TtsComponentEditorClass = class of TtsComponentEditor;

    {TDummyDesigner}
    {Used only when the component editor is not in designtime to retrieve property
    information. Delphi functions require a designer component to retrieve
    property information. In design time a designer is supplied by Delphi itself}

{$IFNDEF TSVER_V4}
    TDummyDesigner = class(IDesigner)
    public
        function CreateMethod(const Name: string; TypeData: PTypeData): TMethod; override;
        function GetMethodName(const Method: TMethod): string; override;
        procedure GetMethods(TypeData: PTypeData; Proc: TGetStrProc); override;
        function GetPrivateDirectory: string; override;
        procedure GetSelections(List: TComponentList); override;
        function MethodExists(const Name: string): Boolean; override;
        procedure RenameMethod(const CurName, NewName: string); override;
        {$IFDEF TSVER_V3}
        procedure SelectComponent(Instance: TPersistent); override;
        {$ELSE}
        procedure SelectComponent(Instance: TComponent); override;
        {$ENDIF}
        procedure SetSelections(List: TComponentList); override;
        procedure ShowMethod(const Name: string); override;
        function UniqueName(const BaseName: string): string; override;
        procedure GetComponentNames(TypeData: PTypeData; Proc: TGetStrProc); override;
        function GetComponent(const Name: string): TComponent; override;
        function GetComponentName(Component: TComponent): string; override;
        {$IFDEF TSVER_V3}
        function GetObject(const Name: string): TPersistent; override;
        function GetObjectName(Instance: TPersistent): string; override;
        procedure GetObjectNames(TypeData: PTypeData; Proc: TGetStrProc); override;
        {$ENDIF}
        function MethodFromAncestor(const Method: TMethod): Boolean; override;
        function CreateComponent(ComponentClass: TComponentClass; Parent: TComponent;
          Left, Top, Width, Height: Integer): TComponent; override;
        function IsComponentLinkable(Component: TComponent): Boolean; override;
        procedure MakeComponentLinkable(Component: TComponent); override;
        function GetRoot: TComponent; override;
        procedure Revert(Instance: TPersistent; PropInfo: PPropInfo); override;
        {$IFDEF TSVER_V3}
        function GetIsDormant: Boolean; override;
        function HasInterface: Boolean; override;
        function HasInterfaceMember(const Name: string): Boolean; override;
        {$IFNDEF TSVER_CBUILD}
        procedure AddInterfaceMember(const MemberText: string); override;
        {$ELSE} {$IFDEF TSVER_V3}
        procedure AddToInterface(InvKind: Integer; const Name: string; VT: Word;
          const TypeInfo: string); override;
        procedure GetProjectModules(Proc: TGetModuleProc); override;
        {$ENDIF} {$ENDIF}
        {$ENDIF}

        function IsDesignMsg(Sender: TControl; var Message: TMessage): Boolean;
          override;
        procedure Modified; override;
        procedure Notification(AComponent: TComponent;
          Operation: TOperation); override;
        procedure PaintGrid; override;
        procedure ValidateRename(AComponent: TComponent;
          const CurName, NewName: string); override;
    end;
{$ELSE} {TFormDesigner no longer present in Delphi 4. Use IFormDesigner instead}
{$IFDEF TSVER_V6}
    TDummyDesigner = class(TInterfacedObject, IDesigner)
{$ELSE}
    TDummyDesigner = class(TInterfacedObject, IFormDesigner)
{$ENDIF}
    protected
        FCustomForm: TCustomForm;
        FIsControl: Boolean;

    public
        constructor Create;
{$IFDEF TSVER_V6}
        procedure Activate;
        function GetBaseRegKey: string;
        function GetIDEOptions: TCustomIniFile;
        function GetPathAndBaseExeName: string;
        function CreateCurrentComponent(Parent: TComponent; const Rect: TRect): TComponent;
        function IsComponentHidden(Component: TComponent): Boolean;
{$ENDIF}
        function CreateMethod(const Name: string; TypeData: PTypeData): TMethod;
        function GetMethodName(const Method: TMethod): string;
        procedure GetMethods(TypeData: PTypeData; Proc: TGetStrProc);
        function GetPrivateDirectory: string;

        procedure GetSelections(const List: IDesignerSelections);
        function MethodExists(const Name: string): Boolean;
        procedure RenameMethod(const CurName, NewName: string);
        procedure SelectComponent(Instance: TPersistent);
        procedure SetSelections(const List: IDesignerSelections);
        procedure ShowMethod(const Name: string);
        function UniqueName(const BaseName: string): string;
        procedure GetComponentNames(TypeData: PTypeData; Proc: TGetStrProc);
        function GetComponent(const Name: string): TComponent;
        function GetComponentName(Component: TComponent): string;
        function GetObject(const Name: string): TPersistent;
        function GetObjectName(Instance: TPersistent): string;
        procedure GetObjectNames(TypeData: PTypeData; Proc: TGetStrProc);
        function MethodFromAncestor(const Method: TMethod): Boolean;
        function CreateComponent(ComponentClass: TComponentClass; Parent: TComponent;
          Left, Top, Width, Height: Integer): TComponent;
        function IsComponentLinkable(Component: TComponent): Boolean;
        procedure MakeComponentLinkable(Component: TComponent);
        function GetRoot: TComponent;
        procedure Revert(Instance: TPersistent; PropInfo: PPropInfo);
        function GetIsDormant: Boolean;
        function HasInterface: Boolean;
        function HasInterfaceMember(const Name: string): Boolean;
        procedure AddInterfaceMember(const MemberText: string);
        procedure AddToInterface(InvKind: Integer; const Name: string; VT: Word; const TypeInfo: string);
        procedure GetProjectModules(Proc: TGetModuleProc);
{$IFDEF TSVER_V6}
        function GetAncestorDesigner: IDesigner;
{$ELSE}
        function GetAncestorDesigner: IFormDesigner;
{$ENDIF}
        function IsSourceReadOnly: Boolean;
        function GetCustomForm: TCustomForm;
        procedure SetCustomForm(Value: TCustomForm);
        function GetIsControl: Boolean;
        procedure SetIsControl(Value: Boolean);
        function IsDesignMsg(Sender: TControl; var Message: TMessage): Boolean;

        {$IFDEF TSVER_V5}
        function GetContainerWindow: TWinControl;
        procedure SetContainerWindow(const NewContainer: TWinControl);
        function GetScrollRanges(const ScrollPosition: TPoint): TPoint;

{$IFDEF TSVER_V6}
        procedure Edit(const Component: TComponent);
        function GetShiftState: TShiftState;
        procedure ModalEdit(EditKey: Char; const ReturnWindow: IActivatable);
        procedure SelectItemName(const PropertyName: string);
        procedure Resurrect;
        procedure DeleteSelection(ADoAll: Boolean = False);
{$ELSE}
        procedure DeleteSelection; 
        procedure Edit(const Component: IComponent);
        function BuildLocalMenu(Base: TPopupMenu; Filter: TLocalMenuFilters): TPopupMenu;
{$ENDIF}

        procedure ChainCall(const MethodName, InstanceName, InstanceMethod: string;
          TypeData: PTypeData);
        procedure CopySelection;
        procedure CutSelection;
        function CanPaste: Boolean;
        procedure PasteSelection;

        procedure ClearSelection;
        procedure ModuleFileNames(var ImplFileName, IntfFileName, FormFileName: string);
        procedure NoSelection;
        function GetRootClassName: string;
        {$ENDIF}

        procedure Modified;
        procedure Notification(AnObject: TPersistent; Operation: TOperation);
        procedure PaintGrid;
        procedure ValidateRename(AComponent: TComponent;
          const CurName, NewName: string);

        property Form: TCustomForm read FCustomForm;
    end;
{$ENDIF}

var
{$IFDEF TSVER_V6}
    Designer: IDesigner = nil;
{$ELSE}
    Designer: IFormDesigner = nil;
{$IFNDEF TSVER_V4}
    Designer: TFormDesigner = nil;
{$ENDIF}
{$ENDIF}
    ChangesMade: Boolean = False;

implementation

type
    TIntegerSet = set of 0..SizeOf(Integer) * 8 - 1;

    TtsBaseGrid_ = class(TtsBaseGrid) end;
    TtsCustomGrid_ = class(TtsCustomGrid) end;
    TtsCustomDBGrid_ = class(TtsCustomDBGrid) end;

const
    StsGroupNameNotFound = 'GroupName ''%s'' not found.';
    StsPropertyNotFound  = 'Property ''%s'' not found.';
    StsDeletePropertyNotAllowed = 'Properties may not be deleted.';
    StsOkToDeleteSeletedGroups = 'You are about to delete %d group(s). Are you sure?';

var
    ComboValueSelected: Boolean;

{TtsPropertyElement}

function TtsPropertyElement.GetSubProperties: TtsPropertySet;
begin
    if Editor = nil then
        result := nil
    else if not (paSubProperties in Editor.GetAttributes) then
        result := nil
    else
    begin
        if (PropertyNil <> pnTrue) and (FSubProperties = nil) then
        begin
            FSubProperties := TtsPropertySet.Create;
            Editor.GetProperties(SetPropertyEditor);
        end;

        result := FSubProperties;
    end;
end;

function TtsPropertyElement.GetEditor: TPropertyEditor;
var
    {$IFDEF TSVER_V5}
      {$IFDEF TSVER_V6}
      Components: TDesignerSelections;
      {$ELSE}
      Components: TDesignerSelectionList;
      {$ENDIF}
    {$ELSE}
      Components: TComponentList;
    {$ENDIF}
    CreateEditor: Boolean;
    ClassParent: TtsPropertyElement;
begin
    ShowMessage('TtsPropertyElement.GetEditor');
    if FEditor = nil then
        CreateEditor := True
    else if (Parent <> nil) then
    begin
        ClassParent := Parent;
        ShowMessage('ClassParent.PropType.Kind');
        while ClassParent.PropType.Kind <> tkClass do
        begin
            ClassParent := ClassParent.Parent;
            if ClassParent = nil then break;
        end;

        ShowMessage('if ClassParent = nil then');
        if ClassParent = nil then
        begin
            if FEditorComponent <> ComponentEditor.Component then
                CreateEditor := True
            else
                CreateEditor := False;
        end
        else if FEditorComponent <> Pointer(integer(ClassParent.GetPropertyValue(ComponentEditor.Component, True))) then
            CreateEditor := True
        else
            CreateEditor := False;
    end
    else if FEditorComponent <> ComponentEditor.Component then
        CreateEditor := True
    else
        CreateEditor := False;

    if CreateEditor then
    begin
        if Parent = nil then
        begin
            {$IFDEF TSVER_V5}
              {$IFDEF TSVER_V6}
              Components := TDesignerSelections.Create;
              {$ELSE}
              Components := TDesignerSelectionList.Create;
              {$ENDIF}
            {$ELSE}
            Components := TComponentList.Create;
            {$ENDIF}

            try
                ShowMessage('ComponentEditor.Component');
                if ComponentEditor.Component <> nil then
                begin
                    {$IFDEF TSVER_V6}
                    (Components as IDesignerSelections).Add(ComponentEditor.Component);
                    {$ELSE}
                    Components.Add(TComponent(ComponentEditor.Component));
                    {$ENDIF}
                    ShowMessage('GetComponentProperties');
                    GetComponentProperties(Components, tkProperties, Designer, ComponentEditor.SetPropertyEditor);
                end;
            finally
                Components.Free;
            end;
        end
        else if Parent.Editor <> nil then
        begin
            ShowMessage('Parent.Editor <> nil');
            Parent.Editor.GetProperties(Parent.SetPropertyEditor);
        end;
    end;

    result := FEditor;
end;

function TtsPropertyElement.GetPropType: PTypeInfo;
begin
    if PropInfo = nil then
        result := nil
    else if PropInfo.PropType = nil then
        result := nil
    else
        {$IFDEF TSVER_V3}
        result := PropInfo.PropType^;
        {$ELSE}
        result := PropInfo.PropType;
        {$ENDIF}
end;

procedure TtsPropertyElement.SetPropertyValue(Component: TPersistent; Value: Variant);
var
    S: TIntegerSet;
    ParentValue: Variant;

begin
    if PropInfo = nil then
    begin
        if Parent = nil then
            exit;

        if Parent.PropType = nil then
            exit;

        if Parent.PropType^.Kind = tkSet then
        begin
            ParentValue := Parent.GetPropertyValue(Component, True);
            if VarIsEmpty(ParentValue) then
            begin
                ParentValue := ParentValue;
                exit;
            end;

            Integer(S) := ParentValue;
            if Boolean(Value) then
                Include(S, SetElementNumber)
            else
                Exclude(S, SetElementNumber);

            Parent.SetPropertyValue(Component, Integer(S));
        end;
    end
    else
    begin
        if Parent <> nil then
        begin
            ParentValue := Parent.GetPropertyValue(Component, True);
            if VarIsEmpty(ParentValue) then
            begin
                ParentValue := ParentValue;
                exit;
            end;
            Component := Pointer(integer(ParentValue));
            if Component = nil then
            begin
                ParentValue := ParentValue;
                exit;
            end;
        end;

        if PropInfo.PropType = nil then
            exit;

        case PropInfo.PropType^.Kind of
            tkChar, tkString, tkWChar, tkLString,
            {$IFDEF TSVER_V3} tkWString {$ELSE} tkLWString {$ENDIF}:
                SetStrProp(Component, PropInfo, VarToStr(Value));
            tkFloat:
                SetFloatProp(Component, PropInfo, Value);
            tkVariant:
                SetVariantProp(Component, PropInfo, Value);
            else
                SetOrdProp(Component, PropInfo, Value);
        end;
    end;
end;

function TtsPropertyElement.GetPropertyValue(Component: TPersistent; FirstFromActualValueSet: Boolean): Variant;
var
    ComponentId: string;
    ActualValueElement: TtsActualValueElement;
    ParentValue: Variant;

begin
    if FirstFromActualValueSet and (ShowPropertyValue <> pvShowAlways) then
    begin
        ComponentEditor.DoGetComponentId(Component, ComponentId);
        ActualValueElement := ComponentEditor.ActualValueSet.GetItem([ComponentId, Name]);

        if (ActualValueElement <> nil) then
        begin
            result := ConvertDesignPropertystrValueToValue(ActualValueElement.FActualstrValue);
            exit;
        end;
    end;

    if PropInfo = nil then
    begin
        if Parent = nil then
            exit;

        if Parent.PropType = nil then
            exit;

        if Parent.PropType^.Kind = tkSet then
        begin
            ParentValue := Parent.GetPropertyValue(Component, True);
            if VarIsEmpty(ParentValue) then
                result := Unassigned
            else
                result := SetElementNumber in TIntegerSet(integer(ParentValue));
        end;
    end
    else
    begin
        if Parent <> nil then
        begin
            ParentValue := Parent.GetPropertyValue(Component, True);
            if VarIsEmpty(ParentValue) then
            begin
                result := Unassigned;
                exit;
            end;
            Component := Pointer(integer(ParentValue));
            if Component = nil then
            begin
                result := Unassigned;
                exit;
            end;
        end;

        if PropInfo.PropType = nil then
            exit;

        case PropType.Kind of
            tkChar, tkString, tkWChar, tkLString,
            {$IFDEF TSVER_V3} tkWString {$ELSE} tkLWString {$ENDIF}:
                result := GetStrProp(Component, PropInfo);
            tkFloat:
                result := GetFloatProp(Component, PropInfo);
            tkVariant:
                result := GetVariantProp(Component, PropInfo);
            else
                result := GetOrdProp(Component, PropInfo);
        end;
    end;
end;

{$IFDEF TSVER_V6}
procedure TtsPropertyElement.SetPropertyEditor(const Prop: IProperty);
{$ELSE}
procedure TtsPropertyElement.SetPropertyEditor(Prop: TPropertyEditor);
{$ENDIF}
var
    Element: TtsPropertyElement;

begin
    if SubProperties = nil then
    begin
        TPropertyEditor(Prop).Free;
        exit;
    end;

    Element := SubProperties.GetItem([Prop.GetName]);

    if Element = nil then
    begin
        Element := TtsPropertyElement.Create(Prop, ComponentEditor, Self);
        SubProperties.Add(Element);
    end
    else
    begin
        Element.FEditor.Free;
        Element.Editor := TPropertyEditor(Prop);
        Element.FEditorComponent := TPropertyEditor(Prop).GetComponent(0);
    end;
end;

function TtsPropertyElement.GetPropertyNil: tsPropertyNilType;
begin
    if FPropertyNil = pnUnKnown then
    begin
        FPropertyNil := pnFalse;
        if PropInfo <> nil then
        begin
            if PropType <> nil then
            begin
                if (PropInfo.PropType^.Kind = tkClass) then
                begin
                    if GetOrdProp(FEditor.GetComponent(0), PropInfo) = 0 then
                        FPropertyNil := pnTrue
                    else if (PropInfo.PropType^.Name = 'TFont') and not (FEditor.GetComponent(0) is TtsBaseGrid) then
                        FPropertyNil := pnAuto;
                end;
            end;
        end;
    end;

    result := FPropertyNil;
end;

function TtsPropertyElement.ConvertDesignPropertystrValueToValue(const strValue: string): Variant;
var
  IntValue: Longint;
begin
    case PropInfo.PropType^.Kind of
        tkChar, tkString, tkWChar, tkLString,
        {$IFDEF TSVER_V3} tkWString {$ELSE} tkLWString {$ENDIF}:
            result := strValue;
        tkFloat:
            result := StrToFloat(strValue);
        tkVariant:
            result := strValue;
        tkEnumeration:
        begin
            result := GetEnumValue(GetPropType, strValue);
            if result = -1 then
                raise EPropertyError.Create('Invalid property value')
        end
        else
        begin
            if PropInfo.PropType^.Name = 'TColor' then
            begin
                if IdentToColor(strValue, IntValue) then
                    result := IntValue
                else
                    result := StrToInt(strValue);
            end
            else
                result := StrToInt(strValue);
        end;
    end;
end;

function TtsPropertyElement.ConvertDesignPropertyValueTostrValue(const Value: Variant): string;
var
    IntValue: integer;
begin
    case PropInfo.PropType^.Kind of
        tkChar, tkString, tkWChar, tkLString,
        {$IFDEF TSVER_V3} tkWString {$ELSE} tkLWString {$ENDIF}:
            result := Value;
        tkFloat:
            result := FloatToStr(Value);
        tkVariant:
            result := Value;
        tkEnumeration:
            begin
                if PropInfo.PropType^.Name = 'Boolean' then
                begin
                    if Value = 0 then
                        result := 'False'
                    else
                        result := 'True';
                end
                else
                    result := GetEnumName(GetPropType, Value);
            end;
        else
        begin
            if PropInfo.PropType^.Name = 'TColor' then
            begin
                IntValue := Value;
                result := ColorToString(TColor(IntValue));
            end
            else
                result := IntToStr(Value);
        end;
    end;
end;

{$IFDEF TSVER_V6}
constructor TtsPropertyElement.Create(Prop: IProperty; CurComponentEditor: TtsComponentEditor; ParentProperty: TtsPropertyElement);
{$ELSE}
constructor TtsPropertyElement.Create(Prop: TPropertyEditor; CurComponentEditor: TtsComponentEditor; ParentProperty: TtsPropertyElement);
{$ENDIF}
var
    i: integer;

begin
    inherited Create;

    Name := Prop.GetName;
    FEditor := TPropertyEditor(Prop);
    FEditorComponent := TPropertyEditor(Prop).GetComponent(0);
    PropInfo := GetPropInfo(FEditor.GetComponent(0).ClassInfo, Name);
    Parent := ParentProperty;
    ComponentEditor := CurComponentEditor;
    SetElementNumber := 0;
    PropertyNil := pnUnknown;

    if Parent = nil then
        PropertyLevel := 0
    else
    begin
        PropertyLevel := Parent.PropertyLevel + 1;

        if Parent.PropType <> nil then
        begin
            if Parent.PropType^.Kind = tkSet then
            begin
                {$IFDEF TSVER_V3}
                with GetTypeData(GetTypeData(Parent.PropType)^.CompType^)^ do
                {$ELSE}
                with GetTypeData(GetTypeData(Parent.PropType)^.CompType)^ do
                {$ENDIF}
                begin
                    for i := MinValue to MaxValue do
                    begin
                        {$IFDEF TSVER_V3}
                        if Name = GetEnumName(GetTypeData(Parent.PropType)^.CompType^, i) then
                        {$ELSE}
                        if Name = GetEnumName(GetTypeData(Parent.PropType)^.CompType, i) then
                        {$ENDIF}
                        begin
                            SetElementNumber := i;
                            break;
                        end;
                    end;
                end;
            end;
        end;
    end;

    SubProperties := nil;

    SubPropertiesUpdated := True;
    Mark := False;
    MultiValue := False;

    ShowPropertyValue := pvShowAlways;
    DesignstrValue := '';
    Showmessage('TtsPropertyElement.Create End');
end;

destructor TtsPropertyElement.Destroy;
begin
    FSubProperties.Free;
    FSubProperties := nil;
    FEditor.Free;
    FEditor := nil;
    inherited Destroy;
end;

function TtsPropertyElement.Compare(NodeSet: TtsCustomSet; Value : TtsSetElement) : TtsSetOrder;
begin
    Result := CompareKey(NodeSet, [TtsPropertyElement(Value).Name]);
end;

function TtsPropertyElement.CompareKey(NodeSet: TtsCustomSet; const KeyValue : array of const) : TtsSetOrder;
var
    CompareValue: integer;

begin
    CompareValue := CompareText(String(KeyValue[0].VAnsiString), Name);
    if  CompareValue > 0 then
        Result := ordLarger
    else if CompareValue < 0 then
        Result := ordSmaller
    else
        Result := ordEqual;
end;

{End TtsPropertyElement}

{TtsPropertySet}

function TtsPropertySet.GetItem(KeyValue : array of const) : TtsPropertyElement;
begin
    result := TtsPropertyElement(Get(KeyValue));
end;

procedure TtsPropertySet.MarkAll(Node : TtsSetNode);
begin
    if Node <> nil then
    begin
        MarkAll(Node.Left);

        TtsPropertyElement(Node.Value).Mark := True;

        MarkAll(Node.Right);
    end;
end;

{End TtsPropertySet}

{TtsPropertyPointerElement}

function TtsPropertyPointerElement.Compare(NodeSet: TtsCustomSet; Value : TtsSetElement) : TtsSetOrder;
begin
    Result := FElement.Compare(NodeSet, TtsPropertyPointerElement(Value).FElement);
end;

function TtsPropertyPointerElement.CompareKey(NodeSet: TtsCustomSet; const KeyValue : array of const) : TtsSetOrder;
begin
    Result := FElement.CompareKey(NodeSet, KeyValue);
end;

{End TtsPropertyPointerElement}

{TtsPropertyPointerSet}

function TtsPropertyPointerSet.GetItem(KeyValue : array of const) : TtsPropertyPointerElement;
begin
    result := TtsPropertyPointerElement(Get(KeyValue));
end;

{End TtsPropertyPointerSet}

{TtsActualValueElement}

function TtsActualValueElement.Compare(NodeSet: TtsCustomSet; Value : TtsSetElement) : TtsSetOrder;
begin
    Result := CompareKey(NodeSet, [TtsActualValueElement(Value).FComponentId, TtsActualValueElement(Value).FProperty.Name]);
end;

function TtsActualValueElement.CompareKey(NodeSet: TtsCustomSet; const KeyValue : array of const) : TtsSetOrder;
var
    CompareValue: integer;

begin
    CompareValue := CompareText(String(KeyValue[0].VAnsiString), FComponentId);
    if  CompareValue > 0 then
        Result := ordLarger
    else if CompareValue < 0 then
        Result := ordSmaller
    else
        Result := FProperty.CompareKey(NodeSet, KeyValue[1]);
end;

{End TtsActualValueElement}

{TtsActualValueSet}

procedure TtsActualValueSet.SetNumberOfToggleValues(Value: integer);
begin
    FNumberOfToggleValues := Value;

    FComponentEditor.DoNumberofToggleValuesChanged;
end;

procedure TtsActualValueSet.SetNumberOfInvisibleValues(Value: integer);
begin
    FNumberOfInvisibleValues := Value;

    FComponentEditor.DoNumberofInvisibleValuesChanged;
end;

constructor TtsActualValueSet.Create;
begin
    inherited;

    FNumberOfToggleValues := 0;
    FNumberOfInvisibleValues := 0;
    FComponentEditor := nil;
end;

function TtsActualValueSet.Add(NodeValue : TtsSetElement) : Pointer;
begin
    result := inherited Add(NodeValue);

    if TtsActualValueElement(NodeValue).FProperty.ShowPropertyValue = pvShowToggle1 then
        NumberOfToggleValues := NumberOfToggleValues + 1
    else if TtsActualValueElement(NodeValue).FProperty.ShowPropertyValue = pvShowToggle2 then
        NumberOfInvisibleValues := NumberOfInvisibleValues + 1;
end;

function TtsActualValueSet.Remove(KeyValue : array of const) : Pointer;
var
    ActualValueElement: TtsActualValueElement;
begin
    ActualValueElement := GetItem(KeyValue);
    if ActualValueElement <> nil then
    begin
        if ActualValueElement.FProperty.ShowPropertyValue = pvShowToggle1 then
            NumberOfToggleValues := NumberOfToggleValues - 1
        else if ActualValueElement.FProperty.ShowPropertyValue = pvShowToggle2 then
            NumberOfInvisibleValues := NumberOfInvisibleValues - 1;

        result := inherited Remove(KeyValue);
    end
    else
        result := nil;
end;

function TtsActualValueSet.GetItem(KeyValue : array of const) : TtsActualValueElement;
begin
    result := TtsActualValueElement(Get(KeyValue));
end;

{End TtsActualValueSet}

{TtsGroupElement}

constructor TtsGroupElement.Create;
begin
    inherited;

    FSubGroups := TtsGroupSet.Create;
    FPropertySet := TtsPropertyPointerSet.Create;
    FGroupSet := nil;
end;

destructor TtsGroupElement.Destroy;
begin
    FSubGroups.Free;
    FSubGroups := nil;
    FPropertySet.Free;
    FPropertySet := nil;

    inherited Destroy;
end;

function TtsGroupElement.FindSubGroup(GroupName: string): TtsGroupElement;
var
    CurGroup: TtsGroupElement;
    GroupNameItem: string;
    GroupNameRemainder: string;
    Msg: string;

begin
    CurGroup := Self;

    GroupNameRemainder := GroupName;
    while (GroupNameRemainder <> '') and (CurGroup <> nil) do
    begin
        SeparateFirstPart(GroupNameRemainder, GroupNameItem, '.');
        CurGroup := CurGroup.FSubGroups.GetItem([GroupNameItem]);
    end;

    if CurGroup = nil  then
    begin
        Msg := Format(StsGroupNameNotFound, [GroupName]);
        ShowMessage(Msg);
    end;

    Result := CurGroup;
end;

procedure TtsGroupElement.AddGroup(Parent, Name: string; Opened: Boolean);
var
    CurGroup: TtsGroupElement;
    Element: TtsGroupElement;

begin
    CurGroup := FindSubGroup(Parent);
    if CurGroup <> nil then
    begin
        Element := TtsGroupElement.Create;
        Element.Name := Name;
        Element.FOpened := Opened;
        CurGroup.FSubGroups.Add(Element);
    end;
end;

function TtsGroupElement.Release(DestroyingSet : Boolean) : TtsSetElement;
begin
    if not FGroupSet.FInSetName then
        result := inherited Release(DestroyingSet)
    else
        result := self;
end;

procedure TtsGroupElement.SetName(NewName: string);
begin
    if FGroupSet <> nil then
    begin
        FGroupSet.FInSetName := True;

        try
            FGroupSet.Remove([FName]);
            FName := NewName;
            FGroupSet.Add(Self);
        finally
            FGroupSet.FInSetName := False;
        end;
    end
    else
        FName := NewName;
end;

function TtsGroupElement.Compare(NodeSet: TtsCustomSet; Value : TtsSetElement) : TtsSetOrder;
begin
    Result := CompareKey(NodeSet, [TtsGroupElement(Value).FName]);
end;

function TtsGroupElement.CompareKey(NodeSet: TtsCustomSet; const KeyValue : array of const) : TtsSetOrder;
var
    CompareValue: integer;
begin
    CompareValue := CompareText(String(KeyValue[0].VAnsiString), FName);
    if  CompareValue > 0 then
        Result := ordLarger
    else if CompareValue < 0 then
        Result := ordSmaller
    else
        Result := ordEqual;
end;

{End TtsGroupElement}

{TtsGroupSet}

function TtsGroupSet.Add(Element : TtsSetElement): Pointer;
begin
    result := inherited Add(Element);

    TtsGroupElement(Element).FGroupSet := Self;
end;

function TtsGroupSet.GetItem(KeyValue : array of const) : TtsGroupElement;
begin
    result := TtsGroupElement(Get(KeyValue));
end;

{End TtsGroupSet}

{TtsComponentEditor}

constructor TtsComponentEditor.Create(AOwner: TComponent);
begin
    ShowMessage('TtsComponentEditor.Create Start');
    inherited Create(AOwner);

    FComponent := nil;
    FPropertySet := nil;
    FDisplayModes := nil;
    ComponentSelected := False;
    MultipleComponentSelected := False;
    FComponentAssigned := False;
    FCurPropertyElement := nil;
    FComponentSelection := nil;
    FComponentCount := 0;
    FActualValueSet := nil;
    FShowDesignValue := [pvShowAlways];
    FDesignValuePropertiesInitialized := False;
    ShowMessage('TtsComponentEditor.Create End');
end;

destructor TtsComponentEditor.Destroy;
begin
    FPropertySet.Free;
    FPropertySet := nil;
    FDisplayModes.Free;
    FDisplayModes := nil;
    FActualValueSet.Free;
    FActualValueSet := nil;
    DoDestroyComponentSelection(FComponentSelection, FComponentCount);

    inherited Destroy;
end;

{$IFDEF TSVER_V6}
procedure TtsComponentEditor.SetPropertyEditor(const Prop: IProperty);
{$ELSE}
procedure TtsComponentEditor.SetPropertyEditor(Prop: TPropertyEditor);
{$ENDIF}
var
    Element: TtsPropertyElement;

begin
    Element := PropertySet.GetItem([Prop.GetName]);

    if Element = nil then
    begin
        Element := TtsPropertyElement.Create(Prop, Self, nil);
        PropertySet.Add(Element);
    end
    else
    begin
        Element.FEditor.Free;
        Element.Editor := TPropertyEditor(Prop);
        Element.FEditorComponent := TPropertyEditor(Prop).GetComponent(0);
    end;

end;

procedure TtsComponentEditor.SetPropertyList;
var
    {$IFDEF TSVER_V5}
    {$IFDEF TSVER_V6}
    Components: TDesignerSelections;
    {$ELSE}
    Components: TDesignerSelectionList;
    {$ENDIF}
    {$ELSE}
    Components: TComponentList;
    {$ENDIF}
begin
    {$IFDEF TSVER_V5}
    {$IFDEF TSVER_V6}
    Components := TDesignerSelections.Create;
    {$ELSE}
    Components := TDesignerSelectionList.Create;
    {$ENDIF}
    {$ELSE}
    Components := TComponentList.Create;
    {$ENDIF}

    try
        if Component <> nil then
        begin
            {$IFDEF TSVER_V6}
            (Components as IDesignerSelections).Add(Component);
            {$ELSE}
            Components.Add(TComponent(Component));
            {$ENDIF}
            ShowMessage('TtsComponentEditor.GetComponentProperties');
            GetComponentProperties(Components, tkProperties, Designer, SetPropertyEditor);
        end;
    finally
        Components.Free;
    end;
end;

function TtsComponentEditor.AssignComponent: TPersistent;
begin
    if (not ComponentAssigned) then
    begin
        GetComponents;
        ComponentAssigned := True;
    end;

    result := FComponent;
end;

procedure TtsComponentEditor.GetComponents;
var
    FirstComponent: TPersistent;
    NextComponent: TPersistent;

begin
    DoGetFirstSelectedComponent(FirstComponent);

    FComponent := FirstComponent;

    ComponentSelected := (FComponent <> nil);

    if ComponentSelected then
    begin
        NextComponent := FirstComponent;
        DoGetNextSelectedComponent(NextComponent);
        MultipleComponentSelected := (NextComponent <> nil);
    end
    else
        MultipleComponentSelected := False;
end;

procedure TtsComponentEditor.SetShowDesignValue(Value: tsShowPropertyValueSet);
var
    ActualValueList: TtsSetList;
    i: integer;
    CurComponent: TPersistent;
    PropertyElement: TtsPropertyElement;
    PropertyValue: Variant;
    PropertystrValue: string;

begin
    FShowDesignValue := Value;

    ActualValueList := ActualValueSet.List;
    try
        for i := 1 to ActualValueList.Count do
        begin
            DoGetComponentWithId(TtsActualValueElement(ActualValueList.Items[i]).FComponentId, CurComponent);
            if CurComponent = nil then
                ActualValueSet.Remove([TtsActualValueElement(ActualValueList.Items[i]).FComponentId, TtsActualValueElement(ActualValueList.Items[i]).FProperty.Name])
            else
            begin
                PropertyElement := PropertySet.GetItem([TtsActualValueElement(ActualValueList.Items[i]).FProperty.Name]);

                if (not ((PropertyElement.Parent = nil) and (PropertyElement.Name = 'Name'))) and (PropertyElement.Name <> 'Width') and (PropertyElement.Name <> 'Height') then
                begin
                    if PropertyElement.ShowPropertyValue in FShowDesignValue then
                        PropertystrValue := TtsActualValueElement(ActualValueList.Items[i]).FActualstrValue
                    else
                        PropertystrValue := PropertyElement.DesignstrValue;

                    PropertyValue := PropertyElement.ConvertDesignPropertystrValueToValue(PropertystrValue);

                    PropertyElement.SetPropertyValue(CurComponent, PropertyValue)
                end;
            end;
        end;
    finally
        ActualValueList.Free;
    end;
end;

function TtsComponentEditor.GetPropertySet: TtsPropertySet;
begin
    if FPropertySet = nil then
    begin
        FPropertySet := TtsPropertySet.Create;
        SetPropertyList;
    end;

    result := FPropertySet;
end;

function TtsComponentEditor.GetDisplayModes: TtsGroupSet;
begin
    if FDisplayModes = nil then
        FDisplayModes := TtsGroupSet.Create;

    result := FDisplayModes;
end;

function TtsComponentEditor.AddDisplayMode(DisplayModeName: string): TtsGroupElement;
begin
    result := TtsGroupElement.Create;
    result.Name := DisplayModeName;
    DisplayModes.Add(result);
end;

procedure TtsComponentEditor.SetActualValue(ComponentId: string; PropertyElement: TtsPropertyElement; strValue: string);
var
    Element: TtsActualValueElement;
begin
    if LowerCase(PropertyElement.DesignstrValue) = LowerCase(strValue) then
        ActualValueSet.Remove([ComponentId, PropertyElement.Name])
    else
    begin
        Element := ActualValueSet.GetItem([ComponentId, PropertyElement.Name]);
        if Element = nil then
        begin
            Element := TtsActualValueElement.Create;
            Element.FComponentId := ComponentId;
            Element.FProperty := PropertyElement;
            ActualValueSet.Add(Element);
        end;

        Element.FActualstrValue := strValue;
    end;
end;

procedure TtsComponentEditor.AddProperty(DisplayMode: TtsGroupElement; GroupName: string; Name: string);
var
    CurGroup: TtsGroupElement;
    Element: TtsPropertyPointerElement;
    PropertyPointer: TtsPropertyElement;
    Msg: string;

begin
    CurGroup := DisplayMode.FindSubGroup(GroupName);
    if CurGroup <> nil then
    begin
        PropertyPointer := PropertySet.GetItem([Name]);
        if PropertyPointer = nil then
        begin
            Msg := Format(StsPropertyNotFound, [Name]);
        end
        else
        begin
            Element := TtsPropertyPointerElement.Create;
            Element.FElement := PropertyPointer;
            CurGroup.FPropertySet.Add(Element);
        end;
    end;
end;

procedure TtsComponentEditor.SetDesignProperty(PropertyName: string; ShowPropertyValue: tsShowPropertyValueType; DesignstrValue: string);
var
    PropertyRemainder: string;
    PropertyItem: string;
    PropertyPointer: TtsPropertyElement;
    CurPropertySet: TtsPropertySet;
    Msg: string;

begin
    PropertyRemainder := PropertyName;
    CurPropertySet := PropertySet;

    repeat
        SeparateFirstPart(PropertyRemainder, PropertyItem, '.');
        PropertyPointer := CurPropertySet.GetItem([PropertyItem]);
        if (PropertyPointer <> nil) then
            CurPropertySet := PropertyPointer.SubProperties;
    until (PropertyPointer = nil) or (PropertyRemainder = '');

    if PropertyPointer = nil then
    begin
        Msg := Format(StsPropertyNotFound, [PropertyName]);
    end
    else
    begin
        PropertyPointer.ShowPropertyValue := ShowPropertyValue;
        PropertyPointer.DesignstrValue := DesignstrValue;
    end;
end;

procedure TtsComponentEditor.DoGetComponentInfo(DisplayMode: TtsGroupElement);
begin
    if Assigned(FOnGetComponentInfo) then FOnGetComponentInfo(Self, DisplayMode);
end;

procedure TtsComponentEditor.DoGetFirstSelectedComponent(var Component: TPersistent);
begin
    if Assigned(FOnGetFirstSelectedComponent)
        then FOnGetFirstSelectedComponent(Self, Component)
        else Component := FComponent;
end;

procedure TtsComponentEditor.DoGetNextSelectedComponent(var Component: TPersistent);
begin
    if Assigned(FOnGetNextSelectedComponent)
        then FOnGetNextSelectedComponent(Self, Component)
        else Component := nil;
end;

procedure TtsComponentEditor.DoGetComponentWithId(ComponentId: string; var Component: TPersistent);
begin
    if Assigned(FOnGetComponentWithId)
        then FOnGetComponentWithId(Self, ComponentId, Component)
        else Component := nil;
end;

procedure TtsComponentEditor.DoGetComponentId(Component: TPersistent; var ComponentId: string);
begin
    if Assigned(FOnGetComponentId)
        then FOnGetComponentId(Self, Component, ComponentId)
        else ComponentId := '';
end;

procedure TtsComponentEditor.DoGetComponentSelection(var ComponentSelection: Pointer; var ComponentCount: integer);
begin
    if Assigned(FOnGetComponentSelection) then
        FOnGetComponentSelection(Self, ComponentSelection, ComponentCount)
    else
    begin
        ComponentSelection := nil;
        ComponentCount := 0;
    end;
end;

procedure TtsComponentEditor.DoGetComponentSelectionChanged(CurSelection: Pointer; var Changed: Boolean);
begin
    if Assigned(FOnGetComponentSelectionChanged)
        then OnGetComponentSelectionChanged(Self, CurSelection, Changed)
        else Changed := True;
end;

procedure TtsComponentEditor.DoDestroyComponentSelection(var ComponentSelection: Pointer; var ComponentCount: Integer);
begin
    if Assigned(FOnDestroyComponentSelection) then
        FOnDestroyComponentSelection(Self, ComponentSelection);
    ComponentSelection := nil;
    ComponentCount := 0;
end;

procedure TtsComponentEditor.DoScanObjects(State: tsScanObjectsState; Writing: Boolean; Count: Longint; var Cancel: Boolean);
begin
    if Assigned(FOnScanObjects)
        then FOnScanObjects(Self, State, Writing, Count, Cancel);
end;

procedure TtsComponentEditor.DoSetValues(State: tsScanObjectsState; Component: Tpersistent; PropertyElement: TtsPropertyElement; strValue: string; Value: Variant; ValueSource: tsValueSource; ValueSet: Boolean; var Cancel: Boolean);
begin
    if Assigned(FOnSetValues)
        then FOnSetValues(Self, State, Component, PropertyElement, strValue, Value, ValueSource, ValueSet, Cancel);
end;

procedure TtsComponentEditor.DoNumberofToggleValuesChanged;
begin
    if Assigned(FOnNumberofToggleValuesChanged)
        then FOnNumberofToggleValuesChanged(Self);
end;

procedure TtsComponentEditor.DoNumberofInvisibleValuesChanged;
begin
    if Assigned(FOnNumberofInvisibleValuesChanged)
        then FOnNumberofInvisibleValuesChanged(Self);
end;

function TtsComponentEditor.GetActualValueSet: TtsActualValueSet;
begin
    if FActualValueSet = nil then
    begin
        FActualValueSet := TtsActualValueSet.Create;
        FActualValueSet.FComponentEditor := Self;
    end;

    result := FActualValueSet;
end;

{End TtsComponentEditor}

{TDummyDesigner}
{$IFDEF TSVER_V4}
constructor TDummyDesigner.Create;
begin
    inherited;
    FCustomForm := nil;
    FIsControl := True;
end;
{$ENDIF}

function TDummyDesigner.CreateMethod(const Name: string; TypeData: PTypeData): TMethod;
begin
    result.Code := nil;
    result.Data := nil;
end;

function TDummyDesigner.GetMethodName(const Method: TMethod): string;
begin
    result := '';
end;

procedure TDummyDesigner.GetMethods(TypeData: PTypeData; Proc: TGetStrProc);
begin
end;

function TDummyDesigner.GetPrivateDirectory: string;
begin
    result := '';
end;

{$IFNDEF TSVER_V4}
procedure TDummyDesigner.GetSelections(List: TComponentList);
begin
end;
{$ELSE} {Function definition changed in Delphi 4}
procedure TDummyDesigner.GetSelections(const List: IDesignerSelections);
begin
end;
{$ENDIF}

function TDummyDesigner.MethodExists(const Name: string): Boolean;
begin
    result := False;
end;

procedure TDummyDesigner.RenameMethod(const CurName, NewName: string);
begin
end;

{$IFDEF TSVER_V3}
procedure TDummyDesigner.SelectComponent(Instance: TPersistent);
begin
end;
{$ELSE}
procedure TDummyDesigner.SelectComponent(Instance: TComponent);
begin
end;
{$ENDIF}

{$IFNDEF TSVER_V4}
procedure TDummyDesigner.SetSelections(List: TComponentList);
begin
end;
{$ELSE} {Function definition changed in Delphi 4}
procedure TDummyDesigner.SetSelections(const List: IDesignerSelections);
begin
end;
{$ENDIF}

procedure TDummyDesigner.ShowMethod(const Name: string);
begin
end;

function TDummyDesigner.UniqueName(const BaseName: string): string;
begin
    result := BaseName;
end;

procedure TDummyDesigner.GetComponentNames(TypeData: PTypeData; Proc: TGetStrProc);
var
    I: Integer;
begin
    for I := 0 to Form.ComponentCount - 1 do
    begin
        if TypeData.ClassType = Form.Components[I].ClassType then
            Proc(Form.Components[I].Name);
    end;
end;

function TDummyDesigner.GetComponent(const Name: string): TComponent;
var
    I: Integer;
begin
    result := nil;
    for I := 0 to Form.ComponentCount - 1 do
    begin
        if LowerCase(Name) = LowerCase(Form.Components[I].Name) then
        begin
            result := Form.Components[I];
            exit;
        end;
    end;
end;

function TDummyDesigner.GetComponentName(Component: TComponent): string;
begin
    if Component = nil then
        result := ''
    else
        result := Component.Name;
end;

{$IFDEF TSVER_V3}
function TDummyDesigner.GetObject(const Name: string): TPersistent;
begin
    result := nil;
end;

function TDummyDesigner.GetObjectName(Instance: TPersistent): string;
begin
    result := '';
end;

procedure TDummyDesigner.GetObjectNames(TypeData: PTypeData; Proc: TGetStrProc);
begin
end;
{$ENDIF}

function TDummyDesigner.MethodFromAncestor(const Method: TMethod): Boolean;
begin
    result := False;
end;

function TDummyDesigner.CreateComponent(ComponentClass: TComponentClass; Parent: TComponent;
  Left, Top, Width, Height: Integer): TComponent;
begin
    result := nil;
end;

function TDummyDesigner.IsComponentLinkable(Component: TComponent): Boolean;
begin
    result := False;
end;

procedure TDummyDesigner.MakeComponentLinkable(Component: TComponent);
begin
end;

function TDummyDesigner.GetRoot: TComponent;
begin
    result := nil;
end;

procedure TDummyDesigner.Revert(Instance: TPersistent; PropInfo: PPropInfo);
begin
end;

{$IFDEF TSVER_V3}
function TDummyDesigner.GetIsDormant: Boolean;
begin
    result := False;
end;

function TDummyDesigner.HasInterface: Boolean;
begin
    result := True;
end;

function TDummyDesigner.HasInterfaceMember(const Name: string): Boolean;
begin
    result := True;
end;

{$IFNDEF TSVER_CBUILD}
procedure TDummyDesigner.AddInterfaceMember(const MemberText: string);
begin
end;
{$ELSE} {$IFDEF TSVER_V4}
procedure TDummyDesigner.AddInterfaceMember(const MemberText: string);
begin
end;
{$ENDIF} {$ENDIF}
{$ENDIF}

{$IFDEF TSVER_CBUILD} {$IFDEF TSVER_V3} {$IFNDEF TSVER_V4}
procedure TDummyDesigner.AddToInterface(InvKind: Integer; const Name: string; VT: Word; const TypeInfo: string);
begin
end;

procedure TDummyDesigner.GetProjectModules(Proc: TGetModuleProc);
begin
end;
{$ENDIF} {$ENDIF} {$ENDIF}

{$IFDEF TSVER_V4} {Additional methods defined in Delphi 4}
procedure TDummyDesigner.AddToInterface(InvKind: Integer; const Name: string; VT: Word; const TypeInfo: string);
begin
end;

procedure TDummyDesigner.GetProjectModules(Proc: TGetModuleProc);
begin
end;

{$IFDEF TSVER_V6}
function TDummyDesigner.GetAncestorDesigner: IDesigner;
begin
    Result := nil;
end;
{$ELSE}
function TDummyDesigner.GetAncestorDesigner: IFormDesigner;
begin
    Result := nil;
end;
{$ENDIF}

function TDummyDesigner.IsSourceReadOnly: Boolean;
begin
    Result := False;
end;

function TDummyDesigner.GetCustomForm: TCustomForm;
begin
    Result := FCustomForm;
end;

procedure TDummyDesigner.SetCustomForm(Value: TCustomForm);
begin
    FCustomForm := Value;
end;

function TDummyDesigner.GetIsControl: Boolean;
begin
    Result := FIsControl;
end;

procedure TDummyDesigner.SetIsControl(Value: Boolean);
begin
    FIsControl := Value;
end;
{$ENDIF}

function TDummyDesigner.IsDesignMsg(Sender: TControl; var Message: TMessage): Boolean;
begin
    result := True;
end;

procedure TDummyDesigner.Modified;
begin
end;

{$IFNDEF TSVER_V4}
procedure TDummyDesigner.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
end;
{$ELSE} {Function definition changed in Delphi 4}
procedure TDummyDesigner.Notification(AnObject: TPersistent; Operation: TOperation);
begin
end;
{$ENDIF}

{$IFDEF TSVER_V6}
procedure TDummyDesigner.Activate;
begin
end;
function TDummyDesigner.GetBaseRegKey: string;
begin
end;
function TDummyDesigner.GetIDEOptions: TCustomIniFile;
begin
  Result := Nil;
end;
function TDummyDesigner.GetPathAndBaseExeName: string;
begin
end;
function TDummyDesigner.CreateCurrentComponent(Parent: TComponent; const Rect: TRect): TComponent;
begin
  Result := Nil;
end;
function TDummyDesigner.IsComponentHidden(Component: TComponent): Boolean;
begin
  Result := False;
end;
function TDummyDesigner.GetShiftState: TShiftState;
begin
end;
procedure TDummyDesigner.ModalEdit(EditKey: Char; const ReturnWindow: IActivatable);
begin
end;
procedure TDummyDesigner.SelectItemName(const PropertyName: string);
begin
end;
procedure TDummyDesigner.Resurrect;
begin
end;
{$ENDIF}

procedure TDummyDesigner.PaintGrid;
begin
end;

procedure TDummyDesigner.ValidateRename(AComponent: TComponent;
  const CurName, NewName: string);
begin
end;

{$IFDEF TSVER_V5}
function TDummyDesigner.GetContainerWindow: TWinControl;
begin
    Result := nil;
end;

procedure TDummyDesigner.SetContainerWindow(const NewContainer: TWinControl);
begin
end;

function TDummyDesigner.GetScrollRanges(const ScrollPosition: TPoint): TPoint;
begin
    Result := Point(0,0);
end;

{$IFDEF TSVER_V6}
procedure TDummyDesigner.Edit(const Component: TComponent);
begin
end;
{$ELSE}
procedure TDummyDesigner.Edit(const Component: IComponent);
begin
end;

function TDummyDesigner.BuildLocalMenu(Base: TPopupMenu; Filter: TLocalMenuFilters): TPopupMenu;
begin
    Result := nil;
end;
{$ENDIF}

procedure TDummyDesigner.ChainCall(const MethodName, InstanceName, InstanceMethod: string; TypeData: PTypeData);
begin
end;

procedure TDummyDesigner.CopySelection;
begin
end;

procedure TDummyDesigner.CutSelection;
begin
end;

function TDummyDesigner.CanPaste: Boolean;
begin
    Result := False;
end;

procedure TDummyDesigner.PasteSelection;
begin
end;

{$IFDEF TSVER_V6}
procedure TDummyDesigner.DeleteSelection(ADoAll: Boolean);
{$ELSE}
procedure TDummyDesigner.DeleteSelection;
{$ENDIF}
begin
end;

procedure TDummyDesigner.ClearSelection;
begin
end;

procedure TDummyDesigner.ModuleFileNames(var ImplFileName, IntfFileName, FormFileName: string);
begin
end;

procedure TDummyDesigner.NoSelection;
begin
end;

function TDummyDesigner.GetRootClassName: string;
begin
    result := '';
end;
{$ENDIF}

{End TDummyDesigner}

{TtsGridInspector}

constructor TtsGridInspector.Create(AOwner: TComponent);
begin
    ShowMessage('TtsGridInspector.Create Start');
    inherited Create(AOwner);

    if Designer = nil then  // Only at runtime is this NIL and then use the Dummy
        Designer := TDummyDesigner.Create;

    FComponentEditor := nil;
    CurrentComponentEditor := nil;
    InspectorKeyIsDown := False;
    PropertyValueList := nil;
    FInspectorRows := nil;
    FDisplayModeName := '';
    FCurMaxInspectorRowCount := 0;
    FComboOpen := False;
    SelectedLastChanged := 0;
    SelectedLastUpdated := 0;

    Cols := 2;
    Rows := 0;

    ColMoving := False;
    ColSelectMode := csNone;
    DefaultRowHeight := 15;
    FixedColCount := 1;
    FixedLineColor := clNone;
    ReadOnlyButton := False;
    ResizeRows := rrNone;
    RowMoving := False;
    ScrollBars := ssVertical;
    Thumbtracking := True;

    EditMode := emEdit;
    Col[1].Is3D := True;
    Col[1].ReadOnly := True;
    Col[1].Width := 145;
    ShowMessage('TtsGridInspector.Create End');
end;

destructor TtsGridInspector.Destroy;
begin
    PropertyValueList.Free;
    PropertyValueList := nil;
    ZeroMemory(FInspectorRows, (FCurMaxInspectorRowCount * SizeOf(TtsInspectorRow)));
    ReallocMem(FInspectorRows, 0);
    FInspectorRows := nil;

    inherited Destroy;
end;

procedure TtsGridInspector.DoCellLoaded(DataCol, DataRow: Longint; var Value: Variant);
var
    DisplayName, IndentValue: string;

begin
    with InspectorRows[DataRow] do
    begin
        if DataCol = 1 then
        begin
            GetDisplayName(InspectorRows[DataRow], DisplayName, IndentValue);
            if DisplayName = 'DisplayCol' then DisplayName := 'DataCol';
            if DisplayName = 'DisplayRow' then DisplayName := 'DataRow';

            Value := IndentValue + DisplayName;
        end
        else if (DataCol = 2) and (InspectorElementType = iePropertyElement) then
            Value := GetPropertyDisplayValue(PropertyElement);
    end;

    inherited;
end;

procedure TtsGridInspector.DoButtonClick(DataCol: Longint; DataRow: Variant);
begin
    with InspectorRows[TVarData(DataRow).VInteger].PropertyElement do
    begin
        if not (paValueList in Editor.GetAttributes) then
        begin
            try
                EditMode := emNone;
                Editor.Edit;
            finally
                EditMode := emEdit;
                SetValues(InspectorRows[TVarData(DataRow).VInteger].PropertyElement, '', Unassigned, vsComponent , True);
                CurrentCell.Refresh;
                Refresh;
            end;
        end;
    end;

    inherited;
end;

procedure TtsGridInspector.DoDblClickCell(DataCol: Longint; DataRow: Variant; Pos: TtsClickPosition);
var
    PossibleOpenClose: Boolean;
    Row: integer;
    CurVertScrollBarVisible: Boolean;

begin
    if DataRow <= 0 then
    begin
        inherited;
        exit;
    end;

    if DataCol = 1 then
    begin
        CurVertScrollBarVisible := VertScrollBarVisible;

        with InspectorRows[TVarData(DataRow).VInteger] do
        begin
            EnablePaint := False;
            try
                if InspectorElementType = ieGroupElement then
                    PossibleOpenClose := True
                else if (PropertyElement.SubProperties <> nil) then
                    PossibleOpenClose := True
                else
                    PossibleOpenClose := False;

                if PossibleOpenClose then
                begin
                    Opened := not Opened;
                    Row := DisplayRownr[TVarData(DataRow).VInteger] + 1;
                    while Row <= Rows do
                    begin
                        if InspectorRows[DataRownr[Row]].Level <= Level
                            then break;

                        InspectorRows[DataRownr[Row]].Opened := False;
                        if InspectorRows[DataRownr[Row]].Level = Level + 1 then
                        begin
                            if InspectorRows[DataRownr[Row]].InspectorElementType = iePropertyElement then
                                RowVisible[Row] := Opened
                            else if (InspectorRows[DataRownr[Row]].GroupElement.Name = 'EMPTY GROUP') then
                                RowVisible[Row] := False
                            else
                                RowVisible[Row] := Opened;

                            if RowVisible[Row] and not (InspectorRows[DataRownr[Row]].ButtonSet) then
                                SetButton(DataRownr[Row]);
                        end
                        else
                            RowVisible[Row] := False;

                        Row := Row + 1;
                    end;
                    if Opened then
                    begin
                        PutCellInView(2, DataRownr[Row - 1]);
                        PutCellInView(2, DataRow);
                    end;
                end;
            finally
                if CurVertScrollBarVisible <> VertScrollBarVisible then
                begin
                    if CurVertScrollBarVisible then
                        Col[2].Width := VertScrollBarWidth + ClientWidth - Col[1].Width - RowBarWidth + 1
                    else
                        Col[2].Width := - VertScrollBarWidth + ClientWidth - Col[1].Width - RowBarWidth + 1;
                end;
                EnablePaint := True;
            end;
        end;
    end
    else if DataCol = 2 then
    begin
        with InspectorRows[TVarData(DataRow).VInteger] do
        begin
            if InspectorElementType = iePropertyElement then
            begin
                if paDialog in PropertyElement.Editor.GetAttributes then
                begin
                    PropertyElement.Editor.Edit;
                    SetValues(PropertyElement, '', Unassigned, vsComponent, True);
                    CurrentCell.Refresh;
                    Refresh;
                end
                else if paValueList in PropertyElement.Editor.GetAttributes then
                begin
                    PropertyValueList.Free;
                    PropertyValueList := TStringList.Create;
                    PropertyValueList.Sorted := paSortList in PropertyElement.Editor.GetAttributes;
                    PropertyElement.Editor.GetValues(GetPropertyValues);
                    if PropertyValueList.Count > 0 then
                    begin
                        SetValues(PropertyElement, PropertyValueList[(PropertyValueList.IndexOf(GetPropertyDisplayValue(PropertyElement)) + 1) mod PropertyValueList.Count], Unassigned, vsstrValue, False);
                        Refresh;
                        CurrentCell.Refresh;
                    end;
                end;
            end;
        end;
    end;

    inherited;
end;

procedure TtsGridInspector.DoComboInit(DataCol: Longint; DataRow: Variant);
begin
    Combo.Grid.DefaultRowHeight := DefaultRowHeight;
    Combo.AutoSearch := asBottom;
    Combo.Grid.Cols := 1;
    PropertyValueList.Free;
    PropertyValueList := TStringList.Create;
    PropertyValueList.Sorted := paSortList in InspectorRows[TVarData(DataRow).VInteger].PropertyElement.Editor.GetAttributes;
    InspectorRows[TVarData(DataRow).VInteger].PropertyElement.Editor.GetValues(GetPropertyValues);
    Combo.Grid.Rows := PropertyValueList.Count;

    inherited;
end;


procedure TtsGridInspector.DoComboCellLoaded(DataCol, DataRow: Longint; var Value: Variant);
begin
    Value := PropertyValueList[DataRow - 1];

    inherited;
end;

procedure TtsGridInspector.DoComboGetValue(GridDataCol: Longint; GridDataRow, ComboDataRow: Variant; var Value: Variant);
begin
    ComboValueSelected := True;

    inherited;
end;

procedure TtsGridInspector.DoCellEdit(DataCol: Longint; DataRow: Variant; ByUser: Boolean);
begin
    with InspectorRows[TVarData(DataRow).VInteger] do
    begin
        if ByUser and (paAutoUpdate in PropertyElement.Editor.GetAttributes) then
        begin
            SetValues(PropertyElement, CurrentCell.Value, Unassigned, vsStrValue, False);
            Refresh;
            CurrentCell.Refresh;
        end;
    end;

    inherited;
end;

procedure TtsGridInspector.DoEndCellEdit(DataCol: Longint; DataRow: Variant; var Cancel: Boolean);
begin
    try
        with InspectorRows[TVarData(DataRow).VInteger] do
            SetValues(PropertyElement, CurrentCell.Value, Unassigned, vsstrValue, False);

        ResetRowProperties([prChanged]);
        CurrentCell.Refresh;
        Refresh;
    except
        on E:Exception do
        begin
            Cancel := True;

            ShowMessage(E.Message);
            CurrentCell.Refresh;
            CurrentCell.SelectAll;
            ResetRowProperties([prChanged]);
        end;
    end;

    if not Cancel then
        inherited;
end;

procedure TtsGridInspector.DoKeyDown(var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_RETURN) and (not FComboOpen) then
    begin
        if ssCtrl in Shift then
        begin
            DoDblClickCell(1, CurrentDataRow, cpCell);
            CurrentCell.MoveTo(2, CurrentDataRow);
            Key := 0;
            exit;
        end
        else
        begin
            EndEdit(False);
            CurrentCell.SelectAll;
            Key := 0;
            exit;
        end;
    end;
    InspectorKeyIsDown := True;

    inherited;
end;

procedure TtsGridInspector.DoKeyUp(var Key: Word; Shift: TShiftState);
begin
    if InspectorKeyIsDown then
        InspectorKeyIsDown := False;

    inherited;
end;

procedure TtsGridInspector.DoComboDropDown(DataCol: Longint; DataRow: Variant);
begin
    FComboOpen := True;
    ComboValueSelected := False;

    inherited;
end;

procedure TtsGridInspector.DoComboRollUp(DataCol: Longint; DataRow: Variant);
begin
    if not ComboValueSelected then
        exit;

    ComboValueSelected := False;

    if Combo.Grid.CurrentDataRow > 0 then
    begin
        CurrentCell.Value := PropertyValueList[Combo.Grid.CurrentDataRow - 1];
        EndEdit(False);

        EndEdit(True);
        ResetRowProperties([prChanged]);

        FComboOpen := False;
    end;

    inherited;
end;

procedure TtsGridInspector.DoStartCellEdit(DataCol: Longint; DataRow: Variant; var Cancel: Boolean);
var
    DisplayName: string;
    IndentValue: string;
begin
    inherited;

    if not Cancel then
    begin
        with InspectorRows[TVarData(DataRow).VInteger] do
        begin
            if InspectorElementType = ieGroupElement then
                Cancel := True
            else
            begin
                if (paReadOnly in PropertyElement.Editor.GetAttributes) then
                    Cancel := True
                else
                begin
                    GetDisplayName(InspectorRows[TVarData(DataRow).VInteger], DisplayName, IndentValue);
                    if (DisplayName = 'DisplayCol') or (DisplayName = 'DisplayRow') then
                        Cancel := True;
                end;
            end;
        end;
    end;
end;

procedure TtsGridInspector.DoColResized(RowColnr: Longint);
begin
    if HandleAllocated then
        if RowColnr <> 2 then
            Col[2].Width := ClientWidth - Col[1].Width - RowBarWidth + 1;

    inherited;
end;

function  TtsGridInspector.ActivateDoGetDrawInfo: Boolean;
begin
    result := True;
end;

procedure TtsGridInspector.DoGetDrawInfo(DataCol, DataRow: Longint; var DrawInfo: TtsDrawInfo);
begin
    with InspectorRows[DataRow] do
        if InspectorElementType = ieGroupElement then
            DrawInfo.Font.Color := clNavy;

    inherited;
end;

procedure TtsGridInspector.DoMouseStatusChanged(OldStatus, NewStatus: TtsMouseStatus);
begin
    if (OldStatus = msRowSelect) or (NewStatus = msRowSelect) then
        UpdateSelectedRows;

    inherited;
end;

procedure TtsGridInspector.DoRowChanged(OldDataRow, NewDataRow: Variant);
begin
    inherited;
end;

procedure TtsGridInspector.DoExit;
begin
    if InspectorKeyIsDown then
        InspectorKeyIsDown := False;

    inherited;
end;

procedure TtsGridInspector.UpdateComponents;
var
    Changed: Boolean;

begin
    ComponentEditor.DoGetComponentSelectionChanged(ComponentEditor.FComponentSelection, Changed);
    UpdateContents(False, Changed);
end;

procedure TtsGridInspector.UpdateSelectedRows;
var
    DisplayRow: Integer;
    NewSelectedRow: integer;
    DataRow: Integer;

begin
    if (SelectedRows.Count = 1) then
        NewSelectedRow := SelectedRows.First
    else
        NewSelectedRow := -1;

    for DisplayRow := 1 to Rows do
    begin
        if RowSelected[DataRownr[DisplayRow]] <> InspectorRows[DataRownr[DisplayRow]].Selected then
        begin
            InspectorRows[DataRownr[DisplayRow]].Selected := RowSelected[DataRownr[DisplayRow]];
            InspectorRows[DataRownr[DisplayRow]].SelectedChanged := SelectedLastChanged;
        end;
    end;

    if NewSelectedRow <> -1 then
    begin
        if DataRownr[NewSelectedRow] = CurrentDataRow then
        begin
            SelectedLastChanged := SelectedLastChanged + 1;
            InspectorRows[DataRownr[NewSelectedRow]].SelectedChanged := SelectedLastChanged;
        end;
    end;

    SelectedLastChanged := SelectedLastChanged + 1;
    SelectedLastUpdated := -1;

    EnablePaint := False;
    try
        for DataRow := 1 to InspectorRowCount do
        begin
            with InspectorRows[DataRow] do
            begin
                if Parent <> -1 then
                begin
                    if SelectedChanged <= InspectorRows[Parent].SelectedChanged then
                    begin
                        Selected := Boolean(InspectorRows[Parent].Selected);
                        SelectedChanged := InspectorRows[Parent].SelectedChanged;
                        RowSelected[DataRow] := Selected;
                    end;
                end;
            end;
        end;
    finally
        EnablePaint := True;
        Update;
        SelectedLastUpdated := SelectedLastChanged;

        inherited;
    end;
end;

procedure TtsGridInspector.OpenCurPropertyElement(var CurPropertyDataRow: integer);
var
    i, j: integer;
    LowestLevel: integer;

begin
    CurPropertyDataRow := -1;

    if ComponentEditor.CurPropertyElement = nil then
        exit;

    if InspectorRows[CurrentDataRow].InspectorElementType = iePropertyElement then
        if InspectorRows[CurrentDataRow].PropertyElement = ComponentEditor.CurPropertyElement then
            exit;

    for i := 1 to InspectorRowCount do
    begin
        if InspectorRows[i].InspectorElementType = iePropertyElement then
        begin
            if InspectorRows[i].PropertyElement = ComponentEditor.CurPropertyElement then
            begin
                LowestLevel := InspectorRows[i].Level;
                for j:=i-1 downto 1 do
                begin
                    if LowestLevel > InspectorRows[j].Level then
                    begin
                        InspectorRows[j].Opened := True;
                        LowestLevel := InspectorRows[j].Level;
                    end;

                    if InspectorRows[j].Level = 1 then
                        break;
                end;

                CurPropertyDataRow := i;

                exit;
            end;
        end;
    end;
end;

procedure TtsGridInspector.SetButton(DataRow: Integer);
begin
    with InspectorRows[DataRow] do
    begin
        if (InspectorElementType = iePropertyElement) then
        begin
            if paValueList in PropertyElement.Editor.GetAttributes then
                CellButtonType[2, DataRow] := btCombo
            else if paDialog in PropertyElement.Editor.GetAttributes then
                CellButtonType[2, DataRow] := btNormal
        end;
        ButtonSet := True;
    end;

    inherited;
end;

procedure TtsGridInspector.SetValues(PropertyElement: TtsPropertyElement; strValue: string; Value: Variant; ValueSource: tsValueSource; FirstSet: Boolean);
var
    CurComponent: TPersistent;
    NrScanned: Integer;
    ComponentCount: double;
    Cancel: Boolean;
    ValueSet: Boolean;
    ComponentId: string;
    ScanState: tsScanObjectsState;

begin
    ChangesMade := True;

    ComponentCount := ComponentEditor.ComponentCount;

    if (ComponentCount <= 1) and FirstSet then
        exit;

    ValueSet := FirstSet;
    Cancel := False;
    NrScanned := 0;
    ScanState := soStart;
    ComponentEditor.DoScanObjects(ScanState, True, NrScanned, Cancel);

    try
        if Cancel then
            exit;

        ComponentEditor.DoGetFirstSelectedComponent(CurComponent);

        if (ValueSource = vsComponent) then
        begin
            if FirstSet then
            begin
                Value := PropertyElement.GetPropertyValue(CurComponent, True);
                ValueSource := vsValue;
            end
            else
                raise EPropertyError.Create('ValueSource cannot be vsComponent when FirstSet is False.');
        end;

        while (CurComponent <> nil) and not Cancel do
        begin
        	ComponentEditor.DoSetValues(ScanState, CurComponent, PropertyElement, strValue, Value, ValueSource, ValueSet, Cancel);
            if not Cancel then
            begin
                ScanState := soScan;
                if (PropertyElement.ShowPropertyValue <> pvShowAlways) then
                begin
                    if (ValueSource = vsstrValue) then
                    begin
                        Value := PropertyElement.ConvertDesignPropertystrValueToValue(strValue);
                        ValueSource := vsValue;
                    end;

                    ComponentEditor.DoGetComponentId(CurComponent, ComponentId);
                    if (ValueSource = vsstrValue) then
                        ComponentEditor.SetActualValue(ComponentId, PropertyElement, strValue)
                    else
                        ComponentEditor.SetActualValue(ComponentId, PropertyElement, PropertyElement.ConvertDesignPropertyValueTostrValue(Value));
                end;

                if (PropertyElement.ShowPropertyValue in ComponentEditor.ShowDesignValue) then
                begin
                    if (ValueSource = vsstrValue) then
                        PropertyElement.Editor.SetValue(strValue)
                    else
                        PropertyElement.SetPropertyValue(CurComponent, Value);
                end;

                if (ValueSource = vsstrValue) then
                begin
                    Value := PropertyElement.GetPropertyValue(CurComponent, True);
                    ValueSource := vsValue;
                end;

                ValueSet := True;
                NrScanned := NrScanned + 1;
                ComponentEditor.DoScanObjects(ScanState, True, NrScanned, Cancel);
                if not Cancel then
                    ComponentEditor.DoGetNextSelectedComponent(CurComponent);
            end;
        end;
        ComponentEditor.DoGetComponentSelection(ComponentEditor.FComponentSelection, ComponentEditor.FComponentCount);
    finally
        ComponentEditor.DoSetValues(soEnd, CurComponent, PropertyElement, strValue, Value, ValueSource, ValueSet, Cancel);
        ComponentEditor.DoScanObjects(soEnd, True, NrScanned, Cancel);
        PropertyElement.MultiValue := (not Cancel) or (PropertyElement.MultiValue and (not ValueSet));
    end;
end;

function TtsGridInspector.GetSubFullySelected(Row: integer): Boolean;
var
    CurRow: integer;
begin
    result := InspectorRows[Row].Selected;
    if not result then
        exit;

    for CurRow := Row + 1 to InspectorRowCount do
    begin
        if InspectorRows[CurRow].Level <= InspectorRows[Row].Level then
            exit;

        if not Selected(CurRow) then
        begin
            result := False;
            exit;
        end;
    end;
end;

function TtsGridInspector.Selected(Row: integer): Boolean;
begin
    while not RowVisible[Row] do
    begin
        Row := InspectorRows[Row].Parent;
        if Row = -1 then
        begin
            result := false;
            exit;
        end;
    end;

    result := InspectorRows[Row].Selected;
end;

procedure TtsGridInspector.GetMultiValue;
var
    Row: integer;
    NrofProperties: integer;
    FirstComponent, NextComponent: TPersistent;
    Cancel: Boolean;
    NrScanned: Integer;

begin
    if ComponentEditor.ComponentCount > 100 then
    begin
        for Row := 1 to Rows do
        begin
            if InspectorRows[Row].InspectorElementType = iePropertyElement then
                InspectorRows[Row].PropertyElement.MultiValue := False;
        end;

        exit;
    end;

    Cancel := False;
    NrScanned := 0;
    ComponentEditor.DoScanObjects(soStart, False, NrScanned, Cancel);

    try
        with ComponentEditor do
        begin
            NrofProperties := 0;
            for Row := 1 to Rows do
            begin
                if InspectorRows[Row].InspectorElementType = iePropertyElement then
                begin
                    InspectorRows[Row].PropertyElement.MultiValue := True;
                    NrofProperties := NrofProperties + 1;
                end;
            end;

            DoGetFirstSelectedComponent(FirstComponent);
            NextComponent:= FirstComponent;
            while (NextComponent <> nil) and not Cancel do
            begin
                NrScanned := NrScanned + 1;
                ComponentEditor.DoScanObjects(soScan, False, NrScanned, Cancel);

                DoGetNextSelectedComponent(NextComponent);

                if (NextComponent <> nil) then
                begin
                    for Row := 1 to Rows do
                    begin
                        if InspectorRows[Row].InspectorElementType = iePropertyElement then
                        begin
                            with InspectorRows[Row].PropertyElement do
                            begin
                                if MultiValue then
                                begin
                                    if not VariantEqual(GetPropertyValue(FirstComponent, True), GetPropertyValue(NextComponent, True)) then
                                    begin
                                        MultiValue := False;
                                        NrofProperties := NrofProperties - 1;
                                        if NrofProperties = 0 then exit;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;

            if Cancel then
            begin
                for Row := 1 to Rows do
                    if InspectorRows[Row].InspectorElementType = iePropertyElement then
                        InspectorRows[Row].PropertyElement.MultiValue := False;
            end;
        end;
    finally
        ComponentEditor.DoScanObjects(soEnd, False, NrScanned, Cancel);
    end;
end;

procedure TtsGridInspector.SetDisplayModeName(Value: string);
begin
    if FDisplayModeName = Value then exit;

    FDisplayModeName := Value;
    FInspectorRowCount := 0;

    if ComponentEditor <> nil then
    begin
        if CurrentDataRow = -1 then
            ComponentEditor.CurPropertyElement := nil
        else if InspectorRows[CurrentDataRow].InspectorElementType = iePropertyElement then
            ComponentEditor.CurPropertyElement := InspectorRows[CurrentDataRow].PropertyElement
        else
            ComponentEditor.CurPropertyElement := nil;

        UpdateContents(True, False);
    end;
end;

procedure TtsGridInspector.SetRowProperties;
var
    Row: integer;
    OldEditMode: TtsEditMode;
    CurPropertyDataRow: integer;

begin
    ResetCellProperties([prButtonType]);

    Rows := 0;
    ResetRowProperties([prVisible]);
    Rows := InspectorRowCount;

    OpenCurPropertyElement(CurPropertyDataRow);

    OldEditMode := EditMode;
    EditMode := emNone;

    EnablePaint := False;
    try
        for Row := 1 to Rows do
        begin
            with InspectorRows[Row] do
            begin
                if InspectorElementType = ieGroupElement then
                    if (GroupElement.Name = 'INVISIBLE PROPERTIES') or (GroupElement.Name = 'EMPTY GROUP') then
                        RowVisible[Row] := False;

                if Parent = -1 then
                    SetButton(Row)
                else if InspectorRows[Parent].Opened then
                    SetButton(Row)
                else
                begin
                    RowVisible[Row] := False;
                    ButtonSet := False;
                end;
            end;
        end;

        if Rows > 0 then
        begin
            if CurPropertyDataRow <> -1 then
                CurrentDataRow := CurPropertyDataRow
            else
                CurrentDataRow := 1;

            PutCellInView(2, CurrentDataRow);
        end;
    finally
        EnablePaint := True;
        EditMode := OldEditMode;
    end;
end;

function TtsGridInspector.GetPropertyDisplayValue(PropertyElement: TtsPropertyElement): string;
var
    ComponentId: string;
    ActualValueElement: TtsActualValueElement;

begin
    result := '';
    with PropertyElement do
    begin
        if ComponentEditor.ComponentSelected then
        begin
            if (not ComponentEditor.MultipleComponentSelected) or MultiValue then
            begin
                if (ShowPropertyValue <> pvShowAlways) then
                begin
                    ComponentEditor.DoGetComponentId(ComponentEditor.Component, ComponentId);
                    ActualValueElement := ComponentEditor.ActualValueSet.GetItem([ComponentId, PropertyElement.Name]);
                    if ActualValueElement = nil then
                        result := Editor.GetValue
                    else
                        result := ActualValueElement.FActualstrValue;
                end
                else
                    result := Editor.GetValue;
            end;
        end;
    end;
end;

procedure TtsGridInspector.GetPropertyValues(const Value: string);
begin
    PropertyValueList.Add(Value);
end;

procedure TtsGridInspector.SetComponentEditor(Value: TtsComponentEditor);
begin
    if FComponentEditor = Value then exit;

    if Value = nil then
    begin
        ShowMessage('Grid ComponentEditor cannot be nil');
        exit;
    end;

    if FComponentEditor <> nil then
    begin
        if CurrentDataRow = -1 then
            ComponentEditor.CurPropertyElement := nil
        else if InspectorRows[CurrentDataRow].InspectorElementType = iePropertyElement then
            ComponentEditor.CurPropertyElement := InspectorRows[CurrentDataRow].PropertyElement
        else
            ComponentEditor.CurPropertyElement := nil;
    end;

    FComponentEditor := Value;

    UpdateContents(True, True);
end;

procedure TtsGridInspector.UpdateContents(PropertiesChanged, SelectedComponentsChanged: Boolean );
var
    CurVertScrollBarVisible: Boolean;

begin
    if SelectedComponentsChanged then
        ComponentEditor.DoGetComponentSelection(ComponentEditor.FComponentSelection, ComponentEditor.FComponentCount);

    ComponentEditor.GetComponents;

    if (CurrentComponentEditor <> FComponentEditor) or (FInspectorRowCount = 0) or not ComponentEditor.ComponentSelected then
        PropertiesChanged := True;

    SetInspectorRows;

    if PropertiesChanged then
    begin
        EnablePaint := False;
        try
            CurVertScrollBarVisible := VertScrollBarVisible;

            SetRowProperties;

            if CurVertScrollBarVisible <> VertScrollBarVisible then
            begin
                if CurVertScrollBarVisible then
                    Col[2].Width := VertScrollBarWidth + ClientWidth - Col[1].Width - RowBarWidth + 1
                else
                    Col[2].Width := - VertScrollBarWidth + ClientWidth - Col[1].Width - RowBarWidth + 1;
            end;

            if ComponentEditor.ComponentSelected then
            begin
                EditMode := emEdit;
                InactiveButtonState := ibsBackGround;
            end
            else
            begin
                EditMode := emNone;
                InactiveButtonState := ibsNone;
            end;

            if ComponentEditor.MultipleComponentSelected then
                GetMultiValue;
        finally
            EnablePaint := True;
        end;
    end
    else
    begin
        if ComponentEditor.MultipleComponentSelected then
            GetMultiValue;

        ColInvalidate(2);
    end;
end;

function TtsGridInspector.GetInspectorRowCount: integer;
begin
    if (InspectorRows = nil) then
        result := 0
    else
        result := FInspectorRowCount;
end;

procedure TtsGridInspector.SetInspectorRowCount(NewValue: integer);
begin
    if NewValue >= FCurMaxInspectorRowCount then
    begin
        FCurMaxInspectorRowCount := FCurMaxInspectorRowCount + 100;
        ReallocMem(FInspectorRows, FCurMaxInspectorRowCount * SizeOf(TtsInspectorRow));
        ZeroMemory(@(FInspectorRows[FCurMaxInspectorRowCount - 100]), (100 * SizeOf(TtsInspectorRow)));
    end;

    FInspectorRowCount := NewValue;
end;


procedure TtsGridInspector.PlaceGroupSetInInspectorList(Node : TtsSetNode; Parent: integer);
begin
    if Node <> nil then
    begin
        PlaceGroupSetInInspectorList(Node.Left, Parent);

        PlaceGroupElementInInspectorList(TtsGroupElement(Node.Value), Parent);

        PlaceGroupSetInInspectorList(Node.Right, Parent);
    end;
end;

procedure TtsGridInspector.PlacePropertiesInInspectorList(Node : TtsSetNode; Parent : integer; SubProperties: Boolean);
var
    InspectorRowIndex: Integer;
begin
    if Node <> nil then
    begin
        PlacePropertiesInInspectorList(Node.Left, Parent, SubProperties);

        InspectorRowCount := FInspectorRowCount + 1;
        InspectorRowIndex := FInspectorRowCount;
        if Parent = -1 then
            FInspectorRows[InspectorRowIndex].Level := 1
        else
            FInspectorRows[InspectorRowIndex].Level := FInspectorRows[Parent].Level + 1;
        FInspectorRows[InspectorRowIndex].Parent := Parent;
        FInspectorRows[InspectorRowIndex].Opened := False;
        FInspectorRows[InspectorRowIndex].Deleted := False;
        FInspectorRows[InspectorRowIndex].Selected := False;
        FInspectorRows[InspectorRowIndex].SelectedChanged := SelectedLastChanged;
        FInspectorRows[InspectorRowIndex].InspectorElementType := iePropertyElement;
        if SubProperties then
            FInspectorRows[InspectorRowIndex].PropertyElement := TtsPropertyElement(Node.Value)
        else
            FInspectorRows[InspectorRowIndex].PropertyElement := TtsPropertyPointerElement(Node.Value).FElement;
        FInspectorRows[InspectorRowIndex].GroupElement := nil;

        FInspectorRows[InspectorRowIndex].PropertyElement.Mark := False;

        if FInspectorRows[InspectorRowIndex].PropertyElement.SubProperties <> nil then
            PlacePropertiesInInspectorList(FInspectorRows[InspectorRowIndex].PropertyElement.SubProperties.FTopNode, InspectorRowIndex, True);

        PlacePropertiesInInspectorList(Node.Right, Parent, SubProperties);
    end;
end;

procedure TtsGridInspector.PlaceGroupElementInInspectorList(Group: TtsGroupElement; Parent: integer);
var
    InspectorRowIndex: Integer;
begin
    InspectorRowCount := FInspectorRowCount + 1;
    InspectorRowIndex := FInspectorRowCount;

    if Parent = -1 then
        FInspectorRows[InspectorRowIndex].Level := 1
    else
        FInspectorRows[InspectorRowIndex].Level := FInspectorRows[Parent].Level + 1;
    FInspectorRows[InspectorRowIndex].Parent := Parent;
    FInspectorRows[InspectorRowIndex].Opened := Group.FOpened;
    FInspectorRows[InspectorRowIndex].Deleted := False;
    FInspectorRows[InspectorRowIndex].Selected := False;
    FInspectorRows[InspectorRowIndex].SelectedChanged := SelectedLastChanged;
    FInspectorRows[InspectorRowIndex].InspectorElementType := ieGroupElement;
    FInspectorRows[InspectorRowIndex].GroupElement := Group;
    FInspectorRows[InspectorRowIndex].PropertyElement := nil;

    PlacePropertiesInInspectorList(Group.FPropertySet.FTopNode, InspectorRowIndex, False);

    PlaceGroupSetInInspectorList(Group.FSubGroups.FTopNode, InspectorRowIndex);
end;

procedure TtsGridInspector.PlaceMarkedPropertiesInInspectorList(Node : TtsSetNode; Parent: integer);
var
    InspectorRowIndex: Integer;
begin
    if Node <> nil then
    begin
        PlaceMarkedPropertiesInInspectorList(Node.Left, Parent);

        if TtsPropertyElement(Node.Value).Mark then
        begin
            InspectorRowCount := FInspectorRowCount + 1;
            InspectorRowIndex := FInspectorRowCount;

            if Parent = -1 then
                FInspectorRows[InspectorRowIndex].Level := 1
            else
                FInspectorRows[InspectorRowIndex].Level := FInspectorRows[Parent].Level + 1;

            FInspectorRows[InspectorRowIndex].Parent := Parent;
            FInspectorRows[InspectorRowIndex].Opened := False;
            FInspectorRows[InspectorRowIndex].Deleted := False;
            FInspectorRows[InspectorRowIndex].Selected := False;
            FInspectorRows[InspectorRowIndex].SelectedChanged := SelectedLastChanged;
            FInspectorRows[InspectorRowIndex].InspectorElementType := iePropertyElement;
            FInspectorRows[InspectorRowIndex].PropertyElement := TtsPropertyElement(Node.Value);
            FInspectorRows[InspectorRowIndex].GroupElement := nil;

            if FInspectorRows[InspectorRowIndex].PropertyElement.SubProperties <> nil then
                PlacePropertiesInInspectorList(FInspectorRows[InspectorRowIndex].PropertyElement.SubProperties.FTopNode, InspectorRowIndex, True);
        end;

        PlaceMarkedPropertiesInInspectorList(Node.Right, Parent);
    end;
end;

function TtsGridInspector.GetInspectorRows: PtsInspectorRows;
begin
    if (FInspectorRows = nil) then
        SetInspectorRows;

    result := FInspectorRows;
end;

procedure TtsGridInspector.SetInspectorRows;
var
    DisplayModeGroup: TtsGroupElement;

begin
    if ComponentEditor.Component = nil then
    begin
        FInspectorRowCount := 0;
        exit;
    end;

    if (CurrentComponentEditor = FComponentEditor) and (FInspectorRowCount <> 0) then
        exit;

    CurrentComponentEditor := ComponentEditor;

    FInspectorRowCount := 0;
    DisplayModeGroup := ComponentEditor.DisplayModes.GetItem([DisplayModeName]);
    if DisplayModeGroup = nil then
    begin
        DisplayModeGroup := ComponentEditor.AddDisplayMode(DisplayModeName);
        ComponentEditor.DoGetComponentInfo(DisplayModeGroup);
    end;

    ComponentEditor.PropertySet.MarkAll(ComponentEditor.PropertySet.FTopNode);

    PlacePropertiesInInspectorList(DisplayModeGroup.FPropertySet.FTopNode, -1, False);
    PlaceGroupSetInInspectorList(DisplayModeGroup.FSubGroups.FTopNode, -1);

    PlaceMarkedPropertiesInInspectorList(ComponentEditor.PropertySet.FTopNode, -1);

    RemoveEmptyGroups;
end;

procedure TtsGridInspector.GetDisplayName(InspectorRow: TtsInspectorRow; var DisplayName, IndentValue: string);
var
    i: integer;
    NrofSpaces: integer;
    PossibleOpenClose: Boolean;

begin
    with InspectorRow do
    begin
        if (InspectorElementType = ieGroupElement) then
        begin
            PossibleOpenClose := True;
            DisplayName := GroupElement.FName;
        end
        else
        begin
            DisplayName := PropertyElement.Name;

            if (PropertyElement.SubProperties <> nil) then
                PossibleOpenClose := True
            else
                PossibleOpenClose := False;
        end;

        IndentValue := '';
        NrofSpaces := 5 * (Level - 1);
        for i:= 1 to NrofSpaces do
            IndentValue := IndentValue + ' ';

        if (not PossibleOpenClose) then
            IndentValue := IndentValue + '  '
        else if Opened then
            IndentValue := IndentValue + '- '
        else
            IndentValue := IndentValue + '+';
    end;

    DisplayName := TrimLeft(DisplayName);
end;

procedure TtsGridInspector.RemoveEmptyGroups;
var
    CurRow: integer;
begin
    for CurRow := 1 to InspectorRowCount do
    begin
        if (InspectorRows[CurRow].InspectorElementType = ieGroupElement) and (InspectorRows[CurRow].Level = 1) then
            IsEmptyGroup(CurRow);
    end;
end;

function TtsGridInspector.IsEmptyGroup(GroupRow: integer): Boolean;
var
    CurRow: integer;
begin
    result := True;
    CurRow := GroupRow + 1;
    while CurRow <= InspectorRowCount do
    begin
        if InspectorRows[CurRow].Level <= InspectorRows[GroupRow].Level then
            break;

        if InspectorRows[CurRow].InspectorElementType = iePropertyElement then
            result := False
        else if not IsEmptyGroup(CurRow) then
            result := False;

        CurRow := CurRow + 1;
    end;

    if result then
        InspectorRows[GroupRow].GroupElement.Name := 'EMPTY GROUP';
end;

{End TtsGridInspector}

end.



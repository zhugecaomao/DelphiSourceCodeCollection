{
   功能：将数据集的数据导入Excel;
   作者：comerose (核心代码来自Ehlib)
   时间：2006-06-25
}                  

unit FlatExcel;

{$I FlatStyle.inc}

interface

uses
 Controls, Forms, SysUtils, DB, DBCtrls, DBGrids, Classes, DBConsts,
 Grids, FlatExcfm, FlatUtils, Dialogs;

type
  //导出数据选项,
  //dmDefault为导出的数据默认为字段类型的数据,
  //dmString为导出的所有数据全部转换为字符类型
  TEduceType = (dmDefault,dmString);
  TEduceData = class;
  TEduceDatas = class;
  TEduceLink = class;
  { TDefineExcel }
  TDefineExcel  = Class(TVersionComponent)
  Private
    fCol        : word;
    fRow        : word;
    ExcelStream : TStream;
    FEduceType  : TEduceType;
    FColumns    : TEduceDatas;
    FUpdateLock : Byte;
    FLayoutLock : Byte;
    FDataLink   : TEduceLink;
    FLayoutSet  : Boolean;
    FEduceTitle : Boolean;
    FExcelForm  : TExcelForm;
    FInterval   : integer;
    FShowProgress: boolean;
    function  GetFieldCount: Integer;
    function  GetDataSource: TDataSource;
    function  GetColumnCount: integer;
    function  GetEduceCount: integer;
    procedure SeTEduceType(const Value: TEduceType);
    procedure EndProgress;
    procedure StartProgress(Max: Integer);
    procedure SetColumns(const Value: TEduceDatas);
    procedure SetDataSource(const Value: TDataSource);
    procedure DefineFieldMap;
    function  GetFields(FieldIndex: Integer): TField;
  protected
    // 以下是导出到 MS-Excel 操作过程
    procedure WriteData(Field: TField);
    procedure WriteTitle;
    procedure WriteBlankCell;
    procedure WriteFloatCell(const AValue: Double);
    procedure WriteIntegerCell(const AValue: Integer);
    procedure WriteStringCell(const AValue: string);
    procedure WritePrefix;
    procedure WriteSuffix;
    procedure WriteDataCells;
    procedure SaveExcel(Save: TStream);
    // 结束 MS-Excel 操作过程
    procedure BeginLayout;
    procedure EndLayout;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure LayoutChanged; virtual;
    procedure LinkActive(Value: Boolean); virtual;
    procedure CancelLayout;
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadColumns(Reader: TReader);
    procedure WriteColumns(Writer: TWriter);
    procedure Loaded; override;
    procedure InitColumns;
    procedure IncColRow;
    function  CreateDataLink: TEduceLink; dynamic;
    function  CreateColumns: TEduceDatas;
    function  AcquireLayoutLock: Boolean;
    property  UpdateLock: Byte read FUpdateLock;
    property  LayoutLock: Byte read FLayoutLock;
    property  DataLink: TEduceLink read FDataLink;
    property  LayoutSet: Boolean read FLayoutSet write FLayoutSet;
    property  EduceType: TEduceType read FEduceType write SeTEduceType default dmDefault;
    property  EduceDatas: TEduceDatas read FColumns write SetColumns;
    property  DataSource: TDataSource read GetDataSource write SetDataSource;
    property  EduceTitle: Boolean read FEduceTitle write FEduceTitle default true;
    property  ExcelForm: TExcelForm read FExcelForm;
    property  Interval: integer read FInterval write FInterval default 500;
    property  ShowProgress: boolean read FShowProgress write FShowProgress default true;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ExportAll;
    procedure ExecuteSave;

    procedure InitFields;
    procedure RestoreFields;
    procedure ClearFields;
    property  Fields[FieldIndex: Integer]: TField read GetFields;
    property  FieldCount: Integer read GetFieldCount;
    property  ColumnCount: integer read GetColumnCount;
    property  EduceCount: integer read GetEduceCount;
  end;
  { FlatExcel }
  TFlatExcel  = Class(TDefineExcel)
  published
    property  EduceType;
    property  EduceDatas stored False;
    property  DataSource;
    property  EduceTitle;
    property  Interval;
    property  ShowProgress;
  end;
  { TEduceLink }
  TEduceLink = class(TDataLink)
  private
    FCells: TDefineExcel;
    FFieldCount: Integer;
    FFieldMap: array of Integer;
    FModified: Boolean;
    FSparseMap: Boolean;
    function GetDefaultFields: Boolean;
    function GetFields(I: Integer): TField;
  protected
    procedure ActiveChanged; override;
    procedure LayoutChanged; override;
    function  GetMappedIndex(ColIndex: Integer): Integer;
    function  IsAggRow(Value: Integer): Boolean; virtual;
  public
    constructor Create(ADSExcel: TDefineExcel);
    destructor Destroy; override;
    procedure ClearMapping;
    function AddMapping(const FieldName: string): Boolean;
    property DefaultFields: Boolean read GetDefaultFields;
    property FieldCount: Integer read FFieldCount;
    property Fields[I: Integer]: TField read GetFields;
    property SparseMap: Boolean read FSparseMap write FSparseMap;
    property Cells: TDefineExcel read FCells;
  end;
  { TEduceData }
  TEduceData = class(TCollectionItem)
  private
    FFieldName: string;
    FVisible: Boolean;
    FStored: Boolean;
    FCaption: String;
    FField: TField;
    procedure SetCaption(const Value: String);
    procedure SetField(Value: TField);
    function  GetField: TField;
    procedure SetFieldName(const Value: String);
    procedure SetVisible(const Value: Boolean);
  protected
    function  GetExcel: TDefineExcel;
    function  GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property  Cells: TDefineExcel read GetExcel;
    property  Field: TField read GetField write SetField;
    property  IsStored: Boolean read FStored write FStored default false;
  published
    property  Caption: string read fCaption write SetCaption;
    property  FieldName: String read fFieldName write SetFieldName;
    property  Visible: Boolean read FVisible write SetVisible;
  end;
  TEduceDataClass = class of TEduceData;
  TEduceDatasState = (csDefault, csCustomized);
  { TEduceDatas }
  TEduceDatas = class(TCollection)
  private
    FCells: TDefineExcel;
    function  GetColumn(Index: Integer): TEduceData;
    function  GetState: TEduceDatasState;
    procedure SetColumn(Index: Integer; Value: TEduceData);
    procedure SetState(NewState: TEduceDatasState);
  protected
    function  GetOwner: TPersistent; override;
    function  InternalAdd: TEduceData;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(DSExcel: TDefineExcel; ColumnClass: TEduceDataClass);
    procedure LoadFromFile(const Filename: string);
    procedure LoadFromStream(S: TStream);
    procedure RebuildColumns;
    procedure SaveToFile(const Filename: string);
    procedure SaveToStream(S: TStream);
    function  Add: TEduceData;
    property  State: TEduceDatasState read GetState write SetState;
    property  Cells: TDefineExcel read FCells;
    property  Items[Index: Integer]: TEduceData read GetColumn write SetColumn; default;
  end;

implementation

uses FlatExcpt;

{ Error reporting }

procedure RaiseGridError(const S: string);
begin
  raise EInvalidGridOperation.Create(S);
end;

{ TEduceData }

constructor TEduceData.Create(Collection: TCollection);
var
  Excel: TDefineExcel;
begin
  Excel := nil;
  if Assigned(Collection) and (Collection is TEduceDatas) then
     Excel := TEduceDatas(Collection).Cells;
  if Assigned(Excel) then Excel.BeginLayout;
  try
   inherited Create(Collection);
   FVisible  := True;
   FStored   := True;
  finally
   if Assigned(Excel) then Excel.EndLayout;
  end;
end;

destructor TEduceData.Destroy;
begin
  inherited Destroy;
end;

procedure TEduceData.Assign(Source: TPersistent);
begin
  if Source is TEduceData then
  begin
    if Assigned(Collection) then Collection.BeginUpdate;
    try
      FieldName := TEduceData(Source).FieldName;
      FCaption  := TEduceData(Source).Caption;
      FVisible  := TEduceData(Source).Visible;
      Changed(false);
    finally
      if Assigned(Collection) then Collection.EndUpdate;
    end;
  end else inherited Assign(Source);
end;

function TEduceData.GetExcel: TDefineExcel;
begin
  if Assigned(Collection) and (Collection is TEduceDatas) then
     Result := TEduceDatas(Collection).Cells
  else
     Result := nil;
end;

function TEduceData.GetDisplayName: string;
begin
  Result := FCaption;
  if Result = '' then
     Result := inherited GetDisplayName;
end;

procedure TEduceData.SetCaption(const Value: String);
begin
  if (Value <> FCaption) then
  begin
     FCaption := Value;
     Changed(false);
  end;
end;  

procedure TEduceData.SetField(Value: TField);
begin
  if FField = Value then Exit;
  if Assigned(FField) and (GetExcel <> nil) then
     FField.RemoveFreeNotification(GetExcel);
  if Assigned(Value) and (csDestroying in Value.ComponentState) then
     Value := nil;
  FField := Value;
  if Assigned(Value) then
  begin
    if GetExcel <> nil then
       FField.FreeNotification(GetExcel);
    FFieldName := Value.FullName;
    if (Length(FCaption)=0) and (Length(FieldName) > 0) then
    begin
       if Value.DisplayLabel = '' then
          FCaption := Value.FullName
       else
          FCaption := Value.DisplayLabel;
    end;
  end;
  if not IsStored then
  begin
    if Value = nil then
       FFieldName := '';
  end;
  Changed(False);
end;

function TEduceData.GetField: TField;
var
  Cell: TDefineExcel;
begin
  Cell := GetExcel;
  if (FField = nil) and (Length(FFieldName) > 0) and Assigned(Cell) and
      Assigned(Cell.DataLink.DataSet) then
  begin
  with Cell.Datalink.Dataset do
    if Active or (not DefaultFields) then
       SetField(FindField(FieldName));
  end;
  Result := FField;
end;

procedure TEduceData.SetFieldName(const Value: String);
var
  AField: TField;
  Cells: TDefineExcel;
begin
  AField := nil;
  Cells := GetExcel;
  if Assigned(Cells) and Assigned(Cells.DataLink.DataSet) and
    not (csLoading in Cells.ComponentState) and (Length(Value) > 0) then
      AField := Cells.DataLink.DataSet.FindField(Value); { no exceptions }
  FFieldName := Value;
  SetField(AField);
  Changed(False);
end;

procedure TEduceData.SetVisible(const Value: Boolean);
begin
  if Value <> FVisible then
  begin
     FVisible := Value;
     Changed(false);
  end;
end;

{ TEduceDatas }

constructor TEduceDatas.Create(DSExcel: TDefineExcel; ColumnClass: TEduceDataClass);
begin
  inherited Create(ColumnClass);
  FCells := DSExcel;
end;

function TEduceDatas.Add: TEduceData;
begin
  Result := TEduceData(inherited Add);
end;

function TEduceDatas.GetColumn(Index: Integer): TEduceData;
begin
  Result := TEduceData(inherited Items[Index]);
end;

function TEduceDatas.GetOwner: TPersistent;
begin
  Result := FCells;
end;

procedure TEduceDatas.LoadFromFile(const Filename: string);
var
  S: TFileStream;
begin
  S := TFileStream.Create(Filename, fmOpenRead);
  try
    LoadFromStream(S);
  finally
    S.Free;
  end;
end;

{ TEduceWrapper }
type
  TEduceWrapper = class(TComponent)
  private
    FColumns: TEduceDatas;
  published
    property Columns: TEduceDatas read FColumns write FColumns;
  end;

procedure TEduceDatas.LoadFromStream(S: TStream);
var
  Wrapper: TEduceWrapper;
begin
  Wrapper := TEduceWrapper.Create(nil);
  try
    Wrapper.Columns := FCells.CreateColumns;
    S.ReadComponent(Wrapper);
    Assign(Wrapper.Columns);
  finally
    Wrapper.Columns.Free;
    Wrapper.Free;
  end;
end;

procedure TEduceDatas.RebuildColumns;

  procedure AddFields(Fields: TFields; Depth: Integer);
  var
    I: Integer;
  begin
    Inc(Depth);
    for I := 0 to Fields.Count-1 do
    begin
      Add.FieldName := Fields[I].FullName;
      if Fields[I].DataType in [ftADT, ftArray] then
         AddFields((Fields[I] as TObjectField).Fields, Depth);
    end;
  end;

begin
  if Assigned(FCells) and Assigned(FCells.DataSource) and
     Assigned(FCells.Datasource.DataSet) then
  begin
    FCells.BeginLayout;
    try
      Clear;
      AddFields(FCells.DataSource.DataSet.Fields, 0);
    finally
      FCells.EndLayout;
    end
  end
  else
    Clear;
end;

procedure TEduceDatas.SaveToFile(const Filename: string);
var
  S: TStream;
begin
  S := TFileStream.Create(Filename, fmCreate);
  try
    SaveToStream(S);
  finally
    S.Free;
  end;
end;

procedure TEduceDatas.SaveToStream(S: TStream);
var
  Wrapper: TEduceWrapper;
begin
  Wrapper := TEduceWrapper.Create(nil);
  try
    Wrapper.Columns := Self;
    S.WriteComponent(Wrapper);
  finally
    Wrapper.Free;
  end;
end;

procedure TEduceDatas.SetColumn(Index: Integer; Value: TEduceData);
begin
  Items[Index].Assign(Value);
end;

procedure TEduceDatas.SetState(NewState: TEduceDatasState);
begin
  if NewState = State then Exit;
  if NewState = csDefault then
     Clear
  else
     RebuildColumns;
end;

function TEduceDatas.InternalAdd: TEduceData;
begin
  Result := Add;
  Result.FStored := False;
end;

function TEduceDatas.GetState: TEduceDatasState;
begin
  Result := TEduceDatasState((Count > 0) and Items[0].IsStored);
end;

procedure TEduceDatas.Update(Item: TCollectionItem);
begin
  if (FCells = nil) or (csLoading in FCells.ComponentState) then Exit;
  if Item = nil then
  begin
    FCells.LayoutChanged;
  end;
end;

{ TDefineExcel }

var
  ExcelBof    : array[0..5] of Word = ($809,  8, 0, $10,   0, 0);
  ExcelEof    : array[0..1] of Word = ($0A,  00);
  ExcelLabel  : array[0..5] of Word = ($204,  0, 0,   0,   0, 0);
  ExcelNum    : array[0..4] of Word = ($203, 14, 0,   0,   0);
  ExcelRec    : array[0..4] of Word = ($27E, 10, 0,   0,   0);
  ExcelBlank  : array[0..4] of Word = ($201,  6, 0,   0, $17);

Constructor TDefineExcel.Create(AOwner: TComponent);
begin
 inherited Create(AOwner);
 FColumns      := CreateColumns;
 FDatalink     := CreateDatalink;
 FEduceType    := dmDefault;
 FEduceTitle   := true;
 FInterval     := 500;
 FShowProgress := true;
end;

destructor TDefineExcel.Destroy;
begin
  FColumns.Free;
  FColumns := nil;
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

function TDefineExcel.CreateColumns: TEduceDatas;
begin
  Result := TEduceDatas.Create(Self, TEduceData);
end;

procedure TDefineExcel.IncColRow;
begin
 if fCol = EduceCount - 1 then
 begin
    Inc(fRow);
    fCol :=0;
 end else
    Inc(fCol);
end;
//写空单元
procedure TDefineExcel.WriteBlankCell;
begin
 ExcelBlank[2] := fRow;
 ExcelBlank[3] := fCol;
 ExcelStream.WriteBuffer(ExcelBlank, SizeOf(ExcelBlank));
 IncColRow;
end;
//写浮点单元
procedure TDefineExcel.WriteFloatCell(const AValue: Double);
begin
 ExcelNum[2] := fRow;
 ExcelNum[3] := fCol;
 ExcelStream.WriteBuffer(ExcelNum, SizeOf(ExcelNum));
 ExcelStream.WriteBuffer(AValue, 8);
 IncColRow;
end;
//写整数单元
procedure TDefineExcel.WriteIntegerCell(const AValue: Integer);
var V: Integer;
begin
 ExcelRec[2] := fRow;
 ExcelRec[3] := fCol;
 ExcelStream.WriteBuffer(ExcelRec, SizeOf(ExcelRec));
 V := (AValue shl 2) or 2;
 ExcelStream.WriteBuffer(V, 4);
 IncColRow;
end;
//写字符单元
procedure TDefineExcel.WriteStringCell(const AValue: string);
var
 L: Word;
begin
 L := Length(AValue);
 ExcelLabel[1] := 8 + L;
 ExcelLabel[2] := fRow;
 ExcelLabel[3] := fCol;
 ExcelLabel[5] := L;
 ExcelStream.WriteBuffer(ExcelLabel, SizeOf(ExcelLabel));
 ExcelStream.WriteBuffer(Pointer(AValue)^, L);
 IncColRow;
end;
//写前缀
procedure TDefineExcel.WritePrefix;
begin
 ExcelStream.WriteBuffer(ExcelBof, SizeOf(ExcelBof));
end;
//写后缀
procedure TDefineExcel.WriteSuffix;
begin
 ExcelStream.WriteBuffer(ExcelEof, SizeOf(ExcelEof));
end;
//写标题
procedure TDefineExcel.WriteTitle;
var n: word;
begin
if FEduceTitle then
begin
 for n:= 0 to FColumns.Count - 1 do
 begin
   if FColumns[n].Visible then WriteStringCell(FColumns[n].Caption);
 end;
end;
end;

procedure TDefineExcel.StartProgress(Max:Integer);
begin
 if (not Assigned(FExcelForm))and(FShowProgress) then
    Application.CreateForm(TExcelForm, FExcelForm);
 if Assigned(FExcelForm) then
 begin
  with FExcelForm do
  begin
    ProGauge.Max     :=Max;
    ProGauge.Min     :=0;
    ProGauge.Progress:=0;
    Show;
    BringToFront;
  end;
 end;
end;

procedure TDefineExcel.EndProgress;
begin
 if Assigned(FExcelForm) then
 begin
  with FExcelForm do
  begin
    ProGauge.Progress := ProGauge.Progress+1;
    if ProGauge.Progress >= ProGauge.Max then
    begin
       Sleep(FInterval);
       Close;
    end;
  end;
  Application.ProcessMessages;
 end;
end;

procedure TDefineExcel.WriteData(Field:TField);
begin
   if Field.IsNull then
      WriteBlankCell
   else
   case FEduceType of
       dmDefault:
             case Field.DataType of
               ftSmallint,
               ftInteger,
               ftWord,
               ftAutoInc,
               ftBytes: WriteIntegerCell(Field.AsInteger);
               ftFloat,
               ftCurrency,
               ftBCD: WriteFloatCell(Field.AsFloat);
             else
               WriteStringCell(Field.AsString);
             end;
       dmString:WriteStringCell(Field.AsString);
   end;
end;
//正式写入Excel表的数据
procedure TDefineExcel.WriteDataCells;
var n: word;
    fBookMark : TBookmark;
begin
 //写入 Excel 文件开始格式
 WritePrefix;
 //写入标题名称
 WriteTitle;
 //开始写入各字段数据
 with FDataLink.DataSet do
 begin
  //禁止在数据感知控件中显示
  DisableControls;
  //初始化处理进度
  StartProgress(RecordCount);
  //记录当记录的位置
  fBookMark := GetBookmark;
  //指向第一条记录
  First;
  while not Eof do begin
   for n := 0 to ColumnCount - 1 do
   begin
    if FColumns[n].Visible then
       WriteData(FColumns[n].Field);
   end;
   EndProgress;
   Next;
  end;
  //还原处理前的记录位置
  GotoBookmark(fBookMark);
  //充许在数据感知控件中显示
  EnableControls;
 end;
 //写入 Excel 文件结束标识
 WriteSuffix;
end;

procedure TDefineExcel.SaveExcel(Save: TStream);
begin
  fCol    := 0;
  fRow    := 0;
  ExcelStream := Save;
  WriteDataCells;
end;

procedure TDefineExcel.DefineFieldMap;
var
  I: Integer;
begin
  if FColumns.State = csCustomized then
  begin
    FDataLink.SparseMap := True;
    for I := 0 to FColumns.Count-1 do
      FDataLink.AddMapping(FColumns[I].FieldName);
  end
  else
  begin
    FDataLink.SparseMap := False;
    with FDataLink.Dataset do
      for I := 0 to FieldList.Count - 1 do
        with FieldList[I] do if Visible then FDataLink.AddMapping(FullName);
  end;
end;

procedure TDefineExcel.InitColumns;

  function FieldIsMapped(F: TField): Boolean;
  var
    X: Integer;
  begin
    Result := False;
    if F = nil then Exit;
    for X := 0 to FDataLink.FieldCount-1 do
      if FDataLink.Fields[X] = F then
      begin
        Result := True;
        Exit;
      end;
  end;

  procedure CheckForPassthroughs;  // check for Columns.State flip-flop
  var
    SeenPassthrough: Boolean;
    I, J: Integer;
    Column: TEduceData;
  begin
    SeenPassthrough := False;
    for I := 0 to FColumns.Count-1 do
      if not FColumns[I].IsStored then
        SeenPassthrough := True
      else if SeenPassthrough then
      begin
        for J := FColumns.Count-1 downto 0 do
        begin
          Column := FColumns[J];
          if not Column.IsStored then
            Column.Free;
        end;
        Exit;
      end;
  end;

  procedure ResetColumnFieldBindings;
  var
    I, J, K: Integer;
    Fld: TField;
    Column: TEduceData;
  begin
    if FColumns.State = csDefault then
    begin
      if (not FDataLink.Active) and (FDataLink.DefaultFields) then
          FColumns.Clear
      else
      begin
        for J := FColumns.Count-1 downto 0 do
        begin
          with FColumns[J] do
          begin
           if not Assigned(Field) or not FieldIsMapped(Field) then
              Free;
          end;
        end;
      end;
      I := FDataLink.FieldCount;
      //if (I = 0) and (FColumns.Count = 0) then
      //    Inc(I);
      for J := 0 to I-1 do
      begin
        Fld := FDataLink.Fields[J];
        if Assigned(Fld) then
        begin
          K := J;
          while (K < FColumns.Count) and (FColumns[K].Field <> Fld) do
            Inc(K);
          if K < FColumns.Count then
             Column := FColumns[K]
          else
          begin
             Column := FColumns.InternalAdd;
             Column.Field := Fld;
          end;
        end
        else
          Column := FColumns.InternalAdd;
        Column.Index := J;
      end;
    end
    else
    begin
      for I := 0 to FColumns.Count-1 do
          FColumns[I].Field := nil;
    end;
  end;
begin
  if ([csLoading, csDestroying] * ComponentState) <> [] then
     Exit;
  CheckForPassthroughs;
  FDatalink.ClearMapping;
  if FDatalink.Active then
     DefineFieldMap;
  ResetColumnFieldBindings;
end;

procedure TDefineExcel.SeTEduceType(const Value: TEduceType);
begin
 if FEduceType <> Value then
    FEduceType := Value;
end;

procedure TDefineExcel.SetColumns(const Value: TEduceDatas);
begin
  FColumns.Assign(Value);
end;

procedure TDefineExcel.DefineProperties(Filer: TFiler);
var
  StoreIt: Boolean;
  vState: TEduceDatasState;
begin
  vState := EduceDatas.State;
  if Filer.Ancestor = nil then
    StoreIt := vState = csCustomized
  else
    if vState <> TDefineExcel(Filer.Ancestor).EduceDatas.State then
      StoreIt := True
    else
      StoreIt := (vState = csCustomized) and
        (not CollectionsEqual(EduceDatas, TDefineExcel(Filer.Ancestor).EduceDatas, Self, TDefineExcel(Filer.Ancestor)));

  Filer.DefineProperty('Columns', ReadColumns, WriteColumns, StoreIt);
  inherited DefineProperties(Filer);
end;

procedure TDefineExcel.ReadColumns(Reader: TReader);
begin
  EduceDatas.Clear;
  Reader.ReadValue;
  Reader.ReadCollection(EduceDatas);
end;

procedure TDefineExcel.WriteColumns(Writer: TWriter);
begin
  if EduceDatas.State = csCustomized then
     Writer.WriteCollection(EduceDatas)
  else  // ancestor state is customized, ours is not
     Writer.WriteCollection(nil);
end;

function TDefineExcel.GetFieldCount: Integer;
begin
  if Assigned(FDataLink.DataSet) then
     result := FDataLink.FieldCount
  else
     result := 0;
end;

procedure TDefineExcel.BeginLayout;
begin
  BeginUpdate;
  if FLayoutLock = 0 then
     EduceDatas.BeginUpdate;
  Inc(FLayoutLock);
end;

procedure TDefineExcel.BeginUpdate;
begin
  Inc(FUpdateLock);
end;

procedure TDefineExcel.EndLayout;
begin
  if FLayoutLock > 0 then
  begin
    try
      try
        if FLayoutLock = 1 then
           InitColumns;
      finally
        if FLayoutLock = 1 then
           FColumns.EndUpdate;
      end;
    finally
      Dec(FLayoutLock);
      EndUpdate;
    end;
  end;
end;

procedure TDefineExcel.EndUpdate;
begin
  if FUpdateLock > 0 then
     Dec(FUpdateLock);
end;

procedure TDefineExcel.LayoutChanged;
begin
  if AcquireLayoutLock then
     EndLayout;
end;

function TDefineExcel.AcquireLayoutLock: Boolean;
begin
  Result := (FUpdateLock = 0) and (FLayoutLock = 0);
  if Result then BeginLayout;
end;

procedure TDefineExcel.Loaded;
begin
  inherited Loaded;
  LayoutChanged;
end;

function TDefineExcel.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDefineExcel.SetDataSource(const Value: TDataSource);
begin
  if Value = FDatalink.Datasource then Exit;
  if Assigned(Value) then
    if Assigned(Value.DataSet) then
      if Value.DataSet.IsUnidirectional then
         DatabaseError(SDataSetUnidirectional);
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TDefineExcel.LinkActive(Value: Boolean);
begin
  try
    LayoutChanged;
  finally
    //
  end;
end;

function TDefineExcel.CreateDataLink: TEduceLink;
begin
  Result := TEduceLink.Create(Self);
end;

function TDefineExcel.GetColumnCount: integer;
begin
  Result := FColumns.Count;
end;

function TDefineExcel.GetEduceCount: integer;
var
  i:integer;
begin
  result := 0;
  for i:= 0 to FColumns.Count - 1 do
      if FColumns[i].Visible then result := result + 1;
end;

procedure TDefineExcel.ExportAll;
var i:integer;
begin
  for i:=0 to ColumnCount - 1 do FColumns[i].Visible := True;
end;

function TDefineExcel.GetFields(FieldIndex: Integer): TField;
begin
  Result := FDatalink.Fields[FieldIndex];
end;

procedure TDefineExcel.CancelLayout;
begin
  if FLayoutLock > 0 then
  begin
    if FLayoutLock = 1 then
       EduceDatas.EndUpdate;
    Dec(FLayoutLock);
    EndUpdate;
  end;
end;

procedure TDefineExcel.ExecuteSave;
var
  SaveDlg: TSaveDialog;
  FileStream: TFileStream;
  inx: integer;
  UseState: boolean;
begin
 FieldForm := TFieldForm.Create(self);
 try
  FieldForm.FieldBox.Items.Clear;
  for inx := 0 to FColumns.Count - 1 do
  begin
      FieldForm.FieldBox.Items.Add(FColumns[inx].Caption);
      FieldForm.FieldBox.Checked[inx] := FColumns[inx].Visible;
  end;
  FieldForm.ShowModal;
  if FieldForm.ModalResult = mrOk then
  begin
   for inx := 0 to FieldForm.FieldBox.Items.Count - 1 do
       FColumns[inx].Visible := FieldForm.FieldBox.Checked[inx];
   SaveDlg := TSaveDialog.Create(self);
   try
    SaveDlg.DefaultExt := '.XLS';
    SaveDlg.Filter     := '微软电子表格(MS-EXCEL文件)|*.XLS';
    SaveDlg.Title      := '保存为';
    if SaveDlg.Execute then
    begin
     if Assigned(FDataLink.DataSet) then
     begin
      useState := true;
      if FileExists(SaveDlg.FileName) then
         useState := DeleteFile(SaveDlg.FileName);
      if useState then
      begin
       FileStream := TFileStream.Create(SaveDlg.FileName, fmCreate);
       try
        SaveExcel(FileStream);
       Finally
        FileStream.Free;
       end;
      end
      else ShowMessage('文件正在使用中,不能覆盖文件!');
     end;
    end;
   finally
    SaveDlg.Free;
   end;
  end;
 finally
  FieldForm.Free;
  FieldForm := Nil;
 end;
end;

procedure TDefineExcel.InitFields;
var
  inx: integer;
  Col: TEduceData;
begin
 if Assigned(FDataLink.DataSet) then
 begin
 with FDataLink.DataSet.FieldDefs do
 begin
  if (not FDataLink.Active) and (Count > 0) then
  begin
    FColumns.BeginUpdate;
    FColumns.Clear;
    for inx:=0 to Count - 1 do
    begin
      Col := FColumns.Add;
      Col.FieldName := Items[inx].Name;
      Col.Caption   := Items[inx].Name;
    end;
    FColumns.EndUpdate;
  end;
 end;
 end;
end;

procedure TDefineExcel.ClearFields;
begin
 FColumns.BeginUpdate;
 FColumns.Clear;
 FColumns.EndUpdate;
end;

procedure TDefineExcel.RestoreFields;
var
 inx : integer;
 col : TEduceData;
begin
 FColumns.BeginUpdate;
 for inx:=0 to FColumns.Count - 1 do
 begin
   Col := FColumns[inx];
   Col.Caption  := Col.FieldName;
   Col.Visible  := True;
 end;
 FColumns.EndUpdate;
end;

{ TEduceLink }

const
  MaxMapSize = (MaxInt div 2) div SizeOf(Integer);

type
  TIntArray = array[0..MaxMapSize] of Integer;
  PIntArray = ^TIntArray;

constructor TEduceLink.Create(ADSExcel: TDefineExcel);
begin
  inherited Create;
  FCells        := ADSExcel;
  VisualControl := True;
end;

destructor TEduceLink.Destroy;
begin
  ClearMapping;
  inherited Destroy;
end;

function TEduceLink.GetDefaultFields: Boolean;
var
  I: Integer;
begin
  Result := True;
  if DataSet <> nil then
     Result := DataSet.DefaultFields;
  if Result and SparseMap then
  for I := 0 to FFieldCount-1 do
    if FFieldMap[I] < 0 then
    begin
      Result := False;
      Exit;
    end;
end;

function TEduceLink.GetFields(I: Integer): TField;
begin
  if (0 <= I) and (I < FFieldCount) and (FFieldMap[I] >= 0) then
    Result := DataSet.FieldList[FFieldMap[I]]
  else
    Result := nil;
end;

function TEduceLink.AddMapping(const FieldName: string): Boolean;
var
  Field: TField;
  NewSize: Integer;
begin
  Result := True;
  if FFieldCount >= MaxMapSize then
     RaiseGridError(STooManyColumns);
  if SparseMap then
     Field := DataSet.FindField(FieldName)
  else
     Field := DataSet.FieldByName(FieldName);

  if FFieldCount = Length(FFieldMap) then
  begin
    NewSize := Length(FFieldMap);
    if NewSize = 0 then
       NewSize := 8
    else
       Inc(NewSize, NewSize);
    if (NewSize < FFieldCount) then
        NewSize := FFieldCount + 1;
    if (NewSize > MaxMapSize) then
        NewSize := MaxMapSize;
    SetLength(FFieldMap, NewSize);
  end;
  if Assigned(Field) then
  begin
    FFieldMap[FFieldCount] := Dataset.FieldList.IndexOfObject(Field);
    Field.FreeNotification(FCells);
  end
  else
    FFieldMap[FFieldCount] := -1;
  Inc(FFieldCount);
end;

procedure TEduceLink.ActiveChanged;
begin
  if Active and Assigned(DataSource) then
    if Assigned(DataSource.DataSet) then
      if DataSource.DataSet.IsUnidirectional then
         DatabaseError(SDataSetUnidirectional);
  FCells.LinkActive(Active);
  FModified := False;
end;

procedure TEduceLink.ClearMapping;
begin
  FFieldMap   := nil;
  FFieldCount := 0;
end;

procedure TEduceLink.LayoutChanged;
var
  SaveState: Boolean;
begin
  SaveState := FCells.LayoutSet;
  FCells.LayoutSet := True;
  try
    FCells.LayoutChanged;
  finally
    FCells.LayoutSet := SaveState;
  end;
  inherited LayoutChanged;
end;

function TEduceLink.GetMappedIndex(ColIndex: Integer): Integer;
begin
  if (0 <= ColIndex) and (ColIndex < FFieldCount) then
    Result := FFieldMap[ColIndex]
  else
    Result := -1;
end;

function TEduceLink.IsAggRow(Value: Integer): Boolean;
begin
  Result := False;
end;

end.

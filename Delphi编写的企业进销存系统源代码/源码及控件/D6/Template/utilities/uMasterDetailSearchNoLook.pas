unit uMasterDetailSearchNoLook;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ComCtrls, StdCtrls, Buttons,  TSGrid, Grids_ts,
  TSDBGrid, ExtCtrls, ComObj, Easysize, Variants;


type
  TMasterDetailSearchNoLook = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    tsDBGrid1: TtsDBGrid;
    tsGrid1: TtsGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Animate1: TAnimate;
    DataSource1: TDataSource;
    Query1: TQuery;
    StatusBar1: TStatusBar;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Splitter1: TSplitter;
    FormResizer1: TFormResizer;
    Edit1: TEdit;
    procedure tsGrid1ButtonClick(Sender: TObject; DataCol,
      DataRow: Integer);
    procedure StartSearch(Sender: TObject);
    procedure tsGrid1ComboGetValue(Sender: TObject; Combo: TtsComboGrid;
      GridDataCol, GridDataRow, ComboDataRow: Integer; var Value: Variant);
    procedure tsGrid1ComboDropDown(Sender: TObject; Combo: TtsComboGrid;
      DataCol, DataRow: Integer);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure tsDBGrid1DblClick(Sender: TObject);
    procedure Query1AfterOpen(DataSet: TDataSet);
    procedure tsGrid1CellEdit(Sender: TObject; DataCol, DataRow: Integer;
      ByUser: Boolean);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FDataBaseName: string; //要搜寻的资料库名称
    FDataSet: TDBDataSet; //要搜寻的资料表
    FDetailDataSet: TDBDataSet;//要搜寻的明细档资料表

    FsearchField: array of Integer; //master 资料表要搜寻的栏位值
    FDetailSearchField: array of integer;//detail 资料表要搜寻的栏位值

    FMaster_DisPlay_Field: array of integer;//master要显示出搜寻结果的栏位值
    FDetail_DisPlay_Field: array of integer;//Detail要显示出搜寻结果的栏位值

  //============================  write by JEFF  2002.10.16===================
  //  FLookUpDate : array of string; //要LookUp的 资料表，如有原料编号就带出原料名称等--['T_Cust','T_Material'];
  //  FLookUpPurpose : array of string;  // 要LookUp的 资料表栏位;
  //  FLookUpVisibleField;array of string; // 要LookUp的 资料表显示栏位;
  //  FLookUpSourceFindKey :array of string;//要通过来源档的哪些栏位进行查找栏位如：通过进料单的厂商编号查找厂商名称--通过主档为如：M.F01，明细 D.F01---['M.F01','D.F01,D.F02'];
  //===============================================================

    FSql: string; //要搜寻的ＳＱＬ语法
    FFieldType: array of char; //搜寻栏位的型态
    FMFieldCount: integer; //要搜寻的栏位数目
    FDFieldCount: integer;// 要搜寻的detail栏位数
    FFieldName: array of string; //要搜寻的栏位原始名称
    FFieldDisplayName: array of string; //要显示的栏位名称
    FSelRang: array of integer;   (* 选取的列印范围 *)
    FSelR: Boolean;               (* 选取的为记录范围(True), 还是栏位范围(False) *)
    FOtherWhere: string;//在做搜寻时其他的条件值
    FKeyValue: TstringList;//要将资料表取回的时,需要用到的栏位
    procedure GetSQL;
    procedure SetSearchGrid;
    procedure GetSQLEx;
    procedure InitialSearchField;
    function Get_From_Sentence: string;
    { Private declarations }
  public
    { Public declarations }
    procedure Exec(MDataSet: TDBDataset;MSearchField: array of integer;DDataSet: TDBDataset;DSearchField,iMDisField_List,iDDisField_List: array of integer;sOtherWhere: string);
    Property sDataSet: TDBDataSet read FDataSet write FDataSet;
    property sDataBaseName: string read FDataBaseName write FDataBaseName;
    (* 确认要列印的资料范围 *)
    procedure GetSelRang;
    (* Excel 列印程式*)
    procedure ExcelPrint(const Dataset: TDataSet; Excel_ID, s_title: String; SelR: Boolean; PField: array of integer);

  end;

  procedure Search_MasterDetailEx(const MDataSet: TDBDataSet;sMField: array of Integer;const DDataSet: TDBDataSet;sDField,iMDisField_List,iDDisField_List: array of Integer;sOtherWhere: string='');
  procedure Search_MasterDetail(const MDataSet: TDBDataSet;sMField: array of Integer;const DDataSet: TDBDataSet;sDField: array of Integer;sOtherWhere: string='');

var
  MasterDetailSearchNoLook: TMasterDetailSearchNoLook;

implementation
{$DEFINE TEST}


uses uCalendar, uSeaRep;

const
  iBool_Cell = 1;
  isearchField = 2;
  isearchKind = 3;
  iSearchValue = 4;

{ iISPrint_Cell = 1;
  iBool_Cell = 2;
  isearchField = 3;
  isearchKind = 4;
  iSearchValue = 5;  }
  TestSQLOutput = 'C:\WINNT\Profiles\Administrator.000\「开始」功能表\';

{$R *.DFM}
procedure Search_MasterDetailEx(const MDataSet: TDBDataSet;sMField: array of Integer;const DDataSet: TDBDataSet;sDField,iMDisField_List,iDDisField_List: array of Integer;sOtherWhere: string='');
begin
  if MDataSet=nil then begin
    MessageBoxEx(application.handle,'请输入要查询的资料表名称','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
    exit;
  end;
  if High(sMField)=0 then begin
    MessageBoxEx(application.handle,'请输入要查询的栏位编号','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
    exit;
  end;

  MasterDetailSearchNoLook := TMasterDetailSearchNoLook.Create(Application);
  try
    MasterDetailSearchNoLook.Exec(MDataSet,sMField,DDataSet,sDField,iMDisField_List,iDDisField_List,sOtherWhere);
  finally
    MasterDetailSearchNoLook.Free;
  end;

end;

{KeyField必须包在搜寻的栏位内,也就是所搜寻的栏位必须要有KEY 的栏位名称,iKeyField表示搜寻的栏位前几位是KEY栏位}
procedure Search_MasterDetail(const MDataSet: TDBDataSet;sMField: array of Integer;const DDataSet: TDBDataSet;sDField: array of Integer;sOtherWhere: string='');
begin
  if MDataSet=nil then begin
    MessageBoxEx(application.handle,'请输入要查询的资料表名称','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
    exit;
  end;
  if High(sMField)=0 then begin
    MessageBoxEx(application.handle,'请输入要查询的栏位编号','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
    exit;
  end;

  MasterDetailSearchNoLook := TMasterDetailSearchNoLook.Create(Application);
  try
    MasterDetailSearchNoLook.Exec(MDataSet,sMField,DDataSet,sDField,[],[],sOtherWhere);
  finally
    MasterDetailSearchNoLook.Free;
  end;
end;

{ TForm_SearchData }


procedure TMasterDetailSearchNoLook.GetSelRang;
var
  i, nCol : integer;
  Bk : Variant;
begin
  (* 若没有进行选取, 等同於选取了全部栏位 , 要全部列印 *)
  if (tsDBGrid1.SelectedCols.Count = 0) and (tsDBGrid1.SelectedRows.Count = 0) then begin
     FSelR := False;    // 标志选取的为栏位范围
     SetLength(FSelRang, Query1.FieldCount);
     for i := 0 to Query1.FieldCount - 1 do FSelRang[i] := i;
     Exit;
   end;
  (* 若选取栏位列印范围 *)
  if (tsDBGrid1.SelectedCols.Count <> 0) then begin
     FSelR := False; // 标志选取的为栏位范围
     SetLength(FSelRang, tsDBGrid1.SelectedCols.Count);
     nCol:= tsDBGrid1.SelectedCols.First;
     FSelRang[0] := nCol-1;
     for i := 1 to tsDBGrid1.SelectedCols.Count-1 do begin
       nCol := tsDBGrid1.Selectedcols.Next(nCol);
       FSelRang[i] := nCol-1;
     end;
  end;
  (* 若选取记录列印范围 *)
  if (tsDBGrid1.SelectedRows.Count <> 0) then begin
     FSelR := True;  // 标志选取的为记录范围
     SetLength(FSelRang, tsDBGrid1.SelectedRows.Count);
     i := 0;
     Bk := tsDBGrid1.SelectedRows.First;
     While not VarIsEmpty(Bk) do begin
       Query1.Bookmark := Bk;
       FSelRang[i] := Query1.RecNo-1;
       Inc(i);
       Bk := tsDBGrid1.SelectedRows.Next(Bk);
     end;
  end;
end;



procedure TMasterDetailSearchNoLook.ExcelPrint(const Dataset: TDataSet; Excel_ID, s_title: String; SelR: Boolean; PField: array of integer);
var
  i, j : integer;
  ExcelFile : Variant;
begin
  if not dataset.active then begin
     beep;
     Application.MessageBox(PChar('对不起!没有资料可以列印!'),PChar('警告'),MB_ICONWARNING+MB_OK);
     exit;
  end;
  if Dataset.recordcount = 0 then begin
     beep;
     Application.MessageBox(PChar('对不起!没有资料可以列印!'),PChar('警告'),MB_ICONWARNING+MB_OK);
     exit;
  end;
  Screen.Cursor := crHourglass;
  Try
    ExcelFile := CreateOleObject(Excel_ID);
    ExcelFile.Visible := true;
    ExcelFile.WorkBooks.Add;
  Except
    Application.MessageBox(PChar('启动 Excel 时发生错误!'#13'无法将资料投入Excel!'),PChar('警告'),MB_ICONWARNING+MB_OK);
    exit;
  End;

  ExcelFile.Cells[1,1].value := s_title;

  With Dataset do begin
    First;
    if SelR then begin     (* 若选取了列印的记录范围 *)
       // 列印全部栏位名称:
       for i := 0 to FieldCount-1 do ExcelFile.Cells[3,i+1].value := Fields[i].DisplayLabel;
       // 列印出所选记录:
       DataSet.MoveBy(PField[0]);
       for j := 0 to Dataset.FieldCount-1 do ExcelFile.Cells[4,j+1].value := Fields[j].asstring;
       for i := 1 to High(PField) do begin
         DataSet.MoveBy(PField[i] - PField[i-1]);
         for j := 0 to Dataset.FieldCount-1 do ExcelFile.Cells[i+4,j+1].value := Fields[j].asstring;
       end;
    end
    else begin             (* 若选取了列印的栏位范围 *)
       // 列印选取的栏位名称:
       for i := 0 to High(PField) do ExcelFile.Cells[3,i+1].value := Fields[PField[i]].DisplayLabel;
       // 列印出所选栏位的所有记录:
       for i := 0 to RecordCount - 1 do begin
         for j := 0 to High(PField) do ExcelFile.Cells[i+4,j+1].value := Fields[PField[j]].asstring;
         Next;
       end;
    end;  // end of else
  end;    // end of with
  Screen.Cursor := crDefault;
end;




procedure TMasterDetailSearchNoLook.Exec(MDataSet: TDBDataset;MSearchField: array of integer;DDataSet: TDBDataset;DSearchField,iMDisField_List,iDDisField_List: array of integer;sOtherWhere: string);
var
  iCount: integer;
begin
  //开始执行搜寻
  FOtherWhere := sOtherWhere;
  sDataSet := MDataSet;
  FDetailDataSet := DDataSet;

  SetLength(FSearchField,high(MSearchField)+1);   //将要搜寻的主资料表栏位储存
  for iCount := 0 to high(MsearchField) do
    FsearchField[iCount] := MSearchField[iCount];

  SetLength(FDetailsearchField,high(DSearchField)+1);  //将要搜寻的detail资料表栏位储存
  for iCount := 0 to high(DsearchField) do
    FDetailSearchField[iCount] := dSearchField[iCount];

  if High(iMDisField_List)<>(-1) then begin
    SetLength(FMaster_DisPlay_Field,High(iMDisField_List)+1);
    for iCount := low(iMDisField_List) to high(iMDisField_List) do
      FMaster_DisPlay_Field[iCount] := iMDisField_List[iCount];
  end;

  if High(iDDisField_List)<>(-1) then begin
    SetLength(FDetail_DisPlay_Field,High(iDDisField_List)+1);
    for iCount := low(iDDisField_List) to high(iDDisField_List) do
      FDetail_DisPlay_Field[iCount] := iDDisField_List[iCount];  //将要查询的栏位和要显示的栏位  储存在属性中
  end;

  

  FMFieldCount := high(MSearchField)+1;
  FDFieldCount := high(DsearchField)+1;

  Query1.DatabaseName := MDataSet.DatabaseName;

   //设定搜寻栏位的资讯(型别)
  InitialSearchField;

  if (High(iDDisField_List)<>(-1)) or (High(iMDisField_List)<>(-1)) then
    GetSQLEx //如果有取定要显示出来的那个栏位
  else
    GetSQL; //取得ＳＱＬ语法
  SetSearchGrid; //设定要寻找的GRID环境
  showmodal;
end;

procedure TMasterDetailSearchNoLook.InitialSearchField;
var
  iCount: integer;
begin
  SetLength(ffieldname,FMFieldCount+FDFieldCount);
  SetLength(FFieldType,FMFieldCount+FDFieldCount);
  SetLength(FFieldDisplayname,FMFieldCount+FDFieldCount);

  for iCount := 0 to FMFieldCount-1 do begin
    FFieldName[iCount] :='M.'+ TTable(sDataSet).Fields[fsearchfield[iCount]].FieldName;
    FFieldDisplayName[iCount] := TTable(sDataSet).Fields[fsearchfield[iCount]].DisplayName;
    case TTable(sDataSet).Fields[fsearchfield[iCount]].DataType  of
      ftdatetime :          FFieldType[iCount] := 'D';
      ftString:         FFieldType[ICount] := 'S';
      ftInteger,ftFloat:FFieldType[ICount] := 'I';
      else
        FFieldType[iCount] := 'N';
    end;//end of case
  end;

  for iCount := 0 to FDFieldCount-1 do begin
    FFieldName[iCount+FMFieldCount] :='D.'+ TTable(FDetailDataSet).Fields[fDetailsearchfield[iCount]].FieldName;
    FFieldDisplayName[iCount+FMFieldCount] := TTable(FDetailDataSet).Fields[fDetailsearchfield[iCount]].DisplayName;
    case TTable(FDetailDataSet).Fields[fDetailsearchfield[iCount]].DataType  of
      ftdatetime :          FFieldType[iCount+FMFieldCount] := 'D';
      ftString:         FFieldType[ICount+FMFieldCount] := 'S';
      ftInteger,ftFloat:FFieldType[ICount+FMFieldCount] := 'I';
      else
        FFieldType[iCount+FMFieldCount] := 'N';
    end;//end of case
  end;
end;

//取回 SQL语句中From的字串
function TMasterDetailSearchNoLook.Get_From_Sentence: string;   //JEFF： 得到SQL语句中的 From 段语句；
var
  iCount: integer;
  LM,LD: TList;
  sFrom: string;
begin
  FKeyValue := TstringList.Create;//储存要将资料取回的栏位名称(主键)
  LM := TList.Create;
  LD := TList.Create;
  try
    TTable(FDetailDataSet).GetDetailLinkFields(lm,ld); // JEFF：得到主档，明细档关联栏位

    sFrom := ' FROM '+TTable(sDataSet).TableName+' M, '+TTable(FDetailDataSet).tablename+' D WHERE ';
    for iCount:= 0 to LM.Count-1 do begin         //JEFF ：用SQL将两个资料表关联上，关联的栏位用TTable(FDetailDataSet).GetDetailLinkFields(lm,ld)得到；
      sFrom := sFrom +' M.'+TField(Lm[iCount]).FieldName+' = D.'+TField(LD[iCount]).FieldName+' AND';
      FKeyValue.Add(TField(Lm[iCount]).FieldName);
    end;
    if FOtherWhere <>'' then
      sFrom := sFrom +' '+FOtherWhere+'AND';

    delete(sFrom,length(sFrom)-2,3);

  finally
    Lm.Free;
    LD.Free;
  end;
  result := sFrom;
end;

//当使用者有设定要显示出那些栏位时,
procedure TMasterDetailSearchNoLook.GetSQLEx;
var
  iCount: integer;
  sSelect: string;
begin
  sSelect := 'SELECT ';

  //产生 select 的语法
  for iCount := Low(FMaster_DisPlay_Field) to high(FMaster_DisPlay_Field) do
    sSelect := sSelect+' M.'+TTable(sDataSet).Fields[FMaster_DisPlay_Field[iCount]].FieldName+' as '+TTable(sDataSet).Fields[FMaster_DisPlay_Field[iCount]].DisplayName+', ';

  for iCount := low(FDetail_DisPlay_Field) to high(FDetail_DisPlay_Field) do
      sSelect := sSelect+' D.'+TTable(FDetailDataSet).Fields[FDetail_DisPlay_Field[iCount]].FieldName+' as '+TTable(FDetailDataSet).Fields[FDetail_DisPlay_Field[iCount]].DisplayName+', ';

  trim(sSelect);
  Delete(sSelect,length(sSelect)-1,1);

  FSql := sSelect + Get_From_Sentence;

  {$ifdef TESt}
  {AssignFile(output, testSQLoutput+'aaa1.sql');
  rewrite(output);
  writeln(output,fsql);
  closefile(output);}
  {$Endif} 
end;

//当使用者无指定要显示的是那些栏位,则以搜寻的栏位为显示的栏位
procedure TMasterDetailSearchNoLook.GetSQL;
var
  iCount: integer;
  iCountRepeat: integer;
  iRepeatTime: integer;
  sSelect: string;
begin
  sSelect := 'SELECT ';

  //产生 select 的语法
  iRepeatTime := 0;
  for iCount := 0 to FMFieldCount-1 do begin
    for iCountRepeat := 0 to iCount-1 do
      if fsearchfield[iCount] = fsearchfield[iCountRepeat] then //JEFF：如选择销货单日期范围
        inc(iRepeatTime);
    if iRepeatTime = 0 then//无选择过,因有时候我们会选择二个相同的栏位来做比较,如日期栏位,但我们选择出来的栏位只需要显示一个就好了
      sSelect := sSelect+' M.'+TTable(sDataSet).Fields[fsearchfield[iCount]].FieldName+' as '+TTable(sDataSet).Fields[fsearchfield[iCount]].DisplayName+', ';
    iRepeatTime := 0;
  end;

  iRepeatTime := 0;
  for iCount := 0 to FDFieldCount-1 do begin
    for iCountRepeat := 0 to iCount-1 do
      if fDetailsearchfield[iCount] = fDetailsearchfield[iCountRepeat] then
        inc(iRepeatTime);
    if iRepeatTime = 0 then//无选择过,因有时候我们会选择二个相同的栏位来做比较,如日期栏位,但我们选择出来的栏位只需要显示一个就好了
      sSelect := sSelect+' D.'+TTable(FDetailDataSet).Fields[fDetailsearchfield[iCount]].FieldName+' as '+TTable(FDetailDataSet).Fields[fDetailsearchfield[iCount]].DisplayName+', ';
    iRepeatTime := 0;
  end;

  trim(sSelect);
  Delete(sSelect,length(sSelect)-1,1);

  FSql := sSelect + Get_From_Sentence;
  {$ifdef TEST}
  {AssignFile(output, TestSQLOutput+'aaa2.sql');
  rewrite(output);
  writeln(output,fsql);
  closefile(output); }
  {$endif}
end;

procedure TMasterDetailSearchNoLook.SetSearchGrid;
var
  iCount: integer;
  iRows: integer;
begin
  //设定tsGrid的环境
  iRows := FMFieldCount+FDFieldCount;
  with tsGrid1 do begin
    tsGrid1.Rows := iRows;

    for iCount := 0 to iRows-1 do begin
     // tsGrid1.Cell[iISPrint_Cell,iCount+1] := False;
      tsGrid1.Cell[iBool_Cell,iCount+1] := '并且';
      tsGrid1.Cell[isearchKind,iCount+1] := '=';
      tsGrid1.Cell[isearchField,iCount+1] := FFieldDisplayName[iCount]; //指定搜寻栏位的名称
    end;
    tsGrid1.cell[1,1] := '';//第一个搜寻条件值不需要有搜寻条件
   // tsGrid1.cell[2,1] := '';//第一个搜寻条件值不需要有搜寻条件
    tsGrid1.Col[isearchField].ReadOnly := true;
    tsGrid1.CurrentCell.MoveTo(isearchValue,1);//将游标移至第第一个要输入搜寻条件值的地方
  end;//end of with
end;

procedure TMasterDetailSearchNoLook.tsGrid1ButtonClick(Sender: TObject; DataCol,
  DataRow: Integer);
begin
  //当输入栏位值是日期型别时,该使用者可以用选择的方式
  if DataCol <> isearchvalue then
    exit;

  if FFieldType[DataRow-1]='D' then
    with TCalendarDlg.Create(nil) do
      try
        if ShowModal=mrok then
          tsGrid1.Cell[DataCol,DataRow] := FormatDateTime('yyyy/mm/dd',Calendar1.CalendarDate);//copy(inttostr(Calendar1.Month+101),2,2)+'/' +copy(inttostr(Calendar1.Day+101),2,2)+'/'+inttostr(Calendar1.Year);
      finally
        free;
      end;
end;

procedure TMasterDetailSearchNoLook.StartSearch(Sender: TObject);
var
  sWhere: string;

  function GetEValue(s: string):string;//取得判断式
  begin
    if s='并且' then
      result := 'AND'
    else if s= '或' then
      Result := 'OR'
    else
      Result := '';
    if sWhere = '' then
      Result := '';
  end;

  function GetSearchKind(i: integer): string;//取得要搜寻的条件值
  var
    sKind: string;
    sSearchValue: string;
  begin
    sKind := tsGrid1.Cell[isearchKind,i+1];
    sSearchValue := tsGrid1.Cell[iSearchValue,i+1];
    case FFieldType[i] of
      'S':
          if sKind = 'LIKE%' then
            Result := ' '+copy(sKind,1,4) + ' "'+sSearchValue+'%") '
          else if sKind = '%LIKE' then
            Result := ' '+copy(sKind,2,4) + ' "%'+sSearchValue+'") '
          else if sKind = '%LIKE%' then
            Result := ' '+copy(sKind,2,4) + ' "%'+sSearchValue+'%") '
          else
            Result := ' '+sKind + ' "'+sSearchValue+'") ';
      'I': Result :=  ' '+sKind + sSearchValue+') ';
      'D','N':
          Result := ' '+sKind + ' "'+sSearchValue+'") ';
    end;
  end;

  procedure GetSWhere;//取得要搜寻的条件值
  var
    i: integer;
  begin
    for i := 0 to (FMFieldCount+FMFieldCount)-1 do
      if vartostr(tsGrid1.Cell[iSearchValue,i+1])<>'' then
        sWhere := sWhere+GetEvalue(tsGrid1.Cell[iBool_Cell,i+1])+' ( '+ FFieldname[i] +GetSearchKind(i);
  end;

begin
  //开始搜寻资料
  Query1.Close;
  Query1.SQL.Clear;
  Animate1.Active := True;
  try
    GetSWhere;//取得要搜寻的条件值
    if sWhere = '' then begin
      MessageBoxEx(application.handle,'请输入查询条件','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
      exit;
    end;
    if pos('WHERE',UpperCase(FSql)) <> 0 then
       Query1.SQL.Add(FSql + ' AND ( '+sWhere+' )')
    // Query1.SQL.Add(FSql + ' AND  '+sWhere+' ')
    else
      Query1.SQL.Add(FSql + ' WHERE '+sWhere);
    {$ifdef TEST}
    {AssignFile(output,  TestSQLOutput+'SQL.sql');
    rewrite(output);
    writeln(output,Query1.SQL.Text);
    closefile(output);}
    {$endif}
    Query1.open;
    if Query1.IsEmpty then begin
      MessageBoxEx(application.handle,'找不到您要的资料,请重新输入查询条件','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
      tsGrid1.SetFocus;
      tsGrid1.CurrentCell.MoveTo(iSearchvalue,1);
      StatusBar1.SimpleText := '共找到 0 个资料';
    end else
      StatusBar1.SimpleText := '共找到 '+inttostr(query1.recordcount)+' 个资料';

  finally
    Animate1.Stop;
  end;
end;

procedure TMasterDetailSearchNoLook.tsGrid1ComboGetValue(Sender: TObject;
  Combo: TtsComboGrid; GridDataCol, GridDataRow, ComboDataRow: Integer;
  var Value: Variant);
begin
  //当使用者选择了第一个搜寻条件值的搜寻条件时,不能让使用者改变
  if (GridDataCol= ibool_Cell) and (GridDataRow=1) then begin
    MessageBoxEx(application.handle,'您不能设定这个条件值','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
    value := '';
  end;
end;

procedure TMasterDetailSearchNoLook.tsGrid1ComboDropDown(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Integer);
begin
  //指定搜寻的条件
  if tsgrid1.CurrentDataCol <> iSearchKind then
    exit;
  case FFieldType[tsgrid1.CurrentDataRow-1] of
    'S':begin
          Combo.DropDownRows := 4;
          Combo.Rows := 4;
          Combo.Cell[1,1] := '=';
          Combo.Cell[1,2] := 'LIKE%';
          Combo.Cell[1,3] := '%LIKE';
          Combo.Cell[1,4] := '%LIKE%';
        end;
    else
      begin
        Combo.DropDownRows := 6;
        combo.Rows := 6;
        Combo.Cell[1,1] := '=';
        Combo.Cell[1,2] := '>';
        Combo.Cell[1,3] := '>=';
        Combo.Cell[1,4] := '<';
        Combo.Cell[1,5] := '<=';
        Combo.Cell[1,6] := '<>';
      end;//
  end;//end of case

end;

procedure TMasterDetailSearchNoLook.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TMasterDetailSearchNoLook.BitBtn2Click(Sender: TObject);
var
  sParimayKey: string;
  icount: Integer;
  vFieldArray: variant;
begin
  {执行取回的动作}
  if query1.IsEmpty then begin
    if sender = nil then
      exit;
    MessageBoxEx(application.handle,'无资料可供取回','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
    exit;
  end;

  if FKeyValue.Count > 1 then begin  //JEFF注:FKeyValue 是储存主档索引栏位
    VFieldArray := VarArrayCreate([0,FKeyValue.Count-1],varolestr); // 将VFieldArray 建成变量数组，varolestr是一种类型；
    for iCount := 0 to FKeyValue.Count-1 do begin    //给vFieldArray 中的每个原素赋值
      vFieldArray[iCount] := Query1.Fieldbyname(sDataSet.Fieldbyname(FKeyValue[iCount]).DisplayName).value;
      sParimayKey := sParimaykey + FKeyValue[iCount]+';'
    end;
    Delete(sParimayKey,length(sParimayKey),1);
    sDataSet.Locate(sParimayKey,vFieldArray,[]);
  end
  else
  begin
    sParimayKey := FKeyValue[0];      //JEFF注: 通过主档键值进行查找 
    vFieldArray := Query1.Fieldbyname(sDataSet.Fieldbyname(FKeyValue[0]).DisplayName).value;
    sDataSet.Locate(sParimayKey,vFieldArray,[]);
  end;
  close;
end;

procedure TMasterDetailSearchNoLook.tsDBGrid1DblClick(Sender: TObject);
begin
  BitBtn2Click(nil);
end;

procedure TMasterDetailSearchNoLook.Query1AfterOpen(DataSet: TDataSet);
begin
  BitBtn2.Enabled := not query1.IsEmpty;
  (* add code*)
  BitBtn4.Enabled := not query1.IsEmpty;
  BitBtn5.Enabled := not query1.IsEmpty;
  (**)
end;

procedure TMasterDetailSearchNoLook.tsGrid1CellEdit(Sender: TObject; DataCol,
  DataRow: Integer; ByUser: Boolean);
begin
  BitBtn2.Enabled := False;
  (**)
  BitBtn4.Enabled := False;
  BitBtn5.Enabled := False;
  (**)
  if Query1.Active then
    Query1.Close;
end;

procedure TMasterDetailSearchNoLook.BitBtn4Click(Sender: TObject);
begin
  GetSelRang;
  SearchRepExc(Query1,FSelR,FSelRang);
end;

procedure TMasterDetailSearchNoLook.BitBtn5Click(Sender: TObject);
begin
  GetSelRang;
  ExcelPrint(Query1,'Excel.Application','资料表',FSelR,FSelRang);
end;

procedure TMasterDetailSearchNoLook.FormDestroy(Sender: TObject);
begin
  FKeyValue.Free;
end;

procedure TMasterDetailSearchNoLook.FormCreate(Sender: TObject);
begin
  FormResizer1.InitializeForm;
end;

procedure TMasterDetailSearchNoLook.FormResize(Sender: TObject);
begin
  FormResizer1.ResizeAll;
end;

end.

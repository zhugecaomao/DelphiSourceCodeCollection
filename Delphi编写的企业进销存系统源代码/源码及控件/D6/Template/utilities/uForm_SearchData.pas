unit uForm_SearchData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ComCtrls, StdCtrls, Buttons, {Easysize,} TSGrid, Grids_ts,
  TSDBGrid, ExtCtrls, ComObj, Variants;


type
  TForm_SearchData = class(TForm)
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
  private
    FDataBaseName: string; //要搜寻的资料库名称
    FDataSet: TDBDataSet; //要搜寻的资料表（有可能是TTable 或是TQuery)
    FsearchField: array of Integer; //要搜寻的栏位值
    fkeyField: integer; //所搜寻的栏位前几位是KEY值
    FSql: string; //要搜寻的ＳＱＬ语法
    FReturn: TStrings; //要回传的key值
    FFieldType: array of char; //搜寻栏位的型态
    FFieldCount: integer; //要搜寻的栏位数目
    FFieldName: array of string; //要搜寻的栏位原始名称
    FFieldDisplayName: array of string; //要显示的栏位名称
    FSelRang: array of integer;   (* 选取的列印范围 *)
    FSelR: Boolean;               (* 选取的为记录范围(True), 还是栏位范围(False) *)
    procedure GetSQL;
    procedure SetSearchGrid;
    { Private declarations }
  public
    { Public declarations }
    procedure Exec(DataSet: TDBDataset;ikeyField:integer;SearchField: array of integer);
    property sReturn: TStrings read FReturn write FReturn;
    Property sDataSet: TDBDataSet read FDataSet write FDataSet;
    property sDataBaseName: string read FDataBaseName write FDataBaseName;
    (* 确认要列印的资料范围 *)
    procedure GetSelRang;
    (* Excel 列印程式*)
    procedure ExcelPrint(const Dataset: TDataSet; Excel_ID, s_title: String; SelR: Boolean; PField: array of integer);

  end;

procedure Search_Data(const DataSet: TDBDataSet;iKeyField:integer;sField: array of Integer);

var
  Form_SearchData: TForm_SearchData;

implementation

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


{$R *.DFM}

{KeyField必须包在搜寻的栏位内,也就是所搜寻的栏位必须要有KEY 的栏位名称,iKeyField表示搜寻的栏位前几位是KEY栏位}
procedure Search_Data(const DataSet: TDBDataSet;iKeyField:integer;sField: array of Integer);
begin
  if DataSet=nil then begin
    MessageBoxEx(application.handle,'请输入要查询的资料表名称','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
    exit;
  end;
  if High(sField)=0 then begin
    MessageBoxEx(application.handle,'请输入要查询的栏位编号','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
    exit;
  end;

  if iKeyField=0 then begin
    MessageBoxEx(application.handle,'请输入主键的栏位编号','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
    exit;
  end;

  Form_SearchData := TForm_SearchData.Create(Application);
  try
    Form_SearchData.Exec(DataSet,ikeyField,sField);
  finally
    Form_SearchData.Free;
  end;
end;

{ TForm_SearchData }


procedure TForm_SearchData.GetSelRang;
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



procedure TForm_SearchData.ExcelPrint(const Dataset: TDataSet; Excel_ID, s_title: String; SelR: Boolean; PField: array of integer);
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




procedure TForm_SearchData.Exec(DataSet: TDBDataset;ikeyField:integer;SearchField: array of integer);
var
  iCount: integer;
begin
  //开始执行搜寻
  sDataSet := DataSet;
  SetLength(FSearchField,high(searchfield)+1);

  FFieldCount := high(searchField)+1;
  for iCount := 0 to FFieldCount-1 do
    FsearchField[iCount] := SearchField[iCount];

  fkeyField := ikeyField;

  Query1.DatabaseName := DataSet.DatabaseName;
  GetSQL; //取得ＳＱＬ语法
  SetSearchGrid; //设定要寻找的GRID环境
  showmodal;
end;


procedure TForm_SearchData.GetSQL;
var
  iCount: integer;
  iPos: integer;
  i2Pos: integer;
  sFrom: string;
  sSelect: string;
  sOldSQL: string;
begin
  SetLength(ffieldname,FFieldCount);
  SetLength(FFieldDisplayname,FFieldCount);
  SetLength(FFieldType,FFieldCount);

  sSelect := 'SELECT ';
  if sDataSet is TTable then begin
    sFrom := ' FROM '+TTable(sDataSet).TableName;
    //产生 select 的语法
    for iCount := 0 to FFieldCount-1 do begin
      sSelect := sSelect+TTable(sDataSet).Fields[fsearchfield[iCount]].FieldName+' as '+TTable(sDataSet).Fields[fsearchfield[iCount]].DisplayName+', ';
      FFieldName[iCount] := TTable(sDataSet).Fields[fsearchfield[iCount]].FieldName;
      FFieldDisplayName[iCount] := TTable(sDataSet).Fields[fsearchfield[iCount]].DisplayName;
      case TTable(sDataSet).Fields[fsearchfield[iCount]].DataType  of
        ftdatetime :          FFieldType[iCount] := 'D';
        ftString:         FFieldType[ICount] := 'S';
        ftInteger,ftFloat:FFieldType[ICount] := 'I';
        else
          FFieldType[iCount] := 'N';
      end;//end of case
    end;
  end else
  begin
    sOldSQL := UpperCase(Trim(TQuery(sDataSet).SQL.Text));

    iPos := pos('FROM',sOldSQL);

    if iPos<0 then begin
      MessageBoxEx(application.handle,'给定的TQuery元件 SQL 语法错误','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
      exit;
    end;

    i2Pos := pos('ORDER',sOldSQL);

    while sOldSQL[iPOS] <>' ' do
      inc(iPos);
    inc(iPos);

    if i2Pos=0 then
      sFrom := 'FROM '+copy(sOldSQL,iPos,length(sOldSQL)-iPos+1)
    else
      sFrom := 'FROM '+copy(sOldSQL,iPos,i2Pos-iPos);

    //产生query的Select语法
    for iCount := 0 to FFieldCount-1 do begin
      sSelect := sSelect + TQuery(sDataSet).Fields[fsearchfield[iCount]].Origin +' as '+TQuery(sDataSet).Fields[fsearchfield[iCount]].DisplayName+', ';
      FFieldName[iCount] := TQuery(sDataSet).Fields[fsearchfield[iCount]].Origin;
      FFieldDisplayName[iCount] := TQuery(sDataSet).Fields[fsearchfield[iCount]].DisplayName;
      case TQuery(sDataSet).Fields[fsearchfield[iCount]].DataType  of
        ftdatetime :          FFieldType[iCount] := 'D';
        ftString:         FFieldType[ICount] := 'S';
        ftInteger,ftFloat:FFieldType[ICount] := 'I';
        else
          FFieldType[iCount] := 'N';
      end;//end of case
    end;
  end;//end of if ... else

  trim(sSelect);
  Delete(sSelect,length(sSelect)-1,1);

  FSql := sSelect + sFrom;

  {AssignFile(output, 'f:\aaa.sql');
  rewrite(output);
  writeln(output,fsql);
  closefile(output);}
end;

procedure TForm_SearchData.SetSearchGrid;
var
  iCount: integer;
begin
  //设定tsGrid的环境
  with tsGrid1 do begin
    tsGrid1.Rows := FFieldCount;

    for iCount := 0 to FFieldCount-1 do begin
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

procedure TForm_SearchData.tsGrid1ButtonClick(Sender: TObject; DataCol,
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

procedure TForm_SearchData.StartSearch(Sender: TObject);
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
    for i := 0 to FFieldCount-1 do
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
    else
      Query1.SQL.Add(FSql + ' WHERE '+sWhere);
    {for Test}
    {AssignFile(output, 'f:\aaa.sql');
    rewrite(output);
    writeln(output,Query1.SQL.Text);
    closefile(output); }
    {end of Test}
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

procedure TForm_SearchData.tsGrid1ComboGetValue(Sender: TObject;
  Combo: TtsComboGrid; GridDataCol, GridDataRow, ComboDataRow: Integer;
  var Value: Variant);
begin
  //当使用者选择了第一个搜寻条件值的搜寻条件时,不能让使用者改变
  if (GridDataCol= ibool_Cell) and (GridDataRow=1) then begin
    MessageBoxEx(application.handle,'您不能设定这个条件值','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
    value := '';
  end;
end;

procedure TForm_SearchData.tsGrid1ComboDropDown(Sender: TObject;
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

procedure TForm_SearchData.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_SearchData.BitBtn2Click(Sender: TObject);
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

  sParimayKey := '';
  if fkeyField > 1 then
    VFieldArray := VarArrayCreate([0,FKeyField-1],varolestr);


  for iCount := 0 to FKeyField-1 do begin //取得要搜寻的键值
    if sDataSet is TTable then
      sParimayKey := sParimaykey + FFieldName[iCount]+';'
    else
      sParimayKey := sParimaykey + sDataSet.Fields[FSearchField[iCount]].FieldName+';';
    if fkeyField>1 then
      vFieldArray[iCount] := Query1.Fields[icount].Value
    else
      vFieldArray := Query1.Fields[icount].Value;
  end;

  Delete(sParimayKey,length(sParimayKey),1);

  sDataSet.Locate(sParimayKey,vFieldArray,[]);
  close;
end;

procedure TForm_SearchData.tsDBGrid1DblClick(Sender: TObject);
begin
  BitBtn2Click(nil);
end;

procedure TForm_SearchData.Query1AfterOpen(DataSet: TDataSet);
begin
  BitBtn2.Enabled := not query1.IsEmpty;
  (* add code*)
  BitBtn4.Enabled := not query1.IsEmpty;
  BitBtn5.Enabled := not query1.IsEmpty;
  (**)
end;

procedure TForm_SearchData.tsGrid1CellEdit(Sender: TObject; DataCol,
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

procedure TForm_SearchData.BitBtn4Click(Sender: TObject);
begin
  GetSelRang;
  SearchRepExc(Query1,FSelR,FSelRang);
end;

procedure TForm_SearchData.BitBtn5Click(Sender: TObject);
begin
  GetSelRang;
  ExcelPrint(Query1,'Excel.Application','资料表',FSelR,FSelRang);
end;

end.

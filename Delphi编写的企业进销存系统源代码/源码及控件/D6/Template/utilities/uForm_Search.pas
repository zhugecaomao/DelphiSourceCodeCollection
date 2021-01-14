unit uForm_Search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,dbtables, Db, DBCtrls, Grids, DBGrids, ExtCtrls, Variants;

type
  TForm_Search = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    StringGrid1: TStringGrid;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FSourceTable : TTable;
    QuerySearch : TQuery;
    FGetData: Boolean;
    procedure SetSourceTable(const Value: TTable);
    function CreateQueryFromTable(T: TTable):TQuery;
    procedure SetGetData(const Value: Boolean);
  public
    { Public declarations }
    procedure StartSearch;
    property SourceTable: TTable read FSourceTable write SetSourceTable; //传入所要查询的table
    Property GetData: Boolean read FGetData write SetGetData; //是否将资料取回
  end;

//------------------------------------------------------------------------------
//function Search function 说明
//叁数:
//      DataSet : 所要查询的资料表名称
//      SearchFieldNo : 所要查询的Fields 名称
//      iReturnFieldNo : 所要回传的栏位序号
//------------------------------------------------------------------------------

function SearchData(DataSet: TTable;  SearchFieldNO: array of integer):TstringList;

var
  Form_Search: TForm_Search;
  SelectString: string;   //查询所需要的 SELECT 语句
  FromString: string;    //查询所需要的 FROM 语句
  WhereString: String;  //查询所需要的 WHERE 语句
  sSearchField : array of String; //所要搜寻的栏位英文名称
  giSearchField: array of integer;
  giSearchCount: integer;
  sDisplayName: Array of string;  //所要搜寻的中文名称
  gsReturnString: TStringList;

implementation

{$R *.DFM}

function SearchData(DataSet: TTable;  SearchFieldNO:array of integer):TstringList;
var
  iCount: integer;
begin
  if DataSet.State <> dsBrowse then begin
    MessageBoxEx(application.handle,'您必须在浏漤状态才能做查询','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
    result := nil;
    exit;
  end;
  result := TStringList.Create;
  try
    with TForm_Search.Create(Application) do begin
      SourceTable := DataSet;
      giSearchCount := High(SearchFieldNo)+1;
      setlength(giSearchField,giSearchCount);
      for iCount := 0 to giSearchCount-1 do
        giSearchField[iCount] := SearchFieldNO[iCount];
      startSearch;
      if GetData then
        result.Assign(gsReturnString)
      else begin
        result.free;
        result := nil;
      end;
    end;
    sSearchField :=nil;
    giSearchField:=nil;
    sDisplayName:=nil;
  except
    result.free;
    raise;
  end;
end;

//------------------------------------------------------------------------------
//建立一个TQuery
//------------------------------------------------------------------------------
function TForm_Search.CreateQueryFromTable(T: TTable): TQuery;
begin
  result := TQuery.Create(nil);
  try
    result.DatabaseName := T.DatabaseName;
    result.SessionName := T.SessionName;
  except
    result.Free;
    raise;
  end;
end;

procedure TForm_Search.SetSourceTable(const Value: TTable);
begin
  FSourceTable := Value;
end;

procedure TForm_Search.FormCreate(Sender: TObject);
begin
  Splitter1.Enabled := False;
  Splitter1.Visible := False;
  Panel2.Enabled := False;
  Panel2.Visible := False;
  with StringGrid1 do begin
    Cells[0,0] := '条件值';
    Cells[1,0] := '栏位名称';
    Cells[2,0] := '所要搜寻的资料';
  end;
  GetData := False;
  gsReturnString := TStringList.Create;
end;

procedure TForm_Search.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;
//------------------------------------------------------------------------------
//开始搜寻所要找的值
//------------------------------------------------------------------------------
procedure TForm_Search.StartSearch;
var
  iCount: Smallint;
begin
  QuerySearch := createQueryFromtable(SourceTable);
  DataSource1.DataSet := QuerySearch;
  SetLength(sSearchField,giSearchCount);
  SetLength(sDisPlayName,giSearchCount);
  StringGrid1.RowCount := giSearchCount+1;
  SelectString := 'SELECT ';
  for iCount := 0  to giSearchCount-1 do begin
    sSearchField[iCount] := SourceTable.Fields[gisearchfield[iCount]].FieldName;
    StringGrid1.Cells[1,iCount+1] :=  SourceTable.Fields[gisearchfield[iCount]].DisplayName;
    sDisPlayName[iCount] := SourceTable.Fields[gisearchfield[iCount]].DisplayName;
    SelectString := SelectString+SourceTable.Fields[gisearchfield[iCount]].FieldName+' '+SourceTable.Fields[gisearchfield[iCount]].DisplayName+', ';
    StringGrid1.Cells[0,iCount+1] := '并且';//stringGrid 的搜寻初始条件值 AND
  end;
  SelectString := copy(SelectString,1,length(SelectString)-2);
  FromString := ' FROM '+SourceTable.TableName;
  StringGrid1.col := 2;
  StringGrid1.row := 1;
  showmodal;
end;

//------------------------------------------------------------------------------
//按下搜寻键开始寻搜
//------------------------------------------------------------------------------
procedure TForm_Search.BitBtn1Click(Sender: TObject);
var
  iCount: smallint;
  isNoInput: boolean;
begin
  with Panel2 do begin
    Enabled := false;
    Visible := False;
  end;
  isNoInput := True;
  WhereString := '';
  //先判断使用者是否输竹了要找寻的资料,如果无输入则要求使用者输入
  for iCount := 1 to StringGrid1.RowCount-1 do begin
    isNoInput := StringGrid1.cells[2,icount] = '';
    if not isNoInput then
      break;
  end;
  if isNoInput then begin
    MessageBoxEx(application.handle,'请输入要寻找的资料','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
    exit;
  end;
  for iCount := 1 to StringGrid1.RowCount-1 do begin
    isNoinput := StringGrid1.cells[2,icount] = '';
    if not isNoInput then begin
      if StringGrid1.Cells[0,iCount] =  '或' then
        WhereString := WhereString + 'OR   ('+sSearchField[iCount-1]+' Like ''%'+StringGrid1.cells[2,icount]+'%'') '
      else
      if StringGrid1.Cells[0,iCount] = '并且' then
        WhereString := WhereString + 'AND ('+sSearchField[iCount-1]+' Like ''%'+StringGrid1.cells[2,icount]+'%'') ';
    end;
  end;
  WhereString := ' WHERE '+Copy(WhereString,4,length(WhereString)-3);

  //使用TQuery开始搜寻
  with QuerySearch do begin
    if Active then
      close;
    SQL.Clear;
    SQL.Add(SelectString+FromString+WhereString);
    Open;
    if IsEmpty then begin
      MessageBoxEx(application.handle,'找不到您要的资料','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
      exit;
    end;
  end;
  Panel2.Enabled := True;
  Panel2.Visible := True;
  Splitter1.Enabled := True;
  Splitter1.Visible := True;
end;


procedure TForm_Search.StringGrid1DblClick(Sender: TObject);
begin
  //更改搜寻的条件值
  with StringGrid1 do
    if (col = 0) and (row in [1..StringGrid1.RowCount-1]) then begin
      if Cells[col,row] = '并且' then
        Cells[col,row] := '或'
      else
        Cells[col,row] := '并且';
    end;
end;

procedure TForm_Search.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  //控制不能让使用者去变动到栏位名称的内容
  CanSelect := (ACol <> 1) or ( not(ARow in [1..StringGrid1.RowCount-1] ));
end;

procedure TForm_Search.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  with StringGrid1 do
    if (acol = 1) and (arow in [1..RowCount-1]) then begin
      Canvas.Brush.Color := clAqua;
      Canvas.FrameRect(rect);
    end;
end;

procedure TForm_Search.BitBtn3Click(Sender: TObject);
var
  iCount: integer;
begin
  if QuerySearch.Active and (not QuerySearch.isempty) then begin
    GetData := True;//设定将资料取回,可以再加以处理
    for iCount := 0 to giSearchCount-1 do begin
      gsReturnString.add(vartostr(TQuery(DataSource1.dataset).fields[iCount].value));
    end;
    ModalResult := mrok;
  end;
end;

procedure TForm_Search.SetGetData(const Value: Boolean);
begin
  FGetData := Value;
end;


procedure TForm_Search.FormDestroy(Sender: TObject);
begin
    gsReturnString.free;
end;

end.

unit UnitData;

interface
uses Windows, Messages, SysUtils,Forms,Classes,IniFiles,DBCtrls,DBTables,
DB,DateUtils, Grids, DBGrids;

var
ini:TIniFile;
sPath:string;//系统路径
sWarrant:string;//用户权限
sOperator,sWorker:string;
sIme,sCompanyName,sCompanyPhone,sCompanyAddress:string;
//输入法、公司名称、公司电话、公司地址

    function Msgs(Msgs:string;Button:string='OK'):integer;
    //用于显示提示对话框
    //有很多默认的选项,可直接使用,便于录入
    //
    procedure CreateIni(str:string);
    procedure DestroyIni;
    // 获取汉字的拼音首字符,这个函数将用在GetPYIndexStr 中.
    function GetPYIndexChar(strChinese: string; bUpCase: Boolean = True): char;

    // 获取多个汉字的拼音首字符组成的字符串.
    function GetPYIndexStr(strChinese: string; bUpCase: Boolean = True): string;
    procedure ShowDetail(dbm:TObject);
    //显示DBEdit或DBMemo的内容
    procedure AddToItem(TableName,FindField:string;AddItem:TStrings;mClear:Boolean=true;Condition:string='NULL');
    //TableName要查字段所在的表,FindField所要加入到TSTrings里的字段,
    //Condition条件,可以不用,默认为'NULL'
    //
    function GetValue(TableName,FindField,ReturnField,FindString:string;Condition:string='NULL'):string;
    //根据指定的字符串从指定的表中将数据取出来
    //
    function GetStrId(mQuery:TObject;mFieldName:string):string;
    //用于根据所给字段名从查询中返回其值
    //
    procedure SetStrId(mQuery:TObject;mFieldName,mValue:string);
    //用于根据所给字段名(mFieldName)设置成所给出的值(mvalue)

    function ReturnWeek(dt:TDateTime):string;

implementation

uses UnitDetail, UnitDM;
//-----------------------------------------------------------
/////////////////////////////////////////////////////
//名称:   Msg
//功能:
//参数:Msg,所要显示提示信息
//     Button,按钮信息(表示对话框上有哪几个按钮,默认就只有OK按钮)
//返回值:表示用户按了哪个按钮
/////////////////////////////////////////////////////
function Msgs(Msgs:string;Button:string='OK'):integer;
var
    b:integer;
    Str:string;
begin
//用于显示提示对话框
//有很多默认的选项,可直接使用,便于录入

b:=0; //默认为OK按钮

if Button='OK' then  b:=MB_OK+MB_ICONWARNING;
if Button='OKCANCEL' then b:=MB_OKCANCEL+MB_ICONWARNING; //OK，CANCEL按钮
if Button='YESNO' then b:=MB_YESNO+MB_ICONWARNING;     //YES，NO 按钮

Str:=Msgs;

if Msgs='window' then Str:='窗体载入过程中发生错误。';
if Msgs='error' then Str:='发生未知错误。';

result:=Application.MessageBox(PChar(Str),'提示',b);
end;
//------------------------------------------------------------------------------
procedure CreateIni(str: string);
begin
ini:=TIniFile.Create(str);
end;
//------------------------------------------------------------------------------
procedure DestroyIni;
begin
ini.Free;
end;

//------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////
// 函数: GetPYIndexChar(strChinese: string;bUpCase: Boolean = True): char;
//
// 函数功能:获取汉字的拼音首字符.
// 例: GetPYIndexChar('程') 将返回'C'.
//
// 注意:对于多于一个汉字的输入(string类型)只有第一个有效,但不会产生错误
// 例如,GetPYIndexChar('程序')也将返回'C'.
//
// 第二个参数决定返回大写还是小写 , 缺省为大写 .
////////////////////////////////////////////////////////////////////////////
function GetPYIndexChar(strChinese: string;bUpCase: Boolean = True): char;
begin
// 根据汉字表中拼音首字符分别为“A”至“Z”的汉字内码范围，
// 要检索的汉字只需要检查它的内码位于哪一个首字符的范围内，
// 就可以判断出它的拼音首字符。
  case WORD(strChinese[1]) shl 8 + WORD(strChinese[2]) of
    $B0A1..$B0C4 : result := 'A';
    $B0C5..$B2C0 : result := 'B';
    $B2C1..$B4ED : result := 'C';
    $B4EE..$B6E9 : result := 'D';
    $B6EA..$B7A1 : result := 'E';
    $B7A2..$B8C0 : result := 'F';
    $B8C1..$B9FD : result := 'G';
    $B9FE..$BBF6 : result := 'H';
    $BBF7..$BFA5 : result := 'J';
    $BFA6..$C0AB : result := 'K';
    $C0AC..$C2E7 : result := 'L';
    $C2E8..$C4C2 : result := 'M';
    $C4C3..$C5B5 : result := 'N';
    $C5B6..$C5BD : result := 'O';
    $C5BE..$C6D9 : result := 'P';
    $C6DA..$C8BA : result := 'Q';
    $C8BB..$C8F5 : result := 'R';
    $C8F6..$CBF9 : result := 'S';
    $CBFA..$CDD9 : result := 'T';
    $CDDA..$CEF3 : result := 'W';
    $CEF4..$D188 : result := 'X';
    $D1B9..$D4D0 : result := 'Y';
    $D4D1..$D7F9 : result := 'Z';
    else
               result := char(0);
  end;
  if not bUpCase then
  begin // 转换为小写
    result := Chr(Ord(result)+32);
  end;
end;

////////////////////////////////////////////////////////////////////////////
// 函数: GetPYIndexStr(strChinese: string;bUpCase: Boolean = True): string;
//
// 函数功能:获取多个汉字的拼音首字符组成的字符串.
// 例: GetPYIndexStr('程') 将返回'C'.
//     GetPYIndexStr('程序')将返回'CX'.
//
// 第二个参数决定返回大写还是小写 , 缺省为大写 .
////////////////////////////////////////////////////////////////////////////
function GetPYIndexStr(strChinese: string;bUpCase: Boolean = True): string;
var
  strChineseTemp : string;
  cTemp : Char;
begin
  result := '';
  strChineseTemp := strChinese;
  while strChineseTemp<>'' do
  begin
    cTemp := GetPYIndexChar(strChineseTemp);
    if not bUpCase then
    begin // 转换为小写
      cTemp := Chr(Ord(cTemp)+32);
    end;
    result := result + string(cTemp);
    strChineseTemp := Copy(strChineseTemp,3,Length(strChineseTemp));
  end;
end;


//------------------------------------------------------------------------------
procedure ShowDetail(dbm:TObject);
begin
try
    frmDetail:=TfrmDetail.Create(nil);
    if dbm is TDBMemo then
    begin
        frmDetail.Caption:=TDBMemo(dbm).Field.DisplayName;
        frmDetail.DBMemo1.DataSource:=TDBMemo(dbm).DataSource;
        frmDetail.DBMemo1.DataField:=TDBMemo(dbm).DataField;
    end;
    if dbm is TDBEdit then
    begin
        frmDetail.Caption:=TDBEdit(dbm).Field.DisplayName;
        frmDetail.DBMemo1.DataSource:=TDBEdit(dbm).DataSource;
        frmDetail.DBMemo1.DataField:=TDBEdit(dbm).DataField;
    end;
    if dbm is TColumn then
    begin
        frmDetail.Caption:=TColumn(dbm).Field.DisplayName;
        frmDetail.DBMemo1.DataSource:=TColumn(dbm).Field.DataSet.DataSource;
        frmDetail.DBMemo1.DataField:=TColumn(dbm).FieldName;
    end;
    frmDetail.ShowModal;
    frmDetail.Free;
except
    Msgs('window');
    frmDetail.Free;
end;

end;

//------------------------------------------------------------------------------
//-----------------------------------------------------------
/////////////////////////////////////////////////////
//名称: AddToItem
//功能: 将一个表中某一字段的值全部保存到一个TStrings类型
//      的变量AddItem中去。
//参数: TableName要查字段所在的表,FindField所要加入到
//      TSTrings里的字段,
//      AddItem保存所有满足条件的FindField的值，
//      mClear是否清除AddItem，
//      Condition传递SQL中的WHERE条件,可以不用,默认为'NULL'
//
//返回值: 无
/////////////////////////////////////////////////////

procedure AddToItem(TableName, FindField: string; AddItem: TStrings;mClear:Boolean=true;Condition:string='NULL');
var
    s:string;
//    i:integer;
begin
if mClear then
    AddItem.Clear;

DM.Q_Any.Close;
DM.Q_Any.SQL.Clear;
DM.Q_Any.SQL.Add('SELECT DISTINCT '+FindField+' FROM '+TableName);
if Condition<>'NULL' then
    DM.Q_Any.SQL.Add(' WHERE '+ Condition);

DM.Q_Any.Open;

if DM.Q_Any.RecordCount<=0 then Exit; //表中没有数据记录就退出

while not DM.Q_Any.Eof do
begin
    s:='';
    //for i:=0 to DM.Q_Any.FieldCount-1 do
        s:=s+DM.Q_Any.Fields.Fields[0].AsString;
    if (s<>'') then  AddItem.Add(s);

    DM.Q_Any.Next;
end;
DM.Q_Any.Close;
end;
//-------------------------------------------------------------------
/////////////////////////////////////////////////////
//名称:GetValue
//功能: 从一个表中找出满足条件的一个字段值。
//参数:TableName要查字段所在的表,FindField要找的字段名,
//       ReturnField需要返回的字段名，
//     FindString要找的字段值，Condition传递SQL中的
//     WHERE条件,可以不用,默认为'NULL'
//返回值:''表示没有找到满足条件的值，否则就返回找到的值
/////////////////////////////////////////////////////
function GetValue(TableName,FindField,ReturnField,FindString: string;Condition:string='NULL'): string;
begin
DM.Q_Any.Close;
DM.Q_Any.SQL.Clear;
DM.Q_Any.SQL.Add('SELECT '+ReturnField+','+FindField+' FROM '+TableName+' WHERE ('+FindField+' = '''+FindString+''')');
if Condition<>'NULL' then
    DM.Q_Any.SQL.Add(' and ('+Condition+')');
DM.Q_Any.Open;
if DM.Q_Any.RecordCount=0 then  //没有满足条件的记录
begin
result:='';
end
else
begin
result:=DM.Q_Any.fields.Fields[0].AsString;
end;
DM.Q_Any.Close;
end;
//-----------------------------------------------------------
/////////////////////////////////////////////////////
//名称:GetStrId
//功能:得到字段名为 mFieldName的值
//参数: mQuery查询名，mFieldName字段名
//
//返回值: 字段的值
/////////////////////////////////////////////////////
function GetStrId(mQuery:TObject;mFieldName:string):string;
begin
if mQuery is TQuery then
    Result:=TQuery(mQuery).FieldByName(mFieldName).AsString;
if mQuery is TTable then
    Result:=TTable(mQuery).FieldByName(mFieldName).AsString;
if mQuery is TDataSource then
    Result:=TDataSource(mQuery).DataSet.FieldByName(mFieldName).AsString;

end;
//-----------------------------------------------------------
/////////////////////////////////////////////////////
//名称:SetStrId
//功能:设置字段名为 mFieldName的值
//参数: mQuery查询名，mFieldName字段名，mValue字段值
//
//返回值: 无
/////////////////////////////////////////////////////
procedure SetStrId(mQuery:TObject;mFieldName,mValue:string);
begin
if mQuery is TQuery then
begin
    if not (TQuery(mQuery).State in [dsEdit,dsInsert]) then Exit;
    TQuery(mQuery).FieldByName(mFieldName).AsString:=mValue;
end;
if mQuery is TDataSource then
begin
    if not (TDataSource(mQuery).DataSet.State in [dsEdit,dsInsert]) then Exit;
    TDataSource(mQuery).DataSet.FieldByName(mFieldName).AsString:=mValue;
end;
end;
//------------------------------------------------------------------------------
function ReturnWeek(dt:TDateTime):string;
var
    yy,wy,dy:word;
begin
    DecodeDateWeek(dt,yy,wy,dy);
    case dy of
        1:result:='星期一';
        2:result:='星期二';
        3:result:='星期三';
        4:result:='星期四';
        5:result:='星期五';
        6:result:='星期六';
        7:result:='星期天';
    end;
end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------


end.

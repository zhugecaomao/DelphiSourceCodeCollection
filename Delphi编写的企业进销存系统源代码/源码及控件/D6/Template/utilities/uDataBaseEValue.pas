unit uDataBaseEValue;

interface

uses utilities,uConstant,db,SysUtils,dbtables, controls, dbgrids, dbctrls, Variants;

var
  linFieldCheck: Boolean=false;

//==============================================================================
//                     Table EValue
//==============================================================================

// 检查所有的栏位 , 可在 Befor Post 时调用
procedure CheckFieldVal(Sender: TDataSet);

//当搜寻资料时,找不到资料,则显示讯息告告使用者,找不到资料,并传回True
function R_TableIsEmpty(DataSet: TDataSet): Boolean;

//==============================================================================
//                    TField EValue
//==============================================================================


//------------------------------------------------------------------------------
//function CheckUniqueKey 说明
//功能:检查是否有键值重覆或是该笔资料是否存在於资料库中
//叁数:
//      xDataSource : 传入要检查的资料集的datasource
//      sKeyName    : key值栏位值
//      sInputData  : 所输入的栏位值
//  传回值: 当是唯一时,传回True;
//          不是唯一时,传回False;
//------------------------------------------------------------------------------
function EValueUniqueKey(xDataSource: TDataSource; sKeyName : Array of string;
         sInputData : Array of string):boolean;

//检查栏位值是否为唯一值
procedure EValue_Unique(Sender: TField; xDataSource: TDataSource; sOriVal: string='');

//检查栏位值是否大於等於0
procedure EValueNumber(Sender: TField);

//检查是否有输入栏位值
procedure EValue_IsNotNull(Sender: TField; sDefVal: string='');

//------------------------------------------------------------------------------
//function EValue_ForeignKey_IsExist function 说明
//功能:检查某个栏位的值是否在於某个表格中,即ForeignKey 是否存在
//叁数:
//      Master_table : ForeignKey 所对应的资料表名称,可以是TTAble 或是 TQuery
//      Field        : ForeignKey 所对应到的栏位名称
//      Value        : 所要检测的值
//------------------------------------------------------------------------------

function EValue_ForeignKey_IsExist(Master_table:TDBDataSet;Field: string; value:variant): boolean;


//==============================================================================
//错误检查
//==============================================================================

//检查所输入的资料是否存在於主档中
procedure CheckIntegrity(E: EDatabaseError;sms: string);

//检查是不有重复KEY值
Procedure CheckKeyValue(E:EDatabaseError; sms: string='编号不可重复');

//检查是否有发生Required ERR
procedure CheckRequired(E:EDatabaseError; var Action: TDataAction);

//如果存在明细档则不能删除
Procedure CheckDetailExist(E:EDatabaseError;sms: string);

// 判断是否存在关联资料 - 用 SQL 语句判断
function ExistSglRelation(var xQry: TQuery; sSQL: string; lInfo: Boolean=True): Boolean;

// 判断是否存在关联资料 - 通过传入的表名及外部键栏位名判断
function ExistRelation(var xQry: TQuery; sVal: string; asRelTbNm, asRelFdNm: Array of string; lNum: Boolean=True; lInfo: Boolean=True): Boolean;



// fun : 若一笔资料存在关联资料,则不可删除或更改其键值
//function Pro_CheckIntegrity(xQry:TQuery; lEdt:boolean; KeyControl:TWinControl;
//         KeyField:TField; refMes,refTB,refFD: array of string):boolean;

function Pro_CheckIntegrity(xQry:TQuery; lEdt:boolean;
         KeyControl: array of TWinControl;
         KeyField: array of TField;
         refMes,refTB,refFD: array of string):boolean;

implementation


// 检查所有的栏位 , 可在 Befor Post 时调用
procedure CheckFieldVal(Sender: TDataSet);
var
  i: Integer;
  xEvent: TFieldNotifyEvent;
begin
  for i := 0 to Sender.FieldCount-1 do
    if Assigned(Sender.Fields[i].OnValidate) then
    begin
      xEvent := Sender.Fields[i].OnValidate;
      xEvent(Sender.Fields[i]);
    end;
end;


//检查所输入的栏位资料是否有重覆,(在作业的资料表中)
function EValueUniqueKey(xDataSource: TDataSource; sKeyName : Array of string;
         sInputData : Array of string):boolean;
var
  sQuery : string;
  iCount : integer;
  iKeyNameNum : integer;
  iInputNum : integer;
  TableName: string;
begin
  Result := True;
  iKeyNameNum := high(sKeyname);
  iInputNum := High(sInputData);
  if (xDataSource.DataSet is TTable) then
    TableName := TTable(xDataSource.DataSet).TableName
  else
  begin
   //M_OkMessage(['本作业目前只适用於TTable']);
    exit;
  end;

  sQuery := 'SELECT ';
  for iCount := 0 to iKeyNameNum do sQuery := sQuery + sKeyName[iCount] +', ';

  delete(sQuery,length(sQuery)-1,1);
  sQuery := sQuery+' FROM '+ TableName+' WHERE ';
  for iCount := 0 to iInputNum do
    sQuery := sQuery + skeyName[iCount] +'='''+sInputData[iCount]+'''and ';
  delete(sQuery,length(sQuery)-3,3);
  //showmessage(sQuery);
  with TQuery.Create(nil) do
    try
      DatabaseName := TDBDataSet(xDataSource.DataSet).DatabaseName;
      sql.add(sQuery);
      open;
      if IsEmpty then result := True else result := False;
    finally
      free;
    end;
end;

//检查栏位值是否为唯一值
procedure EValue_Unique(Sender: TField; xDataSource: TDataSource; sOriVal: string='');
begin
  if (Sender.IsNull) or (VarToStr(Sender.value)='') then
  begin
    R_OkMessage([Sender.DisplayName], rValue_isnotnull);
    abort;
  end;

  if (sOriVal <> '') then if (sOriVal = Sender.AsString) then exit;

  if not EValueUniqueKey(xDataSource ,[Sender.FieldName],[Sender.AsString]) then
  begin
    R_OkMessage([Sender.AsString],rValue_InvalidKey);
    abort;
  end;

end;


//检查栏位值是否大於等於0
procedure EValueNumber(Sender:TField);
begin
  if linFieldCheck then exit;
  if sender.IsNull or sender.Value <0 then
  begin
    R_OkMessage([sender.displayname],rValue_OverThanZero);
    linFieldCheck := True;
    Sender.FocusControl;
    linFieldCheck := False;
    abort;
  end;
end;


//检查是否有输入栏位值
procedure EValue_IsNotNull(Sender: TField; sDefVal: string='');
begin
  if linFieldCheck then exit;
  if (Sender.IsNull) or (varToStr(Sender.value)='') then
    if (sDefVal<>'') then
      Sender.AsString := sDefVal
    else
    begin
      R_OkMessage([Sender.DisplayName],rValue_isnotnull);
      linFieldCheck := True;
      Sender.FocusControl;
      linFieldCheck := False;
      abort;
    end;
end;


function EValue_ForeignKey_IsExist(Master_table:TDBDataSet;Field: string;value: variant): boolean;
begin
  Result := False;
  if Master_table.State in [dsEdit,dsInsert] then
  begin
    R_OkMessage(['检查KEY值是否存在主档中,您不能让资料表处於编修的状态']);
    exit;
  end;

  with Master_table do
  begin
    DisableControls;
    try
      if not VarIsNull(Lookup(Field,value,Field)) then
        Result := True;
    finally
      EnableControls;
    end;
  end;
end;

//==============================================================================
//                     资料表的检查
//==============================================================================
//当搜寻资料时,找不到资料,则显示讯息告告使用者,找不到资料,并传回false
function R_TableIsEmpty(DataSet: TDataSet): Boolean;
begin
  result := False;
  if DataSet.IsEmpty then
  begin
    R_OkMessage([rvalue_notFind]);
    Result := True;
  end;
end;

//==============================================================================
//错误检查
//==============================================================================

//检查是否有叁照到主档中,
procedure CheckIntegrity(E: EDatabaseError;sms: string);
begin
  if (E is EDBEngineError) then
    if (E as EDBEngineError).Errors[0].ErrorCode = rForeignKey then
    begin
      R_OkMessage([sms]);
      Abort;
    end;
end;

//检查是不有重复KEY值
Procedure CheckKeyValue(E:EDatabaseError; sms: string='编号不可重复');
begin
  if (E is EDBEngineError) then
    if (E as EDBEngineError).Errors[0].ErrorCode = rKeyViol then
    begin
      R_OkMessage([sms]);
      Abort;
    end;
end;

//检查是否有发生Required ERR
procedure CheckRequired(E:EDatabaseError; var Action: TDataAction);
begin
   if (E is EDBEngineError) then
    if (E as EDBEngineError).Errors[0].ErrorCode = rRequiredField then
    begin
      R_OkMessage(['asdf']);
      Action := daAbort;
    end;
end;

//如果存在明细档则不能删除
Procedure CheckDetailExist(E:EDatabaseError;sms: string);
begin
  if (E is EDBEngineError) then
    if (E as EDBEngineError).Errors[0].ErrorCode = rDetailExist then
    begin
      R_OkMessage([sms]);
      Abort;
    end;
end;


function ExistSglRelation(var xQry: TQuery; sSQL: string; lInfo: Boolean=True): Boolean;
begin
  Result := True;
  QryExec(xQry, sSQL);
  if (xQry.RecordCount<>0) then
  begin
    if lInfo then R_OkMessage(['该笔记录已存在关联资料, 不可再删除或修改']);
    exit;
  end;
  Result := False;
end;


function ExistRelation(var xQry: TQuery; sVal: string; asRelTbNm, asRelFdNm: Array of string; lNum: Boolean=True; lInfo: Boolean=True): Boolean;
var
  sSQL: string;
  i, iCnt: Integer;
begin
  Result := True;
  iCnt := Length(asRelTbNm);
  if iCnt=0 then begin Result := False; exit; end;

  for i := 0 to iCnt-1 do
  begin
    if lNum then
      sSQL := Format('SELECT %s FROM %s WHERE %s=%s', [asRelFdNm[i], asRelTbNm[i], asRelFdNm[i], sVal])
    else
      sSQL := Format('SELECT %s FROM %s WHERE %s=''%s''', [asRelFdNm[i], asRelTbNm[i], asRelFdNm[i], sVal]);
    QryExec(xQry, sSQL);
    if (xQry.RecordCount<>0) then
    begin
      if lInfo then R_OkMessage(['该笔记录已存在关联资料, 不可再删除或更新其编号']);
      exit;
    end;
  end;
  Result := False;
end;


//==============================================================================
// 错误检查2
// (以前各程式,如:CheckIntegrity 等,均为通过在资料库存已设定引用完成性等各种约束,
//  然后在 Table.PostError 事件中,根据触发错误类型来反馈各错误信息.
//  但后来设计时,都因资料库设变大而不直接在资料库中设置引用完成性等约束,
//  所以另写了以下程式作为引用完成性控制. 该控制在模组中调用  )
//==============================================================================

//---------------------------------
// fun : 若一笔资料存在关联资料,则不可删除或更改其键值
// 调用: DataSet 的 BeforeDelete 和 BeforeEdit 事件
// 叁数: xQry - 用于程式用执行 SQL 语句
//       lEdt - True: BeforeEdit; False: BeforeDelete
//       KeyControl - Key 栏位所关联的 DBEdit 或 DBGrid
//                    (因有多键值情况,所以此项为数组. 若为 DBGrid,则可只设一个元素即可)
//       KeyField - Key 栏位 (因有多键值情况,所以此项为数组)
//       refMes - 关联资料表中文名
//       refTB - 关联资料表名
//       refFD - 对应关联资料表的外部键栏位名 (若为多键值,用逗号分隔)
// 注  : 各数组必须按顺序一一对应
// 例1 : Pro_CheckIntegrity(Qry1, false, [DBEdit1], [Table1F01],
//           ['订单','出货单'],['T2010','T2160'],['F03','F03']);
// 例2 : Pro_CheckIntegrity(Qry1, true, [DBGrid1], [Table1F01, Table1F02],
//           ['订单','出货单'],['T2010A','T2160A'],['F03,F04','F03,F04']);
//---------------------------------
function Pro_CheckIntegrity(xQry:TQuery; lEdt:boolean;
         KeyControl: array of TWinControl;
         KeyField: array of TField;
         refMes,refTB,refFD: array of string):boolean;
var
  lExist: boolean;
  s: string;
  i, j: integer;
  aFDNm: array of string;
begin
  Result := False;
  // 若没有传入 refTB 的值, 则表示不用控制, 退出即可
  if Length(refTB[1]) = 0 then exit;

  // 若是在 BeforeEdit 时调用,则判断更改的是否是键值栏位,若不是, 退出
  if lEdt then
  begin
    lExist := true;
    // -若为键值关连的控制为 DBEdit, 则循环判断,若其上没有聚焦,
    //  则表示当前不是修改键值, 退出
    if KeyControl[0] is TDBEdit then
    begin
      for i := 0 to High(KeyControl) do
        if KeyControl[i].Focused then begin lExist:=false; break; end;
      if lExist then exit;
    end;
    // -若为键值关连的控制为 DBGrid,若该Grid 拥有焦点,
    //  且其当前选取的 Field 不为键值栏位, 退出
    if KeyControl[0] is TDBGrid then
    begin
      if not KeyControl[0].Focused then exit;
      for i := 0 to High(KeyField) do
        if TDBGrid(KeyControl[0]).SelectedField=KeyField[i] then
           begin lExist:=false; break; end;
      if lExist then exit;
    end;
  end;


  // 判断在关联的资料表中是否已存在资料
  for i := 0 to High(refTB) do
  begin
    SetLength(aFDNm, SubStrCnt(',',refFD[i]) + 1);
    GetStrArray(aFDNm, ',', refFD[i]);

    s := format('Select %s From %s Where %s="%s" ',
         [aFDNm[0],refTB[i],aFDNm[0],KeyField[0].AsString]);
    for j := 1 to High(aFDNm) do
      s := s + format(' AND %s="%s" ',[aFDNm[j],KeyField[j].AsString]);

    QryExec(xQry,s);
    if xQry.RecordCount>0 then
    begin
      R_OKMessage([refMes[i]],'该笔记录在"%s"中已存在关联资料,'#13#13'不允许再删除或更改其关键栏位值!');
      Result := false;
      abort;
    end;
  end;

end;


end.

unit Common;

interface

uses BDE, Windows, Dialogs, SysUtils, DBCtrls, DB, DBGrids, DBTables, Grids,
  stdctrls,clipbrd, menus,comctrls,Forms, Messages, Classes, Graphics, Controls,
  ExtCtrls, ImgList, ToolWin, Mask, Buttons, DBClient, syncobjs, dbcgrids, Variants ;

type
	cdsEventsRecord = record
		re: TRemoteEvent;
		ne: TDataSetNotifyEvent;
		ee: TDataSetErrorEvent;
		fe: TFilterRecordEvent;
		ce: TReconcileErrorEvent;
	end;
cdsEventsArray = array[1..20] of cdsEventsRecord;

{ 网格 }
Function  ChangeCol(Const DBGrid:TDBGrid; var Key:Word):integer; 	//用回车改变DBGrid内输入焦点
Procedure DBGridAlign(DBGrid:TDBGrid;Align: TAlignment;Rect:TRect;Text:String); 	//自画网格
Procedure GridTextRect(Grid:TWinControl; Align: TAlignment; Rect:TRect; Text:String);
function  GetColumnByName(Grid:TDBGrid; FieldName:string):TColumn;//由字段名得出DBGRID的Column
Function  FindField(Data:TDataset;Str:String):TField;  //按displaylabel查找字段
{ SQL }
function SetFieldValue(strSql:string; Ds: TDataSet; strFields: string; blnFill: Boolean = False):boolean;
 //传递SQL语句，对指定DATASET的指定字段赋值，有记录返回真值，无记录返回假值
procedure SqlExec(strSql: string);  //执行SQL语句
function  CheckRecord(strSql: string):Boolean;  //检查是否有符合条件的记录
function  FieldsValueToStr(DataSet: TDataSet; strFields: string): string;  //将字段的值替换出来，像宏替换一样
function  HaveDetail(DataSet: TDataSet; strTables, strWheres: string): boolean;  //检查是否有明细记录
function  GetFieldValue(strSql: string):Variant;  //返回sql语句的字段值（一个）
function  SaveCDSEvents(ds: TClientDataSet): cdsEventsArray;  //保存CLIENTDATASET的事件
procedure RestoreCDSEvents(ds: TClientDataSet; e: cdsEventsArray);  //恢复CLIENTDATASET的事件
procedure ClearCDSEvents(ds: TClientDataSet);  //清除CLIENTDATASET的事件
function  CurDs: TClientDataSet;  //返回一个可用的clientdataset
function  ComReconcileError(DataSet: TClientDataSet; UpdateKind: TUpdateKind;
          E: EReconcileError): TReconcileAction;//存盘出错处理

{ 取系统信息 }
function  GetComputerName: AnsiString;  //取本机的计算机名称

var
  dsTmpArr: array of TClientDataSet;

implementation

uses
	Dm, Main, ComFun;

//剪切DBGRID或DBEDIT的内容
procedure MCut;
Begin
  if Screen.ActiveControl is TDBGrid then
  begin
    If not ( dgRowSelect In TDBGrid( Screen.ActiveControl ).Options ) and
       not ( TDBGrid( Screen.ActiveControl ).Readonly ) Then
    Begin
      ClipBoard.AsText := TDBGrid( Screen.ActiveControl ).SelectedField.AsString;
      TDBGrid( Screen.ActiveControl ).DataSource.DataSet.Edit;
      TDBGrid( Screen.ActiveControl ).SelectedField.Clear;
		end;
  end else if Screen.ActiveControl is TDBEdit then
  begin
    If not ( TDBEdit( Screen.ActiveControl ).Readonly ) Then
    Begin
      TDBEdit( Screen.ActiveControl ).CutToClipboard;
      TDBEdit( Screen.ActiveControl ).SelText := '';
    end;
  end;
end;

//复制DBGRID或DBEDIT的内容
procedure MCopy;
Begin
  if Screen.ActiveControl is TDBGrid then
    ClipBoard.AsText := TDBGrid( Screen.ActiveControl ).SelectedField.AsString
  else if Screen.ActiveControl is TDBEdit then
    TDBEdit( Screen.ActiveControl ).CopyToClipboard;
end;

//粘贴DBGRID或DBEDIT的内容
procedure Mpaste;
Begin
	if Screen.ActiveControl is TDBGrid then
  begin
    If not ( dgRowSelect In TDBGrid( Screen.ActiveControl ).Options ) and
       not ( TDBGrid( Screen.ActiveControl ).Readonly ) Then
    Begin
			TDbGrid( Screen.ActiveControl ).DataSource.DataSet.Edit;
			TDbGrid( Screen.ActiveControl ).SelectedField.AsString := Clipboard.AsText;
    end;
  end
  else if Screen.ActiveControl is TDBEdit then
  begin
    If not ( TDBEdit( Screen.ActiveControl ).Readonly ) Then
    Begin
      TDBEdit( Screen.ActiveControl ).DataSource.DataSet.Edit;
      TDBEdit( Screen.ActiveControl ).PasteFromClipboard;
		end;
  end
end;


//用回车改变DBGrid内输入焦点
Function ChangeCol(Const DBGrid:TDBGrid; var Key:Word):integer;
var
  EndCol:Integer;
	flag1 : boolean;
begin
  EndCol:=DBGrid.Columns.Count-1;
  Flag1 := false;
  if Key= vk_Return then
  begin
    Key:=0;
//    If not ( Dbgrid.EditorMode ) Then
//      Dbgrid.editormode := True
//    else
		Begin
      with DBGrid.DataSource.DataSet do
      begin
         if DBGrid.SelectedIndex<>EndCol then
         Begin
           DBGrid.SelectedIndex:=DBGrid.SelectedIndex+1;
           While ( DBGrid.SelectedIndex < EndCol )
             and ( Dbgrid.Columns[dbgrid.SelectedIndex].readonly ) Do
             DBGrid.SelectedIndex:=DBGrid.SelectedIndex+1;
					 If ( DBGrid.SelectedIndex = EndCol )
             and ( Dbgrid.Columns[dbgrid.SelectedIndex].readonly ) then
             flag1 := True;
//           else
//             Dbgrid.editormode := True;
         end else
           Flag1 := True;
         If Flag1 Then
         begin
            Next;
						if not Eof then
            begin
              DBGrid.SelectedIndex:=0;
            end else
            begin
              Dbgrid.datasource.DataSet.Append;
              DBGrid.SelectedIndex:=0;
            end;
         end;
			end;
    end;
  end;
  Result:=0;
end;

//自画网格
Procedure DBGridAlign(DBGrid:TDBGrid; Align: TAlignment; Rect:TRect; Text:String);
begin
  with DBGrid.Canvas,Rect do
	begin
    Case Align of
      taLeftJustify:
        TextRect(Rect,2+Left,Top+(Bottom-Top-TextHeight(Text)) div 2 ,Text);
      taRightJustify:
        TextRect(Rect,Right-TextWidth(Text)-2,Top+(Bottom-Top-TextHeight(Text)) div 2 ,Text);
			taCenter:
        TextRect(Rect,Left+(Right-Left-TextWidth(Text)) div 2,Top+(Bottom-Top-TextHeight(Text)) div 2,Text);
    end;
	end;
end;

Procedure GridTextRect(Grid:TWinControl; Align: TAlignment; Rect:TRect; Text:String);
begin
  if Grid is TDBGrid then
  begin
    with TDBGrid(Grid).Canvas, Rect do
    begin
      Case Align of
        taLeftJustify:
          TextRect(Rect,2+Left,Top+(Bottom-Top-TextHeight(Text)) div 2 ,Text);
        taRightJustify:
          TextRect(Rect,Right-TextWidth(Text)-2,Top+(Bottom-Top-TextHeight(Text)) div 2 ,Text);
        taCenter:
          TextRect(Rect,Left+(Right-Left-TextWidth(Text)) div 2,Top+(Bottom-Top-TextHeight(Text)) div 2,Text);
      end;
    end;
  end else
  if Grid is TStringGrid then
  begin
    with TStringGrid(Grid).Canvas, Rect do
    begin
      Case Align of
        taLeftJustify:
          TextRect(Rect,2+Left,Top+(Bottom-Top-TextHeight(Text)) div 2 ,Text);
        taRightJustify:
          TextRect(Rect,Right-TextWidth(Text)-2,Top+(Bottom-Top-TextHeight(Text)) div 2 ,Text);
        taCenter:
          TextRect(Rect,Left+(Right-Left-TextWidth(Text)) div 2,Top+(Bottom-Top-TextHeight(Text)) div 2,Text);
      end;
    end;
  end else
  if Grid is TDBCtrlGrid then
  begin
    with TDBCtrlGrid(Grid).Canvas, Rect do
    begin
      Case Align of
        taLeftJustify:
          TextRect(Rect,2+Left,Top+(Bottom-Top-TextHeight(Text)) div 2 ,Text);
        taRightJustify:
          TextRect(Rect,Right-TextWidth(Text)-2,Top+(Bottom-Top-TextHeight(Text)) div 2 ,Text);
        taCenter:
          TextRect(Rect,Left+(Right-Left-TextWidth(Text)) div 2,Top+(Bottom-Top-TextHeight(Text)) div 2,Text);
      end;
    end;
  end;
end;

//由字段名得出DBGRID的Column
function  GetColumnByName(Grid:TDBGrid; FieldName:string):TColumn;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Grid.Columns.Count - 1 do
  begin
    if UpperCase(Grid.Columns[i].FieldName) = UpperCase(FieldName) then
    begin
      Result := Grid.Columns[i];
      exit;
    end;
  end;
end;

//按displaylabel查找字段
function FindField(Data:TDataset;Str:String):TField;
var
  i:integer;
begin
  Result:= nil;
	for i:=0 To Data.Fieldcount-1 Do
	if Data.Fields[i].DisplayLabel = Str Then
	begin
		Result := Data.Fields[i];
		Break;
	end;
end;

//传递SQL语句，对指定DATASET的指定字段赋值
//strSql:SQL语句;
//Ds:要赋值的DATASET；
//strFields:要赋值的字段列表，用';'分开
//blnFill: 逻辑型参数（默认为False），当为True时无记录即对字段列表均赋空值
//有记录返回真值，无记录返回假值
function SetFieldValue(strSql:string; Ds: TDataSet; strFields: string; blnFill: Boolean = False):boolean;
var
  strFieldName: string;
  i: integer;
  dsTmp: TCLientDataSet;
begin
  dsTmp := CurDs;
  with dsTmp do
  begin
    CommandText := strSql;
    Open;
    if IsEmpty then
    begin
      if blnFill then
        while strFields <> '' do
        begin
          if Pos(';', strFields) <> 0 then
          begin
            strFieldName := copy(strFields, 1, Pos(';', strFields)-1);
            strFields := copy(strFields, Pos(';', strFields)+1, length(strFields));
          end else
          begin
            strFieldName := strFields;
            strFields := '';
          end;
          if not (ds.State in [Dsinsert,Dsedit]) then
            ds.Edit;
          if ds.FieldByName(strFieldName) is TNumericField then
            ds.FieldByName(strFieldName).Value := 0;
          if ds.FieldByName(strFieldName) is TStringField then
            ds.FieldByName(strFieldName).Value := '';
        end;
      Close;
      Result := False;
      exit;
    end;
  end;
	i := 0;
  while strFields <> '' do
  begin
		if Pos(';', strFields) <> 0 then
    begin
      strFieldName := copy(strFields, 1, Pos(';', strFields)-1);
			strFields := copy(strFields, Pos(';', strFields)+1, length(strFields));
    end else
    begin
			strFieldName := strFields;
      strFields := '';
    end;
    if not (ds.State in [Dsinsert,Dsedit]) then
      ds.Edit;
    ds.FieldByName(strFieldName).Value := dsTmp.Fields[i].Value;
    inc(i);
  end;
  dsTmp.Close;
  Result := True;
end;

//执行SQL语句
procedure SqlExec(strSql: string);
begin
  with CurDs do
	begin
    CommandText := strSql;
    Execute;
    Close;
  end;
end;

//检查是否有符合条件的记录
function CheckRecord(strSql: string):Boolean;
begin
  with CurDs do
	begin
    CommandText := strSql;
    Open;
    Result := not IsEmpty;
    Close;
  end;
end;

//将字段的值替换出来，像宏替换一样
function FieldsValueToStr(DataSet: TDataSet; strFields: string): string;
var
  strFields1, strFields2, strField: string;
begin
  strFields1 := strFields;
  strFields2 := '';
	while strFields1 <> '' do
  begin
		if Pos('[', strFields1) <> 0 then
    begin
      strFields2 := strFields2 + copy(strFields1, 1, Pos('[', strFields1)-1);
      strField := copy(strFields1, Pos('[', strFields1)+1, Pos(']', strFields1)-Pos('[', strFields1)-1);
      if DataSet.FieldByName(strField) is TStringField then
        strFields2 := strFields2 + '''' + DataSet.FieldByName(strField).AsString + ''''
      else if (DataSet.FieldByName(strField) is TNumericField) or
              (DataSet.FieldByName(strField) is TBooleanField) then
        strFields2 := strFields2 + Float2Str(DataSet.FieldByName(strField).AsFloat)
      else if (DataSet.FieldByName(strField) is TDateTimeField) then
      begin
        if pDataBaseType = 'SERVER' then
          strFields2 := strFields2 + '''' + DataSet.FieldByName(strField).AsString + ''''
        else
          strFields2 := strFields2 + '#' + DataSet.FieldByName(strField).AsString + '#';
      end else
        strFields2 := strFields2 + DataSet.FieldByName(strField).Value;
      strFields1 := copy(strFields1, Pos(']', strFields1)+1, length(strFields1));
    end else
    begin
      strFields2 := strFields2 + strFields1;
			strFields1 := '';
		end;
  end;
  result := strFields2;
end;

//检查是否有明细记录
function HaveDetail(DataSet: TDataSet; strTables, strWheres: string): boolean;
var
  strTable, strWhere, strWhere1: string;
begin
	if (strTables = null) or (strTables = '') then
  begin
    Result := False;
		exit;
  end;
  Result := False;
  strWheres := FieldsValueToStr(DataSet, strWheres);
	while strTables <> '' do
  begin
		if Pos(';', strTables) <> 0 then
    begin
      strTable := copy(strTables, 1, Pos(';', strTables)-1);
      strTables := copy(strTables, Pos(';', strTables)+1, length(strTables));
    end else
    begin
      strTable := strTables;
			strTables := '';
		end;
    if Pos(';', strWheres) <> 0 then
    begin
			strWhere1 := copy(strWheres, 1, Pos(';', strWheres)-1);
      if strWhere1 <> '' then
        strWhere := strWhere1;
			strWheres := copy(strWheres, Pos(';', strWheres)+1, length(strWheres));
		end else
    if strWheres <> '' then
		begin
      strWhere := strWheres;
      strWheres := '';
    end;
    with CurDs do
    begin
      CommandText := 'select count(*) from ' + strTable + ' where ' + strWhere;
      Open;
			if Fields[0].AsFloat > 0 then
			begin
        Close;
        Result := True;
        exit;
			end;
      Close;
    end;
  end;
end;

//返回sql语句的字段值（一个）
function GetFieldValue(strSql: string):Variant;
begin
  with CurDs do
  begin
		CommandText := strSql;
		Open;
		if not IsEmpty then
			Result := Fields[0].Value
		else
    begin
      if Fields[0] is TStringField then
        Result := ''
      else if (Fields[0] is TNumericField) or
              (Fields[0] is TBooleanField) then
        Result := 0
      else
  			Result := null;
    end;
		Close;
	end;
end;

//保存CLIENTDATASET的事件
function SaveCDSEvents(ds: TClientDataSet): cdsEventsArray;
begin
	Result[ 1].ne := ds.AfterCancel;
	Result[ 2].ne := ds.AfterClose;
	Result[ 3].ne := ds.AfterDelete;
	Result[ 4].ne := ds.AfterEdit;
	Result[ 5].ne := ds.AfterInsert;
	Result[ 6].ne := ds.AfterOpen;
	Result[ 7].ne := ds.AfterPost;
	Result[ 8].ne := ds.AfterRefresh;
	Result[ 9].ne := ds.AfterScroll;
	Result[10].ne := ds.BeforeCancel;
	Result[11].ne := ds.BeforeClose;
	Result[12].ne := ds.BeforeDelete;
	Result[13].ne := ds.BeforeEdit;
	Result[14].ne := ds.BeforeInsert;
	Result[15].ne := ds.BeforeOpen;
	Result[16].ne := ds.BeforePost;
	Result[17].ne := ds.BeforeRefresh;
	Result[18].ne := ds.BeforeScroll;
	Result[19].ne := ds.OnCalcFields;
	Result[20].ne := ds.OnNewRecord;
	Result[ 1].re := ds.AfterApplyUpdates;
	Result[ 2].re := ds.AfterExecute;
	Result[ 3].re := ds.AfterGetParams;
	Result[ 4].re := ds.AfterGetRecords;
	Result[ 5].re := ds.AfterRowRequest;
	Result[ 6].re := ds.BeforeApplyUpdates;
	Result[ 7].re := ds.BeforeExecute;
	Result[ 8].re := ds.BeforeGetParams;
	Result[ 9].re := ds.BeforeGetRecords;
	Result[10].re := ds.BeforeRowRequest;
	Result[ 1].ee := ds.OnDeleteError;
	Result[ 2].ee := ds.OnEditError;
	Result[ 3].ee := ds.OnPostError;
	Result[ 1].fe := ds.OnFilterRecord;
	Result[ 1].ce := ds.OnReconcileError;
end;

//恢复CLIENTDATASET的事件
procedure RestoreCDSEvents(ds: TClientDataSet; e: cdsEventsArray);
begin
	ds.AfterCancel   := e[ 1].ne;
	ds.AfterClose    := e[ 2].ne;
	ds.AfterDelete   := e[ 3].ne;
	ds.AfterEdit     := e[ 4].ne;
	ds.AfterInsert   := e[ 5].ne;
	ds.AfterOpen     := e[ 6].ne;
	ds.AfterPost     := e[ 7].ne;
	ds.AfterRefresh  := e[ 8].ne;
	ds.AfterScroll   := e[ 9].ne;
	ds.BeforeCancel  := e[10].ne;
	ds.BeforeClose   := e[11].ne;
	ds.BeforeDelete  := e[12].ne;
	ds.BeforeEdit    := e[13].ne;
	ds.BeforeInsert  := e[14].ne;
	ds.BeforeOpen    := e[15].ne;
	ds.BeforePost    := e[16].ne;
	ds.BeforeRefresh := e[17].ne;
	ds.BeforeScroll  := e[18].ne;
	ds.OnCalcFields  := e[19].ne;
	ds.OnNewRecord   := e[20].ne;
	ds.AfterApplyUpdates  := e[ 1].re;
	ds.AfterExecute       := e[ 2].re;
	ds.AfterGetParams     := e[ 3].re;
	ds.AfterGetRecords    := e[ 4].re;
	ds.AfterRowRequest    := e[ 5].re;
	ds.BeforeApplyUpdates := e[ 6].re;
	ds.BeforeExecute      := e[ 7].re;
	ds.BeforeGetParams    := e[ 8].re;
	ds.BeforeGetRecords   := e[ 9].re;
	ds.BeforeRowRequest   := e[10].re;
	ds.OnDeleteError := e[ 1].ee;
	ds.OnEditError   := e[ 2].ee;
	ds.OnPostError   := e[ 3].ee;
	ds.OnFilterRecord := e[ 1].fe;
	ds.OnReconcileError := e[ 1].ce;
end;

procedure ClearCDSEvents(ds: TClientDataSet);
begin
	ds.AfterCancel   := nil;
	ds.AfterClose    := nil;
	ds.AfterDelete   := nil;
	ds.AfterEdit     := nil;
	ds.AfterInsert   := nil;
	ds.AfterOpen     := nil;
	ds.AfterPost     := nil;
	ds.AfterRefresh  := nil;
	ds.AfterScroll   := nil;
	ds.BeforeCancel  := nil;
	ds.BeforeClose   := nil;
	ds.BeforeDelete  := nil;
	ds.BeforeEdit    := nil;
	ds.BeforeInsert  := nil;
	ds.BeforeOpen    := nil;
	ds.BeforePost    := nil;
	ds.BeforeRefresh := nil;
	ds.BeforeScroll  := nil;
	ds.OnCalcFields  := nil;
	ds.OnNewRecord   := nil;
	ds.AfterApplyUpdates  := nil;
	ds.AfterExecute       := nil;
	ds.AfterGetParams     := nil;
	ds.AfterGetRecords    := nil;
	ds.AfterRowRequest    := nil;
	ds.BeforeApplyUpdates := nil;
	ds.BeforeExecute      := nil;
	ds.BeforeGetParams    := nil;
	ds.BeforeGetRecords   := nil;
	ds.BeforeRowRequest   := nil;
	ds.OnDeleteError := nil;
	ds.OnEditError   := nil;
	ds.OnPostError   := nil;
	ds.OnFilterRecord := nil;
	ds.OnReconcileError := nil;
end;

//取计算机名称
function GetComputerName: AnsiString;
var lpBuffer: array[0..MAX_PATH] of char;
    dwSize: DWORD;
begin
  dwSize:= MAX_PATH;
  if not Windows.GetComputerName(lpBuffer, dwSize) then
    raise Exception.Create(SysErrorMessage(GetLastError()));
  Result:= StrPas(lpBuffer);
end;

//返回一个可用的临时clientdataset
function CurDs: TClientDataSet;
var
  i : integer;
begin
  for i := 0 to High(dsTmpArr) do
    if not dsTmpArr[i].Active then
      Break;
  if (High(dsTmpArr) = -1) then
    i := 0;
  if (i > high(dsTmpArr)) then
  begin
    SetLength(dsTmpArr, i+1);
    dsTmpArr[i] := TClientDataSet.Create(dm.Data);
    dsTmpArr[i].RemoteServer := Data.Tmp.RemoteServer;
    dsTmpArr[i].ProviderName := Data.Tmp.ProviderName;
    dsTmpArr[i].Name := 'TMP' + IntToStr(i);
  end;
  Result := dsTmpArr[i];
end;

//存盘出错处理
function  ComReconcileError(DataSet: TClientDataSet; UpdateKind: TUpdateKind;
          E: EReconcileError): TReconcileAction;
var
  strErr: string;
begin
  if pos('Record changed by another user',E.Message) <> 0 then
    strErr := '记录正被其他用户使用!'
  else if pos('duplicate values',E.Message) <> 0 then
    strErr := '已有重复资料!'
  else
    strErr := E.Message;
  if Application.MessageBox(Pchar(strErr + ' 重试？'), '存盘错误', MB_YESNO + MB_ICONERROR) = idYes then
    Result := raRefresh
  else
    Result := raAbort;
end;

end.


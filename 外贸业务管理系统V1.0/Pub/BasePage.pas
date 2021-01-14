{***************************************
  Copyright (C) 阳光工作室 版权所有。
  文 件 名：BasePage.pas
  版	  本：ver 1.00.00
  创建标识：2006-12-28   林毅祥   创建
  功能说明：基础类
  注意事项：
  更新记录：
****************************************}

unit BasePage;

interface
Uses
  IniFiles, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Db, ADODB, DBTables, Grids, ExtCtrls, Mask, Spin, DBGrids,
  CheckLst, ShellAPI, Menus, jpeg;
Const
   IniFileName = 'SYS.ini';
   var

    VerNo, Company, SysName, FactName, SystemFilePath, UIFormStyle: String;     {版本号}{Sys公司名}{系统名}{公司名}  {初始路径}
    DbName, ServerName, User_ID, User_Name, Login_Name, Pass_Word, Pope_Value, User_Unit : String;   {数据库}{服务器名}  {登录帐号}

  function GetFileCFG(const ParaFileName, Sec_Key,Ide_Key : string) : string;

  function WriteFileCFG(const paraFileName,sec_key,ide_key : string;value:string) : String;


  function Get_MC(Value: string; FlagChar: Char = '|'): string;
 
   function Get_DM(Value: string; FlagChar: Char = '|'): string;

  function FillItems(Sender: TComboBox; const TableName, FLBZ: string;
    Condition: string = '';dm : string ='DM';mc : string ='DMMC';
    FieldLen : Integer = 10): boolean;

  function FillItems1(Sender: TComboBox; TableName : string; FieldStr : string='code,name';
      Condition: string = ''; OrderBy : String = 'Order By code';
      FieldLen : Integer = 8): boolean;
  Function SpaceLen(Len : Integer) : String;{设定空格的宽度}

  function StrToFloatDef(Value: string; DefaultValue: real = 0;
    ShowInfo: boolean = false): Extended;
  Function FindFullName(Combo: TComboBox) : Boolean;

  Procedure SumData(StrGrid : TStringGrid; SG_SL, SG_JE : integer;
      var nCount : integer; var nSL, nJE : Real); {统计合计数据}

  function strtostrdel(value:string):string;  //去掉字值中的“，”，以便于相加；

  function FillItems2(Sender: TComboBox; TableName : string; FieldStr : string='code';
      Condition: string = ''; OrderBy : String = 'Order By code';
      FieldLen : Integer = 8): boolean;
  function DoSql(sqlstr:string):integer;
  function DoSql_Select(sqlstr:string):integer;
  function GetOneValue(sqlstr:string):string;
  function Get_Query(var Query:TADOQuery; sqlstr:string):boolean;
  function GetMaxValue(sqlstr:string):integer;

  function keypre(key:char):char;
  function findusername(fieldname:string):string;
  procedure findselectname(combo:TComboBox;fields:string);
  procedure setmenu(query1:tquery;name1:string;menucount:integer;mm1:TMainMenu);
  procedure setright(query1:tquery;name1,menuname:string;sb1,sb2,sb3,sb4,sb0:tspeedbutton);
  procedure setright1(query1:tquery;name1,menuname:string;bb1,bb2,bb3,bb4:TBitBtn);
  procedure setplay(sb:tspeedbutton;st:TStatusBar);
  function queryQ(strgrid:TStringGrid;str:string;strcol,strrow:integer):boolean;
  Procedure insert_row_before(StringGrid:TStringGrid; Const nRow : integer=0);
  procedure insert_row_after(StringGrid:TStringGrid);
  procedure delete_row_current(stringgrid:Tstringgrid);
  procedure clear_row_all(StringGrid:TStringGrid; StartCol : Integer = 1);
  procedure Delete_Row(StringGrid : TStringGrid; CurRow : Integer);
  procedure JpgToBmp(const JpgFileName:string;AJpg:TJpegImage;Abmp:Tbitmap);
  function  IsJpgFile(const FileName:string):boolean;
  function  IsBmpFile(const FileName:string):boolean;

  function  ReplaceStr(str:string):string;
  function  WriteLog(str:string):boolean;
implementation

uses DataModule;
//执行SQL语名,返回N行.
function DoSql(sqlstr:string):integer;
begin
  with DataModule_frm.ProcQuery do
  begin
    Close();
    Sql.Clear();
    SQL.Add(sqlstr);
    try
      result :=ExecSQL();
    except
      writelog(sqlstr);
      result :=-1;
    end;
  end;
end;

function DoSql_Select(sqlstr:string):integer;
begin
  with DataModule_frm.ProcQuery do
  begin
    Close();
    Sql.Clear();
    SQL.Add(sqlstr);
    try
      Open();
      result :=RecordCount;
    except
      ON E:Exception do
      begin
        WriteLog('-SQL语句出错'+E.Message);
        result :=-1;
      end;
    end;
  end;
end;

function Get_Query(var Query:TADOQuery; sqlstr:string):boolean;
begin
  with Query do
  begin
    close;
    SQL.Clear;
    SQL.Add(sqlstr);
    try
      Open;
      result :=true;
    except
      result :=false;
    end;
  end;
end;

function GetOneValue(sqlstr:string):string;
begin
  with DataModule_frm.ProcQuery do
  begin
    Close();
    Sql.Clear();
    SQL.Add(sqlstr);
    try
      Open();
      if RecordCount>0 then 
      begin
         result :=fields[0].AsString;
      end;
    except
      result :='';
    end;
  end;
end;

function GetMaxValue(sqlstr:string):integer;
begin
  with DataModule_frm.ProcQuery do
  begin
    Close();
    Sql.Clear();
    SQL.Add(sqlstr);
    try
      Open();
      if RecordCount>0 then 
      begin
         result :=fields[0].AsInteger;
      end;
    except
      result :=0;
    end;
  end;
end;

function keypre(key:char):char;
begin
    if ((ord(key)>57) or ((ord(key)<48)and (ord(key)>8)) or (ord(key)<8)) and (ord(key)<>13)and(ord(key)<>46) then
        begin
        application.MessageBox('对不起，只能输入数字','提示信息',mb_ok+mb_iconinformation);
        key:=chr(0);
        result:=key;
        exit;
        end;
    result:=key;

end;

function findusername(fieldname:string):string;
var str:string;
begin
  {with DataModule_frm.findnamecode do
  begin
    close;
    sql.Clear ;
    sql.Add('select epleoocode,epleooname from t_epleoo where epleoocode='''+fieldname+''' ' );
    open;
    if not isempty then
    begin
      result:=fields[1].AsString ;
    end;
  end;  }
end;

procedure Delete_Row(StringGrid : TStringGrid; CurRow : Integer);
var v_row,v_col,c_row:integer;
begin
     c_row:=CurRow;
     if c_row=stringgrid.rowcount-1 then
     begin
          for v_col:=0 to stringgrid.colcount-1 do
              stringgrid.cells[v_col,c_row]:='';
          exit;
     end;
     if (c_row<1) or (c_row>stringgrid.rowcount-1) then exit;
     for v_row:=c_row to stringgrid.rowcount-2 do
     begin
          for v_col:=0 to stringgrid.colcount-1 do
              stringgrid.cells[v_col,v_row]:=stringgrid.cells[v_col,v_row+1]
     end;
     v_row:=stringgrid.rowcount-1;
     for v_col:=0 to stringgrid.colcount-1 do
         stringgrid.cells[v_col,v_row]:='';
     stringgrid.rowcount:=stringgrid.rowcount-1;
     stringgrid.col:=1;
     StringGrid.Refresh;
end;

Procedure insert_row_before(StringGrid:TStringGrid; Const nRow : integer=0);
var
  v_row, v_col, c_row : integer;
begin
    With StringGrid do
    begin
        if nRow = 0 Then c_row:= Row
        Else c_row := nRow;
        RowCount := RowCount + 1;
        if (c_row < 1) or (c_row > RowCount-1) then exit;

        v_row := RowCount-1;
        While 1=1 do
        begin
            for v_col:=0 to ColCount-1 do Cells[v_col,v_row] := Cells[v_col,v_row-1];
            v_row := v_row - 1;
            if v_row=c_row then break;
        end;
        for v_col := 0 to ColCount-1 do Cells[v_col,c_row]:='';
        Row := c_row;
        Col := 1;
        Refresh;
    end;
end;

procedure insert_row_after(StringGrid:TStringGrid);
var
  v_row, v_col, c_row : integer;
begin
    With StringGrid do
    begin
        c_row := Row + 1;
        RowCount := RowCount+1;
        if (c_row < 1) or (c_row > RowCount-1) then exit;
        if c_row = RowCount-1 then exit;

        v_row:= RowCount - 1;
        while 1=1 do
        begin
            for v_col := 0 to ColCount-1 do Cells[v_col,v_row] := Cells[v_col,v_row-1];
            v_row:=v_row-1;
            if v_row=c_row then break;
       end;
       for v_col := 0 to ColCount-1 do Cells[v_col,c_row]:='';
       Row := c_row;
       Col := 1;
       Refresh;
    end;
end;

procedure delete_row_current(stringgrid:Tstringgrid);
var v_row,v_col,c_row:integer;
begin
     c_row:=stringgrid.row;
     if c_row=stringgrid.rowcount-1 then
     begin
          for v_col:=0 to stringgrid.colcount-1 do
              stringgrid.cells[v_col,c_row]:='';
          exit;
     end;
     if (c_row<1) or (c_row>stringgrid.rowcount-1) then exit;
     for v_row:=c_row to stringgrid.rowcount-2 do
     begin
          for v_col:=0 to stringgrid.colcount-1 do
              stringgrid.cells[v_col,v_row]:=stringgrid.cells[v_col,v_row+1]
     end;
     v_row:=stringgrid.rowcount-1;
     for v_col:=0 to stringgrid.colcount-1 do
         stringgrid.cells[v_col,v_row]:='';
     stringgrid.rowcount:=stringgrid.rowcount-1;
     stringgrid.col:=1;
     StringGrid.Refresh;
end;

procedure clear_row_all(StringGrid:TStringGrid; StartCol : Integer = 1);
var
  i, j:integer;
begin
     With StringGrid do
     begin
        Col := StartCol; Row := 1;
        For i := 1 to RowCount - 1 do
        For j := 0 to ColCount-1 do
        Cells[j,i] := '';
        RowCount := 2;
        Refresh;
        Col := StartCol; Row := 1;
     end;
end;

procedure clear_all_rowdata(stringgrid:Tstringgrid);
var i,j:integer;
begin
     With StringGrid do
     begin
         Col := 1; Row := 1;
         for i:=1 to RowCount - 1  do
         for j:=1 to ColCount - 1  do
         Cells[j,i]:='';
         Refresh;
    end;
end;

procedure setright(query1:tquery;name1,menuname:string;sb1,sb2,sb3,sb4,sb0:tspeedbutton);
begin
  if (name1='ADMIN') or (name1=' ') then
  begin
    exit;
  end;
  sb1.Visible :=false;
  sb2.Visible :=false;
  sb3.Visible :=false;
  sb4.Visible :=false;
  sb0.Visible :=false;
  with query1 do
  begin
     close;
     sql.Clear ;
     sql.Add('select c.usercode,c.username,b.menuname,menuadd,menumodify,menudelete,menuquery,menush from t_sysright a left outer join'+
             ' (select menucode,menuname from t_sysmenu) b on a.menucode=b.menucode left outer join(select '+
             ' usercode,username from t_user)c on c.usercode=a.workcode where c.username='''+name1+''' and b.menuname='''+menuname+'''')  ;
     open;
     if not isempty then
     begin
       if fields[3].AsBoolean  then  sb1.Visible  :=true;
       if fields[4].AsBoolean  then  sb2.Visible :=true;
       if fields[5].AsBoolean  then  sb3.Visible :=true;
       if fields[6].AsBoolean  then  sb4.Visible :=true;
       if fields[7].AsBoolean  then  sb0.Visible :=true;
     end;
  end;
end;
procedure setright1(query1:tquery;name1,menuname:string;bb1,bb2,bb3,bb4:TBitBtn);
begin
  if name1='ADMIN' then
  begin                     
    exit;
  end;
  bb1.Enabled :=false;
  bb2.Enabled :=false;
  bb3.Enabled :=false;
  bb4.Enabled :=false;
  with query1 do
  begin
     close;
     sql.Clear ;
     sql.Add('select c.usercode,c.username,b.menuname,menuadd,menumodify,menudelete,menuquery,menush from t_sysright a left outer join'+
             ' (select menucode,menuname from t_sysmenu) b on a.menucode=b.menucode left outer join(select '+
             ' usercode,username from t_user)c on c.usercode=a.workcode where c.username='''+name1+''' and b.menuname='''+menuname+'''')  ;
     open;
     if not isempty then
     begin
       if fields[3].AsBoolean  then  bb1.Enabled :=true;
       if fields[4].AsBoolean  then  bb2.Enabled :=true;
       if fields[5].AsBoolean  then  bb3.Enabled :=true;
       if fields[6].AsBoolean  then  bb4.Enabled :=true;
     end;
  end;

end;
procedure setmenu(query1:tquery;name1:string;menucount:integer;mm1:TMainMenu);
var I,j:integer;
begin
  with query1 do
  begin
    close;
    sql.Clear ;
    sql.Add('select c.username,a.menucode,menuname,menuclass from t_sysmenu a left outer join(select workcode,menucode from t_sysright)b'+
           ' on a.menucode=b.menucode left outer join(select usercode,username from t_user) c on c.usercode=b.workcode where c.username='''+name1+'''');
    open;
    if not isempty then
    begin
      for i:=0 to menucount -1 do
      begin
        first;
        for j:=0 to RecordCount -1 do
        begin
          if mm1.Items [i].Caption =fields[2].AsString then
            mm1.Items [i].Visible   :=true
            else mm1.Items [i].Visible  :=false;
          next;
        end;
      end;
    end;
  end;
end;
function GetFileCFG(const ParaFileName, Sec_Key,Ide_Key : string): string;
var
   ReadIniFile : TIniFile;
begin
    ReadIniFile := TIniFile.Create(ParaFileName);
    Result := ReadIniFile.ReadString(Sec_Key,Ide_Key,#0);
    ReadIniFile.Free;
end;

function WriteFileCFG(const paraFileName,sec_key,ide_key : string;value : string) : String;
var
    writeinifile : tIniFile;
begin
    WriteIniFile := TIniFile.Create(ParaFileName);
    WriteIniFile.WriteString(Sec_Key,Ide_Key,value);
    writeinifile.Free;
end;



function Get_MC(Value: string; FlagChar: Char = '|'): string;
var
  i: integer;
begin
  Result := Value;
  i := Pos(FlagChar, Value);
  if i > 0 then
  begin
    Result := Trim(Copy(Value, i+1, 20));
  end
  else Exit;
end;

function Get_DM(Value: string; FlagChar: Char = '|'): string;
var
  i: integer;
begin
  Result := Value;
  i := Pos(FlagChar, Value);
  if i > 0 then
  begin
    Result := Trim(Copy(Value, 1, i-1));
  end
  else Exit;
end;

function FillItems1(Sender: TComboBox; TableName : string; FieldStr : string='code,name';
  Condition: string = ''; OrderBy : String = 'Order By code';
  FieldLen : Integer = 8): boolean;
var
  Value : string;
begin
  Sender.Items.Clear;
  Result := False;
  With DataModule_frm.ProcQuery do
  begin
      Close;Sql.Clear;
      Sql.Add(Format('Select %s From %s %s %s',[FieldStr,TableName,Condition,OrderBy]));
      Open;
      if IsEmpty=False Then
      begin
          while not Eof do
          begin
              Value := Trim(Fields[0].Text);
              if Length(value) < FieldLen Then
                 Value := Value + SpaceLen(FieldLen-Length(value));
              Sender.Items.Add(value + ' |' + Fields[1].Text);
              Next;
          end;
        Result := True;
      end;
      Close;
  end;
end;

function FillItems2(Sender: TComboBox; TableName : string; FieldStr : string='code';
  Condition: string = ''; OrderBy : String = 'Order By code';
  FieldLen : Integer = 8): boolean;
var
  Value : string;
begin
  Sender.Items.Clear;
  Result := False;
  With DataModule_frm.ProcQuery do
  begin
      Close;Sql.Clear;
      Sql.Add(Format('Select distinct %s From %s %s %s',[FieldStr,TableName,Condition,OrderBy]));
      Open;
      if IsEmpty=False Then
      begin
          while not Eof do
          begin
            Sender.Items.Add(Fields[0].Text);
            Next;
          end;
        Result := True;
      end;
      Close;
  end;
end;

function FillItems(Sender: TComboBox; const TableName, FLBZ: string;
  Condition: string = '';dm : string ='DM';mc : string ='DMMC';
  FieldLen : Integer = 10): boolean;
var
  DStr, Value : string;
begin

  Sender.Clear;
  Result := false;

  if FLBZ='' then
     DStr := Format('select %s,%s from %s where 1=1', [dm,mc,TableName])
  else
     DStr := Format('select %s,%s from %s where DMFL="%s"', [dm,mc,TableName, FLBZ]);
  if Condition <> '' then
     DStr := DStr + ' and ' + Condition;
  DStr := Dstr + Format(' Order By %s ',[DM]);

  with DataModule_frm do
  begin
    with ProcQuery do
    begin
      Close;
      with SQL do
      begin
        Clear;
        Add(DStr);
      end;
      try
        Open;
      except
        ShowMessage('查询数椐出错请与开发商联系。(inFillItems)');
        Exit;
      end;
      if IsEmpty then Exit
      else
      begin
        while not Eof do
        begin
            Value := Trim(Fields[0].Text);
            if Length(value) < FieldLen Then Value := Value + SpaceLen(FieldLen-Length(value));
            Sender.Items.Add(value + ' |' + Fields[1].Text);
            Next;
        end;
      end;
    end;
  end;
  Result := true;
end;

FunCtion SpaceLen( Len : Integer) : String;
var
  k : integer;
begin
    Result := '';
    For k := 0 To Len - 1 do
    Result := Result + ' ';

end;

function StrToFloatDef(Value: string; DefaultValue: real = 0;
  ShowInfo: boolean = false): Extended;
const
  MaxLen = 20;
  Info1 = '存在异常字符!';
  Info2 = '小数点多出!';
  Info3 = '';
var
  i, BegPos, IntAdd, DecAdd: word;
  BaseMul: real;
  SymbolStr: char;
  IntValue, DecValue: array [1..MaxLen] of char;
  DecimalFlag: boolean;
begin
  Result := DefaultValue;
  Value := Trim(Value);
  if Value = '' then Exit;
//Init Array
  for i := 1 to MaxLen do
  begin
    IntValue[i] := #0;
    DecValue[i] := #0;
  end;
//Assume Data.
  DecimalFlag := false;
  BegPos := 1;
  IntAdd := 1;
  DecAdd := 1;
  SymbolStr := #0;
  if Value[1] = '-' then
  begin
    SymbolStr := Value[1];
    Inc(BegPos);
  end;
  for i := BegPos to Length(Value) do
  begin
    if not (Value[i] in ['0'..'9', '.']) then
    begin
      if ShowInfo then MessageDlg(Info1, mtError, [mbOK], 0);
      Exit;
    end;
    if DecimalFlag then //小数部分
    begin
      if Value[i] = '.' then
      begin
        if ShowInfo then MessageDlg(Info2, mtError, [mbOK], 0);
        Exit;
      end;
      DecValue[DecAdd] := Value[i];
      Inc(DecAdd);
    end
    else
    begin
      if Value[i] = '.' then DecimalFlag := true
      else
      begin
        IntValue[IntAdd] := Value[i];
        Inc(IntAdd);
      end;
    end;
  end;
//Out Data.
  Result := 0;
  BaseMul := 1;
  for i := MaxLen downto 1 do
  begin
    if IntValue[i] = #0 then Continue;
    Result := Result + BaseMul * (Byte(IntValue[i]) - 48);
    BaseMul := BaseMul * 10;
  end;
  BaseMul := 0.1;
  for i := 1 to MaxLen do
  begin
    if DecValue[i] = #0 then Break;
    Result := Result + BaseMul * (Byte(DecValue[i]) - 48);
    BaseMul := BaseMul * 0.1;
  end;
  if SymbolStr = '-' then Result := -(Result);
end;
procedure findselectname(combo:TComboBox;fields:string);
var i:integer;
begin
  combo.ItemIndex :=-1;
  for i:=0 to combo.Items.Count -1 do
  begin
    if get_dm(combo.Items [i])=fields then
    begin
      combo.ItemIndex :=i;
      exit;
    end
    else
    if get_mc(combo.Items [i])=fields then
    begin
      combo.ItemIndex :=i;
      exit;
    end;
  end;
end;
Function FindFullName(Combo: TComboBox) : Boolean;
var
  i, ItemCount: integer;
begin
  if Combo.Text = '' Then
  begin
      Result := True;
      Exit;
  end;
  Result := False;
  ItemCount := Combo.Items.Count;
  if Pos('|', Combo.Text) > 0 then
  begin
    for i := 0 to ItemCount - 1 do
      if Combo.Items[i] = Combo.Text then
      begin
        Result := True;
        Exit;
      end;
  end
  else
  begin
    for i := 0 to ItemCount - 1 do
    begin
      if Get_DM(Combo.Items[i]) = UpperCase(Combo.Text) then
      begin
        Combo.Text := Combo.Items[i];
        Result := True;
        Exit;
      end
      else
      if Get_MC(Combo.Items[i]) = Combo.Text then
      begin
        Combo.Text := Combo.Items[i];
        Result := True;
        Exit;
      end;
    end;
  end;
  //if Result = False Then Combo.SetFocus;
  //Combo.Text := '';
end;

Procedure SumData(StrGrid : TStringGrid; SG_SL, SG_JE : integer;
     var nCount : integer; var nSL, nJE : real);
var
  k : integer;
begin
    nCount := 0; nSL := 0; nJE := 0;
    For k := 1 To StrGrid.RowCount - 1 do
    begin
        //if StrGrid.Cells[1,k] <> '' Then
        begin
            nCount := nCount + 1;
            nSL := nSL + StrToFloatDef(strtostrdel(StrGrid.Cells[SG_SL,k]));
            nJE := nJE + StrToFloatDef(strtostrdel(StrGrid.Cells[SG_JE,k]));
        end;
    end;
end;
function strtostrdel(value:string):string;
var k,i:integer; value1 : string;
    str:array [1..14] of char;
begin
  if value<>'' then
    for k:=0 to length(value) do
    if  value[k]=',' then
      while value[k]=',' do
        for i:=k to length(value) do
          value[i]:=value[i+1];
     result:=value;
end;
procedure setplay(sb:tspeedbutton;st:TStatusBar);
begin
  st.Panels[3].text:='';
  if sb.Caption ='增加' then
    st.Panels[3].Text :='正在【增加】的窗体中,请操作.........'
  else  if sb.Caption ='修改' then
     st.Panels [3].Text :='正在【修改】的窗体中,请操作.........'
  else if sb.Caption ='删除' then
     st.Panels[3].Text :='正在【删除】的窗体中,请操作.........'
  else if sb.Caption ='查询' then
     st.Panels[3].Text :='正在【查询】的窗体中,请操作.........' 
  else if sb.Caption ='取消' then
     st.Panels [3].Text :='请选择您需要的操作!!';
end;

function queryQ(strgrid:TStringGrid;str:string;strcol,strrow:integer):boolean;
var I,j:integer;
begin
  for i:=1 to strgrid.RowCount do
  begin
    if strgrid.Cells [strcol,i]<>'' then
    begin
      if (str=strgrid.Cells [strcol,i])and(i<>strrow) then
      begin
        showmessage('此记录与第'+inttostr(i)+'条记录重复,请重选');
        for j:=1 to strgrid.ColCount do
          strgrid.Cells [j,strrow]:='';

        result:=true;
      end
      else
        result:=false;
    end;
  end;

end;


//转换jpg到bmp
procedure JpgToBmp(const JpgFileName:string;AJpg:TJpegImage;Abmp:Tbitmap);
begin
  try
    AJpg.LoadFromFile(JpgFileName);
    Abmp.Assign(AJpg);
  finally
  end;
end;

//仅从扩展名上来判断是否是jpg格式的文件
function  IsJpgFile(const FileName:string):boolean;
begin
  result:=(LowerCase( ExtractFileExt(FileName))='.jpg') or (LowerCase( ExtractFileExt(FileName))='.jpeg');
end;
function  IsBmpFile(const FileName:string):boolean;
begin
  result:=(LowerCase( ExtractFileExt(FileName))='.bmp');
end;

function  ReplaceStr(str:string):string;
begin
  result:= StringReplace(str, '''', '''''', [rfReplaceAll]);
end;

function  WriteLog(str:string):boolean;
var txtfile:TextFile;
    filepath :string;
begin
   filepath :=SystemFilePath + 'Log\'+ formatdatetime('yyyyMMdd', date) +'.log';
   try
      AssignFile(txtfile, filepath);
      if  not FileExists(filepath)   then
         ReWrite(txtfile)
      else
         Append(txtfile); {以编辑方式打开文件 F }
      writeln(txtfile,' '+ datetimetostr(now) + '  '+ str);
      closefile(txtfile);
   except
      closefile(txtfile);
   end;
end;

end.

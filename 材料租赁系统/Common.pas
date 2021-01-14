unit common;

interface
  uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBGrids, DBClient, DB, Registry, winsock,ADODB,variants,
  comobj,excel97,excel2000,QuickRpt,math, DBGridEh;


 //公共函数
   function SmallToBig(Small:Real):string;
   function ConnectLocalDB(const adocon:TadoConnection;const dbname,computername,username,Password:string):boolean;
   function returnint(const para,s:string;i:integer;trun:boolean):string;//求特定的数据
   function  CheckTable(const tmptable:string;ado:TADOQuery):boolean;//  //检查临时表
//******************************设置过程值******************************************
//公共的过程:
   procedure MoveSelect(list:TcustomListbox;Items:Tstrings);
   procedure MoveaLL(list:TcustomListbox;Items:Tstrings);
   procedure ExportDataToExecel(dbgrid: TDBGrid;const sTitle,UserName,printDate:string);
//   procedure ExportDataToExecel(dbgrid: TDBGridEh;const sTitle,UserName,printDate:string);
   procedure DbGridSort(dbgrid: TDBGrid; Column: TColumn);
   procedure repairTable(const tmptable:string;ado:TADOQuery);
   procedure DbGridEhSort(dbgrid: TDBGridEh; Column: TColumnEh);
var
  strsql,s_value:string;
  psIndexName: string;
  plAscend:Boolean;
implementation
//DBGridEh***排序
procedure DbGridEhSort(dbgrid: TDBGridEh; Column:TColumnEh);
var
//本模块使用到的psIndexName, plAscend两个变量见上定义
  mode: char; //记录是“升序”还是“降序”
  ColName: string; //记录当前字段名
  iCol: Integer; //记录当前列号
begin
  with dbgrid.DataSource.DataSet as Tclientdataset do //Table0
  begin
//检测当前工作表是否已打开
    if not Active
      then begin
      Application.MessageBox('工作表尚未打开！', '停止', MB_OK + MB_ICONSTOP);
      Abort
    end;
//检测当前字段是否“能排序”。以下字段类型不能排序
    case Column.Field.DataType of
      ftBoolean,
        ftBytes,
        ftBlob, //Binary
        ftMemo,
        ftGraphic,
        ftFmtMemo, //Formatted memo
        ftParadoxOle: //OLE
        begin
          Abort
        end;
    end; //case
    mode := '0';
    iCol := Column.Field.FieldNo - 1;
    try
      ColName := Column.fieldname;
      if psIndexName = Column.fieldname then
      begin //与原来同列
        if plAscend //升序
          then begin
          mode := '2';
          IndexName := ColName + '2'; //应“降序”
        end
        else begin
          mode := '1';
          IndexName := ColName + '1'; //应“升序”
        end;
        plAscend := not plAscend;
      end
      else begin //新列
        IndexName := ColName + '2';
      //  IndexName := ColName ;
        plAscend := false;
        psIndexName := ColName;
      end;
    except
      on EDatabaseError do //若未有索引，则重新建立
      begin
//以下新建索引
        IndexName := '';
        if mode = '1'
          then AddIndex(ColName + '1', ColName, [], '', '', 0) //
        else //包括'0'
          AddIndex(ColName + '2', ColName, [ixDescending], '', '', 0);
        try //try 1
          if mode <> '1'
            then begin
            mode := '2'; //转换
            plAscend := false;
          end
          else plAscend := true;
          IndexName := ColName + mode;
          psIndexName := ColName;
        except
          IndexName := '';
        end //try 2
      end
    end;
    first;
  end; //with
  dbgrid.SelectedIndex := iCol;
end;
//删除临时表
procedure repairTable(const tmptable:string;ado:TADOQuery);
begin
strsql:='drop table '+tmptable;
with ado do
begin
  close;
  sql.Clear ;
  sql.Add(strsql);
  prepared;
  execsql; 
end;
end;
//
procedure DbGridSort(dbgrid: TDBGrid; Column:TColumn);
var
//本模块使用到的psIndexName, plAscend两个变量见上定义
  mode: char; //记录是“升序”还是“降序”
  ColName: string; //记录当前字段名
  iCol: Integer; //记录当前列号
begin
  with dbgrid.DataSource.DataSet as Tclientdataset do //Table0
  begin
//检测当前工作表是否已打开
    if not Active
      then begin
      Application.MessageBox('工作表尚未打开！', '停止', MB_OK + MB_ICONSTOP);
      Abort
    end;
//检测当前字段是否“能排序”。以下字段类型不能排序
    case Column.Field.DataType of
      ftBoolean,
        ftBytes,
        ftBlob, //Binary
        ftMemo,
        ftGraphic,
        ftFmtMemo, //Formatted memo
        ftParadoxOle: //OLE
        begin
          Abort
        end;
    end; //case
    mode := '0';
    iCol := Column.Field.FieldNo - 1;
    try
      ColName := Column.fieldname;
      if psIndexName = Column.fieldname then
      begin //与原来同列
        if plAscend //升序
          then begin
          mode := '2';
          IndexName := ColName + '2'; //应“降序”
        end
        else begin
          mode := '1';
          IndexName := ColName + '1'; //应“升序”
        end;
        plAscend := not plAscend;
      end
      else begin //新列
        IndexName := ColName + '2';
        plAscend := false;
        psIndexName := ColName;
      end;
    except
      on EDatabaseError do //若未有索引，则重新建立
      begin
//以下新建索引
        IndexName := '';
        if mode = '1'
          then AddIndex(ColName + '1', ColName, [], '', '', 0) //
        else //包括'0'
          AddIndex(ColName + '2', ColName, [ixDescending], '', '', 0);
        try //try 1
          if mode <> '1'
            then begin
            mode := '2'; //转换
            plAscend := false;
          end
          else plAscend := true;
          IndexName := ColName + mode;
          psIndexName := ColName;
        except
          IndexName := '';
        end //try 2
      end
    end;
    first;
  end; //with
  dbgrid.SelectedIndex := iCol;
end;

//生成EXECL
procedure ExportDataToExecel(dbgrid: TDBGrid;CONST sTitle,UserName,printDate:string);
var
varexcel:variant;//变体变量
range:variant;
i,j,k:integer;
xxxl:string;
xr:string;
begin
 try
 screen.Cursor :=crHourGlass;
    try
    //创建Excel对象
      varexcel:=CreateOleObject('Excel.Application');
      if not varisempty(varexcel) then
      begin
        //添加工作薄
        varexcel.workbooks.add;
        varexcel.workbooks[1].worksheets[1].name:='数据库信息';
      end;
    except
      Application.messagebox('请确认是否安装Excel？！', '提示信息', mb_iconinformation + mb_defbutton1);
      exit;
    end;

  if not dbgrid.DataSource.DataSet.Active then
  begin
     Screen.Cursor := crDefault;
     Exit;
  end;

   begin
      range:=varexcel.workbooks[1].worksheets[1].columns;
      for i:=0 to dbgrid.Columns.Count - 1  do begin
          varexcel.workbooks[1].worksheets[1].cells[2,i+1].value:=dbgrid.Columns[I].Title.Caption;
          varexcel.workbooks[1].worksheets[1].cells[2,i+1].font.bold:=true;
          range.columns[i+1].columnwidth:=int(dbgrid.Columns[I].Width/5) ;
          range.columns[i+1].HorizontalAlignment:=xlCenter;
      end;

      try
      try
        //循环写入数据到EXCEL中
         dbgrid.DataSource.DataSet.first;
         j:=3;
         while not dbgrid.DataSource.DataSet.Eof  do
         begin
            for i:=0 to  dbgrid.Columns.Count - 1  do
              begin
              if  dbgrid.Columns.Items[i].Field.Value = null then
                xr:=' '//+dbgrid.Columns.Items[i].Field.Value
              else
                xr:=dbgrid.Columns.Items[i].Field.AsString;
                varexcel.workbooks[1].worksheets[1].cells[j,i+1].value:=xr;
              end;
              dbgrid.DataSource.DataSet.Next;
              j:=j+1;
         end;


         varexcel.workbooks[1].worksheets[1].cells[j+1,2].value:='制表：'+UserName;
         varexcel.workbooks[1].worksheets[1].cells[j+1,5].value:='日期：'+printDate ;

         except
         end;
       finally
        //    frmMain.StatusBar1.panels[0].text:='';
            k:=i-1+ord('A');
            xxxl:=chr(k);
            xxxl:='a2:'+xxxl+inttostr(j-1);
            //将数据表格画线
          range:=varexcel.workbooks[1].worksheets[1].range[xxxl];
          range.borders.linestyle:=xlcontinuous;
          range.FONT.NAME:='宋体';
          range.font.size:='10';
            k:=i-1+ord('A');
            xxxl:=chr(k);
            xxxl:='a1:'+xxxl+'1';
           //数据标题列居中
           range:=varexcel.workbooks[1].worksheets[1].range[xxxl];
           range.HorizontalAlignment:=xlCenter;
           range.VerticalAlignment:=xlCenter;

           range.MergeCells:=true;

           //报表标题进行修饰
           varexcel.workbooks[1].worksheets[1].range['a1:a1']:= sTitle;
           varexcel.workbooks[1].worksheets[1].range['A1:A1'].FONT.NAME:='宋体';
           varexcel.workbooks[1].worksheets[1].range['A1:A1'].font.size:='12';
           varexcel.workbooks[1].worksheets[1].range['A1:A1'].font.fontstyle:='bold';
           varexcel.visible:=true
         end;
        end;

 finally
 screen.Cursor :=crarrow;
 varexcel.DisplayAlerts := True
 end;
end;
//******************************设置函数值****************************************** ******************//
//检查临时表
function  CheckTable(const tmptable:string;ado:TADOQuery):boolean;//  //检查临时表
var
  dt:Tdatetime;

begin

 strsql:='SELECT NAME,CRDATE FROM sysobjects WHERE (NAME =:name) ORDER BY CRDATE';
 with  ADO do
 begin
   close;
   sql.Clear ;
   sql.Add(strsql);
   Parameters.ParamByName('name').Value :=tmptable;  
   prepared;
   open;
 end;
  if ado.RecordCount >0 then
    result:=true
  else
    result:=false;   
end;
//
function ConnectLocalDB(const adocon:TadoConnection;const dbname,computername,username,Password:string):boolean;
begin
 with adocon do
 begin
  Close;
  LoginPrompt:=false;    //若数据库不存在时，进行判断。。。。。。
  ConnectionString:='Provider=SQLOLEDB.1;'+
                   'Password='+Password+';'+
                   'Persist Security Info=True;'+
                   'User ID='+username+';Initial Catalog='+dbname+';'+
                   'Data Source='+ComputerName;
  try
    KeepConnection:=true;
    Connected:=true;
    Open;
    ConnectLocalDB:=true;
   except
     ConnectLocalDB:=false;
   end;
   end;
end;
//
function returnint(const para,s:string;i:integer;trun:boolean):string;//求特定的数据
var
  SelPos: Integer;
  s_value:string;
begin
   selPos:=Pos(para,s);
if  selPos>0 then
begin
//   s_value:=copy(s,selPos+1,length(s)-selPos);
  if not trun then
    s_value:=copy(s,selPos+1,length(s)-selPos) 
  else
    s_value:=copy(s,i,selPos-i) ;
result:=trim(s_value);
end;
end;

//
function SmallToBig(Small:Real):string;
Var Str:String;
  DotPos:Integer;
  i:Integer;
  bStart:Boolean;
  sResult:WideString;
  SmallDit:Double;
begin
  Result:='零圆整';
  SmallDit:=Round((Small-INT(Small))*100)/100;
  Small:=INT(Small)+SmallDit;
  IF  Small=0 THEN
  //if SmallDit<0.01 then
    Exit;
  Str:=FormatFloat('#.##',Small);
  DotPos:=Pos('.',Str);
  if DotPos=0 then
    DotPos:=length(Str)+1;
  bStart:=False;
  For i:=DotPos-1 downto 1 do
  begin
    if (Str[i]<>'0') and (not bStart) then
      bStart:=True;
    if ABS(i-DotPos) MOD 4=1 then
    begin
      if (Str[i]='0') and (DotPos-i<>1) then
        sResult:='零'+sResult;
      Case DotPos-i of
        1:sResult:='圆'+sResult;
        5:sResult:='万'+sResult;
        9:sResult:='亿'+sResult;
        13:sResult:='兆'+sResult;
      end;
      bStart:=False;
    end;
    if (Str[i]<>'0') then
    begin
      Case ABS(i-DotPos) MOD 4 of
        0:sResult:='仟'+sResult;
        2:sResult:='拾'+sResult;
        3:sResult:='佰'+sResult;
      end;
    end;
    if i=3 then
      Application.ProcessMessages;
    Case Str[i] of
      '0':if bStart and (sResult[1]<>'零') then
          begin
            sResult:='零'+sResult;
            bStart:=False;
          end;
      '1':sResult:='壹'+sResult;
      '2':sResult:='贰'+sResult;
      '3':sResult:='叁'+sResult;
      '4':sResult:='肆'+sResult;
      '5':sResult:='伍'+sResult;
      '6':sResult:='陆'+sResult;
      '7':sResult:='柒'+sResult;
      '8':sResult:='捌'+sResult;
      '9':sResult:='玖'+sResult;
    end;
    if Str[i]<>'0' then
      bStart:=True;
  end;
  Delete(Str,1,DotPos);
  if Length(Str)>0 then
  begin
    Case Str[1] of
      '0':if sResult<>'' then
            sResult:=sResult+'零';
      '1':sResult:=sResult+'壹';
      '2':sResult:=sResult+'贰';
      '3':sResult:=sResult+'叁';
      '4':sResult:=sResult+'肆';
      '5':sResult:=sResult+'伍';
      '6':sResult:=sResult+'陆';
      '7':sResult:=sResult+'柒';
      '8':sResult:=sResult+'捌';
      '9':sResult:=sResult+'玖';
    end;
    if Str[1]<>'0' then
      sResult:=sResult+'角';
    if Length(Str)>1 then
    begin
      Case Str[2] of
        '1':sResult:=sResult+'壹';
        '2':sResult:=sResult+'贰';
        '3':sResult:=sResult+'叁';
        '4':sResult:=sResult+'肆';
        '5':sResult:=sResult+'伍';
        '6':sResult:=sResult+'陆';
        '7':sResult:=sResult+'柒';
        '8':sResult:=sResult+'捌';
        '9':sResult:=sResult+'玖';
      end;
      if Str[2]<>'0' then
        sResult:=sResult+'分';
    end else
      sResult:=sResult+'整';
  end else
    sResult:=sResult+'整';
  Result:=sResult;
end;
//

//
procedure MoveALL(list:TcustomListbox;Items:Tstrings);
var
  i:integer;
begin
SCREEN.Cursor :=crHourGlass;
for i:=list.Items.Count - 1 downto 0 do
  BEGIN
    Items.AddObject(List.Items[i],list.Items.Objects[i]);
         list.Items.Delete(i);
  END;
SCREEN.Cursor :=crDefault;
end;
//
procedure MoveSelect(list:TcustomListbox;Items:Tstrings);
var
  i:integer;
begin
SCREEN.Cursor :=crHourGlass;
for i:=list.Items.Count - 1 downto 0 do
  if list.Selected[i] then
  BEGIN
    Items.AddObject(List.Items[i],list.Items.Objects[i]);
         list.Items.Delete(i);
  END;
SCREEN.Cursor :=crDefault;  
end;

end.

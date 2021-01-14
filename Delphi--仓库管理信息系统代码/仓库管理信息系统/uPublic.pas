unit uPublic;


interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBGrids, DBClient, DB, Registry, winsock;

//==
procedure DbGridSort(dbgrid: TDBGrid; Column: TColumn);


//===辅助录入窗口，得到职工的姓名
function GetEmployeeName: string;


//==辅助录入窗口，得到部门名称
function GetDeptName: string;

//==辅助录入窗口，得到工程项目名称
function GetProjectName: string;

var
  psIndexName: string; //
  plAscend: Boolean;
implementation

uses u_fzlr_zgxm , u_bmda_fzlr;


procedure DbGridSort(dbgrid: TDBGrid; Column: TColumn);
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



//===辅助录入窗口，得到职工的姓名

function GetEmployeeName: string;
begin
  //创建TfrmZgda_fzlr窗体对象
  with TfrmZgda_fzlr.Create(Application) do
  begin
    pub_zgxm := '';
    try
      //模式显示窗口
      showModal;
    finally
      free;
    end;
    result := pub_zgxm;
  end;
end;


//===辅助录入窗口，得到部门的名称

function GetDeptName: string;
begin
  with TfrmBmda_fzlr.Create(Application) do
  begin
    pub_Bmmc := '';
    try
      showModal;
    finally
      free;
    end;
    result := pub_Bmmc;
  end;
end;

//==辅助录入窗口，得到工程项目名称

function GetProjectName: string;
begin
{  with TfrmGcxmdy_fzlr.Create(Application) do
  begin
    pub_Gcxmmc := '';
    try
      showModal;
    finally
      free;
    end;
    result := pub_Gcxmmc;
  end;       }
end;


end.


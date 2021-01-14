unit u_public;


interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBGrids, DBClient, DB, Registry, winsock;
type
  TCurrentParam = record
    userAliasName: string;
    LoginTime: string;
    Host: string;
    IP: string;
    userBH: string;
    userName: string;
    userZH: string;
  end;
//=====
function ShowMDIForm(aFormClass: TFormClass): TForm;

//===
procedure ShowModalForm(aFormClass: TFormClass);

//==
procedure DbGridSort(dbgrid: TDBGrid; Column: TColumn);

//===
function ConnectAppServ: boolean;

//==
function GetComputerName: string;

//==
function GetComputerIP: string;

//===辅助录入窗口，得到职工的姓名
function GetEmployeeName: string;


//==辅助录入窗口，得到部门名称
function GetDeptName: string;

//==辅助录入窗口，得到工程项目名称
function GetProjectName: string;

var
  CurrentParam: TCurrentParam;
  psIndexName: string; //
  plAscend: Boolean;
implementation

uses main, WzglDB;

function showMDIForm(aFormClass: TFormClass): TForm;
begin
{  frmMain.statusbar1.Panels[0].text := '正在打开窗口,请稍侯...';
  frmMain.statusbar1.refresh;
  screen.Cursor := crHourGlass;
  lockwindowupdate(frmMain.handle);
  result := aFormClass.Create(Application);
  with result do
  begin
    WindowState := wsMaximized;
    frmMain.statusbar1.Panels[0].text := '';
    frmMain.statusbar1.refresh;
    show;
    lockwindowupdate(0);
    screen.Cursor := crDefault;
  end;     }
end;

procedure ShowModalForm(aFormClass: TFormClass);
begin
{  frmMain.statusbar1.Panels[0].text := '正在打开窗口,请稍侯...';
  frmMain.statusbar1.refresh;
  screen.Cursor := crHourGlass;
  with aFormClass.Create(Application) do
  begin
    frmMain.statusbar1.Panels[0].text := '';
    frmMain.statusbar1.refresh;
    screen.Cursor := crDefault;
    try
      showModal;
    finally
      free;
    end;
  end;   }
end;

function ConnectAppServ: boolean; //判断是否连接上了应用服务器
var
  vs_Host, vs_Address, vs_Port: string;
  reg: TRegistry;
begin
{  Result := True;
  reg := Tregistry.create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  frmMain.SocketConnection.Connected := false;
  //读取注册表配置的应用服务器信息
  if Reg.OpenKey('\Software\物资管理', False) then
  begin
    vs_Host := reg.ReadString('Host');
    vs_Address := reg.ReadString('Address');
    vs_Port := reg.readstring('Port');
    try
      //测试连接
      with frmMain do
      begin
        SocketConnection.Address := vs_Address;
        SocketConnection.Host := vs_Host;
        SocketConnection.Port := strtoint(vs_Port);
        SocketConnection.Connected := true;
      end;
      reg.closekey;
    except //未连接上，弹出配置窗口
      reg.closekey;
      if not LjszExecute(TfrmLjsz) then
        Result := False;
    end;
  end
  else
  begin
    if not LjszExecute(TfrmLjsz) then //如果没有注册信息，弹出配置窗口
      Result := False;
  end;    }
end;


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


{获取本地计算机主机名}

function GetComputerName: string;
var
  pcComputer: PChar;
  dwCSize: DWORD;
begin
  dwCSize := MAX_COMPUTERNAME_LENGTH + 1;
  result := '';
  GetMem(pcComputer, dwCSize);
  try
    if Windows.GetComputerName(pcComputer, dwCSize) then
      Result := pcComputer;
  finally
    FreeMem(pcComputer);
  end;
end;

///////////////获取本地计算机的IP地址

function GetComputerIP: string;
var
  ch: array[1..32] of Char;
  i: Integer;
  WSData: TWSAData;
  MyHost: PHostEnt;
  S_IP: string;
begin
  if WSAstartup(2, wsdata) <> 0 then
    EXIT;
  if getHostName(@ch[1], 32) <> 0 then
    EXIT;
  MyHost := GetHostByName(@ch[1]);
  if MyHost = nil then
    EXIT
  else
  begin
    for i := 1 to 4 do
    begin
      S_IP := S_IP + inttostr(Ord(MyHost.h_addr^[i - 1]));
      if i < 4 then
        S_IP := S_IP + '.';
    end;
  end;
  RESULT := S_IP;
end;
/////////////

//===辅助录入窗口，得到职工的姓名

function GetEmployeeName: string;
begin
{  //创建TfrmZgda_fzlr窗体对象
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
  end;    }
end;


//===辅助录入窗口，得到部门的名称

function GetDeptName: string;
begin
{  with TfrmBmda_fzlr.Create(Application) do
  begin
    pub_Bmmc := '';
    try
      showModal;
    finally
      free;
    end;
    result := pub_Bmmc;
  end;    }
end;

//==辅助录入窗口，得到工程项目名称

function GetProjectName: string;
begin
 { with TfrmGcxmdy_fzlr.Create(Application) do
  begin
    pub_Gcxmmc := '';
    try
      showModal;
    finally
      free;
    end;
    result := pub_Gcxmmc;
  end;    }
end;


end.


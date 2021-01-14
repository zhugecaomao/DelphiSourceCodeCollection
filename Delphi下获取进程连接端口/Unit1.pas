unit Unit1;

//
//进程连接端口查看器
//作者：yeye55
//2008年2月25日
//
//如果你转载本文件中的代码，请注明出处和作者并保证其完整性
//如果你修改了本文件中的代码，请注明修改位置和修改作者
//
//本文件最早在http://www.programbbs.com/bbs/上发布
//

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, StrUtils, PsAPI, tlhelp32, WinSock;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Button2: TButton;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

//以下常量定义根据VC++6.0自带IPRTRMIB.H文件中的相关定义改写
const
    MIB_TCP_STATE_CLOSED     =  1;
    MIB_TCP_STATE_LISTEN     =  2;
    MIB_TCP_STATE_SYN_SENT   =  3;
    MIB_TCP_STATE_SYN_RCVD   =  4;
    MIB_TCP_STATE_ESTAB      =  5;
    MIB_TCP_STATE_FIN_WAIT1  =  6;
    MIB_TCP_STATE_FIN_WAIT2  =  7;
    MIB_TCP_STATE_CLOSE_WAIT =  8;
    MIB_TCP_STATE_CLOSING    =  9;
    MIB_TCP_STATE_LAST_ACK   = 10;
    MIB_TCP_STATE_TIME_WAIT  = 11;
    MIB_TCP_STATE_DELETE_TCB = 12;

//相关数据结构的定义
const
    ANY_SIZE=256;

type
    MIB_TCPEXROW = record
        dwState : DWORD;      //连接状态
        dwLocalAddr : DWORD;  //本地地址
        dwLocalPort : DWORD;  //本地端口
        dwRemoteAddr : DWORD; //远程地址
        dwRemotePort : DWORD; //远程端口
        dwProcessId : DWORD;  //进程ID号
    end;

    MIB_TCPEXTABLE = record
        dwNumEntries : DWORD; //端口数量
        table : array [0..ANY_SIZE-1] of MIB_TCPEXROW;
    end;

    PMIB_TCPEXTABLE = ^MIB_TCPEXTABLE;

    MIB_UDPEXROW = record
        dwLocalAddr : DWORD; //本地地址
        dwLocalPort : DWORD; //本地端口
        dwProcessId : DWORD; //进程ID号
    end;

    MIB_UDPEXTABLE = record
        dwNumEntries : DWORD; //端口数量
        table : array [0..ANY_SIZE-1] of MIB_UDPEXROW;
    end;

    PMIB_UDPEXTABLE = ^MIB_UDPEXTABLE;

//获取TCP连接表的IP帮助函数声明
function AllocateAndGetTcpExTableFromStack(
    var pTcpTable;
    bOrder : Bool;
    heap : THandle;
    zero : DWORD;
    flags : DWORD
    ): DWORD; stdcall; external 'iphlpapi.dll'
    name 'AllocateAndGetTcpExTableFromStack';

//获取UDP连接表的IP帮助函数声明
function AllocateAndGetUdpExTableFromStack(
    var pUdpTable;
    bOrder : Bool;
    heap : THandle;
    zero : DWORD;
    flags : DWORD
    ): DWORD; stdcall; external 'iphlpapi.dll'
    name 'AllocateAndGetUdpExTableFromStack';


implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
    self.StringGrid1.Cells[0,0]:=' 协议';
    self.StringGrid1.Cells[1,0]:=' 本地IP地址';
    self.StringGrid1.Cells[2,0]:=' 远程IP地址';
    self.StringGrid1.Cells[3,0]:=' 连接状态';
    self.StringGrid1.Cells[4,0]:=' 进程ID';
    self.StringGrid1.Cells[5,0]:=' 可执行文件名';
    self.StringGrid1.Cells[6,0]:=' 文件路径';
    self.StringGrid1.Cells[7,0]:=' 文件说明 / 公司名称';
    //
    self.Button1Click(self);
end;

//将连接状态转换为说明字符串
function StateToString(dwState : DWORD): String;
begin
    result:='';
    case dwState of
        MIB_TCP_STATE_CLOSED     : result:='关闭';
        MIB_TCP_STATE_LISTEN     : result:='监听';
        MIB_TCP_STATE_SYN_SENT   : result:='同步发送';
        MIB_TCP_STATE_SYN_RCVD   : result:='同步接收';
        MIB_TCP_STATE_ESTAB      : result:='已建立';
        MIB_TCP_STATE_FIN_WAIT1  : result:='等待完成1';
        MIB_TCP_STATE_FIN_WAIT2  : result:='等待完成2';
        MIB_TCP_STATE_CLOSE_WAIT : result:='等待关闭';
        MIB_TCP_STATE_CLOSING    : result:='正在关闭';
        MIB_TCP_STATE_LAST_ACK   : result:='最后确认';
        MIB_TCP_STATE_TIME_WAIT  : result:='等待时间';
        MIB_TCP_STATE_DELETE_TCB : result:='删除';
        else result:=Format('未知状态%d',[dwState]);
    end;
end;

//根据进程ID查找可执行文件名
function IdToExeFile(hSnapshot : THandle; dwProcessId : DWORD): String;
var
    lppe : TProcessEntry32;
    b : BOOL;
begin
    lppe.dwSize:=SizeOf(lppe);
    //取第1个进程数据
    b:=Process32First(hSnapshot,lppe);
    result:='';
    while b do
    begin
        if lppe.th32ProcessID=dwProcessId then
        begin
            result:=lppe.szExeFile;
            break;
        end;
        //取下一个进程
        b:=Process32Next(hSnapshot,lppe);
    end;
end;

//根据进程ID查找可执行文件路径
function IdToExeDir(dwProcessId : DWORD): String;
var
    cbNeeded : DWORD;
    hProcess : THandle;
    hModules : HMODULE;
    lpFilename : array [0..1024-1] of Char;
begin
    result:='';
    hProcess:=OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,false,dwProcessId);
    if hProcess=0 then exit;
    EnumProcessModules(hProcess,@hModules,sizeof(hModule),cbNeeded);
    GetModuleFileNameEx(hProcess,hModules,lpFilename,1024);
    result:=lpFilename;
    CloseHandle(hProcess);
end;

//根据文件名查找文件信息
function ExeDirToFileInfo(Filename : String): String;
var
    NameLen,BufLen,ValLen : DWORD;
    pBuf,pVal : Pointer;
    LangCode : String;
begin
    result:='';
    NameLen:=Length(Filename);
    if NameLen=0 then exit;
    //获取版本信息
    BufLen:=GetFileVersionInfoSize(PChar(Filename),NameLen);
    pBuf:=AllocMem(BufLen);
    if pBuf=nil then exit;
    if GetFileVersionInfo(PChar(Filename),0,BufLen,pBuf)=false then
    begin
        FreeMem(pBuf);
        exit;
    end;
    //获取代码页信息
    if VerQueryValue(pBuf,'\VarFileInfo\Translation',pVal,ValLen)=false then
    begin
        FreeMem(pBuf);
        exit;
    end;
    LangCode:=Format('%.2x%.2x%.2x%.2x',[
        BYTE(PChar(pVal)[1]),
        BYTE(PChar(pVal)[0]),
        BYTE(PChar(pVal)[3]),
        BYTE(PChar(pVal)[2])]);
    //获取文件说明
    if VerQueryValue(pBuf,PChar('\StringFileInfo\'+LangCode+'\FileDescription'),pVal,ValLen)=false then
    begin
        FreeMem(pBuf);
        exit;
    end;
    result:=PChar(pVal);
    //获取公司名称
    if VerQueryValue(pBuf,PChar('\StringFileInfo\'+LangCode+'\CompanyName'),pVal,ValLen)=false then
    begin
        FreeMem(pBuf);
        exit;
    end;
    result:=result+' / '+PChar(pVal);
    FreeMem(pBuf);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
    hSnapshot : THandle; //进程快照
    pTcpTab : PMIB_TCPEXTABLE; //TCP连接表
    pUdpTab : PMIB_UDPEXTABLE; //UDP连接表
    i : Integer;
begin
    self.StringGrid1.RowCount:=2;
    //创建进程快照
    hSnapshot:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
    //获取TCP连接表
    if AllocateAndGetTcpExTableFromStack(pTcpTab,true,GetProcessHeap(),2,2)<>0 then
    begin
        MessageBox(self.Handle,'无法获取TCP连接表','调用失败',MB_ICONEXCLAMATION or MB_OK);
    end
    else
    begin
        //输出TCP连接表
        for i:=0 to pTcpTab.dwNumEntries-1 do
        begin
            self.StringGrid1.Cells[0,self.StringGrid1.RowCount-1]:=
                'TCP';
            self.StringGrid1.Cells[1,self.StringGrid1.RowCount-1]:=
                inet_ntoa(TInAddr(pTcpTab.table[i].dwLocalAddr))+
                ':'+IntToStr(ntohs(pTcpTab.table[i].dwLocalPort));
            self.StringGrid1.Cells[2,self.StringGrid1.RowCount-1]:=
                inet_ntoa(TInAddr(pTcpTab.table[i].dwRemoteAddr))+
                ':'+IntToStr(ntohs(pTcpTab.table[i].dwRemotePort));
            self.StringGrid1.Cells[3,self.StringGrid1.RowCount-1]:=
                StateToString(pTcpTab.table[i].dwState);
            self.StringGrid1.Cells[4,self.StringGrid1.RowCount-1]:=
                IntToStr(pTcpTab.table[i].dwProcessId);
            self.StringGrid1.Cells[5,self.StringGrid1.RowCount-1]:=
                IdToExeFile(hSnapshot,pTcpTab.table[i].dwProcessId);
            self.StringGrid1.Cells[6,self.StringGrid1.RowCount-1]:=
                IdToExeDir(pTcpTab.table[i].dwProcessId);
            self.StringGrid1.Cells[7,self.StringGrid1.RowCount-1]:=
                ExeDirToFileInfo(self.StringGrid1.Cells[6,self.StringGrid1.RowCount-1]);
            self.StringGrid1.RowCount:=self.StringGrid1.RowCount+1;
        end;
    end;
    //获取UDP连接表
    if AllocateAndGetUdpExTableFromStack(pUdpTab,true,GetProcessHeap(),2,2)<>0 then
    begin
        MessageBox(self.Handle,'无法获取UDP连接表','调用失败',MB_ICONEXCLAMATION or MB_OK);
    end
    else
    begin
        //输出UDP连接表
        for i:=0 to pUdpTab.dwNumEntries-1 do
        begin
            self.StringGrid1.Cells[0,self.StringGrid1.RowCount-1]:=
                'UDP';
            self.StringGrid1.Cells[1,self.StringGrid1.RowCount-1]:=
                inet_ntoa(TInAddr(pUdpTab.table[i].dwLocalAddr))+
                ':'+IntToStr(ntohs(pUdpTab.table[i].dwLocalPort));
            self.StringGrid1.Cells[2,self.StringGrid1.RowCount-1]:=
                '*.*.*.*:*';
            self.StringGrid1.Cells[3,self.StringGrid1.RowCount-1]:=
                '';
            self.StringGrid1.Cells[4,self.StringGrid1.RowCount-1]:=
                IntToStr(pUdpTab.table[i].dwProcessId);
            self.StringGrid1.Cells[5,self.StringGrid1.RowCount-1]:=
                IdToExeFile(hSnapshot,PUdpTab.table[i].dwProcessId);
            self.StringGrid1.Cells[6,self.StringGrid1.RowCount-1]:=
                IdToExeDir(pUdpTab.table[i].dwProcessId);
            self.StringGrid1.Cells[7,self.StringGrid1.RowCount-1]:=
                ExeDirToFileInfo(self.StringGrid1.Cells[6,self.StringGrid1.RowCount-1]);
            self.StringGrid1.RowCount:=self.StringGrid1.RowCount+1;
        end;
    end;
    //关闭句柄
    CloseHandle(hSnapshot);
    //
    if self.StringGrid1.RowCount=2 then
    begin
        self.Label1.Caption:='发现 TCP/UDP 连接端口： 0 个';
        self.StringGrid1.Cells[0,1]:='空';
        self.StringGrid1.Cells[1,1]:='';
        self.StringGrid1.Cells[2,1]:='';
        self.StringGrid1.Cells[3,1]:='';
        self.StringGrid1.Cells[4,1]:='';
        self.StringGrid1.Cells[5,1]:='';
        self.StringGrid1.Cells[6,1]:='';
        self.StringGrid1.Cells[7,1]:='';
    end
    else
    begin
        self.StringGrid1.RowCount:=self.StringGrid1.RowCount-1;
        self.Label1.Caption:=Format('发现 TCP/UDP 连接端口： %d 个',
            [self.StringGrid1.RowCount-1]);
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
    ColLen : array of Integer;
    c,r,n : Integer;
    f : TFileStream;
    s : String;
begin
    if (self.StringGrid1.ColCount=0) or
       (self.StringGrid1.RowCount=0) then exit;
    if not self.SaveDialog1.Execute then exit;
    //计算每列字符长度
    SetLength(ColLen,self.StringGrid1.ColCount);
    for c:=0 to self.StringGrid1.ColCount-1 do
    begin
        ColLen[c]:=0;
        for r:=0 to self.StringGrid1.RowCount-1 do
        begin
            n:=Length(self.StringGrid1.Cells[c,r]);
            if n>ColLen[c] then ColLen[c]:=n;
        end;
        ColLen[c]:=ColLen[c]+1;
    end;
    //每列对齐后写入文件
    f:=TFileStream.Create(self.SaveDialog1.FileName,fmCreate);
    for r:=0 to self.StringGrid1.RowCount-1 do
    begin
        for c:=0 to self.StringGrid1.ColCount-1 do
        begin
            s:=self.StringGrid1.Cells[c,r];
            n:=Length(s);
            s:=s+DupeString(' ',ColLen[c]-n);
            f.Write(Pointer(s)^,ColLen[c]);
        end;
        s:=#13#10#32;
        f.Write(Pointer(s)^,3);
    end;
    MessageBox(self.Handle,PChar(
        '连接表信息已保存到文件 '+
        self.SaveDialog1.FileName+
        ' 中。'),'保存完毕',MB_ICONINFORMATION or MB_OK);
    //
    SetLength(ColLen,0);
    f.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    MessageBox(self.Handle,
        '进程连接端口查看器'+#13+#13+
        '作者：yeye55'+#13+#13+
        '2008年2月25日'+#13+#13+
        '本程序最早在http://www.programbbs.com/bbs/上发布',
        '关于',MB_ICONASTERISK or MB_OK);
end;

end.


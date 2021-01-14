unit mainut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ExtCtrls, jpeg,shellapi, ImgList, XPMan, DB,
  ADODB,registry,inifiles;

type
  Tmainfm = class(TForm)
    MainMenu: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N42: TMenuItem;
    N40: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    mainpl: TPanel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    StatusBar: TStatusBar;
    Timer1: TTimer;
    PrinterSetupDialog1: TPrinterSetupDialog;
    ImageList1: TImageList;
    XPManifest1: TXPManifest;
    Image1: TImage;
    adoquery: TADOQuery;
    adoquery1: TADOQuery;
    N21: TMenuItem;
    N39: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
    PopupMenu: TPopupMenu;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N62: TMenuItem;
    N110: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    N111: TMenuItem;
    N69: TMenuItem;
    N70: TMenuItem;
    N71: TMenuItem;
    N74: TMenuItem;
    ftpado: TADOQuery;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N37Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure N58Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N59Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure N65Click(Sender: TObject);
    procedure N68Click(Sender: TObject);
    procedure N69Click(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure N75Click(Sender: TObject);
    procedure N77Click(Sender: TObject);
    procedure ftp1Click(Sender: TObject);
    procedure NMFTP1TransactionStart(Sender: TObject);
    procedure NMFTP1TransactionStop(Sender: TObject);
    procedure NMFTP1Error(Sender: TComponent; Errno: Word; Errmsg: String);
    procedure NMFTP1ConnectionFailed(Sender: TObject);
    procedure NMFTP1InvalidHost(var Handled: Boolean);
  private
      FSerial: string;         //主板序列号
       procedure DeleteDir(sDirectory: String);
       procedure checkreg;
      //function GetCPUID : string; assembler; register;
    { Private declarations }
  public
   logined:boolean;
   id,username,userpas:string;
    { Public declarations }
     regflag,datenum:string;
    sdjbh:string;
    iyf:integer;
    sxz:string;
    s_jd:string;
   function  GetHDSerialNumber(Drv:String):String;
   function encrypt0(s:string):string;
    function encrypt(s:string):string;
   function decrypt(s:string):string;
    function encrypt1(s:string):string;
   function decrypt1(s:string):string;
   function decrypt0(s:string):string;
  end;

var
  mainfm: Tmainfm;
  vreg:integer;


implementation


uses loginut, inut, Unit1, infindut, chcxut, kccxut, perut, czyglut,
  clbhut, ghsut, bfhyut, xgmmut, gyut, yjcut, ybb, ckybbut, kcmxut, bqjcut,
  rkgmut, ckglut, kcglut, xtcshut, xyriut, ckylrbbut, rjzcut, kcyjut,
  clthut, lltkut, cprkut, cpckut, tlcx, cprkcx, cpck,thcx, khcxut, lrdy,
  lrbbdy, cpkccxut, ftput, dataut;

{$R *.dfm}
function Tmainfm.encrypt0(s:string):string;
 var
   i,j,k:integer;
   s1:string;
  begin
   s1:='';
   j:=length(s);
   for i:=1 to j  do
   begin
   //k:=j-i+1;
    if s[i]='-' then
    s1:=s1+s[i]
    else
     s1:=s1+chr(ord(s[i])+i-1)
   end;
   result:=s1
    end;
function Tmainfm.decrypt0(s:string):string;
 var
   i,j,k:integer;
   s1:string;
  begin
   s1:='';
   j:=length(s);
   for i:=1 to j  do
   begin
   //k:=j-i+1;
    if s[i]='-' then
    s1:=s1+s[i]
    else
     s1:=s1+chr(ord(s[i])-i+1)
   end;
   result:=s1
    end;
function Tmainfm.encrypt(s:string):string;
 var
   i,j,k:integer;
   s1:string;
  begin
   s1:='';
   j:=length(s);
   for i:=1 to j  do
   begin
   k:=j*j-i*i+3;
    s1:=s1+chr(ord(s[i])+k);
   end;
   result:=s1
    end;
 function Tmainfm.encrypt1(s:string):string;
 var
   i,j,k:integer;
   s1:string;
  begin
   s1:='';
   j:=length(s);
   for i:=1 to j  do
   begin
   k:=j*j-i*i+3;
    s1:=s1+chr(ord(s[i])+k+1);
   end;
   result:=s1;
   end;
function Tmainfm.decrypt(s:string):string;
var
    i,j,k:integer;
   s1:string;
   begin
   s1:='';
   j:=length(s);
   for i:=1 to j  do
   begin
   k:=j*j-i*i+3;
   s1:=s1+chr(ord(s[i])-k);
    end;
    result:=s1
   end;
   function Tmainfm.decrypt1(s:string):string;
var
    i,j,k:integer;
   s1:string;
   begin
   s1:='';
   j:=length(s);
   for i:=1 to j  do
   begin
   k:=j*j-i*i+3;
   s1:=s1+chr(ord(s[i])-k-1);
    end;
    result:=s1
   end;
{procedure Tmainfm.SetSerial;
begin
 //取得主板的序列号
 FSerial := String(Pchar(Ptr($FEC71)));
end;   }
 //获取磁盘序列号
 function Tmainfm.GetHDSerialNumber(Drv:String):String;
var
    VolumeSerialNumber:DWORD;
    MaximumComponentLength:DWORD;
    FileSystemFlags:DWORD;
begin
    if Drv[Length(Drv)]=':' then
    Drv:=Drv+'\';
    GetVolumeInformation(pChar(Drv),nil,0,@VolumeSerialNumber,MaximumComponentLength,FileSystemFlags,nil,0);
    Result:=IntToHex(HiWord(VolumeSerialNumber),4)+'-'+IntToHex(LoWord(VolumeSerialNumber),4);
end;


 //获取CPUID信息，返回值为TCPUID类型
{function Tmainfm.GetCPUID : TCPUID; assembler; register;
asm
  PUSH    EBX
  PUSH    EDI
  MOV     EDI,EAX
  MOV     EAX,1
  DW      $A20F  //CPUID指令
  STOSD          //CPUID[1]
  MOV     EAX,EBX
  STOSD          //CPUID[2]
  MOV     EAX,ECX
  STOSD          //CPUID[3]
  MOV     EAX,EDX
  STOSD          //CPUID[4]
  POP     EDI 
  POP     EBX
end;
//具体使用方法: 
const
  CPUSubModels: array[0..4] of string = ('Primary','OverDrive','Secondary','Reserved','Not Detected');
  ID_BIT=$200000; //CPU ID 位标记
  var
  CPUID: TCPUID;
  SubModel: string;
  SubModelID, Family, Model, Stepping: Integer;
begin
  //如果CPUID信息有效
  if IsCPUIDAvailable then
  begin
    fillchar(CPUID, sizeof(CPUID), -1);
    CPUID := GetCPUID;
    SubModelID := CPUID[1] shr 12 and 3;
    Family := CPUID[1] shr 8  and $F;
    Model  := CPUID[1] shr 4  and $F;
    Stepping:= CPUID[1] and $F;
    if SubModelID < 4 then
      SubModel := CPUSubModels[SubModelID]
    else
      SubModel := CPUSubModels[4];
  end;
end; }

procedure Tmainfm.checkreg;
var
 filename,Serial:string;
 myinifile:Tinifile;
 num,Vserial:string;
 Dir: array [0..255] of Char;
 Fn:string;
 I:integer;
 h,j,k:integer;
 s1:string;
begin
 GetSystemDirectory(@Dir, 255);
 //showmessage(Vserial);
 Vserial:=GetHDSerialNumber('C:\');
For I := 0 to 255 do
   begin
     if Ord(Dir[I]) = 0 then Break;
       Fn := Fn + Dir[I];
   end;

filename:=application.GetNamePath+'ini/data.ini';
myinifile:=Tinifile.Create(filename);
if fileexists(filename)=false then
 begin
 // myinifile.WriteString(encrypt('datenum'),encrypt('datenum'),encrypt('40'));
  //myinifile.WriteString(encrypt1('regflag'),encrypt1('regflag'),encrypt1('zwy255'));
 // myinifile.WriteString(encrypt('Serial'),encrypt('Serial'),encrypt(Vserial+'-z0w-0y1'));
 // myinifile.WriteString('times',encrypt('times'),'100');
  //myinifile.WriteString('date',encrypt('dates'),'0');
   showmessage('数据文件丢失，程序运行终止！！');
   application.Terminate;
   exit;
 end;
    regflag:=decrypt1(myinifile.readstring(encrypt1('regflag'),encrypt1('regflag'),encrypt1('')));
    Serial:=decrypt(myinifile.readstring(encrypt('Serial'),encrypt('Serial'),encrypt('')));
    datenum:=decrypt(myinifile.readstring(encrypt('datenum'),encrypt('datenum'),encrypt('')));
    num:=datenum;
    if (num<'0') or (num>'9') then
       begin
        showmessage('系统文件损坏，程序终止');
        application.Terminate;
        exit;
       end;
    if (strtoint(num)<0) or (strtoint(num)>40) then
       begin
        showmessage('系统文件损坏，程序终止');
        application.Terminate;
        exit;
       end;
      VSerial:=mainfm.encrypt0(VSerial);
   if (regflag<>VSerial) then
       begin
         regflag:=' 软件未注册,';
         datenum:='剩余试用次数为'+inttostr(strtoint(num)-1)+'次,请做好数据备份！';
           if num<='0' then
              begin
                showmessage('软件试用期已到,运行终止由此给你带来的不便表示抱歉,继续使用请购买正版软件谢谢！');
                application.Terminate;
                exit;
              end;
       myinifile.WriteString(encrypt('regflag'),encrypt('regflag'),encrypt('111111'));
       myinifile.WriteString(encrypt('datenum'),encrypt('datenum'),encrypt(inttostr(strtoint(num)-1)));
       end
   else
       begin
       // if Vserial<>regflag then
        // begin
          // showmessage('非法拷贝！程序终止,请与软件供应商联系！！');
           //application.Terminate;
           //exit;
        // end
        //else
          begin
            regflag:='  软件已注册!!';
            datenum:='';
          end;

      end;
     end;

procedure Tmainfm.DeleteDir(sDirectory: String);
//删除目录和目录下得所有文件和文件夹
var
  sr: TSearchRec;
  sPath,sFile: String;
begin
  //检查目录名后面是否有 '\'
  if Copy(sDirectory,Length(sDirectory),1) <> '\' then
    sPath := sDirectory + '\'
  else
    sPath := sDirectory;
  //------------------------------------------------------------------
  if FindFirst(sPath+'*.*',faAnyFile, sr) = 0 then
  begin
    repeat
      sFile:=Trim(sr.Name);
      if sFile='.' then Continue;
      if sFile='..' then Continue;
      sFile:=sPath+sr.Name;
      if (sr.Attr and faDirectory)<>0 then
        DeleteDir(sFile)
      else if (sr.Attr and faAnyFile) = sr.Attr then
        DeleteFile(sFile);                        //删除文件
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  RemoveDir(sPath);
  //------------------------------------------------------------------
end;

procedure Tmainfm.FormCreate(Sender: TObject);
var
i:integer;
begin
logined:=false;
i:=0;
autoscroll:=false;
windowstate:=wsMaximized;
logined:=false;
if not fileexists(application.GetNamePath+'data/kcgl.mdb') then
  begin
    showmessage('系统数据库文件丢失，程序运行终止！解决方法：提出backup文件夹下的备份文件改名称为"kcgl.mdb"到data文件夹中');

    application.Terminate;
      exit;
  end;
//checkreg;
statusbar.Panels.Items[3].Text:=datetostr(date())+'  '+timetostr(time());
mainfm.Caption:=mainfm.Caption+regflag+datenum;

end;

procedure Tmainfm.FormActivate(Sender: TObject);
begin
if not logined then
begin
loginfm.showmodal;
logined:=true;
end;
end;
procedure Tmainfm.N2Click(Sender: TObject);
begin
//xtczrzfm.rzmo.Lines.Add('操作：'+infm.Caption+'-->>'+datetimetostr(date()+time()));
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n2.Caption;

infm:=Tinfm.create(self);
infm.showmodal;
infm.free;
end;

procedure Tmainfm.N4Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n4.Caption;

outfm:=Toutfm.create(self);
outfm.showmodal;
outfm.free;
end;

procedure Tmainfm.N7Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n7.Caption;
rkcxfm:=Trkcxfm.create(self);
rkcxfm.showmodal;
rkcxfm.free;
end;

procedure Tmainfm.N9Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n9.Caption;
ckcxfm:=Tckcxfm.create(self);
ckcxfm.showmodal;
ckcxfm.free;
end;

procedure Tmainfm.N44Click(Sender: TObject);
var
  MyTextFile:TextFile;
  i:integer;
  opstruc:tshfileopstruct;
  frombuf,tobuf:array[0..128]of char;
  Present: TDateTime;
  Year, Month, Day: Word;
  datapath:string;
  zjdz,yhzh,mm,ml:string;
begin
datapath:=extractfilepath(paramstr(0));

mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n44.Caption;

  //ztfm.panel1.caption:='正在系统日志存盘...';
if not FileExists(datapath+'logfile/Log.txt') then   //将系统日志存盘
       begin
         createdir(datapath+'logfile');
         AssignFile(MyTextFile,datapath+'logfile/Log.txt');
         Rewrite(MyTextFile);
         try
           for i:=0 to xtczrzfm.rzmo.Lines.Count-1 do
             Writeln(MyTextFile,xtczrzfm.rzmo.lines[i]);
         finally
           CloseFile(MyTextFile)
         end;
       end
       else
       begin
         AssignFile(MyTextFile,datapath+'logfile/Log.txt');
         Append(MyTextFile);
         try
           for i:=0 to xtczrzfm.rzmo.Lines.Count-1 do
             Writeln(MyTextFile,xtczrzfm.rzmo.lines[i]);
         finally
           CloseFile(MyTextFile)
         end;
       end;
Present:=date();
DecodeDate(Present, Year, Month, Day);
//ztfm.panel1.caption:='正在备份数据...';
if Day=1 then
  begin
   DeleteDir(application.GetNamePath+'backup');
  end;
  begin
  if directoryexists(datapath+'backup')=false then
createdir(datapath+'backup');
if fileexists(datapath+'backup/'+datetostr(date())+'kcgl.bak') then
deletefile(datapath+'backup/'+datetostr(date())+'kcgl.bak');
    fillchar(frombuf,sizeof(frombuf),0);
    fillchar(tobuf,sizeof(tobuf),0);
    strpcopy(frombuf,pchar(datapath+'data/kcgl.mdb'));
    strpcopy(tobuf,pchar(datapath+'backup/'+datetostr(date())+'kcgl.bak'));
    with opstruc do
    begin
wnd:=handle;
wfunc:=fo_copy;
pfrom:=@frombuf;
pto:=@tobuf;
fflags:=fof_noconfirmation or fof_renameoncollision;
fanyoperationsaborted:=false;
hnamemappings:=nil;
lpszprogresstitle:=nil;
end;
if shfileoperation(opstruc)=0 then
begin
 showmessage('数据自动备份成功！')
 //ztfm.panel1.caption:='数据备份完毕...';
end;
  end;

  if messagedlg('确定退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
application.Terminate;
end;

procedure Tmainfm.N11Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n11.Caption;

kccxfm:=Tkccxfm.create(self);
kccxfm.showmodal;
kccxfm.free;
end;

procedure Tmainfm.N23Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n23.Caption;
ryglfm:=Tryglfm.create(self);
ryglfm.showmodal;
ryglfm.free;
end;

procedure Tmainfm.N25Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n25.Caption;
czyglfm:=Tczyglfm.create(self);
czyglfm.showmodal;
czyglfm.free;
end;

procedure Tmainfm.N27Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n27.Caption;
clbhfm:=Tclbhfm.create(self);
clbhfm.showmodal;
clbhfm.free;
end;

procedure Tmainfm.N29Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n29.Caption;
ghsglfm:=Tghsglfm.create(self);
ghsglfm.showmodal;
ghsglfm.free;
end;

procedure Tmainfm.N31Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n31.Caption;
sjbffm:=Tsjbffm.create(self);
sjbffm.showmodal;
sjbffm.free;
end;

procedure Tmainfm.N33Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n33.Caption;
xgmmfm:=Txgmmfm.create(self);
xgmmfm.showmodal;
xgmmfm.free;
end;

procedure Tmainfm.N42Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n42.Caption;
gyfm:=Tgyfm.create(self);
gyfm.showmodal;
gyfm.free;
end;

procedure Tmainfm.Timer1Timer(Sender: TObject);
begin
statusbar.Panels.Items[3].Text:=datetostr(date())+'  '+timetostr(time());
statusbar.Panels.Items[2].Text:='欢迎使用库存管理系统!!';

end;

procedure Tmainfm.N15Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n15.Caption;
rkybbfm:=Trkybbfm.Create(self);
rkybbfm.quickrep1.preview;
rkybbfm.Free;
end;

procedure Tmainfm.N17Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n17.Caption;
ckybbfm:=Tckybbfm.Create(self);

ckybbfm.quickrep1.preview;

ckybbfm.Free;
end;

procedure Tmainfm.N19Click(Sender: TObject);
var
mypath,str,str1,id:string;
qqkc,bqjh,bqxh:integer;
qqje:double;

begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n19.Caption;
{begin
mypath:=extractfilepath(paramstr(0));
adoquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
adoquery1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
str:='delete from lskcb';
with adoquery do
 begin
  close;
  sql.Clear;
  sql.add(str);
  execsql;
 end;
str:='insert into lskcb(名称,编号,品类,单位,总金额,货位,规格,款式,前期库存,本期进货,本期消耗,期末库存) select *  from kcb';
 with adoquery do
 begin
  close;
  sql.Clear;
  sql.Add(str);
  execsql;
 end;
{str:='select * from hzb';
with adoquery do
  begin
    close;
    sql.Clear;
    sql.Add(str);
    open;
    if recordcount>0 then
     begin
        first;
        while not eof do
         begin
           qqkc:=fieldbyname('前期库存').AsInteger;
           qqje:=fieldbyname('前期金额').AsVariant;
           id:=fieldbyname('材料编号').AsString;
            str1:='update kcb set 前期库存=:qqkc where 编号=:bh';
            with adoquery1 do
             begin
              close;
              sql.Clear;
              sql.Add(str1);
              parameters.ParamByName('qqkc').Value:=qqkc;
              Parameters.ParamByName('bh').Value:=id;
              //qmkc
              execsql;
            end;
            next;
        end;
     end;
  end; }

{str:='select * from lskcb';
  with adoquery do
   begin
    close;
    sql.Clear;
    sql.Add(str);
    open;
     first;
     while not eof do
      begin
        bqjh:=fieldbyname('本期进货').asinteger;
        bqxh:=fieldbyname('本期消耗').asinteger;
        qqkc:=fieldbyname('前期库存').asinteger;
        id:=fieldbyname('编号').AsString;
        str1:='update  kcb set 期末库存=:qmkc where 编号=:id';
        with adoquery1 do
         begin
         close;
         sql.Clear;
          sql.Add(str1);
           Parameters.ParamByName('qmkc').Value:=qqkc+bqjh-bqxh;
           Parameters.ParamByName('id').Value:=id;
          execsql;
         end;
         next;
      end;
   end;
 end; }

kcmxfm:=Tkcmxfm.Create(self);
kcmxfm.kcmx.preview;
kcmxfm.Free;
{if messagedlg('现在进行下期数据处理吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
      bqjcfm:=Tbqjcfm.create(self);
      bqjcfm.showmodal;
      bqjcfm.free;
  end;}
end;

procedure Tmainfm.N35Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n35.Caption;
loginfm.ShowModal;
end;

procedure Tmainfm.N40Click(Sender: TObject);
begin
mainfm.statusbar.Panels.Items[1].Text:='当前操作：'+n40.Caption;
printersetupdialog1.Execute;
end;

procedure Tmainfm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{ with ftpado do
    begin
      close;
      sql.Clear;
      sql.Add('select * from ftp表');
      open;
      first;
      if recordcount>=1 then
        begin
         nmftp1.Host :=fieldbyname('主机地址').AsString;
         nmftp1.UserID :=fieldbyname('用户帐号').AsString;
         nmftp1.Password := fieldbyname('密码').AsString;
         nmftp1.Connect ;
         nmftp1.ChangeDir(fieldbyname('目录').AsString);
          nmftp1.Connect ;
         sleep(5000);
         nmftp1.Upload(extractfilepath(paramstr(0))+'data/kcgl.mdb','kcgl.mdb');
         showmessage('数据上传成功');
        // nmftp1.Disconnect;
       end;
    end; }
  if messagedlg('确定退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
application.Terminate;
end;

procedure Tmainfm.N37Click(Sender: TObject);
begin
shellexecute(handle,'open',pchar(application.GetNamePath+'help/help.htm'),nil,nil,SW_SHOWNORMAL);

end;

procedure Tmainfm.N21Click(Sender: TObject);
begin
bqjcfm:=Tbqjcfm.create(self);
bqjcfm.showmodal;
bqjcfm.free;
end;

procedure Tmainfm.N49Click(Sender: TObject);
begin

cpkccxfm:=Tcpkccxfm.create(self);
cpkccxfm.showmodal;
cpkccxfm.free;
end;

procedure Tmainfm.N51Click(Sender: TObject);
begin
//ckglfm:=Tckglfm.create(self);
//ckglfm.showmodal;
//ckglfm.free;
end;

procedure Tmainfm.N53Click(Sender: TObject);
begin
kcglfm:=Tkcglfm.create(self);
kcglfm.showmodal;
kcglfm.free;
end;

procedure Tmainfm.N56Click(Sender: TObject);
begin
xtcshfm:=Txtcshfm.create(self);
xtcshfm.showmodal;
xtcshfm.free;
end;

procedure Tmainfm.N58Click(Sender: TObject);
begin
//xtczrzfm:=Txtczrzfm.create(self);
xtczrzfm.showmodal;
//xtczrzfm.free;
end;

procedure Tmainfm.N61Click(Sender: TObject);
begin
lrdyfm:=Tlrdyfm.Create(self);

lrdyfm.showmodal;

lrbbfm.Free;
end;

procedure Tmainfm.N59Click(Sender: TObject);
begin
rjzcfm:=Trjzcfm.Create(self);

rjzcfm.showmodal;

rjzcfm.Free;
end;

procedure Tmainfm.N13Click(Sender: TObject);
begin
kcyjfm:=Tkcyjfm.create(self);
kcyjfm.showmodal;
kcyjfm.free;
end;

procedure Tmainfm.N62Click(Sender: TObject);
begin
clthfm:=Tclthfm.create(self);
clthfm.showmodal;
clthfm.free;
end;

procedure Tmainfm.N63Click(Sender: TObject);
begin
lltkfm:=Tlltkfm.create(self);
lltkfm.showmodal;
lltkfm.free;
end;

procedure Tmainfm.N65Click(Sender: TObject);
begin
 cprkfm:=Tcprkfm.create(self);
 cprkfm.showmodal;
 cprkfm.free;
end;

procedure Tmainfm.N68Click(Sender: TObject);
begin
 cpckfm:=Tcpckfm.create(self);
 cpckfm.showmodal;
 cpckfm.free;
end;

procedure Tmainfm.N69Click(Sender: TObject);
begin
tlcxfm:=Ttlcxfm.create(self);
tlcxfm.showmodal;
tlcxfm.free;
end;

procedure Tmainfm.N71Click(Sender: TObject);
begin
thcxfm:=Tthcxfm.create(self);
thcxfm.showmodal;
thcxfm.free;
end;

procedure Tmainfm.N73Click(Sender: TObject);
begin
 cprkcxfm:=Tcprkcxfm.create(self);
cprkcxfm.showmodal;
cprkcxfm.free;
end;

procedure Tmainfm.N75Click(Sender: TObject);
begin
 cpckcxfm:=Tcpckcxfm.create(self);
cpckcxfm.showmodal;
cpckcxfm.free;
end;

procedure Tmainfm.N77Click(Sender: TObject);
begin
 khcxfm:=Tkhcxfm.create(self);
khcxfm.showmodal;
khcxfm.free;
end;

procedure Tmainfm.ftp1Click(Sender: TObject);
begin
 ftpfm:=Tftpfm.create(self);
ftpfm.showmodal;
ftpfm.free;
end;

procedure Tmainfm.NMFTP1TransactionStart(Sender: TObject);
begin
showmessage('开始数据传输，清等待几分钟,直到出现"文件传输结束"提示后才可以退出系统');
//ztfm.Show;
end;

procedure Tmainfm.NMFTP1TransactionStop(Sender: TObject);
begin
showmessage('文件传输结束！');
//ztfm.Close;
end;

procedure Tmainfm.NMFTP1Error(Sender: TComponent; Errno: Word;
  Errmsg: String);
begin
showmessage('数据传输错误!!');
end;

procedure Tmainfm.NMFTP1ConnectionFailed(Sender: TObject);
begin
showmessage('连接服务器失败!');
end;

procedure Tmainfm.NMFTP1InvalidHost(var Handled: Boolean);
begin
showmessage('连接服务器失败!');
end;

end.

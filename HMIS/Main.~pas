unit Main;          //医院信息系统主窗体单元

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, ComCtrls, ToolWin, mxOutlookBarPro, StdCtrls;

type
  TF_Main = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    mxLBar: TmxOutlookBarPro;
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Timer_Time: TTimer;
    ImageList2: TImageList;
    ImageList4: TImageList;
    ImageList5: TImageList;
    procedure Timer_TimeTimer(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure mxLBarHeaders0Buttons0Click(Sender: TObject);
    procedure mxLBarHeaders0Buttons1Click(Sender: TObject);
    procedure mxLBarHeaders0Buttons2Click(Sender: TObject);
    procedure mxLBarHeaders1Buttons0Click(Sender: TObject);
    procedure mxLBarHeaders1Buttons1Click(Sender: TObject);
    procedure mxLBarHeaders1Buttons2Click(Sender: TObject);
    procedure mxLBarHeaders2Buttons0Click(Sender: TObject);
    procedure mxLBarHeaders2Buttons1Click(Sender: TObject);
    procedure mxLBarHeaders2Buttons2Click(Sender: TObject);
    procedure mxLBarHeaders2Buttons3Click(Sender: TObject);
    procedure mxLBarHeaders3Buttons0Click(Sender: TObject);
    procedure mxLBarHeaders3Buttons1Click(Sender: TObject);
    procedure mxLBarHeaders3Buttons2Click(Sender: TObject);
    procedure mxLBarHeaders3Buttons3Click(Sender: TObject);
    procedure mxLBarHeaders4Buttons0Click(Sender: TObject);
    procedure mxLBarHeaders4Buttons1Click(Sender: TObject);
    procedure mxLBarHeaders4Buttons2Click(Sender: TObject);
    procedure mxLBarHeaders4Buttons3Click(Sender: TObject);
    procedure mxLBarHeaders4Buttons4Click(Sender: TObject);
    procedure mxLBarHeaders5Buttons0Click(Sender: TObject);
    procedure mxLBarHeaders5Buttons1Click(Sender: TObject);
    procedure mxLBarHeaders5Buttons2Click(Sender: TObject);
    procedure mxLBarHeaders5Buttons3Click(Sender: TObject);
    procedure mxLBarHeaders5Buttons4Click(Sender: TObject);
    procedure mxLBarHeaders5Buttons6Click(Sender: TObject);
    procedure mxLBarHeaders5Buttons7Click(Sender: TObject);
    procedure mxLBarHeaders5Buttons5Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure msmv(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Label4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Operator,DateTime:AnsiString;  //用户自定义操作员、当前时间变量
    Popedom : string;  //用户权限值变量
    function CreateForm(CForm:TForm):boolean;  //用户自定义MDIChild子窗体存在判断函数
    procedure BackupDatabase(FileName:AnsiString);  //用户自定义备份SQL Server 2000数据库函数
    procedure RestoreDatabase(FileName:AnsiString); //用户自定义还原SQL Server 2000数据库函数
  end;

var
  F_Main: TF_Main;

implementation

uses Assistant, CDrug, CMoney, CRegister, DataModule, HRegister, OnDuty,
     Pass_Pope_Modify, Person, PInput, PKucun, CRPrint, URegister, IniFiles,
     AboutBox, Login;

{$R *.dfm}
function TF_Main.CreateForm(CForm:TForm):boolean;
var  {*****用户自定义MDIChild子窗体存在判断函数*****}
    No:integer;
    FormExist:boolean;
begin
    FormExist := false;
    if (CForm = NiL) then   //判断CForm是否为空
       begin
       CreateForm := false; //函数返回值赋false
       exit;                //退出本函数
       end;
    for No:=0 to Screen.FormCount-1 do //判断窗体是否已经被建立起来
      begin
      if Screen.Forms[No].ClassType = CForm.ClassType then  //窗体存在判断
        FormExist := true;  //窗体已经创建，用户没看到可能是处于隐藏或者最小化
      end;
    if FormExist = false then //窗体没有创建，返回false
      CreateForm := false;
    if CForm.WindowState = wsMinimized then  //窗体已经创建，但处于最小化状态
      ShowWindow(CForm.Handle,SW_SHOWNORMAL) //显示窗体
    else                                     //窗体已经创建，但处于隐藏状态
      ShowWindow(CForm.Handle,SW_SHOWNA);    //显示窗体
    if not CForm.Visible then
      CForm.Visible := true;
    CForm.BringToFront;  //当前窗口显示在最面前
    CForm.SetFocus;      //把光标的焦点转移到刚才创建或显示的窗口上
    CreateForm := true;    //函数返回值赋true
end;


procedure TF_Main.BackupDatabase(filename:AnsiString);
var  {*****用户自定义备份SQL Server 2000数据库函数*****}
    Backup,str:AnsiString;
    ini:TIniFile;
begin
    DM.AQ_SQL.Close;      //关闭数据库备份还原查询控件
    DM.AQ_SQL.SQL.Clear;  //清除SQL语句
    Backup := 'BACKUP DATABASE ';  //生成数据库备份命令赋Backup字符串
    //打开医院信息系统数据库INI配置文件，如果不存在则创建
    ini := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
    str := ini.ReadString('Database','Initial Catalog','Archives'); //从配置文件读数据库名
    Backup := Backup+str;  //追加医院信息系统数据库名，+1的目的是前面有个空格
    DM.AQ_SQL.SQL.Add(Backup); //增加备份数据库RESTORE命令SQL语句
    str := 'TO DISK =''';  //生成备份数据库文件的路径和文件名字符串
    str := str+filename;
    str := str+'''';
    DM.AQ_SQL.SQL.Add(str);  //增加备份数据库的路径和文件名字符串SQL语句
    DM.AQ_SQL.SQL.Add('WITH init'); //备份数据库SQL语句WITH参数设定，完整备份数据库
    try        //捕捉异常
      DM.AQ_SQL.ExecSQL;     //执行SQL语句，但不打开数据集
    except     //抛出异常
      Application.MessageBox('数据库备份出错', '错误！', mrOK);
    end;
end;

procedure TF_Main.RestoreDatabase(filename:AnsiString);
var  {*****用户自定义还原SQL Server 2000数据库函数*****}
   Restore,str:AnsiString;
   ini:TIniFile;
begin
    DM.AQ_SQL.Close;       //关闭数据库备份还原查询控件
    DM.AQ_SQL.SQL.Clear;  //清除SQL语句
    Restore := 'RESTORE DATABASE ';  //生成数据库还原命令赋Restore字符串
    //打开医院信息系统数据库INI配置文件
    ini := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI' ));
    str := ini.ReadString('Database','Initial Catalog','Archives'); //从配置文件读数据库名
    Restore := Restore+str;  //追加医院信息系统数据库名
    DM.AQ_SQL.SQL.Add(Restore);     //增加还原数据库SQL命令语句
    str := 'FROM DISK = ''';   //生成还原数据库文件的路径和文件名字符串
    str := str+filename;
    str := str+'''';
    DM.AQ_SQL.SQL.Add(str); //增加还原数据库文件的路径和文件名字符串SQL语句
    DM.AQ_SQL.SQL.Add(' WITH norecovery'); //还原数据库SQL语句WITH参数设定，完整还原数据库
    try        //捕捉异常
      DM.AQ_SQL.ExecSQL;     //执行SQL语句，但不打开数据集
    except     //抛出异常
      Application.MessageBox('数据库恢复出错', '错误！', mrOK);
    end;
end;

procedure TF_Main.Timer_TimeTimer(Sender: TObject);
var  {*****Timer_Time定时器响应事件*****}
    DT:TDateTime;
    i,j,k,h:word;
begin
    DT := Now;                      //Now()是取得当前日期时间函数
    DecodeDate(DT,i,j,k);         //分解日期
    DateTime := IntToStr(i)+'年'+IntToStr(j)+'月'+IntToStr(k)+'日  ';
    DecodeTime(DT,i,j,k,h);      //分解时间
    DateTime := DateTime+IntToStr(i)+'时'+IntToStr(j)+'分'+IntToStr(k)+'秒  ';
    case DayOfWeek(DT) of             //今天是星期几判断
         1 : DateTime := DateTime+'星期日';
         2 : DateTime := DateTime+'星期一';
         3 : DateTime := DateTime+'星期二';
         4 : DateTime := DateTime+'星期三';
         5 : DateTime := DateTime+'星期四';
         6 : DateTime := DateTime+'星期五';
         7 : DateTime := DateTime+'星期六';
    end;     
    StatusBar1.Panels.Items[2].Text := '当前操作员：' + Operator + '   权限: ' + Popedom;  
    StatusBar1.Repaint;  //更新显示   
end;

procedure TF_Main.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var  {*****StatusBar1状态栏OnDrawPanel事件*****}
    Time: TBitmap;
begin
    if Panel.ID = 1 then   //只在第三个Panels上显示图标与文字
      begin
      Time := TBitmap.Create;  //创建一个图像对象
      ImageList1.GetBitmap(0,Time); //从图像列表ImageList1取得第1幅位图赋Time
      StatusBar1.Canvas.Pen.Color := TColor(clSkyBlue);
      StatusBar1.Canvas.Brush.Color := TColor(clSkyBlue);
      StatusBar1.Canvas.Draw(Rect.Left,Rect.Top,Time);  //在状态栏里显示图像
      StatusBar1.Canvas.TextOut(Rect.Left+24,Rect.Top+1,DateTime); //显示当前日期
      end;
end;

procedure TF_Main.mxLBarHeaders0Buttons0Click(Sender: TObject);
begin  {*****门诊挂号系统按钮单击事件*****}
    if F_Main.CreateForm(F_CReg) = false then  //判断门诊挂号系统窗体是否已经创建
      F_CReg := TF_CReg.Create(Application);   //动态创建窗体
    F_CReg.Show;                   //显示门诊挂号系统窗口
end;

procedure TF_Main.mxLBarHeaders0Buttons1Click(Sender: TObject);
begin  {*****门诊划价收费取药按钮单击事件*****}
    if F_Main.CreateForm(F_CMoney) = false then  //判断门诊划价收费取药系统窗体是否已经创建
      F_CMoney := TF_CMoney.Create(Application);   //动态创建门诊划价收费取药系统窗体
    F_CMoney.Show;                    //显示门诊划价收费取药系统窗口
end;

procedure TF_Main.mxLBarHeaders0Buttons2Click(Sender: TObject);
var  {*****门诊挂号类别维护按钮单击事件*****}
    F_CRKind:TF_Assis;
begin
    F_CRKind := TF_Assis.Create(Application);  //动态创建门诊挂号类别维护窗体，继承辅助资料管理窗体
    DM.AT_Assis.Active := false;        //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'CRKind';  //表格名赋值
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
    F_CRKind.Caption := '门诊挂号类别维护';
    F_CRKind.DBGrid.Columns.Items[0].Title.Caption := '门诊挂号类别';  //DBGrid第1列标题赋值
    F_CRKind.DBGrid.Columns.Items[1].Title.Caption := '挂号费';
    F_CRKind.ShowModal;   //显示门诊挂号类别维护窗口
end;

procedure TF_Main.mxLBarHeaders1Buttons0Click(Sender: TObject);
begin  {*****药品入库按钮单击事件*****}
    if F_Input = nil then
      F_Input := TF_Input.Create(Application);  //动态创建药品入库管理窗体
    F_Input.ShowModal;                         //显示药品入库管理窗口
end;

procedure TF_Main.mxLBarHeaders1Buttons1Click(Sender: TObject);
begin  {*****药品出库药按钮单击事件*****}
    Application.MessageBox('药品出库管理窗口与药品入库管理窗口类似，请参照药品入库管理窗口', '提示', MB_ICONINFORMATION + MB_OK);
end;

procedure TF_Main.mxLBarHeaders1Buttons2Click(Sender: TObject);
begin  {*****药品库存按钮单击事件*****}
    if F_Kucun = nil then
      F_Kucun := TF_Kucun.Create(Application);  //动态创建药品库存管理窗体
    F_Kucun.ShowModal;                        //显示药品库存管理窗口
end;

procedure TF_Main.mxLBarHeaders2Buttons0Click(Sender: TObject);
begin  {*****住院登记按钮单击事件*****}
    if F_HReg = nil then
      F_HReg := TF_HReg.Create(Application);  //动态创建住院登记
    F_HReg.ShowModal;
end;

procedure TF_Main.mxLBarHeaders2Buttons1Click(Sender: TObject);
begin  {*****交预付款按钮单击事件*****}
    Application.MessageBox('交预付款窗口比较简单，请自行创建', '提示', MB_ICONINFORMATION + MB_OK);
end;

procedure TF_Main.mxLBarHeaders2Buttons2Click(Sender: TObject);
begin  {*****住院划价收费取药按钮单击事件*****}
    Application.MessageBox('住院划价收费取药管理窗口与门诊划价收费取药管理窗口类似，\n\t请参照门诊划价收费取药管理窗口', '提示', MB_ICONINFORMATION + MB_OK);
end;

procedure TF_Main.mxLBarHeaders2Buttons3Click(Sender: TObject);
begin  {*****出院结算按钮单击事件*****}
    Application.MessageBox('出院结算窗口比较简单，请自行创建', '提示', MB_ICONINFORMATION + MB_OK);
end;

procedure TF_Main.mxLBarHeaders3Buttons0Click(Sender: TObject);
begin  {*****医务人员登记按钮单击事件*****}
    if F_Person = nil then
      F_Person := TF_Person.Create(Application);  //动态创建医务人员登记窗体
    F_Person.ShowModal;                         //显示医务人员登记窗口
end;

procedure TF_Main.mxLBarHeaders3Buttons1Click(Sender: TObject);
var  {*****部门维护按钮单击事件*****}
    F_Branch:TF_Assis;
begin
    F_Branch := TF_Assis.Create(Application);  //动态创建部门维护窗体，继承辅助资料管理窗体
    DM.AT_Assis.Active := false;        //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'Branch';  //表格名赋值
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
    F_Branch.Caption := '部门维护';
    F_Branch.DBGrid.Columns.Items[0].Title.Caption := '部门编号';  //DBGrid第1列标题赋值
    F_Branch.DBGrid.Columns.Items[1].Title.Caption := '部门名称';
    F_Branch.ShowModal;   //显示部门维护窗口
end;

procedure TF_Main.mxLBarHeaders3Buttons2Click(Sender: TObject);
var  {*****职务维护按钮单击事件*****}
    F_Duty:TF_Assis;
begin
    F_Duty := TF_Assis.Create(Application);  //动态创建职务维护窗体，继承辅助资料管理窗体
    DM.AT_Assis.Active := false;        //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'Duty';    //表格名赋值
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
    F_Duty.Caption := '职务维护';
    F_Duty.DBGrid.Columns.Items[0].Title.Caption := '职务编号';  //DBGrid第1列标题赋值
    F_Duty.DBGrid.Columns.Items[1].Title.Caption := '职务名称';
    F_Duty.ShowModal;   //显示部门职务窗口
end;

procedure TF_Main.mxLBarHeaders3Buttons3Click(Sender: TObject);
begin  {*****值班人员管理按钮单击事件*****}
    if F_ODuty = nil then
      F_ODuty := TF_ODuty.Create(Application);   //动态创建医务值班人员管理窗体
    F_ODuty.ShowModal;                         //显示医务值班人员管理窗口
end;

procedure TF_Main.mxLBarHeaders4Buttons0Click(Sender: TObject);
begin  {*****药品分类管理按钮单击事件*****}
    if F_CDrug = nil then
      F_CDrug := TF_CDrug.Create(Application);   //动态创建药品分类管理窗体
    F_CDrug.ShowModal;                         //显示药品分类管理窗口
end;

procedure TF_Main.mxLBarHeaders4Buttons1Click(Sender: TObject);
var  {*****药品种类维护按钮单击事件*****}
    F_KDrug:TF_Assis;
begin
    F_KDrug := TF_Assis.Create(Application);  //动态创建药品种类维护窗体，继承辅助资料管理窗体
    DM.AT_Assis.Active := false;        //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'KDrug';   //表格名赋值
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
    F_KDrug.Caption := '药品种类维护';
    F_KDrug.DBGrid.Columns.Items[0].Title.Caption := '药品种类编号';  //DBGrid第1列标题赋值
    F_KDrug.DBGrid.Columns.Items[1].Title.Caption := '药品种类名称';
    F_KDrug.ShowModal;   //显示药品种类维护窗口
end;

procedure TF_Main.mxLBarHeaders4Buttons2Click(Sender: TObject);
var  {*****治疗种类维护按钮单击事件*****}
    F_ICure:TF_Assis;
begin
    F_ICure := TF_Assis.Create(Application);  //动态创建治疗种类维护窗体，继承辅助资料管理窗体
    DM.AT_Assis.Active := false;        //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'ICure';   //表格名赋值
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
    F_ICure.Caption := '治疗种类维护';
    F_ICure.DBGrid.Columns.Items[0].Title.Caption := '治疗种类编号';  //DBGrid第1列标题赋值
    F_ICure.DBGrid.Columns.Items[1].Title.Caption := '治疗种类名称';
    F_ICure.ShowModal;   //显示治疗种类维护窗口
end;

procedure TF_Main.mxLBarHeaders4Buttons3Click(Sender: TObject);
var  {*****计量单位维护按钮单击事件*****}
    F_CUnit:TF_Assis;
begin
    F_CUnit := TF_Assis.Create(Application);  //动态创建计量单位维护窗体，继承辅助资料管理窗体
    DM.AT_Assis.Active := false;        //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'CUnit';   //表格名赋值
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
    F_CUnit.Caption := '计量单位维护';
    F_CUnit.DBGrid.Columns.Items[0].Title.Caption := '计量单位编号';  //DBGrid第1列标题赋值
    F_CUnit.DBGrid.Columns.Items[1].Title.Caption := '计量单位名称';
    F_CUnit.ShowModal;   //显示计量单位维护窗口
end;

procedure TF_Main.mxLBarHeaders4Buttons4Click(Sender: TObject);
var  {*****药品公司维护按钮单击事件*****}
    F_Comp:TF_Assis;
begin
    F_Comp := TF_Assis.Create(Application);  //动态创建计量单位维护窗体，继承辅助资料管理窗体
    DM.AT_Assis.Active := false;        //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'Company'; //表格名赋值
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
    F_Comp.Caption := '药品公司维护';
    F_Comp.DBGrid.Columns.Items[0].Title.Caption := '药品公司编号';  //DBGrid第1列标题赋值
    F_Comp.DBGrid.Columns.Items[1].Title.Caption := '药品公司名称';
    F_Comp.ShowModal;    //显示药品公司维护窗口
end;

procedure TF_Main.mxLBarHeaders5Buttons0Click(Sender: TObject);
begin  {*****系统等待按钮单击事件*****}
    //Application.MessageBox('系统等待也就是锁定本软件，需要验证后才能继续使用，请用户自行加上!', '提示', MB_ICONINFORMATION + MB_OK);
 //  if f_login=nil then
   //    f_login :=TF_login.create(application);
           f_login.Show ;
    //f_login.ShowModal;
   end;

procedure TF_Main.mxLBarHeaders5Buttons1Click(Sender: TObject);
begin  {*****用户注册按钮单击事件*****}
    if F_Register = nil then
      F_Register := TF_Register.Create(Application);   //动态创建用户注册窗体
    F_Register.ShowModal;                       //显示用户注册窗口
end;

procedure TF_Main.mxLBarHeaders5Buttons2Click(Sender: TObject);
begin  {*****修改密码按钮单击事件*****}
    if F_PP_Modi = nil then
      F_PP_Modi := TF_PP_Modi.Create(Application);    //动态创建修改密码窗体
    if Popedom = '管理员' then  //当前权限判断，如果是管理员可以修改权限，否则不能进行修改权限操作
      F_PP_Modi.CheckBox2.Visible := true
    else
      F_PP_Modi.CheckBox2.Visible := false;
    F_PP_Modi.ShowModal;                       //显示修改密码窗口
end;

procedure TF_Main.mxLBarHeaders5Buttons3Click(Sender: TObject);
var
    str:AnsiString;
    i:integer;
begin   {*****数据备份按钮单击事件*****}
    if SaveDialog1.Execute then  //用户打开数据库备份对话框后选择了保存按钮
      begin
      if FileExists(SaveDialog1.FileName) then
        begin
        str := SaveDialog1.FileName+'文件已经存在，要替换它吗？';
        i := Application.MessageBox(PChar(str),'另存为',mrOk);
        if i = mrOk then  //用户确定了替换操作
          begin
          BackupDatabase(SaveDialog1.FileName);  //BackupDatabase是用户自定义备份数据库函数
          exit;
          end
        else             //用户取消了替换操作
          exit;
        end;
      BackupDatabase(SaveDialog1.FileName);  //BackupDatabase是用户自定义备份数据库函数
      end;
end;

procedure TF_Main.mxLBarHeaders5Buttons4Click(Sender: TObject);
begin  {*****数据还原菜单项单击事件*****}
    if OpenDialog1.Execute then  //用户打开数据库还原对话框后选择了打开按钮
      RestoreDatabase(OpenDialog1.FileName);  //RestoreDatabase是用户自定义还原数据库函数
end;

procedure TF_Main.mxLBarHeaders5Buttons5Click(Sender: TObject);
var  {*****计算器按钮单击事件*****}
    Command:AnsiString;
    lpBuffer:array[0..128]of char;
    handle:HWND;
begin
              GetSystemDirectory(lpbuffer,128);   //取得system目录路径名
    //GetWindowsDirectory(lpBuffer,128);  //取得Windows目录路径名
    Command := StrPas(lpBuffer)+'\calc.exe';
    handle := FindWindow(nil,pchar(Command));  //查找应用程序
    if handle = 0 then  //如果进程没有运行
      WinExec(pchar(Command),SW_SHOW)     //建立进程
    else
      ShowWindow(handle,SW_SHOWNORMAL);   //进程窗口若被最小化，正常方式显示
end;

procedure TF_Main.mxLBarHeaders5Buttons6Click(Sender: TObject);
var  {*****本院主页按钮单击事件*****}
    Command:AnsiString;
    lpBuffer:array[0..128]of char;
    handle:HWND;
begin
    if InputQuery('输入框', '请医院网址',Command) then
      GetWindowsDirectory(lpBuffer,128); //取得Windows目录路径名
      Command := StrPas(lpBuffer)+'\EXPLORER.EXE /n,/e, http://'+Command;
      //查找同名进程是否在系统已经运行
      handle := FindWindow('ExploreWClass',pchar(Command));  //c_str()将AnsiString字符串转换成char
      if handle = 0 then  //如果进程没有运行
        WinExec(pchar(Command),SW_SHOW)  //建立进程
      else
        ShowWindow(handle,SW_SHOWNORMAL); //进程窗口若被最小化，正常方式显示

        end;

procedure TF_Main.mxLBarHeaders5Buttons7Click(Sender: TObject);
begin  {*****退出系统按钮单击事件*****}
    Close;  //关闭主窗口
end;

procedure TF_Main.ToolButton1Click(Sender: TObject);
begin  {*****帮助文件快捷按钮单击事件*****}
    Application.HelpContext(1);
end;

procedure TF_Main.ToolButton2Click(Sender: TObject);
begin  {*****关于快捷按钮单击事件*****}
    if F_AboutBox = nil then
      F_AboutBox := TF_AboutBox.Create(Application);  //动态创建关于窗体
    F_AboutBox.ShowModal;                         //显示关于窗口  
end;

procedure TF_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var  {*****主窗体关闭查询事件*****}
  iMsgFLag: integer;
begin
  CanClose := true;  //确认退出
  iMsgFlag := Application.MessageBox('真的要退出系统吗？', '提示', MB_ICONQUESTION +MB_OKCANCEL + MB_DEFBUTTON2) ;
  if iMsgFlag = IDCancel then
  begin
    CanClose := false;  //取消退出
    exit;
  end;
end;

procedure TF_Main.FormCreate(Sender: TObject);
begin
label2.Left :=(f_main.Width- mxlbar.Width -label2.Width  ) div 2;
label1.Left :=(f_main.Width- mxlbar.Width -label1.Width  ) div 2;
label3.Left :=(f_main.Width- mxlbar.Width -label3.Width-label4.Width  ) div 2;
label4.Left :=(f_main.Width- mxlbar.Width -label3.Width-label4.Width  ) div 2 + label3.Width ;
end;
        //窗体的鼠标移动事件
        //本事件主要是处理窗体上的超联接
procedure TF_Main.msmv(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
 label4.Cursor :=crhandpoint;
label4.font.Color :=clbackground;

end;

procedure TF_Main.Label4Click(Sender: TObject);
 var
     Cmd:AnsiString;
   lpBuffer1:array[0..128]of char;
    handle1:HWND;
begin
        GetWindowsDirectory(lpBuffer1,128); //取得Windows目录路径名
      cmd := StrPas(lpBuffer1)+'\EXPLORER.EXE /n,/e,'+label4.caption  ;
      //查找同名进程是否在系统已经运行
      handle1 := FindWindow('ExploreWClass',pchar(cmd));  //c_str()将AnsiString字符串转换成char
      if handle1 = 0 then  //如果进程没有运行
        WinExec(pchar(cmd),SW_SHOW)  //建立进程
      else
        ShowWindow(handle1,SW_SHOWNORMAL);
        label1.Font.Color :=Rgb(234,23,12);
end;

end.

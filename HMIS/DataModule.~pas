unit DataModule;        //数据模块窗体单元

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection: TADOConnection;
    AT_Assis: TADOTable;
    DS_Assis: TDataSource;
    AQ_Person: TADOQuery;
    AQ_PersonPer_ID: TIntegerField;
    AQ_PersonPer_Name: TWideStringField;
    AQ_PersonPer_Bra: TWideStringField;
    AQ_PersonPer_Duty: TWideStringField;
    AQ_PersonPer_Tel: TWideStringField;
    AQ_PersonWork_Mon: TBooleanField;
    AQ_PersonWork_Tue: TBooleanField;
    AQ_PersonWork_Wen: TBooleanField;
    AQ_PersonWork_Thu: TBooleanField;
    AQ_PersonWork_Fri: TBooleanField;
    AQ_PersonWork_Sat: TBooleanField;
    AQ_PersonWork_Sun: TBooleanField;
    AQ_PersonMon_Name: TStringField;
    AQ_PersonTue_Name: TStringField;
    AQ_PersonWen_Name: TStringField;
    AQ_PersonThu_Name: TStringField;
    AQ_PersonFri_Name: TStringField;
    AQ_PersonSat_Name: TStringField;
    DS_Person: TDataSource;
    AT_Count: TADOTable;
    AT_CountCount_Name: TWideStringField;
    AT_CountCount_Value: TIntegerField;
    DS_Count: TDataSource;
    AT_OFWork: TADOTable;
    DS_OFWork: TDataSource;
    AQ_CDrug: TADOQuery;
    DS_CDrug: TDataSource;
    AQ_SQL: TADOQuery;
    AQ_PInputB: TADOQuery;
    DS_PInputB: TDataSource;
    DS_PInput: TDataSource;
    AQ_PKucun: TADOQuery;
    AQ_PKucunPK_No: TIntegerField;
    AQ_PKucunPK_INumber: TIntegerField;
    AQ_PKucunPK_ONumber: TIntegerField;
    AQ_PKucunPK_TNumber: TIntegerField;
    AQ_PKucunNo_Name: TStringField;
    AQ_PKucunNo_Kind: TStringField;
    AQ_PKucunNo_Unit: TStringField;
    DS_PKucun: TDataSource;
    DS_CReg: TDataSource;
    AT_CReg: TADOTable;
    DS_TCMoney: TDataSource;
    AT_CMoney: TADOTable;
    AT_CMoneyCM_ID: TIntegerField;
    AT_CMoneyCM_Name: TWideStringField;
    AT_CMoneyCM_Num: TIntegerField;
    AT_CMoneyCM_Price: TBCDField;
    AT_CMoneyCM_Tatol: TBCDField;
    DS_CMoney: TDataSource;
    AT_HReg: TADOTable;
    DS_HReg: TDataSource;
    ASP_HMIS: TADOStoredProc;
    AQ_PersonSun_Name: TStringField;
    AT_PInput: TADOTable;
    AT_PInputPIN_ID: TIntegerField;
    AT_PInputPIN_PID: TIntegerField;
    AT_PInputPIN_Name: TIntegerField;
    AT_PInputPIN_Kind: TWideStringField;
    AT_PInputPIN_Unit: TWideStringField;
    AT_PInputPIN_Company: TIntegerField;
    AT_PInputPIN_UPrice: TBCDField;
    AT_PInputPIN_Number: TIntegerField;
    AT_PInputPIN_TPrice: TBCDField;
    AT_PInputComp_Name: TStringField;
    AT_PInputName_Physic: TStringField;
    AT_PInputName_kind: TStringField;
    AT_PInputName_Unit: TStringField;
    AQ_TCMoney: TADOQuery;
    AQ_TCMoneyTCM_ID: TIntegerField;
    AQ_TCMoneyTCM_RID: TIntegerField;
    AQ_TCMoneyTCM_Name: TWideStringField;
    AQ_TCMoneyTCM_Date: TDateTimeField;
    AQ_TCMoneyTHM_Doctor: TWideStringField;
    AQ_TCMoneyTCM_WMDrug: TBCDField;
    AQ_TCMoneyTCM_CMDrug: TBCDField;
    AQ_TCMoneyTCM_HMDrug: TBCDField;
    AQ_TCMoneyTCM_MExam: TBCDField;
    AQ_TCMoneyTCM_MInject: TBCDField;
    AQ_TCMoneyTCM_MEmit: TBCDField;
    AQ_TCMoneyTCM_MDiag: TBCDField;
    AQ_TCMoneyTCM_MChem: TBCDField;
    AQ_TCMoneyTCM_MCure: TBCDField;
    AQ_TCMoneyTCM_MSurgery: TBCDField;
    AQ_TCMoneyTCM_MBlood: TBCDField;
    AQ_TCMoneyTCM_MOxygen: TBCDField;
    AQ_TCMoneyTCM_MOther: TBCDField;
    AQ_TCMoneyTCM_Total: TBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses  Dialogs, Forms, IniFiles, Config, Windows, DatabaseConfig ;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var  {*****数据模块窗体创建事件*****}
    ini,iniW:TIniFile;
    State:boolean;
    CString:AnsiString;
    str,str1:AnsiString;
begin
    //打开INI文件，如果不存在则创建与应用程序同名，后缀名为.INI的ini配置文件
    Application.HelpFile :=  ExtractFilePath(Application.ExeName)+'Help\HELP_HMIS.HLP';  //帮助文件位置赋值
    ini := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
    State := ini.ReadBool('Database','Connection',false); //读取数据库连接是否成功标志，第一次读或者此项不存在时则返回默认值false赋State变量
    if not State then  //数据库没有连接成功
      try              //捕捉异常
//        Application.MessageBox('您需要重新配置数据库服务器，点击确定进行配置操作', '提示', MB_ICONINFORMATION + MB_OK);
        if F_Config = nil then
          F_Config := TF_Config.Create(Application);  //动态创建数据库服务器配置窗体
        F_Config.ShowModal;                         //显示数据库服务器配置窗口
//        Application.MessageBox('你已经配置了数据库服务器，点击确定关闭本系统后，请重新运行', '提示', MB_ICONINFORMATION + MB_OK);
//        Application.Terminate;
      except          //抛出异常
        Application.MessageBox('打开数据库服务器配置窗口出错，请与软件供应商联系', '错误', MB_ICONERROR + MB_OK);               //弹出异常对话框
        Application.Terminate;        
      end;
    CString:='Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=';  //字符串CString赋值
    str := ini.ReadString('Database','Initial Catalog','HMIS'); //从配置文件读数据库名
    CString := CString+str;                //追加从配置文件读入的数据库名字符串
    str1 := ini.ReadString('Database','Data Source','FLYYCS');  //从配置文件读数据库服务器名
    CString := CString+';Data Source=';    //追加字符串到CString
    CString := CString+str1;               //追加从配置文件读入的数据库服务器名字符串
    DM.ADOConnection.Connected := false;
    DM.ADOConnection.ConnectionString := CString;  //数据库连接属性字符串赋新值
    try            //捕捉异常
      DM.ADOConnection.Connected := true;  //启动与数据库服务器的连接
//      AT_Assis.Active := true;          //激活各个数据表与服务器的连接
      AT_Count.Active := true;  //计数表
      AT_OFWork.Active := true;  //工作、休息代码表
      AT_PInput.Active := true;
      AT_CReg.Active := true;
      AT_CMoney.Active := true;
      AT_HReg.Active := true;
      AQ_CDrug.Active := true;
      AQ_Person.Active := true;
      AQ_PInputB.Active := true;
      AQ_PKucun.Active := true;
      AQ_TCMoney.Active := true;
    except        //抛出异常
      ShowMessage('与数据库服务器连接未成功，请重新配置');
    end;
    //打开INI文件，如果不存在则创建与应用程序同名，后缀名为.INI的ini配置文件
    iniW := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
    State := DM.ADOConnection.Connected;            //取得数据库连接是否成功标志值
    iniW.WriteBool('Database','Connection',State);  //将数据库连接是否成功标志值写入配置文件
    if State = false then
      Application.Terminate;
end;

end.

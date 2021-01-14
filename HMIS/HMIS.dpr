program HMIS;

uses
  Forms,
  Main in 'Main.pas' {F_Main},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  Assistant in 'Assistant.pas' {F_Assis},
  CDrug in 'CDrug.pas' {F_CDrug},
  Query in 'Query.pas' {F_Query},
  MonthCalendar in 'MonthCalendar.pas' {F_Date},
  CMoney in 'CMoney.pas' {F_CMoney},
  CRegister in 'CRegister.pas' {F_CReg},
  CRPrint in 'CRPrint.pas' {F_CRPrint},
  HRegister in 'HRegister.pas' {F_HReg},
  PInput in 'PInput.pas' {F_Input},
  PKucun in 'PKucun.pas' {F_Kucun},
  OnDuty in 'OnDuty.pas' {F_ODuty},
  Person in 'Person.pas' {F_Person},
  Pass_Pope_Modify in 'Pass_Pope_Modify.pas' {F_PP_Modi},
  Crypt in 'Crypt.pas',
  URegister in 'URegister.pas' {F_Register},
  AboutBox in 'AboutBox.pas' {F_AboutBox},
  Config in 'Config.pas' {F_Config},
  LogOn in 'LogOn.pas' {F_LogOn},
  Login in 'Login.pas' {F_Login};

{$R *.res}

begin
  Application.Initialize;

  F_LogOn := TF_LogOn.Create(Application);  //动态创建软件登录界面窗体
  F_LogOn.Show; //显示软件登录界面窗口，并且程序往下执行，这里绝对不能用ShowModal来代替
  F_LogOn.Update; //刷新显示

  Application.Title := '医院信息系统';
  Application.HelpFile := 'D:\Program Files\Borland\Delphi6\Projects\HMIS\Help\HELP_HMIS.HLP';
  Application.CreateForm(TF_Main, F_Main);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TF_Date, F_Date);
  Application.CreateForm(TF_Query, F_Query);
  Application.CreateForm(TF_Register, F_Register);
  Application.CreateForm(TF_Login, F_Login);
  F_Login.ShowModal; //显示用户登录窗口
 //F_Login.Free;      //释放登录窗体对象

  F_LogOn.Close;  //关闭软件登录界面窗口
  F_LogOn.Free;   //释放软件登录窗体占用的内存空间

  Application.Run;
 end.

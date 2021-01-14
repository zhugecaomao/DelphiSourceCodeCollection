unit UMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Menus, CoolTrayIcon, ImgList, DateUtils, IniFiles,
  Registry, StrUtils, ComCtrls, Buttons, ztvregister, ztvBase, ztvZip;

type
  TFrmMain = class(TForm)
    PMnuTray: TPopupMenu;
    PMnuConfig: TMenuItem;
    PMnuIsStart: TMenuItem;
    PMnuExit: TMenuItem;
    TimerSvr: TTimer;
    TrayIcon: TCoolTrayIcon;
    N1: TMenuItem;
    ImageListTray: TImageList;
    Button1: TButton;
    Button2: TButton;
    EdtExpExeFile: TEdit;
    EdtUserName: TEdit;
    EdtPassWord: TEdit;
    EdtDataBase: TEdit;
    EdtExpFile: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ChkZiped: TCheckBox;
    ChkGrants: TCheckBox;
    ChkFull: TCheckBox;
    Label6: TLabel;
    EdtRunTime: TDateTimePicker;
    Label7: TLabel;
    ChkAutoNamed: TCheckBox;
    Bevel1: TBevel;
    BtnExpExeFile: TBitBtn;
    BtnExpFile: TBitBtn;
    OpenDialog: TOpenDialog;
    BtnExpExeFileD: TSpeedButton;
    BtnExpFileD: TSpeedButton;
    ZipComponent: TZip;
    StaticText1: TStaticText;
    procedure PMnuExitClick(Sender: TObject);
    procedure PMnuConfigClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure TimerSvrTimer(Sender: TObject);
    procedure PMnuIsStartClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnExpExeFileClick(Sender: TObject);
    procedure BtnExpFileClick(Sender: TObject);
    procedure BtnExpExeFileDClick(Sender: TObject);
    procedure BtnExpFileDClick(Sender: TObject);
  private
    AppPath: String;
    ConfigFile: String;
    ExpExeFile, ExpFile: String;
    UserName, PassWord, DataBase, RunTime: String;
    Grants, Full, Ziped, AutoNamed: Boolean;
    procedure SysButtonMsg(var Msg: TMessage); message WM_SYSCOMMAND;
    procedure ReadConfig;
    procedure WriteConfig;
    procedure SetConfig(InMem: Boolean);
  public
    function GetOraleHome: String;
    procedure RunCmdLine(const Cmd: String; var ExitCode: DWORD; var ErrMessage: String; var OutMessage: String);
    procedure WriteToFile(const FileName, Content: String);
  end;

var
  FrmMain: TFrmMain;

implementation

uses UNTService;

{$R *.DFM}

procedure TFrmMain.PMnuExitClick(Sender: TObject);
begin
  if IsNTService then PostThreadMessage(NTService.ServiceThread.ThreadID, WM_QUIT, 0, 0)
  else Application.Terminate;
end;

procedure TFrmMain.PMnuConfigClick(Sender: TObject);
begin
  if not Visible then Show
  else Hide;
end;

procedure TFrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Visible then
  begin
    CanClose := False;
    Hide;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  AppPath := ExtractFilePath(Application.ExeName);
  ConfigFile := AppPath + 'Config.ini';
  SetWindowLong(Application.Handle, GWL_EXSTYLE, WS_EX_TOOLWINDOW); {不在任务栏显示}//
end;

procedure TFrmMain.TimerSvrTimer(Sender: TObject);
var
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
  OutDir, ExpOutFile, ExpLogFile: String; //文件输出目录，实际备份文件，日志文件
  Cmd: String;  //命令行
  ExitCode: DWORD;
  ErrMessage, OutMessage: String;
  SL: TStringList;
begin
  DecodeDateTime(Now, Year, Month, Day, Hour, Min, Sec, MSec);
  if Format('%2.2d:%2.2d', [Hour, Min]) = LeftStr(RunTime, 5) then
  begin
    //如果输出目录不存在则创建，Exp.exe程序不能够自动创建目录
    OutDir := ExtractFilePath(ExpFile);
    if not DirectoryExists(OutDir) then ForceDirectories(OutDir);
    //*********构造命令行***************
    Cmd := ExpExeFile;

    if Pos(' ', Cmd) > 0 then Cmd := '"' + Cmd + '"';

    Cmd := Cmd + ' ' + UserName + '/' + PassWord + '@' + DataBase;

    if AutoNamed then
    begin
      //在文件的主名后加上 时间
      ExpOutFile := OutDir + ChangeFileExt(ExtractFileName(ExpFile), '') + Format('%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d', [Year, Month, Day, Hour, Min, Sec]) + ExtractFileExt(ExpFile);
    end
    else ExpOutFile := ExpFile;
    Cmd := Cmd + ' file=' + ExpOutFile;

    if Grants then Cmd := Cmd + ' grants=Y'
    else Cmd := Cmd + ' grants=N';

    if Full then Cmd := Cmd + ' Full=Y'
    else Cmd := Cmd + ' Full=N';
    //**********************************
    TrayIcon.ShowBalloonHint('提示', Format('[%4.4d-%2.2d-%2.2d %2.2d:%2.2d:%2.2d]', [Year, Month, Day, Hour, Min, Sec]) +
       ' 开始备份数据......', bitInfo, 10);
    Application.ProcessMessages;  
    //运行导出命令
    RunCmdLine(Cmd, ExitCode, ErrMessage, OutMessage);
    //记录日志
    Application.ProcessMessages;
    ExpLogFile := ChangeFileExt(ExpOutFile, '.log');
    SL := TStringList.Create;
    try
      SL.Add('//********************** 导出命令行 *****************************');
      SL.Add('');
      SL.Add(Cmd);
      SL.Add('');
      SL.Add('//********************** 命令行输出 *****************************');
      SL.Add(OutMessage);
      SL.SaveToFile(ExpLogFile);
    finally
      FreeAndNil(SL);
    end;
    //****压缩文件的代码*******
    Application.ProcessMessages;
    if Ziped then
    begin
      ZipComponent.ArchiveFile := ChangeFileExt(ExpOutFile, '.zip');
      if FileExists(ZipComponent.ArchiveFile) then DeleteFile(ZipComponent.ArchiveFile);
      ZipComponent.ExcludeSpec.Clear();
      ZipComponent.FileSpec.Clear();
      ZipComponent.FileSpec.Add(ExpOutFile);
      ZipComponent.FileSpec.Add(ExpLogFile);
      ZipComponent.TempDir := OutDir;
      ZipComponent.Compress();
      if FileExists(ExpOutFile) then DeleteFile(ExpOutFile);
      if FileExists(ExpLogFile) then DeleteFile(ExpLogFile);
    end;
    //*******************************
    TrayIcon.ShowBalloonHint('提示', Format('[%4.4d-%2.2d-%2.2d %2.2d:%2.2d:%2.2d]', [Year, Month, Day, Hour, Min, Sec]) +
       ' 数据备份完成！', bitInfo, 10);
  end;
end;

procedure TFrmMain.SysButtonMsg(var Msg: TMessage);
begin
  if (Msg.wParam = SC_CLOSE) or (Msg.wParam = SC_MINIMIZE) then Hide
  else inherited; // 执行默认动作
end;

procedure TFrmMain.PMnuIsStartClick(Sender: TObject);
begin
  PMnuIsStart.Checked := not PMnuIsStart.Checked;
  TimerSvr.Enabled := not PMnuIsStart.Checked;
  TrayIcon.CycleIcons := not PMnuIsStart.Checked;
end;

procedure TFrmMain.ReadConfig;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ConfigFile);
  try
    ExpExeFile := IniFile.ReadString('Common', 'ExpExeFile', '');
    ExpFile := IniFile.ReadString('Common', 'ExpFile', '');
    UserName := IniFile.ReadString('Common', 'UserName', '');
    PassWord := IniFile.ReadString('Common', 'PassWord', '');
    DataBase := IniFile.ReadString('Common', 'DataBase', '');
    Grants := IniFile.ReadBool('Common', 'Grants', False);
    Full := IniFile.ReadBool('Common', 'Full', False);
    Ziped := IniFile.ReadBool('Common', 'Ziped', True);
    AutoNamed := IniFile.ReadBool('Common', 'AutoNamed', True); 
    RunTime := IniFile.ReadString('Common', 'RunTime', '01:00'); 
  finally
    FreeAndNil(IniFile);
  end;
end;

procedure TFrmMain.WriteConfig;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ConfigFile);
  try
    IniFile.WriteString('Common', 'ExpExeFile', ExpExeFile);
    IniFile.WriteString('Common', 'ExpFile', ExpFile);
    IniFile.WriteString('Common', 'UserName', UserName);
    IniFile.WriteString('Common', 'PassWord', PassWord);
    IniFile.WriteString('Common', 'DataBase', DataBase);       
    IniFile.WriteBool('Common', 'Grants', Grants);
    IniFile.WriteBool('Common', 'Full', Full);
    IniFile.WriteBool('Common', 'Ziped', Ziped);
    IniFile.WriteBool('Common', 'AutoNamed', AutoNamed);
    IniFile.WriteString('Common', 'RunTime', RunTime);
  finally
    FreeAndNil(IniFile);
  end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  ReadConfig;
  SetConfig(False);
end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
  SetConfig(True);
  WriteConfig;
  Close;
end;

procedure TFrmMain.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMain.SetConfig(InMem: Boolean);
begin
  if InMem then
  begin
    ExpExeFile := EdtExpExeFile.Text;
    ExpFile := EdtExpFile.Text;
    UserName := EdtUserName.Text;
    PassWord := EdtPassWord.Text;
    DataBase := EdtDataBase.Text;
    RunTime := Format('%2.2d:%2.2d:%2.2d',[HourOf(EdtRunTime.Time), MinuteOf(EdtRunTime.Time), SecondOf(EdtRunTime.Time)]);
    Grants := ChkGrants.Checked;
    Full := ChkFull.Checked;
    Ziped := ChkZiped.Checked;
    AutoNamed := ChkAutoNamed.Checked;
  end
  else
  begin
    if ExpExeFile = '' then EdtExpExeFile.Text := GetOraleHome
    else EdtExpExeFile.Text := ExpExeFile;
    EdtExpFile.Text := ExpFile;
    EdtUserName.Text := UserName;
    EdtPassWord.Text := PassWord;
    EdtDataBase.Text := DataBase;
    EdtRunTime.Time := StrToTime(RunTime);
    ChkGrants.Checked := Grants;
    ChkFull.Checked := Full;
    ChkZiped.Checked := Ziped;
    ChkAutoNamed.Checked := AutoNamed;
  end;
end;

procedure TFrmMain.BtnExpExeFileClick(Sender: TObject);
begin
  OpenDialog.Filter := 'EXE文件(*.EXE)|*.EXE';
  OpenDialog.FileName := EdtExpExeFile.Text;
  if OpenDialog.Execute and (OpenDialog.FileName <> '') then
  begin
    EdtExpExeFile.Text := OpenDialog.FileName;
  end;
end;

procedure TFrmMain.BtnExpFileClick(Sender: TObject);
begin
  OpenDialog.Filter := '所有文件(*.*)|*.*';
  OpenDialog.FileName := EdtExpFile.Text;
  if OpenDialog.Execute and (OpenDialog.FileName <> '') then
  begin
    EdtExpFile.Text := OpenDialog.FileName;
  end;
end;

procedure TFrmMain.BtnExpExeFileDClick(Sender: TObject);
begin
  EdtExpExeFile.Text := GetOraleHome;
end;

procedure TFrmMain.BtnExpFileDClick(Sender: TObject);
begin
  EdtExpFile.Text := AppPath + 'bak\exp.dmp';
end;

procedure TFrmMain.RunCmdLine(const Cmd: String; var ExitCode: DWORD;
  var ErrMessage, OutMessage: String);
{
Cmd：外部控制台程序文件名，包含路径;
ExitCode：程序执行状态代码，如果成功，返回 0 ，否则非 0;
ErrMessage：执行出现错误时返回错误信息;
OutMessage：控制台输出信息
}
var
  HReadPipe, HWritePipe: THandle;
  SI: STARTUPINFO;
  SA: SECURITY_ATTRIBUTES;
  PI: PROCESS_INFORMATION;
  CchReadBuffer: DWORD;
  PChr: PChar;
  StrTemp: String;
  FileName: PChar;
begin
  FileName := AllocMem(Length(Cmd) + 1);
  StrPCopy(FileName, Cmd);
  PChr := AllocMem(5000);
  SA.nLength := SizeOf(SECURITY_ATTRIBUTES);
  SA.lpSecurityDescriptor := nil;
  SA.bInheritHandle := True;

  if CreatePipe(HReadPipe, HWritePipe, @SA, 0) = False then
  begin
    ErrMessage := 'Can not create pipe!';
    Exit;
  end;
  fillchar(SI, SizeOf(STARTUPINFO), 0);
  SI.cb := SizeOf(STARTUPINFO);
  SI.dwFlags := (STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW);
  SI.wShowWindow := SW_HIDE;
  SI.hStdInput := GetStdHandle(STD_INPUT_HANDLE);
  SI.hStdOutput := HWritePipe;
  SI.hStdError := HWritePipe;


  if CreateProcess( nil, FileName, nil, nil, true, 0, nil, nil, SI, PI) = False  then
  begin
    ErrMessage := 'can not create process!';
    FreeMem(PChr);
    FreeMem(FileName);
    Exit;
  end;

  while (True) do
  begin
    if not PeekNamedPipe(HReadPipe, PChr, 1, @CchReadBuffer, nil, nil) then Break;
    if CchReadBuffer <> 0 then
    begin
      if ReadFile(HReadPipe, PChr^, 4096, CchReadBuffer, nil) = False then Break;
      PChr[CchReadBuffer] := Chr(0);
      StrTemp := PChr;
      OutMessage := OutMessage + StrTemp;
    end
    else if (WaitForSingleObject(PI.hProcess ,0) = WAIT_OBJECT_0) then Break;
    Sleep(100);
  end;

  PChr[CchReadBuffer] := Chr(0);
  OutMessage := OutMessage + PChr;
  GetExitCodeProcess(PI.hProcess, ExitCode);
  CloseHandle(HReadPipe);
  CloseHandle(PI.hThread);
  CloseHandle(PI.hProcess);
  CloseHandle(hWritePipe);
  FreeMem(PChr);
  FreeMem(FileName);
end;

procedure TFrmMain.WriteToFile(const FileName, Content: String);
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL.Text := Content;
    SL.SaveToFile(FileName);
  finally
    FreeAndNil(SL);
  end;
end;

function TFrmMain.GetOraleHome: String;
var
  Reg: TRegistry;
begin
  Result := '';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('Software\Oracle', True) then
    begin
      Result := Reg.ReadString('ORACLE_HOME') + '\bin\exp.exe';
    end
  finally
    FreeAndNil(Reg);
  end;
end;

end.

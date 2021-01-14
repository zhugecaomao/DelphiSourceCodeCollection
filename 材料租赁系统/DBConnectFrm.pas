unit DBConnectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, INIFiles;

type
  TfrmDBConnect = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtServerName: TEdit;
    edtDatabaseName: TEdit;
    edtUserName: TEdit;
    edtPassword: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ReadFromIni(var aServerName, aDatabaseName, aUserName, aPassword: string);//读取配置文件信息
procedure WriteToIni(const aServerName, aDatabaseName, aUserName, aPassword: string);//向配置文件写入信息

function DBConnectExecute(aClass: TFormClass): boolean; //用于打开窗体，并判断是否配置成功

var
  Connected: Boolean;
implementation

uses  main,common;

{$R *.dfm}
//用于打开窗体，并判断是否配置成功
function DBConnectExecute(aClass: TFormClass): boolean;
begin
  with aClass.Create(Application) do
  begin
    try
      showModal;
    finally
      free;
      result := Connected;
    end;
  end;
end;

//读取配置文件信息
procedure ReadFromIni(var aServerName, aDatabaseName, aUserName, aPassword: string);
var
  IniFile: TIniFile;
  FileName: string;
begin
  FileName := ExtractFilePath(application.ExeName) + '\DB.ini';
  IniFile := TIniFile.Create(FileName);
  aServerName := IniFile.ReadString('DB', 'ServerName', '');
  aDatabaseName := IniFile.ReadString('DB', 'DatabaseName', '');
  aUserName := IniFile.ReadString('DB', 'UserName', '');
  aPassword := IniFile.ReadString('DB', 'Password', '');
  IniFile.Free;
end;

//向配置文件写入信息
procedure WriteToIni(const aServerName, aDatabaseName, aUserName, aPassword: string);
var
  IniFile: TIniFile;
  FileName: string;
begin
  FileName := ExtractFilePath(application.ExeName) + '\DB.ini';
  IniFile := TIniFile.Create(FileName);
  IniFile.WriteString('DB', 'ServerName', aServerName);
  IniFile.WriteString('DB', 'DatabaseName', aDatabaseName);
  IniFile.WriteString('DB', 'UserName', aUserName);
  IniFile.WriteString('DB', 'Password', aPassword);
  IniFile.Free;
end;

//写入ini，并测试是否连接上
procedure TfrmDBConnect.btnOKClick(Sender: TObject);
begin
  writeToIni(edtServerName.Text, edtDatabaseName.Text, edtUserName.Text, edtPassword.Text);
  if ConnectLocalDB(frmmain.ADOConnect,edtDatabaseName.Text,edtServerName.Text,edtUserName.Text, edtPassword.Text) then
  begin
    Application.MessageBox('连接成功', '提示', mb_iconInformation + mb_defbutton1);
    Connected := True;
    Close;
  end
  else
  begin
    Application.MessageBox('连接失败', '提示', mb_iconInformation + mb_defbutton1);
  end;
end;

//当窗体被创建时，将配置文件信息显示到窗体上
procedure TfrmDBConnect.FormCreate(Sender: TObject);
var
  serverName, databaseName, userName, password: string;
begin
  readFromIni(serverName, databaseName, userName, password);
  Connected := False;
  edtservername.Text :=servername;
  edtdatabasename.Text := databaseName;
  edtUserName.Text :=userName;
  edtPassword.Text := password;
  end;

procedure TfrmDBConnect.btnCancelClick(Sender: TObject);
begin
  close;
end;

end.


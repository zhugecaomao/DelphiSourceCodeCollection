unit DatabaseConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TF_DBConfig = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LEdit1: TLabeledEdit;
    LEdit2: TLabeledEdit;
    BB_Confirm: TBitBtn;
    BB_Cancel: TBitBtn;
    procedure BB_ConfirmClick(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
    procedure LEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_DBConfig: TF_DBConfig;

implementation
uses  IniFiles, Config;
{$R *.dfm}

procedure TF_DBConfig.BB_ConfirmClick(Sender: TObject);
var    {*****确定按钮单击事件*****}
    ini:TIniFile;
begin
    if (LEdit1.Text='')or(LEdit2.Text='') then
      begin
      ShowMessage('请输入数据库服务器名和数据库名');
      LEdit1.SetFocus;  //焦点在数据库服务器名输入框
      exit;
      end;
    //打开INI文件，如果不存在则创建与应用程序同名，后缀名为.INI的ini配置文件
    ini := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
    ini.WriteString('Database','Initial Catalog',LEdit2.Text);  //将数据库名写入配置文件
    ini.WriteString('Database','Data Source',LEdit1.Text);      //将数据库服务器名写入配置文件
    Close;  //关闭数据库服务器配置窗口
end;

procedure TF_DBConfig.BB_CancelClick(Sender: TObject);
begin  {*****取消按钮单击事件*****}
    Close;  //关闭数据库服务器配置窗口
end;

procedure TF_DBConfig.LEdit2KeyPress(Sender: TObject; var Key: Char);
begin  {*****数据库名输入框键盘输入事件*****}
    if (Key = #13) then        //按下回车键执行
      BB_ConfirmClick(Self); //调用确定按钮点击事件
end;

procedure TF_DBConfig.FormCreate(Sender: TObject);
var  {*****数据库服务器配置窗体创建事件*****}
    pName : PChar;
    Size_Com : dword;
begin
    Size_Com := MAX_COMPUTERNAME_LENGTH + 1;
    if GetComputerName(pName, Size_Com) then  //GetComputerName是取得计算机名API函数
      Label2.Caption := '默认值：' + pName;
end;

procedure TF_DBConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
    F_Config := nil;
end;

end.

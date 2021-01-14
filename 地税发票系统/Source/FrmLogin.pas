unit FrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Buttons, ShellAPI, IniFiles,
  cxLookAndFeelPainters, cxButtons, ComCtrls, AdvPageControl, AdvEdit,
  AdvEdBtn, ADODB;

type
  TLogin = class(TForm)
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbl3: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    cxButton1: TcxButton;
    DataPathEdt: TEdit;
    BitBtn1: TBitBtn;
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label3Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure DataPathEdtEnter(Sender: TObject);
    procedure DataPathEdtExit(Sender: TObject);
  private
    
  public
    class function CreateLogin:Boolean;  
    class function ReadConfig:Boolean;   
    function WriteConfig:Boolean;        
    procedure SelectUser;                
    
  end;

var
  Login: TLogin;

implementation

uses
  FrmCustom, FrmData;

{$R *.dfm}



class function TLogin.CreateLogin: Boolean;
begin
  try
    Login:=TLogin.Create(Application);
    Login.ShowModal;
    if Login.ModalResult=mrOk then
      Result:=True
    else
      Result:=False;
  finally
    Login.Free;
    Login:=nil;
  end;
end;

procedure TLogin.Label3MouseLeave(Sender: TObject);
begin
  Label3.Font.Color:=clWhite;
  Label3.Cursor:=crDefault;
end;

procedure TLogin.Label3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Label3.Font.Color:=clRed;
  Label3.Cursor:=crHandPoint;
end;

procedure TLogin.Label3Click(Sender: TObject);
var
  Address:string;
begin
  Address:=  HttpURL;
  ShellExecute(Handle,'Open',PChar(Address),'','',SW_SHOW);
end;

procedure TLogin.cxButton5Click(Sender: TObject);
begin



     Application.Terminate;

end;

procedure TLogin.cxButton4Click(Sender: TObject);
var
  aSql: string;
begin
  if Length(Trim(Edit1.Text))=0 then
  begin
    Application.MessageBox('密码不能为空！  ', '贝壳提示', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
    Edit1.SetFocus;
    Exit;
  end;
  with DataModule1 do
  begin
    ADOSelect.SQL.Clear;
    aSql:='Select * From Admin Where 用户名 ='+QuotedStr(ComboBox1.Text)+' and 密码='
      +QuotedStr(Edit1.Text);
    ADOSelect.SQL.Add(aSql);
    ADOSelect.Open;
    if not ADOSelect.Eof then
    begin
      if ADOSelect.FieldByName('管理员').AsString='是' then
        IsAdmin:=True;
      CurrenUser:=ComboBox1.Text;
      Self.ModalResult:=mrOk;
    end
    else
    begin
      Application.MessageBox('密码错误！  ', '贝壳提示', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
      edit1.Clear;
      edit1.SetFocus;  
    end;
  end;
end;

class function TLogin.ReadConfig: Boolean;
var
  aFile:TIniFile;
begin
  try
    AppPath:=ExtractFilePath(Application.ExeName);
    aFile:=TIniFile.Create(AppPath+'Config.Ini');
    DataPath:=DecryStrHex(aFile.ReadString('Defaults','DataConfig',''),'yangjun');
  finally
    aFile.Free;
  end;
end;

procedure TLogin.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    Login.Height:=285
  else
    Login.Height:=245;
end;

function TLogin.WriteConfig: Boolean;
var
  aFile:TIniFile;
begin
  Result:=False;
  try
    AppPath:=ExtractFilePath(Application.ExeName);
    aFile:=TIniFile.Create(AppPath+'Config.Ini');
    aFile.WriteString('Defaults','DataConfig',EncryStrhex(DataPathEdt.Text,
      'yangjun'));
    Result:=True;
  finally
    aFile.Free;
  end;
end;

procedure TLogin.FormShow(Sender: TObject);
begin
  Anti_DeDe; 
  DumpLoaded;
  IsDebug;
  RegLoaded;
  FileLoaded;
  SoftIceXPLoaded;
  CheckParentProc;
  IsAdmin:=False; 
  if DataPath='' then
  begin
    Application.MessageBox('请选择配置数据库！  ', '贝壳提示', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
    CheckBox1.Checked:=True;
  end
  else
  begin
    DataPathEdt.Text:=DataPath;
    with DataModule1 do
    begin
      try
        ADOCon.ConnectionString:=DataPath; 
        ADOCon.Open;
        SelectUser;                        
      except
        Application.MessageBox('连接数据库错误！  ', '贝壳提示', MB_OK +
          MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
      end;
    end;
  end;
end;

procedure TLogin.cxButton1Click(Sender: TObject);
begin
  if DataPathEdt.Text='' then
  begin
    BitBtn1.Click;
    Exit;
  end;
  if WriteConfig then
  begin
    Application.MessageBox('配置成功！' + #13#10#13#10 + '现在重启程序！',
      '贝壳提示', MB_OK + MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
    ShellExecute(handle,'Open',PChar(Application.ExeName),'','', SW_SHOWNORMAL);      
    Application.Terminate;
  end
  else
    Application.MessageBox('配置失败！   ', '贝壳提示', MB_OK + MB_ICONSTOP +
      MB_DEFBUTTON3 + MB_TOPMOST);
end;

procedure TLogin.SelectUser;
begin
  with DataModule1 do
  begin
    ComboBox1.Clear;
    ADOSelect.SQL.Clear;
    ADOSelect.SQL.Add('Select 用户名 From Admin');
    ADOSelect.Open;
    while not ADOSelect.Eof do
    begin
      ComboBox1.Items.Add(ADOSelect.Fields[0].AsString);
      ADOSelect.Next;
    end;
  end;
end;

procedure TLogin.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    Edit1.SetFocus;
end;

procedure TLogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    cxButton4.Click;
end;

procedure TLogin.BitBtn1Click(Sender: TObject);
begin
  DataPathEdt.Text:=PromptDataSource(Handle,DataPathEdt.Text);
end;

procedure TLogin.DataPathEdtEnter(Sender: TObject);
begin
  TEdit(Sender).Color:=$00ACD7F0;
end;

procedure TLogin.DataPathEdtExit(Sender: TObject);
begin
  TEdit(Sender).Color:=clScrollBar;
end;

end.

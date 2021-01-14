unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, Db, DBTables;

type
  TLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    Image1: TImage;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Table1: TTable;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
  private
    { Private declarations }
    GlobalUser : string;
    GlobalUserRight : string;
    UserRight,PassWord:String;
  public
    { Public declarations }
  end;
  TLoginForm = class(TComponent)
  private
    Login: TLogin;      //登录的视窗
    FUserRight: String;  //存放使用者的使用权限
    FExec: Boolean;      //是不执行登录程序
    FDataBaseName: string;
    FTableName: String;
    FUserName: String;
    FKeyFields:String;
    FNameField:String;
    FRightField:String;
    FPassWordField:String;
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: Tcomponent);override;
    function RunL:boolean; //执行LOGIN视窗的方法
    property UserRight: String read FUserRight write FUserRight;
    Property userName: string read FUserName write FUserName;
  published
    { Published declarations }
    Property Exec: boolean read FExec write FExec;
    Property DataBaseName: string read FDataBaseName write FDataBaseName;
    Property TableName: string read FTableName write FTablename;
    Property KeyFields: string read FKeyFields write FKeyFields;
    Property NameField: string read FNameField write FNameField;
    Property RightField: string read FRightField write FRightField;
    Property PassWordField: string read FPassWordField write FPassWordField;
  end;
 procedure Register;

var
  Login: TLogin;
  I : integer;
implementation


{$R *.DFM}
procedure Register;
begin
  RegisterComponents('Dialogs',[TLoginForm]);
end;

constructor TLoginForm.Create(AOwner: Tcomponent);
begin
  inherited Create(AOwner);
end;

function TLoginForm.RunL: boolean;
begin
  result := False;
  if not Exec then begin  //当使用者不执行密码检查时,即预设登录完成,而LoginName='System'
                          //                                          Right = '11111'
    stringofchar('1',50);
    FUserName := 'System';
    result := True;
    exit;
  end;
  Login := TLogin.Create(Application);
  try
    if DataBaseName<>'' then
      Login.Table1.Databasename := DataBaseName
    else begin
      MessageBoxEx(application.handle,'请填入资料库名称!','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
      exit;
    end;

    if TableName <> '' then
      Login.Table1.TableName := TableName
    else begin
      MessageBoxEx(Application.handle,'请输入资料表名称!','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
      Exit;
    end;

    if KeyFields<>'' then
      begin
        Login.DBLookupComboBox1.KeyField:=keyFields;
        Login.Table1.IndexFieldNames:=keyFields;
      end
    else
      begin
        MessageBoxEx(Application.handle,'请输入资料表索引栏位名称!','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
        Exit;
      end;

    if NameField<>'' then
      Login.DBLookupComboBox1.ListField:=NameField
    else
      begin
        MessageBoxEx(Application.handle,'请输入资料表姓名栏位名称!','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
        Exit;
      end;

    if RightField<>'' then
      Login.UserRight:=RightField
    else
      begin
        MessageBoxEx(Application.handle,'请输入资料表权限栏位名称!','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
        Exit;
      end;

    if PassWordField<>'' then
      Login.PassWord:=PassWordField
    else
      begin
        MessageBoxEx(Application.handle,'请输入资料表密码栏位名称!','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
        Exit;
      end;

    Login.Table1.open;

    if Login.Showmodal = Mrok then begin
      FUserRight := Login.GlobalUserRight;
      FUserName  := Login.GlobalUser;
      result := True;
    end;
  finally
    Login.Free;
  end;
end;


procedure TLogin.FormCreate(Sender: TObject);
begin
  I := 0;
  GlobalUser := '';
  GlobalUserRight := '';
end;

procedure TLogin.Button1Click(Sender: TObject);
begin
  if MaskEdit1.Text = Table1.FieldByName(PassWord).Asstring then
    begin
      ModalResult := mrOK;
      GlobalUser := DBLookupComboBox1.Text;
      GlobalUserRight := Table1.FieldByName(UserRight).Asstring;
    end;
  if ModalResult <> mrOK then
    begin
       I := I + 1;
      if i>=3 then begin
        MessageBoxEx(application.handle,'对不起!您已输入密码超过三次错误...','错误',MB_OK,SUBLANG_CHINESE_TRADITIONAL);
        ModalResult := MrCancel;
      end else begin
        Application.MessageBox(PCHAR('对不起!您的密码不对!请重新输入!'), '警告', MB_OK+MB_ICONWARNING);
        MaskEdit1.Text:='';
        MaskEdit1.SetFocus;
      end;
    end;
end;

procedure TLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Table1.Close;
  Action := cafree;
end;

procedure TLogin.FormShow(Sender: TObject);
begin
  DBLookupComboBox1.KeyValue:=Table1.FieldByName(DBLookupComboBox1.KeyField).AsString;
end;

procedure TLogin.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  MaskEdit1.SetFocus;
end;

end.












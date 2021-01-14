unit uRightsSetting;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, dbtables, Buttons,ADODB;

type
  TfrmRightSetting = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    btnCancel: TSpeedButton;
    GroupBox1: TGroupBox;
    ListView1: TListView;
    btnDelete: TButton;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    edtUsername: TEdit;
    edtPassword: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    btnOK: TButton;
    chkNewUser: TCheckBox;
    cmbLevel: TComboBox;
    procedure ListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ListView1Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure chkNewUserClick(Sender: TObject);
   // procedure FrameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshUser;
    function GetUserPwd(UserName : string):string;
    function CheckExistUserName(UserName : string):boolean;
    procedure InsUser(UserName,UserPwd:string;Power : integer);
    procedure UpdateUser(UserName,UserPwd:string;Power : integer);
    procedure DelUser(UserName : string);
    //constructor Create(AOwner : TComponent);override;
  end;
var
  frmRightSetting: TfrmRightSetting;

implementation


uses Main,uPublic, uDB;

{$R *.DFM}

//查询操作者表中用户的列表并显示
procedure TfrmRightSetting.RefreshUser;
var
    Query : TADOQuery;
begin
    Query := TADOQuery.Create(nil);
    Query.Connection := dmWarehouse.ACWarehouse ;
    Query.SQL.Add('select * from Operator order by Class ');
    Query.Open;
    ListView1.Items.Clear;
    while not Query.Eof do
    begin
        with ListView1.Items.Add do
        begin
            Caption := Query.FieldByName('UserName').AsString;
            SubItems.Add(Query.FieldByName('Class').AsString);
        end;
        Query.Next;
    end;
    Query.Close;
    Query.Free;
end;

//在操作者表中根据用户名得到用户密码
function TfrmRightSetting.GetUserPwd(UserName: string): string;
var
  Query : TADOQuery;
begin
  try
    Query := TADOQuery.Create(nil);
    Query.Connection := dmWarehouse.ACWarehouse ;
    Query.SQL.Add('select UserPwd from Operator where UserName =:UserName');
    Query.Parameters.ParamByName('UserName').value:= UserName;
    Query.Open;
    Result := Query.FieldByName('UserPwd').AsString;
    Query.Close;
    Query.Free;
  except
    Result := '';
  end;
end;

procedure TfrmRightSetting.ListView1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if ListView1.Selected <> nil then
  begin
    edtUsername.Text := ListView1.Selected.Caption;
    edtPassword.Text := GetUserPwd(edtUsername.Text);
    cmbLevel.ItemIndex := StrToInt(ListView1.Selected.SubItems.Strings[0]);
  end;
end;

//在列表中选择相应的用户信息进行编辑
procedure TfrmRightSetting.ListView1Click(Sender: TObject);
begin
  chkNewuser.Checked := false;
  chkNewuserClick(Sender);
  if ListView1.Selected <> nil then
  begin
    edtUsername.Text := ListView1.Selected.Caption;
    edtPassword.Text := GetUserPwd(edtUsername.Text);
    cmbLevel.ItemIndex := StrToInt(ListView1.Selected.SubItems.Strings[0]);
  end;
end;

function TfrmRightSetting.CheckExistUserName(UserName: string): boolean;
var
  Query : TADOQuery;
begin
  try
    Query := TADOQuery.Create(nil);
    Query.Connection := dmWarehouse.ACWarehouse;
    Query.SQL.Add('select UserName from Operator where UserName =:UserName');
    Query.Parameters.ParamByName('UserName').Value := UserName;
    Query.Open;
    Result := Query.RecordCount >0;
    Query.Close;
    Query.Free;
  except
    Result := False;
  end;
end;

//在操作者表中delete特定的用户
procedure TfrmRightSetting.DelUser(UserName: string);
var
  Query : TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  Query.Connection := dmWarehouse.ACWarehouse ;
  Query.SQL.Add('delete from Operator where UserName =:UserName');
  Query.Parameters.ParamByName('UserName').value:= UserName;
  Query.ExecSQL;
  Query.Free;
end;

//在操作者表中insert新的用户
procedure TfrmRightSetting.InsUser(UserName, UserPwd: string; Power: integer);
var
  Query : TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  Query.Connection := dmWarehouse.ACWarehouse ;
  Query.SQL.Add('insert into Operator(UserName,UserPwd,Class) '+
                 'values(:UserName,:UserPwd,:Class)');
  Query.Parameters.ParamByName('UserName').value := UserName;
  Query.Parameters.ParamByName('UserPwd').value := UserPwd;
  Query.Parameters.ParamByName('Class').value:= Power;
  Query.ExecSQL;
  Query.Free;
end;

procedure TfrmRightSetting.UpdateUser(UserName, UserPwd: string; Power: integer);
var
  Query : TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  Query.Connection := dmWarehouse.ACWarehouse;
  Query.SQL.Add('update Operator set UserPwd=:UserPwd,Class=:Class'+
                 ' where UserName=:UserName');
  Query.Parameters.ParamByName('UserName').value := UserName;
  Query.Parameters.ParamByName('UserPwd').value := UserPwd;
  Query.Parameters.ParamByName('Class').value:= Power;
  Query.ExecSQL;
  Query.Free;
end;

//添加或者修改用户信息
procedure TfrmRightSetting.btnOKClick(Sender: TObject);
begin
  //添加新的用户
  if chkNewuser.Checked then
  begin
    if CheckExistUserName(edtUsername.Text) then
    begin
      MessageDlg('此用户已经存在',mtError,[mbok],0);
      Exit;
    end;
    try
      InsUser(edtUsername.Text,edtPassword.Text,cmbLevel.ItemIndex);
    except
      MessageDlg('新建用户出错',mtError,[mbok],0);
      Exit;
    end;
  end;

  //修改用户信息
  if chkNewuser.Checked=false then
  begin
    try
      UpdateUser(edtUsername.Text,edtPassword.Text,cmbLevel.ItemIndex);
    except
      MessageDlg('修改用户出错',mtError,[mbok],0);
      Exit;
    end;
  end;
  edtUsername.Text := '';
  edtPassword.Text := '';
  cmbLevel.ItemIndex := 2;
  RefreshUser;
end;

//删除指定用户
procedure TfrmRightSetting.btnDeleteClick(Sender: TObject);
var
  i : integer;
begin
  for i := ListView1.Items.Count -1 downto 0 do
   if ListView1.Items[i].Selected then
   try
     DelUser(ListView1.Items[i].Caption);
     ListView1.Items.Delete(i);
   except
     MessageDlg('删除用户<'+ListView1.Items[i].Caption+'>出错',mtError,[mbok],0);
   end;
end;

procedure TfrmRightSetting.FormCreate(Sender: TObject);
begin
  try
    RefreshUser;
  except
    ListView1.Items.Clear;
    MessageDlg('得到用户信息出错',mtError,[mbok],0);
  end;
  cmbLevel.ItemIndex := 2;
end;

procedure TfrmRightSetting.btnCancelClick(Sender: TObject);
begin
    close;
end;

//新建用户时，可以对用户编辑框进行编辑，反之，不可以编辑。
procedure TfrmRightSetting.chkNewUserClick(Sender: TObject);
begin
    if chkNewuser.Checked = true then
    begin
        edtUsername.Enabled :=true;
        edtUsername.Text := '';
        edtPassword.Text := '';
    end;
    if chkNewuser.Checked = false then
    begin
        edtUsername.Enabled := false;
        edtUsername.Text := '';
        edtPassword.Text := '';
    end;
end;

end.

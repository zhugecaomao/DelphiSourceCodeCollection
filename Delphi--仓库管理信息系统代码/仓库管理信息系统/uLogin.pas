unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons,DB, DBTables,AdoDB;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    edtPassword: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    cmbUserName: TComboBox;
    btnOK: TSpeedButton;
    btnCancel: TSpeedButton;

    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses Main,uPublic,uDB;

{$R *.DFM}

//在确认按钮被点击后，检查操作者表中是否相应的操作人员和口令
procedure TfrmLogin.btnOKClick(Sender: TObject);
var
    Query : TADOQuery;
begin
    //如果验证输入的口令正确，则进入主操作界面
    try
        //检查操作人员表中是否有匹配记录
        Query := TADOQuery.Create(nil);
        Query.Connection := dmWarehouse.ACWarehouse ;
        Query.SQL.Add('select * from Operator where UserName=:UserName and userpwd=:userpwd');

        Query.Parameters.ParamByName('UserName').Value := cmbUsername.Text ;
        Query.Parameters.ParamByName('userpwd').Value := edtpassword.Text ;

        Query.Open;
        if Query.RecordCount = 0 then
        begin
            MessageDlg('请输入正确的用户名和密码',mtError,[mbok],0);
            Exit;
        end;
        //根据不同的操作员级别，允许进行不同的功能操作
        if query.FieldByName('class').AsInteger =0 then
        begin
            //超级用户拥有全部权限
            mainform.menuSRight.Enabled :=true;
            mainform.menuSWarehouse.Enabled := true;
            mainform.menuWSld.Enabled :=true;
            mainform.menuWBMLL.Enabled:=true;
            mainform.menuWBmda.Enabled:=true;
            mainform.menuWZGDA.Enabled:=true;
            mainform.menuWKCPD.Enabled:=true;
            mainform.menuWCLGL.Enabled:=true;
        end;

        if  query.FieldByName('class').AsInteger =1 then
        begin
             //操作员用户拥有除"权限管理"外的全部权限
            mainform.menuSRight.Enabled :=false;
            mainform.menuSWarehouse.Enabled := true;
            mainform.menuWSld.Enabled :=true;
            mainform.menuWBMLL.Enabled:=true;
            mainform.menuWBmda.Enabled:=true;
            mainform.menuWZGDA.Enabled:=true;
            mainform.menuWKCPD.Enabled:=true;
            mainform.menuWCLGL.Enabled:=true;
        end;
         
        edtpassword.Text :='';     //密码信息要清空
        Query.Close;
        Query.Free;

        mainform.Show;
        frmLogin.close;
    except
        MessageDlg('连接数据库出错!',mtError,[mbok],0);
    end;
end;

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    frmLogin.Close ;
end;

//登陆窗体显示时，口令编辑框获得焦点
procedure TfrmLogin.FormShow(Sender: TObject);
begin
    edtPassword.SetFocus ;
end;

//窗体创建时，读取操作者表中的操作者名称
procedure TfrmLogin.FormCreate(Sender: TObject);
var
    Query : TADOQuery;
begin
    cmbusername.Clear ;
    try
        Query := TADOQuery.Create(nil);
        Query.Connection := dmWarehouse.ACWarehouse ;
        Query.SQL.Add('select username from Operator ');
        Query.Open;
        if Query.RecordCount = 0 then
        begin
            MessageDlg('没有可以登陆的用户名',mtError,[mbok],0);
            Exit;
        end else
        begin
            Query.First ;
            while Query.Eof =false do
            begin
                cmbUserName.items.add(query.FieldByName('Username').asstring );
                Query.next;
            end
        end;
        Query.Close;
        Query.Free;
        cmbusername.ItemIndex  :=0 ;
    except
        MessageDlg('连接数据库出错!',mtError,[mbok],0);
    end;
end;

procedure TfrmLogin.edtPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = 13 then
        btnOKClick(Sender);
end;

end.

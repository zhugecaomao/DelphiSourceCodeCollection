unit UserSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TFlatPanelUnit, TFlatButtonUnit, TFlatTitlebarUnit,
  TFlatListBoxUnit, TFlatGroupBoxUnit, StdCtrls, TFlatComboBoxUnit,
  TFlatEditUnit, TFlatRadioButtonUnit, TFlatCheckBoxUnit, DB, ADODB;

type
  TFrmUserSetup = class(TForm)
    UserSetupTitle: TFlatTitlebar;
    BtnExit: TFlatButton;
    Panel1: TFlatPanel;
    GB1: TFlatGroupBox;
    LtbUser: TFlatListBox;
    EditUser: TFlatEdit;
    CmbQX: TFlatComboBox;
    BtnSave: TFlatButton;
    BtnCancel: TFlatButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditPwd: TFlatEdit;
    Panel2: TFlatPanel;
    RBAdd: TFlatRadioButton;
    RBModify: TFlatRadioButton;
    BtnDel: TFlatButton;
    GB2: TFlatGroupBox;
    Panel3: TFlatPanel;
    Chk1: TFlatCheckBox;
    CHK2: TFlatCheckBox;
    CHK3: TFlatCheckBox;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    BtnExit1: TFlatButton;
    procedure BtnExitClick(Sender: TObject);
    procedure CmbQXChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LtbUserClick(Sender: TObject);
    procedure RBModifyClick(Sender: TObject);
    procedure RBAddClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure DBConnection;
    Procedure ReadUserName;
    Procedure ReadUserData; 
  public
    { Public declarations }
  end;

var
  FrmUserSetup: TFrmUserSetup;

implementation

{$R *.dfm}

procedure TFrmUserSetup.BtnExitClick(Sender: TObject);
begin
close;
end;

procedure TFrmUserSetup.CmbQXChange(Sender: TObject);
begin
 if cmbQX.ItemIndex =1 then
   begin
     chk1.Checked :=True;
     Chk2.Checked :=True;
     Chk3.Checked :=True;
   end  else
     begin
       Chk1.Checked :=False;
       Chk2.Checked :=False;
       Chk3.Checked :=False;
     end;
end;

procedure TFrmUserSetup.DBConnection;
var
  DataPath:string;
begin
  if ADOConnection1.Connected then ADOConnection1.Close;
  //防止被重复打开而导到数据连接错误

  DataPath:=ExtractFilePath(Application.ExeName)+'Data\mgr.db';
  {登录加密的数据库}

  ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+DataPath+';

  ADOConnection1.Open();
end;

procedure TFrmUserSetup.ReadUserName;
begin
DBConnection;
ADOQuery1.SQL.Clear ;
ADOQuery1.Close;
ADOQuery1.SQL.Text :='select * from Login';
ADOQuery1.Open ;
ADOQuery1.First ;
LtbUser.Items.Clear;
while not ADOQuery1.Eof do
  begin
    LtbUser.Items.Add(ADOQuery1.FieldValues['user']);
    ADOQuery1.Next ;
  end;
ADOQuery1.Close;
end;

procedure TFrmUserSetup.FormActivate(Sender: TObject);
begin
ReadUserName;
end;

procedure TFrmUserSetup.FormCreate(Sender: TObject);
begin
  EditUser.Clear;  EditPwd.Clear ;
end;

procedure TFrmUserSetup.LtbUserClick(Sender: TObject);
begin
if (ltbuser.ItemIndex <>-1) and (ltbuser.ItemIndex <ltbuser.Items.Count) then
    begin
      ReadUserData;
      btndel.Enabled :=true;
      CmbQx.OnChange(self);
    end;
end;

procedure TFrmUserSetup.ReadUserData;
var userTemp:string;
begin
  DBConnection;
  ADOQuery1.SQL.Clear ;
  ADOQuery1.Close;
  userTemp:=LtBuser.Items[LtBuser.ItemIndex];
  EditUser.Text :=UserTemp;
  ADOQuery1.SQL.Text :='select * from login where user='+'"'+userTemp+'"';
  ADOQuery1.Open ;
//  ADOQuery1.Locate('user',usertemp,[]);
  EditPwd.Text :=ADOQuery1.FieldValues['pwd'];
  if ADOQuery1.FieldValues ['level']=0 then
    begin
      CmbQX.ItemIndex :=cmbQX.Items.IndexOf('超级用户')
    end else
      CmbQX.ItemIndex :=cmbqx.Items.IndexOf('普通用户');
  ADOQuery1.Close;
end;

procedure TFrmUserSetup.RBModifyClick(Sender: TObject);
begin
  if RBModify.Checked then
    begin
      edituser.Enabled :=TRue;
      EditPwd.Enabled :=TRue;
      Cmbqx.Enabled :=True;
      BtnSave.Enabled :=True;
      ReadUserData;
      BtnCancel.Enabled :=True;
    end;
end;

procedure TFrmUserSetup.RBAddClick(Sender: TObject);
begin
  if RBAdd.Checked then
    begin
      edituser.Enabled :=TRue;
      EditPwd.Enabled :=TRue;
      Edituser.Clear;  Editpwd.Clear ;
      Cmbqx.Enabled :=True;
      BtnSave.Enabled :=True;
      BtnCancel.Enabled :=True;
    end;
end;

procedure TFrmUserSetup.BtnCancelClick(Sender: TObject);
begin
  EditUser.Enabled :=False;
  EditPwd.Enabled :=False;
  CmbQX.Enabled :=False;
  rbModify.Checked :=False;
  rbAdd.Checked :=False;
  BtnSave.Enabled :=False;
  BtnCancel.Enabled :=False;
end;

procedure TFrmUserSetup.BtnSaveClick(Sender: TObject);
var usertemp:string;
begin
  DBConnection;
  ADOQuery1.SQL.Clear ;
  ADOQuery1.Close;
  userTemp:=LtBuser.Items[LtBuser.ItemIndex];
  ADOQuery1.SQL.Text :='select * from login where user='+'"'+userTemp+'"';
  ADOQuery1.Open ;
  if rbAdd.Checked then ADOQuery1.Append else ADOQuery1.Edit;
  ADOQuery1.FieldByName('user').AsString :=EditUser.Text ;
  ADOQuery1.FieldByName('Pwd').AsString :=EditPwd.Text ;
  if CmbQX.ItemIndex =0 then
    ADOQuery1.FieldByName('level').AsInteger :=1
    else
      ADOQuery1.FieldByName('level').AsInteger :=0;
  ADOQuery1.Post;
  ReadUserName;
  ADOQuery1.Close;
  BtnCancel.Click;  
end;

procedure TFrmUserSetup.BtnDelClick(Sender: TObject);
var usertemp:string;
begin
  DBConnection;
  ADOQuery1.SQL.Clear ;
  ADOQuery1.Close;
  userTemp:=LtBuser.Items[LtBuser.ItemIndex];
  ADOQuery1.SQL.Text :='delete from login where user='+'"'+userTemp+'"';
  ADOQuery1.ExecSQL ;
  ReadUserName;
  ADOQuery1.Close;
  BtnCancel.Click;

end;

procedure TFrmUserSetup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOQuery1.Close;
  ADOConnection1.Close;
end;

end.

unit EditPerson;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, SUIButton, StdCtrls, ComCtrls, ExtCtrls, SUIForm, myClass,
  Grids, DBGridEh, SUIPageControl, SUITabControl, SUIImagePanel, ActnList,
  GridsEh;

type
  TfrmEditPerson = class(TBaseFrm)
    suiImagePanel1: TsuiImagePanel;
    Label1: TLabel;
    edtCertNo: TEdit;
    Label2: TLabel;
    edtName: TEdit;
    Label6: TLabel;
    cmbDeptId: TComboBox;
    Label3: TLabel;
    rbGender1: TRadioButton;
    rbGender2: TRadioButton;
    Label4: TLabel;
    cmbMaritalStatus: TComboBox;
    Label5: TLabel;
    edtBirthDate: TDateTimePicker;
    memComments: TMemo;
    Label7: TLabel;
    btnSave: TsuiButton;
    btnClose: TsuiButton;
    suiPageControl1: TsuiPageControl;
    suiTabSheet2: TsuiTabSheet;
    suiImagePanel3: TsuiImagePanel;
    suiTabSheet1: TsuiTabSheet;
    suiImagePanel2: TsuiImagePanel;
    btnNewUserLogin: TsuiButton;
    btnEditUserLogin: TsuiButton;
    btnDelUserLogin: TsuiButton;
    btnSetUserLoginSecurityGroup: TsuiButton;
    DBGridEh1: TDBGridEh;
    ActionList1: TActionList;
    actSavePerson: TAction;
    actSetUserLoginSecurityGroup: TAction;
    actNewUserLogin: TAction;
    actEditUserLogin: TAction;
    actDelUserLogin: TAction;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure actSavePersonExecute(Sender: TObject);
    procedure actSetUserLoginSecurityGroupExecute(Sender: TObject);
    procedure actNewUserLoginExecute(Sender: TObject);
    procedure actEditUserLoginExecute(Sender: TObject);
    procedure actDelUserLoginExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fPerson:TPerson;
    procedure SetPerson(value:TPerson);
    procedure BuildPerson;
  public
    { Public declarations }
    property person:TPerson read fPerson write SetPerson;

  end;

var
  frmEditPerson: TfrmEditPerson;

implementation

uses DataModule, UserLoginSecurityPermission, EditUserLogin;

{$R *.dfm}

{ TBaseFrm5 }

procedure TfrmEditPerson.SetPerson(value: TPerson);
var
  I:Integer;
  dept:TDepartment;
begin
  fPerson:=value;
  edtCertNo.Text:='';
  edtName.Text:='';
  cmbDeptId.ItemIndex:=-1;
  rbGender1.Checked:=true;
  rbGender2.Checked:=false;
  cmbMaritalStatus.ItemIndex:=-1;
  edtBirthDate.Date:=Date();
  memComments.Lines.Text:='';
  if Assigned(value) then
  begin
    edtCertNo.Text:=value.certNo;
    edtName.Text:=value.name;
    for I:=0 to cmbDeptId.Items.Count-1 do
    begin
      dept:=TDepartment(cmbDeptId.Items.Objects[I]);
      if dept.partyId=value.deptId then
      begin
        cmbDeptId.ItemIndex:=I;
        break;
      end;
    end;
    rbGender1.Checked:=true;
    rbGender2.Checked:=false;
    cmbMaritalStatus.ItemIndex:=-1;
    edtBirthDate.Date:=value.birthDate;
    memComments.Lines.Text:=value.comments;
    DataModule_frm.SearchPartyUserLogin(value.partyId);
  end
  else DataModule_frm.SearchPartyUserLogin('');

end;

procedure TfrmEditPerson.FormCreate(Sender: TObject);
var
  dept:TDepartment;
begin
  inherited;
  dept:=TDepartment.Create;
  dept.partyId:='-1';
  dept.description:='阳光公司';
  cmbDeptId.Clear;
  DataModule_frm.BuildDeptComboBox(dept,cmbDeptId);
end;


procedure TfrmEditPerson.FormShow(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmEditPerson.btnSaveClick(Sender: TObject);
begin
  inherited;
  if Assigned(fPerson) then
  begin
    BuildPerson;
    DataModule_frm.update_person(fPerson);
  end
  else
  begin
    BuildPerson;
    DataModule_frm.insert_person(fPerson);
  end;
end;

procedure TfrmEditPerson.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmEditPerson.BuildPerson;
var
  dept:TDepartment;
begin
  if not Assigned(fPerson) then
  begin
    fPerson:=TPerson.Create;
    fPerson.partyId:='';
  end;
  with fPerson do
  begin
    certNo:=edtCertNo.Text;
    name:=edtName.Text;
    deptId:='-1';
    dept:=TDepartment(cmbDeptId.Items.Objects[cmbDeptId.ItemIndex]);
    if Assigned(dept) then deptId:=dept.partyId;
    birthDate:=edtBirthDate.Date;
    comments:=memComments.Lines.Text;
  end;
end;

procedure TfrmEditPerson.actSavePersonExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmEditPerson.actSetUserLoginSecurityGroupExecute(Sender: TObject);
var
  userloginId:String;
begin
  inherited;
  if DataModule_frm.qUserLogin.IsEmpty then exit;
  userloginId:=DataModule_frm.qUserLogin.FieldByName('userLoginId').AsString;
  frmUserLoginSecurityPermission.userLogin:=DataModule_frm.GetUserLogin(userloginId);
  frmUserLoginSecurityPermission.ShowModal;
end;

procedure TfrmEditPerson.actNewUserLoginExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(fPerson) then exit;
  frmEditUserLogin.partyId:=fPerson.partyId;
  frmEditUserLogin.UserLogin:=nil;
  frmEditUserLogin.ShowModal;
  DataModule_frm.SearchPartyUserLogin(fPerson.partyId);
end;

procedure TfrmEditPerson.actEditUserLoginExecute(Sender: TObject);
var
  userlogin:TUserLogin;
begin
  inherited;
  if DataModule_frm.qUserLogin.IsEmpty then exit;
  if not Assigned(fPerson) then exit;
  userlogin:=DataModule_frm.GetUserLogin(DataModule_frm.qUserLogin.FieldByName('userLoginId').AsString);
  frmEditUserLogin.partyId:=fPerson.partyId;
  frmEditUserLogin.UserLogin:=userlogin;
  frmEditUserLogin.ShowModal;
  DataModule_frm.SearchPartyUserLogin(fPerson.partyId);
end;

procedure TfrmEditPerson.actDelUserLoginExecute(Sender: TObject);
var
  userlogin:TUserLogin;
begin
  inherited;
  if DataModule_frm.qUserLogin.IsEmpty then exit;
  userlogin:=DataModule_frm.GetUserLogin(DataModule_frm.qUserLogin.FieldByName('userLoginId').AsString);
  if Application.MessageBox(PChar('是否删除登录名'''+userLogin.userLoginId+''''),'提示',MB_YESNO +MB_ICONWARNING)=IDYES then
  begin
    DataModule_frm.delete_UserLogin(userlogin);
  end;
  DataModule_frm.SearchPartyUserLogin(fPerson.partyId);
end;

end.

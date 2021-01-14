unit UserLoginSecurityPermission;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, StdCtrls, CheckLst, SUIPageControl, SUITabControl,
  ComCtrls, SUIImagePanel, ExtCtrls, SUIForm, Buttons, SUIButton,
  myClass, ImgList, fcTreeView;

type
  TfrmUserLoginSecurityPermission = class(TBaseFrm)
    suiImagePanel2: TsuiImagePanel;
    suiPageControl1: TsuiPageControl;
    suiTabSheet2: TsuiTabSheet;
    CheckListBox1: TCheckListBox;
    suiTabSheet3: TsuiTabSheet;
    CheckListBox2: TCheckListBox;
    suiTabSheet1: TsuiTabSheet;
    suiButton1: TsuiButton;
    clbUserLoginPermission: TCheckListBox;
    suiPanel1: TsuiPanel;
    ilStandard: TImageList;
    ilChecks: TImageList;
    ilFlatChecks: TImageList;
    tvSecurityGroup: TfcTreeView;
    procedure FormShow(Sender: TObject);
    procedure clbUserLoginPermissionClickCheck(Sender: TObject);
  private
    { Private declarations }
    procedure BuildSecurityPermissionView;
    procedure BuildUserLoginPermissionView(userLoginId:String);

    procedure OnToggled(TreeView: TfcCustomTreeView; Node: TfcTreeNode);
  public
    { Public declarations }
    userLogin:TUserLogin;
    procedure BuildUserLoginSecurityGroupView(userLoginId:String);
  end;

var
  frmUserLoginSecurityPermission: TfrmUserLoginSecurityPermission;

implementation

uses DataModule;

{$R *.dfm}

procedure TfrmUserLoginSecurityPermission.BuildSecurityPermissionView;
var
  I:Integer;
  SecurityPermissions:TList;
  SecurityPermission:TSecurityPermission;
begin
  SecurityPermissions:=DataModule_frm.GetSecurityPermissions;
  clbUserLoginPermission.Clear;
  for I:=0 to SecurityPermissions.Count-1 do
  begin
     SecurityPermission:=TSecurityPermission(SecurityPermissions.Items[I]);
     clbUserLoginPermission.AddItem(SecurityPermission.description,SecurityPermission);
     clbUserLoginPermission.Checked[I]:=false;
  end;
end;

procedure TfrmUserLoginSecurityPermission.BuildUserLoginPermissionView(
  userLoginId: String);
var
  I,J:Integer;
  UserLoginSecurityPermissions:TList;
  SecurityPermission1,SecurityPermission2:TSecurityPermission;
begin
  UserLoginSecurityPermissions:=DataModule_frm.GetUserLoginSecurityPermissions(userloginId);
  for I:=0 to clbUserLoginPermission.Count-1 do
  begin
     clbUserLoginPermission.Checked[I]:=false;
     SecurityPermission1:=TSecurityPermission(clbUserLoginPermission.Items.Objects[I]);
     for J:=0 to UserLoginSecurityPermissions.Count-1 do
     begin
       SecurityPermission2:=TSecurityPermission(UserLoginSecurityPermissions.Items[J]);
       if SecurityPermission1.permissionId=SecurityPermission2.permissionId then
       begin
         clbUserLoginPermission.Checked[I]:=true;
         break;
       end;
     end;
  end; 
end;

procedure TfrmUserLoginSecurityPermission.BuildUserLoginSecurityGroupView(
  userLoginId: String);
var
  I,J:Integer;
  aNode:TfcTreeNode;
  UserLoginSecurityGroups:TList;
  SecurityGroup1,SecurityGroup2:TSecurityGroup;
begin
  UserLoginSecurityGroups:=DataModule_frm.GetUserLoginSecurityGroups(userLoginId);

  for I:=0 to tvSecurityGroup.Items.Count-1 do
  begin
    aNode:=tvSecurityGroup.Items[I];
    SecurityGroup1:=TSecurityGroup(aNode.Data);
    aNode.Checked:=false;
    for J:=0 to UserLoginSecurityGroups.Count-1 do
    begin
      SecurityGroup2:=TSecurityGroup(UserLoginSecurityGroups.Items[J]);
      if SecurityGroup1.groupId=SecurityGroup2.groupId then
      begin
        aNode.Checked := true;
        break;
      end;
    end;
  end;

end;

procedure TfrmUserLoginSecurityPermission.FormShow(Sender: TObject);
begin
  inherited;
  tvSecurityGroup.OnToggleCheckbox:=nil;
  DataModule_frm.BuildCheckSecurityGroupTree(tvSecurityGroup);
  BuildUserLoginSecurityGroupView(userLogin.userLoginId);
  tvSecurityGroup.OnToggleCheckbox:=OnToggled;
  BuildSecurityPermissionView;
  BuildUserLoginPermissionView(userLogin.userLoginId);
end;

procedure TfrmUserLoginSecurityPermission.OnToggled(TreeView: TfcCustomTreeView; Node: TfcTreeNode);
var
  SecurityGroup:TSecurityGroup;
begin
  if not Assigned(Node) then exit;
  SecurityGroup:=TSecurityGroup(Node.Data);
  DataModule_frm.insert_UserLoginSecurityGroup(SecurityGroup.groupId,userLogin.userLoginId,Node.Checked);
  DataModule_frm.SecurityGroupPermissionToUserLogin(SecurityGroup.groupId,userLogin.userLoginId,Node.Checked);
  BuildUserLoginPermissionView(userLogin.userLoginId);
end;

procedure TfrmUserLoginSecurityPermission.clbUserLoginPermissionClickCheck(
  Sender: TObject);
var
  SecurityPermission:TSecurityPermission;
begin
  inherited;
  SecurityPermission:=TSecurityPermission(clbUserLoginPermission.Items.Objects[clbUserLoginPermission.ItemIndex]);
  if not Assigned(SecurityPermission) then exit;
  DataModule_frm.insert_UserLoginPermission(userlogin.userLoginId,SecurityPermission.permissionId,clbUserLoginPermission.Checked[clbUserLoginPermission.ItemIndex]);
end;

end.

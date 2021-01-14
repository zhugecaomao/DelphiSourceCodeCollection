unit SecurityGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, SUIButton, ComCtrls, StdCtrls, CheckLst,
  SUIPageControl, SUITabControl, SUIImagePanel, ExtCtrls, SUIForm, Menus,
  ActnList, Grids, DBGridEh, GridsEh;

type
  TfrmSecurityGroup = class(TBaseFrm)
    suiImagePanel1: TsuiImagePanel;
    tvSecurityGroup: TTreeView;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ActionList1: TActionList;
    actAddSecurityGroup: TAction;
    actEditSecurityGroup: TAction;
    actDelSecurityGroup: TAction;
    suiImagePanel2: TsuiImagePanel;
    suiPageControl1: TsuiPageControl;
    suiTabSheet4: TsuiTabSheet;
    suiTabSheet3: TsuiTabSheet;
    suiTabSheet2: TsuiTabSheet;
    suiTabSheet1: TsuiTabSheet;
    DBGridEh1: TDBGridEh;
    CheckListBox1: TCheckListBox;
    procedure FormShow(Sender: TObject);
    procedure actAddSecurityGroupExecute(Sender: TObject);
    procedure actEditSecurityGroupExecute(Sender: TObject);
    procedure actDelSecurityGroupExecute(Sender: TObject);
    procedure tvSecurityGroupClick(Sender: TObject);
    procedure tvSecurityGroupEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure CheckListBox1ClickCheck(Sender: TObject);
  private
    { Private declarations }
    fSecurityGroupNode:TTreeNode;
    IsEditing:Boolean;
    procedure SaveSecurityGroupNode(SecurityGroupNode:TTreeNode);
    procedure BuildSecurityPermissionView;
    procedure BuildSecurityGroupPermissionView(groupId:Integer);
  public
    { Public declarations }
  end;

var
  frmSecurityGroup: TfrmSecurityGroup;

implementation

uses DataModule, myClass;

{$R *.dfm}

procedure TfrmSecurityGroup.FormShow(Sender: TObject);
var
  SecurityGroup:TSecurityGroup;
  aNode:TTreeNode;
begin
  inherited;
  SecurityGroup:=TSecurityGroup.Create;
  SecurityGroup.groupId:=-1;
  SecurityGroup.parentId:=-1;
  SecurityGroup.description:='安全组';
  tvSecurityGroup.Items.Clear;
  aNode:=tvSecurityGroup.Items.AddChild(nil,SecurityGroup.description);
  aNode.Data:=SecurityGroup;
  DataModule_frm.BuildSecurityGroupTree(aNode,tvSecurityGroup);
  BuildSecurityPermissionView;
  BuildSecurityGroupPermissionView(SecurityGroup.groupId);
end;

procedure TfrmSecurityGroup.actAddSecurityGroupExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(fSecurityGroupNode) then exit;
  fSecurityGroupNode:=tvSecurityGroup.Items.AddChild(fSecurityGroupNode,'');
  fSecurityGroupNode.Parent.Expand(true);
  fSecurityGroupNode.EditText;
end;

procedure TfrmSecurityGroup.actEditSecurityGroupExecute(Sender: TObject);
begin
  inherited;
  if not assigned(fSecurityGroupNode) then exit;
  if fSecurityGroupNode.Level<>0 then
  begin
    fSecurityGroupNode.EditText;
  end;
end;

procedure TfrmSecurityGroup.actDelSecurityGroupExecute(Sender: TObject);
var
  SecurityGroup:TSecurityGroup;
begin
  inherited;
  if not Assigned(fSecurityGroupNode) then exit;
  if fSecurityGroupNode.Level=0 then exit;
  SecurityGroup:=TSecurityGroup(fSecurityGroupNode.Data);
  if Application.MessageBox(PChar('是否删除安全组'''+SecurityGroup.description+''''),'提示',MB_YESNO +MB_ICONWARNING)=IDYES then
  begin
    fSecurityGroupNode.Delete;
    fSecurityGroupNode:=nil;
    DataModule_frm.delete_SecurityGroup(SecurityGroup);
  end;
end;

procedure TfrmSecurityGroup.tvSecurityGroupClick(Sender: TObject);
var
  SecurityGroup:TSecurityGroup;
begin
  inherited;
  SaveSecurityGroupNode(fSecurityGroupNode);
  IsEditing:=false;
  fSecurityGroupNode:=tvSecurityGroup.Selected;
  if not Assigned(fSecurityGroupNode) then exit;
  SecurityGroup:=TSecurityGroup(fSecurityGroupNode.Data);
  DataModule_frm.SearchSecurityGroupUserLogin(SecurityGroup.groupId);
  BuildSecurityGroupPermissionView(SecurityGroup.groupId);
end;

procedure TfrmSecurityGroup.tvSecurityGroupEditing(Sender: TObject;
  Node: TTreeNode; var AllowEdit: Boolean);
begin
  inherited;
  IsEditing:=true;
  if Node.Level=0 then
  begin
    IsEditing:=false;
    AllowEdit:=false;
  end;
end;

procedure TfrmSecurityGroup.SaveSecurityGroupNode(
  SecurityGroupNode: TTreeNode);
var
  SecurityGroup:TSecurityGroup;
  parentNode:TTreeNode;
begin
  if IsEditing then
  begin
    if Length(SecurityGroupNode.Text)=0 then
    begin
      Application.MessageBox('请输入安全组名称','提示',MB_OK +MB_ICONWARNING);
      SecurityGroupNode.EditText;
      exit;
    end;
    SecurityGroup:=TSecurityGroup(SecurityGroupNode.Data);
    if not Assigned(SecurityGroup) then
    begin
       SecurityGroup:=TSecurityGroup.Create;
       parentNode:=SecurityGroupNode.Parent;
       SecurityGroup.parentId:=-1;
       if Assigned(parentNode.Data) then
         SecurityGroup.parentId:=TSecurityGroup(parentNode.Data).groupId;
       SecurityGroup.description:=SecurityGroupNode.Text;
       DataModule_frm.insert_SecurityGroup(SecurityGroup);
    end
    else
    begin
      SecurityGroup.description:=SecurityGroupNode.Text;
      DataModule_frm.update_SecurityGroup(SecurityGroup);
    end;
    SecurityGroupNode.Data:=SecurityGroup;
  end; 
end;

procedure TfrmSecurityGroup.BuildSecurityGroupPermissionView(
  groupId: Integer);
var
  I,J:Integer;
  SecurityGroupPermissions:TList;
  SecurityPermission1,SecurityPermission2:TSecurityPermission;
begin
  SecurityGroupPermissions:=DataModule_frm.GetSecurityGroupPermissions(groupId);
  for I:=0 to CheckListBox1.Count-1 do
  begin
     CheckListBox1.Checked[I]:=false;
     SecurityPermission1:=TSecurityPermission(CheckListBox1.Items.Objects[I]);
     for J:=0 to SecurityGroupPermissions.Count-1 do
     begin
       SecurityPermission2:=TSecurityPermission(SecurityGroupPermissions.Items[J]);
       if SecurityPermission1.permissionId=SecurityPermission2.permissionId then
       begin
         CheckListBox1.Checked[I]:=true;
         break;
       end;
     end;
  end;
end;

procedure TfrmSecurityGroup.BuildSecurityPermissionView;
var
  I:Integer;
  SecurityPermissions:TList;
  SecurityPermission:TSecurityPermission;
begin
  SecurityPermissions:=DataModule_frm.GetSecurityPermissions;
  CheckListBox1.Clear;
  for I:=0 to SecurityPermissions.Count-1 do
  begin
     SecurityPermission:=TSecurityPermission(SecurityPermissions.Items[I]);
     CheckListBox1.AddItem(SecurityPermission.description,SecurityPermission);
     CheckListBox1.Checked[I]:=false;
  end; 
end;

procedure TfrmSecurityGroup.CheckListBox1ClickCheck(Sender: TObject);
var
  SecurityPermission:TSecurityPermission;
  SecurityGroup:TSecurityGroup;
begin
  inherited;
  if not Assigned(fSecurityGroupNode) then exit;
  SecurityGroup:= TSecurityGroup(fSecurityGroupNode.Data);
  SecurityPermission:=TSecurityPermission(CheckListBox1.Items.Objects[CheckListBox1.ItemIndex]);
  DataModule_frm.Insert_SecurityGroupPermission(SecurityGroup.groupId,SecurityPermission.permissionId,CheckListBox1.Checked[CheckListBox1.ItemIndex]);
end;

end.

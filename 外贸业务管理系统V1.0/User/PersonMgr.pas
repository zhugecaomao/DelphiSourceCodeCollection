unit PersonMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, SUIForm,  ComCtrls, SUIImagePanel,
  SUIButton, ToolWin, SUIToolBar, Grids, DBGridEh, Menus, ActnList, GridsEh;

type
  TfrmPersonMgr = class(TBaseFrm)
    suiImagePanel1: TsuiImagePanel;
    suiImagePanel2: TsuiImagePanel;
    tvDept: TTreeView;
    suiImagePanel3: TsuiImagePanel;
    suiButton1: TsuiButton;
    DBGridEh1: TDBGridEh;
    suiButton2: TsuiButton;
    suiButton3: TsuiButton;
    suiButton4: TsuiButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    suiButton5: TsuiButton;
    ActionList1: TActionList;
    actAddDeptment: TAction;
    actEditDeptment: TAction;
    actDelDeptment: TAction;
    actSearchPerson: TAction;
    actAddPerson: TAction;
    actEditPerson: TAction;
    actDelPerson: TAction;
    actClose: TAction;
    procedure FormShow(Sender: TObject);
    procedure tvDeptClick(Sender: TObject);
    procedure actAddDeptmentExecute(Sender: TObject);
    procedure actEditDeptmentExecute(Sender: TObject);
    procedure tvDeptEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure actDelDeptmentExecute(Sender: TObject);
    procedure actAddPersonExecute(Sender: TObject);
    procedure actEditPersonExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actDelPersonExecute(Sender: TObject);
  private
    { Private declarations }
    fDeptNode:TTreeNode;
    IsEditing:Boolean;
    procedure SaveDeptNode(deptNode:TTreeNode);
  public
    { Public declarations }    
  end;

var
  frmPersonMgr: TfrmPersonMgr;

implementation

uses DataModule, myClass, EditPerson;

{$R *.dfm}

procedure TfrmPersonMgr.FormShow(Sender: TObject);
var
  dept:TDepartment;
  aNode:TTreeNode;
begin
  inherited;
  IsEditing:=false;
  fDeptNode:=nil;
  dept:=TDepartment.Create;
  dept.partyId:='-1';
  dept.description:='阳光公司';
  tvDept.Items.Clear;
  aNode:=tvDept.Items.Add(nil,dept.description);
  aNode.Data:=dept;
  DataModule_frm.BuildDeptTree(aNode,tvDept);
end;

procedure TfrmPersonMgr.tvDeptClick(Sender: TObject);
var
  dept:TDepartment;
begin
  inherited;
  SaveDeptNode(fDeptNode);
  IsEditing:=false;
  fDeptNode:=tvDept.Selected;
  if not Assigned(fDeptNode) then exit;
  dept:=TDepartment(fDeptNode.Data);
  DataModule_frm.SearchPerson('deptId='''+dept.partyId+'''');
end;

procedure TfrmPersonMgr.SaveDeptNode(deptNode: TTreeNode);
var
  Dept:TDepartment;
  parentNode:TTreeNode;
begin
  if IsEditing then
  begin
    if Length(deptNode.Text)=0 then
    begin
      Application.MessageBox('请输入部门名称','提示',MB_OK +MB_ICONWARNING);
      deptNode.EditText;
      exit;
    end;
    Dept:=TDepartment(deptNode.Data);
    if not Assigned(Dept) then
    begin
       Dept:=TDepartment.Create;
       parentNode:=deptNode.Parent;
       Dept.parentId:='-1';
       if Assigned(parentNode.Data) then
         Dept.parentId:=TDepartment(parentNode.Data).partyId;
       Dept.description:=deptNode.Text;
       DataModule_frm.insert_department(Dept);
    end
    else
    begin
      Dept.description:=deptNode.Text;
      DataModule_frm.update_department(Dept);
    end;
    DeptNode.Data:=Dept;
  end;   
end;

procedure TfrmPersonMgr.actAddDeptmentExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(fDeptNode) then exit;
  fDeptNode:=tvDept.Items.AddChild(fDeptNode,'');
  fDeptNode.Parent.Expand(true);
  fDeptNode.EditText;
end;

procedure TfrmPersonMgr.actEditDeptmentExecute(Sender: TObject);
begin
  inherited;
  if not assigned(fDeptNode) then exit;
  if fDeptNode.Level<>0 then
  begin
    fDeptNode.EditText;
  end;
end;

procedure TfrmPersonMgr.tvDeptEditing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
  inherited;
  IsEditing:=true;
  if Node.Level=0 then
  begin
    IsEditing:=false;
    AllowEdit:=false;
  end;
end;

procedure TfrmPersonMgr.actDelDeptmentExecute(Sender: TObject);
var
  dept:TDepartment;
begin
  inherited;
  if not Assigned(fDeptNode) then exit;
  if fDeptNode.Level=0 then exit;
  dept:=TDepartment(fDeptNode.Data);
  if Application.MessageBox(PChar('是否删除部门'''+dept.description+''''),'提示',MB_YESNO +MB_ICONWARNING)=IDYES then
  begin
    fDeptNode.Delete;
    fDeptNode:=nil;
    DataModule_frm.delete_department(dept);
  end;
end;

procedure TfrmPersonMgr.actAddPersonExecute(Sender: TObject);
begin
  inherited;
  frmEditPerson.person:=nil;
  frmEditPerson.ShowModal;
end;

procedure TfrmPersonMgr.actEditPersonExecute(Sender: TObject);
begin
  inherited;
  if DataModule_frm.qPerson.IsEmpty then exit;
  frmEditPerson.person:=DataModule_frm.GetPerson(DataModule_frm.qPerson.FieldByName('partyId').AsString);
  frmEditPerson.ShowModal;
end;

procedure TfrmPersonMgr.actCloseExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPersonMgr.actDelPersonExecute(Sender: TObject);
var
  person:TPerson;
begin
  inherited;
  if DataModule_frm.qPerson.IsEmpty then exit;
  person:=DataModule_frm.GetPerson(DataModule_frm.qPerson.FieldByName('partyId').AsString);
  if Application.MessageBox(PChar('是否删除'''+person.name+''''),'提示',MB_YESNO +MB_ICONWARNING)=IDYES then
  begin
    DataModule_frm.delete_person(person);
  end;
end;

end.

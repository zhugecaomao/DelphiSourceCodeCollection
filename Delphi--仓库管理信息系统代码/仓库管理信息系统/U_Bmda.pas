unit U_Bmda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Buttons, Db, DBClient, ImgList, Menus, StdCtrls,
  Mask, DBCtrls, Grids, DBGrids, ADODB;

type
  TfrmBmda = class(TForm)
    pmOperate: TPopupMenu;
    N_insert: TMenuItem;
    N_delete: TMenuItem;
    N_edit: TMenuItem;
    N_cancel: TMenuItem;
    N_save: TMenuItem;
    N7: TMenuItem;
    N_refresh: TMenuItem;
    ImageList1: TImageList;
    DataSource: TDataSource;
    ImageList2: TImageList;
    aqBMDA: TADOQuery;
    Panel1: TPanel;
    Splitter1: TSplitter;
    TreeView: TTreeView;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdt_Bmbm: TDBEdit;
    DBEdt_Bmmc: TDBEdit;
    DBEdt_Fzrxm: TDBEdit;
    DBEdt_Bmsx: TDBEdit;
    DBEdt_Lxdh: TDBEdit;
    DBEdt_DZ: TDBEdit;
    DBEdt_BZ: TDBEdit;
    TabSheet2: TTabSheet;
    DBGrid: TDBGrid;
    Label9: TLabel;
    btnCancel: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N_insertClick(Sender: TObject);
    procedure N_saveClick(Sender: TObject);
    procedure N_refreshClick(Sender: TObject);
    procedure N_editClick(Sender: TObject);
    procedure N_cancelClick(Sender: TObject);
    procedure N_deleteClick(Sender: TObject);
    procedure TreeViewClick(Sender: TObject);
    procedure N_OrderClick(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
    procedure btnCancelClick(Sender: TObject);

  private
    Node_Parent: TTreeNode; //存储父节点
    Node_Child: TTreeNode; //存储当前节点
    b_pd: bool; //用于判断点击的是添加还是编辑
    //在添加、编辑和浏览状态互置按钮的有效性
    procedure button_valid;
    //RefreshTree方法用于将部门档案的部门编码分层次以树型目录的形式显示出来
    procedure refreshTree;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmBmda: TfrmBmda;

implementation

uses  uPublic,uDB;

{$R *.DFM}

//在添加、编辑和浏览状态互置组件的有效性
procedure TfrmBmda.button_valid;
begin
  DBEdt_Bmbm.enabled := not DBEdt_Bmbm.enabled;
  DBEdt_Bmmc.enabled := not DBEdt_Bmmc.enabled;
  DBEdt_Fzrxm.enabled := not DBEdt_Fzrxm.enabled;
  DBEdt_Bmsx.enabled := not DBEdt_Bmsx.enabled;
  DBEdt_Lxdh.enabled := not DBEdt_Lxdh.enabled;
  DBEdt_DZ.enabled := not DBEdt_DZ.enabled;
  DBEdt_BZ.enabled := not DBEdt_BZ.enabled;
  n_insert.enabled := not n_insert.enabled;
  n_delete.enabled := not n_delete.enabled;
  n_edit.enabled := not n_edit.enabled;
  n_cancel.enabled := not n_cancel.enabled;
  n_save.enabled := not n_save.enabled;
  n_refresh.enabled := not n_refresh.enabled;
  Treeview.enabled := not Treeview.Enabled;
end;

//RefreshTree方法用于将部门档案的部门编码分层次以树型目录的形式显示出来
procedure TfrmBmda.refreshTree;
var
  mynode_1, mynode_2, mynode_3: Ttreenode;
  s_bm_1: string;
  s_mc_1: string;
begin
  treeview.Items.clear;
  //添加根目录名
  mynode_1 := Treeview.Items.Add(Treeview.topitem, '部门档案');
  mynode_1.imageindex := 0;
  mynode_1.stateindex := -1;
  mynode_1.selectedindex := 1;
  //指定部门表记录顺序

  aqBMDA.SQL.Text :='select * from BMDA order by DepCode ';
  aqBMDA.Open;
  //aqBMDA.indexname := 'DepCode';
  //aqBMDA.First;
  while not aqBMDA.Eof do
  begin
    s_bm_1 := aqBMDA.fieldbyname('DepCode').asstring;
    s_mc_1 := aqBMDA.fieldbyname('DepName').asstring;
    //添加第一级部门名
    if length(trim(s_bm_1)) = 2 then
    begin
      mynode_2 := Treeview.items.addchild(mynode_1, '(' + s_bm_1 + ') ' + s_mc_1);
      mynode_2.imageindex := 0;
      mynode_2.stateindex := -1;
      mynode_2.selectedindex := 1;
    end;
    //添加第二级部门名
    if length(trim(s_bm_1)) = 5 then
    begin
      mynode_3 := Treeview.items.addchild(mynode_2, '(' + s_bm_1 + ') ' + s_mc_1);
      mynode_3.imageindex := 0;
      mynode_3.stateindex := -1;
      mynode_3.selectedindex := 1;
    end;
    aqBMDA.next;
  end;
end;

procedure TfrmBmda.FormShow(Sender: TObject);
begin
  aqBMDA.Active := True;

  refreshTree; //调用RefreshTree方法将部门档案的部门编码分层次以树型目录的形式显示出来
  Treeview.topitem.Selected := true;
end;

procedure TfrmBmda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  frmBmda := nil;
end;

//添加
procedure TfrmBmda.N_insertClick(Sender: TObject);
var
  gs_global: string; //存储添加的父节点标题；
begin
  b_pd := true;
  Node_Parent := Treeview.selected;
  if Node_Parent.level = 2 then
  begin
    Application.messagebox('最底层不能添加，请在上层添加', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  //设置按扭的有效性
  button_valid;
  if Node_Parent.level = 0 then
  begin
    aqBMDA.Insert;
    aqBMDA.FieldByName('DepCode').editmask := '99;1;_';
    pagecontrol1.ActivePageIndex := 0;
    DBEdt_Bmbm.setfocus;
  end;
  if Node_Parent.level = 1 then
  begin
    gs_global := copy(Node_Parent.text, 2, 2);
    aqBMDA.insert;
    aqBMDA.FieldByName('DepCode').editmask := '99-99;1;_';
    pagecontrol1.ActivePageIndex := 0;
    DBEdt_Bmbm.setfocus;
    DBEdt_Bmbm.text := gs_global;
  end;
end;

procedure TfrmBmda.N_editClick(Sender: TObject);
begin
  b_pd := false;
  Node_Child := Treeview.selected;
  if Node_Child.level = 0 then
  begin
    Application.messagebox('最顶层不能编辑，请在下层编辑', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  //设置按扭有效性
  button_valid;
  Node_Parent := Node_Child.parent;
  if Node_Parent.level = 0 then
  begin
    aqBMDA.edit;
    aqBMDA.FieldByName('DepCode').editmask := '99;1;_';
    pagecontrol1.ActivePageIndex := 0;
    DBEdt_Bmbm.setfocus;
  end;
  if Node_Parent.level = 1 then
  begin
    aqBMDA.edit;
    aqBMDA.FieldByName('DepCode').editmask := '99-99;1;_';
    pagecontrol1.ActivePageIndex := 0;
    DBEdt_Bmbm.setfocus;
  end;
end;

//删除

procedure TfrmBmda.N_deleteClick(Sender: TObject);
var
  mynode: Ttreenode;
begin
  mynode := Treeview.selected;
  //根目录不须删除
  if mynode.level = 0 then
    exit;
  //如果删除的是第二级目录  
  if mynode.level = 2 then
  begin
    if aqBMDA.recordcount <> 0 then
    begin
      if Application.messagebox('请确认是否要删除,并且子目录也将被删除', '仓库管理系统', mb_iconinformation + mb_yesno) = idyes then
      begin
        aqBMDA.Delete;
        //DM.CDS_BMDA.applyupdates(0);
        Treeview.Items.delete(mynode);
      end;
    end
    else
    begin
      Application.messagebox('已无记录可删除', '仓库管理系统', mb_iconinformation + mb_defbutton1);
      exit;
    end;
    EXIT;
  end;
  //如果删除是第一级目录，还得删除第二级目录
  if mynode.level = 1 then
  begin
    aqBMDA.filter := 'substring(DepCode,1,2)=' + '''' + copy(mynode.text, 2, 2) + '''';
    aqBMDA.filtered := true;
    aqBMDA.first;
    if aqBMDA.recordcount <> 0 then
    begin
      if Application.messagebox('请确认是否要删除,并且子目录也将被删除', '仓库管理系统', mb_iconinformation + mb_yesno) = idyes then
      begin
        while not aqBMDA.eof do
        begin
          aqBMDA.Delete;
        end;
        //DM.CDS_BMDA.applyupdates(0);
        Treeview.Items.delete(mynode);
      end;
    end
    else
    begin
      Application.messagebox('已无记录可删除', '仓库管理系统', mb_iconinformation + mb_defbutton1);
      exit;
    end;
    aqBMDA.filtered := false;
  end;
end;


//恢复
procedure TfrmBmda.N_cancelClick(Sender: TObject);
begin
  aqBMDA.cancel;
  //设置组件的有效性
  button_valid;
end;

//保存
procedure TfrmBmda.N_saveClick(Sender: TObject);
var
  s_bm, s_mc: string;
  query: TADOQuery;
begin
  if Node_Parent.level = 0 then
  begin
    if length(trim(DBEdt_Bmbm.text)) <> 2 then
    begin
      Application.messagebox('编码应为两位', '仓库管理系统', mb_iconinformation + mb_defbutton1);
      exit;
    end;
  end;
  if Node_Parent.level = 1 then
  begin
    if copy(DBEdt_Bmbm.text, 1, 2) <> copy(Node_Parent.text, 2, 2) then
    begin
      Application.messagebox('前面两位不能变，请确认!', '仓库管理系统', mb_iconinformation + mb_defbutton1);
      DBEdt_Bmbm.text := copy(Node_Parent.text, 2, 2);
      exit;
    end;
    if length(trim(DBEdt_Bmbm.text)) <> 5 then
    begin
      Application.messagebox('编码应为五位', '仓库管理系统', mb_iconinformation + mb_defbutton1);
      exit;
    end;
  end;
  s_bm := DBEdt_Bmbm.text;
  s_mc := DBEdt_Bmmc.text;
  //查找重复编号
  //aqBMDA.IndexName := 'DepCode';
  //aqBMDA.Refresh;
  if aqBMDA.state =  dsinsert then
  begin
      query := TADOquery.Create(self);
      query.Connection:= dmWarehouse.ACWarehouse;
      query.SQL.Text := 'select * from BMDA where DepCode="' + s_bm + '"' ;
      query.open;
      if not query.Eof then
      begin
        MessageBox(handle, '此部门编码已存在!', '提示', mb_IconInformation + mb_Ok);
        aqBMDA.Cancel;
        pagecontrol1.ActivePageIndex := 0;
        DBEdt_Bmbm.SetFocus;
        exit;
      end
  end;
  //判断是添加数据的保存还是编辑数据保存
  if b_pd = true then
    Treeview.items.addchild(Node_Parent, '(' + s_bm + ') ' + s_mc)
  else
    Node_Child.Text := '(' + s_bm + ') ' + s_mc;
  aqBMDA.post;
  //aqBMDA.applyupdates(0);
  //aqBMDA.Refresh;
  //设置按扭的有效性
  button_valid;
end;

//刷新
procedure TfrmBmda.N_refreshClick(Sender: TObject);
begin
  refreshTree;
  Treeview.TopItem.selected := true;
end;

//TreeViewClick根据部门编码来定位数据集，从而实现数据的联动
procedure TfrmBmda.TreeViewClick(Sender: TObject);
var
  mynode: Ttreenode;
  s_value_1: string;
begin
  if Treeview.Items.Count = 0 then
    exit;
  mynode := Treeview.selected;
  //如果是在目录树的第一级，代表是第一级部门，它的部门编码只有两位
  if mynode.Level = 1 then
  begin
    //从目录树的节点标题中，提取部门编码
    s_value_1 := copy(mynode.text, 2, 2);
    //aqBMDA.IndexName := 'DepCode ';
   // aqBMDA.findkey([s_value_1]);
    aqBMDA.FieldByName('DepCode').editmask := '99;1;_';
  end;
 //如果是在目录树的第二级，代表是第二级部门，它的部门编码有五位
  if mynode.Level = 2 then
  begin
    //从目录树的节点标题中，提取部门编码
    s_value_1 := copy(mynode.text, 2, 5);
    //aqBMDA.IndexName := 'DepCode ';
    //aqBMDA.FindKey([s_value_1]);
    aqBMDA.FieldByName('DepCode').editmask := '99-999;1;_';
  end;
end;

procedure TfrmBmda.N_OrderClick(Sender: TObject);
begin
 
end;

//打印
procedure TfrmBmda.DBGridTitleClick(Column: TColumn);
begin
  //调用u_public单元的DBGridSort按表格的列字段排序
  DBGridSort(dbgrid, column);
end;

procedure TfrmBmda.btnCancelClick(Sender: TObject);
begin
  close;
end;

end.


unit gdstype;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fcCombo, fctreecombo, Grids, Wwdbigrd, Wwdbgrid, wwSpeedButton,
  wwDBNavigator, ExtCtrls, wwclearpanel, ComCtrls, Buttons,
  fcdbtreeview, TFlatPanelUnit, ImgList, fcTreeView, TFlatButtonUnit, jpeg,
  Menus, Db, DBTables, Wwquery, Variants, RegControls, ADODB;

type
  TfrmType = class(TForm)
    FlatPanel1: TFlatPanel;
    TreeView1: TfcTreeView;
    stateImage: TImageList;
    Panel1: TPanel;
    btnNew: TFlatButton;
    bntModify: TFlatButton;
    btnDelete: TFlatButton;
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    RegForm1: TRegForm;
    procedure FormShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure bntModifyClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure TreeView1Editing(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode; var AllowEdit: Boolean);
    procedure TreeView1Edited(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode; var S: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure LoadTree();
    function NextID(current: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

const selectedindex = 1;
  unselectedinex = 0;
var
  frmType: TfrmType;

implementation

uses data;

{$R *.DFM}


procedure TfrmType.LoadTree();
var Level: integer;
  preNode: TfcTreeNode;
  CurNode: TfcTreeNode;
  tmpstr: string;
begin
  Treeview1.Items.BeginUpdate;
  Treeview1.Items.Clear;
  prenode := treeview1.items.add(nil, '商品种类 ');
  prenode.StringData := 'all';
  prenode.ImageIndex := 0; //
  prenode.Selectedindex := 1; //
  dm.tabtype.First;
  with dm.tabtype do
    with TreeView1 do
      while not eof do
        begin
          level := length(trim(fieldbyname('typeid').asstring)) div 4;
          tmpstr := fieldbyname('typeName').asstring + '  ';
          if preNode.level = level then
            CurNode := items.addchild(prenode.parent, tmpstr);
          if level < preNode.level then
            CurNode := items.addchild(treeview1.items[0], tmpstr);
          if level > preNode.level then
            CurNode := items.addchild(prenode, tmpstr);
          CurNode.ImageIndex := 2;
          curNode.SelectedIndex := 3;
          curNode.StringData := trim(fieldbyname('typeid').asstring);
          next;
          preNode := CurNode;
        end;
  Treeview1.Items.EndUpdate;
end;

procedure TfrmType.FormShow(Sender: TObject);
begin
  if not dm.tabtype.active then dm.tabtype.open;
  Dm.tabType.First;
  LoadTree();
end;

//功能，长字符+1

function plusone(tmp: string): string;
var sb, st: string;
begin
  sb := copy(tmp, 0, length(tmp) - 4);
  st := copy(tmp, length(tmp) - 4 + 1, 4);
  if sb = '9999' then result := '-1'
  else result := sb + format('%4.4d', [strtoint(st) + 1]);
end;

//功能：输入当然的ID，产生出它所属的下一层的下一个编号,第一层的ID产生，要把current=''即可

function TfrmType.NextID(current: string): string;
var tmpSql: TADOQuery;
  tmpbegin: string;
  tmpEnd: string;
begin
  tmpSql := TadoQuery.create(self);
  tmpSql.connection := dm.db;
  if trim(current) = 'all' then //首层取TABLE最后的记录即可。 加入第一层
    with tmpsql do
      begin
        close;
        sql.clear;
        //开始用select Max(typeid) as tmpmax FROM gdsType
        //当然数据库是空时就会出错的。因
        sql.Add('select Max(typeid) as tmpmax FROM gdsType'); //始终只会返回一条记录。所以下面没有recordcount就没有了。
        open;
        if length(trim(fieldbyname('tmpmax').asstring)) < 1 then //if use isempty , error , i don't know why ???? 数据库为空时，他搞不点
          result := '0001'
        else
          begin
            last;
            result := plusone(copy(fieldbyname('tmpmax').asstring, 0, 4));
          end;
      end

  else //不是首结点的话，
    begin
      tmpbegin := trim(current);
      tmpend := plusone(tmpbegin);
      if tmpend = '-1' then raise exception.Create('本层最大编号已到最大9999了 :(');
      with tmpSql do
        begin
          close;
          sql.clear;
          sql.Add('SELECT  MAX( typeID ) as tmpmax');
          sql.add('FROM gdsType');
          sql.add('WHERE (typeID > :tmpbegin)'); //attion : 不能用等于，or .结果不对的。
          sql.add('AND  (typeID < :tmpend)'); //这也一样，试了很久才知。：（
          Parameters.parambyname('tmpbegin').value := tmpbegin;
          Parameters.parambyname('tmpend').value := tmpend;
          open;
          if trim(fieldbyname('tmpmax').asstring) = '' then //00-9-20 这里也和上面同样错误用，因select max 一定会返回1条记录
            //所以用if recordcount = 0 then 不对更换后可以了

            result := tmpbegin + '0001'
          else
            result := plusone(fieldbyname('tmpmax').asstring);
        end;
    end; //end of else
  tmpsql.Free; //释放空间
  tmpsql := nil;
end;


procedure TfrmType.btnNewClick(Sender: TObject);
var myNode: TfcTreeNode;
  tmpnextid: string;
begin
  if treeview1.selected.level >= 5 then
    begin
      showmessage('最多只能五层! *_*');
      exit;
    end;
  if Treeview1.Selected.Level < 1 then //在首结点建立
    begin
      myNode := Treeview1.items.GetFirstNode;
      tmpnextid := NextID('all');
    end
  else //not create at the firs node
    begin
      MyNode := treeview1.Selected;
      tmpNextId := nextid(mynode.StringData);
    end;
  myNode := Treeview1.items.addChild(myNode, '新建');
  myNode.StringData := tmpNextId;
  mynode.ImageIndex := 2;
  mynode.SelectedIndex := 3;
  treeview1.Selected := mynode;
  with dm.tabType do
    begin
      append;
      fieldbyname('TypeId').asstring := tmpNextID;
      fieldbyname('TypeName').asstring := mynode.Text;
      post;
    end;
  myNode.EditText;
end;

procedure TfrmType.bntModifyClick(Sender: TObject);
begin
  if treeview1.Selected.StringData <> null then
    treeview1.Selected.EditText;
end;

procedure TfrmType.btnDeleteClick(Sender: TObject);
var tmpSQL: TADOQuery;
  isall: boolean;
  tmpbegin: string;
  tmpend: string;
begin
  if Application.MessageBox('你真的要删除这种及下属的商品类吗', '真的吗？',
    MB_YESNO + MB_ICONINFORMATION + MB_DEFBUTTON2) <> IDYes
    then exit;
  tmpSQL := TADOQuery.create(self);
  tmpSql.connection := dm.db;
  isall := (treeview1.selected.level = 0);
  if isAll then // 选择根，全部删除。！
    begin
      tmpbegin := '0000';
      tmpend := '9999';
    end //删除结点及下面结点。
  else
    begin
      tmpbegin := treeview1.selected.StringData;
      tmpend := plusone(tmpbegin);
    end;
  with tmpsql do
    begin
      close;
      sql.clear;
      sql.Add('delete FROM gdsType');
      sql.add('where (typeid >= :tmpbegin)');
      sql.add('and (typeid <:tmpend)');
      Parameters.parambyname('tmpbegin').value := tmpbegin;
      Parameters.parambyname('tmpend').value := tmpend;
      execsql;
      treeview1.items.BeginUpdate;
      treeview1.selected.Delete;
      if isALL then
        begin
          treeview1.Items.Add(nil, '商品种类');
          treeview1.TopItem.ImageIndex := 0;
          treeview1.TopItem.Selectedindex := 1;
        end;
      treeview1.Items.EndUpdate;
    end;
  tmpSQl.free;
  tmpsql := nil;
end;

procedure TfrmType.TreeView1Editing(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode; var AllowEdit: Boolean);
begin
  if node.Level = 0 then
    begin
      showmessage('这不可更改的! @_@');
      allowedit := false;
    end;
end;

procedure TfrmType.TreeView1Edited(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode; var S: string);
begin
  with dm.tabtype do
    begin
      locate('typeid', node.StringData, []);
      edit;
      fieldbyname('typename').asstring := S;
      post;
    end;
end;

procedure TfrmType.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

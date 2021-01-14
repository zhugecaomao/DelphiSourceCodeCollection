unit U_fzlr_zgxm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBClient, Menus, ImgList, ComCtrls, Buttons, Grids, DBGrids,
  ADODB;

type
  TfrmZgda_fzlr = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PopupMenu2: TPopupMenu;
    Panel3: TPanel;
    btnOK: TSpeedButton;
    btnCancel: TSpeedButton;
    dsZG: TDataSource;
    DBGrid: TDBGrid;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Panel4: TPanel;
    TreeView: TTreeView;
    ImageList1: TImageList;
    aqZG: TADOQuery;
    dsBMDA: TDataSource;
    aqBMDA: TADOQuery;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeViewClick(Sender: TObject);
  private
  procedure refreshTree;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmZgda_fzlr: TfrmZgda_fzlr;
  pub_zgxm: string;
implementation

uses  uPublic ,uDB;

{$R *.DFM}

procedure TfrmZgda_fzlr.refreshTree;
var
  mynode_1, mynode_2, mynode_3: Ttreenode;
  s_bm_1, s_bm_2, s_bm_3: string;
  s_mc_1, s_mc_2, s_mc_3: string;
begin
  aqBMDA.Active := True;
  treeview.Items.clear;
  mynode_1 := Treeview.Items.Add(Treeview.topitem, '部门档案');
  mynode_1.imageindex := 0;
  mynode_1.stateindex := -1;
  mynode_1.selectedindex := 1;

//  aqBMDA.SQL.Text :='select * from BMDA order by 部门编码';
//  aqBMDA.Open;
  //aqBMDA.indexname := '部门编码';
  //aqBMDA.First;
  while not aqBMDA.Eof do
  begin
    s_bm_1 := aqBMDA.fieldbyname('DepCode').asstring;
    s_mc_1 := aqBMDA.fieldbyname('DepName').asstring;
    if length(trim(s_bm_1)) = 2 then
    begin
      mynode_2 := Treeview.items.addchild(mynode_1, '(' + s_bm_1 + ') ' + s_mc_1);
      mynode_2.imageindex := 0;
      mynode_2.stateindex := -1;
      mynode_2.selectedindex := 1;
    end;
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

procedure TfrmZgda_fzlr.TreeViewClick(Sender: TObject);
var
  mynode: Ttreenode;
  s_value_1, s_value_2, s_value_3, s_value_4: string;
begin
  if Treeview.Items.Count = 0 then
    exit;
  mynode := Treeview.selected;
  case mynode.Level of
    0:
      begin
        aqZG.Filter := '';
      end;
    1: begin
        s_value_1 := copy(mynode.text, 2, 2);
        aqZG.Filter := 'DepCode=' + '''' + s_value_1 + '''';

      end;
    2: begin
        s_value_1 := copy(mynode.text, 2, 6);
        aqZG.Filter := 'DepCode=' + '''' + s_value_1 + '''';
      end;
  end;
  aqZG.Filtered := True;
end;


procedure TfrmZgda_fzlr.btnOKClick(Sender: TObject);
begin
  //判断是否选择具体职工
  if aqZG.recordcount = 0 then
  begin
    application.messagebox('请选择具体职工', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  //将职工姓名传递给全局变量pub_zgxm
  pub_zgxm := aqZG.fieldbyname('EmpName').asstring;
  close;
end;

procedure TfrmZgda_fzlr.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmZgda_fzlr.N2Click(Sender: TObject);
begin
  aqZG.indexname := 'EmpID';
end;

procedure TfrmZgda_fzlr.N1Click(Sender: TObject);
begin
  aqZG.indexname := 'EmpName';
end;

procedure TfrmZgda_fzlr.N3Click(Sender: TObject);
begin
  aqZG.indexname := 'DepCode';
end;

procedure TfrmZgda_fzlr.N4Click(Sender: TObject);
begin
  aqZG.indexname := 'Sex';
end;

procedure TfrmZgda_fzlr.N5Click(Sender: TObject);
begin
  aqZG.indexname := 'BirthDate';
end;

procedure TfrmZgda_fzlr.N6Click(Sender: TObject);
begin
  aqZG.indexname := 'Politics';
end;

procedure TfrmZgda_fzlr.N7Click(Sender: TObject);
begin
  aqZG.indexname := 'Level';
end;

procedure TfrmZgda_fzlr.N8Click(Sender: TObject);
begin
  aqZG.indexname := 'Caption';
end;

procedure TfrmZgda_fzlr.N9Click(Sender: TObject);
begin
  aqZG.indexname := 'EmpAttr';
end;

procedure TfrmZgda_fzlr.DBGridTitleClick(Column: TColumn);
begin
  DBGridSort(dbgrid, column);
end;

procedure TfrmZgda_fzlr.DBGridDblClick(Sender: TObject);
begin
  BtnOK.Click;
end;

procedure TfrmZgda_fzlr.FormCreate(Sender: TObject);
begin
  aqZG.Active := True;
  RefreshTree;
end;


end.


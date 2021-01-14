unit inPriceHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TFlatPanelUnit, TFlatSplitterUnit, fcTreeView, Grids, DBGrids,
  ComCtrls, Db, Wwdatsrc, DBTables, Wwtable, Wwdbigrd, Wwdbgrid, common,
  Wwquery, Buttons, TFlatRadioButtonUnit, TFlatGroupBoxUnit, StdCtrls,
  TFlatEditUnit, TFlatButtonUnit, KvLabel, RegControls, ImgList, ADODB;

type
  TfrmInPriceHist = class(TForm)
    TreeView1: TfcTreeView;
    FlatSplitter1: TFlatSplitter;
    FlatPanel1: TFlatPanel;
    Notebook1: TNotebook;
    FlatSplitter2: TFlatSplitter;
    ListView1: TListView;
    wwDBGrid2: TwwDBGrid;
    Panel1: TPanel;
    edSearch: TFlatEdit;
    Label9: TLabel;
    gbSearchType: TFlatGroupBox;
    rbShort: TFlatRadioButton;
    rbName: TFlatRadioButton;
    btnSearch: TFlatButton;
    KvLabel10: TKvLabel;
    labSelectedCount: TKvLabel;
    RegForm1: TRegForm;
    ImageList1: TImageList;
    qryFilter: TADOQuery;
    dsFilter: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Change(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
    procedure btnSearchClick(Sender: TObject);
    procedure rbShortKeyPress(Sender: TObject; var Key: Char);
    procedure edSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure LoadTree();
    procedure UpdateGoodsList(Node: TfcTreeNode);
    { Private declarations }
  public
    { Public declarations }
  end;

const divsign = '''';
var
  frmInPriceHist: TfrmInPriceHist;

implementation

uses data;

{$R *.DFM}


procedure TfrmInPriceHist.LoadTree();
var Level: integer;
  preNode: TfcTreeNode;
  CurNode: TfcTreeNode;
begin
  TreeView1.Items.BeginUpdate;
  prenode := Treeview1.items.add(nil, '所有供应商 ');
  prenode.StringData := 'all';
  prenode.ImageIndex := 0; //
  prenode.Selectedindex := 1; //
  if not dm.tabSupp.active then dm.tabSupp.open;
  dm.tabSupp.first;
  dm.tabSupp.disablecontrols;
  with dm.tabSupp do
    with TreeView1 do
      while not eof do
        begin
          CurNode := items.addchild(Treeview1.items[0], fieldbyname('SuppName').asstring + '  ');
          CurNode.ImageIndex := 2;
          curNode.SelectedIndex := 3;
          curNode.StringData := trim(fieldbyname('SuppID').asstring);
          next;
          preNode := CurNode;
        end;
  dm.tabSupp.enablecontrols;
  Treeview1.Items.EndUpdate;
end;

procedure TfrmInPriceHist.FormCreate(Sender: TObject);
var NewColumn: TListColumn;
begin
  LoadTree;
end;

procedure TfrmInPriceHist.UpdateGoodsList(Node: TfcTreeNode);
var ListItem: TListItem;
begin
  with qryFilter do
    begin
      close;
      sql.clear;
      sql.add('SELECT inPriceHistory.gdsID, Goods.GdsName,Goods.Unit,inPriceHistory.price,inPriceHistory.SuppID,supplier.SuppName');
      sql.add('FROM inPriceHistory inPriceHistory, supplier supplier, Goods Goods');
      sql.add('WHERE  (supplier.SuppID = inPriceHistory.SuppID)');
      sql.add('AND (inPriceHistory.gdsID = Goods.GdsID)');
      if Node.StringData <> 'all' then
        sql.add(format('and (inPriceHistory.SuppID = ''%s'')', [node.StringData]));
      sql.add('order by inPriceHistory.gdsid');
      open;
      fieldbyname('gdsid').displayLabel := '商品编号';
      fieldbyname('gdsid').displaywidth := 8;
      fieldbyname('gdsName').displayLabel := '商品名称';
      fieldbyname('gdsName').displaywidth := 20;
      fieldbyname('unit').displayLabel := '单位';
      fieldbyname('SuppName').displayLabel := '供应商名称';
      fieldbyname('price').displayLabel := '价格';
      fieldbyname('SuppID').visible := false;
    end;
end;


procedure TfrmInPriceHist.TreeView1Change(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode);
begin
  UpdateGoodsList(Node);
end;

procedure TfrmInPriceHist.btnSearchClick(Sender: TObject);
begin
  if trim(edSearch.text) <> '' then
    with qryFilter do
      begin
        close;
        sql.clear;
        sql.add('SELECT inPriceHistory.gdsID, Goods.GdsName,Goods.Unit,inPriceHistory.price,inPriceHistory.SuppID,supplier.SuppName');
        sql.add('FROM inPriceHistory inPriceHistory, supplier supplier, Goods Goods');
        sql.add('WHERE  (supplier.SuppID = inPriceHistory.SuppID)');
        sql.add('AND (inPriceHistory.gdsID = Goods.GdsID)');
        if TreeView1.Selected.StringData <> 'all' then
          sql.add('and (inPriceHistory.SuppID = :SuppID)');
        if rbShort.Enabled then
          sql.add('and (inPriceHistory.gdsid like ''%' + trim(edSearch.text) + '%''')
        else
          sql.add('and (Goods.gdsname like like ''%' + trim(edSearch.text) + '%''');
        sql.add('order by inPriceHistory.gdsid');
        if TreeView1.Selected.StringData <> 'all' then
          Parameters.ParamByName('SuppID').value := TreeView1.Selected.StringData;
        open;
        fieldbyname('gdsid').displayLabel := '商品编号';
        fieldbyname('gdsid').displaywidth := 8;
        fieldbyname('gdsName').displayLabel := '商品名称';
        fieldbyname('gdsName').displaywidth := 20;
        fieldbyname('unit').displayLabel := '单位';
        fieldbyname('SuppName').displayLabel := '供应商名称';
        fieldbyname('price').displayLabel := '价格';
        fieldbyname('SuppID').visible := false;
      end;
end;

procedure TfrmInPriceHist.rbShortKeyPress(Sender: TObject; var Key: Char);
begin
  btnSearchClick(Sender);
end;

procedure TfrmInPriceHist.edSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      key := word(#0);
      btnSearchClick(Sender);
    end;
end;

procedure TfrmInPriceHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

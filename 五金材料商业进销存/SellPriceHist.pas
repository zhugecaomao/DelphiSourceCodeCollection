unit sellPriceHist;

//功是执行后，在tabGoods上的selected上勾记所选
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TFlatPanelUnit, TFlatSplitterUnit, fcTreeView, Grids, DBGrids,
  ComCtrls, Db, Wwdatsrc, DBTables, Wwtable, Wwdbigrd, Wwdbgrid, common,
  Wwquery, Buttons, TFlatRadioButtonUnit, TFlatGroupBoxUnit, StdCtrls,
  TFlatEditUnit, TFlatButtonUnit, KvLabel, RegControls, ImgList, ADODB;

type
  TfrmSellPriceHist = class(TForm)
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

var
  frmSellPriceHist: TfrmSellPriceHist;

implementation

uses data;

{$R *.DFM}


procedure TfrmSellPriceHist.LoadTree();
var Level: integer;
  preNode: TfcTreeNode;
  CurNode: TfcTreeNode;
begin
  TreeView1.Items.BeginUpdate;
  prenode := Treeview1.items.add(nil, '全部顾客 ');
  prenode.StringData := 'all';
  prenode.ImageIndex := 0; //
  prenode.Selectedindex := 1; //
  if not dm.tabcust.active then dm.tabcust.open;
  dm.tabcust.first;
  dm.tabcust.disablecontrols;
  with dm.tabcust do
    with TreeView1 do
      while not eof do
        begin
          CurNode := items.addchild(Treeview1.items[0], fieldbyname('custname').asstring + '  ');
          CurNode.ImageIndex := 2;
          curNode.SelectedIndex := 3;
          curNode.StringData := fieldbyname('custid').asstring;
          next;
          preNode := CurNode;
        end;
  dm.tabcust.enablecontrols;
  Treeview1.Items.EndUpdate;
end;



procedure TfrmSellPriceHist.FormCreate(Sender: TObject);
var NewColumn: TListColumn;
begin
  LoadTree;
end;

procedure TfrmSellPriceHist.UpdateGoodsList(Node: TfcTreeNode);
var ListItem: TListItem;
begin
  with qryFilter do
    begin
      close;
      sql.clear;
      sql.add('SELECT Outpricehistory.gdsID, Goods.GdsName,Goods.Unit,Outpricehistory.price, Outpricehistory.bigprice,Outpricehistory.custid,Customer.CustName');
      sql.add('FROM outPriceHistory Outpricehistory, Customer Customer, Goods Goods');
      sql.add('WHERE  (Customer.CustID = Outpricehistory.custid)');
      sql.add('AND (Outpricehistory.gdsID = Goods.GdsID)');

      if Node.StringData <> 'all' then
        sql.add(format('and (Outpricehistory.custid = ''%s'')', [node.StringData]));
      sql.add('order by Outpricehistory.gdsid');
      open;


      fieldbyname('gdsid').displayLabel := '商品编号';
      fieldbyname('gdsid').displaywidth := 8;
      fieldbyname('gdsName').displayLabel := '商品名称';
      fieldbyname('gdsName').displaywidth := 20;
      fieldbyname('unit').displayLabel := '单位';
      fieldbyname('CustName').displayLabel := '客户名称';
      fieldbyname('price').displayLabel := '价格';
      fieldbyname('bigprice').displayLabel := '开大价';
      fieldbyname('custid').visible := false;
    end;
end;


procedure TfrmSellPriceHist.TreeView1Change(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode);
begin
  UpdateGoodsList(Node);
end;

procedure TfrmSellPriceHist.btnSearchClick(Sender: TObject);
begin
  if trim(edSearch.text) <> '' then
    with qryFilter do
      begin
        close;
        sql.clear;
        sql.add('SELECT Outpricehistory.gdsID, Goods.GdsName,Goods.Unit,Outpricehistory.price, Outpricehistory.bigprice,Outpricehistory.custid,Customer.CustName');
        sql.add('FROM outPriceHistory Outpricehistory, Customer Customer, Goods Goods');
        sql.add('WHERE  (Customer.CustID = Outpricehistory.custid)');
        sql.add('AND (Outpricehistory.gdsID = Goods.GdsID)');
        if TreeView1.Selected.StringData <> 'all' then
          sql.add('and (Outpricehistory.custid = :Custid)');
        if rbShort.Enabled then
          sql.add('and (Outpricehistory.gdsid likelike ''%' + trim(edSearch.text) + '%''')
        else
          sql.add('and (Goods.gdsname like like ''%' + trim(edSearch.text) + '%''');
        sql.add('order by Outpricehistory.gdsid');
        if TreeView1.Selected.StringData <> 'all' then
          Parameters.ParamByName('custid').value := TreeView1.Selected.StringData;
        open;
        fieldbyname('gdsid').displayLabel := '商品编号';
        fieldbyname('gdsid').displaywidth := 8;
        fieldbyname('gdsName').displayLabel := '商品名称';
        fieldbyname('gdsName').displaywidth := 20;
        fieldbyname('unit').displayLabel := '单位';
        fieldbyname('CustName').displayLabel := '客户名称';
        fieldbyname('price').displayLabel := '价格';
        fieldbyname('bigprice').displayLabel := '开大价';
        fieldbyname('custid').visible := false;
      end;
end;

procedure TfrmSellPriceHist.rbShortKeyPress(Sender: TObject; var Key: Char);
begin
  btnSearchClick(Sender);
end;

procedure TfrmSellPriceHist.edSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      key := word(#0);
      btnSearchClick(Sender);
    end;
end;

procedure TfrmSellPriceHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

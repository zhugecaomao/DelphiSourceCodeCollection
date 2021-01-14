unit SheetBrow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, fcTreeView, ExtCtrls, StdCtrls, TFlatComboBoxUnit,
  TB2Item, KvLabel, TB2Dock, TB2Toolbar, Grids, Wwdbigrd, Wwdbgrid,
  TFlatSplitterUnit, DB, Wwdatsrc, ADODB, wwdblook, TFlatPanelUnit,
  TFlatButtonUnit;

type
  TfrmQrySheet = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    Panel1: TPanel;
    treeview1: TfcTreeView;
    ImageList1: TImageList;
    FlatSplitter1: TFlatSplitter;
    qrySheet: TADOQuery;
    dsQrysheet: TwwDataSource;
    Notebook1: TNotebook;
    Panel2: TPanel;
    panCust: TFlatPanel;
    labList: TKvLabel;
    cbCust: TwwDBLookupCombo;
    dbgCust: TwwDBGrid;
    panSupp: TFlatPanel;
    cbSupp: TwwDBLookupCombo;
    KvLabel1: TKvLabel;
    dbgBuy: TwwDBGrid;
    FlatButton1: TFlatButton;
    qryBuy: TADOQuery;
    dsQryBuy: TwwDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure treeview1Change(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
    procedure cbCustChange(Sender: TObject);
    procedure dbgBuyDblClick(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure dbgCustDblClick(Sender: TObject);
  private
    function getid(const s: string; gt: integer): string;
    procedure SaleList; //选择的是销售单处理
    procedure buyList; //选择的是进货单查询
    procedure UpdateList();

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQrySheet: TfrmQrySheet;

implementation

uses data, common, buy, sale;

{$R *.dfm}

function TfrmQrySheet.getid(const s: string; gt: integer): string; //0 : 顾客
var str: string; //1: 供应商
begin
  str := trim(s);
  if str = '' then result := '' //不选是，是指所有客户 供应商
  else
    begin
      if gt = 0 then
        result := cbCust.LookupValue
      else result := cbsupp.LookupValue;
    end;
end;

procedure TfrmQrySheet.SaleList; //选择的是销售单处理
var custid: string;
begin
  notebook1.ActivePage := 'sale';
  custid := getid(cbCust.text, 0);
  with qrySheet do
    begin
      close;
      sql.clear;
      sql.add('SELECT A.SheetID,A.Amo-A.PayAmo AS leftamo,  A.PayAmo,A.Amo,B.CustName,A.status,A.IsBack');
      sql.add('FROM Outsheet A, Customer B  ');
      Sql.add('WHERE  (A.CustID = B.CustID)');
      if custid <> '' then //不是显示所有客户
        sql.add('and (A.custid = :custid)');

      case treeview1.Selected.SelectedIndex of
        6: sql.add('and (A.status  = 0)'); // '销售草稿'
        7: //'销售付款中':
          begin
            sql.add('and (A.status  = 1)');
            sql.add('and (A.amo <> A.payamo)');
          end;
        8: //'销售结算完':
          begin
            sql.add('and (A.status  = 1)');
            sql.add('and (A.amo = A.payamo)');
          end;
      end; //end of case

      sql.add('order by a.sheetid');

      if custid <> '' then
        Parameters.parambyname('custid').value := custid;
      open;
      fieldbyname('sheetid').displayLabel := '单据号';
      fieldbyname('sheetid').displaywidth := 12;
      fieldbyname('leftamo').displayLabel := '佘额';
      fieldbyname('leftamo').displaywidth := 10;

      fieldbyname('amo').displayLabel := '总额';
      fieldbyname('amo').displaywidth := 10;
      fieldbyname('payamo').displayLabel := '已付金额';
      fieldbyname('payamo').displaywidth := 10;
      fieldbyname('CustName').displayLabel := '客户名称';
      fieldbyname('custname').displaywidth := 20;
      fieldbyname('status').displayLabel := '状态';
      fieldbyname('isback').displayLabel := '退货否';

    end; //end of with
end;

procedure TfrmQrySheet.buyList; //选择的是进货单查询
var suppid: string;
begin
  notebook1.ActivePage := 'buy';
  suppid := getid(cbsupp.text, 1);
  with qryBuy do
    begin
      close;
      sql.clear;
      sql.add('SELECT A.SheetID,A.Amo-A.PayAmo AS leftamo,A.PayAmo, A.Amo, B.suppName,A.status,A.IsBack');
      sql.add('FROM Insheet A, supplier B  ');
      Sql.add('WHERE  (A.suppid = B.suppID)');
      if suppid <> '' then //不是显示所有客户
        sql.add('and (A.suppid = :suppid)');

      case treeview1.Selected.SelectedIndex of
        11: sql.add('and (A.status  = 0)'); // '销售草稿'
        12: //'销售付款中':
          begin
            sql.add('and (A.status  = 1)');
            sql.add('and (A.amo <> A.payamo)');
          end;
        13: //'销售结算完':
          begin
            sql.add('and (A.status  = 1)');
            sql.add('and (A.amo = A.payamo)');
          end;
      end; //end of case

      sql.add('order by a.sheetid');

      if suppid <> '' then
        Parameters.parambyname('suppid').value := suppid;

      open;
      fieldbyname('sheetid').displayLabel := '单据号';
      fieldbyname('sheetid').displaywidth := 12;
      fieldbyname('leftamo').displayLabel := '佘额';
      fieldbyname('leftamo').displaywidth := 10;

      fieldbyname('amo').displayLabel := '总额';
      fieldbyname('amo').displaywidth := 10;
      fieldbyname('payamo').displayLabel := '已付金额';
      fieldbyname('payamo').displaywidth := 10;
      fieldbyname('suppname').displayLabel := '供应商';
      fieldbyname('suppname').displaywidth := 20;
      fieldbyname('status').displayLabel := '状态';
      fieldbyname('isback').displayLabel := '退货否';

    end; //end of with
end;

procedure TfrmQrySheet.UpdateList();
var i: integer;
begin
  i := treeview1.Selected.SelectedIndex;
  case i of
    5..8: SaleList;
    10..13: BuyList;
  else
    begin
      qrySheet.Close; qryBuy.Close; notebook1.ActivePage := 'sale'; end;
  end;
end;

procedure TfrmQrySheet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmQrySheet.treeview1Change(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode);
begin
  UpdateList();
end;

procedure TfrmQrySheet.cbCustChange(Sender: TObject);
begin
  UpdateList();
end;

procedure TfrmQrySheet.dbgBuyDblClick(Sender: TObject);
begin
  if dm.tabIn.State in [dsInsert, dsedit] then
    begin
      MessageDlg('当前有入货单记录末保存，请先保存重新操作！', mtWarning, [mbOK], 0);
      OpenForm(Tfrmbuy, frmbuy, self);
    end
  else
    begin
      dm.tabIn.Locate('sheetid', qryBuy.fieldbyname('sheetid').value, []);
      OpenForm(Tfrmbuy, frmbuy, self);
    end;
end;

procedure TfrmQrySheet.FlatButton1Click(Sender: TObject);
var i: integer;
begin
  with dbgCust, dbgCust.datasource.dataset do
    begin
      disablecontrols;
      for i := 0 to SelectedList.count - 1 do
        begin
          gotobookmark(selectedlist.items[i]);
          freebookmark(selectedlist.items[i]);
          showmessage(fieldbyname('custname').asstring);
        end;
      enablecontrols;
    end;
end;

procedure TfrmQrySheet.dbgCustDblClick(Sender: TObject);
begin
  if dm.tabIn.State in [dsInsert, dsedit] then
    begin
      MessageDlg('当前有出货单记录末保存，请先保存重新操作！', mtWarning, [mbOK], 0);
      OpenForm(Tfrmsale, frmsale, self);
    end
  else
    begin
      dm.tabout.Locate('sheetid', qryBuy.fieldbyname('sheetid').value, []);
      OpenForm(Tfrmsale, frmsale, self);
    end;
end;

end.


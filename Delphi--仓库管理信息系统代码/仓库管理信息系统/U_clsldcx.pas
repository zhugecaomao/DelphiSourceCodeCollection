unit U_clsldcx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Grids, DBGrids, Db, DBClient, ImgList, ToolWin;

type
  TfrmClsld_CX = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    DBGrid: TDBGrid;
    Panel3: TPanel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    btnLookUp: TToolButton;
    btnBrowseAll: TToolButton;
    btnOrder: TToolButton;
    btnPrint: TToolButton;
    DataSource: TDataSource;
    procedure btnBrowseAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLookUpClick(Sender: TObject);
    procedure btnOrderClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClsld_CX: TfrmClsld_CX;

implementation

uses U_mainform, U_szcx, U_general_print, WzglDB, GenQ3, u_public;

{$R *.DFM}

//==全部浏览按钮实现

procedure TfrmClsld_CX.btnBrowseAllClick(Sender: TObject);
begin
  //将过滤条件置为空
  DM.CDS_CLSLD_CX.close;
  DM.CDS_CLSLD_CX.filter := '';
  DM.CDS_CLSLD_CX.filtered := false;
  DM.CDS_CLSLD_CX.open;
end;

//==当窗体被关闭时

procedure TfrmClsld_CX.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  frmClsld_cx := nil; //将frmClsld_cx置为NIl。
end;

//==查找按钮的实现，在此调用第七节，创建的TGenQ3控件
procedure TfrmClsld_CX.btnLookUpClick(Sender: TObject);
var
  GenQuery: TGenQ3;
begin
  GenQuery := TGenQ3.Create(self);
  GenQuery.v_TableName := 'WZ_View_CLSLD_CX'; //设置表名
  GenQuery.v_AppServName := frmMain.SocketConnection; //设置应用服务器连接
  GenQuery.v_ProviderName := 'P_General'; //设置获取数据集的提供者
  //==添加定位字段，“；”前表示实际字段名，‘；’后表示实际字段的别名
  GenQuery.v_fieldsstrings.Add('收料字号;收料字号');
  GenQuery.v_fieldsstrings.Add('仓库名称;仓库名称');
  GenQuery.v_fieldsstrings.Add('制单日期;制单日期');
  GenQuery.v_fieldsstrings.Add('材料编号;材料编号');
  GenQuery.v_fieldsstrings.Add('材料名称;材料名称');
  GenQuery.v_fieldsstrings.Add('存放位置;存放位置');
  GenQuery.v_fieldsstrings.Add('入库单价;入库单价');
  GenQuery.v_fieldsstrings.Add('凭证数量;凭证数量');
  GenQuery.v_fieldsstrings.Add('实收数量;实收数量');
  GenQuery.v_fieldsstrings.Add('供应厂家;供应厂家');
  GenQuery.v_fieldsstrings.Add('采购人;采购人');
  GenQuery.v_fieldsstrings.Add('是否审核;是否审核');
  //打开窗口
  if GenQuery.execute then
  begin
    //给CDS_CLSLD_CX的过滤条件赋值
    DM.CDS_CLSLD_CX.filter := GenQuery.V_filtervalue;
    DM.CDS_CLSLD_CX.filtered := true;
  end;
end;

//==排序按钮的实现

procedure TfrmClsld_CX.btnOrderClick(Sender: TObject);
var
  vs_value: string;
  vi, i: integer;
begin
  //创建通用的排序的窗口
  application.createform(TfrmSzcx, frmSzcx);
  //添加排序的字段
  frmSzcx.SrcList.Items.add('收料字号');
  frmSzcx.srclist.items.add('仓库名称');
  frmSzcx.srclist.items.add('制单日期');
  frmSzcx.srclist.items.add('材料编号');
  frmSzcx.srclist.items.add('存放位置');
  frmSzcx.srclist.items.add('入库单价');
  frmSzcx.srclist.items.add('凭证数量');
  frmSzcx.srclist.items.add('实收数量');
  frmSzcx.srclist.items.add('材料名称');
  frmSzcx.srclist.items.add('供应厂家');
  frmSzcx.srclist.items.add('采购人');
  try
    frmSzcx.showmodal;
  finally
    if Ordered then
    begin
      vi := frmSzcx.DstList.Items.Count;
      if vi > 0 then
      begin
        vs_value := frmSzcx.dstlist.items[0];
      end;
      for i := 2 to vi do
      begin
        vs_value := vs_value + ';' + frmSzcx.dstlist.items[i - 1];
      end;
      //给表索引赋值
      DM.CDS_CLSLD_CX.IndexFieldNames := vs_value;
    end;
    frmSzcx.free;
  end;
end;

//==打印按钮的实现
procedure TfrmClsld_CX.btnPrintClick(Sender: TObject);
begin
//==创建通用打印窗口
  application.createform(TfrmPrint, frmPrint);
  with frmPrint do
  begin
    //添加可打印的字段
    srclist.items.add('收料字号');
    srclist.items.add('仓库名称');
    srclist.items.add('制单日期');
    srclist.items.add('材料编号');
    srclist.items.add('存放位置');
    srclist.items.add('入库单价');
    srclist.items.add('凭证数量');
    srclist.items.add('实收数量');
    srclist.items.add('材料名称');
    srclist.items.add('供应厂家');
    srclist.items.add('采购人');
    srclist.items.add('是否审核');
    vps_tablename := 'WZ_View_Clsld_cx'; //设置表名
    vps_filter := DM.CDS_CLSLD_CX.Filter; //过滤条件
    vps_index := DM.CDS_CLSLD_CX.IndexFieldNames; //索引
    EdtPrintTitle.Text := '收料单据打印'; //报表标题
    try
      showmodal;
    finally
      free;
    end;
  end;

end;

//==当按下DBGrid的标题列时，调用DBGridSort进行对应标题的排序,DBGridSort在
//U_public单元实现

procedure TfrmClsld_CX.DBGridTitleClick(Column: TColumn);
begin
  DBGridsort(dbgrid, column);
end;

end.


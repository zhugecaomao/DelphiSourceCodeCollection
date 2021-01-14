unit uSLD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, Mask, Grids, DBGrids, ExtCtrls, Db, DBClient,
  ComCtrls, Menus, ImgList, Qrctrls, variants, ADODB;

type
  TfrmSLD = class(TForm)
    btnAppend: TSpeedButton;
    btnDelete: TSpeedButton;
    btnEdit: TSpeedButton;
    btnSave: TSpeedButton;
    btnCancel: TSpeedButton;
    btnUndo: TSpeedButton;
    btnSH: TSpeedButton;
    btnRefresh: TSpeedButton;
    Panel1: TPanel;
    pnl_Main: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label39: TLabel;
    edtSlzh: TDBEdit;
    edtZdrq: TDBEdit;
    edtGycj: TDBEdit;
    edtWzly: TDBEdit;
    edtCgr: TDBEdit;
    edtHtbh: TDBEdit;
    edtFph: TDBEdit;
    edtShr: TDBEdit;
    edtDjbz: TDBEdit;
    cbSfsh: TDBCheckBox;
    cmbCkmc: TDBComboBox;
    btn_cgr: TBitBtn;
    DBGrid: TDBGrid;
    pnl_Main1: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtZg: TDBEdit;
    edtZdr: TDBEdit;
    edtYsr: TDBEdit;
    btn_zg: TBitBtn;
    btn_zdr: TBitBtn;
    btn_ysr: TBitBtn;
    dsSLD: TDataSource;
    dsSLD_DETAIL: TDataSource;
    aqSLDMAIN: TADOQuery;
    aqSLDDetail: TADOQuery;
    pm_Detail: TPopupMenu;
    pmi_Insert: TMenuItem;
    pmi_Delete: TMenuItem;
    Label16: TLabel;
    Label8: TLabel;
    edtFpje: TDBEdit;
    Label9: TLabel;
    edtQzyzf: TDBEdit;
    DBNavigator: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_editClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_cgrClick(Sender: TObject);
    procedure btn_zgClick(Sender: TObject);
    procedure btn_zdrClick(Sender: TObject);
    procedure btn_ysrClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAppendClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnUndoClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure pmi_InsertClick(Sender: TObject);
    procedure pmi_DeleteClick(Sender: TObject);
    procedure btnSHClick(Sender: TObject);
  private
    procedure btn_valid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSLD: TfrmSLD;

implementation

uses uDB, uPublic, U_fzlr_clbm, U_Sldjshkp;

{$R *.DFM}

procedure TfrmSLD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  frmSLD := nil;
end;

procedure TfrmSLD.btn_valid;
begin
  DBNavigator.enabled := not dbnavigator.enabled;
  btnUndo.enabled := not btnUndo.enabled;
  btnAppend.enabled := not btnAppend.enabled;
  btnDelete.enabled := not btnDelete.enabled;
  btnEdit.enabled := not btnEdit.enabled;
  btnSave.enabled := not btnSave.enabled;
  btnSH.enabled := not btnSH.enabled;
  btnRefresh.enabled := not btnRefresh.enabled;
  //显示区的切换
  pnl_Main.enabled := not pnl_Main.enabled;
  pnl_Main1.enabled := not pnl_Main1.enabled;
  //DBGrid中2、3、4、5字段状态切换，其他字段仍是只读
  dbgrid.Columns[2].readonly := not dbgrid.Columns[2].readonly;
  dbgrid.Columns[3].readonly := not dbgrid.Columns[3].readonly;
  dbgrid.Columns[4].readonly := not dbgrid.Columns[4].readonly;
  dbgrid.Columns[5].readonly := not dbgrid.Columns[5].readonly;
  //辅助录入按钮的可见性切换
  btn_cgr.visible := not btn_cgr.visible;
  btn_zg.visible := not btn_zg.visible;
  btn_zdr.visible := not btn_zdr.visible;
  btn_ysr.visible := not btn_ysr.visible;
end;

procedure TfrmSLD.btn_editClick(Sender: TObject);
begin
  //先判断是否有记录可编辑
  if aqSLDMain.recordcount = 0 then
  begin
    application.MessageBox('没有记录不能编辑', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  //判断此单据是否已审核过了，如已审核，就不能修改
  if aqSLDMain.FieldByName('是否审核').value = true then
  begin
    application.messagebox('此单据已审核，不能编辑', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  //使数据集处于编辑状态
  dsSLD.edit;
  edtSlzh.enabled := false;
  //设置组件有效性
  btn_valid;
  cmbckmc.setfocus;
end;

procedure TfrmSLD.btn_cancelClick(Sender: TObject);
begin
  //撤消刚才的操作
  aqSLDMain.CancelUpdates;
  //设置数据显示组件为不可用状态
  btn_valid;
end;

procedure TfrmSLD.btn_saveClick(Sender: TObject);
var
  s_slzh: string;
begin
  //检查数据的有效性
  if cmbCkmc.text = '' then
  begin
    application.MessageBox('仓库名称不能为空', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    cmbCkmc.SetFocus;
    exit;
  end;
  if length(trim(edtSlzh.text)) <> 9 then
  begin
    application.MessageBox('收料字号应为九位', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    edtSlzh.SetFocus;
    exit;
  end;
  //判断关键字是否重复
  s_slzh := edtSlzh.Text;
  aqSLDMain.IndexName := '收料字号';
  aqSLDMain.Refresh;
  if dsSLD.state = dsinsert then
  begin
    //检查重复
   { if aqSLDMain.FindField(s_slzh) then
    begin
      application.MessageBox('收料字号已重复', '仓库管理系统', mb_iconinformation + mb_defbutton1);
      edtSlzh.SetFocus;
      exit;
    end;       }
  end;
  //提交、保存数据库
  aqSLDMain.Post;
 // aqSLDMain.ApplyUpdates(0);
  //设置数据显示组件为不可用状态
  btn_valid;
end;

procedure TfrmSLD.btn_cgrClick(Sender: TObject);
begin
  aqSLDMain.FieldByName('StockPerson').value := GetEmployeeName;
end;

procedure TfrmSLD.btn_zgClick(Sender: TObject);
begin
  aqSLDMain.FieldByName('Admin').value := GetEmployeeName;
end;

procedure TfrmSLD.btn_zdrClick(Sender: TObject);
begin
  aqSLDMain.FieldByName('DrawPerson').value := GetEmployeeName;
end;

procedure TfrmSLD.btn_ysrClick(Sender: TObject);
begin
  aqSLDMain.FieldByName('CheckPerson').value := GetEmployeeName;
end;

procedure TfrmSLD.FormShow(Sender: TObject);
var
  s_value: string;
  query: TADOQuery;
begin
  //激活仓库信息表
  query := TADOquery.Create(self);
  query.Connection:= dmWarehouse.ACWarehouse;
  query.SQL.Text := 'select * from CKDYB' ;
  query.open;
  cmbCkmc.Items.Clear ;
  //循环向下拉框写入仓库名称
  while not query.eof do
  begin
    s_value := query.fieldbyname('WName').asstring;
    cmbCkmc.Items.Add(s_value);
    query.next;
  end;
  
  aqSLDMain.Close;
  aqSLDDetail.Close;

  aqSLDMain.Open;
  aqSLDDetail.SQL.Text:='select * from SLD_DETAIL where  InNo="'+trim(edtSlzh.Text)+'"';
  aqSLDDetail.Open;
end;

procedure TfrmSLD.btnAppendClick(Sender: TObject);
begin
  //取消过滤
  aqSLDMain.filter := '';
  aqSLDMain.filtered := true;
  //数据集处于添加状态
  aqSLDMain.Insert;
  edtSlzh.enabled := true;
  //改变组件的有效性
  btn_valid;
  cmbCkmc.SetFocus;
  aqSLDDetail.SQL.Text:='select * from SLD_DETAIL where InNo="'+trim(edtSlzh.Text)+'"';
  aqSLDDetail.Open;
end;

procedure TfrmSLD.btnDeleteClick(Sender: TObject);
begin
  //判断是否有记录可删除
  if aqSLDMain.recordcount = 0 then
  begin
    application.MessageBox('没有记录可删除', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  //确认删除
  if application.messagebox('请确认是否要删除', '仓库管理系统', mb_iconinformation + mb_yesno) = idyes then
  begin
    aqSLDMain.delete;
  //  aqSLDMain.applyupdates(0);
  end;
end;

procedure TfrmSLD.btnEditClick(Sender: TObject);
begin
  //先判断是否有记录可编辑
  if aqSLDMain.recordcount = 0 then
  begin
    application.MessageBox('没有记录不能编辑', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  //判断此单据是否已审核过了，如已审核，就不能修改
  if aqSLDMain.FieldByName('IsAuditing').value = true then
  begin
    application.messagebox('此单据已审核，不能编辑', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  //使数据集处于编辑状态
  dsSLD.edit;
  edtSlzh.enabled := false;
  //设置组件有效性
  btn_valid;
  cmbckmc.setfocus;
end;

procedure TfrmSLD.btnUndoClick(Sender: TObject);
begin
  //撤消刚才的操作
  aqSLDMain.CancelUpdates;
  //设置数据显示组件为不可用状态
  btn_valid;
end;

procedure TfrmSLD.btnSaveClick(Sender: TObject);
var
  s_slzh: string;
  query: TADOQuery;
begin
  //检查数据的有效性
  if cmbCkmc.text = '' then
  begin
    application.MessageBox('仓库名称不能为空', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    cmbCkmc.SetFocus;
    exit;
  end;
  if length(trim(edtSlzh.text)) <> 9 then
  begin
    application.MessageBox('收料字号应为九位', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    edtSlzh.SetFocus;
    exit;
  end;
  //判断关键字是否重复
  s_slzh := edtSlzh.Text;
  if aqSLDMain.state = dsinsert then
  begin
      query := TADOquery.Create(self);
      query.Connection:= dmWarehouse.ACWarehouse;
      query.SQL.Text := 'select * from SLD_MAIN where InNo ="' + s_slzh + '"' ;
      query.open;
      if not query.Eof then
      begin
        MessageBox(handle, '此收料字号已存在!', '提示', mb_IconInformation + mb_Ok);
        aqSLDMain.Cancel;
        edtSlzh.SetFocus;
        exit;
      end
  end;
  //提交、保存数据库
  aqSLDMain.Post;
  //dsSLD.ApplyUpdates(0);
  //设置数据显示组件为不可用状态
  btn_valid;
end;

procedure TfrmSLD.btnRefreshClick(Sender: TObject);
begin
  aqSLDMain.open;
  aqSLDDetail.SQL.Text:='select * from SLD_DETAIL where InNo="'+trim(edtSlzh.Text)+'"';
  aqSLDDetail.Open;
end;

procedure TfrmSLD.btnCancelClick(Sender: TObject);
begin
  frmSld := nil;
  close;
end;

procedure TfrmSLD.DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
begin
     aqSLDDetail.SQL.Text:='select * from SLD_DETAIL where InNo="'+trim(edtSlzh.Text)+'"';
     aqSLDDetail.Open; 
end;

procedure TfrmSLD.pmi_InsertClick(Sender: TObject);
var
  i: integer;
  query: TADOQuery;
begin
  //判断是否在编辑状态下
  if btnEdit.Enabled = true then
  begin
    application.MessageBox('请在编辑状态下添加材料', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  if  aqSLDMain.state = dsinsert then
  begin
    application.MessageBox('请在编辑状态下添加材料', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  
  //创建辅助录入窗口
  application.createform(TfrmClbm_Fzlr, frmClbm_Fzlr);
  try
    frmClbm_Fzlr.showmodal;
  finally
    frmClbm_Fzlr.free;
  //将选中的材料加到DBGrid中
    for i := Low(ClbmRec) to High(clbmRec) do
    begin
      aqSLDDetail.Active := True;
      aqSLDDetail.open;
//      aqSLDDetail.Filter := 'InNo=' + '''' + aqSLDMain.fieldbyname('InNo').asstring + '''';
//      aqSLDDetail.filtered := true;
//      aqSLDDetail.IndexFieldNames := '材料编号';
      //判断是否有重复的仓库
{      query := TADOQuery.Create(self);
      query.Connection:= dmWarehouse.ACWarehouse;
      query.SQL.Text := 'select * from CLBM_TEMP where MatCode="' + clbmRec[i].clbm + '"' ;
      query.open;
      if not query.Eof then
      begin
        MessageBox(handle, '此材料编码已存在!', '提示', mb_IconInformation + mb_Ok);
        continue;
      end;       }
      //添加进aqSLDDetail
      aqSLDDetail.insert;
      aqSLDDetail.fieldbyname('InNo').value := aqSLDMain.fieldbyname('InNo').asstring;
      aqSLDDetail.fieldbyname('MatCode').value := ClbmRec[i].clbm;
      aqSLDDetail.fieldbyname('MatName').value := ClbmRec[i].clmc;
      aqSLDDetail.fieldbyname('Size').value := ClbmRec[i].ggxh;
      aqSLDDetail.fieldbyname('CUnit').value := ClbmRec[i].jldw;
      aqSLDDetail.fieldbyname('PlanPrice').value := ClbmRec[i].jhdj;
      aqSLDDetail.fieldbyname('PriceUnit').value := ClbmRec[i].djdw;
      aqSLDDetail.fieldbyname('BillNum').value := 0.0;
      aqSLDDetail.fieldbyname('InNum').value := 0.0;
      aqSLDDetail.post;
    end;
  end;
  dbgrid.Refresh;
end;

procedure TfrmSLD.pmi_DeleteClick(Sender: TObject);
begin
  //判断是否有记录可删除
  if aqSLDDetail.recordcount = 0 then
  begin
    application.MessageBox('没有记录可删除', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  //判断是否在浏览状态下
  if (btnEdit.enabled = false) then
  begin
    application.MessageBox('请在浏览状态下删除仓库', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  if application.messagebox('请确认是否要删除', '仓库管理系统', mb_iconinformation + mb_yesno) = idyes then
  begin
    aqSLDDetail.delete;
  end;
end;

//审核处理
procedure TfrmSLD.btnSHClick(Sender: TObject);
begin
  if aqSLDMAIN.FieldByName('IsAuditing').value = true then
  begin
    application.MessageBox('此单据已审核', '材料与计划管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  if application.MessageBox('请确认是否审核通过', 'Tip', mb_iconinformation + mb_yesno) = idyes then
  begin
    application.createform(TfrmClsldDjsh, frmClsldDjsh);
    try
      aqSLDMAIN.edit;
      frmClsldDjsh.showmodal;
    finally
      frmClsldDjsh.free;
    end;
  end;
end;

end.


unit U_bmlldgl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, Mask, Grids, DBGrids, ExtCtrls, Db, DBClient,
  ComCtrls, Menus, ImgList, Qrctrls, QuickRpt, ADODB;

type
  TfrmBmlld = class(TForm)
    ScrollBox3: TScrollBox;
    Panel2: TPanel;
    Panel8: TPanel;
    btn_insert: TSpeedButton;
    btn_post: TSpeedButton;
    btn_cancel: TSpeedButton;
    btn_refresh: TSpeedButton;
    btn_delete: TSpeedButton;
    btn_edit: TSpeedButton;
    DBNavigator2: TDBNavigator;
    Panel1: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit39: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    DBComboBox2: TDBComboBox;
    Panel3: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DataSource5: TDataSource;
    DataSource4: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    aqBMLLD_MAIN: TADOQuery;
    aqBMLLD_DETAIL: TADOQuery;
    dbeLLZH: TDBEdit;
    Label16: TLabel;
    btnCancel: TSpeedButton;
    btnSH: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_insertClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_postClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBNavigator2Click(Sender: TObject; Button: TNavigateBtn);
    procedure btnSHClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    procedure btn_valid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBmlld: TfrmBmlld;

implementation

uses  U_fzlr_zgxm, WzglDB, upublic, U_fzlr_clbm,uDB, U_Sldjshkp,
  U_bmlldjshkp;

{$R *.DFM}

procedure TfrmBmlld.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  frmBmlld := nil;
end;

procedure TfrmBmlld.btn_insertClick(Sender: TObject);
begin
  aqBMLLD_Main.Insert;
  dbeLLZH.enabled := true;
  btn_valid;
  dbedit31.SetFocus;
  aqBMLLD_DETAIL.SQL.Text:='select * from BMLLD_DETAIL where ReceiveNo="'+trim(dbeLLZH.Text)+'"';
  aqBMLLD_DETAIL.Open;
end;

procedure TfrmBmlld.btn_valid;
begin
  DBNavigator2.enabled := not dbnavigator2.enabled;
  btn_insert.enabled := not btn_insert.enabled;
  btn_delete.enabled := not btn_delete.enabled;
  btn_edit.enabled := not btn_edit.enabled;
  btn_cancel.enabled := not btn_cancel.enabled;
  btn_post.enabled := not btn_post.enabled;
  btnSH.Enabled := not btnSH.Enabled;
  btn_refresh.enabled := not btn_refresh.enabled;
  panel3.enabled := not panel3.enabled;
  panel1.enabled := not panel1.enabled;
  dbgrid1.columns[2].readonly := not dbgrid1.columns[2].readonly;
  dbgrid1.columns[3].readonly := not dbgrid1.columns[3].readonly;
  bitbtn1.visible := not bitbtn1.visible;
  bitbtn2.visible := not bitbtn2.visible;
  bitbtn3.visible := not bitbtn3.visible;
  bitbtn4.visible := not bitbtn4.visible;
  bitbtn5.visible := not bitbtn5.visible;
end;

procedure TfrmBmlld.btn_editClick(Sender: TObject);
begin
  if aqBMLLD_Main.recordcount = 0 then
  begin
    application.MessageBox('没有记录不能编辑', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  if aqBMLLD_Main.FieldByName('IsAuditing').value = true then
  begin
    application.messagebox('此单据已审核，不能编辑', '', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  aqBMLLD_Main.edit;
  dbeLLZH.enabled := false;
  btn_valid;
  dbedit31.setfocus;
end;

procedure TfrmBmlld.btn_cancelClick(Sender: TObject);
begin
  aqBMLLD_Main.Cancel;
  btn_valid;
end;

procedure TfrmBmlld.btn_postClick(Sender: TObject);
var
  s_llzh: string;
  query: TADOQuery;
begin
  if trim(dbedit31.text) = '' then
  begin
    application.MessageBox('领料单位不能为空', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    dbedit31.SetFocus;
    exit;
  end;
  if length(trim(dbeLLZH.text)) <> 9 then
  begin
    application.MessageBox('领料字号应为九位', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    dbeLLZH.SetFocus;
    exit;
  end;
  if dbcombobox2.text = '' then
  begin
    application.MessageBox('仓库名称不能为空', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    dbcombobox2.SetFocus;
    abort;
  end;

  s_llzh := dbeLLZH.Text;

  if aqBMLLD_MAIN.state = dsinsert then
  begin

    query := TADOquery.Create(self);
    query.Connection:= dmWarehouse.ACWarehouse;
    query.SQL.Text := 'select * from BMLLD_Main where ReceiveNo = "' + s_llzh + '"';
    query.open;
    if not query.Eof then
    begin
      application.MessageBox('领料字号已重复', '仓库管理系统', mb_iconinformation + mb_defbutton1);
      dbeLLZH.SetFocus;
      exit;
    end;
  end;

  aqBMLLD_DETAIL.First;

  aqBMLLD_Main.Post;
  btn_valid;
end;

procedure TfrmBmlld.BitBtn2Click(Sender: TObject);
begin
  aqBMLLD_Main.FieldByName('MatAdim').value := GetEmployeeName;
end;

procedure TfrmBmlld.BitBtn3Click(Sender: TObject);
begin
  aqBMLLD_Main.FieldByName('SendPerson').value := GetEmployeeName;
end;

procedure TfrmBmlld.BitBtn4Click(Sender: TObject);
begin
  aqBMLLD_Main.FieldByName('RecieveAdmin').value := GetEmployeeName;
end;

procedure TfrmBmlld.BitBtn5Click(Sender: TObject);
begin
  aqBMLLD_Main.FieldByName('RecievePerson').value := GetEmployeeName;
end;

procedure TfrmBmlld.btn_refreshClick(Sender: TObject);
begin
  aqBMLLD_Main.close;
  aqBMLLD_Main.SQL.Text := 'select * from bmlld_main order by ReceiveNo';
  aqBMLLD_Main.open;
  aqBMLLD_Main.first;
  aqBMLLD_Detail.SQL.Text := 'select * from BMLLD_Detail where  ReceiveNo="' + trim(dbeLLZH.Text) + '"';
  aqBMLLD_Detail.Open;
end;

procedure TfrmBmlld.BitBtn1Click(Sender: TObject);
begin
  aqBMLLD_Main.FieldByName('ReceiveUnits').value := GetDeptName;
end;

procedure TfrmBmlld.btn_deleteClick(Sender: TObject);
begin
  if aqBMLLD_Main.recordcount = 0 then
  begin
    application.MessageBox('没有记录可删除', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  if application.messagebox('请确认是否要删除', '仓库管理系统', mb_iconinformation + mb_yesno) = idyes then
  begin
    aqBMLLD_Main.delete;
  end;

end;

procedure TfrmBmlld.N1Click(Sender: TObject);
var
  i: integer;
  s_hint : string;
  query: TADOQuery;
begin
  if dbgrid1.columns[2].readonly = true then
  begin
    application.MessageBox('请在编辑状态下添加材料', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  if aqBMLLD_MAIN.state = dsinsert then
  begin
    application.MessageBox('请在编辑状态下添加材料', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;

  application.createform(TfrmClbm_Fzlr, frmClbm_Fzlr);
  try
    frmClbm_Fzlr.showmodal;
  finally
    query := TADOquery.Create(self);
    query.Connection:= dmWarehouse.ACWarehouse;
    frmClbm_Fzlr.free;
    for i := Low(ClbmRec) to High(clbmRec) do
    begin
      query.SQL.Text := 'select * from BMLLD_Detail where ReceiveNo = "' + aqBMLLD_Main.fieldbyname('ReceiveNo').asstring + '"';
      query.open;
      if not query.Eof then
      begin
        s_hint := '已有材料编号为' + clbmRec[i].clbm + '的仓库';
        application.MessageBox(pchar(s_hint), '管理系统', mb_iconinformation + mb_defbutton1);
        continue;
      end;
      aqBMLLD_DETAIL.insert;
      aqBMLLD_DETAIL.fieldbyname('ReceiveNo').value := aqBMLLD_Main.fieldbyname('ReceiveNo').asstring;
      aqBMLLD_DETAIL.fieldbyname('MatCode').value := clbmRec[i].clbm;
      aqBMLLD_DETAIL.fieldbyname('MatName').value := clbmRec[i].clmc;
      aqBMLLD_DETAIL.fieldbyname('Size').value := clbmRec[i].ggxh;
      aqBMLLD_DETAIL.fieldbyname('CUnit').value := clbmRec[i].jldw;
      aqBMLLD_DETAIL.fieldbyname('PlanPrice').value := clbmRec[i].jhdj;
      aqBMLLD_DETAIL.fieldbyname('PriceUnit').value := clbmRec[i].djdw;
      aqBMLLD_DETAIL.fieldbyname('PlanNum').value := 0.0;
      aqBMLLD_DETAIL.fieldbyname('RealNum').value := 0.0;
      aqBMLLD_DETAIL.post;
    end;
  end;
end;

procedure TfrmBmlld.DBGrid1DblClick(Sender: TObject);
begin
  n1.click;
end;

procedure TfrmBmlld.N2Click(Sender: TObject);
begin
  if aqBMLLD_DETAIL.recordcount = 0 then
  begin
    application.MessageBox('没有记录可删除', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  if dbgrid1.columns[2].readonly = true then
  begin
    application.MessageBox('请在添加或编辑状态下删除仓库', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  if application.messagebox('请确认是否要删除', '仓库管理系统', mb_iconinformation + mb_yesno) = idyes then
  begin
    aqBMLLD_DETAIL.delete;
  end;
end;

procedure TfrmBmlld.BitBtn6Click(Sender: TObject);
begin
  //DM.CDS_BMLLD.FieldByName('工程项目').value := GetProjectName;
end;

procedure TfrmBmlld.FormCreate(Sender: TObject);

var
  s_value: string;
  query: TADOQuery;
begin
  aqBMLLD_Main.Active := True;
  aqBMLLD_DETAIL.Active := True;
  //激活仓库信息表
  query := TADOquery.Create(self);
  query.Connection:= dmWarehouse.ACWarehouse;
  query.SQL.Text := 'select * from CKDYB' ;
  query.open;
  dbcombobox2.Items.Clear ;
  //循环向下拉框写入仓库名称
  while not query.eof do
  begin
    s_value := query.fieldbyname('WName').asstring;
    dbcombobox2.Items.Add(s_value);
    query.next;
  end;
  
end;

procedure TfrmBmlld.FormShow(Sender: TObject);
begin
  aqBMLLD_Main.Close;
  aqBMLLD_DETAIL.Close;

  aqBMLLD_Main.Open;
  aqBMLLD_DETAIL.SQL.Text:='select * from BMLLD_DETAIL where ReceiveNo="'+trim(dbeLLZH.Text)+'"';
  aqBMLLD_DETAIL.Open;
end;

procedure TfrmBmlld.DBNavigator2Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  aqBMLLD_DETAIL.SQL.Text:='select * from BMLLD_DETAIL where ReceiveNo="'+trim(dbeLLZH.Text)+'"';
  aqBMLLD_DETAIL.Open;
end;

//审核处理
procedure TfrmBmlld.btnSHClick(Sender: TObject);
begin
  if aqBMlld_Main.FieldByName('IsAuditing').value = true then
  begin
    application.MessageBox('此单据已审核', '材料与计划管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  if application.MessageBox('请确认是否审核通过', '材料与计划管理系统', mb_iconinformation + mb_yesno) = idyes then
  begin
    application.createform(TfrmBmlldDjsh, frmBmlldDjsh);
    try
      frmBmlldDjsh.showmodal;
    finally
      frmBmlldDjsh.free;
    end;
  end;
end;

procedure TfrmBmlld.btnCancelClick(Sender: TObject);
begin
  close;
end;

end.


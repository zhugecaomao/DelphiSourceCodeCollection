unit sale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, KvLabel, ExtCtrls, wwdbdatetimepicker, Mask, wwdbedit,
  wwdblook, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd, Wwdbgrid, wwDBGridEx,
  Wwdbspin, TFlatEditUnit, TFlatSpinEditUnit, DBFlatSpinEdit,
  wwSpeedButton, wwDBNavigator, wwclearpanel, DBCtrls, ImgList, TB2Item,
  TB2Dock, TB2ToolWindow, Buttons, DB, TFlatButtonUnit, ADODB, TB2Toolbar,
  DBActns, ActnList, DosMove, ComCtrls, FlatDBComBox, RM_dset, RM_dbset,
  RM_Desgn, RM_class, Wwdatsrc;

type
  TfrmSale = class(TForm)
    panTop: TPanel;
    Label5: TKvLabel;
    Label6: TKvLabel;
    Label8: TKvLabel;
    Label1: TKvLabel;
    Label2: TKvLabel;
    Label4: TKvLabel;
    edDate: TwwDBDateTimePicker;
    edSheetId: TwwDBEdit;
    cblStore: TwwDBLookupCombo;
    cbType: TwwDBComboBox;
    panGDS: TPanel;
    gridItems: TwwDBGridEx;
    cbGdsID: TwwDBComboDlg;
    cbStoreNAme: TDBLookupComboBox;
    cblCust: TwwDBLookupCombo;
    cblEmp: TwwDBLookupCombo;
    wwDBGridEx1IButton: TwwIButton;
    spQua: TwwDBSpinEdit;
    spPrice: TwwDBSpinEdit;
    spBigPrice: TwwDBSpinEdit;
    SumQuery: TADOQuery;
    imgTool: TImageList;
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    DataSetRefresh1: TDataSetRefresh;
    TBToolbar1: TTBToolbar;
    nav: TwwDBNavigator;
    TBControlItem1: TTBControlItem;
    navFirst: TwwNavButton;
    navPriorPage: TwwNavButton;
    navPrior: TwwNavButton;
    navNext: TwwNavButton;
    navNextPage: TwwNavButton;
    navLast: TwwNavButton;
    navInsert: TwwNavButton;
    navDelete: TwwNavButton;
    navEdit: TwwNavButton;
    navPost: TwwNavButton;
    navCancel: TwwNavButton;
    navRefresh: TwwNavButton;
    DosMove1: TDosMove;
    TBItem1: TTBItem;
    actUpdate: TAction;
    panBill: TPanel;
    TreeView1: TTreeView;
    dockTop: TTBDock;
    actChecked: TAction;
    KvLabel1: TKvLabel;
    TBItem2: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    labStatus: TKvLabel;
    cbUnit: TwwDBComboDlg;
    spOutCheck: TADOStoredProc;
    actPrint: TAction;
    TBItem3: TTBItem;
    RMReport1: TRMReport;
    RMDesigner1: TRMDesigner;
    rmdOutitems: TRMDBDataSet;
    rmdOut: TRMDBDataSet;
    actPrint2: TAction;
    TBItem4: TTBItem;
    adoOutitems: TADOQuery;
    RMDBAdoOutItemsGroup: TRMDBDataSet;
    TBItem5: TTBItem;
    edPay: TwwDBComboDlg;
    dbgSheet: TwwDBGrid;
    qrySheet: TADOQuery;
    dsSheet: TwwDataSource;
    actCopy: TAction;
    TBItem6: TTBItem;
    navFilterDialog: TwwNavButton;
    navLocateDialog: TwwNavButton;
    navSearchDialog: TwwNavButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cbGdsIDCustomDlg(Sender: TObject);
    procedure wwDBGridEx1IButtonClick(Sender: TObject);
    procedure gridItemsUpdateFooter(Sender: TObject);
    procedure gridItemsExit(Sender: TObject);
    procedure gridItemsEnter(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure edSheetIdChange(Sender: TObject);
    procedure cbUnitCustomDlg(Sender: TObject);
    procedure actCheckedExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actPrint2Execute(Sender: TObject);
    procedure TBItem5Click(Sender: TObject);
    procedure edPayCustomDlg(Sender: TObject);
    procedure navRefreshClick(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
  private
    procedure BuildRep();
    procedure refreshStatus(Sender: TObject); //refresh 控件的属性
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSale: TfrmSale;

implementation

uses data, gdsSelect, gdsUnit;

{$R *.dfm}

procedure TfrmSale.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSale.FormCreate(Sender: TObject);
begin
  dm.tabemp.Open;
  dm.tabcust.open;
  dm.tabstore.open;
  dm.tabout.Open;
  dm.tabOutItems.Open;
end;

procedure TfrmSale.cbGdsIDCustomDlg(Sender: TObject);
var
  i: integer;
  frmgdsSelect: TfrmgdsSelect;
begin
  if dm.tabOut.FieldByName('status').value > 0 then
    begin
      Showmessage('单据已经审核过，不能再修改');
      exit;
    end ;

  frmgdsSelect := TfrmgdsSelect.Create(self);
  frmgdsSelect.showmodal;
  if dm.tabOutItems.Modified then
    dm.tabOutItems.post;
  with frmgdsSelect.lvSelected, dm.tabOutItems do
    begin
      DisableControls; { Disable controls to improve performance }
      for i := 0 to items.Count - 1 do
        begin
          dm.tabOutItems.append; //不用append,当表空时，若用的话会出错的。
          dm.taboutitems.FieldByName('sheetId').value := dm.tabout.FieldByName('sheetId').value;
          dm.taboutitems.FieldByName('storeid').value := dm.tabout.FieldByName('defaultstoreid').value;
        //      dm.taboutitems.FieldByName('gdsName').asstring := Items[i].SubItems.Strings[0];
          dm.taboutitems.FieldByName('gdsId').value := items[i].Caption;
          dm.taboutitems.FieldByName('unit').value :=  Items[i].SubItems.Strings[1];
          dm.taboutitems.FieldByName('qua').value := 0;
          dm.taboutitems.post;
        end;
      EnableControls; { Reenable controls }
    end;
  frmgdsSelect.free;
  frmgdsSelect := nil;
end;

procedure TfrmSale.wwDBGridEx1IButtonClick(Sender: TObject);
begin
  cbGdsIDCustomDlg(Sender);
end;

procedure TfrmSale.gridItemsUpdateFooter(Sender: TObject);
begin
  with SumQuery, gridItems do
    begin
      SumQuery.active := False;
      Parameters.ParamByName('sheetid').value := dm.tabout.fieldbyname('sheetid').value; //可不用这句
      SumQuery.Active := true;

      ColumnByName('qua').FooterValue := fieldbyname('quaamo').asstring;
      ColumnByName('amo').FooterValue :=
        FloatToStrF(fieldbyname('AmoAmo').asfloat, ffCurrency, 10, 2);
      ColumnByName('Bigamo').FooterValue :=
        FloatToStrF(fieldbyname('BigAmoAmo').asfloat, ffCurrency, 10, 2);
    end;
end;

procedure TfrmSale.gridItemsExit(Sender: TObject);
begin
  with dm.tabOutItems do
    if State in [dsInsert, dsEdit] then post;
  nav.DataSource := dm.dsOut;
end;

procedure TfrmSale.gridItemsEnter(Sender: TObject);
begin
  with dm.tabOut do
    if State in [dsInsert, dsEdit] then
      post;
  nav.DataSource := dm.dsOutItems;
  dm.tabOutItems.Edit;
end;

procedure TfrmSale.actUpdateExecute(Sender: TObject);
begin
  with dm.taboutitems do
   try
       updatebatch;
       showmessage('上传成功');
      except
       raise exception.Create('上传失败');
    end;
end;

procedure TfrmSale.refreshStatus(Sender: TObject); //refresh 控件的属性
var iscanModify: boolean;
begin
  with dm.tabout do
    case fieldbyname('status').AsInteger of
      0:
        begin
          iscanModify := false;
          labStatus.caption := '草稿';
        end;
      1:
        begin
          iscanModify := true;
          if fieldbyname('payamo').Value = fieldbyname('amo').Value then
            labStatus.caption := '已审核,款项已付清'
          else
            labStatus.caption := '已审核,待付中';
        end;
    else labstatus.Visible := false;
    end;

  edPay.ReadOnly := not iscanModify;
  eddate.ReadOnly := iscanModify;
  edsheetid.ReadOnly := iscanModify;
  cblcust.ReadOnly := iscanModify;
  cblstore.ReadOnly := iscanModify;
  cbtype.ReadOnly := iscanModify;
  cblEmp.ReadOnly := iscanModify;
end;

procedure TfrmSale.edSheetIdChange(Sender: TObject);
begin
  refreshStatus(Sender);
end;

procedure TfrmSale.cbUnitCustomDlg(Sender: TObject);
var frmGdsUnit: TfrmGdsUnit;
begin
  frmGdsUnit := TfrmGdsUnit.create(self);
  frmGdsUnit.lcGdsId.Text := dm.tabOutItems.fieldbyname('gdsid').value;
  frmGdsUnit.showmodal;
  if frmGdsUnit.selectedunit <> '' then
    begin
      dm.tabOutItems.Edit;
      dm.tabOutItems.fieldbyname('unit').value := frmGdsUnit.selectedunit;
    end;
  frmGdsUnit.Free;
  frmGdsUnit := nil;
end;


procedure TfrmSale.actCheckedExecute(Sender: TObject);
var Mess: string;
begin
  with spOutCheck do
    begin
      close;
      Parameters.ParamByName('@BillNo').value := dm.tabOut.fieldbyname('sheetid').value;
      ExecProc;
      begin
        mess := Parameters.ParamByName('@mess').Value;
        dm.tabOut.Tag := 1;        //tag 为0 时，表示已存盘。  1 时表示末存盘
        showmessage(mess);
      end;
    end;
  navRefreshClick(Sender);
end;

procedure TfrmSale.actPrintExecute(Sender: TObject);
var FileName: string;
begin
  fileName := ExtractFilePath(ParamStr(0)) + '报表\销售单--带仓库.rmf';
  RMReport1.LoadFromFile(fileName);
  RMReport1.ShowReport;
end;

procedure TfrmSale.actPrint2Execute(Sender: TObject);
var FileName: string;
begin
  BuildRep;
  fileName := ExtractFilePath(ParamStr(0)) + '报表\销售单.rmf';
  RMReport1.LoadFromFile(fileName);
  RMReport1.ShowReport;
end;

procedure TfrmSale.BuildRep();
begin
  with adoOutitems do
    begin
      close;
      Parameters.ParamByName('sheetID').value := dm.tabOut.fieldbyname('sheetID').value;
      open;
      rmdOutitems.DataSet := adoOutitems;
    end;
end;


procedure TfrmSale.TBItem5Click(Sender: TObject);
begin
  RMReport1.DesignReport;
end;

procedure TfrmSale.edPayCustomDlg(Sender: TObject);
begin
  with dm.tabOut do
    begin
      edit;
      fieldbyname('payamo').value := fieldbyname('amo').value;
      post;
      navRefreshClick(Sender);
    end;
end;

procedure TfrmSale.navRefreshClick(Sender: TObject);
begin
  dm.tabout.Refresh;
  refreshStatus(Sender);
end;

procedure TfrmSale.actCopyExecute(Sender: TObject);
var tmpBill,defaultstoreid ,tmpCustID: string;
  tmpType: string;
  tmpQry: TadoQuery;
begin
 if dm.taboutitems.RecordCount <= 0 then
  begin
    Showmessage('单据没有明细记录，不用复制');
    exit;
  end;

  with dm.tabout do
    begin
      if (state in [dsinsert, dsedit]) or (dm.taboutitems.state in [dsinsert, dsedit]) then
      if MessageDlg('当前记录还没有存盘，请保存上传先?',  mtConfirmation, [mbOk], 0)= mrOk then exit;

      defaultstoreid := Fieldbyname('defaultstoreid').asstring;
      tmpBill := Fieldbyname('sheetid').asstring;
      tmpCustId := Fieldbyname('CustId').asstring;
      tmpType := Fieldbyname('type').asstring;
      append;
      Fieldbyname('CustId').value := tmpCustId;
      Fieldbyname('type').value := tmpType;
      Fieldbyname('Date').value := now;
      Fieldbyname('status').value := 0;
      Fieldbyname('amo').value := 0;
      Fieldbyname('payamo').value := 0;
      post;
    end; //开始复制从表

    tmpQry := TadoQuery.Create(self);
    tmpQry.Connection  := dm.db;
    tmpQry.sql.clear;
    tmpQry.SQL.Add('select * from outItems where sheetid = :Sheetid order by sheetid,gdsid');
    tmpQry.Parameters.ParamByName('Sheetid').value := tmpBill;
    tmpQry.Open;
    tmpqry.First;

  dm.tabOutItems.DisableControls ;
   with dm.tabOutItems do
   while not tmpqry.Eof do
    begin
      append;
      FieldByname('sheetid').value := dm.tabOut.Fieldbyname('sheetid').value;
      FieldByname('gdsid').value := tmpqry.FieldByname('gdsid').value;
      FieldByname('unit').value := tmpqry.FieldByname('unit').value;
      FieldByname('price').value := tmpqry.FieldByname('price').value;
      Fieldbyname('storeid').value := tmpqry.FieldByname('storeid').value;
      FieldByname('qua').value := 0;
      FieldByname('bigPrice').value := tmpqry.FieldByname('bigPrice').value;
      post;
      tmpQry.Next;
    end;
    tmpQry.Free;
    tmpQry := nil;
    dm.tabOutItems.EnableControls  ;
    Showmessage('销售单据复制成功！请修改完后上传 ^_^');
end;


end.

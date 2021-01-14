unit buy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, KvLabel, ExtCtrls, wwdbdatetimepicker, Mask, wwdbedit,
  wwdblook, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd, Wwdbgrid, wwDBGridEx,
  Wwdbspin, TFlatEditUnit, TFlatSpinEditUnit, DBFlatSpinEdit,
  wwSpeedButton, wwDBNavigator, wwclearpanel, DBCtrls, ImgList, TB2Item,
  TB2Dock, TB2ToolWindow, Buttons, DB, TFlatButtonUnit, ADODB, TB2Toolbar,
  DBActns, ActnList, DosMove, ComCtrls, FlatDBComBox, RM_dset, RM_dbset,
  RM_Desgn, RM_class;

type
  TfrmBuy = class(TForm)
    panTop: TPanel;
    Label5: TKvLabel;
    Label6: TKvLabel;
    Label8: TKvLabel;
    Label1: TKvLabel;
    Label2: TKvLabel;
    Label4: TKvLabel;
    edSheetID: TwwDBEdit;
    cblStore: TwwDBLookupCombo;
    cblType: TwwDBComboBox;
    panGDS: TPanel;
    gridItems: TwwDBGrid;
    cbGdsID: TwwDBComboDlg;
    cbStoreNAme: TDBLookupComboBox;
    cblSupp: TwwDBLookupCombo;
    cblEmp: TwwDBLookupCombo;
    wwDBGridEx1IButton: TwwIButton;
    spQua: TwwDBSpinEdit;
    spPrice: TwwDBSpinEdit;
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
    a: TListView;
    dockTop: TTBDock;
    actChecked: TAction;
    KvLabel1: TKvLabel;
    TBItem2: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    labStatus: TKvLabel;
    cbUnit: TwwDBComboDlg;
    spInCheck: TADOStoredProc;
    actPrint: TAction;
    TBItem3: TTBItem;
    RMReport1: TRMReport;
    RMDesigner1: TRMDesigner;
    rmdInitems: TRMDBDataSet;
    rmdIn: TRMDBDataSet;
    actPrint2: TAction;
    TBItem4: TTBItem;
    adoInitems: TADOQuery;
    RMDBAdoInItemsGroup: TRMDBDataSet;
    TBItem5: TTBItem;
    edDate: TwwDBDateTimePicker;
    edPay: TwwDBComboDlg;
    actcopy: TAction;
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
    procedure edSheetIDChange(Sender: TObject);
    procedure cbUnitDropDown(Sender: TObject);
    procedure cbUnitCustomDlg(Sender: TObject);
    procedure actCheckedExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actPrint2Execute(Sender: TObject);
    procedure TBItem5Click(Sender: TObject);
    procedure edPayCustomDlg(Sender: TObject);
    procedure navRefreshClick(Sender: TObject);
    procedure actcopyExecute(Sender: TObject);
  private
    procedure BuildRep();
    procedure refreshStatus(Sender: TObject); //refresh 控件的属性
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuy: TfrmBuy;

implementation

uses data, gdsSelect, gdsUnit;

{$R *.dfm}

procedure TfrmBuy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBuy.FormCreate(Sender: TObject);
begin
  dm.tabemp.Open;
  dm.tabSupp.open;
  dm.tabstore.open;
  dm.tabIn.Open;
  dm.tabInItems.Open;
end;

procedure TfrmBuy.cbGdsIDCustomDlg(Sender: TObject);
var
  i: integer;
  frmgdsSelect: TfrmgdsSelect;
begin

  if dm.tabIn.FieldByName('status').value > 0 then
    begin
      Showmessage('单据已经审核过，不能再修改');
      exit;
    end ;


  frmgdsSelect := TfrmgdsSelect.Create(self);
  frmgdsSelect.showmodal;
  if dm.tabInItems.Modified then
    dm.tabInItems.post;

  with frmgdsSelect.lvSelected, dm.tabInItems do
    begin
      DisableControls; { Disable controls to improve performance }
      for i := 0 to items.Count - 1 do
        begin
//           showmessage(items[i].Caption+'    '+Items[i].SubItems.Strings[0]+'   '+Items[i].SubItems.Strings[1]);
            dm.tabInItems.Insert   ; //不用append,当表空时，若用的话会出错的。
         dm.tabInitems.FieldByName('sheetId').value :=  dm.tabIn.FieldByName('sheetId').value;
         dm.tabInitems.FieldByName('storeid').value := dm.tabIn.FieldByName('defaultstoreid').value;
         //dm.tabInitems.FieldByName('gdsName').asstring := Items[i].SubItems.Strings[0];
          dm.tabInitems.FieldByName('gdsId').value := items[i].Caption;
          dm.tabInitems.FieldByName('unit').value := Items[i].SubItems.Strings[1];
          dm.tabInitems.FieldByName('qua').value := 0;
          dm.tabInitems.post;
      end;
      EnableControls; { Reenable controls }
    end;
  frmgdsSelect.free;
  frmgdsSelect := nil;
end;

procedure TfrmBuy.wwDBGridEx1IButtonClick(Sender: TObject);
begin
  cbGdsIDCustomDlg(Sender);
end;

procedure TfrmBuy.gridItemsUpdateFooter(Sender: TObject);
begin
  with SumQuery, gridItems do
    begin
      SumQuery.active := False;
      Parameters.ParamByName('sheetid').value := dm.tabIn.fieldbyname('sheetid').value; //可不用这句
      SumQuery.Active := true;

      ColumnByName('qua').FooterValue := fieldbyname('quaamo').asstring;
      ColumnByName('amo').FooterValue :=
        FloatToStrF(fieldbyname('AmoAmo').asfloat, ffCurrency, 10, 2);
    end;
end;

procedure TfrmBuy.gridItemsExit(Sender: TObject);
begin
  with dm.tabInItems do
    if State in [dsInsert, dsEdit] then post;
  nav.DataSource := dm.dsIn;
end;

procedure TfrmBuy.gridItemsEnter(Sender: TObject);
begin
  with dm.tabIn do
    if State in [dsInsert, dsEdit] then
      post;
  nav.DataSource := dm.dsInItems;
  dm.tabInItems.Edit;
end;

procedure TfrmBuy.actUpdateExecute(Sender: TObject);
begin
  with dm.tabInitems do
     try
       updatebatch;
       showmessage('上传成功');
      except
       raise exception.Create('上传失败');
    end;
end;

procedure TfrmBuy.refreshStatus(Sender: TObject); //refresh 控件的属性
var iscanModify: boolean;
begin
  with dm.tabIn do
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
  cblSupp.ReadOnly := iscanModify;
  cblstore.ReadOnly := iscanModify;
  cbltype.ReadOnly := iscanModify;
  cblEmp.ReadOnly := iscanModify;
end;

procedure TfrmBuy.edSheetIDChange(Sender: TObject);
begin
  refreshStatus(Sender);
end;

procedure TfrmBuy.cbUnitDropDown(Sender: TObject);
begin
  { with dm.qryUnit,cbUnit do
     begin
       close;
       Parameters.ParamByName('GdsID').value := dm.tabInItems.fieldbyname('GdsID').value  ;
       if not active then open;
       first;
       items.Clear;
       items.add('新增..');
       items.add(fieldbyname('baseunit').value);
       while not eof do
         begin
           items.add(fieldbyname('unit').value);
           next;
         end;
     end;
  }
end;

procedure TfrmBuy.cbUnitCustomDlg(Sender: TObject);
var frmGdsUnit: TfrmGdsUnit;
begin
  frmGdsUnit := TfrmGdsUnit.create(self);
  frmGdsUnit.lcGdsId.Text := dm.tabInItems.fieldbyname('gdsid').value;
  frmGdsUnit.showmodal;
  if frmGdsUnit.selectedunit <> '' then
    begin
      dm.tabInItems.Edit;
      dm.tabInItems.fieldbyname('unit').value := frmGdsUnit.selectedunit;
    end;
  frmGdsUnit.Free;
  frmGdsUnit := nil;
end;


procedure TfrmBuy.actCheckedExecute(Sender: TObject);
var Mess: string;
begin
  with spInCheck do
    begin
      close;
      Parameters.ParamByName('@BillNo').value := dm.tabIn.fieldbyname('sheetid').value;
      ExecProc;
      begin
        mess := Parameters.ParamByName('@mess').Value;
        showmessage(mess);
      end;
    end;
  navRefreshClick(Sender);
end;

procedure TfrmBuy.actPrintExecute(Sender: TObject);
var FileName: string;
begin
  fileName := ExtractFilePath(ParamStr(0)) + '报表\入货单--带仓库.rmf';
  RMReport1.LoadFromFile(fileName);
  RMReport1.ShowReport;
end;

procedure TfrmBuy.actPrint2Execute(Sender: TObject);
var FileName: string;
begin
{  BuildRep;
  fileName := ExtractFilePath(ParamStr(0)) + '报表\入货单.rmf';
  RMReport1.LoadFromFile(fileName);
  RMReport1.ShowReport;
}end;

procedure TfrmBuy.BuildRep();
begin
  with adoInitems do
    begin
      close;
      Parameters.ParamByName('sheetID').value := dm.tabIn.fieldbyname('sheetID').value;
      open;
      rmdInitems.DataSet := adoInitems;
    end;
end;


procedure TfrmBuy.TBItem5Click(Sender: TObject);
begin
  RMReport1.DesignReport;
end;

procedure TfrmBuy.edPayCustomDlg(Sender: TObject);
begin
  with dm.tabIn do
    begin
      edit;
      fieldbyname('payamo').value := fieldbyname('amo').value;
      post;
      navRefreshClick(Sender);
    end;
end;

procedure TfrmBuy.navRefreshClick(Sender: TObject);
begin
  dm.tabin.Refresh;
  refreshStatus(Sender);
end;

procedure TfrmBuy.actcopyExecute(Sender: TObject);
var tmpBill,defaultstoreid ,tmpsuppID: string;
  tmpType: string;
  tmpQry: TadoQuery;
begin
 if dm.tabinitems.RecordCount <= 0 then
  begin
    Showmessage('单据没有明细记录，不用复制');
    exit;
  end;

  with dm.tabin do
    begin
      if  tag = 1 then // (state in [dsinsert, dsedit]) or (dm.tabinitems.state in [dsinsert, dsedit]) then
      if MessageDlg('当前记录还没有存盘，请先保存上传后操作?',  mtConfirmation, [mbOk], 0)= mrOk then exit;

      defaultstoreid := Fieldbyname('defaultstoreid').asstring;
      tmpBill := Fieldbyname('sheetid').asstring;
      tmpsuppId := Fieldbyname('suppId').asstring;
      tmpType := Fieldbyname('type').asstring;

      append;
      Fieldbyname('suppId').value := tmpsuppId;
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
    tmpQry.SQL.Add('select * from inItems where sheetid = :Sheetid order by sheetid,gdsid');
    tmpQry.Parameters.ParamByName('Sheetid').value := tmpBill;
    tmpQry.Open;
    tmpqry.First;

  dm.tabinItems.DisableControls ;
   with dm.tabinItems do
   while not tmpqry.Eof do
    begin
      append;
      FieldByname('sheetid').value := dm.tabin.Fieldbyname('sheetid').value;
      FieldByname('gdsid').value := tmpqry.FieldByname('gdsid').value;
      FieldByname('unit').value := tmpqry.FieldByname('unit').value;
      FieldByname('price').value := tmpqry.FieldByname('price').value;
      Fieldbyname('storeid').value := tmpqry.FieldByname('storeid').value;
      FieldByname('qua').value := 0;
      post;
      tmpQry.Next;
    end;
    tmpQry.Free;
    tmpQry := nil;
    dm.tabinItems.EnableControls  ;
    Showmessage('入货单据复制成功！请修改完后上传 ^_^');
end;

end.

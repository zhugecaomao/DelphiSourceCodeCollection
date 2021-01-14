unit ufrmOrganCertList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, StdCtrls, Buttons, DB, ADODB, CSADOQuery,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, DBCtrls, CSDBNavigator,
  CSdxDBNavigator, CSGrdColCtrl, CSdxGrdColCtrl, CSADOFilter,
  CSADOdxGrdFilter, CSDBBase, CSDBFind, CSDBdxGrdFind;

type
  TfrmOrganCertList = class(TForm)
    Panel1: TPanel;
    ImageList1: TImageList;
    Panel4: TPanel;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    Panel2: TPanel;
    bbtnFind: TBitBtn;
    bbtnFilter: TBitBtn;
    bbtnColunm: TBitBtn;
    Panel3: TPanel;
    CSdxDBNavigator1: TCSdxDBNavigator;
    ListFind: TCSDBdxGrdFind;
    ListFilter: TCSADOdxGrdFilter;
    ListColCtrl: TCSdxGrdColCtrl;
    bbtnAction: TBitBtn;
    bbtnRefresh: TBitBtn;
    List: TCSADOQuery;
    Listsysid: TStringField;
    Listcertno: TStringField;
    Listagent_name: TStringField;
    Listagent_regno: TStringField;
    Listagent_legalperson: TStringField;
    Listagent_addr: TStringField;
    Listagent_zip: TStringField;
    Listagent_tel: TStringField;
    Listagent_fax: TStringField;
    Listagent_email: TStringField;
    Listcharge_remark: TStringField;
    Listlocal_supervise_remark: TStringField;
    Listaccept_supervise_remark: TStringField;
    Listaccept_no: TStringField;
    Listaccept_type: TStringField;
    Listcom_area: TBCDField;
    Listworkshop_area: TBCDField;
    Listexposal_area: TBCDField;
    Listdesigner_num: TIntegerField;
    Listchecker_num: TIntegerField;
    Listinspector_num: TIntegerField;
    Listwelder_num: TIntegerField;
    Listother_num: TIntegerField;
    Listdesign_type: TStringField;
    Listyear_value: TBCDField;
    Listlevel1_id: TStringField;
    Listlevel1: TStringField;
    Listlevel2_id: TStringField;
    Listlevel2: TStringField;
    Listlevel3_id: TStringField;
    Listlevel3: TStringField;
    Listapply_date: TStringField;
    Listauth_date: TStringField;
    Listend_date: TStringField;
    Liststate: TStringField;
    Liststate_name: TStringField;
    Listauth_organ_sysid: TStringField;
    Listauth_organ: TStringField;
    Listremark: TStringField;
    Listd: TDataSource;
    grdList: TdxDBGrid;
    grdListsysid: TdxDBGridColumn;
    grdListcertno: TdxDBGridColumn;
    grdListagent_name: TdxDBGridColumn;
    grdListagent_regno: TdxDBGridColumn;
    grdListagent_legalperson: TdxDBGridColumn;
    grdListagent_addr: TdxDBGridColumn;
    grdListagent_zip: TdxDBGridColumn;
    grdListagent_tel: TdxDBGridColumn;
    grdListagent_fax: TdxDBGridColumn;
    grdListagent_email: TdxDBGridColumn;
    grdListcharge_remark: TdxDBGridColumn;
    grdListlocal_supervise_remark: TdxDBGridColumn;
    grdListaccept_supervise_remark: TdxDBGridColumn;
    grdListaccept_no: TdxDBGridColumn;
    grdListaccept_type: TdxDBGridColumn;
    grdListcom_area: TdxDBGridColumn;
    grdListworkshop_area: TdxDBGridColumn;
    grdListexposal_area: TdxDBGridColumn;
    grdListdesigner_num: TdxDBGridColumn;
    grdListchecker_num: TdxDBGridColumn;
    grdListinspector_num: TdxDBGridColumn;
    grdListwelder_num: TdxDBGridColumn;
    grdListother_num: TdxDBGridColumn;
    grdListdesign_type: TdxDBGridColumn;
    grdListyear_value: TdxDBGridColumn;
    grdListlevel1_id: TdxDBGridColumn;
    grdListlevel1: TdxDBGridColumn;
    grdListlevel2_id: TdxDBGridColumn;
    grdListlevel2: TdxDBGridColumn;
    grdListlevel3_id: TdxDBGridColumn;
    grdListlevel3: TdxDBGridColumn;
    grdListapply_date: TdxDBGridColumn;
    grdListauth_date: TdxDBGridColumn;
    grdListend_date: TdxDBGridColumn;
    grdListstate: TdxDBGridColumn;
    grdListstate_name: TdxDBGridColumn;
    grdListauth_organ_sysid: TdxDBGridColumn;
    grdListauth_organ: TdxDBGridColumn;
    grdListremark: TdxDBGridColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCloseClick(Sender: TObject);
    procedure bbtnFindClick(Sender: TObject);
    procedure bbtnFilterClick(Sender: TObject);
    procedure bbtnColunmClick(Sender: TObject);
    procedure bbtnActionClick(Sender: TObject);
    procedure bbtnRefreshClick(Sender: TObject);
    procedure grdListCustomDraw(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxDBTreeListColumn;
      const AText: String; AFont: TFont; var AColor: TColor; ASelected,
      AFocused: Boolean; var ADone: Boolean);
    procedure grdListChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure grdListDblClick(Sender: TObject);
  private
    Fi_ActMode: Integer;
    procedure prip_IniData;
    procedure prip_IniInterface;
    procedure prip_TakeAction;
  public
    procedure pubp_Ini(const Ai_ActMode: Integer);
  end;

var
  frmOrganCertList: TfrmOrganCertList;

implementation

uses
  udmData, CommonLib, ufrmOrganCertMng;
  
{$R *.dfm}

procedure TfrmOrganCertList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmOrganCertList.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrganCertList.bbtnFindClick(Sender: TObject);
begin
  ListFind.FindDlg;
end;

procedure TfrmOrganCertList.bbtnFilterClick(Sender: TObject);
begin
  ListFilter.FilterDlg;
end;

procedure TfrmOrganCertList.bbtnColunmClick(Sender: TObject);
begin
  with ListColCtrl do
  begin
    InitColumns;
    SetupDlg;
  end;
end;

procedure TfrmOrganCertList.bbtnActionClick(Sender: TObject);
begin
  prip_TakeAction;
end;

procedure TfrmOrganCertList.bbtnRefreshClick(Sender: TObject);
begin
  prip_IniData;
end;

procedure TfrmOrganCertList.prip_IniData;
begin
  Gp_ProgressHint('正在载入机构许可证列表，请稍候...');
  try
    with List do
    begin
      if Active then Close;
      SQL.Text := 'device.usp_getcertlist ''''';
      Open;
    end;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmOrganCertList.prip_IniInterface;
begin
  with bbtnAction do
    case Fi_ActMode of
      AM_OCMCHANGE:
        begin
          Caption := '变更';
          ImageList1.GetBitmap(0, Glyph);
        end;
      AM_OCMEXCHANGE:
        begin
          Caption := '换证';
          ImageList1.GetBitmap(1, Glyph);
        end;
      AM_OCMLOGOUT:
        begin
          Caption := '注销';
          ImageList1.GetBitmap(2, Glyph);
        end;
    end;
end;

procedure TfrmOrganCertList.prip_TakeAction;
var
  ls_CertId: string;
  lc_Arg: TStrings;
  lc_OrganCertMng: TfrmOrganCertMng;
begin
  if List.IsEmpty then Exit;

  lc_Arg := TStringList.Create;
  try
    ls_CertId := List.FieldByName('sysid').AsString;
    lc_Arg.Add(ls_CertId);
    lc_Arg.Add('');

    lc_OrganCertMng := TfrmOrganCertMng.Create(nil);
    with lc_OrganCertMng do
      try
        pubp_Ini(Fi_ActMode, lc_Arg);
        ShowModal;
        if DataModified then
        begin
          prip_IniData;
          List.Locate('sysid', ls_CertId, []);
        end;
      finally
        Free;
      end;
  finally
    lc_Arg.Free;
  end;
end;

procedure TfrmOrganCertList.pubp_Ini(const Ai_ActMode: Integer);
begin
  Fi_ActMode := Ai_ActMode;

  prip_IniData;
  prip_IniInterface;

  if MAXIMIZEMODALBYDEF then WindowState := wsMaximized;
end;

procedure TfrmOrganCertList.grdListCustomDraw(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxDBTreeListColumn; const AText: String; AFont: TFont;
  var AColor: TColor; ASelected, AFocused: Boolean; var ADone: Boolean);
var
  li_ColIndex: Integer;
begin
  if ANode.HasChildren then Exit;
  
  li_ColIndex := grdList.ColumnByFieldName('state').Index;

  if ANode.Strings[li_ColIndex] = OCS_LOGOUT then AFont.Color := CL_OCSLOGOUT;
end;

procedure TfrmOrganCertList.grdListChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
  bbtnAction.Enabled := List.FieldByName('state').AsString <> OCS_LOGOUT;
end;

procedure TfrmOrganCertList.grdListDblClick(Sender: TObject);
begin
  if bbtnAction.Enabled then prip_TakeAction;
end;

end.

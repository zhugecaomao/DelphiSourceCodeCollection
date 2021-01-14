unit ufrmPsnLcnList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, StdCtrls, Buttons, DB, ADODB, CSADOQuery,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, DBCtrls, CSDBNavigator,
  CSdxDBNavigator, CSGrdColCtrl, CSdxGrdColCtrl, CSADOFilter,
  CSADOdxGrdFilter, CSDBBase, CSDBFind, CSDBdxGrdFind;

type
  TfrmPsnLcnList = class(TForm)
    Panel1: TPanel;
    ImageList1: TImageList;
    Panel4: TPanel;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    List: TCSADOQuery;
    Listd: TDataSource;
    Panel2: TPanel;
    bbtnFind: TBitBtn;
    bbtnFilter: TBitBtn;
    bbtnColunm: TBitBtn;
    grdList: TdxDBGrid;
    Panel3: TPanel;
    CSdxDBNavigator1: TCSdxDBNavigator;
    ListFind: TCSDBdxGrdFind;
    ListFilter: TCSADOdxGrdFilter;
    ListColCtrl: TCSdxGrdColCtrl;
    bbtnAction: TBitBtn;
    bbtnRefresh: TBitBtn;
    Listsysid: TStringField;
    Listcertno: TStringField;
    Listperson_sysid: TStringField;
    Listperson_sysid_name: TStringField;
    Listlicns_category: TStringField;
    Listlicns_category_name: TStringField;
    Listlicns_kind: TStringField;
    Listlicns_kind_name: TStringField;
    Listorgan_sysid: TStringField;
    Listorgan_sysid_name: TStringField;
    Liststart_date: TStringField;
    Listend_date: TStringField;
    Liststate: TStringField;
    Liststate_name: TStringField;
    grdListsysid: TdxDBGridColumn;
    grdListcertno: TdxDBGridColumn;
    grdListperson_sysid: TdxDBGridColumn;
    grdListperson_sysid_name: TdxDBGridColumn;
    grdListlicns_category: TdxDBGridColumn;
    grdListlicns_category_name: TdxDBGridColumn;
    grdListlicns_kind: TdxDBGridColumn;
    grdListlicns_kind_name: TdxDBGridColumn;
    grdListorgan_sysid: TdxDBGridColumn;
    grdListorgan_sysid_name: TdxDBGridColumn;
    grdListstart_date: TdxDBGridColumn;
    grdListend_date: TdxDBGridColumn;
    grdListstate: TdxDBGridColumn;
    grdListstate_name: TdxDBGridColumn;
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
  frmPsnLcnList: TfrmPsnLcnList;

implementation

uses
  udmData, CommonLib, ufrmPersonlicnsMng;
  
{$R *.dfm}

procedure TfrmPsnLcnList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmPsnLcnList.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPsnLcnList.bbtnFindClick(Sender: TObject);
begin
  ListFind.FindDlg;
end;

procedure TfrmPsnLcnList.bbtnFilterClick(Sender: TObject);
begin
  ListFilter.FilterDlg;
end;

procedure TfrmPsnLcnList.bbtnColunmClick(Sender: TObject);
begin
  with ListColCtrl do
  begin
    InitColumns;
    SetupDlg;
  end;
end;

procedure TfrmPsnLcnList.bbtnActionClick(Sender: TObject);
begin
  prip_TakeAction;
end;

procedure TfrmPsnLcnList.bbtnRefreshClick(Sender: TObject);
begin
  prip_IniData;
end;

procedure TfrmPsnLcnList.prip_IniData;
begin
  Gp_ProgressHint('正在载入人员资质列表，请稍候...');
  try
    with List do
    begin
      if Active then Close;
      SQL.Text := 'device.usp_getpsnlcnslist';
      Open;
    end;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmPsnLcnList.prip_IniInterface;
begin
// Fi_ActionID = AM_PLMVIEW 1 查看；//Fi_ActionID = AM_PLMAPPL 2 申请；
  // Fi_ActionID = AM_PLMUPDA 3 变更；Fi_ActionID = AM_PLMEXCH 4 换证；
  // Fi_ActionID = AM_PLMLOGO 5 注销；Fi_ActionID = AM_PLMENAG 6 聘用情况；
  // Fi_ActionID = AM_PLMISSU 7 发证；//Fi_ActionID = AM_PLMLOGI 8 持证登记；
  with bbtnAction do
    case Fi_ActMode of
      AM_PLMUPDA:
        begin
          Caption := '变更';
          ImageList1.GetBitmap(0, Glyph);
        end;
      AM_PLMEXCH:
        begin
          Caption := '换证';
          ImageList1.GetBitmap(1, Glyph);
        end;
      AM_PLMLOGO:
        begin
          Caption := '注销';
          ImageList1.GetBitmap(2, Glyph);
        end;
      AM_PLMENGA:
        begin
          Caption := '聘用情况';
        end;
      AM_PLMISSU:
        begin
          Caption := '发证';
        end;
    end;
end;

procedure TfrmPsnLcnList.prip_TakeAction;
var
  ls_LcnId: string;
  ls_PsnId: string;
  lc_Arg: TStrings;
  lc_PersonlicnsMng: TfrmPersonlicnsMng;
begin
  if List.IsEmpty then Exit;

  lc_Arg := TStringList.Create;
  try
    ls_LcnId := List.FieldByName('sysid').AsString;
    ls_PsnId := List.FieldByName('person_sysid').AsString;
    lc_Arg.Add(ls_LcnId);
    lc_Arg.Add(ls_PsnId);

    lc_PersonlicnsMng := TfrmPersonlicnsMng.Create(nil);
    with lc_PersonlicnsMng do
      try
        pubp_Ini(Fi_ActMode, lc_Arg);
        ShowModal;
        if DataModified then
        begin
          prip_IniData;
          List.Locate('sysid', ls_LcnId, []);
        end;
      finally
        Free;
      end;
  finally
    lc_Arg.Free;
  end;
end;

procedure TfrmPsnLcnList.pubp_Ini(const Ai_ActMode: Integer);
begin
  Fi_ActMode := Ai_ActMode;

  prip_IniData;
  prip_IniInterface;

  if MAXIMIZEMODALBYDEF then WindowState := wsMaximized;
end;

procedure TfrmPsnLcnList.grdListCustomDraw(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxDBTreeListColumn; const AText: String; AFont: TFont;
  var AColor: TColor; ASelected, AFocused: Boolean; var ADone: Boolean);
var
  li_ColIndex: Integer;
begin
  if ANode.HasChildren then Exit;

  li_ColIndex := grdList.ColumnByFieldName('state').Index;

  if ANode.Strings[li_ColIndex] = PLS_LOGOUT then AFont.Color := CL_LVLOGOUT;
end;

procedure TfrmPsnLcnList.grdListChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
  bbtnAction.Enabled := List.FieldByName('state').AsString <> PLS_LOGOUT;
end;

procedure TfrmPsnLcnList.grdListDblClick(Sender: TObject);
begin
  if bbtnAction.Enabled then prip_TakeAction;
end;

end.

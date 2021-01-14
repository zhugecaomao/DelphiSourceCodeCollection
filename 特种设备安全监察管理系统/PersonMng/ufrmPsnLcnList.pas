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
    Listlicnsno: TStringField;
    Listperson_sysid: TStringField;
    Listperson_name: TStringField;
    Listlicns_kind_code: TStringField;
    Listlicns_kind_name: TStringField;
    Listlicns_category_code: TStringField;
    Listlicns_category_name: TStringField;
    Listorgan_sysid: TStringField;
    Listorgan_sysid_name: TStringField;
    Listissue_date: TStringField;
    Listlicns_state: TStringField;
    Listlicns_state_name: TStringField;
    grdListsysid: TdxDBGridMaskColumn;
    grdListlicnsno: TdxDBGridMaskColumn;
    grdListperson_sysid: TdxDBGridMaskColumn;
    grdListperson_name: TdxDBGridMaskColumn;
    grdListlicns_kind_code: TdxDBGridMaskColumn;
    grdListlicns_kind_name: TdxDBGridMaskColumn;
    grdListlicns_category_code: TdxDBGridMaskColumn;
    grdListlicns_category_name: TdxDBGridMaskColumn;
    grdListorgan_sysid: TdxDBGridMaskColumn;
    grdListorgan_sysid_name: TdxDBGridMaskColumn;
    grdListissue_date: TdxDBGridMaskColumn;
    grdListlicns_state: TdxDBGridMaskColumn;
    grdListlicns_state_name: TdxDBGridMaskColumn;
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
    procedure grdListDblClick(Sender: TObject);
    procedure ListAfterScroll(DataSet: TDataSet);
  private
    Fb_DataModified: Boolean;
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
      SQL.Text := 'device.usp_getpsnlicns ''''';
      Open;
    end;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmPsnLcnList.prip_IniInterface;
begin
  with bbtnAction do
    case Fi_ActMode of
      AM_PLMUPDA:   //项目变更
        begin
          Caption := '项目变更';
          ImageList1.GetBitmap(0, Glyph);
        end;
      AM_PLMLOGO:   //证书吊销
        begin
          Caption := '吊销证书';
          ImageList1.GetBitmap(2, Glyph);
        end;
      AM_PLMENGA:   //聘用情况
        begin
          Caption := '聘用情况';
        end;
      AM_PLMISSU:   //项目审批
        begin
          Caption := '项目审批';
        end;
      AM_PLMAPPL:   //项目申请
        begin
          Caption := '取项申请';
        end;
      AM_PLMLOGI:   //持证登记
        begin
          Caption := '持证登记';
        end;
      AM_PLMCHEC:   //项目审查
        begin
          Caption := '审查备案';
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
        if Fb_DataModified then
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

  li_ColIndex := grdList.ColumnByFieldName('licns_state').Index;

  if ANode.Strings[li_ColIndex] = PLS_LICNSKILL then AFont.Color := CL_OCSLOGOUT;
end;

procedure TfrmPsnLcnList.grdListDblClick(Sender: TObject);
begin
  if bbtnAction.Enabled then prip_TakeAction;
end;

procedure TfrmPsnLcnList.ListAfterScroll(DataSet: TDataSet);
begin
  bbtnAction.Enabled := List.FieldByName('licns_state').AsString <> PLS_LICNSKILL;
end;

end.

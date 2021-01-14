unit ufrmContentTemplet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, ADODB, CSADOQuery, CSScrCtrlChild, CSBarMDIChild,
  CSDBBase, CSDBFind, ImgList, DBCtrls, CSDBNavigator, StdCtrls, Buttons,
  ExtCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, dxtree, dxdbtree,
  dxDBTLCl, dxGrClms;

type
  TfrmContentTemplet = class(TForm)
    Panel2: TPanel;
    bbtnFind: TBitBtn;
    Panel4: TPanel;
    navbasedata: TCSDBNavigator;
    bbtnInsert: TBitBtn;
    bbtnDelete: TBitBtn;
    Panel1: TPanel;
    Panel5: TPanel;
    bbtnPrint: TBitBtn;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    ImageList: TImageList;
    CategoryFind: TCSDBFind;
    CSBarMDIChild1: TCSBarMDIChild;
    ScrChild: TCSScrCtrlChild;
    dataGrid: TCSADOQuery;
    Temp: TCSADOQuery;
    dataOrgCert: TCSADOQuery;
    dataSOrgCert: TDataSource;
    dataSGrid: TDataSource;
    baseMagPageCrt: TPageControl;
    TabSheet1: TTabSheet;
    Splitter1: TSplitter;
    tvOrgCert: TdxDBTreeView;
    GroupBox1: TGroupBox;
    TabSheet2: TTabSheet;
    DBGridsuprtemp: TdxDBGrid;
    datasuprtemp: TCSADOQuery;
    DataSsuprtemp: TDataSource;
    datasuprtempsysid: TStringField;
    datasuprtempexam_content: TStringField;
    dataGridsysid: TStringField;
    dataGridlevel1_id: TStringField;
    dataGridlevel2_id: TStringField;
    dataGridlevel3_id: TStringField;
    dataGridsegment: TStringField;
    dataGridchapter: TStringField;
    dataGriditem: TStringField;
    dataGridrequirement: TStringField;
    dataGridexamination: TStringField;
    dataGridestimate: TStringField;
    dataGridoutflag: TIntegerField;
    dataOrgCertid: TStringField;
    dataOrgCertparent_id: TStringField;
    dataOrgCertcode: TStringField;
    dataOrgCertname: TStringField;
    dataOrgCerttech_param: TStringField;
    dataOrgCertauth_unit: TStringField;
    dataOrgCertcode_level: TStringField;
    dataOrgCertoutflag: TIntegerField;
    datasuprtempcodeno: TIntegerField;
    datasuprtempoutflag: TIntegerField;
    DBGridsuprtempsysid: TdxDBGridMaskColumn;
    DBGridsuprtempcodeno: TdxDBGridMaskColumn;
    DBGridsuprtempexam_content: TdxDBGridMemoColumn;
    DBGridsuprtempoutflag: TdxDBGridMaskColumn;
    dataGridrec_no: TIntegerField;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1sysid: TdxDBGridMaskColumn;
    dxDBGrid1level1_id: TdxDBGridMaskColumn;
    dxDBGrid1level2_id: TdxDBGridMaskColumn;
    dxDBGrid1level3_id: TdxDBGridMaskColumn;
    dxDBGrid1rec_no: TdxDBGridMaskColumn;
    dxDBGrid1segment: TdxDBGridMaskColumn;
    dxDBGrid1chapter: TdxDBGridMaskColumn;
    dxDBGrid1item: TdxDBGridMaskColumn;
    dxDBGrid1requirement: TdxDBGridMemoColumn;
    dxDBGrid1examination: TdxDBGridMaskColumn;
    dxDBGrid1estimate: TdxDBGridMaskColumn;
    dxDBGrid1outflag: TdxDBGridMaskColumn;
    procedure bbtnCloseClick(Sender: TObject);
    procedure tvOrgCertChange(Sender: TObject; Node: TTreeNode);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvOrgCertGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure tvOrgCertGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure tvOrgCertDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure bbtnInsertClick(Sender: TObject);
    procedure bbtnDeleteClick(Sender: TObject);
    procedure baseMagPageCrtChange(Sender: TObject);
    procedure dataGridBeforePost(DataSet: TDataSet);
    procedure datasuprtempBeforePost(DataSet: TDataSet);
    procedure baseMagPageCrtChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    //OrgReqDBGrid.OptionsBehavior := [edgoAutoSort,edgoDragScroll,
    //edgoEnterShowEditor,edgoImmediateEditor,edgoTabThrough,edgoVertThrough];
    { Private declarations }
    f_PageSaved : Boolean;
    f_unite : Boolean;
    vLicCode : string;
    procedure Pri_GridDel(vDataSet: TCSADOQuery);
    procedure pri_GridInsert(vDataSet: TCSADOQuery);
    procedure BMagPageCrtChange(vData : TCSADOQuery;
      vDataS: TDataSource; vTable : String);
    function Pri_CountId :string;
  public
    { Public declarations }
    procedure pubp_Ini(const Ab_FirstRun: Boolean);

  end;

var
  frmContentTemplet: TfrmContentTemplet;

implementation

uses
	CSDBUtils, CSVCLUtils, udmData, CommonLib;
{$R *.dfm}

procedure TfrmContentTemplet.bbtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmContentTemplet.pubp_Ini(const Ab_FirstRun: Boolean);
begin
  ScrChild.SetSecurity(Self);
  if Ab_FirstRun then
  begin
    Gp_ProgressHint(Format('正在打开%s，请稍候...', [Caption]));
    try
      baseMagPageCrt.ActivePageIndex := 0;
      with dataOrgCert do
      begin
        if Active then Close;
        SQL.Text := 'select * from device.code_organ_cert where code_level < 4 ';
        Open;
        First;
      end;
      FormStyle := fsMDIChild;
      if MAXIMIZEDBYDEFAULT then WindowState := wsMaximized else ClientTile(Self);
      f_PageSaved := true ;
      f_unite := False;
      navbasedata.DataSource := dataSGrid;
      CategoryFind.DataSet := dataOrgCert;
    finally
      Gp_ProgressHint;
    end;
  end else Show;
end;

// 必备条件

procedure TfrmContentTemplet.tvOrgCertChange(Sender: TObject;
  Node: TTreeNode);
var
  vCode : String;
begin
  if not dataOrgCert.Fieldbyname('id').Isnull  then
    vLicCode := VarToStr(dataOrgCert.FieldValues['id']);
    case node.Level of
    0: vCode := vLicCode;
    1: vCode := dataOrgCert.FieldValues['parent_id'];
    2:
      begin
        with temp do
        begin
          if Active then Close;
          SQL.Text := Format('select * from device.code_organ_cert ' +
            'where id = ''%s''',[dataOrgCert.FieldValues['parent_id']]);
          open;
          if not IsEmpty then vCode := FieldValues['parent_id'];
         end;
      end;
    end;
  with dataGrid do
  begin

    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.organ_requirement_templet ' +
      'where level1_id = ''%s''', [vCode]);
    Open;

  end;
end;

procedure TfrmContentTemplet.tvOrgCertGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
	Node.ImageIndex := Node.Level;
end;

procedure TfrmContentTemplet.tvOrgCertGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.Level;
end;

procedure TfrmContentTemplet.tvOrgCertDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
    Accept := false;
end;


procedure TfrmContentTemplet.dataGridBeforePost(DataSet: TDataSet);
var
  vtStr : string;
begin
  with DataSet do
  begin
    vtStr := Trim(vartostr(FieldValues['segment'])) +
      Trim(vartostr(FieldValues['chapter'])) +
      Trim(vartostr(FieldValues['item'])) +
      Trim(vartostr(FieldValues['requirement'])) +
      Trim(vartostr(FieldValues['examination'])) +
      Trim(vartostr(FieldValues['estimate']));
  end;
    if vtStr = '' then
    begin
      Application.MessageBox('数据项不能都为空！', PChar(Caption),
        MB_OK + MB_ICONWARNING);
      Abort;
    end;
end;

procedure TfrmContentTemplet.datasuprtempBeforePost(DataSet: TDataSet);
begin
   if Trim(datasuprtemp.FieldValues['exam_content']) = '' then
    begin
      Application.MessageBox('数据项不能为空！', PChar(Caption),
        MB_OK + MB_ICONWARNING);
      Abort;
    end;
end;


//关闭操作
procedure TfrmContentTemplet.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CheckDBState(Self, True, [dataOrgCert]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [dataGrid]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datasuprtemp]) in CDS_STOP then CanClose := False;
end;

procedure TfrmContentTemplet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmContentTemplet := nil;
end;



//ID号算法

function TfrmContentTemplet.Pri_CountId :string;
var
  vtId : string;
  vtLen, vt_i ,i: integer;
  vtTable : string;
begin
  case baseMagPageCrt.ActivePage.TabIndex of
    0: vtTable := 'organ_requirement_templet';
    1: vtTable := 'supr_exam_template';
  end;
  Result := '';
  with temp do
  begin
    if Active then close;
    SQL.Text := Format('SELECT * FROM device.%s ORDER BY sysid',[vtTable]);
    Open;
    Last;
    vtId := copy(temp.FieldValues['sysid'],4,17);
    vtLen := Length(vtId);
    Result := inttostr(strtoint(vtId)+1);
    vt_i := vtLen - Length(Result);
    if vt_i >0 then
      for i:=1 to vt_i do
        Result := '0' + Result;
    Result := 'SUZ' + Result;
    exit;
  end;
end;

// 插入操作
procedure TfrmContentTemplet.bbtnInsertClick(Sender: TObject);
begin
   case baseMagPageCrt.ActivePage.TabIndex of
   0: pri_GridInsert (dataGrid);
   1: pri_GridInsert (datasuprtemp);
   end;
end;

procedure TfrmContentTemplet.pri_GridInsert (vDataSet: TCSADOQuery);
begin
  with vDataSet do
  begin
    Append;
    FieldValues['sysid'] := Pri_CountId;
    if baseMagPageCrt.ActivePage.TabIndex = 0 then
      FieldByName('level1_id').Value := vLicCode;
    FieldByName('outflag').Value := 1;
  end;
end;


//删除操作

procedure TfrmContentTemplet.bbtnDeleteClick(Sender: TObject);
begin
   case baseMagPageCrt.ActivePage.TabIndex of
   0: Pri_GridDel (dataGrid);
   1: Pri_GridDel (datasuprtemp);
   end;
end;

procedure TfrmContentTemplet.Pri_GridDel(vDataSet: TCSADOQuery);
begin
  with  vDataSet do
    case Application.MessageBox('是否确定删除选定代码?', PChar(Caption),
      MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONQUESTION) of
      IDOK	:
      begin
        vDataSet.Delete;
      end;
      IDCANCEL : Abort;
    end;
end;

 //页面转换
procedure TfrmContentTemplet.baseMagPageCrtChange(Sender: TObject);
begin
   case baseMagPageCrt.ActivePage.TabIndex of
   0: BMagPageCrtChange (dataGrid,dataSGrid,'organ_requirement_templet');
   1: BMagPageCrtChange (datasuprtemp,DataSsuprtemp,'supr_exam_template');
   end;
end;

procedure TfrmContentTemplet.BMagPageCrtChange(vData : TCSADOQuery;
      vDataS: TDataSource; vTable : String);
begin
  Screen.Cursor := crHourGlass;
  with vData do
  begin
   if not Active then
   begin
    SQL.Text := Format('SELECT * FROM device.%s',[vTable]);
    Open;
   end;
  end;
   case baseMagPageCrt.ActivePage.TabIndex of
    0:dataOrgCert.First;
   end;
   navbasedata.DataSource := vDataS;
   CategoryFind.DataSet := vData;
   Screen.Cursor := crDefault;
end;


procedure TfrmContentTemplet.baseMagPageCrtChanging(Sender: TObject;
  var AllowChange: Boolean);
var
  vDataSet : TCSADOQuery;
begin
  case baseMagPageCrt.ActivePageIndex  of
    0: vDataSet := dataGrid;
    1: vDataSet := datasuprtemp;
    else vDataSet := nil;
  end;

  if  vDataSet.State <> dsBrowse then
  begin
    case Application.MessageBox('是否保存当前修改代码?', PChar(Caption),
      MB_YESNOCANCEL + MB_DEFBUTTON1 + MB_ICONQUESTION) of
      IDYES	:
      begin
        vDataSet.Post;
      end;
      IDNO : vDataSet.Cancel;
      IDCANCEL : f_PageSaved := False;
    end;
    AllowChange := f_PageSaved;
  end;

end;

end.

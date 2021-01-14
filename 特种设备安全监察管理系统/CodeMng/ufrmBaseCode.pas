unit ufrmBaseCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, Grids, DBGridEh, ExtCtrls, ComCtrls,
  DB, ADODB, CSADOQuery, DBCtrls, CSDBNavigator, Buttons, ImgList,
  CSDBBase, CSDBFind, CSBarMDIChild, dxtree, dxdbtree, CSPrgViewer,
  CSScrCtrlChild;

type
  TfrmBaseCode = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    bbtnPrint: TBitBtn;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    Panel2: TPanel;
    bbtnFind: TBitBtn;
    Panel4: TPanel;
    navbasedata: TCSDBNavigator;
    bbtnInsert: TBitBtn;
    bbtnDelete: TBitBtn;
    dataOrgKind: TCSADOQuery;
    dataArea: TCSADOQuery;
    dataNation: TCSADOQuery;
    dataDegree: TCSADOQuery;
    dataWokInfo: TCSADOQuery;
    dataXl: TCSADOQuery;
    DataSArea: TDataSource;
    DataSOrgKind: TDataSource;
    DataSNation: TDataSource;
    DataSWokInfo: TDataSource;
    DataSXl: TDataSource;
    DataSDegree: TDataSource;
    baseMagPageCrt: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    CSBarMDIChild1: TCSBarMDIChild;
    CategoryFind: TCSDBFind;
    ImageList: TImageList;
    dataSex: TCSADOQuery;
    DataSSex: TDataSource;
    dataMarry: TCSADOQuery;
    DataSMarry: TDataSource;
    dataAreaid: TStringField;
    dataAreaparent_id: TStringField;
    dataAreaname: TStringField;
    dataAreacode: TStringField;
    dataAreadm: TStringField;
    dataAreaoutflag: TIntegerField;
    dataOrgKindid: TStringField;
    dataOrgKindparent_id: TStringField;
    dataOrgKindname: TStringField;
    dataOrgKindcode: TStringField;
    dataOrgKindoutflag: TIntegerField;
    dataNationid: TStringField;
    dataNationcode: TStringField;
    dataNationname: TStringField;
    dataNationpingyin: TStringField;
    dataNationpingyincode: TStringField;
    dataNationoutflag: TIntegerField;
    dataXlid: TStringField;
    dataXlparent_id: TStringField;
    dataXlcode: TStringField;
    dataXlname: TStringField;
    dataXloutflag: TIntegerField;
    dataDegreeid: TStringField;
    dataDegreeparent_id: TStringField;
    dataDegreecode: TStringField;
    dataDegreename: TStringField;
    dataDegreeoutflag: TIntegerField;
    dataSexid: TStringField;
    dataSexcode: TStringField;
    dataSexname: TStringField;
    dataSexoutflag: TIntegerField;
    dataMarryid: TStringField;
    dataMarrycode: TStringField;
    dataMarryname: TStringField;
    dataMarryoutflag: TIntegerField;
    Temp: TCSADOQuery;
    dataWokInfoid: TStringField;
    dataWokInfocode: TStringField;
    dataWokInfoname: TStringField;
    dataWokInfooutflag: TIntegerField;
    dataAreacode_level: TStringField;
    dataOrgKindcode_level: TStringField;
    dataXlcode_level: TStringField;
    dataDegreecode_level: TStringField;
    DBGridWokInfo: TDBGridEh;
    Splitter4: TSplitter;
    ScrollBox4: TScrollBox;
    Label9: TLabel;
    Label1: TLabel;
    WokInfo_name: TDBEditEh;
    WokInfo_code: TDBEditEh;
    ScrollBox6: TScrollBox;
    Label3: TLabel;
    Label4: TLabel;
    OrgType_code: TDBEditEh;
    OrgType_name: TDBEditEh;
    tvOrgKind: TdxDBTreeView;
    Splitter6: TSplitter;
    DBGridNation: TDBGridEh;
    Splitter5: TSplitter;
    ScrollBox5: TScrollBox;
    Label6: TLabel;
    Label7: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    nation_code: TDBEditEh;
    nation_name: TDBEditEh;
    nation_pingy: TDBEditEh;
    nation_pingydm: TDBEditEh;
    ScrollBox8: TScrollBox;
    Label2: TLabel;
    Label5: TLabel;
    Label14: TLabel;
    e_code: TDBEditEh;
    e_name: TDBEditEh;
    e_dm: TDBEditEh;
    Splitter7: TSplitter;
    tvArea: TdxDBTreeView;
    tvXl: TdxDBTreeView;
    Splitter3: TSplitter;
    ScrollBox3: TScrollBox;
    Label10: TLabel;
    Label11: TLabel;
    xl_code: TDBEditEh;
    xl_name: TDBEditEh;
    tvDegree: TdxDBTreeView;
    Splitter2: TSplitter;
    ScrollBox2: TScrollBox;
    Label12: TLabel;
    Label13: TLabel;
    degree_code: TDBEditEh;
    degree_name: TDBEditEh;
    DBGridSex: TDBGridEh;
    Splitter1: TSplitter;
    ScrollBox1: TScrollBox;
    Label15: TLabel;
    Label16: TLabel;
    Sex_code: TDBEditEh;
    Sex_name: TDBEditEh;
    DBGridMarry: TDBGridEh;
    Splitter8: TSplitter;
    ScrollBox7: TScrollBox;
    Label17: TLabel;
    Label18: TLabel;
    marry_code: TDBEditEh;
    marry_name: TDBEditEh;
    ScrChild: TCSScrCtrlChild;
    procedure tvAreaChange(Sender: TObject; Node: TTreeNode);
    procedure tvAreaGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure tvAreaGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure baseMagPageCrtChange(Sender: TObject);
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tvOrgKindGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure tvOrgKindGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure tvXlGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure tvXlGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure tvDegreeGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure tvDegreeGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure bbtnInsertClick(Sender: TObject);
    procedure dataAreaAfterPost(DataSet: TDataSet);
    procedure dataAreaBeforePost(DataSet: TDataSet);
    procedure dataOrgKindBeforePost(DataSet: TDataSet);
    procedure dataXlBeforePost(DataSet: TDataSet);
    procedure dataDegreeBeforePost(DataSet: TDataSet);
    procedure dataOrgKindAfterPost(DataSet: TDataSet);
    procedure dataXlAfterPost(DataSet: TDataSet);
    procedure dataDegreeAfterPost(DataSet: TDataSet);
    procedure baseMagPageCrtChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure tvOrgKindChange(Sender: TObject; Node: TTreeNode);
    procedure tvXlChange(Sender: TObject; Node: TTreeNode);
    procedure bbtnDeleteClick(Sender: TObject);
    procedure dataNationBeforePost(DataSet: TDataSet);
    procedure dataWokInfoBeforePost(DataSet: TDataSet);
    procedure dataSexBeforePost(DataSet: TDataSet);
    procedure dataMarryBeforePost(DataSet: TDataSet);
    procedure dataNationAfterScroll(DataSet: TDataSet);
    procedure dataWokInfoAfterScroll(DataSet: TDataSet);
    procedure dataSexAfterScroll(DataSet: TDataSet);
    procedure dataMarryAfterScroll(DataSet: TDataSet);
    procedure tvAreaDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvOrgKindDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvXlDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvDegreeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure bbtnFindClick(Sender: TObject);
  private
    { Private declarations }
    f_PageSaved : Boolean;
    f_unite : Boolean;
    vun_Id,vun_Par,vun_Name : string;
    procedure  Pri_unite (vDataSet: TCSADOQuery; Un_Table : string);
    procedure  Pri_GetUnTvInfo (vDataSet: TCSADOQuery; Un_Table : string);
    function prif_CheckBlank(vDataSet: TCSADOQuery;
      Ac_Fields: array of TField) : Boolean;
    procedure pri_GridInsert(vDataSet: TCSADOQuery);
    procedure BMagPageCrtChange(vData : TCSADOQuery;
      vDataS: TDataSource; vTable : String);
    function Pri_CountId :string;

    procedure Pri_TypeInsert(var vDataSet: TCSADOQuery;
      maxLevel: integer);
    function prif_Checkrepeat(Ch_code : String; vTable : String ;
      vId : String): Boolean;
  public
    { Public declarations }
    procedure pubp_Ini(const Ab_FirstRun: Boolean);
  end;

var
  frmBaseCode: TfrmBaseCode;

implementation

uses
	CSDBUtils, CSVCLUtils, udmData, CommonLib;

{$R *.dfm}

//初始化
procedure TfrmBaseCode.pubp_Ini(const Ab_FirstRun: Boolean);
begin
  ScrChild.SetSecurity(Self);
  if Ab_FirstRun then
  begin
    Gp_ProgressHint(Format('正在打开%s，请稍候...', [Caption]));
    try
      baseMagPageCrt.ActivePageIndex := 0;
      with dataArea do
      begin
        if Active then Close;
        SQL.Text := 'SELECT * FROM device.code_area';
        Open;
      end;
      FormStyle := fsMDIChild;
      if MAXIMIZEDBYDEFAULT then WindowState := wsMaximized else ClientTile(Self);
      f_PageSaved := true ;
      f_unite := False;
      navbasedata.DataSource := DataSArea;
      CategoryFind.DataSet := DataArea;
    finally
      Gp_ProgressHint;
    end;
  end else Show;

end;

//地区代码

procedure TfrmBaseCode.tvAreaChange(Sender: TObject; Node: TTreeNode);
begin
    f_PageSaved := True ;
    bbtnDelete.Enabled := False;
    if node.Level > 0 then bbtnDelete.Enabled := True;
    if f_unite then Pri_unite(dataArea,'code_area');
end;

procedure TfrmBaseCode.tvAreaGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
	Node.ImageIndex := Node.Level;
end;

procedure TfrmBaseCode.tvAreaGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.Level;
end;

procedure TfrmBaseCode.dataAreaBeforePost(DataSet: TDataSet);
begin
with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_area',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(dataArea,
      [FieldByName('code'), FieldByName('name')]) then Abort;
    Screen.Cursor := crHourGlass;
  end;
end;

procedure TfrmBaseCode.dataAreaAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
  tvArea.RefreshItems;
  Screen.Cursor := crDefault;
end;


//单位性质
procedure TfrmBaseCode.tvOrgKindGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
	Node.ImageIndex := Node.Level;
end;

procedure TfrmBaseCode.tvOrgKindGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.Level;
end;

procedure TfrmBaseCode.dataOrgKindBeforePost(DataSet: TDataSet);
begin
with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_organ_type',
      FieldValues['id']) then Abort;
    if not prif_CheckBlank(dataOrgKind,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;

end;

procedure TfrmBaseCode.dataOrgKindAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
  tvOrgKind.RefreshItems;
end;

procedure TfrmBaseCode.tvOrgKindChange(Sender: TObject;
  Node: TTreeNode);
begin
  bbtnDelete.Enabled := False;
  if node.Level > 0 then bbtnDelete.Enabled := True;
  if f_unite then Pri_unite(dataOrgKind,'code_organ_type');
end;

//民族代码

procedure TfrmBaseCode.dataNationBeforePost(DataSet: TDataSet);
begin
with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_nation',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(dataNation,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmBaseCode.dataNationAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(dataNation,'code_nation');
end;


//在职情况

procedure TfrmBaseCode.dataWokInfoBeforePost(DataSet: TDataSet);
begin
with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_work_info',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(dataWokInfo,
      [FieldByName('code'),FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmBaseCode.dataWokInfoAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(dataWokInfo,'code_work_info');
end;

//学历代码

procedure TfrmBaseCode.tvXlGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
	Node.ImageIndex := Node.Level;
end;

procedure TfrmBaseCode.tvXlGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.Level;
end;

procedure TfrmBaseCode.dataXlBeforePost(DataSet: TDataSet);
begin
with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'], 'code_xl',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(dataXl,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;

end;

procedure TfrmBaseCode.dataXlAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
  tvXl.RefreshItems;
end;

procedure TfrmBaseCode.tvXlChange(Sender: TObject; Node: TTreeNode);
begin
  if node.Level > 0 then bbtnDelete.Enabled := True;
  if f_unite then Pri_unite(dataxl,'code_xl');
end;

///学位代码

procedure TfrmBaseCode.tvDegreeGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
	Node.ImageIndex := Node.Level;
end;

procedure TfrmBaseCode.tvDegreeGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.Level;
end;

procedure TfrmBaseCode.dataDegreeBeforePost(DataSet: TDataSet);
begin
with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_degree',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(dataDegree,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmBaseCode.dataDegreeAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
  tvDegree.RefreshItems;
end;


//性别代码

procedure TfrmBaseCode.dataSexBeforePost(DataSet: TDataSet);
begin
with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_sex',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(dataSex,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmBaseCode.dataSexAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(dataSex,'code_sex');
end;

//婚姻代码

procedure TfrmBaseCode.dataMarryBeforePost(DataSet: TDataSet);
begin
with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_marry',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(dataMarry,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmBaseCode.dataMarryAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(dataMarry,'code_marry');
end;
//公用

procedure TfrmBaseCode.baseMagPageCrtChange(Sender: TObject);
var vPagIndex : integer;
begin
  vPagIndex := baseMagPageCrt.ActivePage.TabIndex;
  f_unite := False;
  case vPagIndex of
    0: BMagPageCrtChange(dataArea,DataSArea,'code_area');
    1: BMagPageCrtChange(dataOrgKind,DataSOrgKind,'code_organ_type');
    2: BMagPageCrtChange(dataNation,DataSNation,'code_nation');
    3: BMagPageCrtChange(dataWokInfo,DataSWokInfo,'code_work_info');
    4: BMagPageCrtChange(dataXl,DatasXl,'code_xl');
    5: BMagPageCrtChange(dataDegree,DataSDegree,'code_degree');
    6: BMagPageCrtChange(dataSex,DataSSex,'code_sex');
    7: BMagPageCrtChange(dataMarry,DataSMarry,'code_marry');
  end;
end;

procedure TfrmBaseCode.BMagPageCrtChange(vData : TCSADOQuery;
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
      2,3,6,7:bbtnDelete.Enabled := True;
    end;
    navbasedata.DataSource := vDataS;
    CategoryFind.DataSet := vData;
    Screen.Cursor := crDefault;
end;

procedure TfrmBaseCode.bbtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmBaseCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmBaseCode := nil;
end;

procedure TfrmBaseCode.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CheckDBState(Self, True, [dataArea]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [dataOrgKind]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [dataNation]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [dataWokInfo]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [dataXl]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [dataDegree]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [dataSex]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [dataMarry]) in CDS_STOP then CanClose := False;
end;

function TfrmBaseCode.Pri_CountId :string;
var
  vtId, vtTable : string;
  vtLen, vt_i ,i: integer;
begin
  case baseMagPageCrt.ActivePage.TabIndex of
    0: vtTable := 'code_area';
    1: vtTable := 'code_organ_type';
    2: vtTable := 'code_nation';
    3: vtTable := 'code_work_info';
    4: vtTable := 'code_xl';
    5: vtTable := 'code_degree';
    6: vtTable := 'code_sex';
    7: vtTable := 'code_marry';
  end;
  Result := '';
  with temp do
  begin
    if Active then close;
    SQL.Text := Format('SELECT * FROM device.%s order by id',[vtTable]);
    Open;
    Last;
    vtId := temp.FieldValues['id'];
    vtLen := Length(vtId);
    Result := inttostr(strtoint(vtId)+1);
    vt_i := vtLen - Length(Result);
    if vt_i >0 then
      for i:=1 to vt_i do
        Result := '0' + Result;
    exit;
  end;
end;

procedure TfrmBaseCode.bbtnInsertClick(Sender: TObject);
begin
    case baseMagPageCrt.ActivePageIndex  of
    0: Pri_TypeInsert(dataArea,3);
    1: Pri_TypeInsert(dataOrgKind,3);
    2: pri_GridInsert(dataNation);
    3: pri_GridInsert(dataWokInfo);
    4: Pri_TypeInsert(dataXl,2);
    5: Pri_TypeInsert(dataDegree,2);
    6: pri_GridInsert(dataSex);
    7: pri_GridInsert(dataMarry);
    end;
end;

//地区、单位性质，学级，学历插入过程
procedure TfrmBaseCode.Pri_TypeInsert(var vDataSet: TCSADOQuery;
  maxLevel: integer);
var
  vParID, vId, vNewId, vLevel :string;
begin
  Screen.Cursor := crHourGlass;
  with vDataSet do
  begin
    vId := FieldValues['id'];
    vLevel := FieldValues['code_level'];
    vParID := FieldValues['parent_id'];
    vNewId := Pri_CountId;
    Insert;
    FieldValues['id'] := vNewId;
    FieldValues['outflag'] := 1;
    if StrToInt(vLevel) = maxLevel then
      begin
        FieldValues['parent_id'] := vParID;
        FieldValues['code_level'] := vLevel;
      end else
      begin
        FieldValues['parent_id'] := vId;
        FieldValues['code_level'] := inttostr(strtoint(vLevel) + 1);
      end;
  end;
  f_PageSaved := False;
  Screen.Cursor := crDefault;
end;

//民族、在职、性别、婚姻插入过程
procedure TfrmBaseCode.pri_GridInsert(vDataSet: TCSADOQuery);
begin
  with vDataSet do
  begin
    vDataSet.Append;
    FieldValues['id'] := Pri_CountId;
    FieldValues['outflag'] := 1;
    f_PageSaved := False;
  end;
end;

function TfrmBaseCode.prif_CheckBlank(vDataSet: TCSADOQuery;
  Ac_Fields: array of TField) : Boolean;
var
  li_i: integer;
begin
  Result := True;
  with vDataSet do
		for li_i := 0 to Length(Ac_Fields) - 1 do
      if Trim(VarToStr(Ac_Fields[li_i].Value)) = '' then
      begin
        Result := False;
        Application.MessageBox(PChar(Ac_Fields[li_i].DisplayLabel +
          '该项不能为空。'), PChar(Caption), MB_OK + MB_ICONWARNING);
        Ac_Fields[li_i].FocusControl;
        Exit;
      end;
end;


procedure TfrmBaseCode.baseMagPageCrtChanging(Sender: TObject;
  var AllowChange: Boolean);
var
  vDataSet : TCSADOQuery;
begin
  case baseMagPageCrt.ActivePageIndex  of
    0: vDataSet := DataArea;
    1: vDataSet := dataOrgKind;
    2: vDataSet := dataNation;
    3: vDataSet := dataWokInfo;
    4: vDataSet := dataXl;
    5: vDataSet := dataDegree;
    6: vDataSet := dataSex;
    7: vDataSet := dataMarry;
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


//合并

procedure TfrmBaseCode.bbtnDeleteClick(Sender: TObject);
begin
  case baseMagPageCrt.ActivePageIndex of
  0: Pri_GetUnTvInfo(dataArea,'code_area');
  1: Pri_GetUnTvInfo(dataOrgKind,'code_organ_type');
  4: Pri_GetUnTvInfo(dataXl, 'code_xl');
  5: Pri_GetUnTvInfo(dataDegree, 'code_degree');
  2: Pri_GetUnTvInfo(dataNation, 'code_nation');
  3: Pri_GetUnTvInfo(dataWokInfo, 'code_work_info');
  6: Pri_GetUnTvInfo(dataSex, 'code_sex');
  7: Pri_GetUnTvInfo(dataMarry, 'code_marry');
  end;

end;

procedure  TfrmBaseCode.Pri_GetUnTvInfo (vDataSet: TCSADOQuery;
  Un_Table : string);
begin
  with vDataSet do
  begin
    vun_Id := FieldValues['id'];
    vun_Name := FieldValues['name'];
    case baseMagPageCrt.ActivePageIndex of
    0,1,4,5:
      begin
        if temp.Active then temp.Close;
        temp.SQL.Text := Format('select * from device.%s where parent_id = %s',
          [Un_Table, vun_id]);
        temp.Open;
        if not temp.IsEmpty then
        begin
          Application.MessageBox('该项数据包含子项，不能合并！',PChar(Caption),
            MB_OK + MB_ICONWARNING);
          Exit;
        end;
        vun_Par := FieldValues['parent_id'];
      end;
    end;
  end;
  f_unite := True;
  Application.MessageBox(PChar('请选择将’' + vun_Name +
    ' ’并入的目标代码。'),PChar(Caption),MB_OK + MB_ICONQUESTION);
end;

procedure  TfrmBaseCode.Pri_unite (vDataSet: TCSADOQuery; Un_Table : string);
var
  vEnd_id,vEnd_Par,vEnd_Name : string;
  f_isTv : Boolean;
begin
  f_isTv := False;
  case baseMagPageCrt.ActivePageIndex of
    0,1,4,5: f_isTv := True;
  end;
  with vDataSet do
  begin
    f_unite := False;
    vEnd_id := FieldValues['id'];
    vEnd_name := FieldValues['name'];
    if Application.MessageBox(PChar('确定将’ ' + vun_Name +' ’代码并入代码’ '
      + vEnd_Name + ' ’？'), PChar(Caption),MB_OKCANCEL	 +
      MB_DEFBUTTON2 + MB_ICONQUESTION) = IDOK	then
    begin
      Screen.Cursor := crHourGlass;
      vDataSet.DisableControls ;
      try
        if f_isTv then
          vEnd_Par := FieldValues['parent_id'];
        if Locate('id', vun_id, [loCaseInsensitive]) then
          Delete;
        if f_isTv then
          dmData.adocon.Execute(format('update device.%s set parent_id = ''%s''' +
            ' where parent_id = ''%s''',[Un_Table, vEnd_id, vun_id]));
      finally
        Refresh;
        Locate('id', vEnd_id, [loCaseInsensitive]);
        vDataSet.EnableControls;
        Screen.Cursor := crDefault;
      end;
    end else
    begin
      vEnd_id :='';
      vEnd_name :='';
      vun_Id :='';
    end;
  end;
end;


procedure TfrmBaseCode.tvAreaDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
end;

procedure TfrmBaseCode.tvOrgKindDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
end;

procedure TfrmBaseCode.tvXlDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
end;

procedure TfrmBaseCode.tvDegreeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
end;


procedure TfrmBaseCode.bbtnFindClick(Sender: TObject);
begin
  CategoryFind.FindDlg;
end;


function TfrmBaseCode.prif_Checkrepeat(Ch_code : String;
  vTable : String ; vId : String): Boolean;
var
  vName : string;
begin
  Result := True;
  with temp do
  begin
    if Active then Close;
    Ch_code := Trim(Ch_code);
    SQL.Text := Format('select * from device.%s where ltrim(rtrim(code)) = ''%s''' +
      ' and id <> ''%s''',[vTable, Ch_code, vId]);
    open;
    if not IsEmpty then
    begin
      Result := False;
      vName := FieldValues['name'];
      Application.MessageBox(PChar('该代码与‘ ' + vName + ' ’重复！'),
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end;
end;

end.


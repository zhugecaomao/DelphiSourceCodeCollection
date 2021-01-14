unit ufrmOrganCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, CSDBBase, CSDBFind, CSBarMDIChild, DB, ADODB,
  CSADOQuery, Grids, DBGridEh, ComCtrls, dxtree, dxdbtree, StdCtrls, Mask,
  DBCtrlsEh, ExtCtrls, DBCtrls, CSDBNavigator, Buttons, dxExEdtr, dxDBTLCl,
  dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner, dxEditor, dxEdLib, dxDBELib,
  CSScrCtrlChild;

type
  TfrmOrganCode = class(TForm)
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
    baseMagPageCrt: TPageControl;
    code_organ_cert: TTabSheet;
    code_jg_state: TTabSheet;
    code_jg_type: TTabSheet;
    code_cert_validity: TTabSheet;
    code_infract_type: TTabSheet;
    datajgstate: TCSADOQuery;
    dataorgancert: TCSADOQuery;
    datajgtype: TCSADOQuery;
    datacertstate: TCSADOQuery;
    datainfracttype: TCSADOQuery;
    DataSorgancert: TDataSource;
    DataSjgstate: TDataSource;
    DataSjgtype: TDataSource;
    DataScertstate: TDataSource;
    DataSinfracttype: TDataSource;
    Temp: TCSADOQuery;
    CSBarMDIChild1: TCSBarMDIChild;
    CategoryFind: TCSDBFind;
    ImageList: TImageList;
    dataorgancertid: TStringField;
    dataorgancertparent_id: TStringField;
    dataorgancertname: TStringField;
    dataorgancertoutflag: TIntegerField;
    datajgstateid: TStringField;
    datajgstatename: TStringField;
    datajgstateoutflag: TIntegerField;
    datajgtypeid: TStringField;
    datajgtypecode: TIntegerField;
    datajgtypename: TStringField;
    datajgtypeoutflag: TIntegerField;
    datacertstateid: TStringField;
    datacertstatename: TStringField;
    datacertstateoutflag: TIntegerField;
    datainfracttypeid: TStringField;
    datainfracttypecode: TStringField;
    datainfracttypename: TStringField;
    datainfracttypeoutflag: TIntegerField;
    tvorgancert: TdxDBTreeView;
    Splitter3: TSplitter;
    TabSheet1: TTabSheet;
    Splitter5: TSplitter;
    ScrollBox5: TScrollBox;
    Label6: TLabel;
    Label7: TLabel;
    infracttype_code: TDBEditEh;
    infracttype_name: TDBEditEh;
    DBGridinfracttype: TDBGridEh;
    dataorgancertcode: TStringField;
    dataorgancerttech_param: TStringField;
    dataorgancertauth_unit: TStringField;
    dataorgancertcode_level: TStringField;
    ScrollBox3: TScrollBox;
    Label11: TLabel;
    organcert_name: TDBEditEh;
    Splitter6: TSplitter;
    ScrollBox6: TScrollBox;
    Label4: TLabel;
    jgstate_name: TDBEditEh;
    DBGridjg_state: TDBGridEh;
    Splitter4: TSplitter;
    DBGridcertvalidity: TDBGridEh;
    ScrollBox4: TScrollBox;
    Label9: TLabel;
    certstate_name: TDBEditEh;
    Splitter7: TSplitter;
    DBGridjgtype: TDBGridEh;
    ScrollBox8: TScrollBox;
    Label5: TLabel;
    Label14: TLabel;
    jgtype_code: TDBEditEh;
    jgtype_name: TDBEditEh;
    Label2: TLabel;
    organcert_auth: TDBEditEh;
    Label3: TLabel;
    organcert_tech: TdxDBMemo;
    datajgstatecode: TStringField;
    Label8: TLabel;
    jgstate_code: TDBEditEh;
    Label10: TLabel;
    certstate_code: TDBEditEh;
    datacertstatecode: TStringField;
    Splitter2: TSplitter;
    DBGridprjstate: TDBGridEh;
    ScrollBox7: TScrollBox;
    Label12: TLabel;
    Label13: TLabel;
    prjstate_name: TDBEditEh;
    prjstate_code: TDBEditEh;
    dataprjstate: TCSADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    DataSprjstate: TDataSource;
    ScrChild: TCSScrCtrlChild;
    procedure datajgstateBeforePost(DataSet: TDataSet);
    procedure datajgstateAfterScroll(DataSet: TDataSet);
    procedure datajgtypeBeforePost(DataSet: TDataSet);
    procedure datajgtypeAfterScroll(DataSet: TDataSet);
    procedure datacertstateBeforePost(DataSet: TDataSet);
    procedure datacertstateAfterScroll(DataSet: TDataSet);
    procedure datainfracttypeBeforePost(DataSet: TDataSet);
    procedure datainfracttypeAfterScroll(DataSet: TDataSet);
    procedure baseMagPageCrtChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbtnInsertClick(Sender: TObject);
    procedure baseMagPageCrtChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure bbtnDeleteClick(Sender: TObject);
    procedure tvorgancertChange(Sender: TObject; Node: TTreeNode);
    procedure tvorgancertGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure tvorgancertGetSelectedIndex(Sender: TObject;
      Node: TTreeNode);
    procedure dataorgancertBeforePost(DataSet: TDataSet);
    procedure dataorgancertAfterPost(DataSet: TDataSet);
    procedure dataprjstateAfterScroll(DataSet: TDataSet);
    procedure dataprjstateBeforePost(DataSet: TDataSet);
    procedure tvorgancertDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure bbtnFindClick(Sender: TObject);
  private
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
    function prif_Checkrepeat(Ch_code : String;
      vTable : String ; vId : String): Boolean;
  public
    { Public declarations }
    procedure pubp_Ini(const Ab_FirstRun: Boolean);
  end;

var
  frmOrganCode: TfrmOrganCode;

implementation

uses
	CSDBUtils, CSVCLUtils, udmData, CommonLib;
{$R *.dfm}

//初始化
procedure TfrmOrganCode.pubp_Ini(const Ab_FirstRun: Boolean);
begin
  ScrChild.SetSecurity(Self);

  if Ab_FirstRun then
  begin
    Gp_ProgressHint(Format('正在打开%s，请稍候...', [Caption]));
    try
      baseMagPageCrt.ActivePageIndex := 0;
      with dataorgancert do
      begin
        if Active then Close;
        SQL.Text := 'select * from device.code_organ_cert ';
        Open;
      end;
      FormStyle := fsMDIChild;
      if MAXIMIZEDBYDEFAULT then WindowState := wsMaximized else ClientTile(Self);
      f_PageSaved := true ;
      f_unite := False;
      navbasedata.DataSource := DataSorgancert;
      CategoryFind.DataSet := dataorgancert;
    finally
      Gp_ProgressHint;
    end;
  end else Show;

end;

// datajgstate
procedure TfrmOrganCode.datajgstateBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_organ_state',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datajgstate,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmOrganCode.datajgstateAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datajgstate,'code_organ_state');
end;

//  datajgtype
procedure TfrmOrganCode.datajgtypeBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_jg_type',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datajgtype,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmOrganCode.datajgtypeAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datajgtype,'code_jg_type');
end;


//datacertstate

procedure TfrmOrganCode.datacertstateBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_organ_cert_state',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datacertstate,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmOrganCode.datacertstateAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datacertstate,'code_organ_cert_state');
end;

// dataprjstate
procedure TfrmOrganCode.dataprjstateBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_organ_prj_state',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(dataprjstate,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmOrganCode.dataprjstateAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(dataprjstate,'code_organ_prj_state');
end;


// datainfracttype
procedure TfrmOrganCode.datainfracttypeBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_infract_type',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datainfracttype,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmOrganCode.datainfracttypeAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datainfracttype,'code_infract_type');
end;

//public
procedure TfrmOrganCode.baseMagPageCrtChange(Sender: TObject);
var
  vPagIndex : integer;
begin
  vPagIndex := baseMagPageCrt.ActivePage.TabIndex;
  case vPagIndex of
    0: BMagPageCrtChange(dataorgancert,DataSorgancert,'code_organ_cert');
    1: BMagPageCrtChange(datajgstate,DataSjgstate,'code_organ_state');
    2: BMagPageCrtChange(datacertstate,DataScertstate,'code_organ_cert_state');
    3: BMagPageCrtChange(dataprjstate,DataSprjstate,'code_organ_prj_state');
    4: BMagPageCrtChange(datajgtype,DataSjgtype,'code_jg_type');
    5: BMagPageCrtChange(datainfracttype,DataSinfracttype,'code_infract_type');
  end; 
end;

procedure TfrmOrganCode.BMagPageCrtChange(vData : TCSADOQuery;
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
    1,2,3,4,5:bbtnDelete.Enabled := True;
   end;
   navbasedata.DataSource := vDataS;
   CategoryFind.DataSet := vData;
   Screen.Cursor := crDefault;
end;

procedure TfrmOrganCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmOrganCode := nil;
end;

procedure TfrmOrganCode.bbtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmOrganCode.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CheckDBState(Self, True, [dataorgancert]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datajgstate]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datacertstate]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [dataprjstate]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datajgtype]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datainfracttype]) in CDS_STOP then CanClose := False;
end;


function TfrmOrganCode.Pri_CountId :string;
var
  vtId, vtTable : string;
  vtLen, vt_i ,i: integer;
begin
  case baseMagPageCrt.ActivePage.TabIndex of
    0: vtTable := 'code_organ_cert';
    1: vtTable := 'code_organ_state';
    2: vtTable := 'code_organ_cert_state';
    3: vtTable := 'code_organ_prj_state';
    4: vtTable := 'code_jg_type';
    5: vtTable := 'code_infract_type';
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

procedure TfrmOrganCode.bbtnInsertClick(Sender: TObject);
begin
    case baseMagPageCrt.ActivePageIndex  of
    0: Pri_TypeInsert(dataorgancert,6);
    1: pri_GridInsert(datajgstate);
    2: pri_GridInsert(datacertstate);
    3: pri_GridInsert(dataprjstate);
    4: pri_GridInsert(datajgtype);
    5: pri_GridInsert(datainfracttype);
    end;
end;

procedure TfrmOrganCode.Pri_TypeInsert(var vDataSet: TCSADOQuery;
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

procedure TfrmOrganCode.pri_GridInsert(vDataSet: TCSADOQuery);
begin
  with vDataSet do
  begin
    vDataSet.Append;
    FieldValues['id'] := Pri_CountId;
    FieldValues['outflag'] := 1;
    f_PageSaved := False;
  end;
end;

function TfrmOrganCode.prif_CheckBlank(vDataSet: TCSADOQuery;
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


procedure TfrmOrganCode.baseMagPageCrtChanging(Sender: TObject;
  var AllowChange: Boolean);
var
  vDataSet : TCSADOQuery;
begin
  case baseMagPageCrt.ActivePageIndex  of
    0: vDataSet := dataorgancert;
    1: vDataSet := datajgstate;
    2: vDataSet := datacertstate;
    3: vDataSet := dataprjstate;
    4: vDataSet := datajgtype;
    5: vDataSet := datainfracttype;
    else vdataSet := nil;
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


procedure TfrmOrganCode.bbtnDeleteClick(Sender: TObject);
begin
  case baseMagPageCrt.ActivePageIndex of
  0: Pri_GetUnTvInfo(dataorgancert,'code_organ_cert');
  1: Pri_GetUnTvInfo(datajgstate,'code_organ_state');
  2: Pri_GetUnTvInfo(datacertstate,'code_organ_cert_state');
  3: Pri_GetUnTvInfo(dataprjstate,'code_organ_prj_state');
  4: Pri_GetUnTvInfo(datajgtype,'code_jg_type');
  5: Pri_GetUnTvInfo(datainfracttype,'code_infract_type');
  end;
end;

procedure  TfrmOrganCode.Pri_GetUnTvInfo (vDataSet: TCSADOQuery;
  Un_Table : string);
begin
  with vDataSet do
  begin
    vun_Id := FieldValues['id'];
    vun_Name := FieldValues['name'];
    case baseMagPageCrt.ActivePageIndex of
    0:
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

procedure  TfrmOrganCode.Pri_unite (vDataSet: TCSADOQuery; Un_Table : string);
var
  vEnd_id,vEnd_Par,vEnd_Name : string;
  f_isTv : Boolean;
begin
  f_isTv := False;
  case baseMagPageCrt.ActivePageIndex of
    0: f_isTv := True;
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

procedure TfrmOrganCode.tvorgancertChange(Sender: TObject;
  Node: TTreeNode);
begin
  bbtnDelete.Enabled := False;
  if node.Level > 0 then bbtnDelete.Enabled := True;
  if f_unite then Pri_unite(dataorgancert,'code_organ_cert');
end;

procedure TfrmOrganCode.tvorgancertGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
	Node.ImageIndex := Node.Level;
end;

procedure TfrmOrganCode.tvorgancertGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.Level;
end;

procedure TfrmOrganCode.dataorgancertBeforePost(DataSet: TDataSet);
begin
with DataSet do
		if not prif_CheckBlank(dataorgancert,
      [FieldByName('name')]) then Abort;
end;

procedure TfrmOrganCode.dataorgancertAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
  tvorgancert.RefreshItems;
end;


function TfrmOrganCode.prif_Checkrepeat(Ch_code : String;
  vTable : String ; vId : String): Boolean;
var
  vName : string;
begin
  Result := True;
  with temp do
  begin
    if Active then Close;
    SQL.Text := Format('select * from device.%s where code = ''%s''' +
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


procedure TfrmOrganCode.tvorgancertDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
end;

procedure TfrmOrganCode.bbtnFindClick(Sender: TObject);
begin
  CategoryFind.FindDlg;
end;

end.

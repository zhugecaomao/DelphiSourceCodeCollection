unit ufrmDeviceCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ComCtrls, dxtree, dxdbtree, StdCtrls, Mask,
  DBCtrlsEh, ExtCtrls, ImgList, CSDBBase, CSDBFind, CSBarMDIChild, DB,
  ADODB, CSADOQuery, DBCtrls, CSDBNavigator, Buttons, CSScrCtrlChild;

type
  TfrmDeviceCode = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    bbtnPrint: TBitBtn;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    Panel2: TPanel;
    bbtnFind: TBitBtn;
    Panel4: TPanel;
    navsbdata: TCSDBNavigator;
    bbtnInsert: TBitBtn;
    bbtnDelete: TBitBtn;
    bbtnEdit: TBitBtn;
    dataverifytype: TCSADOQuery;
    datadevice: TCSADOQuery;
    datastwkkind: TCSADOQuery;
    datasbstate: TCSADOQuery;
    datasbuse: TCSADOQuery;
    DataSdevice: TDataSource;
    DataSverifytype: TDataSource;
    DataSstwkkind: TDataSource;
    DataSsbstate: TDataSource;
    DataSsbuse: TDataSource;
    Temp: TCSADOQuery;
    CSBarMDIChild1: TCSBarMDIChild;
    CategoryFind: TCSDBFind;
    ImageList: TImageList;
    baseMagPageCrt: TPageControl;
    code_stwk_kind: TTabSheet;
    code_verify_type: TTabSheet;
    code_sb_use: TTabSheet;
    code_sb_state: TTabSheet;
    code_device: TTabSheet;
    datadeviceid: TStringField;
    datadeviceparent_id: TStringField;
    datadevicename: TStringField;
    datadevicecode: TStringField;
    datadeviceoutflag: TIntegerField;
    dataverifytypeid: TStringField;
    dataverifytypeparent_id: TStringField;
    dataverifytypename: TStringField;
    dataverifytypeoutflag: TIntegerField;
    datastwkkindid: TStringField;
    datastwkkindname: TStringField;
    datastwkkindoutflag: TIntegerField;
    datasbstateid: TStringField;
    datasbstatename: TStringField;
    datasbstateoutflag: TIntegerField;
    datasbuseid: TStringField;
    datasbusename: TStringField;
    datasbuseoutflag: TIntegerField;
    datadevicecode_level: TStringField;
    DBGridsbuse: TDBGridEh;
    Splitter5: TSplitter;
    ScrollBox5: TScrollBox;
    Label7: TLabel;
    sbuse_name: TDBEditEh;
    DBGridsbstate: TDBGridEh;
    Splitter4: TSplitter;
    ScrollBox4: TScrollBox;
    Label9: TLabel;
    sbstate_name: TDBEditEh;
    Splitter7: TSplitter;
    DBGridstwkkind: TDBGridEh;
    ScrollBox8: TScrollBox;
    Label5: TLabel;
    stwkkind_name: TDBEditEh;
    tvverifytype: TdxDBTreeView;
    Splitter6: TSplitter;
    ScrollBox6: TScrollBox;
    Label4: TLabel;
    verifytype_name: TDBEditEh;
    tvdevice: TdxDBTreeView;
    Splitter3: TSplitter;
    ScrollBox3: TScrollBox;
    Label10: TLabel;
    Label11: TLabel;
    device_code: TDBEditEh;
    device_name: TDBEditEh;
    datastwkkindcode: TStringField;
    Label1: TLabel;
    stwkkind_code: TDBEditEh;
    Label2: TLabel;
    sbstate_code: TDBEditEh;
    datasbstatecode: TStringField;
    Label3: TLabel;
    sbuse_code: TDBEditEh;
    datasbusecode: TStringField;
    dataverifytypecode_level: TStringField;
    ScrChild: TCSScrCtrlChild;
    procedure tvdeviceChange(Sender: TObject; Node: TTreeNode);
    procedure tvdeviceGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure tvdeviceGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure datadeviceBeforePost(DataSet: TDataSet);
    procedure datadeviceAfterPost(DataSet: TDataSet);
    procedure baseMagPageCrtChange(Sender: TObject);
    procedure tvverifytypeGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure tvverifytypeGetSelectedIndex(Sender: TObject;
      Node: TTreeNode);
    procedure dataverifytypeBeforePost(DataSet: TDataSet);
    procedure dataverifytypeAfterPost(DataSet: TDataSet);
    procedure tvverifytypeChange(Sender: TObject; Node: TTreeNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure datastwkkindBeforePost(DataSet: TDataSet);
    procedure datastwkkindAfterScroll(DataSet: TDataSet);
    procedure datasbstateBeforePost(DataSet: TDataSet);
    procedure datasbstateAfterScroll(DataSet: TDataSet);
    procedure datasbuseBeforePost(DataSet: TDataSet);
    procedure datasbuseAfterScroll(DataSet: TDataSet);
    procedure bbtnInsertClick(Sender: TObject);
    procedure baseMagPageCrtChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure bbtnDeleteClick(Sender: TObject);
    procedure tvdeviceDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvverifytypeDragOver(Sender, Source: TObject; X, Y: Integer;
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

    procedure Pri_TypeInsert( vDataSet: TCSADOQuery;
      maxLevel: integer);
    function prif_Checkrepeat(Ch_code : String; vTable : String ;
      vId : String): Boolean;
  public
    { Public declarations }
    procedure pubp_Ini(const Ab_FirstRun: Boolean);
  end;

var
  frmDeviceCode: TfrmDeviceCode;

implementation

uses
	CSDBUtils, CSVCLUtils, udmData, CommonLib;


{$R *.dfm}

//初始化
procedure TfrmDeviceCode.pubp_Ini(const Ab_FirstRun: Boolean);
begin
  ScrChild.SetSecurity(Self);
  if Ab_FirstRun then
  begin
    Gp_ProgressHint(Format('正在打开%s，请稍候...', [Caption]));
    try
      baseMagPageCrt.ActivePageIndex := 0;
      with datadevice do
      begin
        if Active then Close;
        SQL.Text := 'SELECT * FROM device.code_device';
        Open;
      end;
      FormStyle := fsMDIChild;
      if MAXIMIZEDBYDEFAULT then WindowState := wsMaximized else ClientTile(Self);
      f_PageSaved := true ;
      f_unite := False;
      navsbdata.DataSource := DataSdevice;
      CategoryFind.DataSet := Datadevice;
    finally
      Gp_ProgressHint;
    end;
  end else Show;

end;

//sb代码

procedure TfrmDeviceCode.tvdeviceChange(Sender: TObject; Node: TTreeNode);
begin
    f_PageSaved := True ;
    bbtnDelete.Enabled := False;
    if node.Level > 0 then bbtnDelete.Enabled := True;
    if f_unite then Pri_unite(datadevice,'code_device');
end;

procedure TfrmDeviceCode.tvdeviceGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
	Node.ImageIndex := Node.Level;
end;

procedure TfrmDeviceCode.tvdeviceGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.Level;
end;

procedure TfrmDeviceCode.datadeviceBeforePost(DataSet: TDataSet);
begin
with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_device',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datadevice,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
    Screen.Cursor := crHourGlass;
end;

procedure TfrmDeviceCode.datadeviceAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
  tvdevice.RefreshItems;
  Screen.Cursor := crDefault;
end;



// verifytype

procedure TfrmDeviceCode.tvverifytypeGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
	Node.ImageIndex := Node.Level;
end;

procedure TfrmDeviceCode.tvverifytypeGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.Level;
end;

procedure TfrmDeviceCode.dataverifytypeBeforePost(DataSet: TDataSet);
begin
with DataSet do
		if not prif_CheckBlank(dataverifytype,
      [FieldByName('name')]) then Abort;
    Screen.Cursor := crHourGlass;
end;

procedure TfrmDeviceCode.dataverifytypeAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
  tvverifytype.RefreshItems;
  Screen.Cursor := crDefault;
  f_PageSaved := True;
end;

procedure TfrmDeviceCode.tvverifytypeChange(Sender: TObject;
  Node: TTreeNode);
begin
  f_PageSaved := True ;
    bbtnDelete.Enabled := False;
    if node.Level > 0 then bbtnDelete.Enabled := True;
    if f_unite then Pri_unite(dataverifytype,'code_verify_type');
end;


//datastwkkind
procedure TfrmDeviceCode.datastwkkindBeforePost(DataSet: TDataSet);
begin
with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_stwk_kind',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datastwkkind,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmDeviceCode.datastwkkindAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datastwkkind,'code_stwk_kind');
end;

//datasbstate sbstate_name


procedure TfrmDeviceCode.datasbstateBeforePost(DataSet: TDataSet);
begin
with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_dev_state',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datasbstate,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmDeviceCode.datasbstateAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datasbstate,'code_dev_state');
end;

// datasbuse
procedure TfrmDeviceCode.datasbuseBeforePost(DataSet: TDataSet);
begin
with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_dev_use',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datasbuse,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmDeviceCode.datasbuseAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datasbuse,'code_dev_use');
end;

// public
procedure TfrmDeviceCode.baseMagPageCrtChange(Sender: TObject);
  var
  vPagIndex : integer;
begin
  vPagIndex := baseMagPageCrt.ActivePage.TabIndex;
  f_unite := False;
  case vPagIndex of
    0: BMagPageCrtChange(datadevice,DataSdevice,'code_device');
    1: BMagPageCrtChange(dataverifytype,DataSverifytype,'code_verify_type');
    2: BMagPageCrtChange(datastwkkind,DataSstwkkind,'code_stwk_kind');
    3: BMagPageCrtChange(datasbstate,DataSsbstate,'code_dev_state');
    4: BMagPageCrtChange(datasbuse,DataSsbuse,'code_dev_use');
  end;
  f_PageSaved := True;
end;

procedure TfrmDeviceCode.BMagPageCrtChange(vData : TCSADOQuery;
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
    2,3,4: bbtnDelete.Enabled := True;
   end;
   navsbdata.DataSource := vDataS;
   CategoryFind.DataSet := vData;
   Screen.Cursor := crDefault;
end;

procedure TfrmDeviceCode.bbtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmDeviceCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmDeviceCode := nil;
end;

procedure TfrmDeviceCode.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CheckDBState(Self, True, [datadevice]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [dataverifytype]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datastwkkind]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datasbstate]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datasbuse]) in CDS_STOP then CanClose := False;
end;

function TfrmDeviceCode.Pri_CountId :string;
var
  vtId, vtTable : string;
  vtLen, vt_i ,i: integer;
begin
  case baseMagPageCrt.ActivePage.TabIndex of
    0: vtTable := 'code_device';
    1: vtTable := 'code_verify_type';
    2: vtTable := 'code_stwk_kind';
    3: vtTable := 'code_dev_state';
    4: vtTable := 'code_dev_use';
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

procedure TfrmDeviceCode.Pri_TypeInsert( vDataSet: TCSADOQuery;
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

procedure TfrmDeviceCode.pri_GridInsert(vDataSet: TCSADOQuery);
begin
  with vDataSet do
  begin
    vDataSet.Append;
    FieldByName('id').Value := Pri_CountId;
    FieldByName('outflag').Value := 1;
    f_PageSaved := False;
  end;
end;


function TfrmDeviceCode.prif_CheckBlank(vDataSet: TCSADOQuery;
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


procedure TfrmDeviceCode.bbtnInsertClick(Sender: TObject);
begin
    case baseMagPageCrt.ActivePageIndex  of
    0: Pri_TypeInsert(datadevice, 3);
    1: Pri_TypeInsert(dataverifytype,3);
    2: pri_GridInsert(datastwkkind);
    3: pri_GridInsert(datasbstate);
    4: pri_GridInsert(datasbuse);
    end;
end;

procedure TfrmDeviceCode.baseMagPageCrtChanging(Sender: TObject;
  var AllowChange: Boolean);
var
  vDataSet : TCSADOQuery;
begin
  case baseMagPageCrt.ActivePageIndex  of
    0: vDataSet := datadevice;
    1: vDataSet := dataverifytype;
    2: vDataSet := datastwkkind;
    3: vDataSet := datasbstate;
    4: vDataSet := datasbuse;
    else  vDataSet := nil;
  end;

  if  vDataSet.State <> dsBrowse then
  begin
    case Application.MessageBox('是否保存当前修改代码?', PChar(Caption),
      MB_YESNOCANCEL + MB_DEFBUTTON1 + MB_ICONQUESTION) of
      IDYES	:
      begin
        vDataSet.Post;
        f_PageSaved := True;
      end;
      IDNO : vDataSet.Cancel;
      IDCANCEL : f_PageSaved := False;
    end;
    AllowChange := f_PageSaved;
  end;

end;

procedure TfrmDeviceCode.bbtnDeleteClick(Sender: TObject);
begin
  case baseMagPageCrt.ActivePageIndex of
  0: Pri_GetUnTvInfo(datadevice, 'code_device');
  1: Pri_GetUnTvInfo(dataverifytype, 'code_verify_type');
  2: Pri_GetUnTvInfo(datastwkkind,'code_stwk_kind');
  3: Pri_GetUnTvInfo(datasbstate,'code_dev_state');
  4: Pri_GetUnTvInfo(datasbuse,'code_dev_use');
  end;
end;


procedure  TfrmDeviceCode.Pri_GetUnTvInfo (vDataSet: TCSADOQuery;
  Un_Table : string);
begin
  with vDataSet do
  begin
    vun_Id := FieldValues['id'];
    vun_Name := FieldValues['name'];
    case baseMagPageCrt.ActivePageIndex of
    0,1:
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

procedure  TfrmDeviceCode.Pri_unite (vDataSet: TCSADOQuery; Un_Table : string);
var
  vEnd_id,vEnd_Par,vEnd_Name : string;
  f_isTv : Boolean;
begin
  f_isTv := False;
  case baseMagPageCrt.ActivePageIndex of
    0,1 : f_isTv := True;
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


procedure TfrmDeviceCode.tvdeviceDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;   
end;

procedure TfrmDeviceCode.tvverifytypeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
end;

procedure TfrmDeviceCode.bbtnFindClick(Sender: TObject);
begin
  CategoryFind.FindDlg;
end;

function TfrmDeviceCode.prif_Checkrepeat(Ch_code : String;
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

end.

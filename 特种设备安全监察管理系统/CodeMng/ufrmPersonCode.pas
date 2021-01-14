unit ufrmPersonCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, CSDBBase, CSDBFind, CSBarMDIChild, DB, ADODB,
  CSADOQuery, Grids, DBGridEh, ComCtrls, dxtree, dxdbtree, StdCtrls, Mask,
  DBCtrlsEh, ExtCtrls, DBCtrls, CSDBNavigator, Buttons, CSScrCtrlChild;

type
  TfrmPersonCode = class(TForm)
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
    dataperlicns: TCSADOQuery;
    datarylstate: TCSADOQuery;
    datarewards: TCSADOQuery;
    DataSperlicns: TDataSource;
    DataSrylstate: TDataSource;
    DataSrewards: TDataSource;
    CSBarMDIChild1: TCSBarMDIChild;
    CategoryFind: TCSDBFind;
    ImageList: TImageList;
    datarewardsit: TCSADOQuery;
    DataSrewardsit: TDataSource;
    datatrainresult: TCSADOQuery;
    DataStrainresult: TDataSource;
    dataperlicnsid: TStringField;
    dataperlicnsparent_id: TStringField;
    dataperlicnsname: TStringField;
    dataperlicnsoutflag: TIntegerField;
    datarylstateid: TStringField;
    datarylstatename: TStringField;
    datarylstateoutflag: TIntegerField;
    datarewardsid: TStringField;
    datarewardsname: TStringField;
    datarewardsoutflag: TIntegerField;
    datarewardsitid: TStringField;
    datarewardsitname: TStringField;
    datarewardsitoutflag: TIntegerField;
    datatrainresultid: TStringField;
    datatrainresultname: TStringField;
    datatrainresultcode: TStringField;
    datatrainresultoutflag: TIntegerField;
    bbtnDelete: TBitBtn;
    Temp: TCSADOQuery;
    dataperlicnscode_level: TStringField;
    datarylstatecode: TStringField;
    datarewardscode: TStringField;
    datarewardsitcode: TStringField;
    baseMagPageCrt: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet5: TTabSheet;
    DataSryPrjstate: TDataSource;
    dataryprjstate: TCSADOQuery;
    dataryprjstateid: TStringField;
    dataryprjstatecode: TStringField;
    dataryprjstatename: TStringField;
    dataryprjstateoutflag: TIntegerField;
    tvperlicns: TdxDBTreeView;
    Splitter7: TSplitter;
    ScrollBox8: TScrollBox;
    Label5: TLabel;
    perlicns_name: TDBEditEh;
    DBGridRylState: TDBGridEh;
    Splitter5: TSplitter;
    ScrollBox5: TScrollBox;
    Label7: TLabel;
    Label3: TLabel;
    rylstate_name: TDBEditEh;
    rylstate_code: TDBEditEh;
    DBGridryprjstate: TDBGridEh;
    Splitter2: TSplitter;
    ScrollBox2: TScrollBox;
    Label4: TLabel;
    Label6: TLabel;
    ryprjstate_name: TDBEditEh;
    ryprjstate_code: TDBEditEh;
    DBGridrewards: TDBGridEh;
    Splitter4: TSplitter;
    ScrollBox4: TScrollBox;
    Label9: TLabel;
    Label2: TLabel;
    rewards_name: TDBEditEh;
    rewards_code: TDBEditEh;
    DBGridrewardsit: TDBGridEh;
    Splitter1: TSplitter;
    ScrollBox1: TScrollBox;
    Label16: TLabel;
    Label1: TLabel;
    rewardsit_name: TDBEditEh;
    rewardsit_code: TDBEditEh;
    DBGridtrainresult: TDBGridEh;
    Splitter8: TSplitter;
    ScrollBox7: TScrollBox;
    Label17: TLabel;
    Label18: TLabel;
    trainresult_code: TDBEditEh;
    trainresult_name: TDBEditEh;
    ScrChild: TCSScrCtrlChild;
    procedure tvperlicnsChange(Sender: TObject; Node: TTreeNode);
    procedure tvperlicnsGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure tvperlicnsGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure dataperlicnsBeforePost(DataSet: TDataSet);
    procedure dataperlicnsAfterPost(DataSet: TDataSet);
    procedure datarylstateBeforePost(DataSet: TDataSet);
    procedure datarylstateAfterScroll(DataSet: TDataSet);
    procedure datarewardsBeforePost(DataSet: TDataSet);
    procedure datarewardsAfterScroll(DataSet: TDataSet);
    procedure datarewardsitBeforePost(DataSet: TDataSet);
    procedure datarewardsitAfterScroll(DataSet: TDataSet);
    procedure datatrainresultBeforePost(DataSet: TDataSet);
    procedure datatrainresultAfterScroll(DataSet: TDataSet);
    procedure baseMagPageCrtChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbtnInsertClick(Sender: TObject);
    procedure baseMagPageCrtChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure bbtnDeleteClick(Sender: TObject);
    procedure dataryprjstateBeforePost(DataSet: TDataSet);
    procedure dataryprjstateAfterScroll(DataSet: TDataSet);
    procedure tvperlicnsDragOver(Sender, Source: TObject; X, Y: Integer;
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
    function prif_Checkrepeat(Ch_code : String;
      vTable : String ; vId : String): Boolean;
  public
    { Public declarations }
    procedure pubp_Ini(const Ab_FirstRun: Boolean);
  end;

var
  frmPersonCode: TfrmPersonCode;

implementation

{$R *.dfm}

uses
	CSDBUtils, CSVCLUtils, udmData, CommonLib;

//初始化
procedure TfrmPersonCode.pubp_Ini(const Ab_FirstRun: Boolean);
begin
  ScrChild.SetSecurity(Self);

  if Ab_FirstRun then
  begin
    Gp_ProgressHint(Format('正在打开%s，请稍候...', [Caption]));
    try
      baseMagPageCrt.ActivePageIndex := 0;
      with dataperlicns do
      begin
        if Active then Close;
        SQL.Text := 'SELECT * FROM device.code_person_licns';
        Open;
      end;
      FormStyle := fsMDIChild;
      if MAXIMIZEDBYDEFAULT then WindowState := wsMaximized else ClientTile(Self);
      f_PageSaved := true ;
      f_unite := False;
      navbasedata.DataSource := DataSperlicns;
      CategoryFind.DataSet := Dataperlicns;
    finally
      Gp_ProgressHint;
    end;
  end else Show;

end;

//per lic
procedure TfrmPersonCode.tvperlicnsChange(Sender: TObject;
  Node: TTreeNode);
begin
    //perlicns_name.ReadOnly := dataperlicns.State = dsBrowse;
    f_PageSaved := True ;
    bbtnDelete.Enabled := False;
    if node.Level > 0 then bbtnDelete.Enabled := True;
    if f_unite then Pri_unite(dataperlicns,'code_person_licns');
end;

procedure TfrmPersonCode.tvperlicnsGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
	Node.ImageIndex := Node.Level;
end;

procedure TfrmPersonCode.tvperlicnsGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.Level;
end;

procedure TfrmPersonCode.dataperlicnsBeforePost(DataSet: TDataSet);
begin
with DataSet do
		if not prif_CheckBlank(dataperlicns, [FieldByName('name')]) then Abort;
    Screen.Cursor := crHourGlass;
end;

procedure TfrmPersonCode.dataperlicnsAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
  tvperlicns.RefreshItems;
  Screen.Cursor := crDefault;
end;


//ryState
procedure TfrmPersonCode.datarylstateBeforePost(DataSet: TDataSet);
begin
with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_ry_licns_state',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datarylstate,
      [FieldByName('code'),FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmPersonCode.datarylstateAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datarylstate,'code_ry_licns_state');
end;

//dataryprjstate

procedure TfrmPersonCode.dataryprjstateBeforePost(DataSet: TDataSet);
begin
with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_ry_prj_state',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(dataryprjstate,
      [FieldByName('code'),FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmPersonCode.dataryprjstateAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not Fieldbyname('id').IsNull then
    begin
      if strtoint(FieldValues['id']) < 5 then
      begin
        bbtnDelete.Enabled := False;
        ryprjstate_code.ReadOnly := True;
        ryprjstate_name.ReadOnly := True;
      end else
      begin
        bbtnDelete.Enabled := True;
        ryprjstate_code.ReadOnly := False;
        ryprjstate_name.ReadOnly := False;
      end;
     end;
  end;
  if f_unite then Pri_unite(dataryprjstate,'code_ry_prj_state');
end;

// rewards

procedure TfrmPersonCode.datarewardsBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_rewardsreason',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datarewards,
      [FieldByName('code'),FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmPersonCode.datarewardsAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datarewards,'code_rewardsreason');
end;

//datarewardsit

procedure TfrmPersonCode.datarewardsitBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_rewardsitem',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datarewardsit,
      [FieldByName('code'),FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmPersonCode.datarewardsitAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datarewardsit,'code_rewardsitem');
end;


// datatrainresult

procedure TfrmPersonCode.datatrainresultBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_trainresult',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datatrainresult,
      [FieldByName('code'),FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmPersonCode.datatrainresultAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not Fieldbyname('id').IsNull then
    begin
      if strtoint(FieldValues['id']) < 5 then
      begin
        bbtnDelete.Enabled := False;
        trainresult_code.ReadOnly := True;
        trainresult_name.ReadOnly := True;
      end else
      begin
        bbtnDelete.Enabled := True;
        trainresult_code.ReadOnly := False;
        trainresult_name.ReadOnly := False;
      end;
    end;
  end;
  if f_unite then Pri_unite(datatrainresult,'code_trainresult');
end;


// public

procedure TfrmPersonCode.baseMagPageCrtChange(Sender: TObject);
var vPagIndex : integer;
begin
  vPagIndex := baseMagPageCrt.ActivePage.TabIndex;

  case vPagIndex of
    0: BMagPageCrtChange(dataperlicns,DataSperlicns,'code_person_licns');
    1: BMagPageCrtChange(datarylstate,DataSrylstate,'code_ry_licns_state');
    2: BMagPageCrtChange(dataryprjstate,DataSryPrjstate,'code_ry_prj_state');
    3: BMagPageCrtChange(datarewards,DataSrewards,'code_rewardsreason');
    4: BMagPageCrtChange(datarewardsit,DataSrewardsit,'code_rewardsitem');
    5: BMagPageCrtChange(datatrainresult,DataStrainresult,'code_trainresult');
  end;
  f_PageSaved := true ;

end;

procedure TfrmPersonCode.BMagPageCrtChange(vData : TCSADOQuery;
  vDataS: TDataSource; vTable : String);
var
  vActPage : integer;
begin
  Screen.Cursor := crHourGlass;
  with vData do
  begin
    if not Active then
    begin
      SQL.Text := Format('SELECT * FROM device.%s',[vTable]);
      Open;
    end;
    navbasedata.DataSource := vDataS;
    vActPage := baseMagPageCrt.ActivePage.TabIndex;
    if vActPage <> 0 then
    begin
      if vActPage = 2 then
      begin
        if strtoint(FieldValues['id']) < 4 then
        begin
          bbtnDelete.Enabled := False;
        end else
          bbtnDelete.Enabled := True;
      end else
      begin
        bbtnDelete.Enabled := True;
      end;
    end;
  end;
  Screen.Cursor := crDefault;
  CategoryFind.DataSet := vData;
  navbasedata.DataSource := vDataS;
end;

procedure TfrmPersonCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmPersonCode := nil;
end;

procedure TfrmPersonCode.bbtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPersonCode.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
  begin
  if CheckDBState(Self, True, [dataperlicns]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datarylstate]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [dataryprjstate]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datarewards]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datarewardsit]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datatrainresult]) in CDS_STOP then CanClose := False;
end;

function TfrmPersonCode.Pri_CountId :string;
var
  vtId, vtTable : string;
  vtLen, vt_i ,i: integer;
begin
  case baseMagPageCrt.ActivePage.TabIndex of
    0: vtTable := 'code_person_licns';
    1: vtTable := 'code_ry_licns_state';
    2: vtTable := 'code_ry_prj_state';
    3: vtTable := 'code_rewardsreason';
    4: vtTable := 'code_rewardsitem';
    5: vtTable := 'code_trainresult';
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

procedure TfrmPersonCode.bbtnInsertClick(Sender: TObject);
begin
    case baseMagPageCrt.ActivePageIndex  of
    0: Pri_TypeInsert(dataperlicns,4);
    1: pri_GridInsert(datarylstate);
    2: pri_GridInsert(dataryprjstate);
    3: pri_GridInsert(datarewards);
    4: pri_GridInsert(datarewardsit);
    5: pri_GridInsert(datatrainresult);
    end;
end;

procedure TfrmPersonCode.Pri_TypeInsert(var vDataSet: TCSADOQuery;
  maxLevel: integer);
var
  vParID, vId, vNewId, vLevel :string;
begin
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
end;

procedure TfrmPersonCode.pri_GridInsert(vDataSet: TCSADOQuery);
begin
  with vDataSet do
  begin
    vDataSet.Append;
    FieldValues['id'] := Pri_CountId;
    FieldValues['outflag'] := 1;
    f_PageSaved := False;
    case baseMagPageCrt.ActivePageIndex of 
      2:
      begin
        ryprjstate_code.ReadOnly := False;
        ryprjstate_name.ReadOnly := False;
      end;
      5:
      begin
        trainresult_code.ReadOnly := False;
        trainresult_name.ReadOnly := False;
      end;
    end;
  end;
end;

function TfrmPersonCode.prif_CheckBlank(vDataSet: TCSADOQuery;
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

procedure TfrmPersonCode.baseMagPageCrtChanging(Sender: TObject;
  var AllowChange: Boolean);
var
  vDataSet : TCSADOQuery;
begin
  case baseMagPageCrt.ActivePageIndex  of
    0: vDataSet := dataperlicns;
    1: vDataSet := datarylstate;
    2: vDataSet := dataryprjstate;
    3: vDataSet := datarewards;
    4: vDataSet := datarewardsit;
    5: vDataSet := datatrainresult;
    else vDataSet := nil;
  end;
  if  vDataSet.State <> dsBrowse then
  begin
    case Application.MessageBox('是否保存当前修改代码?', PChar(Caption),
      MB_YESNOCANCEL + MB_DEFBUTTON1 + MB_ICONQUESTION) of
      IDYES	:
      begin
        case baseMagPageCrt.ActivePageIndex  of
        0: dataperlicns.Post;
        1: datarylstate.Post;
        2: dataryprjstate.post;
        3: datarewards.Post;
        4: datarewardsit.Post;
        5: datatrainresult.Post;
        end;
        f_PageSaved := True;
      end;
      IDNO : vDataSet.Cancel;
      IDCANCEL : f_PageSaved := False;
    end;
    AllowChange := f_PageSaved;
  end;
end;


procedure TfrmPersonCode.bbtnDeleteClick(Sender: TObject);
begin
  case baseMagPageCrt.ActivePageIndex of
  0: Pri_GetUnTvInfo(dataperlicns, 'code_person_licns');
  1: Pri_GetUnTvInfo(datarylstate, 'code_ry_licns_state');
  2: Pri_GetUnTvInfo(dataryprjstate, 'code_ry_prj_state');
  3: Pri_GetUnTvInfo(datarewards, 'code_rewardsreason');
  4: Pri_GetUnTvInfo(datarewardsit, 'code_rewardsitem');
  5: Pri_GetUnTvInfo(datatrainresult, 'code_trainresult');
  end;
end;



procedure  TfrmPersonCode.Pri_GetUnTvInfo (vDataSet: TCSADOQuery;
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

procedure  TfrmPersonCode.Pri_unite (vDataSet: TCSADOQuery; Un_Table : string);
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

function TfrmPersonCode.prif_Checkrepeat(Ch_code : String;
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

procedure TfrmPersonCode.tvperlicnsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept :=False;
end;

procedure TfrmPersonCode.bbtnFindClick(Sender: TObject);
begin
  CategoryFind.FindDlg;
end;

end.

unit ufrmAccidentCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGridEh, StdCtrls, ExtCtrls, DB, Mask,
  DBCtrlsEh, Buttons, DBCtrls, CSDBNavigator, ADODB, CSADOQuery, CSDBBase,
  CSDBFind, CSScrCtrlChild, CSBarMDIChild;

type
  TfrmAccidentCode = class(TForm)
    datasgformat: TCSADOQuery;
    datasgattr: TCSADOQuery;
    datasgkind: TCSADOQuery;
    datasgjtreason: TCSADOQuery;
    datasgreason: TCSADOQuery;
    baseMagPageCrt: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    DataSsgformat: TDataSource;
    DataSsgattr: TDataSource;
    DataSsgjtreason: TDataSource;
    DataSsgreason: TDataSource;
    DataSsgkind: TDataSource;
    Panel1: TPanel;
    Panel5: TPanel;
    bbtnPrint: TBitBtn;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    datasgformatid: TStringField;
    datasgformatcode: TStringField;
    datasgformatname: TStringField;
    datasgformatoutflag: TIntegerField;
    Temp: TCSADOQuery;
    datasgkindid: TStringField;
    datasgkindcode: TStringField;
    datasgkindname: TStringField;
    datasgkindoutflag: TIntegerField;
    datasgreasonid: TStringField;
    datasgreasoncode: TStringField;
    datasgreasonname: TStringField;
    datasgreasonoutflag: TIntegerField;
    datasgjtreasonid: TStringField;
    datasgjtreasoncode: TStringField;
    datasgjtreasonname: TStringField;
    datasgjtreasonoutflag: TIntegerField;
    datasgattrid: TStringField;
    datasgattrcode: TStringField;
    datasgattrname: TStringField;
    datasgattroutflag: TIntegerField;
    Panel2: TPanel;
    bbtnFind: TBitBtn;
    Panel4: TPanel;
    navbasedata: TCSDBNavigator;
    bbtnInsert: TBitBtn;
    bbtnDelete: TBitBtn;
    ScrollBox4: TScrollBox;
    Label8: TLabel;
    Label9: TLabel;
    jtreason_code: TDBEditEh;
    jtreason_name: TDBEditEh;
    Splitter4: TSplitter;
    sgjtrDBGridEh: TDBGridEh;
    ScrollBox3: TScrollBox;
    Label10: TLabel;
    Label11: TLabel;
    reason_code: TDBEditEh;
    reason_name: TDBEditEh;
    Splitter3: TSplitter;
    sgreaDBGridEh: TDBGridEh;
    sgforDBGridEh: TDBGridEh;
    Splitter6: TSplitter;
    ScrollBox6: TScrollBox;
    Label3: TLabel;
    Label4: TLabel;
    format_code: TDBEditEh;
    format_name: TDBEditEh;
    sgattrDBGridEh: TDBGridEh;
    Splitter5: TSplitter;
    ScrollBox5: TScrollBox;
    Label6: TLabel;
    Label7: TLabel;
    attr_code: TDBEditEh;
    attr_name: TDBEditEh;
    sgkindDBGridEh: TDBGridEh;
    Splitter2: TSplitter;
    ScrollBox2: TScrollBox;
    Label12: TLabel;
    Label13: TLabel;
    kind_code: TDBEditEh;
    kind_name: TDBEditEh;
    CategoryFind: TCSDBFind;
    ScrChild: TCSScrCtrlChild;
    CSBarMDIChild1: TCSBarMDIChild;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbtnCloseClick(Sender: TObject);
    procedure baseMagPageCrtChange(Sender: TObject);
    procedure datasgkindBeforePost(DataSet: TDataSet);
    procedure datasgkindAfterScroll(DataSet: TDataSet);
    procedure datasgattrBeforePost(DataSet: TDataSet);
    procedure datasgattrAfterScroll(DataSet: TDataSet);
    procedure datasgformatBeforePost(DataSet: TDataSet);
    procedure datasgformatAfterScroll(DataSet: TDataSet);
    procedure datasgreasonBeforePost(DataSet: TDataSet);
    procedure datasgreasonAfterScroll(DataSet: TDataSet);
    procedure datasgjtreasonBeforePost(DataSet: TDataSet);
    procedure datasgjtreasonAfterScroll(DataSet: TDataSet);
    procedure bbtnInsertClick(Sender: TObject);
    procedure baseMagPageCrtChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure bbtnDeleteClick(Sender: TObject);
    procedure bbtnFindClick(Sender: TObject);

  private
    { Private declarations }
    f_PageSaved : Boolean;
    f_unite : Boolean;
    vun_Id,vun_Name : string;
    procedure  Pri_unite (vDataSet: TCSADOQuery; Un_Table : string);
    procedure  Pri_GetUnTvInfo (vDataSet: TCSADOQuery);
    function prif_CheckBlank(vDataSet: TCSADOQuery;
      Ac_Fields: array of TField) : Boolean;
    procedure pri_GridInsert(vDataSet: TCSADOQuery);
    procedure BMagPageCrtChange(vData : TCSADOQuery;
      vDataS: TDataSource; vTable : String);
    function Pri_CountId :string;
    function prif_Checkrepeat(Ch_code : String;
      vTable : String ; vId : String): Boolean;
  public
    { Public declarations }
    procedure pubp_Ini(const Ab_FirstRun: Boolean);
  end;

var
  frmAccidentCode: TfrmAccidentCode;

implementation

uses
	CSDBUtils, CSVCLUtils, udmData, CommonLib;
  //
{$R *.dfm}

//初始化
procedure TfrmAccidentCode.pubp_Ini(const Ab_FirstRun: Boolean);
begin
  ScrChild.SetSecurity(Self);

  if Ab_FirstRun then
  begin
    Gp_ProgressHint(Format('正在打开%s，请稍候...', [Caption]));
    try
      baseMagPageCrt.ActivePageIndex := 0;
      with datasgkind do
      begin
        if Active then Close;
        SQL.Text := 'SELECT * FROM device.code_acct_kind';
        Open;
      end;
      FormStyle := fsMDIChild;
      if MAXIMIZEDBYDEFAULT then WindowState := wsMaximized else ClientTile(Self);
      f_PageSaved := true ;
      f_unite := False;
      navbasedata.DataSource := DataSsgkind;
      CategoryFind.DataSet := datasgkind;
    finally
      Gp_ProgressHint;
    end;
  end else Show;

end;

procedure TfrmAccidentCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmAccidentCode := nil;
end;

procedure TfrmAccidentCode.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CheckDBState(Self, True, [datasgjtreason]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datasgformat]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datasgattr]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datasgjtreason]) in CDS_STOP then CanClose := False;
  if CheckDBState(Self, True, [datasgreason]) in CDS_STOP then CanClose := False;
end;

procedure TfrmAccidentCode.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmAccidentCode.datasgkindBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_acct_kind',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datasgkind,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmAccidentCode.datasgkindAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datasgkind,'code_acct_kind');
end;

procedure TfrmAccidentCode.datasgattrBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_acct_char',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datasgattr,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmAccidentCode.datasgattrAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datasgattr,'code_acct_char');
end;

procedure TfrmAccidentCode.datasgformatBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_acct_type',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datasgformat,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end
end;

procedure TfrmAccidentCode.datasgformatAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datasgformat,'code_acct_type');
end;

procedure TfrmAccidentCode.datasgreasonBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_acct_reason',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datasgreason,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmAccidentCode.datasgreasonAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datasgreason,'code_acct_reason');
end;

procedure TfrmAccidentCode.datasgjtreasonBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not prif_Checkrepeat(FieldValues['code'],'code_acct_reasondetail',
      FieldValues['id']) then Abort;
		if not prif_CheckBlank(datasgjtreason,
      [FieldByName('code'), FieldByName('name')]) then Abort;
  end;
end;

procedure TfrmAccidentCode.datasgjtreasonAfterScroll(DataSet: TDataSet);
begin
  if f_unite then Pri_unite(datasgjtreason,'code_acct_reasondetail');
end;


procedure TfrmAccidentCode.baseMagPageCrtChange(Sender: TObject);
var vPagIndex : integer;
begin
  vPagIndex := baseMagPageCrt.ActivePage.TabIndex;
  f_unite := False;
  case vPagIndex of
    0: BMagPageCrtChange(datasgkind,DataSsgkind,'code_acct_kind');
    1: BMagPageCrtChange(datasgattr,DataSsgattr,'code_acct_char');
    2: BMagPageCrtChange(datasgformat,DataSsgformat,'code_acct_type');
    3: BMagPageCrtChange(datasgreason,DataSsgreason,'code_acct_reason');
    4: BMagPageCrtChange(datasgjtreason,DataSsgjtreason,'code_acct_reasondetail');
  end;

end;

procedure TfrmAccidentCode.BMagPageCrtChange(vData : TCSADOQuery;
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
  navbasedata.DataSource := vDataS;
  CategoryFind.DataSet := vData;
  Screen.Cursor := crDefault;
end;


function TfrmAccidentCode.Pri_CountId :string;
var
  vtId, vtTable : string;
  vtLen, vt_i ,i: integer;
begin
  case baseMagPageCrt.ActivePage.TabIndex of
    0: vtTable := 'code_acct_kind';
    1: vtTable := 'code_acct_char';
    2: vtTable := 'code_acct_type';
    3: vtTable := 'code_acct_reason';
    4: vtTable := 'code_acct_reasondetail';
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


procedure TfrmAccidentCode.bbtnInsertClick(Sender: TObject);
begin
    case baseMagPageCrt.ActivePageIndex  of
    0: pri_GridInsert(datasgkind);
    1: pri_GridInsert(datasgattr);
    2: pri_GridInsert(datasgformat);
    3: pri_GridInsert(datasgreason);
    4: pri_GridInsert(datasgjtreason);
    end;
end;

procedure TfrmAccidentCode.pri_GridInsert(vDataSet: TCSADOQuery);
begin
  with vDataSet do
  begin
    vDataSet.Append;
    FieldByName('id').Value := Pri_CountId;
    FieldByName('outflag').Value := 1;
    f_PageSaved := False;
  end;
end;

function TfrmAccidentCode.prif_Checkrepeat(Ch_code : String;
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


function TfrmAccidentCode.prif_CheckBlank(vDataSet: TCSADOQuery;
  Ac_Fields: array of TField) : Boolean;
var
  li_i: integer;
begin
  Result := True;
  with temp do
  begin
    if Active then close;
    SQL.Text:=''

  end;
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
//      showmessage(VarToStr(Ac_Fields[li_i].Value)) ;
end;


procedure TfrmAccidentCode.baseMagPageCrtChanging(Sender: TObject;
  var AllowChange: Boolean);
var
  vDataSet : TCSADOQuery;
begin
  case baseMagPageCrt.ActivePageIndex  of
    0: vDataSet := datasgkind;
    1: vDataSet := datasgattr;
    2: vDataSet := datasgformat;
    3: vDataSet := datasgreason;
    4: vDataSet := datasgjtreason;
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

procedure TfrmAccidentCode.bbtnDeleteClick(Sender: TObject);
begin
  case baseMagPageCrt.ActivePageIndex of
  0: Pri_GetUnTvInfo(datasgkind);
  1: Pri_GetUnTvInfo(datasgattr);
  2: Pri_GetUnTvInfo(datasgformat);
  3: Pri_GetUnTvInfo(datasgreason);
  4: Pri_GetUnTvInfo(datasgjtreason);
  end;
end;

procedure  TfrmAccidentCode.Pri_GetUnTvInfo (vDataSet: TCSADOQuery);
begin
  with vDataSet do
  begin
    vun_Id := FieldByName('id').Value;
    vun_Name := FieldByName('name').Value;
  end;
  f_unite := True;
  Application.MessageBox(PChar('请选择将’' + vun_Name +
    ' ’并入的目标代码。'),PChar(Caption),MB_OK + MB_ICONQUESTION);
end;

procedure  TfrmAccidentCode.Pri_unite (vDataSet: TCSADOQuery; Un_Table : string);
var
  vEnd_id,vEnd_Name : string;
begin

  with vDataSet do
  begin
    f_unite := False;
    vEnd_id := FieldByName('id').Value;
    vEnd_name := FieldByName('name').Value;
    if Application.MessageBox(PChar('确定将’ ' + vun_Name +' ’代码并入代码’ '
      + vEnd_Name + ' ’？'), PChar(Caption),MB_OKCANCEL	 +
      MB_DEFBUTTON1 + MB_ICONQUESTION) = IDOK	then
    begin
      Screen.Cursor := crHourGlass;
      if Locate('id', vun_id, [loCaseInsensitive]) then
        Delete;
      Refresh;
      Screen.Cursor := crDefault;
    end else
    begin
      vEnd_id :='';
      vEnd_name :='';
      vun_Id :='';
    end;
  end;
end;

procedure TfrmAccidentCode.bbtnFindClick(Sender: TObject);
begin
  CategoryFind.FindDlg;
end;

end.

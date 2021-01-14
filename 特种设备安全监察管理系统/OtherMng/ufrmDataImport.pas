unit ufrmDataImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, OleServer, pbplsrv_TLB, DB, ADODB,
  CSADOQuery;

const
  UNIT_NUM = 21;
  
type
  TfrmDataImport = class(TForm)
    DataImport: TCOCls_n_pbplsrv;
    opdSrc: TOpenDialog;
    Panel1: TPanel;
    bbtnImport: TBitBtn;
    Panel2: TPanel;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    mLog: TMemo;
    Temp: TCSADOQuery;
    srccon: TADOConnection;
    procedure FormCreate(Sender: TObject);
    procedure bbtnImportClick(Sender: TObject);
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Fs_SysPath, Fs_ConnStr, Fs_ImportFile: string;
    Fia_Counts: array[1..UNIT_NUM] of Integer;
    function prif_OpenSrcFile(var As_Errmsg: string): Boolean;
    function prif_CreateDataLinkFile(var As_ErrMsg: string;
      const As_FileName: string; const As_ConnStr: WideString): Boolean;
    procedure prip_PrepareWorks;
    procedure prip_DeleteDataLinkFile(const As_FileName: string);
    function prif_ProcessLocalDB: Boolean;
    function prif_DeleteLocalDB: Boolean;
    procedure prip_Import;
  public
    { Public declarations }
  end;

var
  frmDataImport: TfrmDataImport;

implementation

uses
  Registry, IniFiles, CSUtils, udmData, CommonLib;

{$R *.dfm}

const
  DATALINKFILESRC = 'srcdb.udl';
  DATALINKFILEDEST = 'destdb.udl';

  PROCESS_SQL = 'device.xi01_usp_process_data';
  RESET_SQL = 'device.xi01_usp_reset_data';

  PL_OBJS: array[1..UNIT_NUM] of WideString = (
    'pl_xi01_equipment_info',
    'pl_xi01_organ_baseinfo',
    'pl_xi01_organ_contact',
    'pl_xi01_organ_cert',
    'pl_xi01_organ_cert_prj',
    'pl_xi01_organ_cert_prj_modal',
    'pl_xi01_organ_requirement',
    'pl_xi01_organ_authinfo',
    'pl_xi01_organ_cert_prd',
    'pl_xi01_organ_cert_dept',
    'pl_xi01_organ_cert_equip',
    'pl_xi01_organ_cert_const',
    'pl_xi01_organ_cert_doc',
    'pl_xi01_organ_cert_psn',
    'pl_xi01_person_baseinfo',
    'pl_xi01_person_test',
    'pl_xi01_person_engage_prj',
    'pl_xi01_person_check_prj',
    'pl_xi01_person_infract_info',
    'pl_xi01_person_license',
    'pl_xi01_person_license_prj');
  PL_TABLES: array[1..UNIT_NUM] of string = (
    'x01_equipment_info',
    'x01_organ_baseinfo',
    'x01_organ_contact',
    'x01_organ_cert',
    'x01_organ_cert_prj',
    'x01_organ_cert_prj_modal',
    'x01_organ_requirement',
    'x01_organ_authinfo',
    'x01_organ_cert_prd',
    'x01_organ_cert_dept',
    'x01_organ_cert_equip',
    'x01_organ_cert_const',
    'x01_organ_cert_doc',
    'x01_organ_cert_psn',
    'x01_person_baseinfo',
    'x01_person_test',
    'x01_person_engage_prj',
    'x01_person_check_prj',
    'x01_person_infract_info',
    'x01_person_license',
    'x01_person_license_prj');
  PL_TIPS: array[1..UNIT_NUM] of string = (
    '设备基本信息',
    '单位基本信息',
    '单位联系信息',
    '机构许可证基本信息',
    '机构许可证项目',
    '机构许可证项目型式',
    '机构许可证评审信息',
    '机构认证信息',
    '机构工作情况',
    '机构部门情况',
    '机构生产设备及检验仪器情况',
    '机构分包外协情况',
    '机构文件资料情况',
    '机构人员情况',
    '人员基本信息',
    '人员培训考核信息',
    '人员聘用资格项目',
    '人员审查备案',
    '人员资格违规记录',
    '人员资质信息',
    '人员资质项目信息');

{ TfrmDataImport }

procedure TfrmDataImport.FormCreate(Sender: TObject);
begin
  Fs_SysPath := GetWinSysPath;
  Fs_ImportFile := '';
  Fs_ConnStr := dmData.adocon.ConnectionString;
end;

procedure TfrmDataImport.prip_Import;
var
  li_i, li_rc: Integer;
  ls_ErrMsg: string;
  ls_Path, ls_Msg: WideString;
begin
  li_rc := -1;
  ls_Msg := ' ';
  with DataImport do
  begin
    Connect;
    try
      ls_Path := Gs_AppPath;
      if not initialize(ls_Path, ls_Path) then
      begin
        ls_Msg := '初始化失败';
        Exit;
      end;

      setprogressmodetext;

      setconnoledbsrc(WideFormat('DATALINK=''%s'',' +
        'INIT_PROMPT=''DBPROMPT_NOPROMPT''', [Gs_AppPath + DATALINKFILESRC]),
        False, ' ', ' ');
      setconnoledbdest(WideFormat('DATALINK=''%s'',' +
        'INIT_PROMPT=''DBPROMPT_NOPROMPT''', [Gs_AppPath + DATALINKFILEDEST]),
        False, ' ', ' ');

      if not prif_OpenSrcFile(ls_ErrMsg) then Exit;
      
      mLog.Lines.Add('打开源数据...');
      mLog.Update;
      if not prif_CreateDataLinkFile(ls_ErrMsg, DATALINKFILESRC, WideFormat(
        'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;User ID=Admin',
        [Fs_ImportFile])) then Exit;
      try
        try
          prip_PrepareWorks;
        except
          on E: Exception do
          begin
            ls_Msg := E.Message;
            Exit;
          end;
        end;
        if not opensrcwithmsg(ls_Msg) then Exit;
      finally
        prip_DeleteDataLinkFile(DATALINKFILESRC);
      end;

      mLog.Lines.Add('打开目标数据...');
      mLog.Update;
      if not prif_CreateDataLinkFile(ls_ErrMsg, DATALINKFILEDEST,
        WideFormat('%s;Password=%s', [dmData.adocon.ConnectionString,
        dmData.pubf_GetConnPwd])) then Exit;
      try
        if not opendestwithmsg(ls_Msg) then Exit;
      finally
        prip_DeleteDataLinkFile(DATALINKFILEDEST);
      end;
      mLog.Lines.Add('');

      mLog.Lines.Add('导入数据...');
      mLog.Lines.Add('');
      mLog.Update;
      for li_i := 1 to UNIT_NUM do
      begin
        loaddataobject(PL_OBJS[li_i]);
        setparams(PL_TIPS[li_i], 0);
        mLog.Lines.Add(Format('正在导入%s...', [PL_TIPS[li_i]]));
        mLog.Update;
        li_rc := startwithmsg(ls_Msg);
        if li_rc <> 1 then Break;
        mLog.Lines.Add(Format('导入%s完成，%d条记录', [PL_TIPS[li_i],
          Fia_Counts[li_i]]));
        mLog.Lines.Add('');
        mLog.Update;
      end;

      closeprogress;
      closedest;
      closesrc;

      prif_ProcessLocalDB;
    finally
      try
        closeprogress;
        closedest;
        closesrc;
      except
      end;

      if li_rc = 1 then ls_ErrMsg := '数据导入成功'
      else if ls_Msg <> ' ' then ls_ErrMsg := ls_Msg;
      mLog.Lines.Add(ls_ErrMsg);
      mLog.Update;

      prif_DeleteLocalDB;

      Disconnect;
    end;
  end;
end;

procedure WriteWideStringLine(const Ac_File: TFileStream; As_Line: WideString);
const
  BUFSIZE = 64;
var
  li_i, li_j, li_Length, li_BufLen, li_Times, li_PassLen: Integer;
  lc_Line: PChar;
  lc_Buf: array[1..BUFSIZE] of Char;
begin
  As_Line := As_Line + WideFormat('%s', [#13#10]);
  li_Length := Length(As_Line) * 2;
  lc_Line := Pointer(As_Line);

  li_Times := li_Length div BUFSIZE;
  if li_Length mod BUFSIZE <> 0 then Inc(li_Times);

  for li_i := 1 to li_Times do
  begin
    li_PassLen := (li_i - 1) * BUFSIZE;
    
    if li_i = li_Times then li_BufLen := li_Length - li_PassLen
    else li_BufLen := BUFSIZE;

    for li_j := 1 to li_BufLen do
      lc_Buf[li_j] := (lc_Line + li_PassLen + li_j - 1)^;

    Ac_File.Write(lc_Buf, li_BufLen);
  end;
end;

function TfrmDataImport.prif_CreateDataLinkFile(var As_ErrMsg: string;
  const As_FileName: string; const As_ConnStr: WideString): Boolean;
var
  lc_Buf: array[1..2] of Char;
  lc_File: TFileStream;
begin
  lc_File := TFileStream.Create(Gs_AppPath + As_FileName, fmCreate);
  try
    lc_Buf[1] := Char(255);
    lc_Buf[2] := Char(254);
    lc_File.Write(lc_Buf, 2);
    WriteWideStringLine(lc_File, '[oledb]');
    WriteWideStringLine(lc_File,
      '; Everything after this line is an OLE DB initstring');
    WriteWideStringLine(lc_File, As_ConnStr);
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      As_ErrMsg := E.Message;
    end;
  end;
  lc_File.Free;
end;

procedure TfrmDataImport.bbtnImportClick(Sender: TObject);
begin
  prip_Import;
end;

procedure TfrmDataImport.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDataImport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmDataImport.prip_DeleteDataLinkFile(const As_FileName: string);
begin
  if FileExists(Gs_AppPath + As_FileName) then
    DeleteFile(Gs_AppPath + As_FileName);
end;

procedure TfrmDataImport.prip_PrepareWorks;
var
  li_i: Integer;
begin
  with srccon do
  begin
    ConnectionString := Format('Provider=Microsoft.Jet.OLEDB.4.0;' +
      'Data Source=%s;Persist Security Info=False', [Fs_ImportFile]);
    Open;
  end;

  try
    with Temp do
    begin
      for li_i := 1 to UNIT_NUM do
      begin
        if Active then Close;
        SQL.Text := Format('SELECT COUNT(*) FROM %s', [PL_TABLES[li_i]]);
        Open;
        Fia_Counts[li_i] := Fields[0].AsInteger;
        Close;
      end;
    end;
  finally
    srccon.Close;
  end;
end;

function TfrmDataImport.prif_DeleteLocalDB: Boolean;
begin
  Screen.Cursor := crHourGlass;
  try
    dmData.adocon.Execute(RESET_SQL);
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      mLog.Lines.Add('');
      mLog.Lines.Add(E.Message);
      mLog.Lines.Add('');
    end;
  end;
  Screen.Cursor := crDefault;
end;

function TfrmDataImport.prif_ProcessLocalDB: Boolean;
begin
  Screen.Cursor := crHourGlass;
  mLog.Lines.Add('最终处理...');
  mLog.Update;
  try
    dmData.adocon.Execute(PROCESS_SQL);
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      mLog.Lines.Add(E.Message);
    end;
  end;
  mLog.Lines.Add('');
  Screen.Cursor := crDefault;
end;

function TfrmDataImport.prif_OpenSrcFile(var As_Errmsg: string): Boolean;
begin
  opdSrc.InitialDir := Gs_AppPath;
  Result := opdSrc.Execute;
  if not Result then
  begin
    Result := False;
    As_ErrMsg := 'User canceled';
    Exit;
  end;
  Fs_ImportFile := opdSrc.FileName;
end;

end.

unit ufrmAcctUserSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, CSADOQuery, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  dxEditor, dxExEdtr, dxEdLib, dxDBELib, dxCntner, Buttons, ExtCtrls,
  CSScrCtrlChild, CSBarMDIChild, dxmdaset;

type
  TfrmAcctUserSetting = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    AcctUserInfo: TCSADOQuery;
    AcctUserInfod: TDataSource;
    Panel11: TPanel;
    bbtnConfirm: TBitBtn;
    bbtnCancel: TBitBtn;
    dxDBEdit1: TdxDBEdit;
    dxDBEdit3: TdxDBEdit;
    dxDBEdit5: TdxDBEdit;
    dxDBEdit6: TdxDBEdit;
    dxDBEdit7: TdxDBEdit;
    dxDBEdit8: TdxDBEdit;
    dxDBEdit10: TdxDBEdit;
    dxDBEdit11: TdxDBEdit;
    dxDBHyperLinkEdit1: TdxDBHyperLinkEdit;
    Province: TCSADOQuery;
    provinced: TDataSource;
    City: TCSADOQuery;
    cityd: TDataSource;
    Borough: TCSADOQuery;
    boroughd: TDataSource;
    Label4: TLabel;
    lcmbProvince: TDBLookupComboboxEh;
    Label3: TLabel;
    lcmbCity: TDBLookupComboboxEh;
    Label14: TLabel;
    lcmbBorough: TDBLookupComboboxEh;
    AcctUserInfosysid: TStringField;
    AcctUserInfouser_com: TStringField;
    AcctUserInfocom_level: TStringField;
    AcctUserInfocom_level_id: TIntegerField;
    AcctUserInfopath: TStringField;
    AcctUserInfoprovince_id: TStringField;
    AcctUserInfoprovince: TStringField;
    AcctUserInfocity_id: TStringField;
    AcctUserInfocity: TStringField;
    AcctUserInfoborough_id: TStringField;
    AcctUserInfoborough: TStringField;
    AcctUserInfoaddress: TStringField;
    AcctUserInfotel: TStringField;
    AcctUserInfofax: TStringField;
    AcctUserInfozip: TStringField;
    AcctUserInfoemail: TStringField;
    AcctUserInfoweb: TStringField;
    AcctUserInfodeputy: TStringField;
    AcctUserInfodeclarer: TStringField;
    AcctUserInfouser_num: TIntegerField;
    AcctUserInfooutflag: TIntegerField;
    CSBarMDIChild1: TCSBarMDIChild;
    ScrChild: TCSScrCtrlChild;
    memComLevel: TdxMemData;
    memComLevelid: TIntegerField;
    memComLevelname: TStringField;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    memComLeveld: TDataSource;
    procedure lcmbProvinceKeyValueChanged(Sender: TObject);
    procedure lcmbCityKeyValueChanged(Sender: TObject);
    procedure bbtnConfirmClick(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AcctUserInfoAfterInsert(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    procedure prip_IniData;
    procedure prip_RefreshCity;
    procedure prip_RefreshBorough;
		function prif_CheckBlank(Ac_DataSet: TDataSet;
      As_Fields: array of string): Boolean;
    function prif_CheckSaved: Boolean;
  public
    procedure pubp_Ini;
  end;

var
  frmAcctUserSetting: TfrmAcctUserSetting;

implementation

uses
  CSVCLUtils, udmData, CommonLib;
  
{$R *.dfm}

{ TfrmAcctUserSetting }

procedure TfrmAcctUserSetting.pubp_Ini;
begin
  ScrChild.SetSecurity(Self);
  try
    Gp_ProgressHint(Format('正在打开%s，请稍候...', [Caption]));
    prip_IniData;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmAcctUserSetting.prip_IniData;
begin
  with Province do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE ' +
      'code LIKE ''%s'' AND code_level = %d', [TOPAREACODE, PROVINCELEVEL]);
    Open;
  end;

  with City do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE code_level = %d',
      [CITYLEVEL]);
    Open;
  end;

  with Borough do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE code_level in ' +
      '(%d, %d)', [BOROUTHLEVEL, RESERVEDLEVEL]);
    Open;
  end;

  with AcctUserInfo do
  begin
    if not Active then Close;
    SQL.Text := 'SELECT * FROM device.acct_user_info';
    Open;
  end;
end;

procedure TfrmAcctUserSetting.prip_RefreshBorough;
var
  ls_CityId: string;
begin
 	with AcctUserInfo do
	  if State = dsBrowse then ls_CityId := VarToStr(FieldValues['city_id'])
    else begin
			ls_CityId := VarToStr(lcmbCity.Value);
      FieldByName('borough_id').Clear;
    end;

  with Borough do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE ' +
      'parent_id = ''%s''', [ls_CityId]);
    Open;
  end;
end;

procedure TfrmAcctUserSetting.prip_RefreshCity;
var
  ls_ProvinceId: string;
begin
  with AcctUserInfo do
	  if State = dsBrowse then
      ls_ProvinceId := VarToStr(FieldValues['province_id'])
    else begin
      ls_ProvinceId := VarToStr(lcmbProvince.Value);
      FieldByName('city_id').Clear;
  	end;

  with City do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE ' +
      'parent_id = ''%s''', [ls_ProvinceId]);
    Open;
  end;
end;

procedure TfrmAcctUserSetting.lcmbProvinceKeyValueChanged(Sender: TObject);
begin
  prip_RefreshCity;
end;

procedure TfrmAcctUserSetting.lcmbCityKeyValueChanged(Sender: TObject);
begin
  prip_RefreshBorough;
end;

procedure TfrmAcctUserSetting.bbtnConfirmClick(Sender: TObject);
begin
  if AcctUserInfo.State <> dsBrowse then
  begin
    if not prif_CheckBlank(AcctUserInfo, ['com_level_id', 'user_com',
      'province_id', 'city_id', 'borough_id', 'address', 'zip', 'tel', 'deputy',
      'declarer']) then Exit;

    with AcctUserInfo do
    begin
      Edit;
      FieldValues['com_level'] := memComLevel.FieldValues['name'];
      FieldValues['province'] := Province.FieldValues['name'];
      FieldValues['city'] := City.FieldValues['name'];
      FieldValues['borough'] := Borough.FieldValues['name'];
      Post;
    end;
    Close;
  end else Close;
end;

procedure TfrmAcctUserSetting.bbtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAcctUserSetting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmAcctUserSetting.prif_CheckSaved: Boolean;
var
  li_Result: Integer;
begin
  Result := True;

  with AcctUserInfo do
  begin
    if State <> dsBrowse then
    begin
      li_Result := Application.MessageBox('数据尚未保存，是否要保存数据?',
        PChar(Caption), MB_YESNOCANCEL + MB_ICONQUESTION);
      case li_Result of
        IDYES:
          begin
            Post;
            Result := True;
          end;
        IDNO:
          begin
            Cancel;
            Result := True;
          end;
        IDCANCEL: Result := False;
      end;
    end;
  end;
end;

procedure TfrmAcctUserSetting.AcctUserInfoAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldValues['sysid'] := Gf_GenSysId;
end;

procedure TfrmAcctUserSetting.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := prif_CheckSaved;
end;

function TfrmAcctUserSetting.prif_CheckBlank(Ac_DataSet: TDataSet;
  As_Fields: array of string): Boolean;
var
	li_i: Integer;
begin
	Result := True;
	with Ac_DataSet do
		for li_i := 0 to Length(As_Fields) - 1 do
			if Trim(VarToStr(FieldValues[As_Fields[li_i]])) = '' then
      begin
				Result := False;
				Application.MessageBox(PChar(FieldByName(As_Fields[li_i]).DisplayLabel +
          '不能为空。'), PChar(Caption), MB_OK + MB_ICONWARNING);
				FieldByName(As_Fields[li_i]).FocusControl;
				Exit;
			end;
end;

end.

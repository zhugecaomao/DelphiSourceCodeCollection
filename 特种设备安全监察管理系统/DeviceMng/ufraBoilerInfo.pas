unit ufraBoilerInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufraTechInfoBase, DB, ADODB, CSADOQuery, DBCtrls, CSDBNavigator,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DBCtrlsEh, dxCntner,
  dxEditor, dxExEdtr, dxEdLib, CSdxDBDateEdit, Mask, dxDBELib,
  CSCustomdxDateEdit;

type
  TfraBoilerInfo = class(TfraTechInfoBase)
    BoilerSafetyInfo: TCSADOQuery;
    BoilerSafetyInfodevice_id: TStringField;
    BoilerSafetyInforec_no: TIntegerField;
    BoilerSafetyInfoname: TStringField;
    BoilerSafetyInfotype: TStringField;
    BoilerSafetyInfospec: TStringField;
    BoilerSafetyInfonum: TIntegerField;
    BoilerSafetyInfomanu: TStringField;
    BoilerSafetyInfod: TDataSource;
    BoilerPartInfo: TCSADOQuery;
    BoilerPartInfodevice_id: TStringField;
    BoilerPartInforec_no: TIntegerField;
    BoilerPartInfoname: TStringField;
    BoilerPartInfomain_material: TStringField;
    BoilerPartInfomain_thick: TBCDField;
    BoilerPartInfohead_material: TStringField;
    BoilerPartInfohead_thick: TBCDField;
    BoilerPartInfospec: TStringField;
    BoilerPartInfonum: TIntegerField;
    BoilerPartInfod: TDataSource;
    GroupBox4: TGroupBox;
    Label62: TLabel;
    Label63: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label57: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label30: TLabel;
    Label39: TLabel;
    Label51: TLabel;
    Label47: TLabel;
    Label42: TLabel;
    Label37: TLabel;
    Label54: TLabel;
    Label65: TLabel;
    Label49: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label41: TLabel;
    Label48: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label50: TLabel;
    Label38: TLabel;
    Label45: TLabel;
    CSdxDBDateEdit1: TCSdxDBDateEdit;
    CSdxDBDateEdit2: TCSdxDBDateEdit;
    Label36: TLabel;
    Label66: TLabel;
    Label46: TLabel;
    Label35: TLabel;
    Label32: TLabel;
    Label44: TLabel;
    Label43: TLabel;
    GroupBox3: TGroupBox;
    Label61: TLabel;
    Label64: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label79: TLabel;
    Label78: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit20: TDBEditEh;
    Label12: TLabel;
    DBEdit25: TDBEditEh;
    DBEdit30: TDBEditEh;
    DBEdit33: TDBEditEh;
    DBEdit21: TDBEditEh;
    DBEdit23: TDBEditEh;
    DBEdit26: TDBEditEh;
    DBEdit28: TDBEditEh;
    DBEdit131: TDBEditEh;
    DBEdit34: TDBEditEh;
    DBEdit22: TDBEditEh;
    DBEdit24: TDBEditEh;
    DBEdit27: TDBEditEh;
    DBEdit29: TDBEditEh;
    DBEdit32: TDBEditEh;
    DBEdit18: TDBEditEh;
    DBEdit19: TDBEditEh;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit1: TDBEditEh;
    DBEdit3: TDBEditEh;
    DBEdit6: TDBEditEh;
    DBEdit9: TDBEditEh;
    DBEdit12: TDBEditEh;
    DBEdit15: TDBEditEh;
    DBEdit16: TDBEditEh;
    DBEdit2: TDBEditEh;
    DBEdit4: TDBEditEh;
    DBEdit7: TDBEditEh;
    DBEdit10: TDBEditEh;
    DBEdit13: TDBEditEh;
    DBEdit17: TDBEditEh;
    DBEdit5: TDBEditEh;
    DBEdit8: TDBEditEh;
    DBEdit11: TDBEditEh;
    DBEdit14: TDBEditEh;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    dxDBPickEdit1: TdxDBPickEdit;
    dxDBPickEdit2: TdxDBPickEdit;
    dxDBPickEdit3: TdxDBPickEdit;
    dxDBPickEdit4: TdxDBPickEdit;
    dxDBPickEdit5: TdxDBPickEdit;
    dxDBPickEdit6: TdxDBPickEdit;
    dxDBPickEdit7: TdxDBPickEdit;
    dxDBPickEdit8: TdxDBPickEdit;
    dxDBPickEdit9: TdxDBPickEdit;
    dxDBPickEdit10: TdxDBPickEdit;
    dxDBPickEdit11: TdxDBPickEdit;
    dxDBPickEdit12: TdxDBPickEdit;
    dxDBPickEdit13: TdxDBPickEdit;
    dxDBPickEdit14: TdxDBPickEdit;
    dxDBPickEdit15: TdxDBPickEdit;
    dxDBPickEdit16: TdxDBPickEdit;
    dxDBPickEdit17: TdxDBPickEdit;
    dxDBPickEdit18: TdxDBPickEdit;
    Splitter1: TSplitter;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    Splitter2: TSplitter;
    GroupBox2: TGroupBox;
    DBGridEh2: TDBGridEh;
    GroupBox10: TGroupBox;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    dxDBPickEdit19: TdxDBPickEdit;
    dxDBPickEdit20: TdxDBPickEdit;
    dxDBPickEdit21: TdxDBPickEdit;
    Label87: TLabel;
    DBMemo1: TdxDBMemo;
    Label88: TLabel;
    dxDBPickEdit22: TdxDBPickEdit;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit31: TDBEditEh;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    navBoilerSafetyInfo: TCSDBNavigator;
    Panel5: TPanel;
    navBoilerPartInfo: TCSDBNavigator;
    bbtnSafetyInsert: TBitBtn;
    bbtnSafetyDelete: TBitBtn;
    bbtnPartInsert: TBitBtn;
    bbtnPartDelete: TBitBtn;
    procedure BoilerSafetyInfoAfterInsert(DataSet: TDataSet);
    procedure BoilerPartInfoAfterInsert(DataSet: TDataSet);
    procedure bbtnSafetyInsertClick(Sender: TObject);
    procedure bbtnSafetyDeleteClick(Sender: TObject);
    procedure bbtnPartInsertClick(Sender: TObject);
    procedure bbtnPartDeleteClick(Sender: TObject);
  private
    procedure prip_GetElecPartInfo;
  protected
    procedure prop_GetTechInfo; override;
    procedure prop_GetSafetyPartInfo; override;
  public
    procedure pubp_Ini(const As_Id: string;
      const As_VerifyId: string = ''); override;
  end;

implementation

uses
  udmData;

{$R *.dfm}

{ TfraBoilerInfo }

procedure TfraBoilerInfo.prip_GetElecPartInfo;
begin
  //TODO:锅炉技术参数
  with BoilerPartInfo do
  begin
    if Active then Close;
    if VerifyId = '' then
      SQL.Text := Format('SELECT * FROM device.boiler_part_info WHERE ' +
        'dev_id = ''%s''', [DeviceId]);
   { else
      SQL.Text := Format('SELECT * FROM device.boiler_part_info_hst WHERE ' +
        'flow_id = ''%s'' AND dev_id = ''%s''', [VerifyId, DeviceId]);  }
    Open;
  end;
end;

procedure TfraBoilerInfo.prop_GetSafetyPartInfo;
begin
  with BoilerSafetyInfo do
  begin
    if Active then Close;
    if VerifyId = '' then
      SQL.Text := Format('SELECT * FROM device.boiler_safety_info WHERE ' +
        'dev_id = ''%s''', [DeviceId]);
    {else
      SQL.Text := Format('SELECT * FROM device.boiler_safety_info_hst WHERE ' +
        'dev_id = ''%s'' AND flow_id = ''%s''', [DeviceId, VerifyId]);}
    Open;
  end;
end;

procedure TfraBoilerInfo.prop_GetTechInfo;
begin
  with TechInfo do
  begin
    if Active then Close;
    if VerifyId = '' then
      SQL.Text := Format('SELECT * FROM device.boiler_info WHERE dev_id = ''%s''',
        [DeviceId]);
    {else
      SQL.Text := Format('SELECT * FROM device.boiler_info_hst WHERE ' +
        'flow_id = ''%s'' AND dev_id = ''%s''', [VerifyId, DeviceId]);}
    Open;
  end;
end;

procedure TfraBoilerInfo.pubp_Ini(const As_Id, As_VerifyId: string);
begin
  inherited;

  prop_GetSafetyPartInfo;
  prip_GetElecPartInfo;
  prop_LoadTechInfoItems('锅炉燃料种类', dxDBPickEdit1);
  prop_LoadTechInfoItems('锅炉房类别', dxDBPickEdit2);
  prop_LoadTechInfoItems('锅炉燃烧方式', dxDBPickEdit3);
  prop_LoadTechInfoItems('锅炉水处理方式', dxDBPickEdit4);
  prop_LoadTechInfoItems('锅炉结构型式', dxDBPickEdit5);
  prop_LoadTechInfoItems('锅炉使用状态', dxDBPickEdit6);
  prop_LoadTechInfoItems('锅炉用途', dxDBPickEdit7);
  prop_LoadTechInfoItems('锅炉出渣方式', dxDBPickEdit8);
  prop_LoadTechInfoItems('锅炉除氧方式', dxDBPickEdit9);
  prop_LoadTechInfoItems('锅炉加热方式', dxDBPickEdit10);
  prop_LoadTechInfoItems('锅炉消烟除尘方式', dxDBPickEdit11);
  prop_LoadTechInfoItems('锅炉过热蒸汽调温方式', dxDBPickEdit13);
  prop_LoadTechInfoItems('锅炉补给水处理方式', dxDBPickEdit14);
  prop_LoadTechInfoItems('锅炉水循环方式', dxDBPickEdit15);
  prop_LoadTechInfoItems('锅炉汽水分离装置', dxDBPickEdit16);
  prop_LoadTechInfoItems('锅炉燃烧器布置方式', dxDBPickEdit17);
  prop_LoadTechInfoItems('锅炉再热蒸汽调温方式', dxDBPickEdit18);
  prop_LoadTechInfoItems('锅炉设计规范', dxDBPickEdit12);
  prop_LoadTechInfoItems('锅炉设计规范', dxDBPickEdit22);
  prop_LoadTechInfoItems('锅炉制造规范', dxDBPickEdit19);
  prop_LoadTechInfoItems('锅炉设备新旧状况', dxDBPickEdit20);
  prop_LoadTechInfoItems('锅炉监检形式', dxDBPickEdit21);
end;

procedure TfraBoilerInfo.BoilerSafetyInfoAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('dev_id').AsString := DeviceId;
    FieldByName('rec_no').AsInteger :=
      prof_GenerateRecNo('device.boiler_safety_info');
  end;
end;

procedure TfraBoilerInfo.BoilerPartInfoAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('dev_id').AsString := DeviceId;
    FieldByName('rec_no').AsInteger :=
      prof_GenerateRecNo('device.boiler_part_info');
  end;
end;

procedure TfraBoilerInfo.bbtnSafetyInsertClick(Sender: TObject);
begin
  BoilerSafetyInfo.Insert;  
end;

procedure TfraBoilerInfo.bbtnSafetyDeleteClick(Sender: TObject);
begin
  with BoilerSafetyInfo do
  begin
    if (not Active) or IsEmpty then Exit;
    if Application.MessageBox('您确定要删除当前锅炉部件设备吗?', '确认删除',
      MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK then Delete;
  end;
end;

procedure TfraBoilerInfo.bbtnPartInsertClick(Sender: TObject);
begin
  BoilerPartInfo.Insert;
end;

procedure TfraBoilerInfo.bbtnPartDeleteClick(Sender: TObject);
begin
  with BoilerPartInfo do
  begin
    if (not Active) or IsEmpty then Exit;
    if Application.MessageBox('您确定要删除当前电站锅炉部件吗?', '确认删除',
      MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK then Delete;
  end;
end;

end.

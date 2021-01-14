unit ufraVesselInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufraTechInfoBase, DB, ADODB, CSADOQuery, DBCtrls, CSDBNavigator,
  StdCtrls, Buttons, ExtCtrls, Mask, Grids, DBGridEh, DBCtrlsEh, dxCntner,
  dxEditor, dxExEdtr, dxEdLib, CSdxDBDateEdit, dxDBELib, CSCustomdxDateEdit;

type
  TfraVesselInfo = class(TfraTechInfoBase)
    VesselSafetyInfo: TCSADOQuery;
    VesselSafetyInfodevice_id: TStringField;
    VesselSafetyInforec_no: TIntegerField;
    VesselSafetyInfoname: TStringField;
    VesselSafetyInfotype: TStringField;
    VesselSafetyInfospec: TStringField;
    VesselSafetyInfonum: TIntegerField;
    VesselSafetyInfomanu: TStringField;
    VesselSafetyInfod: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEditEh;
    Label3: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Splitter1: TSplitter;
    Label46: TLabel;
    Label47: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    DBEdit5: TDBEditEh;
    DBEdit7: TDBEditEh;
    GroupBox1: TGroupBox;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    DBEdit13: TDBEditEh;
    DBEdit14: TDBEditEh;
    GroupBox2: TGroupBox;
    Label19: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    DBEdit15: TDBEditEh;
    DBEdit16: TDBEditEh;
    DBEdit17: TDBEditEh;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    Label67: TLabel;
    DBEdit21: TDBEditEh;
    DBEdit22: TDBEditEh;
    DBEdit23: TDBEditEh;
    DBEdit24: TDBEditEh;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label40: TLabel;
    DBEdit25: TDBEditEh;
    DBEdit26: TDBEditEh;
    DBEdit27: TDBEditEh;
    DBEdit28: TDBEditEh;
    GroupBox6: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label41: TLabel;
    DBEdit29: TDBEditEh;
    DBEdit30: TDBEditEh;
    DBEdit31: TDBEditEh;
    DBEdit32: TDBEditEh;
    GroupBox3: TGroupBox;
    DBEdit18: TDBEditEh;
    DBEdit19: TDBEditEh;
    DBEdit20: TDBEditEh;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBEdit35: TDBEditEh;
    DBEdit36: TDBEditEh;
    DBEdit37: TDBEditEh;
    GroupBox10: TGroupBox;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    DBEdit38: TDBEditEh;
    DBEdit39: TDBEditEh;
    DBEdit40: TDBEditEh;
    GroupBox11: TGroupBox;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    DBEdit41: TDBEditEh;
    DBEdit42: TDBEditEh;
    DBEdit43: TDBEditEh;
    GroupBox7: TGroupBox;
    Label21: TLabel;
    Label24: TLabel;
    GroupBox12: TGroupBox;
    Label51: TLabel;
    Label55: TLabel;
    GroupBox14: TGroupBox;
    DBEdit47: TDBEditEh;
    DBEdit49: TDBEditEh;
    DBEdit51: TDBEditEh;
    GroupBox15: TGroupBox;
    GroupBox16: TGroupBox;
    Label7: TLabel;
    Label11: TLabel;
    Label49: TLabel;
    Label27: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    DBEdit6: TDBEditEh;
    DBEdit8: TDBEditEh;
    DBEdit33: TDBEditEh;
    DBEdit34: TDBEditEh;
    DBEdit54: TDBEditEh;
    DBEdit55: TDBEditEh;
    DBEdit56: TDBEditEh;
    DBEdit3: TDBEditEh;
    DBEdit53: TDBEditEh;
    DBEdit11: TDBEditEh;
    DBEdit10: TDBEditEh;
    DBEdit9: TDBEditEh;
    Label33: TLabel;
    CSdxDBDateEdit2: TCSdxDBDateEdit;
    CSdxDBDateEdit1: TCSdxDBDateEdit;
    DBEdit12: TDBEditEh;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label45: TLabel;
    Label50: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    GroupBox13: TGroupBox;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    DBEdit44: TDBEditEh;
    DBEdit45: TDBEditEh;
    DBEdit46: TDBEditEh;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    dxDBPickEdit10: TdxDBPickEdit;
    dxDBPickEdit9: TdxDBPickEdit;
    dxDBPickEdit3: TdxDBPickEdit;
    dxDBPickEdit5: TdxDBPickEdit;
    dxDBPickEdit6: TdxDBPickEdit;
    dxDBPickEdit7: TdxDBPickEdit;
    dxDBPickEdit8: TdxDBPickEdit;
    dxDBPickEdit4: TdxDBPickEdit;
    GroupBox17: TGroupBox;
    DBGridEh1: TDBGridEh;
    GroupBox18: TGroupBox;
    Label39: TLabel;
    Label48: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    dxDBPickEdit15: TdxDBPickEdit;
    dxDBPickEdit16: TdxDBPickEdit;
    dxDBPickEdit17: TdxDBPickEdit;
    dxDBPickEdit14: TdxDBPickEdit;
    Label110: TLabel;
    DBMemo1: TdxDBMemo;
    Label68: TLabel;
    Label69: TLabel;
    Label73: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    navVesselSafetyInfo: TCSDBNavigator;
    bbtnSafetyInsert: TBitBtn;
    bbtnSafetyDelete: TBitBtn;
    Label74: TLabel;
    DBEditEh1: TDBEditEh;
    Label75: TLabel;
    DBEditEh2: TDBEditEh;
    Label76: TLabel;
    DBEditEh3: TDBEditEh;
    Label104: TLabel;
    DBEditEh4: TDBEditEh;
    Label105: TLabel;
    Label106: TLabel;
    Label111: TLabel;
    DBEditEh5: TDBEditEh;
    DBEditEh6: TDBEditEh;
    DBEditEh7: TDBEditEh;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    DBEditEh8: TDBEditEh;
    DBEditEh9: TDBEditEh;
    DBEditEh10: TDBEditEh;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    GroupBox19: TGroupBox;
    Label124: TLabel;
    dxDBPickEdit1: TdxDBPickEdit;
    DBEditEh11: TDBEditEh;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label139: TLabel;
    dxDBPickEdit2: TdxDBPickEdit;
    DBEditEh12: TDBEditEh;
    DBEditEh13: TDBEditEh;
    DBEditEh14: TDBEditEh;
    dxDBPickEdit11: TdxDBPickEdit;
    dxDBPickEdit12: TdxDBPickEdit;
    dxDBPickEdit13: TdxDBPickEdit;
    DBEditEh15: TDBEditEh;
    DBEditEh16: TDBEditEh;
    dxDBPickEdit18: TdxDBPickEdit;
    dxDBPickEdit19: TdxDBPickEdit;
    DBEditEh17: TDBEditEh;
    DBEditEh18: TDBEditEh;
    dxDBPickEdit20: TdxDBPickEdit;
    dxDBPickEdit21: TdxDBPickEdit;
    DBEditEh19: TDBEditEh;
    GroupBox20: TGroupBox;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    DBEditEh20: TDBEditEh;
    DBEditEh21: TDBEditEh;
    DBEditEh22: TDBEditEh;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label107: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    DBEditEh23: TDBEditEh;
    procedure VesselSafetyInfoAfterInsert(DataSet: TDataSet);
    procedure TechInfoBeforePost(DataSet: TDataSet);
    procedure bbtnSafetyInsertClick(Sender: TObject);
    procedure bbtnSafetyDeleteClick(Sender: TObject);
    procedure dxDBPickEdit5Change(Sender: TObject);
    procedure TechInfoAfterOpen(DataSet: TDataSet);
    procedure TechInfoAfterCancel(DataSet: TDataSet);
  private
    procedure prip_SwitchInterface;
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

{ TfraVesselInfo }

procedure TfraVesselInfo.prop_GetSafetyPartInfo;
begin
  with VesselSafetyInfo do
  begin
    if Active then Close;
    if VerifyId = '' then
      SQL.Text := Format('SELECT * FROM device.vessel_safety_info WHERE ' +
        'dev_id = ''%s''', [DeviceId]);
    {else
      SQL.Text := Format('SELECT * FROM device.vessel_safety_info_hst WHERE ' +
        'dev_id = ''%s'' AND flow_id = ''%s''', [DeviceId, VerifyId]);}
    Open;
  end;
end;

procedure TfraVesselInfo.prop_GetTechInfo;
begin
  with TechInfo do
  begin
    if Active then Close;
    if VerifyId = '' then
      SQL.Text := Format('SELECT * FROM device.vessel_info WHERE dev_id = ''%s''',
        [DeviceId]);
    {else
      SQL.Text := Format('SELECT * FROM device.vessel_info_hst WHERE ' +
        'flow_id = ''%s'' AND dev_id = ''%s''', [VerifyId, DeviceId]);}
    Open;
  end;
end;

procedure TfraVesselInfo.pubp_Ini(const As_Id, As_VerifyId: string);
begin
  inherited;

  prop_GetSafetyPartInfo;
  prop_LoadTechInfoItems('压力容器封头型式', dxDBPickEdit3);
  prop_LoadTechInfoItems('压力容器支座型式', dxDBPickEdit4);
  prop_LoadTechInfoItems('压力容器型式', dxDBPickEdit5);
  prop_LoadTechInfoItems('压力容器有无保温绝热', dxDBPickEdit6);
  prop_LoadTechInfoItems('压力容器是否快开门', dxDBPickEdit7);
  prop_LoadTechInfoItems('压力容器氧舱照明', dxDBPickEdit8);
  prop_LoadTechInfoItems('压力容器氧舱空调电机', dxDBPickEdit9);
  prop_LoadTechInfoItems('压力容器氧舱测氧方式', dxDBPickEdit10);
  prop_LoadTechInfoItems('压力容器设计规范', dxDBPickEdit14);
  prop_LoadTechInfoItems('压力容器制造规范', dxDBPickEdit15);
  prop_LoadTechInfoItems('压力容器设备新旧状况', dxDBPickEdit16);
  prop_LoadTechInfoItems('压力容器监检形式', dxDBPickEdit17);
  prop_LoadTechInfoItems('压力容器安全阀型号', dxDBPickEdit1);
  prop_LoadTechInfoItems('压力容器安全阀规格', dxDBPickEdit2);
  prop_LoadTechInfoItems('压力容器压力表量程', dxDBPickEdit11);
  prop_LoadTechInfoItems('压力容器压力表精度', dxDBPickEdit12);
  prop_LoadTechInfoItems('压力容器液面计形式', dxDBPickEdit13);
  prop_LoadTechInfoItems('压力容器爆破片型号', dxDBPickEdit18);
  prop_LoadTechInfoItems('压力容器爆破片规格', dxDBPickEdit19);
  prop_LoadTechInfoItems('压力容器紧急切断阀形式', dxDBPickEdit20);
  prop_LoadTechInfoItems('压力容器温度计形式', dxDBPickEdit21);
end;

procedure TfraVesselInfo.VesselSafetyInfoAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('dev_id').AsString := DeviceId;
    FieldByName('rec_no').AsInteger :=
      prof_GenerateRecNo('device.vessel_safety_info');
  end;
end;

procedure TfraVesselInfo.TechInfoBeforePost(DataSet: TDataSet);
begin
  if VarToStr(DataSet.FieldValues['vessel_modal']) = '' then
  begin
    Application.MessageBox('请选择容器形式', PChar(Caption),
      MB_OK + MB_ICONWARNING);
    Abort;
  end;
end;

procedure TfraVesselInfo.bbtnSafetyInsertClick(Sender: TObject);
begin
  VesselSafetyInfo.Insert;
end;

procedure TfraVesselInfo.bbtnSafetyDeleteClick(Sender: TObject);
begin
  with VesselSafetyInfo do
  begin
    if (not Active) or IsEmpty then Exit;
    if Application.MessageBox('您确定要删除当前安全附件吗?', '确认删除',
      MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK then Delete;
  end;
end;

procedure TfraVesselInfo.prip_SwitchInterface;
const
  TUBE_EDITS: array[1..15] of string = ('13', '16', '19', 'Eh2', 'Eh3', 'Eh5',
    'Eh6', 'Eh8', 'Eh9', '36', '39', '42', '45', '49', 'Eh21');
  TUBE_LABELS: array[1..15] of string = ('65', '22', '42', '75', '76', '105',
    '106', '112', '113', '28', '52', '70', '56', '68', '142');
  JACKET_EDITS: array[1..15] of string = ('14', '17', '20', '23', '24', '27',
    '28', '31', '32', '37', '40', '43', '46', '51', 'Eh22');
  JAKCET_LABELS: array[1..15] of string = ('66', '25', '44', '67', '26', '8',
    '40', '41', '12', '30', '54', '72', '58', '73', '144');
  DISC_EDITS: array[1..3] of string = ('Eh4', 'Eh7', 'Eh10');
  DISC_LABELS: array[1..3] of string = ('104', '111', '114');
var
  lb_Tube, lb_Jacket, lb_Disc: Boolean;
  ls_VesselModal: string;

  procedure SetControls(const Asa_Lables, Asa_Edits: array of string;
    const Ab_Enabled: Boolean);
  var
    li_i: Integer;
  begin
    for li_i := Low(Asa_Edits) to High(Asa_Edits) do
    begin
      TLabel(FindComponent('label' + Asa_Lables[li_i])).Enabled := Ab_Enabled;
      with TDBEditEh(FindComponent('DBEdit' + Asa_Edits[li_i])) do
      begin
        Enabled := Ab_Enabled;
        if Ab_Enabled then Color := clWindow else Color := clInactiveBorder;
      end;
    end;
  end;

  procedure ClearValues(const Asa_Edits: array of string);
  var
    li_i: Integer;
  begin
    for li_i := Low(Asa_Edits) to High(Asa_Edits) do
      TDBEditEh(FindComponent('DBEdit' + Asa_Edits[li_i])).Field.Clear;
  end;
  
begin
  lb_Tube := True;
  lb_Jacket := True;
  lb_Disc := True;

  ls_VesselModal := dxDBPickEdit5.Text;
  if (ls_VesselModal = '单腔') or (ls_VesselModal = '夹套') then
  begin
    lb_Tube := False;
    lb_Disc := False;
  end;
  if (ls_VesselModal = '单腔') or (ls_VesselModal = '管壳') then
    lb_Jacket := False;

  SetControls(TUBE_LABELS, TUBE_EDITS, lb_Tube);
  SetControls(JAKCET_LABELS, JACKET_EDITS, lb_Jacket);
  SetControls(DISC_LABELS, DISC_EDITS, lb_Disc);
  
  if TechInfo.State in [dsEdit, dsInsert] then
  begin
    if not lb_Tube then ClearValues(TUBE_EDITS);
    if not lb_Jacket then ClearValues(JACKET_EDITS);
    if not lb_Disc then ClearValues(DISC_EDITS);
  end;
end;

procedure TfraVesselInfo.dxDBPickEdit5Change(Sender: TObject);
begin
  prip_SwitchInterface;
end;

procedure TfraVesselInfo.TechInfoAfterOpen(DataSet: TDataSet);
begin
  prip_SwitchInterface;
end;

procedure TfraVesselInfo.TechInfoAfterCancel(DataSet: TDataSet);
begin
  prip_SwitchInterface;
end;

end.

unit ufraLiftInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufraTechInfoBase, StdCtrls, DB, ADODB, CSADOQuery, Mask, DBCtrls,
  CSDBNavigator, Buttons, ExtCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  CSdxDBDateEdit, dxDBELib, DBCtrlsEh, CSCustomdxDateEdit;

type
  TfraLiftInfo = class(TfraTechInfoBase)
    Label1: TLabel;
    DBEdit1: TDBEditEh;
    Label2: TLabel;
    DBEdit2: TDBEditEh;
    Label4: TLabel;
    DBEdit4: TDBEditEh;
    Label5: TLabel;
    DBEdit5: TDBEditEh;
    Label6: TLabel;
    DBEdit6: TDBEditEh;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit10: TDBEditEh;
    Label11: TLabel;
    DBEdit11: TDBEditEh;
    Label12: TLabel;
    DBEdit12: TDBEditEh;
    Label13: TLabel;
    DBEdit13: TDBEditEh;
    Label14: TLabel;
    DBEdit14: TDBEditEh;
    Label16: TLabel;
    DBEdit16: TDBEditEh;
    Label17: TLabel;
    DBEdit17: TDBEditEh;
    Label18: TLabel;
    DBEdit18: TDBEditEh;
    Label19: TLabel;
    DBEdit19: TDBEditEh;
    CSdxDBDateEdit1: TCSdxDBDateEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit29: TDBEditEh;
    Label32: TLabel;
    DBEdit30: TDBEditEh;
    Label33: TLabel;
    DBEdit31: TDBEditEh;
    Label35: TLabel;
    DBEdit33: TDBEditEh;
    Label3: TLabel;
    Label39: TLabel;
    DBEdit37: TDBEditEh;
    GroupBox1: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit21: TDBEditEh;
    Label23: TLabel;
    Label22: TLabel;
    DBEdit22: TDBEditEh;
    DBEdit23: TDBEditEh;
    Label24: TLabel;
    DBEdit24: TDBEditEh;
    Label41: TLabel;
    DBEdit39: TDBEditEh;
    GroupBox2: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label46: TLabel;
    DBEdit26: TDBEditEh;
    DBEdit27: TDBEditEh;
    DBEdit35: TDBEditEh;
    DBEdit25: TDBEditEh;
    DBEdit36: TDBEditEh;
    DBEdit43: TDBEditEh;
    DBEdit44: TDBEditEh;
    DBEdit45: TDBEditEh;
    DBEdit46: TDBEditEh;
    GroupBox3: TGroupBox;
    Label27: TLabel;
    Label45: TLabel;
    Label48: TLabel;
    Label51: TLabel;
    DBEdit48: TDBEditEh;
    DBEdit49: TDBEditEh;
    Label40: TLabel;
    Label36: TLabel;
    DBEdit34: TDBEditEh;
    Label42: TLabel;
    DBEdit40: TDBEditEh;
    Label43: TLabel;
    DBEdit41: TDBEditEh;
    Label44: TLabel;
    DBEdit42: TDBEditEh;
    GroupBox4: TGroupBox;
    Label47: TLabel;
    Label49: TLabel;
    DBEdit50: TDBEditEh;
    GroupBox5: TGroupBox;
    Label50: TLabel;
    Label52: TLabel;
    DBEdit52: TDBEditEh;
    GroupBox6: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    DBEdit55: TDBEditEh;
    DBEdit56: TDBEditEh;
    GroupBox7: TGroupBox;
    Label28: TLabel;
    Label55: TLabel;
    DBEdit57: TDBEditEh;
    DBEdit58: TDBEditEh;
    GroupBox8: TGroupBox;
    Label57: TLabel;
    Label15: TLabel;
    Label34: TLabel;
    DBEdit15: TDBEditEh;
    DBEdit32: TDBEditEh;
    Label56: TLabel;
    DBEdit59: TDBEditEh;
    GroupBox9: TGroupBox;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    DBEdit62: TDBEditEh;
    DBEdit63: TDBEditEh;
    DBEdit64: TDBEditEh;
    Label62: TLabel;
    dxDBPickEdit3: TdxDBPickEdit;
    Label63: TLabel;
    Label64: TLabel;
    dxDBPickEdit1: TdxDBPickEdit;
    dxDBPickEdit2: TdxDBPickEdit;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    dxDBPickEdit4: TdxDBPickEdit;
    dxDBPickEdit5: TdxDBPickEdit;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    dxDBPickEdit8: TdxDBPickEdit;
    CSdxDBDateEdit3: TCSdxDBDateEdit;
    dxDBPickEdit6: TdxDBPickEdit;
    dxDBPickEdit7: TdxDBPickEdit;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    dxDBPickEdit9: TdxDBPickEdit;
    dxDBPickEdit10: TdxDBPickEdit;
    dxDBPickEdit11: TdxDBPickEdit;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    dxDBPickEdit12: TdxDBPickEdit;
    dxDBPickEdit13: TdxDBPickEdit;
    Label87: TLabel;
    DBMemo1: TdxDBMemo;
    GroupBox10: TGroupBox;
    Label88: TLabel;
    Label89: TLabel;
    dxDBPickEdit15: TdxDBPickEdit;
    Label90: TLabel;
    dxDBPickEdit16: TdxDBPickEdit;
    Label91: TLabel;
    dxDBPickEdit17: TdxDBPickEdit;
    dxDBPickEdit14: TdxDBPickEdit;
    Label92: TLabel;
    DBEdit3: TDBEditEh;
    GroupBox11: TGroupBox;
    Label93: TLabel;
    dxDBPickEdit18: TdxDBPickEdit;
    Label95: TLabel;
    DBEditEh2: TDBEditEh;
    Label96: TLabel;
    Label97: TLabel;
    DBEditEh3: TDBEditEh;
    Label98: TLabel;
    Label99: TLabel;
    DBEditEh4: TDBEditEh;
    Label100: TLabel;
    Label94: TLabel;
    dxDBPickEdit19: TdxDBPickEdit;
  private
    { Private declarations }
  protected
    procedure prop_GetTechInfo; override;
  public
    procedure pubp_Ini(const As_Id: string;
      const As_VerifyId: string = ''); override;
  end;

implementation

uses
  udmData;
  
{$R *.dfm}

{ TfraLiftInfo }

procedure TfraLiftInfo.prop_GetTechInfo;
begin
  with TechInfo do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.lift_info WHERE dev_id = ''%s''',
      [DeviceId]);
    Open;
  end;
end;

procedure TfraLiftInfo.pubp_Ini(const As_Id, As_VerifyId: string);
begin
  inherited;

  prop_LoadTechInfoItems('电梯产品国别', dxDBPickEdit9);
  prop_LoadTechInfoItems('电梯控制方式', dxDBPickEdit10);
  prop_LoadTechInfoItems('电梯拖动方式', dxDBPickEdit3);
  prop_LoadTechInfoItems('电梯开门方式', dxDBPickEdit12);
  prop_LoadTechInfoItems('电梯补偿方式', dxDBPickEdit5);
  prop_LoadTechInfoItems('电梯工作环境', dxDBPickEdit11);
  prop_LoadTechInfoItems('电梯曳引机型式', dxDBPickEdit13);
  prop_LoadTechInfoItems('电梯安全钳型式', dxDBPickEdit2);
  prop_LoadTechInfoItems('电梯绳槽型式', dxDBPickEdit1);
  prop_LoadTechInfoItems('电梯缓冲器型式', dxDBPickEdit4);
  prop_LoadTechInfoItems('电梯限速器型式', dxDBPickEdit8);
  prop_LoadTechInfoItems('电梯轿厢导轨型式', dxDBPickEdit6);
  prop_LoadTechInfoItems('电梯对重导轨型式', dxDBPickEdit7);  
  prop_LoadTechInfoItems('电梯设计规范', dxDBPickEdit14);
  prop_LoadTechInfoItems('电梯制造规范', dxDBPickEdit15);
  prop_LoadTechInfoItems('电梯设备新旧状况', dxDBPickEdit16);
  prop_LoadTechInfoItems('电梯监检形式', dxDBPickEdit17);
  prop_LoadTechInfoItems('电梯油缸形式', dxDBPickEdit18);
  prop_LoadTechInfoItems('电梯顶升形式', dxDBPickEdit19);
end;

end.

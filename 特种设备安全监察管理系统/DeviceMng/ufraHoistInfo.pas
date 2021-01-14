unit ufraHoistInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufraTechInfoBase, StdCtrls, DB, ADODB, CSADOQuery, Mask, DBCtrls,
  CSDBNavigator, Buttons, ExtCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  CSdxDBDateEdit, DBCtrlsEh, dxDBELib, CSCustomdxDateEdit;

type
  TfraHoistInfo = class(TfraTechInfoBase)
    Label1: TLabel;
    DBEdit1: TDBEditEh;
    Label2: TLabel;
    DBEdit2: TDBEditEh;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEditEh;
    Label5: TLabel;
    DBEdit5: TDBEditEh;
    Label8: TLabel;
    Label28: TLabel;
    DBMemo1: TdxDBMemo;
    CSdxDBDateEdit1: TCSdxDBDateEdit;
    Label29: TLabel;
    Label10: TLabel;
    Label19: TLabel;
    DBEdit20: TDBEditEh;
    Label20: TLabel;
    DBEdit21: TDBEditEh;
    Label21: TLabel;
    DBEdit22: TDBEditEh;
    Label22: TLabel;
    DBEdit23: TDBEditEh;
    Label40: TLabel;
    Label41: TLabel;
    DBEdit39: TDBEditEh;
    Label42: TLabel;
    DBEdit40: TDBEditEh;
    Label58: TLabel;
    Label64: TLabel;
    DBEdit62: TDBEditEh;
    GroupBox1: TGroupBox;
    Label53: TLabel;
    Label44: TLabel;
    DBEdit42: TDBEditEh;
    Label45: TLabel;
    DBEdit43: TDBEditEh;
    Label48: TLabel;
    DBEdit46: TDBEditEh;
    Label47: TLabel;
    DBEdit45: TDBEditEh;
    Label43: TLabel;
    Label46: TLabel;
    DBEdit44: TDBEditEh;
    Label52: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    GroupBox2: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    GroupBox3: TGroupBox;
    Label27: TLabel;
    Label30: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    GroupBox4: TGroupBox;
    Label54: TLabel;
    Label55: TLabel;
    DBEdit53: TDBEditEh;
    Label56: TLabel;
    DBEdit54: TDBEditEh;
    Label57: TLabel;
    DBEdit55: TDBEditEh;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    GroupBox5: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    DBEdit51: TDBEditEh;
    Label73: TLabel;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    DBEdit6: TDBEditEh;
    Label7: TLabel;
    DBEdit7: TDBEditEh;
    Label9: TLabel;
    DBEdit9: TDBEditEh;
    Label33: TLabel;
    DBEdit10: TDBEditEh;
    Label11: TLabel;
    DBEdit12: TDBEditEh;
    Label12: TLabel;
    DBEdit13: TDBEditEh;
    Label13: TLabel;
    DBEdit14: TDBEditEh;
    Label14: TLabel;
    DBEdit15: TDBEditEh;
    Label17: TLabel;
    DBEdit18: TDBEditEh;
    Label18: TLabel;
    DBEdit19: TDBEditEh;
    Label39: TLabel;
    DBEdit37: TDBEditEh;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    GroupBox7: TGroupBox;
    Label15: TLabel;
    DBEdit16: TDBEditEh;
    Label35: TLabel;
    DBEdit33: TDBEditEh;
    Label34: TLabel;
    DBEdit32: TDBEditEh;
    Label38: TLabel;
    DBEdit36: TDBEditEh;
    Label36: TLabel;
    DBEdit34: TDBEditEh;
    Label37: TLabel;
    DBEdit35: TDBEditEh;
    Label82: TLabel;
    Label83: TLabel;
    GroupBox8: TGroupBox;
    Label16: TLabel;
    DBEdit17: TDBEditEh;
    Label31: TLabel;
    DBEdit30: TDBEditEh;
    Label32: TLabel;
    DBEdit31: TDBEditEh;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
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
    dxDBPickEdit19: TdxDBPickEdit;
    dxDBPickEdit20: TdxDBPickEdit;
    dxDBPickEdit21: TdxDBPickEdit;
    dxDBPickEdit22: TdxDBPickEdit;
    Label99: TLabel;
    DBEdit3: TDBEditEh;
    GroupBox10: TGroupBox;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    dxDBPickEdit23: TdxDBPickEdit;
    dxDBPickEdit24: TdxDBPickEdit;
    dxDBPickEdit25: TdxDBPickEdit;
    dxDBPickEdit26: TdxDBPickEdit;
    Label100: TLabel;
    dxDBPickEdit27: TdxDBPickEdit;
    Label101: TLabel;
    DBEditEh1: TDBEditEh;
    Label102: TLabel;
    GroupBox9: TGroupBox;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label109: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    DBEditEh5: TDBEditEh;
    DBEditEh6: TDBEditEh;
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

{ TfraHoistInfo }

procedure TfraHoistInfo.prop_GetTechInfo;
begin
  with TechInfo do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.hoist_info WHERE dev_id = ''%s''',
      [DeviceId]);
    Open;
  end;
end;

procedure TfraHoistInfo.pubp_Ini(const As_Id, As_VerifyId: string);
begin
  inherited;
  
  prop_LoadTechInfoItems('起重机产品国别', dxDBPickEdit2);
  prop_LoadTechInfoItems('起重机工作级别', dxDBPickEdit1);
  prop_LoadTechInfoItems('起重机门架型式', dxDBPickEdit4);
  prop_LoadTechInfoItems('起重机取物装置', dxDBPickEdit3);
  prop_LoadTechInfoItems('起重机司机室型式', dxDBPickEdit5);
  prop_LoadTechInfoItems('起重机操纵方式', dxDBPickEdit16);
  prop_LoadTechInfoItems('起重机操纵方式', dxDBPickEdit17);
  prop_LoadTechInfoItems('起重机操纵方式', dxDBPickEdit18);
  prop_LoadTechInfoItems('起重机操纵方式', dxDBPickEdit19);
  prop_LoadTechInfoItems('起重机操纵方式', dxDBPickEdit20);
  prop_LoadTechInfoItems('起重机操纵方式', dxDBPickEdit21);
  prop_LoadTechInfoItems('起重机操纵方式', dxDBPickEdit22);
  prop_LoadTechInfoItems('起重机导电方式', dxDBPickEdit12);
  prop_LoadTechInfoItems('起重机导电方式', dxDBPickEdit13);
  prop_LoadTechInfoItems('起重机导电方式', dxDBPickEdit14);
  prop_LoadTechInfoItems('起重机导电方式', dxDBPickEdit15);
  prop_LoadTechInfoItems('起重机旋转支承装置型式', dxDBPickEdit6);
  prop_LoadTechInfoItems('起重机旋转驱动装置型式', dxDBPickEdit7);
  prop_LoadTechInfoItems('起重机变幅方式', dxDBPickEdit8);
  prop_LoadTechInfoItems('起重机变幅平衡方式', dxDBPickEdit9);
  prop_LoadTechInfoItems('起重机变幅驱动方式', dxDBPickEdit10);
  prop_LoadTechInfoItems('起重机臂架系统型式', dxDBPickEdit11);
  prop_LoadTechInfoItems('起重机设计规范', dxDBPickEdit26);
  prop_LoadTechInfoItems('起重机制造规范', dxDBPickEdit23);
  prop_LoadTechInfoItems('起重机设备新旧状况', dxDBPickEdit24);
  prop_LoadTechInfoItems('起重机监检形式', dxDBPickEdit25);
  prop_LoadTechInfoItems('起重机工作环境', dxDBPickEdit27);
end;

end.

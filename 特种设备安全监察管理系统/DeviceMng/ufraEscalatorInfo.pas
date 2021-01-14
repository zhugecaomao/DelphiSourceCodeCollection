unit ufraEscalatorInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufraTechInfoBase, DB, ADODB, CSADOQuery, DBCtrls, CSDBNavigator,
  StdCtrls, Buttons, ExtCtrls, Mask, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  CSdxDBDateEdit, dxDBELib, DBCtrlsEh, CSCustomdxDateEdit;

type
  TfraEscalatorInfo = class(TfraTechInfoBase)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit1: TDBEditEh;
    DBEdit2: TDBEditEh;
    DBEdit5: TDBEditEh;
    DBEdit6: TDBEditEh;
    DBEdit7: TDBEditEh;
    CSdxDBDateEdit1: TCSdxDBDateEdit;
    DBEdit29: TDBEditEh;
    Label39: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label46: TLabel;
    DBEdit26: TDBEditEh;
    DBEdit27: TDBEditEh;
    DBEdit25: TDBEditEh;
    DBEdit43: TDBEditEh;
    DBEdit45: TDBEditEh;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label32: TLabel;
    DBEdit8: TDBEditEh;
    DBEdit9: TDBEditEh;
    DBEdit30: TDBEditEh;
    Label7: TLabel;
    dxDBPickEdit3: TdxDBPickEdit;
    dxDBPickEdit1: TdxDBPickEdit;
    dxDBPickEdit2: TdxDBPickEdit;
    dxDBPickEdit4: TdxDBPickEdit;
    dxDBPickEdit5: TdxDBPickEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dxDBPickEdit6: TdxDBPickEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dxDBPickEdit8: TdxDBPickEdit;
    GroupBox10: TGroupBox;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    dxDBPickEdit15: TdxDBPickEdit;
    dxDBPickEdit16: TdxDBPickEdit;
    dxDBPickEdit17: TdxDBPickEdit;
    dxDBPickEdit14: TdxDBPickEdit;
    Label87: TLabel;
    DBMemo1: TdxDBMemo;
    Label20: TLabel;
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

{ TfraEscalatorInfo }

procedure TfraEscalatorInfo.prop_GetTechInfo;
begin
  with TechInfo do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.lift_info WHERE dev_id = ''%s''',
      [DeviceId]);
    Open;
  end;
end;

procedure TfraEscalatorInfo.pubp_Ini(const As_Id, As_VerifyId: string);
begin
  inherited;

  prop_LoadTechInfoItems('自动扶梯产品国别', dxDBPickEdit6);
  prop_LoadTechInfoItems('自动扶梯工作环境', dxDBPickEdit5);
  prop_LoadTechInfoItems('自动扶梯制动器型式', dxDBPickEdit2);
  prop_LoadTechInfoItems('自动扶梯附加制动器型式', dxDBPickEdit1);
  prop_LoadTechInfoItems('自动扶梯站立部件类型', dxDBPickEdit3);
  prop_LoadTechInfoItems('自动扶梯扶手栏板型式', dxDBPickEdit4);
  prop_LoadTechInfoItems('自动扶梯梯级型式', dxDBPickEdit8);
  prop_LoadTechInfoItems('自动扶梯设计规范', dxDBPickEdit14);
  prop_LoadTechInfoItems('自动扶梯制造规范', dxDBPickEdit15);
  prop_LoadTechInfoItems('自动扶梯设备新旧状况', dxDBPickEdit16);
  prop_LoadTechInfoItems('自动扶梯监检形式', dxDBPickEdit17);
end;

end.

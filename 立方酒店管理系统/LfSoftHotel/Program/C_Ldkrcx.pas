unit C_Ldkrcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Browse, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls;

type
  TLdkrcxForm = class(TBrowseForm)
    qryDetailD_XFXM: TStringField;
    qryMasterD_KRBH: TStringField;
    qryMasterD_KRXM: TStringField;
    qryMasterD_KRLX: TStringField;
    qryMasterD_DDRQ: TDateTimeField;
    qryMasterD_DDSJ: TDateTimeField;
    qryMasterD_LDRQ: TDateTimeField;
    qryMasterD_LDSJ: TDateTimeField;
    qryMasterD_YWX: TStringField;
    qryMasterD_YWM: TStringField;
    qryMasterD_XB: TStringField;
    qryMasterD_MZBH: TStringField;
    qryMasterD_DQBH: TStringField;
    qryMasterD_GBBH: TStringField;
    qryMasterD_NZTS: TIntegerField;
    qryMasterD_TLSY: TStringField;
    qryMasterD_ZJBH: TStringField;
    qryMasterD_ZJHM: TStringField;
    qryMasterD_CSNY: TDateTimeField;
    qryMasterD_HCL: TStringField;
    qryMasterD_HCQ: TStringField;
    qryMasterD_QZBH: TStringField;
    qryMasterD_QZYXQ: TDateTimeField;
    qryMasterD_ZY: TStringField;
    qryMasterD_LXDH: TStringField;
    qryMasterD_DWMC: TStringField;
    qryMasterD_JTDZ: TStringField;
    qryMasterD_JDR: TStringField;
    qryMasterD_JDDW: TStringField;
    qryMasterD_BZ: TStringField;
    qryMasterD_QDR1: TStringField;
    qryMasterD_QDR2: TStringField;
    qryMasterD_QDR3: TStringField;
    qryMasterD_QDR4: TStringField;
    qryDetailD_ZDBH: TStringField;
    qryDetailD_HH: TIntegerField;
    qryDetailD_ZDLB: TStringField;
    qryDetailD_KRBH: TStringField;
    qryDetailD_YJBH: TStringField;
    qryDetailD_KFBH: TStringField;
    qryDetailD_SJFJ: TFloatField;
    qryDetailD_XMBH: TStringField;
    qryDetailD_XFDJ: TFloatField;
    qryDetailD_XFSL: TFloatField;
    qryDetailD_XFJE: TFloatField;
    qryDetailD_XFRQ: TDateTimeField;
    qryDetailD_XFSJ: TDateTimeField;
    qryDetailD_YHJE: TFloatField;
    qryDetailD_JZRQ: TDateTimeField;
    qryDetailD_JZSJ: TDateTimeField;
    qryDetailD_JZBZ: TStringField;
    qryDetailD_JSBZ: TStringField;
    qryDetailD_DLR1: TStringField;
    qryDetailD_DLR2: TStringField;
    qryDetailD_DLR3: TStringField;
    qryDetailD_DLR4: TStringField;
    qryDetailD_CZYXM: TStringField;
    qryDetailD_JZYXM: TStringField;
    qryDetailD_TYR: TStringField;
    qryDetailD_BZ: TStringField;
    qryDetailD_YSRQ: TStringField;
    qryDetailD_JZBH: TStringField;
    btnXxzl: TBitBtn;
    procedure btnLocaClick(Sender: TObject);
    procedure btnXxzlClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LdkrcxForm: TLdkrcxForm;

procedure Ldkrcx;

implementation

uses C_HotelData, C_Krxx;

{$R *.dfm}

procedure Ldkrcx;
begin
  LdkrcxForm := TLdkrcxForm.Create(Application);
  try
    with LdkrcxForm do
    begin
      qryMaster.Open;
      qryDetail.Open;
      ShowModal;
    end;
  finally
    LdkrcxForm.qryMaster.Close;
    LdkrcxForm.qryDetail.Close;
    LdkrcxForm.Free;
  end;
end;

procedure TLdkrcxForm.btnLocaClick(Sender: TObject);
begin
  inherited;
  if edtValue.Text = '' then
  with qryMaster do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from KRXXDA');
      Open;
      EnableControls;
    end;
  if cmbOption.ItemIndex=0 then
  begin
    with qryMaster do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from KRXXDA where D_KRXM like "%'+edtValue.Text+'%"');
      Open;
      EnableControls;
    end;
  end

end;

procedure TLdkrcxForm.btnXxzlClick(Sender: TObject);
begin
  inherited;
  LdkrxxEnter(qryMaster.FieldByName('D_KRBH').AsString);
end;

end.

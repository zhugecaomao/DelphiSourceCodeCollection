unit C_Jd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, StdCtrls, Buttons, ExtCtrls, DB, DBTables, C_Define,
  Mask, DBCtrls, DosMove;

type
  TJdForm = class(TStdJdForm)
    tblKrzd: TTable;
    tblKrxx: TTable;
    tblKryj: TTable;
    dsKrzd: TDataSource;
    dsKrxx: TDataSource;
    dsKryj: TDataSource;
    tblKrzdD_ZDBH: TStringField;
    tblKrzdD_HH: TIntegerField;
    tblKrzdD_ZDLB: TStringField;
    tblKrzdD_KRBH: TStringField;
    tblKrzdD_YJBH: TStringField;
    tblKrzdD_KFBH: TStringField;
    tblKrzdD_SJFJ: TCurrencyField;
    tblKrzdD_XMBH: TStringField;
    tblKrzdD_XFDJ: TCurrencyField;
    tblKrzdD_XFSL: TFloatField;
    tblKrzdD_XFJE: TCurrencyField;
    tblKrzdD_XFRQ: TDateField;
    tblKrzdD_XFSJ: TTimeField;
    tblKrzdD_YHJE: TCurrencyField;
    tblKrzdD_JZRQ: TDateField;
    tblKrzdD_JZSJ: TTimeField;
    tblKrzdD_JZBZ: TStringField;
    tblKrzdD_JSBZ: TStringField;
    tblKrzdD_DLR1: TStringField;
    tblKrzdD_DLR2: TStringField;
    tblKrzdD_DLR3: TStringField;
    tblKrzdD_DLR4: TStringField;
    tblKrzdD_CZYXM: TStringField;
    tblKrzdD_JZYXM: TStringField;
    tblKrzdD_TYR: TStringField;
    tblKrzdD_BZ: TStringField;
    tblKrzdD_YSRQ: TDateField;
    tblKrxxD_KRBH: TStringField;
    tblKrxxD_KRXM: TStringField;
    tblKrxxD_KRLX: TStringField;
    tblKrxxD_DDRQ: TDateField;
    tblKrxxD_DDSJ: TTimeField;
    tblKrxxD_LDRQ: TDateField;
    tblKrxxD_LDSJ: TTimeField;
    tblKrxxD_YWX: TStringField;
    tblKrxxD_YWM: TStringField;
    tblKrxxD_MZBH: TStringField;
    tblKrxxD_DQBH: TStringField;
    tblKrxxD_GBBH: TStringField;
    tblKrxxD_NZTS: TSmallintField;
    tblKrxxD_TLSY: TStringField;
    tblKrxxD_ZJBH: TStringField;
    tblKrxxD_ZJHM: TStringField;
    tblKrxxD_CSNY: TDateField;
    tblKrxxD_HCL: TStringField;
    tblKrxxD_HCQ: TStringField;
    tblKrxxD_QZBH: TStringField;
    tblKrxxD_QZYXQ: TDateField;
    tblKrxxD_ZY: TStringField;
    tblKrxxD_LXDH: TStringField;
    tblKrxxD_DWMC: TStringField;
    tblKrxxD_JTDZ: TStringField;
    tblKrxxD_JDDW: TStringField;
    tblKrxxD_BZ: TStringField;
    tblKryjD_YJBH: TStringField;
    tblKryjD_FKFS: TStringField;
    tblKryjD_XYKBH: TStringField;
    tblKryjD_KHBH: TStringField;
    tblKryjD_YFJE: TCurrencyField;
    tblKryjD_BZ: TStringField;
    tblXYK: TTable;
    dsXyk: TDataSource;
    dsKhda: TDataSource;
    tblKhda: TTable;
    tblKrxxD_XB: TStringField;
    tblMzdm: TTable;
    dsMzdm: TDataSource;
    tblDqdm: TTable;
    dsDqdm: TDataSource;
    tblZjdm: TTable;
    dsZjdm: TDataSource;
    tblYgda: TTable;
    dsYgda: TDataSource;
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
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    dbeZdbh: TDBEdit;
    dbeKfbh: TDBEdit;
    dbeSjfj: TDBEdit;
    dbeKrxm: TDBEdit;
    dbeDdrq: TDBEdit;
    dbeDdsj: TDBEdit;
    dbeYfje: TDBEdit;
    dbeZjhm: TDBEdit;
    dbeCsny: TDBEdit;
    dbeNzts: TDBEdit;
    dbeTlsy: TDBEdit;
    dbeZy: TDBEdit;
    dbeHcl: TDBEdit;
    dbeHcq: TDBEdit;
    dbeJtdz: TDBEdit;
    dbeBz: TDBEdit;
    dbcFkfs: TDBComboBox;
    dblXyk: TDBLookupComboBox;
    dblKhda: TDBLookupComboBox;
    dbcXb: TDBComboBox;
    dblMzdm: TDBLookupComboBox;
    dblDqdm: TDBLookupComboBox;
    dblZjdm: TDBLookupComboBox;
    dblCzyxm: TDBLookupComboBox;
    dblJzyxm: TDBLookupComboBox;
    procedure tblKrzdBeforeOpen(DataSet: TDataSet);
    procedure tblKrzdBeforeClose(DataSet: TDataSet);
    procedure tblKrzdNewRecord(DataSet: TDataSet);
    procedure tblKrxxNewRecord(DataSet: TDataSet);
    procedure tblKryjNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    IsZd: Boolean;
  public
    { Public declarations }
  end;

var
  JdForm: TJdForm;

procedure Nbjd;

implementation

uses C_HotelData;

{$R *.dfm}

procedure Nbjd;
begin
  JdForm := TJdForm.Create(Application);
  try
    with JdForm do
    begin
      IsZd := True;
      tblKrzd.Open;
      tblKrzd.Insert;
      ShowModal;
    end;
  finally
    JdForm.tblKrzd.Close;
    JdForm.Free;
  end;

end;

procedure TJdForm.tblKrzdBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  tblXyk.Open;
  tblMzdm.Open;
  tblDqdm.Open;
  tblKhda.Open;
  tblZjdm.Open;
  tblYgda.Open;
  tblKrxx.Open;
  tblKryj.Open;
end;

procedure TJdForm.tblKrzdBeforeClose(DataSet: TDataSet);
begin
  inherited;
  tblXyk.Close;
  tblMzdm.Close;
  tblDqdm.Close;
  tblKhda.Close;
  tblZjdm.Close;
  tblYgda.Close;
  tblKrxx.Close;
  tblKryj.Close;
end;

procedure TJdForm.tblKrzdNewRecord(DataSet: TDataSet);
begin
  inherited;
  if IsZd then
  begin
    tblKryj.Insert;
    tblKrxx.Insert;
    tblKrzdD_ZDBH.Value := HotelData.GetBh('D_ZDBH',PREV_ZDBH);
    tblKrzdD_HH.Value   := 0;
    tblKrzdD_KRBH.Value := tblKrxxD_KRBH.Value;
    tblKrzdD_YJBH.Value := tblKryjD_YJBH.Value;
    tblKrzdD_ZDLB.Value := ZDLB_YK;
    tblKrzdD_XMBH.Value := XMBH_FJ;
    IsZd := False;
  end;
end;

procedure TJdForm.tblKrxxNewRecord(DataSet: TDataSet);
begin
  inherited;
  if IsZd then
    tblKrxxD_KRBH.Value := HotelData.GetBh('D_KRBH',PREV_KRBH);
end;

procedure TJdForm.tblKryjNewRecord(DataSet: TDataSet);
begin
  inherited;
  if IsZd then
    tblKryjD_YJBH.Value := HotelData.GetBh('D_YJBH',PREV_YJBH);
end;

end.

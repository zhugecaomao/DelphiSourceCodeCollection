unit C_YddBrow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Browse, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, DBCtrls, DBNavPlus, ExtCtrls;

type
  TYddBrowForm = class(TBrowseForm)
    tblYdxx: TTable;
    qryMasterD_KRBH: TStringField;
    qryMasterD_XM: TStringField;
    qryMasterD_FKFS: TStringField;
    qryMasterD_XYKBH: TStringField;
    qryMasterD_KHBH: TStringField;
    qryMasterD_YFJE: TCurrencyField;
    qryMasterD_DWMC: TStringField;
    qryMasterD_LXDH: TStringField;
    qryMasterD_LXR: TStringField;
    qryMasterD_BZ: TStringField;
    qryMasterD_CZYXM: TStringField;
    qryDetailD_YDBH: TStringField;
    qryDetailD_KRBH: TStringField;
    qryDetailD_YDRQ: TDateField;
    qryDetailD_SYRQ: TDateField;
    qryDetailD_SYSJ: TTimeField;
    qryDetailD_SJDM: TStringField;
    qryDetailD_HCDM: TStringField;
    qryDetailD_HCZJ: TCurrencyField;
    qryDetailD_HCRS: TIntegerField;
    qryDetailD_HCRS1: TIntegerField;
    qryDetailD_HFSL: TFloatField;
    qryDetailD_HFJE: TCurrencyField;
    qryDetailD_HFBZ: TStringField;
    qryDetailD_XHSL: TFloatField;
    qryDetailD_XHJE: TCurrencyField;
    qryDetailD_XHBZ: TStringField;
    qryDetailD_SGSL: TFloatField;
    qryDetailD_SGJE: TCurrencyField;
    qryDetailD_SGBZ: TStringField;
    qryDetailD_QTJE: TCurrencyField;
    qryDetailD_QTBZ: TStringField;
    qryDetailD_HTSL: TFloatField;
    qryDetailD_HTBZ: TStringField;
    qryDetailD_BZ: TStringField;
    qryDetailD_RZBZ: TStringField;
    qryDetailD_JSBZ: TStringField;
    qryDetailD_CZYXM: TStringField;
    procedure qryMasterBeforeOpen(DataSet: TDataSet);
    procedure qryMasterAfterClose(DataSet: TDataSet);
    procedure btnLocaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YddBrowForm: TYddBrowForm;

procedure YddBrow;

implementation

uses C_Ydd, C_Define, C_HotelData;

{$R *.dfm}

procedure YddBrow;
begin
  if Application.FindComponent('YddBrowForm') is TYddBrowForm then
  begin
    ShowInfo('对不起，预定单浏览正在运行中！');
    Exit;
  end;
  YddBrowForm := TYddBrowForm.Create(Application);
  try
    with YddBrowForm do
    begin
      qryMaster.Open;
      ShowModal;
    end;
  finally
    YddBrowForm.qryMaster.Close;
    YddBrowForm.Free;
  end;
end;

procedure TYddBrowForm.qryMasterBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryDetail.Open;
end;

procedure TYddBrowForm.qryMasterAfterClose(DataSet: TDataSet);
begin
  inherited;
  qryDetail.Close;
end;

procedure TYddBrowForm.btnLocaClick(Sender: TObject);
var
  AKrbh: string;
begin
  inherited;
  if cmbExpress.ItemIndex = 0 then
  begin
    if cmbOption.ItemIndex = 0 then
      AKrbh := HotelData.FindUserBh('YDXX.DB','D_KRBH','D_XM',edtValue.Text)
    else
      AKrbh := HotelData.FindUserBh('YDXX.DB','D_KRBH','D_DWMC',edtValue.Text);
    if AKrbh<>'' then
      qryMaster.Locate('D_KRBH',AKrbh,[]);
  end;
end;

end.

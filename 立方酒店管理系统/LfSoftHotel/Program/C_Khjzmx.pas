unit C_Khjzmx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Browse, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define, DBCtrls;

type
  TKhjzmxForm = class(TBrowseForm)
    qryDetailD_XFXM: TStringField;
    btnPrint: TBitBtn;
    qryMasterD_KHBH: TStringField;
    qryMasterD_KHMC: TStringField;
    qryMasterD_FLBH: TStringField;
    qryMasterD_DWDZ: TStringField;
    qryMasterD_FR: TStringField;
    qryMasterD_LXDH: TStringField;
    qryMasterD_JDRQ: TDateTimeField;
    qryMasterD_DM: TStringField;
    qryDetailD_JZBH: TStringField;
    qryDetailD_KHBH: TStringField;
    qryDetailD_HH: TIntegerField;
    qryDetailD_XMBH: TStringField;
    qryDetailD_XFJE: TFloatField;
    qryDetailD_YJJE: TFloatField;
    qryDetailD_YHJE: TFloatField;
    qryDetailD_JZJE: TFloatField;
    qryDetailD_JZFS: TStringField;
    qryDetailD_XYKBH: TStringField;
    qryDetailD_JZRQ: TDateTimeField;
    qryDetailD_JZSJ: TDateTimeField;
    qryDetailD_CZYXM: TStringField;
    qryDetailD_BZ: TStringField;
    qryHj: TQuery;
    qryHjSUM: TFloatField;
    dsHj: TDataSource;
    lblYsk: TLabel;
    DBText1: TDBText;
    btnYszz: TBitBtn;
    procedure btnPrintClick(Sender: TObject);
    procedure btnLocaClick(Sender: TObject);
    procedure dsMasterDataChange(Sender: TObject; Field: TField);
    procedure btnYszzClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KhjzmxForm: TKhjzmxForm;

procedure Khjzmx;

implementation

uses C_HotelData, C_Sysprint, C_Yszz;

{$R *.dfm}

procedure Khjzmx;
begin
  KhjzmxForm := TKhjzmxForm.Create(Application);
  try
    with KhjzmxForm do
    begin
      qryMaster.Open;
      qryDetail.Open;
      qryHj.Open;
      ShowModal;
    end;
  finally
    KhjzmxForm.qryMaster.Close;
    KhjzmxForm.qryDetail.Close;
    KhjzmxForm.qryHj.Close;
    KhjzmxForm.Free;
  end;
end;

procedure TKhjzmxForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '客户结帐明细（'+qryMasterD_KHMC.Value+'）';
  APrintStru.ASub   := lblYsk.Caption + DBText1.Caption+'元';
  APrintStru.ADataSet := qryDetail;
  PrintLb(APrintStru,dbgDetail);
end;

procedure TKhjzmxForm.btnLocaClick(Sender: TObject);
var
  s : string;
begin
  inherited;
  {if (cmbOption.ItemIndex=0)and(cmbExpress.ItemIndex=0) then
    qryMaster.Locate('D_KHMC',edtValue.Text,[]);}
  case cmbOption.ItemIndex of
    0:
      s := 'select * from KHDA where D_KHBH like "%'+edtValue.Text+'%"';
    1:
      s := 'select * from KHDA where D_KHMC like "%'+edtValue.Text+'%"';
  end;
  with qryMaster do
  begin
    DisableControls;
    Close;
    SQL.Clear;
    SQL.Add(s);
    Prepare;
    Open;
    EnableControls;
  end;

end;

procedure TKhjzmxForm.dsMasterDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  qryHj.Close;
  qryHj.Open;
end;

procedure TKhjzmxForm.btnYszzClick(Sender: TObject);
begin
  inherited;
  Jzzz;
end;

end.

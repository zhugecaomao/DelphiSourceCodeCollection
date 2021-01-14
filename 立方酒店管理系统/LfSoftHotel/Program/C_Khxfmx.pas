unit C_Khxfmx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Browse, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define;

type
  TKhxfmxForm = class(TBrowseForm)
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
    qryDetailD_KHBH: TStringField;
    qryDetailD_ZDBH: TStringField;
    qryDetailD_HH: TIntegerField;
    qryDetailD_XMBH: TStringField;
    qryDetailD_XFDJ: TFloatField;
    qryDetailD_XFSL: TFloatField;
    qryDetailD_XFJE: TFloatField;
    qryDetailD_XFRQ: TDateTimeField;
    qryDetailD_XFSJ: TDateTimeField;
    qryDetailD_CZYXM: TStringField;
    qryDetailD_BZ: TStringField;
    procedure btnPrintClick(Sender: TObject);
    procedure btnLocaClick(Sender: TObject);
    procedure dbgDetailTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KhxfmxForm: TKhxfmxForm;

procedure Khxfmx;
procedure KhxfmxEnter(const AKhbh: string);

implementation

uses C_HotelData, C_Sysprint;

{$R *.dfm}

procedure Khxfmx;
begin
  KhxfmxForm := TKhxfmxForm.Create(Application);
  try
    with KhxfmxForm do
    begin
      qryMaster.Open;
      qryDetail.Open;
      ShowModal;
    end;
  finally
    KhxfmxForm.qryMaster.Close;
    KhxfmxForm.qryDetail.Close;
    KhxfmxForm.Free;
  end;
end;

procedure KhxfmxEnter(const AKhbh: string);
begin
  KhxfmxForm := TKhxfmxForm.Create(Application);
  try
    with KhxfmxForm do
    begin
      qryMaster.Open;
      qryDetail.Open;
      qryMaster.Locate('D_KHBH',AKhbh,[]);
      ShowModal;
    end;
  finally
    KhxfmxForm.qryMaster.Close;
    KhxfmxForm.qryDetail.Close;
    KhxfmxForm.Free;
  end;
end;

procedure TKhxfmxForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '客户应收明细（'+qryMasterD_KHMC.Value+'）';
  APrintStru.ADataSet := qryDetail;
  PrintLb(APrintStru,dbgDetail);
end;

procedure TKhxfmxForm.btnLocaClick(Sender: TObject);
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

procedure TKhxfmxForm.dbgDetailTitleClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'D_XFRQ' then
  begin
    with qryDetail do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from YSK where (D_KHBH=:D_KHBH)and(D_HH<>0) order by D_XFRQ,D_XFSJ');
      Open;
      EnableControls;
    end;
  end;
  if Column.FieldName = 'D_XFXM' then
  begin
    with qryDetail do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from YSK where (D_KHBH=:D_KHBH)and(D_HH<>0) order by D_XMBH,D_XFRQ,D_XFSJ');
      Open;
      EnableControls;
    end;
  end;

end;

end.

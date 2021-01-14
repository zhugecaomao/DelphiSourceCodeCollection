unit C_Khyszz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Browse, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define, DBCtrls;

type
  TKhyszzForm = class(TBrowseForm)
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
    qryDetailD_XMBH: TStringField;
    qryDetailSUM: TFloatField;
    lblYsk: TLabel;
    qryHj: TQuery;
    dsHj: TDataSource;
    qryHjSUM: TFloatField;
    DBText1: TDBText;
    btnYskmx: TBitBtn;
    btnYszz: TBitBtn;
    procedure btnPrintClick(Sender: TObject);
    procedure btnLocaClick(Sender: TObject);
    procedure dsMasterDataChange(Sender: TObject; Field: TField);
    procedure dbgMasterDblClick(Sender: TObject);
    procedure btnYszzClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KhyszzForm: TKhyszzForm;

procedure Khyszz;

implementation

uses C_HotelData, C_Sysprint, C_Khxfmx, C_Yszz, C_YskPrint;

{$R *.dfm}

procedure Khyszz;
begin
  KhyszzForm := TKhyszzForm.Create(Application);
  try
    with KhyszzForm do
    begin
      qryMaster.Open;
      qryDetail.Open;
      qryHj.Open;
      ShowModal;
    end;
  finally
    KhyszzForm.qryMaster.Close;
    KhyszzForm.qryDetail.Close;
    KhyszzForm.qryHj.Close;
    KhyszzForm.Free;
  end;
end;

procedure TKhyszzForm.btnPrintClick(Sender: TObject);
var
  aYskze: Double;
begin
  aYskze := HotelData.SumJe('select sum(D_XFJE) from YSK');
  YskPrint(aYskze);
end;

procedure TKhyszzForm.btnLocaClick(Sender: TObject);
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

procedure TKhyszzForm.dsMasterDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  qryHj.Close;
  qryHj.Open;
end;

procedure TKhyszzForm.dbgMasterDblClick(Sender: TObject);
begin
  inherited;
  KhxfmxEnter(qryMasterD_KHBH.Value);
end;

procedure TKhyszzForm.btnYszzClick(Sender: TObject);
begin
  inherited;
  Yszz;
end;

end.

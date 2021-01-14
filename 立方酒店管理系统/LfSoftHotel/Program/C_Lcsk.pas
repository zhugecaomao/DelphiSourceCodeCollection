unit C_Lcsk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Browse, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls;

type
  TLcskForm = class(TBrowseForm)
    qryMasterD_LCCC: TStringField;
    qryMasterD_HH: TIntegerField;
    qryMasterD_LCLX: TStringField;
    qryMasterD_SFZ: TStringField;
    qryMasterD_ZDZ: TStringField;
    qryMasterD_SFSJ: TDateTimeField;
    qryMasterD_ZDSJ: TDateTimeField;
    qryMasterD_ZJZ: TStringField;
    qryMasterD_DZSJ: TDateTimeField;
    qryDetailD_LCCC: TStringField;
    qryDetailD_HH: TIntegerField;
    qryDetailD_LCLX: TStringField;
    qryDetailD_SFZ: TStringField;
    qryDetailD_ZDZ: TStringField;
    qryDetailD_SFSJ: TDateTimeField;
    qryDetailD_ZDSJ: TDateTimeField;
    qryDetailD_ZJZ: TStringField;
    qryDetailD_DZSJ: TDateTimeField;
    procedure qryMasterNewRecord(DataSet: TDataSet);
    procedure qryDetailNewRecord(DataSet: TDataSet);
    procedure btnLocaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LcskForm: TLcskForm;

procedure Lcsk;

implementation

uses C_HotelData;

{$R *.dfm}

procedure Lcsk;
begin
  LcskForm := TLcskForm.Create(Application);
  try
    with LcskForm do
    begin
      qryMaster.Open;
      qryDetail.Open;
      ShowModal;
    end;
  finally
    LcskForm.qryMaster.Close;
    LcskForm.qryDetail.Close;
    LcskForm.Free;
  end;
end;

procedure TLcskForm.qryMasterNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryMasterD_HH.Value := 0;
end;

procedure TLcskForm.qryDetailNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryDetailD_LCCC.Value := qryMasterD_LCCC.Value;
  qryDetailD_HH.Value := 1;
end;

procedure TLcskForm.btnLocaClick(Sender: TObject);
var
  ALccc: string;
begin
  inherited;
  if cmbExpress.ItemIndex=0 then
    if cmbOption.ItemIndex=0 then
      qryMaster.Locate('D_LCCC',edtValue.Text,[])
    else
    if cmbOption.ItemIndex=1 then
    begin
      ALccc := HotelData.FindUserBh('LCSK.DB','D_LCCC','D_ZJZ',edtValue.Text);
      qryMaster.Locate('D_LCCC',ALccc,[])
    end;
end;

end.

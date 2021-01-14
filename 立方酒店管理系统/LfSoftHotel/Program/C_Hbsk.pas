unit C_Hbsk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Browse, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls;

type
  THbskForm = class(TBrowseForm)
    qryMasterD_HBBC: TStringField;
    qryMasterD_HH: TIntegerField;
    qryMasterD_KJLX: TStringField;
    qryMasterD_SFZ: TStringField;
    qryMasterD_ZDZ: TStringField;
    qryMasterD_SFSJ: TDateTimeField;
    qryMasterD_ZDSJ: TDateTimeField;
    qryMasterD_ZJZ: TStringField;
    qryMasterD_DZSJ: TDateTimeField;
    qryDetailD_HBBC: TStringField;
    qryDetailD_HH: TIntegerField;
    qryDetailD_KJLX: TStringField;
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
  HbskForm: THbskForm;

procedure Hbsk;

implementation

uses C_HotelData;

{$R *.dfm}

procedure Hbsk;
begin
  HbskForm := THbskForm.Create(Application);
  try
    with HbskForm do
    begin
      qryMaster.Open;
      qryDetail.Open;
      ShowModal;
    end;
  finally
    HbskForm.qryMaster.Close;
    HbskForm.qryDetail.Close;
    HbskForm.Free;
  end;
end;

procedure THbskForm.qryMasterNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryMasterD_HH.Value := 0;
end;

procedure THbskForm.qryDetailNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryDetailD_HBBC.Value := qryMasterD_HBBC.Value;
  qryDetailD_HH.Value := 1;
end;

procedure THbskForm.btnLocaClick(Sender: TObject);
var
  AHbbc: string;
begin
  inherited;
  if cmbExpress.ItemIndex=0 then
    if cmbOption.ItemIndex=0 then
      qryMaster.Locate('D_HBBC',edtValue.Text,[])
    else
    if cmbOption.ItemIndex=1 then
    begin
      AHbbc := HotelData.FindUserBh('HBSK.DB','D_HBBC','D_ZJZ',edtValue.Text);
      qryMaster.Locate('D_HBBC',AHbbc,[])
    end;
end;

end.

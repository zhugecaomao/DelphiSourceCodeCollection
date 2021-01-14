unit C_Yjcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define;

type
  TYjcxForm = class(TStdBrowForm)
    qryWorkD_KFBH: TStringField;
    qryWorkD_KRXM: TStringField;
    qryWorkD_ZDBH: TStringField;
    qryWorkSUM: TFloatField;
    qryWorkD_XFJE: TCurrencyField;
    Label1: TLabel;
    btnBjyj: TBitBtn;
    procedure qryWorkCalcFields(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnBjyjClick(Sender: TObject);
    procedure btnLocaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YjcxForm: TYjcxForm;

procedure Yjcx;

implementation

uses C_HotelData, C_Bjyj, C_Wait;

{$R *.dfm}
procedure Yjcx;
begin
  YjcxForm := TYjcxForm.Create(Application);
  try
    with YjcxForm do
    begin
      qryWork.Open;
      ShowModal;
    end;
  finally
    YjcxForm.qryWork.Close;
    YjcxForm.Free;
  end;
end;

procedure TYjcxForm.qryWorkCalcFields(DataSet: TDataSet);
var
  aXfxx: TXfxx;
  aKfxx: TKfxx;
  aDtfj,aDhf : Currency;
begin
  qryWork.DisableControls;
  try
    aXfxx := HotelData.GetXfxx(qryWorkD_ZDBH.Value);
    //获取当天房价
    aKfxx := HotelData.GetKfxx(qryWorkD_KFBH.Value);
    aDtfj := GetDtfj(aKfxx.ADdsj,Time,aKfxx.AKfbz,aKfxx.ASjfj);
    aDhf  := HotelData.GetDhf(aKfxx.AKfbh,aKfxx.ADdrq,aKfxx.ADdsj);
    qryWorkD_XFJE.Value := aXfxx.AXfje+aDtfj+aDhf;

  finally
    qryWork.EnableControls;
  end;
end;

procedure TYjcxForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (qryWorkD_XFJE.Value+100)>qryWorkSUM.Value then
    DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TYjcxForm.btnBjyjClick(Sender: TObject);
begin
  inherited;
  BjyjEnter(qryWorkD_KFBH.Value);
  qryWork.DisableControls;
  qryWork.Close;
  qryWork.Open;
  qryWork.First;
  qryWork.EnableControls;
end;

procedure TYjcxForm.btnLocaClick(Sender: TObject);
begin
  inherited;
  qryWork.Locate('D_KFBH',edtValue.Text,[]);
end;

end.

unit C_Yszz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls;

type
  TYszzForm = class(TStdBrowForm)
    qryWorkD_XMBH: TStringField;
    qryWorkSUM: TFloatField;
    qryWorkD_XMMC: TStringField;
    lblYsze: TLabel;
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YszzForm: TYszzForm;

procedure Yszz;
procedure Jzzz;

implementation

uses C_HotelData, C_Define;

{$R *.dfm}

procedure Yszz;
begin
  YszzForm := TYszzForm.Create(Application);
  try
    with YszzForm do
    begin
      qryWork.SQL.Clear;
      qryWork.SQL.Add('select D_XMBH,sum(D_XFJE) from YSK where D_HH<>0 group by D_XMBH');
      qryWork.Open;
      lblYsze.Caption := '客户应收总额：'
                        +CurrToStr(HotelData.SumJe('select sum(D_XFJE) from YSK where D_HH<>0'))
                        +'元';
      lblTitle.Caption := '客户应收总帐';
      ShowModal;

    end;
  finally
    YszzForm.qryWork.Close;
    YszzForm.Free;
  end;
end;

procedure Jzzz;
begin
  YszzForm := TYszzForm.Create(Application);
  try
    with YszzForm do
    begin
      qryWork.SQL.Clear;
      qryWork.SQL.Add('select D_XMBH,sum(D_XFJE) from YSKJZ where D_HH<>0 group by D_XMBH');
      qryWork.Open;
      lblYsze.Caption := '客户结帐总额：'
                        +CurrToStr(HotelData.SumJe('select sum(D_XFJE) from YSKJZ where D_HH<>0'))
                        +'元';
      lblTitle.Caption := '客户结帐总帐';
      ShowModal;

    end;
  finally
    YszzForm.qryWork.Close;
    YszzForm.Free;
  end;
end;

procedure TYszzForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := lblTitle.Caption;
  APrintStru.ASub   := lblYsze.Caption;
  APrintStru.ADataSet := qryWork;
  PrintLb(APrintStru,DBGrid1);
end;

end.

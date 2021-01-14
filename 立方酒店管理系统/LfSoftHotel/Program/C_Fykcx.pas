unit C_Fykcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, C_Define;

type
  TFykcxForm = class(TStdBrowForm)
    Label1: TLabel;
    dtpBd: TDateTimePicker;
    Label2: TLabel;
    dtpEd: TDateTimePicker;
    btnTj: TBitBtn;
    Bevel1: TBevel;
    RadioGroup1: TRadioGroup;
    lblXfhj: TLabel;
    lblYhhj: TLabel;
    qryWork1: TQuery;
    qryWorkJZRQ: TDateTimeField;
    qryWorkJZSJ: TDateTimeField;
    qryWorkXFXM: TStringField;
    qryWorkXFJE: TFloatField;
    qryWorkYHJE: TFloatField;
    qryWork1XFXM: TStringField;
    qryWork1XFJE: TCurrencyField;
    qryWork1YHJE: TCurrencyField;
    procedure btnPrintClick(Sender: TObject);
    procedure btnTjClick(Sender: TObject);
  private
    { Private declarations }
    IsToDay : Boolean;
    procedure ShowHj;
  public
    { Public declarations }
  end;

var
  FykcxForm: TFykcxForm;

procedure FYkcx;

implementation

uses C_HotelData, C_Sysprint;

{$R *.dfm}

procedure FYkcx;
begin
  FYkcxForm := TFykcxForm.Create(Application);
  try
    with FykcxForm do
    begin
      dtpBd.Date := Date;
      dtpEd.Date := Date;
      btnTjClick(nil);
      ShowModal;
    end;
  finally
    FYkcxForm.qryWork.Close;
    FYkcxForm.Free;
  end;

end;

procedure TFykcxForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '非寓客消费';
  APrintStru.ASub   := '（'+DateToStr(dtpBd.Date)+'至'+DateToStr(dtpEd.Date)+'）'
                       +lblXfhj.Caption+' '+lblYhhj.Caption;
  APrintStru.ADataSet := qryWork;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TFykcxForm.ShowHj;
var
  s : string;
begin
  if IsToDay then
  begin
    s := 'select sum(D_XFJE),sum(D_YHJE) from KRJZ where (D_JZLX="'+JZLX_FYK+'")and(D_HH<>0)';
    with HotelData.qryUserData do
    begin
      Close;
      SQL.Clear;
      SQL.Add(s);
      Open;
      if Fields[0].IsNull then lblXfhj.Caption := '消费合计：0元'
      else lblXfhj.Caption := '消费合计：'+CurrToStr(Fields[0].AsCurrency)+'元';

      if Fields[1].IsNull then lblYhhj.Caption := '优惠合计：0元'
      else lblYhhj.Caption := '优惠合计：'+CurrToStr(Fields[1].AsCurrency)+'元';
      Close;
    end;
  end
  else
  begin
    s := 'select sum(D_XFJE),sum(D_YHJE) from KRJZDA where (D_JZLX="'+JZLX_FYK+'")and(D_HH<>0)and(D_JZRQ>=:BD)and(D_JZRQ<=:ED)';
    with HotelData.qryUserData do
    begin
      Close;
      SQL.Clear;
      SQL.Add(s);
      Params[0].DataType := ftDate;
      Params[0].Value    := dtpBd.Date;
      Params[1].DataType := ftDate;
      Params[1].Value    := dtpEd.Date;
      Open;
      if Fields[0].IsNull then lblXfhj.Caption := '消费合计：0元'
      else lblXfhj.Caption := '消费合计：'+CurrToStr(Fields[0].AsCurrency)+'元';

      if Fields[1].IsNull then lblYhhj.Caption := '优惠合计：0元'
      else lblYhhj.Caption := '优惠合计：'+CurrToStr(Fields[1].AsCurrency)+'元';
      Close;
    end;
  end;
end;

procedure TFykcxForm.btnTjClick(Sender: TObject);
var
  ABDate,AEDate: TDate;
  s            : string;
  I,ColNum     : Integer;
  AColumn      : TColumn;
begin
  inherited;
  ABDate := dtpBd.Date;
  AEDate := dtpEd.Date;
  IsToDay:= FormatDateTime('yyyymmdd',ABDate)=FormatDateTime('yyyymmdd',Date);

  ShowHj;

  qryWork.DisableControls;
  qryWork1.DisableControls;
  ColNum := DBGrid1.Columns.Count;
  for I := ColNum -1 downto  0 do
    DBGrid1.Columns.Delete(I);

  try
    if RadioGroup1.ItemIndex = 0 then   //按消费明细
    begin
      dsWork.DataSet := qryWork;
      with DBGrid1 do
      begin

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'JZRQ';
        AColumn.Title.Caption   := '结帐日期';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'JZSJ';
        AColumn.Title.Caption   := '结帐时间';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'XFXM';
        AColumn.Title.Caption   := '项目名称';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'XFJE';
        AColumn.Title.Caption   := '消费金额';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'YHJE';
        AColumn.Title.Caption   := '优惠金额';
        AColumn.Title.Alignment := taCenter;

      end;

      if IsToday then
      begin
        s := 'select KRJZ.D_JZRQ as JZRQ,'
                   +'KRJZ.D_JZSJ as JZSJ,'
                   +'XMDM.D_XMMC as XFXM,'
                   +'KRJZ.D_XFJE as XFJE,'
                   +'KRJZ.D_YHJE as YHJE '
                   +'from KRJZ KRJZ,XMDM XMDM '
                   +'where (D_JZLX="'+JZLX_FYK+'")and(D_HH<>0)and(KRJZ.D_XMBH=XMDM.D_XMBH)';

        qryWork.Close;
        qryWork.SQL.Clear;
        qryWork.SQL.Add(s);
        qryWork.Open;
      end
      else
      begin
        s := 'select KRJZ.D_JZRQ as JZRQ,'
                   +'KRJZ.D_JZSJ as JZSJ,'
                   +'XMDM.D_XMMC as XFXM,'
                   +'KRJZ.D_XFJE as XFJE,'
                   +'KRJZ.D_YHJE as YHJE '
                   +'from KRJZDA KRJZ,XMDM XMDM '
                   +'where (D_JZLX="'+JZLX_FYK+'")and(D_HH<>0)and(D_JZRQ>=:BD)and(D_JZRQ<=:ED)and(KRJZ.D_XMBH=XMDM.D_XMBH)';

        qryWork.Close;
        qryWork.SQL.Clear;
        qryWork.SQL.Add(s);
        qryWork.Params[0].DataType := ftDate;
        qryWork.Params[0].Value    := ABDate;
        qryWork.Params[1].DataType := ftDate;
        qryWork.Params[1].Value    := AEDate;
        qryWork.Open;
      end;
    end
    else        //按消费项目
    begin
      dsWork.DataSet := qryWork1;
      with DBGrid1 do
      begin

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'XFXM';
        AColumn.Title.Caption   := '项目名称';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'XFJE';
        AColumn.Title.Caption   := '消费金额';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'YHJE';
        AColumn.Title.Caption   := '优惠金额';
        AColumn.Title.Alignment := taCenter;

      end;

      if IsToday then
      begin
        s := 'select XMDM.D_XMMC      as XFXM,'
                   +'sum(KRJZ.D_XFJE) as XFJE,'
                   +'sum(KRJZ.D_YHJE) as YHJE '
                   +'from KRJZ KRJZ,XMDM XMDM '
                   +'where (D_JZLX="'+JZLX_FYK+'")and(D_HH<>0)and(KRJZ.D_XMBH=XMDM.D_XMBH) group by XMDM.D_XMMC';

        qryWork1.Close;
        qryWork1.SQL.Clear;
        qryWork1.SQL.Add(s);
        qryWork1.Open;
      end
      else
      begin
        s := 'select XMDM.D_XMMC      as XFXM,'
                   +'sum(KRJZ.D_XFJE) as XFJE,'
                   +'sum(KRJZ.D_YHJE) as YHJE '
                   +'from KRJZDA KRJZ,XMDM XMDM '
                   +'where (D_JZLX="'+JZLX_FYK+'")and(D_HH<>0)and(D_JZRQ>=:BD)and(D_JZRQ<=:ED)and(KRJZ.D_XMBH=XMDM.D_XMBH) group by XMDM.D_XMMC';

        qryWork1.Close;
        qryWork1.SQL.Clear;
        qryWork1.SQL.Add(s);
        qryWork1.Params[0].DataType := ftDate;
        qryWork1.Params[0].Value    := ABDate;
        qryWork1.Params[1].DataType := ftDate;
        qryWork1.Params[1].Value    := AEDate;
        qryWork1.Open;
      end;
    end;
  finally
    qryWork.EnableControls;
    qryWork1.EnableControls;
  end;

end;

end.

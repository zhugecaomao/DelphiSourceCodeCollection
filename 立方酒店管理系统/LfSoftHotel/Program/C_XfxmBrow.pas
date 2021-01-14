unit C_XfxmBrow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids,
  DBGrids, DB, DBTables, C_Define;

type
  TXfxmBrowForm = class(TStandForm)
    Bevel1: TBevel;
    Label1: TLabel;
    dtpBd: TDateTimePicker;
    Label2: TLabel;
    dtpEd: TDateTimePicker;
    btnTj: TBitBtn;
    qryWork: TQuery;
    dsWork: TDataSource;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    cmbXfxm: TComboBox;
    lblXfhj: TLabel;
    lblYhhj: TLabel;
    btnPrint: TBitBtn;
    qryWorkD_JZBH: TStringField;
    qryWorkD_HH: TIntegerField;
    qryWorkD_XMBH: TStringField;
    qryWorkD_XFDJ: TFloatField;
    qryWorkD_XFSL: TFloatField;
    qryWorkD_XFGG: TStringField;
    qryWorkD_XFJE: TFloatField;
    qryWorkD_YJJE: TFloatField;
    qryWorkD_YHJE: TFloatField;
    qryWorkD_JZFS: TStringField;
    qryWorkD_JZLX: TStringField;
    qryWorkD_KHBH: TStringField;
    qryWorkD_XYKBH: TStringField;
    qryWorkD_JZRQ: TDateTimeField;
    qryWorkD_JZSJ: TDateTimeField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_BZ: TStringField;
    qryWorkD_YSRQ: TStringField;
    procedure btnTjClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    IsToday : Boolean;
    FXmbh   : string;
    procedure ShowHj;
  public
    { Public declarations }
  end;

var
  XfxmBrowForm: TXfxmBrowForm;

procedure XfxmBrow;

implementation

uses C_HotelData, C_Sysprint;

{$R *.dfm}

procedure XfxmBrow;
begin
  XfxmBrowForm := TXfxmBrowForm.Create(Application);
  try
    with XfxmBrowForm do
    begin
      HotelData.ListMc(cmbXfxm,'XMDM','D_XMMC');
      dtpBd.Date := Date;
      dtpEd.Date := Date;
      ShowModal;
    end;
  finally
    XfxmBrowForm.Free;
  end;
end;

procedure TXfxmBrowForm.ShowHj;
var
  s : string;
begin
  if IsToDay then
  begin
    s := 'select sum(D_XFJE),sum(D_YHJE) from KRJZ where (D_XMBH="'+FXmbh+'")and(D_HH<>0)';
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
    s := 'select sum(D_XFJE),sum(D_YHJE) from KRJZDA where (D_XMBH="'+FXmbh+'")and(D_HH<>0)and(D_JZRQ>=:BD)and(D_JZRQ<=:ED)';
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

procedure TXfxmBrowForm.btnTjClick(Sender: TObject);
var
  s : string;
begin
  inherited;
  if cmbXfxm.ItemIndex < 0 then Exit;

  FXmbh := HotelData.FindBh('XMDM','D_XMBH','D_XMMC',cmbXfxm.Items[cmbXfxm.ItemIndex]);

  IsToDay:= FormatDateTime('yyyymmdd',dtpBd.Date)=FormatDateTime('yyyymmdd',Date);
  qryWork.DisableControls;
  try
    if IsToDay then
    begin
      s := 'select *from KRJZ where (D_XMBH="'+FXmbh+'")and(D_HH<>0)';

      qryWork.Close;
      qryWork.SQL.Clear;
      qryWork.SQL.Add(s);
      qryWork.Open;
    end
    else
    begin
      s := 'select * from KRJZDA where (D_XMBH="'+FXmbh+'")and(D_HH<>0)and(D_JZRQ>=:BD)and(D_JZRQ<=:ED)';

      qryWork.Close;
      qryWork.SQL.Clear;
      qryWork.SQL.Add(s);
      qryWork.Params[0].DataType := ftDate;
      qryWork.Params[0].Value    := dtpBd.Date;
      qryWork.Params[1].DataType := ftDate;
      qryWork.Params[1].Value    := dtpEd.Date;
      qryWork.Open;
    end;
    
    ShowHj;
  finally
    qryWork.EnableControls;
  end;

end;

procedure TXfxmBrowForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := cmbXfxm.Items[cmbXfxm.ItemIndex]+'消费';
  APrintStru.ASub   := '（'+DateToStr(dtpBd.Date)+'至'+DateToStr(dtpEd.Date)+'）'
                       +lblXfhj.Caption+' '+lblYhhj.Caption;
  APrintStru.ADataSet := qryWork;
  PrintLb(APrintStru,DBGrid1);
end;

end.

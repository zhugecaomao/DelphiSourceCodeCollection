unit C_Bgrbb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, TeeProcs, TeEngine, Chart, Series, ComCtrls, DateUtils, C_Define;

type
  TBgRbbForm = class(TStdBrowForm)
    qryWorkD_XFXM: TStringField;
    btnChartPrint: TBitBtn;
    CheckBox1: TCheckBox;
    qryWorkD_YSRQ: TStringField;
    qryWorkD_XMBH: TStringField;
    qryWorkD_JRYY: TFloatField;
    qryWorkD_JRSH: TFloatField;
    qryWorkD_JRYH: TFloatField;
    qryWorkD_BYYY: TFloatField;
    qryWorkD_BYYH: TFloatField;
    qryWorkD_LJYY: TFloatField;
    qryWorkD_LJYH: TFloatField;
    qryWorkD_LJSH: TFloatField;
    qryWorkD_LJYS: TFloatField;
    qryWorkD_ZRBYYY: TFloatField;
    qryWorkD_ZRBYYH: TFloatField;
    qryWorkD_ZRLJYY: TFloatField;
    qryWorkD_ZRLJYH: TFloatField;
    qryWorkD_ZRLJSH: TFloatField;
    qryWorkD_ZRLJYS: TFloatField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    Series1: TBarSeries;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblSrljys: TLabel;
    lblBryy: TLabel;
    lblSjcw: TLabel;
    lblJrljys1: TLabel;
    lblLkysk: TLabel;
    lblJzysk: TLabel;
    lblFpe: TLabel;
    lblJrljys2: TLabel;
    Label10: TLabel;
    lblSjyjk: TLabel;
    Label11: TLabel;
    lblWjyjk: TLabel;
    qryWorkD_SYTQB: TFloatField;
    qryWorkD_JRXJ: TCurrencyField;
    qryWorkD_BYXJ: TCurrencyField;
    qryWorkD_LJXJ: TCurrencyField;
    Label12: TLabel;
    Label13: TLabel;
    lblYjk: TLabel;
    lblYjkkc: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    lblRpjj: TLabel;
    lblYpjj: TLabel;
    lblRpjczl: TLabel;
    lblYpjczl: TLabel;
    procedure dsWorkDataChange(Sender: TObject; Field: TField);
    procedure ComboBox1Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnChartPrintClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure qryWorkCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FSrljys,FBryy,FSjcw,FJrljys1 : Currency;
    FLkysk,FJzysk,FFpe,FJrljys2  : Currency;
    FSjyjk,FWjyjk,FYjksh,FYjkkc  : Currency;
    FRpjj,FYpjj : Currency;
    FRpjczl,FYpjczl : Double;
    FId: Integer;
    procedure ShowTb;
    procedure ShowHj;
  public
    { Public declarations }
  end;

var
  BgRbbForm: TBgRbbForm;

procedure Bgrbb(aId: Integer);

implementation

uses C_HotelData, C_Sysprint, C_BgrbbPrn;

{$R *.dfm}

procedure Bgrbb(aId: Integer);
begin
  BgrbbForm := TBgrbbForm.Create(Application);
  try
    with BgrbbForm do
    begin
      DateTimePicker1.Date := YesterDay;
      FId := aId;
      if FId = 0 then DateTimePicker1.Enabled := False;
      ShowHj;
      qryWork.Open;
      ShowModal;
    end;
  finally
    BgrbbForm.qryWork.Close;
    BgrbbForm.Free;
  end;
end;

procedure TBgrbbForm.ShowHj;
var
  ADate: TDateTime;
  ADateStr,s: string;
begin
  with HotelData.qryUserData do
  begin
    //统计昨日累计应收，今日营业
  ADate := DateTimePicker1.Date;
  ADateStr := FormatDateTime('yyyymmdd',ADate);

    if FId = 0 then//今日营业
    begin
      s := 'select * from YYTJ';
      Close;
      SQL.Clear;
      SQL.Add(s);
      Open;
    end
    else //历史营业
    begin
      s := 'select * from YYTJDA where D_YSRQ=:YSRQ';
      Close;
      SQL.Clear;
      SQL.Add(s);
      Params[0].DataType := ftString;
      Params[0].Value := ADateStr;
      Open;
    end;

    if Locate('D_XMBH','0',[]) then
    begin
      FSrljys := FieldByName('D_ZRLJYS').AsCurrency;
      FBryy   := FieldByName('D_JRYY').AsCurrency-FieldByName('D_JRYH').AsCurrency;
    end
    else
    begin
      FSrljys := 0;
      FBryy   := 0;
    end;
    //统计上交财务，发票额,零客应收款，客户应收款
    Close;
    SQL.Clear;
    SQL.Add('select * from SJTJ');
    Open;
    if not IsEmpty then
    begin
      if FId = 0 then
        Last
      else
        Locate('D_YSRQ',ADateStr,[]);
      //if not Locate('D_YSRQ',ADateStr,[]) then
        //Locate('D_YSRQ',FormatDateTime('yyyymmdd',Yesterday),[]);
      FSjcw  := FieldByName('D_CWSJE').AsCurrency;
      FFpe   := FieldByName('D_FPE').AsCurrency;
      FLkysk := FieldByName('D_LKYSK').AsCurrency;
      FJzysk := FieldByName('D_KHYSK').AsCurrency;
      FSjyjk := FieldByName('D_YJKSJ').AsCurrency;
      FWjyjk := FieldByName('D_YJKYE').AsCurrency;
      FYjksh := FieldByName('D_YJKSH').AsCurrency;
      FYjkkc := FieldByName('D_YJKKC').AsCurrency;
      FRpjj  := FieldByName('D_RPJJ').AsCurrency;
      FYpjj  := FieldByName('D_YPJJ').AsCurrency;
      FRpjczl:= FieldByName('D_RPJCZL').AsFloat;
      FYpjczl:= FieldByName('D_YPJCZL').AsFloat;

    end
    else
    begin
      FSjcw := 0;
      FFpe  := 0;
      FSjyjk:= 0;
      FWjyjk:= 0;
    end;
  end;
  //FJrljys1 := FSrljys+FBryy+FSjcw+FSjyjk;
  //FJrljys1 := FSrljys+FBryy-FSjcw+FSjyjk;
  FJrljys1 := FSrljys+FBryy-FSjcw;
  //FJrljys2 := FLkysk+FJzysk+FFpe-FWjyjk;
  FJrljys2 := FLkysk+FJzysk+FFpe;

  lblSrljys.Caption := FormatFloat('#.##',FSrljys);
  lblBryy.Caption   := FormatFloat('#.##',FBryy);
  lblSjcw.Caption   := FormatFloat('#.##',FSjcw);
  lblJrljys1.Caption:= FormatFloat('#.##',FJrljys1);


  lblLkysk.Caption  := FormatFloat('#.##',FLkysk);
  lblJzysk.Caption  := FormatFloat('#.##',FJzysk);
  lblFpe.Caption    := FormatFloat('#.##',FFpe);
  lblJrljys2.Caption:= FormatFloat('#.##',FJrljys2);

  lblRpjj.Caption := FormatFloat('#.##',FRpjj);
  lblYpjj.Caption := FormatFloat('#.##',FYpjj);
  lblRpjczl.Caption := Format('%4.3f',[FRpjczl*100])+'%';
  lblYpjczl.Caption := Format('%4.3f',[FYpjczl*100])+'%';

  lblSjyjk.Caption := FormatFloat('#.##',FSjyjk);
  lblWjyjk.Caption := FormatFloat('#.##',FWjyjk);
  lblYjk.Caption := FormatFloat('#.##',FYjksh);
  lblYjkkc.Caption := FormatFloat('#.##',FYjkkc);

end;

procedure TBgrbbForm.ShowTb;
var
  AQb,AYy,AYh,ASh,AYs: Boolean;
begin
  AQb := ComboBox1.ItemIndex = 0;
  AYy := ComboBox1.ItemIndex = 1;
  AYh := ComboBox1.ItemIndex = 2;
  ASh := ComboBox1.ItemIndex = 3;
  AYs := ComboBox1.ItemIndex = 4;

  Series1.Clear;
  Chart1.Title.Text.Clear;
  if qryWorkD_XFXM.Value = '' then
    Chart1.Title.Text.Add('合计')
  else
    Chart1.Title.Text.Add(qryWorkD_XFXM.Value);
  Chart1.Title.Text.Add(DateToStr(DateTimePicker1.Date));

  if (AQb or AYy) then
    Series1.AddBar(qryWorkD_JRYY.Value,'今日营业',clGreen);
  if (AQb or ASh) then
    Series1.AddBar(qryWorkD_JRSH.Value,'今日收回',clBlue);
  if (AQb or AYh) then
    Series1.AddBar(qryWorkD_JRYH.Value,'今日优惠',clYellow);
  if (AQb or AYy) then
    Series1.AddBar(qryWorkD_BYYY.Value/100,'本月营业（百元）',clGreen);
  if (AQb or AYh) then
    Series1.AddBar(qryWorkD_BYYH.Value/100,'本月优惠（百元）',clYellow);
  if (AQb or AYy) then
    Series1.AddBar(qryWorkD_LJYY.Value/100,'累计营业（百元）',clGreen);
  if (AQb or ASh) then
    Series1.AddBar(qryWorkD_LJSH.Value/100,'累计收回（百元）',clBlue);
  if (AQb or AYh) then
    Series1.AddBar(qryWorkD_LJYH.Value/100,'累计优惠（百元）',clYellow);
  if (AQb or AYs) then
    Series1.AddBar(qryWorkD_LJYS.Value/100,'累计应收（百元）',clRed);
  if (AQb or AYy) then
    Series1.AddBar(qryWorkD_ZRBYYY.Value/1000,'昨日本月营业（千元）',clGreen);
  if (AQb or AYh) then
    Series1.AddBar(qryWorkD_ZRBYYH.Value/1000,'昨日本月优惠（千元）',clYellow);
  if (AQb or AYy) then
    Series1.AddBar(qryWorkD_ZRLJYY.Value/1000,'昨日累计营业（千元）',clGreen);
  if (AQb or ASh) then
    Series1.AddBar(qryWorkD_ZRLJSH.Value/1000,'昨日累计收回（千元）',clBlue);
  if (AQb or AYh) then
    Series1.AddBar(qryWorkD_ZRLJYH.Value/1000,'昨日累计优惠（千元）',clYellow);
  if (AQb or AYs) then
    Series1.AddBar(qryWorkD_ZRLJYS.Value/1000,'昨日累计应收（千元）',clRed);
end;

procedure TBgRbbForm.dsWorkDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  ShowTb;
end;

procedure TBgRbbForm.ComboBox1Change(Sender: TObject);
begin
  inherited;
  ShowTb;
end;

procedure TBgRbbForm.DateTimePicker1Change(Sender: TObject);
var
  ADate: TDateTime;
  ADateStr,s: string;
begin
  inherited;
  ADate := DateTimePicker1.Date;
  ADateStr := FormatDateTime('yyyymmdd',ADate);
    s := 'select * from YYTJDA where D_YSRQ=:YSRQ';
    try
      qryWork.DisableControls;
      qryWork.Close;
      qryWork.SQL.Clear;
      qryWork.SQL.Add(s);
      qryWork.Params[0].DataType := ftString;
      qryWork.Params[0].Value := ADateStr;
      qryWork.Open;
    finally
      qryWork.EnableControls;
    end;

  {if FormatDateTime('yyyymmdd',ADate)=FormatDateTime('yyyymmdd',Date) then
  begin
    s := 'select * from YYTJ';
    try
      qryWork.DisableControls;
      qryWork.Close;
      qryWork.SQL.Clear;
      qryWork.SQL.Add(s);
      qryWork.Open;
    finally
      qryWork.EnableControls;
    end;
  end
  else
  begin
    s := 'select * from YYTJDA where D_YSRQ=:YSRQ';
    try
      qryWork.DisableControls;
      qryWork.Close;
      qryWork.SQL.Clear;
      qryWork.SQL.Add(s);
      qryWork.Params[0].DataType := ftString;
      qryWork.Params[0].Value := ADateStr;
      qryWork.Open;
    finally
      qryWork.EnableControls;
    end;
  end; }
  ShowTb;
  ShowHj;
end;

procedure TBgRbbForm.btnPrintClick(Sender: TObject);
begin
  BgrbbPrnForm := TBgrbbPrnForm.Create(Application);
  try
    with BgrbbPrnForm do
    begin
      qrlDate.Caption   := FormatDateTime('yyyy/mm/dd',Date)+' '+'制表人：'+CZY.CzyXm;
      QRLabel18.Caption := FormatFloat('#.##',FSrljys);// FormatFloat('#.##',FSrljys)+'元';
      QRLabel19.Caption := FormatFloat('#.##',FBryy);//FormatFloat('#.##',FBryy)+'元';
      QRLabel20.Caption := FormatFloat('#.##',FSjcw);//FormatFloat('#.##',FSjcw)+'元';
      QRLabel21.Caption := FormatFloat('#.##',FJrljys1);//FormatFloat('#.##',FJrljys1)+'元';


      QRLabel22.Caption := FormatFloat('#.##',FLkysk);//FormatFloat('#.##',FLkysk)+'元';
      QRLabel23.Caption := FormatFloat('#.##',FJzysk);//FormatFloat('#.##',FJzysk)+'元';
      QRLabel24.Caption := FormatFloat('#.##',FFpe);//FormatFloat('#.##',FFpe)+'元';
      QRLabel25.Caption := FormatFloat('#.##',FJrljys2);//FormatFloat('#.##',FJrljys2)+'元';

      QRLabel26.Caption := FormatFloat('#.##',FRpjj);//FormatFloat('#.##',FRpjj)+'元';
      QRLabel27.Caption := FormatFloat('#.##',FYpjj);//FormatFloat('#.##',FYpjj)+'元';
      QRLabel28.Caption := Format('%4.3f',[FRpjczl*100])+'%';
      QRLabel29.Caption := Format('%4.3f',[FYpjczl*100])+'%';

      QRLabel30.Caption := FormatFloat('#.##',FSjyjk);//FormatFloat('#.##',FSjyjk)+'元';
      QRLabel31.Caption := FormatFloat('#.##',FWjyjk);//FormatFloat('#.##',FWjyjk)+'元';
      QRLabel32.Caption := FormatFloat('#.##',FYjksh);//FormatFloat('#.##',FYjksh)+'元';
      QRLabel33.Caption := FormatFloat('#.##',FYjkkc);//FormatFloat('#.##',FYjkkc)+'元';
      QuickRep1.Print;
      //QuickRep1.PreviewModal;
    end;
  finally
    BgrbbPrnForm.Free;
  end;

end;

procedure TBgRbbForm.btnChartPrintClick(Sender: TObject);
begin
  inherited;
  Chart1.Print;
end;

procedure TBgRbbForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Chart1.View3D := CheckBox1.Checked;
end;

procedure TBgRbbForm.qryWorkCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryWorkD_JRXJ.AsCurrency := qryWorkD_JRYY.AsCurrency-qryWorkD_JRYH.AsCurrency;
  qryWorkD_BYXJ.AsCurrency := qryWorkD_BYYY.AsCurrency-qryWorkD_BYYH.AsCurrency;
  qryWorkD_LJXJ.AsCurrency := qryWorkD_LJYY.AsCurrency-qryWorkD_LJYH.AsCurrency;
end;

end.

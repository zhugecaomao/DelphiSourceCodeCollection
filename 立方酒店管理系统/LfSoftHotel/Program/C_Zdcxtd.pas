unit C_Zdcxtd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  DB, DBTables, C_Define;

type
  TZdcxTdForm = class(TStandForm)
    qryKrzdcx: TQuery;
    Label1: TLabel;
    ComboBox1: TComboBox;
    btnQuery: TBitBtn;
    lblYfje: TLabel;
    lblXfje: TLabel;
    lblYjje: TLabel;
    DBGrid1: TDBGrid;
    qryKryj: TQuery;
    dsKryj: TDataSource;
    lblWjje: TLabel;
    lblYjye: TLabel;
    btnYjbj: TBitBtn;
    btnYfqk: TBitBtn;
    qryKfzt: TQuery;
    Bevel1: TBevel;
    qryKryjD_YJBH: TStringField;
    qryKryjD_HH: TIntegerField;
    qryKryjD_FKFS: TStringField;
    qryKryjD_XYKBH: TStringField;
    qryKryjD_KHBH: TStringField;
    qryKryjD_YFJE: TFloatField;
    qryKryjD_YFRQ: TDateTimeField;
    qryKryjD_YFSJ: TDateTimeField;
    qryKryjD_BZ: TStringField;
    qryKrzdcxD_XMMC: TStringField;
    DBGrid2: TDBGrid;
    qryKrzdcxD_XMBH: TStringField;
    qryKrzdcxSUM: TFloatField;
    qryKrzdcxSUM_1: TFloatField;
    dsKrzd: TDataSource;
    btnFjmx: TBitBtn;
    btnZdmx: TBitBtn;
    DBGrid3: TDBGrid;
    qryKrzdcx1: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    dsKrzdcx1: TDataSource;
    qryKrzdcx1SUM: TFloatField;
    btnPrint: TBitBtn;
    procedure btnQueryClick(Sender: TObject);
    procedure btnYjbjClick(Sender: TObject);
    procedure btnYfqkClick(Sender: TObject);
    procedure btnZdmxClick(Sender: TObject);
    procedure btnFjmxClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    FKrbh: string;
    FTdxx: TTdxx;
    FYjxx: TYjxx;
    FXfxx: TXfxx;
    FYfje: Currency;
    FXfje: Currency;
    FYjje: Currency;
    FDtfj: Currency;
    FDhf : Currency;
    procedure ShowXx;
    procedure ShowXfxx;
    procedure ShowYjxx;
  public
    { Public declarations }
  end;

var
  ZdcxTdForm: TZdcxTdForm;

procedure ZdcxTd;
procedure ZdcxTdEnter(const AKrbh: string);

implementation

uses C_HotelData, C_Bjyj, C_Tdyfcx, C_Wait, C_Zdmx, C_Fjmx, C_PrintDlg;

{$R *.dfm}

procedure ZdcxTd;
begin
  ZdcxTdForm := TZdcxTdForm.Create(Application);
  try
    with ZdcxTdForm do
    begin
      ShowXx;
      HotelData.ListTdmc(ComboBox1);
      ShowModal;
    end;
  finally
    ZdcxTdForm.Free;
  end;
end;

procedure ZdcxTdEnter(const AKrbh: string);
var
  AKrxm: string;
begin
  ZdcxTdForm := TZdcxTdForm.Create(Application);
  try
    with ZdcxTdForm do
    begin
      ShowXx;
      HotelData.ListTdmc(ComboBox1);
      AKrxm := HotelData.FindUserBh('KRXX','D_KRXM','D_KRBH',AKrbh);
      ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(AKrxm);
      btnQueryClick(nil);
      ShowModal;
    end;
  finally
    ZdcxTdForm.Free;
  end;
end;

procedure TZdcxTdForm.ShowXx;
begin
  lblYfje.Caption := '押金金额：'+FormatFloat('#.##',FYfje);
  lblXfje.Caption := '消费金额：'+FormatFloat('#.##',FXfje);
  lblYjje.Caption := '已结金额：'+FormatFloat('#.##',FYjje);
  lblWjje.Caption := '未结金额：'+FormatFloat('#.##',FXfje-FYjje);
  lblYjye.Caption := '押金余额：'+FormatFloat('#.##',FYfje-FXfje+FYjje);//CurrToStr(FYfje-FXfje+FYjje)+'元';
end;

procedure TZdcxTdForm.ShowXfxx;
//var
  //i   : Integer;
  //IsFj: Boolean;//是否存在房金
  //AKfxx: TKFxx;
  //ADtfj: Currency;
begin
  with qryKrzdcx do
  begin
    if Active then Active := False;
    ParamByName('ZDBH').AsString := FTdxx.AZdbh;
    try
      Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;
  end;
  with qryKrzdcx1 do
  begin
    if Active then Active := False;
    ParamByName('ZDBH').AsString := FTdxx.AZdbh;
    try
      Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;
  end;

{    for i := 0 to StringGrid1.RowCount-1 do
      StringGrid1.Rows[i].Clear;

    StringGrid1.Cells[0,0] := '消费时间';
    StringGrid1.Cells[1,0] := '消费项目';
    StringGrid1.Cells[2,0] := '消费金额';
    StringGrid1.Cells[3,0] := '消费备注';

    First;
    i := 1;
    while not Eof do
    begin
      if (FieldByName('D_XMBH').AsString = XMBH_FJ)and(FieldByName('D_SJFJ').AsCurrency>0) then
      begin
        AKfxx := HotelData.GetKfxx(FieldByName('D_KFBH').AsString);
        ADtfj := GetDtfj(AKfxx.ADdsj,Time,AKfxx.AKfbz,AKfxx.ASjfj);
        FDtfj := FDtfj + ADtfj;
        StringGrid1.Cells[0,i] := FieldByName('D_XFRQ').AsString;
        StringGrid1.Cells[1,i] := FieldByName('D_XMMC').AsString;
        StringGrid1.Cells[2,i] := CurrToStr(FieldByName('D_XFJE').AsCurrency+ADtfj)+'元';
        StringGrid1.Cells[3,i] := FieldByName('D_BZ').AsString;
      end
      else
      begin
        StringGrid1.Cells[0,i] := FieldByName('D_XFRQ').AsString;
        StringGrid1.Cells[1,i] := FieldByName('D_XMMC').AsString;
        StringGrid1.Cells[2,i] := CurrToStr(FieldByName('D_XFJE').AsCurrency)+'元';
        StringGrid1.Cells[3,i] := FieldByName('D_BZ').AsString;
      end;
      Next;
      Inc(i);
    end;

    StringGrid1.RowCount := i+1;
    StringGrid1.ColWidths[0] := 100;
    StringGrid1.ColWidths[1] := 80;
    StringGrid1.ColWidths[2] := 100;
    StringGrid1.ColWidths[3] := 200;
  end;}
end;

procedure TZdcxTdForm.ShowYjxx;
begin
  with qryKryj do
  begin
    DisableControls;
    if Active then Active := False;
    ParamByName('YJBH').AsString := FTdxx.AYjbh;
    try
      Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    EnableControls;
  end;
end;

procedure TZdcxTdForm.btnQueryClick(Sender: TObject);
var
  AKrxm: string;
  ADtfj: Currency;
  ADhf: Currency;
  s : string;
  AHh : Integer;
  AKfxx: TKfxx;
begin
  inherited;
  if ComboBox1.ItemIndex < 0 then Exit;

  WaitForm := TWaitForm.Create(Application);
  try
    WaitForm.FTitle := '统计团队消费';
    WaitForm.Show;
    WaitForm.Update;

  AKrxm := ComboBox1.Items[ComboBox1.ItemIndex];
  FKrbh := HotelData.FindUserBh('KRXX','D_KRBH','D_KRXM',AKrxm);
  FTdxx := HotelData.GetTdxx(FKrbh);
  FYjxx := HotelData.GetYjxx(FTdxx.AYjbh);

  HotelData.EmptyData('delete from KRZDCX');
  s := 'select * from KRZD where D_ZDBH="'+FTdxx.AZdbh+'"';
  HotelData.BakData(s,'KRZDCX');


  FDtfj := 0;
  FDhf  := 0;
  with qryKfzt do
  begin
    if Active then Active := False;
    ParamByName('KRBH').AsString := FTdxx.AKrbh;
    try
      Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;
    HotelData.tblKrzdcx.Open;
    HotelData.tblKrzdcx.Last;
    AHh := HotelData.tblKrzdcx.FieldByName('D_HH').AsInteger;
    First;
    while not Eof do
    begin
      AKfxx := HotelData.GetKfxx1(qryKfzt.FieldByName('D_KFBH').AsString);
      //获取当天房价
      ADtfj := GetDtfj(AKfxx.ADdsj,Time,AKfxx.AKfbz,AKfxx.ASjfj);
      //获取当天电话费
      ADhf  := HotelData.GetDhf(AKfxx.AKfbh,AKfxx.ADdrq,AKfxx.ADdsj);

      FDtfj := FDtfj + ADtfj;
      FDhf  := FDhf + ADhf;

      with HotelData do
      begin
        if ADtfj <> 0 then
        begin
          s := 'update KRZDCX set D_XFJE=D_XFJE+'+CurrToStr(ADtfj)
              +' where (D_KFBH="'+AKfxx.AKfbh+'")and(D_XMBH="'
              +XMBH_FJ+'")and(D_SJFJ>0)and(D_JZBZ="'+JZ_NO+'")';
          HotelData.ExecSql(s);
        end;
        if ADhf <> 0 then
        begin
          Inc(AHh);
          tblKrzdcx.Insert;
          tblKrzdcx.FieldByName('D_ZDBH').AsString := FTdxx.AZdbh;
          tblKrzdcx.FieldByName('D_HH').AsInteger := AHh;
          tblKrzdcx.FieldByName('D_XMBH').AsString := XMBH_DHF;
          tblKrzdcx.FieldByName('D_KFBH').AsString := AKfxx.AKfbh;
          tblKrzdcx.FieldByName('D_XFJE').AsCurrency := ADhf;
          tblKrzdcx.FieldByName('D_XFRQ').AsDateTime := Date;
          tblKrzdcx.FieldByName('D_XFSJ').AsDateTime := Time;
          tblKrzdcx.FieldByName('D_JZBZ').AsString  := JZ_NO;
          tblKrzdcx.FieldByName('D_JSBZ').AsString  := JZ_NO;
          tblKrzdcx.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
          tblKrzdcx.FieldByName('D_BZ').AsString := '团队'+AKfxx.AKfbh;
          tblKrzdcx.Post;
        end;
      end;
      Next;
    end;
    Close;
    HotelData.tblKrzdcx.Close;
  end;

  ShowXfxx;

  FYfje := FYjxx.AYfje;
  FXfxx := HotelData.GetXfxx(FTdxx.AZdbh);

  FXfje := FXfxx.AXfje + FDtfj + FDhf;
  //FXfje := FXfxx.AXfje;
  FYjje := FXfxx.AYjje;

  ShowXx;

  ShowYjxx;

  finally
    WaitForm.Hide;
    WaitForm.Free;
  end;

end;

procedure TZdcxTdForm.btnYjbjClick(Sender: TObject);
begin
  inherited;
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  if FKrbh<> '' then
  begin
    BjyjTd(FKrbh);
    btnQueryClick(nil);
  end;
end;

procedure TZdcxTdForm.btnYfqkClick(Sender: TObject);
begin
  inherited;
  if FKrbh<> '' then
    Tdyfcx(FKrbh);
end;

procedure TZdcxTdForm.btnZdmxClick(Sender: TObject);
begin
  inherited;
  Zdmx(FTdxx.AZdbh);
end;

procedure TZdcxTdForm.btnFjmxClick(Sender: TObject);
begin
  inherited;
  Fjmx(FTDxx.AZdbh);
end;

procedure TZdcxTdForm.btnPrintClick(Sender: TObject);
begin
  inherited;
  PrintDlg('团队帐单','团队帐单',dsKrzd,dsKrzdcx1,nil,nil);
end;

end.

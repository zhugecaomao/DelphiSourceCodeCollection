unit C_Ydcytd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, DB, DBTables,
  ComCtrls, C_Define, DateUtils, Grids, ValEdit, DBGrids, DBCtrls;

type
  TYdcytdForm = class(TStdJdForm)
    Label10: TLabel;
    lblKrxm: TLabel;
    Label12: TLabel;
    lblDwmc: TLabel;
    tblYdcy: TTable;
    Label1: TLabel;
    dtpBd: TDateTimePicker;
    Label2: TLabel;
    dtpEd: TDateTimePicker;
    btnInsert: TBitBtn;
    DBGrid1: TDBGrid;
    dsYdcy: TDataSource;
    btnYdqr: TBitBtn;
    btnYdqx: TBitBtn;
    lblState: TStaticText;
    Label3: TLabel;
    edtBz: TEdit;
    tblYdcyD_YDBH: TStringField;
    tblYdcyD_CTBH: TStringField;
    tblYdcyD_CTMC: TStringField;
    tblYdcyD_KRBH: TStringField;
    tblYdcyD_KRXM: TStringField;
    tblYdcyD_YDRQ: TDateTimeField;
    tblYdcyD_SYRQ: TDateTimeField;
    tblYdcyD_SYSJ: TDateTimeField;
    tblYdcyD_SJDM: TStringField;
    tblYdcyD_YCBZ: TStringField;
    tblYdcyD_YCLX: TIntegerField;
    tblYdcyD_RS: TIntegerField;
    tblYdcyD_DJ: TFloatField;
    tblYdcyD_XFSL: TFloatField;
    tblYdcyD_XFJE: TFloatField;
    tblYdcyD_YDBZ: TStringField;
    tblYdcyD_RZBZ: TStringField;
    tblYdcyD_KTBZ: TStringField;
    tblYdcyD_JSBZ: TStringField;
    tblYdcyD_BZ: TBlobField;
    tblYdcyD_CZYXM: TStringField;
    tblYdcyD_XFZE: TCurrencyField;
    btnPrint: TBitBtn;
    tblYdcytd: TTable;
    Label4: TLabel;
    lblLxdh: TLabel;
    procedure tblYdcyNewRecord(DataSet: TDataSet);
    procedure dtpBdChange(Sender: TObject);
    procedure dtpEdChange(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnCancClick(Sender: TObject);
    procedure tblYdcyCalcFields(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure tblYdcyBeforeInsert(DataSet: TDataSet);
    procedure btnYdqrClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnYdqxClick(Sender: TObject);
  private
    { Private declarations }
    FKrbh: string;
    FYdbh: string;
    FHh: Integer;
    FBd: TDateTime;
    FEd: TDateTime;
    FRzbz: string;
    IsAppend: Boolean;
    procedure ShowState;
  public
    { Public declarations }
  end;

var
  YdcytdForm: TYdcytdForm;

procedure YdcytdNew(const AKrbh: string);
procedure YdcytdEdit(const AKrbh,AYdbh: string);

implementation

uses C_HotelData, C_YdcytdPrint;

{$R *.dfm}

//新增预定
procedure YdcytdNew(const AKrbh: string);
begin
  YdcytdForm := TYdcytdForm.Create(Application);
  try
    with YdcytdForm do
    begin
      //初始化
      FKrbh      := AKrbh;
      FYdbh      := HotelData.GetBh('D_YDBH',PREV_YDBH);
      FHh        := 1;
      FRzbz      := 'F';
      dtpBd.Date := Tomorrow;
      dtpEd.Date := Tomorrow;
      FBd        := dtpBd.Date;
      FEd        := dtpEd.Date;
      lblKrxm.Caption := HotelData.FindUserBh('YDXX','D_KRXM','D_KRBH',FKrbh);
      lblDwmc.Caption := HotelData.FindUserBh('YDXX','D_LXR','D_KRBH',FKrbh);
      lblLxdh.Caption := HotelData.FindUserBh('YDXX','D_LXDH','D_KRBH',FKrbh);
      try
        tblYdcy.Open;
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

      tblYdcy.Filter   := 'D_YDBH='''+FYdbh+''' and D_CTBH<>''0''';
      tblYdcy.Filtered := True;
      //IsAppend := True;
      ShowState;
      ShowModal;
    end;
  finally
    YdcytdForm.tblYdcy.Close;
    YdcytdForm.tblYdcy.Filter   := '';
    YdcytdForm.tblYdcy.Filtered := False;
    YdcytdForm.Free;
  end;
end;

//编辑预定
procedure YdcytdEdit(const AKrbh,AYdbh: string);
begin
  YdcytdForm := TYdcytdForm.Create(Application);
  try
    with YdcytdForm do
    begin
      //初始化
      FKrbh    := AKrbh;
      FYdbh    := AYdbh;
      IsAppend := False;
      lblKrxm.Caption := HotelData.FindUserBh('YDXX','D_KRXM','D_KRBH',FKrbh);
      lblDwmc.Caption := HotelData.FindUserBh('YDXX','D_LXR','D_KRBH',FKrbh);
      lblLxdh.Caption := HotelData.FindUserBh('YDXX','D_LXDH','D_KRBH',FKrbh);
      try
        tblYdcy.Open;
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

      tblYdcy.Filter   := 'D_YDBH='''+FYdbh+''' and D_CTBH<>''0''';
      tblYdcy.Filtered := True;

      tblYdcy.First;
      dtpBd.Date := tblYdcyD_SYRQ.Value;
      FRzbz      := tblYdcyD_RZBZ.Value;
      edtBz.Text := tblYdcyD_BZ.Value;

      tblYdcy.Last;
      dtpEd.Date := tblYdcyD_SYRQ.Value;

      FHh := tblYdcyD_CTBH.AsInteger + 1;

      FBd := dtpBd.Date;
      FEd := dtpEd.Date;

      ShowState;
      ShowModal;
    end;
  finally
    YdcytdForm.tblYdcy.Close;
    YdcytdForm.tblYdcy.Filter   := '';
    YdcytdForm.tblYdcy.Filtered := False;
    YdcytdForm.Free;
  end;
end;

procedure TYdcytdForm.ShowState;
begin
  if FRzbz='T' then
  begin
    lblState.Caption    := '已确认';
    lblState.Font.Color := clGreen;
  end
  else
  begin
    lblState.Caption    := '未确认';
    lblState.Font.Color := clYellow;
  end;

  btnYdqr.Enabled := FRzbz<>'T';
  //btnYdqx.Enabled := btnYdqr.Enabled;
end;

procedure TYdcytdForm.tblYdcyNewRecord(DataSet: TDataSet);
begin
  inherited;
  tblYdcyD_YDBH.Value := FYdbh;
  tblYdcyD_KRBH.Value := FKrbh;
  tblYdcyD_YDRQ.Value := Date;
  tblYdcyD_CTMC.Value := '团队定餐';
  tblYdcyD_JSBZ.Value := JS_NO;
  tblYdcyD_YDBZ.Value := YDCY_TD;
  tblYdcyD_KRXM.Value := lblKrxm.Caption;
  tblYdcyD_CZYXM.Value:= CZY.CzyXm;
end;

procedure TYdcytdForm.dtpBdChange(Sender: TObject);
begin
  inherited;
  FBd := dtpBd.Date;
end;

procedure TYdcytdForm.dtpEdChange(Sender: TObject);
begin
  inherited;
  FEd := dtpEd.Date;
end;

//插入
procedure TYdcytdForm.btnInsertClick(Sender: TObject);
var
  ADate: TDate;
begin
  inherited;
  if FEd<FBd then
  begin
    ShowWarning('用餐截止日期必须大于等于起始日期!');
    Exit;
  end;

  IsAppend := True;
  ADate    := FBd;

  while ADate<=FEd do
  begin
    //如果存在则继续
    if tblYdcy.Locate('D_SYRQ',ADate,[]) then
    begin
      ADate := IncDay(ADate,1);
      Continue;
    end;

    tblYdcy.Insert;
    tblYdcyD_CTBH.Value := IntToStr(FHh);
    tblYdcyD_SYRQ.Value := StrToDate(FormatDateTime('yyyy-mm-dd',ADate));
    tblYdcyD_SYSJ.Value := EnCodeTime(7,0,0,0);
    tblYdcyD_SJDM.Value := Morning;
    tblYdcyD_RZBZ.Value := FRzbz;
    tblYdcy.Post;
    Inc(FHh);

    tblYdcy.Insert;
    tblYdcyD_CTBH.Value := IntToStr(FHh);
    tblYdcyD_SYRQ.Value := StrToDate(FormatDateTime('yyyy-mm-dd',ADate));
    tblYdcyD_SYSJ.Value := EnCodeTime(12,0,0,0);
    tblYdcyD_SJDM.Value := Noon;
    tblYdcyD_RZBZ.Value := FRzbz;
    tblYdcy.Post;
    Inc(FHh);

    tblYdcy.Insert;
    tblYdcyD_CTBH.Value := IntToStr(FHh);
    tblYdcyD_SYRQ.Value := StrToDate(FormatDateTime('yyyy-mm-dd',ADate));
    tblYdcyD_SYSJ.Value := EnCodeTime(18,0,0,0);
    tblYdcyD_SJDM.Value := Night;
    tblYdcyD_RZBZ.Value := FRzbz;
    tblYdcy.Post;
    Inc(FHh);

    ADate := IncDay(ADate,1);
  end;
  IsAppend := False;
end;

procedure TYdcytdForm.btnCancClick(Sender: TObject);
begin
  inherited;
  tblYdcy.CancelUpdates;
end;

procedure TYdcytdForm.tblYdcyCalcFields(DataSet: TDataSet);
begin
  inherited;
  tblYdcyD_XFZE.Value := tblYdcyD_XFSL.Value*tblYdcyD_DJ.Value;
end;

//确定
procedure TYdcytdForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定修改') then Exit;
  if tblYdcy.IsEmpty then
  begin
    ShowWarning('请输入用餐台数和用餐标准！');
    Exit;
  end;

  try
    tblYdcy.DisableControls;
    HotelData.DatabaseUser.StartTransaction;
    try
      tblYdcy.First;
      while not tblYdcy.Eof do
      begin
          {tblYdcy.Edit;
          tblYdcyD_BZ.Value   := edtBz.Text;
          tblYdcyD_RZBZ.Value := FRzbz;
          tblYdcyD_XFJE.Value := tblYdcyD_XFSL.Value*tblYdcyD_DJ.Value;
          if tblYdcyD_DJ.Value<>0 then
            tblYdcyD_YCBZ.Value := tblYdcyD_XFSL.AsString+' 桌×'+tblYdcyD_DJ.AsString+'元';
          tblYdcy.Post;
          tblYdcy.Next;}

        if tblYdcyD_XFZE.Value = 0 then
          tblYdcy.Delete
        else
        begin
          tblYdcy.Edit;
          tblYdcyD_BZ.Value   := edtBz.Text;
          tblYdcyD_RZBZ.Value := FRzbz;
          tblYdcyD_XFJE.Value := tblYdcyD_XFSL.Value*tblYdcyD_DJ.Value;
          tblYdcyD_YCBZ.Value := tblYdcyD_XFSL.AsString+' 桌×'+tblYdcyD_DJ.AsString+'元';
          tblYdcy.Post;
          tblYdcy.Next;

        end;
      end;



      //插入总单
      IsAppend         := True;
      tblYdcy.Filtered := False;
      if not tblYdcy.FindKey([FYdbh,'0']) then
      begin
        tblYdcy.Insert;
        tblYdcyD_CTBH.Value := '0';
        tblYdcyD_SYRQ.Value := StrToDate(FormatDateTime('yyyy-mm-dd',FBd));
        tblYdcyD_RZBZ.Value := FRzbz;
        tblYdcyD_BZ.Value   := edtBz.Text;
        tblYdcy.Post;
      end
      else
      begin
        tblYdcy.Edit;
        tblYdcyD_SYRQ.Value := FBd;
        tblYdcyD_RZBZ.Value := FRzbz;
        tblYdcyD_BZ.Value   := edtBz.Text;
        tblYdcy.Post;
      end;
      IsAppend := False;
      tblYdcy.Filtered := True;
      tblYdcy.ApplyUpdates;
      HotelData.DatabaseUser.Commit;
    except
      HotelData.DatabaseUser.Rollback;
      raise;
    end;

    tblYdcy.CommitUpdates;
  finally
    tblYdcy.EnableControls;
  end;
  Close;
end;

procedure TYdcytdForm.tblYdcyBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if not IsAppend then
    Abort;
end;

procedure TYdcytdForm.btnYdqrClick(Sender: TObject);
begin
  inherited;
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定确认') then Exit;
  if Confirm('你确认该餐饮的预定吗？') then
  begin
    FRZBZ := 'T';
    //ShowState;
    btnOkClick(nil);
  end;
end;

procedure TYdcytdForm.btnPrintClick(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定确认') then Exit;
  if Confirm('你确认该餐饮的预定吗？') then
  begin
    FRzbz := 'T';
    //ShowState;
    btnOkClick(nil);
  end
  else
    Exit;

  YdcytdPrintForm := TYdcytdPrintForm.Create(Application);
  try
    with YdcytdPrintForm do
    begin
      qrlSub.Caption  := '打印时间：'+DateTimeToStr(Now)+' '+'通知人：'+CZY.CzyXm;
      qrlKrxm.Caption := lblKrxm.Caption;
      qrlLxr.Caption  := lblDwmc.Caption;
      qrlLxdh.Caption := lblLxdh.Caption;
      qrlBz.Lines.Add(edtBz.Text);
      qrlYcsj.Caption := DateToStr(FBd)+'至'+DateToStr(FEd);
      YdcytdPrint;
    end;
  finally
    YdcytdPrintForm.Free;
  end;

end;

procedure TYdcytdForm.btnYdqxClick(Sender: TObject);
begin
  inherited;
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定确认') then Exit;
  if Confirm('你取消该餐饮的确认吗？') then
  begin
    FRzbz := 'F';
    ShowState;
    //btnOkClick(nil);
  end;
end;

end.

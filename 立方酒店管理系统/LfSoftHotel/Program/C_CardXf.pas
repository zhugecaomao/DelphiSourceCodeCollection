unit C_CardXf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, C_Define, DB,
  DBTables;

type
  TCardXfForm = class(TStdJdForm)
    btnReadCard: TBitBtn;
    memRead: TMemo;
    GroupBox1: TGroupBox;
    edtRCardId: TLabeledEdit;
    edtRCardJe: TLabeledEdit;
    GroupBox2: TGroupBox;
    edtXfje: TLabeledEdit;
    edtKcje: TLabeledEdit;
    edtKnye: TLabeledEdit;
    tblCard: TTable;
    tblCardXf: TTable;
    edtKrxm: TLabeledEdit;
    radJzfs: TRadioGroup;
    Label4: TLabel;
    cmbJz: TComboBox;
    procedure btnReadCardClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancClick(Sender: TObject);
    procedure radJzfsClick(Sender: TObject);
  private
    { Private declarations }
    FGbkJzxx: TGbkJzxx;
    FCardId: string;
    FXfje: Currency;
    FKcje: Currency;
    FKnyeOld: Currency;
    FKnyeNew: Currency;
    IsReadCard: Boolean;
    FJz: Boolean;
    procedure ShowKcje;
    procedure UpdateCard;
    procedure UpdateCardXf;
    function IsValid: Boolean;
  public
    { Public declarations }
  end;

var
  CardXfForm: TCardXfForm;

function CardXf(AXfje: Currency;IsJz: Boolean): TGbkJzxx;

implementation

uses IcCardDefine, drv_unit, C_HotelData;

{$R *.dfm}

function CardXf(AXfje: Currency;IsJz: Boolean): TGbkJzxx;
begin
  CardXfForm := TCardXfForm.Create(Application);
  try
    with CardXfForm do
    begin
      IsReadCard := False;
      FXfje := AXfje;
      FKcje := 0;
      FJz   := IsJz;

      edtXfje.Text   := CurrToStr(FXfje);
      FGbkJzxx.AJzfs := JZFS_RMB;

      try
        tblCard.Open;
        tblCardXf.Open;
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

      ShowModal;
      Result := FGbkJzxx;
    end;
  finally
    CardXfForm.tblCard.Close;
    CardXfForm.tblCardXf.Close;
    CardXfForm.Free;
  end;
end;

procedure TCardXfForm.UpdateCard;
begin
  if tblCard.FindKey([FCardId]) then
  begin
    tblCard.Edit;
    tblCard.FieldByName('D_JE').AsCurrency := tblCard.FieldByName('D_JE').AsCurrency + FKcje;
    tblCard.FieldByName('D_YE').AsCurrency := tblCard.FieldByName('D_ZE').AsCurrency - tblCard.FieldByName('D_JE').AsCurrency;
    tblCard.Post;
  end;
end;

procedure TCardXfForm.UpdateCardXf;
begin
  tblCardXf.Append;
  tblCardXf.FieldByName('D_CARDID').AsString := FCardId;
  tblCardXf.FieldByName('D_KRXM').AsString := edtKrxm.Text;
  tblCardXf.FieldByName('D_XFJE').AsCurrency := FKcje;
  tblCardXf.FieldByName('D_XFRQ').AsDateTime := Date;
  tblCardXf.FieldByName('D_XFSJ').AsDateTime := Time;
  tblCardXf.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
  tblCardXf.Post;
end;

procedure TCardXfForm.ShowKcje;
begin
  edtKcje.Text := CurrToStr(FKcje);
  edtKnye.Text := CurrToStr(FKnyeNew);
  if FXfje>FKcje then
  begin
    memRead.Lines.Add('卡内余额不足！请补交金额：');
    memRead.Lines.Add(CurrToStr(FXfje-FKcje)+'元');
  end;
end;

procedure TCardXfForm.btnReadCardClick(Sender: TObject);
var
  st : SmallInt;
  Je : single;
begin
  try
    InitStatus(PORTNUM);
    GetMem(OutBuf,6);
    if not IsCardExists then
    begin
      memRead.Lines.Add('请插入贵宾卡！');
      Exit;
    end;
    st := IC_Read(IcDev,32,6,OutBuf);
    if st <> 0 then
      raise Exception.Create('读卡错误！');
    FCardId := StrPas(OutBuf);
    edtRCardId.Text := FCardId;
    st := IC_Read_Float(IcDev,38,@Je);
    if st <> 0 then
      raise Exception.Create('读卡错误！');
    FKnyeOld := Je;
    edtRCardJe.Text := FloatToStr(Je);
    memRead.Lines.Add('读卡成功！');
    IsReadCard := True;

    if FXfje<FKnyeOld then
      FKcje := FXfje
    else
      FKcje := FKnyeOld;
    FKnyeNew := FKnyeOld - FKcje;
    if FKnyeNew<0 then FKnyeNew := 0;
    ShowKcje;
    if tblCard.FindKey([FCardId]) then
    begin
      if Abs(FKnyeOld-tblCard.FieldByName('D_YE').AsCurrency)>1 then
        memRead.Lines.Add('卡内余额与数据库中的余额不符！请查实');
    end
    else
      memRead.Lines.Add('数据库中没有该卡的信息！请查实');
  finally
    FreeMem(OutBuf);
    ExitComm;
  end;
end;

//写卡
procedure TCardXfForm.btnOKClick(Sender: TObject);
var
  st : SmallInt;
  Ye : Single;
  //s : string;
begin
  //如果消费金额大于卡内金额 则需要选择余额结帐方式
  if not Confirm('你确认结帐吗?') then Exit;
  if FXfje>FKcje then
  begin
    if not IsValid then Exit;
  end
  else
    FGbkJzxx.AJzfs := '';

  FGbkJzxx.AKcje := FKcje;

  if not IsReadCard then
  begin
    ShowWarning('请先读卡！');
    Exit;
  end;

  if FKcje = 0 then Exit;

    try

      InitStatus(PORTNUM);

      if not IsCardExists then
      begin
        memRead.Lines.Add('请插入贵宾卡！');
        Exit;
      end;

      if CheckPass then
      begin
      {st := IC_Read(IcDev,32,6,OutBuf);
      if st <> 0 then
        raise Exception.Create('读卡错误！');
      s := StrPas(OutBuf);
      if s<> FCardId then
      begin
        ShowMessage('卡号不符！');
        Exit;
      end;}

        Ye := FKnyeNew;
        st := IC_Write_Float(IcDev,38,Ye);
        if st <> 0 then
          raise Exception.Create('写卡错误！');
      end;
    finally
      ExitComm;
    end;

    UpdateCard;
    UpdateCardXf;

    if FXfje > FKcje then
      ShowInfo('卡内余额不足！请补交金额'+CurrToStr(FXfje-FKcje)+'元');

  Close;
end;

procedure TCardXfForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ExitComm;
end;

procedure TCardXfForm.btnCancClick(Sender: TObject);
begin
  inherited;
  FGbkJzxx.AKcje := 0;
  FGbkJzxx.AJzfs := '';
end;

procedure TCardXfForm.radJzfsClick(Sender: TObject);
begin
  inherited;
  cmbJz.Items.Clear;
  cmbJz.Style := csDropDownList;

  case radJzfs.ItemIndex of
    0: FGbkJzxx.AJzfs := JZFS_RMB;
    1:
      begin
        HotelData.ListMc(cmbJz,'XYK.DB','D_XYKMC');
        FGbkJzxx.AJzfs := JZFS_XYK;
      end;
    2: FGbkJzxx.AJzfs := JZFS_ZP;
    3:
      begin
        cmbJz.Style := csDropDown;
        HotelData.ListDm(cmbJz,'KHDA.DB','D_KHMC');
        FGbkJzxx.AJzfs := JZFS_JZ;
      end;
  end;

end;

//检查是否选择有效
function TCardXfForm.IsValid: Boolean;
var
  s: string;
begin
  Result := False;
  case radJzfs.ItemIndex of
    1:
      begin
        FGbkJzxx.AXykbh := HotelData.FindBh('XYK.DB','D_XYKBH','D_XYKMC',cmbJz.Text);
        if FGbkJzxx.AXykbh<>'' then
          Result := True
        else
          ShowInfo('请选择信用卡！');
      end;
    3:
      begin
        if not FJz then
        begin
          ShowInfo('不允许记账！');
          Result := False;
        end;
        s := GetMc(cmbJz.Text);
        FGbkJzxx.AKhbh := HotelData.FindBh('KHDA.DB','D_KHBH','D_KHMC',s);
        if FGbkJzxx.AKhbh<>'' then
          Result := True
        else
          ShowInfo('请选择记帐客户！');
      end;
    else
      Result := True;
  end;
end;

end.

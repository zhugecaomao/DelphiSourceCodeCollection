{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_Sktf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, DB, DBTables, C_Define;

type
  TSktfForm = class(TStdJdForm)
    Label1: TLabel;
    edtDcfh: TEdit;
    Label2: TLabel;
    edtDcfj: TEdit;
    Label3: TLabel;
    edtDrfh: TEdit;
    Label4: TLabel;
    edtDrfj: TEdit;
    tblKrzd: TTable;
    tblKfzt: TTable;
    tblKrzdD_ZDBH: TStringField;
    tblKrzdD_HH: TIntegerField;
    tblKrzdD_ZDLB: TStringField;
    tblKrzdD_KRBH: TStringField;
    tblKrzdD_YJBH: TStringField;
    tblKrzdD_KFBH: TStringField;
    tblKrzdD_SJFJ: TFloatField;
    tblKrzdD_XMBH: TStringField;
    tblKrzdD_XFDJ: TFloatField;
    tblKrzdD_XFSL: TFloatField;
    tblKrzdD_XFJE: TFloatField;
    tblKrzdD_XFRQ: TDateTimeField;
    tblKrzdD_XFSJ: TDateTimeField;
    tblKrzdD_YHJE: TFloatField;
    tblKrzdD_JZRQ: TDateTimeField;
    tblKrzdD_JZSJ: TDateTimeField;
    tblKrzdD_JZBZ: TStringField;
    tblKrzdD_JSBZ: TStringField;
    tblKrzdD_DLR1: TStringField;
    tblKrzdD_DLR2: TStringField;
    tblKrzdD_DLR3: TStringField;
    tblKrzdD_DLR4: TStringField;
    tblKrzdD_CZYXM: TStringField;
    tblKrzdD_JZYXM: TStringField;
    tblKrzdD_TYR: TStringField;
    tblKrzdD_BZ: TStringField;
    tblKrzdD_YSRQ: TStringField;
    tblKrzdD_JZBH: TStringField;
    tblKfztD_KFBH: TStringField;
    tblKfztD_ZDBH: TStringField;
    tblKfztD_KRBH: TStringField;
    tblKfztD_YJBH: TStringField;
    tblKfztD_SJFJ: TFloatField;
    tblKfztD_KFZT: TStringField;
    tblKfztD_KFBZ: TStringField;
    tblKfztD_KRSL: TIntegerField;
    tblKfztD_DHKT: TStringField;
    tblKfztD_BZFJ: TFloatField;
    tblKfztD_CWS: TIntegerField;
    tblKfztD_BJS: TIntegerField;
    tblKfztD_QJS: TIntegerField;
    tblKfztD_JJFJ: TFloatField;
    tblKfztD_FXBH: TStringField;
    tblKfztD_LCBH: TStringField;
    tblKfztD_KRXM: TStringField;
    tblBqj: TTable;
    procedure edtDcfhKeyPress(Sender: TObject; var Key: Char);
    procedure edtDcfhExit(Sender: TObject);
    procedure edtDrfhExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FDcfh: string;
    FDrfh: string;
    FDrfj: Currency;
    FKfxx: TKfxx;
    FKfzt: string;
    procedure UpdateKrzd;
    procedure UpdateKfzt;
    procedure UpdateBqj;
  public
    { Public declarations }
  end;

var
  SktfForm: TSktfForm;

procedure Sktf;
procedure SktfEnter(const AKfbh: string);

implementation

uses C_HotelData;

{$R *.dfm}

//散客调房
procedure Sktf;
begin
  SktfForm := TSktfForm.Create(Application);
  try
    with SktfForm do
    begin
      try
        tblKrzd.Open;
        tblKfzt.Open;
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
    end;
  finally
    SktfForm.tblKrzd.Close;
    SktfForm.tblKfzt.Close;
    SktfForm.Free;
  end;
end;

//散客调房
procedure SktfEnter(const AKfbh: string);
begin
  SktfForm := TSktfForm.Create(Application);
  try
    with SktfForm do
    begin
      try
        tblKrzd.Open;
        tblKfzt.Open;
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

      edtDcfh.Text := AKfbh;
      ShowModal;
    end;
  finally
    SktfForm.tblKrzd.Close;
    SktfForm.tblKfzt.Close;
    SktfForm.Free;
  end;
end;

procedure TSktfForm.edtDcfhKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not(Key in ['0'..'9']))and(Ord(Key)<>VK_BACK) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure TSktfForm.edtDcfhExit(Sender: TObject);
var
  AKfzt: string;
begin
  inherited;
  if edtDcfh.Text<>'' then
  begin
    AKfzt := HotelData.CheckKfzt(edtDcfh.Text);
    if (AKfzt<>KFZT_BF)and(AKfzt<>KFZT_TD) then
    begin
      ShowWarning('请选择其他房间！');
      edtDcfh.SetFocus;
    end
    else
    begin
      FDcfh := edtDcfh.Text;
      if tblKfzt.FindKey([FDcfh]) then
        edtDcfj.Text := CurrToStr(tblKfztD_SJFJ.Value);
    end;
  end;
end;

procedure TSktfForm.edtDrfhExit(Sender: TObject);
begin
  inherited;
  if edtDrfh.Text<>'' then
  begin
    if HotelData.CheckKfzt(edtDrfh.Text)<>KFZT_OK then
    begin
      ShowWarning('请选择其他房间！');
      edtDrfh.SetFocus;
    end
    else
      FDrfh := edtDrfh.Text;
  end;
end;

//更新客人帐单
procedure TSktfForm.UpdateKrzd;
begin
  tblKrzd.Filter   := 'D_ZDBH='''+FKfxx.AZdbh+''' and D_JZBZ=''1''';
  tblKrzd.Filtered := True;

  //找到总单
  if tblKrzd.FindKey([FKfxx.AZdbh,0]) then
  begin
    //如果是散客 修改房号和房价
    if tblKrzdD_ZDLB.Value = ZDLB_YK then
    begin
      tblKrzd.Edit;
      tblKrzdD_KFBH.Value := FDrfh;
      tblKrzdD_SJFJ.Value := FDrfj;
      tblKrzdD_BZ.Value := tblKrzdD_BZ.Value + '调入'+FDrfh;
      tblKrzd.Post;
    end;

    //如果是团队
    if tblKrzdD_ZDLB.Value = ZDLB_TD then
    begin
      tblKrzd.Filter   := 'D_ZDBH='''+FKfxx.AZdbh+''' and D_JZBZ=''1'' and D_XMBH=''00001''';
      tblKrzd.Filtered := True;

      //找到调出房号修改为调入房号和房价
      if tblKrzd.Locate('D_KFBH',FDcfh,[]) then
      begin
          tblKrzd.Edit;
          tblKrzdD_KFBH.Value := FDrfh;
          tblKrzdD_SJFJ.Value := FDrfj;
          tblKrzdD_BZ.Value := tblKrzdD_BZ.Value+'调入'+FDrfh;
          tblKrzd.Post;
      end;

    end;
  end;
  tblKrzd.Filter   := '';
  tblKrzd.Filtered := False;

end;

//更新客房状态
procedure TSktfForm.UpdateKfzt;
begin
  if tblKfzt.FindKey([FDrfh]) then
  begin
    tblKfzt.Edit;
    tblKfztD_ZDBH.Value := FKfxx.AZdbh;
    tblKfztD_KRBH.Value := FKfxx.AKrbh;
    tblKfztD_YJBH.Value := FKfxx.AYjbh;
    tblKfztD_KFBZ.Value := FKfxx.AKfbz;
    tblKfztD_KRSL.Value := 1;
    tblKfztD_KFZT.Value := FKfzt;
    tblKfztD_SJFJ.Value := FDrfj;
    tblKfztD_KRXM.Value := FKfxx.AKrxm;
    tblKfzt.Post;
  end;
end;

procedure TSktfForm.UpdateBqj;
begin
  with tblBqj do
  begin
    Open;
    if FindKey([FDcfh]) then
    begin
      Edit;
      FieldByName('D_SJFJ').AsCurrency := 0;
      Post;
    end;
    if FindKey([FDrfh]) then
    begin
      Edit;
      FieldByName('D_SJFJ').AsCurrency := FDrfj;
      Post;
    end
    else
    begin
      Insert;
      FieldByName('D_KFBH').AsString := FDrfh;
      FieldByName('D_SJFJ').AsCurrency := FDrfj;
      FieldByName('D_BJS').AsInteger := 0;
      FieldByName('D_QJS').AsInteger := 0;
      FieldByName('D_JJFJ').AsCurrency := 0;
      FieldByName('D_BJ').AsString := '';
      FieldByName('D_QJ').AsString := '';
      Post;
    end;
    Close;
  end;
end;

//确认
procedure TSktfForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if (edtDcfh.Text='')or(edtDrfh.Text='')or(edtDrfj.Text='') then
  begin
    ShowWarning('请录全数据！');
    Exit;
  end;

  try
    FDrfj := StrToCurr(edtDrfj.Text);
  except
    Exit;
    raise;
  end;

  if not Confirm('你确认调换房间吗？') then Exit;
  //统计调出房号的电话费，记入帐单

  //修改总单的客房号、实际房价
  FKfxx := HotelData.GetKfxx(FDcfh);
  FKfzt := HotelData.CheckKfzt(FDcfh);

  //事务启动
  HotelData.DatabaseUser.StartTransaction;
  try
    //初始化调出客房
    HotelData.InitKfztOK(FDcfh);
    UpdateKrzd;
    UpdateKfzt;
    UpdateBqj;
    //事务提交
    HotelData.DatabaseUser.Commit;
  except
    //事务回滚
    HotelData.DatabaseUser.Rollback;
    raise;
  end;
  Close;
end;

end.

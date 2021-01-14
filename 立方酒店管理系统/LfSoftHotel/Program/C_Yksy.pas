{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_Yksy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, DB, DBTables,
  Mask, DBCtrls, Grids, DBGrids, C_Define;

type
  TYksyForm = class(TStdJdForm)
    tblKrxx: TTable;
    edtKfh: TLabeledEdit;
    edtCzyxm: TLabeledEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Bevel2: TBevel;
    DBGrid1: TDBGrid;
    dsKrzd: TDataSource;
    dsKrxx: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    qryKrzd: TQuery;
    qryKrzdD_XFXM: TStringField;
    edtXfrq: TMaskEdit;
    edtXfsj: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblHj: TLabel;
    tblKrzd: TTable;
    qryKrzdD_ZDBH: TStringField;
    qryKrzdD_HH: TIntegerField;
    qryKrzdD_ZDLB: TStringField;
    qryKrzdD_KRBH: TStringField;
    qryKrzdD_YJBH: TStringField;
    qryKrzdD_KFBH: TStringField;
    qryKrzdD_SJFJ: TFloatField;
    qryKrzdD_XMBH: TStringField;
    qryKrzdD_XFDJ: TFloatField;
    qryKrzdD_XFSL: TFloatField;
    qryKrzdD_XFJE: TFloatField;
    qryKrzdD_XFRQ: TDateTimeField;
    qryKrzdD_XFSJ: TDateTimeField;
    qryKrzdD_YHJE: TFloatField;
    qryKrzdD_JZRQ: TDateTimeField;
    qryKrzdD_JZSJ: TDateTimeField;
    qryKrzdD_JZBZ: TStringField;
    qryKrzdD_JSBZ: TStringField;
    qryKrzdD_DLR1: TStringField;
    qryKrzdD_DLR2: TStringField;
    qryKrzdD_DLR3: TStringField;
    qryKrzdD_DLR4: TStringField;
    qryKrzdD_CZYXM: TStringField;
    qryKrzdD_JZYXM: TStringField;
    qryKrzdD_TYR: TStringField;
    qryKrzdD_BZ: TStringField;
    qryKrzdD_YSRQ: TStringField;
    qryKrzdD_JZBH: TStringField;
    qryKrzdD_BMBH: TStringField;
    procedure edtKfhExit(Sender: TObject);
    procedure qryKrzdAfterPost(DataSet: TDataSet);
    procedure qryKrzdBeforePost(DataSet: TDataSet);
    procedure edtXfrqExit(Sender: TObject);
    procedure edtXfsjExit(Sender: TObject);
    procedure btnCancClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure qryKrzdD_XFJEValidate(Sender: TField);
    procedure qryKrzdD_XMBHValidate(Sender: TField);
  private
    { Private declarations }
    FIsTd: Boolean;
    FKey: string;
    FItemNo: Integer;
    FZdbh: string;
    FKrbh: string;
    FYjbh: string;
    FZdlb: string;
    FXfrq: TDateTime;
    FXfsj: TDateTime;
    FTotals: Currency;
    FKfxx: TKfxx;
    FBmbh: string;
    procedure UpdateTotals;
    procedure UpdateZd;
  public
    { Public declarations }
  end;

var
  YksyForm: TYksyForm;

procedure Yksy;
procedure YksyTd(const AKrbh: string);
procedure YksyEnter(const AKfbh: string);

implementation

uses C_HotelData;

{$R *.dfm}

//寓客收银
procedure Yksy;
begin
  YksyForm := TYksyForm.Create(Application);
  try
    with YksyForm do
    begin
      FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);
      //初始化
      FIsTd := False;
      edtXfrq.Text := FormatDateTime('yyyy-mm-dd',Date);
      edtXfsj.Text := FormatDateTime('hh:mm',Time);
      FXfrq        := Date;
      FXfsj        := Time;
      edtCzyxm.Text:= CZY.CzyXm;

      ShowModal;
    end;
  finally
    YksyForm.Free;
  end;
end;

procedure YksyTd(const AKrbh: string);
begin
  YksyForm := TYksyForm.Create(Application);
  try
    with YksyForm do
    begin
      FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);
      //初始化
      FIsTd := True;
      edtKfh.Text  := AKrbh;
      edtKfh.EditLabel.Caption := '团队编号';
      edtKfh.ReadOnly := True;
      FKrbh := AKrbh;
      edtXfrq.Text := FormatDateTime('yyyy-mm-dd',Date);
      edtXfsj.Text := FormatDateTime('hh:mm',Time);
      FXfrq        := Date;
      FXfsj        := Time;
      edtCzyxm.Text:= CZY.CzyXm;

      ShowModal;
    end;
  finally
    YksyForm.Free;
  end;

end;

//寓客收银
procedure YksyEnter(const AKfbh: string);
begin
  YksyForm := TYksyForm.Create(Application);
  try
    with YksyForm do
    begin
      FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);
      //初始化
      FIsTd := False;
      edtKfh.Text  := AKfbh;
      edtXfrq.Text := FormatDateTime('yyyy-mm-dd',Date);
      edtXfsj.Text := FormatDateTime('hh:mm',Time);
      FXfrq        := Date;
      FXfsj        := Time;
      edtCzyxm.Text:= CZY.CzyXm;

      ShowModal;
    end;
  finally
    YksyForm.Free;
  end;
end;

//更新帐单总单
procedure TYksyForm.UpdateZd;
begin
  try
    try
      tblKrzd.Open;
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

    if tblKrzd.FindKey([FZdbh,0]) then
    begin
      tblKrzd.Edit;
      tblKrzd.FieldByName('D_XFJE').AsCurrency :=
        tblKrzd.FieldByName('D_XFJE').AsCurrency + FTotals;
      tblKrzd.Post;
    end;
  finally
    tblKrzd.Close;
  end;
end;

//累计消费
procedure TYksyForm.UpdateTotals;
var
  PrevRecord: TBookMark;
begin
  PrevRecord := qryKrzd.GetBookmark;
  try
    qryKrzd.DisableControls;
    FTotals := 0;
    qryKrzd.First;
    while not qryKrzd.Eof do
    begin
      FTotals := FTotals + qryKrzdD_XFJE.Value;
      qryKrzd.Next;
    end;
    lblHj.Caption := CurrToStr(FTotals)+'元';
  finally
    qryKrzd.EnableControls;
    if PrevRecord<>nil then
    begin
      qryKrzd.GotoBookmark(PrevRecord);
      qryKrzd.FreeBookmark(PrevRecord);
    end;
  end;
end;

//选择客房编号
procedure TYksyForm.edtKfhExit(Sender: TObject);
var
  AKfzt,AKfbh: string;
  ATdxx : TTdxx;
begin
  inherited;
  if not FIsTd then
  begin
  AKfbh := edtKfh.Text;
  AKfzt := HotelData.CheckKfzt(AKfbh);

  if (AKfzt=KFZT_BF)or(AKfzt=KFZT_TD) then
  begin
    FKfxx := HotelData.GetKfxx(AKfbh);
    FZdbh := FKfxx.AZdbh;
    FKrbh := FKfxx.AKrbh;
    FYjbh := FKfxx.AYjbh;

    if AKfzt=KFZT_BF then FZdlb := ZDLB_YK;
    if AKfzt=KFZT_TD then FZdlb := ZDLB_TD;
  end
  else
  begin
    ShowInfo('该客房不能收银！');
    edtKfh.SetFocus;
    Exit;
  end;
  end
  else
  begin
    ATdxx := HotelData.GetTdxx(FKrbh);
    FZdbh := ATdxx.AZdbh;
    FKrbh := ATdxx.AKrbh;
    FYjbh := ATdxx.AYjbh;
    FZdlb := ZDLB_TD;
  end;

  try
    tblKrxx.Open;
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

  //显示客人信息
  tblKrxx.Locate('D_KRBH',FKrbh,[]);

  //获取帐单最大行号
  FItemNo := HotelData.GetMaxZdhh(FZdbh);
  with qryKrzd do
  begin
    if Active then Active := False;
    Params[0].Value := FZdbh;
    Params[1].Value := FItemNo;
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
end;

procedure TYksyForm.qryKrzdAfterPost(DataSet: TDataSet);
begin
  inherited;
  Inc(FItemNo);
  UpdateTotals;
end;

procedure TYksyForm.qryKrzdBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryKrzdD_ZDBH.Value := FZdbh;
  qryKrzdD_KRBH.Value := FKrbh;
  qryKrzdD_YJBH.Value := FYjbh;
  qryKrzdD_ZDLB.Value := FZdlb;
  qryKrzdD_HH.Value   := FItemNo;
  qryKrzdD_XFRQ.Value := FXfrq;
  qryKrzdD_KFBH.Value := FKfxx.AKfbh;
  qryKrzdD_XFSJ.Value := FXfsj;
  qryKrzdD_JZBZ.Value := JZ_NO;
  qryKrzdD_JSBZ.Value := JS_NO;
  qryKrzdD_CZYXM.Value:= CZY.CzyXm;
  qryKrzdD_BMBH.Value := FBmbh;
  if FZdlb = ZDLB_YK then
    qryKrzdD_BZ.Value   := '杂单录入'
  else
  if FZdlb = ZDLB_TD then
    qryKrzdD_BZ.Value   := '杂单录入';
end;

procedure TYksyForm.edtXfrqExit(Sender: TObject);
begin
  inherited;
  FXfrq := StrToDate(edtXfrq.Text);
end;

procedure TYksyForm.edtXfsjExit(Sender: TObject);
begin
  inherited;
  FXfsj := StrToTime(edtXfsj.Text);
  DBGrid1.SetFocus;
end;

procedure TYksyForm.btnCancClick(Sender: TObject);
begin
  inherited;
  qryKrzd.CancelUpdates;
end;

//确认
procedure TYksyForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if edtKfh.Text='' then
  begin
    ShowWarning('请输入客房号！');
    Exit;
  end;

  if qryKrzd.IsEmpty then
  begin
    ShowWarning('请录入消费项目！');
    Exit;
  end;

  if not Confirm('你确认该客人的消费吗？') then
    Exit;

  if qryKrzd.State in [dsInsert,dsEdit] then
  begin
    if qryKrzd.FieldByName('D_XMBH').AsString = '' then
      qryKrzd.Cancel
    else
      qryKrzd.Post;
  end;

  //事务启动
  HotelData.DatabaseUser.StartTransaction;
  try
    qryKrzd.ApplyUpdates;
    UpdateZd;

    //事务提交
    HotelData.DatabaseUser.Commit;
  except
    //事务回滚
    HotelData.DatabaseUser.Rollback;
    raise;
  end;
  qryKrzd.CommitUpdates;
  //初始化
  FIsTd := False;
  tblKrxx.Close;
  edtXfrq.Text := FormatDateTime('yyyy-mm-dd',Date);
  edtXfsj.Text := FormatDateTime('hh:mm',Time);
  FXfrq        := Date;
  FXfsj        := Time;
  edtCzyxm.Text:= CZY.CzyXm;
  edtKfh.Text := '';
  lblHj.Caption := '0元';
  edtKfh.SetFocus;

  //Close;
end;

procedure TYksyForm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if DBGrid1.SelectedIndex=0 then
  begin
    if Ord(Key)=VK_BACK then FKey := ''
    else
    begin
      FKey := FKey + Key;
      if HotelData.tblXMDM.Locate('D_DM',FKey,[loPartialKey]) then
      begin
        qryKrzd.Edit;
        qryKrzdD_XMBH.Value := HotelData.tblXMDM.FieldByName('D_XMBH').AsString;
      end;
    end;
  end;
end;

procedure TYksyForm.DBGrid1ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedIndex=0 then FKey := '';
end;

procedure TYksyForm.qryKrzdD_XFJEValidate(Sender: TField);
begin
  inherited;
  if (qryKrzdD_XFJE.Value<=0)and(CZY.CzyXm <> '巢经理') then
    raise Exception.Create('消费金额必须大于零！');
end;

procedure TYksyForm.qryKrzdD_XMBHValidate(Sender: TField);
begin
  inherited;
  if qryKrzdD_XMBH.Value = XMBH_YJK then
    raise Exception.Create('预交款不能收银！');
  if qryKrzdD_XMBH.Value = XMBH_CF then
    raise Exception.Create('请在餐饮管理系统->非餐费结帐中录入');
end;

end.

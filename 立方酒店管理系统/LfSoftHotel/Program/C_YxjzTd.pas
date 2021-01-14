{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_YxjzTd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, Mask, C_Define,
  DB, DBTables;

type
  TYxjzTdForm = class(TStdJdForm)
    Label2: TLabel;
    Label3: TLabel;
    edtJzrq: TMaskEdit;
    edtJzsj: TMaskEdit;
    edtJzje: TLabeledEdit;
    radJzfs: TRadioGroup;
    Label4: TLabel;
    cmbJz: TComboBox;
    tblKrzd: TTable;
    tblKrjz: TTable;
    edtTdmc: TLabeledEdit;
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
    tblKrjzD_JZBH: TStringField;
    tblKrjzD_HH: TIntegerField;
    tblKrjzD_XMBH: TStringField;
    tblKrjzD_XFDJ: TFloatField;
    tblKrjzD_XFSL: TFloatField;
    tblKrjzD_XFGG: TStringField;
    tblKrjzD_XFJE: TFloatField;
    tblKrjzD_YJJE: TFloatField;
    tblKrjzD_YHJE: TFloatField;
    tblKrjzD_JZFS: TStringField;
    tblKrjzD_JZLX: TStringField;
    tblKrjzD_KHBH: TStringField;
    tblKrjzD_XYKBH: TStringField;
    tblKrjzD_JZRQ: TDateTimeField;
    tblKrjzD_JZSJ: TDateTimeField;
    tblKrjzD_CZYXM: TStringField;
    tblKrjzD_BZ: TStringField;
    tblKrjzD_YSRQ: TStringField;
    tblKrzdD_BMBH: TStringField;
    tblKrjzD_BMBH: TStringField;
    Label1: TLabel;
    cmbXfxm: TComboBox;
    procedure radJzfsClick(Sender: TObject);
    procedure edtJzrqExit(Sender: TObject);
    procedure edtJzsjExit(Sender: TObject);
    procedure edtJzjeKeyPress(Sender: TObject; var Key: Char);
    procedure edtJzjeExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cmbXfxmExit(Sender: TObject);
  private
    { Private declarations }
    FBmbh: string;
    FJzje: Currency;
    FJzrq: TDateTime;
    FJzsj: TDateTime;
    FJzfs: string;
    FXykbh: string;
    FTdxx: TTdxx;
    FKrbh: string;
    FXmbh: string;
    function IsValid: Boolean;
    procedure ShowTdxx;
    procedure UpdateKrzd;
    procedure UpdateKrjz;
  public
    { Public declarations }
  end;

var
  YxjzTdForm: TYxjzTdForm;

procedure YxjzTd(const AKrbh: string);

implementation

uses C_HotelData;

{$R *.dfm}

//团队预先结帐
procedure YxjzTd(const AKrbh: string);
begin
  YxjzTdForm := TYxjzTdForm.Create(Application);
  try
    with YxjzTdForm do
    begin
      FKrbh := AKrbh;
      //获取部门编号
      FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);

      //初始化
      edtJzrq.Text := FormatDateTime('yyyy-mm-dd',Date);
      edtJzsj.Text := FormatDateTime('hh:mm',Time);
      HotelData.ListDm(cmbXfxm,'XMDM','D_XMMC');
      cmbXfxm.ItemIndex := 0;
      FXmbh := XMBH_FJ;

      FJzrq        := Date;
      FJzsj        := Time;
      FJzfs        := JZFS_RMB;
      //显示团队信息
      ShowTdxx;
      ShowModal;
    end;
  finally
    YxjzTdForm.Free;
  end;
end;

//显示团队名称
procedure TYxjzTdForm.ShowTdxx;
begin
  FTdxx := HotelData.GetTdxx(FKrbh);
  edtTdmc.Text := FTdxx.AKrxm;
end;

//选择结帐方式
procedure TYxjzTdForm.radJzfsClick(Sender: TObject);
begin
  inherited;
  cmbJz.Items.Clear;
  cmbJz.Style := csDropDownList;
  case radJzfs.ItemIndex of
    0: FJzfs := JZFS_RMB;
    1:
      begin
        HotelData.ListMc(cmbJz,'XYK','D_XYKMC');
        FJzfs := JZFS_XYK;
      end;
    2: FJzfs := JZFS_ZP;
  end;
end;

//判断有效性
function TYxjzTdForm.IsValid: Boolean;
begin
  Result := False;
  case radJzfs.ItemIndex of
    1:
      begin
        FXykbh := HotelData.FindBh('XYK','D_XYKBH','D_XYKMC',cmbJz.Text);
        if FXykbh<>'' then
          Result := True
        else
          ShowInfo('请选择信用卡！');
      end;
    else
      Result := True;
  end;
end;

procedure TYxjzTdForm.edtJzrqExit(Sender: TObject);
begin
  inherited;
  FJzrq := StrToDate(edtJzrq.Text);
end;

procedure TYxjzTdForm.edtJzsjExit(Sender: TObject);
begin
  inherited;
  FJzsj := StrToTime(edtJzsj.Text);
end;

procedure TYxjzTdForm.edtJzjeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not(Key in ['0'..'9','.']))and(Ord(Key)<>VK_BACK) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure TYxjzTdForm.edtJzjeExit(Sender: TObject);
begin
  inherited;
  if edtJzje.Text<>'' then
    FJzje := StrToCurr(edtJzje.Text);
end;

//更新客人帐单
procedure TYxjzTdForm.UpdateKrzd;
begin
  tblKrzd.Insert;
  tblKrzdD_ZDBH.Value := FTdxx.AZdbh;
  tblKrzdD_HH.Value   := FTdxx.AZdhh;
  tblKrzdD_KRBH.Value := FTdxx.AKrbh;
  tblKrzdD_YJBH.Value := FTdxx.AYjbh;
  tblKrzdD_ZDLB.Value := ZDLB_TD;
  //tblKrzdD_XMBH.Value := XMBH_YJK;
  tblKrzdD_XMBH.Value := FXmbh;
  tblKrzdD_XFJE.Value := 0-FJzje;
  tblKrzdD_XFRQ.Value := FJzrq;
  tblKrzdD_XFSJ.Value := FJzsj;
  tblKrzdD_JZBZ.Value := JZ_YX;
  tblKrzdD_JSBZ.Value := JS_NO;
  tblKrzdD_BMBH.Value := FBmbh;
  tblKrzdD_BZ.Value   := ZDBZ_YX+edtTdmc.Text;
  tblKrzdD_CZYXM.Value:= CZY.CzyXm;
  tblKrzdD_JZYXM.Value := CZY.CzyXm;
  tblKrzd.Post;
end;

//更新客人结帐库
procedure TYxjzTdForm.UpdateKrjz;
var
  AJzbh: string;
begin
  //获取结帐编号
  AJzbh := HotelData.GetBh('D_JZBH',PREV_JZBH);

  //插入总单
  tblKrjz.Insert;
  tblKrjzD_JZBH.Value := AJzbh;
  tblKrjzD_HH.Value   := 0;
  tblKrjzD_JZRQ.Value := FJzrq;
  tblKrjzD_JZSJ.Value := FJzsj;
  tblKrjzD_JZFS.Value := FJzfs;
  tblKrjzD_XYKBH.Value:= FXykbh;
  //tblKrjzD_JZLX.Value := JZLX_YJK;
  tblKrjzD_JZLX.Value := JZLX_YK;
  tblKrjzD_XFJE.Value := FJzje;
  tblKrjzD_CZYXM.Value:= CZY.CzyXm;
  tblKrjzD_BMBH.Value := FBmbh;
  tblKrjzD_BZ.Value   := JZBZ_YX+edtTdmc.Text;
  tblKrjz.Post;

  //子单
  tblKrjz.Insert;
  tblKrjzD_JZBH.Value := AJzbh;
  tblKrjzD_HH.Value   := 1;
  tblKrjzD_JZRQ.Value := FJzrq;
  tblKrjzD_JZSJ.Value := FJzsj;
  tblKrjzD_JZFS.Value := FJzfs;
  tblKrjzD_XYKBH.Value:= FXykbh;
  //tblKrjzD_JZLX.Value := JZLX_YJK;
  tblKrjzD_JZLX.Value := JZLX_YK;
  //tblKrjzD_XMBH.Value := XMBH_YJK;
  tblKrjzD_XMBH.Value := FXmbh;
  tblKrjzD_XFJE.Value := FJzje;
  tblKrjzD_CZYXM.Value:= CZY.CzyXm;
  tblKrjzD_BMBH.Value := FBmbh;
  tblKrjzD_BZ.Value   := JZBZ_YX+edtTdmc.Text;
  tblKrjz.Post;
end;

//确认结帐
procedure TYxjzTdForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if edtJzje.Text='' then
  begin
    ShowWarning('请输入结帐金额！');
    Exit;
  end;

  if not IsValid then Exit;

  if not Confirm('你确认该客人的消费结帐吗？') then
    Exit;
  FJzje := StrToCurr(edtJzje.Text);
  try
    try
      tblKrzd.Open;
      tblKrjz.Open;
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

    //事务启动
    HotelData.DatabaseUser.StartTransaction;
    try
      UpdateKrzd;
      UpdateKrjz;
      tblKrzd.ApplyUpdates;
      tblKrjz.ApplyUpdates;

      {if FJzfs = JZFS_RMB then
        HotelData.InsertYjk(YJLX_YX,YJBZ_YX+' '+edtTdmc.Text,FJzje,0,0);
      if FJzfs = JZFS_XYK then
        HotelData.InsertYjk(YJLX_YX,YJBZ_YX+' '+edtTdmc.Text,0,FJzje,0);
      if FJzfs = JZFS_ZP then
        HotelData.InsertYjk(YJLX_YX,YJBZ_YX+' '+edtTdmc.Text,0,0,FJzje);
      }
      //事务提交
      HotelData.DatabaseUser.Commit;
    except
      //事务回滚
      HotelData.DatabaseUser.Rollback;
      raise;
    end;
    tblKrzd.CommitUpdates;
    tblKrjz.CommitUpdates;
  finally
    tblKrzd.Close;
    tblKrjz.Close;
  end;
  Close;
  //cmbXfxm.SetFocus;
  //edtJzje.Text := '';
end;

procedure TYxjzTdForm.cmbXfxmExit(Sender: TObject);
begin
  inherited;
  FXmbh := HotelData.FindUserBh('XMDM','D_XMBH','D_XMMC',GetMc(cmbXfxm.Items[cmbXfxm.ItemIndex]));
  if FXmbh='' then
    cmbXfxm.SetFocus;
end;

end.

{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_Tdtf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, Mask, ComCtrls,
  DB, DBTables, C_Define;

type
  TTdtfForm = class(TStdJdForm)
    Label2: TLabel;
    edtJzrq: TMaskEdit;
    Label3: TLabel;
    edtJzsj: TMaskEdit;
    ListView1: TListView;
    qryKfzt: TQuery;
    btnSelAll: TBitBtn;
    btnSelCanc: TBitBtn;
    qryKrzd: TQuery;
    edtTdmc: TLabeledEdit;
    Bevel2: TBevel;
    qryKrzdKf: TQuery;
    tblBqj: TTable;
    procedure btnSelAllClick(Sender: TObject);
    procedure btnSelCancClick(Sender: TObject);
    procedure edtJzrqExit(Sender: TObject);
    procedure edtJzsjExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure qryKrzdNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FQxbz: Integer;
    FHh  : Integer;
    FKrbh: string;
    FZdbh: string;
    FJzrq: TDateTime;
    FJzsj: TDateTime;
    FDtfj: Currency;
    FDhf : Currency;
    FKfxx: TKfxx;
    procedure AddKfbh;
    procedure AddDhf;
    //procedure AddDtfj(const AKfbh: string;ADtfj: Currency);
    procedure UpdateKrzdTf;
    procedure UpdateKrzdQx;
  public
    { Public declarations }
  end;

var
  TdtfForm: TTdtfForm;

procedure Tdtf(const AKrbh: string);
procedure Tdqx(const AKrbh: string);

implementation

uses C_HotelData, C_Wait;

{$R *.dfm}

//团队退房
procedure Tdtf(const AKrbh: string);
begin
  TdtfForm := TTdtfForm.Create(Application);
  try
    with TdtfForm do
    begin
      //退房
      FQxbz := 0;

      FKrbh := AKrbh;
      FZdbh := HotelData.GetZdbh(AKrbh);

      //初始化
      edtJzrq.Text := FormatDateTime('yyyy-mm-dd',Date);
      edtJzsj.Text := FormatDateTime('hh:mm',Time);
      FJzrq := Date;
      FJzsj := Time;
      edtTdmc.Text := HotelData.FindUserBh('KRXX','D_KRXM','D_KRBH',FKrbh);

      //添加客房编号
      AddKfbh;

      {if qryKrzd.Active then qryKrzd.Active := False;
      qryKrzd.Params[0].Value := FZdbh;
      try
        qryKrzd.Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;}

      ShowModal;
    end;
  finally
    TdtfForm.Free;
  end;
end;

//团队取消房间
procedure Tdqx(const AKrbh: string);
begin
  TdtfForm := TTdtfForm.Create(Application);
  try
    with TdtfForm do
    begin
      //取消
      FQxbz := 1;
      lblTitile.Caption := '团队取消';

      FKrbh := AKrbh;
      FZdbh := HotelData.GetZdbh(AKrbh);

      //初始化
      edtJzrq.Text := FormatDateTime('yyyy-mm-dd',Date);
      edtJzsj.Text := FormatDateTime('hh:mm',Time);
      FJzrq := Date;
      FJzsj := Time;
      edtTdmc.Text := HotelData.FindUserBh('KRXX','D_KRXM','D_KRBH',FKrbh);
      
      //添加客人房号
      AddKfbh;

      {if qryKrzd.Active then qryKrzd.Active := False;
      qryKrzd.Params[0].Value := FZdbh;
      try
        qryKrzd.Open;
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
      }
      ShowModal;
    end;
  finally
    TdtfForm.qryKrzd.Close;
    TdtfForm.Free;
  end;
end;

//添加客人房号
procedure TTdtfForm.AddKfbh;
var
  ListItem: TListItem;
  s       : string;
begin
  if FQxbz = 0 then
    s := 'select * from KFZT where D_KRBH=:KRBH'
  else
    s := 'select * from KFZT where (D_KRBH=:KRBH)and(D_KFBZ="'+KFBZ_DT+'")';

  if qryKfzt.Active then qryKfzt.Active := False;
  qryKfzt.SQL.Clear;
  qryKfzt.SQL.Add(s);
  qryKfzt.Params[0].Value := FKrbh;
  try
    qryKfzt.Open;
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

  qryKfzt.First;
  while not qryKfzt.Eof do
  begin
    ListItem := ListView1.Items.Add;
    ListItem.Caption := qryKfzt.FieldByName('D_KFBH').AsString;
    qryKfzt.Next;
  end;

  qryKfzt.Close;
end;

//全选
procedure TTdtfForm.btnSelAllClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I:=0 to ListView1.Items.Count - 1 do
    ListView1.Items[I].Checked := True;
end;

//全不选
procedure TTdtfForm.btnSelCancClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I:=0 to ListView1.Items.Count - 1 do
    ListView1.Items[I].Checked := False;
end;

procedure TTdtfForm.edtJzrqExit(Sender: TObject);
begin
  inherited;
  FJzrq := StrToDate(edtJzrq.Text);
end;

procedure TTdtfForm.edtJzsjExit(Sender: TObject);
begin
  inherited;
  FJzsj := StrToTime(edtJzsj.Text);
end;

//添加电话费记录
procedure TTdtfForm.AddDhf;
begin
  qryKrzd.Insert;
  qryKrzd.FieldByName('D_ZDBH').AsString   := FKfxx.AZdbh;
  qryKrzd.FieldByName('D_HH').AsInteger    := FHh;
  qryKrzd.FieldByName('D_KRBH').AsString   := FKfxx.AKrbh;
  qryKrzd.FieldByName('D_YJBH').AsString   := FKfxx.AYjbh;
  qryKrzd.FieldByName('D_ZDLB').AsString   := ZDLB_TD;
  qryKrzd.FieldByName('D_XMBH').AsString   := XMBH_DHF;
  qryKrzd.FieldByName('D_XFJE').AsCurrency := FDhf;
  qryKrzd.FieldByName('D_JZBZ').AsString   := JZ_NO;
  qryKrzd.FieldByName('D_JSBZ').AsString   := JS_NO;
  qryKrzd.FieldByName('D_XFRQ').AsDateTime := FJzrq;
  qryKrzd.FieldByName('D_XFSJ').AsDateTime := FJzsj;
  qryKrzd.Post;
end;
{
//添加当天房价
procedure TTdtfForm.AddDtfj(const AKfbh: string;ADtfj: Currency);
begin
  if qryKrzd.Locate('D_KFBH',AKfbh,[]) then
  begin
    qryKrzd.Edit;
    qryKrzd.FieldByName('D_XFJE').AsCurrency := qryKrzd.FieldByName('D_XFJE').AsCurrency+ADtfj;
    qryKrzd.Post;
  end;
  {qryKrzd.Insert;
  qryKrzd.FieldByName('D_ZDBH').AsString   := FKfxx.AZdbh;
  qryKrzd.FieldByName('D_HH').AsInteger    := FHh;
  qryKrzd.FieldByName('D_KFBH').AsString   := AKfbh;
  qryKrzd.FieldByName('D_KRBH').AsString   := FKfxx.AKrbh;
  qryKrzd.FieldByName('D_YJBH').AsString   := FKfxx.AYjbh;
  qryKrzd.FieldByName('D_ZDLB').AsString   := ZDLB_TD;
  qryKrzd.FieldByName('D_XMBH').AsString   := XMBH_FJ;
  qryKrzd.FieldByName('D_XFJE').AsCurrency := ADtfj;
  qryKrzd.FieldByName('D_JZBZ').AsString   := JZ_YES;
  qryKrzd.FieldByName('D_JSBZ').AsString   := JS_NO;
  qryKrzd.FieldByName('D_XFRQ').AsDateTime := FJzrq;
  qryKrzd.FieldByName('D_XFSJ').AsDateTime := FJzsj;
  qryKrzd.FieldByName('D_JZRQ').AsDateTime := FJzrq;
  qryKrzd.FieldByName('D_JZSJ').AsDateTime := FJzsj;
  qryKrzd.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
  qryKrzd.FieldByName('D_JZYXM').AsString  := CZY.CzyXm;
  qryKrzd.FieldByName('D_BZ').AsString     := ZDBZ_TD+AKfbh+FKfxx.AKrxm;
  qryKrzd.Post;
end;
}
procedure TTdtfForm.UpdateKrzdTf;
var
  I     : Integer;
  AKfbh : string;
  ABqj  : Integer;
  ADtfj : Currency;
  ADhf  : Currency;
  ADdrq : TDateTime;
  ADdsj : TDateTime;
begin
  FDtfj := 0;
  FDhf  := 0;
  //FHh   := HotelData.GetMaxZdhh(FZdbh)-1;
  with qryKrzdKf do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from KRZD where (D_ZDBH="'+FZdbh+'")and(D_XMBH="'+XMBH_FJ+'")and(D_JZBZ="1")');
    Open;
  end;

  for I:=0 to ListView1.Items.Count - 1 do
    if ListView1.Items[i].Checked then
    begin
      AKfbh := ListView1.Items[i].Caption;
      if qryKrzdKf.Locate('D_KFBH',AKfbh,[]) then
      begin
        //获取客房信息
        FKfxx := HotelData.GetKfxx(AKfbh);
        ADdrq := qryKrzdKf.FieldByName('D_XFRQ').AsDateTime;
        //到店时间
        ADdsj := qryKrzdKf.FieldByName('D_XFSJ').AsDateTime;

        //获取当天房价、半全价
        ADtfj := GetDtfj(ADdsj,FJzsj,FKfxx.AKfbz,FKfxx.ASjfj);
        ABqj  := CheckLdsj(ADdsj,FJzsj,FKfxx.AKfbz);

        //如果有半全价
        if ABqj<>BQJ_ZC then
          HotelData.UpdateBqj(AKfbh,ABqj,0,ADtfj)
        else
          HotelData.UpdateBqj(AKfbh,ABqj,0,0);

        //获取电话费
        //edit by ls.20021102
        //ADhf  := HotelData.GetDhf(FKfxx.AKfbh,FKfxx.ADdrq,FKfxx.ADdsj);
        ADhf  := HotelData.GetDhf(AKfbh,ADdrq,ADdsj);
        //累加
        FDtfj := FDtfj + ADtfj;
        FDhf  := FDhf + ADhf;

        qryKrzdKf.Edit;
        if ADtfj<>0 then
        begin
          qryKrzdKf.FieldByName('D_XFJE').AsCurrency := qryKrzdKf.FieldByName('D_XFJE').AsCurrency+ADtfj;
        end;
        qryKrzdKf.FieldByName('D_JZBZ').AsString   := JZ_YES;
        qryKrzdKf.FieldByName('D_JZRQ').AsDateTime := FJzrq;
        qryKrzdKf.FieldByName('D_JZSJ').AsDateTime := FJzsj;
        qryKrzdKf.Post;

        //添加当天房价
        if ADtfj<>0 then
        begin
          //AddDtfj(AKfbh,ADtfj);
          HotelData.UpdateJjfj(AKfbh,ABqj,ADtfj);
        end;
        //初始化客房
        HotelData.InitKfzt(AKfbh);
      end;
    end;

  with qryKrzd do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from KRZD where D_ZDBH="'+FZdbh+'"');
    Prepare;
    Open;
  end;
  //如果电话费不等于零
  if FDhf<>0 then
  begin
    FHh := HotelData.GetMaxZdhh(FZdbh);
    AddDhf;
  end;

  //修改总单
  if (FDtfj+FDhf)<>0 then
    if qryKrzd.Locate('D_HH',0,[]) then
    begin
      qryKrzd.Edit;
      qryKrzd.FieldByName('D_XFJE').AsCurrency :=
        qryKrzd.FieldByName('D_XFJE').AsCurrency + FDtfj + FDhf;
      qryKrzd.Post;
    end;

end;

//取消房间
procedure TTdtfForm.UpdateKrzdQx;
var
  I     : Integer;
  AKfbh : string;
begin
  with qryKrzdKf do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from KRZD where (D_ZDBH="'+FZdbh+'")and(D_XMBH="'+XMBH_FJ+'")and(D_JZBZ="1")');
    Open;
  end;
  tblBqj.Open;
  for I:=0 to ListView1.Items.Count - 1 do
  begin
    if ListView1.Items[i].Checked then
    begin
      AKfbh := ListView1.Items[i].Caption;
      if qryKrzdKf.Locate('D_KFBH',AKfbh,[]) then
        qryKrzdKf.Delete;
      if tblBqj.FindKey([AKfbh]) then
      begin
        tblBqj.Edit;
        tblBqj.FieldByName('D_SJFJ').AsCurrency := 0;
        tblBqj.Post;
      end;
      //请空
      HotelData.ClearKfzt(AKfbh);
    end;
  end;
  tblBqj.Close;
end;

//确认退房
procedure TTdtfForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if not Confirm('你确认该操作吗？') then Exit;
  WaitForm := TWaitForm.Create(Application);
  try
    WaitForm.FTitle := '团队退房';
    WaitForm.Show;
    WaitForm.Update;

  //事务启动
  HotelData.DatabaseUser.StartTransaction;
  try
    //如果是退房
    if FQxbz=0 then
      UpdateKrzdTf
    else
      UpdateKrzdQx;

    //事务提交
    HotelData.DatabaseUser.Commit;
  except
    //事务回滚
    HotelData.DatabaseUser.Rollback;
    raise;
  end;
  //qryKrzd.CommitUpdates;

  finally
    WaitForm.Hide;
    WaitForm.Free;
  end;

  Close;
end;

procedure TTdtfForm.qryKrzdNewRecord(DataSet: TDataSet);
begin
  inherited;
  Inc(FHh);
end;

end.

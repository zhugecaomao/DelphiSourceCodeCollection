{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_Tdzd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, C_Define,
  DB, DBTables;

type
  TTdzdForm = class(TStdJdForm)
    Label1: TLabel;
    lblXfje: TLabel;
    Label3: TLabel;
    lblJsje: TLabel;
    Label5: TLabel;
    lblYjje: TLabel;
    Label7: TLabel;
    lblTfje: TLabel;
    Label9: TLabel;
    lblYfje: TLabel;
    Label11: TLabel;
    lblYhje: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    lblJzfs: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    lblJzrq: TLabel;
    lblJzsj: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    edtSjje: TEdit;
    dbgZd: TDBGrid;
    tblYsk: TTable;
    tblKryj: TTable;
    qryZd: TQuery;
    tblKrjz: TTable;
    tblKrjzD_XFXM: TStringField;
    dsKrjz: TDataSource;
    qryKrzd: TQuery;
    btnPrint: TBitBtn;
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
    tblKrjzD_BMBH: TStringField;
    qryKrzdD_BMBH: TStringField;
    Label12: TLabel;
    lblKrxm: TLabel;
    btnFjmx: TBitBtn;
    btnZdmx: TBitBtn;
    procedure tblKrjzNewRecord(DataSet: TDataSet);
    procedure tblKrjzBeforeInsert(DataSet: TDataSet);
    procedure tblKrjzAfterPost(DataSet: TDataSet);
    procedure tblKrjzBeforeDelete(DataSet: TDataSet);
    procedure tblKrjzD_YHJEValidate(Sender: TField);
    procedure btnCancClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtSjjeExit(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnFjmxClick(Sender: TObject);
    procedure btnZdmxClick(Sender: TObject);
  private
    { Private declarations }
    FBmbh: string;
    FJzxx: TTdJzxx;
    FYfje: Currency;
    FYjje: Currency;
    FXfje: Currency;
    FJsje: Currency;
    FSjje: Currency;
    FYhje: Currency;
    FTfje: Currency;
    FEwf : Currency;
    FJzbh: string;
    FHh  : Integer;
    IsAppend: Boolean;
    procedure ShowJzfs;
    procedure ShowJzxx;
    function SumYfje: Currency;
    function SumYjje: Currency;
    function SumXfje: Currency;
    function SumEwf : Currency;
    procedure AddEwf;
    procedure CanYh;
    procedure AddKrjz;
    procedure SumYhje;
    procedure UpdateEwf;
    procedure UpdateKrzd(const ABz: string);
    procedure AddKrzd(const AXmbh: string;AXfje: Currency);
    procedure UpdateKrjz;
    procedure UpdateKrxx;
    procedure BakKrxx;
    procedure EmptyKrxx;
    procedure EmptyKryj;
    procedure BakKrzd;
    //procedure EmptyKrzd;
    procedure UpdateYsk;
    procedure AddYjk(AGbkJzxx: TGbkJzxx);
    procedure AddYsk(const AKhbh,AZdbh,AXmbh: string;AHh: Integer;AXfje: Currency);
  public
    { Public declarations }
  end;

var
  TdzdForm: TTdzdForm;

procedure Tdzd(AJzxx: TTdJzxx);

implementation

uses C_HotelData, C_Sysprint, C_CardXf, C_Fjmx, C_Zdmx;

{$R *.dfm}

//团队结帐
procedure Tdzd(AJzxx: TTdJzxx);
begin
  TdzdForm := TTdzdForm.Create(Application);
  try
    with TdzdForm do
    begin
      //获取部门编号
      FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);

      //获取结帐信息
      FJzxx := AJzxx;

      //是否能优惠
      CanYh;

      //获取客房信息
      //GetKfxx;

      //显示结帐方式
      ShowJzfs;

      //计算押金金额
      FYfje := SumYfje;

      //计算已结金额
      FYjje := SumYjje;

      //计算消费金额
      FXfje := SumXfje;

      //显示结帐信息
      ShowJzxx;

      //显示帐单列表
      AddKrjz;

      ShowModal;
    end;
  finally
    TdzdForm.Free;
  end;
end;

//判断是否允许优惠
procedure TTdzdForm.CanYh;
begin
  dbgZd.Columns[2].ReadOnly :=
    not((FJzxx.AJzfs=JZFS_RMB)or(FJzxx.AJzfs=JZFS_ZP)or(FJzxx.AJzfs=JZFS_XYK));
end;

//获取预付金额
function TTdzdForm.SumYfje: Currency;
var
  SqlStr: string;
begin
  SqlStr :=
    'select sum(D_YFJE) from KRYJ where (D_FKFS="'+FKFS_RMB
    +'")and(D_YJBH="'+FJzxx.AYjbh+'")';
  Result := HotelData.SumJe(SqlStr);
end;

//获取已结金额
function TTdzdForm.SumYjje: Currency;
var
  SqlStr: string;
begin
  SqlStr := 'select sum(D_XFJE) from KRZD where ((D_JZBZ="'+JZ_YX+'")'
            +'or(D_XMBH="'+XMBH_YJK+'"))and(D_ZDBH="'+FJzxx.AZdbh+'")';
  Result := 0-HotelData.SumJe(SqlStr);
end;

//获取消费金额
function TTdzdForm.SumXfje: Currency;
var
  SqlStr: string;
begin
  SqlStr := 'select sum(D_XFJE) from KRZD where (D_HH<>0)'
            +'and(D_ZDBH="'+FJzxx.AZdbh+'")and(D_XMBH<>"'+XMBH_YJK+'")and(D_JZBZ<>"'+JZ_YX+'")';
  Result := HotelData.SumJe(SqlStr);
end;

//显示结帐方式
procedure TTdzdForm.ShowJzfs;
begin
  lblKrxm.Caption := FJzxx.AKrxm;
  //edit by ls. 2002/09/02
  if FJzxx.AJzfs = JZFS_JZ then
    lblJzfs.Caption := FJzxx.AJzfs+'（'+FJzxx.AKhbh+'）'
  else if FJzxx.AJzfs = JZFS_XYK then
    lblJzfs.Caption := FJzxx.AJzfs+'（'+HotelData.FindMc('XYK','D_XYKBH','D_XYKMC',FJzxx.AXykbh)+'）'
  //else if FJzxx.AJzfs = JZFS_GSK then
    //lblJzfs.Caption := FJzxx.AJzfs+'（'+FJzxx.AKfbh+'）'
  //else if FJzxx.AJzfs = JZFS_GTD then
    //lblJzfs.Caption := FJzxx.AJzfs+'（'+HotelData.FindMc('KRXX','D_KRBH','D_KRXM',FJzxx.AKrbh)+'）'
  else
    lblJzfs.Caption := FJzxx.AJzfs;


  lblJzrq.Caption := FormatDateTime('yyyy-mm-dd',FJzxx.AJzrq);
  lblJzsj.Caption := FormatDateTime('hh:mm',FJzxx.AJzsj);
end;

//显示结帐信息
procedure TTdzdForm.ShowJzxx;
begin
  //结算金额
  FJsje := FXfje-FYjje-FYhje;

  //实结金额
  if FJsje>=0 then
    FSjje := Trunc(FJsje+0.99)
  else
    FSjje := Trunc(FJsje-0.99);

  //20020627 edit by ls. 如果不是人民币结帐 退还全部押金
  if FJzxx.AJzfs=JZFS_RMB then
  begin
    if FYfje>0 then
      FTfje := FYfje-FSjje
    else
      FTfje := 0;
  end
  else
    FTfje := FYfje;

  lblYfje.Caption := FormatFloat('#.##',FYfje);//CurrToStr(FYfje)+'元';
  lblXfje.Caption := FormatFloat('#.##',FXfje);//CurrToStr(FXfje)+'元';
  lblYjje.Caption := FormatFloat('#.##',FYjje);//CurrToStr(FYjje)+'元';
  lblYhje.Caption := FormatFloat('#.##',FYhje);//CurrToStr(FYhje)+'元';
  lblJsje.Caption := FormatFloat('#.##',FJsje);//CurrToStr(FJsje)+'元';
  lblTfje.Caption := FormatFloat('#.##',FTfje);//CurrToStr(FTfje)+'元';
  edtSjje.Text := FormatFloat('#.##',FSjje);//CurrToStr(FSjje);
end;

//添加结帐帐单列表
procedure TTdzdForm.AddKrjz;
var
  SqlStr: string;
begin
  SqlStr := 'select D_XMBH,sum(D_XFJE) as XFJE from KRZD where (D_HH<>0)'
            +'and(D_ZDBH="'+FJzxx.AZdbh+'") group by D_XMBH';
  with qryZd do
  begin
    SQL.Clear;
    SQL.Add(SqlStr);
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

  tblKrjz.DisableControls;

  try
    IsAppend := True;
    //获取结帐编号
    FJzbh := HotelData.GetBh('D_JZBH',PREV_JZBH);
    //行号=1
    FHh := 1;

    try
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

    tblKrjz.Filter   := 'D_JZBH='''+FJzbh+'''';
    tblKrjz.Filtered := True;

    //添加消费明细
    qryZd.First;
    while not qryZd.Eof do
    begin
      if qryZd.FieldByName('D_XMBH').AsString<>'' then
      begin
        tblKrjz.Insert;
        tblKrjzD_XMBH.Value := qryZd.FieldByName('D_XMBH').AsString;
        tblKrjzD_XFJE.Value := qryZd.FieldByName('XFJE').AsCurrency;
        tblKrjz.Post;
      end;
      qryZd.Next;
    end;

  finally
    IsAppend := False;
    tblKrjz.First;
    tblKrjz.EnableControls;
  end;
end;

//累加优惠金额
procedure TTdzdForm.SumYhje;
var
  PrevRecord: TBookMark;
begin
  PrevRecord := tblKrjz.GetBookmark;
  try
    tblKrjz.DisableControls;
    FYhje := 0;
    tblKrjz.First;
    while not tblKrjz.Eof do
    begin
      FYhje := FYhje + tblKrjzD_YHJE.Value;
      tblKrjz.Next;
    end;
  finally
    tblKrjz.EnableControls;
    if PrevRecord<>nil then
    begin
      tblKrjz.GotoBookmark(PrevRecord);
      tblKrjz.FreeBookmark(PrevRecord);
    end;
    ShowJzxx;
  end;
end;

procedure TTdzdForm.tblKrjzNewRecord(DataSet: TDataSet);
begin
  inherited;
  if IsAppend then
  begin
    tblKrjzD_JZBH.Value := FJzbh;
    tblKrjzD_HH.Value   := FHh;
    tblKrjzD_JZRQ.Value := FJzxx.AJzrq;
    tblKrjzD_JZSJ.Value := FJzxx.AJzsj;
    tblKrjzD_JZFS.Value := FJzxx.AJzfs;
    tblKrjzD_XYKBH.Value:= FJzxx.AXykbh;
    tblKrjzD_KHBH.Value := FJzxx.AKhbh;
    tblKrjzD_JZLX.Value := JZLX_YK;
    tblKrjzD_CZYXM.Value:= CZY.CzyXm;
    tblKrjzD_BMBH.Value := FBmbh;
    tblKrjzD_BZ.Value   := JZBZ_TD+' '+FJzxx.AKrxm;
  end;
end;

procedure TTdzdForm.tblKrjzBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if not IsAppend then
    Abort;
end;

procedure TTdzdForm.tblKrjzAfterPost(DataSet: TDataSet);
begin
  inherited;
  if not IsAppend then
    SumYhje
  else
    Inc(FHh);
end;

procedure TTdzdForm.tblKrjzBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

//检查优惠金额有效性
procedure TTdzdForm.tblKrjzD_YHJEValidate(Sender: TField);
begin
  inherited;
  if tblKrjzD_XMBH.Value <> XMBH_YJK then
  begin
    if tblKrjzD_YHJE.AsCurrency>tblKrjzD_XFJE.AsCurrency then
      raise Exception.Create('优惠金额不能大于消费金额！');
  end
  else
  begin
    if tblKrjzD_YHJE.Value <> 0 then
      raise Exception.Create('预交款不能优惠！');
  end;
end;

//获取额外费
function TTdzdForm.SumEwf: Currency;
begin
  Result := FSjje-FJsje;
end;

//结帐库中添加额外费
procedure TTdzdForm.AddEwf;
begin
  IsAppend := True;
  tblKrjz.Insert;
  tblKrjzD_XMBH.Value := XMBH_EWF;
  tblKrjzD_XFJE.Value := FEwf;
  tblKrjz.Post;
  IsAppend := False;
end;

//结帐库中添加额外费，更新额外费库
procedure TTdzdForm.UpdateEwf;
begin
  //获取额外费
  FEwf := SumEwf;
  //写入krjz.db
  if FEwf<>0 then
  begin
    //结帐库中写入额外费
    AddEwf;
    //写入ewf.db
    HotelData.UpdateEwfDbf(FJzbh,FJzxx.AKrxm,FEwf,FJzxx.AJzrq,FJzxx.AJzsj);
  end;
end;

//帐单中增加记录
procedure TTdzdForm.AddKrzd(const AXmbh: string;AXfje: Currency);
begin
  qryKrzd.Insert;
  qryKrzdD_ZDBH.Value := FJzxx.AZdbh;
  qryKrzdD_HH.Value   := 9999;
  qryKrzdD_KRBH.Value := FJzxx.AKrbh;
  qryKrzdD_YJBH.Value := FJzxx.AYjbh;
  qryKrzdD_ZDLB.Value := ZDLB_TD;
  qryKrzdD_XMBH.Value := AXmbh;
  qryKrzdD_XFJE.Value := AXfje;
  qryKrzdD_XFRQ.Value := FJzxx.AJzrq;
  qryKrzdD_XFSJ.Value := FJzxx.AJzsj;
  qryKrzdD_JZBZ.Value := JZ_NO;
  qryKrzdD_JSBZ.Value := JS_NO;
  qryKrzd.Post;
end;

//修改帐单信息，额外费
procedure TTdzdForm.UpdateKrzd(const ABz: string);
var
  SqlStr: string;
begin
  SqlStr := 'select * from KRZD where (D_ZDBH="'+FJzxx.AZdbh+'")';

  with qryKrzd do
  begin
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(SqlStr);
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

  //如果额外费不等于零
  if (FEwf<>0) then
    AddKrzd(XMBH_EWF,FEwf);

  //修改帐单总单的金额
  if qryKrzd.Locate('D_HH',0,[]) then
  begin
    qryKrzd.Edit;
    qryKrzdD_XFJE.Value := qryKrzdD_XFJE.Value + FEwf;
    qryKrzd.Post;
  end;

  //修改帐单的信息
  qryKrzd.First;
  while not qryKrzd.Eof do
  begin
    qryKrzd.Edit;
    qryKrzdD_JSBZ.Value := JS_YES;
    qryKrzdD_JZRQ.Value := FJzxx.AJzrq;
    qryKrzdD_JZSJ.Value := FJzxx.AJzsj;
    qryKrzdD_JZBH.Value := FJzbh;
    qryKrzdD_BZ.Value   := qryKrzdD_BZ.Value+' '+ABz;
    qryKrzdD_CZYXM.Value := CZY.CzyXm;
    qryKrzdD_JZYXM.Value := CZY.CzyXm;
    qryKrzdD_BMBH.Value  := FBmbh;
    //edit by ls. 20020824
    if qryKrzdD_JZBZ.Value = JZ_NO then
      qryKrzdD_JZBZ.Value := JZ_YES;
    qryKrzdD_JSBZ.Value := JS_YES;
    qryKrzd.Post;
    qryKrzd.Next;
  end;
end;

//取消
procedure TTdzdForm.btnCancClick(Sender: TObject);
begin
  inherited;
  tblKrjz.CancelUpdates;
end;

//结帐库中加入总单
procedure TTdzdForm.UpdateKrjz;
begin
  IsAppend := True;
  FHh := 0;
  tblKrjz.Insert;
  //edit by ls.20021020
  tblKrjzD_XFJE.Value := FSjje+FYhje+FYjje;
  tblKrjzD_YJJE.Value := 0-FYjje;
  tblKrjzD_YHJE.Value := FYhje;
  tblKrjz.Post;
  IsAppend := False;
end;

//修改客人信息的离店日期
procedure TTdzdForm.UpdateKrxx;
begin
  HotelData.UpdateKrxxJz(FJzxx.AKrbh,FJzxx.AJzrq,FJzxx.AJzsj);
end;

//备份客人信息
procedure TTdzdForm.BakKrxx;
begin
  HotelData.BakData('select * from KRXX where D_KRBH="'+FJzxx.AKrbh+'"','KRXXDA');
end;

//清空客人信息
procedure TTdzdForm.EmptyKrxx;
begin
  //HotelData.EmptyData('select * from KRXX where D_KRBH="'+FJzxx.AKrbh+'"');
  HotelData.EmptyData('delete from KRXX where D_KRBH="'+FJzxx.AKrbh+'"');
end;

//备份客人帐单
procedure TTdzdForm.BakKrzd;
begin
  HotelData.BakData('select * from KRZD where D_ZDBH="'+FJzxx.AZdbh+'"','KRZDDA');
end;

//清空客人押金
procedure TTdzdForm.EmptyKryj;
begin
  //HotelData.EmptyData('select * from KRYJ where D_YJBH="'+FJzxx.AYjbh+'"');
  HotelData.EmptyData('delete from KRYJ where D_YJBH="'+FJzxx.AYjbh+'"');
end;

{
procedure TTdzdForm.EmptyKrzd;
begin
  HotelData.EmptyData('select * from KRZD where D_ZDBH="'+FJzxx.AZdbh+'"');
end;
}

procedure TTdZdForm.AddYsk(const AKhbh,AZdbh,AXmbh: string;AHh: Integer;AXfje: Currency);
begin
  try
    try
      tblYsk.Open;
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

    tblYsk.Insert;
    tblYsk.FieldByName('D_KHBH').AsString   := AKhbh;
    tblYsk.FieldByName('D_ZDBH').AsString   := AZdbh;
    tblYsk.FieldByName('D_HH').AsInteger    := AHh;
    tblYsk.FieldByName('D_XMBH').AsString   := AXmbh;
    //tblYsk.FieldByName('D_XFDJ').AsCurrency := qryKrzdD_XFDJ.Value;
    //tblYsk.FieldByName('D_XFSL').AsFloat    := qryKrzdD_XFSL.Value;
    tblYsk.FieldByName('D_XFJE').AsCurrency := AXfje;
    tblYsk.FieldByName('D_XFRQ').AsDateTime := FJzxx.AJzrq;
    tblYsk.FieldByName('D_XFSJ').AsDateTime := FJzxx.AJzsj;
    tblYsk.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    //tblYsk.FieldByName('D_BZ').AsString     := qryKrzdD_BZ.Value;
    tblYsk.Post;

  finally
    tblYsk.Close;
  end;
end;


//更新应收款
procedure TTdzdForm.UpdateYsk;
begin
  try
    try
      tblYsk.Open;
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

    //添加消费明细
    qryKrzd.First;
    while not qryKrzd.Eof do
    begin
      if qryKrzdD_HH.Value <> 0 then
      begin
        tblYsk.Insert;
        tblYsk.FieldByName('D_KHBH').AsString   := FJzxx.AKhbh;
        tblYsk.FieldByName('D_ZDBH').AsString   := qryKrzdD_ZDBH.Value;
        tblYsk.FieldByName('D_HH').AsInteger    := qryKrzdD_HH.Value;
        tblYsk.FieldByName('D_XMBH').AsString   := qryKrzdD_XMBH.Value;
        tblYsk.FieldByName('D_XFDJ').AsCurrency := qryKrzdD_XFDJ.Value;
        tblYsk.FieldByName('D_XFSL').AsFloat    := qryKrzdD_XFSL.Value;
        tblYsk.FieldByName('D_XFJE').AsCurrency := qryKrzdD_XFJE.Value;
        tblYsk.FieldByName('D_XFRQ').AsDateTime := qryKrzdD_XFRQ.Value;
        tblYsk.FieldByName('D_XFSJ').AsDateTime := qryKrzdD_XFSJ.Value;
        tblYsk.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
        tblYsk.FieldByName('D_BZ').AsString     := qryKrzdD_BZ.Value;
        tblYsk.Post;
      end;
      qryKrzd.Next;
    end;
  finally
    tblYsk.Close;
  end;
end;

//结帐库中添加预交款 贵宾卡
procedure TTdZdForm.AddYjk(AGbkJzxx: TGbkJzxx);
var
  AYe,ACe: Currency;
  AXmbh,AZdbh: string;
  AHh: Integer;
begin
  IsAppend := True;

  if (AGbkJzxx.AJzfs=JZFS_RMB)
   or(AGbkJzxx.AJzfs=JZFS_XYK)
   or(AGbkJzxx.AJzfs=JZFS_ZP )  then
  begin
    //贵宾卡结帐，剩余的金额
    AYe := FSjje - AGbkJzxx.AKcje;
    tblKrjz.First;
    while not tblKrjz.Eof do
    begin
      if AYe = 0 then Break;
      //如果不是预交款
      if tblKrjzD_XMBH.Value <> XMBH_YJK then
      begin
        //如果余额大于当前消费金额，修改当前结帐方式
        if AYe >= tblKrjzD_XFJE.Value then
        begin
          tblKrjz.Edit;
          tblKrjzD_JZFS.Value := AGbkJzxx.AJzfs;
          tblKrjzD_XYKBH.Value:= AGbkJzxx.AXykbh;
          AYe := AYe - tblKrjzD_XFJE.Value;
          tblKrjz.Post;
        end
        else //如果余额小于当前消费金额，修改当前消费金额为余额，增加差额
        begin
          ACe   := tblKrjzD_XFJE.Value - AYe;
          AXmbh := tblKrjzD_XMBH.Value;

          tblKrjz.Edit;
          tblKrjzD_XFJE.Value := AYe;
          tblKrjzD_JZFS.Value := AGbkJzxx.AJzfs;
          tblKrjzD_XYKBH.Value:= AGbkJzxx.AXykbh;
          AYe := AYe - tblKrjzD_XFJE.Value;
          tblKrjz.Post;
          tblKrjz.Insert;
          tblKrjzD_XMBH.Value := AXmbh;
          tblKrjzD_XFJE.Value := ACe;
          tblKrjzD_YJJE.Value := 0;
          tblKrjzD_YHJE.Value := 0;
          tblKrjz.Post;
        end;
      end;
      tblKrjz.Next;
    end;
  end;
  //如果是记账
  if (AGbkJzxx.AJzfs = JZFS_JZ) then
  begin
    //贵宾卡结帐，剩余的金额
    AZdbh := HotelData.GetBh('D_ZDBH',PREV_ZDBH);
    AHh := 0;
    AYe := FSjje - AGbkJzxx.AKcje;
    tblKrjz.First;
    while not tblKrjz.Eof do
    begin
      if AYe = 0 then Break;
      //如果不是预交款
      if tblKrjzD_XMBH.Value <> XMBH_YJK then
      begin
        //如果余额大于当前消费金额，当前消费金额记账
        if AYe >= tblKrjzD_XFJE.Value then
        begin
          AYe := AYe - tblKrjzD_XFJE.Value;

          Inc(AHh);

          AddYsk(AGbkJzxx.AKhbh,AZdbh,tblKrjzD_XMBH.Value,AHh,tblKrjzD_XFJE.Value);

          tblKrjz.Delete;
        end
        else //如果余额小于当前消费金额，修改当前消费金额为差额,余额记账
        begin
          ACe   := tblKrjzD_XFJE.Value - AYe;
          AXmbh := tblKrjzD_XMBH.Value;

          Inc(AHh);

          AddYsk(AGbkJzxx.AKhbh,AZdbh,tblKrjzD_XMBH.Value,AHh,AYe);

          tblKrjz.Edit;
          tblKrjzD_XFJE.Value := ACe;
          AYe := AYe - tblKrjzD_XFJE.Value;
          tblKrjz.Post;
          tblKrjz.Next;
        end;
      end;
    end;
  end;

  tblKrjz.Insert;
  tblKrjzD_XMBH.Value := XMBH_YJK;
  tblKrjzD_XFJE.Value := 0-AGbkJzxx.AKcje;
  tblKrjzD_YJJE.Value := 0;
  tblKrjzD_YHJE.Value := 0;
  tblKrjz.Post;
  IsAppend := False;
end;

//确认结帐
procedure TTdzdForm.btnOKClick(Sender: TObject);
var
  AGbkJzxx: TGbkJzxx;
  ASjje : Currency;
begin
  inherited;
  ASjje := StrToCurr(edtSjje.Text);
  if Abs(ASjje-FJsje)<=10 then FSjje := ASjje
  else
  begin
    ShowWarning('实结金额差额必须小于10元！');
    edtSjje.SetFocus;
    Exit;
  end;

  if not Confirm('你确认该客人的消费结帐吗？') then
    Exit;

  try
    tblKrjz.DisableControls;
    tblKrjzD_YHJE.OnValidate := nil;// 20020627 edit by ls.

    //事务启动
    HotelData.DatabaseUser.StartTransaction;

    try

      //贵宾卡结帐
      //人民币、支票、信用卡结帐
      if (FJzxx.AJzfs=JZFS_RMB)
        or(FJzxx.AJzfs=JZFS_ZP)
        or(FJzxx.AJzfs=JZFS_XYK)
        or(FJzxx.AJzfs=JZFS_GBK) then
      begin
        if FJzxx.AJzfs = JZFS_GBK then
        begin
          AGbkJzxx := CardXf(FSjje,True);
          if AGbkJzxx.AKcje = 0 then
            Exit;
          AddYjk(AGbkJzxx);
        end;

        UpdateEwf;
        UpdateKrzd(JZBZ_TD);
        UpdateKrjz;
        tblKrjz.ApplyUpdates;
        qryKrzd.ApplyUpdates;
        UpdateKrxx;
        BakKrxx;
        EmptyKrxx;
        EmptyKryj;
        BakKrzd;
        //EmptyKrzd;
        //tblKrjz.CancelUpdates;
      end;

      //客户记账
      if (FJzxx.AJzfs=JZFS_JZ) then
      begin
        UpdateEwf;
        UpdateKrzd(JZBZ_TD+ZDBZ_JZ+FJzxx.AKhbh);
        UpdateKrjz;
        UpdateYsk;
        qryKrzd.ApplyUpdates;
        UpdateKrxx;
        BakKrxx;
        EmptyKrxx;
        EmptyKryj;
        BakKrzd;
        //EmptyKrzd;
        tblKrjz.CancelUpdates;
      end;

      //事务提交
      HotelData.DatabaseUser.Commit;

      {if Confirm('是否打印帐单？') then
        btnPrintClick(nil);}

    except
      //事务回滚
      HotelData.DatabaseUser.Rollback;
      raise;
    end;

    tblKrjz.CancelUpdates;
    tblKrjz.CommitUpdates;
  finally
    tblKrjz.EnableControls;
  end;
  Close;
end;

//判断实结金额
procedure TTdzdForm.edtSjjeExit(Sender: TObject);
var
  ASjje: Currency;
begin
  inherited;
  ASjje := StrToCurr(edtSjje.Text);
  if Abs(ASjje-FJsje)<=10 then FSjje := ASjje
  else
  begin
    ShowWarning('实结金额差额必须小于10元！');
    edtSjje.SetFocus;
  end;
end;

procedure TTdzdForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '帐单（结帐方式：'+lblJzfs.Caption+'）';
  APrintStru.ASub := '消费金额：'+lblXfje.Caption+' '
                    +'已结金额：'+lblYjje.Caption+' '
                    +'押金金额：'+lblYfje.Caption+' '
                    +'结算金额：'+lblJsje.Caption+' '+#13#10
                    +'退付金额：'+lblTfje.Caption+' '
                    +'优惠金额：'+lblYhje.Caption+' '
                    +'实结金额：'+edtSjje.Text+'元';

  APrintStru.ADataSet := tblKrjz;
  PrintLb(APrintStru,dbgZd);
end;

procedure TTdzdForm.btnFjmxClick(Sender: TObject);
begin
  inherited;
  Fjmx(FJzxx.AZdbh);
end;

procedure TTdzdForm.btnZdmxClick(Sender: TObject);
begin
  inherited;
  Zdmx(FJzxx.AZdbh);
end;

end.

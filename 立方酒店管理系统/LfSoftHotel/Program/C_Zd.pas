{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_Zd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, C_Define, Grids,
  DBGrids, DBTables, DB;

type
  TZdForm = class(TStdJdForm)
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
    dbgZd: TDBGrid;
    qryZd: TQuery;
    dsKrjz: TDataSource;
    Label2: TLabel;
    edtSjje: TEdit;
    tblKrjz: TTable;
    tblKrjzD_XFXM: TStringField;
    Label4: TLabel;
    lblJzfs: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    lblJzrq: TLabel;
    lblJzsj: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    qryKrzd: TQuery;
    qryGz: TQuery;
    tblKryj: TTable;
    tblYsk: TTable;
    btnPrint: TBitBtn;
    lblJzfh: TLabel;
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
    qryYsk: TQuery;
    procedure tblKrjzNewRecord(DataSet: TDataSet);
    procedure tblKrjzAfterPost(DataSet: TDataSet);
    procedure tblKrjzBeforeInsert(DataSet: TDataSet);
    procedure tblKrjzBeforeDelete(DataSet: TDataSet);
    procedure tblKrjzD_YHJEValidate(Sender: TField);
    procedure btnCancClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtSjjeExit(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    FBmbh: string;
    FJzxx: TJZXX;
    FKfxx: TKfxxArray;
    FGzxx: TKFXX;
    FItemNo: Integer;
    FYfje: Currency;
    FXfje: Currency;
    FYjje: Currency;
    FYhje: Currency;
    FJsje: Currency;
    FTfje: Currency;
    FSjje: Currency;
    FDtfj: Currency;
    FDhf : Currency;
    FEwf : Currency;
    FJzbh: string;
    FHh: Integer;
    IsAppend: Boolean;
    FJzfhs: string;
    procedure GetKfxx;
    procedure GetKfxxWjz;
    procedure ShowJzxx;
    procedure UpdateKrzd(const ABz: string);
    procedure UpdateKfzt;
    procedure UpdateKrxx;
    procedure UpdateEwf;
    procedure UpdateBqj;
    procedure AddKrzd(AHh: Integer;const AXmbh: string;AXfje: Currency;AKfxx: TKFXX);
    procedure AddKrjz;
    procedure UpdateKrjz;
    procedure AddDtfj;
    procedure AddDhf;
    procedure AddEwf;
    procedure ShowJzfs;
    function SumYfje: Currency;
    function SumXfje: Currency;
    function SumYjje: Currency;
    function SumDtfj: Currency;
    function SumDhf : Currency;
    function SumEwf : Currency;
    procedure GetGzxx;
    procedure SumYhje;
    procedure BakKrxx;
    procedure BakKrzd;
    procedure EmptyKrxx;
    procedure EmptyKryj;
    procedure EmptyKrzd;
    procedure UpdateGz;
    procedure UpdateYsk;
    procedure CanYh;
    procedure AddYjk(AGbkJzxx: TGbkJzxx);
    procedure AddYsk(const AKhbh,AZdbh,AXmbh: string;AHh: Integer;AXfje: Currency);
    procedure UpdateXxdc;
  public
    { Public declarations }
  end;

var
  ZdForm: TZdForm;

procedure Zd(AJzxx: TJZXX);
procedure WjzZd(AJzxx: TJZXX);

implementation

uses C_HotelData, C_Sysprint, C_CardXf, C_Zdcx;

{$R *.dfm}

//散客结帐帐单
procedure Zd(AJzxx: TJZXX);
begin
  ZdForm := TZdForm.Create(Application);
  try
    with ZdForm do
    begin
      //获取部门编号
      FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);

      //获取结帐信息
      FJzxx := AJzxx;
      //是否能优惠
      CanYh;
      //获取客房信息
      GetKfxx;
      //显示结帐方式
      ShowJzfs;
      //计算当天房价
      FDtfj := SumDtfj;
      //计算电话费
      FDhf  := SumDhf;
      //计算押金金额
      FYfje := SumYfje;
      //计算已结金额
      FYjje := SumYjje;
      //计算消费金额
      FXfje := SumXfje;
      if (FDtfj<>0)or(FDhf<>0) then
        FXfje := FXfje + FDtfj + FDhf;
      //显示结帐信息
      ShowJzxx;
      //显示帐单
      AddKrjz;
      ShowModal;
    end;
  finally
    ZdForm.Free;
  end;
end;

//未结帐结帐
procedure WjzZd(AJzxx: TJZXX);
begin
  ZdForm := TZdForm.Create(Application);
  try
    with ZdForm do
    begin
      FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);

      FJzxx := AJzxx;
      //是否能优惠
      CanYh;
      //获取客房信息
      GetKfxxWjz;
      //显示结帐方式
      ShowJzfs;
      FJzfhs := FJzxx.AKfbh;
      lblJzfh.Caption := '结帐房号：' + FJzfhs;
      //计算当天房价
      FDtfj := 0;
      //计算电话费
      FDhf  := 0;
      //计算押金金额
      FYfje := SumYfje;
      //计算已结金额
      FYjje := SumYjje;
      //计算消费金额
      FXfje := SumXfje;
      {if (FDtfj<>0)or(FDhf<>0) then
        FXfje := FXfje + FDtfj + FDhf;}
      //显示结帐信息
      ShowJzxx;
      //显示帐单
      AddKrjz;
      ShowModal;
    end;
  finally
    ZdForm.Free;
  end;
end;

//判断是否能够优惠 只有人民币、信用卡、支票才可以优惠
procedure TZdForm.CanYh;
begin
  dbgZd.Columns[2].ReadOnly := not((FJzxx.AJzfs=JZFS_RMB)
                                 or(FJzxx.AJzfs= JZFS_ZP)
                                 or(FJzxx.AJzfs=JZFS_XYK));
end;

//获得客房信息
procedure TZdForm.GetKfxx;
var
  I: Integer;
begin
  FItemNo := High(FJzxx.AJzfh);
  SetLength(FKfxx,FItemNo+1);
  for I:=0 to FItemNo do
    FKfxx[i] := HotelData.GetKfxx(FJzxx.AJzfh[i]);
end;

//获得未结帐客房信息
procedure TZdForm.GetKfxxWjz;
begin
  FItemNo := 0;
  SetLength(FKfxx,FItemNo+1);
  FKfxx[0].AKfbh := FJzxx.AKfbh;
  FKfxx[0].AKrxm := FJzxx.AKfbh;
  FKfxx[0].AZdbh := FJzxx.AJzfh[0];
  FKfxx[0].AKrbh := FJzxx.AKrbh;
  FKfxx[0].AYjbh := FJzxx.AYjbh;
  FKfxx[0].ADtfj := 0;
  FKfxx[0].ADhf  := 0;
  FKfxx[0].AZdhh := 9999;//?
end;

//显示结帐方式
procedure TZdForm.ShowJzfs;
var
  I : Integer;
begin
  FJzfhs := '';
  for i := 0 to FItemNo do
    FJzfhs := FJzfhs + FJzxx.AJzfh[i] + ' ';
  lblJzfh.Caption := '结帐房号 ' + FJzfhs;
  //edit by ls. 2002/09/02
  if FJzxx.AJzfs = JZFS_JZ then
    lblJzfs.Caption := FJzxx.AJzfs+'（'+FJzxx.AKhbh+'）'
  else if FJzxx.AJzfs = JZFS_XYK then
    lblJzfs.Caption := FJzxx.AJzfs+'（'+HotelData.FindMc('XYK','D_XYKBH','D_XYKMC',FJzxx.AXykbh)+'）'
  else if FJzxx.AJzfs = JZFS_GSK then
    lblJzfs.Caption := FJzxx.AJzfs+'（'+FJzxx.AKfbh+'）'
  else if FJzxx.AJzfs = JZFS_GTD then
    lblJzfs.Caption := FJzxx.AJzfs+'（'+HotelData.FindMc('KRXX','D_KRBH','D_KRXM',FJzxx.AKrbh)+'）'
  else
    lblJzfs.Caption := FJzxx.AJzfs;
  lblJzrq.Caption := FormatDateTime('yyyy-mm-dd',FJzxx.AJzrq);
  lblJzsj.Caption := FormatDateTime('hh:mm',FJzxx.AJzsj);
end;

//获得额外费
function TZdForm.SumEwf: Currency;
begin
  Result := FSjje-FJsje;
end;

//获得电话费
function TZdForm.SumDhf: Currency;
var
  I: Integer;
begin
  Result := 0;
  for I:=0 to FItemNo do
  begin
    FKfxx[i].ADhf := HotelData.GetDhf(FKfxx[i].AKfbh,FKfxx[i].ADdrq,FKfxx[i].ADdsj);
    Result := Result + FKfxx[i].ADhf;
  end;
end;

//更新半全价
procedure TZdForm.UpdateBqj;
var
 i: Integer;
begin
  for i:=0 to FItemNo do
  if FKfxx[i].ABqj<>BQJ_ZC then
    HotelData.UpdateBqj(FKfxx[i].AKfbh,FKfxx[i].ABqj,0,FKfxx[i].ADtfj)
  else
    HotelData.UpdateBqj(FKfxx[i].AKfbh,FKfxx[i].ABqj,0,0);
end;
//获得当天房价
function TZdForm.SumDtfj: Currency;
var
  I,ABqj: Integer;
begin
  Result := 0;
  for I:=0 to FItemNo do
  begin
    FKfxx[i].ADtfj := GetDtfj(FKfxx[i].ADdsj,FJzxx.AJzsj,FKfxx[i].AKfbz,FKfxx[i].ASjfj);
    ABqj           := CheckLdsj(FKfxx[i].ADdsj,FJzxx.AJzsj,FKfxx[i].AKfbz);
    FKfxx[i].ABqj  := ABqj;

    {if ABqj<>BQJ_ZC then
      HotelData.UpdateBqj(FKfxx[i].AKfbh,ABqj,0,FKfxx[i].ADtfj)
    else
      HotelData.UpdateBqj(FKfxx[i].AKfbh,ABqj,0,0);}
    Result := Result + FKfxx[i].ADtfj;
  end;
end;

//累计优惠金额
procedure TZdForm.SumYhje;
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

//获得预付金额
function TZdForm.SumYfje: Currency;
var
  I: Integer;
  SqlStr: string;
begin
  SqlStr := '';

  for I:= 0 to FItemNo do
  begin
    if I>0 then SqlStr := SqlStr + 'or';
    SqlStr := SqlStr + '(D_YJBH="'+FKfxx[i].AYjbh+'")';
  end;

  SqlStr := 'select sum(D_YFJE) from KRYJ where (D_FKFS="'
            +FKFS_RMB+'")and('+SqlStr+')';
  Result := HotelData.SumJe(SqlStr);
end;

//获得已结金额
function TZdForm.SumYjje: Currency;
var
  I: Integer;
  SqlStr: string;
begin
  SqlStr := '';
  for I:= 0 to FItemNo do
  begin
    if I>0 then SqlStr := SqlStr + 'or';
    SqlStr := SqlStr + '(D_ZDBH="'+FKfxx[i].AZdbh+'")';
  end;
  //SqlStr := 'select sum(D_XFJE) from KRZD where (D_JZBZ="'
    //        +JZ_YX+'")and('+SqlStr+')';
  SqlStr := 'select sum(D_XFJE) from KRZD where ((D_XMBH="'
            +XMBH_YJK+'")or(D_JZBZ="'+JZ_YX+'"))and('+SqlStr+')';

  Result := 0-HotelData.SumJe(SqlStr);
end;

//获得消费金额
function TZdForm.SumXfje: Currency;
var
  I: Integer;
  SqlStr: string;
begin
  SqlStr := '';
  
  for I:= 0 to FItemNo do
  begin
    if I>0 then SqlStr := SqlStr + 'or';
    SqlStr := SqlStr + '(D_ZDBH="'+FKfxx[i].AZdbh+'")';
  end;

  //edit by ls. 20020729
  {SqlStr := 'select sum(D_XFJE) from KRZD where (D_HH=0)'
            +'and('+SqlStr+')';}
  SqlStr := 'select sum(D_XFJE) from KRZD where (D_HH<>0)and(D_XMBH<>"'+XMBH_YJK+'")'
            +'and(D_JZBZ<>"'+JZ_YX+'")and('+SqlStr+')';

  Result := HotelData.SumJe(SqlStr);
end;

//更新信息导出
procedure TZdForm.UpdateXxdc;
var
  I: Integer;
begin
  try
    try
      HotelData.tblXxdc.Open;
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

    for I:=0 to FItemNo do
    begin
      if HotelData.tblXxdc.FindKey([FKfxx[i].AKrbh]) then
      begin
        HotelData.tblXxdc.Edit;
        HotelData.tblXxdc.FieldByName('D_LDRQ').AsString := FormatDateTime('yyyymmdd',Date);
        HotelData.tblXxdc.Post;
      end;
    end;
  finally
    HotelData.tblXxdc.Close;
  end;
end;

//显示结帐信息
procedure TZdForm.ShowJzxx;
begin
  FJsje := FXfje-FYjje-FYhje;

  if FJsje>=0 then
    FSjje := Trunc(FJsje+0.99)
  else
    FSjje := Trunc(FJsje-0.99);

  //20020627 edit by ls. 如果不是人民币结帐 退还全部押金  
  if FJzxx.AJzfs = JZFS_RMB then
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

//结帐库中添加额外费
procedure TZdForm.AddEwf;
begin
  IsAppend := True;
  tblKrjz.Insert;
  tblKrjzD_XMBH.Value := XMBH_EWF;
  tblKrjzD_XFJE.Value := FEwf;
  tblKrjz.Post;
  IsAppend := False;
end;

//结帐库中添加当天房价
procedure TZdForm.AddDtfj;
begin
  IsAppend := True;
  if tblKrjz.Locate('D_XMBH',XMBH_FJ,[]) then
  begin
    tblKrjz.Edit;
    tblKrjzD_XFJE.Value := tblKrjzD_XFJE.Value + FDtfj;
    tblKrjz.Post;
  end
  else
  begin
    tblKrjz.Insert;
    tblKrjzD_XMBH.Value := XMBH_FJ;
    tblKrjzD_XFJE.Value := FDtfj;
    tblKrjz.Post;
  end;
  IsAppend := False;
end;

//结帐库中添加电话费
procedure TZdForm.AddDhf;
begin
  IsAppend := True;
  if tblKrjz.Locate('D_XMBH',XMBH_DHF,[]) then
  begin
    tblKrjz.Edit;
    tblKrjzD_XFJE.Value := tblKrjzD_XFJE.Value + FDhf;
    tblKrjz.Post;
  end
  else
  begin
    tblKrjz.Insert;
    tblKrjzD_XMBH.Value := XMBH_DHF;
    tblKrjzD_XFJE.Value := FDhf;
    tblKrjz.Post;
  end;
  IsAppend := False;
end;

//帐单中添加记录
procedure TZdForm.AddKrzd(AHh: Integer;const AXmbh: string;AXfje: Currency;AKfxx: TKFXX);
begin
  qryKrzd.Insert;
  qryKrzdD_ZDBH.Value := AKfxx.AZdbh;
  qryKrzdD_HH.Value   := AHh;
  qryKrzdD_KRBH.Value := AKfxx.AKrbh;
  qryKrzdD_YJBH.Value := AKfxx.AYjbh;
  qryKrzdD_ZDLB.Value := AKfxx.AZdlb;
  qryKrzdD_XMBH.Value := AXmbh;
  qryKrzdD_XFJE.Value := AXfje;
  qryKrzdD_XFRQ.Value := FJzxx.AJzrq;
  qryKrzdD_XFSJ.Value := FJzxx.AJzsj;
  qryKrzdD_JZBZ.Value := JZ_YES;
  qryKrzdD_JSBZ.Value := JS_YES;
  qryKrzdD_CZYXM.Value:= CZY.CzyXm;
  qryKrzdD_JZYXM.Value:= CZY.CzyXm;
  qryKrzdD_BMBH.Value := FBmbh;
  qryKrzd.Post;
end;

//更新客人帐单
procedure TZdForm.UpdateKrzd(const ABz: string);
var
  I,AHh: Integer;
  SqlStr: string;
begin

  SqlStr := '';
  for I:= 0 to FItemNo do
  begin
    if I>0 then SqlStr := SqlStr + 'or';
    SqlStr := SqlStr + '(D_ZDBH="'+FKfxx[i].AZdbh+'")';
  end;
  SqlStr := 'select * from KRZD where '+SqlStr;

  //过滤
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

  //逐个帐单添加
  for I:=0 to FItemNo do
  begin
    //获得行号
    AHh := FKfxx[i].AZdhh;

    //如果当天房价不等于零
    if FDtfj<>0 then
    begin
      if FKfxx[i].ADtfj<>0 then
      begin
        AddKrzd(AHh,XMBH_FJ,FKfxx[i].ADtfj,FKfxx[i]);
        Inc(AHh);
      end;
    end;

    //如果电话费不等于零
    if FDhf<>0 then
    begin
      if FKfxx[i].ADhf<>0 then
      begin
        AddKrzd(AHh,XMBH_DHF,FKfxx[i].ADhf,FKfxx[i]);
        Inc(AHh);
      end;
    end;

    //如果额外费不等于零，添加到第一个帐单中
    if (FEwf<>0)and(i=0) then
      AddKrzd(AHh,XMBH_EWF,FEwf,FKfxx[i]);

    //累加总单的消费金额
    qryKrzd.Filter   := 'D_ZDBH='''+FKfxx[i].AZdbh+'''';
    qryKrzd.Filtered := True;
    if qryKrzd.Locate('D_HH',0,[]) then
    begin
      qryKrzd.Edit;
      qryKrzdD_XFJE.Value := qryKrzdD_XFJE.Value + FDtfj + FDhf + FEwf;
      qryKrzd.Post;
    end;
    qryKrzd.Filter   := '';
    qryKrzd.Filtered := False;
  end;

  //修改所有帐单
  qryKrzd.First;
  while not qryKrzd.Eof do
  begin
    qryKrzd.Edit;

    //结帐/未结帐
    if FJzxx.AJzfs<>JZFS_WJZ then
      qryKrzdD_JSBZ.Value := JS_YES
    else
      qryKrzdD_JSBZ.Value := JS_WJ;

    qryKrzdD_JZRQ.Value := FJzxx.AJzrq;
    qryKrzdD_JZSJ.Value := FJzxx.AJzsj;
    qryKrzdD_JZBH.Value := FJzbh;
    //edit by ls. 20020824
    if qryKrzdD_JZBZ.Value = JZ_NO then
      qryKrzdD_JZBZ.Value := JZ_YES;
    //qryKrzdD_JSBZ.Value := JS_YES;
    if qryKrzdD_JZYXM.Value = '' then
      qryKrzdD_JZYXM.Value := CZY.CzyXm;
    qryKrzdD_BZ.Value   := qryKrzdD_BZ.Value+' '+ABz;
    qryKrzdD_BMBH.Value := FBmbh;
    //qryKrzdD_JZYXM.Value:= CZY.CzyXm;
    qryKrzd.Post;
    qryKrzd.Next;
  end;
end;

//插入结帐库总单 行号=0
procedure TZdForm.UpdateKrjz;
begin
  IsAppend := True;
  FHh := 0;
  tblKrjz.Insert;
  //edit by ls.20021020
  tblKrjzD_XFJE.Value := FSjje+FYhje+FYjje;//????????
  tblKrjzD_YJJE.Value := 0-FYjje;
  tblKrjzD_YHJE.Value := FYhje;
  tblKrjz.Post;
  IsAppend := False;
end;

//列出客人帐单
procedure TZdForm.AddKrjz;
var
  I: Integer;
  SqlStr: string;
begin
  SqlStr := '';

  for I:= 0 to FItemNo do
  begin
    if I>0 then SqlStr := SqlStr + 'or';
    SqlStr := SqlStr + '(D_ZDBH="'+FKfxx[i].AZdbh+'")';
  end;

  SqlStr := 'select D_XMBH,sum(D_XFJE) as XFJE from KRZD where (D_HH<>0)'
            +'and('+SqlStr+') group by D_XMBH';

  //统计消费项目
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

  //添加到结帐库中
  tblKrjz.DisableControls;
  try
    IsAppend := True;
    //获得结帐编号
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

    //如果当天房价不等于零
    if FDtfj<>0 then AddDtfj;

    //如果电话费不等于零
    if FDhf <>0 then AddDhf;
  finally
    IsAppend := False;
    tblKrjz.First;
    tblKrjz.EnableControls;
  end;
end;

procedure TZdForm.tblKrjzNewRecord(DataSet: TDataSet);
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
    tblKrjzD_BZ.Value   := JZBZ_SK+FJzfhs ;
  end;
end;

procedure TZdForm.tblKrjzAfterPost(DataSet: TDataSet);
begin
  inherited;
  if not IsAppend then
    SumYhje
  else
    Inc(FHh);
end;

procedure TZdForm.tblKrjzBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if not IsAppend then
    Abort;
end;

procedure TZdForm.tblKrjzBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

//检查优惠金额
procedure TZdForm.tblKrjzD_YHJEValidate(Sender: TField);
begin
  inherited;
  if tblKrjzD_XMBH.Value <> XMBH_YJK then
  begin
    if tblKrjzD_YHJE.AsCurrency>tblKrjzD_XFJE.AsCurrency then
    begin
      //tblKrjzD_YHJE.Value := tblKrjzD_XFJE.Value;
      raise Exception.Create('优惠金额不能大于消费金额！');
    end
  end
  else
  begin
    if tblKrjzD_YHJE.Value <> 0 then
      raise Exception.Create('预交款不能优惠！');
  end;
end;

//取消
procedure TZdForm.btnCancClick(Sender: TObject);
begin
  inherited;
  tblKrjz.CancelUpdates;
end;

//更新客房状态 间接房价
procedure TZdForm.UpdateKfzt;
var
  I: Integer;
begin
  for I:=0 to FItemNo do
  begin
    //初始化客房
    HotelData.InitKfzt(FKFxx[i].AKfbh);
    //更新间接房价
    if FKfxx[i].ADtfj<>0 then
      HotelData.UpdateJjfj(FKfxx[i].AKfbh,FKfxx[i].ABqj,FKfxx[i].ADtfj);
  end;
end;

//更新客人信息的离店日期
procedure TZdForm.UpdateKrxx;
var
  I: Integer;
begin
  for I:=0 to FItemNo do
    HotelData.UpdateKrxxJz(FKfxx[i].AKrbh,FJzxx.AJzrq,FJzxx.AJzsj);
end;

//备份客人信息
procedure TZdForm.BakKrxx;
var
  I: Integer;
begin
  for I:=0 to FItemNo do
    HotelData.BakData('select * from KRXX where D_KRBH="'+FKfxx[i].AKrbh+'"','KRXXDA');
end;

//备份客人帐单
procedure TZdForm.BakKrzd;
var
  I: Integer;
begin
  for I:=0 to FItemNo do
    HotelData.BakData('select * from KRZD where D_ZDBH="'+FKfxx[i].AZdbh+'"','KRZDDA');
end;

//清空客人帐单
procedure TZdForm.EmptyKrzd;
var
  I: Integer;
begin
  for I:=0 to FItemNo do
    //HotelData.EmptyData('select * from KRZD where D_ZDBH="'+FKfxx[i].AZdbh+'"');
    HotelData.EmptyData('delete from KRZD where D_ZDBH="'+FKfxx[i].AZdbh+'"');
end;

//清空客人信息
procedure TZdForm.EmptyKrxx;
var
  I: Integer;
begin
  for I:=0 to FItemNo do
    HotelData.EmptyData('delete from KRXX where D_KRBH="'+FKfxx[i].AKrbh+'"');
    //HotelData.EmptyData('select * from KRXX where D_KRBH="'+FKfxx[i].AKrbh+'"');
end;

//清空客人押金
procedure TZdForm.EmptyKryj;
var
  I: Integer;
begin
  //如果结帐方式为挂帐，押金不退，则押金转到挂帐对象上 ？？？？
  if not FJzxx.AYjtf then
  begin
    try
      tblKryj.Open;
      if tblKryj.FindKey([FGzxx.AYjbh,0]) then
        if tblKryj.FieldByName('D_FKFS').AsString=FKFS_RMB then
        begin
          tblKryj.Edit;
          tblKryj.FieldByName('D_YFJE').AsCurrency :=
            tblKryj.FieldByName('D_YFJE').AsCurrency + FYfje;
          tblKryj.Post;
        end;
    finally
      tblKryj.Close;
    end;
  end;
  //清空押金信息
  for I:=0 to FItemNo do
    //HotelData.EmptyData('select * from KRYJ where D_YJBH="'+FKfxx[i].AYjbh+'"');
    HotelData.EmptyData('delete from KRYJ where D_YJBH="'+FKfxx[i].AYjbh+'"');
end;

//更新额外费
procedure TZdForm.UpdateEwf;
begin
  //获得额外费
  FEwf := SumEwf;

  //如果不等于零，写入结帐库中
  if FEwf<>0 then
  begin
    //写入结帐库
    AddEwf;
    //写入额外费库
    HotelData.UpdateEwfDbf(FJzbh,FKfxx[0].AKrxm,FEwf,FJzxx.AJzrq,FJzxx.AJzsj);
  end;
end;

//获取挂帐信息
procedure TZdForm.GetGzxx;
var
  aTdxx : TTdxx;
begin
  if FJzxx.AJzfs=JZFS_GSK then
    FGzxx := HotelData.GetKfxx(FJzxx.AKfbh);
  if FJzxx.AJzfs=JZFS_GTD then//edit by ls.2002.12.01
  begin
    aTdxx := HotelData.GetTdxx(FJzxx.AKrbh);
    FGzxx.AZdbh := aTdxx.AZdbh;
    FGzxx.AKrbh := aTdxx.AKrbh;
    FGzxx.AYjbh := aTdxx.AYjbh;
    FGzxx.AZdlb := aTdxx.AZdlb;
    FGzxx.AZdhh := aTdxx.AZdhh;
    //FGzxx := HotelData.GetKfxx(HotelData.GetKfbh(FJzxx.AKrbh));
  end;
end;

//更新挂帐对象信息
procedure TZdForm.UpdateGz;
var
  AHh: Integer;
begin
  //获取挂帐信息
  GetGzxx;

  qryGz.Close;
  qryGz.Params[0].Value := FGzxx.AZdbh;
  try
    qryGz.Open;
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

  //获得行号
  AHh := FGzxx.AZdhh;

  try
    tblKrjz.DisableControls;
    //添加消费明细
    tblKrjz.First;
    while not tblKrjz.Eof do
    begin
      qryGz.Insert;
      qryGz.FieldByName('D_ZDBH').AsString := FGzxx.AZdbh;
      qryGz.FieldByName('D_HH').AsInteger  := AHh;
      qryGz.FieldByName('D_ZDLB').AsString := FGzxx.AZdlb;
      qryGz.FieldByName('D_KRBH').AsString := FGzxx.AKrbh;
      qryGz.FieldByName('D_YJBH').AsString := FGzxx.AYjbh;
      qryGz.FieldByName('D_XMBH').AsString := tblKrjzD_XMBH.Value;
      qryGz.FieldByName('D_XFJE').AsCurrency := tblKrjzD_XFJE.Value;
      qryGz.FieldByName('D_XFRQ').AsDateTime := FJzxx.AJzrq;
      qryGz.FieldByName('D_XFSJ').AsDateTime := FJzxx.AJzsj;
      qryGz.FieldByName('D_JZBZ').AsString := JZ_NO;
      qryGz.FieldByName('D_JSBZ').AsString := JS_NO;
      qryGz.FieldByName('D_BZ').AsString   := ZDBZ_GZ+FJzfhs;
      qryGz.Post;
      Inc(AHh);
      tblKrjz.Next;
    end;

    //修改总单
    if qryGz.Locate('D_HH',0,[]) then
    begin
      qryGz.Edit;
      qryGz.FieldByName('D_XFJE').AsCurrency :=
        qryGz.FieldByName('D_XFJE').AsCurrency + FXfje;
      qryGz.Post;
    end;
  finally
    qryGz.Close;
    tblKrjz.EnableControls;
  end;
end;

//更新应收款
procedure TZdForm.UpdateYsk;
var
  i: Integer;
  SqlStr : string;
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
  //edit by ls.2002.12.15 挂帐按项目分类
  SqlStr := '';
  for I:= 0 to FItemNo do
  begin
    if I>0 then SqlStr := SqlStr + 'or';
    SqlStr := SqlStr + '(D_ZDBH="'+FKfxx[i].AZdbh+'")';
  end;
  SqlStr := 'select D_XMBH,sum(D_XFJE) from KRZD where (D_HH<>0) and ('+SqlStr+ ') group by D_XMBH';

  //过滤
  with qryYsk do
  begin
    Close;
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

    qryYsk.First;
    i := 1;
    while not qryYsk.Eof do
    begin
        tblYsk.Insert;
        tblYsk.FieldByName('D_KHBH').AsString   := FJzxx.AKhbh;
        tblYsk.FieldByName('D_ZDBH').AsString   := HotelData.GetBh('','');//qryKrzdD_ZDBH.Value;
        tblYsk.FieldByName('D_HH').AsInteger    := i;//qryKrzdD_HH.Value;
        tblYsk.FieldByName('D_XMBH').AsString   := qryYsk.FieldByName('D_XMBH').AsString;//qryKrzdD_XMBH.Value;
        tblYsk.FieldByName('D_XFDJ').AsCurrency := 0;//qryKrzdD_XFDJ.Value;
        tblYsk.FieldByName('D_XFSL').AsFloat    := 0;//qryKrzdD_XFSL.Value;
        tblYsk.FieldByName('D_XFJE').AsCurrency := qryYsk.FieldByName('SUM').AsCurrency;//qryKrzdD_XFJE.Value;
        tblYsk.FieldByName('D_XFRQ').AsDateTime := Date;//qryKrzdD_XFRQ.Value;
        tblYsk.FieldByName('D_XFSJ').AsDateTime := Time;//qryKrzdD_XFSJ.Value;
        tblYsk.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
        tblYsk.FieldByName('D_BZ').AsString     := ZDBZ_JZ+FJzfhs;//qryKrzdD_BZ.Value;
        tblYsk.Post;

      {if qryKrzdD_HH.Value <> 0 then
      begin
        tblYsk.Insert;
        tblYsk.FieldByName('D_KHBH').AsString   := FJzxx.AKhbh;
        tblYsk.FieldByName('D_ZDBH').AsString   := qryKrzdD_ZDBH.Value;
        tblYsk.FieldByName('D_HH').AsInteger    := qryKrzdD_HH.Value;
        tblYsk.FieldByName('D_XMBH').AsString   := qryKrzdD_XMBH.Value;
        tblYsk.FieldByName('D_XFDJ').AsCurrency := qryKrzdD_XFDJ.Value;
        tblYsk.FieldByName('D_XFSL').AsFloat    := qryKrzdD_XFSL.Value;
        tblYsk.FieldByName('D_XFJE').AsCurrency := qryKrzdD_XFJE.Value;
        tblYsk.FieldByName('D_XFRQ').AsDateTime := Date;//qryKrzdD_XFRQ.Value;
        tblYsk.FieldByName('D_XFSJ').AsDateTime := Time;//qryKrzdD_XFSJ.Value;
        tblYsk.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
        tblYsk.FieldByName('D_BZ').AsString     := qryKrzdD_BZ.Value;
        tblYsk.Post;
      end;}
      qryYsk.Next;
      Inc(i);
    end;
  finally
    tblYsk.Close;
  end;
end;

procedure TZdForm.AddYsk(const AKhbh,AZdbh,AXmbh: string;AHh: Integer;AXfje: Currency);
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

//结帐库中添加预交款 贵宾卡结帐
procedure TZdForm.AddYjk(AGbkJzxx: TGbkJzxx);
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
procedure TZdForm.btnOKClick(Sender: TObject);
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

    tblKrjzD_YHJE.OnValidate := nil;

    //事务启动
    HotelData.DatabaseUser.StartTransaction;
    try

      //贵宾卡结帐
      if (FJzxx.AJzfs=JZFS_GBK) then
      begin
        AGbkJzxx := CardXf(FSjje,True);
        if AGbkJzxx.AKcje = 0 then
          Exit;

        AddYjk(AGbkJzxx);

        //更新额外费，写入结帐库、额外费库中
        UpdateEwf;

        //更新客人帐单，包括当天房价、电话费、额外费、其他信息
        UpdateKrzd(JZBZ_SK+JZBZ_GBK+FJzfhs);

        //增加结帐库中的总单 行号=0
        UpdateKrjz;

        tblKrjz.ApplyUpdates;
        qryKrzd.ApplyUpdates;

        //更新客房状态、半全价
        UpdateKfzt;

        //更新客人信息的离店日期
        UpdateKrxx;

        //备份客人信息
        BakKrxx;

        //清空客人信息
        EmptyKrxx;

        //清空客人押金
        EmptyKryj;

        //备份客人帐单
        BakKrzd;
        //不清空客人帐单，夜审后再清空

      end;

      //人民币、支票、信用卡结帐
      if (FJzxx.AJzfs=JZFS_RMB)
        or(FJzxx.AJzfs=JZFS_ZP)
        or(FJzxx.AJzfs=JZFS_XYK) then
      begin

        //更新额外费，写入结帐库、额外费库中
        UpdateEwf;

        //更新客人帐单，包括当天房价、电话费、额外费、其他信息
        UpdateKrzd(JZBZ_SK+FJzxx.AJzfs+FJzfhs);

        //增加结帐库中的总单 行号=0
        UpdateKrjz;

        tblKrjz.ApplyUpdates;
        qryKrzd.ApplyUpdates;

        //更新客房状态、半全价
        UpdateKfzt;

        //更新客人信息的离店日期
        UpdateKrxx;

        //备份客人信息
        BakKrxx;

        //清空客人信息
        EmptyKrxx;

        //清空客人押金
        EmptyKryj;

        //备份客人帐单
        BakKrzd;
        //不清空客人帐单，夜审后再清空

        //EmptyKrzd;
      end;

      //挂散客、挂团队
      if (FJzxx.AJzfs=JZFS_GSK)or(FJzxx.AJzfs=JZFS_GTD) then
      begin
        //更新挂帐对象
        UpdateGz;

        //更新客房状态、半全价
        UpdateKfzt;

        //更新客人信息的离店日期
        UpdateKrxx;

        //备份客人信息
        BakKrxx;

        //清空客人信息
        EmptyKrxx;

        //清空客人押金
        EmptyKryj;

        //清空客人帐单
        EmptyKrzd;

        //挂帐时，取消结帐库中的记录
        tblKrjz.CancelUpdates;
      end;
      //未结帐
      if (FJzxx.AJzfs=JZFS_WJZ) then
      begin
        UpdateKrzd(JZBZ_WJZ+FJzfhs);
        qryKrzd.ApplyUpdates;
        UpdateKfzt;
        UpdateKrxx;
        tblKrjz.CancelUpdates;
        //BakKrxx;
        //EmptyKrxx;
        //BakKrzd;
        //EmptyKrzd;
      end;
      //客户记帐
      if (FJzxx.AJzfs=JZFS_JZ) then
      begin
        UpdateEwf;
        UpdateKrzd(ZDBZ_JZ+HotelData.FindMc('KHDA','D_KHBH','D_KHMC',FJzxx.AKhbh));

        //更新应收款
        qryKrzd.ApplyUpdates;
        UpdateYsk;
        UpdateKfzt;
        UpdateKrxx;
        BakKrxx;
        EmptyKrxx;
        EmptyKryj;
        BakKrzd;
        //EmptyKrzd;
        //客户记账，取消结帐库中的记录
        tblKrjz.CancelUpdates;
      end;
      UpdateBqj;
      UpdateXxdc;

      {if Confirm('是否打印帐单？') then
        btnPrintClick(nil);}

      //事务提交
      HotelData.DatabaseUser.Commit;
    except
      //事务回滚
      HotelData.DatabaseUser.Rollback;
      raise;
    end;
    //清除缓存
    tblKrjz.CancelUpdates;
    tblKrjz.CommitUpdates;

  finally
    tblKrjz.EnableControls;
  end;
  Close;
end;

//判断实结金额
procedure TZdForm.edtSjjeExit(Sender: TObject);
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

procedure TZdForm.btnPrintClick(Sender: TObject);
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

end.

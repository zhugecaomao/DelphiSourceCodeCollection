unit C_Yjsh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, DB, DBTables, C_Define,
  ComCtrls, DateUtils;

type
  TYjshForm = class(TStdJdForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    qryKfztsk: TQuery;
    qryKfzttd: TQuery;
    qryKrxxtd: TQuery;
    tblKrzd: TTable;
    qryZd: TQuery;
    tblYytj: TTable;
    qryJz: TQuery;
    tblYytjda: TTable;
    tblKrjz: TTable;
    tblKrjzda: TTable;
    tblXmdm: TTable;
    tblLkyskz: TTable;
    tblLkyskzda: TTable;
    qryLkyskz: TQuery;
    ProgressBar1: TProgressBar;
    tblSjtj: TTable;
    qryUser: TQuery;
    tblJzfltj: TTable;
    tblYssj: TTable;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FYsrq: string;
    FJryy: Currency;
    FJrsh: Currency;
    FJryh: Currency;
    FZrbyyy: Currency;
    FZrbyyh: Currency;
    FZrljyy: Currency;
    FZrljyh: Currency;
    FZrljsh: Currency;
    FZrljys: Currency;

    //FJjfj: Currency;
    //FYjfj: Currency;
    FSkfj: Currency;
    FTdfj: Currency;
    FWbfj: Currency;
    FFjze: Currency;
    FBqf : Currency;

    FSjcwe: Currency;
    FCtsje: Currency;
    FCtshe: Currency;
    FLkysk: Currency;
    FKhysk: Currency;
    FJrshyjk : Currency;
    FSjyjk: Currency;
    FDbf  : Currency;
    FYjkkc: Currency;

    FBmbh: string;

    FRpjj: Currency;
    FRpjzkl : Double;

    procedure OpenTable;
    procedure CloseTable;
    procedure UpdateFj;
    procedure AddSkfj(AKfxx: TKfxx);
    procedure AddTdfj;
    procedure UpdateKfztSk;
    procedure UpdateKfztTd;
    procedure UpdateKfzt;

    procedure UpdateKrzd;
    procedure EmptyKrzd;
    procedure UpdateKrjz;

    procedure InitYytj;
    procedure InitYytjRecord(const AXmbh: string);
    procedure UpdateYytj;

    procedure InitLkyskz;
    procedure UpdateLkyskz;

    procedure InitLctj;
    procedure UpdateLctj;

    procedure UpdateSjtj;
    procedure UpdateCwjs;

    procedure UpdateYjk;

    procedure UpdateJzfltj;

    function SumSjcwe: Currency;
    function SumCtsje: Currency;
    function SumCtshe: Currency;
    function SumLkysk: Currency;
    function SumKhysk: Currency;
    function SumJrshyjk : Currency;
    function SumSjyjk: Currency;

    //function GetJjfj: Currency;
    //function GetYjfj: Currency;
    function GetFjze: Currency;
    function GetYsrq: string;

    function IsCtjz: Boolean;

    procedure UpdateCy;
    procedure EmptyBqj;

    procedure BakData;
    procedure Backup;

    procedure SetYssj;
  public
    { Public declarations }
  end;

var
  YjshForm: TYjshForm;

procedure Yjsh;

implementation

uses C_HotelData;

{$R *.dfm}

procedure Yjsh;
begin
  YjshForm := TYjshForm.Create(Application);
  try
    with YjshForm do
    begin
      OpenTable;
      FYsrq := GetYsrq;
      if tblYytj.FindKey([FYsrq,'0']) then
      begin
        ShowWarning('你今天已经夜审过了！');
        Exit;
      end;
      //edit by ls 20021120
      if not IsCtjz then
      begin
        if not Confirm('餐厅可能尚有未结账的餐台，是否继续夜审！') then
        Exit;
      end;

      ShowModal;
    end;
  finally
    YjshForm.CloseTable;
    YjshForm.Free;
  end;
end;

procedure TYjshForm.SetYssj;
begin
  tblYssj.Open;
  if tblYssj.IsEmpty then
  begin
    tblYssj.Insert;
    tblYssj.FieldByName('D_YSSJ').AsString := FormatDateTime('hhnnss',Time);
    tblYssj.Post;
  end
  else
  begin
    tblYssj.Last;
    tblYssj.Edit;
    tblYssj.FieldByName('D_YSSJ').AsString := FormatDateTime('hhnnss',Time);
    tblYssj.Post;
  end;
  tblYssj.Close;
end;

procedure TYjshForm.UpdateYjk;
var
  s : string;
begin
  s := 'update YJK set D_YSRQ="'+FYsrq+'" where D_YSRQ is null';
  HotelData.ExecSql(s);
end;

function TYjshForm.IsCtjz: Boolean;
begin
  Result := True;
  with HotelData.qryUserData do
  begin
    if Active then Active := False;
    SQL.Clear;
    SQL.Add('select * from CTDC where D_JZFS is null');
    Open;
    if not IsEmpty then
      Result := False;
    Close;
  end;
end;

procedure TYjshForm.OpenTable;
begin
  try
    qryKfztSk.Open;
    qryKfztTd.Open;
    qryKrxxTd.Open;
    tblKrzd.Open;
    tblYytj.Open;
    tblXmdm.Open;

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

procedure TYjshForm.CloseTable;
begin
  qryKfztSk.Close;
  qryKfztTd.Close;
  qryKrxxTd.Close;
  tblKrzd.Close;
  tblYytj.Close;
  tblXmdm.Close;
end;

//初始化楼层统计
procedure TYjshForm.InitLctj;
begin
  with HotelData do
  begin
    //备份楼层统计
    BakTable(tblLctj,tblLctjda);
    //ExecSql('delete from LCTJ');

    try
      try
        tblLctj.Open;
        tblLcdm.Open;
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

      tblLcdm.First;
      while not tblLcdm.Eof do
      begin
        if not tblLctj.Locate('D_LCBH',tblLcdm.FieldByName('D_LCBH').AsString,[]) then
        begin
          tblLctj.Insert;
          tblLCtj.FieldByName('D_YSRQ').AsString := FYsrq;
          tblLctj.FieldByName('D_LCBH').AsString := tblLcdm.FieldByName('D_LCBH').AsString;
          tblLctj.Post;
        end
        else
        begin
          tblLctj.Edit;
          tblLctj.FieldByName('D_YSRQ').AsString := FYsrq;
          tblLctj.Post;
        end;
        tblLcdm.Next;
      end;
      if not tblLctj.Locate('D_LCBH','0',[]) then
      begin
        tblLctj.Insert;
        tblLCtj.FieldByName('D_YSRQ').AsString := FYsrq;
        tblLctj.FieldByName('D_LCBH').AsString := '0';
        tblLctj.Post;
      end
      else
      begin
        tblLctj.Edit;
        tblLctj.FieldByName('D_YSRQ').AsString := FYsrq;
        tblLctj.Post;
      end;
    finally
      tblLctj.Close;
      tblLcdm.Close;
    end;
  end;
end;

//楼层统计
procedure TYjshForm.UpdateLctj;
var
  SqlStr                     : string;
  SumFjs,SumBjs,SumQjs: Integer;
  SumCzs : Double;
  SumJjfj,SumFj: Currency;
begin
  SumFjs:=0;SumCzs:=0;SumBjs:=0;SumQjs:=0;SumJjfj:=0;SumFj:=0;

  with HotelData do
  begin
    try
      try
        tblLctj.Open;
        //edit by ls. 2003.03.27
        //SqlStr := 'select D_LCBH,count(*),sum(D_KRSL),sum(D_BJS),sum(D_QJS),sum(D_JJFJ),sum(D_SJFJ) from KFZT where D_KFZT<>"R" group by D_LCBH';
        SqlStr := 'select D_LCBH,count(*),sum(D_KRSL),sum(D_BJS),sum(D_QJS),sum(D_JJFJ),sum(D_SJFJ) from KFZT group by D_LCBH';
        if qrySysData.Active then qrySysData.Active := False;
        qrySysData.SQL.Clear;
        qrySysData.SQL.Add(SqlStr);
        qrySysData.Open;
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

      qrySysData.First;
      while not qrySysData.Eof do
      begin
        if tblLctj.FindKey([FYsrq,qrySysData.Fields[0].AsString]) then
        begin
          tblLctj.Edit;
          tblLctj.FieldByName('D_FJS').AsInteger   := qrySysData.Fields[1].AsInteger;
          tblLctj.FieldByName('D_CZS').AsFloat     := qrySysData.Fields[2].AsFloat+qrySysData.Fields[3].AsFloat*0.5+qrySysData.Fields[4].AsFloat;
          tblLctj.FieldByName('D_BJS').AsInteger   := qrySysData.Fields[3].AsInteger;
          tblLctj.FieldByName('D_QJS').AsInteger   := qrySysData.Fields[4].AsInteger;
          tblLctj.FieldByName('D_JJFJ').AsCurrency := qrySysData.Fields[5].AsCurrency+qrySysData.Fields[6].AsCurrency;
          tblLctj.FieldByName('D_RCZL').AsFloat    := tblLctj.FieldByName('D_CZS').AsFloat/qrySysData.Fields[1].AsInteger;

          SumFjs := SumFjs  + qrySysData.Fields[1].AsInteger;
          SumCzs := SumCzs  + tblLctj.FieldbyName('D_CZS').AsFloat;
          SumBjs := SumBjs  + qrySysData.Fields[3].AsInteger;
          SumQjs := SumQjs  + qrySysData.Fields[4].AsInteger;
          SumJjfj:= SumJjfj + qrySysData.Fields[5].AsCurrency;
          SumFj  := SumFj   + qrySysData.Fields[6].AsCurrency;

          tblLctj.Post;
        end;
        qrySysData.Next;
      end;

      if tblLctj.FindKey([FYsrq,'0']) then
      begin
        tblLctj.Edit;
        tblLctj.FieldByName('D_FJS').AsInteger   := SumFjs;
        tblLctj.FieldByName('D_CZS').AsFloat     := SumCzs;
        tblLctj.FieldByName('D_BJS').AsInteger   := SumBjs;
        tblLctj.FieldByName('D_QJS').AsInteger   := SumQjs;
        tblLctj.FieldByName('D_JJFJ').AsCurrency := SumJjfj+SumFj;
        //edit by ls.2002.11.02应盛总要求修改总房数为141
        tblLctj.FieldByName('D_RCZL').AsFloat    := SumCzs/141;
        //tblLctj.FieldByName('D_RCZL').AsFloat    := SumCzs/SumFjs;
        tblLctj.Post;
        if tblLctj.FieldByName('D_CZS').AsFloat <> 0 then
          FRpjj := tblLctj.FieldByName('D_JJFJ').AsCurrency / tblLctj.FieldByName('D_CZS').AsFloat
        else
          FRpjj := 0;
        FRpjzkl := tblLctj.FieldByName('D_RCZL').AsFloat;
        FBqf  := SumJjfj;
        FDbf  := SumCzs*2;
      end;

    finally
      tblLctj.Close;
      qrySysData.Close;
    end;
  end;
end;

//获取夜审日期
function TYjshForm.GetYsrq: string;
begin
  Result := FormatDateTime('yyyymmdd',Date);
end;

//初始化营业统计记录
procedure TYjshForm.InitYytjRecord(const AXmbh: string);
begin
  if tblYytj.Locate('D_XMBH',AXmbh,[]) then
  begin
    tblYytj.Edit;
    tblYytj.FieldByName('D_YSRQ').AsString   := FYsrq;
    tblYytj.FieldByName('D_JRYY').AsCurrency := 0;
    tblYytj.FieldByName('D_JRSH').AsCurrency := 0;
    tblYytj.FieldByName('D_JRYH').AsCurrency := 0;

    //如果是月初
    if Copy(FYsrq,7,2)='01' then
    begin
      tblYytj.FieldByName('D_ZRBYYY').AsCurrency := 0;
      tblYytj.FieldByName('D_ZRBYYH').AsCurrency := 0;
    end
    else
    begin
      tblYytj.FieldByName('D_ZRBYYY').AsCurrency := tblYytj.FieldByName('D_BYYY').AsCurrency;
      tblYytj.FieldByName('D_ZRBYYH').AsCurrency := tblYytj.FieldByName('D_BYYH').AsCurrency;
    end;

    tblYytj.FieldByName('D_ZRLJYY').AsCurrency := tblYytj.FieldByName('D_LJYY').AsCurrency;
    tblYytj.FieldByName('D_ZRLJYH').AsCurrency := tblYytj.FieldByName('D_LJYH').AsCurrency;
    tblYytj.FieldByName('D_ZRLJSH').AsCurrency := tblYytj.FieldByName('D_LJSH').AsCurrency;
    tblYytj.FieldByName('D_ZRLJYS').AsCurrency := tblYytj.FieldByName('D_LJYS').AsCurrency;
    tblYytj.Post;
  end
  else
  begin
    tblYytj.Insert;
    tblYytj.FieldByName('D_XMBH').AsString     := AXmbh;
    tblYytj.FieldByName('D_YSRQ').AsString     := FYsrq;
    tblYytj.FieldByName('D_JRYY').AsCurrency   := 0;
    tblYytj.FieldByName('D_JRSH').AsCurrency   := 0;
    tblYytj.FieldByName('D_JRYH').AsCurrency   := 0;
    tblYytj.FieldByName('D_ZRBYYY').AsCurrency := 0;
    tblYytj.FieldByName('D_ZRBYYH').AsCurrency := 0;
    tblYytj.FieldByName('D_ZRLJYY').AsCurrency := 0;
    tblYytj.FieldByName('D_ZRLJYH').AsCurrency := 0;
    tblYytj.FieldByName('D_ZRLJSH').AsCurrency := 0;
    tblYytj.FieldByName('D_ZRLJYS').AsCurrency := 0;
    tblYytj.FieldByName('D_BYYY').AsCurrency   := 0;
    tblYytj.FieldByName('D_BYYH').AsCurrency   := 0;
    tblYytj.FieldByName('D_LJYY').AsCurrency   := 0;
    tblYytj.FieldByName('D_LJYH').AsCurrency   := 0;
    tblYytj.FieldByName('D_LJSH').AsCurrency   := 0;
    tblYytj.FieldByName('D_LJYS').AsCurrency   := 0;
  end;
end;

//初始化营业统计
procedure TYjshForm.InitYytj;
var
  AXmbh: string;
begin
  //备份营业统计
  HotelData.BakTable(tblYytj,tblYytjda);

  tblXmdm.First;
  while not tblXmdm.Eof do
  begin
    AXmbh := tblXmdm.FieldByName('D_XMBH').AsString;
    //初始化消费项目记录
    InitYytjRecord(AXmbh);
    tblXmdm.Next;
  end;
  //初始化合计
  InitYytjRecord('0');

end;

//更新零客应收款
procedure TYjshForm.UpdateLkyskz;
var
  AXmbh: string;
  AXfje: Currency;
begin
  try
    try
      qryLkyskz.Open;
      tblLkyskz.Open;
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

    qryLkyskz.First;
    while not qryLkyskz.Eof do
    begin
      AXmbh := qryLkyskz.Fields[0].AsString;

      if qryLkyskz.Fields[1].IsNull then AXfje := 0
      else AXfje := qryLkyskz.Fields[1].AsCurrency;

      if tblLkyskz.FindKey([FYsrq,AXmbh]) then
      begin
        tblLkyskz.Edit;
        tblLkyskz.FieldByName('D_XFJE').AsCurrency :=
          tblLkyskz.FieldByName('D_XFJE').AsCurrency + AXfje;
        tblLkyskz.Post;
      end;

      qryLkyskz.Next;
    end;
  finally
    tblLkyskz.Close;
    qryLkyskz.Close;
  end;
end;

//初始化零客应收款
procedure TYjshForm.InitLkyskz;
var
  AXmbh: string;
begin
  try
    tblLkyskz.Open;
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

  //备份
  HotelData.BakTable(tblLkyskz,tblLkyskzda);

  tblXmdm.First;
  while not tblXmdm.Eof do
  begin
    AXmbh := tblXmdm.FieldByName('D_XMBH').AsString;
    if tblLkyskz.Locate('D_XMBH',AXmbh,[]) then
    begin
      tblLkyskz.Edit;
      tblLkyskz.FieldByName('D_YSRQ').AsString   := FYsrq;
      tblLkyskz.FieldByName('D_XFJE').AsCurrency := 0;
      tblLkyskz.FieldByName('D_YJJE').AsCurrency := 0;
      tblLkyskz.Post;
    end
    else
    begin
      tblLkyskz.Insert;
      tblLkyskz.FieldByName('D_YSRQ').AsString   := FYsrq;
      tblLkyskz.FieldByName('D_XMBH').AsString   := AXmbh;
      tblLkyskz.FieldByName('D_XFJE').AsCurrency := 0;
      tblLkyskz.FieldByName('D_YJJE').AsCurrency := 0;
      tblLkyskz.Post;
    end;
    tblXmdm.Next;
  end;

  tblLkyskz.Close;
end;

//清空客人帐单
procedure TYjshForm.EmptyKrzd;
var
  s : string;
begin
  s := 'delete from KRZD where D_JSBZ="'+JS_YES+'"';
  HotelData.EmptyData(s);
end;

//更新客人帐单 写入夜审日期
procedure TYjshForm.UpdateKrzd;
var
  s : string;
begin
  s := 'update KRZD set D_YSRQ="'+FYsrq+'"';
  HotelData.ExecSql(s);
end;

//营业统计
procedure TYjshForm.UpdateYytj;
var
  AXmbh,s                                        : string;
  AJryy,AJrsh,AJryh                              : Currency;
  AZrbyyy,AZrbyyh,AZrljyy,AZrljyh,AZrljsh,AZrljys: Currency;
  AByyyda,AByyy: Currency;
  ARq: string;
begin
  FJrsh := 0;
  FJryh := 0;
  s := 'select sum(D_XFJE) from KRJZ where (D_XMBH="'+XMBH_YJK+'")and(D_XFJE<0)';
  FYjkkc := 0-HotelData.SumJe(s);
  try
    try
      qryZd.Close;
      qryZd.SQL.Clear;
      s := 'select D_XMBH,sum(D_XFJE) from KRZD where (D_HH<>0)and(D_XMBH<>"'
           +XMBH_FJ+'")and(D_XMBH<>"'+XMBH_YJK+'")and(D_JZBZ<>"'+JZ_YX+'")and(D_YSRQ is null) group by D_XMBH';
      qryZd.SQL.Add(s);
      qryZd.Open;

      qryJz.Close;
      qryJz.SQL.Clear;
      s := 'select D_XMBH,sum(D_XFJE),sum(D_YHJE) from KRJZ where(D_HH<>0) group by D_XMBH';
      qryJz.SQL.Add(s);
      qryJz.Open;
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

    tblXmdm.First;
    while not tblXmdm.Eof do
    begin
      AXmbh := tblXmdm.FieldByName('D_XMBH').AsString;

      AJryy := 0;
      AJrsh := 0;
      AJryh := 0;

      if tblYytj.FindKey([FYsrq,AXmbh]) then
      begin
        tblYytj.Edit;

        //今日营业
        //房金
        if AXmbh=XMBH_FJ then
          //AJryy := FJjfj+FSkfj+FTdfj+FYjfj
          AJryy := FFjze
        else
        if qryZd.Locate('D_XMBH',AXmbh,[]) then
        begin
          if qryZd.Fields[1].IsNull then AJryy := 0
          else AJryy := qryZd.Fields[1].AsCurrency;
        end;

        //今日优惠、今日收回
        if qryJz.Locate('D_XMBH',AXmbh,[]) then
        begin
          if qryJz.Fields[2].IsNull then AJryh := 0
          else AJryh := qryJz.Fields[2].AsCurrency;

          if qryJz.Fields[1].IsNull then AJrsh := 0 - AJryh
          else AJrsh := qryJz.Fields[1].AsCurrency - AJryh;
        end;

        AZrbyyy := tblYytj.FieldByName('D_ZRBYYY').AsCurrency;
        AZrbyyh := tblYytj.FieldByName('D_ZRBYYH').AsCurrency;
        AZrljyy := tblYytj.FieldByName('D_ZRLJYY').AsCurrency;
        AZrljyh := tblYytj.FieldByName('D_ZRLJYH').AsCurrency;
        AZrljsh := tblYytj.FieldByName('D_ZRLJSH').AsCurrency;
        AZrljys := tblYytj.FieldByName('D_ZRLJYS').AsCurrency;

        tblYytj.FieldByName('D_JRYY').AsCurrency :=
          tblYytj.FieldByName('D_JRYY').AsCurrency+AJryy;
        tblYytj.FieldByName('D_JRSH').AsCurrency :=
          tblYytj.FieldByName('D_JRSH').AsCurrency + AJrsh;
        tblYytj.FieldByName('D_JRYH').AsCurrency :=
          tblYytj.FieldByName('D_JRYH').AsCurrency + AJryh;

        tblYytj.FieldByName('D_BYYY').AsCurrency := AJryy + AZrbyyy;
        tblYytj.FieldByName('D_BYYH').AsCurrency := AJryh + AZrbyyh;
        tblYytj.FieldByName('D_LJYY').AsCurrency := AJryy + AZrljyy;
        tblYytj.FieldByName('D_LJYH').AsCurrency := AJryh + AZrljyh;
        tblYytj.FieldByName('D_LJSH').AsCurrency := AJrsh + AZrljsh;
        tblYytj.FieldByName('D_LJYS').AsCurrency := AJryy-AJrsh-AJryh+AZrljys;

        FJryy := FJryy + AJryy;
        FJrsh := FJrsh + AJrsh;
        FJryh := FJryh + AJryh;

        tblYytj.Post;
      end;
      tblXmdm.Next;
    end;

    //全部营业
    if tblYytj.FindKey([FYsrq,'0']) then
    begin

      FZrbyyy := tblYytj.FieldByName('D_ZRBYYY').AsCurrency;
      FZrbyyh := tblYytj.FieldByName('D_ZRBYYH').AsCurrency;
      FZrljyy := tblYytj.FieldByName('D_ZRLJYY').AsCurrency;
      FZrljyh := tblYytj.FieldByName('D_ZRLJYH').AsCurrency;
      FZrljsh := tblYytj.FieldByName('D_ZRLJSH').AsCurrency;
      FZrljys := tblYytj.FieldByName('D_ZRLJYS').AsCurrency;

      tblYytj.Edit;
      tblYytj.FieldByName('D_JRYY').AsCurrency :=
        tblYytj.FieldByName('D_JRYY').AsCurrency + FJryy;
      tblYytj.FieldByName('D_JRSH').AsCurrency :=
        tblYytj.FieldByName('D_JRSH').AsCurrency + FJrsh;
      tblYytj.FieldByName('D_JRYH').AsCurrency :=
        tblYytj.FieldByName('D_JRYH').AsCurrency + FJryh;

      tblYytj.FieldByName('D_BYYY').AsCurrency := FJryy + FZrbyyy;
      tblYytj.FieldByName('D_BYYH').AsCurrency := FJryh + FZrbyyh;
      tblYytj.FieldByName('D_LJYY').AsCurrency := FJryy + FZrljyy;
      tblYytj.FieldByName('D_LJYH').AsCurrency := FJryh + FZrljyh;
      tblYytj.FieldByName('D_LJSH').AsCurrency := FJrsh + FZrljsh;
      //tblYytj.FieldByName('D_LJYS').AsCurrency := FJryy-FJrsh-FJryh+FZrljys-FSjcwe;
      tblYytj.FieldByName('D_LJYS').AsCurrency := FJryy-FJryh+FZrljys-FSjcwe;
      tblYytj.Post;
    end;
    //同期相比
    ARq := FormatDateTime('yyyymmdd',IncDay(Date,-30));
    tblYytj.First;
    while not tblYytj.Eof do
    begin
      s := 'select D_BYYY from YYTJDA where (D_YSRQ="'+ARq+'")and(D_XMBH="'+tblYytj.FieldByName('D_XMBH').AsString+'")';
      with HotelData.qryUserData do
      begin
        Close;
        SQL.Clear;
        SQL.Add(s);
        Open;
        if Fields[0].IsNull then AByyyda := 0
        else AByyyda := Fields[0].AsCurrency;
        Close;
      end;
      AByyy := tblYytj.FieldByName('D_BYYY').AsCurrency;
      tblYytj.Edit;
      if AByyyda<>0 then
        tblYytj.FieldByName('D_SYTQB').AsFloat := (AByyy-AByyyda)/AByyyda
      else
        tblYytj.FieldByName('D_SYTQB').AsFloat := 0;
      tblYytj.Post;
      tblYytj.Next;
    end;

  finally
    qryJz.Close;
    qryZd.Close;
  end;
end;
//获取房金总额
function TYjshForm.GetFjze: Currency;
var
  s : string;
  aZe,aJe: Double;
begin
  //edit by ls.2002.11.02
  s := 'select sum(D_JJFJ+D_SJFJ) from KFZT';
  //s := 'select sum(D_JJFJ+D_SJFJ) from BQJ';
  aJe := HotelData.SumJe(s);
  aZe := aJe;
  //edit by ls.2003.05.22
  s := 'select sum(D_XFJE) from KRZD where (D_BZ like "%杂单录入%")and(D_YSRQ is null)and(D_XMBH="'+XMBH_FJ+'")';
  aJe := HotelData.SumJe(s);
  aZe := aZe + aJe;
  s := 'select sum(D_XFJE) from KRZD where (D_ZDLB="'+ZDLB_FYK+'")and(D_YSRQ is null)and(D_XMBH="'+XMBH_FJ+'")';
  aJe := HotelData.SumJe(s);
  aZe := aZe + aJe;

  Result := aZe;
end;
{
//获取当天的间接房价
function TYjshForm.GetJjfj: Currency;
var
  s: string;
begin
  s := 'select sum(D_JJFJ) from KFZT where D_KFBZ="'+KFBZ_FT+'"';
  Result := HotelData.SumSysJe(s);
end;
}
{
//获取已经结算但是没有夜审的房价
function TYjshForm.GetYjfj: Currency;
var
  s: string;
begin
  //edit by ls. 20020824 d_xfje>0 不统计预先结帐的房价
  s := 'select sum(D_XFJE) from KRZD where ((D_JSBZ="'
      +JS_YES+'") or (D_JSBZ="'
      +JS_WJ +'") or (D_JZBZ="'
      +JZ_YES+'"))and(D_JZBZ<>"'+JZ_YX+'")and(D_YSRQ is null)and(D_XMBH="'
      +XMBH_FJ+'")';
  Result := HotelData.SumJe(s);
end;
}
//累加散客房价、电话费
procedure TYjshForm.AddSkfj(AKfxx: TKfxx);
var
  ADhf: Currency;
begin

  ADhf := HotelData.GetDhf1(AKfxx.AKfbh,AKfxx.ADdrq,AKfxx.ADdsj);

  HotelData.InsertKrzd(AKfxx.AZdbh,AKfxx.AZdlb,AKfxx.AKrbh,AKfxx.AYjbh,
                       AKfxx.AKfbh,XMBH_FJ,JZ_NO,JS_NO,FBmbh,
                       ZDBZ_SK+AKfxx.AKfbh,AKfxx.AZdhh,AKfxx.ASjfj,0);

  if ADhf <> 0 then
    HotelData.InsertKrzd(AKfxx.AZdbh,AKfxx.AZdlb,AKfxx.AKrbh,AKfxx.AYjbh,
                         AKfxx.AKfbh,XMBH_DHF,JZ_NO,JS_NO,FBmbh,
                         ZDBZ_SK+AKfxx.AKfbh,AKfxx.AZdhh+1,ADhf,0);

  //修改总单
  HotelData.AddKrzdZdXfje(AKfxx.AZdbh,AKfxx.ASjfj+ADhf);

end;

//累加团队房价、电话费
procedure TYjshForm.AddTdfj;
var
  AKrbh,s : string;
  AFjTotal: Currency;
  ASjfj   : Currency;
  ADhf,ADhfTotal : Currency;
  AKfbh   : string;
  ADdrq,ADdsj: TDateTime;
  ATdxx : TTdxx;
  AHh   : Integer;
begin

  AFjTotal := 0;
  ADhfToTal := 0;
  qryKrxxtd.First;
  while not qryKrxxtd.Eof do
  begin
    AKrbh := qryKrxxtd.FieldByName('D_KRBH').AsString;
    ATdxx := HotelData.GetTdxx(AKrbh);

    qryZd.Close;
    qryZd.SQL.Clear;
    s := 'select * from KRZD where (D_KRBH="'+AKrbh+'")and(D_XMBH="'+XMBH_FJ+'")and(D_JZBZ="'+JZ_NO+'")and(D_SJFJ<>0)';
    qryZd.SQL.Add(s);
    qryZd.Open;
    qryZd.First;
    AHh := 0;
    while not qryZd.Eof do
    begin
      ASjfj := qryZd.FieldByName('D_SJFJ').AsCurrency;
      AKfbh := qryZd.FieldByName('D_KFBH').AsString;
      ADdrq := qryZd.FieldByName('D_XFRQ').AsDateTime;
      ADdsj := qryZd.FieldByName('D_XFSJ').AsDateTime;
      ADhf  := HotelData.GetDhf1(AKfbh,ADdrq,ADdsj);
      //插入电话费
      if ADhf<>0 then
      begin
        HotelData.InsertKrzd(ATdxx.AZdbh,ZDLB_TD,ATdxx.AKrbh,ATdxx.AYjbh,
                             '',XMBH_DHF,JZ_NO,JS_NO,FBmbh,
                             ZDBZ_TD+ATdxx.AKrxm,ATdxx.AZdhh+AHh,ADhf,0);
        Inc(AHh);
      end;
      ADhfTotal := ADhfTotal + ADhf;
      AFjTotal  := AFjTotal + ASjfj;
      qryZd.Next;
    end;
    qryZd.Close;

    //累加所有房价
    s := 'update KRZD set D_XFJE=D_XFJE+D_SJFJ where (D_KRBH="'+AKrbh+'")and(D_XMBH="'+XMBH_FJ+'")and(D_JZBZ="'+JZ_NO+'")and(D_SJFJ<>0)';
    HotelData.ExecSql(s);

    //修改总单
    HotelData.AddKrzdZdXfje(ATdxx.AZdbh,AFjToTal+ADhfToTal);
    qryKrxxtd.Next;
  end;

  FTdfj := AFjTotal;
end;

//更新散客的客房状态
procedure TYjshForm.UpdateKfztSk;
var
  AKfxx: TKfxx;
  s : string;
begin
  FSkfj := 0;

  qryKfztsk.First;
  while not qryKfztsk.Eof do
  begin
    //获取客房信息
    AKfxx := HotelData.GetKfxx(qryKfztsk.FieldByName('D_KFBH').AsString);

    //累加散客房价
    AddSkfj(AKfxx);

    //累计散客房价
    FSkfj := FSkfj + AKfxx.ASjfj;

    qryKfztsk.Next;
  end;
  //修改客房状态
  //s := 'update KFZT set D_KFBZ="'+KFBZ_FT+'",D_JJFJ=0,D_BJS=0,D_QJS=0 where D_KFZT="'+KFZT_BF+'"';
  s := 'update KFZT set D_KFBZ="'+KFBZ_FT+'" where D_KFZT="'+KFZT_BF+'"';
  HotelData.ExecSql(s);
end;

//更新团队客房状态
procedure TYjshForm.UpdateKfztTd;
var
  s : string;
begin
  //s := 'update KFZT set D_KFBZ="'+KFBZ_FT+'",D_JJFJ=0,D_BJS=0,D_QJS=0 where D_KFZT="'+KFZT_TD+'"';
  s := 'update KFZT set D_KFBZ="'+KFBZ_FT+'" where D_KFZT="'+KFZT_TD+'"';
  HotelData.ExecSql(s);
end;

//更新客房状态 间接房价=0；半全价数=0
procedure TYjshForm.UpdateKfzt;
var
  s : string;
begin
  s := 'update KFZT set D_JJFJ=0,D_QJS=0,D_BJS=0 where D_JJFJ<>0';
  HotelData.ExecSql(s);
end;

//房金滚帐
procedure TYjshForm.UpdateFj;
var
  s : string;
begin

  FFjze := GetFjze;
  //更新散客客房状态 累加房金
  UpdateKfztSk;

  //更新团队客房状态
  UpdateKfzttd;

  //累加团队房价
  AddTdfj;
  //edit by ls.2002.11.02
  //更新客房状态
  //UpdateKfzt;

  //FFjze := FJjfj+FSkfj+FTdfj+FYjfj;
  s := 'select sum(D_XFJE) from KRZD where (D_YSRQ is null)and(D_XMBH="'+XMBH_FJ+'")and (D_KRBH in (select D_KRBH from KRXX where D_KRLX="'+KRLX_WB+'"))';
  FWbfj := HotelData.SumJe(s);
end;

//更新结帐库
procedure TYjshForm.UpdateKrjz;
var
  s : string;
begin
  s := 'update KRJZ set D_YSRQ="'+FYsrq+'"';
  HotelData.ExecSql(s);
  //备份
  tblKrjz.Open;
  HotelData.BakTable(tblKrjz,tblKrjzda);
  tblKrjz.Close;
  //清空
  s := 'delete from KRJZ';
  HotelData.ExecSql(s);
end;

function TYjshForm.SumJrshyjk: Currency;
var
  s : string;
begin
  s := 'select sum(D_RMB+D_XYK+D_ZP) from YJK where (D_YSRQ is null)and(D_YJLX<>"'+YJLX_SJ+'")';
  Result := HotelData.SumJe(s);
end;

function TYjshForm.SumSjyjk: Currency;
var
  s : string;
begin
  s := 'select sum(D_RMB+D_XYK+D_ZP) from CWJS where (D_JSLX="'
      +JSLX_YJSJ+'")and(D_YSRQ is null)';
  Result := HotelData.SumJe(s);
end;

function TYjshForm.SumSjcwe: Currency;
var
  s: string;
begin
  s := 'select sum(D_RMB+D_XYK+D_ZP) from CWJS where (D_JSLX="'
      +JSLX_CWSJ+'")and(D_YSRQ is null)';
  Result := HotelData.SumJe(s);
end;

function TYjshForm.SumCtsje: Currency;
var
  s: string;
begin
  s := 'select sum(D_RMB+D_XYK+D_ZP) from CWJS where (D_JSLX="'
      +JSLX_CTSJ+'")and(D_YSRQ is null)';
  Result := HotelData.SumJe(s);
end;

function TYjshForm.SumCtshe: Currency;
var
  s,ABmbh: string;
begin
  ABmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);
  s := 'select sum(D_XFJE-D_YHJE) from KRJZ where (D_XMBH="'
    +XMBH_CF+'")and(D_HH<>0)and(D_BMBH<>"'+ABmbh+'")';
  {s := 'select sum(D_XFJE) from KRJZ where (D_XMBH="'
    +XMBH_CF+'")and(D_BMBH<>"'+ABmbh+'")';}
  Result := HotelData.SumJe(s);
end;

function TYjshForm.SumLkysk: Currency;
begin
  //统计零客应收款
  //Result := HotelData.SumJe('select sum(D_XFJE-D_YHJE) from LKYSKZ');
  Result := HotelData.SumJe('select sum(D_XFJE-D_YHJE) from KRZD where (D_HH<>0)and(D_JSBZ<>"2")');
end;

function TYjshForm.SumKhysk: Currency;
begin
  //统计记帐应收款?????是否要统计预交款
  Result := HotelData.SumJe('select sum(D_XFJE) from YSK');
  //Result := HotelData.SumJe('select sum(D_XFJE) from YSK where D_XMBH<>"'+XMBH_YJK+'"');
end;

//更新上交统计
procedure TYjshForm.UpdateSjtj;
var
  AFpe,ACtfpe,AYjkye: Currency;
  ATs : Integer;
  ARpjj : Currency;
  ARpjzkl: Double;
  s : string;
begin
  s := 'select count(*),sum(D_RPJJ),sum(D_RPJCZL) from SJTJ where D_YSRQ like "'+Copy(FYsrq,1,6)+'%"';
  with HotelData.qryUserData do
  begin
    Close;
    SQL.Clear;
    SQL.Add(s);
    Open;
    if Fields[0].IsNull then ATs := 0
    else ATs := Fields[0].AsInteger;
    if Fields[1].IsNull then ARpjj := 0
    else ARpjj := Fields[1].AsCurrency;
    if Fields[2].IsNull then ARpjzkl := 0
    else ARpjzkl := Fields[2].AsFloat;
    Close;
  end;

  try
    try
      tblSjtj.Open;
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

    tblSjtj.Last;
    AFpe  := tblSjtj.FieldbyName('D_FPE').AsCurrency;
    ACtfpe:= tblSjtj.FieldByName('D_CTFPE').AsCurrency;
    AYjkye := tblSjtj.FieldByName('D_YJKYE').AsCurrency;

    tblSjtj.Insert;
    tblSjtj.FieldByName('D_YSRQ').AsString    := FYsrq;
    tblSjtj.FieldByName('D_FPE').AsCurrency   := AFpe + FJrsh - FSjcwe;
    tblSjtj.FieldByName('D_CWSJE').AsCurrency := FSjcwe;
    tblSjtj.FieldByName('D_CTFPE').AsCurrency := ACtfpe + FCtshe - FCtsje;
    tblSjtj.FieldByName('D_LKYSK').AsCurrency := FLkysk;
    tblSjtj.FieldByName('D_KHYSK').AsCurrency := FKhysk;
    tblSjtj.FieldByName('D_CTSHE').AsCurrency := FCtshe;
    tblSjtj.FieldByName('D_CTSJE').AsCurrency := FCtsje;
    //今日收回预交款
    tblSjtj.FieldByName('D_YJKSH').AsCurrency := FJrshyjk;
    tblSjtj.FieldByName('D_YJKSJ').AsCurrency := FSjyjk;
    tblSjtj.FieldByName('D_YJKYE').AsCurrency := AYjkye+FJrshyjk-FSjyjk;
    tblSjtj.FieldByName('D_YJKKC').AsCurrency := FYjkkc;

    tblSjtj.FieldByName('D_RPJJ').AsCurrency := FRpjj;
    tblSjtj.FieldByName('D_YPJJ').AsCurrency := (FRpjj+ARpjj)/(ATs+1);
    tblSjtj.FieldByName('D_RPJCZL').AsFloat  := FRpjzkl;
    tblSjtj.FieldByName('D_YPJCZL').AsFloat  := (FRpjzkl+ARpjzkl)/(ATs+1);
    tblSjtj.FieldByName('D_WBFF').AsCurrency := FWbfj;
    tblSjtj.FieldByName('D_NBFF').AsCurrency := FFjze-FWbfj;
    tblSjtj.FieldByName('D_BQF').AsCurrency  := FBqf;
    tblSjtj.FieldByName('D_DBF').AsCurrency  := FDbf;

    tblSjtj.Post;
  finally
    tblSjtj.Close;
  end;
end;

//更新财务结算、餐厅上交
procedure TYjshForm.UpdateCwjs;
var
  s : string;
begin
  s := 'update CWJS set D_YSRQ="'+FYsrq+'" where D_YSRQ is null';
  HotelData.ExecSql(s);
end;

//更新结帐分类统计
procedure TYjshForm.UpdateJzfltj;
var
  s: string;
begin
  try
    tblJzfltj.Open;
    s := 'select D_JZFS,D_XMBH,sum(D_XFJE),sum(D_YHJE)'
        +' from KRJZ where (D_HH<>0)and(D_XMBH<>"'+XMBH_YJK+'") group by D_JZFS,D_XMBH';
    qryUser.Close;
    qryUser.SQL.Clear;
    qryUser.SQL.Add(s);
    qryUser.Open;
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

  qryUser.First;
  while not qryUser.Eof do
  begin
    if qryUser.Fields[0].AsString <> '' then
    begin
      tblJzfltj.Insert;
      tblJzfltj.FieldByName('D_YSRQ').AsString := FYsrq;
      tblJzfltj.FieldByName('D_JZFS').AsString := qryUser.Fields[0].AsString;
      tblJzfltj.FieldByName('D_XMBH').AsString := qryUser.Fields[1].AsString;
      tblJzfltj.FieldByName('D_SH').AsCurrency := qryUser.Fields[2].AsCurrency-qryUser.Fields[3].AsCurrency;
      tblJzfltj.FieldByName('D_YH').AsCurrency := qryUser.Fields[3].AsCurrency;
      tblJzfltj.Post;
    end;
    qryUser.Next;
  end;
  tblJzfltj.Close;
end;

//更新餐饮   ???????
procedure TYjshForm.UpdateCy;
begin
  with HotelData do
  begin
    try
      BakTable(tblCtdc,tblCtdcda);
      //BakTable(tblDcmx,tblDcmxda);
      BatchMove1.Mode:= batAppend;
      BatchMove1.Source:= tblDcmx;
      BatchMove1.Destination:= tblDcmxda;
      BatchMove1.Execute;

    finally
      EmptyData('delete from CTDC');
      EmptyData('delete from DCMX');
    end;
  end;
end;

procedure TYjshForm.BakData;//夜审前备份
var
  DDir,SDir : string;
begin
  //用户数据
  SDir := DBF_Dir;
  DDir := BAK_Dir + '\BakData';
  if DirectoryExists(SDir) then
    CopyDir(SDir,DDir);

  //系统数据
  {SDir := App_Dir + 'DataBase\SysData';
  DDir := App_Dir + 'DataBase\BakData\SysData';
  if DirectoryExists(SDir) then
    CopyDir(SDir,DDir);}
end;

procedure TYjshForm.Backup;//夜审后备份
var
  DDir,SDir : string;
begin
  //用户数据
  SDir := DBF_Dir;
  DDir := BAK_Dir + '\Backup';
  if DirectoryExists(SDir) then
    CopyDir(SDir,DDir);

  //系统数据
  {SDir := App_Dir + 'DataBase\SysData';
  DDir := App_Dir + 'DataBase\Backup\SysData';
  if DirectoryExists(SDir) then
    CopyDir(SDir,DDir);}
end;

//清空半全价
procedure TYjshForm.EmptyBqj;
begin
  //edit by ls. 20020825
  HotelData.ExecSql('update BQJ set D_BJS=0,D_QJS=0,D_BJ="",D_QJ="",D_JJFJ=0');
  HotelData.EmptyData('delete from BQJ where D_SJFJ=0');
end;

//开始夜审
procedure TYjshForm.btnOKClick(Sender: TObject);
begin
  inherited;
  //获得部门编号
  FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);
  if not FileExists(JF_DIR+'DHFDATA.DBF') then
  begin
    ShowMessage('找不到电话费数据库'+JF_DIR+'DHFDATA.DBF,你不能夜审,请检查网络是否正常。');
    Exit;
  end;
  //备份夜审前的数据
  //BakData;

  HotelData.DatabaseUser.StartTransaction;
  try
    ProgressBar1.Position := 5;

    //获取当天房金的间接价
    //FJjfj := GetJjfj;

    //获取已经结算但未夜审的房价
    //FYjfj := GetYjfj;

    //房金滚帐 FSkfj FTdfj
    UpdateFj;

    ProgressBar1.Position := 20;

    //上交财务
    FSjcwe := SumSjcwe;
    FSjyjk := SumSjyjk;
    FJrshyjk := SumJrshyjk;
    //楼层统计
    //初始化
    InitLctj;
    UpdateLctj;



    //统计今日营业
    //初始化
    InitYytj;
    //统计
    UpdateYytj;

    ProgressBar1.Position := 40;

    //更新客房状态
    UpdateKfzt;

    ProgressBar1.Position := 60;
    //写入夜审日期
    UpdateKrzd;

    //更新结帐分类统计
    UpdateJzfltj;

    ProgressBar1.Position := 80;

    //获取餐厅收回金额
    FCtshe := SumCtshe;

    //清空已结算的客人帐单
    EmptyKrzd;

    //写入夜审日期，备份并请空
    UpdateKrjz;

    //餐厅上交
    FCtsje := SumCtsje;
    //零客应收
    FLkysk := SumLkysk;
    //客户应收款
    FKhysk := SumKhysk;

    //统计零客应收款
    InitLkyskz;
    UpdateLkyskz;

    //更新上交统计
    UpdateSjtj;

    //更新财务上交、餐厅上交
    UpdateCwjs;

    //更新预交款
    UpdateYjk;
    //清空半全价库
    EmptyBqj;

    //更新餐饮
    UpdateCy;

    if IS_EMPTYDHF then
    begin
      //备份电话费
      HotelData.BakDhf;

      //清空当前电话费
      HotelData.EmptyDhf;
    end;

    //设置夜审时间
    SetYssj;

    ProgressBar1.Position := 100;

    HotelData.DatabaseUser.Commit;
  except
    HotelData.DatabaseUser.Rollback;
    raise;
  end;

  //备份夜审后的数据
  //Backup;

  Close;
end;

end.

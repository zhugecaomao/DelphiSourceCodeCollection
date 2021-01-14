{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_Tdjd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, DB, DBTables, C_Define,
  DBCtrls, Mask, Grids, ValEdit, DBGrids;

type
  TKf = record
    AKfbh: string;
    ASjfj: Currency;
    AJjfj: Currency;
  end;

type
  TTdjdForm = class(TStdJdForm)
    tblKrzd: TTable;
    dsKrzd: TDataSource;
    tblKrxx: TTable;
    dsKrxx: TDataSource;
    tblKryj: TTable;
    dsKryj: TDataSource;
    Label24: TLabel;
    Label25: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    lblYfje: TLabel;
    dbeKrxm: TDBEdit;
    dbcFkfs: TDBComboBox;
    dbeYfje: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dbeDdrq: TDBEdit;
    dbeDdsj: TDBEdit;
    Label17: TLabel;
    dbeJdr: TDBEdit;
    Label1: TLabel;
    dbeJddw: TDBEdit;
    Label2: TLabel;
    dbeDwdz: TDBEdit;
    Label3: TLabel;
    dbeLxdh: TDBEdit;
    Label11: TLabel;
    dbeBz: TDBEdit;
    Label12: TLabel;
    dbeQdr1: TDBEdit;
    Label13: TLabel;
    dbeQdr2: TDBEdit;
    Label14: TLabel;
    dbeQdr3: TDBEdit;
    Label15: TLabel;
    dbeQdr4: TDBEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    lblBfh: TLabeledEdit;
    lblEfh: TLabeledEdit;
    lblFj: TLabeledEdit;
    btnInsert: TBitBtn;
    vleKf: TValueListEditor;
    dbcCzyxm: TDBComboBox;
    dbcJzyxm: TDBComboBox;
    dbcXykbh: TDBComboBox;
    dbcKhbh: TDBComboBox;
    lblMc: TLabel;
    lblInfo: TLabel;
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
    tblKrxxD_KRBH: TStringField;
    tblKrxxD_KRXM: TStringField;
    tblKrxxD_KRLX: TStringField;
    tblKrxxD_DDRQ: TDateTimeField;
    tblKrxxD_DDSJ: TDateTimeField;
    tblKrxxD_LDRQ: TDateTimeField;
    tblKrxxD_LDSJ: TDateTimeField;
    tblKrxxD_YWX: TStringField;
    tblKrxxD_YWM: TStringField;
    tblKrxxD_XB: TStringField;
    tblKrxxD_MZBH: TStringField;
    tblKrxxD_DQBH: TStringField;
    tblKrxxD_GBBH: TStringField;
    tblKrxxD_NZTS: TIntegerField;
    tblKrxxD_TLSY: TStringField;
    tblKrxxD_ZJBH: TStringField;
    tblKrxxD_ZJHM: TStringField;
    tblKrxxD_CSNY: TDateTimeField;
    tblKrxxD_HCL: TStringField;
    tblKrxxD_HCQ: TStringField;
    tblKrxxD_QZBH: TStringField;
    tblKrxxD_QZYXQ: TDateTimeField;
    tblKrxxD_ZY: TStringField;
    tblKrxxD_LXDH: TStringField;
    tblKrxxD_DWMC: TStringField;
    tblKrxxD_JTDZ: TStringField;
    tblKrxxD_JDR: TStringField;
    tblKrxxD_JDDW: TStringField;
    tblKrxxD_BZ: TStringField;
    tblKryjD_YJBH: TStringField;
    tblKryjD_HH: TIntegerField;
    tblKryjD_FKFS: TStringField;
    tblKryjD_XYKBH: TStringField;
    tblKryjD_KHBH: TStringField;
    tblKryjD_YFJE: TFloatField;
    tblKryjD_YFRQ: TDateTimeField;
    tblKryjD_YFSJ: TDateTimeField;
    tblKryjD_BZ: TStringField;
    tblKrxxD_QDR1: TStringField;
    tblKrxxD_QDR2: TStringField;
    tblKrxxD_QDR3: TStringField;
    tblKrxxD_QDR4: TStringField;
    tblKrzdD_BMBH: TStringField;
    procedure tblKrzdBeforeOpen(DataSet: TDataSet);
    procedure tblKrzdBeforeClose(DataSet: TDataSet);
    procedure tblKrzdNewRecord(DataSet: TDataSet);
    procedure tblKrzdBeforePost(DataSet: TDataSet);
    procedure tblKrzdAfterCancel(DataSet: TDataSet);
    procedure tblKrxxNewRecord(DataSet: TDataSet);
    procedure tblKryjNewRecord(DataSet: TDataSet);
    procedure btnCancClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure tblKryjD_YFJEValidate(Sender: TField);
    procedure tblKryjD_FKFSChange(Sender: TField);
    procedure tblKrzdD_CZYXMChange(Sender: TField);
    procedure tblKrzdD_JZYXMChange(Sender: TField);
    procedure vleKfKeyPress(Sender: TObject; var Key: Char);
    procedure btnInsertClick(Sender: TObject);
    procedure tblZdAfterPost(DataSet: TDataSet);
    procedure dbeKrxmExit(Sender: TObject);
    procedure dbcCzyxmExit(Sender: TObject);
    procedure dbcJzyxmExit(Sender: TObject);
    procedure dbcXykbhExit(Sender: TObject);
    procedure dbcKhbhExit(Sender: TObject);
    procedure dbcFkfsKeyPress(Sender: TObject; var Key: Char);
    procedure dbeYfjeExit(Sender: TObject);
  private
    { Private declarations }
    FBmbh: string;
    FItemNo: Integer;
    FZdbh: string;
    FKrbh: string;
    FYjbh: string;
    FCzyxm: string;
    FJzyxm: string;
    FBqj: Integer;
    procedure ShowJdxx;
    procedure UpdateKrzd;
    procedure UpdateKrxx;
    procedure UpdateKryj;
    procedure UpdateKfzt(AKf: TKf);
    procedure AddZd(AKf: TKf);
    procedure LoadKrxx(const AKrxm: string);
  public
    { Public declarations }
  end;


var
  TdjdForm: TTdjdForm;

procedure Tdjd;
procedure TdjdYd(const AKrxm: string;AKfh,ASjfj: TDynamicArray);

implementation

uses C_HotelData, C_Wait;

{$R *.dfm}

//团队接待
procedure Tdjd;
begin
  if Application.FindComponent('TdjdForm') is TTdjdForm then
  begin
    ShowInfo('对不起，团队接待正在运行中！');
    Exit;
  end;
  TdjdForm := TTdjdForm.Create(Application);
  try
    with TdjdForm do
    begin
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

      tblKrzd.Insert;
      ShowJdxx;
      ShowModal;
    end;
  finally
    TdjdForm.tblKrzd.Close;
    TdjdForm.Free;
  end;
end;

//团队预定转接待
procedure TdjdYd(const AKrxm: string;AKfh,ASjfj: TDynamicArray);
var
  i: Integer;
begin
  if Application.FindComponent('TdjdForm') is TTdjdForm then
  begin
    ShowInfo('对不起，团队接待正在运行中！');
    Exit;
  end;
  TdjdForm := TTdjdForm.Create(Application);
  try
    with TdjdForm do
    begin
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

      tblKrzd.Insert;
      tblKrxxD_KRXM.Value := AKrxm;
      for i:=Low(AKfh) to High(AKfh) do
      begin
        vleKf.InsertRow(AKfh[i],ASjfj[i],True);
      end;
      ShowJdxx;
      ShowModal;
    end;
  finally
    TdjdForm.tblKrzd.Close;
    TdjdForm.Free;
  end;
end;

//将数据库记录添加到下拉框中
procedure TTdjdForm.ShowJdxx;
begin
  HotelData.ListDbDm(dbcCzyxm,'YGDA','D_YGXM');
  HotelData.ListDbDm(dbcJzyxm,'YGDA','D_YGXM');
  HotelData.ListDbDm(dbcXykbh,'XYK','D_XYKMC');
  HotelData.ListDbDm(dbcKhbh,'KHDA','D_KHMC');
end;

//添加客人帐单
procedure TTdjdForm.AddZd(AKf: TKf);
var
  s : string;
begin
  s := 'insert into KRZD (D_ZDBH,D_HH,D_ZDLB,D_KRBH,D_YJBH,D_KFBH,'
                        +'D_SJFJ,D_XMBH,D_XFJE,D_XFRQ,D_XFSJ,D_JZBZ,'
                        +'D_JSBZ,D_DLR1,D_DLR2,D_DLR3,D_DLR4,D_CZYXM,'
                        +'D_JZYXM,D_BMBH,D_BZ) values ('
                        +'"'+FZdbh+'",'
                        +IntToStr(FItemNo)+','
                        +'"'+ZDLB_TD+'",'
                        +'"'+FKrbh+'",'
                        +'"'+FYjbh+'",'
                        +'"'+AKf.AKfbh+'",'
                        +CurrToStr(AKf.ASjfj)+','
                        +'"'+XMBH_FJ+'",'
                        +CurrToStr(AKf.AJjfj)+','
                        +'"'+tblKrzdD_XFRQ.AsString+'",'
                        +'"'+tblKrzdD_XFSJ.AsString+'",'
                        +'"'+JZ_NO+'",'
                        +'"'+JS_NO+'",'
                        +'"'+tblKrzdD_DLR1.AsString+'",'
                        +'"'+tblKrzdD_DLR2.AsString+'",'
                        +'"'+tblKrzdD_DLR3.AsString+'",'
                        +'"'+tblKrzdD_DLR4.AsString+'",'
                        +'"'+tblKrzdD_CZYXM.AsString+'",'
                        +'"'+tblKrzdD_JZYXM.AsString+'",'
                        +'"'+FBmbh+'",'
                        +'"'+ZDBZ_TD+AKf.AKfbh+' '+dbeKrxm.Text+'")';
  HotelData.ExecSql(s);
{
    tblZd.Insert;
    tblZdD_ZDBH.Value := FZdbh;
    tblZdD_HH.Value   := FItemNo;
    tblZdD_ZDLB.Value := ZDLB_TD;
    tblZdD_KRBH.Value := FKrbh;
    tblZdD_YJBH.Value := FYjbh;
    tblZdD_KFBH.Value := AKf.AKfbh;
    tblZdD_SJFJ.Value := AKf.ASjfj;
    tblZdD_XMBH.Value := XMBH_FJ;
    tblZdD_XFDJ.Value := AKf.AJjfj;
    tblZdD_XFSL.Value := 1;
    tblZdD_XFJE.Value := tblZdD_XFJE.Value+tblZdD_XFSL.Value*tblZdD_XFDJ.Value;
    tblZdD_XFRQ.Value := tblKrzdD_XFRQ.Value;
    tblZdD_XFSJ.Value := tblKrzdD_XFSJ.Value;
    tblZdD_JZBZ.Value := JZ_NO;
    tblZdD_JSBZ.Value := JS_NO;
    tblZdD_DLR1.Value := tblKrzdD_DLR1.Value;
    tblZdD_DLR2.Value := tblKrzdD_DLR2.Value;
    tblZdD_DLR3.Value := tblKrzdD_DLR3.Value;
    tblZdD_DLR4.Value := tblKrzdD_DLR4.Value;
    tblZdD_CZYXM.Value:= tblKrzdD_CZYXM.Value;
    tblZdD_JZYXM.Value:= tblKrzdD_JZYXM.Value;
    tblZdD_BMBH.Value := FBmbh;
    tblZdD_BZ.Value   := ZDBZ_TD+AKf.AKfbh+' '+dbeKrxm.Text;
    tblZd.Post;}
end;

//更新客房状态
procedure TTdjdForm.UpdateKfzt(AKf: TKf);
var
  s : string;
begin
  if FBqj = BQJ_ZC then
  begin
    s := 'update KFZT set D_KFBZ="'+KFBZ_DT+'",'
        +'D_ZDBH="'+FZdbh+'",'
        +'D_KRBH="'+FKrbh+'",'
        +'D_YJBH="'+FYjbh+'",'
        +'D_SJFJ='+CurrToStr(AKf.ASjfj)+','
        +'D_KRSL=D_KRSL+1,'
        +'D_DHKT="F",'
        +'D_KFZT="'+KFZT_TD+'",'
        +'D_KRXM="'+tblKrxxD_KRXM.Value+'"  where D_KFBH="'+AKf.AKfbh+'"';

  end
  else
  begin
    AKf.AJjfj := AKf.ASjfj;
    s := 'update KFZT set D_KFBZ="'+KFBZ_FT+'",D_QJS=D_QJS+1,'
        +'D_JJFJ=D_JJFJ+'+CurrToStr(AKf.AJjfj)+','
        +'D_ZDBH="'+FZdbh+'",'
        +'D_KRBH="'+FKrbh+'",'
        +'D_YJBH="'+FYjbh+'",'
        +'D_SJFJ='+CurrToStr(AKf.ASjfj)+','
        +'D_KRSL=D_KRSL+1,'
        +'D_DHKT="F",'
        +'D_KFZT="'+KFZT_TD+'",'
        +'D_KRXM="'+tblKrxxD_KRXM.Value+'"  where D_KFBH="'+AKf.AKfbh+'"';
  end;

  HotelData.ExecSql(s);

  if FBqj<>BQJ_ZC then
    HotelData.UpdateBqj(Akf.AKfbh,FBqj,AKf.ASjfj,AKf.AJjfj)
  else
    HotelData.UpdateBqj(Akf.AKfbh,FBqj,AKf.ASjfj,0);

  {
  if tblKfzt.FindKey([AKf.AKfbh]) then
  begin
    tblKfzt.Edit;

    case FBqj of
      BQJ_ZC:
        tblKfztD_KFBZ.Value := KFBZ_DT;
      else
        begin
          tblKfztD_KFBZ.Value := KFBZ_FT;
          tblKfztD_QJS.Value  := tblKfztD_QJS.Value + 1;
          //20020627 edit by ls. 改为求和
          AKf.AJjfj := AKf.ASjfj;
          tblKfztD_JJFJ.Value := tblKfztD_JJFJ.Value+AKf.ASjfj;
        end;
    end;
    tblKfztD_ZDBH.Value := FZdbh;
    tblKfztD_KRBH.Value := FKrbh;
    tblKfztD_YJBH.Value := FYjbh;
    tblKfztD_SJFJ.Value := AKf.ASjfj;
    tblKfztD_KRSL.Value := tblKfztD_KRSL.Value + 1;
    tblKfztD_DHKT.Value := 'F';
    tblKfztD_KFZT.Value := KFZT_TD;
    tblKfztD_KRXM.Value := tblKrxxD_KRXM.Value;
    tblKfzt.Post;
  end;}
end;

//更新客人帐单总单
procedure TTdjdForm.UpdateKrzd;
begin
  FZdbh := HotelData.GetBh('D_ZDBH',PREV_ZDBH);
  FKrbh := HotelData.GetBh('D_KRBH',PREV_KRBH);
  FYjbh := HotelData.GetBh('D_YJBH',PREV_YJBH);
  tblKrzdD_ZDBH.Value := FZdbh;
  tblKrzdD_KRBH.Value := FKrbh;
  tblKrzdD_YJBH.Value := FYjbh;
  tblKrzdD_HH.Value   := 0;
  tblKrzdD_ZDLB.Value := ZDLB_TD;
  tblKrzdD_XFRQ.Value := tblKrxxD_DDRQ.Value;
  tblKrzdD_XFSJ.Value := tblKrxxD_DDSJ.Value;
  tblKrzdD_JZBZ.Value := JZ_NO;
  tblKrzdD_JSBZ.Value := JS_NO;
  tblKrzdD_BMBH.Value := FBmbh;
  tblKrzdD_BZ.Value   := ZDBZ_TD+' '+tblKrxxD_KRXM.Value;
end;

//更新客人信息
procedure TTdjdForm.UpdateKrxx;
begin
  tblKrxx.Edit;
  tblKrxxD_KRBH.Value := FKrbh;
  tblKrxx.Post;
end;

//更新客人押金
procedure TTdjdForm.UpdateKryj;
begin
  tblKryj.Edit;
  tblKryjD_YJBH.Value := FYjbh;
  tblKryjD_HH.Value   := 0;
  tblKryjD_YFRQ.Value := tblKrxxD_DDRQ.Value;
  tblKryjD_YFSJ.Value := tblKrxxD_DDSJ.Value;
  tblKryjD_BZ.Value   := YJBZ_YJ;
  tblKryj.Post;
end;

//打开
procedure TTdjdForm.tblKrzdBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  tblKrxx.Open;
  tblKryj.Open;
end;

//关闭
procedure TTdjdForm.tblKrzdBeforeClose(DataSet: TDataSet);
begin
  inherited;
  tblKrxx.Close;
  tblKryj.Close;
end;

//增加新纪录
procedure TTdjdForm.tblKrzdNewRecord(DataSet: TDataSet);
begin
  inherited;
  FItemNo := 1;
  tblKrzdD_CZYXM.Value := CZY.CzyXm;
  tblKrzdD_JZYXM.Value := JZY.CzyXm;
  tblKrxx.Insert;
  tblKryj.Insert;
end;

//存盘前更新
procedure TTdjdForm.tblKrzdBeforePost(DataSet: TDataSet);
var
  I: Integer;
  AKf: TKf;
begin
  inherited;
  UpdateKrzd;
  UpdateKrxx;
  UpdateKryj;
  for I:=1 to vleKf.RowCount-1 do
  begin
    AKf.AKfbh := vleKf.Keys[I];
    AKf.ASjfj := StrToCurr(vleKf.Values[vleKf.Keys[I]]);
    AKf.AJjfj := 0;
    UpdateKfzt(AKf);
  end;
end;

//取消
procedure TTdjdForm.tblKrzdAfterCancel(DataSet: TDataSet);
begin
  inherited;
  tblKrzd.CancelUpdates;
  tblKrxx.CancelUpdates;
  tblKryj.CancelUpdates;
end;

procedure TTdjdForm.tblKrxxNewRecord(DataSet: TDataSet);
begin
  inherited;
  tblKrxxD_KRLX.Value := KRLX_TD;
  tblKrxxD_DDRQ.Value := Date;
  tblKrxxD_DDSJ.Value := Time;
end;

procedure TTdjdForm.tblKryjNewRecord(DataSet: TDataSet);
begin
  inherited;
  tblKryjD_FKFS.Value := FKFS_RMB;
end;

//取消
procedure TTdjdForm.btnCancClick(Sender: TObject);
begin
  inherited;
  tblKrzd.Cancel;
end;

//确认
procedure TTdjdForm.btnOKClick(Sender: TObject);
var
  I: Integer;
  AKf: TKf;
  AFjze : Currency;
  s : string;
begin
  inherited;

  //判断是否输入了团队名称
  if tblKrxxD_KRXM.Value='' then
    raise Exception.Create('请输入团队名称！');

  //判断是否输入了预付金额
  if (tblKryjD_FKFS.Value=FKFS_RMB)and(tblKryjD_YFJE.IsNull) then
    raise Exception.Create('请输入预付金额！');

  //判断是否添加了客房
  if vleKf.Cells[0,1]='' then
    raise Exception.Create('请添加客房！');

  //获得部门编号
  FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);

  //判断半全价
  FBqj := CheckDdsj(tblKrxxD_DDSJ.Value);
  //事务启动
  HotelData.DatabaseUser.StartTransaction;

  try

    WaitForm := TWaitForm.Create(Application);
    //添加帐单子项目
    try
      WaitForm.FTitle := '团队分配客房';
      WaitForm.Show;
      WaitForm.Update;
      //存盘
      tblKrzd.Post;
      tblKrxx.ApplyUpdates;
      tblKryj.ApplyUpdates;
      tblKrzd.ApplyUpdates;

      {try
        tblZd.Open;
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
      
      AFjze := 0;
      for I:=1 to vleKf.RowCount-1 do
      begin
        AKf.AKfbh := vleKf.Keys[I];
        AKf.ASjfj := StrToCurr(vleKf.Values[vleKf.Keys[I]]);
        if FBqj<>BQJ_ZC then AKf.AJjfj := AKf.ASjfj else  AKf.AJjfj := 0;
        AFjze := AFjze + AKf.AJjfj;
        //添加帐单
        AddZd(AKf);
        Inc(FItemNo);
        //添加员工开房
        //HotelData.YgkfAppend(CZY.CzyXm,AKf.AKfbh,tblKrxxD_KRXM.Value,AKf.ASjfj);
        //HotelData.YgkfAppend(JZY.CzyXm,AKf.AKfbh,tblKrxxD_KRXM.Value,AKf.ASjfj);
      end;

      //修改总单
      if AFjze > 0 then
      begin
        s := 'update KRZD set D_XFJE='+CurrToStr(AFjze)+' where (D_ZDBH="'+FZdbh+'")and(D_HH=0)';
        HotelData.ExecSql(s);
      end;

      {if tblZd.FindKey([FZdbh,0]) then
      begin
        tblZd.Edit;
        tblZdD_XFJE.Value := HotelData.SumJe('select sum(D_XFJE) from KRZD'
                                           +' where (D_ZDBH="'
                                           +FZdbh+'")and(D_HH<>0)');
        tblZd.Post;
      end;
      }
    finally
      //tblZd.Close;
      WaitForm.Hide;
      WaitForm.Free;
    end;

    //事务提交
    HotelData.DatabaseUser.Commit;
  except
    //事务回滚
    HotelData.DatabaseUser.Rollback;
    raise;
  end;

  //清除缓存
  tblKrxx.CommitUpdates;
  tblKryj.CommitUpdates;
  tblKrzd.CommitUpdates;

  Close;
end;

//检查预付金额有效性
procedure TTdjdForm.tblKryjD_YFJEValidate(Sender: TField);
begin
  inherited;
  if (tblKryjD_YFJE.Required)and(tblKryjD_YFJE.Value<=0) then
    raise Exception.Create('预付金额必须大于零！');
end;

//改变付款方式
procedure TTdjdForm.tblKryjD_FKFSChange(Sender: TField);
begin
  inherited;
  tblKryjD_YFJE.Required := tblKryjD_FKFS.Value = FKFS_RMB;
  tblKryjD_XYKBH.Required:= tblKryjD_FKFS.Value = FKFS_XYK;
  tblKryjD_KHBH.Required := tblKryjD_FKFS.Value = FKFS_JZ;

  dbeYfje.Visible  := tblKryjD_FKFS.Value = FKFS_RMB;
  dbcXykbh.Visible := tblKryjD_FKFS.Value = FKFS_XYK;
  dbcKhbh.Visible  := tblKryjD_FKFS.Value = FKFS_JZ;
  lblYfje.Visible  := tblKryjD_FKFS.Value <> FKFS_ZP;

  if dbeYfje.Visible  then lblYfje.Caption := '预付金额';
  if dbcXykbh.Visible then lblYfje.Caption := '信用卡';
  if dbcKhbh.Visible  then lblYfje.Caption := '记帐客户';

  lblMc.Caption := '';
  dbcXykbh.Left := dbeYfje.Left;
  dbcXYkbh.Top  := dbeYfje.Top;
  dbcKhbh.Left  := dbeYfje.Left;
  dbcKhbh.Top   := dbeYfje.Top;
end;

procedure TTdjdForm.tblKrzdD_CZYXMChange(Sender: TField);
begin
  inherited;
  FCzyxm := tblKrzdD_CZYXM.Value;
end;

procedure TTdjdForm.tblKrzdD_JZYXMChange(Sender: TField);
begin
  inherited;
  FJzyxm := tblKrzdD_JZYXM.Value;
end;

procedure TTdjdForm.vleKfKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not(Key in ['0'..'9']))and(Ord(Key)<>VK_BACK) then
  begin
    Key := #0;
    Beep;
  end;
end;

//增加客房
procedure TTdjdForm.btnInsertClick(Sender: TObject);
var
  ABfh,AEfh,I,Row: Integer;
begin
  inherited;
  try
    if (lblBfh.Text='')or(lblEfh.Text='')or(lblFj.Text='') then
      raise Exception.Create('请输入完整数据！');
      
    try
      ABfh := StrToInt(lblBfh.Text);
      AEfh := StrToInt(lblEfh.Text);
    except
      Exit;
      raise;
    end;
    if AEfh>=ABfh then
    begin
      if HotelData.CheckKfzt(IntToStr(AEfh))='' then Exit;
      if HotelData.CheckKfzt(IntToStr(ABfh))='' then Exit;
      for I := ABfh to AEfh do
      begin
        if (not vleKf.FindRow(IntToStr(I),Row))
          and(HotelData.CheckKfzt(IntToStr(I))=KFZT_OK) then
          vleKf.InsertRow(IntToStr(I),lblFj.Text,True);
      end;
    end;
    lblBfh.Text := '';
    lblEfh.Text := '';
    lblFj.Text  := '';
    lblBfh.SetFocus;
  except
    Exit;
    raise;
  end;
end;

//增加行号
procedure TTdjdForm.tblZdAfterPost(DataSet: TDataSet);
begin
  inherited;

end;

//历史客人信息载入
procedure TTdjdForm.LoadKrxx(const AKrxm: string);
var
  s : string;
begin
  with HotelData.qryUserData do
  begin
    s := 'select * from KRXXDA where D_KRXM="'+AKrxm+'"';
    SQL.Clear;
    SQL.Add(s);
    Open;
    if IsEmpty then
    begin
      Close;
      Exit;
    end;
    if Confirm('是否自动调入该客人在客史档案中的信息？') then
    begin
      //内宾
      //tblKrxxD_XB.Value   := FieldByName('D_XB').AsString;
      //tblKrxxD_MZBH.Value := FieldByName('D_MZBH').AsString;
      //tblKrxxD_DQBH.Value := FieldByName('D_DQBH').AsString;
      //tblKrxxD_ZJBH.Value := FieldByName('D_ZJBH').AsString;
      //tblKrxxD_ZJHM.Value := FieldByName('D_ZJHM').AsString;
      //tblKrxxD_CSNY.Value := FieldByName('D_CSNY').AsDateTime;
      //tblKrxxD_ZY.Value   := FieldByName('D_ZY').AsString;
      //tblKrxxD_JTDZ.Value := FieldByName('D_JTDZ').AsString;
      tblKrxxD_JDR.Value  := FieldByName('D_JDR').AsString;
      tblKrxxD_JDDW.Value := FieldByName('D_JDDW').AsString;
      tblKrxxD_DWMC.Value := FieldByName('D_DWMC').AsString;
      tblKrxxD_LXDH.Value := FieldByName('D_LXDH').AsString;
      tblKrxxD_QDR1.Value := FieldByName('D_QDR1').AsString;
      tblKrxxD_QDR2.Value := FieldByName('D_QDR2').AsString;
      tblKrxxD_QDR3.Value := FieldByName('D_QDR3').AsString;
      tblKrxxD_QDR4.Value := FieldByName('D_QDR4').AsString;
      //tblKrxxD_HCL.Value  := FieldByName('D_HCL').AsString;
      //tblKrxxD_HCQ.Value  := FieldByName('D_HCQ').AsString;
      //外宾
      //tblKrxxD_YWM.Value  := FieldByName('D_YWM').AsString;
      //tblKrxxD_YWX.Value  := FieldByName('D_YWX').AsString;
      //tblKrxxD_GBBH.Value := FieldByName('D_GBBH').AsString;
      //tblKrxxD_QZBH.Value := FieldByName('D_QZBH').AsString;
      //tblKrxxD_QZYXQ.Value:= FieldByName('D_QZYXQ').AsDateTime;

    end;
    Close;
  end;
end;

//判断客人来店次数
procedure TTdjdForm.dbeKrxmExit(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  if dbeKrxm.Text='' then
  begin
    dbeKrxm.SetFocus;
    Exit;
  end;
  
  i := HotelData.Ldcs(dbeKrxm.Text);
  if i=0 then
    lblInfo.Caption := '友情提醒：该客人是首次来店'
  else
    lblInfo.Caption := '友情提醒：该客人是第'+IntToStr(i+1)+'次来店';
  LoadKrxx(dbeKrxm.Text);
end;

procedure TTdjdForm.dbcCzyxmExit(Sender: TObject);
begin
  inherited;
  if HotelData.FindBh('YGDA','D_YGBH','D_YGXM',tblKrzdD_CZYXM.Value)='' then
  begin
    FCzyxm := GetMc(dbcCzyxm.Items[dbcCzyxm.ItemIndex]);
    if HotelData.FindBh('YGDA','D_YGBH','D_YGXM',FCzyxm)<>'' then
      tblKrzdD_CZYXM.Value := FCzyxm
    else
      dbcCzyxm.SetFocus;
  end;
end;

procedure TTdjdForm.dbcJzyxmExit(Sender: TObject);
var
  AJzybh: string;
begin
  inherited;
  if HotelData.FindBh('YGDA','D_YGBH','D_YGXM',tblKrzdD_JZYXM.Value)='' then
  begin
    FJzyxm := GetMc(dbcJzyxm.Items[dbcJzyxm.ItemIndex]);
    AJzybh := HotelData.FindBh('YGDA','D_YGBH','D_YGXM',FJzyxm);
    if AJzybh<>'' then
    begin
      tblKrzdD_JZYXM.Value := FJzyxm;
      JZY.CzyBh := AJzybh;
      JZY.CzyXm := FJzyxm;
    end
    else
      dbcJzyxm.SetFocus;
  end;
end;

procedure TTdjdForm.dbcXykbhExit(Sender: TObject);
var
  AXykbh,AXykmc: string;
begin
  inherited;
  AXykmc := HotelData.FindMc('XYK','D_XYKBH','D_XYKMC',tblKryjD_XYKBH.Value);
  if AXykmc='' then
  begin
    AXykmc := GetMc(dbcXykbh.Items[dbcXykbh.ItemIndex]);
    AXykbh := HotelData.FindBh('XYK','D_XYKBH','D_XYKMC',AXykmc);
    if AXykbh<>'' then
    begin
      tblKryjD_XYKBH.Value := AXykbh;
      lblMc.Caption := AXykmc;
    end
    else
      dbcXykbh.SetFocus;
  end
  else
    lblMC.Caption := AXykmc;
end;

procedure TTdjdForm.dbcKhbhExit(Sender: TObject);
var
  AKhbh,AKhmc: string;
begin
  inherited;
  AKhmc := HotelData.FindMc('KHDA','D_KHBH','D_KHMC',tblKryjD_KHBH.Value);
  if AKhmc='' then
  begin
    AKhmc := GetMc(dbcKhbh.Items[dbcKhbh.ItemIndex]);
    AKhbh := HotelData.FindBh('KHDA','D_KHBH','D_KHMC',AKhmc);
    if AKhbh<>'' then
    begin
      tblKryjD_KHBH.Value := AKhbh;
      lblMc.Caption := AKhmc;
    end
    else
      dbcKhbh.SetFocus;
  end
  else
    lblMc.Caption := AKhmc;
end;

procedure TTdjdForm.dbcFkfsKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = '1' then tblKryjD_FKFS.Value := '人民币'
  else
  if Key = '2' then tblKryjD_FKFS.Value := '信用卡'
  else
  if Key = '3' then tblKryjD_FKFS.Value := '支票'
  else
  if Key = '4' then tblKryjD_FKFS.Value := '记帐';
end;

procedure TTdjdForm.dbeYfjeExit(Sender: TObject);
begin
  inherited;
  if dbeYfje.Text = '' then dbeYfje.SetFocus;
end;

end.

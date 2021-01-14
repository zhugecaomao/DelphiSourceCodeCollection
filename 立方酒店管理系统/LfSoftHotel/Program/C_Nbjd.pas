{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_Nbjd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, DB, DBTables,
  DBCtrls, Mask, C_Define, ComCtrls;

type
  TNbjdForm = class(TStdJdForm)
    tblKrzd: TTable;
    tblKrxx: TTable;
    tblKryj: TTable;
    dsKrzd: TDataSource;
    dsKrxx: TDataSource;
    dsKryj: TDataSource;
    tblKfzt: TTable;
    tblZd: TTable;
    lblHelp: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblYfje: TLabel;
    Label17: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    dbeKfbh: TDBEdit;
    dbeSjfj: TDBEdit;
    dbeKrxm: TDBEdit;
    dbeDdrq: TDBEdit;
    dbeDdsj: TDBEdit;
    dbeYfje: TDBEdit;
    dbeNzts: TDBEdit;
    dbcFkfs: TDBComboBox;
    dbcCzyxm: TDBComboBox;
    dbcJzyxm: TDBComboBox;
    dbcXykbh: TDBComboBox;
    lblMc: TLabel;
    dbcKhbh: TDBComboBox;
    btnDyfk: TBitBtn;
    btnSk: TBitBtn;
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
    tblZdD_ZDBH: TStringField;
    tblZdD_HH: TIntegerField;
    tblZdD_ZDLB: TStringField;
    tblZdD_KRBH: TStringField;
    tblZdD_YJBH: TStringField;
    tblZdD_KFBH: TStringField;
    tblZdD_SJFJ: TFloatField;
    tblZdD_XMBH: TStringField;
    tblZdD_XFDJ: TFloatField;
    tblZdD_XFSL: TFloatField;
    tblZdD_XFJE: TFloatField;
    tblZdD_XFRQ: TDateTimeField;
    tblZdD_XFSJ: TDateTimeField;
    tblZdD_YHJE: TFloatField;
    tblZdD_JZRQ: TDateTimeField;
    tblZdD_JZSJ: TDateTimeField;
    tblZdD_JZBZ: TStringField;
    tblZdD_JSBZ: TStringField;
    tblZdD_DLR1: TStringField;
    tblZdD_DLR2: TStringField;
    tblZdD_DLR3: TStringField;
    tblZdD_DLR4: TStringField;
    tblZdD_CZYXM: TStringField;
    tblZdD_JZYXM: TStringField;
    tblZdD_TYR: TStringField;
    tblZdD_BZ: TStringField;
    tblZdD_YSRQ: TStringField;
    tblZdD_JZBH: TStringField;
    tblKfztD_KRXM: TStringField;
    tblKrzdD_BMBH: TStringField;
    Panel4: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    lblMz: TLabel;
    lblDqmc: TLabel;
    lblZjmc: TLabel;
    Label8: TLabel;
    dbeZjhm: TDBEdit;
    dbeCsny: TDBEdit;
    dbeTlsy: TDBEdit;
    dbeZy: TDBEdit;
    dbeHcl: TDBEdit;
    dbeHcq: TDBEdit;
    dbeJtdz: TDBEdit;
    dbeBz: TDBEdit;
    dbcXb: TDBComboBox;
    dbcMz: TDBComboBox;
    dbcDqbh: TDBComboBox;
    dbcZjlx: TDBComboBox;
    dbeDwmc: TDBEdit;
    tblZdD_BMBH: TStringField;
    procedure tblKrzdBeforeOpen(DataSet: TDataSet);
    procedure tblKrzdBeforeClose(DataSet: TDataSet);
    procedure tblKrzdNewRecord(DataSet: TDataSet);
    procedure tblKrxxNewRecord(DataSet: TDataSet);
    procedure tblKryjNewRecord(DataSet: TDataSet);
    procedure btnCancClick(Sender: TObject);
    procedure tblKrzdAfterCancel(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure tblKrzdBeforePost(DataSet: TDataSet);
    procedure tblKrzdD_SJFJValidate(Sender: TField);
    procedure tblKryjD_YFJEValidate(Sender: TField);
    procedure tblKryjD_FKFSChange(Sender: TField);
    procedure tblKrzdD_CZYXMChange(Sender: TField);
    procedure tblKrzdD_JZYXMChange(Sender: TField);
    procedure tblKrzdD_KFBHValidate(Sender: TField);
    procedure tblKrxxD_ZJHMValidate(Sender: TField);
    procedure tblKrxxD_ZJBHChange(Sender: TField);
    procedure dbeZjhmKeyPress(Sender: TObject; var Key: Char);
    procedure dbeKrxmExit(Sender: TObject);
    procedure dbcXbKeyPress(Sender: TObject; var Key: Char);
    procedure HelpInfo(Sender: TObject);
    procedure dbcFkfsKeyPress(Sender: TObject; var Key: Char);
    procedure dbcCzyxmExit(Sender: TObject);
    procedure dbcJzyxmExit(Sender: TObject);
    procedure dbcXykbhExit(Sender: TObject);
    procedure dbcKhbhExit(Sender: TObject);
    procedure dbcMzExit(Sender: TObject);
    procedure dbcDqbhExit(Sender: TObject);
    procedure dbcZjlxExit(Sender: TObject);
    procedure dbeSjfjExit(Sender: TObject);
    procedure dbeYfjeExit(Sender: TObject);
    procedure dbeZjhmExit(Sender: TObject);
    procedure dbcKhbhDblClick(Sender: TObject);
    procedure dbeKfbhExit(Sender: TObject);
    procedure dbeZjhmKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FBmbh  : string;
    FItemNo: Integer;
    FZdbh  : string;
    FKrbh  : string;
    FYjbh  : string;
    FCzyxm : string;
    FJzyxm : string;
    FBqj   : Integer;
    procedure ShowJdxx;
    procedure UpdateKrzd;
    procedure UpdateKfzt;
    procedure UpdateKryj;
    procedure UpdateKrxx;
    procedure AddZd;
    function  ValidSfz(const AZjhm: string): Boolean;
    procedure AddXxdc;
    procedure LoadKrxx(const AKrxm: string);
  public
    { Public declarations }
  end;

const
  Info_Help : array[1..24] of string =
              ('操作帮助：按退格键开始录入助计符',
               '操作帮助：按退格键开始录入助计符',
               '操作帮助：',
               '操作帮助：',
               '操作帮助：',
               '操作帮助：1 - 人民币；2 - 信用卡；3 - 支票；4 - 记帐',
               '操作帮助：',
               '操作帮助：按退格键开始录入助计符',
               '操作帮助：按退格键开始录入助计符',
               '操作帮助：',
               '操作帮助：',
               '操作帮助：',
               '操作帮助：1 - 男；2 - 女',
               '操作帮助：按退格键开始录入助计符',
               '操作帮助：按退格键开始录入助计符',
               '操作帮助：按退格键开始录入助计符',
               '操作帮助：',
               '操作帮助：',
               '操作帮助：',
               '操作帮助：',
               '操作帮助：',
               '操作帮助：',
               '操作帮助：',
               '操作帮助：');

var
  NbjdForm: TNbjdForm;

procedure Nbjd;
procedure NbjdEnter(const AKfbh: string);
procedure NbjdYd(const AKfbh,AKrxm: string;ASjfj: Currency;ANzts: Integer);

implementation

uses C_HotelData, C_KhdaSel;

{$R *.dfm}

//从主菜单中运行
procedure Nbjd;
begin
  if Application.FindComponent('NbjdForm') is TNbjdForm then
  begin
    ShowInfo('对不起，内宾接待正在运行中！');
    Exit;
  end;
  NbjdForm := TNbjdForm.Create(Application);
  try
    with NbjdForm do
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
    NbjdForm.tblKrzd.Close;
    NbjdForm.Free;
  end;
end;

//选择客房编号运行
procedure NbjdEnter(const AKfbh: string);
begin
  if Application.FindComponent('NbjdForm') is TNbjdForm then
  begin
    ShowInfo('对不起，内宾接待正在运行中！');
    Exit;
  end;

  if (HotelData.CheckKfzt(AKfbh)<>KFZT_OK) then
    raise Exception.Create('该客房不是空房，请刷新房态！');

  NbjdForm := TNbjdForm.Create(Application);
  try
    with NbjdForm do
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
      tblKrzdD_KFBH.Value := AKfbh;
      ShowJdxx;
      ShowModal;
    end;
  finally
    NbjdForm.tblKrzd.Close;
    NbjdForm.Free;
  end;
end;

//预定转接待
procedure NbjdYd(const AKfbh,AKrxm: string;ASjfj: Currency;ANzts: Integer);
begin
  if Application.FindComponent('NbjdForm') is TNbjdForm then
  begin
    ShowInfo('对不起，内宾接待正在运行中！');
    Exit;
  end;
  NbjdForm := TNbjdForm.Create(Application);
  try
    with NbjdForm do
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
      tblKrzdD_KFBH.Value := AKfbh;
      tblKrzdD_SJFJ.Value := ASjfj;
      tblKrxxD_KRXM.Value := AKrxm;
      tblKrxxD_NZTS.Value := ANzts;
      ShowJdxx;
      ShowModal;
    end;
  finally
    NbjdForm.tblKrzd.Close;
    NbjdForm.Free;
  end;
end;

//历史客人信息载入
procedure TNbjdForm.LoadKrxx(const AKrxm: string);
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
      Last;
      tblKrxxD_XB.Value   := FieldByName('D_XB').AsString;
      tblKrxxD_MZBH.Value := FieldByName('D_MZBH').AsString;
      tblKrxxD_DQBH.Value := FieldByName('D_DQBH').AsString;
      tblKrxxD_ZJBH.Value := FieldByName('D_ZJBH').AsString;
      tblKrxxD_ZJHM.Value := FieldByName('D_ZJHM').AsString;
      tblKrxxD_CSNY.Value := FieldByName('D_CSNY').AsDateTime;
      tblKrxxD_ZY.Value   := FieldByName('D_ZY').AsString;
      tblKrxxD_JTDZ.Value := FieldByName('D_JTDZ').AsString;
      tblKrxxD_DWMC.Value := FieldByName('D_DWMC').AsString;
      tblKrxxD_HCL.Value  := FieldByName('D_HCL').AsString;
      tblKrxxD_HCQ.Value  := FieldByName('D_HCQ').AsString;
      //外宾
      tblKrxxD_YWM.Value  := FieldByName('D_YWM').AsString;
      tblKrxxD_YWX.Value  := FieldByName('D_YWX').AsString;
      tblKrxxD_GBBH.Value := FieldByName('D_GBBH').AsString;
      tblKrxxD_QZBH.Value := FieldByName('D_QZBH').AsString;
      tblKrxxD_QZYXQ.Value:= FieldByName('D_QZYXQ').AsDateTime;
      
    end;
    Close;
  end;
end;

//将数据库中的内容添加到下拉框中
procedure TNbjdForm.ShowJdxx;
begin
  HotelData.ListDbDm(dbcCzyxm,'YGDA','D_YGXM');
  HotelData.ListDbDm(dbcJzyxm,'YGDA','D_YGXM');
  HotelData.ListDbDm(dbcXykbh,'XYK','D_XYKMC');
  HotelData.ListDbDm(dbcKhbh,'KHDA','D_KHMC');
  HotelData.ListDbDm(dbcMz,'MZDM','D_MZMC');
  HotelData.ListDbDm(dbcDqbh,'DQDM','D_DQMC');
  HotelData.ListDbDm(dbcZjlx,'ZJDM','D_ZJMC');
end;

//判断身份证号码的有效性
function TNbjdForm.ValidSfz(const AZjhm: string): Boolean;
begin
  Result := False;

  //判断15位身份证号码
  if Length(AZjhm)=15 then
  begin
    try
      tblKrxxD_CSNY.Value :=
        EnCodeDate(StrToInt('19'+Copy(AZjhm,7,2)),
                   StrToInt(Copy(AZjhm,9,2)),
                   StrToInt(Copy(AZjhm,11,2)));
      if StrToInt(Copy(AZjhm,15,1)) mod 2 = 0 then
        tblKrxxD_XB.Value := '女'
      else
        tblKrxxD_XB.Value := '男';
      Result := True;
    except
      raise Exception.Create('非法身份证号码！');
    end;
  end;

  //判断18位身份证号码
  if Length(AZjhm)=18 then
  begin
    try
      tblKrxxD_CSNY.Value :=
        EnCodeDate(StrToInt(Copy(AZjhm,7,4)),
                   StrToInt(Copy(AZjhm,11,2)),
                   StrToInt(Copy(AZjhm,13,2)));
      if StrToInt(Copy(AZjhm,17,1)) mod 2 = 0 then
        tblKrxxD_XB.Value := '女'
      else
        tblKrxxD_XB.Value := '男';
      Result := True;
    except
      raise Exception.Create('非法身份证号码！');
    end;
  end;
end;

//有半全价
procedure TNbjdForm.AddZd;
begin
  try
  
    try
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

    tblZd.Insert;
    tblZdD_ZDBH.Value := FZdbh;
    tblZdD_KRBH.Value := FKrbh;
    tblZdD_YJBH.Value := FYjbh;
    tblZdD_ZDLB.Value := ZDLB_YK;
    tblZdD_HH.Value   := FItemNo;
    tblZdD_JZBZ.Value := JZ_NO;
    tblZdD_JSBZ.Value := JS_NO;
    tblZdD_KFBH.Value := tblKrzdD_KFBH.Value;
    //edit by ls.2003.01.11
    tblZdD_SJFJ.Value := 0;
    //tblZdD_SJFJ.Value := tblKrzdD_SJFJ.Value;
    tblZdD_XMBH.Value := XMBH_FJ;
    tblZdD_XFDJ.Value := tblKfztD_JJFJ.Value;
    tblZdD_XFSL.Value := 1;
    tblZdD_XFJE.Value := tblZdD_XFSL.Value*tblZdD_XFDJ.Value;
    tblZdD_XFRQ.Value := tblKrzdD_XFRQ.Value;
    tblZdD_XFSJ.Value := tblKrzdD_XFSJ.Value;
    tblZdD_CZYXM.Value:= FCzyxm;
    tblZdD_JZYXM.Value:= FJzyxm;
    tblZdD_BMBH.Value := FBmbh;
    tblZd.Post;
    if tblZd.FindKey([FZdbh,0]) then
    begin
      tblZd.Edit;
      tblZdD_XFJE.Value := HotelData.SumJe('select sum(D_XFJE) from KRZD'
                                           +' where (D_ZDBH="'
                                           +FZdbh+'")and(D_HH<>0)');

      tblZd.Post;
    end;
  finally
    tblZd.Close;
  end;
end;

//添加客人帐单总单 行号=0
procedure TNbjdForm.UpdateKrzd;
begin
  FZdbh := HotelData.GetBh('D_ZDBH',PREV_ZDBH);
  FKrbh := HotelData.GetBh('D_KRBH',PREV_KRBH);
  FYjbh := HotelData.GetBh('D_YJBH',PREV_YJBH);
  tblKrzdD_ZDBH.Value := FZdbh;
  tblKrzdD_KRBH.Value := FKrbh;
  tblKrzdD_YJBH.Value := FYjbh;
  tblKrzdD_HH.Value   := 0;
  tblKrzdD_ZDLB.Value := ZDLB_YK;
  tblKrzdD_XFRQ.Value := tblKrxxD_DDRQ.Value;
  tblKrzdD_XFSJ.Value := tblKrxxD_DDSJ.Value;
  tblKrzdD_JZBZ.Value := JZ_NO;
  tblKrzdD_JSBZ.Value := JS_NO;
  tblKrzdD_BZ.Value   := FBmbh;
  tblKrzdD_BZ.Value   := ZDBZ_SK+' '+tblKrzdD_KFBH.Value+' '+tblKrxxD_KRXM.Value;
end;

//更新客人信息的客人编号
procedure TNbjdForm.UpdateKrxx;
begin
  tblKrxx.Edit;
  tblKrxxD_KRBH.Value := FKrbh;
  tblKrxx.Post;
end;

//添加客人押金
procedure TNbjdForm.UpdateKryj;
begin
  tblKryj.Edit;
  tblKryjD_YJBH.Value := FYjbh;
  tblKryjD_HH.Value   := 0;
  tblKryjD_YFRQ.Value := tblKrxxD_DDRQ.Value;
  tblKryjD_YFSJ.Value := tblKrxxD_DDSJ.Value;
  tblKryjD_BZ.Value   := YJBZ_YJ;
  tblKryj.Post;
end;

//更新客房状态库
procedure TNbjdForm.UpdateKfzt;
begin
  if tblKfzt.FindKey([tblKrzdD_KFBH.Value]) then
  begin
    tblKfzt.Edit;
    FBqj := CheckDdsj(tblKrxxD_DDSJ.Value);
    case FBqj of
      BQJ_ZC:
        tblKfztD_KFBZ.Value := KFBZ_DT;
      BQJ_BJ:
        begin
          tblKfztD_KFBZ.Value := KFBZ_FT;
          tblKfztD_BJS.Value  := tblKfztD_BJS.Value + 1;
          //20020627 edit by ls. 改为求和
          tblKfztD_JJFJ.Value := tblKfztD_JJFJ.Value+tblKrzdD_SJFJ.Value/2;
        end;
      BQJ_QJ:
        begin
          tblKfztD_KFBZ.Value := KFBZ_FT;
          tblKfztD_QJS.Value  := tblKfztD_QJS.Value + 1;
          //20020627 edit by ls. 改为求和
          tblKfztD_JJFJ.Value := tblKfztD_JJFJ.Value+tblKrzdD_SJFJ.Value;
        end;
    end;
    tblKfztD_ZDBH.Value := FZdbh;
    tblKfztD_KRBH.Value := FKrbh;
    tblKfztD_YJBH.Value := FYjbh;
    tblKfztD_SJFJ.Value := tblKrzdD_SJFJ.Value;
    tblKfztD_KRSL.Value := tblKfztD_KRSL.Value + 1;
    tblKfztD_DHKT.Value := 'F';
    tblKfztD_KFZT.Value := KFZT_BF;
    tblKfztD_KRXM.Value := tblKrxxD_KRXM.Value;
    tblKfzt.Post;

    //更新半全价库
    if FBqj<>BQJ_ZC then
      HotelData.UpdateBqj(tblKfztD_KFBH.Value,FBqj,tblKfztD_SJFJ.Value,tblKfztD_JJFJ.Value)
    else
      HotelData.UpdateBqj(tblKfztD_KFBH.Value,FBqj,tblKfztD_SJFJ.Value,0);
  end;
end;

procedure TNbjdForm.tblKrzdBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  tblKfzt.Open;
  tblKrxx.Open;
  tblKryj.Open;
end;

procedure TNbjdForm.tblKrzdBeforeClose(DataSet: TDataSet);
begin
  inherited;
  tblKfzt.Close;
  tblKrxx.Close;
  tblKryj.Close;
end;

procedure TNbjdForm.tblKrzdNewRecord(DataSet: TDataSet);
begin
  inherited;
  FItemNo := 1;
  tblKrzdD_CZYXM.Value := DQCZY.CzyXm;
  tblKrzdD_JZYXM.Value := DQJZY.CzyXm;
  tblKrxx.Insert;
  tblKryj.Insert;
end;

procedure TNbjdForm.tblKrxxNewRecord(DataSet: TDataSet);
var
  ARecInfo: TRecInfo;
begin
  inherited;
  tblKrxxD_KRLX.Value := KRLX_NB;
  tblKrxxD_DDRQ.Value := Date;
  tblKrxxD_DDSJ.Value := Time;
  tblKrxxD_NZTS.Value := 1;
  tblKrxxD_XB.Value   := XB_MAN;

  //-------20020627 edit by ls.获取默认第一个记录
  ARecInfo            := HotelData.GetFirstRec('MZDM','D_MZBH','D_MZMC');
  tblKrxxD_MZBH.Value := ARecInfo.ABh;
  lblMz.Caption       := ARecInfo.AMc;
  ARecInfo            := HotelData.GetFirstRec('DQDM','D_DQBH','D_DQMC');
  tblKrxxD_DQBH.Value := ARecInfo.ABh;
  lblDqmc.Caption     := ARecInfo.AMc;
  ARecInfo            := HotelData.GetFirstRec('ZJDM','D_ZJBH','D_ZJMC');
  tblKrxxD_ZJBH.Value := ARecInfo.ABh;
  lblZjmc.Caption     := ARecInfo.AMc;
  //-----------------------------------------------

  tblKrxxD_TLSY.Value := '商务';
end;

//付款方式默认为人民币
procedure TNbjdForm.tblKryjNewRecord(DataSet: TDataSet);
begin
  inherited;
  tblKryjD_FKFS.Value := FKFS_RMB;
end;

procedure TNbjdForm.btnCancClick(Sender: TObject);
begin
  inherited;
  tblKrzd.Cancel;
end;

procedure TNbjdForm.tblKrzdAfterCancel(DataSet: TDataSet);
begin
  inherited;
  tblKrzd.CancelUpdates;
  tblKrxx.CancelUpdates;
  tblKryj.CancelUpdates;
  tblKfzt.CancelUpdates;
end;

//添加信息导出库
procedure TNbjdForm.AddXxdc;
begin
  with HotelData.tblXxdc do
  begin
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

    Append;
    FieldByName('D_KRBH').AsString := tblKrxxD_KRBH.Value;
    FieldByName('D_KFBH').AsString := tblKrzdD_KFBH.Value;
    FieldByName('D_DDRQ').AsString := FormatDateTime('yyyymmdd',tblKrxxD_DDRQ.AsDateTime);
    FieldByName('D_KRXM').AsString := tblKrxxD_KRXM.Value;
    FieldByName('D_XB').AsString := tblKrxxD_XB.Value;
    FieldByName('D_CSNY').AsString := FormatDateTime('yyyymmdd',tblKrxxD_CSNY.AsDateTime);
    FieldByName('D_MZ').AsString := HotelData.FindMc('MZDM','D_MZBH','D_MZMC',tblKrxxD_MZBH.Value);
    FieldByName('D_JG').AsString := HotelData.FindMc('DQDM','D_DQBH','D_DQMC',tblKrxxD_DQBH.Value);
    FieldByName('D_GZDW').AsString := tblKrxxD_DWMC.Value;
    FieldByName('D_ZY').AsString := tblKrxxD_ZY.Value;
    FieldByName('D_JTDZ').AsString := tblKrxxD_JTDZ.Value;
    FieldByName('D_ZJLX').AsString := HotelData.FindMc('ZJDM','D_ZJBH','D_ZJMC',tblKrxxD_ZJBH.Value);
    FieldByName('D_ZJHM').AsString := tblKrxxD_ZJHM.Value;
    Post;
    Close;
  end;
end;

//确认
procedure TNbjdForm.btnOKClick(Sender: TObject);
begin
  inherited;
  //获得部门编号
  FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);

  //客人帐单存盘
  tblKrzd.Post;

  //事务启动
  HotelData.DatabaseUser.StartTransaction;
  try
    tblKrxx.ApplyUpdates;
    tblKryj.ApplyUpdates;
    tblKrzd.ApplyUpdates;
    tblKfzt.ApplyUpdates;

    //如果有半全价，添加到帐单中
    if FBqj<>BQJ_ZC then
      AddZd;

    //添加员工开房库
    HotelData.YgkfAppend(DQCZY.CzyXm,tblKrzdD_KFBH.Value,tblKrxxD_KRXM.Value,tblKRZDD_SJFJ.Value,tblKrxxD_DDRQ.Value,tblKrxxD_DDSJ.Value);
    HotelData.YgkfAppend(DQJZY.CzyXm,tblKrzdD_KFBH.Value,tblKrxxD_KRXM.Value,tblKRZDD_SJFJ.Value,tblKrxxD_DDRQ.Value,tblKrxxD_DDSJ.Value);

    //添加到信息导出库
    AddXxdc;

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
  tblKfzt.CommitUpdates;
  if Confirm('继续录入新客人吗？') then
  begin
    tblKrzd.Insert;
    ShowJdxx;
    dbeKfbh.SetFocus;
  end
  else
  Close;
end;

procedure TNbjdForm.tblKrzdBeforePost(DataSet: TDataSet);
begin
  inherited;
  if tblKrzdD_KFBH.Value = '' then
    raise Exception.Create('请输入房间号！');
  if tblKrzdD_SJFJ.IsNull then
    raise Exception.Create('请输入房价！');
  if (tblKryjD_FKFS.Value=FKFS_RMB)and(tblKryjD_YFJE.IsNull) then
    raise Exception.Create('请输入预付金额');

  UpdateKrzd;
  UpdateKrxx;
  UpdateKryj;
  UpdateKfzt;
end;

//检查房价
procedure TNbjdForm.tblKrzdD_SJFJValidate(Sender: TField);
begin
  inherited;
  if tblKrzdD_SJFJ.Value <= 0 then
    raise Exception.Create('房价必须大于零！');
end;

//检查预付金额
procedure TNbjdForm.tblKryjD_YFJEValidate(Sender: TField);
begin
  inherited;
  if (tblKryjD_YFJE.Required)and(tblKryjD_YFJE.Value<=0) then
    raise Exception.Create('预付金额必须大于零！');
end;

//改变预付方式
procedure TNbjdForm.tblKryjD_FKFSChange(Sender: TField);
begin
  inherited;
  tblKryjD_YFJE.Required := tblKryjD_FKFS.Value = FKFS_RMB;
  tblKryjD_XYKBH.Required:= tblKryjD_FKFS.Value = FKFS_XYK;
  tblKryjD_KHBH.Required := tblKryjD_FKFS.Value = FKFS_JZ;

  if tblKryjD_FKFS.Value <> FKFS_RMB then
    tblKryjD_YFJE.Value := 0;
    
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

procedure TNbjdForm.tblKrzdD_CZYXMChange(Sender: TField);
begin
  inherited;
  FCzyxm := tblKrzdD_CZYXM.Value;
  DQCZY.CzyXm := FCzyxm;
end;

procedure TNbjdForm.tblKrzdD_JZYXMChange(Sender: TField);
begin
  inherited;
  FJzyxm := tblKrzdD_JZYXM.Value;
  DQJZY.CzyXm := FJzyxm;
end;

//检查客房入住有效性
procedure TNbjdForm.tblKrzdD_KFBHValidate(Sender: TField);
begin
  inherited;
  if HotelData.CheckKfzt(tblKrzdD_KFBH.Value)<>KFZT_OK then
    raise Exception.Create('该客房已经有人入住，请选择其他客房！');
end;

//检查身份证
procedure TNbjdForm.tblKrxxD_ZJHMValidate(Sender: TField);
begin
  inherited;
  if (not ValidSfz(tblKrxxD_ZJHM.Value))and(tblKrxxD_ZJHM.Value<>'') then
    raise Exception.Create('非法身份证号码！');
end;

//改变证件类型时
procedure TNbjdForm.tblKrxxD_ZJBHChange(Sender: TField);
begin
  inherited;
  //清空证件号码
  tblKrxxD_ZJHM.Value := '';

  //如果是身份证
  if HotelData.FindMc('ZJDM','D_ZJBH','D_ZJMC',tblKrxxD_ZJBH.Value) = '身份证' then
  begin
    tblKrxxD_ZJHM.OnValidate := tblKrxxD_ZJHMValidate;
    dbeZjhm.OnKeyPress := dbeZjhmKeyPress;
  end
  else
  begin
    tblKrxxD_ZJHM.OnValidate := nil;
    dbeZjhm.OnKeyPress := nil;
  end;
end;

procedure TNbjdForm.dbeZjhmKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not (Key in ['0'..'9'])) and (Ord(Key) <> VK_BACK) then
  begin
    Key := #0;
    Beep;
  end;
end;

//判断来店次数和黑名单
procedure TNbjdForm.dbeKrxmExit(Sender: TObject);
var
  i : Integer;
  s : string;
begin
  inherited;
  if dbeKrxm.Text <> '' then
  begin
    i := HotelData.Ldcs(dbeKrxm.Text);
    if i=0 then
      lblInfo.Caption := '友情提醒：该客人是首次来店'
    else
      lblInfo.Caption := '友情提醒：该客人是第'+IntToStr(i+1)+'次来店';
    s := HotelData.IsHmd(dbeKrxm.Text,'');
    if s<>'' then
      ShowInfo('该客人姓名列入了黑名单！'+#13#10+s);
    LoadKrxx(dbeKrxm.Text);
  end
  else
    dbeKrxm.SetFocus;
end;

procedure TNbjdForm.dbcXbKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = '2' then tblKrxxD_XB.Value := '女'
  else
  if Key = '1' then tblKrxxD_XB.Value := '男';
end;

procedure TNbjdForm.HelpInfo(Sender: TObject);
begin
  inherited;
  lblHelp.Caption := Info_Help[(Sender as TComponent).Tag];
end;

procedure TNbjdForm.dbcFkfsKeyPress(Sender: TObject; var Key: Char);
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

procedure TNbjdForm.dbcCzyxmExit(Sender: TObject);
begin
  inherited;
  if HotelData.FindBh('YGDA','D_YGBH','D_YGXM',tblKrzdD_CZYXM.Value)='' then
  begin
    FCzyxm := GetMc(dbcCzyxm.Items[dbcCzyxm.ItemIndex]);
    DQCZY.CzyXm := FCzyxm;
    if HotelData.FindBh('YGDA','D_YGBH','D_YGXM',FCzyxm)<>'' then
      tblKrzdD_CZYXM.Value := FCzyxm
    else
      dbcCzyxm.SetFocus;
  end;
end;

procedure TNbjdForm.dbcJzyxmExit(Sender: TObject);
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
      DQJZY.CzyXm := FJzyxm;
    end
    else
      dbcJzyxm.SetFocus;
  end;
end;

procedure TNbjdForm.dbcXykbhExit(Sender: TObject);
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

procedure TNbjdForm.dbcKhbhExit(Sender: TObject);
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

procedure TNbjdForm.dbcMzExit(Sender: TObject);
var
  AMzbh,AMzmc: string;
begin
  inherited;
  AMzmc := HotelData.FindMc('MZDM','D_MZBH','D_MZMC',tblKrxxD_MZBH.Value);
  if AMzmc='' then
  begin
    AMzmc := dbcMz.Text;
    AMzbh := HotelData.FindBh('MZDM','D_MZBH','D_MZMC',AMzmc);
    if AMzbh<>'' then
    begin
      tblKrxxD_MZBH.Value := AMzbh;
      lblMz.Caption := AMzmc;
      Exit;
    end;

    //edit 
    AMzmc := GetMc(dbcMz.Items[dbcMz.ItemIndex]);
    AMzbh := HotelData.FindBh('MZDM','D_MZBH','D_MZMC',AMzmc);
    if AMzbh<>'' then
    begin
      tblKrxxD_MZBH.Value := AMzbh;
      lblMz.Caption := AMzmc;
    end
    else
      dbcMz.SetFocus;
  end
  else
    lblMz.Caption := AMzmc;
end;

procedure TNbjdForm.dbcDqbhExit(Sender: TObject);
var
  ADqbh,ADqmc: string;
begin
  inherited;
  ADqmc := HotelData.FindMc('DQDM','D_DQBH','D_DQMC',tblKrxxD_DQBH.Value);
  if ADqmc='' then
  begin
    ADqmc := dbcDqbh.Text;
    ADqbh := HotelData.FindBh('DQDM','D_DQBH','D_DQMC',ADqmc);
    if ADqbh<>'' then
    begin
      tblKrxxD_DQBH.Value := ADqbh;
      lblDqmc.Caption := ADqmc;
      Exit;
    end;

    ADqmc := GetMc(dbcDqbh.Items[dbcDqbh.ItemIndex]);
    ADqbh := HotelData.FindBh('DQDM','D_DQBH','D_DQMC',ADqmc);
    if ADqbh<>'' then
    begin
      tblKrxxD_DQBH.Value := ADqbh;
      lblDqmc.Caption := ADqmc;
    end
    else
      dbcDqbh.SetFocus;
  end
  else
    lblDqmc.Caption := ADqmc;
end;

procedure TNbjdForm.dbcZjlxExit(Sender: TObject);
var
  AZjbh,AZjmc: string;
begin
  inherited;
  AZjmc := HotelData.FindMc('ZJDM','D_ZJBH','D_ZJMC',tblKrxxD_ZJBH.Value);
  if AZjmc='' then
  begin
    AZjmc := dbcZjlx.Text;
    AZjbh := HotelData.FindBh('ZJDM','D_ZJBH','D_ZJMC',AZjmc);
    if AZjbh<>'' then
    begin
      tblKrxxD_ZJBH.Value := AZjbh;
      lblZjmc.Caption := AZjmc;
      Exit;
    end;

    AZjmc := GetMc(dbcZjlx.Items[dbcZjlx.ItemIndex]);
    AZjbh := HotelData.FindBh('ZJDM','D_ZJBH','D_ZJMC',AZjmc);
    if AZjbh<>'' then
    begin
      tblKrxxD_ZJBH.Value := AZjbh;
      lblZjmc.Caption := AZjmc;
    end
    else
      dbcZjlx.SetFocus;
  end
  else
    lblZjmc.Caption := AZjmc;
end;

procedure TNbjdForm.dbeSjfjExit(Sender: TObject);
begin
  inherited;
  if dbeSjfj.Text = '' then dbeSjfj.SetFocus;
  if StrToCurr(dbeSjfj.Text) >500 then
  begin
    lblInfo.Caption := '友情提醒:你输入的房价可能有错误！';
    Label3.Font.Color := clRed;
    if not Confirm('你输入的房价可能有错误！你确认吗？') then
      dbeSjfj.SetFocus;
  end;
end;

procedure TNbjdForm.dbeYfjeExit(Sender: TObject);
begin
  inherited;
  if dbeYfje.Text = '' then dbeYfje.SetFocus;
end;

procedure TNbjdForm.dbeZjhmExit(Sender: TObject);
var
  s : string;
begin
  inherited;
  if tblKrxxD_ZJBH.Value = '01' then
  begin
    if dbeZjhm.Text = '' then dbeZjhm.SetFocus;
  end;
  if dbeZjhm.Text <> '' then
  begin
    s := HotelData.IsHmd('',dbeZjhm.Text);
    if s <> '' then
      ShowInfo('该客人的证件号码列入了黑名单！'+#13#10+s);
  end;
end;

procedure TNbjdForm.dbcKhbhDblClick(Sender: TObject);
begin
  inherited;
  tblKryjD_KHBH.Value := KhdaSel;
end;

procedure TNbjdForm.dbeKfbhExit(Sender: TObject);
begin
  inherited;
  if dbeKfbh.Text = '' then dbeKfbh.SetFocus;
end;

procedure TNbjdForm.dbeZjhmKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
  begin
    dbeZjhm.OnExit := nil;
    dbcZjlx.SetFocus;
    dbeZjhm.OnExit := dbeZjhmExit;
  end;
end;

end.

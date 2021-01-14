{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_Tdbd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, DB, DBTables,
  Grids, ValEdit, Mask, DBCtrls, C_Define;

type
  TKf = record
    AKfbh: string;
    ASjfj: Currency;
    AJjfj: Currency;
  end;

type
  TTdbdForm = class(TStdJdForm)
    tblKrxx: TTable;
    Panel4: TPanel;
    vleKf: TValueListEditor;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsKrxx: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    lblBfh: TLabeledEdit;
    lblEfh: TLabeledEdit;
    lblFj: TLabeledEdit;
    btnInsert: TBitBtn;
    edtQfrq: TMaskEdit;
    edtQfsj: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
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
    tblKrxxD_QDR1: TStringField;
    tblKrxxD_QDR2: TStringField;
    tblKrxxD_QDR3: TStringField;
    tblKrxxD_QDR4: TStringField;
    procedure lblBfhKeyPress(Sender: TObject; var Key: Char);
    procedure btnInsertClick(Sender: TObject);
    procedure tblZdAfterPost(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FBmbh: string;
    FZdbh: string;
    FKrbh: string;
    FYjbh: string;
    FItemNo: Integer;
    FBqj: Integer;
    FQfrq: TDateTime;
    FQfsj: TDateTime;
    FTotal: Currency;
    FTdxx: TTdxx;
    procedure UpdateKfzt(AKf: TKf);
    procedure AddZd(AKf: TKf);
  public
    { Public declarations }
  end;

var
  TdbdForm: TTdbdForm;

procedure Tdbd(const AKrbh: string);

implementation

uses C_HotelData;

{$R *.dfm}

//团队补登
procedure Tdbd(const AKrbh: string);
begin
  TdbdForm := TTdbdForm.Create(Application);
  try
    with TdbdForm do
    begin
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
      tblKrxx.Locate('D_KRBH',AKrbh,[]);
      //获取编号
      FKrbh := AKrbh;
      FTdxx := HotelData.GetTdxx(FKrbh);
      FZdbh := FTdxx.AZdbh;
      FYjbh := FTdxx.AYjbh;
      FItemNo := FTdxx.AZdhh;

      //获取帐单行号
      //FItemNo := HotelData.GetMaxZdhh(FZdbh);

      //初始化
      edtQfrq.Text := FormatDateTime('yyyy-mm-dd',Date);
      edtQfsj.Text := FormatDateTime('hh:mm',Time);

      ShowModal;
    end;
  finally
    TdbdForm.tblKrxx.Close;
    TdbdForm.Free;
  end;
end;

//添加帐单
procedure TTdbdForm.AddZd(AKf: TKf);
var
  s : string;
begin
  s := 'insert into KRZD (D_ZDBH,D_HH,D_ZDLB,D_KRBH,D_YJBH,D_KFBH,'
                        +'D_SJFJ,D_XMBH,D_XFJE,D_XFRQ,D_XFSJ,D_JZBZ,'
                        +'D_JSBZ,D_CZYXM,'
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
                        +'"'+FormatDateTime('yyyy-mm-dd',FQfrq)+'",'
                        +'"'+DateTimeToStr(FQfsj)+'",'
                        +'"'+JZ_NO+'",'
                        +'"'+JS_NO+'",'
                        +'"'+CZY.CzyXm+'",'
                        +'"'+CZY.CzyXm+'",'
                        +'"'+FBmbh+'",'
                        +'"'+ZDBZ_TD+AKf.AKfbh+' '+DBEdit1.Text+'")';
  HotelData.ExecSql(s);

{  tblZd.Insert;
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
  tblZdD_XFRQ.Value := FQfrq;
  tblZdD_XFSJ.Value := FQfsj;
  tblZdD_JZBZ.Value := JZ_NO;
  tblZdD_JSBZ.Value := JS_NO;
  tblZdD_BMBH.Value := FBmbh;
  tblZdD_BZ.Value   := ZDBZ_TD+AKf.AKfbh+' '+DBEdit1.Text;
  tblZdD_CZYXM.Value:= CZY.CzyXm;
  tblZdD_JZYXM.Value:= CZY.CzyXm;
  tblZd.Post;}

end;

//更新客房状态
procedure TTdbdForm.UpdateKfzt(AKf: TKf);
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

{  if tblKfzt.FindKey([AKf.AKfbh]) then
  begin
    tblKfzt.Edit;

    case FBqj of
      BQJ_ZC:
        tblKfztD_KFBZ.Value := KFBZ_DT;
      else
        begin
          tblKfztD_KFBZ.Value := KFBZ_FT;
          tblKfztD_QJS.Value  := tblKfztD_QJS.Value + 1;
          //20020701 edit by ls.
          tblKfztD_JJFJ.Value := tblKfztD_JJFJ.Value+AKf.ASjfj;
          AKf.AJjfj           := AKf.ASjfj;
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

    if FBqj<>BQJ_ZC then
      HotelData.UpdateBqj(AKf.AKfbh,FBqj,AKf.ASjfj,AKf.AJjfj)
    else
      HotelData.UpdateBqj(Akf.AKfbh,FBqj,AKf.ASjfj,0);
  end;}
end;

procedure TTdbdForm.lblBfhKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not(Key in ['0'..'9']))and(Ord(Key)<>VK_BACK) then
  begin
    Key := #0;
    Beep;
  end;
end;

//插入客房号
procedure TTdbdForm.btnInsertClick(Sender: TObject);
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
    raise;
  end;
end;

procedure TTdbdForm.tblZdAfterPost(DataSet: TDataSet);
begin
  inherited;
end;

//确认
procedure TTdbdForm.btnOKClick(Sender: TObject);
var
  I  : Integer;
  AKf: TKf;
  s  : string;
begin
  inherited;

  try
    FQfrq := StrToDate(edtQfrq.Text);
    FQfsj := StrToTime(edtQfsj.Text);
  except
    raise;
  end;

  if vleKf.Cells[0,1]='' then
    raise Exception.Create('请添加客房！');

  //获取部门编号
  FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);
  FBqj := CheckDdsj(FQfsj);
  //事务启动
  HotelData.DatabaseUser.StartTransaction;
  try
    for I:=1 to vleKf.RowCount-1 do
    begin
      AKf.AKfbh := vleKf.Keys[I];
      try
        AKf.ASjfj := StrToCurr(vleKf.Values[vleKf.Keys[I]]);
      except
        Exit;
        raise;
      end;

      if AKf.ASjfj <= 0 then
        raise Exception.Create('房价必须大于零！');


      if FBqj<>BQJ_ZC then
        AKf.AJjfj := AKf.ASjfj
      else
        AKf.AJjfj := 0;

      //添加子单
      AddZd(AKf);
      Inc(FItemNo);
      FTotal := FTotal + AKf.AJjfj;
      //更新客房状态
      UpdateKfzt(AKf);

    end;
    //修改总单
    if FTotal > 0 then
    begin
      s := 'update KRZD set D_XFJE='+CurrToStr(FTotal)+' where (D_ZDBH="'+FZdbh+'")and(D_HH=0)';
      HotelData.ExecSql(s);
    end;

    {//修改总单
    if tblZd.FindKey([FZdbh,0]) then
    begin
      tblZd.Edit;
      tblZdD_XFJE.Value := tblZdD_XFJE.Value+FTotal;
      tblZd.Post;
    end;
    }
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

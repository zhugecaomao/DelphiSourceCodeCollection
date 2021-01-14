unit C_Wbjd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Nbjd, DB, DBTables, DosMove, StdCtrls, Buttons, DBCtrls, Mask,
  ExtCtrls, C_Define, ComCtrls;

type
  TWbjdForm = class(TNbjdForm)
    dbeQzyxq: TDBEdit;
    Label1: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    dbeYwx: TDBEdit;
    dbeYwm: TDBEdit;
    procedure tblKrxxNewRecord(DataSet: TDataSet);
    procedure dbcDqbhExit(Sender: TObject);
    procedure dbcMzExit(Sender: TObject);
  private
    { Private declarations }
    procedure ShowJdxx;
  public
    { Public declarations }
  end;

var
  WbjdForm: TWbjdForm;

procedure Wbjd;
procedure WbjdEnter(const AKfbh: string);

implementation

uses C_HotelData;

{$R *.dfm}

procedure Wbjd;
begin
  if Application.FindComponent('WbjdForm') is TWbjdForm then
  begin
    ShowInfo('对不起，外宾接待正在运行中！');
    Exit;
  end;
  WbjdForm := TWbjdForm.Create(Application);
  try
    with WbjdForm do
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
    WbjdForm.tblKrzd.Close;
    WbjdForm.Free;
  end;
end;

procedure WbjdEnter(const AKfbh: string);
begin
  if Application.FindComponent('WbjdForm') is TWbjdForm then
  begin
    ShowInfo('对不起，外宾接待正在运行中！');
    Exit;
  end;

  if (HotelData.CheckKfzt(AKfbh)<>KFZT_OK) then
    raise Exception.Create('该客房不是空房，请刷新房态！');

  WbjdForm := TWbjdForm.Create(Application);
  try
    with WbjdForm do
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
    WbjdForm.tblKrzd.Close;
    WbjdForm.Free;
  end;
end;

procedure TWbjdForm.ShowJdxx;
begin
  HotelData.ListDbDm(dbcCzyxm,'YGDA','D_YGXM');
  HotelData.ListDbDm(dbcJzyxm,'YGDA','D_YGXM');
  HotelData.ListDbDm(dbcXykbh,'XYK','D_XYKMC');
  HotelData.ListDbDm(dbcKhbh,'KHDA','D_KHMC');
  HotelData.ListDbDm(dbcMz,'QZDM','D_QZMC');
  HotelData.ListDbDm(dbcDqbh,'GBDM','D_GBMC');
  HotelData.ListDbDm(dbcZjlx,'ZJDM','D_ZJMC');
end;

procedure TWbjdForm.tblKrxxNewRecord(DataSet: TDataSet);
var
  ARecInfo : TRecInfo;
begin
  tblKrxxD_KRLX.Value := KRLX_WB;
  tblKrxxD_DDRQ.Value := Date;
  tblKrxxD_DDSJ.Value := Time;
  tblKrxxD_NZTS.Value := 1;
  tblKrxxD_XB.Value   := XB_MAN;
  //20020627 edit by ls.
  ARecInfo            := HotelData.GetFirstRec('ZJDM','D_ZJBH','D_ZJMC');
  tblKrxxD_ZJBH.Value := ARecInfo.ABh;
  lblZjmc.Caption     := ARecInfo.AMc;
  ARecInfo            := HotelData.GetFirstRec('QZDM','D_QZBH','D_QZMC');
  tblKrxxD_QZBH.Value := ARecInfo.ABh;
  lblMz.Caption       := ARecInfo.AMc;
  ARecInfo            := HotelData.GetFirstRec('GBDM','D_GBBH','D_GBMC');
  tblKrxxD_GBBH.Value := ARecInfo.ABh;
  lblDqmc.Caption     := ARecInfo.AMc;

  tblKrxxD_TLSY.Value := '商务';
end;

procedure TWbjdForm.dbcDqbhExit(Sender: TObject);
var
  ADqbh,ADqmc: string;
begin
  //inherited;
  ADqmc := HotelData.FindMc('GBDM','D_GBBH','D_GBMC',tblKrxxD_GBBH.Value);
  if ADqmc='' then
  begin
    ADqmc := GetMc(dbcDqbh.Items[dbcDqbh.ItemIndex]);
    ADqbh := HotelData.FindBh('GBDM','D_GBBH','D_GBMC',ADqmc);
    if ADqbh<>'' then
    begin
      tblKrxxD_GBBH.Value := ADqbh;
      lblDqmc.Caption := ADqmc;
    end
    else
      dbcDqbh.SetFocus;
  end
  else
    lblDqmc.Caption := ADqmc;
end;

procedure TWbjdForm.dbcMzExit(Sender: TObject);
var
  Aqzbh,Aqzmc: string;
begin
  //inherited;
  Aqzmc := HotelData.FindMc('QZDM','D_QZBH','D_QZMC',tblKrxxD_QZBH.Value);
  if Aqzmc='' then
  begin
    Aqzmc := GetMc(dbcMz.Items[dbcMz.ItemIndex]);
    Aqzbh := HotelData.FindBh('QZDM','D_QZBH','D_QZMC',Aqzmc);
    if Aqzbh<>'' then
    begin
      tblKrxxD_QZBH.Value := AQzbh;
      lblMz.Caption := Aqzmc;
    end
    else
      dbcMz.SetFocus;
  end
  else
    lblMz.Caption := AQzmc;
end;

end.

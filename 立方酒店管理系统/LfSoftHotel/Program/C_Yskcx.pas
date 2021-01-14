unit C_Yskcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, Mask, DosMove, DB,
  DBTables, DBGridEh;

type
  TYskcxForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    btnClose: TBitBtn;
    Label2: TLabel;
    edtKhbh: TEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    cmbXfxm: TComboBox;
    Label4: TLabel;
    edtBd: TMaskEdit;
    Label5: TLabel;
    edtEd: TMaskEdit;
    btnQuery: TBitBtn;
    DosMove1: TDosMove;
    qryWork: TQuery;
    dsWork: TDataSource;
    qryWorkD_KHBH: TStringField;
    qryWorkD_ZDBH: TStringField;
    qryWorkD_HH: TIntegerField;
    qryWorkD_XMBH: TStringField;
    qryWorkD_XFDJ: TFloatField;
    qryWorkD_XFSL: TFloatField;
    qryWorkD_XFJE: TFloatField;
    qryWorkD_XFRQ: TDateTimeField;
    qryWorkD_XFSJ: TDateTimeField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_BZ: TStringField;
    qryWorkD_KHMC: TStringField;
    qryWorkD_XMMC: TStringField;
    BitBtn1: TBitBtn;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    qryZz: TQuery;
    dsZz: TDataSource;
    qryZzD_KHBH: TStringField;
    qryZzD_XMBH: TStringField;
    qryZzSUM: TFloatField;
    qryZzD_KHMC: TStringField;
    qryZzD_XMMC: TStringField;
    btnPrint: TBitBtn;
    lblHjje: TLabel;
    lblJe: TLabel;
    btnPrintzz: TBitBtn;
    procedure cmbXfxmExit(Sender: TObject);
    procedure edtKhbhExit(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure OnPrintMx(Sender: TObject);
    procedure OnPrintZz(Sender: TObject);
  private
    { Private declarations }
    FKhbh: string;
    FBd,FEd: TDateTime;
    FXmbh: string;
    FHjje: Currency;
    FSqlStr: string;
    function GetCxtj: string;
    function GetHjje: Currency;
  public
    { Public declarations }
  end;

var
  YskcxForm: TYskcxForm;

procedure Yskcx;

implementation

uses C_HotelData, C_Define, C_KhdaSel, C_PrintDlg;

{$R *.dfm}
procedure Yskcx;
begin
  YskcxForm := TYskcxForm.Create(Application);
  try
    with YskcxForm do
    begin
      FKhbh := '';
      FXmbh := '';
      lblJe.Caption := '';
      HotelData.ListDm(cmbXfxm,'XMDM','D_XMMC');
      ShowModal;
    end;
  finally
    YskcxForm.Free;
  end;
end;

function TYskcxForm.GetHjje: Currency;
begin
  with HotelData.qryUserData do
  begin
    CLose;
    SQL.Clear;
    SQL.Add(FSqlStr);
    if (FBd<>0)and(FEd<>0) then
    begin
      ParamByName('BD').AsDate := FBd;
      ParamByName('ED').AsDate := FEd;
    end;
    Prepare;
    Open;
    if Fields[0].IsNull then Result := 0
    else Result := Fields[0].AsCurrency;
  end;
end;

function TYskcxForm.GetCxtj: string;
var
  s : string;
begin
  s := '';
  if edtBd.Text = '    -  -  ' then FBd := 0
  else
    FBd := StrToDate(edtBd.Text);

  if edtEd.Text = '    -  -  ' then FEd := 0
  else
    FEd := StrToDate(edtEd.Text);

  if (FBd = 0)and(FEd <> 0) then
  begin
    ShowMessage('请输全消费日期！');
    s := '';
    Exit;
  end;

  if (FBd <> 0)and(FEd = 0) then
  begin
    ShowMessage('请输全消费日期！');
    s := '';
    Exit;
  end;
  if FKhbh<>'' then
    s := ' (D_KHBH="'+FKhbh+'") ';

  if FXmbh<>'' then
  begin
    if s='' then s := ' (D_XMBH="'+FXmbh+'") '
    else s := s + ' and (D_XMBH="'+FXmbh+'") ';
  end;

  if (FBd<>0)and(FEd<>0) then
  begin
    if s='' then s := ' (D_XFRQ>=:BD)and(D_XFRQ<=:ED) '
    else s:= s + ' and(D_XFRQ>=:BD)and(D_XFRQ<=:ED) ';
  end;
  FSqlStr := '';
  if s='' then
  begin
    s := 'select * from YSK ';
    FSqlStr := 'select sum(D_XFJE) from YSK where D_XMBH<>"'+XMBH_YJK+'"';
  end
  else
  begin
    FSqlStr := 'select sum(D_XFJE) from YSK where (D_XMBH<>"'+XMBH_YJK+'") and '+s;
    s := 'select * from YSK where '+s;
  end;
  Result := s + ' order by D_KHBH,D_XFRQ,D_XFSJ';
end;

procedure TYskcxForm.cmbXfxmExit(Sender: TObject);
begin
  FXmbh := HotelData.FindUserBh('XMDM','D_XMBH','D_XMMC',GetMc(cmbXfxm.Items[cmbXfxm.ItemIndex]));
end;

procedure TYskcxForm.edtKhbhExit(Sender: TObject);
begin
  FKhbh := edtKhbh.Text;
end;

procedure TYskcxForm.btnQueryClick(Sender: TObject);
var
  s : string;
begin
  s := GetCxtj;
  if s = '' then Exit;
  qryWOrk.Close;
  qryWork.SQL.Clear;
  qryWork.SQL.Add(s);
  if (FBd<>0)and(FEd<>0) then
  begin
    qryWork.ParamByName('BD').AsDate := FBd;
    qryWork.ParamByName('ED').AsDate := FEd;
  end;
  qryWork.Prepare;
  qryWork.Open;
  s := '';
  if (FBD<>0)and(FED<>0) then
  begin
    if FKhbh = '' then
      s := 'select D_KHBH,D_XMBH,sum(D_XFJE) from YSK where (D_XFRQ>=:BD)and(D_XFRQ<=:ED) group by D_KHBH,D_XMBH'
    else
      s := 'select D_KHBH,D_XMBH,sum(D_XFJE) from YSK where (D_XFRQ>=:BD)and(D_XFRQ<=:ED)and(D_KHBH="'+FKhbh+'") group by D_KHBH,D_XMBH';
  end
  else
  begin
    if FKhbh='' then
      s := 'select D_KHBH,D_XMBH,sum(D_XFJE) from YSK group by D_KHBH,D_XMBH'
    else
      s := 'select D_KHBH,D_XMBH,sum(D_XFJE) from YSK where D_KHBH="'+FKhbh+'" group by D_KHBH,D_XMBH';
  end;

  s := s + ' order by D_KHBH';
  qryZz.Close;
  qryZz.SQL.Clear;
  qryZz.SQL.Add(s);
  if (FBd<>0)and(FEd<>0) then
  begin
    qryZz.ParamByName('BD').AsDate := FBd;
    qryZz.ParamByName('ED').AsDate := FEd;
  end;
  qryZz.Prepare;
  qryZz.Open;

  FHjje := GetHjje;
  lblJe.Caption := FormatFloat('#.##',FHjje);
end;

procedure TYskcxForm.SpeedButton1Click(Sender: TObject);
begin
  FKhbh := KhdaSel;
  edtKhbh.Text := FKhbh;
end;

procedure TYskcxForm.BitBtn1Click(Sender: TObject);
begin
  lblJe.Caption := '';
  edtKhbh.Text := '';
  FKhbh := '';
  cmbXfxm.ItemIndex := -1;
  FXmbh := '';
  edtBd.Text := '';
  edtEd.Text := '';
  FBd := 0;
  FEd := 0;
  qryWork.Close;
  qryZz.Close;
  edtKhbh.SetFocus;
end;

procedure TYskcxForm.OnPrintMx(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '客户应收款（'+HotelData.FindMc('KHDA','D_KHBH','D_KHMC',FKhbh)+ '）';
  APrintStru.ASub := '应收总额:'+lblJe.Caption;
  APrintStru.ADataSet := qryWork;
  PrintLb1(APrintStru,DBGridEh1);
end;

procedure TYskcxForm.OnPrintZz(Sender: TObject);
begin
  PrintDlg('应收款总帐','应收款总帐',dsZz,nil,nil,nil);
end;

end.

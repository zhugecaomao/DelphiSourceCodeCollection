unit C_Ldkr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, Grids, DBGrids, DosMove, ExtCtrls;

type
  TLdkrForm = class(TForm)
    Label1: TLabel;
    qryKrxx: TQuery;
    dsKrxx: TDataSource;
    DBGrid1: TDBGrid;
    edtKfbh: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtKrxm: TEdit;
    Label4: TLabel;
    edtJtdz: TEdit;
    Label5: TLabel;
    edtDwmc: TEdit;
    Label6: TLabel;
    edtDdrq: TEdit;
    Label7: TLabel;
    edtLdrq: TEdit;
    Label8: TLabel;
    edtZjhm: TEdit;
    btnQuery: TButton;
    DosMove1: TDosMove;
    qryKrxxD_KRBH: TStringField;
    qryKrxxD_KRXM: TStringField;
    qryKrxxD_KRLX: TStringField;
    qryKrxxD_DDRQ: TDateTimeField;
    qryKrxxD_DDSJ: TDateTimeField;
    qryKrxxD_LDRQ: TDateTimeField;
    qryKrxxD_LDSJ: TDateTimeField;
    qryKrxxD_YWX: TStringField;
    qryKrxxD_YWM: TStringField;
    qryKrxxD_XB: TStringField;
    qryKrxxD_MZBH: TStringField;
    qryKrxxD_DQBH: TStringField;
    qryKrxxD_GBBH: TStringField;
    qryKrxxD_NZTS: TIntegerField;
    qryKrxxD_TLSY: TStringField;
    qryKrxxD_ZJBH: TStringField;
    qryKrxxD_ZJHM: TStringField;
    qryKrxxD_CSNY: TDateTimeField;
    qryKrxxD_HCL: TStringField;
    qryKrxxD_HCQ: TStringField;
    qryKrxxD_QZBH: TStringField;
    qryKrxxD_QZYXQ: TDateTimeField;
    qryKrxxD_ZY: TStringField;
    qryKrxxD_LXDH: TStringField;
    qryKrxxD_DWMC: TStringField;
    qryKrxxD_JTDZ: TStringField;
    qryKrxxD_JDR: TStringField;
    qryKrxxD_JDDW: TStringField;
    qryKrxxD_BZ: TStringField;
    qryKrxxD_QDR1: TStringField;
    qryKrxxD_QDR2: TStringField;
    qryKrxxD_QDR3: TStringField;
    qryKrxxD_QDR4: TStringField;
    qryKrxxD_KFBH: TStringField;
    qryKrxxD_SJFJ: TFloatField;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    btnXxzl: TButton;
    qryKrzd: TQuery;
    dsKrzd: TDataSource;
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
    qryKrzdD_BMBH: TStringField;
    qryKrzdD_XMMC: TStringField;
    procedure OnQuery(Sender: TObject);
    procedure OnXxzl(Sender: TObject);
    procedure qryKrxxBeforeOpen(DataSet: TDataSet);
    procedure qryKrxxBeforeClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LdkrForm: TLdkrForm;

procedure Ldkr;

implementation

uses C_HotelData, C_Define, C_Krxx;

{$R *.dfm}

procedure Ldkr;
begin
  LdkrForm := TLdkrForm.Create(Application);
  try
    with LdkrForm do
    begin
      ShowModal;
    end;
  finally
    LdkrForm.Free;
  end;
end;

procedure TLdkrForm.OnQuery(Sender: TObject);
var
  s : string;
begin
  s := '';
  if edtKrxm.Text <> '' then
    s := '(a.D_KRXM like "%'+edtKrxm.Text+'%")';
  if edtJtdz.Text <> '' then
  begin
    if s = '' then
      s := 'a.(D_JTDZ like "%'+edtJtdz.Text+'%")'
    else
      s := s+'and(a.D_JTDZ like "%'+edtJtdz.Text+'%")';
  end;
  if edtDwmc.Text <> '' then
  begin
    if s = '' then
      s := '(a.D_DWMC like "%'+edtDwmc.Text+'%")'
    else
      s := s+'and(a.D_DWMC like "%'+edtDwmc.Text+'%")';
  end;
  if edtZjhm.Text <> '' then
  begin
    if s = '' then
      s := '(a.D_ZJHM like "%'+edtZjhm.Text+'%")'
    else
      s := s+'and(a.D_ZJHM like "%'+edtZjhm.Text+'%")';
  end;
  if edtDdrq.Text <> '' then
  begin
    if s = '' then
      s := '(a.D_DDRQ = "'+edtDdrq.Text+'")'
    else
      s := s+'and(a.D_DDRQ = "'+edtDdrq.Text+'")';
  end;
  if edtLdrq.Text <> '' then
  begin
    if s = '' then
      s := '(a.D_LDRQ = "'+edtLdrq.Text+'")'
    else
      s := s+'and(a.D_LDRQ = "'+edtLdrq.Text+'")';
  end;
  if edtKfbh.Text <> '' then
  begin
    if s = '' then
      s := '(b.D_KFBH="'+edtKfbh.Text+'")'
    else
      s := s + 'and(b.D_KFBH="'+edtKfbh.Text+'")';
  end;

  if s = '' then
    s := 'select a.*,b.D_KFBH,b.D_SJFJ from KRXXDA a,KRZDDA b where (a.D_KRLX<>"'+KRLX_TD+'")and(a.D_KRBH=b.D_KRBH)and(b.D_HH=0)'
  else
    s := 'select a.*,b.D_KFBH,b.D_SJFJ from KRXXDA a,KRZDDA b where '+ s +'and(a.D_KRLX<>"'+KRLX_TD+'")and(a.D_KRBH=b.D_KRBH)and(b.D_HH=0)';
  with qryKrxx do
  begin
    Close;
    SQL.Clear;
    SQL.Add(s);
    Prepare;
    Open;
  end;
end;

procedure TLdkrForm.OnXxzl(Sender: TObject);
begin
  if qryKrxx.IsEmpty then Exit;
  LdkrxxEnter(qryKrxxD_KRBH.Value);
end;

procedure TLdkrForm.qryKrxxBeforeOpen(DataSet: TDataSet);
begin
  qryKrzd.Open;
end;

procedure TLdkrForm.qryKrxxBeforeClose(DataSet: TDataSet);
begin
  qryKrzd.Close;
end;

end.

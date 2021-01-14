unit U_bmlldjshkp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, DBCtrls, ExtCtrls, Db, DBClient, ADODB;

type
  TfrmBmlldDjsh = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    aqKC: TADOQuery;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBmlldDjsh: TfrmBmlldDjsh;

implementation

uses U_fzlr_zgxm, main, WzglDB, uPublic,U_Bmlldgl, uDB;

{$R *.DFM}

procedure TfrmBmlldDjsh.SpeedButton1Click(Sender: TObject);
var
  t_date: tdatetime;
  sysDate : oleVariant;
  vs_clbm: string;
  vr_qlsl, vr_yssl: real; //实收数量，原有数量
  vs_ckmc: string; //仓库名称
  query: TADOQuery;
begin
  if dbedit2.Text = '' then
  begin;
    application.MessageBox('审核人不能为空', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    dbedit2.SetFocus;
    exit;
  end;

  frmBmlld.aqBMLLD_Main.FieldByName(' IsAuditing').value := true;
  frmBmlld.aqBMLLD_Main.post;
  frmBmlld.aqBMLLD_Detail.First;
  
  vs_ckmc := frmBmlld.aqBMLLD_Main.fieldbyname('WName').value;
  while not frmBmlld.aqBMLLD_Detail.eof do
  begin
    vs_clbm := frmBmlld.aqBMLLD_Detail.fieldbyname('MatCode').value;
    query := TADOQuery.Create(Self);
    query.Connection:= dmWarehouse.ACWarehouse;
    query.SQL.Text:= 'select * from KCQKB where WName="'+vs_ckmc+'" and MatCode="'+vs_clbm+'"';
    query.Open;
    //如果该材料存在,那么在该材料的基础上完成减少数量的操作
    if not query.Eof  then
    begin
      vr_qlsl := frmBmlld.aqBMLLD_Detail.fieldbyname('RealNum').value;
      vr_yssl := aqKC.fieldbyname('CurNum').value;
      aqKC.Insert;
      aqKC.FieldByName('MatCode').value := frmBmlld.aqBMLLD_Detail.fieldbyname('MatCode').value;
      aqKC.FieldByName('MatName').value := frmBmlld.aqBMLLD_Detail.fieldbyname('MatName').value;
      aqKC.FieldByName('Size').value := frmBmlld.aqBMLLD_Detail.fieldbyname('Size').value;
      aqKC.FieldByName('CUnit').value := frmBmlld.aqBMLLD_Detail.fieldbyname('CUnit').value;
      aqKC.FieldByName('PlanPrice').value := frmBmlld.aqBMLLD_Detail.fieldbyname('PlanPrice').value;
      aqKC.FieldByName('PriceUnit').value := frmBmlld.aqBMLLD_Detail.fieldbyname('PriceUnit').value;
      aqKC.FieldByName('CurNum').value := vr_yssl - vr_qlsl;
      aqKC.fieldbyname('WName').value := vs_ckmc;
      aqKC.fieldbyname('DeadLine').value := SysDate;
    end
    else
    //否则,在库存情况表中添加新的记录，库存数量直接为负数
    begin
      aqKC.Insert;
      aqKC.FieldByName('MatCode').value := frmBmlld.aqBMLLD_Detail.fieldbyname('MatCode').value;
      aqKC.FieldByName('MatName').value := frmBmlld.aqBMLLD_Detail.fieldbyname('MatName').value;
      aqKC.FieldByName('Size').value := frmBmlld.aqBMLLD_Detail.fieldbyname('Size').value;
      aqKC.FieldByName('CUnit').value := frmBmlld.aqBMLLD_Detail.fieldbyname('CUnit').value;
      aqKC.FieldByName('PlanPrice').value := frmBmlld.aqBMLLD_Detail.fieldbyname('').value;
      aqKC.FieldByName('PriceUnit').value := frmBmlld.aqBMLLD_Detail.fieldbyname('PriceUnit').value;
      aqKC.FieldByName('CurNum').value := 0.00 - frmBmlld.aqBMLLD_Detail.fieldbyname('RealNum').value;
      aqKC.fieldbyname('WName').value := vs_ckmc;
      aqKC.fieldbyname('DeadLine').value := SysDate;
    end;
    frmBmlld.aqBMLLD_Detail.next;
  end;
  aqKC.edit;
  aqKC.post;
  close;
end;

procedure TfrmBmlldDjsh.BitBtn1Click(Sender: TObject);
begin
  frmBmlld.aqBMLLD_Main.FieldByName('AuditingPerson').value := GetEmployeeName;
end;

procedure TfrmBmlldDjsh.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmBmlldDjsh.FormActivate(Sender: TObject);
begin
  frmBmlld.aqBMLLD_Main.Edit;
  dbedit2.setfocus;
end;

end.


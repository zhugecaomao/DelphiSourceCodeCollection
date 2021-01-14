unit U_Sldjshkp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, Db, DBClient, ADODB;

type
  TfrmClsldDjsh = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    aqKC: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClsldDjsh: TfrmClsldDjsh;

implementation

uses USLD,uPublic,uDB;

{$R *.DFM}

procedure TfrmClsldDjsh.BitBtn1Click(Sender: TObject);
begin
  frmSLD.aqSLDMAIN.FieldByName('AuditingPerson').value := GetEmployeeName;
end;

procedure TfrmClsldDjsh.SpeedButton1Click(Sender: TObject);
var
  SysDate: oleVariant;
  vs_clbm: string;
  vr_sssl, vr_yssl: real; //实收数量，原有数量
  vs_ckmc: string;        //仓库名称
  query: TADOQuery;
begin
  aqKC.Close;
  aqKC.Open;
  if dbedit2.text = '' then
  begin
    application.MessageBox('审核人不能为空', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    dbedit2.SetFocus;
    exit;
  end;

  frmSLD.aqSLDMAIN.fieldbyname('IsAuditing').value := true;
  frmSLD.aqSLDMAIN.post;
  frmSLD.aqSLDDetail.First;
  vs_ckmc := frmSLD.aqSLDMAIN.fieldbyname('WName').value;
  frmSLD.aqSLDDetail.disablecontrols;
  while not frmSLD.aqSLDDetail.eof do
  begin
    //从库存情况表中寻找在某一个仓库中某种材料是否已经存在
    vs_clbm := frmSLD.aqSLDDetail.fieldbyname('MatCode').value;
    query := TADOQuery.Create(Self);
    query.Connection:= dmWarehouse.ACWarehouse;
    query.SQL.Text:= 'select * from KCQKB where WName="'+vs_ckmc+'" and MatCode="'+vs_clbm+'"';
    query.Open;
    //如果该材料存在,那么在该材料的基础上完成增加数量的操作
    if not query.Eof  then
    begin
      vr_sssl := frmSLD.aqSLDDetail.fieldbyname('InNum').value;
      vr_yssl := aqKC.fieldbyname('CurNum').value;
      aqKC.Insert;
      aqKC.FieldByName('MatCode').value := frmSLD.aqSLDDetail.fieldbyname('MatCode').value;
      aqKC.FieldByName('MatName').value := frmSLD.aqSLDDetail.fieldbyname('MatName').value;
      aqKC.FieldByName('Size').value := frmSLD.aqSLDDetail.fieldbyname('Size').value;
      aqKC.FieldByName('CUnit').value := frmSLD.aqSLDDetail.fieldbyname('CUnit').value;
      aqKC.FieldByName('PlanPrice').value := frmSLD.aqSLDDetail.fieldbyname('PlanPrice').value;
      aqKC.FieldByName('PriceUnit').value := frmSLD.aqSLDDetail.fieldbyname('PriceUnit').value;
      aqKC.FieldByName('CurNum').value := vr_sssl + vr_yssl;
      aqKC.fieldbyname('WName').value := vs_ckmc;
      aqKC.fieldbyname('DeadLine').value := date;
    end
    else
    //否则,在库存情况表中添加新的记录
    begin
      aqKC.Insert;
      aqKC.FieldByName('MatCode').value := frmSLD.aqSLDDetail.fieldbyname('MatCode').value;
      aqKC.FieldByName('MatName').value := frmSLD.aqSLDDetail.fieldbyname('MatName').value;
      aqKC.FieldByName('Size').value := frmSLD.aqSLDDetail.fieldbyname('Size').value;
      aqKC.FieldByName('CUnit').value := frmSLD.aqSLDDetail.fieldbyname('CUnit').value;
      aqKC.FieldByName('PlanPrice').value := frmSLD.aqSLDDetail.fieldbyname('PlanPrice').value;
      aqKC.FieldByName('PriceUnit').value := frmSLD.aqSLDDetail.fieldbyname('PriceUnit').value;
      aqKC.FieldByName('CurNum').value := frmSLD.aqSLDDetail.fieldbyname('InNum').value;
      aqKC.fieldbyname('WName').value := vs_ckmc;
      aqKC.fieldbyname('DeadLine').value := date;
    end;
    frmSLD.aqSLDDetail.next;
  end;
  frmSLD.aqSLDDetail.enablecontrols;
  aqKC.edit;
  aqKC.post;
  close;
end;

procedure TfrmClsldDjsh.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmClsldDjsh.FormActivate(Sender: TObject);
begin
  dbedit2.setfocus;
end;

end.


unit U_clffd_sort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, Buttons, PrnDbgeh, DB, DBClient,
  FR_Dock, ComCtrls, StdCtrls, ADODB;

type
  Tfrmclffd_sort = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    PrintDBGridEh1: TPrintDBGridEh;
    frTBPanel1: TfrTBPanel;
    btnClose: TSpeedButton;
    btnDelete: TSpeedButton;
    btnEdit: TSpeedButton;
    btnAdd: TSpeedButton;
    SpeedButton1: TSpeedButton;
    frTBPanel2: TfrTBPanel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    Bevel1: TBevel;
    btnQuery: TSpeedButton;
    RadioGroup1: TRadioGroup;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
  private
    procedure query_VW_SFDJ(i,J:integer;bln:boolean;ADO: TADOQuery);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmclffd_sort: Tfrmclffd_sort;

implementation
      USES MAIN,U_DM,u_public,common,utLeasehold,u_clffd,u_clhsd,repClffd_sort;
{$R *.dfm}
//查询数据
procedure Tfrmclffd_sort.query_VW_SFDJ(i,J:integer;bln:boolean;ADO: TADOQuery);
var
  sSql:string;
begin
sSql:='SELECT sfno, jzr, jsr, fhr, bmname, spmc, hsbl, jldw2, ';
if j=0 then 
sSql:=sSql+' fcSL as sl,'
else
sSql:=sSql+' shsl as sl,';
sSql:=sSql+' dj, sfrq, bmbh FROM vw_sfdj  WHERE ';

if J=0 then
sSQL:=sSql+' (ynsf=0) AND ynqc=0'
else
sSql:=sSql+' (ynsf=1) and ynqc=0';

case i of
0:sSql:=sSql+' AND (ynjs=1) ';
1:sSql:=sSql+' AND (ynjs=0) ';
end;
if bln  then
   sSql:=sSql+' and (sfrq between :start and :end)';
sSql:=sSql+' order by sfno';
ado.Close ;
ado.SQL.Clear ;
ado.SQL.Add(sSql);
if bln then
begin
ado.Parameters.ParamByName('start').Value :=dtstart.Date;
ado.Parameters.ParamByName('end').Value :=dtEnd.Date;
end;
ado.Open ;

end;
/////
procedure Tfrmclffd_sort.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //dm.ADO_VW_SFDJ.close;
  action := cafree;
  frmclffd_sort:= nil;
end;

procedure Tfrmclffd_sort.btnCloseClick(Sender: TObject);
begin
close;
end;

procedure Tfrmclffd_sort.FormCreate(Sender: TObject);
begin

top:=0;
left:=0;
dtStart.Date :=date;
dtend.Date :=date;
case CurrentParam.Num of
0:begin
frmclffd_sort.Caption :='材料发放单据';
query_VW_SFDJ(1,0,false,ADOQuery1) ;
end;
1:begin
frmclffd_sort.Caption :='材料回收单据';
query_VW_SFDJ(1,1,false,ADOQuery1) ;
end;
end;
end;

procedure Tfrmclffd_sort.DBGridEh1DblClick(Sender: TObject);
begin
btnEdit.Click ;
end;

procedure Tfrmclffd_sort.btnEditClick(Sender: TObject);
var
 sSfno:string;
begin
CurrentParam.N_E :=1;
sSfno:=trim(DBGridEh1.Fields[1].AsString);
CurrentParam.tmpCode :=sSfno;
if application.MessageBox('是否要此单据?！','材料租赁系统!',MB_YESNO)=IDNO then
  EXIT;
//调入单据表  
//hide;
case CurrentParam.Num of
0:ShowModalForm(TfrmClffd);
//dm.ADO_VW_SFDJ.Filter :='ynsf=0 and ynjs=0';
1:ShowModalForm(TfrmClhsd);
//dm.ADO_VW_SFDJ.Filter :='ynsf=1 and ynjs=0';
end;
query_VW_SFDJ(RadioGroup1.ItemIndex,CurrentParam.Num,CheckBox1.Checked,ADOQuery1) ;
//dm.ADO_VW_SFDJ.Filtered:=true ;
//dm.ADO_VW_SFDJ.Active :=false;
//dm.ADO_VW_SFDJ.Active :=true;
//Show;
end;

procedure Tfrmclffd_sort.btnAddClick(Sender: TObject);
begin
CurrentParam.N_E :=0;
//调入单据表
//hide;
case CurrentParam.Num of
0:begin
ShowModalForm(TfrmClffd);
//dm.ADO_VW_SFDJ.Filter :='ynsf=0 and ynjs=0';
end;
1:begin
ShowModalForm(TfrmClhsd);
//dm.ADO_VW_SFDJ.Filter :='ynsf=1 and ynjs=0';
end;
end;
query_VW_SFDJ(RadioGroup1.ItemIndex,CurrentParam.Num,CheckBox1.Checked,ADOQuery1) ;
//dm.ADO_VW_SFDJ.Filtered:=true ;
//dm.ADO_VW_SFDJ.Active :=false;
//dm.ADO_VW_SFDJ.Active :=true;
//Show;
end;

procedure Tfrmclffd_sort.SpeedButton1Click(Sender: TObject);
var
  qRepClffd_sort:TqRepClffd_sort;
//  i:integer;
begin
  qRepClffd_sort:=TqRepClffd_sort.Create(self);
  qRepClffd_sort.lblTitle.Caption :=caption;
  if not CheckBox1.Checked  then
    qRepClffd_sort.lblDate.Caption :='全部'
    else
    qRepClffd_sort.lblDate.Caption :='从'+datetostr(dtstart.Date)+'到'+datetostr(dtend.Date);
  qRepClffd_sort.lblZbr.Caption :=CurrentParam.UserName;

  //qRepClffd_sort.lblPage.Caption :='/'+inttostr(i);
  qRepClffd_sort.PreviewModal ;
  qRepClffd_sort.lblZbr.Free ;
//PrintDBGridEh1.Title.Text := Caption;
//PrintDBGridEh1.Preview ;
end;

procedure Tfrmclffd_sort.btnDeleteClick(Sender: TObject);
var
  djbh,
  sSQL:string;
begin
if application.MessageBox('是否要删除此单据?！','材料租赁系统!',MB_YESNO)=IDNO then
 exit;
djbh:=trim(dbgrideh1.Fields[1].AsString);
try
frmmain.ADOConnect.BeginTrans ;
sSQL:='DELETE FROM sfdj WHERE sfno=:sfno'; //删除 SFDJ表中数据
deledata('sfno','sfdj',djbh,frmmain.adoqytmp);
sSQL:='DELETE FROM sfmx WHERE sfno=:sfno'; //删除 sfmx表中数据
deledata('sfno','sfmx',djbh,frmmain.adoqytmp);
sSQL:='DELETE FROM ggxhb WHERE sfno=:sfno'; //删除 ggxhb表中数据
deledata('sfno','ggxhb',djbh,frmmain.adoqytmp);
sSQL:='DELETE FROM cljxb WHERE sfno=:sfno'; //删除 ggxhb表中数据
deledata('sfno','cljxb',djbh,frmmain.adoqytmp);
except
Application.MessageBox('删除失败!', '信息', mb_iconInformation + mb_defbutton1);
frmmain.ADOConnect.RollbackTrans;
exit;
end;
frmmain.ADOConnect.CommitTrans ;
Application.MessageBox('此单据号已被删除 !', '信息', mb_iconInformation + mb_defbutton1);
query_VW_SFDJ(3,1,false,ADOQuery1) ;
//dm.ADO_VW_SFDJ.Active :=false;
//dm.ADO_VW_SFDJ.Active :=true;
//query_VW_SFDJ(3,1,false,ADOQuery1) ;
end;

procedure Tfrmclffd_sort.btnQueryClick(Sender: TObject);
begin
query_VW_SFDJ(RadioGroup1.ItemIndex,CurrentParam.Num,CheckBox1.Checked,ADOQuery1) ;
end;

procedure Tfrmclffd_sort.RadioGroup1Click(Sender: TObject);
begin
btnQuery.Click ;
end;

procedure Tfrmclffd_sort.DBGridEh1TitleClick(Column: TColumnEh);
begin
//DbGridEhSort(DBGridEh1,column)  ;
end;

end.

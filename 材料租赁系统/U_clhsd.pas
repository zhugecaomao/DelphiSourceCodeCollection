unit U_clhsd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, DBCtrls, Grids, DBGridEh, DBSumLst,
  DB, ADODB, Buttons;
const iSeri=25;
type
  Tfrmclhsd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBNavigator1: TDBNavigator;
    cmbCl: TComboBox;
    dtDate: TDateTimePicker;
    cmbBm: TComboBox;
    edtCode: TLabeledEdit;
    DBGridEh1: TDBGridEh;
    Panel4: TPanel;
    lblTotal: TLabeledEdit;
    qytmp: TADOQuery;
    btnSave: TSpeedButton;
    btnClose: TSpeedButton;
    Edit1: TEdit;
    edtbm: TEdit;
    pShwomessage: TPanel;
    DBSumList1: TDBSumList;
    Label4: TLabel;
    edtZy: TEdit;
    Panel5: TPanel;
    edtFhr: TLabeledEdit;
    edtJzr: TLabeledEdit;
    edtJsr: TLabeledEdit;
    lblHtotal: TLabeledEdit;
    GroupBox1: TGroupBox;
    DBGridEh2: TDBGridEh;
    DBSumList2: TDBSumList;
    ADOQuery1: TADOQuery;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure DBSumList1SumListChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure cmbClChange(Sender: TObject);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh2KeyPress(Sender: TObject; var Key: Char);
    procedure DBSumList2SumListChanged(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
  procedure cacalnumber(ado:TADOQuery);
//  procedure autocacalnumber(const bh:string;ado:TADOQuery);
  procedure locanumber(ado:TADOQuery);
  procedure Add_Clhsd_Data;
  procedure edtSfdj(const sSfno:string;ado:TADOQuery);
  procedure VisbleTure;
    { Private declarations }
  public
    { Public declarations }
  end;
   function autocacalnumber(const bh:string;ado:TADOQuery):boolean;
var
  frmclhsd: Tfrmclhsd;

implementation
      uses main,u_public,u_dm,common,utLeasehold,U_ggxh, U_clffd,repcl,repcl_t;
{$R *.dfm}
//
procedure Tfrmclhsd.VisbleTure;
var
  strsql,sValue:string;
begin
if not CurrentParam.tzcl then
begin
   DBGridEh1.Visible :=true;
   GroupBox1.Visible :=false;
   DBNavigator1.DataSource :=dm.DS_TBTMP ;
   DBSumList1.Activate(TRUE);
   DBSumList2.Activate(false);
   DBNavigator1.Visible :=TRUE;
end else
begin
   DBGridEh1.Visible :=false;
   GroupBox1.Visible :=true;
   DBSumList1.Activate(false);
   DBSumList2.Activate(true);
if CurrentParam.N_E =0 then
begin
strsql:='Select * from sfdj where sfno=:@sfno ';
with ADOQuery1 do
begin
   strsql:='DELETE FROM ggxhb WHERE sfno='+QuotedStr(trim(edtcode.Text));
   close;
   sql.Clear ;
   sql.Add(strsql);
   Prepared ;
   ExecSQL ;
//end;
end;
end;
   dm.ADO_GGXHB.Active :=FALSE;
   dm.ADO_GGXHB.Active :=true;
   DBNavigator1.DataSource :=DM.DS_GGXHB ;
   GroupBox1.Align :=alClient;
    DBNavigator1.Visible :=TRUE;
end;
end;
//修改发放单据
procedure Tfrmclhsd.edtSfdj(const sSfno:string;ado:TADOQuery);
var
  sSQL:string;
  nCount:integer;
begin
  DM.ADO_VW_SFDJ.Filter :='sfno='+''''+sSfno+'''';
  DM.ADO_VW_SFDJ.Filtered :=TRUE;
  DM.ADO_VW_SFDJ.Active :=TRUE;
  edtcode.Text :=trim(dm.ADO_VW_SFDJ.Fieldbyname('sfno').AsString);
  edtfhr.Text :=trim(dm.ADO_VW_SFDJ.Fieldbyname('fhr').AsString) ;
  edtjzr.Text :=trim(dm.ADO_VW_SFDJ.Fieldbyname('jzr').AsString) ;
  edtjsr.Text :=trim(dm.ADO_VW_SFDJ.Fieldbyname('jsr').AsString) ;
  DTDATE.Date :=dm.ADO_VW_SFDJ.Fieldbyname('SFRQ').AsDateTime ;
  CurrentParam.djh  :=trim(dm.ADO_VW_SFDJ.Fieldbyname('spbh').AsString)+'-'+trim(dm.ADO_VW_SFDJ.Fieldbyname('spmc').AsString);
  CurrentParam.ph  :=trim(dm.ADO_VW_SFDJ.Fieldbyname('bmbh').AsString)+'-'+trim(dm.ADO_VW_SFDJ.Fieldbyname('bmname').AsString);
  edtzy.Text :=trim(dm.ADO_VW_SFDJ.Fieldbyname('djzy').AsString);
  CurrentParam.dj:=returnDj(trim(dm.ADO_VW_SFDJ.Fieldbyname('spbh').AsString),frmmain.adoqytmp);
  CurrentParam.dj:=dm.ADO_VW_SFDJ.Fieldbyname('dj').AsFloat ;
  CurrentParam.bl:=dm.ADO_VW_SFDJ.Fieldbyname('HSBL').AsFloat ;
  DM.ADO_VW_SFDJ.Filter :='';
  DM.ADO_VW_SFDJ.Filtered  :=false;
  DM.ADO_VW_SFDJ.Close ;
  sSQL:='';

//增加到临时明细表中
sSQL:='INSERT INTO sftmp(seri, sfno, Cl_0, cl_1, cl_2, cl_3, cl_4, cl_5, cl_6, cl_7, cl_8, cl_9)';
sSQL:=sSQL+' SELECT seri, sfno, Cl_0, cl_1, cl_2, cl_3, cl_4, cl_5, cl_6, cl_7, cl_8, cl_9 FROM sfmx';
sSQL:=sSQL+' WHERE sfno='+QuotedStr(sSfno);
with qytmp do
begin
  close;
  sql.Clear ;
  sql.Add(sSQL);
  Prepared;
  ExecSQL ; 
end;
dm.ADO_TBTMP.Active :=true;
nCount:=dm.ADO_TBTMP.RecordCount ;
dm.ADO_TBTMP.Close ;
autorecordtmp('sftmp',nCount+1,iSeri,frmmain.adoqytmp) ; //计算临时表中的记录号

end;
/////////////////////////****************
//

procedure Tfrmclhsd.Add_Clhsd_Data;//增加数据
var
  sCl,
  sBm,
  sNo:string;
  sZy,
  sFhr,
  sJzr,
  sJsr:string;
  ynjs:integer;
  DZJ,DSL:double;
begin
  sNo:=trim(edtcode.Text);
  sCl:=trim(cmbcl.Text);
  sBm:=trim(cmbbm.Text);
  sCl:=returnint('-',sCl,1,true);
  sBm:=returnint('-',sBm,1,true);
  sZy:=trim(edtzy.Text);
  sFhr:=trim(edtfhr.Text);
  sJsr:=trim(edtjsr.Text);
  sJzr:=trim(edtjzr.Text);
  DSL:=strtofloat(lblTotal.Text);
  DSL:=TalkOutdata(sCL,sBm,frmmain.adoqytmp)-DSL;
  DZJ:=DSL * CurrentParam.dj    ;
  ynjs:=0;
if sNo='' then
begin
Application.MessageBox('单据编码(NO)不为空!，请重新输入', '提示信息', mb_iconInformation + mb_defbutton1);
edtcode.SetFocus ;
exit;
end;
if (sCl='') or (sbm='') then
begin
Application.MessageBox('材料名称或项目部不为空!，请重新输入', '提示信息', mb_iconInformation + mb_defbutton1);
exit;
end;
if sjzr<>'' then
 if application.MessageBox('是否结算此单据号?！','材料租赁系统!',MB_YESNO)=IDYES then
    ynjs:=1
  else
    ynjs:=0;
// 查询重复单据号码
if CurrentParam.N_E =0 then
begin
//// 查询重复单据号码

strsql:='Select * from vW_Shdj where sfno='+QuotedStr(sno);
with qytmp do
begin
  close;
  sql.Clear ;
  sql.Add(strsql);
  Prepared ;
  open;
if RecordCount >0 then
begin
Application.MessageBox('所输入的单据号已存在,请重新输入新的单据号!', '错误', mb_iconInformation + mb_defbutton1);
edtcode.SetFocus ;
exit;
end;
end;
end;
//
frmmain.ADOConnect.BeginTrans;
try
screen.Cursor := crHourGlass;
pShwomessage.Caption := '正在保存数据，请稍候！......';
pShwomessage.Visible :=true;
pShwomessage.Update ;

/////删除已存在的记录号
if CurrentParam.N_E =1 then  //修改此单据
  if application.MessageBox('是否要修改此单据?！','材料租赁系统!',MB_YESNO)=IDYES then
    begin
  //  deledata('sfno','sfdj',CurrentParam.tmpCode,frmmain.adoqytmp);
    deledata('sfno','sfmx',CurrentParam.tmpCode,frmmain.adoqytmp);
    deledata('sfno','cljxb',CurrentParam.tmpCode,frmmain.adoqytmp);
   end;
//更新临时表
strsql:='update sftmp set sfno=:@sfno,ynsf=1';
UpdateData(strsql,'@sfno',sNo,frmmain.adoqytmp);
 if CurrentParam.N_E =1 then  //修改此单据
begin
strsql:='UPDATE SFDJ SET bmbh=:bmbh,fcsl=:fcsl,fhr=:fhr,djzy=:djzy,jzr=:jzr,jsr=:jsr,ynjs=:ynjs,dj=:dj';
strsql:=strsql+',fczj=:fczj,jczj=:jczj,jcsl=:jcsl,sfrq=:sfrq WHERE  sfno=:sfno';
with qytmp do
begin
  close;
  sql.Clear ;
  sql.Add(strsql);
  Parameters.ParamByName('sfno').Value :=sNo;
//  Parameters.ParamByName('spbh').Value :=scl;
  Parameters.ParamByName('bmbh').Value :=sbm;
  Parameters.ParamByName('sfrq').Value :=dtdate.DateTime;
  Parameters.ParamByName('fcsl').Value :=strtofloat(lblTotal.Text);
  Parameters.ParamByName('djzy').Value :=sZy;
  Parameters.ParamByName('fhr').Value :=sfhr;
  Parameters.ParamByName('jzr').Value :=sjzr;
  Parameters.ParamByName('jsr').Value :=sjsr;
  Parameters.ParamByName('ynjs').Value :=ynjs;
  Parameters.ParamByName('dj').Value :=CurrentParam.dj ;
  Parameters.ParamByName('fczj').Value :=strtofloat(lblHTotal.Text)* CurrentParam.dj;
  Parameters.ParamByName('jczj').Value :=DZJ;
  Parameters.ParamByName('jcsl').Value :=DSL;
  Prepared ;
  execsql;
end;
end else
begin
strsql:='INSERT INTO  SFDJ(sfno, spbh, bmbh, sfrq, shsl,ynsf,djzy,fhr,jzr,jsr,ynjs,dj,shzj,jczj,jcsl)';
strsql:=strsql+'  VALUES(:sfno,:spbh,:bmbh,:sfrq,:SHSL,1,:djzy,:fhr,:jzr,:jsr,:ynjs,:dj,:shzj,:jczj,:jcsl)';
with qytmp do
begin
  close;
  sql.Clear ;
  sql.Add(strsql);
  Parameters.ParamByName('sfno').Value :=sNo;
  Parameters.ParamByName('spbh').Value :=scl;
  Parameters.ParamByName('bmbh').Value :=sbm;
  Parameters.ParamByName('djzy').Value :=sZy;
  Parameters.ParamByName('sfrq').Value :=dtdate.DateTime;
  Parameters.ParamByName('shsl').Value :=strtofloat(lblTotal.Text);
  Parameters.ParamByName('fhr').Value :=sfhr;
  Parameters.ParamByName('jzr').Value :=sjzr;
  Parameters.ParamByName('jsr').Value :=sjsr;
  Parameters.ParamByName('ynjs').Value :=ynjs;
  Parameters.ParamByName('dj').Value :=CurrentParam.dj;
  Parameters.ParamByName('shzj').Value :=strtofloat(lblHTotal.Text)* CurrentParam.dj;
  Parameters.ParamByName('jcsl').Value :=DSL;
  Parameters.ParamByName('jczj').Value :=DZJ;
  Prepared;
  execsql;
end;
end;
//
//增加到cljxb明细表中
strsql:='INSERT INTO CLJXB(sfno,sdate, bmbh, spbh, hssl, ynsf,ynqc,SPDJ,money)';
strsql:=strsql+' values(:sfno,:sdate, :bmbh, :spbh, :sl,1,0,:DJ,:money)';
with qytmp do
begin
  close;
  sql.Clear ;
  sql.Add(strsql);
  Parameters.ParamByName('sfno').Value :=sNo;
  Parameters.ParamByName('spbh').Value :=scl;
  Parameters.ParamByName('bmbh').Value :=sbm;
  Parameters.ParamByName('sdate').Value :=dtdate.DateTime;
  Parameters.ParamByName('sl').Value :=strtofloat(lblHTotal.Text);
  Parameters.ParamByName('dj').Value :=CurrentParam.dj ;
  Parameters.ParamByName('money').Value :=CurrentParam.dj * strtofloat(lblHTotal.Text) ;
  Prepared ;
  execsql;
end;
//
//增加到明细表中
strsql:='INSERT INTO sfmx(seri, sfno, Cl_0, cl_1, cl_2, cl_3, cl_4, cl_5, cl_6, cl_7, cl_8, cl_9,ynsf)';
strsql:=strsql+' SELECT seri, sfno, Cl_0, cl_1, cl_2, cl_3, cl_4, cl_5, cl_6, cl_7, cl_8, cl_9,ynsf FROM sftmp';
//strsql:='DELETE FROM SFMX WHERE (Cl_0 IS NULL)'  ;
ExecuteSQL(strsql,qytmp,true);
strsql:='DELETE FROM SFMX WHERE (Cl_0 IS NULL)'  ;
ExecuteSQL(strsql,qytmp,true);
except
frmmain.ADOConnect.RollbackTrans ;
screen.Cursor := crDefault;
pShwomessage.Visible :=false;
exit;
end;
frmmain.ADOConnect.CommitTrans ;
if CurrentParam.N_E =1 then
begin
Application.MessageBox('数据修改完成!', '信息', mb_iconInformation + mb_defbutton1);
screen.Cursor := crDefault;
pShwomessage.Visible :=false;
exit;
btnclose.Click ;
end;
if application.MessageBox('是否要继续增加发放单据?！','材料租赁系统!',MB_YESNO)=IDYES then
begin
screen.Cursor := crHourGlass;
pShwomessage.Caption := '正在加载数据表，请稍候！......';
dm.ADO_TBTMP.Close ;
DBSumList1.Activate(false);
DBSumList2.Activate(false);
 cmbcl.Text :='';
 cmbbm.Text :='';
 ynjs:=0;
//为临时表中增加编码
cleardata('sftmp',frmmain.adoqytmp) ;
autorecordtmp('sftmp',1,iSeri,frmmain.adoqytmp) ;
cacalnumber(frmmain.adoqytmp);
dm.ADO_TBTMP.Active :=true;
CurrentParam.tmpCode:=trim(edtcode.Text);
if CurrentParam.tzcl then
begin
dm.ADO_GGXHB.Filter :='sfno='+''''+trim(edtcode.Text)+'''';
dm.ADO_GGXHB.Filtered :=true;
DBSumList2.Activate(TRUE);
end else
   DBSumList1.Activate(TRUE);
screen.Cursor := crDefault;
pShwomessage.Visible :=false;
cmbcl.SetFocus ;
btnsave.Enabled:=false;
exit;
end;
btnclose.Click ;
end;
//查找编码
procedure Tfrmclhsd.locanumber(ado:TADOQuery);
var
  s_value:string;
  i_value:double;
  t_value:string;
begin
  strsql:='select sfno from vW_Shdj ' ;
  with qytmp do
  begin
  close;
  sql.Clear ;
  sql.Add(strsql);
  open; 
    first;
    while not eof do
    begin
     s_value:=trim(Fieldbyname('sfno').AsString);
  //计算值加1
     t_value:=trim(COPY(s_value,1,7));
     i_value:=strtofloat(t_value);
     i_value:=i_value+1;
     s_value:=formatfloat('0000000',i_value);
    if not autocacalnumber(s_value,ado) then
    begin
      edtcode.Text :=s_value;
      exit;
    end  
    else
    next;
    end;
    edtcode.Text :='0000001'
  end;

end;
//查找数据库中的编码
function autocacalnumber(const bh:string;ado:TADOQuery):boolean;
var
  s_value:string;
begin
  strsql:='SELECT SFNO FROM vW_Shdj WHERE SFNO='+QuotedStr(BH);

  with ado do
  begin
   close;
   sql.Clear ;
   sql.Add(strsql);
   Prepared;
   open;
  if RecordCount >0 then
     result:=true
  else
     result:=false;   
  end;
end;

procedure Tfrmclhsd.cacalnumber(ado:TADOQuery);
var
  i_value:double;
  t_value:string;
begin
strsql:='SELECT SFNO FROM vW_Shdj';
with ado do
begin
  Close;
  SQL.Clear;
  SQL.Add(strsql);
  Prepared;
  open;
s_value :=Fields[0].AsString;
  if s_value='' then
     s_value :='0000001'
  else
  begin
     t_value:=trim(COPY(s_value,1,7));
     i_value:=strtofloat(t_value);
     i_value:=i_value+1;
     s_value:=formatfloat('0000000',i_value);
  end  ;
end;
edtcode.Text :=s_value;
end;




procedure Tfrmclhsd.FormCreate(Sender: TObject);
begin
dtDate.Date:=date;
//为临时表中增加编码
//dm.ADO_TBTMP.Active :=false;
screen.Cursor := crHourGlass;
cleardata('sftmp',frmmain.adoqytmp) ;
if CurrentParam.N_E =0 then
begin
autorecordtmp('sftmp',1,iSeri,frmmain.adoqytmp) ;//计算临时表中的记录号
//locanumber(frmmain.adoqytmp); //计算单据编号
cacalnumber(frmmain.adoqytmp);
CurrentParam.tmpCode:=trim(edtcode.Text);
end else
begin
edtSfdj(CurrentParam.tmpCode,frmmain.adoqytmp); //修改此单据号
//VisbleTure;
dm.ADO_GGXHB.Filter :='sfno='+''''+CurrentParam.tmpCode+'''';
dm.ADO_GGXHB.Filtered :=true;
btnSave.Enabled :=true;
end;
dm.ADO_TBTMP.IndexFieldNames  :='seri';
dm.ADO_TBTMP.Active :=true;
dm.ADO_GGXHB.Active :=true;
DBSumList1.Activate(TRUE);
EDTFHR.Text :=CurrentParam.UserName;
VisbleTure;
if  CurrentParam.blnADD then
begin
DBGridEh1.ReadOnly :=true;
DBGridEh2.ReadOnly :=true;
end;
screen.Cursor := crDefault;
//
end;

procedure Tfrmclhsd.DBSumList1SumListChanged(Sender: TObject);
begin
  lblTotal.Text := FloatToStr(DBSumList1.SumCollection.Items[0].SumValue );
  lblHtotal.Text := FloatToStr(DBSumList1.SumCollection.Items[0].SumValue * CurrentParam.bl);
end;

procedure Tfrmclhsd.FormShow(Sender: TObject);
var
s_value:string;
begin
 //取出材料编码表值
 dm.ADO_SPBMK.Active :=true;
 cmbcl.Clear ;
 dm.ADO_SPBMK.First ;
 while not dm.ADO_SPBMK.Eof do
 begin
   s_value:=trim(dm.ADO_SPBMK.Fieldbyname('spbh').AsString)+'-';
   s_value:=s_value+trim(dm.ADO_SPBMK.Fieldbyname('spmc').AsString);
   cmbcl.Items.Add(s_value);
   dm.ADO_SPBMK.Next;
 end;
 dm.ADO_SPBMK.Close;
dm.ADO_BMBMK.Active :=true;
cmbbm.Clear ;
dm.ADO_BMBMK.First ;
while not dm.ADO_BMBMK.Eof do
begin
    s_value:=trim(dm.ADO_BMBMK.Fieldbyname('bmbh').AsString)+'-';
    s_value:=s_value+trim(dm.ADO_BMBMK.Fieldbyname('bmname').AsString);
    cmbbm.Items.Add(s_value);
  dm.ADO_BMBMK.Next ;
end;
dm.ADO_BMBMK.Close ;
if CurrentParam.N_E =1 then
begin

cmbcl.Text :=CurrentParam.djh ;
cmbbm.Text :=CurrentParam.ph
//if CurrentParam.N_E =1 then
 end;
//if CurrentParam.N_E =1 then
end;

procedure Tfrmclhsd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dm.ADO_GGXHB.Close ;
//DBSumList1.Activate(false);
dm.ADO_TBTMP.Close ;
  action := cafree;
  frmclhsd := nil;
end;

procedure Tfrmclhsd.btnCloseClick(Sender: TObject);
begin
DBSumList1.Activate(FALSE);
DBSumList1.Free ;
DBSumList2.Activate(FALSE);
DBSumList2.Free ;
close;
end;

procedure Tfrmclhsd.btnSaveClick(Sender: TObject);
begin
try
Add_Clhsd_Data;
except
Application.MessageBox('数据提交出错,请重新起动应用程序!', '错误', mb_iconInformation + mb_defbutton1);
exit;
end;
end;

procedure Tfrmclhsd.DBGridEh1DblClick(Sender: TObject);
{var
  s_value,sSpbh,sNo:string;
  iNumber:integer;
  d_value:double;
  strsql:string;}
begin
{if DBGridEh1.SelectedField.FieldName='seri' then exit;
if DBGridEh1.SelectedField.FieldName='clTal' then exit;
CurrentParam.sl:=DBGridEh1.SelectedField.AsFloat ; 
iNumber:=DBGridEh1.Fields[0].AsInteger ;
s_value:=DBGridEh1.SelectedField.FieldName ;
s_value:=s_value+inttostr(iNumber);
sSpbh:= returnint('-',trim(cmbcl.Text),2,true);
sNo:=trim(edtcode.Text);
strsql:='sfno=('+''''+sNo+''' '+') and (fields = '+''''+s_value+''')';
dm.ADO_GGXHB.Filter :=strsql;
dm.ADO_GGXHB.Filtered :=true;
CurrentParam.tmpCode :=sNo;
CurrentParam.tmpName :=sSpbh;
CurrentParam.ggxh :=s_value;
ShowModalForm(TfrmGgxh);
if dm.ADO_TBTMP.State =dsbrowse THEN
    dm.ADO_TBTMP.Edit ;
DBGridEh1.SelectedField.AsFloat:=CurrentParam.sl;  }
end;

procedure Tfrmclhsd.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
IF Button=nbPost then
begin
   btnsave.Enabled :=true;
//   lbltotal.Text :=DBGridEh1.Columns[11].Footers[0].Value;   
{IF CurrentParam.tzcl then
 begin
  dm.ADO_GGXHB.FieldByName('sfno').AsString :=CurrentParam.tmpCode;
  dm.ADO_GGXHB.FieldByName('fields').AsString :=CurrentParam.ggxh;
  dm.ADO_GGXHB.FieldByName('spbh').AsString :=CurrentParam.tmpName;
 end;}
end;
end;

procedure Tfrmclhsd.cmbClChange(Sender: TObject);
var
  sCl:string;
begin
sCl:=trim(cmbcl.Text);
sCl:=returnint('-',sCl,1,true);
CurrentParam.bl:=1;
CurrentParam.dj:=returnDj(sCl,frmmain.adoqytmp);
dm.ADO_GGXHB.Filter :='sfno='+''''+trim(edtcode.Text)+'''';
dm.ADO_GGXHB.Filtered :=true;
VisbleTure;
end;

procedure Tfrmclhsd.edtCodeKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
screen.Cursor := crHourGlass;
dm.ADO_TBTMP.Active :=false;
strsql:='Select * from sfdj where sfno=:@sfno ';
with qytmp do
begin
  close;
  sql.Clear ;
  sql.Add(strsql);
  Parameters.ParamByName('@sfno').Value :=TRIM(EDTCODE.Text) ;
  Prepared ;
  open;
if RecordCount >0 then
begin
{if application.MessageBox('输入的单据号不存在是否继续?！','材料租赁系统!',MB_YESNO)=IDYES then
begin
edtcode.SetFocus ;         }
dm.ADO_TBTMP.Active :=false;
cleardata('sftmp',frmmain.adoqytmp) ;
edtSfdj(trim(edtcode.Text),frmmain.adoqytmp); //修改此单据号
dm.ADO_GGXHB.Filter :='sfno='+''''+CurrentParam.tmpCode+'''';
dm.ADO_GGXHB.Filtered :=true;
end;
dm.ADO_TBTMP.Active :=true;
screen.Cursor := crDefault;
end;

cleardata('sftmp',frmmain.adoqytmp) ;
edtSfdj(trim(edtcode.Text),frmmain.adoqytmp); //修改此单据号
dm.ADO_TBTMP.Active :=true;
screen.Cursor := crDefault;
end;
end;

procedure Tfrmclhsd.DBGridEh2KeyPress(Sender: TObject; var Key: Char);
var
  i:integer;
begin
if key=#13 then
begin
i:= dm.ADO_GGXHB.RecordCount;
   if DBGridEh2.SelectedField.FieldName ='long' THEN
      if dm.ADO_GGXHB.State = dsinsert then
            DBGridEh2.Fields[2].AsFloat :=1;
 //if (DBGridEh2.SelectedField.FieldName ='number') OR (DBGridEh2.SelectedField.FieldName ='weith') or (DBGridEh2.SelectedField.FieldName ='long') then
    if DM.ADO_GGXHB.State in [dsedit,dsinsert]  then
    begin
     //DBGridEh2.Fields[3].AsFloat :=DBGridEh2.Fields[0].AsFloat*DBGridEh2.Fields[1].AsFloat*DBGridEh2.Fields[2].AsFloat ;
     if  DM.ADO_GGXHB.State in [dsinsert] then
       begin
         dm.ADO_GGXHB.FieldByName('seri').AsInteger  :=i +1  ;
         dm.ADO_GGXHB.FieldByName('sfno').AsString :=trim(edtcode.Text);
         dm.ADO_GGXHB.FieldByName('fields').AsString :=CurrentParam.ggxh;
         dm.ADO_GGXHB.FieldByName('spbh').AsString :=CurrentParam.tmpName;
       end;
   //   dm.ADO_GGXHB.FieldByName('total').AsFloat :=DBGridEh2.Fields[0].AsFloat*DBGridEh2.Fields[1].AsFloat*DBGridEh2.Fields[2].AsFloat ;
//      try
//      dm.ADO_GGXHB.Post ;
//      except
//      dm.ADO_GGXHB.Cancel ;
//      dm.ADO_GGXHB.Active :=false;
//      dm.ADO_GGXHB.Active :=true;
//      end;
      btnSave.Enabled :=TRUE;
     end;
 end;
end;

procedure Tfrmclhsd.DBSumList2SumListChanged(Sender: TObject);
begin
  CurrentParam.sl :=DBSumList2.SumCollection.Items[0].SumValue;
  lblTotal.Text := FloatToStr(CurrentParam.sl );
  lblHtotal.Text := FloatToStr(CurrentParam.sl * CurrentParam.bl);
end;

procedure Tfrmclhsd.SpeedButton1Click(Sender: TObject);
begin
locanumber(frmmain.adoqytmp); //计算单据编号
end;

procedure Tfrmclhsd.SpeedButton2Click(Sender: TObject);
var
 Qrepcl:TQrepcl;
 sCl,
 sBm,
 sCode,
 sspbh,
 strsql:string;
begin
  sCode:=trim(edtcode.Text);
  sCl:=trim(cmbcl.Text);
  sBm:=trim(cmbbm.Text);
  sCl:=returnint('-',sCl,1,false);
  sBm:=returnint('-',sBm,1,false);
//  sspbh:=returnint('-',sCl,2,true);
qrepcl:=Tqrepcl.Create(self);
qrepcl.lblNo.Caption :=sCode;
qrepcl.lblname.Caption :=sCl;
qrepcl.lblffdate.Caption :=datetostr(dtdate.Date);
qrepcl.lblmb.Caption :=sBm;
qrepcl.lblTotal.Caption :=trim(lbltotal.Text)+CurrentParam.jldw  ;
qrepcl.lblhTotal.Caption :=trim(lblhtotal.Text)+CurrentParam.jldw2;
qrepcl.lblZy.Caption :=trim(edtzy.Text);
qrepcl.lblFhr.Caption :=trim(edtfhr.Text);
qrepcl.lblJzr.Caption :=trim(edtjzr.Text);
qrepcl.lblJsr.Caption :=trim(edtjsr.Text);


if not CurrentParam.tzcl then
begin
strsql:='SELECT Cl_0, cl_1, cl_2, cl_3, cl_4, cl_5, cl_6, cl_7, cl_8, cl_9 FROM sftmp';
with frmmain.adoRep do
begin
close;
sql.Clear ;
sql.Add(strsql);
open;
end;
qrepcl.lblTitle.Caption  :='江苏正华建设集团公司租赁站周转材料回收单';
qrepcl.PreviewModal ;
qrepcl.Free ;

end else
begin

//查询数据
strsql:='SELECT spbh, fields, long, weith, hight, number, total, bz FROM ggxhb Where SFNO='+''''+sCode+'''';
with frmmain.adoRep do
begin
close;
sql.Clear ;
sql.Add(strsql);
open;
end;
///
qrepcl_t:=Tqrepcl_t.Create(self);
qrepcl_t.lblNo.Caption :=sCode;
qrepcl_t.lblname.Caption :=sCl;
qrepcl_t.lblffdate.Caption :=datetostr(dtdate.Date);
qrepcl_t.lblmb.Caption :=sBm;
qrepcl_t.lblTotal.Caption :=trim(lbltotal.Text)+CurrentParam.jldw  ;
qrepcl_t.lblhTotal.Caption :=trim(lblhtotal.Text)+CurrentParam.jldw2;
qrepcl_t.lblZy.Caption :=trim(edtzy.Text);
qrepcl_t.lblFhr.Caption :=trim(edtfhr.Text);
qrepcl_t.lblJzr.Caption :=trim(edtjzr.Text);
qrepcl_t.lblJsr.Caption :=trim(edtjsr.Text);
qrepcl_t.lblTitle.Caption  :='江苏正华建设集团公司租赁站周转材料回收单';
qrepcl_t.PreviewModal ;
qrepcl_t.Free ;
end;


frmmain.adoRep.Active :=false;

end;

end.

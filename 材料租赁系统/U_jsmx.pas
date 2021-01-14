unit U_jsmx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, FR_Dock, Grids, DBGridEh,
  DB, ADODB, //RM_class, RMD_RptExp, RMD_ADO, RMD_BDE, RM_Desgn,RM_dbset, RM_dset,
  PrnDbgeh;

type
  TfrmJsmx = class(TForm)
    Panel1: TPanel;
    frTBPanel1: TfrTBPanel;
    Shape1: TShape;
    dtEnd: TDateTimePicker;
    dtStar: TDateTimePicker;
    frTBPanel2: TfrTBPanel;
    btnClose: TSpeedButton;
    btnQuery: TSpeedButton;
    btnPrint: TSpeedButton;
    frTBPanel3: TfrTBPanel;
    Label3: TLabel;
    cmbBm: TComboBox;
    StatusBar1: TStatusBar;
    DBGridEh1: TDBGridEh;
    adofc: TADOQuery;
    adosh: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    qyado: TADOQuery;
    pShwomessage: TPanel;
    PrintDBGridEh1: TPrintDBGridEh;
    ADOUpdate: TADOQuery;
    Label1: TLabel;
    cmbCl: TComboBox;
    Panel2: TPanel;
    chkYq: TCheckBox;
   //Table1Reportdata: TBlobField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure DBGridEh1ColWidthsChanged(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
  procedure DrowData(const TableName:string;ado:TADOQuery); //显示数据
  procedure makedata(ADO:TADOQuery);
  procedure ExecSQL(const sSql,para1,para2:string;ADO:TADOQuery;Excute:boolean);  //执行SQL语句
//  procedure submitdata(const tablename:string;ado:TADOQuery;dtstar:TdateTime);
    { Private declarations }
  public
  FilterControlList: TStringList;
    { Public declarations }
  end;

var
  frmJsmx: TfrmJsmx;
  sSql,s_value:string;
  const IndicatorWidth=11;
implementation

 USES MAIN,U_DM,u_public,common,utLeasehold,u_PrintSelect,repJsmx ;

{$R *.dfm}
function tzje(const spbh,bmbh:string;ado:TADOQuery;dtstar,dtEnd:TDateTime):double;
begin
sSql:='SELECT money, bmbh, spbh,sdate FROM vW_cl_tz';
sSql:=sSql+' Where bmbh='+Quotedstr(bmbh)+' and spbh='+QuotedStr(spbh);
sSql:=sSql+' and (sDate>=:@dtstar and sDate<=:@dtEnd)';
ado.Close ;
ado.SQL.Clear ;
ado.SQL.Add(sSql);
ado.Parameters.ParamByName('@dtStar').Value :=datetimetostr(dtstar);
ado.Parameters.ParamByName('@dtEnd').Value :=datetimetostr(dtEnd);
ado.Prepared :=true;
ado.Open ;
ado.First ;
if ado.RecordCount >0 then
 result:=ado.Fields[0].AsFloat
else
 result:=0;
end;
{procedure sumjs(const TableName:string;ado,qytmp:TADOQuery;dtstar,dtEnd:TDateTime); //求结数
var
  day:integer;
  dtpr,dtnext:TDatetime;//定义日期变量
  Fmoney,
  Fjmoney,
  Nmoney,
  Njmoney,
  Emoney,
  Ejmoney,
  Total:double;
begin


end; }
 //求上期数
procedure submitdata(const tablename,tablename1:string;ado:TADOQuery;dtstar:TdateTime);
var
DsubJsje:double;
begin
sSql:='SELECT JSJE FROM  '+TableName+' WHERE Sdate<:@sdate ORDER BY Sdate  Desc' ;
with ado do
  begin
  close;
  sql.Clear ;
  sql.Add(sSql);
  Parameters.ParamByName('@sdate').Value :=dtstar;
  Prepared;
  Open;
  DsubJsje:=FieldByName('jsje').AsFloat ;
  close;
  //插入上期数据
  sSql:='INSERT INTO '+ TableName1+'(SPMC,jsje)';
  sSql:=sSql+' VALUES(:SPMC,:JSJE)';
  sql.Clear ;
  sql.Add(sSql);
  Parameters.ParamByName('JSJE').Value :=DsubJsje;
  Parameters.ParamByName('SPMC').Value :='上期结存数：';
  Prepared;
  ExecSQL ;
  close;
end;

end;
//求预期值
procedure prognosticate(const TableName:string;ado:TADOQuery;tMoney:double;dtEnd:TDateTime);
begin
sSql:='INSERT INTO '+ TableName+'(SPMC,jsje,sdate)';
sSql:=sSql+' VALUES(:SPMC,:JSJE,:sdate)';
with ado do
  begin
  close;
  sql.Clear ;
  sql.Add(sSql);
  Parameters.ParamByName('JSJE').Value :=tMoney;
  Parameters.ParamByName('sdate').Value :=dtEnd;
  Parameters.ParamByName('SPMC').Value :='预测金额：';
  Prepared;
  ExecSQL ;
  close;
  end;
end;
//求积数
procedure cacalfcmass(const TableName:string;ado,qytmp:TADOQuery;dtstar,dtEnd:TDateTime;tzje:double); //求积数
var
  day,n:integer;
  dtpr,dtnext:TDatetime;//定义日期变量
//  dj,
  Fsl,
  Nsl,
  Fmoney,
  Nmoney,
  jmoney,
  Dtotal,
  DJsje,
  Njsje,
  tmp,
  qCje,
  dCe,
  FJmoney:Double;
  fSfno,nSfno:string;
  iRecount:integer;
  blnYnqc,nYnqc,nYntz,ynsf :boolean;
begin
  day:=0;
  sSql:='SELECT bmbh, spbh, ynsf, sdate, fcsl, hssl, money, jsje, jMoney, ynqc, spmc, ggxh, jldw,spdj,zlts,SL,ce';
  sSql:=sSql+'  FROM ' +  TableName +' where money <>0 order by sdate';    //从表中查出所需要的数据
  with qytmp do
  begin
    close;
    sql.Clear ;
    sql.Add(sSql);
    Prepared ;
    open;
    first;
    iRecount:= RecordCount;
    if RecordCount >0 then
    begin
      fSfno:=trim(FieldByName('sDATE').value);
       dtpr:=FieldByName('sdate').AsDateTime ;
       Fsl:=FieldByName('jsje').AsFloat ;
       FMoney:=FieldByName('jsje').AsFloat ;
       FjMoney:=FieldByName('money').AsFloat ;
       NMoney:=FieldByName('jmoney').AsFloat;
       dtnext :=dtpr;
       blnYnqc:=FieldByName('ynqc').AsBoolean ;
       Djsje:=FieldByName('jsje').AsFloat ;
       ynsf:=FieldByName('ynsf').AsBoolean ;
   if not blnYnqc then
       MoveBy(0)
   else
      MoveBy(1);
    while not Eof do
    begin
       n:=qytmp.RecNo ;
       nSfno:=trim(FieldByName('sdate').value);
       dtnext:=FieldByName('sdate').AsDateTime ;
       NMoney:=FieldByName('jmoney').AsFloat;
       jMoney:=FieldByName('money').AsFloat ;
       nYnqc:=FieldByName('ynqc').AsBoolean ;
       njsje:=FieldByName('jsje').AsFloat ;
       ynsf:=FieldByName('ynsf').AsBoolean ;
       dCe:=FieldByName('ce').AsFloat ;
       day:=Trunc(dtnext)-Trunc(dtpr);


   if blnYnqc then
   begin
     Fsl:=Fsl+FjMoney*DAY;
     blnYnqc:=false;
   end;

     if day=1 then Dtotal:=Nmoney*day ;
     if day>1 then Dtotal:=tmp;//+nMoney;
     if DAY=0 then Dtotal:=Fmoney ;
     if not nYnqc then
      begin
      if day =1 then Dtotal:=FMoney+Dtotal;
      if day>1 then
          if not ynsf then
             Dtotal:=fsl+Dtotal*day+jmoney
          else
            Dtotal:=fsl+Dtotal*day-jmoney+dce;
      if day=0 then
        begin
          if not ynsf then
            dtotal:=Dtotal+jmoney
          else
            dtotal:=Dtotal-jmoney ;
        end;
       end  
     else
       begin
          Dtotal:=NMoney+Djsje;
          qCje:= Djsje;
       end;
   if iRecount=n then
      Dtotal:=Dtotal+tzje;
       //更新金额
       sSql:='UPDATE '+ TableName+' SET jsje =:@money  WHERE SDATE =:sfno AND YNSF=:YNSF';
      with ado do
       begin
         close;
         sql.Clear ;
         sql.Add(sSql);
         Parameters.ParamByName('@money').Value :=Dtotal;
         Parameters.ParamByName('sfno').Value :=nSfno;
         Parameters.ParamByName('YNSF').Value :=YNSF;
         Prepared;
         ExecSQL ;
       end;
       fSfno:=nSfno;
       dtpr:=dtnext;
       Fmoney:=Dtotal;
       blnYnqc:=nYnqc;
        tmp:=nmoney;
      fsl:=Dtotal;
    next;
    end;
   end;
  end;

  if iRecount=1  then
  NMoney:=FMoney;   //第一条记录并且是期初数
  if (iRecount=1) and (blnYnqc) then
  begin
  NMoney:=FjMoney;   //第一条记录并且是结存数
  Dtotal:=FMoney;   //第一条记录并且是期初数
  end;
  day:=Trunc(dtend)-Trunc(dtnext);
  if day>0 then
  begin
  Dtotal:=Dtotal+NMoney*DAY ;
  prognosticate(TableName,ado,Dtotal,dtend);
  end;
end;
//
procedure Tfrmjsmx.ExecSQL(const sSql,para1,para2:string;ADO:TADOQuery;Excute:boolean);  //执行SQL语句
begin
 with  ado do
 begin
 close;
 sql.clear;
 sql.add(sSql);
 Parameters.ParamByName(para1).Value :=dtStar.DateTime ;
 Parameters.ParamByName(para2).Value :=dtEnd.DateTime ;
 Prepared;
 if not Excute then
  Open
 else
  ExecSQL; 
 end;
end;
//合并数据
procedure Tfrmjsmx.makedata(ADO:TADOQuery);
var
  sfno:string;
  i,j,x:integer;
begin
//生成临时表FCSH
{SELECT dbo.JSMXFC.sfno, dbo.JSMXFC.sdate, dbo.JSMXFC.spdj, dbo.JSMXFC.sl,
      dbo.JSMXFC.zlts, dbo.JSMXFC.money, dbo.JSMXFC.spmc, dbo.JSMXFC.jldw,
      dbo.JSMXSH.sdate AS ssdate, dbo.JSMXSH.spdj AS sspdj, dbo.JSMXSH.sl AS ssl,
      dbo.JSMXSH.zlts AS szlts, dbo.JSMXSH.money AS smoney,
      dbo.JSMXSH.spmc AS sspmc, dbo.JSMXSH.jldw AS sjldw
FROM dbo.JSMXFC LEFT OUTER JOIN   dbo.JSMXSH ON dbo.JSMXFC.sfno = dbo.JSMXSH.sfno}
if CheckTable('fcsh',ADO) then
   repairTable('fcsh',ADO) ;
sSql:='SELECT JSMXFC.sfno, JSMXFC.sdate, JSMXFC.spdj, JSMXFC.sl,';
sSql:=sSql+'JSMXFC.zlts, JSMXFC.jsje, JSMXFC.spmc, JSMXFC.jldw,';
sSql:=sSql+'JSMXSH.sdate AS ssdate, JSMXSH.spdj AS sspdj, JSMXSH.sl AS ssl,';
sSql:=sSql+'JSMXSH.zlts AS szlts, JSMXSH.money AS sjsje,JSMXSH.spmc AS sspmc, JSMXSH.jldw AS sjldw';
sSql:=sSql+' INTO fcsh FROM JSMXFC LEFT OUTER JOIN JSMXSH ON JSMXFC.sfno = JSMXSH.sfno';
sSql:=sSql+' WHERE JSMXFC.sdate BETWEEN :DTSTART AND :DTEND ORDER BY JSMXFC.sdate';    //从表中查出所需要的数据
ExecSQL(sSql,'DTSTART','DTEND',ADO,true);
sSql:='UPDATE FCSH SET SSDATE=NULL,sspdj=null,ssl=null,sjsje=null,sjldw=null,sspmc=null,szlts=null';
ExecuteSQL(sSql,ADO,true);
sSql:='SELECT * FROM JSMXFC ';
sSql:=sSql+' WHERE SDATE BETWEEN :DTSTART AND :DTEND order by sdate';    //从表中查出所需要的数据
ExecSQL(sSql,'DTSTART','DTEND',frmmain.adoqytmp ,false);
sSql:='SELECT * FROM JSMXSH ';
sSql:=sSql+' WHERE SDATE BETWEEN :DTSTART AND :DTEND order by sdate';    //从表中查出所需要的数据
ExecSQL(sSql,'DTSTART','DTEND',qyado,false);
//打开临时表
i:=qyado.RecordCount-1 ;
j:=frmmain.adoqytmp.RecordCount ;
qyado.First;
if frmmain.adoqytmp.RecordCount >0 then
 begin
  frmmain.adoqytmp.first;
  for x:=0 to j-1 do
   begin
     frmmain.adoqytmp.MoveBy(x);
     sfno:=trim(frmmain.adoqytmp.Fieldbyname('sfno').AsString);
      if x <= i then
      begin
       qyado.MoveBy(x);
       sSQL:='UPDATE FCSH SET SSDATE=:ssdate,sspdj=:sspdj,ssl=:ssl,sjsje=:smoney,sjldw=:sjldw,sspmc=:sspmc,szlts=:szlts';
       sSQL:=sSql+'  WHERE sfno=:sfno';
       with ado do
         begin
          close;
          sql.Clear ;
          sql.Add(sSql);
          Parameters.ParamByName('sfno').Value :=sfno ;
          Parameters.ParamByName('ssdate').Value :=qyado.Fieldbyname('sdate').Value ;
          Parameters.ParamByName('sspdj').Value :=qyado.Fieldbyname('spdj').Value ;
          Parameters.ParamByName('ssl').Value :=qyado.Fieldbyname('sl').Value ;
          Parameters.ParamByName('smoney').Value :=qyado.Fieldbyname('jsje').Value ;
          Parameters.ParamByName('sjldw').Value :=qyado.Fieldbyname('jldw').AsString;
          Parameters.ParamByName('sspmc').Value :=qyado.Fieldbyname('spmc').AsString;
          Parameters.ParamByName('szlts').Value :=qyado.Fieldbyname('zlts').Value ;
          Prepared;
          ExecSQL ;
         end;
        end;
    // adofc.next;
    end;
    end;
end;
procedure TfrmJsmx.DrowData(const TableName:string;ado:TADOQuery); //显示数据
begin
  sSql:=' SELECT sdate, bmbh, spbh, spdj, fcsl,hssl, zlts,money, jsje,';
  sSql:=sSql+' spmc, jldw  INTO BrwMx FROM ' +  TableName ;
  sSql:=sSql+' WHERE SDATE BETWEEN :DTSTART AND :DTEND order by sdate';    //从表中查出所需要的数据
  with ado do
    begin
    Close ;
    sql.Clear ;
    sql.Add(sSQL);
    Parameters.ParamByName('DTSTART').Value :=dtStar.DateTime ;
    Parameters.ParamByName('DTEND').Value :=dtEnd.DateTime ;
    Prepared;
    ExecSQL;
  end;
  submitdata(tablename,'BrwMx',ADOUpdate,dtstar.Date);
  sSql:=' SELECT sdate, bmbh, spbh, spdj, fcsl,hssl, zlts,money, jsje,';
  sSql:=sSql+' spmc, jldw,zlts  FROM BrwMx ORDER BY sDate'  ;
  with ado do
  begin
  Close ;
  sql.Clear ;
  sql.Add(sSQL);
  Prepared;
  open;
  end;
end;
//求余额
procedure cacalfc(const TableName:string;ado,qytmp:TADOQuery); //求余额
var
  Nsl,
  Fsl,
  ssl,
  Nssl,
  csl,
  Fmoney,
  Nmoney,
  nnmoney,
  dj,
  sl,
  tsl,
  hdj,
  dCe,
  Dtotal:Double;
  fSfno,nSfno,no:string;
  ynsf,fYnsf:boolean;
begin
  sSql:='SELECT bmbh, spbh, ynsf, sdate, fcsl, hssl,sl, money, jsje, jMoney, ynqc, spmc, ggxh, jldw,spdj';
  sSql:=sSql+' FROM ' +  TableName +' order by sdate';    //从表中查出所需要的数据
  with qytmp do
  begin
    close;
    sql.Clear ;
    sql.Add(sSql);
    Prepared ;
    open;
    first;
  if RecordCount >0 then
    begin
       fSfno:=FieldByName('sdate').Value;
       dj:=Fieldbyname('spdj').AsFloat ;
       Fsl:=Fieldbyname('fcsl').AsFloat ;
       Ssl:=Fieldbyname('hssl').AsFloat ;
       FMoney:=FieldByName('money').AsFloat  ;
       ynsf:=Fieldbyname('ynsf').AsBoolean ;
       fYnsf:=Fieldbyname('ynsf').AsBoolean ;
       no:=fsfno;
       nnmoney:=fmoney;
       Dtotal:=FMoney;
       if not ynsf then  //是否是发出或收回
          Tsl:=fsl
       else
          Tsl:=ssl;
      MoveBy(1);
    while not Eof do
    begin
       nSfno:=trim(FieldByName('sdate').AsString);
       Nsl:=Fieldbyname('fcsl').AsFloat ;
       NSsl:=Fieldbyname('hssl').AsFloat ;
       NMoney:=FieldByName('money').AsFloat ;
       ynsf:=Fieldbyname('ynsf').AsBoolean ;
       hdj:=Fieldbyname('spdj').AsFloat ;
       if not ynsf then  //是否是发出或收回
          Tsl:=Tsl+Nsl
       else
         if Tsl-NSsl<0 then
           begin
            dCe:=nMoney-Tsl*hdj;
            Nmoney:=Tsl*hdj ;
          end
         else
           Tsl:=Tsl-NSsl;

       if not ynsf then
          Dtotal:=Dtotal+Nmoney
       else
          Dtotal:=Dtotal-Nmoney;

       //更新金额
       sSql:='UPDATE '+ TableName+' SET jmoney =:@money,sl=:@sl,ce=:@ce  WHERE sdate =:sfno AND YNSF=:YNSF';
       with ado do
       begin
         close;
         sql.Clear ;
         sql.Add(sSql);
         Parameters.ParamByName('@ce').Value :=Dce;
         Parameters.ParamByName('@money').Value :=Dtotal;
         Parameters.ParamByName('@Sl').Value :=Tsl;
         Parameters.ParamByName('sfno').Value :=nSfno;
         Parameters.ParamByName('YNSF').Value :=YNSF;
         Prepared;
         ExecSQL ;
       end;
       dce:=0;
       fSfno:=nSfno;
       Fmoney:=Dtotal;
    next;
    end;

         //更新第一条记录数
       sSql:='UPDATE '+ TableName+' SET jmoney =:@money  WHERE sdate =:sfno AND YNSF=:YNSF';
       with ado do
       begin
         close;
         sql.Clear ;
         sql.Add(sSql);
         Parameters.ParamByName('@money').Value :=nnMoney;
         Parameters.ParamByName('sfno').Value :=no;
         Parameters.ParamByName('YNSF').Value :=fYnsf;
         Prepared;
         ExecSQL ;
       end;
   end;
  end;
end;
//
procedure TfrmJsmx.FormShow(Sender: TObject);
var
s_value:string;
begin
 //取出材料编码表值
dm.ADO_SPBMK.Active :=true;
 cmbcl.Clear ;
 dm.ADO_SPBMK.First ;
 while not dm.ADO_SPBMK.Eof do
 begin
   s_value:='['+trim(dm.ADO_SPBMK.Fieldbyname('spbh').AsString)+']';
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
    s_value:='['+trim(dm.ADO_BMBMK.Fieldbyname('bmbh').AsString)+']';
    s_value:=s_value+trim(dm.ADO_BMBMK.Fieldbyname('bmname').AsString);
    cmbbm.Items.Add(s_value);
  dm.ADO_BMBMK.Next ;
end;
dm.ADO_BMBMK.Close ;
end;

procedure TfrmJsmx.FormCreate(Sender: TObject);
begin
//DBGridEh1.Align :=alClient;
dtstar.Date :=date;
dtend.Date :=date;

end;

procedure TfrmJsmx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//if CheckTable('jsmxsf',frmmain.adoqytmp) then
//   repairTable('jsmxsf',frmmain.adoqytmp) ;
if CheckTable('brwmx',frmmain.adoqytmp) then
   repairTable('brwmx',frmmain.adoqytmp) ;
if CheckTable('fcsh',frmmain.adoqytmp) then
   repairTable('fcsh',frmmain.adoqytmp) ;
  action := cafree;
  frmjsmx:= nil;   
end;

procedure TfrmJsmx.btnQueryClick(Sender: TObject);
var
  sBm,sCl:string;
begin
  sCl:=trim(cmbcl.Text);
  sBm:=trim(cmbbm.Text);
  sCl:=returnint(']',sCl,2,true);
  sBm:=returnint(']',sBm,2,true);
if (sBm='') or (sCl='') then
begin
Application.MessageBox('项目部和材料不为空!，请重新输入', '提示信息', mb_iconInformation + mb_defbutton1);
exit;
end;
screen.Cursor := crHourGlass;
pShwomessage.Caption :='正在查询数据，请稍候！......' ;
pShwomessage.Visible :=true;
pShwomessage.Update ;
try
if CheckTable('jsmxsf',frmmain.adoqytmp) then
   repairTable('jsmxsf',frmmain.adoqytmp) ;
if CheckTable('brwmx',frmmain.adoqytmp) then
   repairTable('brwmx',frmmain.adoqytmp) ;
//*****************
sSql:='SELECT bmbh, spbh, ynsf, sdate, fcsl, hssl, sl,money, jMoney,jsje, ynqc, spmc, ggxh, jldw,spdj,zlts,CE';
sSql:=sSql+' INTO jsmxsf FROM vw_cl_sp';
sSql:=sSql+' WHERE (SPBH='+''''+sCl+''')';
sSql:=sSql+' AND (bmbh='+''''+sBm+''')';
sSql:=sSql+' ORDER BY sdate ';
ExecuteSQL(sSql,frmmain.adoqytmp,true);
CurrentParam.tzje :=tzje(scl,sbm,frmmain.adoqytmp,dtstar.Date,dtend.Date);
cacalfc('jsmxsf',qyado,frmmain.adoqytmp);//计算收发金额
cacalfcmass('jsmxsf',qyado,frmmain.adoqytmp,dtstar.Date,dtend.Date,CurrentParam.tzje);//计算收发金额
DrowData('jsmxsf',adofc);
except
Application.MessageBox('数据提交出错,请重新起动应用程序!', '错误', mb_iconInformation + mb_defbutton1);
end;
pShwomessage.Visible :=false;
screen.Cursor := crDefault;
end;

procedure TfrmJsmx.btnCloseClick(Sender: TObject);
begin
close;
end;

procedure TfrmJsmx.btnPrintClick(Sender: TObject);
var
 qrepJsmx:TqrepJsmx;
 sBm:string;
begin
TRY
  sBm:=trim(cmbbm.Text);
  sBm:=returnint(']',sBm,0,false);
pShwomessage.Visible :=true;
pShwomessage.Caption :='正在合并数据生成报表，请稍候！......'  ;
pShwomessage.Update ;
PrintDBGridEh1.PrinterSetupDialog ;
s_value:= inttostr(frmmain.Year);//'+'年'+formatfloat('00',frmmain.month)+'月';
qrepJsmx:=TqrepJsmx.Create(self);
qrepJsmx.lblTitle.Caption  :=s_value+qrepJsmx.lblTitle.Caption;
qrepJsmx.lblBm.Caption  := qrepJsmx.lblBm.Caption+sBm;
qrepjsmx.lblPrintDate.Caption :='时间:从 '+datetostr(dtstar.Date)+'-->'+datetostr(dtend.Date);
qrepjsmx.lblDwname.Caption :=qrepjsmx.lblDwname.Caption +CurrentParam.name;
qrepJsmx.PreviewModal ;
qrepJsmx.Free ;
pShwomessage.Visible :=false;
//qyado.Close ;
except
Application.MessageBox('数据提交出错,请重新起动应用程序!', '错误', mb_iconInformation + mb_defbutton1);
pShwomessage.Visible :=false;
end;
end;

procedure TfrmJsmx.DBGridEh1ColWidthsChanged(Sender: TObject);
var Indent,i,k:Integer;
    control:TControl;
begin
    if not Assigned(FilterControlList) then Exit;
    Indent := IndicatorWidth+2;

    for i := 0 to DBGridEh1.Columns.Count-1 do
    begin
      k := FilterControlList.IndexOf(DBGridEh1.Columns.Items[i].FieldName);
      if (k <> -1) then
      begin
        control := (TControl(FilterControlList.Objects[k]));
        control.Left := Indent+1;
        control.Width := DBGridEh1.Columns.Items[i].Width-1;
      end;
      Indent := Indent+DBGridEh1.Columns.Items[i].Width+1;
    end;

end;

procedure TfrmJsmx.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
DBGridEh1.Free;
end;

end.


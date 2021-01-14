unit MyLib;

interface

uses Windows, Dialogs, SysUtils, DBCtrls, DB, DBGrids, DBTables, Grids,
  stdctrls,clipbrd, menus,comctrls,Forms, Messages, Classes, Graphics, Controls,
  ExtCtrls, ImgList, ToolWin, Mask, Buttons, DBClient, syncobjs, FileCtrl, Variants;


function  GetDjbh(strDj: string; datRq: TDate; strTable: string): string; 	//取新的单号
function  GetSj(AHPID, ASJZLID: integer): Double; 	//取售价
function  ClearHotKey(strCaption: string): string; 	//取消字符串中的快捷键字符串
procedure ValuesToStrings(ssItem: TStrings; strSql: string);  //把SQL返回的第一个值放入Strings
procedure SetDBGridColor(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState; ColColor: TColor);  //DBGrid 的行颜色
procedure StrToFile(Str, FileName: string);
//Create SQL
function  GetSqlHpqc(CKID, HPID: integer): string; 	//ID, BH, PM, DW, QCS1, QCJE1
function  GetSqlJcmx(RQA, RQB: TDate; CKID, HPID: integer): string; 	//All JC CC
function  GetSqlZhmx(RQA, RQB: TDate; ZHID: integer): string; 	//All ZHJC
function  GetSqlCgmx(RQA, RQB: TDate; strTj: string): string; 	//CGSH + CGTH (CHTH.SL -> -CGTH.SL)
function  GetSqlXsmx(RQA, RQB: TDate; strTj: string): string; 	//XSKD + XSTH (XSTH.SL -> -XSTH.SL)
function  GetSqlKhwl(RQA, RQB: TDate; KHID: integer): string; 	//XSKD(LX=2) + XSSK + XSTH(LX=2)
function  GetSqlYsmx(RQ: TDate; KHID: integer): string; 	//XSKD
function  GetSqlGyswl(RQA, RQB: TDate; GYSID: integer): string; 	//CGSH(LX=2) + CGFK + CGTH(LX=2)
function  GetSqlYfmx(RQ: TDate; GYSID: integer): string; 	//CGSH
function  GetSqlSzmx(RQA, RQB: TDate; SRZCLBID: integer): string; 	//FYKZ + QTSR
function  GetSqlRqLsz(RQA, RQB: TDate): string; 	//DJZB
function  GetSqlKhLsz(RQA, RQB: TDate; KHID: integer): string; 	//KHLSZ
function  GetSqlGysLsz(RQA, RQB: TDate; GYSID: integer): string; 	//GYSLSZ
function  GetSqlSzLsz(RQA, RQB: TDate): string; 	//SZLSZ
function  GetSqlLrmx(RQA, RQB: TDate): string; 	//XSKD + XSTH (XSTH.SL -> -XSTH.SL) + QTSR + FYKZ
//Open Dj
procedure OpenDj(LX, ZBID: Variant);
procedure OpenXsdd(ZBID: Variant);  //'销售订单'
procedure OpenXskd(ZBID: Variant);  //'现金销售' '挂帐销售'
procedure OpenXsth(ZBID: Variant);  //'销售退货'
procedure OpenXssk(ZBID: Variant);  //'销售收款'
procedure OpenXsSkgc(ZBID: Variant);  //'销售收款过程'
procedure OpenXsThgc(ZBID: Variant);  //'销售提货过程'
procedure OpenCgdd(ZBID: Variant);  //'采购订单'
procedure OpenCgsh(ZBID: Variant);  //'采购收货'
procedure OpenCgth(ZBID: Variant);  //'现金采购' '挂帐采购'
procedure OpenCgfk(ZBID: Variant);  //'采购付款'
procedure OpenCgFkgc(ZBID: Variant);  //'采购付款过程'
procedure OpenLl(ZBID: Variant);  //'领料'
procedure OpenTl(ZBID: Variant);  //'退料'
procedure OpenCpjc(ZBID: Variant);  //'产品进仓'
procedure OpenKcpd(ZBID: Variant);  //'库存盘点'
procedure OpenCkdb(ZBID: Variant);  //'仓库调拨' '仓库调入' '仓库调出'
procedure OpenQtkcbd(ZBID: Variant);  //'库存变动' '其它库存变动-减少' '其它库存变动-增加'
procedure OpenThgc(ZBID: Variant);  //'退还过程' '其它库存变动-退还增加' '其它库存变动-退还减少'
procedure OpenFykz(ZBID: Variant);  //'费用开支'
procedure OpenQtsr(ZBID: Variant);  //'其它收入'
procedure OpenYhckqk(ZBID: Variant);  //'其它收入'

implementation

uses
	Dm, Main, ComFun, Common, Xsdd, Xskd, Xsth, Cgdd, Cgsh, Cgth, XsSkgc, CgFkgc,
  Ll, Tl, Cpjc, Kcpd, Ckdb, Qtkcbd, Thgc, Xssk, Cgfk, Qtsr, Fykz, YhckqkCk, XsThgc;

//取新的单号
function GetDjbh(strDj: string; datRq: TDate; strTable: string): string;
var
  strDjbh: string;
  strRq: string;
begin
  strDjbh := '';
  strRq := strDj + FormatDateTime('YYMMDD', datRq);
  with CurDs do
  begin
    Close;
    CommandText := 'select top 1 DJBH from ' + strTable + ' ' +
      'where ID > 0 and DJBH like ''' + strRq + '%'' ' +
      'order by DJBH desc';
    Open;
    strDjbh := Fields[0].AsString;
    Close;
  end;
  if strDjbh = '' then
    strDjbh := strRq + '0001'
  else
  begin
    strDjbh := FormatFloat('0000', StrToInt(Copy(strDjbh, 9, 4)) + 1);
    strDjbh := strRq + strDjbh;
  end;
  result := strDjbh;
end;

//取售价
function GetSj(AHPID, ASJZLID: integer): Double;
begin
  with CurDs do
  begin
    Close;
    CommandText := 'select SJ from HPSJ ' +
      'where HPID = ' + IntToStr(AHPID) + ' and SJZLID = ' + IntToStr(ASJZLID);
    Open;
    if IsEmpty then
      result := 0
    else
      result := Fields[0].AsFloat;
    Close;
  end;
end;

//取消字符串中的快捷键字符串
function  ClearHotKey(strCaption: string): string;
begin
  if Pos('(&', strCaption) = 0 then
    result := strCaption
  else
    result := Copy(strCaption + 'a', 1, Pos('(&', strCaption) - 1);
end;

//把SQL返回的第一个值放入Strings
procedure ValuesToStrings(ssItem: TStrings; strSql: string);
begin
  ssItem.Clear;
  with CurDs do
  begin
    CommandText := strSql;
    Open;
    while not Eof do
    begin
      ssItem.Add(Fields[0].AsString);
      Next
    end;
    Close;
  end;
end;

//打开单据
procedure OpenDj(LX, ZBID: Variant);
var
  strLX: string;
begin
  if (VarToStr(LX) = '') or (VarToInt(ZBID) <= 0) then
  begin
    Application.MessageBox('不能打开此单据。', '操作失败', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  strLX := VarToStr(LX);
  if (strLX = '销售订单') then
    OpenXsdd(ZBID)
  else if (strLX = '销售开单') or (strLX = '现金销售') or (strLX = '挂帐销售') then
    OpenXskd(ZBID)
  else if (strLX = '销售退货') then
    OpenXsth(ZBID)
  else if (strLX = '销售收款') then
    OpenXssk(ZBID)
  else if (strLX = '销售收款过程') then
    OpenXsSkgc(ZBID)
  else if (strLX = '采购订单') then
    OpenCgdd(ZBID)
  else if (strLX = '采购收货') or (strLX = '现金采购') or (strLX = '挂帐采购') then
    OpenCgsh(ZBID)
  else if (strLX = '采购退货') then
    OpenCgth(ZBID)
  else if (strLX = '采购付款') then
    OpenCgfk(ZBID)
  else if (strLX = '采购付款过程') then
    OpenCgFkgc(ZBID)
  else if (strLX = '领料') then
    OpenLl(ZBID)
  else if (strLX = '退料') then
    OpenTl(ZBID)
  else if (strLX = '产品进仓') then
    OpenCpjc(ZBID)
  else if (strLX = '库存盘点') then
    OpenKcpd(ZBID)
  else if (strLX = '仓库调拨') or (strLX = '仓库调入') or (strLX = '仓库调出') then
    OpenCkdb(ZBID)
  else if (strLX = '库存变动') or (strLX = '其它库存变动-减少') or (strLX = '其它库存变动-增加') then
    OpenQtkcbd(ZBID)
  else if (strLX = '退还过程') or (strLX = '其它库存变动-退还增加') or (strLX = '其它库存变动-退还减少') then
    OpenThgc(ZBID)
  else if (strLX = '费用开支') then
    OpenFykz(ZBID)
  else if (strLX = '其它收入') then
    OpenQtsr(ZBID)
  else if (strLX = '帐户转入') or (strLX = '帐户转出') then
    OpenYhckqk(ZBID)
  else
    Application.MessageBox('不能打开此单据。', '操作失败', MB_OK + MB_ICONWARNING);
end;

//'销售订单'
procedure OpenXsdd(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Xsddzb do
  begin
    Close;
    CommandText :=
      'select Z.*, iif(Z.ZT,''是'',''否'') as aZT, ' +
      'K.BH as aKHBH, K.MC as aKHMC ' +
      'from XSDDZB Z, KH K, Z inner join K on Z.KHID = K.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmXsdd := TfrmXsdd.Create(Application);
  with frmXsdd do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'现金销售' or '挂帐销售'
procedure OpenXskd(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Xskdzb do
  begin
    Close;
    CommandText :=
      'select Z.*, iif(XSLX=1, JE, YSJE) as YSJE1, JE - YSJE1 as MSJE, ' +
      'switch(XSLX=1,''现款'', XSLX=2,''挂帐'') as aXSLX, ' +
      'switch(FPLX=1,''收据'', FPLX=2,''普通发票'',FPLX=3,''增值税发票'') as aFPLX, ' +
      'K.BH as aKHBH, K.MC as aKHMC, ' +
      'C.MC as aCKMC, ' +
      'S.MC as aSFKFSMC, H.MC as aZHMC ' +
      'from XSKDZB Z,KH K,CK C, SFKFS S, ZH H, ' +
      'Z inner join K on Z.KHID = K.ID, ' +
      'Z inner join C on Z.CKID = C.ID, ' +
      'Z left join S on Z.SFKFSID = S.ID, ' +
      'Z left join H on Z.ZHID = H.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmXskd := TfrmXskd.Create(Application);
  with frmXskd do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'销售退货'
procedure OpenXsth(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Xsthzb do
  begin
    Close;
    CommandText :=
      'select Z.*, ' +
      'switch(THLX=1,''退现款给客户'', THLX=2,''退款转入客户预收款'') as aTHLX, ' +
      'K.BH as aKHBH, K.MC as aKHMC, ' +
      'C.MC as aCKMC,S.MC as aSFKFSMC, H.MC as aZHMC ' +
      'from XSTHZB Z,KH K,CK C,SFKFS S,ZH H, ' +
      'Z inner join K on Z.KHID = K.ID, ' +
      'Z inner join C on Z.CKID = C.ID, ' +
      'Z left join S on Z.SFKFSID = S.ID, ' +
      'Z left join H on Z.ZHID = H.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmXsth := TfrmXsth.Create(Application);
  with frmXsth do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'销售收款'
procedure OpenXssk(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Xsskzb do
  begin
    Close;
    CommandText :=
      'select Z.*, ' +
      'switch(FKLX=1,''应收款'', FKLX=2,''预收款'') as aFKLX, ' +
      'K.BH as aKHBH, K.MC as aKHMC, ' +
      'S.MC as aSFKFSMC, H.MC as aZHMC ' +
      'from XSSKZB Z, KH K, SFKFS S, ZH H, ' +
      'Z inner join K on Z.KHID = K.ID, ' +
      'Z inner join S on Z.SFKFSID = S.ID, ' +
      'Z inner join H on Z.ZHID = H.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmXssk := TfrmXssk.Create(Application);
  with frmXssk do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'采购订单'
procedure OpenCgdd(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Cgddzb do
  begin
    Close;
    CommandText :=
      'select Z.*, iif(Z.ZT,''是'',''否'') as aZT, ' +
      'K.BH as aGYSBH, K.MC as aGYSMC ' +
      'from CGDDZB Z, GYS K, Z inner join K on Z.GYSID = K.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmCgdd := TfrmCgdd.Create(Application);
  with frmCgdd do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'采购收货'
procedure OpenCgsh(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Cgshzb do
  begin
    Close;
    CommandText :=
      'select Z.*, iif(CGLX=1, JE, YFJE) as YFJE1, JE - YFJE1 as MFJE, ' +
      'switch(CGLX=1,''现款'', CGLX=2,''挂帐'') as aCGLX, ' +
      'switch(FPLX=1,''收据'', FPLX=2,''普通发票'', FPLX=3,''增值税发票'') as aFPLX, ' +
      'K.BH as aGYSBH, K.MC as aGYSMC, ' +
      'C.MC as aCKMC, ' +
      'S.MC as aSFKFSMC, H.MC as aZHMC ' +
      'from CGSHZB Z,GYS K,CK C, SFKFS S, ZH H, ' +
      'Z inner join K on Z.GYSID = K.ID, ' +
      'Z inner join C on Z.CKID = C.ID, ' +
      'Z left join S on Z.SFKFSID = S.ID, ' +
      'Z left join H on Z.ZHID = H.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmCgsh := TfrmCgsh.Create(Application);
  with frmCgsh do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'现金采购' '挂帐采购'
procedure OpenCgth(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Cgthzb do
  begin
    Close;
    CommandText :=
      'select Z.*, ' +
      'switch(THLX=1,''供应商退现款'', THLX=2,''退款转入预付款'') as aTHLX, ' +
      'K.BH as aGYSBH, K.MC as aGYSMC, ' +
      'C.MC as aCKMC, S.MC as aSFKFSMC, H.MC as aZHMC ' +
      'from CGTHZB Z, GYS K, CK C, SFKFS S, ZH H, ' +
      'Z inner join K on Z.GYSID = K.ID, ' +
      'Z inner join C on Z.CKID = C.ID, ' +
      'Z left join S on Z.SFKFSID = S.ID, ' +
      'Z left join H on Z.ZHID = H.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmCgth := TfrmCgth.Create(Application);
  with frmCgth do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'采购付款'
procedure OpenCgfk(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Cgfkzb do
  begin
    Close;
    CommandText :=
      'select Z.*, ' +
      'switch(FKLX=1,''应付款'', FKLX=2,''预付款'') as aFKLX, ' +
      'K.BH as aGYSBH, K.MC as aGYSMC, ' +
      'S.MC as aSFKFSMC, H.MC as aZHMC ' +
      'from CGFKZB Z, GYS K, SFKFS S, ZH H, ' +
      'Z inner join K on Z.GYSID = K.ID, ' +
      'Z inner join S on Z.SFKFSID = S.ID, ' +
      'Z inner join H on Z.ZHID = H.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmCgfk := TfrmCgfk.Create(Application);
  with frmCgfk do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'销售收款过程'
procedure OpenXsSkgc(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.XsSkgc do
  begin
    Close;
    CommandText :=
      'select Z.DJBH, Z.RQ, Z.JE as ZJE, M.JE as BCJE ' +
      'from XSSKZB Z,XSSK M ' +
      'where Z.ID=M.ZBID and M.JE <> 0 and M.DDID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmXsSkgc := TfrmXsSkgc.Create(Application);
  with frmXsSkgc do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'销售提货过程'
procedure OpenXsThgc(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.XsThgc do
  begin
    Close;
    CommandText :=
      'select Z.DJBH, Z.RQ, H.BH, H.PM, H.DW, M.SL, M.DJ, M.NSL, M.SL * M.DJ * (1 + M.NSL / 100) as JE ' +
      'from XSKDZB Z, XSKD M, HP H ' +
      'where Z.ID = M.ZBID and M.HPID = H.ID and M.DDID = ' + Float2Str(ZBID);
    Open;
  end;
  frmXsThgc := TfrmXsThgc.Create(Application);
  with frmXsThgc do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'采购付款过程'
procedure OpenCgFkgc(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.CgFkgc do
  begin
    Close;
    CommandText :=
      'select Z.DJBH, Z.RQ, Z.JE as ZJE, M.JE as BCJE ' +
      'from CGFKZB Z, CGFK M ' +
      'where Z.ID=M.ZBID and M.JE <> 0 and M.DDID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmCgFkgc := TfrmCgFkgc.Create(Application);
  with frmCgFkgc do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'领料'
procedure OpenLl(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Llzb do
  begin
    Close;
    CommandText :=
      'select Z.*, ' +
      'C.MC as aCKMC ' +
      'from LLZB Z, CK C, ' +
      'Z inner join C on Z.CKID = C.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmLl := TfrmLl.Create(Application);
  with frmLl do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'退料'
procedure OpenTl(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Llzb do
  begin
    Close;
    CommandText :=
      'select Z.*, ' +
      'C.MC as aCKMC ' +
      'from TLZB Z, CK C, ' +
      'Z inner join C on Z.CKID = C.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmLl := TfrmLl.Create(Application);
  with frmLl do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'产品进仓'
procedure OpenCpjc(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Cpjczb do
  begin
    Close;
    CommandText :=
      'select Z.*, ' +
      'C.MC as aCKMC ' +
      'from CPJCZB Z, CK C, ' +
      'Z inner join C on Z.CKID = C.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmCpjc := TfrmCpjc.Create(Application);
  with frmCpjc do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'库存盘点'
procedure OpenKcpd(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Kcpdzb do
  begin
    Close;
    CommandText :=
      'select Z.*, ' +
      'C.MC as aCKMC ' +
      'from KCPDZB Z, CK C, ' +
      'Z inner join C on Z.CKID = C.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmKcpd := TfrmKcpd.Create(Application);
  with frmKcpd do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'仓库调拨' '仓库调入' '仓库调出'
procedure OpenCkdb(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Ckdbzb do
  begin
    Close;
    CommandText :=
      'select Z.*, ' +
      'DC.MC as aDCCMC, ' +
      'DR.MC as aDRCMC ' +
      'from CKDBZB Z,CK DC,CK DR, ' +
      'Z inner join DC on Z.DCCID = DC.ID, ' +
      'Z inner join DR on Z.DRCID = DR.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmCkdb := TfrmCkdb.Create(Application);
  with frmCkdb do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'库存变动' '其它库存变动-减少' '其它库存变动-增加'
procedure OpenQtkcbd(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Qtkcbdzb do
  begin
    Close;
    CommandText :=
      'select Z.*, ' +
      'C.MC as aCKMC, ' +
      'L.MC as aQTKCBDLXMC, ' +
      'iif(L.RKL,''入库类(增加库存)'', ''出库类(减少库存)'') as aCRLX, ' +
      'iif(L.THBZ,''需要'', ''不需要'') as aTH ' +
      'from QTKCBDZB Z, CK C, QTKCBDLX L, ' +
      'Z inner join C on Z.CKID = C.ID, ' +
      'Z inner join L on Z.QTKCBDLXID = L.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmQtkcbd := TfrmQtkcbd.Create(Application);
  with frmQtkcbd do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'退还过程' '其它库存变动-退还增加' '其它库存变动-退还减少'
procedure OpenThgc(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Qtkcbdzb do
  begin
    Close;
    CommandText :=
      'select Z.*, ' +
      'C.MC as aCKMC, ' +
      'L.MC as aQTKCBDLXMC, ' +
      'iif(L.RKL,''入库类(增加库存)'', ''出库类(减少库存)'') as aCRLX, ' +
      'iif(L.THBZ,''需要'', ''不需要'') as aTH ' +
      'from QTKCBDZB Z, CK C, QTKCBDLX L, ' +
      'Z inner join C on Z.CKID = C.ID, ' +
      'Z inner join L on Z.QTKCBDLXID = L.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmThgc := TfrmThgc.Create(Application);
  with frmThgc do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'费用开支'
procedure OpenFykz(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Fykzzb do
  begin
    Close;
    CommandText :=
      'select Z.*, ' +
      'S.MC as aSFKFSMC, H.MC as aZHMC ' +
      'from FYKZZB Z, SFKFS S, ZH H, ' +
      'Z left join S on Z.SFKFSID = S.ID, ' +
      'Z left join H on Z.ZHID = H.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmFykz := TfrmFykz.Create(Application);
  with frmFykz do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'其它收入'
procedure OpenQtsr(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  with Data.Qtsrzb do
  begin
    Close;
    CommandText :=
      'select Z.*, ' +
      'S.MC as aSFKFSMC, H.MC as aZHMC ' +
      'from QTSRZB Z, SFKFS S, ZH H, ' +
      'Z left join S on Z.SFKFSID = S.ID, ' +
      'Z left join H on Z.ZHID = H.ID where Z.ID = ' + Float2Str(ZBID) + ' ' +
      'order by Z.DJBH';
    Open;
  end;
  frmQtsr := TfrmQtsr.Create(Application);
  with frmQtsr do
  begin
    strState := 'V';
    blnStopScroll := True;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//'帐户转入' '帐户转出'
procedure OpenYhckqk(ZBID: Variant);
begin
  Screen.Cursor := crHourGlass;
  frmYhckqkCk := TfrmYhckqkCk.Create(Application);
  with frmYhckqkCk do
  begin
    intID := ZBID;
    ShowModal;
    Free;
  end;
  Screen.Cursor := crDefault;
end;

//CGSH + CGTH (CHTH.SL -> -CGTH.SL)
function  GetSqlHpqc(CKID, HPID: integer): string;
var
  sWhere, sSqlQC, sSqlHP: string;
begin
  sWhere := '';
  if CKID <> 0 then
    sWhere := 'CKID = ' + Float2Str(CKID);
  if HPID <> 0 then
    if sWhere <> '' then
      sWhere := sWhere + ' and HPID = ' + Float2Str(HPID)
    else
      sWhere := 'HPID = ' + Float2Str(HPID);
  if sWhere <> '' then
    sWhere := 'where ' + sWhere;
  sSqlQC :=
    'select HPID, sum(QCS) as QCS1 ' +
    'from HPKC ' + sWhere + ' ' +
    'group by HPID';
  sSqlHP :=
    'select H.ID, H.BH, H.PM, H.DW, K.QCS1, K.QCS1 * H.QCJQJ as QCJE1 ' +
    'from HP H, (' + sSqlQC + ') K ' +
    'where K.HPID = H.ID';
  Result := sSqlHP;
end;

//All JC CC
function  GetSqlJcmx(RQA, RQB: TDate; CKID, HPID: integer): string;
var
  sCGSH, sCGTH, sXSKD, sXSTH, sLL, sTL, sCPJC, sKCPD, sDR, sDC, sQBJX, sQBZJ,
  sTHJX, sTHZJ, sWhere: string;
begin
  //Common Where
  if RQA = 0 then
    sWhere := 'Z.RQ <= #' + FormatDateTime('yyyy-mm-dd', RQB) + '#'
  else
    sWhere := 'Z.RQ between #' + FormatDateTime('yyyy-mm-dd', RQA) + '# and ' +
      '#' + FormatDateTime('yyyy-mm-dd', RQB) + '#';
  if CKID > 0 then
    sWhere := sWhere + ' and Z.CKID = ' + IntToStr(CKID);
  if HPID > 0 then
    sWhere := sWhere + ' and M.HPID = ' + IntToStr(HPID);
  //Set SQL  (JCLX   1,进仓  2,出仓)
  sCGSH :=
    'select 1 as JCLX, M.CKID, M.HPID, M.ZBID, ' +
    'iif(Z.CGLX=1, ''现金采购'', ''挂帐采购'') as LX, Z.RQ, Z.DJBH, K.MC as MC1, ' +
    '+ M.SL as SL1, M.DJ as DJ1, val(Format(M.SL * M.DJ, ''0.00'')) as JE1 ' +
    'from CGSHZB Z, CGSH M, GYS K ' +
    'where M.ZBID = Z.ID and Z.GYSID = K.ID and ' + sWhere;
  sCGTH :=
    'select 1 as JCLX, M.CKID, M.HPID, M.ZBID, ' +
    '''采购退货'' as LX, Z.RQ, Z.DJBH, K.MC as MC1, ' +
    '- M.SL as SL1, M.DJ as DJ1, val(Format(M.SL * M.DJ, ''0.00'')) as JE1 ' +
    'from CGTHZB Z, CGTH M, GYS K ' +
    'where M.ZBID = Z.ID and Z.GYSID = K.ID and ' + sWhere;
  sXSKD :=
    'select 2 as JCLX, M.CKID, M.HPID, M.ZBID, ' +
    'iif(Z.XSLX=1, ''现金销售'', ''挂帐销售'') as LX, Z.RQ, Z.DJBH, K.MC as MC1, ' +
    '- M.SL as SL1, M.DJ as DJ1, val(Format(M.SL * M.DJ, ''0.00'')) as JE1 ' +
    'from XSKDZB Z, XSKD M, KH K ' +
    'where M.ZBID = Z.ID and Z.KHID = K.ID and ' + sWhere;
  sXSTH :=
    'select 2 as JCLX, M.CKID, M.HPID, M.ZBID, ' +
    '''销售退货'' as LX, Z.RQ, Z.DJBH, K.MC as MC1, ' +
    '+ M.SL as SL1, M.DJ as DJ1, val(Format(M.SL * M.DJ, ''0.00'')) as JE1 ' +
    'from XSTHZB Z, XSTH M, KH K ' +
    'where M.ZBID = Z.ID and Z.KHID = K.ID and ' + sWhere;
  sLL :=
    'select 2 as JCLX, M.CKID, M.HPID, M.ZBID, ' +
    '''领料'' as LX, Z.RQ, Z.DJBH, K.MC as MC1, ' +
    '- M.SL as SL1, M.DJ as DJ1, val(Format(M.SL * M.DJ, ''0.00'')) as JE1 ' +
    'from LLZB Z, LL M, CK K ' +
    'where M.ZBID = Z.ID and Z.CKID = K.ID and ' + sWhere;
  sTL :=
    'select 1 as JCLX, M.CKID, M.HPID, M.ZBID, ' +
    '''退料'' as LX, Z.RQ, Z.DJBH, K.MC as MC1, ' +
    '+ M.SL as SL1, M.DJ as DJ1, val(Format(M.SL * M.DJ, ''0.00'')) as JE1 ' +
    'from TLZB Z, TL M, CK K ' +
    'where M.ZBID = Z.ID and Z.CKID = K.ID and ' + sWhere;
  sCPJC :=
    'select 1 as JCLX, M.CKID, M.HPID, M.ZBID, ' +
    '''产品进仓'' as LX, Z.RQ, Z.DJBH, K.MC as MC1, ' +
    '+ M.SL as SL1, M.DJ as DJ1, val(Format(M.SL * M.DJ, ''0.00'')) as JE1 ' +
    'from CPJCZB Z, CPJC M, CK K ' +
    'where M.ZBID = Z.ID and Z.CKID = K.ID and ' + sWhere;
  sKCPD :=
    'select 1 as JCLX, M.CKID, M.HPID, M.ZBID, ' +
    '''库存调整'' as LX, Z.RQ, Z.DJBH, K.MC as MC1, ' +
    '+ M.SL as SL1, M.DJ as DJ1, val(Format(M.SL * M.DJ, ''0.00'')) as JE1 ' +
    'from KCPDZB Z, KCPD M, CK K ' +
    'where M.ZBID = Z.ID and Z.CKID = K.ID and ' + sWhere;
  sDR :=
    'select 2 as JCLX, M.DCCID as CKID, M.HPID, M.ZBID, ' +
    '''仓库调出'' as LX, Z.RQ, Z.DJBH, K.MC as MC1, ' +
    '- M.SL as SL1, M.DJ as DJ1, val(Format(M.SL * M.DJ, ''0.00'')) as JE1 ' +
    'from CKDBZB Z, CKDB M, CK K ' +
    'where M.ZBID = Z.ID and Z.DCCID = K.ID and ' + StringReplace(sWhere, 'Z.CKID', 'Z.DCCID', [rfReplaceAll]);
  sDC :=
    'select 1 as JCLX, M.DRCID as CKID, M.HPID, M.ZBID, ' +
    '''仓库调入'' as LX, Z.RQ, Z.DJBH, K.MC as MC1, ' +
    '+ M.SL as SL1, M.DJ as DJ1, val(Format(M.SL * M.DJ, ''0.00'')) as JE1 ' +
    'from CKDBZB Z, CKDB M, CK K ' +
    'where M.ZBID = Z.ID and Z.DRCID = K.ID and ' + StringReplace(sWhere, 'Z.CKID', 'Z.DRCID', [rfReplaceAll]);
  sQBJX :=
    'select 2 as JCLX, M.CKID, M.HPID, M.ZBID, ' +
    '''其它库存变动-减少'' as LX, Z.RQ, Z.DJBH, K.MC as MC1, ' +
    '- M.SL as SL1, M.DJ as DJ1, val(Format(M.SL * M.DJ, ''0.00'')) as JE1 ' +
    'from QTKCBDZB Z, QTKCBD M, CK K ' +
    'where M.ZBID = Z.ID and Z.CKID = K.ID and Z.CRLX = 1 and ' + sWhere;
  sQBZJ :=
    'select 1 as JCLX, M.CKID, M.HPID, M.ZBID, ' +
    '''其它库存变动-增加'' as LX, Z.RQ, Z.DJBH, K.MC as MC1, ' +
    '+ M.SL as SL1, M.DJ as DJ1, val(Format(M.SL * M.DJ, ''0.00'')) as JE1 ' +
    'from QTKCBDZB Z, QTKCBD M, CK K ' +
    'where M.ZBID = Z.ID and Z.CKID = K.ID and Z.CRLX = 2 and ' + sWhere;
  sTHJX :=
    'select 1 as JCLX, Z.CKID, M.HPID, M.ZBID, ' +
    '''其它库存变动-退还增加'' as LX, Z.RQ, Z.DJBH, K.MC as MC1, ' +
    '+ M.SL as SL1, M.DJ as DJ1, val(Format(M.SL * M.DJ, ''0.00'')) as JE1 ' +
    'from QTKCBDZB Z, THGC M, CK K ' +
    'where M.ZBID = Z.ID and Z.CKID = K.ID and Z.CRLX = 1 and ' + sWhere;
  sTHZJ :=
    'select 2 as JCLX, Z.CKID, M.HPID, M.ZBID, ' +
    '''其它库存变动-退还减少'' as LX, Z.RQ, Z.DJBH, K.MC as MC1, ' +
    '- M.SL as SL1, M.DJ as DJ1, val(Format(M.SL * M.DJ, ''0.00'')) as JE1 ' +
    'from QTKCBDZB Z, THGC M, CK K ' +
    'where M.ZBID = Z.ID and Z.CKID = K.ID and Z.CRLX = 2 and ' + sWhere;
  //Union All
  Result := sCGSH + ' union all ' + sCGTH + ' union all ' + sXSKD + ' union all ' +
    sXSTH + ' union all ' + sLL + ' union all ' + sTL + ' union all ' +
    sCPJC + ' union all ' + sKCPD + ' union all ' + sDR + ' union all ' +
    sDC + ' union all ' + sQBJX + ' union all ' + sQBZJ + ' union all ' +
    sTHJX + ' union all ' + sTHZJ;
end;

//All ZHJC
function  GetSqlZhmx(RQA, RQB: TDate; ZHID: integer): string;
var
  sCGSH, sCGFK, sCGTH, sXSKD, sXSSK, sXSTH, sFYKZ, sQTSR, sYHCK, sYHQK: string;
  sWhere: string;
begin
  //Common Where
  if RQA = 0 then
    sWhere := 'RQ <= #' + FormatDateTime('yyyy-mm-dd', RQB) + '#'
  else
    sWhere := 'RQ between #' + FormatDateTime('yyyy-mm-dd', RQA) + '# and ' +
      '#' + FormatDateTime('yyyy-mm-dd', RQB) + '#';
  if ZHID > 0 then
    sWhere := sWhere + ' and ZHID = ' + IntToStr(ZHID);
  //Set SQL  (JCLX   1,结余增加  2,结余减少)
  sCGSH :=
    'select ''采购收货'' as LX, ZHID, RQ, ID, DJBH, 0.000 as JEA, JE as JEB, JE as JYJE ' +
    'from CGSHZB where CGLX = 1 and ' + sWhere;
  sCGFK :=
    'select ''采购付款'' as LX, ZHID, RQ, ID, DJBH, 0.000 as JEA, JE as JEB, JE as JYJE  ' +
    'from CGFKZB where ' + sWhere;
  sCGTH :=
    'select ''采购退货'' as LX, ZHID, RQ, ID, DJBH, JE as JEA, 0.000 as JEB, JE as JYJE  ' +
    'from CGTHZB where THLX = 1 and ' + sWhere;
  sXSKD :=
    'select ''销售开单'' as LX, ZHID, RQ, ID, DJBH, JE as JEA, 0.000 as JEB, JE as JYJE  ' +
    'from XSKDZB where XSLX = 1 and ' + sWhere;
  sXSSK :=
    'select ''销售收款'' as LX, ZHID, RQ, ID, DJBH, JE as JEA, 0.000 as JEB, JE as JYJE  ' +
    'from XSSKZB where ' + sWhere;
  sXSTH :=
    'select ''销售退货'' as LX, ZHID, RQ, ID, DJBH, 0.000 as JEA, JE as JEB, JE as JYJE  ' +
    'from XSTHZB where THLX = 1 and ' + sWhere;
  sFYKZ :=
    'select ''费用开支'' as LX, ZHID, RQ, ID, DJBH, 0.000 as JEA, JE as JEB, JE as JYJE  ' +
    'from FYKZZB where ' + sWhere;
  sQTSR :=
    'select ''其它收入'' as LX, ZHID, RQ, ID, DJBH, JE as JEA, 0.000 as JEB, JE as JYJE  ' +
    'from QTSRZB where ' + sWhere;
  sYHCK :=
    'select ''帐户转入'' as LX, ZRZHID as ZHID, RQ, ID, '''' as DJBH, JE as JEA, 0.000 as JEB, JE as JYJE  ' +
    'from YHCKQK where ' + StringReplace(sWhere, 'ZHID', 'ZRZHID', [rfReplaceAll]);
  sYHQK :=
    'select ''帐户转出'' as LX, ZCZHID as ZHID, RQ, ID, '''' as DJBH, 0.000 as JEA, JE as JEB, JE as JYJE  ' +
    'from YHCKQK where ' + StringReplace(sWhere, 'ZHID', 'ZCZHID', [rfReplaceAll]);
  //Union All
  Result := sCGSH + ' union all ' + sCGFK + ' union all ' + sCGTH + ' union all ' + sXSKD + ' union all ' + sXSSK + ' union all ' + sXSTH + ' union all ' + sFYKZ + ' union all ' + sQTSR + ' union all ' + sYHCK + ' union all ' + sYHQK;
end;

//RqLsz
function  GetSqlRqLsz(RQA, RQB: TDate): string;
var
  sCGDD, sCGSH, sCGFK, sCGTH, sXSDD, sXSKD, sXSSK, sXSTH,
  sLL, sTL, sCPJC, sKCPD, sCPTJ, sCKDB, sQTKCBD, sFYKZ, sQTSR: string;
  sWhere: string;
begin
  sWhere := 'Z.RQ between #' + FormatDateTime('yyyy-mm-dd', RQA) + '# and ' +
    '#' + FormatDateTime('yyyy-mm-dd', RQB) + '#';
  sCGDD :=
    'select ''采购订单'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from CGDDZB Z, GYS K ' +
    'where Z.GYSID = K.ID and ' + sWhere;
  sCGSH :=
    'select ''采购收货'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from CGSHZB Z, GYS K ' +
    'where Z.GYSID = K.ID and ' + sWhere;
  sCGFK :=
    'select ''采购付款'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from CGFKZB Z, GYS K ' +
    'where Z.GYSID = K.ID and ' + sWhere;
  sCGTH :=
    'select ''采购退货'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from CGTHZB Z, GYS K ' +
    'where Z.GYSID = K.ID and ' + sWhere;
  sXSDD :=
    'select ''销售订单'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from XSDDZB Z, KH K ' +
    'where Z.KHID = K.ID and ' + sWhere;
  sXSKD :=
    'select ''销售开单'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from XSKDZB Z, KH K ' +
    'where Z.KHID = K.ID and ' + sWhere;
  sXSSK :=
    'select ''销售收款'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from XSSKZB Z, KH K ' +
    'where Z.KHID = K.ID and ' + sWhere;
  sXSTH :=
    'select ''销售退货'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from XSTHZB Z, KH K ' +
    'where Z.KHID = K.ID and ' + sWhere;
  sLL :=
    'select ''领料'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from LLZB Z, CK K ' +
    'where Z.CKID = K.ID and ' + sWhere;
  sTL :=
    'select ''退料'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from TLZB Z, CK K ' +
    'where Z.CKID = K.ID and ' + sWhere;
  sCPJC :=
    'select ''产品进仓'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from CPJCZB Z, CK K ' +
    'where Z.CKID = K.ID and ' + sWhere;
  sKCPD :=
    'select ''库存盘点'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from CPJCZB Z, CK K ' +
    'where Z.CKID = K.ID and ' + sWhere;
  sCPTJ :=
    'select ''存货调价'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from CHTJZB Z, CK K ' +
    'where Z.CKID = K.ID and ' + sWhere;
  sCKDB :=
    'select ''仓库调拨'' as LX, Z.RQ, Z.ID, Z.DJBH, K1.MC + '' -> '' + K2.MC as MC1, Z.JE, Z.BZ ' +
    'from CKDBZB Z, CK K1, CK K2 ' +
    'where Z.DCCID = K1.ID and Z.DRCID = K2.ID and ' + sWhere;
  sQTKCBD :=
    'select ''库存变动'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from QTKCBDZB Z, CK K ' +
    'where Z.CKID = K.ID and ' + sWhere;
  sFYKZ :=
    'select ''费用开支'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from FYKZZB Z, ZH K ' +
    'where Z.ZHID = K.ID and ' + sWhere;
  sQTSR :=
    'select ''其它收入'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from QTSRZB Z, ZH K ' +
    'where Z.ZHID = K.ID and ' + sWhere;
  //Union All
  Result := sCGDD + ' union all ' + sCGSH + ' union all ' + sCGFK + ' union all ' + sCGTH + ' union all ' + sXSDD + ' union all ' + sXSKD + ' union all ' + sXSSK + ' union all ' + sXSTH + ' union all ' +
    sLL + ' union all ' + sTL + ' union all ' + sCPJC + ' union all ' + sKCPD + ' union all ' + sCPTJ + ' union all ' + sCKDB + ' union all ' + sQTKCBD + ' union all ' + sFYKZ + ' union all ' + sQTSR
end;

//KhLsz
function  GetSqlKhLsz(RQA, RQB: TDate; KHID: integer): string;
var
  sXSDD, sXSKD, sXSSK, sXSTH: string;
  sWhere: string;
begin
  sWhere := 'Z.KHID = ' + IntToStr(KHID) + ' and ' +
    'Z.RQ between #' + FormatDateTime('yyyy-mm-dd', RQA) + '# and ' +
    '#' + FormatDateTime('yyyy-mm-dd', RQB) + '#';
  sXSDD :=
    'select ''销售订单'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from XSDDZB Z, KH K ' +
    'where Z.KHID = K.ID and ' + sWhere;
  sXSKD :=
    'select ''销售开单'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from XSKDZB Z, KH K ' +
    'where Z.KHID = K.ID and ' + sWhere;
  sXSSK :=
    'select ''销售收款'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from XSSKZB Z, KH K ' +
    'where Z.KHID = K.ID and ' + sWhere;
  sXSTH :=
    'select ''销售退货'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from XSTHZB Z, KH K ' +
    'where Z.KHID = K.ID and ' + sWhere;
  //Union All
  Result := sXSDD + ' union all ' + sXSKD + ' union all ' + sXSSK + ' union all ' + sXSTH;
end;

//GysLsz
function  GetSqlGysLsz(RQA, RQB: TDate; GYSID: integer): string;
var
  sCGDD, sCGSH, sCGFK, sCGTH: string;
  sWhere: string;
begin
  sWhere := 'Z.GYSID = ' + IntToStr(GYSID) + ' and ' +
    'Z.RQ between #' + FormatDateTime('yyyy-mm-dd', RQA) + '# and ' +
    '#' + FormatDateTime('yyyy-mm-dd', RQB) + '#';
  sCGDD :=
    'select ''采购订单'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from CGDDZB Z, GYS K ' +
    'where Z.GYSID = K.ID and ' + sWhere;
  sCGSH :=
    'select ''采购收货'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from CGSHZB Z, GYS K ' +
    'where Z.GYSID = K.ID and ' + sWhere;
  sCGFK :=
    'select ''采购付款'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from CGFKZB Z, GYS K ' +
    'where Z.GYSID = K.ID and ' + sWhere;
  sCGTH :=
    'select ''采购退货'' as LX, Z.RQ, Z.ID, Z.DJBH, K.MC as MC1, Z.JE, Z.BZ ' +
    'from CGTHZB Z, GYS K ' +
    'where Z.GYSID = K.ID and ' + sWhere;
  //Union All
  Result := sCGDD + ' union all ' + sCGSH + ' union all ' + sCGFK + ' union all ' + sCGTH;
end;

//SzLsz
function  GetSqlSzLsz(RQA, RQB: TDate): string;
var
  sFYKZ, sQTSR: string;
  sWhere: string;
begin
  sWhere := 'Z.RQ between #' + FormatDateTime('yyyy-mm-dd', RQA) + '# and ' +
    '#' + FormatDateTime('yyyy-mm-dd', RQB) + '#';
  sFYKZ :=
    'select ''费用开支'' as LX, K.MC as ZHMC, Z.RQ, Z.ID, Z.DJBH, ' +
    'S.MC as SFKFSMC, 0.00 as JEA, Z.JE as JEB, Z.BZ ' +
    'from FYKZZB Z, ZH K, SFKFS S ' +
    'where Z.ZHID = K.ID and Z.SFKFSID = S.ID and ' + sWhere;
  sQTSR :=
    'select ''其它收入'' as LX, K.MC as ZHMC, Z.RQ, Z.ID, Z.DJBH, ' +
    'S.MC as SFKFSMC, Z.JE as JEA, 0.00 as JEB, Z.BZ ' +
    'from QTSRZB Z, ZH K, SFKFS S ' +
    'where Z.ZHID = K.ID and Z.SFKFSID = S.ID and ' + sWhere;
  //Union All
  Result := sFYKZ + ' union all ' + sQTSR;
end;

//LrMx
function  GetSqlLrmx(RQA, RQB: TDate): string;
var
  sXSKD, sXSTH, sFYKZ, sQTSR: string;
  sWhere: string;
begin
  sWhere := 'Z.RQ between #' + FormatDateTime('yyyy-mm-dd', RQA) + '# and ' +
    '#' + FormatDateTime('yyyy-mm-dd', RQB) + '#';
  sXSKD :=
    'select Z.RQ, M.SL as SL1, M.DJ, M.CBDj, 0.000 as FYJE1, 0.000 as SRJE1 ' +
    'from XSKDZB Z, XSKD M ' +
    'where M.ZBID = Z.ID and ' + sWhere;
  sXSTH :=
    'select Z.RQ, - M.SL as SL1, M.DJ, M.CBDj, 0.000 as FYJE1, 0.000 as SRJE1 ' +
    'from XSTHZB Z, XSTH M ' +
    'where M.ZBID = Z.ID and ' + sWhere;
  sFYKZ :=
    'select Z.RQ, 0 as SL1, 0 as DJ, 0 as CBDj, JE as FYJE1, 0.000 as SRJE1 ' +
    'from FYKZZB Z ' +
    'where ' + sWhere;
  sQTSR :=
    'select Z.RQ, 0 as SL1, 0 as DJ, 0 as CBDj, 0.000 as FYJE1, JE as SRJE1 ' +
    'from QTSRZB Z ' +
    'where ' + sWhere;
  //Union All
  Result := sXSKD + ' union all ' + sXSTH + ' union all ' + sFYKZ + ' union all ' + sQTSR;
end;

//CGSH + CGTH (CHTH.SL -> -CGTH.SL)
function  GetSqlCgmx(RQA, RQB: TDate; strTj: string): string;
begin
  if strTj <> '' then
    strTj := 'where ' + strTj;
  Result :=
    'select * from (' +
    'select iif(Z.CGLX=1, ''现金采购'', ''挂帐采购'') as LX, ' +
    'M.ZBID, Z.DJBH, Z.RQ, Z.GYSID, L.MC as HPLBMC, Z.YWY, M.HPID, M.SL as SL1, M.DJ, M.NSL ' +
    'from CGSHZB Z, CGSH M, GYS K, HP H, HPLB L ' +
    'where Z.ID = M.ZBID and K.ID = Z.GYSID and H.ID = M.HPID and L.ID = H.HPLBID and ' +
    'M.RQ between  #' + FormatDateTime('yyyy-mm-dd', RQA) + '# and #' + FormatDateTime('yyyy-mm-dd', RQB) + '#) m ' +
    strtj + ' ' +
    'union all ' +
    'select * from (' +
    'select ''采购退货'' as LX, ' +
    'M.ZBID, Z.DJBH, Z.RQ, Z.GYSID, L.MC as HPLBMC, Z.YWY, M.HPID, -M.SL as SL1, M.DJ, M.NSL ' +
    'from CGTHZB Z, CGTH M, GYS K, HP H, HPLB L ' +
    'where Z.ID = M.ZBID and K.ID = Z.GYSID and H.ID = M.HPID and L.ID = H.HPLBID and ' +
    'M.RQ between  #' + FormatDateTime('yyyy-mm-dd', RQA) + '# and #' + FormatDateTime('yyyy-mm-dd', RQB) + '#) m ' +
    strtj;
end;

//XSKD + XSTH (XSTH.SL -> -XSTH.SL)
function  GetSqlXsmx(RQA, RQB: TDate; strTj: string): string;
begin
  if strTj <> '' then
    strTj := 'where ' + strTj;
  Result :=
    'select * from (' +
    'select iif(Z.XSLX=1, ''现金销售'', ''挂帐销售'') as LX, ' +
    'M.ZBID, Z.DJBH, Z.RQ, Z.KHID, D.MC as DQMC, L.MC as HPLBMC, Z.YWY, M.HPID, M.SL as SL1, M.DJ, M.CBDJ, M.NSL ' +
    'from XSKDZB Z, XSKD M, KH K, DQ D, HP H, HPLB L ' +
    'where Z.ID = M.ZBID and K.ID = Z.KHID and D.ID = K.DQID and H.ID = M.HPID and L.ID = H.HPLBID and ' +
    'M.RQ between  #' + FormatDateTime('yyyy-mm-dd', RQA) + '# and #' + FormatDateTime('yyyy-mm-dd', RQB) + '#) m ' +
    strtj + ' ' +
    'union all ' +
    'select * from (' +
    'select ''销售退货'' as LX, ' +
    'M.ZBID, Z.DJBH, Z.RQ, Z.KHID, D.MC as DQMC, L.MC as HPLBMC, Z.YWY, M.HPID, -M.SL as SL1, M.DJ, M.CBDJ, M.NSL ' +
    'from XSTHZB Z, XSTH M, KH K, DQ D, HP H, HPLB L ' +
    'where Z.ID = M.ZBID and K.ID = Z.KHID and D.ID = K.DQID and H.ID = M.HPID and L.ID = H.HPLBID and ' +
    'M.RQ between  #' + FormatDateTime('yyyy-mm-dd', RQA) + '# and #' + FormatDateTime('yyyy-mm-dd', RQB) + '#) m ' +
    strtj;
end;

//XSKD(LX=2) + XSSK + XSTH(LX=2)
function  GetSqlKhwl(RQA, RQB: TDate; KHID: integer): string;
var
  sXSKD, sXSTH, sXSSK: string;
  sWhere: string;
begin
  if RQA = 0 then
    sWhere := '(Z.RQ is null or Z.RQ <= #' + FormatDateTime('yyyy-mm-dd', RQB) + '#)'
  else
    sWhere := '(Z.RQ is null or Z.RQ between #' + FormatDateTime('yyyy-mm-dd', RQA) + '# and ' +
      '#' + FormatDateTime('yyyy-mm-dd', RQB) + '#)';
  if KHID > 0 then
    sWhere := sWhere + ' and Z.KHID = ' + IntToStr(KHID);
  sXSKD :=
    'select ''挂帐销售'' as LX, Z.RQ, Z.ID as ZBID, Z.DJBH, Z.KHID, ' +
    'Z.JE as JEA, 0.00000 as JEB, Z.JE as JYJE ' +
    'from XSKDZB Z ' +
    'where Z.XSLX <> 1 and ' + sWhere;
  sXSTH :=
    'select ''销售退货'' as LX, Z.RQ, Z.ID as ZBID, Z.DJBH, Z.KHID, ' +
    '0.00000 as JEA, Z.JE as JEB, Z.JE as JYJE ' +
    'from XSTHZB Z ' +
    'where Z.THLX <> 1 and ' + sWhere;
  sXSSK :=
    'select ''销售收款'' as LX, Z.RQ, Z.ID as ZBID, Z.DJBH, Z.KHID, ' +
    '0.00000 as JEA, Z.JE as JEB, Z.JE as JYJE ' +
    'from XSSKZB Z ' +
    'where ' + sWhere;
  //Union All
  Result := sXSKD + ' union all ' + sXSTH + ' union all ' + sXSSK;
end;

//XSKD(LX=2) + XSSK + XSTH(LX=2)
function  GetSqlYsmx(RQ: TDate; KHID: integer): string;
var
  sWhere: string;
begin
  sWhere := '(RQ is null or RQ <= #' + FormatDateTime('yyyy-mm-dd', RQ) + '#)';
  if KHID > 0 then
    sWhere := sWhere + ' and KHID = ' + IntToStr(KHID);
  Result :=
    'select *, #' + FormatDateTime('yyyy-mm-dd', RQ) + '# - RQ + 1 as TS_1, ' +
    'iif(isnull(TS_1), 9999, TS_1) as TS, JE - YSJE as JE1 ' +
    'from XSKDZB ' +
    'where XSLX <> 1 and YSJE < JE and ' + sWhere;
end;

//CGSH(LX=2) + CGFK + CGTH(LX=2)
function  GetSqlGyswl(RQA, RQB: TDate; GYSID: integer): string;
var
  sCGSH, sCGTH, sCGFK: string;
  sWhere: string;
begin
  if RQA = 0 then
    sWhere := '(Z.RQ is null or Z.RQ <= #' + FormatDateTime('yyyy-mm-dd', RQB) + '#)'
  else
    sWhere := '(Z.RQ is null or Z.RQ between #' + FormatDateTime('yyyy-mm-dd', RQA) + '# and ' +
      '#' + FormatDateTime('yyyy-mm-dd', RQB) + '#)';
  if GYSID > 0 then
    sWhere := sWhere + ' and Z.GYSID = ' + IntToStr(GYSID);
  sCGSH :=
    'select ''挂帐采购'' as LX, Z.RQ, Z.ID as ZBID, Z.DJBH, Z.GYSID, ' +
    'Z.JE as JEA, 0.00000 as JEB, Z.JE as JYJE ' +
    'from CGSHZB Z ' +
    'where Z.CGLX <> 1 and ' + sWhere;
  sCGTH :=
    'select ''采购退货'' as LX, Z.RQ, Z.ID as ZBID, Z.DJBH, Z.GYSID, ' +
    '0.00000 as JEA, Z.JE as JEB, Z.JE as JYJE ' +
    'from CGTHZB Z ' +
    'where Z.THLX <> 1 and ' + sWhere;
  sCGFK :=
    'select ''采购付款'' as LX, Z.RQ, Z.ID as ZBID, Z.DJBH, Z.GYSID, ' +
    '0.00000 as JEA, Z.JE as JEB, Z.JE as JYJE ' +
    'from CGFKZB Z ' +
    'where ' + sWhere;
  //Union All
  Result := sCGSH + ' union all ' + sCGTH + ' union all ' + sCGFK;
end;

//CGSH
function  GetSqlYfmx(RQ: TDate; GYSID: integer): string;
var
  sWhere: string;
begin
  sWhere := '(RQ is null or RQ <= #' + FormatDateTime('yyyy-mm-dd', RQ) + '#)';
  if GYSID > 0 then
    sWhere := sWhere + ' and GYSID = ' + IntToStr(GYSID);
  Result :=
    'select *, #' + FormatDateTime('yyyy-mm-dd', RQ) + '# - RQ + 1 as TS_1, ' +
    'iif(isnull(TS_1), 9999, TS_1) as TS, JE - YFJE as JE1 ' +
    'from CGSHZB ' +
    'where CGLX <> 1 and YFJE < JE and ' + sWhere;
end;

//FYKZ + QTSR
function  GetSqlSzmx(RQA, RQB: TDate; SRZCLBID: integer): string;
var
  sWhere: string;
begin
  sWhere := 'Z.RQ between #' + FormatDateTime('yyyy-mm-dd', RQA) + '# and ' +
    '#' + FormatDateTime('yyyy-mm-dd', RQB) + '#';
  if SRZCLBID > 0 then
    sWhere := sWhere + ' and M.SRZCLBID = ' + IntToStr(SRZCLBID);
  Result :=
    'select ''费用开支'' as LX, Z.RQ, Z.ID as ZBID, Z.DJBH, M.SRZCLBID, ' +
    'M.JE as JEA, 0.00000 as JEB ' +
    'from FYKZZB Z, FYKZ M ' +
    'where M.ZBID = Z.ID and ' + sWhere + ' ' +
    'union all ' +
    'select ''其它收入'' as LX, Z.RQ, Z.ID as ZBID, Z.DJBH, M.SRZCLBID, ' +
    '0.00000 as JEA, M.JE as JEB ' +
    'from QTSRZB Z, QTSR M ' +
    'where M.ZBID = Z.ID and ' + sWhere;
end;

//DBGrid 的行颜色
procedure SetDBGridColor(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState; ColColor: TColor);
begin
  with TDBGrid(Sender).Canvas Do
  Begin
    if gdSelected in State Then
    begin
      Brush.Color := ColColor;
      Font.Color := clWhite;
    end else
    begin
      Brush.Color := clWhite;
      Font.Color := ColColor;
    end;
    DBGridAlign(TDBGrid(Sender), Column.Alignment, Rect, Column.Field.DisplayText);
  end;
end;

procedure StrToFile(Str, FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    Stream.WriteBuffer(Pointer(Str)^, Length(Str));
  finally
    Stream.Free;
  end;
end;

end.

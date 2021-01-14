unit uFunction;

interface

uses Forms, Sysutils,comctrls,db,dbtables,uDM,utilities,uConstant;

//=================================================================
//IfHaveRight 功能：判断是否有某一权限；
//            叁数：Qry--执行的TQuery；InUser--进入系统的用户(GlobalUser)；
//                  FormHint--打开窗体的Hint属性,要与权限资料表中的对应栏位相同
//                  MyF--这个窗体新增，删除，修改，列印，金额处理所对应的权限栏位，是指权限资料表 ；
//列印，金额权限处理办法：用此函数判断是否有 列印，金额处理权限，在Form Creat 设定相应enabled,visible属性；
//           可叁考Fm_2030;
function IfHaveRight(Qry:TQuery;InUser,FormHint,MyF : string) : boolean;
//IfDo 功能：  针对 新增，删除，修改的权限程式
//     叁数：   D：警示信息如：新增，删除，修改 ，其他叁数同 IfHaveRight的叁数；
//     用法：  传入正确叁数将此句放到 新增，删除，修改 前 事件；如：IfDo('新增',Qry1,GlobalUser,Hint,'F02');
//         可叁考Fm_2030;
procedure IfDo(D : string;Qry:TQuery;InUser,FormHint,MyF : string);// MyF ： 对于这个窗体新增，删除，修改所对应的权限 ；D：新增-删除-修改



//更新库存(半成品,成品,客户来料)
procedure UpdateStock(EQry: TQuery; TbNm,kind,QtyFdNm: string;  QtyFd, AutoNoFd: TField);

procedure UpdateDatumStock(EQry: TQuery; TbNm,kind,QtyFdNm: string;  QtyFd, NoFd: TField);
procedure DatumNoValidate(xQry: TQuery; TbNm: string; Sender: TField);
Procedure InforSave(xTb: TDataSet);// 把建档人,修改人,建档时间,修改时间存入资料表;
Procedure InforDisplay(T: TDataSet; S: string);

//更新制令单已领料量
procedure UpdateRelQty(EQry: TQuery; RelTbNm,kind,QtyFdNm: string;RelNoFd,ORelNoFd,QtyFd,AutoNoFd: TField);

//半成品更新领料单(入库时跟踪)
procedure UpdateSTakeQty(EQry: TQuery; kind: string;QtyFd,RelNoFd,SemiNoFd: TField);

//原料更新领料单(入库时跟踪)
procedure UpdateMTakeQty(EQry: TQuery; kind: string;QtyFd,RelNoFd,MaterNoFd: TField);
implementation

function IfHaveRight(Qry:TQuery;InUser,FormHint,MyF : string) : boolean; //MyF ： 对于这个窗体新增，删除，修改所对应的权限 ；
begin
  result := false;
  QryExec(Qry, Format('select %s as F from TUserRight where NM=''%s'' and K_SN=''%s''',
     [MyF,InUser,formHint]), False);
  qry.Open;
  if Qry.RecordCount >= 1 then
     if Qry.FieldByName('F').asboolean = true then
        result := true
     else
        result := false;
end;

procedure IfDo(D : string;Qry:TQuery;InUser,FormHint,MyF : string);// MyF ： 对于这个窗体新增，删除，修改所对应的权限 ；D：新增-删除-修改
begin
  if IfHaveRight(Qry,InUser,FormHint,MyF)=false then begin
     R_OkMessage(['对不起,您没有'+D+'权限!'],'');
     abort;
  end;
end;

//返回资料被新增与修改的人员和及日期到main的StatusBar上的函数,
//使用方法 :   InforDisplay(DataSet,'资料名称');
//eg :         InforDisplay(DataSet,'销货单明细档')
Procedure InforDisplay(T: TDataSet; S: string);
begin
  Try
    TStatusBar(Application.MainForm.FindComponent('StatusBar1')).Panels[1].Text :=S + ' --> 创建记录 : ' + T.FieldByName('BUser').AsString + ' - ' +T.FieldByName('Btime').AsString + ' , ' + ' 最后修改记录 : ' + T.FieldByName('EUser').AsString + ' - ' + T.FieldByName('Etime').AsString;
  except
    // 若在 Main Form 上找不到 StatusBar1 则不做处理
  end;
end;

procedure UpdateStock(EQry: TQuery; TbNm,kind,QtyFdNm: string;QtyFd, AutoNoFd: TField);
begin
  if not DM.DB.InTransaction then
    DM.DB.StartTransaction;
  try
    QryExec(EQry, Format('UPDATE %s SET %s = %s %s %f WHERE AutoNo = %d',
            [TbNm, QtyFdNm, QtyFdNm,kind, QtyFd.AsFloat, AutoNoFd.AsInteger]), False);
  except
    R_OkMessage(['内部发生错误,请重新再试一次!'],'');
    raise;
  end;
end;

// *************  原料以及物料库存更新程式  ************************************//
//调用方法 :
//   UpdateDatumStock(Qry1,'原.or.物表名','+','库存重量栏位', 领(退)重量,物品编号)
//eg:UpdateDatumStock(Qry1,'T1050','+','F04',Table2F03,Table2F02)
procedure UpdateDatumStock(EQry: TQuery; TbNm,kind,QtyFdNm: string;QtyFd, NoFd: TField);
begin
  if not DM.DB.InTransaction then
    DM.DB.StartTransaction;
  try
    QryExec(EQry, Format('UPDATE %s SET %s = %s %s%f WHERE F01 = ''%s''',
            [TbNm,QtyFdNm,QtyFdNm,kind,QtyFd.AsFloat,NoFd.AsString]), False);
  except
    R_OkMessage(['内部发生错误,请重新再试一次!'],'');
    raise;
  end;
end;


// *********************  判断物品编号是否存在  ***************************************
procedure DatumNoValidate(xQry: TQuery; TbNm: string; Sender: TField);
begin
  if (Sender.AsString='') or Sender.IsNull then
  begin
    R_OkMessage([Sender.DisplayName],rValue_isnotnull);
    abort;
  end
  else
  begin
    // 判断输入的 <原料 .or. 物料编号> 是否正确
    QryExec(xQry, format('Select F01 as iCnt From %s Where F01=''%s''',[TbNm,Sender.AsString]));
    if (xQry.RecordCount = 0) then
    begin
      R_OkMessage(['该编号不存在, 请重新输入正确的物品编号!']);
      abort;
    end;
  end;
end;

//把建档人,修改人,建档时间,修改时间存入资料表,在Table的BeforPost调用;
Procedure InforSave(xTb:TDataSet);
begin
 if xTb.State = dsInsert then
  begin
    xTb.FieldByName('BUser').AsString :=GlobalUser;
    xTb.FieldByName('BTime').AsDateTime :=Now;
  end;
  xTb.FieldByName('EUser').AsString :=GlobalUser;
  xTb.FieldByName('ETime').AsDateTime :=Now;
end;


procedure UpdateRelQty(EQry: TQuery; RelTbNm,kind,QtyFdNm: string;RelNoFd,ORelNoFd,QtyFd,AutoNoFd: TField);
begin
  if not DM.DB.InTransaction then
    DM.DB.StartTransaction;
  try
    QryExec(EQry, Format('UPDATE %s SET %s = %s %s %f WHERE F01 =''%s'' and F06=''%S'' and F02=%d',
            [RelTbNm, QtyFdNm, QtyFdNm,kind, QtyFd.AsFloat,RelNoFd.asstring,ORelNoFd.asstring,AutoNoFd.AsInteger]), False);
  except
    R_OkMessage(['内部发生错误,请重新再试一次!'],'');
    raise;
  end;
end;


//半成品更新领料单
procedure UpdateSTakeQty(EQry: TQuery; kind: string;QtyFd,RelNoFd,SemiNoFd: TField);
begin
  if not DM.DB.InTransaction then
    DM.DB.StartTransaction;
  try
    QryExec(EQry, Format('UPDATE T2140A SET F04 = F04 %s %f WHERE F01 =''%s'' and F02=%d',
            [kind, QtyFd.AsFloat,RelNoFd.asstring,SemiNoFd.AsInteger]), False);
  except
    R_OkMessage(['内部发生错误,请重新再试一次!'],'');
    raise;
  end;
end;


//原料更新领料单
procedure UpdateMTakeQty(EQry: TQuery; kind: string;QtyFd,RelNoFd,MaterNoFd: TField);
begin
  if not DM.DB.InTransaction then
    DM.DB.StartTransaction;
  try
    QryExec(EQry, Format('UPDATE T2130A SET F04 = F04 %s %f WHERE F01 =''%s'' and F02=''%s''',
            [kind, QtyFd.AsFloat,RelNoFd.asstring,MaterNoFd.AsString]), False);
  except
    R_OkMessage(['内部发生错误,请重新再试一次!'],'');
    raise;
  end;
end;



end.

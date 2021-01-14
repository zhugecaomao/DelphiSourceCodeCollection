unit utLeasehold;

interface
  uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBGrids, DBClient, DB, Registry, winsock,ADODB,variants,
  comobj,excel97,excel2000,QuickRpt,math, DBGridEh;

//公共函数
  function  returnDj(const sValue:string;ADO:TADOQuery):double;
  function TalkOutdata(const sValue,sBmbh:string;ADO:TADOQuery):double;  //查询最后一次数据
//******************************设置过程值******************************************
//公共的过程
  procedure UpdateData(const sSql,field,value:string;qytmp:TADOQuery);
  procedure ExecuteSQL(const sSql:string;ADO:TADOQuery;Excute:boolean);   //执行SQL语句
 var
   strsql
   ,s_value:string;
implementation
   uses u_public;
//******************************设置函数值*************************************************************//
function TalkOutdata(const sValue,sBmbh:string;ADO:TADOQuery):double;  //查询最后一次数据
begin
  strsql:='SELECT spbh, bmbh, sfrq, dj, fcsl, fczj, shsl, shzj, jczj,jcsl FROM sfdj ';
  strsql:=strsql+' WHERE spbh=:@spbh AND bmbh=:@bmbh';
  strsql:=strsql+' ORDER BY SERI DESC ,sfrq DESC' ;
  ado.Close ;
  ado.SQL.Clear ;
  ado.SQL.Add(strsql);
  ado.Parameters.ParamByName('@spbh').Value :=sValue;
  ado.Parameters.ParamByName('@bmbh').Value :=sBmbh;
  ado.Prepared ;
  ado.Open ;
  if ado.RecordCount >0 then
  begin            
    ado.First ;
    if ado.Fieldbyname('jcsl').Value=NULL then
     result:=0
     ELSE
    //result:=ado.Fieldbyname('jyzj').Value  ;
    result:=ado.Fieldbyname('jcsl').Value  ;
  end else
    result:=0;  
end;
//
function  returnDj(const sValue:string;ADO:TADOQuery):double;
begin
  strsql:='SELECT spbh, spdj,hsbl,tzcl,jldw,jldw2 FROM spbmk where spbh=:@spbh';
  ado.Close ;
  ado.SQL.Clear ;
  ado.SQL.Add(strsql);
  ado.Parameters.ParamByName('@spbh').Value :=sValue;
  ado.Prepared ;
  ado.Open ;
  if ado.RecordCount >0 then
  begin
  result:=ado.Fieldbyname('spdj').Value;
  CurrentParam.bl :=ado.Fieldbyname('hsbl').Value ;
  CurrentParam.tzcl :=ado.Fieldbyname('tzcl').Value ;
  CurrentParam.jldw :=ado.Fieldbyname('jldw').Value ;
  CurrentParam.jldw2 :=ado.Fieldbyname('jldw2').Value ;
  end  else
  result:=0;
end;
//******************************设置过程值******************************************

procedure ExecuteSQL(const sSql:string;ADO:TADOQuery;Excute:boolean);  //执行SQL语句
begin
 with  ado do
 begin
 close;
 sql.clear;
 sql.add(sSql);
 if not Excute then
  Open
 else
  ExecSQL; 
 end;
end;
//更新数据表
procedure UpdateData(const sSql,field,value:string;qytmp:TADOQuery);
begin
with qytmp do
begin
  close;
  sql.Clear ;
  sql.Add(sSql);
  Parameters.ParamByName(field).value:=value;
  prepared;
  execsql;
end;
end;



end.

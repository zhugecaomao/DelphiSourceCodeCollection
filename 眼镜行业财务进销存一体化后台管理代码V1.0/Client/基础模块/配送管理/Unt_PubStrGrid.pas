unit Unt_PubStrGrid;

///****专门为STRINGGRID建立的一个公用函数库   ydy create 2004-4-25***/

interface
  uses Windows, SysUtils, Messages,Classes, Controls,grids,inifiles,forms;

///2004-4-20 重写用于STRINGGRID的函数
procedure StrGridDeleteRow(sgorder:Tstringgrid;Row: Integer);
procedure StrGridClear(sgorder:Tstringgrid);
procedure StrGridAddRow(sgorder:Tstringgrid);


procedure InitialStrGrid(sgorder:TStringGrid;billtype:string);  ///初始化单据格式

procedure addgridrows(sgorder:TStringGrid); //增加行
procedure deletegridrows(sgorder:TStringGrid;prow:integer); // 删除所在行；


implementation

procedure StrGridAddRow(sgorder:Tstringgrid);
var
  rows:integer;
begin
    rows:=sgorder.RowCount-1;
//    if (trim(sgorder.Cells[1,rows])<>'') and (trim(sgorder.Cells[4,rows])<>'') then
//    begin
      sgorder.RowCount:=sgorder.RowCount+1;
      sgorder.Rows[sgorder.RowCount-1].Text:='';
//    end;
//  end;
end;

procedure StrGridDeleteRow(sgorder:Tstringgrid;Row: Integer);
var
  i : integer;
begin
//最后一行直接删除
 if (Row = sgorder.RowCount-1) and (row >1)  then
    Sgorder.RowCount := Sgorder.RowCount - 1;
//自动上移
  if (Row < Sgorder.RowCount) and (Row > Sgorder.FixedRows-1) then
  begin
    if Row < Sgorder.RowCount - 1 then
    begin
      for i := Row to Sgorder.RowCount-1 do
        Sgorder.Rows[i] := Sgorder.Rows[i+1];
      Sgorder.RowCount := Sgorder.RowCount - 1;
    end;
  end;
end;

procedure StrGridClear(sgorder:Tstringgrid);
var
  i,j:integer;
begin
   ///////////ydy add to clear the stringgrid
   with sgorder do
   begin
      for i:=1 to colCount do
         for j:=1 to rowCount do
            cells[i,j]:='';
   end;
   sgorder.RowCount := 2;
end;

procedure addgridrows(sgorder:TStringGrid); //增加行
begin
  sgorder.RowCount:=sgorder.RowCount+1;
  sgorder.Cells[0,sgorder.RowCount-1]:=inttostr(sgorder.RowCount-1); //显示序号;
end;
procedure deletegridrows(sgorder:TStringGrid;prow:integer); // 删除所在行；
var
  i,j:integer;                               
begin
  if prow>0 then
  begin
    sgorder.Rows[prow].Clear;
    j:=prow;
    i:=prow+1;
    while i<= sgorder.RowCount-1 do
    begin
      sgorder.Rows[j]:=sgorder.Rows[i];
      sgorder.Cells[0,j]:=inttostr(j);
      sgorder.Rows[i].Clear;
      inc(i);
      inc(j);
    end;
    if sgorder.RowCount>2 then
    begin
      sgorder.RowCount:=sgorder.RowCount-1;
    end;
  end;

end;

///////2004-4-23 add ydy
procedure InitialStrGrid(sgorder:TStringGrid;billtype:string);
/////子过程
     ///序号仅仅为了区分列名
     procedure AddCol(no:integer;name:string;width:integer;IsVisible:boolean);
      begin
       sgorder.Cells[sgorder.colcount-1,0]:=name;  ///'商品名称';
       if Isvisible then
        sgorder.ColWidths[sgorder.colcount-1] := width
       else
       sgorder.ColWidths[sgorder.colcount-1] := -1;   //不可见
       sgorder.colcount := sgorder.colcount + 1;
      end;

var
  fl:tinifile;
  count,i,j,size:integer;
  flag:boolean;
  fieldname,item:string;
begin
  fl:=Tinifile.Create(ExtractFilePath(application.ExeName)+'SetCols.ini');    //字段列名
  sgorder.Options:=sgorder.Options+[goColSizing];
  if billtype = '预定商品配送单' then
  begin
    item:='503';
    sgorder.colCount := 1;
    Addcol(0,'序号',28,true);
    Addcol(1,'商品类别',100,true);
    Addcol(2,'商品编码',140,true);
    Addcol(3,'商品名称',200,true);
    Addcol(4,'退货仓库',28,false);
    Addcol(5,'接收仓库',28,false);
    Addcol(6,'单位',60,true);
    Addcol(7,'数量',60,true);
    Addcol(8,'退货价',60,false);
    Addcol(9,'金额合计',70,false);
    Addcol(10,'批次',28,false);
    Addcol(11,'成本价',28,false);
    Addcol(12,'成本合计',28,false);
    Addcol(13,'税率',28,false);
    Addcol(14,'税价',28,false);
    Addcol(15,'税价合计',28,false);
    Addcol(16,'单位比率',28,false);
    Addcol(17,'预定商品说明',200,true);
    Addcol(18,'接收仓库编号',28,false);
    Addcol(19,'商品系统编号',28,false);
    Addcol(20,'当前单位',28,false);
    Addcol(21,'当前配送数量',28,false);
  end;
 if billtype = '配送退货单' then
  begin
    item:='202';
    sgorder.colCount := 1;
    Addcol(0,'序号',28,true);
    Addcol(1,'商品类别',100,true);
    Addcol(2,'商品编码',140,true);
    Addcol(3,'商品名称',200,true);
    Addcol(4,'退货仓库',28,false);
    Addcol(5,'接收仓库',28,false);
    Addcol(6,'单位',60,true);
    Addcol(7,'数量',60,true);
    Addcol(8,'退货价',60,false);
    Addcol(9,'金额合计',70,false);
    Addcol(10,'批次',28,false);
    Addcol(11,'成本价',28,false);
    Addcol(12,'成本合计',28,false);
    Addcol(13,'税率',28,false);
    Addcol(14,'税价',28,false);
    Addcol(15,'税价合计',28,false);
    Addcol(16,'单位比率',28,false);
    Addcol(17,'配送仓库编号',28,false);
    Addcol(18,'接收仓库编号',28,false);
    Addcol(19,'商品系统编号',28,false);
    Addcol(20,'当前单位',28,false);
    Addcol(21,'当前配送数量',28,false);
  end;

  if billtype = '门店配送需求单' then
  begin
    item:='202';
    sgorder.colCount := 1;
    Addcol(0,'序号',28,true);
    Addcol(1,'商品类别',100,true);
    Addcol(2,'商品编码',140,true);
    Addcol(3,'商品名称',200,true);
    Addcol(4,'单位',60,true);
    Addcol(5,'要货数量',70,true);
    Addcol(6,'已配数量',70,false);
    Addcol(7,'审核状态',70,true);
    Addcol(8,'当前行单位',28,false);
    Addcol(9,'商品系统编号',28,false);
    Addcol(10,'是否已审 ',28,false);
    Addcol(11,'单位比率',28,false);
    Addcol(12,'单据单位',28,false);
  end;

  if billtype = '配送收货单' then
  begin
    item:='202';
    sgorder.colCount := 1;
    Addcol(0,'序号',28,true);
    Addcol(1,'商品类别',100,true);
    Addcol(2,'商品编码',140,true);
    Addcol(3,'商品名称',200,true);
    Addcol(4,'配送仓库',28,false);
    Addcol(5,'接收仓库',28,false);
    Addcol(6,'单位',60,true);
    Addcol(7,'数量',60,true);
    Addcol(8,'配送价',60,false);
    Addcol(9,'金额合计',70,false);
    Addcol(10,'批次',28,false);
    Addcol(11,'成本价',28,false);
    Addcol(12,'成本合计',28,false);
    Addcol(13,'税率',28,false);
    Addcol(14,'税价',28,false);
    Addcol(15,'税价合计',28,false);
    Addcol(16,'单位比率',28,false);
    Addcol(17,'配送仓库编号',28,false);
    Addcol(18,'接收仓库编号',28,false);
    Addcol(19,'商品系统编号',28,false);
    Addcol(20,'当前单位',28,false);
    Addcol(21,'库存数量',28,false);
  end;

  if billtype = '门店配送退货申请单' then
  begin
    item:='201';
    sgorder.colCount := 1;
    Addcol(0,'序号',28,true);
    Addcol(1,'商品类别',100,true);
    Addcol(2,'商品编码',140,true);
    Addcol(3,'商品名称',200,true);
    Addcol(4,'单位',60,true);
    Addcol(5,'退货数量',70,true);
    Addcol(6,'审核数量',70,true);
    Addcol(7,'审核状态',70,true);
    Addcol(8,'当前行单位',28,false);
    Addcol(9,'商品系统编号',28,false);
    Addcol(10,'是否已审 ',28,false);
    Addcol(11,'单位比率',28,false);
    Addcol(12,'单据单位',28,false);

  end;
  if billtype='库存预警' then
  begin
    item:='200';
    sgorder.colCount :=2;
    addcol(1,'数量',70,true);
    addcol(2,'金额',70,true);
    sgorder.colCount:=sgorder.colCount-1;
  end;
  if billtype='非营业性出库' then
  begin
    item:='7';
    sgorder.colCount := 1;
  end;
   if billtype='赠送定义' then
  begin
    item:='303';
    sgorder.colCount := 1;
    addcol(0,'行号',30,true);
    addcol(1,'商品编号',150,true);
    addcol(2,'商品名称',200,true);
    addcol(3,'赠送比例',60,true);
    addcol(4,'类别名称',80,true);
    addcol(5,'生产厂家',80,true);
  end;
  if billtype='非营业性入库' then
  begin
    item:='8';
    sgorder.colCount := 1;

  end;
  if billtype='采购入库' then
  begin
    item:='5';
    sgorder.colCount := 1;

  end;
  if billtype='套餐定义1' then
  begin
    item:='100';
    sgorder.colCount := 1;
    addcol(0,'行号',30,true);
    addcol(1,'商品编号',150,true);
    addcol(2,'商品名称',200,true);
    addcol(3,'单价',60,false);
    addcol(4,'数量',60,true);
    addcol(5,'金额',60,true);
    addcol(6,'类型',80,true);
    addcol(7,'生产厂家',80,true);
    addcol(8,'备注说明',150,true);
  end;
  if billtype='套餐定义2' then
  begin
    item:='101';
     sgorder.colCount := 1;
    addcol(0,'行号',30,true);
    addcol(1,'商品编号',150,true);
    addcol(2,'商品名称',200,true);
    addcol(3,'单价',60,false);
    addcol(4,'数量',60,true);
    addcol(5,'金额',60,true);
    addcol(6,'类型',80,true);
    addcol(7,'生产厂家',80,true);
    addcol(8,'备注说明',150,true);
  end;
  if billtype='来货登记' then
  begin
    item:='2';
    sgorder.colCount := 1;
  end;
  if billtype='质量验收' then
  begin
    item:='3';
    sgorder.colCount := 1;
  end;
  if billtype='采购合同' then
  begin
    sgorder.colCount := 1;
    item:='1';
  end;
  if billtype='采购退货' then
  begin
    item:='4';
    sgorder.colCount := 1;
  end;
  if billtype='库存退货' then
  begin
    item:='14';
    sgorder.colCount := 1;
  end;
  if billtype='财务退货' then
  begin
    item:='15';
    sgorder.colCount := 1;
  end;
  if billtype='财务入库' then
  begin
    item:='6';
    sgorder.colCount := 1;
  end;
  if billtype='商品需求' then
  begin
    item:='0';
    sgorder.colCount := 1;
  END;
  if billtype='新店铺货' then
  begin
    item:='13';
    sgorder.colCount := 1;
  END;
  count:=fl.ReadInteger(item,'ColSum',0);
  for i:=1 to count do
  begin
    fieldname:=fl.ReadString(item,'ColName'+inttostr(i),'');
    j:=fl.ReadInteger(item,'ViewFlag'+inttostr(i),2);
    size:=fl.ReadInteger(item,'ColSize'+inttostr(i),0);
    if j=1 then
    begin
      flag:=true;
    end else
    begin
      flag:=false;
    end;
    addcol(i-1,fieldname,size,flag);
  end;
  fl.free;
  fl:=nil;
  sgorder.colCount:=sgorder.colCount-1;
end;
end.

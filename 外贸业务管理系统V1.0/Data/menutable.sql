/*系统菜单*/
if exists(select name from sysobjects where name='t_SysMenu')
   drop table t_SysMenu
create table t_SysMenu
(
 menucode char(8) primary key,
 menuname varchar(26),
 menuclass char(2),
 menuID bit default 0,
 menuOrder char(5) default '00000')

--如果是一级菜单把menuclass置为'2',主菜单置为'1',如果menuID置为'0',表示没有第二级的子查询(增加,修改,删除,查询,审核),
--如果是表示有第二级,而且都有的话那置menuID为'1',如只是增加,则置menuorder为'10000',都有的话置menuorder为'11111'
go
--系统管理
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('010000','系统管理','1','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('010100','用户名管理','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('010200','登录','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('010300','计算器','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('010500','权限管理','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('010600','数据备份','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('010700','数据恢复','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('010800','密码修改','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('010900','清空数据库','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('010400','退出','2','0','00000')

--销售管理
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('020000','销售管理','1','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('020100','客户信息录入','2','1','11110')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('021400','设计师管理','2','1','11110')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('020200','客户预约','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('020300','CAD 设计','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('020400','报价单','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('020500','合同管理','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('020600','下单生产单','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('020700','安装订记','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('020800','产品控制台帐查询','2','0','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('020900','客户补单','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('021000','销售收款情况','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('021100','设计安排','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('021200','销售收款汇总','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('021300','设计的确定','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('022000','销货收款单','2','1','11110')

--销售工资
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('030000','销售工档','1','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('030100','工程材料查询','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('030200','工程报价单','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('030300','人员分组','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('030400','自定义工程报价','2','0','00000')

insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('030600','职称段位标准','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('030700','员工段位提成','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('030800','激励奖设置','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('031000','提成参数设置','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('032000','销售工资统计','2','0','00000')

--采购管理
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('050000','采购管理','1','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('050200','采购订货单-原料','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('050100','采购计划单-原料','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('050300','预付申请单-原料','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('050400','采购入库情况-原料','2','1','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('051100','采购订货单-工程','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('051200','采购计划单-工程','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('051300','预付申请单-工程','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('051400','采购入库情况-工程','2','1','00000')

--原料管理
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('060000','原料管理','1','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('060100','原料入库','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('060200','退料->供应商','2','1','11110')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('060300','原料领料','2','1','10010')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('060400','退库->仓库','2','1','11110')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('060500','原料库存情况','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('060600','原料付款审批表-原料','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('060700','原料应付款-原料','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('060800','原料应付款情况-原料','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('060900','库存明细-原料','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('061000','库存统计-原料','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('061100','库存警报-原料','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('061200','进出报表-原料','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('061500','原料编码-原料','2','1','11110')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('069900','供应商档案-原料','2','1','11110')

--工程管理
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('100000','工程管理','1','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('100100','入库单','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('100200','退料单->供应商','2','1','11110')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('100300','领料单','2','1','10010')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('100400','退库单->仓库','2','1','11110')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('100500','原料库存情况','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('100600','原料付款审批表-工程','2','1','11111')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('100700','原料应付款-工程','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('100800','原料应付款情况-工程','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('100900','库存明细-工程','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('101000','库存清单-工程','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('101100','库存警报-工程','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('101200','进出报表-工程','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('101500','原料编码-工程','2','1','11110')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('101600','工程项目录入','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('109900','供应商档案-工程','2','1','11110')

--基本资料
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('970000','基本资料','1','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('970100','名称档案','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('970200','产品档案','2','1','11110')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('970300','员工档案','2','1','11110')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('970400','供应商原料档案','2','1','11110')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('970500','CAD 浏览','2','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('970600','工程项目档案','2','1','11110')

--帮助
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('990000','帮助','1','0','00000')
insert into t_sysmenu(menucode,menuname,menuclass,menuID,menuorder) values('990100','关于','2','0','00000')

go
/*系统权限管理*/
if exists(select name from sysobjects where name='t_Sysright')
   drop table t_Sysright
create table t_Sysright
(
 workcode varchar(24),
 menucode char(8),
 menuadd bit default 0,
 menudelete bit default 0,
 menumodify bit default 0,
 menuquery bit default 0,
 menush bit default 0 )
/*删除表的表记录*/
if exists(select name from sysobjects where name='t_cleartable')
   drop table t_cleartable
create table t_cleartable
(
 tablecode char(8),
 menucode char(6) primary key,
 tablename varchar(20),
 identify bit default 0 )
go
insert into t_cleartable(menucode,tablename,identify) values('010100','t_user',0)

insert into t_cleartable(menucode,tablename,identify) values('020100','t_client',1)--用IDENTIFY来标志是否有细表
insert into t_cleartable(menucode,tablename,identify) values('020200','t_Reserve',0)
insert into t_cleartable(menucode,tablename,identify) values('020300','t_design',0)
insert into t_cleartable(menucode,tablename,identify) values('020400','t_saidprice',1)
insert into t_cleartable(menucode,tablename,identify) values('020500','t_writing',1)
insert into t_cleartable(menucode,tablename,identify) values('020600','t_xdsh',1)
insert into t_cleartable(menucode,tablename,identify) values('020700','t_prasical',1)
--insert into t_cleartable(menucode,tablename,identify) values('020900','t_moneyed',1)
insert into t_cleartable(menucode,tablename,identify) values('020900','t_clientwlz',1)
insert into t_cleartable(menucode,tablename,identify) values('021200','t_xsysk',1)
insert into t_cleartable(menucode,tablename,identify) values('021100','t_arrange',0)
insert into t_cleartable(menucode,tablename,identify) values('021300','t_designsure',0)

insert into t_cleartable(menucode,tablename,identify) values('970100','t_code',0)
insert into t_cleartable(menucode,tablename,identify) values('970200','t_goods',0)
insert into t_cleartable(menucode,tablename,identify) values('970300','T_SupplierGoods',0)

insert into t_cleartable(menucode,tablename,identify) values('069900','T_Supplier',0)
insert into t_cleartable(menucode,tablename,identify) values('050200','T_Order',1)
insert into t_cleartable(menucode,tablename,identify) values('050100','T_PurchasePlan',1)
insert into t_cleartable(menucode,tablename,identify) values('050300','T_ImprestApply',1)

insert into t_cleartable(menucode,tablename,identify) values('060100','T_PIStore_G',1)
insert into t_cleartable(menucode,tablename,identify) values('060200','T_GRStore_G',1)
insert into t_cleartable(menucode,tablename,identify) values('060300','T_CGSingle_G',1)
insert into t_cleartable(menucode,tablename,identify) values('060400','T_RSSingle_G',1)
insert into t_cleartable(menucode,tablename,identify) values('060500','T_GoodsStore_G',0)
insert into t_cleartable(menucode,tablename,identify) values('060600','T_GoodsCode_G',0)
insert into t_cleartable(menucode,tablename,identify) values('069900','T_Supplier_G',0)

insert into t_cleartable(menucode,tablename,identify) values('100100','T_PIStore',1)
insert into t_cleartable(menucode,tablename,identify) values('100200','T_GRStore',1)
insert into t_cleartable(menucode,tablename,identify) values('100300','T_CGSingle',1)
insert into t_cleartable(menucode,tablename,identify) values('100400','T_RSSingle',1)
insert into t_cleartable(menucode,tablename,identify) values('100500','T_GoodsStore',0)
insert into t_cleartable(menucode,tablename,identify) values('101500','T_GoodsCode',0)
insert into t_cleartable(menucode,tablename,identify) values('109900','T_Supplier',0)
insert into t_cleartable(menucode,tablename,identify) values('101600','T_ProjectItem',1)

insert into t_cleartable(menucode,tablename,identify) values('999900','T_GoodsPrice',0)



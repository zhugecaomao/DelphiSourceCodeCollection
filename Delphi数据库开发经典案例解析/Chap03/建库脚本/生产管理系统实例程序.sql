if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrp物料需求计算_物料编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[mrp物料需求计算] DROP CONSTRAINT mrp物料需求计算_物料编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrp物料需求计算结果_物料编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[mrp物料需求计算结果] DROP CONSTRAINT mrp物料需求计算结果_物料编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrp物料需求历史_物料编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[mrp物料需求历史] DROP CONSTRAINT mrp物料需求历史_物料编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料清单_物料编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[物料清单] DROP CONSTRAINT 物料清单_物料编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主生产计划_物料编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[主生产计划] DROP CONSTRAINT 主生产计划_物料编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主生产计划历史_物料编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[主生产计划历史] DROP CONSTRAINT 主生产计划历史_物料编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主需求计划_物料编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[主需求计划] DROP CONSTRAINT 主需求计划_物料编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主需求计划历史_物料编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[主需求计划历史] DROP CONSTRAINT 主需求计划历史_物料编号_fk
GO
-------------------------------------------------------
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料主文件]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料主文件]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料清单]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[工厂日历]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[工厂日历]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主需求计划]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[主需求计划]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主需求计划历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[主需求计划历史]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主生产计划]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[主生产计划]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主生产计划历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[主生产计划历史]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrp物料需求计算]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[mrp物料需求计算]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrp物料需求计算结果]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[mrp物料需求计算结果]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrp物料需求历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[mrp物料需求历史]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料状态类别]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料状态类别]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料计划类别]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料计划类别]
GO

-------------------------------------------
CREATE TABLE [dbo].[物料主文件] (
	[物料编号] [char] (14) NOT NULL ,
	[条码] [char] (14) NULL ,
	[物料名称] [varchar] (50) NOT NULL ,
	[拼音编码] [char] (10) NULL ,
	[计量单位] [char] (10) NOT NULL ,
	[规格型号] [char] (20) NULL ,
	[计划类别] [char] (5) NULL ,
	[状态类别] [char] (5) NULL ,
	[归属类别] [char] (5) NULL ,
	[价值类别] [char] (1) NULL ,
	[物料特性a] [varchar] (40) NULL ,
	[物料特性b] [varchar] (40) NULL ,
	[物料特性c] [varchar] (40) NULL ,
	[物料特性d] [varchar] (40) NULL ,
	[长] [decimal](18, 3) NULL ,
	[宽] [decimal](18, 3) NULL ,
	[高] [decimal](18, 3) NULL ,
	[净重] [decimal](18, 3) NULL ,
	[品牌] [char] (10) NULL ,
	[颜色] [char] (10) NULL ,
	[等级] [char] (10) NULL ,
	[进货提前期] [int]  NULL ,
	[准备周期] [int]  NULL ,
	[生产周期] [int]  NULL ,
	[最小包装量] [decimal](18, 3) NULL ,
	[最低销售量] [decimal](18, 3) NULL ,
	[批量] [decimal](18, 4) NULL ,
	[最高库存] [decimal](18, 3) NULL ,
	[最低库存] [decimal](18, 3) NULL ,
	[库存期限] [int] NULL ,
	[录入者] [char] (8) NULL ,
	[录入日期] [int] NULL ,
	[低层码] [int] NULL ,
	[指定供货商] [char] (10) NULL ,
	[定货策略] [char] (10) NULL ,
	[生产车间] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[物料清单] (
	[父项编号] [char] (14) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[需要数量] [decimal](18, 4) NOT NULL ,
	[领料车间] [char] (10) NULL ,
	[领料库房] [char] (10) NULL ,
	[损耗率] [decimal](5, 4) NULL ,
	[bom状态] [char] (1) NULL ,
	[bom信息状态] [char] (1) NULL ,
	[审核者] [char] (8) NULL ,
	[审核日期] [int] NULL ,
	[其它事项] [text] NULL ,
	[低层码] [int] NULL ,
	[展开标记] [bit] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[工厂日历] (
	[年份] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[开始日期] [int] NOT NULL ,
	[结束日期] [int] NOT NULL ,
	[备注] [varchar] (255) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[主需求计划] (
	[编号] [char] (14) NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[年份] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[开始日期] [int] NULL ,
	[结束日期] [int] NULL ,
	[需求数量] [decimal] (15,2) NOT NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[状态] [char] (10) NULL default '有效',
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[主需求计划历史] (
	[编号] [char] (14) NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[年份] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[开始日期] [int] NULL ,
	[结束日期] [int] NULL ,
	[需求数量] [decimal] (15,2) NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[状态] [char] (10) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[主生产计划] (
	[物料编号] [char] (14) NOT NULL ,
	[编号] [char] (14) NULL ,
	[年份] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[开始日期] [int] NULL ,
	[结束日期] [int] NULL ,
	[期初库存] [decimal] (15,2) NULL ,
	[需求数量] [decimal] (15,2) NULL ,
	[MPS数量] [decimal] (15,2) NOT NULL ,
	[生产单数量] [decimal] (15,2) NULL ,
	[预计库存] [decimal] (15,2) NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[审核人] [varchar] (10) NULL ,
	[审核日期] [int] NULL ,
	[状态] [char] (10) NULL default '有效',
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

-- 对主生产计划进行编号
CREATE trigger INSERT_主生产计划
	on 	主生产计划
	for	INSERT
AS
	declare @bh1 varchar(16)
	declare @bh2 varchar(16)
	select @bh1 = isnull(max(编号),'MPS0000000000') from 主生产计划
	select @bh2 = isnull(max(编号),'MPS0000000000') from 主生产计划历史
	if(@bh2>@bh1) select @bh1 = @bh2
	declare @no varchar(10)
	select @no = substring(@bh1,4,10)
	select @no = convert(char(10),convert(int,@no)+1)
	select @no = REPLICATE('0',10-LEN(@no))+@no
	update 主生产计划 set 编号='MPS' + @no where 编号 is null
GO

CREATE TABLE [dbo].[主生产计划历史] (
	[物料编号] [char] (14) NOT NULL ,
	[编号] [char] (14) NULL ,
	[年份] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[开始日期] [int] NULL ,
	[结束日期] [int] NULL ,
	[期初库存] [decimal] (15,2) NULL ,
	[需求数量] [decimal] (15,2) NULL ,
	[MPS数量] [decimal] (15,2) NULL ,
	[生产单数量] [decimal] (15,2) NULL ,
	[预计库存] [decimal] (15,2) NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[审核人] [varchar] (10) NULL ,
	[审核日期] [int] NULL ,
	[状态] [char] (10) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[mrp物料需求计算] (
	[物料编号] [char] (14) NOT NULL ,
	[年份] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[期初库存] [decimal](18, 4) NULL ,
	[毛需求] [decimal](18, 4) NULL ,
	[预计入库] [decimal](18, 4) NULL ,
	[预计出库] [decimal](18, 4) NULL ,
	[预计库存] [decimal](18, 4) NULL ,
	[净需求] [decimal](18, 4) NULL ,
	[计划产出] [decimal](18, 4) NULL ,
	[计划投入] [decimal](18, 4) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[mrp物料需求历史] (
	[发布编号] [char] (20) NULL ,
	[发布时间] [datetime] NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[年份] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[期初库存] [decimal](18, 4) NULL ,
	[毛需求] [decimal](18, 4) NULL ,
	[预计入库] [decimal](18, 4) NULL ,
	[预计出库] [char] (10) NULL ,
	[预计库存] [decimal](18, 4) NULL ,
	[净需求] [decimal](18, 4) NULL ,
	[计划产出] [decimal](18, 4) NULL ,
	[计划投入] [decimal](18, 4) NULL 
) ON [PRIMARY]
GO

--- 这个视图是为了查询时显示物料名称可以用table控件,而不必使用query控件
if exists (select * from sysobjects where id = object_id(N'[dbo].[vmrp物料需求历史]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vmrp物料需求历史]
GO
create view vmrp物料需求历史
as
select a.*, b.物料名称 from mrp物料需求历史 as a,
	物料主文件 as b where a.物料编号=b.物料编号
go

CREATE TABLE [dbo].[物料状态类别] (
	[类别代码] [char] (5) NOT NULL Primary key,
	[状态描述] [char] (20) NOT NULL ,
	[说明] [varchar] (50) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[物料计划类别] (
	[类别代码] [char] (5) NOT NULL Primary key,
	[类别名称] [char] (20) NOT NULL 
) ON [PRIMARY]
GO
-----------------------------------------
ALTER TABLE [dbo].[物料主文件] WITH NOCHECK ADD 
	CONSTRAINT [DF__物料主文件__进货提前期__160F4887] DEFAULT (0) FOR [进货提前期],
	CONSTRAINT [DF__物料主文件__准备周期__17036CC0] DEFAULT (0) FOR [准备周期],
	CONSTRAINT [DF__物料主文件__生产周期__17F790F9] DEFAULT (0) FOR [生产周期],
	CONSTRAINT [PK__物料主文件__151B244E] PRIMARY KEY  CLUSTERED 
	(
		[物料编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[物料清单] WITH NOCHECK ADD 
	CONSTRAINT [DF_物料清单_展开标记] DEFAULT (0) FOR [展开标记],
	CONSTRAINT [PK_物料清单] PRIMARY KEY  CLUSTERED 
	(
		[父项编号],
		[物料编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[工厂日历] WITH NOCHECK ADD 
	CONSTRAINT [PK__工厂日历__1F98B2C1] PRIMARY KEY  CLUSTERED 
	(
		[年份],
		[计划期]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[主需求计划] WITH NOCHECK ADD 
	CONSTRAINT [PK_主需求计划] PRIMARY KEY  CLUSTERED 
	(
		[物料编号],
		[年份],
		[计划期]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[主需求计划历史] WITH NOCHECK ADD 
	CONSTRAINT [PK_主需求计划历史] PRIMARY KEY  CLUSTERED 
	(
		[物料编号],
		[年份],
		[计划期]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[主生产计划] WITH NOCHECK ADD 
	CONSTRAINT [PK_主生产计划] PRIMARY KEY  CLUSTERED 
	(
		[年份],
		[计划期],
		[物料编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[主生产计划历史] WITH NOCHECK ADD 
	CONSTRAINT [PK_主生产计划历史] PRIMARY KEY  CLUSTERED 
	(
		[年份],
		[计划期],
		[物料编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[mrp物料需求计算] WITH NOCHECK ADD 
	CONSTRAINT [PK_mrp物料需求计算] PRIMARY KEY  CLUSTERED 
	(
		[物料编号],
		[年份],
		[计划期]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[mrp物料需求历史] WITH NOCHECK ADD 
	CONSTRAINT [PK_mrp物料需求历史] PRIMARY KEY  CLUSTERED 
	(
		[物料编号],
		[年份],
		[计划期]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[mrp物料需求历史] ADD 
	CONSTRAINT [mrp物料需求历史_物料编号_fk] FOREIGN KEY 
	(
		[物料编号]
	) REFERENCES [dbo].[物料主文件] (
		[物料编号]
	)
GO

ALTER TABLE [dbo].[mrp物料需求计算] ADD 
	CONSTRAINT [mrp物料需求计算_物料编号_fk] FOREIGN KEY 
	(
		[物料编号]
	) REFERENCES [dbo].[物料主文件] (
		[物料编号]
	)
GO

ALTER TABLE [dbo].[mrp物料需求计算结果] ADD 
	CONSTRAINT [mrp物料需求计算结果_物料编号_fk] FOREIGN KEY 
	(
		[物料编号]
	) REFERENCES [dbo].[物料主文件] (
		[物料编号]
	)
GO

ALTER TABLE [dbo].[主生产计划] ADD 
	CONSTRAINT [主生产计划_物料编号_fk] FOREIGN KEY 
	(
		[物料编号]
	) REFERENCES [dbo].[物料主文件] (
		[物料编号]
	)
GO

ALTER TABLE [dbo].[主生产计划历史] ADD 
	CONSTRAINT [主生产计划历史_物料编号_fk] FOREIGN KEY 
	(
		[物料编号]
	) REFERENCES [dbo].[物料主文件] (
		[物料编号]
	)
GO

ALTER TABLE [dbo].[主需求计划] ADD 
	CONSTRAINT [主需求计划_物料编号_fk] FOREIGN KEY 
	(
		[物料编号]
	) REFERENCES [dbo].[物料主文件] (
		[物料编号]
	)
GO

ALTER TABLE [dbo].[主需求计划历史] ADD 
	CONSTRAINT [主需求计划历史_物料编号_fk] FOREIGN KEY 
	(
		[物料编号]
	) REFERENCES [dbo].[物料主文件] (
		[物料编号]
	)
GO

ALTER TABLE [dbo].[物料清单] ADD 
	CONSTRAINT [物料清单_物料编号_fk] FOREIGN KEY 
	(
		[物料编号]
	) REFERENCES [dbo].[物料主文件] (
		[物料编号]
	)
GO

---------------------下面是间接使用的数据表
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[库存库]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[库存库]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[采购订单]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[生产订单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[生产订单]
GO
CREATE TABLE [dbo].[库存库] (
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[部门] [varchar] (20) NOT NULL ,
	[组别] [varchar] (20) NOT NULL ,
	[货位] [varchar] (20) NULL ,
	[库存数量] [decimal] (15,2) NOT NULL ,
	[库存金额] [decimal] (15,2) NOT NULL ,
	[库存单价] [decimal] (15,2) NOT NULL ,
	[最新进价] [decimal] (15,2) NULL ,
	[扣率] [decimal] (15,2) NULL 
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[采购订单] (
	[编号] [char] (14) NOT NULL primary key,
	[合同编号] [char] (14) NULL ,
	[单据号] [char] (14) NULL ,
	[申请编号] [char] (14) NULL ,
	[供货商号] [char] (10) NULL ,
	[物料编号] [char] (14) NULL ,
	[订货数量] [decimal](24, 4) NULL ,
	[进价] [money] NULL ,
	[不含税价] [money] NULL ,
	[税率] [decimal](5, 4) NULL ,
	[税额] [money] NULL ,
	[税价合计] [money] NULL ,
	[交货方式] [varchar] (20) NULL ,
	[订货日期] [int] NULL ,
	[年份] [int] NULL ,
	[计划期] [int] NULL ,
	[订货地点] [varchar] (20) NULL ,
	[订货人] [char] (8) NULL ,
	[送货日期] [int] NULL ,
	[送货数量] [real] NULL ,
	[剩余数量] [decimal](18, 4) NULL ,
	[有效起日] [int] NULL ,
	[有效止日] [int] NULL ,
	[记帐日期] [int] NULL ,
	[记帐人] [char] (8) NULL ,
	[审单人] [char] (8) NULL ,
	[作废标记] [char] (1) NULL ,
	[打印标记] [char] (1) NULL ,
	[订单状态] [char] (6) NULL ,
	[订单说明] [varchar] (40) NULL 
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[生产订单] (
	[MPS编号] [char] (14) NULL ,
	[编号] [char] (14) Not NULL Primary key,
	[单据号] [char] (14) NULL ,
	[生产批号] [char] (20) NULL ,
	[物料编号] [char] (14) NULL ,
	[年份] [int] NULL ,
	[计划期] [int] NULL ,
	[数量] [decimal] (15,2) NULL ,
	[生产部门] [char] (10) NULL ,
	[下达日期] [int] NULL ,
	[要求完成日期] [int] NULL ,
	[完成数量] [decimal] (15,2) NULL ,
	[剩余数量] [decimal] (15,2) NULL ,
	[记帐人] [varchar] (10) NULL ,
	[记帐日期] [int] NULL ,
	[审核人] [varchar] (10) NULL ,
	[审核日期] [int] NULL ,
	[状态] [char] (10) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[库存库] WITH NOCHECK ADD 
	CONSTRAINT [DF__库存库__库存数量__6C43F744] DEFAULT (0) FOR [库存数量],
	CONSTRAINT [DF__库存库__库存金额__6D381B7D] DEFAULT (0) FOR [库存金额],
	CONSTRAINT [DF__库存库__库存单价__6E2C3FB6] DEFAULT (0) FOR [库存单价],
	CONSTRAINT [库存库_货号部门组别_FK] PRIMARY KEY  CLUSTERED 
	(
		[货号],
		[批号],
		[部门],
		[组别]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[生产订单] WITH NOCHECK ADD 
	CONSTRAINT [DF_生产订单_完成数量] DEFAULT (0) FOR [完成数量],
	CONSTRAINT [DF_生产订单_剩余数量] DEFAULT (0) FOR [剩余数量]
GO

ALTER TABLE [dbo].[生产订单] ADD 
	CONSTRAINT [生产订单_物料编号_fk] FOREIGN KEY 
	(
		[物料编号]
	) REFERENCES [dbo].[物料主文件] (
		[物料编号]
	)
GO

ALTER TABLE [dbo].[采购订单] ADD 
	CONSTRAINT [采购订单_物料编号_fk] FOREIGN KEY 
	(
		[物料编号]
	) REFERENCES [dbo].[物料主文件] (
		[物料编号]
	)
GO

-------------------------存储过程
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_mrp结果发布]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_mrp结果发布]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_mrp计算]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_mrp计算]
GO

--------mrp计算存储过程
CREATE PROCEDURE sf_mrp计算 ( @考虑库存等  bit=1, 
	@考虑提前期 bit=1, @考虑损耗 bit=1)
AS
begin tran
	--清除
	delete from mrp物料需求计算
	-- 更新物料清单底层码,计算时使用
	update 物料清单 set 低层码 = 0 where 父项编号 = 0
	-- 循环10次,根据情况,这里默认bom物料的层级不超过10级
	declare @i int
	select @i = 1
	while (@i<=10)
	begin 
		update 物料清单 set 低层码 = b.低层码+1 from 物料清单 as a,
			(select * from 物料清单) as b 
			where a.父项编号 = b.物料编号
		select @i = @i + 1
	end
	--重新生成物料需求计算表,并计算毛需求
	-- 低层码代表物料的层级,使用他来循环
	insert into mrp物料需求计算(物料编号,年份,计划期,毛需求)
		select 物料编号,年份,计划期,sum(MPS数量)
		FROM 主生产计划 group by 物料编号,年份,计划期
	select @i = 1
	while (@i<=10)
	begin 
		-- 没有的先查入记录,因为一个物料可以对应多个父项
		insert into mrp物料需求计算(物料编号,年份,计划期,毛需求)
			select distinct b.物料编号,年份,计划期,0
			FROM mrp物料需求计算 as a, 物料清单 as b
			where rtrim(b.物料编号)+convert(char(4),年份)+
			convert(char(2),计划期)	not in(select rtrim(物料编号)+
			convert(char(4),年份)+convert(char(2),计划期) 
			from mrp物料需求计算)
			and b.父项编号=a.物料编号 and b.低层码=@i
		-- 计算毛需求
		-- 注意考虑损耗的情况
		update mrp物料需求计算 set 毛需求 = c.毛需求 + d.需求
			from mrp物料需求计算 as c, 
				(select b.物料编号,年份,计划期,
				sum((a.毛需求*b.需要数量)/(1-(case when @考虑损耗=1 then 
				isnull(损耗率,0) else 0 end))) as 需求
				FROM mrp物料需求计算 as a, 物料清单 as b
				where b.父项编号=a.物料编号 and b.低层码=@i
				group by b.物料编号,a.年份,a.计划期
			) as d
			where c.物料编号=d.物料编号 and c.年份=d.年份 and c.计划期=d.计划期

		select @i = @i + 1
	end
	--------------- 不考虑提前期的毛需求计算完成
	-- 考虑提前期,计算提前期
	--if (@考虑提前期=1) 
	--begin
		-- 这里不在计算,具体计算方法为将当前计划期的数量移到提前期
		-- 注意跨年度计划期的
	--end

	if (@考虑库存等=1)      
	begin   
		-- 第一次计算,设置期初库存
		-- 这里统一设置起初库存为100
		-- 实际系统应该和库存库及上期情况结合
		update mrp物料需求计算 set 期初库存=100 

		update mrp物料需求计算 set 预计入库 = isnull(预计入库,0) + 
			数量 from mrp物料需求计算 as a, (select sum(剩余数量) as 数量, 
				物料编号,年份,计划期 from 采购订单 
				group by 物料编号,年份,计划期) as b, 物料主文件 as c
			where a.物料编号=b.物料编号 and a.年份=b.年份 
			and a.计划期=b.计划期 and a.物料编号 = c.物料编号 
			and c.计划类别='wg'    -- 外购产品
  
		update mrp物料需求计算 set 预计入库 = isnull(预计入库,0) + 
			数量 from mrp物料需求计算 as a, (select sum(剩余数量) as 数量, 
				物料编号,年份,计划期 from 生产订单 
				group by 物料编号,年份,计划期) as b, 物料主文件 as c
			where a.物料编号=b.物料编号 and a.年份=b.年份 
			and a.计划期=b.计划期 and a.物料编号 = c.物料编号 
			and c.计划类别='bcp'    -- 半成品
		
		-- 这里计算预计出库的情况   
		update mrp物料需求计算 set 预计出库 = isnull(预计出库,0)
   	end

	-- 按照计划期循环计算各个计划期的物料需求
	declare @年份 int, @计划期 int
	declare mycur cursor for select 年份,计划期 from mrp物料需求计算
		order by 年份,计划期
	open mycur
	fetch next from mycur into @年份, @计划期
	WHILE (@@FETCH_STATUS = 0 )
	BEGIN
		-- 如果不是最小的计划期, 计算期初库存
		-- 注意跨年度的计算,这里先不考虑
		update mrp物料需求计算 set 期初库存=b.预计库存 from 
			mrp物料需求计算  as a, (select * from mrp物料需求计算) 
				as b where a.年份=@年份 and a.计划期=@计划期
				and a.年份=b.年份 and a.计划期=b.计划期+1
		
		-- 计算净需求
		update mrp物料需求计算 set 预计库存 = isnull(期初库存,0) - 
			isnull(毛需求,0) + isnull(预计入库,0) - isnull(预计出库,0)
			where 年份=@年份 and 计划期=@计划期
		update mrp物料需求计算 set 净需求=0  where 年份=@年份 and 计划期=@计划期
		-- 预期(期末库存)小于0的存在净需求
		update mrp物料需求计算 set 净需求=-预计库存, 预计库存=0 
			where 年份=@年份 and 计划期=@计划期 and 预计库存<0
		fetch next from mycur into @年份, @计划期
	END
	close mycur
	deallocate mycur
commit
GO

CREATE PROCEDURE sf_mrp结果发布
AS
begin tran
	insert into mrp物料需求历史(发布时间, 物料编号, 年份, 计划期,
		期初库存, 毛需求, 预计入库, 预计出库, 预计库存, 净需求, 
		计划产出, 计划投入) select getdate(), 物料编号, 
		年份, 计划期, 期初库存, 毛需求, 预计入库, 预计出库, 预计库存, 
		净需求, 计划产出, 计划投入 from mrp物料需求计算
	delete from mrp物料需求计算
	insert into 主生产计划历史 select * from 主生产计划
	delete from 主生产计划
commit
GO




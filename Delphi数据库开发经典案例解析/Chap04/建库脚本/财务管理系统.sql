if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[分录表_凭证编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[分录表] DROP CONSTRAINT 分录表_凭证编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[分录表_科目代码_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[分录表] DROP CONSTRAINT 分录表_科目代码_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[本年分类帐簿_科目代码_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[本年分类帐簿] DROP CONSTRAINT 本年分类帐簿_科目代码_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[本年明细帐簿_科目代码_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[本年明细帐簿] DROP CONSTRAINT 本年明细帐簿_科目代码_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[本期分类帐簿_科目代码_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[本期分类帐簿] DROP CONSTRAINT 本期分类帐簿_科目代码_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[本期明细帐簿_科目代码_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[本期明细帐簿] DROP CONSTRAINT 本期明细帐簿_科目代码_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[分录表temp_科目代码_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[分录表temp] DROP CONSTRAINT 分录表temp_科目代码_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[分录表历史_科目代码_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[分录表历史] DROP CONSTRAINT 分录表历史_科目代码_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[科目余额表_科目代码_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[科目余额表] DROP CONSTRAINT 科目余额表_科目代码_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[历史分类帐簿_科目代码_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[历史分类帐簿] DROP CONSTRAINT 历史分类帐簿_科目代码_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[历史明细帐簿_科目代码_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[历史明细帐簿] DROP CONSTRAINT 历史明细帐簿_科目代码_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[项目科目对照表_科目代码_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[项目科目对照表] DROP CONSTRAINT 项目科目对照表_科目代码_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_pz凭证删除后]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_pz凭证删除后]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_pz凭证录入]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_pz凭证录入]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_pz凭证过帐]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_pz凭证过帐]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_pz调整凭证表]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_pz调整凭证表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[凭证表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[凭证表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[凭证表temp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[凭证表temp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[凭证表历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[凭证表历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[分录表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[分录表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[分录表temp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[分录表temp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[分录表历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[分录表历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[功能模块]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[功能模块]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[历史分类帐簿]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[历史分类帐簿]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[历史明细帐簿]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[历史明细帐簿]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[报表清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[报表清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[报表项目清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[报表项目清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[损益表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[损益表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[本年分类帐簿]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[本年分类帐簿]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[本年明细帐簿]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[本年明细帐簿]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[本期分类帐簿]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[本期分类帐簿]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[本期明细帐簿]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[本期明细帐簿]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[权限登记]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[权限登记]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[状态表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[状态表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[科目余额表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[科目余额表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[科目表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[科目表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[组别清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[组别清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职工清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[职工清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[部门清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[部门清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[项目科目对照表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[项目科目对照表]
GO

CREATE TABLE [dbo].[凭证表] (
	[内部编号] [int] NULL ,
	[凭证状态] [char] (10) NULL ,
	[会计期间] [int] NULL ,
	[凭证字号] [char] (4) NULL ,
	[凭证编号] [int] NOT NULL ,
	[顺序号] [int] NULL ,
	[日期] [char] (10) NULL ,
	[附单据] [int] NULL ,
	[审核] [char] (20) NULL ,
	[过帐] [char] (20) NULL ,
	[制单] [char] (20) NULL ,
	[借方合计] [money] NULL ,
	[贷方合计] [money] NULL ,
	[过帐状态] [char] (4) NULL ,
	[顺序号码] [int] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[凭证表temp] (
	[内部编号] [int] NULL ,
	[凭证状态] [char] (10) NULL ,
	[会计期间] [int] NULL ,
	[凭证字号] [char] (4) NULL ,
	[凭证编号] [int] NULL ,
	[顺序号] [int] NULL ,
	[日期] [char] (10) NULL ,
	[附单据] [int] NULL ,
	[审核] [char] (20) NULL ,
	[过帐] [char] (20) NULL ,
	[制单] [char] (20) NULL ,
	[借方合计] [money] NULL ,
	[贷方合计] [money] NULL ,
	[顺序号码] [int] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[凭证表历史] (
	[内部编号] [int] NULL ,
	[凭证状态] [char] (10) NULL ,
	[会计期间] [int] NULL ,
	[凭证字号] [char] (4) NULL ,
	[凭证编号] [int] NULL ,
	[顺序号] [int] NULL ,
	[日期] [char] (10) NULL ,
	[附单据] [int] NULL ,
	[审核] [char] (20) NULL ,
	[过帐] [char] (20) NULL ,
	[制单] [char] (20) NULL ,
	[借方合计] [money] NULL ,
	[贷方合计] [money] NULL ,
	[过帐状态] [char] (4) NULL ,
	[顺序号码] [int] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[分录表] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[分录编号] [int] NULL ,
	[会计期间] [int] NULL ,
	[凭证字号] [char] (4) NULL ,
	[凭证编号] [int] NOT NULL ,
	[摘要] [char] (40) NULL ,
	[科目代码] [char] (20) NULL ,
	[借方] [money] NULL ,
	[贷方] [money] NULL ,
	[数量] [int] NULL ,
	[单价] [money] NULL ,
	[结算方式] [char] (10) NULL ,
	[结算号] [int] NULL ,
	[结算日期] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[分录表temp] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[分录编号] [int] NULL ,
	[会计期间] [int] NULL ,
	[凭证字号] [char] (4) NULL ,
	[凭证编号] [int] NULL ,
	[摘要] [char] (40) NULL ,
	[科目代码] [char] (20) NULL ,
	[借方] [money] NULL ,
	[贷方] [money] NULL ,
	[数量] [int] NULL ,
	[单价] [money] NULL ,
	[结算方式] [char] (10) NULL ,
	[结算号] [int] NULL ,
	[结算日期] [char] (10) NULL ,
	[附单据] [int] NULL ,
	[顺序号码] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[分录表历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[分录编号] [int] NULL ,
	[会计期间] [int] NULL ,
	[凭证字号] [char] (4) NULL ,
	[凭证编号] [int] NULL ,
	[摘要] [char] (40) NULL ,
	[科目代码] [char] (20) NULL ,
	[借方] [money] NULL ,
	[贷方] [money] NULL ,
	[数量] [int] NULL ,
	[单价] [money] NULL ,
	[结算方式] [char] (10) NULL ,
	[结算号] [int] NULL ,
	[结算日期] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[功能模块] (
	[模块编号] [char] (50) NOT NULL ,
	[组别] [char] (20) NOT NULL ,
	[模块] [char] (20) NOT NULL ,
	[描述] [varchar] (100) NULL ,
	[模块类型] [int] NOT NULL ,
	[程序文件] [varchar] (100) NULL ,
	[菜单文件] [varchar] (100) NULL ,
	[打印文件] [varchar] (100) NULL ,
	[记帐参数] [varchar] (250) NULL ,
	[打印参数] [varchar] (250) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[历史分类帐簿] (
	[科目代码] [char] (20) NULL ,
	[期初余额] [char] (1) NULL ,
	[本期借方合计] [money] NULL ,
	[本期贷方合计] [money] NULL ,
	[本年借方累计] [money] NULL ,
	[本年贷方累计] [money] NULL ,
	[余额] [char] (1) NULL ,
	[摘要] [char] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[历史明细帐簿] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[分录编号] [int] NULL ,
	[会计期间] [int] NULL ,
	[凭证字号] [char] (4) NULL ,
	[凭证编号] [int] NULL ,
	[摘要] [char] (40) NULL ,
	[科目代码] [char] (20) NULL ,
	[借方] [money] NULL ,
	[贷方] [money] NULL ,
	[数量] [int] NULL ,
	[单价] [money] NULL ,
	[结算方式] [char] (10) NULL ,
	[结算号] [int] NULL ,
	[结算日期] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[报表清单] (
	[报表编号] [int] NULL ,
	[报表名称] [char] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[报表项目清单] (
	[报表编号] [int] NULL ,
	[报表名称] [char] (40) NULL ,
	[项目代码] [int] NULL ,
	[项目名称] [char] (40) NULL ,
	[行号] [int] NULL ,
	[计算方法] [char] (10) NULL ,
	[内部编号] [int] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[损益表] (
	[项目] [char] (40) NULL ,
	[行号] [int] NULL ,
	[本月数] [money] NULL ,
	[本年累计数] [money] NULL ,
	[年份] [datetime] NULL ,
	[会计期间] [int] NULL ,
	[最后结算日期] [datetime] NULL ,
	[内部编号] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[本年分类帐簿] (
	[科目代码] [char] (20) NULL ,
	[期初余额] [char] (1) NULL ,
	[本期借方合计] [money] NULL ,
	[本期贷方合计] [money] NULL ,
	[本年借方累计] [money] NULL ,
	[本年贷方累计] [money] NULL ,
	[余额] [char] (1) NULL ,
	[摘要] [char] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[本年明细帐簿] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[分录编号] [int] NULL ,
	[会计期间] [int] NULL ,
	[凭证字号] [char] (4) NULL ,
	[凭证编号] [int] NULL ,
	[摘要] [char] (40) NULL ,
	[科目代码] [char] (20) NULL ,
	[借方] [money] NULL ,
	[贷方] [money] NULL ,
	[数量] [int] NULL ,
	[单价] [money] NULL ,
	[结算方式] [char] (10) NULL ,
	[结算号] [int] NULL ,
	[结算日期] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[本期分类帐簿] (
	[科目代码] [char] (20) NULL ,
	[期初余额] [char] (1) NULL ,
	[本期借方合计] [money] NULL ,
	[本期贷方合计] [money] NULL ,
	[本年借方累计] [money] NULL ,
	[本年贷方累计] [money] NULL ,
	[余额] [char] (1) NULL ,
	[摘要] [char] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[本期明细帐簿] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[分录编号] [int] NULL ,
	[会计期间] [int] NULL ,
	[凭证字号] [char] (4) NULL ,
	[凭证编号] [int] NULL ,
	[摘要] [char] (40) NULL ,
	[科目代码] [char] (20) NULL ,
	[借方] [money] NULL ,
	[贷方] [money] NULL ,
	[余额方向] [char] (4) NULL ,
	[余额] [money] NULL ,
	[数量] [int] NULL ,
	[单价] [money] NULL ,
	[结算方式] [char] (10) NULL ,
	[结算号] [int] NULL ,
	[结算日期] [char] (10) NULL ,
	[余额标记] [char] (4) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[权限登记] (
	[权限序号] [int] NOT NULL ,
	[编号] [char] (6) NOT NULL ,
	[编号类型] [int] NOT NULL ,
	[模块编号] [char] (10) NOT NULL ,
	[选中标记] [char] (1) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[状态表] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[会计期间] [int] NULL ,
	[凭证字号] [char] (4) NULL ,
	[编号] [int] NULL ,
	[顺序号] [int] NULL ,
	[分录编号] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[科目余额表] (
	[科目代码] [char] (20) NULL ,
	[期初借方余额] [money] NULL ,
	[期初贷方余额] [money] NULL ,
	[本期借方发生额] [money] NULL ,
	[本期贷方发生额] [money] NULL ,
	[本年借方累计发生额] [money] NULL ,
	[本年贷方累计发生额] [money] NULL ,
	[本期借方余额] [money] NULL ,
	[本期贷方余额] [money] NULL ,
	[最后结算分录] [int] NULL ,
	[会计期间] [int] NULL ,
	[余额方向] [char] (4) NULL ,
	[内部编号] [int] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[科目表] (
	[科目代码] [char] (20) NOT NULL ,
	[科目名称] [char] (20) NULL ,
	[助记码] [char] (20) NULL ,
	[科目类别] [char] (20) NULL ,
	[是否存货科目] [char] (10) NULL ,
	[余额方向] [char] (4) NULL ,
	[数量单位] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[组别清单] (
	[组别编号] [char] (6) NOT NULL ,
	[部门编号] [char] (6) NOT NULL ,
	[组别名称] [varchar] (50) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[职工清单] (
	[职工编号] [char] (6) NOT NULL ,
	[组别编号] [char] (6) NOT NULL ,
	[姓名] [char] (10) NOT NULL ,
	[性别] [char] (2) NOT NULL ,
	[职务] [char] (10) NULL ,
	[密码] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[部门清单] (
	[部门编号] [char] (6) NOT NULL ,
	[部门名称] [char] (30) NOT NULL ,
	[部门类型] [int] NOT NULL ,
	[远程用户号] [int] NULL ,
	[用户名] [char] (15) NULL ,
	[密码] [char] (10) NULL ,
	[域名] [char] (15) NULL ,
	[拨号名称] [char] (15) NULL ,
	[数据库别名] [char] (15) NULL ,
	[联网文件] [char] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[项目科目对照表] (
	[项目名称] [char] (40) NULL ,
	[项目代码] [int] NULL ,
	[科目代码] [char] (20) NULL ,
	[科目级别] [int] NULL ,
	[内部编号] [int] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[凭证表] ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[凭证编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[分录表] ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[内部编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[科目表] ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[科目代码]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[分录表] ADD 
	CONSTRAINT [分录表_凭证编号_fk] FOREIGN KEY 
	(
		[凭证编号]
	) REFERENCES [dbo].[凭证表] (
		[凭证编号]
	)
GO

ALTER TABLE [dbo].[分录表] ADD 
	CONSTRAINT [分录表_科目代码_fk] FOREIGN KEY 
	(
		[科目代码]
	) REFERENCES [dbo].[科目表] (
		[科目代码]
	)
GO

ALTER TABLE [dbo].[分录表temp] ADD 
	CONSTRAINT [分录表temp_科目代码_fk] FOREIGN KEY 
	(
		[科目代码]
	) REFERENCES [dbo].[科目表] (
		[科目代码]
	)
GO

ALTER TABLE [dbo].[分录表历史] ADD 
	CONSTRAINT [分录表历史_科目代码_fk] FOREIGN KEY 
	(
		[科目代码]
	) REFERENCES [dbo].[科目表] (
		[科目代码]
	)
GO

ALTER TABLE [dbo].[历史分类帐簿] ADD 
	CONSTRAINT [历史分类帐簿_科目代码_fk] FOREIGN KEY 
	(
		[科目代码]
	) REFERENCES [dbo].[科目表] (
		[科目代码]
	)
GO

ALTER TABLE [dbo].[历史明细帐簿] ADD 
	CONSTRAINT [历史明细帐簿_科目代码_fk] FOREIGN KEY 
	(
		[科目代码]
	) REFERENCES [dbo].[科目表] (
		[科目代码]
	)
GO

ALTER TABLE [dbo].[本年分类帐簿] ADD 
	CONSTRAINT [本年分类帐簿_科目代码_fk] FOREIGN KEY 
	(
		[科目代码]
	) REFERENCES [dbo].[科目表] (
		[科目代码]
	)
GO

ALTER TABLE [dbo].[本年明细帐簿] ADD 
	CONSTRAINT [本年明细帐簿_科目代码_fk] FOREIGN KEY 
	(
		[科目代码]
	) REFERENCES [dbo].[科目表] (
		[科目代码]
	)
GO

ALTER TABLE [dbo].[本期分类帐簿] ADD 
	CONSTRAINT [本期分类帐簿_科目代码_fk] FOREIGN KEY 
	(
		[科目代码]
	) REFERENCES [dbo].[科目表] (
		[科目代码]
	)
GO

ALTER TABLE [dbo].[本期明细帐簿] ADD 
	CONSTRAINT [本期明细帐簿_科目代码_fk] FOREIGN KEY 
	(
		[科目代码]
	) REFERENCES [dbo].[科目表] (
		[科目代码]
	)
GO

ALTER TABLE [dbo].[科目余额表] ADD 
	CONSTRAINT [科目余额表_科目代码_fk] FOREIGN KEY 
	(
		[科目代码]
	) REFERENCES [dbo].[科目表] (
		[科目代码]
	)
GO

ALTER TABLE [dbo].[项目科目对照表] ADD 
	CONSTRAINT [项目科目对照表_科目代码_fk] FOREIGN KEY 
	(
		[科目代码]
	) REFERENCES [dbo].[科目表] (
		[科目代码]
	)
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create proc sf_pz凭证删除后
as
begin tran
delete from 凭证表temp
delete from 分录表temp

commit


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE proc sf_pz凭证录入 @操作员 char(20)
as
begin transaction
	--declare @操作员 char(20) 
	--select @操作员='wy'
	declare @maxid int
	select @maxid=max(分录编号) from 状态表 with (tablockx)
	select @maxid = case when @maxid is null then 0 else @maxid end


	declare mycursor cursor for select 分录编号 from 分录表temp
	open mycursor
	declare @a int
	declare @i int
	select @i=@maxid

	fetch next from mycursor into @a
while (@@fetch_status=0)
begin	
update 分录表temp
	set 分录编号=@i+1
	where current of mycursor
	select @i=@i+1
	fetch next from mycursor into @a
end 

close mycursor
deallocate mycursor

update 状态表
	set 分录编号=@i					--当前最大值



insert into 分录表(分录编号,会计期间,凭证字号,凭证编号,摘要,科目代码,借方,贷方,数量,单价,结算方式,结算号,结算日期)
	select a.分录编号,a.会计期间,a.凭证字号,a.凭证编号,a.摘要,a.科目代码,a.借方,a.贷方,a.数量,a.单价,a.结算方式,a.结算号,a.结算日期 
	from 分录表temp as a,凭证表temp as b 
	where a.凭证字号=b.凭证字号 and a.凭证编号=b.凭证编号 and a.会计期间=b.会计期间 and b.制单=@操作员


	
update 凭证表temp
	set 借方合计=e.m,贷方合计=e.n from
	凭证表temp as b,(select sum(借方) as m,sum(贷方) as n,凭证字号,凭证编号,会计期间 from 分录表temp group by 凭证字号,凭证编号,会计期间) as e
	where e.凭证字号=b.凭证字号 and e.凭证编号=b.凭证编号 and e.会计期间=b.会计期间



insert into 凭证表(内部编号,会计期间,凭证字号,凭证编号,顺序号,日期,附单据,审核,过帐,制单,借方合计,贷方合计)
	select 内部编号,会计期间,凭证字号,凭证编号,顺序号,日期,附单据,审核,过帐,制单,借方合计,贷方合计 from 凭证表temp where 制单=@操作员

update 凭证表
	set 凭证状态='待审',过帐状态='否'

declare @maxnum int
select @maxnum=max(顺序号码) from 凭证表temp
if @maxnum is not null
begin
update 状态表
	set 顺序号=a.顺序号+1 from			--当前最大值+1,当前可用
	状态表 as b,(select 顺序号 from 凭证表temp where 顺序号码=@maxnum) as a
	
	
update 状态表
	set 编号=a.凭证编号+1 from			--当前最大值+1,当前可用
	状态表 as b,(select 凭证编号,凭证字号 from 凭证表temp where 顺序号码=@maxnum) as a
	where a.凭证字号=b.凭证字号

end



delete from 分录表temp
	where 分录表temp.凭证字号+cast(分录表temp.凭证编号 as char)+cast(分录表temp.会计期间 as char) in (select 凭证字号+cast(凭证编号 as char)+cast(会计期间 as char) from 凭证表temp)


delete from 凭证表temp
	where 制单=@操作员




commit


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE proc sf_pz凭证过帐 @操作员 char(20)
as
begin transaction
insert into 本期明细帐簿(分录编号, 会计期间, 凭证字号, 凭证编号, 摘要, 科目代码, 借方, 贷方, 数量, 单价, 结算方式, 结算号, 结算日期)
	select 分录编号, a.会计期间, a.凭证字号, a.凭证编号, 摘要, 科目代码, 借方, 贷方, 数量, 单价, 结算方式, 结算号, 结算日期 from 分录表 as a,凭证表 as b 
		where a.会计期间=b.会计期间 and a.凭证字号= b.凭证字号 and a.凭证编号=b.凭证编号 and b.凭证状态='通过' and b.过帐状态='否'

update 凭证表
	set 过帐状态='是',过帐=@操作员
	where 凭证状态='通过' and 过帐状态='否'

update 凭证表
	set 过帐=@操作员
	where 凭证状态='不通过'

insert into 分录表历史(分录编号, 会计期间, 凭证字号, 凭证编号, 摘要, 科目代码, 借方, 贷方, 数量, 单价, 结算方式, 结算号, 结算日期)
	select 分录编号, a.会计期间, a.凭证字号, a.凭证编号, 摘要, 科目代码, 借方, 贷方, 数量, 单价, 结算方式, 结算号, 结算日期 from 分录表 as a,凭证表 as b 
		where a.会计期间=b.会计期间 and a.凭证字号= b.凭证字号 and a.凭证编号=b.凭证编号 and (b.过帐状态='是' or b.凭证状态='不通过')

insert into 凭证表历史(内部编号, 凭证状态, 会计期间, 凭证字号, 凭证编号, 顺序号, 日期, 附单据, 审核, 过帐, 制单, 借方合计, 贷方合计, 过帐状态)
	select 内部编号, 凭证状态, 会计期间, 凭证字号, 凭证编号, 顺序号, 日期, 附单据, 审核, 过帐, 制单, 借方合计, 贷方合计, 过帐状态 from 凭证表
	where 过帐状态='是' or 凭证状态='不通过'

delete from 分录表
	from (分录表 as a join 凭证表 as b on a.会计期间=b.会计期间 and a.凭证字号 =b.凭证字号 and a.凭证编号=b.凭证编号)
	where  b.过帐状态='是' or b.凭证状态='不通过'

delete from 凭证表
	where 过帐状态='是' or 凭证状态='不通过'


--计算余额
--update null to 0
update 本期明细帐簿
	set 借方=(case when 借方 is null then 0 else 借方 end), 贷方=(case when 贷方 is null then 0 else 贷方 end)
	where 余额标记 is null or 余额标记 <>'是'
--update 余额方向
update 本期明细帐簿
	set 余额方向=a.余额方向
	from (select 科目代码,余额方向 from 科目余额表) as a
	where 本期明细帐簿.科目代码=a.科目代码 and (余额标记 is null or 余额标记 <>'是')
--update 科目余额表;本期明细帐簿--余额
declare mycursor cursor for select 分录编号,会计期间,科目代码,借方,贷方,余额方向,余额,余额标记 from 本期明细帐簿 where 余额标记 is null or 余额标记<>'是'
open mycursor
declare @bh int,@qj int,@dm char(20),@jf money,@df money,@fx char(2),@ye money,@bj char(4)
fetch next from mycursor into @bh,@qj,@dm,@jf,@df,@fx,@ye,@bj
	
--select @bh,@qj,@dm,@jf,@df,@fx,@ye,@bj

while (@@fetch_status=0)
begin
	update 科目余额表
		set 本期借方发生额=(case when 本期借方发生额 is null then @jf else 本期借方发生额+@jf end),
		    本期贷方发生额=(case when 本期贷方发生额 is null then @df else 本期贷方发生额+@df end),
		    本年借方累计发生额=(case when 本年借方累计发生额 is null then @jf else 本年借方累计发生额+@jf end),
		    本年贷方累计发生额=(case when 本年贷方累计发生额 is null then @df else 本年贷方累计发生额+@df end),
		    本期借方余额=(case when @fx='借' then (case when 本期借方余额 is null then @jf-@df else 本期借方余额+@jf-@df end) else 0 end),
		    本期贷方余额=(case when @fx='贷' then (case when 本期贷方余额 is null then @df-@jf else 本期贷方余额+@df-@jf end) else 0 end),
		    最后结算分录=@bh,
		    会计期间=@qj
		where 科目代码=@dm and 会计期间=@qj

select 科目代码,@fx,会计期间,本期借方余额,本期贷方余额 from 科目余额表  where 科目代码=@dm and 会计期间=@qj

	update 本期明细帐簿
		set 余额=case when @fx='借' 
                             then  (select 本期借方余额 from 科目余额表 where 科目代码=@dm and 会计期间=@qj)
                              else (select 本期贷方余额 from 科目余额表 where 科目代码=@dm and 会计期间=@qj)
                        end,     --a.本期借方余额
		余额标记='是'
--	from    本期明细帐簿 as b
	where current of mycursor
 
--(select 科目代码,会计期间,本期借方余额,本期贷方余额 from 科目余额表 where 科目代码=@dm and 会计期间=@qj) as a
select * from 本期明细帐簿
--select * from 科目余额表 where 本期借方发生额 is not null


	fetch next from mycursor into @bh,@qj,@dm,@jf,@df,@fx,@ye,@bj

end
close mycursor
deallocate mycursor

	






commit




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



CREATE proc sf_pz调整凭证表
as
begin transaction

declare @maxnum int
	select @maxnum=max(顺序号码) from 凭证表temp 
	delete 凭证表temp
	where 顺序号码>(select min(顺序号码) from 凭证表temp as a,(select 凭证字号,凭证编号,会计期间 from 凭证表temp where 顺序号码=@Maxnum) as b where a.凭证编号=b.凭证编号 and a.凭证字号=b.凭证字号 and a.会计期间=b.会计期间)


update 分录表temp
	set 顺序号码=a.顺序号码	from
	(select '顺序号码'=min(顺序号码) from 凭证表temp) as a

commit

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


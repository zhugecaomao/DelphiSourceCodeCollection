if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单_供货商_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[采购订单] DROP CONSTRAINT 采购订单_供货商_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单历史_供货商_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[采购订单历史] DROP CONSTRAINT 采购订单历史_供货商_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购合同_供货商_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[采购合同] DROP CONSTRAINT 采购合同_供货商_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[进货单_供货商_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[进货单] DROP CONSTRAINT 进货单_供货商_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[进货单历史_供货商_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[进货单历史] DROP CONSTRAINT 进货单历史_供货商_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[应付款_供货商_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[应付款] DROP CONSTRAINT 应付款_供货商_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[预付款_供货商_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[预付款] DROP CONSTRAINT 预付款_供货商_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[预收款_供货商_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[预收款] DROP CONSTRAINT 预收款_供货商_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[报损报溢_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[报损报溢] DROP CONSTRAINT 报损报溢_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[报损报溢历史_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[报损报溢历史] DROP CONSTRAINT 报损报溢历史_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单明细_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[采购订单明细] DROP CONSTRAINT 采购订单明细_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单明细历史_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[采购订单明细历史] DROP CONSTRAINT 采购订单明细历史_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购合同_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[采购合同] DROP CONSTRAINT 采购合同_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[调拨单_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[调拨单] DROP CONSTRAINT 调拨单_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[调拨单历史_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[调拨单历史] DROP CONSTRAINT 调拨单历史_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[调货申请_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[调货申请] DROP CONSTRAINT 调货申请_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[进货单明细_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[进货单明细] DROP CONSTRAINT 进货单明细_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[进货单明细历史_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[进货单明细历史] DROP CONSTRAINT 进货单明细历史_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[进销存汇总表_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[进销存汇总表] DROP CONSTRAINT 进销存汇总表_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[库存库_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[库存库] DROP CONSTRAINT 库存库_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[盘点单_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[盘点单] DROP CONSTRAINT 盘点单_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[盘点单历史_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[盘点单历史] DROP CONSTRAINT 盘点单历史_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[上下限对照表_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[上下限对照表] DROP CONSTRAINT 上下限对照表_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售单明细_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销售单明细] DROP CONSTRAINT 销售单明细_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售单明细历史_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销售单明细历史] DROP CONSTRAINT 销售单明细历史_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售订单明细_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销售订单明细] DROP CONSTRAINT 销售订单明细_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售订单明细历史_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销售订单明细历史] DROP CONSTRAINT 销售订单明细历史_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售合同_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销售合同] DROP CONSTRAINT 销售合同_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售日报_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销售日报] DROP CONSTRAINT 销售日报_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销退货单_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销退货单] DROP CONSTRAINT 销退货单_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销退货单历史_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销退货单历史] DROP CONSTRAINT 销退货单历史_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[应付款_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[应付款] DROP CONSTRAINT 应付款_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[应收款_货号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[应收款] DROP CONSTRAINT 应收款_货号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售单_客户编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销售单] DROP CONSTRAINT 销售单_客户编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售单历史_客户编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销售单历史] DROP CONSTRAINT 销售单历史_客户编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售订单_客户编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销售订单] DROP CONSTRAINT 销售订单_客户编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售订单历史_客户编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销售订单历史] DROP CONSTRAINT 销售订单历史_客户编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售合同_客户编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销售合同] DROP CONSTRAINT 销售合同_客户编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[应收款_客户编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[应收款] DROP CONSTRAINT 应收款_客户编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_进货单明细_进货单]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[进货单明细] DROP CONSTRAINT FK_进货单明细_进货单
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_采购订单明细_采购订单]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[采购订单明细] DROP CONSTRAINT FK_采购订单明细_采购订单
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_销售单明细_销售单]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销售单明细] DROP CONSTRAINT FK_销售单明细_销售单
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_销售订单明细_销售订单]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[销售订单明细] DROP CONSTRAINT FK_销售订单明细_销售订单
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[上下限对照表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[上下限对照表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[业务员清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[业务员清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[仓库清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[仓库清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[供货商清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[供货商清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[商品清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[商品清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[客户清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[客户清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[库存库]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[库存库]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[应付款]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[应付款]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[应收款]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[应收款]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[报损报溢]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[报损报溢]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[报损报溢历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[报损报溢历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[权限清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[权限清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[每月结帐日期表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[每月结帐日期表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[用户清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[用户清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[盘点单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[盘点单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[盘点单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[盘点单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[结帐历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[结帐历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[调拨单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[调拨单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[调拨单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[调拨单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[调货申请]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[调货申请]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[进价调整单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[进价调整单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[进货单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[进货单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[进货单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[进货单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[进货单明细]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[进货单明细]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[进货单明细历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[进货单明细历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[进销存汇总表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[进销存汇总表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购合同]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[采购合同]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[采购订单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[采购订单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单明细]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[采购订单明细]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单明细历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[采购订单明细历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售单明细]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售单明细]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售单明细历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售单明细历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售合同]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售合同]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售日报]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售日报]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售订单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售订单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售订单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售订单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售订单明细]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售订单明细]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售订单明细历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售订单明细历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销退货单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销退货单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销退货单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销退货单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[预付款]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[预付款]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[预收款]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[预收款]
GO



------------建表
CREATE TABLE [dbo].[商品清单] (
	[货号] [char] (14) NOT NULL Primary Key,
	[条码] [char] (14) NULL ,
	[拼音编码] [char] (40) NULL ,
	[品名] [varchar] (80) NULL ,
	[规格] [varchar] (40) NULL ,
	[单位] [char] (6) NOT NULL ,
	[产地] [varchar] (50) NULL ,
	[类别] [char] (20) NULL ,
	[进货价] [decimal] (28,6) NULL default(0),
	[销售价1] [decimal] (28,6) NULL default(0),
	[销售价2] [decimal] (28,6) NULL default(0),
	[最低售价] [decimal] (28,6) NULL default(0)
)
GO

CREATE TABLE [dbo].[供货商清单] (
	[供货商号] [char] (10) NOT NULL Primary Key,
	[拼音编码] [char] (40) NOT NULL ,
	[简称] [varchar] (80) NULL ,
	[名称] [varchar] (80) NULL ,
	[地址] [varchar] (80) NULL ,
	[邮编] [char] (6) NULL ,
	[区号] [char] (6) NULL ,
	[地区] [varchar] (12) NULL ,
	[类型] [char] (10) NULL ,
	[电话] [varchar] (20) NULL ,
	[传真] [varchar] (20) NULL ,
	[电报] [varchar] (20) NULL ,
	[开户行] [varchar] (40) NULL ,
	[开户行邮编] [char] (6) NULL ,
	[银行帐号] [varchar] (20) NULL ,
	[税号] [varchar] (20) NULL ,
	[库房地址] [varchar] (40) NULL ,
	[库房电话] [varchar] (20) NULL ,
	[业务员] [char] (10) NULL ,
	[业务部门] [varchar] (20) NULL ,
)
GO

CREATE TABLE [dbo].[客户清单] (
	[客户编号] [char] (10) NOT NULL Primary Key,
	[拼音编码] [char] (20) NOT NULL ,
	[简称] [varchar] (80) NULL ,
	[名称] [varchar] (80) NULL ,
	[联系人] [varchar] (30) NULL ,
	[地址] [varchar] (80) NULL ,
	[邮编] [char] (6) NULL ,
	[区号] [char] (6) NULL ,
	[地区] [varchar] (12) NULL ,
	[电话] [varchar] (20) NULL ,
	[传真] [varchar] (20) NULL ,
	[电报] [varchar] (20) NULL ,
	[开户行] [varchar] (40) NULL ,
	[开户行邮编] [char] (6) NULL ,
	[银行帐号] [varchar] (20) NULL ,
	[税号] [varchar] (20) NULL ,
	[性质] [varchar] (10) NULL ,
	[业务员] [char] (10) NULL ,
	[业务部门] [varchar] (20) NULL ,
	[授信额度] [decimal] (28,6)  NULL 
)
GO


CREATE TABLE [dbo].[业务员清单] (
	[业务员号] [char] (14) NOT NULL Primary Key,
	[姓名] [char] (10) NULL ,
	[性别] [char] (2) NULL ,
	[电话] [varchar] (20) NULL ,
	[手机] [char] (14) NULL ,
	[地址] [varchar] (80) NULL ,
	[邮编] [char] (6) NULL ,
	[身份证号] [char] (16) NULL ,
	[类别] [char] (16) NULL
)
GO

CREATE TABLE [dbo].[仓库清单] (
	[仓库号] [char] (14) NOT NULL Primary Key,
	[仓库名] [varchar] (30) NULL ,
	[类别] [char] (16) NULL ,
	[备注] [varchar] (40) NULL 
)
GO

CREATE TABLE [dbo].[用户清单] (
	[用户编号] [char] (6) NOT NULL Primary key,
	[部门] [char] (20) NOT NULL ,
	[姓名] [char] (10) NOT NULL ,
	[性别] [char] (2) NOT NULL ,
	[密码] [char] (10) NULL
) 

CREATE TABLE [dbo].[权限清单] (
	[权限序号] [int] IDENTITY (1, 1) NOT NULL ,
	[用户编号] [char] (6) NULL ,
	[部门] [char] (20) NULL ,
	[权限名称] [char] (30) NOT NULL 
)
GO

CREATE TABLE [dbo].[采购合同] (
	[供货商号] [char] (10) NOT NULL ,
	[货号] [char] (14) NOT NULL ,
	[进价] [decimal] (28,6) null default 0 ,
	[付款方式] [varchar] (20) NULL ,
	[帐期] [int] NULL ,
	[签定日期] [int] NULL ,
	[合同期限] [int] NULL
)
GO

CREATE TABLE [dbo].[销售合同] (
	[客户编号] [char] (10) NOT NULL ,
	[货号] [char] (14) NOT NULL ,
	[售价] [decimal] (28,6) null default 0 ,
	[付款方式] [varchar] (20) NULL ,
	[帐期] [int] NULL ,
	[签定日期] [int] NULL ,
	[合同期限] [int] NULL
)
GO

CREATE TABLE [dbo].[采购订单] (
	[编号] [char] (14) Not NULL Primary key,
	[供货商号] [char] (10) NOT NULL ,
	[订货日期] [datetime] NULL,
	[有效起日] [datetime] NULL ,
	[有效止日] [datetime] NULL ,
	[业务员]   [char] (10) NULL ,
	[制单人]   [char] (10) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL 
)
GO

CREATE TABLE [dbo].[采购订单明细] (
	[编号] [char] (14) Not NULL Primary key,
	[订单号] [char] (14) Not NULL,
	[货号] [char] (14) NOT NULL ,
	[订货数量] [decimal] (28,6) NOT NULL ,
	[进价] [decimal] (28,6) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[扣率] [decimal] (28,6) NULL ,
	[税率] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL 
)
GO

CREATE TABLE [dbo].[采购订单历史] (
	[编号] [char] (14) Not NULL Primary key,
	[供货商号] [char] (10) NOT NULL ,
	[订货日期] [datetime] NULL,
	[有效起日] [datetime] NULL ,
	[有效止日] [datetime] NULL ,
	[业务员]   [char] (10) NULL ,
	[制单人]   [char] (10) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL 
)
GO

CREATE TABLE [dbo].[采购订单明细历史] (
	[编号] [char] (14) Not NULL Primary key,
	[订单号] [char] (14) Not NULL,
	[货号] [char] (14) NOT NULL ,
	[订货数量] [decimal] (28,6) NOT NULL ,
	[进价] [decimal] (28,6) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[扣率] [decimal] (28,6) NULL ,
	[税率] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL 
)
GO

CREATE TABLE [dbo].[进货单] (
	[编号] [char] (14) Not NULL Primary key,
	[供货商号] [char] (10) NOT NULL ,
	[进货日期] [datetime] NULL,
	[业务员]   [char] (10) NULL ,
	[制单人]   [char] (10) NULL ,
	[验收员] [char] (10) NULL ,
	[保管员] [char] (10) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL, 
	[订单号] [char] (14) NULL
)
GO

CREATE TABLE [dbo].[进货单明细] (
	[编号] [char] (14) Not NULL Primary key,
	[进货单号] [char] (14) Not NULL ,
	[货号] [char] (14) NOT NULL ,
	[进货数量] [decimal] (28,6) NOT NULL ,
	[进价] [decimal] (28,6) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[扣率] [decimal] (28,6) NULL ,
	[税率] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL ,
	[仓库] [char] (20) NULL ,
	[货物质量] [varchar] (50) NULL 
)
GO

CREATE TABLE [dbo].[进货单历史] (
	[编号] [char] (14) Not NULL Primary key,
	[供货商号] [char] (10) NOT NULL ,
	[进货日期] [datetime] NULL,
	[业务员]   [char] (10) NULL ,
	[制单人]   [char] (10) NULL ,
	[验收员] [char] (10) NULL ,
	[保管员] [char] (10) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL , 
	[订单号] [char] (14) NULL
)
GO

CREATE TABLE [dbo].[进货单明细历史] (
	[编号] [char] (14) Not NULL Primary key,
	[进货单号] [char] (14) Not NULL ,
	[货号] [char] (14) NOT NULL ,
	[进货数量] [decimal] (28,6) NOT NULL ,
	[进价] [decimal] (28,6) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[扣率] [decimal] (28,6) NULL ,
	[税率] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL ,
	[仓库] [char] (20) NULL ,
	[货物质量] [varchar] (50) NULL 
)
GO

CREATE TABLE [dbo].[进价调整单] (
	[内部编号] [int] Identity(1,1) NOt NULL primary key,
	[编号] [char] (14) NOT NULL ,
	[进货数量] [decimal] (28,6) NULL,
	[原进价] [decimal] (28,6) NOT NULL ,
	[新进价] [decimal] (28,6) NOT NULL ,
	[调整日期] [int] NOT NULL ,
	[制单人] [char] (10) NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[销售订单] (
	[编号] [char] (14) Not NULL Primary key,
	[客户编号] [char] (10) NOT NULL ,
	[销售日期] [datetime] NULL,
	[有效起日] [datetime] NULL ,
	[有效止日] [datetime] NULL ,
	[业务员]   [char] (10) NULL ,
	[制单人]   [char] (10) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL 
)
GO

CREATE TABLE [dbo].[销售订单明细] (
	[编号] [char] (14) Not NULL Primary key,
	[订单号] [char] (14) Not NULL,
	[货号] [char] (14) NOT NULL ,
	[销售数量] [decimal] (28,6) NOT NULL ,
	[销售价] [decimal] (28,6) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[扣率] [decimal] (28,6) NULL ,
	[税率] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL 
)
GO

CREATE TABLE [dbo].[销售订单历史] (
	[编号] [char] (14) Not NULL Primary key,
	[客户编号] [char] (10) NOT NULL ,
	[销售日期] [datetime] NULL,
	[有效起日] [datetime] NULL ,
	[有效止日] [datetime] NULL ,
	[业务员]   [char] (10) NULL ,
	[制单人]   [char] (10) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL 
)
GO

CREATE TABLE [dbo].[销售订单明细历史] 
(
	[编号] [char] (14) Not NULL Primary key,
	[订单号] [char] (14) Not NULL,
	[货号] [char] (14) NOT NULL ,
	[销售数量] [decimal] (28,6) NOT NULL ,
	[销售价] [decimal] (28,6) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[扣率] [decimal] (28,6) NULL ,
	[税率] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL 
)
GO

CREATE TABLE [dbo].[销售单] (
	[编号] [char] (14) Not NULL Primary key,
	[客户编号] [char] (10) NOT NULL ,
	[销售日期] [datetime] NULL,
	[业务员]   [char] (10) NULL ,
	[制单人]   [char] (10) NULL ,
	[保管员] [char] (10) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL, 
	[订单号] [char] (14) Not NULL
)
GO

CREATE TABLE [dbo].[销售单明细] (
	[编号] [char] (14) Not NULL Primary key,
	[销售单号] [char] (14) Not NULL ,
	[货号] [char] (14) NOT NULL ,
	[销售数量] [decimal] (28,6) NOT NULL ,
	[销售价] [decimal] (28,6) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[扣率] [decimal] (28,6) NULL ,
	[税率] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL ,
	[仓库] [char] (20) NULL 
)
GO

CREATE TABLE [dbo].[销售单历史] (
	[编号] [char] (14) Not NULL Primary key,
	[客户编号] [char] (10) NOT NULL ,
	[销售日期] [datetime] NULL,
	[业务员]   [char] (10) NULL ,
	[制单人]   [char] (10) NULL ,
	[保管员] [char] (10) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL, 
	[订单号] [char] (14) Not NULL
)
GO

CREATE TABLE [dbo].[销售单明细历史] (
	[编号] [char] (14) Not NULL Primary key,
	[销售单号] [char] (14) Not NULL ,
	[货号] [char] (14) NOT NULL ,
	[销售数量] [decimal] (28,6) NOT NULL ,
	[销售价] [decimal] (28,6) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[扣率] [decimal] (28,6) NULL ,
	[税率] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL ,
	[仓库] [char] (20) NULL 
)
GO

CREATE TABLE [dbo].[销退货单] (
	[编号] [char] (14) Not NULL Primary key,
	[销售单编号] [char] (14) Not NULL ,
	[货号] [char] (14) NOT NULL ,
	[退货数量] [decimal] (28,6) NOT NULL ,
	[销售价] [decimal] (28,6) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[扣率] [decimal] (28,6) NULL ,
	[税率] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL ,
	[仓库] [char] (20) NULL 
)
GO

CREATE TABLE [dbo].[销退货单历史] (
	[编号] [char] (14) Not NULL Primary key,
	[销售单编号] [char] (14) Not NULL ,
	[货号] [char] (14) NOT NULL ,
	[退货数量] [decimal] (28,6) NOT NULL ,
	[销售价] [decimal] (28,6) NULL ,
	[税价合计] [decimal] (28,6) NULL ,
	[扣率] [decimal] (28,6) NULL ,
	[税率] [decimal] (28,6) NULL ,
	[不含税价] [decimal] (28,6) NULL ,
	[税额] [decimal] (28,6) NULL ,
	[仓库] [char] (20) NULL 
)
GO

CREATE TABLE [dbo].[调拨单] (
	[编号] [char] (14) NOT NULL primary key,
	[源部门] [varchar] (20) NULL ,
	[目的部门] [varchar] (20) NULL ,
	[货号] [char] (14) NOT NULL ,
	[数量] [decimal] (28,6) NOT NULL ,
	[单价] [decimal] (28,6) NOT NULL ,
	[合计金额] [decimal] (28,6) NULL ,
	[调拨日期] [int] NULL ,
	[制单人] [char] (10) NULL ,
	[调货原因] [varchar] (20) NULL
)
GO


CREATE TABLE [dbo].[调拨单历史] (
	[编号] [char] (14) NOT NULL primary key,
	[源部门] [varchar] (20) NULL ,
	[目的部门] [varchar] (20) NULL ,
	[货号] [char] (14) NOT NULL ,
	[数量] [decimal] (28,6) NOT NULL ,
	[单价] [decimal] (28,6) NOT NULL ,
	[合计金额] [decimal] (28,6) NULL ,
	[调拨日期] [int] NULL ,
	[制单人] [char] (10) NULL ,
	[调货原因] [varchar] (20) NULL
)
GO


CREATE TABLE [dbo].[报损报溢] (
	[编号] [char] (14) NOT NULL primary key,
	[货号] [char] (14) NOT NULL ,
	[仓库] [varchar] (20) NOT NULL ,
	[数量] [decimal] (28,6) NULL ,
	[库存单价] [decimal] (28,6) NULL ,
	[金额] [decimal] (28,6) NULL ,
	[日期] [int] NULL ,
	[责任人] [char] (10) NULL ,
	[制单人] [char] (10) NULL
)
GO

CREATE TABLE [dbo].[报损报溢历史] (
	[编号] [char] (14) NOT NULL primary key,
	[货号] [char] (14) NOT NULL ,
	[仓库] [varchar] (20) NOT NULL ,
	[数量] [decimal] (28,6) NULL ,
	[库存单价] [decimal] (28,6) NULL ,
	[金额] [decimal] (28,6) NULL ,
	[日期] [int] NULL ,
	[责任人] [char] (10) NULL ,
	[制单人] [char] (10) NULL
)
GO

CREATE TABLE [dbo].[上下限对照表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[仓库号] [char] (6) NOT NULL ,
	[货号] [char] (14) NOT NULL ,
	[上限] [decimal] (28,6) NULL ,
	[下限] [decimal] (28,6) NULL ,
	[最佳存量] [decimal] (28,6) NULL ,
	[备注] [varchar] (50) NULL
)
GO

CREATE TABLE [dbo].[预付款] (
	[供货商号] [char] (10) NOT NULL primary key,
	[预付款总额] [decimal] (28,6) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[应付款] (
	[编号] [char] (14) NOT NULL primary key,
	[发票号] [char] (14) NULL ,	
	[填票日期] [int] NULL,
	[进货单号] [char] (14) NULL ,
	[货号] [char] (14) NOT NULL ,
	[供货商号] [char] (10) NOT NULL ,
	[数量] [decimal] (28,6) NOT NULL ,
	[进货单价] [decimal] (28,6) NULL ,
	[金额] [decimal] (28,6) NULL ,
	[付款日期] [int] NULL ,
	[详细说明] [varchar] (100) NULL ,
	[进货日期] [datetime] NULL,
	[状态] [char] (6) NULL,
	[减预付] [char] (2) NULL 
)
GO

CREATE TABLE [dbo].[预收款] (
	[供货商号] [char] (10) NOT NULL primary key,
	[预收款总额] [decimal] (28,6) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[应收款] (
	[编号] [char] (14) NOT NULL primary key,
	[发票号] [char] (14) NULL ,	
	[填票日期] [int] NULL,
	[销售单号] [char] (14) NULL ,
	[货号] [char] (14) NOT NULL ,
	[客户编号] [char] (10) NOT NULL ,
	[数量] [decimal] (28,6) NOT NULL ,
	[销售价] [decimal] (28,6) NULL ,
	[金额] [decimal] (28,6) NULL ,
	[收款日期] [int] NULL ,
	[详细说明] [varchar] (100) NULL ,
	[销售日期] [datetime] NULL,
	[状态] [char] (6) NULL,
	[减预收] [char] (2) NULL 
)
GO

CREATE TABLE [dbo].[每月结帐日期表] (
	[月份] [int] not null primary key,
	[全称] [char] (4),
	[结帐日期] [int] not null default 25        -- 默认每日25号结帐
)
GO

CREATE TABLE 结帐历史 (
	结帐编号 CHAR(14),
	结帐日期 CHAR(10),
	结帐年月 INT,
	初次结帐 char(2) DEFAULT '否',
	备注 CHAR(40)
)
GO

CREATE TABLE 进销存汇总表 (
	结帐编号 CHAR(14),
	年月 int,
	货号 CHAR(14),
	上期结帐数量 decimal(28,6) DEFAULT 0,
	上期结帐金额 numeric(30,2) DEFAULT 0,
	借方数量 decimal(28,6) DEFAULT 0,
	借方金额 numeric(30,2) DEFAULT 0,
	贷方数量 decimal(28,6) DEFAULT 0,
	贷方金额 numeric(30,2) DEFAULT 0,
	本期结存数量 decimal(28,6) DEFAULT 0,
	本期结存金额 numeric(30,2) DEFAULT 0,
	备注 char(20)
)
GO


CREATE TABLE [dbo].[销售日报] (
	[日期] [int] NOT NULL ,
	[部门] [varchar] (20) NOT NULL ,
	[组别] [varchar] (20) NOT NULL ,
	[收款机号] [char] (4) NOT NULL ,
	[货号] [char] (14) NOT NULL ,
	[班次] [char] (8) NOT NULL ,
	[销售数量] [decimal] (28,6) NULL ,
	[应收金额] [decimal] (28,6) NULL ,
	[实收金额] [decimal] (28,6) NULL ,
	[库存单价] [decimal] (28,6) NULL 
)
GO


CREATE TABLE [dbo].[调货申请] (
	[编号] [char] (14) Not NULL Primary key,
	[部门] [varchar] (20) NULL ,
	[组别] [varchar] (20) NULL ,
	[货号] [char] (14) NOT NULL ,
	[数量] [decimal] (28,6) NULL ,
	[日期] [int] NULL ,
	[申请人] [char] (10) NULL ,
	[申请说明] [varchar] (100) NULL ,
	[回复] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[库存库] (
	[货号] [char] (14) NOT NULL ,
	[仓库] [varchar] (20) NOT NULL ,
	[库存数量] [decimal] (28,6) NOT NULL ,
	[库存金额] [decimal] (28,6) NOT NULL ,
	[库存单价] [decimal] (28,6) NOT NULL ,
	[最新进价] [decimal] (28,6) NULL 
)
GO

CREATE TABLE [dbo].[盘点单] (
	[编号] [int] NOT NULL primary key,
	[货号] [char] (14) NOT NULL ,
	[仓库] [varchar] (20) NOT NULL ,
	[原库存数] [decimal] (28,6) NULL ,
	[原库存金额] [decimal] (28,6) NULL ,
	[原库存单价] [decimal] (28,6) NULL ,
	[新库存数量] [decimal] (28,6) NULL ,
	[新库存金额] [decimal] (28,6) NULL ,
	[新库存单价] [decimal] (28,6) NULL ,
	[制单人] [char] (10) NULL ,
	[调整日期] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[盘点单历史] (
	[编号] [int] NOT NULL primary key,
	[货号] [char] (14) NOT NULL ,
	[仓库] [varchar] (20) NOT NULL ,
	[原库存数] [decimal] (28,6) NULL ,
	[原库存金额] [decimal] (28,6) NULL ,
	[原库存单价] [decimal] (28,6) NULL ,
	[新库存数量] [decimal] (28,6) NULL ,
	[新库存金额] [decimal] (28,6) NULL ,
	[新库存单价] [decimal] (28,6) NULL ,
	[制单人] [char] (10) NULL ,
	[调整日期] [int] NULL 
) ON [PRIMARY]
GO



--外键
ALTER TABLE [dbo].[上下限对照表] ADD 
	CONSTRAINT [上下限对照表_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[库存库] ADD 
	CONSTRAINT [库存库_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[应付款] ADD 
	CONSTRAINT [应付款_供货商_fk] FOREIGN KEY 
	(
		[供货商号]
	) REFERENCES [dbo].[供货商清单] (
		[供货商号]
	),
	CONSTRAINT [应付款_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[应收款] ADD 
	CONSTRAINT [应收款_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	),
	CONSTRAINT [应收款_客户编号_fk] FOREIGN KEY 
	(
		[客户编号]
	) REFERENCES [dbo].[客户清单] (
		[客户编号]
	)
GO

ALTER TABLE [dbo].[报损报溢] ADD 
	CONSTRAINT [报损报溢_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[报损报溢历史] ADD 
	CONSTRAINT [报损报溢历史_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[盘点单] ADD 
	CONSTRAINT [盘点单_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[盘点单历史] ADD 
	CONSTRAINT [盘点单历史_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[调拨单] ADD 
	CONSTRAINT [调拨单_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[调拨单历史] ADD 
	CONSTRAINT [调拨单历史_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[调货申请] ADD 
	CONSTRAINT [调货申请_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[进货单] ADD 
	CONSTRAINT [进货单_供货商_fk] FOREIGN KEY 
	(
		[供货商号]
	) REFERENCES [dbo].[供货商清单] (
		[供货商号]
	)
GO

ALTER TABLE [dbo].[进货单历史] ADD 
	CONSTRAINT [进货单历史_供货商_fk] FOREIGN KEY 
	(
		[供货商号]
	) REFERENCES [dbo].[供货商清单] (
		[供货商号]
	)
GO

ALTER TABLE [dbo].[进货单明细] ADD 
	CONSTRAINT [FK_进货单明细_进货单] FOREIGN KEY 
	(
		[进货单号]
	) REFERENCES [dbo].[进货单] (
		[编号]
	),
	CONSTRAINT [进货单明细_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[进货单明细历史] ADD 
	CONSTRAINT [进货单明细历史_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[进销存汇总表] ADD 
	CONSTRAINT [进销存汇总表_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[采购合同] ADD 
	CONSTRAINT [采购合同_供货商_fk] FOREIGN KEY 
	(
		[供货商号]
	) REFERENCES [dbo].[供货商清单] (
		[供货商号]
	),
	CONSTRAINT [采购合同_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[采购订单] ADD 
	CONSTRAINT [采购订单_供货商_fk] FOREIGN KEY 
	(
		[供货商号]
	) REFERENCES [dbo].[供货商清单] (
		[供货商号]
	)
GO

ALTER TABLE [dbo].[采购订单历史] ADD 
	CONSTRAINT [采购订单历史_供货商_fk] FOREIGN KEY 
	(
		[供货商号]
	) REFERENCES [dbo].[供货商清单] (
		[供货商号]
	)
GO

ALTER TABLE [dbo].[采购订单明细] ADD 
	CONSTRAINT [FK_采购订单明细_采购订单] FOREIGN KEY 
	(
		[订单号]
	) REFERENCES [dbo].[采购订单] (
		[编号]
	),
	CONSTRAINT [采购订单明细_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[采购订单明细历史] ADD 
	CONSTRAINT [采购订单明细历史_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[销售单] ADD 
	CONSTRAINT [销售单_客户编号_fk] FOREIGN KEY 
	(
		[客户编号]
	) REFERENCES [dbo].[客户清单] (
		[客户编号]
	)
GO

ALTER TABLE [dbo].[销售单历史] ADD 
	CONSTRAINT [销售单历史_客户编号_fk] FOREIGN KEY 
	(
		[客户编号]
	) REFERENCES [dbo].[客户清单] (
		[客户编号]
	)
GO

ALTER TABLE [dbo].[销售单明细] ADD 
	CONSTRAINT [FK_销售单明细_销售单] FOREIGN KEY 
	(
		[销售单号]
	) REFERENCES [dbo].[销售单] (
		[编号]
	),
	CONSTRAINT [销售单明细_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[销售单明细历史] ADD 
	CONSTRAINT [销售单明细历史_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[销售合同] ADD 
	CONSTRAINT [销售合同_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	),
	CONSTRAINT [销售合同_客户编号_fk] FOREIGN KEY 
	(
		[客户编号]
	) REFERENCES [dbo].[客户清单] (
		[客户编号]
	)
GO

ALTER TABLE [dbo].[销售日报] ADD 
	CONSTRAINT [销售日报_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[销售订单] ADD 
	CONSTRAINT [销售订单_客户编号_fk] FOREIGN KEY 
	(
		[客户编号]
	) REFERENCES [dbo].[客户清单] (
		[客户编号]
	)
GO

ALTER TABLE [dbo].[销售订单历史] ADD 
	CONSTRAINT [销售订单历史_客户编号_fk] FOREIGN KEY 
	(
		[客户编号]
	) REFERENCES [dbo].[客户清单] (
		[客户编号]
	)
GO

ALTER TABLE [dbo].[销售订单明细] ADD 
	CONSTRAINT [FK_销售订单明细_销售订单] FOREIGN KEY 
	(
		[订单号]
	) REFERENCES [dbo].[销售订单] (
		[编号]
	),
	CONSTRAINT [销售订单明细_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[销售订单明细历史] ADD 
	CONSTRAINT [销售订单明细历史_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[销退货单] ADD 
	CONSTRAINT [销退货单_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[销退货单历史] ADD 
	CONSTRAINT [销退货单历史_货号_fk] FOREIGN KEY 
	(
		[货号]
	) REFERENCES [dbo].[商品清单] (
		[货号]
	)
GO

ALTER TABLE [dbo].[预付款] ADD 
	CONSTRAINT [预付款_供货商_fk] FOREIGN KEY 
	(
		[供货商号]
	) REFERENCES [dbo].[供货商清单] (
		[供货商号]
	)
GO

ALTER TABLE [dbo].[预收款] ADD 
	CONSTRAINT [预收款_供货商_fk] FOREIGN KEY 
	(
		[供货商号]
	) REFERENCES [dbo].[供货商清单] (
		[供货商号]
	)
GO




--- 下面是存储过程

CREATE PROCEDURE sf_进货单
AS
begin transaction
	-- 库存库中没有,增加记录
	INSERT INTO 库存库(货号,仓库,库存数量,库存金额,库存单价) SELECT DISTINCT j.货号, j.仓库, 0,0,0
			FROM 进货单明细 AS J left join 库存库 as k on ( j.仓库=k.仓库 and j.货号=k.货号 )
			where k.货号 is null
	-- 修改库存信息
	UPDATE 库存库 SET 库存单价=case when 库存数量<=0 or (库存数量+数量ALL)<=0 then 进价
					else (库存金额+税价合计ALL)/(库存数量+数量ALL) end ,
			库存数量=库存数量+数量ALL,
			库存金额=case when 库存数量<=0 or (库存数量+数量ALL)<=0 
				then 进价*(库存数量+数量ALL) else (库存金额+税价合计ALL) end ,
			最新进价=进价
		FROM 
		(SELECT 仓库,货号,'数量ALL'=sum(进货数量), '进价' = sum(税价合计)/sum(进货数量), 
			'税价合计ALL'=sum(税价合计) FROM 进货单明细 GROUP BY 仓库,货号) AS LSJ
		WHERE  库存库.仓库=LSj.仓库 AND 库存库.货号=LSj.货号
	-- 加入应付款
	INSERT INTO 应付款(编号, 进货单号, 货号, 供货商号, 数量, 进货单价, 金额, 进货日期, 状态)
		SELECT 	'付'+a.编号,b.编号,a.货号,b.供货商号,进货数量,进价,a.税价合计,进货日期,'应付' 
		FROM 进货单明细 as a, 进货单 as b
		where a.进货单号=b.编号 
	-- 加入历史
	insert into 进货单历史 select * from 进货单
	insert into 进货单明细历史 select * from 进货单明细
	-- 清除进货单
	delete from 进货单明细
	delete from 进货单
commit
go

CREATE PROCEDURE sf_销售单
AS
begin transaction
	-- 修改库存信息
	UPDATE 库存库 SET 库存数量=库存数量-数量ALL, 库存金额=库存单价*(库存数量-数量ALL)
		FROM (SELECT 仓库,货号,'数量ALL'=sum(销售数量) FROM 销售单明细 
		GROUP BY 仓库,货号) AS LSJ
		WHERE  库存库.仓库=LSj.仓库 AND 库存库.货号=LSj.货号
	-- 加入应收款
	INSERT INTO 应收款(编号, 销售单号, 货号, 客户编号, 数量, 销售价, 金额, 销售日期, 状态)
		SELECT 	'收'+a.编号,b.编号,a.货号,b.客户编号,销售数量,销售价,a.税价合计,销售日期,'应收' 
		FROM 销售单明细 as a, 销售单 as b
		where a.销售单号=b.编号 
	-- 加入历史
	insert into 销售单历史 select * from 销售单
	insert into 销售单明细历史 select * from 销售单明细
	-- 清除销售单
	delete from 销售单明细
	delete from 销售单
commit
go


--- 初始化数据
insert into 用户清单 values('1','系统管理','sys','M','sys')
insert into 用户清单 values('zs','采购部','张三','M','sys')
insert into 用户清单 values('ls','销售部','李四','M','sys')
insert into 用户清单 values('ww','财务部','王五','M','sys')
go
insert into 仓库清单(仓库号,仓库名) values('1','1库')
insert into 仓库清单(仓库号,仓库名) values('2','2库')
insert into 仓库清单(仓库号,仓库名) values('3','3库')
insert into 仓库清单(仓库号,仓库名) values('4','4库')
insert into 仓库清单(仓库号,仓库名) values('5','5库')
go
insert into 业务员清单(业务员号,姓名,性别) values('zs','张三','M')
insert into 业务员清单(业务员号,姓名,性别)  values('ls','李四','M')
insert into 业务员清单(业务员号,姓名,性别)  values('ww','王五','M')
go




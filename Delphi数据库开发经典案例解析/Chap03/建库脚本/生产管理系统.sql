if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SF_cg2审核采购订单]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SF_cg2审核采购订单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SF_cg5订货合同计划登记]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SF_cg5订货合同计划登记]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SYS清采购订单]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SYS清采购订单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SYS清采购订单审核]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SYS清采购订单审核]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrp计算old]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[mrp计算old]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_KF2批次调拨单]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_KF2批次调拨单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_cg1删除全部未用项]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_cg1删除全部未用项]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_cg1取得采购项]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_cg1取得采购项]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_cg1填写采购订单]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_cg1填写采购订单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_cg3修改采购订单]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_cg3修改采购订单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_cj1填生产订单]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_cj1填生产订单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_cj2审生产订单]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_cj2审生产订单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_cj5填完工报告单]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_cj5填完工报告单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_cj5由MRP生成生产订单]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_cj5由MRP生成生产订单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_kf1填成品入库单]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_kf1填成品入库单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_mps主生产计划审核]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_mps主生产计划审核]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_mps主生产计划预排]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_mps主生产计划预排]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_mps填需求计划]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_mps填需求计划]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_mrpMpsTest]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_mrpMpsTest]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_mrpTest子项毛需求]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_mrpTest子项毛需求]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_mrpTest计算]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_mrpTest计算]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_mrpmps]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_mrpmps]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_mrp子项毛需求]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_mrp子项毛需求]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_mrp生产件资源负荷]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_mrp生产件资源负荷]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_mrp计算]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_mrp计算]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_mrp试算生产件资源负荷]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_mrp试算生产件资源负荷]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_sc生成领料单]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_sc生成领料单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_加入进销存卡片]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_加入进销存卡片]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sys生成资源日程表]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sys生成资源日程表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[低层码]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[低层码]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V物料主文件]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V物料主文件]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[v商品库存明细]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[v商品库存明细]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[v资源清单]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[v资源清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[v资源负荷报表]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[v资源负荷报表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bom信息状态]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bom信息状态]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bom状态]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bom状态]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[jzh每月结转日期表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[jzh每月结转日期表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrp0]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[mrp0]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrpcalcd]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[mrpcalcd]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrpcalcm]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[mrpcalcm]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrp历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[mrp历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrp发布时间]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[mrp发布时间]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrp正式]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[mrp正式]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrp简单计算]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[mrp简单计算]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mrp试算]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[mrp试算]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[临时生产件资源负荷报表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[临时生产件资源负荷报表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[临时资源负荷报表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[临时资源负荷报表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[临时进销存卡片]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[临时进销存卡片]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主生产计划]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[主生产计划]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主生产计划历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[主生产计划历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主生产计划预排历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[主生产计划预排历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主需求计划]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[主需求计划]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主需求计划历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[主需求计划历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[产品入库单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[产品入库单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[产品入库单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[产品入库单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[功能模块]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[功能模块]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[发布项清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[发布项清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[完工报告单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[完工报告单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[完工报告单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[完工报告单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[客户修改历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[客户修改历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[工作中心]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[工作中心]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[工厂日历]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[工厂日历]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[工艺线路主]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[工艺线路主]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[工艺线路细]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[工艺线路细]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[库存库]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[库存库]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[报损报溢历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[报损报溢历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[换货单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[换货单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[效期对照表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[效期对照表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[权限登记]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[权限登记]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[标准工序]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[标准工序]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料主文件]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料主文件]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料价值代码]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料价值代码]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料入库单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料入库单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料入库单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料入库单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料反查表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料反查表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料展开表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料展开表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料归属类别]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料归属类别]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料状态类别]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料状态类别]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料计划类别]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料计划类别]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[物料需求计划old]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[物料需求计划old]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[生产件资源负荷报表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[生产件资源负荷报表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[生产大纲]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[生产大纲]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[生产大纲历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[生产大纲历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[生产订单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[生产订单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[生产订单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[生产订单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[生产订单审核]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[生产订单审核]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[系统日志]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[系统日志]
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职工清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[职工清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[计划期参数]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[计划期参数]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[计量单位]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[计量单位]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[订货合同]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[订货合同]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[订货合同发布]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[订货合同发布]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[订货合同接收]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[订货合同接收]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[词库]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[词库]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[调拨单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[调拨单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[调拨单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[调拨单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[调整库存历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[调整库存历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[资源日程表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[资源日程表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[资源日程表历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[资源日程表历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[资源消耗定额]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[资源消耗定额]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[资源清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[资源清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[资源负荷报表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[资源负荷报表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[运行参数表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[运行参数表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[进退货单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[进退货单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[进退货单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[进退货单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[进销存卡片]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[进销存卡片]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[选择记帐记录表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[选择记帐记录表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[采购订单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单o]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[采购订单o]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[采购订单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单发布]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[采购订单发布]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单审核]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[采购订单审核]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[采购订单接收]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[采购订单接收]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售订单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售订单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售订单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售订单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售预测]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售预测]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销售预测历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销售预测历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[销退货单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[销退货单历史]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[领料单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[领料单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[领料单temp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[领料单temp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[领料单历史]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[领料单历史]
GO

CREATE TABLE [dbo].[bom信息状态] (
	[状态代码] [char] (1) NOT NULL ,
	[状态描述] [varchar] (50) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[bom状态] (
	[状态代码] [char] (1) NOT NULL ,
	[状态描述] [varchar] (50) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jzh每月结转日期表] (
	[月份] [int] NOT NULL ,
	[全称] [char] (4) NULL ,
	[结转日期] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[mrp0] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[物料编号] [char] (20) NULL ,
	[年份] [int] NULL ,
	[计划期] [int] NULL ,
	[期初库存] [decimal](18, 4) NULL ,
	[预计入库] [decimal](18, 4) NULL ,
	[预计采购] [decimal](18, 4) NULL ,
	[预计生产] [decimal](18, 4) NULL ,
	[预计外协] [decimal](18, 4) NULL ,
	[预计出库] [decimal](18, 4) NULL ,
	[需求数量] [decimal](18, 4) NULL ,
	[建议采购] [decimal](18, 4) NULL ,
	[建议生产] [decimal](18, 4) NULL ,
	[建议外协] [decimal](18, 4) NULL ,
	[预计库存] [decimal](18, 4) NULL ,
	[安全库存] [decimal](18, 4) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[mrpcalcd] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
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

CREATE TABLE [dbo].[mrpcalcm] (
	[低层码] [int] NULL ,
	[物料编号] [char] (14) NULL ,
	[计划代码] [char] (5) NULL ,
	[当前库存] [decimal](18, 4) NULL ,
	[逾期入库] [decimal](18, 4) NULL ,
	[逾期出库] [decimal](18, 4) NULL ,
	[提前期] [int] NULL ,
	[批量] [decimal](18, 4) NULL ,
	[安全库存] [decimal](18, 4) NULL ,
	[可用库存] [decimal](18, 4) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[mrp历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[发布编号] [char] (20) NULL ,
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
	[计划投入] [decimal](18, 4) NULL ,
	[能力计算标记] [char] (1) NOT NULL ,
	[生产订单标记] [char] (1) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[mrp发布时间] (
	[发布编号] [int] IDENTITY (1, 1) NOT NULL ,
	[年份] [int] NULL ,
	[计划期] [int] NULL ,
	[发布时间] [char] (20) NULL ,
	[发布人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[mrp正式] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[发布编号] [char] (20) NULL ,
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

CREATE TABLE [dbo].[mrp简单计算] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[年份] [int] NULL ,
	[计划期] [int] NULL ,
	[物料编号] [char] (14) NULL ,
	[用量] [decimal](18, 4) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[mrp试算] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
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

CREATE TABLE [dbo].[临时生产件资源负荷报表] (
	[资源编号] [char] (14) NOT NULL ,
	[日期] [int] NULL ,
	[年份] [int] NULL ,
	[计划期] [int] NULL ,
	[负荷] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[临时资源负荷报表] (
	[资源编号] [char] (14) NOT NULL ,
	[日期] [int] NULL ,
	[年份] [int] NULL ,
	[计划期] [int] NULL ,
	[负荷] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[临时进销存卡片] (
	[编号] [int] IDENTITY (1, 1) NOT NULL ,
	[部门] [varchar] (20) NOT NULL ,
	[组别] [varchar] (20) NOT NULL ,
	[货位] [varchar] (20) NULL ,
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[摘要] [varchar] (100) NOT NULL ,
	[单据号] [char] (14) NOT NULL ,
	[日期] [int] NULL ,
	[入库数量] [float] NOT NULL ,
	[入库金额] [float] NOT NULL ,
	[出库数量] [float] NOT NULL ,
	[出库金额] [float] NOT NULL ,
	[结存数量] [float] NOT NULL ,
	[结存金额] [float] NOT NULL ,
	[同货号数量] [float] NULL ,
	[同货号金额] [float] NULL ,
	[成本单价] [float] NULL ,
	[影响部门] [varchar] (20) NOT NULL ,
	[影响组别] [varchar] (100) NOT NULL ,
	[影响货位] [varchar] (20) NULL ,
	[接收登记] [binary] (30) NULL ,
	[记帐人] [char] (20) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[主生产计划] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[编号] [char] (14) NULL ,
	[年份] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[开始日期] [int] NULL ,
	[结束日期] [int] NULL ,
	[期初库存] [float] NULL ,
	[需求数量] [float] NULL ,
	[MPS数量] [float] NULL ,
	[生产单数量] [float] NULL ,
	[预计库存] [float] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[审核人] [varchar] (10) NULL ,
	[审核日期] [int] NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NOT NULL Default '有效' ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[主生产计划历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[编号] [char] (14) NULL ,
	[年份] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[开始日期] [int] NULL ,
	[结束日期] [int] NULL ,
	[期初库存] [float] NULL ,
	[需求数量] [float] NULL ,
	[MPS数量] [float] NULL ,
	[生产单数量] [float] NULL ,
	[预计库存] [float] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[审核人] [varchar] (10) NULL ,
	[审核日期] [int] NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NOT NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[主生产计划预排历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[编号] [char] (14) NULL ,
	[年份] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[开始日期] [int] NULL ,
	[结束日期] [int] NULL ,
	[期初库存] [float] NULL ,
	[需求数量] [float] NULL ,
	[MPS数量] [float] NULL ,
	[生产单数量] [float] NULL ,
	[预计库存] [float] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[审核人] [varchar] (10) NULL ,
	[审核日期] [int] NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NOT NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[主需求计划] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[年份] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[开始日期] [int] NULL ,
	[结束日期] [int] NULL ,
	[需求数量] [float] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NOT NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[主需求计划历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[年份] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[开始日期] [int] NULL ,
	[结束日期] [int] NULL ,
	[需求数量] [float] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NOT NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[产品入库单] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[生产单号] [char] (14) NULL ,
	[编号] [char] (14) NULL ,
	[单据号] [char] (14) NULL ,
	[源仓区] [varchar] (20) NOT NULL ,
	[源仓位] [varchar] (20) NOT NULL ,
	[目的仓区] [varchar] (20) NOT NULL ,
	[目的仓位] [varchar] (20) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NULL ,
	[效期] [int] NULL ,
	[批次] [char] (14) NULL ,
	[库存成本单价] [float] NULL ,
	[批次成本单价] [float] NULL ,
	[到货数量] [float] NULL ,
	[入库数量] [float] NOT NULL ,
	[拒收数量] [float] NULL ,
	[验收结论] [char] (10) NULL ,
	[到货日期] [int] NULL ,
	[验收日期] [int] NULL ,
	[验收员] [char] (10) NULL ,
	[保管员] [char] (10) NULL ,
	[记帐人] [char] (10) NULL ,
	[记帐日期] [int] NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NOT NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[产品入库单历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[生产单号] [char] (14) NULL ,
	[编号] [char] (14) NULL ,
	[单据号] [char] (14) NULL ,
	[源仓区] [varchar] (20) NOT NULL ,
	[源仓位] [varchar] (20) NOT NULL ,
	[目的仓区] [varchar] (20) NOT NULL ,
	[目的仓位] [varchar] (20) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NULL ,
	[效期] [int] NULL ,
	[批次] [char] (14) NULL ,
	[库存成本单价] [float] NULL ,
	[批次成本单价] [float] NULL ,
	[到货数量] [float] NULL ,
	[入库数量] [float] NOT NULL ,
	[拒收数量] [float] NULL ,
	[验收结论] [char] (10) NULL ,
	[到货日期] [int] NULL ,
	[验收日期] [int] NULL ,
	[验收员] [char] (10) NULL ,
	[保管员] [char] (10) NULL ,
	[记帐人] [char] (10) NULL ,
	[记帐日期] [int] NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NOT NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[功能模块] (
	[模块编号] [char] (10) NOT NULL ,
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

CREATE TABLE [dbo].[发布项清单] (
	[编号] [int] NOT NULL ,
	[方式] [char] (10) NULL ,
	[表名] [char] (20) NULL ,
	[影响表名] [char] (20) NULL ,
	[零售条件] [char] (60) NULL ,
	[库房条件] [char] (60) NULL ,
	[转入表名] [char] (20) NULL ,
	[零售] [char] (1) NULL ,
	[库房] [char] (1) NULL ,
	[远存储过程] [char] (40) NULL ,
	[近存储过程] [char] (40) NULL ,
	[全接收登记] [binary] (30) NULL ,
	[送前远过程] [char] (40) NULL ,
	[送前近过程] [char] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[完工报告单] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NULL ,
	[单据号] [char] (14) NULL ,
	[生产单号] [char] (14) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NULL ,
	[批次] [char] (14) NULL ,
	[填报日期] [int] NOT NULL ,
	[完成数量] [float] NOT NULL ,
	[记帐人] [char] (10) NULL ,
	[记帐日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[验收结论] [char] (10) NULL ,
	[验收日期] [int] NULL ,
	[验收员] [char] (10) NULL ,
	[保管员] [char] (10) NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[完工报告单历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NULL ,
	[单据号] [char] (14) NULL ,
	[生产单号] [char] (14) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NULL ,
	[批次] [char] (14) NULL ,
	[填报日期] [int] NOT NULL ,
	[完成数量] [float] NOT NULL ,
	[记帐人] [char] (10) NULL ,
	[记帐日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[验收结论] [char] (10) NULL ,
	[验收日期] [int] NULL ,
	[验收员] [char] (10) NULL ,
	[保管员] [char] (10) NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[客户修改历史] (
	[编号] [int] NOT NULL ,
	[客户编号] [char] (14) NOT NULL ,
	[原简称] [varchar] (50) NULL ,
	[原拼音编码] [char] (20) NULL ,
	[原名称] [varchar] (40) NULL ,
	[原销售扣率] [float] NULL ,
	[原授信额度] [float] NULL ,
	[原联系人] [char] (10) NULL ,
	[原地址] [varchar] (40) NULL ,
	[原邮编] [char] (6) NULL ,
	[原区号] [char] (6) NULL ,
	[原地区] [varchar] (12) NULL ,
	[原电话] [varchar] (20) NULL ,
	[原传真] [varchar] (20) NULL ,
	[原电报] [varchar] (20) NULL ,
	[原开户行] [varchar] (40) NULL ,
	[原开户行邮编] [char] (6) NULL ,
	[原银行帐号] [varchar] (20) NULL ,
	[原税号] [varchar] (20) NULL ,
	[原性质] [varchar] (10) NULL ,
	[原首营] [int] NULL ,
	[原库房地址] [varchar] (40) NULL ,
	[原库房电话] [varchar] (20) NULL ,
	[原业务员] [char] (10) NULL ,
	[原业务部门] [varchar] (20) NULL ,
	[原销售属性] [varchar] (6) NULL ,
	[原是否停用] [char] (2) NULL ,
	[原类别] [char] (10) NULL ,
	[新简称] [varchar] (50) NULL ,
	[新拼音编码] [char] (20) NULL ,
	[新名称] [varchar] (40) NULL ,
	[新销售扣率] [float] NULL ,
	[新授信额度] [float] NULL ,
	[新联系人] [char] (10) NULL ,
	[新地址] [varchar] (40) NULL ,
	[新邮编] [char] (6) NULL ,
	[新区号] [char] (6) NULL ,
	[新地区] [varchar] (12) NULL ,
	[新电话] [varchar] (20) NULL ,
	[新传真] [varchar] (20) NULL ,
	[新电报] [varchar] (20) NULL ,
	[新开户行] [varchar] (40) NULL ,
	[新开户行邮编] [char] (6) NULL ,
	[新银行帐号] [varchar] (20) NULL ,
	[新税号] [varchar] (20) NULL ,
	[新性质] [varchar] (10) NULL ,
	[新首营] [int] NULL ,
	[新库房地址] [varchar] (40) NULL ,
	[新库房电话] [varchar] (20) NULL ,
	[新业务员] [char] (10) NULL ,
	[新业务部门] [varchar] (20) NULL ,
	[新销售属性] [varchar] (6) NULL ,
	[新是否停用] [char] (2) NULL ,
	[新类别] [char] (10) NULL ,
	[修改原因] [varchar] (50) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[记帐人] [char] (10) NOT NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[工作中心] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NOT NULL ,
	[名称] [char] (40) NULL ,
	[最大工时] [int] NULL ,
	[额定工时] [int] NULL ,
	[最小工时] [int] NULL ,
	[数量] [int] NULL ,
	[制造费用] [float] NULL ,
	[人数] [int] NULL ,
	[工资费率] [float] NULL ,
	[记帐人] [varchar] (50) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[工厂日历] (
	[年份] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[开始日期] [int] NOT NULL ,
	[结束日期] [int] NOT NULL ,
	[备注] [varchar] (255) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[工艺线路主] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NULL ,
	[名称] [varchar] (40) NULL ,
	[生产类型] [char] (16) NULL ,
	[生产批量] [int] NULL ,
	[工作中心编号] [char] (10) NULL ,
	[准备时间] [int] NULL ,
	[生产时间] [int] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[工艺线路细] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[工艺线路编号] [char] (14) NULL ,
	[序号] [char] (10) NULL ,
	[工序编号] [char] (14) NULL ,
	[工序名称] [varchar] (40) NULL ,
	[前置时间] [int] NULL ,
	[工具一编号] [char] (10) NULL ,
	[工具一名称] [varchar] (40) NULL ,
	[工具二编号] [char] (10) NULL ,
	[工具二名称] [varchar] (40) NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[库存库] (
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[部门] [varchar] (20) NOT NULL ,
	[组别] [varchar] (20) NOT NULL ,
	[货位] [varchar] (20) NULL ,
	[库存数量] [float] NOT NULL ,
	[库存金额] [float] NOT NULL ,
	[库存单价] [float] NOT NULL ,
	[最新进价] [float] NULL ,
	[扣率] [float] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[报损报溢历史] (
	[内部编号] [int] NOT NULL ,
	[编号] [char] (14) NULL ,
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[部门] [varchar] (20) NOT NULL ,
	[组别] [varchar] (20) NOT NULL ,
	[货位] [varchar] (20) NULL ,
	[数量] [float] NULL ,
	[库存单价] [float] NULL ,
	[批发价] [float] NULL ,
	[零售价] [float] NULL ,
	[金额] [float] NULL ,
	[批价金额] [float] NULL ,
	[实金额] [float] NULL ,
	[责任人] [char] (10) NULL ,
	[证明人] [char] (10) NULL ,
	[记帐人] [char] (10) NULL ,
	[报溢意见] [varchar] (50) NULL ,
	[上级意见] [varchar] (50) NULL ,
	[储运意见] [varchar] (50) NULL ,
	[经营意见] [varchar] (50) NULL ,
	[财会意见] [varchar] (50) NULL ,
	[小组意见] [varchar] (50) NULL ,
	[日期] [int] NULL ,
	[序号] [int] NULL ,
	[单据号] [char] (12) NULL ,
	[打印标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[票据类型] [char] (6) NOT NULL ,
	[效期] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[报损报溢批次明细历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[报损报溢编号] [char] (14) NULL ,
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[批次] [char] (14) NULL ,
	[库存编号] [int] NULL ,
	[供货商号] [char] (10) NOT NULL ,
	[数量] [float] NULL ,
	[库存单价] [float] NULL ,
	[库存金额] [float] NULL ,
	[记帐人] [char] (10) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[换货单历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NOT NULL ,
	[单据号] [char] (14) NOT NULL ,
	[货号] [char] (14) NOT NULL ,
	[客户编号] [char] (14) NULL ,
	[供货商号] [char] (10) NOT NULL ,
	[部门] [varchar] (20) NULL ,
	[组别] [varchar] (20) NULL ,
	[原货批号] [varchar] (20) NOT NULL ,
	[新货批号] [varchar] (20) NOT NULL ,
	[原货批次] [char] (14) NULL ,
	[新货批次] [char] (14) NULL ,
	[原货效期] [int] NULL ,
	[新货效期] [int] NULL ,
	[库存编号] [int] NULL ,
	[货位] [varchar] (20) NULL ,
	[换货数量] [float] NULL ,
	[提成进价] [float] NULL ,
	[成本金额] [float] NULL ,
	[日期] [int] NULL ,
	[记帐日期] [int] NULL ,
	[换货原因] [varchar] (30) NULL ,
	[记帐人] [char] (10) NOT NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[效期对照表] (
	[货号] [char] (14) NOT NULL ,
	[批号] [char] (14) NOT NULL ,
	[效期] [int] NULL ,
	[有效天数] [int] NULL 
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

CREATE TABLE [dbo].[标准工序] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NOT NULL ,
	[名称] [varchar] (40) NULL ,
	[工作中心编号] [char] (10) NULL ,
	[排队时间] [int] NULL ,
	[加工时间] [int] NULL ,
	[移动时间] [int] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[物料主文件] (
	[编号] [int] IDENTITY (1, 1) NOT NULL ,
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
	[进货提前期] [int] NOT NULL ,
	[准备周期] [int] NOT NULL ,
	[生产周期] [int] NOT NULL ,
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
	[生产车间] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[物料价值代码] (
	[价值代码] [char] (1) NOT NULL ,
	[价值类别描述] [varchar] (40) NOT NULL ,
	[盘点周期] [int] NULL ,
	[说明] [varchar] (50) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[物料入库单] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[采购订单编号] [char] (14) NULL ,
	[编号] [char] (14) NULL ,
	[单据号] [char] (14) NULL ,
	[目的仓区] [varchar] (20) NOT NULL ,
	[目的仓位] [varchar] (20) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NULL ,
	[批次] [char] (14) NULL ,
	[库存成本单价] [float] NULL ,
	[批次成本单价] [float] NULL ,
	[到货数量] [float] NOT NULL ,
	[入库数量] [float] NOT NULL ,
	[拒收数量] [float] NULL ,
	[验收结论] [char] (10) NULL ,
	[到货日期] [int] NULL ,
	[验收日期] [int] NULL ,
	[验收员] [char] (10) NULL ,
	[保管员] [char] (10) NULL ,
	[记帐人] [char] (10) NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NOT NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[物料入库单历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[采购订单编号] [char] (14) NULL ,
	[编号] [char] (14) NULL ,
	[单据号] [char] (14) NULL ,
	[目的仓区] [varchar] (20) NOT NULL ,
	[目的仓位] [varchar] (20) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NULL ,
	[批次] [char] (14) NULL ,
	[库存成本单价] [float] NULL ,
	[批次成本单价] [float] NULL ,
	[到货数量] [float] NOT NULL ,
	[入库数量] [float] NOT NULL ,
	[拒收数量] [float] NULL ,
	[验收结论] [char] (10) NULL ,
	[到货日期] [int] NULL ,
	[验收日期] [int] NULL ,
	[验收员] [char] (10) NULL ,
	[保管员] [char] (10) NULL ,
	[记帐人] [char] (10) NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NOT NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[物料反查表] (
	[层次] [varchar] (20) NULL ,
	[父项编号] [char] (20) NULL ,
	[子项编号] [char] (20) NULL ,
	[需求量] [decimal](10, 4) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[物料展开表] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[层次] [varchar] (20) NULL ,
	[父项编号] [char] (14) NULL ,
	[子项编号] [char] (14) NULL ,
	[需要数量] [decimal](10, 4) NULL ,
	[损耗率] [decimal](5, 2) NULL ,
	[用量] [decimal](18, 4) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[物料归属类别] (
	[类别代码] [char] (5) NOT NULL ,
	[类别描述] [char] (20) NOT NULL ,
	[相关会计科目] [char] (20) NULL ,
	[说明] [varchar] (50) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[物料清单] (
	[父项编号] [char] (14) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[需要数量] [decimal](18, 4) NOT NULL ,
	[领料车间] [char] (10) NULL ,
	[领料库房] [char] (10) NULL ,
	[平均损耗率1] [decimal](6, 5) NOT NULL ,
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

CREATE TABLE [dbo].[物料状态类别] (
	[类别代码] [char] (5) NOT NULL ,
	[状态描述] [char] (20) NOT NULL ,
	[说明] [varchar] (50) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[物料计划类别] (
	[类别代码] [char] (5) NOT NULL ,
	[类别名称] [char] (20) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[物料需求计划old] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[物料编号] [char] (20) NOT NULL ,
	[年份] [smallint] NOT NULL ,
	[计划期] [tinyint] NOT NULL ,
	[需求数量] [decimal](18, 4) NOT NULL ,
	[已满足数量] [decimal](18, 4) NULL ,
	[状态] [char] (10) NULL ,
	[mps编号] [char] (10) NULL ,
	[审核者] [char] (10) NULL ,
	[审核日期] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[生产件资源负荷报表] (
	[资源编号] [char] (14) NOT NULL ,
	[日期] [int] NULL ,
	[年份] [int] NULL ,
	[计划期] [int] NULL ,
	[负荷] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[生产大纲] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[年月] [int] NOT NULL ,
	[生产数量] [int] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[生产大纲历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[年月] [int] NOT NULL ,
	[生产数量] [int] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[生产订单] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[MPS编号] [char] (14) NULL ,
	[编号] [char] (14) NULL ,
	[单据号] [char] (14) NULL ,
	[生产批号] [char] (20) NULL ,
	[物料编号] [char] (14) NULL ,
	[年份] [int] NULL ,
	[计划期] [int] NULL ,
	[数量] [float] NULL ,
	[生产部门] [char] (10) NULL ,
	[下达日期] [int] NULL ,
	[要求完成日期] [int] NULL ,
	[完成数量] [float] NULL ,
	[剩余数量] [float] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[记帐日期] [int] NULL ,
	[审核人] [varchar] (10) NULL ,
	[审核日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[生产订单历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[MPS编号] [char] (14) NOT NULL ,
	[编号] [char] (14) NULL ,
	[单据号] [char] (14) NULL ,
	[生产批号] [char] (20) NULL ,
	[物料编号] [char] (14) NULL ,
	[年份] [int] NULL ,
	[计划期] [int] NULL ,
	[数量] [float] NULL ,
	[生产部门] [char] (10) NULL ,
	[下达日期] [int] NULL ,
	[要求完成日期] [int] NULL ,
	[完成数量] [float] NULL ,
	[剩余数量] [float] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[记帐日期] [int] NULL ,
	[审核人] [varchar] (10) NULL ,
	[审核日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NULL ,
	[备注] [varchar] (40) NULL ,
	[领料单标志] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[生产订单审核] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[MPS编号] [char] (14) NOT NULL ,
	[编号] [char] (14) NULL ,
	[单据号] [char] (14) NULL ,
	[生产批号] [char] (20) NULL ,
	[物料编号] [char] (14) NULL ,
	[年份] [int] NULL ,
	[计划期] [int] NULL ,
	[数量] [float] NULL ,
	[生产部门] [char] (10) NULL ,
	[下达日期] [int] NULL ,
	[要求完成日期] [int] NULL ,
	[完成数量] [float] NULL ,
	[剩余数量] [float] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[记帐日期] [int] NULL ,
	[审核人] [varchar] (10) NULL ,
	[审核日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[盘点批次明细历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[盘点编号] [char] (14) NULL ,
	[部门] [varchar] (20) NULL ,
	[组别] [varchar] (20) NULL ,
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[货位] [varchar] (20) NULL ,
	[批次] [char] (14) NULL ,
	[原库存数量] [float] NULL ,
	[新库存数量] [float] NULL ,
	[原库存单价] [float] NULL ,
	[新库存单价] [float] NULL ,
	[日期] [int] NULL ,
	[库存编号] [int] NULL ,
	[供货商号] [char] (10) NOT NULL ,
	[数量] [float] NULL ,
	[库存单价] [float] NULL ,
	[库存金额] [float] NULL ,
	[记帐人] [char] (10) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[系统日志] (
	[编号] [int] NULL ,
	[时间] [datetime] NULL ,
	[摘要] [varchar] (100) NULL ,
	[模块编号] [char] (10) NULL ,
	[程序文件] [varchar] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[日期] [int] NULL ,
	[详细情况] [varchar] (1000) NULL 
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

CREATE TABLE [dbo].[计划期参数] (
	[需求区期数] [char] (10) NULL ,
	[计划区期数] [char] (10) NULL ,
	[预测区期数] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[计量单位] (
	[计量单位] [char] (10) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[订货合同] (
	[内部编号] [int] NOT NULL ,
	[编号] [char] (14) NULL ,
	[合同编号] [char] (12) NULL ,
	[单据号] [char] (12) NULL ,
	[申请编号] [char] (14) NULL ,
	[供货商号] [char] (10) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[订货数量] [real] NULL ,
	[进价] [money] NULL ,
	[金额] [money] NULL ,
	[交货方式] [varchar] (20) NULL ,
	[订货日期] [int] NULL ,
	[订货地点] [varchar] (20) NULL ,
	[订货人] [char] (8) NULL ,
	[送货日期] [int] NULL ,
	[送货数量] [real] NULL ,
	[有效起日] [int] NULL ,
	[有效止日] [int] NULL ,
	[记帐日期] [int] NULL ,
	[记帐人] [char] (8) NULL ,
	[作废标记] [char] (1) NULL ,
	[打印标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[订货合同发布] (
	[内部编号] [int] NOT NULL ,
	[编号] [char] (14) NULL ,
	[合同编号] [char] (12) NULL ,
	[单据号] [char] (12) NULL ,
	[申请编号] [char] (14) NULL ,
	[供货商号] [char] (10) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[订货数量] [real] NULL ,
	[进价] [money] NULL ,
	[金额] [money] NULL ,
	[交货方式] [varchar] (20) NULL ,
	[订货日期] [int] NULL ,
	[订货地点] [varchar] (20) NULL ,
	[订货人] [char] (8) NULL ,
	[送货日期] [int] NULL ,
	[送货数量] [real] NULL ,
	[有效起日] [int] NULL ,
	[有效止日] [int] NULL ,
	[记帐日期] [int] NULL ,
	[记帐人] [char] (8) NULL ,
	[作废标记] [char] (1) NULL ,
	[打印标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[订货合同接收] (
	[内部编号] [int] NOT NULL ,
	[编号] [char] (14) NULL ,
	[合同编号] [char] (12) NULL ,
	[单据号] [char] (12) NULL ,
	[申请编号] [char] (14) NULL ,
	[供货商号] [char] (10) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[订货数量] [real] NULL ,
	[进价] [money] NULL ,
	[金额] [money] NULL ,
	[交货方式] [varchar] (20) NULL ,
	[订货日期] [int] NULL ,
	[订货地点] [varchar] (20) NULL ,
	[订货人] [char] (8) NULL ,
	[送货日期] [int] NULL ,
	[送货数量] [real] NULL ,
	[有效起日] [int] NULL ,
	[有效止日] [int] NULL ,
	[记帐日期] [int] NULL ,
	[记帐人] [char] (8) NULL ,
	[作废标记] [char] (1) NULL ,
	[打印标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[词库] (
	[内部编号] [int] NOT NULL ,
	[单位] [char] (8) NULL ,
	[剂型] [char] (16) NULL ,
	[处方类型] [char] (8) NULL ,
	[商品类别] [char] (8) NULL ,
	[商品属性] [char] (8) NULL ,
	[进货税率] [real] NULL ,
	[客户性质] [char] (10) NULL ,
	[供货商类型] [char] (12) NULL ,
	[地区] [char] (12) NULL ,
	[调价依据] [char] (50) NULL ,
	[部门类型] [char] (30) NULL ,
	[职务] [char] (30) NULL ,
	[货位] [char] (10) NULL ,
	[仓区] [char] (20) NULL ,
	[仓位] [char] (20) NULL ,
	[备用字段1] [char] (30) NULL ,
	[备用字段2] [char] (10) NULL ,
	[备用字段3] [char] (10) NULL ,
	[备用字段4] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[调拨单] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NULL ,
	[源部门] [varchar] (20) NULL ,
	[源组别] [varchar] (20) NULL ,
	[源货位] [varchar] (20) NULL ,
	[目的部门] [varchar] (20) NULL ,
	[目的组别] [varchar] (20) NULL ,
	[目的货位] [varchar] (20) NULL ,
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[批次] [char] (14) NULL ,
	[库存编号] [int] NULL ,
	[大包装数] [float] NULL ,
	[中包装数] [float] NULL ,
	[数量] [float] NOT NULL ,
	[单价] [float] NOT NULL ,
	[最新进价] [float] NULL ,
	[批发价] [float] NULL ,
	[零售价] [float] NULL ,
	[合计金额] [float] NULL ,
	[批发金额] [float] NULL ,
	[零售金额] [float] NULL ,
	[调拨日期] [int] NULL ,
	[日期] [int] NULL ,
	[记帐人] [char] (10) NOT NULL ,
	[序号] [int] NULL ,
	[单据号] [char] (12) NULL ,
	[申请单号] [char] (14) NULL ,
	[单据类型] [char] (4) NULL ,
	[打印标记] [char] (1) NULL ,
	[作废标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[库存数量] [float] NULL ,
	[票据类型] [char] (6) NOT NULL ,
	[成本单价] [float] NULL ,
	[提成进价] [float] NULL ,
	[成本金额] [float] NULL ,
	[调拨原因] [varchar] (20) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[调拨单历史] (
	[内部编号] [int] NOT NULL ,
	[编号] [char] (14) NULL ,
	[源部门] [varchar] (20) NULL ,
	[源组别] [varchar] (20) NULL ,
	[源货位] [varchar] (20) NULL ,
	[目的部门] [varchar] (20) NULL ,
	[目的组别] [varchar] (20) NULL ,
	[目的货位] [varchar] (20) NULL ,
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[批次] [char] (14) NULL ,
	[库存编号] [int] NULL ,
	[大包装数] [float] NULL ,
	[中包装数] [float] NULL ,
	[数量] [float] NOT NULL ,
	[单价] [float] NULL ,
	[最新进价] [float] NULL ,
	[批发价] [float] NULL ,
	[零售价] [float] NULL ,
	[合计金额] [float] NULL ,
	[批发金额] [float] NULL ,
	[零售金额] [float] NULL ,
	[调拨日期] [int] NULL ,
	[日期] [int] NULL ,
	[记帐人] [char] (10) NOT NULL ,
	[序号] [int] NULL ,
	[单据号] [char] (12) NULL ,
	[申请单号] [char] (14) NULL ,
	[单据类型] [char] (4) NULL ,
	[打印标记] [char] (1) NULL ,
	[作废标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[库存数量] [float] NULL ,
	[票据类型] [char] (6) NOT NULL ,
	[成本单价] [float] NULL ,
	[提成进价] [float] NULL ,
	[成本金额] [float] NULL ,
	[调拨原因] [varchar] (20) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[调整库存历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NOT NULL ,
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[部门] [varchar] (20) NOT NULL ,
	[组别] [varchar] (20) NOT NULL ,
	[货位] [varchar] (20) NULL ,
	[原库存数] [float] NULL ,
	[原库存金额] [float] NULL ,
	[原库存单价] [float] NULL ,
	[新库存数量] [float] NOT NULL ,
	[新库存金额] [float] NULL ,
	[新库存单价] [float] NULL ,
	[记帐人] [char] (10) NULL ,
	[调整日期] [int] NULL ,
	[接收登记] [binary] (30) NULL ,
	[详细说明] [varchar] (50) NULL ,
	[效期] [int] NULL ,
	[零售价] [float] NULL ,
	[批发价] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[资源日程表] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[日期] [int] NOT NULL ,
	[资源编号] [char] (14) NOT NULL ,
	[计划能力] [float] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[资源日程表历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[日期] [int] NOT NULL ,
	[资源编号] [char] (14) NOT NULL ,
	[计划能力] [float] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[资源消耗定额] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[物料编号] [char] (14) NULL ,
	[生产批量] [int] NULL ,
	[资源编号] [char] (14) NULL ,
	[资源类型] [char] (14) NULL ,
	[来源] [char] (16) NULL ,
	[资源需求量] [float] NULL ,
	[前置时间] [int] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[资源清单] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NOT NULL ,
	[名称] [char] (40) NULL ,
	[拼音编码] [varchar] (20) NULL ,
	[最大工时] [int] NULL ,
	[额定工时] [int] NULL ,
	[最小工时] [int] NULL ,
	[数量] [int] NULL ,
	[制造费用] [float] NULL ,
	[人数] [int] NULL ,
	[工资费率] [float] NULL ,
	[资源类型] [char] (10) NULL ,
	[记帐人] [varchar] (50) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[资源负荷报表] (
	[资源编号] [char] (14) NOT NULL ,
	[日期] [int] NULL ,
	[年份] [int] NULL ,
	[计划期] [int] NULL ,
	[负荷] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[运行参数表] (
	[编号] [int] NOT NULL ,
	[参数名称] [varchar] (20) NOT NULL ,
	[参数] [int] NOT NULL ,
	[说明] [varchar] (100) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[进退货单] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NULL ,
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[批次] [char] (14) NULL ,
	[供货商号] [char] (10) NOT NULL ,
	[大包装数] [float] NULL ,
	[中包装数] [float] NULL ,
	[数量] [float] NOT NULL ,
	[批发价] [float] NULL ,
	[零售价] [float] NULL ,
	[扣率] [float] NULL ,
	[不含税价] [float] NULL ,
	[税率] [float] NULL ,
	[税额] [float] NULL ,
	[税价合计] [float] NULL ,
	[零价合计] [float] NULL ,
	[批价合计] [float] NULL ,
	[成本单价] [float] NULL ,
	[提成进价] [float] NULL ,
	[部门] [varchar] (20) NULL ,
	[组别] [varchar] (20) NULL ,
	[货位] [varchar] (20) NULL ,
	[库存编号] [int] NULL ,
	[应付处理] [char] (8) NULL ,
	[进货单号] [char] (14) NULL ,
	[备注] [varchar] (50) NULL ,
	[业务员] [char] (10) NULL ,
	[保管员] [char] (10) NULL ,
	[记帐人] [char] (10) NULL ,
	[审单员] [char] (10) NULL ,
	[记帐日期] [int] NULL ,
	[序号] [int] NULL ,
	[单据号] [char] (12) NULL ,
	[打印标记] [char] (1) NULL ,
	[状态] [char] (6) NULL ,
	[效期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[进退货单历史] (
	[内部编号] [int] NOT NULL ,
	[编号] [char] (14) NOT NULL ,
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[批次] [char] (14) NULL ,
	[供货商号] [char] (10) NOT NULL ,
	[大包装数] [float] NULL ,
	[中包装数] [float] NULL ,
	[数量] [float] NOT NULL ,
	[批发价] [float] NULL ,
	[零售价] [float] NULL ,
	[扣率] [float] NULL ,
	[不含税价] [float] NULL ,
	[税率] [float] NULL ,
	[税额] [float] NULL ,
	[税价合计] [float] NULL ,
	[零价合计] [float] NULL ,
	[批价合计] [float] NULL ,
	[成本单价] [float] NULL ,
	[提成进价] [float] NULL ,
	[部门] [varchar] (20) NULL ,
	[组别] [varchar] (20) NULL ,
	[货位] [varchar] (20) NULL ,
	[库存编号] [int] NULL ,
	[应付处理] [char] (8) NULL ,
	[进货单号] [char] (14) NULL ,
	[备注] [varchar] (50) NULL ,
	[业务员] [char] (10) NULL ,
	[保管员] [char] (10) NULL ,
	[记帐人] [char] (10) NULL ,
	[审单员] [char] (10) NULL ,
	[记帐日期] [int] NULL ,
	[序号] [int] NULL ,
	[单据号] [char] (12) NULL ,
	[打印标记] [char] (1) NULL ,
	[状态] [char] (6) NULL ,
	[效期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[进销存卡片] (
	[编号] [int] IDENTITY (1, 1) NOT NULL ,
	[部门] [varchar] (20) NOT NULL ,
	[组别] [varchar] (20) NOT NULL ,
	[货位] [varchar] (20) NULL ,
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[摘要] [varchar] (100) NOT NULL ,
	[单据号] [char] (14) NOT NULL ,
	[日期] [int] NULL ,
	[入库数量] [float] NOT NULL ,
	[入库金额] [float] NOT NULL ,
	[出库数量] [float] NOT NULL ,
	[出库金额] [float] NOT NULL ,
	[结存数量] [float] NOT NULL ,
	[结存金额] [float] NOT NULL ,
	[同货号数量] [float] NULL ,
	[同货号金额] [float] NULL ,
	[成本单价] [float] NULL ,
	[影响部门] [varchar] (20) NOT NULL ,
	[影响组别] [varchar] (100) NOT NULL ,
	[影响货位] [varchar] (20) NULL ,
	[接收登记] [binary] (30) NULL ,
	[记帐人] [char] (20) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[选择记帐记录表] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[标识字段1] [varchar] (50) NULL ,
	[标识字段2] [varchar] (50) NULL ,
	[标识字段3] [varchar] (50) NULL ,
	[标识字段4] [varchar] (50) NULL ,
	[标识字段5] [varchar] (50) NULL ,
	[标识字段6] [varchar] (50) NULL ,
	[标识字段7] [varchar] (50) NULL ,
	[标识字段8] [varchar] (50) NULL ,
	[标识字段9] [varchar] (50) NULL ,
	[标识字段10] [varchar] (50) NULL ,
	[记帐人] [varchar] (10) NULL ,
	[操作文件名] [varchar] (40) NULL ,
	[备用字段1] [varchar] (50) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[采购订单] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NULL ,
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
	[订单说明] [varchar] (40) NULL ,
	[接收登记] [binary] (30) NULL ,
	[修改标记] [char] (1) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[采购订单o] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[订单号] [char] (10) NOT NULL ,
	[供货商号] [char] (10) NULL ,
	[订货日期] [int] NULL ,
	[物料编号] [char] (20) NOT NULL ,
	[年份] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[采购数量] [decimal](18, 4) NOT NULL ,
	[审核者] [char] (10) NULL ,
	[审核日期] [int] NULL ,
	[订单状态] [char] (10) NULL ,
	[到货数量] [decimal](18, 4) NOT NULL ,
	[剩余数量] [decimal](18, 4) NULL ,
	[备注] [varchar] (50) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[采购订单历史] (
	[内部编号] [int] NOT NULL ,
	[编号] [char] (14) NULL ,
	[合同编号] [char] (14) NULL ,
	[单据号] [char] (14) NULL ,
	[申请编号] [char] (14) NULL ,
	[供货商号] [char] (10) NULL ,
	[物料编号] [char] (14) NULL ,
	[订货数量] [decimal](24, 4) NULL ,
	[进价] [money] NULL ,
	[不含税价] [money] NULL ,
	[税率] [real] NULL ,
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
	[订单说明] [varchar] (40) NULL ,
	[接收登记] [binary] (30) NULL ,
	[修改标记] [char] (1) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[采购订单发布] (
	[内部编号] [int] NOT NULL ,
	[编号] [char] (14) NULL ,
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
	[订单说明] [varchar] (40) NULL ,
	[接收登记] [binary] (30) NULL ,
	[修改标记] [char] (1) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[采购订单审核] (
	[内部编号] [int] NOT NULL ,
	[编号] [char] (14) NULL ,
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
	[订单说明] [varchar] (40) NULL ,
	[接收登记] [binary] (30) NULL ,
	[修改标记] [char] (1) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[采购订单接收] (
	[内部编号] [int] NOT NULL ,
	[编号] [char] (14) NULL ,
	[合同编号] [char] (14) NULL ,
	[单据号] [char] (14) NULL ,
	[申请编号] [char] (14) NULL ,
	[供货商号] [char] (10) NOT NULL ,
	[货号] [char] (14) NOT NULL ,
	[订货数量] [float] NOT NULL ,
	[大包装数] [float] NULL ,
	[中包装数] [float] NULL ,
	[进价] [float] NULL ,
	[提成进价] [float] NULL ,
	[扣率] [float] NULL ,
	[不含税价] [float] NULL ,
	[税率] [float] NULL ,
	[税额] [float] NULL ,
	[税价合计] [float] NULL ,
	[批发价] [float] NULL ,
	[零售价] [float] NULL ,
	[批发金额] [float] NULL ,
	[零售金额] [float] NULL ,
	[交货方式] [varchar] (20) NULL ,
	[订货日期] [int] NULL ,
	[订货地点] [varchar] (20) NULL ,
	[订货人] [char] (10) NULL ,
	[送货日期] [int] NULL ,
	[送货数量] [float] NULL ,
	[有效起日] [int] NULL ,
	[有效止日] [int] NULL ,
	[记帐日期] [int] NULL ,
	[记帐人] [char] (10) NULL ,
	[审单人] [char] (10) NULL ,
	[作废标记] [char] (1) NULL ,
	[打印标记] [char] (1) NULL ,
	[订单状态] [char] (6) NULL ,
	[订单说明] [varchar] (40) NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[销售单] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NULL ,
	[销售订单编号] [char] (14) NULL ,
	[销售订单单据号] [char] (14) NULL ,
	[销售单单据号] [char] (14) NULL ,
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[批次] [char] (14) NULL ,
	[库存编号] [int] NULL ,
	[客户编号] [char] (14) NOT NULL ,
	[部门] [varchar] (20) NULL ,
	[组别] [varchar] (20) NULL ,
	[货位] [varchar] (20) NULL ,
	[大包装数] [float] NULL ,
	[中包装数] [float] NULL ,
	[数量] [float] NULL ,
	[批发价] [float] NULL ,
	[零售价] [float] NULL ,
	[招标价] [float] NULL ,
	[招标零售价] [float] NULL ,
	[扣率] [float] NULL ,
	[不含税额] [float] NULL ,
	[税率] [float] NULL ,
	[税额] [float] NULL ,
	[税价合计] [float] NULL ,
	[零价合计] [float] NULL ,
	[批价合计] [float] NULL ,
	[销售价] [float] NULL ,
	[库存单价] [float] NULL ,
	[库存金额] [float] NULL ,
	[转提货库] [char] (10) NULL ,
	[销售日期] [int] NULL ,
	[审单员] [char] (10) NULL ,
	[业务员] [char] (10) NULL ,
	[记帐人] [char] (10) NOT NULL ,
	[记帐日期] [int] NULL ,
	[序号] [int] NULL ,
	[详细情况] [varchar] (20) NULL ,
	[接收登记] [binary] (30) NULL ,
	[库存数量] [float] NULL ,
	[销售属性] [varchar] (6) NULL ,
	[票据类型] [char] (6) NOT NULL ,
	[状态] [char] (10) NULL ,
	[退货数量] [float] NULL ,
	[帐期] [int] NULL ,
	[批次成本单价] [float] NULL ,
	[提成进价] [float] NULL ,
	[批次成本金额] [float] NULL ,
	[毛利] [float] NULL ,
	[效期] [int] NULL ,
	[来源] [char] (8) NULL ,
	[供货商号] [char] (10) NULL ,
	[进货扣率] [float] NULL ,
	[购货人] [char] (12) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[销售单历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NOT NULL ,
	[销售订单编号] [char] (14) NULL ,
	[销售订单单据号] [char] (14) NULL ,
	[销售单单据号] [char] (14) NULL ,
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[批次] [char] (14) NULL ,
	[库存编号] [int] NULL ,
	[客户编号] [char] (14) NOT NULL ,
	[部门] [varchar] (20) NULL ,
	[组别] [varchar] (20) NULL ,
	[货位] [varchar] (20) NULL ,
	[大包装数] [float] NULL ,
	[中包装数] [float] NULL ,
	[数量] [float] NULL ,
	[批发价] [float] NULL ,
	[零售价] [float] NULL ,
	[招标价] [float] NULL ,
	[招标零售价] [float] NULL ,
	[扣率] [float] NULL ,
	[不含税额] [float] NULL ,
	[税率] [float] NULL ,
	[税额] [float] NULL ,
	[税价合计] [float] NULL ,
	[零价合计] [float] NULL ,
	[批价合计] [float] NULL ,
	[销售价] [float] NULL ,
	[库存单价] [float] NULL ,
	[库存金额] [float] NULL ,
	[转提货库] [char] (10) NULL ,
	[销售日期] [int] NULL ,
	[审单员] [char] (10) NULL ,
	[业务员] [char] (10) NULL ,
	[记帐人] [char] (10) NOT NULL ,
	[记帐日期] [int] NULL ,
	[序号] [int] NULL ,
	[详细情况] [varchar] (20) NULL ,
	[接收登记] [binary] (30) NULL ,
	[库存数量] [float] NULL ,
	[销售属性] [varchar] (6) NULL ,
	[票据类型] [char] (6) NOT NULL ,
	[状态] [char] (10) NULL ,
	[退货数量] [float] NULL ,
	[帐期] [int] NULL ,
	[批次成本单价] [float] NULL ,
	[提成进价] [float] NULL ,
	[批次成本金额] [float] NULL ,
	[毛利] [float] NULL ,
	[效期] [int] NULL ,
	[来源] [char] (8) NULL ,
	[供货商号] [char] (10) NULL ,
	[进货扣率] [float] NULL ,
	[购货人] [char] (12) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[销售订单] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NULL ,
	[销售合同单据号] [char] (14) NULL ,
	[销售订单单据号] [char] (14) NULL ,
	[客户编号] [char] (14) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[订货数量] [float] NOT NULL ,
	[市场价] [float] NULL ,
	[出厂价] [float] NULL ,
	[扣率] [float] NULL ,
	[实际订价] [float] NULL ,
	[金额] [float] NULL ,
	[交货方式] [varchar] (20) NULL ,
	[订货日期] [int] NULL ,
	[交货日期] [int] NULL ,
	[交货地点] [varchar] (20) NULL ,
	[订货人] [char] (10) NULL ,
	[记帐日期] [int] NULL ,
	[记帐人] [char] (10) NOT NULL ,
	[备注] [varchar] (40) NULL ,
	[状态] [char] (10) NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[销售订单历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [char] (14) NULL ,
	[销售合同单据号] [char] (14) NULL ,
	[销售订单单据号] [char] (14) NULL ,
	[客户编号] [char] (14) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[订货数量] [float] NOT NULL ,
	[市场价] [float] NULL ,
	[出厂价] [float] NULL ,
	[扣率] [float] NULL ,
	[实际订价] [float] NULL ,
	[金额] [float] NULL ,
	[交货方式] [varchar] (20) NULL ,
	[订货日期] [int] NULL ,
	[交货日期] [int] NULL ,
	[交货地点] [varchar] (20) NULL ,
	[订货人] [char] (10) NULL ,
	[记帐日期] [int] NULL ,
	[记帐人] [char] (10) NOT NULL ,
	[备注] [varchar] (40) NULL ,
	[状态] [char] (10) NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[销售预测] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[客户编号] [char] (14) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[年月] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[预测数量] [int] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[销售预测历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[客户编号] [char] (14) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[年月] [int] NOT NULL ,
	[计划期] [int] NOT NULL ,
	[预测数量] [int] NULL ,
	[记帐人] [varchar] (10) NULL ,
	[修改日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[销退货单历史] (
	[内部编号] [int] NOT NULL ,
	[编号] [char] (14) NOT NULL ,
	[货号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NOT NULL ,
	[批次] [char] (14) NULL ,
	[客户编号] [char] (14) NULL ,
	[部门] [varchar] (20) NULL ,
	[组别] [varchar] (20) NULL ,
	[货位] [varchar] (20) NULL ,
	[大包装数] [float] NULL ,
	[中包装数] [float] NULL ,
	[数量] [float] NOT NULL ,
	[批发价] [float] NULL ,
	[零售价] [float] NULL ,
	[招标价] [float] NULL ,
	[招标零售价] [float] NULL ,
	[扣率] [float] NULL ,
	[不含税价] [float] NULL ,
	[税率] [float] NULL ,
	[税额] [float] NULL ,
	[税价合计] [float] NULL ,
	[零价合计] [float] NULL ,
	[批价合计] [float] NULL ,
	[销售价] [float] NULL ,
	[成本单价] [float] NULL ,
	[提成进价] [float] NULL ,
	[库存单价] [float] NULL ,
	[仓库保管] [char] (10) NULL ,
	[记帐人] [varchar] (10) NULL ,
	[开票人] [char] (10) NULL ,
	[记帐日期] [int] NULL ,
	[应收处理] [char] (8) NULL ,
	[销售单号] [char] (14) NULL ,
	[退货原因] [varchar] (128) NULL ,
	[序号] [int] NULL ,
	[单据号] [char] (12) NULL ,
	[打印标记] [char] (1) NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (6) NULL ,
	[审单员] [char] (10) NULL ,
	[业务员] [char] (10) NULL ,
	[毛利] [float] NULL ,
	[效期] [int] NULL ,
	[来源] [char] (8) NULL ,
	[供货商号] [char] (10) NULL ,
	[进货扣率] [float] NULL ,
	[购货人] [char] (10) NULL ,
	[票据类型] [char] (6) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[领料单] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[生产订单编号] [char] (14) NULL ,
	[年份] [int] NULL ,
	[计划期] [int] NULL ,
	[领料库房] [char] (10) NULL ,
	[领料车间] [char] (10) NULL ,
	[编号] [char] (14) NULL ,
	[单据号] [char] (14) NULL ,
	[源仓区] [varchar] (20) NOT NULL ,
	[源仓位] [varchar] (20) NOT NULL ,
	[目的仓区] [varchar] (20) NOT NULL ,
	[目的仓位] [varchar] (20) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NULL ,
	[批次] [char] (14) NULL ,
	[库存成本单价] [float] NULL ,
	[批次成本单价] [float] NULL ,
	[申请数量] [float] NOT NULL ,
	[实领数量] [float] NOT NULL ,
	[领料日期] [int] NULL ,
	[申请人] [char] (10) NULL ,
	[审核人] [char] (10) NULL ,
	[验收员] [char] (10) NULL ,
	[保管员] [char] (10) NULL ,
	[记帐人] [char] (10) NULL ,
	[记帐日期] [int] NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NULL ,
	[领料类别] [char] (10) NOT NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[领料单temp] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[年份] [int] NULL ,
	[计划期] [int] NULL ,
	[生产订单编号] [char] (14) NULL ,
	[物料编号] [char] (14) NULL ,
	[领料库房] [char] (10) NULL ,
	[领料车间] [char] (10) NULL ,
	[数量] [decimal](18, 4) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[领料单历史] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[生产订单编号] [char] (14) NULL ,
	[编号] [char] (14) NULL ,
	[单据号] [char] (14) NULL ,
	[源仓区] [varchar] (20) NOT NULL ,
	[源仓位] [varchar] (20) NOT NULL ,
	[目的仓区] [varchar] (20) NOT NULL ,
	[目的仓位] [varchar] (20) NOT NULL ,
	[物料编号] [char] (14) NOT NULL ,
	[批号] [varchar] (20) NULL ,
	[批次] [char] (14) NULL ,
	[库存成本单价] [float] NULL ,
	[批次成本单价] [float] NULL ,
	[申请数量] [float] NOT NULL ,
	[实领数量] [float] NOT NULL ,
	[领料日期] [int] NULL ,
	[申请人] [char] (10) NULL ,
	[审核人] [char] (10) NULL ,
	[验收员] [char] (10) NULL ,
	[保管员] [char] (10) NULL ,
	[记帐人] [char] (10) NULL ,
	[记帐日期] [int] NULL ,
	[接收登记] [binary] (30) NULL ,
	[状态] [char] (10) NOT NULL ,
	[领料类别] [char] (10) NOT NULL ,
	[备注] [varchar] (40) NULL 
) ON [PRIMARY]
GO



ALTER TABLE [dbo].[bom信息状态] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[状态代码]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[bom状态] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[状态代码]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[jzh每月结转日期表] WITH NOCHECK ADD 
	CONSTRAINT [DF__jzh每月结转日期表__结转日期__78F3E6EC] DEFAULT (25) FOR [结转日期],
	 PRIMARY KEY  CLUSTERED 
	(
		[月份]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[mrp0] WITH NOCHECK ADD 
	CONSTRAINT [DF_mrp0_期初库存] DEFAULT (0) FOR [期初库存],
	CONSTRAINT [DF_mrp0_预计采购] DEFAULT (0) FOR [预计采购],
	CONSTRAINT [DF_mrp0_预计生产] DEFAULT (0) FOR [预计生产],
	CONSTRAINT [DF_mrp0_预计外协] DEFAULT (0) FOR [预计外协],
	CONSTRAINT [DF_mrp0_预计领用] DEFAULT (0) FOR [预计出库],
	CONSTRAINT [DF_mrp0_需求数量] DEFAULT (0) FOR [需求数量],
	CONSTRAINT [DF_mrp0_建议采购] DEFAULT (0) FOR [建议采购],
	CONSTRAINT [DF_mrp0_建议生产] DEFAULT (0) FOR [建议生产],
	CONSTRAINT [DF_mrp0_建议外协] DEFAULT (0) FOR [建议外协],
	CONSTRAINT [DF_mrp0_预计库存] DEFAULT (0) FOR [预计库存]
GO

ALTER TABLE [dbo].[mrpcalcd] WITH NOCHECK ADD 
	CONSTRAINT [PK_mrpcalcd] PRIMARY KEY  CLUSTERED 
	(
		[物料编号],
		[年份],
		[计划期]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[mrp历史] WITH NOCHECK ADD 
	CONSTRAINT [DF_mrp历史_能力计算标记] DEFAULT (0) FOR [能力计算标记],
	CONSTRAINT [DF_mrp历史_生产订单标记] DEFAULT (0) FOR [生产订单标记]
GO

ALTER TABLE [dbo].[mrp正式] WITH NOCHECK ADD 
	CONSTRAINT [PK_mrp正式] PRIMARY KEY  CLUSTERED 
	(
		[物料编号],
		[年份],
		[计划期]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[临时生产件资源负荷报表] WITH NOCHECK ADD 
	CONSTRAINT [DF_临时生产件资源负荷报表_负荷] DEFAULT (0) FOR [负荷]
GO

ALTER TABLE [dbo].[临时资源负荷报表] WITH NOCHECK ADD 
	CONSTRAINT [DF_临时资源负荷报表_负荷] DEFAULT (0) FOR [负荷]
GO

ALTER TABLE [dbo].[临时进销存卡片] WITH NOCHECK ADD 
	CONSTRAINT [DF_临时进销存卡片_货位] DEFAULT ('正式') FOR [货位],
	CONSTRAINT [DF__临时进销存卡片__入库数量__06F7ED80] DEFAULT (0) FOR [入库数量],
	CONSTRAINT [DF__临时进销存卡片__入库金额__07EC11B9] DEFAULT (0) FOR [入库金额],
	CONSTRAINT [DF__临时进销存卡片__出库数量__08E035F2] DEFAULT (0) FOR [出库数量],
	CONSTRAINT [DF__临时进销存卡片__出库金额__09D45A2B] DEFAULT (0) FOR [出库金额],
	CONSTRAINT [DF__临时进销存卡片__结存数量__0AC87E64] DEFAULT (0) FOR [结存数量],
	CONSTRAINT [DF__临时进销存卡片__结存金额__0BBCA29D] DEFAULT (0) FOR [结存金额],
	CONSTRAINT [DF__临时进销存卡片__同货号数量__0CB0C6D6] DEFAULT (0) FOR [同货号数量],
	CONSTRAINT [DF__临时进销存卡片__同货号金额__0DA4EB0F] DEFAULT (0) FOR [同货号金额],
	CONSTRAINT [DF__临时进销存卡片__影响部门__0E990F48] DEFAULT ('无') FOR [影响部门],
	CONSTRAINT [DF__临时进销存卡片__影响组别__0F8D3381] DEFAULT ('无') FOR [影响组别],
	CONSTRAINT [DF_临时进销存卡片_影响货位] DEFAULT ('正式') FOR [影响货位],
	CONSTRAINT [DF__临时进销存卡片__接收登记__0B5CAFEA] DEFAULT (0x00) FOR [接收登记],
	CONSTRAINT [PK__临时进销存卡片__345EC57D] PRIMARY KEY  CLUSTERED 
	(
		[编号]
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

ALTER TABLE [dbo].[产品入库单] WITH NOCHECK ADD 
	CONSTRAINT [DF_产品入库单_库存成本单价] DEFAULT (0) FOR [库存成本单价],
	CONSTRAINT [DF_产品入库单_批次成本单价] DEFAULT (0) FOR [批次成本单价]
GO

ALTER TABLE [dbo].[产品入库单历史] WITH NOCHECK ADD 
	CONSTRAINT [DF_产品入库单历史_库存成本单价] DEFAULT (0) FOR [库存成本单价],
	CONSTRAINT [DF_产品入库单历史_批次成本单价] DEFAULT (0) FOR [批次成本单价]
GO

ALTER TABLE [dbo].[工作中心] WITH NOCHECK ADD 
	CONSTRAINT [DF_工作中心_最大工时] DEFAULT (24) FOR [最大工时],
	CONSTRAINT [DF_工作中心_额定工时] DEFAULT (8) FOR [额定工时],
	CONSTRAINT [DF_工作中心_最小工时] DEFAULT (0) FOR [最小工时],
	CONSTRAINT [DF_工作中心_修改标记] DEFAULT ('0') FOR [修改标记],
	CONSTRAINT [DF_工作中心_接收登记] DEFAULT (0x00) FOR [接收登记],
	CONSTRAINT [PK_工作中心] PRIMARY KEY  CLUSTERED 
	(
		[编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[工厂日历] WITH NOCHECK ADD 
	CONSTRAINT [PK__工厂日历__1F98B2C1] PRIMARY KEY  CLUSTERED 
	(
		[年份],
		[计划期]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[库存库] WITH NOCHECK ADD 
	CONSTRAINT [DF__库存库__库存数量__6C43F744] DEFAULT (0) FOR [库存数量],
	CONSTRAINT [DF__库存库__库存金额__6D381B7D] DEFAULT (0) FOR [库存金额],
	CONSTRAINT [DF__库存库__库存单价__6E2C3FB6] DEFAULT (0) FOR [库存单价],
	CONSTRAINT [DF__库存库__修改标记__6F2063EF] DEFAULT ('0') FOR [修改标记],
	CONSTRAINT [DF__库存库__接收登记__09746778] DEFAULT (0x00) FOR [接收登记],
	CONSTRAINT [库存库_货号部门组别_FK] PRIMARY KEY  CLUSTERED 
	(
		[货号],
		[批号],
		[部门],
		[组别]
	)  ON [PRIMARY] 
GO


ALTER TABLE [dbo].[换货单历史] WITH NOCHECK ADD 
	CONSTRAINT [DF__换货单历史__接收登记__07420643] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[标准工序] WITH NOCHECK ADD 
	CONSTRAINT [DF_标准工序_修改标记] DEFAULT ('0') FOR [修改标记],
	CONSTRAINT [DF_标准工序_接收登记] DEFAULT (0x00) FOR [接收登记],
	CONSTRAINT [PK_标准工序] PRIMARY KEY  CLUSTERED 
	(
		[编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[物料主文件] WITH NOCHECK ADD 
	CONSTRAINT [DF__物料主文件__进货提前期__160F4887] DEFAULT (0) FOR [进货提前期],
	CONSTRAINT [DF__物料主文件__准备周期__17036CC0] DEFAULT (0) FOR [准备周期],
	CONSTRAINT [DF__物料主文件__生产周期__17F790F9] DEFAULT (0) FOR [生产周期],
	CONSTRAINT [DF_物料主文件_接收登记] DEFAULT (0x00) FOR [接收登记],
	CONSTRAINT [PK__物料主文件__151B244E] PRIMARY KEY  CLUSTERED 
	(
		[物料编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[物料价值代码] WITH NOCHECK ADD 
	CONSTRAINT [PK__物料价值代码__0F624AF8] PRIMARY KEY  CLUSTERED 
	(
		[价值代码]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[物料反查表] WITH NOCHECK ADD 
	CONSTRAINT [DF__物料反查表__需求量__43D61337] DEFAULT (1) FOR [需求量]
GO

ALTER TABLE [dbo].[物料展开表] WITH NOCHECK ADD 
	CONSTRAINT [DF__物料展开表__需求量__41EDCAC5] DEFAULT (1) FOR [需要数量]
GO

ALTER TABLE [dbo].[物料归属类别] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[类别代码]
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

ALTER TABLE [dbo].[物料状态类别] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[类别代码]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[物料计划类别] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[类别代码]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[物料需求计划old] WITH NOCHECK ADD 
	CONSTRAINT [PK__物料需求计划__2180FB33] PRIMARY KEY  CLUSTERED 
	(
		[内部编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[生产件资源负荷报表] WITH NOCHECK ADD 
	CONSTRAINT [DF_生产件资源负荷报表_负荷] DEFAULT (0) FOR [负荷]
GO

ALTER TABLE [dbo].[生产订单] WITH NOCHECK ADD 
	CONSTRAINT [DF_生产订单_完成数量] DEFAULT (0) FOR [完成数量],
	CONSTRAINT [DF_生产订单_剩余数量] DEFAULT (0) FOR [剩余数量]
GO

ALTER TABLE [dbo].[生产订单历史] WITH NOCHECK ADD 
	CONSTRAINT [DF_生产订单历史_领料单标志] DEFAULT (0) FOR [领料单标志]
GO


ALTER TABLE [dbo].[计量单位] WITH NOCHECK ADD 
	CONSTRAINT [PK_计量单位] PRIMARY KEY  CLUSTERED 
	(
		[计量单位]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[资源负荷报表] WITH NOCHECK ADD 
	CONSTRAINT [DF_资源负荷报表_负荷] DEFAULT (0) FOR [负荷]
GO

ALTER TABLE [dbo].[进销存卡片] WITH NOCHECK ADD 
	CONSTRAINT [DF__进销存卡片__入库数量__15460CD7] DEFAULT (0) FOR [入库数量],
	CONSTRAINT [DF__进销存卡片__入库金额__163A3110] DEFAULT (0) FOR [入库金额],
	CONSTRAINT [DF__进销存卡片__出库数量__172E5549] DEFAULT (0) FOR [出库数量],
	CONSTRAINT [DF__进销存卡片__出库金额__18227982] DEFAULT (0) FOR [出库金额],
	CONSTRAINT [DF__进销存卡片__结存数量__19169DBB] DEFAULT (0) FOR [结存数量],
	CONSTRAINT [DF__进销存卡片__结存金额__1A0AC1F4] DEFAULT (0) FOR [结存金额],
	CONSTRAINT [DF__进销存卡片__同货号数量__1AFEE62D] DEFAULT (0) FOR [同货号数量],
	CONSTRAINT [DF__进销存卡片__同货号金额__1BF30A66] DEFAULT (0) FOR [同货号金额],
	CONSTRAINT [DF__进销存卡片__影响部门__1CE72E9F] DEFAULT ('无') FOR [影响部门],
	CONSTRAINT [DF__进销存卡片__影响组别__1DDB52D8] DEFAULT ('无') FOR [影响组别],
	CONSTRAINT [DF_进销存卡片_影响货位] DEFAULT ('正式') FOR [影响货位],
	CONSTRAINT [DF__进销存卡片__接收登记__05A3D694] DEFAULT (0x00) FOR [接收登记]
GO

ALTER TABLE [dbo].[采购订单] WITH NOCHECK ADD 
	CONSTRAINT [PK_采购订单_1] PRIMARY KEY  CLUSTERED 
	(
		[内部编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[采购订单o] WITH NOCHECK ADD 
	CONSTRAINT [DF_采购订单_采购数量] DEFAULT (0) FOR [采购数量],
	CONSTRAINT [PK_采购订单] PRIMARY KEY  CLUSTERED 
	(
		[内部编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[领料单] WITH NOCHECK ADD 
	CONSTRAINT [DF_领料单_源仓区] DEFAULT ('') FOR [源仓区],
	CONSTRAINT [DF_领料单_源仓位] DEFAULT ('') FOR [源仓位],
	CONSTRAINT [DF_领料单_目的仓区] DEFAULT ('') FOR [目的仓区],
	CONSTRAINT [DF_领料单_目的仓位] DEFAULT ('') FOR [目的仓位],
	CONSTRAINT [DF_领料单_申请数量] DEFAULT (0) FOR [申请数量],
	CONSTRAINT [DF_领料单_实领数量] DEFAULT (0) FOR [实领数量],
	CONSTRAINT [DF_领料单_领料类别] DEFAULT ('') FOR [领料类别]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.V物料主文件
AS
SELECT 物料名称, 拼音编码, 计量单位, 规格型号, 计划类别, 状态类别, 归属类别, 价值类别, 
      进货提前期, 准备周期, 生产周期, 库存期限, 物料编号
FROM dbo.物料主文件

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create view v商品库存明细 as 
(
	select k.*,x.效期,x.有效天数 from 库存库 as k left join 效期对照表 as x on k.货号=x.货号 and k.批号=x.批号
)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW v资源清单
AS
(
	select 编号,名称,拼音编码,最大工时*数量*6 as 最大工时,额定工时*数量*6 as 额定工时,最小工时*数量*6 as 最小工时,数量 from 资源清单
)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW v资源负荷报表
AS
(
	select 资源编号,日期,年份,计划期,sum(负荷) as 负荷 from 
	(	
		select 资源编号,日期,年份,计划期,负荷 from 临时资源负荷报表
		union all
		select 资源编号,日期,年份,计划期,负荷 from 资源负荷报表
		union all
		select 资源编号,日期,年份,计划期,负荷 from 临时生产件资源负荷报表
		union all
		select 资源编号,日期,年份,计划期,负荷 from 生产件资源负荷报表
	) as a group by 资源编号,日期,年份,计划期
	
)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE SF_cg2审核采购订单 @记帐人 char(10) = NULL
AS
begin transaction
	--修改订货合同
	update 订货合同历史 set 
			送货数量=送货数量+all数量
		from 
		(
		select sum(订货数量) as all数量, 合同编号
			from 采购订单审核 where 审单人=@记帐人 and 订单状态 = '通过'
			group by 合同编号
		) as j
		where 订货合同历史.编号=j.合同编号 
	--将采购订单倒到采购订单发布表中，待发---------------------------------------------
	if (select  count(*) from 发布项清单 where  ( 零售= '1' or 库房= '1' ) and 方式='发送' and 表名='采购订单发布')>0
		INSERT INTO 采购订单发布 SELECT * FROM 采购订单审核 where 审单人=@记帐人 and 订单状态 = '通过'
	update 采购订单审核 set 订单状态 = '未完成' where 审单人=@记帐人 and 订单状态 = '通过'
	INSERT INTO 采购订单历史 SELECT * FROM 采购订单审核 where 审单人=@记帐人 and 订单状态 = '未完成'
commit
GO

CREATE PROCEDURE SF_cg5订货合同计划登记 @记帐人 char(10) = NULL
AS
begin transaction
	declare @maxid INT
	DECLARE @IDCHAR CHAR(14)
	declare @year int 
	select @year = datepart(YEAR,getdate())
	--以下程序，从OBJTABLE中找到编号，并将编号附给订货合同--------------------
	select @IDCHAR = max(编号) from 订货合同历史 with(TABLOCKX)
	if @IDCHAR is null	--没找到，表明没有记录
	begin
		select @maxid = 1
	end
	ELSE			--找到最大编号
	BEGIN
		select @maxid = convert(int,SUBSTRING(@IDCHAR,6,6))+1
		IF @YEAR > CONVERT(INT,SUBSTRING(@IDCHAR,2,4)) 
			SELECT @MAXID = 1 
		ELSE IF (@YEAR < CONVERT(INT,SUBSTRING(@IDCHAR,2,4)) )
		BEGIN
			RAISERROR('机器年度比编号中的年度早，出错',16,1)	--机器年度比编号中的年度早，出错
		END
	END
	declare mycursor cursor for select 内部编号,编号 FROM 订货合同 where 记帐人=@记帐人 order by 内部编号
	OPEN MYCURSOR
	declare @id int
	declare @bh char(14)
	FETCH next from  mycursor into @id,@bh
	WHILE (@@FETCH_STATUS = 0 )
	BEGIN
		SELECT @IDCHAR = CONVERT(CHAR(6),@maxid)
		update 订货合同 SET 编号='合'+convert(char(4),@YEAR)
				+REPLICATE('0',6-LEN(@IDCHAR))+@IDCHAR
			where current of mycursor
		select @maxid = @maxid+1
		FETCH next from  mycursor into @id,@bh
	END
	close mycursor
	deallocate mycursor

	--处理单据号
	SELECT @IDCHAR = NULL
	select @IDCHAR = max(单据号) from  订货合同历史 with(TABLOCKX)
	if @IDCHAR is null	--没找到，表明没有记录
	begin
		select @maxid = 1
	end
	ELSE			--找到最大编号
	BEGIN
		select @maxid = convert(int,SUBSTRING(@IDCHAR,5,6))+1
		IF @YEAR > CONVERT(INT,SUBSTRING(@IDCHAR,1,4)) 
			SELECT @MAXID = 1 
		ELSE IF (@YEAR < CONVERT(INT,SUBSTRING(@IDCHAR,1,4)) )
		BEGIN
			RAISERROR('机器年度比编号中的年度早，出错',16,1)	--机器年度比编号中的年度早，出错
		END
	END
	SELECT @IDCHAR = CONVERT(CHAR(6),@maxid)
	update 订货合同 SET 单据号=convert(char(4),@YEAR)
				+REPLICATE('0',6-LEN(@IDCHAR))+@IDCHAR
			where 记帐人=@记帐人

	--将订货合同倒到订货合同历史表中--------------------------------------------------
	update 订货合同 set 送货数量=0 where 记帐人=@记帐人
	INSERT INTO 订货合同历史 SELECT * FROM 订货合同 where 记帐人=@记帐人
	--将订货合同倒到订货合同发布表中，待发---------------------------------------------
	if (select  count(*) from 发布项清单 where  ( 零售= '1' or 库房= '1' ) and 方式='发送' and 表名='订货合同发布')>0
		INSERT INTO 订货合同发布 SELECT * FROM 订货合同 where 记帐人=@记帐人
	--将订货合同删除
	delete FROM 订货合同 WHERE 记帐人=@记帐人
commit
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE SYS清采购订单 @记帐人 char(10) = NULL
AS
begin transaction
	delete FROM 采购订单 WHERE 记帐人=@记帐人 and 订货数量>0
commit
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

--采购订单审核的订单状态有：未审、通过、不通过、返回、修改
CREATE PROCEDURE SYS清采购订单审核 @记帐人 char(10) = NULL
AS
begin transaction
	delete FROM 采购订单审核 WHERE 审单人=@记帐人 and 订单状态 = '未完成'
	update 采购订单审核 set 订单状态 = '返回' WHERE 审单人=@记帐人 and 订单状态 = '不通过'
commit
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE mrp计算old 
(@物料编号 char(14),@年份 int,@计划期 int,@计划代码 char(5),@需求数量 decimal(18,4),@建议生产 decimal(18,4) output)
AS
begin tran

SET ANSI_NULLS OFF 
declare  @期初库存   decimal(18,4),
              @预计采购  decimal(18,4),
              @预计生产  decimal(18,4),
              @预计外协  decimal(18,4),
              @预计出库  decimal(18,4),
              @预计领用  decimal(18,4),
              @预计入库  decimal(18,4),
              @建议采购  decimal(18,4),
              @建议外协  decimal(18,4),
              @安全库存  decimal(18,4),
              @预计库存  decimal(18,4),
              @上一年份         int,
              @上一计划期     int   

select     @期初库存=0,
              @预计采购=0,
              @预计生产=0,
              @预计外协=0,
              @预计领用=0,
              @建议采购=0,
              @建议生产=0,
              @建议外协=0,
         --     @建议领用=0,
              @预计库存=0


if (not exists(select * from mrp0 where 物料编号=@物料编号 and 年份=@年份 and 计划期=@计划期))
begin
     if @计划期=1
     begin
          select      @上一年份=@年份-1
          select      @上一计划期=(select max(计划期) from 工厂日历 where 年份=@上一年份)
    end
    else
     begin
          select      @上一年份=@年份
          select      @上一计划期=@计划期-1
    end   


    if  (not exists(select * from mrp0 where 物料编号=@物料编号 and 年份=@上一年份 and 计划期=@上一计划期))
    begin
           select    @期初库存 =库存数量     from    库存库       where    货号=@物料编号
         
           if(@计划代码='wg')
          begin  
                 select    @预计采购=sum(剩余数量)
                 from      采购订单
                 where   物料编号=@物料编号  and  (年份<=@年份  or (年份=@年份 and 计划期<=@计划期)) 
          end 
          if(@计划代码='bcp')
          begin  
              select    @预计生产=sum(剩余数量)
               from      生产订单
               where  物料编号=@物料编号  and  (年份<=@年份  or (年份=@年份 and 计划期<=@计划期)) 
          end 
         /*
           if(@计划代码='wx')
           begin  
                select    @预计外协=sum(剩余数量)
                 from      外协订单
                 where   物料编号=@物料编号      and  (年份<=@年份  or (年份=@年份 and 计划期<=@计划期)) 
           end 

           select    @预计领用=sum(剩余数量)
           from       生产领料单
           where    物料编号=@物料编号       and  (年份<=@年份  or (年份=@年份 and 计划期<=@计划期)) 
         */
         
    end
    else
    begin
           select    @期初库存 =预计库存
            from       mrp0
           where    物料编号=@物料编号   and 年份=@上一年份  and  计划期=@上一计划期
         
           if(@计划代码='wg')
          begin  
               select    @预计采购=sum(剩余数量)
                from      采购订单
                where   物料编号=@物料编号     and  年份=@年份  and 计划期=@计划期 
          end 
          if(@计划代码='bcp')
          begin  
              select    @预计生产=sum(剩余数量)
               from      生产订单
               where   物料编号=@物料编号    and  年份=@年份  and 计划期=@计划期 
          end 
       /*
          if(@计划代码='wx')
        begin  
             select    @预计外协=sum(剩余数量)
              from      外协订单
              where   物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期 
         end 

           select    @预计领用=sum(剩余数量)
           from       生产领料单
          where    物料编号=@物料编号   and  年份=@年份  and 计划期=@计划期 
          */
    end        --是否第一期的 if begin end else begin  end
      

          select  @安全库存=最低库存  from 物料主文件 where 物料编号=@物料编号
          select  @预计出库=isnull(@预计领用,0)
          select  @预计入库=isnull(@预计采购,0)+isnull(@预计生产,0)+isnull(@预计外协,0)
          Insert into mrp0 (   物料编号,    年份,    计划期, 期初库存,                   预计入库 ,   预计出库,    安全库存)
                        values (@物料编号,@年份,@计划期,isnull(@期初库存,0),@预计入库,@预计出库,@安全库存)        

end           --假如没有存在该期数据的 if begin end

--Update  mrp0   set  需求数量=需求数量+@需求数量
    
if  @计划代码='wg'
begin
     select   @建议采购=isnull(@需求数量,0) - (isnull(期初库存,0)-isnull(安全库存,0)+isnull(预计入库,0))
                                                          +(isnull(预计出库,0)+isnull(需求数量,0))
                                                          -(isnull(建议采购,0)+isnull(建议生产,0)+isnull(建议外协,0))
        from   mrp0   where   物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期 
       if   @建议采购<0   select    @建议采购=0
end

if  @计划代码='bcp'
begin
        select   @建议生产=isnull(@需求数量,0) - (isnull(期初库存,0)-isnull(安全库存,0)+isnull(预计入库,0))
                                                          +(isnull(预计出库,0)+isnull(需求数量,0))
                                                          -(isnull(建议采购,0)+isnull(建议生产,0)+isnull(建议外协,0))
        from   mrp0   where   物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期 
         if   @建议生产<0   select    @建议生产=0
end

if  @计划代码='wx'
begin
        select   @建议外协=isnull(@需求数量,0) - (isnull(期初库存,0)-isnull(安全库存,0)+isnull(预计入库,0))
                                                          +(isnull(预计出库,0)+isnull(需求数量,0))
                                                          -(isnull(建议采购,0)+isnull(建议生产,0)+isnull(建议外协,0))
        from   mrp0   where   物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期 
     
         if   @建议外协<0   select    @建议外协=0
end

   update   mrp0
      set      需求数量=isnull(需求数量,0)+isnull(@需求数量,0),
                 建议采购=isnull(建议采购,0)+isnull(@建议采购,0),
                 建议生产=isnull(建议生产,0)+isnull(@建议生产,0),
                 建议外协=isnull(建议外协,0)+isnull(@建议外协,0)
   where   物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期


  update   mrp0
      set      预计库存=isnull(期初库存,0)+isnull(预计入库,0)-isnull(预计出库,0)
                                  -isnull(需求数量,0)+isnull(建议采购,0)+isnull(建议生产,0)+isnull(建议外协,0)
   where    物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期



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


CREATE PROCEDURE   sf_cg1删除全部未用项  @记帐人  char(10)=null
 AS
begin tran

         delete    from   采购订单  where    订货数量=0  and 记帐人=@记帐人

commit tran
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sf_cg1取得采购项  @记帐人  char(10)=null
AS
begin  transaction

             declare       @年份 int,@计划期 int ,@max期 int,@期数 int,@aDateString Char(10),@aDateInt int

             select         @aDateString=convert(char(10),getdate(),20)
             select         @aDateString=substring(@aDateString,1,4)+substring(@aDateString,6,2)+substring(@aDateString,9,2)
             select         @aDateInt= convert(int, @aDateString)

             select         @期数=5             --取得近几个计划期内需要采购的物料编号,暂定 5
             select         @年份=年份, 
                               @计划期 =计划期 
              from            工厂日历
              where        @aDateInt<=结束日期  and  @aDateInt>=开始日期
             
              select         @max期=max(计划期)  from 工厂日历  where  年份=@年份
 
             if(@计划期>@max期-@期数)
                     select   @年份=@年份+1,@计划期=@期数-(@max期-@计划期)
             else   
                     select   @计划期=@计划期+@期数

	insert into    采购订单 (物料编号,供货商号,订货数量,记帐人)
	select          distinct  a.物料编号,isnull(b.指定供货商,'-1'),    0,   @记帐人
	from             mrp正式 as a
                	      inner join 物料主文件 as b on a.物料编号=b.物料编号
	where          a.计划投入>0  
                       and    b.计划类别='wg'
                       and    (a.年份<@年份  or ( a.年份=@年份 and  a.计划期<=@计划期) )
                       and    a.物料编号 not in (select distinct  物料编号 from  采购订单 where 记帐人=@记帐人)

commit transaction
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sf_cg1填写采购订单 @记帐人 char(10) = NULL
AS
begin transaction
	declare @maxid INT
	DECLARE @IDCHAR CHAR(14)
	DECLARE @IDCHAR1 CHAR(14)
	declare @year int 
	select @year = datepart(YEAR,getdate())
	--以下程序，从OBJTABLE中找到编号，并将编号附给采购订单--------------------
	select @IDCHAR = max(编号) from 采购订单历史 with(TABLOCKX) where 编号 like '订%'
	select @IDCHAR1 = max(编号) from 采购订单审核 with(tablockx) where 编号 like '订%'
	if @IDCHAR is null and @IDCHAR1 is not null
	begin
		select @IDCHAR = @IDCHAR1
	end
	if @IDCHAR1 > @IDCHAR 
	begin
		select @IDCHAR = @IDCHAR1
	end
	if @IDCHAR is null	--没找到，表明没有记录
	begin
		select @maxid = 1
	end
	ELSE			--找到最大编号
	BEGIN
		select @maxid = convert(int,SUBSTRING(@IDCHAR,6,6))+1
		IF @YEAR > CONVERT(INT,SUBSTRING(@IDCHAR,2,4)) 
			SELECT @MAXID = 1 
		ELSE IF (@YEAR < CONVERT(INT,SUBSTRING(@IDCHAR,2,4)) )
		BEGIN
			RAISERROR('机器年度比编号中的年度早，出错',16,1)	--机器年度比编号中的年度早，出错
		END
	END
	declare mycursor cursor for select 内部编号,编号 FROM 采购订单 where 记帐人=@记帐人 -- order by 内部编号 
	OPEN MYCURSOR
	declare @id int
	declare @bh char(14)
	FETCH next from  mycursor into @id,@bh
	WHILE (@@FETCH_STATUS = 0 )
	BEGIN
		SELECT @IDCHAR = CONVERT(CHAR(6),@maxid)
		update 采购订单 SET 编号='订'+convert(char(4),@YEAR)
				+REPLICATE('0',6-LEN(@IDCHAR))+@IDCHAR
			where current of mycursor
		select @maxid = @maxid+1
		FETCH next from  mycursor into @id,@bh
	END
	close mycursor
	deallocate mycursor
	--处理单据号
	SELECT @IDCHAR = NULL
	select @IDCHAR = max(单据号) from  采购订单历史 with(TABLOCKX)
	if @IDCHAR is null	--没找到，表明没有记录
	begin
		select @maxid = 1
	end
	ELSE			--找到最大编号
	BEGIN
		select @maxid = convert(int,SUBSTRING(@IDCHAR,5,6))+1
		IF @YEAR > CONVERT(INT,SUBSTRING(@IDCHAR,1,4)) 
			SELECT @MAXID = 1 
		ELSE IF (@YEAR < CONVERT(INT,SUBSTRING(@IDCHAR,1,4)) )
		BEGIN
			RAISERROR('机器年度比编号中的年度早，出错',16,1)	--机器年度比编号中的年度早，出错
		END
	END
	SELECT @IDCHAR = CONVERT(CHAR(6),@maxid)
	update 采购订单 SET 单据号=convert(char(4),@YEAR)
				+REPLICATE('0',6-LEN(@IDCHAR))+@IDCHAR
			where 记帐人=@记帐人
	update 采购订单 SET 记帐日期=datepart(yyyy,getdate())*10000+datepart(mm,getdate())*100+datepart(dd,getdate())
		where 记帐人=@记帐人 and 记帐日期 is null
	-- 是否审核
	declare @parameter int
	select @parameter=参数 from 运行参数表 where 参数名称='审采购订单'
	select @parameter = case when @parameter is null then 0 else @parameter end
	if(@parameter = 1)
	begin 
		update 采购订单 set 送货数量=0, 订单状态='未审' where 记帐人=@记帐人
		--将采购订单倒到采购订单历史表中--------------------------------------------------
		update 采购订单 set 订货日期 = 记帐日期 where 订货日期 is null and 记帐人=@记帐人
		insert into 采购订单审核 select * from 采购订单 where 记帐人=@记帐人 and 订货数量>0
	end
	else    -- 不审核
	begin
	--将采购订单倒到采购订单历史表中--------------------------------------------------
		update 采购订单 set 送货数量=0, 订单状态='未完成' where 记帐人=@记帐人
		update 采购订单 set 订货日期 = 记帐日期 where 订货日期 is null and 记帐人=@记帐人
		--修改订货合同
		update 订货合同历史 set 
				送货数量=送货数量+all数量
			from 
			(
			select sum(订货数量) as all数量, 合同编号
				from 采购订单 where 记帐人=@记帐人
				group by 合同编号
			) as j
			where 订货合同历史.编号=j.合同编号 
		INSERT INTO 采购订单历史 SELECT * FROM 采购订单 where 记帐人=@记帐人 and 订货数量>0
	end
commit
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sf_cg3修改采购订单 @记帐人 char(10) = NULL
AS
begin transaction
	update 采购订单审核 set 订单状态 = '未审' WHERE 记帐人=@记帐人 and 订单状态 = '修改'
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


CREATE PROCEDURE sf_cj1填生产订单 @记帐人 char(10)=null
AS
begin transaction
	declare @maxid INT
	DECLARE @IDCHAR CHAR(14)
	declare @year int 
	select @year = datepart(YEAR,getdate())
	--以下程序，从OBJTABLE中找到编号
	select @IDCHAR = max(编号)from 生产订单审核
	if @IDCHAR is null	--没找到，表明没有记录
	begin
		select @maxid = 1
	end
	ELSE			--找到最大编号
	BEGIN
		select @maxid = convert(int,SUBSTRING(@IDCHAR,6,6))+1
		IF @YEAR > CONVERT(INT,SUBSTRING(@IDCHAR,2,4)) 
			SELECT @MAXID = 1 
		ELSE IF (@YEAR < CONVERT(INT,SUBSTRING(@IDCHAR,2,4)) )
		BEGIN
			RAISERROR('机器年度比编号中的年度早，出错',16,10)	--机器年度比编号中的年度早，出错
		END
	END
	declare mycursor cursor for select zsc.内部编号 FROM 生产订单 as zsc,选择记帐记录表 as xzjz where zsc.记帐人=@记帐人 
		and zsc.状态='填写' and xzjz.记帐人=@记帐人 and xzjz.操作文件名='cj1填生产订单' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1 order by zsc.内部编号
	OPEN MYCURSOR
	declare @id int
	declare @bh char(14)
	FETCH next from  mycursor into @id
	WHILE (@@FETCH_STATUS = 0 )
	BEGIN
		SELECT @IDCHAR = CONVERT(CHAR(6),@maxid)
		update 生产订单 SET 编号='产'+convert(char(4),@YEAR)
				+REPLICATE('0',6-LEN(@IDCHAR))+@IDCHAR
			where 内部编号=@id--current of mycursor
		select @maxid = @maxid+1
		FETCH next from  mycursor into @id
	END
	close mycursor
	deallocate mycursor
	
	--处理单据号
	SELECT @IDCHAR = NULL
	select @IDCHAR = max(单据号) from  生产订单审核
	if @IDCHAR is null	--没找到，表明没有记录
	begin
		select @maxid = 1
	end
	ELSE			--找到最大编号
	BEGIN
		select @maxid = convert(int,SUBSTRING(@IDCHAR,5,6))+1
		IF @YEAR > CONVERT(INT,SUBSTRING(@IDCHAR,1,4)) 
			SELECT @MAXID = 1 
		ELSE IF (@YEAR < CONVERT(INT,SUBSTRING(@IDCHAR,1,4)) )
		BEGIN
			RAISERROR(50002,16,10)	--机器年度比编号中的年度早，出错
		END
	END
	SELECT @IDCHAR = CONVERT(CHAR(6),@maxid)
	update 生产订单 SET 单据号=convert(char(4),@YEAR)+REPLICATE('0',6-LEN(@IDCHAR))+@IDCHAR
			FROM 生产订单 as zsc,选择记帐记录表 as xzjz where zsc.记帐人=@记帐人 and zsc.状态='填写' and xzjz.记帐人=@记帐人
				 and xzjz.操作文件名='cj1填生产订单' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1 

	INSERT INTO 生产订单审核(MPS编号,编号,单据号,生产批号,物料编号,年份,计划期,数量,生产部门,下达日期,要求完成日期,完成数量,剩余数量,记帐人,
				记帐日期,审核人,审核日期,修改标记,接收登记,状态,备注) 
			SELECT zsc.MPS编号,zsc.编号,zsc.单据号,zsc.生产批号,zsc.物料编号,zsc.年份,zsc.计划期,zsc.数量,zsc.生产部门,zsc.下达日期,
				zsc.要求完成日期,zsc.完成数量,zsc.剩余数量,zsc.记帐人,zsc.	记帐日期,zsc.审核人,zsc.审核日期,zsc.修改标记,zsc.接收登记,zsc.状态,zsc.备注
			FROM 生产订单 as zsc,选择记帐记录表 as xzjz where zsc.记帐人=@记帐人 and zsc.状态='填写' and xzjz.记帐人=@记帐人
				 and xzjz.操作文件名='cj1填生产订单' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1 

	update 生产订单 set 状态='待审' from 生产订单 as zsc,选择记帐记录表 as xzjz where zsc.记帐人=@记帐人 and zsc.状态='填写' and xzjz.记帐人=@记帐人
				 and xzjz.操作文件名='cj1填生产订单' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1 

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


CREATE PROCEDURE sf_cj2审生产订单 @记帐人 char(10)=null
AS
begin transaction
	update 生产订单 set 状态='执行中' from 生产订单 as zsc,选择记帐记录表 as xzjz where zsc.审核人=@记帐人  and zsc.状态='通过' 
		and xzjz.记帐人=@记帐人 and xzjz.操作文件名='cj2审生产订单' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1

	insert into 生产订单历史 (MPS编号,编号,单据号,生产批号,物料编号,年份,计划期,数量,生产部门,下达日期,要求完成日期,完成数量,剩余数量,记帐人,
				记帐日期,审核人,审核日期,修改标记,接收登记,状态,备注) 
			SELECT zsc.MPS编号,zsc.编号,zsc.单据号,zsc.生产批号,zsc.物料编号,zsc.年份,zsc.计划期,zsc.数量,zsc.生产部门,zsc.下达日期,
				zsc.要求完成日期,zsc.完成数量,zsc.剩余数量,zsc.记帐人,zsc.	记帐日期,zsc.审核人,zsc.审核日期,zsc.修改标记,zsc.接收登记,zsc.状态,zsc.备注
			FROM 生产订单 as zsc,选择记帐记录表 as xzjz where zsc.记帐人=@记帐人 and zsc.状态='执行中' and xzjz.记帐人=@记帐人
				 and xzjz.操作文件名='cj2审生产订单' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1 

	delete from 生产订单 where 状态='执行中' and 审核人=@记帐人

	update 生产订单 set 状态='返回' from 生产订单 as zsc,选择记帐记录表 as xzjz where zsc.审核人=@记帐人  and zsc.状态='不通过' 
			and xzjz.记帐人=@记帐人 and xzjz.操作文件名='cj2审生产订单' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1

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


CREATE PROCEDURE sf_cj5填完工报告单 @记帐人 char(10)=null
AS
begin transaction
	declare @maxid INT
	DECLARE @IDCHAR CHAR(14)
	declare @year int 
	select @year = datepart(YEAR,getdate())
	--以下程序，从OBJTABLE中找到编号
	select @IDCHAR = max(编号)from 完工报告单历史
	if @IDCHAR is null	--没找到，表明没有记录
	begin
		select @maxid = 1
	end
	ELSE			--找到最大编号
	BEGIN
		select @maxid = convert(int,SUBSTRING(@IDCHAR,6,6))+1
		IF @YEAR > CONVERT(INT,SUBSTRING(@IDCHAR,2,4)) 
			SELECT @MAXID = 1 
		ELSE IF (@YEAR < CONVERT(INT,SUBSTRING(@IDCHAR,2,4)) )
		BEGIN
			RAISERROR('机器年度比编号中的年度早，出错',16,10)	--机器年度比编号中的年度早，出错
		END
	END
	declare mycursor cursor for select zsc.内部编号 FROM 完工报告单 as zsc,选择记帐记录表 as xzjz where zsc.记帐人=@记帐人 
		and zsc.状态='填写' and xzjz.记帐人=@记帐人 and xzjz.操作文件名='cj5填完工报告单' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1 order by zsc.内部编号
	OPEN MYCURSOR
	declare @id int
	declare @bh char(14)
	FETCH next from  mycursor into @id
	WHILE (@@FETCH_STATUS = 0 )
	BEGIN
		SELECT @IDCHAR = CONVERT(CHAR(6),@maxid)
		update 完工报告单 SET 编号='报'+convert(char(4),@YEAR)
				+REPLICATE('0',6-LEN(@IDCHAR))+@IDCHAR
			where 内部编号=@id--current of mycursor
		select @maxid = @maxid+1
		FETCH next from  mycursor into @id
	END
	close mycursor
	deallocate mycursor
	
	--处理单据号
	SELECT @IDCHAR = NULL
	select @IDCHAR = max(单据号) from  完工报告单历史
	if @IDCHAR is null	--没找到，表明没有记录
	begin
		select @maxid = 1
	end
	ELSE			--找到最大编号
	BEGIN
		select @maxid = convert(int,SUBSTRING(@IDCHAR,5,6))+1
		IF @YEAR > CONVERT(INT,SUBSTRING(@IDCHAR,1,4)) 
			SELECT @MAXID = 1 
		ELSE IF (@YEAR < CONVERT(INT,SUBSTRING(@IDCHAR,1,4)) )
		BEGIN
			RAISERROR(50002,16,10)	--机器年度比编号中的年度早，出错
		END
	END
	SELECT @IDCHAR = CONVERT(CHAR(6),@maxid)
	update 完工报告单 SET 单据号=convert(char(4),@YEAR)+REPLICATE('0',6-LEN(@IDCHAR))+@IDCHAR,批次=编号,修改标记='2'
			FROM 完工报告单 as zsc,选择记帐记录表 as xzjz where zsc.记帐人=@记帐人 and zsc.状态='填写' and xzjz.记帐人=@记帐人
				 and xzjz.操作文件名='cj5填完工报告单' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1 

	update 生产订单历史 set 完成数量=ddls.完成数量+zsc.完成数量,修改标记='2' from 完工报告单 as zsc,选择记帐记录表 as xzjz,生产订单历史 as ddls
		 where zsc.记帐人=@记帐人 and zsc.状态='填写' and xzjz.记帐人=@记帐人 and xzjz.操作文件名='cj5填完工报告单' 
			and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1 and ddls.编号=zsc.生产单号
	
	update 生产订单历史 set 剩余数量=数量-完成数量 where 修改标记='2'

	update 生产订单历史 set 状态='完成',修改标记='1' where 修改标记='2' and 完成数量>=数量
	
	insert into 完工报告单历史 (编号,单据号,生产单号,物料编号,批号,批次,填报日期,完成数量,记帐人,记帐日期,修改标记,验收结论,验收日期,验收员,保管员,
			接收登记,状态,备注)
		select zsc.编号,zsc.单据号,zsc.生产单号,zsc.物料编号,zsc.批号,zsc.批次,zsc.填报日期,zsc.完成数量,zsc.记帐人,zsc.记帐日期,zsc.修改标记,zsc.验收结论,
				zsc.验收日期,zsc.验收员,zsc.保管员,zsc.接收登记,zsc.状态,zsc.备注 from 完工报告单 as zsc,选择记帐记录表 as xzjz 
					where zsc.记帐人=@记帐人 and zsc.状态='填写' and xzjz.记帐人=@记帐人 and xzjz.操作文件名='cj5填完工报告单' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1 
	
	delete from 完工报告单 where 修改标记='2' and 记帐人=@记帐人
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


CREATE PROCEDURE sf_cj5由MRP生成生产订单 @记帐人 char(10)=null
AS
begin transaction
	--declare @记帐人 char(10)
	declare @rq int
	--select @记帐人='sys'
	select @rq=datepart(yyyy,getdate())*10000+datepart(mm,getdate())*100+datepart(dd,getdate())
	insert into 生产订单(MPS编号,物料编号,年份,计划期,数量,下达日期,要求完成日期,记帐人,记帐日期,修改标记,状态,备注)	
		select 'MRP-'+mrp.发布编号,mrp.物料编号,mrp.年份,mrp.计划期,mrp.净需求,@rq,gcrl.结束日期,@记帐人,@rq,'1','填写','由MRP生成' 
			from MRP历史 as mrp,物料主文件 as wlz,工厂日历 as gcrl where mrp.物料编号=wlz.物料编号 and wlz.计划类别='bcp' 
				and mrp.年份=gcrl.年份 and mrp.计划期=gcrl.计划期 and mrp.生产订单标记='0' and mrp.净需求>0
	update MRP历史 set 生产订单标记='1' from MRP历史 as mrp,物料主文件 as wlz where mrp.物料编号=wlz.物料编号
		and wlz.计划类别='bcp' and 生产订单标记='0'
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


CREATE PROCEDURE sf_kf1填成品入库单 @记帐人 char(10)=null
AS
begin transaction
	--declare @记帐人 char(10)
	--select @记帐人='sys'
	declare @maxid INT
	DECLARE @IDCHAR CHAR(14)
	declare @year int 
	select @year = datepart(YEAR,getdate())
	--以下程序，从OBJTABLE中找到编号
	select @IDCHAR = max(编号)from 产品入库单历史
	if @IDCHAR is null	--没找到，表明没有记录
	begin
		select @maxid = 1
	end
	ELSE			--找到最大编号
	BEGIN
		select @maxid = convert(int,SUBSTRING(@IDCHAR,6,6))+1
		IF @YEAR > CONVERT(INT,SUBSTRING(@IDCHAR,2,4)) 
			SELECT @MAXID = 1 
		ELSE IF (@YEAR < CONVERT(INT,SUBSTRING(@IDCHAR,2,4)) )
		BEGIN
			RAISERROR('机器年度比编号中的年度早，出错',16,10)	--机器年度比编号中的年度早，出错
		END
	END
	declare mycursor cursor for select 内部编号 FROM 产品入库单 where 记帐人=@记帐人 order by 内部编号
	OPEN MYCURSOR
	declare @id int
	declare @bh char(14)
	FETCH next from  mycursor into @id
	WHILE (@@FETCH_STATUS = 0 )
	BEGIN
		SELECT @IDCHAR = CONVERT(CHAR(6),@maxid)
		update 产品入库单 SET 编号='入'+convert(char(4),@YEAR)
				+REPLICATE('0',6-LEN(@IDCHAR))+@IDCHAR
			where 内部编号=@id--current of mycursor
		select @maxid = @maxid+1
		FETCH next from  mycursor into @id
	END
	close mycursor
	deallocate mycursor
	
	--处理单据号
	SELECT @IDCHAR = NULL
	select @IDCHAR = max(单据号) from  产品入库单历史
	if @IDCHAR is null	--没找到，表明没有记录
	begin
		select @maxid = 1
	end
	ELSE			--找到最大编号
	BEGIN
		select @maxid = convert(int,SUBSTRING(@IDCHAR,5,6))+1
		IF @YEAR > CONVERT(INT,SUBSTRING(@IDCHAR,1,4)) 
			SELECT @MAXID = 1 
		ELSE IF (@YEAR < CONVERT(INT,SUBSTRING(@IDCHAR,1,4)) )
		BEGIN
			RAISERROR(50002,16,10)	--机器年度比编号中的年度早，出错
		END
	END
	SELECT @IDCHAR = CONVERT(CHAR(6),@maxid)
	update 产品入库单 SET 单据号=convert(char(4),@YEAR)+REPLICATE('0',6-LEN(@IDCHAR))+@IDCHAR,批次=编号
			FROM 产品入库单 where 记帐人=@记帐人

	INSERT INTO 产品入库单历史(生产单号,编号,单据号,源仓区,源仓位,目的仓区,目的仓位,物料编号,批号,效期,批次,库存成本单价,批次成本单价,到货数量,入库数量,拒收数量,验收结论,到货日期,验收日期,验收员,保管员,记帐人,记帐日期,状态,备注)
		SELECT 生产单号,编号,单据号,源仓区,源仓位,目的仓区,目的仓位,物料编号,批号,效期,批次,库存成本单价,批次成本单价,到货数量,入库数量,拒收数量,验收结论,到货日期,验收日期,验收员,保管员,记帐人,记帐日期,状态,备注
		FROM 产品入库单 where 记帐人=@记帐人


	DELETE FROM 临时进销存卡片 where 记帐人=@记帐人
	INSERT INTO 临时进销存卡片(部门,组别,货号,批号,摘要,单据号,日期,入库数量,入库金额,成本单价,影响部门,影响组别,记帐人)
		(SELECT J.目的仓区,J.目的仓位,J.物料编号,J.批号,'按生产单从'+J.源仓区+'入库到'+J.目的仓区,J.编号,J.记帐日期,j.入库数量,j.入库数量*j.批次成本单价,
			j.批次成本单价,j.目的仓区,j.目的仓位,j.记帐人 FROM 产品入库单 AS J 	where j.记帐人=@记帐人)

	--exec sf_加入进销存卡片 @记帐人

	insert into 库存库(货号,部门,组别,批号)
		select DISTINCT j.物料编号,j.目的仓区,j.目的仓位,j.批号 from 产品入库单 as j left join 库存库 as k on
		( j.目的仓区=k.部门 and j.目的仓位=k.组别 and  j.物料编号=k.货号 and  j.批号 = k.批号)	where j.记帐人 = @记帐人 and k.货号 is null

	UPDATE 库存库 SET 库存单价=
					case when 库存数量<=0 or (库存数量+数量ALL)<=0 then 进货单价
					else
					(库存金额+合计金额)/(库存数量+数量ALL)
					end ,
			库存数量=库存数量+数量ALL,
			库存金额=case when 库存数量<=0 or (库存数量+数量ALL)<=0 then 进货单价*(库存数量+数量ALL)
					else
					库存金额+合计金额
					end,
			库存库.最新进价=进货单价,
			修改标记='1'
		FROM 
		(SELECT 目的仓区,目的仓位,物料编号,批号,'数量ALL'=sum(入库数量),
			'合计金额'=sum(入库数量*批次成本单价),
			'进货单价'=
			case when sum(入库数量) =0 then  avg(批次成本单价) else
					sum(入库数量*批次成本单价)/sum(入库数量) end
					FROM 产品入库单	where 记帐人 = @记帐人 
			GROUP BY 目的仓区,目的仓位,物料编号,批号
		) AS LSJ
		WHERE  库存库.货号=LSj.物料编号 AND 库存库.批号=LSj.批号 AND 库存库.部门=LSJ.目的仓区 AND 库存库.组别=LSJ.目的仓位

	update 产品入库单 set 效期=效期*100+1 WHERE 记帐人=@记帐人 and 效期<999999
	INSERT INTO 效期对照表(货号,批号) SELECT 物料编号,批号 from 
		(SELECT DISTINCT 物料编号,批号,'物料编号批号'=rtrim(物料编号)+rtrim(批号) FROM 产品入库单 WHERE 记帐人=@记帐人) AS NO1
			WHERE NO1.物料编号批号 NOT IN 
				(SELECT rtrim(物料编号)+rtrim(批号) FROM 效期对照表)
	update 效期对照表 SET 效期=J.效期 from 产品入库单 AS J WHERE 效期对照表.货号=j.物料编号 and 效期对照表.批号=j.批号 and j.记帐人=@记帐人
	
	delete from 产品入库单 WHERE 记帐人=@记帐人
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


CREATE PROCEDURE sf_mps主生产计划审核 @记帐人 char(10)=null
AS
begin transaction
	
	update 临时资源负荷报表 set 负荷=负荷-aa.新负荷 from
		(select a.资源编号,a.年份,a.计划期,a.新负荷 from 
		(select xhde.资源编号,zsc.年份,zsc.计划期,zsc.MPS数量*xhde.资源需求量/生产批量 as 新负荷 from 主生产计划 as zsc,资源消耗定额 as xhde,选择记帐记录表 as xzjz
	 		where zsc.审核人=@记帐人  and (zsc.状态='通过' or zsc.状态='不通过') and zsc.物料编号=xhde.物料编号 and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps3审主生产计划' 
			and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1) as a ) as aa
				where 临时资源负荷报表.资源编号=aa.资源编号 and 临时资源负荷报表.年份=aa.年份 and 临时资源负荷报表.计划期=aa.计划期

	delete from 临时资源负荷报表 where 负荷=0

	insert into 资源负荷报表(资源编号,年份,计划期) 
		select a.资源编号,a.年份,a.计划期 from 
		(select xhde.资源编号,zsc.年份,zsc.计划期 from 主生产计划 as zsc,资源消耗定额 as xhde,选择记帐记录表 as xzjz
	 		where zsc.审核人=@记帐人 and zsc.状态='通过' and zsc.物料编号=xhde.物料编号 and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps3审主生产计划' 
			and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1) as a left join 资源负荷报表 as b
			on a.资源编号=b.资源编号 and a.年份=b.年份 and a.计划期=b.计划期 where b.资源编号 is null
	
	update 资源负荷报表 set 负荷=负荷+aa.新负荷 from
		(select a.资源编号,a.年份,a.计划期,a.新负荷 from 
		(select xhde.资源编号,zsc.年份,zsc.计划期,zsc.MPS数量*xhde.资源需求量/生产批量 as 新负荷 from 主生产计划 as zsc,资源消耗定额 as xhde,选择记帐记录表 as xzjz
	 		where zsc.审核人=@记帐人  and zsc.状态='通过'and zsc.物料编号=xhde.物料编号 and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps3审主生产计划' 
			and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1) as a ) as aa
				where 资源负荷报表.资源编号=aa.资源编号 and 资源负荷报表.年份=aa.年份 and 资源负荷报表.计划期=aa.计划期
	
	update 主生产计划 set 状态='已审' from 主生产计划 as zsc,选择记帐记录表 as xzjz where zsc.审核人=@记帐人  and zsc.状态='通过' 
		and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps3审主生产计划' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1

	insert into 生产订单(MPS编号,物料编号,年份,计划期,数量,要求完成日期,记帐人,记帐日期,修改标记,状态,备注)	
		select zsc.编号,zsc.物料编号,zsc.年份,zsc.计划期,zsc.MPS数量,zsc.结束日期,zsc.审核人,zsc.审核日期,'1','填写','由主生产计划生成'
			 from 主生产计划 as zsc,选择记帐记录表 as xzjz where zsc.审核人=@记帐人 
				and zsc.状态='已审'and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps3审主生产计划' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1

	insert into 主生产计划历史 (编号,物料编号,年份,计划期,开始日期,结束日期,期初库存,需求数量,MPS数量,生产单数量,预计库存,记帐人,修改日期,修改标记,
		 						审核人,审核日期,接收登记,状态,备注)
		select zsc.编号,zsc.物料编号,zsc.年份,zsc.计划期,zsc.开始日期,zsc.结束日期,zsc.期初库存,zsc.需求数量,zsc.MPS数量,zsc.生产单数量,zsc.预计库存,zsc.记帐人,zsc.修改日期,zsc.修改标记,
		 						zsc.审核人,zsc.审核日期,zsc.接收登记,zsc.状态,zsc.备注 from 主生产计划 as zsc,选择记帐记录表 as xzjz where zsc.审核人=@记帐人 
				and zsc.状态='已审'and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps3审主生产计划' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1

	delete from 主生产计划 where 记帐人=@记帐人 and 状态='已审'
	
	update 主生产计划 set 状态='返回' from 主生产计划 as zsc,选择记帐记录表 as xzjz where zsc.审核人=@记帐人  and zsc.状态='不通过' 
			and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps3审主生产计划' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1

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


CREATE PROCEDURE sf_mps主生产计划预排 @记帐人 char(10)=null
AS
begin transaction
/*	declare @wlbh char(14),@nf int,@jhq int,@mpssl float
	declare mycursor cursor for select 物料编号,年份,计划期,MPS数量 from 主生产计划 where 记帐人=@记帐人
	open mycursor
	fetch next from mycursor into @wlbh,@nf,@jhq,@mpssl
	while ( @@fetch_status=0 )
	begin
		--select @edscl=a.额定工时*b.生产批量/b.资源需求量 from 资源清单 as a,资源消耗定额 as b where a.编号=b.资源编号 and b.物料编号=@wlbh
		insert into 资源负荷报表 (资源编号,年份,计划期,负荷) 
		select 资源编号,@nf,@jhq,@mpssl*资源需求量/生产批量 from 资源消耗定额 where 物料编号=@wlbh
		fetch next from mycursor into @wlbh,@nf,@jhq,@mpssl
	end
	close mycursor
	deallocate mycursor

	---不用游标
	insert into 资源负荷报表(资源编号,年份,计划期) 
		select a.资源编号,a.年份,a.计划期 from 
		(select xhde.资源编号,zsc.年份,zsc.计划期 from 主生产计划 as zsc,资源消耗定额 as xhde
	 		where zsc.记帐人=@记帐人 and zsc.物料编号=xhde.物料编号) as a left join 资源负荷报表 as b
			on a.资源编号=b.资源编号 and a.年份=b.年份 and a.计划期=b.计划期 where b.资源编号 is null
	update 资源负荷报表 set 负荷=负荷+aa.新负荷 from
		(select a.资源编号,a.年份,a.计划期,a.新负荷 from 
		(select xhde.资源编号,zsc.年份,zsc.计划期,zsc.MPS数量*xhde.资源需求量/生产批量 as 新负荷 from 主生产计划 as zsc,资源消耗定额 as xhde
	 		where zsc.记帐人=@记帐人 and zsc.物料编号=xhde.物料编号) as a ) as aa
				where 资源负荷报表.资源编号=aa.资源编号 and 资源负荷报表.年份=aa.年份 and 资源负荷报表.计划期=aa.计划期
*/
	declare @maxid INT
	DECLARE @IDCHAR CHAR(14)
	declare @year int 
	select @year = datepart(YEAR,getdate())
	--以下程序，从OBJTABLE中找到编号，并将编号附给销售-------------------
	select @IDCHAR = max(编号)from 主生产计划预排历史
	if @IDCHAR is null	--没找到，表明没有记录
	begin
		select @maxid = 1
	end
	ELSE			--找到最大编号
	BEGIN
		select @maxid = convert(int,SUBSTRING(@IDCHAR,8,6))+1
		IF @YEAR > CONVERT(INT,SUBSTRING(@IDCHAR,4,4)) 
			SELECT @MAXID = 1 
		ELSE IF (@YEAR < CONVERT(INT,SUBSTRING(@IDCHAR,4,4)) )
		BEGIN
			RAISERROR('机器年度比编号中的年度早，出错',16,10)	--机器年度比编号中的年度早，出错
		END
	END
	declare mycursor cursor for select zsc.内部编号 FROM 主生产计划 as zsc,选择记帐记录表 as xzjz where zsc.记帐人=@记帐人 
		and zsc.状态='填写' and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps3填主生产计划' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1 order by zsc.内部编号
	OPEN MYCURSOR
	declare @id int
	declare @bh char(14)
	FETCH next from  mycursor into @id
	WHILE (@@FETCH_STATUS = 0 )
	BEGIN
		SELECT @IDCHAR = CONVERT(CHAR(6),@maxid)
		update 主生产计划 SET 编号='MPS'+convert(char(4),@YEAR)
				+REPLICATE('0',6-LEN(@IDCHAR))+@IDCHAR
			where 内部编号=@id--current of mycursor
		select @maxid = @maxid+1
		FETCH next from  mycursor into @id
	END
	close mycursor
	deallocate mycursor

	insert into 临时资源负荷报表(资源编号,年份,计划期) 
		select a.资源编号,a.年份,a.计划期 from 
		(select xhde.资源编号,zsc.年份,zsc.计划期 from 主生产计划 as zsc,资源消耗定额 as xhde,选择记帐记录表 as xzjz
	 		where zsc.记帐人=@记帐人 and zsc.状态='填写' and zsc.物料编号=xhde.物料编号 and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps3填主生产计划' 
			and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1) as a left join 临时资源负荷报表 as b
			on a.资源编号=b.资源编号 and a.年份=b.年份 and a.计划期=b.计划期 where b.资源编号 is null
	update 临时资源负荷报表 set 负荷=负荷+aa.新负荷 from
		(select a.资源编号,a.年份,a.计划期,a.新负荷 from 
		(select xhde.资源编号,zsc.年份,zsc.计划期,zsc.MPS数量*xhde.资源需求量/生产批量 as 新负荷 from 主生产计划 as zsc,资源消耗定额 as xhde,选择记帐记录表 as xzjz
	 		where zsc.记帐人=@记帐人  and zsc.状态='填写'and zsc.物料编号=xhde.物料编号 and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps3填主生产计划' 
			and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1) as a ) as aa
				where 临时资源负荷报表.资源编号=aa.资源编号 and 临时资源负荷报表.年份=aa.年份 and 临时资源负荷报表.计划期=aa.计划期
	INSERT INTO 主生产计划预排历史(物料编号,编号,年份,计划期,开始日期,结束日期,期初库存,需求数量,	MPS数量,生产单数量,预计库存,记帐人,修改日期,修改标记,审核人,审核日期,接收登记,状态,备注 
			) SELECT zsc.物料编号,zsc.编号,zsc.年份,zsc.计划期,zsc.开始日期,zsc.结束日期,zsc.期初库存,zsc.需求数量,
			zsc.MPS数量,zsc.生产单数量,zsc.预计库存,zsc.记帐人,zsc.修改日期,zsc.修改标记,zsc.审核人,zsc.审核日期,zsc.接收登记,zsc.状态,zsc.备注 
			FROM 主生产计划 as zsc,选择记帐记录表 as xzjz where zsc.记帐人=@记帐人 and zsc.状态='填写' and xzjz.记帐人=@记帐人 
			and xzjz.操作文件名='mps3填主生产计划' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1
	update 主生产计划 set 状态='待审' from 主生产计划 as zsc,选择记帐记录表 as xzjz where zsc.记帐人=@记帐人  and zsc.状态='填写' 
			and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps3填主生产计划' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1

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


CREATE PROCEDURE sf_mps填需求计划 @记帐人 char(10)=null
AS
begin transaction
	declare @maxid INT
	DECLARE @IDCHAR CHAR(14)
	declare @year int 
	select @year = datepart(YEAR,getdate())
	--以下程序，从OBJTABLE中找到编号，并将编号附给销售-------------------
	select @IDCHAR = max(编号)from 主需求计划历史
	if @IDCHAR is null	--没找到，表明没有记录
	begin
		select @maxid = 1
	end
	ELSE			--找到最大编号
	BEGIN
		select @maxid = convert(int,SUBSTRING(@IDCHAR,6,6))+1
		IF @YEAR > CONVERT(INT,SUBSTRING(@IDCHAR,2,4)) 
			SELECT @MAXID = 1 
		ELSE IF (@YEAR < CONVERT(INT,SUBSTRING(@IDCHAR,2,4)) )
		BEGIN
			RAISERROR('机器年度比编号中的年度早，出错',16,10)	--机器年度比编号中的年度早，出错
		END
	END
	declare mycursor cursor for select zsc.内部编号 FROM 主需求计划 as zsc,选择记帐记录表 as xzjz where zsc.记帐人=@记帐人 
		and zsc.状态='填写' and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps2产品需求计划' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1 order by zsc.内部编号
	OPEN MYCURSOR
	declare @id int
	declare @bh char(14)
	FETCH next from  mycursor into @id
	WHILE (@@FETCH_STATUS = 0 )
	BEGIN
		SELECT @IDCHAR = CONVERT(CHAR(6),@maxid)
		update 主需求计划 SET 编号='需'+convert(char(4),@YEAR)
				+REPLICATE('0',6-LEN(@IDCHAR))+@IDCHAR
			where 内部编号=@id--current of mycursor
		select @maxid = @maxid+1
		FETCH next from  mycursor into @id
	END
	close mycursor
	deallocate mycursor

	insert into 主生产计划(物料编号,年份,计划期,开始日期,结束日期,需求数量,记帐人,修改日期,修改标记,状态,备注)
		select zsc.物料编号,zsc.年份,zsc.计划期,zsc.开始日期,zsc.结束日期,zsc.需求数量,@记帐人,datepart(yyyy,getdate())*10000+datepart(mm,getdate())*100+datepart(dd,getdate()),
			'1','填写','由需求计划转入' from 主需求计划 as zsc,选择记帐记录表 as xzjz where zsc.记帐人=@记帐人 
			and zsc.状态='填写' and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps2产品需求计划' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1 
	
	insert into 主需求计划历史(编号,物料编号,年份,计划期,开始日期,结束日期,需求数量,记帐人,修改日期,修改标记,接收登记,状态,备注)
		select zsc.编号,zsc.物料编号,zsc.年份,zsc.计划期,zsc.开始日期,zsc.结束日期,zsc.需求数量,zsc.记帐人,zsc.修改日期,zsc.修改标记,
			zsc.接收登记,zsc.状态,zsc.备注 from 主需求计划 as zsc,选择记帐记录表 as xzjz where zsc.记帐人=@记帐人 
			and zsc.状态='填写' and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps2产品需求计划' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1 
	
	update 主需求计划 set 修改标记='2' from 主需求计划 as zsc,选择记帐记录表 as xzjz where zsc.记帐人=@记帐人 
			and zsc.状态='填写' and xzjz.记帐人=@记帐人 and xzjz.操作文件名='mps2产品需求计划' and convert(varchar(50),zsc.内部编号)=xzjz.标识字段1 
	
	delete from 主需求计划 where 修改标记='2' and 记帐人=@记帐人

commit

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sf_mrpMpsTest
(@父项编号 char(14),@子项编号 char(14),@年份  int,@计划期 int, @考虑损耗 bit=1,@考虑提前期 bit=1)
 AS
--用主生产计划的数量计算其下一级的毛需求
begin tran

 declare   @生产数量 decimal(18,4),
                @子项数量 decimal(18,4),
                @损耗率     decimal(6,5),
                @提前期     int,
                @上一年份 int,
                @上一计划期  int 

  select      @生产数量=mps数量
    from      主生产计划
   where    物料编号   =  @父项编号 and 年份=@年份 and  计划期=@计划期
   
  select    @子项数量= 需要数量,
                @损耗率   =  (case @考虑损耗  when 1 then 损耗率 else 0 end)
   from      物料清单
   where   父项编号   = @父项编号  and 物料编号=@子项编号   

  if (@考虑提前期=1) 
         select   @提前期=isnull(进货提前期,0)  from 物料主文件 where 物料编号=@子项编号
   else
         select  @提前期=0

  if @计划期-@提前期<=0
  begin
             select      @上一年份=@年份-1
             select      @上一计划期=(select max(计划期) from 工厂日历 where 年份=@上一年份)-(@提前期-@计划期)
  end
  else
  begin
            select      @上一年份=@年份
            select      @上一计划期=@计划期-@提前期
  end 
  
  update   mrp试算
    set       毛需求=isnull(毛需求,0)+isnull(@生产数量,0)*isnull(@子项数量,0)/(1-isnull(@损耗率,0))
   where   物料编号= @子项编号 and 年份=@上一年份 and  计划期=@上一计划期


commit
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE procedure sf_mrpTest子项毛需求
(@父项编号 char(14),@子项编号 char(14),@年份 int,@计划期 int,@考虑损耗 bit=1)
as
begin tran
 declare   @计划投入 decimal(18,4),
                @子项数量 decimal(18,4),
                @损耗率     decimal(6,5)

 select      @计划投入=计划投入
    from      mrp试算
   where    物料编号=@父项编号 and 年份=@年份 and  计划期=@计划期
   
  select   @子项数量=需要数量,
              @损耗率= (case @考虑损耗  when 1 then 损耗率 else 0 end)
   from     物料清单
   where  父项编号=@父项编号  and 物料编号=@子项编号   

  update  mrp试算
    set      毛需求=isnull(毛需求,0)+isnull(@计划投入,0)*isnull(@子项数量,0)/(1-isnull(@损耗率,0))
   where  物料编号=@子项编号 and 年份=@年份 and  计划期=@计划期

commit
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE   sf_mrpTest计算
   (@物料编号 char(14),@年份 int,@计划期 int,@First int,@考虑库存等  bit=1,@考虑提前期 bit=1)
 
 AS

begin tran
         declare @预计采购  decimal(18,4),
                      @预计生产  decimal(18,4),
                      @预计外协  decimal(18,4),
                      @预计领用  decimal(18,4),
                      @预计出库  decimal(18,4),
                      @预计入库  decimal(18,4),
                      @期初库存  decimal(18,4), 
                      @毛需求      decimal(18,4),
                      @净需求      decimal(18,4),
                      @批量          decimal(18,4),
                      @提前期      int,
                      @计划产出  decimal(18,4),
                      @计划投入  decimal(18,4),
                      @预计库存  decimal(18,4),
                      @安全库存  decimal(18,4),
                      @上一年份          int,
                      @上一计划期      int,
                      @计划类别     char(5)

   if (@考虑库存等=1)                            
    begin   
           
	if (@First=0)
             begin
                          select    @期初库存=库存数量
                            from     库存库
                          where    货号=@物料编号

                          select @计划类别=计划类别  from 物料主文件 where 物料编号=@物料编号

	             if(@计划类别='wg')
                          begin  
                                select    @预计采购=sum(剩余数量)
                                  from      采购订单
                                  where   物料编号=@物料编号  and  (年份<=@年份  or (年份=@年份 and 计划期<=@计划期))  
                         end 
                         if(@计划类别='bcp')
                         begin  
                                select     @预计生产=sum(剩余数量)
                                  from      生产订单
                                  where   物料编号=@物料编号  and  (年份<=@年份  or (年份=@年份 and 计划期<=@计划期)) 
                         end 
                       /*
                        if(@计划类别='wx')
                        begin  
                              select    @预计外协=sum(剩余数量)
                                from      外协订单
                                where   物料编号=@物料编号  and  (年份<=@年份  or (年份=@年份 and 计划期<=@计划期))  
                       end 
                       select    @预计领用=sum(剩余数量)
                        from       生产领料单
                        where   物料编号=@物料编号  and  (年份<=@年份  or (年份=@年份 and 计划期<=@计划期)) 
                      */

             end
             else
     	begin
                             if @计划期=1
                             begin
                                       select      @上一年份=@年份-1
                                       select      @上一计划期=(select max(计划期) from 工厂日历 where 年份=@上一年份)
                              end
                              else
                              begin
                                      select      @上一年份=@年份
                                      select      @上一计划期=@计划期-1
                               end   


		Select    @期初库存= 预计库存
                             from     mrp试算
                           where    物料编号=@物料编号  and  年份=@上一年份  and 计划期=@上一计划期
          
                          select @计划类别=计划类别  from 物料主文件 where 物料编号=@物料编号

	             if(@计划类别='wg')
                          begin  
                                select    @预计采购=sum(剩余数量)
                                  from      采购订单
                                 where    物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期 
                         end 
                         if(@计划类别='bcp')
                         begin  
                                select     @预计生产=sum(剩余数量)
                                  from      生产订单
                                 where    物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期 
                         end 
                       /*
                        if(@计划类别='wx')
                        begin  
                              select    @预计外协=sum(剩余数量)
                                from      外协订单
                               where    物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期 
                       end 
                       select    @预计领用=sum(剩余数量)
                        from       生产领料单
                        where    物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期 
                      */
          end
          select  @安全库存=最低库存  from 物料主文件 where 物料编号=@物料编号
end

          select  @预计出库=isnull(@预计领用,0)
          select  @预计入库=isnull(@预计采购,0)+isnull(@预计生产,0)+isnull(@预计外协,0)
          select  @净需求=isnull(毛需求,0)-(isnull(@期初库存,0)-isnull(@安全库存,0)+isnull(@预计入库,0)-isnull(@预计出库,0))
                         from     mrp试算   where    物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期 

          if   ( @净需求<0)      select   @净需求=0
          if   ( @净需求>0) 
          begin
                  select  @批量=批量  from 物料主文件 where 物料编号=@物料编号

                   if (isnull(@批量,0)>0) 
                         select   @计划产出=ceiling(@净需求/@批量)*@批量
                    else
                          select   @计划产出=@净需求

                     if (@考虑提前期=1)
                             select   @提前期=isnull(进货提前期,0)  from 物料主文件 where 物料编号=@物料编号
                   else
                             select   @提前期=0

                   if @计划期-@提前期<=0
                   begin
                             select      @上一年份=@年份-1
                             select      @上一计划期=(select max(计划期) from 工厂日历 where 年份=@上一年份)-(@提前期-@计划期)
                   end
                   else
                   begin
                            select      @上一年份=@年份
                            select      @上一计划期=@计划期-@提前期
                   end 
  
                   if ( not exists(select * from mrp试算 where  物料编号=@物料编号  and  年份=@上一年份  and 计划期=@上一计划期)) 
                   begin
                           /*
                             select      @上一年份=      min(年份)
                             from        mrp试算 
                             where     物料编号=@物料编号
                            
                            select     @上一计划期=  min(计划期)
                             from       mrp试算
                           where     物料编号=@物料编号   and 年份=@年份
                         */
                         select @计划产出=0
                   end
                   else
                   begin
                             update   mrp试算
                                 set     计划投入=@计划产出
                             where    物料编号=@物料编号  and  年份=@上一年份  and 计划期=@上一计划期
                   end
         end
         update   mrp试算
              set    期初库存=isnull(@期初库存,0) ,
                       预计入库=isnull(@预计入库,0),
                       预计出库=isnull(@预计出库,0),
                           净需求=isnull(@净需求,0),
                       计划产出=isnull(@计划产出,0),
                       预计库存=isnull(@期初库存,0)+isnull(@预计入库,0)-isnull(@预计出库,0)+isnull(@计划产出,0)-isnull(毛需求,0)
         where     物料编号=@物料编号 and   年份=@年份  and 计划期=@计划期
commit
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sf_mrpmps
(@父项编号 char(14),@子项编号 char(14),@年份  int,@计划期 int, @考虑损耗 bit=1,@考虑提前期 bit=1)
 AS
--用主生产计划的数量计算其下一级的毛需求
begin tran

 declare   @生产数量      decimal(18,4),
                @子项数量      decimal(18,4),
                @损耗率          decimal(6,5),
                @提前期          int,
                @上一年份      int,
                @上一计划期  int 

  select      @生产数量=mps数量
    from      主生产计划历史
   where    物料编号   =  @父项编号 and 年份=@年份 and  计划期=@计划期
   
  select    @子项数量= 需要数量,
                @损耗率   = (case @考虑损耗  when 1 then 损耗率 else 0 end)
   from      物料清单
   where   父项编号   = @父项编号  and 物料编号=@子项编号   
 
   if (@考虑提前期=1) 
         select   @提前期=isnull(进货提前期,0)  from 物料主文件 where 物料编号=@子项编号
   else
         select  @提前期=0

  if @计划期-@提前期<=0
  begin
             select      @上一年份=@年份-1
             select      @上一计划期=(select max(计划期) from 工厂日历 where 年份=@上一年份)-(@提前期-@计划期)
  end
  else
  begin
            select      @上一年份=@年份
            select      @上一计划期=@计划期-@提前期
  end 
  
  update   mrpcalcd
    set       毛需求=isnull(毛需求,0)+isnull(@生产数量,0)*isnull(@子项数量,0)/(1-  isnull(@损耗率,0)  )
   where   物料编号= @子项编号 and 年份=@上一年份 and  计划期=@上一计划期


commit
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE procedure sf_mrp子项毛需求
(@父项编号 char(14),@子项编号 char(14),@年份 int,@计划期 int,@考虑损耗 bit=1)
as
begin tran
 declare   @计划投入 decimal(18,4),
                @子项数量 decimal(18,4),
                @损耗率     decimal(6,5)

 select      @计划投入=计划投入
    from      mrpcalcd
   where    物料编号=@父项编号 and 年份=@年份 and  计划期=@计划期
   
  select    @子项数量=需要数量,
               @损耗率   = (case @考虑损耗  when 1 then 损耗率 else 0 end)
   from      物料清单
   where  父项编号=@父项编号  and 物料编号=@子项编号   

  update  mrpcalcd
    set      毛需求=isnull(毛需求,0)+isnull(@计划投入,0)*isnull(@子项数量,0)/(1-  isnull(@损耗率,0)  )
   where  物料编号=@子项编号 and 年份=@年份 and  计划期=@计划期

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


CREATE PROCEDURE sf_mrp生产件资源负荷
AS
begin transaction
	insert into 生产件资源负荷报表(资源编号,年份,计划期) 
		select a.资源编号,a.年份,a.计划期 from 
		(select xhde.资源编号,zsc.年份,zsc.计划期 from mrp历史 as zsc,资源消耗定额 as xhde
	 		where zsc.能力计算标记='0' and zsc.物料编号=xhde.物料编号) as a left join 生产件资源负荷报表 as b
			on a.资源编号=b.资源编号 and a.年份=b.年份 and a.计划期=b.计划期 where b.资源编号 is null
	update 生产件资源负荷报表 set 负荷=负荷+aa.新负荷 from
		(select a.资源编号,a.年份,a.计划期,a.新负荷 from 
		(select xhde.资源编号,zsc.年份,zsc.计划期,zsc.净需求*xhde.资源需求量/生产批量 as 新负荷 from mrp历史 as zsc,资源消耗定额 as xhde
	 		where zsc.能力计算标记='0' and zsc.物料编号=xhde.物料编号) as a) as aa
				where 生产件资源负荷报表.资源编号=aa.资源编号 and 生产件资源负荷报表.年份=aa.年份 and 生产件资源负荷报表.计划期=aa.计划期
	update mrp历史 set 能力计算标记='1'
commit

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE   sf_mrp计算
   (@物料编号 char(14),@年份 int,@计划期 int,@First int,@考虑库存等  bit=1,@考虑提前期 bit=1)
 AS

begin tran
         declare @预计采购  decimal(18,4),
                      @预计生产  decimal(18,4),
                      @预计外协  decimal(18,4),
                      @预计领用  decimal(18,4),
                      @预计出库  decimal(18,4),
                      @预计入库  decimal(18,4),
                      @期初库存  decimal(18,4), 
                      @毛需求      decimal(18,4),
                      @净需求      decimal(18,4),
                      @批量          decimal(18,4),
                      @提前期      int,
                      @计划产出  decimal(18,4),
                      @计划投入  decimal(18,4),
                      @预计库存  decimal(18,4),
                      @安全库存  decimal(18,4),
                      @上一年份          int,
                      @上一计划期      int,
                      @计划类别     char(5)

   
    if (@考虑库存等=1)                            
    begin   
	if (@First=0)
             begin
                      
                    
                              select    @期初库存=库存数量
                               from      库存库
                              where   货号=@物料编号
                        
                          select @计划类别=计划类别  from 物料主文件 where 物料编号=@物料编号

	             if(@计划类别='wg')
                          begin  
                                select    @预计采购=sum(剩余数量)
                                  from      采购订单
                                  where   物料编号=@物料编号  and  (年份<=@年份  or (年份=@年份 and 计划期<=@计划期))  
                         end 
                         if(@计划类别='bcp')
                         begin  
                                select     @预计生产=sum(剩余数量)
                                  from      生产订单
                                  where   物料编号=@物料编号  and  (年份<=@年份  or (年份=@年份 and 计划期<=@计划期)) 
                         end 
                       /*
                        if(@计划类别='wx')
                        begin  
                              select    @预计外协=sum(剩余数量)
                                from      外协订单
                                where   物料编号=@物料编号  and  (年份<=@年份  or (年份=@年份 and 计划期<=@计划期))  
                       end 
                       select    @预计领用=sum(剩余数量)
                        from       生产领料单
                        where   物料编号=@物料编号  and  (年份<=@年份  or (年份=@年份 and 计划期<=@计划期)) 
                      */

	end
             else
     	begin
                            if @计划期=1
                            begin
                                    select      @上一年份=@年份-1
                                    select      @上一计划期=(select max(计划期) from 工厂日历 where 年份=@上一年份)
                            end
                            else
                            begin
                                    select      @上一年份=@年份
                                    select      @上一计划期=@计划期-1
                            end   

		Select    @期初库存= 预计库存
                             from     mrpcalcd
                           where    物料编号=@物料编号  and  年份=@上一年份  and 计划期=@上一计划期
          
                          select @计划类别=计划类别  from 物料主文件 where 物料编号=@物料编号

	             if(@计划类别='wg')
                          begin  
                                select    @预计采购=sum(剩余数量)
                                  from      采购订单
                                 where    物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期 
                         end 
                         if(@计划类别='bcp')
                         begin  
                                select     @预计生产=sum(剩余数量)
                                  from      生产订单
                                 where    物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期 
                         end 
                       /*
                        if(@计划类别='wx')
                        begin  
                              select    @预计外协=sum(剩余数量)
                                from      外协订单
                               where    物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期 
                       end 
                       select    @预计领用=sum(剩余数量)
                        from       生产领料单
                        where    物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期 
                      */
	end       --First=0
      
             select  @安全库存=最低库存,  @批量=批量  from 物料主文件 where 物料编号=@物料编号

 end        --考虑库存=1


          select  @预计出库=isnull(@预计领用,0)
          select  @预计入库=isnull(@预计采购,0)+isnull(@预计生产,0)+isnull(@预计外协,0)
          select  @净需求=isnull(毛需求,0)-(isnull(@期初库存,0)-isnull(@安全库存,0)+isnull(@预计入库,0)-isnull(@预计出库,0))
                         from     mrpcalcd   where    物料编号=@物料编号  and  年份=@年份  and 计划期=@计划期 

          if   ( @净需求<0)      select   @净需求=0
          if   ( @净需求>0) 
          begin
          
                   if (isnull(@批量,0)>0) 
                         select   @计划产出=ceiling(@净需求/@批量)*@批量
                    else
                          select   @计划产出=@净需求
                  
                   if (@考虑提前期=1)
                             select   @提前期=isnull(进货提前期,0)  from 物料主文件 where 物料编号=@物料编号
                   else
                             select   @提前期=0

                   if @计划期-@提前期<=0
                   begin
                             select      @上一年份=@年份-1
                             select      @上一计划期=(select max(计划期) from 工厂日历 where 年份=@上一年份)-(@提前期-@计划期)
                   end
                   else
                   begin
                            select      @上一年份=@年份
                            select      @上一计划期=@计划期-@提前期
                   end 
  
                   if ( not exists(select * from mrpcalcd where  物料编号=@物料编号  and  年份=@上一年份  and 计划期=@上一计划期)) 
                   begin
                             select @计划产出=0
                   end
                   else
                   begin
                             update   mrpcalcd
                                 set     计划投入=@计划产出
                             where    物料编号=@物料编号  and  年份=@上一年份  and 计划期=@上一计划期
                   end
         end

         update   mrpcalcd
              set    期初库存=isnull(@期初库存,0) ,
                       预计入库=isnull(@预计入库,0),
                       预计出库=isnull(@预计出库,0),
                           净需求=isnull(@净需求,0),
                       计划产出=isnull(@计划产出,0),
                       预计库存=isnull(@期初库存,0)+isnull(@预计入库,0)-isnull(@预计出库,0)+isnull(@计划产出,0)-isnull(毛需求,0)
         where     物料编号=@物料编号 and   年份=@年份  and 计划期=@计划期

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


CREATE PROCEDURE sf_mrp试算生产件资源负荷
AS
begin transaction
	delete from 临时生产件资源负荷报表
	insert into 临时生产件资源负荷报表(资源编号,年份,计划期) 
		select a.资源编号,a.年份,a.计划期 from 
		(select xhde.资源编号,zsc.年份,zsc.计划期 from mrp试算 as zsc,资源消耗定额 as xhde
	 		where zsc.物料编号=xhde.物料编号) as a left join 临时生产件资源负荷报表 as b
			on a.资源编号=b.资源编号 and a.年份=b.年份 and a.计划期=b.计划期 where b.资源编号 is null
	update 临时生产件资源负荷报表 set 负荷=负荷+aa.新负荷 from
		(select a.资源编号,a.年份,a.计划期,a.新负荷 from 
		(select xhde.资源编号,zsc.年份,zsc.计划期,zsc.净需求*xhde.资源需求量/生产批量 as 新负荷 from mrp试算 as zsc,资源消耗定额 as xhde
	 		where zsc.物料编号=xhde.物料编号) as a) as aa
				where 临时生产件资源负荷报表.资源编号=aa.资源编号 and 临时生产件资源负荷报表.年份=aa.年份 and 临时生产件资源负荷报表.计划期=aa.计划期
	exec sf_mrp生产件资源负荷
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

CREATE procedure sf_sc生成领料单 as

begin tran
       delete from 领料单temp
 
       declare mycursor cursor for
               select 年份,计划期,编号,生产部门,物料编号,数量
                 from 生产订单历史
                where 领料单标志=0  or 领料单标志 is null 

       open mycursor
       declare @年份 int,@计划期 int ,@生产订单编号 char(14),
               @生产部门 char(10),@物料编号 char(14),@数量 decimal(10,4) 

       fetch next from  mycursor  into @年份,@计划期,@生产订单编号,@生产部门,@物料编号,@数量 
       WHILE (@@FETCH_STATUS = 0 ) 
       begin
               insert into 领料单temp  (年份,计划期,生产订单编号,领料车间,领料库房,物料编号,数量)
               select @年份,@计划期,@生产订单编号,isnull(b.领料车间,@生产部门),
                         b.领料库房,b.物料编号,@数量*b.需要数量
               from   ( select    父项编号,物料编号,需要数量,领料车间,领料库房 
                          from     物料清单
                          where    父项编号=@物料编号 
                       )     as b
                     
              update   生产订单历史
                   set    领料单标志=1
                 where  current of mycursor
              
               fetch next from  mycursor  into @年份,@计划期,@生产订单编号,@生产部门,@物料编号,@数量 
        
       end 
       close mycursor
       deallocate mycursor     


       insert into 领料单 (年份,计划期,生产订单编号,领料车间,领料库房,物料编号,申请数量,领料类别,备注)
       select              年份,计划期,生产订单编号,领料车间,领料库房,物料编号,sum(数量),'生产领用','自动生成'
       from   领料单temp
       group  by  年份,计划期,生产订单编号,领料车间,领料库房,物料编号
       order  by  年份,计划期,生产订单编号,领料车间,领料库房,物料编号

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

/****** Encrypted object is not transferable, and script can not be generated. ******/

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE sys生成资源日程表 @开始日期 int=0,@结束日期 int =0,@记帐人 char(10)=null
AS
begin transaction
	if @开始日期>@结束日期 
	begin
		raiserror(50002,16,10)
	end
	declare @temp int   --临时存放日期
	declare @zybh char(14),@edgs int   -----资源编号，额定工时
	declare mycursor cursor for select 编号,额定工时 from 资源清单
	open mycursor
	fetch next from mycursor into @zybh,@edgs
	while ( @@fetch_status = 0 )
	begin
		select @temp=@开始日期
		while @temp<=@结束日期
		begin
			insert into 资源日程表 (日期,资源编号,计划能力,记帐人,修改日期,修改标记)
				values(@temp,@zybh,@edgs,@记帐人,datepart(yyyy,getdate())*10000+datepart(mm,getdate())*100+datepart(dd,getdate()),'1')
			select @temp=@temp+1
		end
		fetch next from mycursor into @zybh,@edgs
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
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE  低层码 
 AS

--  该存贮过程是执行完 “生成物料清单中的低层码” 后执行的
begin tran
   update   物料主文件
       set     低层码=b.低层码
     from    物料主文件 as a,
                  (select         物料编号,min(低层码) as 低层码
                      from         物料清单
                      group by  物料编号     
      )         as b
   where a.物料编号=b.物料编号
  
   
   update  物料清单 
       set    低层码=b.低层码
      from   物料清单 as a,物料主文件 as b
     where a.物料编号=b.物料编号

commit
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[合同变动子集_劳动合同编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[合同变动子集] DROP CONSTRAINT 合同变动子集_劳动合同编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[合同补充子集_劳动合同编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[合同补充子集] DROP CONSTRAINT 合同补充子集_劳动合同编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[合同解除子集_劳动合同编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[合同解除子集] DROP CONSTRAINT 合同解除子集_劳动合同编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[合同续签子集_劳动合同编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[合同续签子集] DROP CONSTRAINT 合同续签子集_劳动合同编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[合同终止子集_劳动合同编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[合同终止子集] DROP CONSTRAINT 合同终止子集_劳动合同编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[劳动争议子集_劳动合同编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[劳动争议子集] DROP CONSTRAINT 劳动争议子集_劳动合同编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[干部调整与交流子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[干部调整与交流子集] DROP CONSTRAINT 干部调整与交流子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[个人简历子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[个人简历子集] DROP CONSTRAINT 个人简历子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[个人年度汇总台帐子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[个人年度汇总台帐子集] DROP CONSTRAINT 个人年度汇总台帐子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[合同管理子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[合同管理子集] DROP CONSTRAINT 合同管理子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[兼任职务子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[兼任职务子集] DROP CONSTRAINT 兼任职务子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[军转干部子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[军转干部子集] DROP CONSTRAINT 军转干部子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[离休退休子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[离休退休子集] DROP CONSTRAINT 离休退休子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[社会保险子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[社会保险子集] DROP CONSTRAINT 社会保险子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[生育保险信息子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[生育保险信息子集] DROP CONSTRAINT 生育保险信息子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[失业保险信息子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[失业保险信息子集] DROP CONSTRAINT 失业保险信息子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[行政党派职务子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[行政党派职务子集] DROP CONSTRAINT 行政党派职务子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[行政及党内惩罚_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[行政及党内惩罚] DROP CONSTRAINT 行政及党内惩罚_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[行政及党内奖励_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[行政及党内奖励] DROP CONSTRAINT 行政及党内奖励_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[学历及学位子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[学历及学位子集] DROP CONSTRAINT 学历及学位子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[养老保险信息子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[养老保险信息子集] DROP CONSTRAINT 养老保险信息子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[医疗保险子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[医疗保险子集] DROP CONSTRAINT 医疗保险子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[政治面貌及党籍情况_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[政治面貌及党籍情况] DROP CONSTRAINT 政治面貌及党籍情况_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职工参险信息子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[职工参险信息子集] DROP CONSTRAINT 职工参险信息子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_职员离职登记表_职员基本信息表]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[职员离职登记表] DROP CONSTRAINT FK_职员离职登记表_职员基本信息表
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职员主要关系人信息表_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[职员主要关系人信息表] DROP CONSTRAINT 职员主要关系人信息表_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主要论文著作子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[主要论文著作子集] DROP CONSTRAINT 主要论文著作子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[住房公积金子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[住房公积金子集] DROP CONSTRAINT 住房公积金子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[专业技术职务子集_职员编号_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[专业技术职务子集] DROP CONSTRAINT 专业技术职务子集_职员编号_fk
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[上年工资统计]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[上年工资统计]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[专业技术职务子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[专业技术职务子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[个人年度汇总台帐子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[个人年度汇总台帐子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[个人所得税表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[个人所得税表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[个人简历子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[个人简历子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[主要论文著作子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[主要论文著作子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[人事变更历史表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[人事变更历史表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[住房公积金子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[住房公积金子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[养老保险信息子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[养老保险信息子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[兼任职务子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[兼任职务子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[军转干部子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[军转干部子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[刷卡记录表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[刷卡记录表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[加班历史表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[加班历史表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[劳动争议子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[劳动争议子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[医疗保险子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[医疗保险子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[单位人员基本结构子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[单位人员基本结构子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[单位人员编制子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[单位人员编制子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[单位参统信息子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[单位参统信息子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[单位月度汇总台帐子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[单位月度汇总台帐子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[单位机构情况子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[单位机构情况子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[单位离退休情况子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[单位离退休情况子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[单位职务结构子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[单位职务结构子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[合同变动子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[合同变动子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[合同管理子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[合同管理子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[合同终止子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[合同终止子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[合同续签子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[合同续签子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[合同补充子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[合同补充子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[合同解除子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[合同解除子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[固定扣缴项目调整表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[固定扣缴项目调整表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[基本养老保险费列表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[基本养老保险费列表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[基本医疗保险费列表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[基本医疗保险费列表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[基本工资调整表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[基本工资调整表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[失业保险信息子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[失业保险信息子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[失业保险费列表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[失业保险费列表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[学历及学位子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[学历及学位子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[岗位变更子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[岗位变更子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[工伤信息子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[工伤信息子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[工资统计历史表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[工资统计历史表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[工龄工资调整表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[工龄工资调整表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[干部调整与交流子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[干部调整与交流子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[应聘人员分类编码表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[应聘人员分类编码表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[应聘人员录用表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[应聘人员录用表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[应聘人员登记表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[应聘人员登记表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[当月加班费列表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[当月加班费列表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[当月奖金列表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[当月奖金列表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[当月扣缴项目列表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[当月扣缴项目列表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[当月福利列表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[当月福利列表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[当月考核工资列表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[当月考核工资列表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[招聘初选历史表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[招聘初选历史表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[招聘初选名单表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[招聘初选名单表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[招聘申请历史表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[招聘申请历史表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[招聘申请表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[招聘申请表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[招聘计划表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[招聘计划表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[政治面貌及党籍情况]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[政治面貌及党籍情况]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[教育经历证书列表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[教育经历证书列表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[月工资统计表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[月工资统计表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[月考勤汇总表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[月考勤汇总表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[档案借用表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[档案借用表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[档案列表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[档案列表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[档案存入登记表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[档案存入登记表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[档案查询历史表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[档案查询历史表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[档案查询申请表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[档案查询申请表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[档案转出表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[档案转出表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[津贴补助调整表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[津贴补助调整表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[生育保险信息子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[生育保险信息子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[用户清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[用户清单]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[社会保险子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[社会保险子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[离休退休子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[离休退休子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[组织机构编码表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[组织机构编码表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[经济补偿合同]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[经济补偿合同]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[绩效考核表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[绩效考核表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职务工资调整表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[职务工资调整表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职员主要关系人信息表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[职员主要关系人信息表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职员基本信息表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[职员基本信息表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职员奖励表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[职员奖励表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职员工资项目表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[职员工资项目表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职员惩罚表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[职员惩罚表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职员离职登记表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[职员离职登记表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职员考勤信息表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[职员考勤信息表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职工参险信息子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[职工参险信息子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[聘任合同列表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[聘任合同列表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[行政党派职务子集]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[行政党派职务子集]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[行政及党内奖励]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[行政及党内奖励]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[行政及党内惩罚]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[行政及党内惩罚]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[证件登记表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[证件登记表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[请假历史表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[请假历史表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[请假申请表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[请假申请表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[转入正式员工登记表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[转入正式员工登记表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[面试历史表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[面试历史表]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[面试名单表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[面试名单表]
GO

CREATE TABLE [dbo].[上年工资统计] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[年度] [int] NULL ,
	[上一年月平均工资] [decimal](26, 2) NULL ,
	[本市职工平均工资] [decimal](26, 2) NULL ,
	[社会保险基数] [decimal](26, 2) NULL ,
	[基数下限] [decimal](26, 2) NULL ,
	[基数上限] [decimal](26, 2) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[专业技术职务子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[专业技术资格名称] [varchar] (100) NULL ,
	[取得资格途径] [varchar] (50) NULL ,
	[取得资格时间] [int] NULL ,
	[聘任专业技术职务名称] [varchar] (100) NULL ,
	[聘任起始时间] [int] NULL ,
	[聘任终止时间] [int] NULL ,
	[聘任单位] [varchar] (100) NULL ,
	[聘任情况] [varchar] (100) NULL ,
	[有何种专长] [varchar] (100) NULL ,
	[资格审批单位] [varchar] (100) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[个人年度汇总台帐子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[年度] [int] NULL ,
	[养老险个人缴费额] [decimal](26, 2) NULL ,
	[养老险企业缴费额] [decimal](26, 2) NULL ,
	[养老险企业划入额] [decimal](26, 2) NULL ,
	[医疗险个人缴费额] [decimal](26, 2) NULL ,
	[医疗险企业缴费额] [decimal](26, 2) NULL ,
	[医疗险企业划入额] [decimal](26, 2) NULL ,
	[失业险个人缴费额] [decimal](26, 2) NULL ,
	[失业险企业缴费额] [decimal](26, 2) NULL ,
	[工伤险企业缴费额] [decimal](26, 2) NULL ,
	[生育险企业缴费额] [decimal](26, 2) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[个人所得税表] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[级数] [char] (2) NOT NULL ,
	[不计税工资] [decimal](26, 2) NOT NULL ,
	[工资下限] [decimal](26, 2) NOT NULL ,
	[工资上限] [decimal](26, 2) NOT NULL ,
	[个人所得税率] [decimal](26, 2) NOT NULL ,
	[速算扣除数] [decimal](26, 2) NOT NULL ,
	[备注] [varchar] (50) NULL ,
	[操作员] [varchar] (10) NULL ,
	[修改标记] [char] (1) NOT NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[个人简历子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[起始时间] [int] NULL ,
	[终止时间] [int] NULL ,
	[所在单位] [varchar] (100) NULL ,
	[从事工作或担任职务] [varchar] (100) NULL ,
	[证明人] [varchar] (30) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[主要论文著作子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[发表时间] [int] NULL ,
	[论文著作名称] [varchar] (100) NULL ,
	[所属学科专业类别] [varchar] (20) NULL ,
	[出版社或刊物名称] [varchar] (100) NULL ,
	[备注] [varchar] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[人事变更历史表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[职务调动日期] [int] NULL ,
	[调动前部门编号] [char] (10) NOT NULL ,
	[调动前部门名称] [varchar] (100) NULL ,
	[调动前职务编号] [char] (10) NOT NULL ,
	[调动前职务名称] [varchar] (100) NULL ,
	[调动后部门编号] [char] (10) NOT NULL ,
	[调动后部门名称] [varchar] (100) NULL ,
	[调动后职务编号] [char] (10) NOT NULL ,
	[调动后职务名称] [varchar] (100) NULL ,
	[调动原因] [varchar] (50) NULL ,
	[调动类型] [varchar] (20) NULL ,
	[人事部门意见] [varchar] (200) NULL ,
	[审批情况] [varchar] (20) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[审批记帐人] [char] (10) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[住房公积金子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[基数计算方式] [varchar] (50) NULL ,
	[缴费基数] [decimal](26, 2) NULL ,
	[个人支付比率] [decimal](26, 2) NULL ,
	[个人缴费额] [decimal](26, 2) NULL ,
	[企业支付比率] [decimal](26, 2) NULL ,
	[企业缴费额] [decimal](26, 2) NULL ,
	[开始缴费日期] [int] NULL ,
	[累计缴费时间] [int] NULL ,
	[缴费中断时间] [int] NULL ,
	[缴费中断原因] [varchar] (100) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[养老保险信息子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[开始缴费时间] [int] NULL ,
	[视同缴费年限] [decimal](26, 2) NULL ,
	[职工月缴费基数] [decimal](26, 2) NULL ,
	[缴费记录] [varchar] (1) NULL ,
	[补缴] [varchar] (2) NULL ,
	[增加原因] [varchar] (50) NULL ,
	[人员类别] [varchar] (50) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[兼任职务子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[兼职类别] [varchar] (20) NULL ,
	[兼任职务名称] [varchar] (100) NULL ,
	[兼职时间] [int] NULL ,
	[兼职单位] [varchar] (100) NULL ,
	[兼职方式] [varchar] (20) NULL ,
	[兼职原因] [varchar] (50) NULL ,
	[兼职文号] [varchar] (30) NULL ,
	[兼职批准单位] [varchar] (100) NULL ,
	[兼职主管或从事工作] [varchar] (100) NULL ,
	[兼职生效时间] [int] NULL ,
	[免去兼职的时间] [int] NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL ,
	[备注] [char] (100) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[军转干部子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[入伍地] [varchar] (100) NULL ,
	[入伍时间] [int] NULL ,
	[批准复转时间] [int] NULL ,
	[批准复转单位] [varchar] (100) NULL ,
	[复转前职务] [varchar] (100) NULL ,
	[转业前在军队军衔] [varchar] (50) NULL ,
	[复转前级别] [varchar] (50) NULL ,
	[转业前专业技术等级] [varchar] (50) NULL ,
	[复转前工资等级] [varchar] (50) NULL ,
	[预备役登记情况] [varchar] (100) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[刷卡记录表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[日期] [float] NULL ,
	[职员编号] [char] (10) NULL ,
	[刷卡时间] [float] NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[加班历史表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [char] (10) NOT NULL ,
	[加班类型] [varchar] (20) NULL ,
	[加班日期] [int] NOT NULL ,
	[加班开始时间] [int] NOT NULL ,
	[加班结束时间] [int] NOT NULL ,
	[加班时数] [varchar] (20) NULL ,
	[加班原因] [varchar] (200) NULL ,
	[审批情况] [varchar] (20) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[审批记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[劳动争议子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NULL ,
	[合同编号] [varchar] (60) NULL ,
	[劳动争议提出方] [varchar] (20) NULL ,
	[劳动争议原因] [varchar] (50) NULL ,
	[劳动争议审理机构] [varchar] (100) NULL ,
	[劳动争议开始时间] [int] NULL ,
	[劳动争议结束时间] [int] NULL ,
	[劳动争议处理结果] [varchar] (100) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[医疗保险子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[保险名称] [varchar] (100) NULL ,
	[缴费起始时间] [int] NULL ,
	[缴费中断时间] [int] NULL ,
	[中断开始时间] [int] NULL ,
	[缴费终止时间] [int] NULL ,
	[定点医疗机构1] [varchar] (100) NULL ,
	[定点医疗机构2] [varchar] (100) NULL ,
	[定点医疗机构3] [varchar] (100) NULL ,
	[定点医疗机构4] [varchar] (100) NULL ,
	[定点医疗机构5] [varchar] (100) NULL ,
	[异地安置日期] [int] NULL ,
	[全称] [varchar] (100) NULL ,
	[地址] [varchar] (100) NULL ,
	[邮政编码] [varchar] (6) NULL ,
	[联系电话] [varchar] (20) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[单位人员基本结构子集] (
	[单位编号] [varchar] (20) NULL ,
	[期末职工人数] [int] NULL ,
	[职工平均人数] [int] NULL ,
	[固定职工人数] [int] NULL ,
	[合同制职工人数] [int] NULL ,
	[临时职工人数] [int] NULL ,
	[其他从业人数] [int] NULL ,
	[干部人数] [int] NULL ,
	[工人人数] [int] NULL ,
	[行政管理人员数] [int] NULL ,
	[专业技术人员数] [int] NULL ,
	[聘用制干部数] [int] NULL ,
	[长期病休人员] [int] NULL ,
	[带工资学习一年以上人员] [int] NULL ,
	[待分配人员] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[单位人员编制子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[单位编号] [varchar] (20) NOT NULL ,
	[编制总数] [int] NULL ,
	[实有人] [int] NULL ,
	[缺编人数] [int] NULL ,
	[超编人数] [int] NULL ,
	[行政编制数] [int] NULL ,
	[事业编制数] [int] NULL ,
	[企业编制数] [int] NULL ,
	[社团编制数] [int] NULL ,
	[单位领导职数] [int] NULL ,
	[单位非领导职数] [int] NULL ,
	[内设机构领导职数] [int] NULL ,
	[内设机构非领导职数] [int] NULL ,
	[业务人员编制数] [int] NULL ,
	[工勤人员编制数] [int] NULL ,
	[使用全额拨款人数] [int] NULL ,
	[使用差额拨款人数] [int] NULL ,
	[使用自筹资金人数] [int] NULL ,
	[操作员] [varchar] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[单位参统信息子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[单位编号] [varchar] (20) NOT NULL ,
	[参加保险名称] [varchar] (100) NULL ,
	[参保时间] [int] NULL ,
	[缴费年度] [int] NULL ,
	[基数计算方式] [varchar] (50) NULL ,
	[基数百分比] [decimal](26, 2) NULL ,
	[缴费基数] [decimal](26, 2) NULL ,
	[缴费比率] [decimal](26, 2) NULL ,
	[企业支付比率] [decimal](26, 2) NULL ,
	[个人支付比率] [decimal](26, 2) NULL ,
	[在职人数] [int] NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[单位月度汇总台帐子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[单位编号] [varchar] (20) NOT NULL ,
	[年月份] [int] NULL ,
	[企业缴费基数] [decimal](26, 2) NULL ,
	[养老险企业缴费额] [decimal](26, 2) NULL ,
	[养老险企业划入额] [decimal](26, 2) NULL ,
	[医疗险企业缴费额] [decimal](26, 2) NULL ,
	[医疗险企业划入额] [decimal](26, 2) NULL ,
	[失业险企业缴费额] [decimal](26, 2) NULL ,
	[工伤险企业缴费额] [decimal](26, 2) NULL ,
	[生育险企业缴费额] [decimal](26, 2) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[单位机构情况子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[单位编号] [varchar] (20) NOT NULL ,
	[批准成立时间] [int] NULL ,
	[批准成立文号] [varchar] (24) NULL ,
	[批准编制时间] [int] NULL ,
	[批准编制文号] [varchar] (24) NULL ,
	[批准编制单位] [varchar] (70) NULL ,
	[内设机构数] [int] NULL ,
	[内设机构名称] [varchar] (40) NULL ,
	[内设机构级别] [varchar] (2) NULL ,
	[撤销时间] [int] NULL ,
	[批准撤销文号] [varchar] (24) NULL ,
	[撤销批准单位] [varchar] (70) NULL ,
	[拨款形式] [varchar] (1) NULL ,
	[操作员] [varchar] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[单位离退休情况子集] (
	[单位编号] [varchar] (20) NULL ,
	[离休人数] [int] NULL ,
	[退休人数] [int] NULL ,
	[领取定期生活费的退职人员] [int] NULL ,
	[离休费在最低标准的人数] [int] NULL ,
	[退休费在最低标准的人数] [int] NULL ,
	[生活不能自理者人数] [int] NULL ,
	[备注] [varchar] (100) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[单位职务结构子集] (
	[单位编号] [varchar] (20) NULL ,
	[省部级及相当者人数] [int] NULL ,
	[副省部级及相当者人数] [int] NULL ,
	[司局级及相当者人数] [int] NULL ,
	[副司局级及相当者人数] [int] NULL ,
	[处级及相当者人数] [int] NULL ,
	[副处级及相当者人数] [int] NULL ,
	[科级及相当者人数] [int] NULL ,
	[副科级及相当者人数] [int] NULL ,
	[科员办事员及其他人数] [int] NULL ,
	[高级专业技术职务人数] [int] NULL ,
	[中级专业技术职务人数] [int] NULL ,
	[初级专业技术职务人数] [int] NULL ,
	[未评聘专业技术职务人员数] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[合同变动子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NULL ,
	[合同编号] [varchar] (60) NULL ,
	[经济补偿金] [decimal](26, 2) NULL ,
	[交纳违约金] [decimal](26, 2) NULL ,
	[合同变动提出方] [varchar] (100) NULL ,
	[合同变动日期] [int] NULL ,
	[合同变动后果] [varchar] (100) NULL ,
	[合同变动生效日期] [int] NULL ,
	[合同变动原因] [varchar] (100) NULL ,
	[合同变动类型] [varchar] (20) NULL ,
	[合同变动内容] [varchar] (200) NULL ,
	[新合同编号] [varchar] (60) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[合同管理子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[合同名称] [varchar] (100) NULL ,
	[合同编号] [varchar] (60) NOT NULL ,
	[合同期类型] [varchar] (20) NULL ,
	[合同期限] [int] NULL ,
	[劳动合同起始日期] [int] NULL ,
	[劳动合同终止日期] [int] NULL ,
	[劳动合同签订日期] [int] NULL ,
	[劳动合同协商内容] [varchar] (200) NULL ,
	[劳动合同期薪资待遇] [decimal](26, 2) NULL ,
	[试用期期限] [int] NULL ,
	[试用期起始日期] [int] NULL ,
	[试用期终止日期] [int] NULL ,
	[试用期薪资待遇] [decimal](26, 2) NULL ,
	[试用合同签订日期] [int] NULL ,
	[学徒期期限] [int] NULL ,
	[学徒期起始日期] [int] NULL ,
	[学徒期终止日期] [int] NULL ,
	[学徒期薪资待遇] [decimal](26, 2) NULL ,
	[学徒期合同签订日期] [int] NULL ,
	[见习期期限] [int] NULL ,
	[见习期起始日期] [int] NULL ,
	[见习期终止日期] [int] NULL ,
	[见习期薪资待遇] [int] NULL ,
	[见习期合同签订日期] [int] NULL ,
	[保密合同签订日期] [int] NULL ,
	[保密合同编号] [varchar] (60) NULL ,
	[保密合同特别约定] [varchar] (200) NULL ,
	[培训协议签订日期] [int] NULL ,
	[培训协议协商内容] [varchar] (200) NULL ,
	[培训内容] [varchar] (200) NULL ,
	[培训性质] [varchar] (20) NULL ,
	[主办单位] [varchar] (200) NULL ,
	[开课日期] [int] NULL ,
	[结业日期] [int] NULL ,
	[课时] [int] NULL ,
	[培训费用] [decimal](26, 2) NULL ,
	[服务期] [int] NULL ,
	[费用赔偿方式] [varchar] (50) NULL ,
	[岗位协议签订日期] [int] NULL ,
	[岗位协议编号] [varchar] (60) NULL ,
	[岗位协议特别约定] [varchar] (200) NULL ,
	[合同鉴定日期] [int] NULL ,
	[鉴定单位] [varchar] (100) NULL ,
	[合同类型] [varchar] (20) NULL ,
	[合同变动次数] [int] NULL ,
	[合同状态] [varchar] (20) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[合同终止子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NULL ,
	[合同编号] [varchar] (60) NULL ,
	[合同终止时间] [int] NULL ,
	[手续办理时间] [int] NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[合同续签子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NULL ,
	[合同编号] [varchar] (60) NULL ,
	[续签合同类型] [varchar] (30) NULL ,
	[合同续签日期] [int] NULL ,
	[合同续签期限] [int] NULL ,
	[续签合同起始日期] [int] NULL ,
	[续签合同终止日期] [int] NULL ,
	[新合同编号] [varchar] (60) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[合同补充子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NULL ,
	[合同编号] [varchar] (60) NULL ,
	[合同补充提出方] [varchar] (10) NULL ,
	[合同补充日期] [int] NULL ,
	[合同补充生效日期] [int] NULL ,
	[合同补充原因] [varchar] (100) NULL ,
	[合同补充内容] [varchar] (200) NULL ,
	[新合同编号] [varchar] (60) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[合同解除子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NULL ,
	[合同编号] [varchar] (60) NULL ,
	[合同解除提出方] [varchar] (100) NULL ,
	[合同解除时间] [int] NULL ,
	[合同解除原因] [varchar] (100) NULL ,
	[合同解除生效日期] [int] NULL ,
	[解除后果] [varchar] (100) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[固定扣缴项目调整表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[固定扣缴项目类型] [varchar] (50) NOT NULL ,
	[调整后金额] [float] NOT NULL ,
	[调整原因] [varchar] (100) NULL ,
	[调整日期] [int] NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[基本养老保险费列表] (
	[职工编号] [char] (10) NOT NULL ,
	[基本养老保险费] [float] NULL ,
	[企业支付比率] [float] NULL ,
	[个人支付比率] [float] NULL ,
	[合计比率] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[基本医疗保险费列表] (
	[职工编号] [char] (10) NOT NULL ,
	[基本医疗保险费] [float] NULL ,
	[企业支付比率] [float] NULL ,
	[个人支付比率] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[基本工资调整表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[调整后金额] [float] NOT NULL ,
	[调整原因] [varchar] (100) NULL ,
	[调整日期] [int] NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[失业保险信息子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[个人缴费起始时间] [int] NULL ,
	[人员类别] [varchar] (50) NULL ,
	[累计缴费时间] [decimal](26, 2) NULL ,
	[缴费中断时间] [int] NULL ,
	[缴费中断原因] [varchar] (100) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[失业保险费列表] (
	[职工编号] [char] (10) NOT NULL ,
	[失业保险费] [float] NULL ,
	[企业支付比率] [float] NULL ,
	[个人支付比率] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[学历及学位子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[学历] [varchar] (20) NULL ,
	[所学专业] [varchar] (40) NULL ,
	[入学时间] [int] NULL ,
	[学习形式] [varchar] (20) NULL ,
	[学制] [decimal](26, 2) NULL ,
	[毕肄业时间] [int] NULL ,
	[毕肄业学校及单位] [varchar] (40) NULL ,
	[学位] [varchar] (20) NULL ,
	[学位授予时间] [int] NULL ,
	[学位授予国家地区] [varchar] (40) NULL ,
	[学位授予单位] [varchar] (70) NULL ,
	[备注] [varchar] (100) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[岗位变更子集] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[职务调动日期] [int] NULL ,
	[调动前部门编号] [char] (20) NOT NULL ,
	[调动前部门名称] [varchar] (100) NULL ,
	[调动前职务名称] [varchar] (100) NULL ,
	[调动后部门编号] [char] (20) NOT NULL ,
	[调动后部门名称] [varchar] (100) NULL ,
	[调动后职务名称] [varchar] (100) NULL ,
	[调动原因] [varchar] (50) NULL ,
	[调动类型] [varchar] (20) NULL ,
	[人事部门意见] [varchar] (200) NULL ,
	[审批情况] [varchar] (20) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[审批记帐人] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[工伤信息子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[工伤证号] [varchar] (30) NULL ,
	[发证日期] [int] NULL ,
	[发证单位] [varchar] (100) NULL ,
	[事故时间] [int] NULL ,
	[事故类别] [varchar] (50) NULL ,
	[劳动鉴定表号] [varchar] (30) NULL ,
	[工伤认定申请表号] [varchar] (30) NULL ,
	[工伤待遇审批表号] [varchar] (30) NULL ,
	[伤害部位] [varchar] (100) NULL ,
	[伤害程度] [varchar] (100) NULL ,
	[伤残等级] [varchar] (100) NULL ,
	[接触有害物质时间] [int] NULL ,
	[职业病名称] [varchar] (100) NULL ,
	[护理依赖等级] [varchar] (100) NULL ,
	[工伤原因经过] [varchar] (100) NULL ,
	[人员类别] [varchar] (50) NULL ,
	[增加时间] [int] NULL ,
	[减少时间] [int] NULL ,
	[增减原因] [varchar] (50) NULL ,
	[是否工伤职工] [varchar] (2) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[工资统计历史表] (
	[序号] [int] NULL ,
	[日期] [int] NULL ,
	[职员编号] [varchar] (30) NULL ,
	[基本工资] [float] NULL ,
	[浮动工资] [decimal](26, 2) NULL ,
	[合同补] [decimal](26, 2) NULL ,
	[粮副补] [decimal](26, 2) NULL ,
	[洗理费] [decimal](26, 2) NULL ,
	[车餐费] [decimal](26, 2) NULL ,
	[水电煤补] [decimal](26, 2) NULL ,
	[书报费] [decimal](26, 2) NULL ,
	[房补] [decimal](26, 2) NULL ,
	[利息] [decimal](26, 2) NULL ,
	[临时补] [decimal](26, 2) NULL ,
	[职务工资] [decimal](26, 2) NULL ,
	[工龄工资] [decimal](26, 2) NULL ,
	[考核工资] [decimal](26, 2) NULL ,
	[加班费] [decimal](26, 2) NULL ,
	[物价津贴] [decimal](26, 2) NULL ,
	[交通津贴] [decimal](26, 2) NULL ,
	[伙食津贴] [decimal](26, 2) NULL ,
	[医疗补贴] [decimal](26, 2) NULL ,
	[高温津贴] [decimal](26, 2) NULL ,
	[奖金] [decimal](26, 2) NULL ,
	[福利] [decimal](26, 2) NULL ,
	[高职补] [decimal](26, 2) NULL ,
	[独子补] [decimal](26, 2) NULL ,
	[差额补] [decimal](26, 2) NULL ,
	[电话补] [decimal](26, 2) NULL ,
	[应发金额合计] [decimal](26, 2) NULL ,
	[房租] [decimal](26, 2) NULL ,
	[水电费] [decimal](26, 2) NULL ,
	[请假扣除] [decimal](26, 2) NULL ,
	[考勤扣除] [decimal](26, 2) NULL ,
	[罚款] [decimal](26, 2) NULL ,
	[工会费] [decimal](26, 2) NULL ,
	[住房公积金] [decimal](26, 2) NULL ,
	[医疗保险] [decimal](26, 2) NULL ,
	[养老保险] [decimal](26, 2) NULL ,
	[失业保险] [decimal](26, 2) NULL ,
	[生育保险] [decimal](26, 2) NULL ,
	[工伤保险] [decimal](26, 2) NULL ,
	[利息税] [decimal](26, 2) NULL ,
	[临时扣] [decimal](26, 2) NULL ,
	[应扣金额合计] [decimal](26, 2) NULL ,
	[工资合计] [decimal](26, 2) NULL ,
	[个人所得税] [decimal](26, 2) NULL ,
	[实发金额] [decimal](26, 2) NULL ,
	[职工账号] [varchar] (20) NULL ,
	[发放否] [char] (10) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[工资类型] [varchar] (50) NULL ,
	[月份] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[工龄工资调整表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[调整后金额] [float] NOT NULL ,
	[调整原因] [varchar] (100) NULL ,
	[调整日期] [int] NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[干部调整与交流子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[调整与交流类别] [varchar] (40) NULL ,
	[调整交流情况] [varchar] (50) NULL ,
	[调整交流开始时间] [int] NULL ,
	[调整交流结束时间] [int] NULL ,
	[担任职务] [varchar] (100) NULL ,
	[任职情况] [varchar] (100) NULL ,
	[备注] [varchar] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[应聘人员分类编码表] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[类别] [varchar] (100) NULL ,
	[AbsIndex] [int] NULL ,
	[ItemIndex] [int] NULL ,
	[ItemLevel] [int] NULL ,
	[ParentIndex] [int] NULL ,
	[类别号] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[应聘人员录用表] (
	[应聘人编号] [varchar] (10) NOT NULL ,
	[面试分数] [varchar] (50) NULL ,
	[笔试成绩] [varchar] (50) NULL ,
	[综合考核] [varchar] (50) NULL ,
	[职员编号] [varchar] (30) NULL ,
	[开始聘用日期] [int] NULL ,
	[试用期] [int] NULL ,
	[是否转入职员表] [char] (10) NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[应聘人员登记表] (
	[应聘人编号] [varchar] (10) NOT NULL ,
	[应聘人姓名] [char] (10) NOT NULL ,
	[姓名简码] [char] (10) NULL ,
	[应聘职务编号] [char] (100) NOT NULL ,
	[应聘部门编号] [char] (10) NOT NULL ,
	[出生日期] [int] NULL ,
	[出生地] [varchar] (100) NULL ,
	[性别] [char] (10) NULL ,
	[婚姻状况] [char] (10) NULL ,
	[健康情况] [varchar] (50) NULL ,
	[政治面貌] [char] (20) NULL ,
	[家庭电话] [varchar] (30) NULL ,
	[手机] [varchar] (30) NULL ,
	[寻呼机] [varchar] (30) NULL ,
	[户口所在地] [varchar] (50) NULL ,
	[家庭地址] [varchar] (100) NULL ,
	[电子邮件地址] [varchar] (50) NULL ,
	[邮编] [varchar] (20) NULL ,
	[身份证号码] [varchar] (20) NULL ,
	[文化程度] [char] (10) NULL ,
	[外语水平] [varchar] (50) NULL ,
	[简历文件] [varchar] (50) NULL ,
	[照片文件] [varchar] (50) NULL ,
	[其他特长] [varchar] (200) NULL ,
	[对所聘职务地工作职责描述] [varchar] (200) NULL ,
	[希望待遇] [varchar] (50) NULL ,
	[备注] [varchar] (100) NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[当月加班费列表] (
	[职员编号] [varchar] (30) NOT NULL ,
	[日期] [int] NULL ,
	[加班时数] [float] NULL ,
	[加班费金额] [float] NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[当月奖金列表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[日期] [int] NULL ,
	[奖金种类] [varchar] (20) NULL ,
	[奖金金额] [float] NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[当月扣缴项目列表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[日期] [int] NULL ,
	[扣缴项目种类] [varchar] (20) NULL ,
	[扣缴项目金额] [float] NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[当月福利列表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[日期] [int] NULL ,
	[福利种类] [varchar] (20) NULL ,
	[福利金额] [float] NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[当月考核工资列表] (
	[职员编号] [varchar] (30) NOT NULL ,
	[日期] [int] NULL ,
	[考核分数] [int] NULL ,
	[考核工资] [float] NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[招聘初选历史表] (
	[应聘人编号] [varchar] (10) NOT NULL ,
	[过去经历] [varchar] (254) NULL ,
	[计算机能力] [varchar] (50) NULL ,
	[业务能力] [varchar] (50) NULL ,
	[外语水平] [varchar] (50) NULL ,
	[综合评分] [varchar] (50) NULL ,
	[初选状态] [varchar] (20) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[审批记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[招聘初选名单表] (
	[应聘人编号] [varchar] (10) NOT NULL ,
	[过去经历] [varchar] (254) NULL ,
	[计算机能力] [varchar] (50) NULL ,
	[业务能力] [varchar] (50) NULL ,
	[外语水平] [varchar] (50) NULL ,
	[综合评分] [varchar] (50) NULL ,
	[初选状态] [varchar] (20) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[审批记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[招聘申请历史表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[申请人编号] [char] (10) NOT NULL ,
	[部门编号] [char] (10) NOT NULL ,
	[拟招聘人数] [int] NULL ,
	[工作内容] [varchar] (100) NULL ,
	[招聘日期] [int] NULL ,
	[拟聘人员所需条件] [varchar] (100) NULL ,
	[招聘理由] [varchar] (100) NULL ,
	[招聘方式] [varchar] (20) NULL ,
	[审批情况] [varchar] (20) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[审批记帐人] [char] (10) NULL ,
	[申请单号] [char] (14) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[招聘申请表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[申请人编号] [char] (10) NOT NULL ,
	[部门编号] [char] (10) NOT NULL ,
	[拟招聘人数] [int] NULL ,
	[工作内容] [varchar] (100) NULL ,
	[招聘日期] [int] NULL ,
	[拟聘人员所需条件] [varchar] (100) NULL ,
	[招聘理由] [varchar] (100) NULL ,
	[招聘方式] [varchar] (20) NULL ,
	[审批情况] [varchar] (20) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[审批记帐人] [char] (10) NULL ,
	[申请单号] [char] (14) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[招聘计划表] (
	[招聘计划编号] [int] IDENTITY (1, 1) NOT NULL ,
	[负责人编号] [char] (10) NOT NULL ,
	[部门编号] [char] (10) NOT NULL ,
	[拟招聘人数] [int] NULL ,
	[工作内容] [varchar] (100) NULL ,
	[招聘日期] [int] NULL ,
	[拟聘人员所需条件] [varchar] (100) NULL ,
	[招聘理由] [varchar] (100) NULL ,
	[招聘方式] [varchar] (20) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[政治面貌及党籍情况] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[政治面貌] [varchar] (20) NULL ,
	[参加党派时间] [int] NULL ,
	[参加党派时所在单位] [varchar] (100) NULL ,
	[介绍人] [varchar] (30) NULL ,
	[转正时间] [int] NULL ,
	[异常类别] [char] (40) NULL ,
	[异常原因] [char] (100) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[教育经历证书列表] (
	[职员编号] [varchar] (30) NOT NULL ,
	[学历证书编号] [varchar] (20) NULL ,
	[学历证书复印件存放位置] [varchar] (100) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[月工资统计表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[日期] [int] NULL ,
	[职员编号] [varchar] (30) NULL ,
	[基本工资] [float] NULL ,
	[浮动工资] [decimal](26, 2) NULL ,
	[合同补] [decimal](26, 2) NULL ,
	[粮副补] [decimal](26, 2) NULL ,
	[洗理费] [decimal](26, 2) NULL ,
	[车餐费] [decimal](26, 2) NULL ,
	[水电煤补] [decimal](26, 2) NULL ,
	[书报费] [decimal](26, 2) NULL ,
	[房补] [decimal](26, 2) NULL ,
	[利息] [decimal](26, 2) NULL ,
	[临时补] [decimal](26, 2) NULL ,
	[职务工资] [decimal](26, 2) NULL ,
	[工龄工资] [decimal](26, 2) NULL ,
	[考核工资] [decimal](26, 2) NULL ,
	[加班费] [decimal](26, 2) NULL ,
	[物价津贴] [decimal](26, 2) NULL ,
	[交通津贴] [decimal](26, 2) NULL ,
	[伙食津贴] [decimal](26, 2) NULL ,
	[医疗补贴] [decimal](26, 2) NULL ,
	[高温津贴] [decimal](26, 2) NULL ,
	[奖金] [decimal](26, 2) NULL ,
	[福利] [decimal](26, 2) NULL ,
	[高职补] [decimal](26, 2) NULL ,
	[独子补] [decimal](26, 2) NULL ,
	[差额补] [decimal](26, 2) NULL ,
	[电话补] [decimal](26, 2) NULL ,
	[应发金额合计] [decimal](26, 2) NULL ,
	[房租] [decimal](26, 2) NULL ,
	[水电费] [decimal](26, 2) NULL ,
	[请假扣除] [decimal](26, 2) NULL ,
	[考勤扣除] [decimal](26, 2) NULL ,
	[罚款] [decimal](26, 2) NULL ,
	[工会费] [decimal](26, 2) NULL ,
	[住房公积金] [decimal](26, 2) NULL ,
	[医疗保险] [decimal](26, 2) NULL ,
	[养老保险] [decimal](26, 2) NULL ,
	[失业保险] [decimal](26, 2) NULL ,
	[生育保险] [decimal](26, 2) NULL ,
	[工伤保险] [decimal](26, 2) NULL ,
	[利息税] [decimal](26, 2) NULL ,
	[临时扣] [decimal](26, 2) NULL ,
	[应扣金额合计] [decimal](26, 2) NULL ,
	[工资合计] [decimal](26, 2) NULL ,
	[个人所得税] [decimal](26, 2) NULL ,
	[实发金额] [decimal](26, 2) NULL ,
	[职工账号] [varchar] (20) NULL ,
	[发放否] [char] (10) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[工资类型] [varchar] (50) NULL ,
	[月份] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[月考勤汇总表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[日期] [int] NULL ,
	[职员编号] [char] (10) NOT NULL ,
	[迟到次数] [int] NULL ,
	[早退次数] [int] NULL ,
	[矿工次数] [int] NULL ,
	[请假次数] [int] NULL ,
	[加班时间] [float] NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[档案借用表] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[档案编号] [char] (10) NOT NULL ,
	[借用类型] [char] (10) NOT NULL ,
	[借用日期] [int] NULL ,
	[源目的单位] [varchar] (100) NULL ,
	[借用事由] [varchar] (200) NULL ,
	[记帐人] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[档案列表] (
	[档案编号] [char] (10) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[档案类型] [varchar] (50) NULL ,
	[档案状态] [varchar] (20) NULL ,
	[档案存放位置] [varchar] (50) NOT NULL ,
	[档案存放项目] [varchar] (50) NOT NULL ,
	[档案存入日期] [int] NULL ,
	[档案转出日期] [int] NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[档案存入登记表] (
	[档案编号] [char] (10) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[档案类型] [varchar] (50) NULL ,
	[档案存放位置] [varchar] (100) NULL ,
	[档案存放项目] [varchar] (100) NULL ,
	[档案存入日期] [int] NULL ,
	[填单记帐人] [char] (10) NOT NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[档案查询历史表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[查询人姓名] [char] (10) NOT NULL ,
	[查询人身份证件] [varchar] (20) NOT NULL ,
	[档案编号] [char] (10) NOT NULL ,
	[查询事由] [varchar] (200) NULL ,
	[查询日期] [int] NULL ,
	[填单记帐人] [char] (10) NULL ,
	[审批情况] [varchar] (20) NULL ,
	[审批记帐人] [char] (10) NULL ,
	[备注] [varchar] (200) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[档案查询申请表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[查询人姓名] [char] (10) NOT NULL ,
	[查询人身份证件] [varchar] (20) NOT NULL ,
	[档案编号] [char] (10) NOT NULL ,
	[查询事由] [varchar] (200) NULL ,
	[查询日期] [int] NULL ,
	[审批情况] [varchar] (20) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[审批记帐人] [char] (10) NULL ,
	[备注] [varchar] (200) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[档案转出表] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[档案编号] [char] (10) NOT NULL ,
	[转出日期] [int] NULL ,
	[转出目的地] [varchar] (200) NULL ,
	[转出事由] [varchar] (200) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[津贴补助调整表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[津贴补助类型] [varchar] (50) NOT NULL ,
	[调整后金额] [float] NOT NULL ,
	[调整原因] [varchar] (100) NULL ,
	[调整日期] [int] NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[生育保险信息子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[生育时间] [int] NULL ,
	[生育保险金支付] [decimal](26, 2) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[用户清单] (
	[用户编号] [char] (6) NOT NULL ,
	[部门] [char] (20) NOT NULL ,
	[姓名] [char] (10) NOT NULL ,
	[性别] [char] (2) NOT NULL ,
	[密码] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[社会保险子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[缴费日期] [int] NULL ,
	[缴费基数] [decimal](26, 2) NOT NULL ,
	[养老险个人缴费比例] [decimal](26, 2) NOT NULL ,
	[养老险个人缴费额] [decimal](26, 2) NOT NULL ,
	[医疗险个人缴费比例] [decimal](26, 2) NOT NULL ,
	[医疗险个人缴费额] [decimal](26, 2) NOT NULL ,
	[补充医疗险个人缴费额] [decimal](26, 2) NOT NULL ,
	[失业险个人缴费比例] [decimal](26, 2) NOT NULL ,
	[失业险个人缴费额] [decimal](26, 2) NOT NULL ,
	[生育险个人缴费比例] [decimal](26, 2) NOT NULL ,
	[生育险个人缴费额] [decimal](26, 2) NOT NULL ,
	[工伤险个人缴费比例] [decimal](26, 2) NOT NULL ,
	[工伤险个人缴费额] [decimal](26, 2) NOT NULL ,
	[养老险企业缴费比例] [decimal](26, 2) NOT NULL ,
	[养老险企业缴费额] [decimal](26, 2) NOT NULL ,
	[养老险企业划入比例] [decimal](26, 2) NOT NULL ,
	[养老险企业划入额] [decimal](26, 2) NOT NULL ,
	[医疗险企业缴费比例] [decimal](26, 2) NOT NULL ,
	[医疗险企业缴费额] [decimal](26, 2) NOT NULL ,
	[医疗险企业划入比例] [decimal](26, 2) NOT NULL ,
	[医疗险企业划入额] [decimal](26, 2) NOT NULL ,
	[补充医疗险企业缴费比例] [decimal](26, 2) NOT NULL ,
	[补充医疗险企业缴费额] [decimal](26, 2) NOT NULL ,
	[失业险企业缴费比例] [decimal](26, 2) NOT NULL ,
	[失业险企业缴费额] [decimal](26, 2) NOT NULL ,
	[生育险企业缴费比例] [decimal](26, 2) NOT NULL ,
	[生育险企业缴费额] [decimal](26, 2) NOT NULL ,
	[工伤险企业缴费比例] [decimal](26, 2) NOT NULL ,
	[工伤险企业缴费额] [decimal](26, 2) NOT NULL ,
	[公积金缴费基数] [decimal](26, 2) NOT NULL ,
	[公积金个人缴费比例] [decimal](26, 2) NOT NULL ,
	[公积金个人缴费额] [decimal](26, 2) NOT NULL ,
	[公积金企业缴费比例] [decimal](26, 2) NOT NULL ,
	[公积金企业缴费额] [decimal](26, 2) NOT NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[离休退休子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[离退类别] [varchar] (20) NULL ,
	[离退休时间] [int] NULL ,
	[离退休后享受级别] [varchar] (50) NULL ,
	[离退休费支付单位] [varchar] (100) NULL ,
	[离退休后管理单位] [varchar] (100) NULL ,
	[异地安置] [varchar] (50) NULL ,
	[返聘情况] [varchar] (50) NULL ,
	[异地安置时间] [int] NULL ,
	[参加各项活动] [varchar] (50) NULL ,
	[离退休死亡时间] [int] NULL ,
	[离退休费] [decimal](28, 2) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[组织机构编码表] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[类别] [varchar] (100) NULL ,
	[AbsIndex] [int] NULL ,
	[ItemIndex] [int] NULL ,
	[ItemLevel] [int] NULL ,
	[ParentIndex] [int] NULL ,
	[类别号] [char] (10) NULL ,
	[单位编号] [varchar] (20) NOT NULL ,
	[单位名称] [varchar] (100) NULL ,
	[拼音编码] [varchar] (50) NULL ,
	[邮政编码] [varchar] (6) NULL ,
	[单位地址] [varchar] (100) NULL ,
	[单位电话号码] [varchar] (50) NULL ,
	[单位传真号] [varchar] (50) NULL ,
	[单位电报号] [varchar] (10) NULL ,
	[单位所在地] [varchar] (50) NULL ,
	[隶属关系] [varchar] (50) NULL ,
	[单位级别] [varchar] (50) NULL ,
	[主管单位名称] [varchar] (100) NULL ,
	[单位性质] [varchar] (50) NULL ,
	[经济类型] [varchar] (50) NULL ,
	[所属行业] [varchar] (50) NULL ,
	[企业类型] [varchar] (20) NULL ,
	[单位负责人] [varchar] (30) NULL ,
	[附属关系] [varchar] (50) NULL ,
	[所属部门] [varchar] (50) NULL ,
	[单位所在国家] [varchar] (50) NULL ,
	[行业名称] [varchar] (50) NULL ,
	[单位法人] [varchar] (30) NULL ,
	[单位简称] [varchar] (50) NULL ,
	[简称拼音] [varchar] (25) NULL ,
	[行政主管] [varchar] (50) NULL ,
	[开户银行] [varchar] (100) NULL ,
	[帐号] [varchar] (50) NULL ,
	[开户全称] [varchar] (100) NULL ,
	[联系人] [varchar] (50) NULL ,
	[登记注册类型] [varchar] (50) NULL ,
	[社会保险登记证号] [varchar] (50) NULL ,
	[失业保险缴费起始时间] [int] NULL ,
	[缴费终止时间] [int] NULL ,
	[备注] [varchar] (100) NULL ,
	[xx] [varchar] (50) NULL ,
	[操作员] [varchar] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[经济补偿合同] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[合同编号] [varchar] (60) NULL ,
	[离职前部门] [varchar] (100) NULL ,
	[离职前职务] [varchar] (100) NULL ,
	[离职日期] [int] NULL ,
	[离职原因] [varchar] (200) NULL ,
	[年龄段] [varchar] (100) NULL ,
	[补偿年数] [decimal](26, 2) NULL ,
	[每年金额] [decimal](26, 2) NULL ,
	[总金额] [decimal](26, 2) NULL ,
	[法规依据] [varchar] (200) NULL ,
	[审批意见] [varchar] (200) NULL ,
	[记帐人] [char] (10) NULL ,
	[审批人] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[绩效考核表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [char] (10) NOT NULL ,
	[考核类型] [varchar] (20) NULL ,
	[考核开始日期] [int] NULL ,
	[考核截至日期] [int] NULL ,
	[工作品质] [int] NULL ,
	[合作精神] [int] NULL ,
	[工作知识] [int] NULL ,
	[主动性] [int] NULL ,
	[勤勉] [int] NULL ,
	[工作量] [int] NULL ,
	[学习能力] [int] NULL ,
	[出勤] [int] NULL ,
	[综合评分] [int] NULL ,
	[考核分等级] [int] NULL ,
	[部门领导意见] [varchar] (50) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[职务工资调整表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[调整后金额] [float] NOT NULL ,
	[调整原因] [varchar] (100) NULL ,
	[调整日期] [int] NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[职员主要关系人信息表] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[关系人姓名] [varchar] (20) NOT NULL ,
	[关系类型] [varchar] (20) NOT NULL ,
	[成员出生日期] [int] NULL ,
	[工作单位及职务] [varchar] (100) NULL ,
	[成员政治面貌] [varchar] (20) NULL ,
	[成员文化程度] [varchar] (20) NULL ,
	[关系人描述] [varchar] (100) NULL ,
	[办公电话] [varchar] (50) NULL ,
	[手机] [varchar] (50) NULL ,
	[电子邮件地址] [varchar] (50) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[职员基本信息表] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[姓名] [varchar] (20) NOT NULL ,
	[姓名简码] [varchar] (10) NULL ,
	[曾用名] [varchar] (30) NULL ,
	[性别] [varchar] (2) NULL ,
	[出生日期] [int] NULL ,
	[籍贯] [varchar] (50) NULL ,
	[出生地] [varchar] (100) NULL ,
	[民族] [varchar] (20) NULL ,
	[文化程度] [char] (50) NULL ,
	[毕业学校] [char] (100) NULL ,
	[健康状况] [varchar] (50) NULL ,
	[婚姻状况] [varchar] (10) NULL ,
	[职员类型] [varchar] (30) NULL ,
	[现任职务编号] [char] (100) NULL ,
	[职称] [char] (50) NULL ,
	[本人成份] [varchar] (20) NULL ,
	[参加工作时间] [int] NULL ,
	[进入本系统工作时间] [int] NULL ,
	[现身份起始时间] [int] NULL ,
	[连续工龄] [int] NULL ,
	[用工形式] [varchar] (20) NULL ,
	[用工期限] [varchar] (20) NULL ,
	[政治面貌] [varchar] (20) NULL ,
	[参加党派时间] [int] NULL ,
	[职业类别] [varchar] (40) NULL ,
	[现从事专业] [varchar] (40) NULL ,
	[享受待遇级别] [varchar] (40) NULL ,
	[户口所在地] [varchar] (50) NULL ,
	[户口性质] [varchar] (10) NULL ,
	[身份证号码] [varchar] (18) NULL ,
	[港澳台侨属标识] [varchar] (20) NULL ,
	[干部录聘用来源] [varchar] (20) NULL ,
	[干部选聘审批单位] [varchar] (50) NULL ,
	[干部录聘时间] [int] NULL ,
	[减员方式] [varchar] (20) NULL ,
	[减员时间] [int] NULL ,
	[公务员录用来源] [varchar] (40) NULL ,
	[公务员特殊考试标识] [varchar] (20) NULL ,
	[进入跨地域标识] [varchar] (20) NULL ,
	[公务员录用时间] [int] NULL ,
	[所属部门编号] [char] (10) NOT NULL ,
	[年龄] [int] NULL ,
	[入职方式] [varchar] (30) NULL ,
	[聘任日期] [int] NULL ,
	[转正时间] [int] NULL ,
	[工作岗位] [varchar] (50) NULL ,
	[社会保障号码] [varchar] (30) NULL ,
	[简历文件] [varchar] (50) NULL ,
	[照片文件] [varchar] (50) NULL ,
	[家庭地址] [varchar] (100) NULL ,
	[邮编] [varchar] (20) NULL ,
	[家庭电话] [varchar] (50) NULL ,
	[办公电话] [varchar] (50) NULL ,
	[手机] [varchar] (50) NULL ,
	[寻呼机] [varchar] (50) NULL ,
	[电子邮件地址] [varchar] (50) NULL ,
	[工作描述] [varchar] (200) NULL ,
	[工作证件号码] [varchar] (20) NULL ,
	[职工账号] [varchar] (20) NULL ,
	[单位编号] [varchar] (20) NULL, 
	[备注] [varchar] (100) NULL ,
	[是否执业药师] [char] (10) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[职员奖励表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[奖励类型] [varchar] (20) NULL ,
	[奖励金额] [float] NULL ,
	[是否计入工资] [char] (10) NULL ,
	[奖励原因] [varchar] (50) NULL ,
	[部门意见] [varchar] (100) NULL ,
	[奖励日期] [int] NULL ,
	[填单记帐人] [char] (10) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[职员工资项目表] (
	[职员编号] [varchar] (30) NOT NULL ,
	[基本工资] [float] NULL ,
	[职务工资] [float] NULL ,
	[工龄工资] [float] NULL ,
	[考核工资] [float] NULL ,
	[加班费] [float] NULL ,
	[物价津贴] [float] NULL ,
	[交通津贴] [float] NULL ,
	[伙食津贴] [float] NULL ,
	[医疗补贴] [float] NULL ,
	[高温津贴] [float] NULL ,
	[奖金] [float] NULL ,
	[福利] [float] NULL ,
	[应发金额合计] [float] NULL ,
	[房租] [float] NULL ,
	[水电费] [float] NULL ,
	[请假扣除] [float] NULL ,
	[考勤扣除] [float] NULL ,
	[罚款] [float] NULL ,
	[工会费] [float] NULL ,
	[住房公积金] [float] NULL ,
	[医疗保险] [float] NULL ,
	[养老保险] [float] NULL ,
	[失业保险] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[职员惩罚表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[惩罚类型] [varchar] (20) NULL ,
	[惩罚金额] [float] NULL ,
	[是否计入工资] [char] (10) NULL ,
	[惩罚原因] [varchar] (50) NULL ,
	[部门意见] [varchar] (100) NULL ,
	[惩罚日期] [int] NULL ,
	[填单记帐人] [char] (10) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[职员离职登记表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[离职前部门] [varchar] (100) NULL ,
	[离职前职务] [varchar] (100) NULL ,
	[离职日期] [int] NULL ,
	[离职原因] [varchar] (200) NULL ,
	[离职手续办理] [varchar] (50) NULL ,
	[人事主管意见] [varchar] (200) NULL ,
	[审批情况] [varchar] (20) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[审批记帐人] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[职员考勤信息表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[日期] [int] NULL ,
	[职员编号] [char] (10) NOT NULL ,
	[上班刷卡时间] [datetime] NULL ,
	[下班刷卡时间] [datetime] NULL ,
	[出勤属性] [char] (10) NULL ,
	[是否迟到] [char] (10) NULL ,
	[是否早退] [char] (10) NULL ,
	[是否矿工] [char] (10) NULL ,
	[迟到时间] [int] NULL ,
	[早退时间] [int] NULL ,
	[加班时间] [int] NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[职工参险信息子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[参加保险名称] [varchar] (100) NULL ,
	[基数计算方式] [varchar] (50) NULL ,
	[缴费基数] [decimal](26, 2) NULL ,
	[个人支付比率] [decimal](26, 2) NULL ,
	[个人缴费额] [decimal](26, 2) NULL ,
	[企业支付比率] [decimal](26, 2) NULL ,
	[企业缴费额] [decimal](26, 2) NULL ,
	[开始缴费日期] [int] NULL ,
	[累计缴费时间] [int] NULL ,
	[缴费中断时间] [int] NULL ,
	[缴费中断原因] [varchar] (100) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[聘任合同列表] (
	[聘任合同编号] [char] (10) NOT NULL ,
	[聘任合同存放位置] [varchar] (50) NULL ,
	[聘任合同生效日期] [int] NULL ,
	[聘任合同结束日期] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[行政党派职务子集] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[编号] [varchar] (14) NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[职务编号] [varchar] (10) NULL ,
	[职务类别] [varchar] (10) NULL ,
	[职务名称] [varchar] (100) NOT NULL ,
	[任职时间] [int] NULL ,
	[任职单位] [varchar] (100) NOT NULL ,
	[任职方式] [varchar] (20) NULL ,
	[任职原因] [varchar] (40) NULL ,
	[任职文号] [varchar] (24) NULL ,
	[职务级别] [varchar] (20) NULL ,
	[职位分类] [varchar] (40) NULL ,
	[任职批准单位] [varchar] (70) NULL ,
	[职务变动类别] [varchar] (20) NULL ,
	[当前任职状况] [varchar] (20) NULL ,
	[主管或从事工作] [varchar] (40) NULL ,
	[免职时间] [int] NULL ,
	[免职方式] [varchar] (20) NULL ,
	[免职原因] [varchar] (40) NULL ,
	[免职文号] [varchar] (24) NULL ,
	[免职批准单位] [varchar] (100) NULL ,
	[职务生效时间] [int] NULL ,
	[降职原因] [varchar] (40) NULL ,
	[在下一级任职年限] [varchar] (40) NULL ,
	[职务属性] [varchar] (20) NULL ,
	[职员等级] [varchar] (20) NULL ,
	[备注] [varchar] (100) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[行政及党内奖励] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[奖励类别] [varchar] (20) NULL ,
	[奖励名称] [varchar] (100) NULL ,
	[奖励原因] [varchar] (100) NULL ,
	[奖励时间] [int] NULL ,
	[奖励批准单位] [varchar] (100) NULL ,
	[荣誉称号名称] [varchar] (100) NULL ,
	[荣誉称号授予单位] [varchar] (100) NULL ,
	[奖励取消情况] [varchar] (100) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[行政及党内惩罚] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[处分类别] [varchar] (20) NULL ,
	[处分名称] [varchar] (100) NULL ,
	[处分原因] [varchar] (100) NULL ,
	[受处分时间] [int] NULL ,
	[受处分给予单位] [varchar] (100) NULL ,
	[撤销处分时间] [int] NULL ,
	[监察机关直接给予标志] [varchar] (20) NULL ,
	[惩罚取消情况] [varchar] (100) NULL ,
	[备注] [char] (100) NULL ,
	[操作员] [char] (10) NULL ,
	[修改标记] [char] (1) NULL ,
	[修改日期] [int] NULL ,
	[接收登记] [binary] (30) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[证件登记表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL ,
	[证件类型] [varchar] (20) NOT NULL ,
	[证件编号] [char] (10) NOT NULL ,
	[办证时间] [int] NULL ,
	[证件有效期] [int] NULL ,
	[检验日期间隔] [int] NULL ,
	[最近检验日期] [int] NULL ,
	[填单记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[请假历史表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [char] (10) NOT NULL ,
	[请假类型] [varchar] (20) NULL ,
	[请假日期] [int] NULL ,
	[请假开始时间] [int] NULL ,
	[请假结束时间] [int] NULL ,
	[请假时数] [varchar] (20) NULL ,
	[请假原因] [varchar] (200) NULL ,
	[审批情况] [varchar] (20) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[审批记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[请假申请表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [char] (10) NOT NULL ,
	[请假类型] [varchar] (20) NULL ,
	[请假日期] [int] NULL ,
	[请假开始时间] [int] NULL ,
	[请假结束时间] [int] NULL ,
	[请假时数] [varchar] (20) NULL ,
	[请假原因] [varchar] (200) NULL ,
	[审批情况] [varchar] (20) NULL ,
	[填单记帐人] [char] (10) NULL ,
	[审批记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[转入正式员工登记表] (
	[应聘人编号] [varchar] (10) NOT NULL ,
	[职员编号] [varchar] (30) NULL ,
	[证件号码] [varchar] (50) NULL ,
	[职工账号] [varchar] (20) NULL ,
	[聘任日期] [int] NULL ,
	[工作电话] [varchar] (50) NULL ,
	[聘任合同编号] [varchar] (60) NULL ,
	[是否转为正式员工] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[面试历史表] (
	[应聘人编号] [varchar] (10) NOT NULL ,
	[初选评分] [varchar] (50) NULL ,
	[外表形象] [varchar] (50) NULL ,
	[健康状况] [varchar] (50) NULL ,
	[领悟反应能力] [varchar] (50) NULL ,
	[对相关职务了解程度] [varchar] (50) NULL ,
	[其经历与本公司配合程度] [varchar] (50) NULL ,
	[外语能力] [varchar] (50) NULL ,
	[综合评分] [varchar] (50) NULL ,
	[录用情况] [char] (10) NULL ,
	[面试地点] [varchar] (50) NULL ,
	[面试人] [char] (10) NULL ,
	[面试日期] [int] NULL ,
	[填单记帐人] [char] (10) NULL ,
	[审批记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[面试名单表] (
	[应聘人编号] [varchar] (10) NOT NULL ,
	[初选评分] [varchar] (50) NULL ,
	[外表形象] [varchar] (50) NULL ,
	[健康状况] [varchar] (50) NULL ,
	[领悟反应能力] [varchar] (50) NULL ,
	[对相关职务了解程度] [varchar] (50) NULL ,
	[其经历与本公司配合程度] [varchar] (50) NULL ,
	[外语能力] [varchar] (50) NULL ,
	[综合评分] [varchar] (50) NULL ,
	[录用情况] [char] (10) NULL ,
	[面试地点] [varchar] (50) NULL ,
	[面试人] [char] (10) NULL ,
	[面试日期] [int] NULL ,
	[填单记帐人] [char] (10) NULL ,
	[审批记帐人] [char] (10) NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[专业技术职务子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__专业技术职务子集__修改标记__26509D48] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__专业技术职务子集__接收登记__2744C181] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[个人年度汇总台帐子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__个人年度汇总台帐子集__修改标记__0915401C] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__个人年度汇总台帐子集__接收登记__0A096455] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[个人所得税表] WITH NOCHECK ADD 
	CONSTRAINT [DF_个人所得税表_不计税工资] DEFAULT (800) FOR [不计税工资],
	CONSTRAINT [DF_个人所得税表_需纳税最低工资] DEFAULT (0) FOR [工资下限],
	CONSTRAINT [DF__个人所得税表__当月工资__640DD89F] DEFAULT (0) FOR [工资上限],
	CONSTRAINT [DF__个人所得税表__个人所得税率__6501FCD8] DEFAULT (0) FOR [个人所得税率],
	CONSTRAINT [DF_个人所得税表_速算扣除数] DEFAULT (0) FOR [速算扣除数],
	CONSTRAINT [DF_个人所得税表_修改标记] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF_个人所得税表_接收登记] DEFAULT (0) FOR [接收登记],
	CONSTRAINT [PK_个人所得税表] PRIMARY KEY  CLUSTERED 
	(
		[内部编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[个人简历子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__个人简历子集__修改标记__7C5A637C] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__个人简历子集__接收登记__7D4E87B5] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[主要论文著作子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__主要论文著作子集__修改标记__48A5B54C] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__主要论文著作子集__接收登记__4999D985] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[人事变更历史表] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[序号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[住房公积金子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__住房公积金子集__修改标记__71FCD09A] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__住房公积金子集__接收登记__72F0F4D3] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[养老保险信息子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__养老保险信息子集__修改标记__7DA38D70] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__养老保险信息子集__接收登记__7E97B1A9] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[兼任职务子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__兼任职务子集__修改标记__1CC7330E] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__兼任职务子集__接收登记__1DBB5747] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[军转干部子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__军转干部子集__修改标记__5046D714] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__军转干部子集__接收登记__513AFB4D] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[劳动争议子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__劳动争议子集__修改标记__33FF9E21] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__劳动争议子集__接收登记__34F3C25A] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[医疗保险子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__医疗保险子集__修改标记__76026BA8] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__医疗保险子集__接收登记__76F68FE1] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[单位人员编制子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__单位人员编制子集__修改标记__1372D2FE] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__单位人员编制子集__接收登记__1466F737] DEFAULT (0) FOR [接收登记],
	 PRIMARY KEY  CLUSTERED 
	(
		[单位编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[单位参统信息子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__单位参统信息子集__修改标记__4BD727B2] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__单位参统信息子集__接收登记__4CCB4BEB] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[单位月度汇总台帐子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__单位月度汇总台帐子集__修改标记__10B661E4] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__单位月度汇总台帐子集__接收登记__11AA861D] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[单位机构情况子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__单位机构情况子集__修改标记__0DB9F9A8] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__单位机构情况子集__接收登记__0EAE1DE1] DEFAULT (0) FOR [接收登记],
	 PRIMARY KEY  CLUSTERED 
	(
		[单位编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[合同变动子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__合同变动子集__修改标记__1D1C38C9] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__合同变动子集__接收登记__1E105D02] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[合同管理子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__合同管理子集__修改标记__157B1701] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__合同管理子集__接收登记__166F3B3A] DEFAULT (0) FOR [接收登记],
	 PRIMARY KEY  CLUSTERED 
	(
		[合同编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[合同终止子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__合同终止子集__修改标记__288DEB75] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__合同终止子集__接收登记__29820FAE] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[合同续签子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__合同续签子集__修改标记__20ECC9AD] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__合同续签子集__接收登记__21E0EDE6] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[合同补充子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__合同补充子集__修改标记__194BA7E5] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__合同补充子集__接收登记__1A3FCC1E] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[合同解除子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__合同解除子集__修改标记__24BD5A91] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__合同解除子集__接收登记__25B17ECA] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[基本养老保险费列表] WITH NOCHECK ADD 
	CONSTRAINT [PK_基本养老保险费列表] PRIMARY KEY  CLUSTERED 
	(
		[职工编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[基本医疗保险费列表] WITH NOCHECK ADD 
	CONSTRAINT [PK_基本医疗保险费列表] PRIMARY KEY  CLUSTERED 
	(
		[职工编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[失业保险信息子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__失业保险信息子集__修改标记__302F0D3D] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__失业保险信息子集__接收登记__31233176] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[失业保险费列表] WITH NOCHECK ADD 
	CONSTRAINT [PK_失业保险费列表] PRIMARY KEY  CLUSTERED 
	(
		[职工编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[学历及学位子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__学历及学位子集__接收登记__6E0C4425] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[岗位变更子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__岗位变更子集__修改标记__69C77D4C] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__岗位变更子集__接收登记__6ABBA185] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[工资统计历史表] WITH NOCHECK ADD 
	CONSTRAINT [DF__工资统计历史表__修改标记__3C5FD9F8] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__工资统计历史表__接收登记__3D53FE31] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[干部调整与交流子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__干部调整与交流子集__修改标记__18F6A22A] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__干部调整与交流子集__接收登记__19EAC663] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[应聘人员录用表] WITH NOCHECK ADD 
	CONSTRAINT [DF__应聘人员录用表__是否转入职员表__2AA05119] DEFAULT ('否') FOR [是否转入职员表],
	CONSTRAINT [PK_应聘人员录用表] PRIMARY KEY  CLUSTERED 
	(
		[应聘人编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[应聘人员登记表] WITH NOCHECK ADD 
	CONSTRAINT [DF__应聘人员登记表__性别__2C88998B] DEFAULT ('男') FOR [性别],
	CONSTRAINT [DF__应聘人员登记表__婚姻状况__2D7CBDC4] DEFAULT ('未婚') FOR [婚姻状况],
	CONSTRAINT [PK_应聘人员登记表] PRIMARY KEY  CLUSTERED 
	(
		[应聘人编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[当月加班费列表] WITH NOCHECK ADD 
	CONSTRAINT [PK_当月加班费列表] PRIMARY KEY  CLUSTERED 
	(
		[职员编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[当月考核工资列表] WITH NOCHECK ADD 
	CONSTRAINT [PK_当月考核工资列表] PRIMARY KEY  CLUSTERED 
	(
		[职员编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[招聘初选名单表] WITH NOCHECK ADD 
	CONSTRAINT [DF__招聘初选名单表__初选状态__351DDF8C] DEFAULT ('未选') FOR [初选状态],
	CONSTRAINT [PK_招聘初选名单表] PRIMARY KEY  CLUSTERED 
	(
		[应聘人编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[招聘申请表] WITH NOCHECK ADD 
	CONSTRAINT [DF_招聘申请表_接收登记] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[招聘计划表] WITH NOCHECK ADD 
	CONSTRAINT [DF__招聘计划表__拟招聘人数__3AD6B8E2] DEFAULT (0) FOR [拟招聘人数],
	CONSTRAINT [PK_招聘计划表] PRIMARY KEY  CLUSTERED 
	(
		[招聘计划编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[政治面貌及党籍情况] WITH NOCHECK ADD 
	CONSTRAINT [DF__政治面貌及党籍情况__修改标记__33AA9866] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__政治面貌及党籍情况__接收登记__349EBC9F] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[教育经历证书列表] WITH NOCHECK ADD 
	CONSTRAINT [PK_教育经历证书列表] PRIMARY KEY  CLUSTERED 
	(
		[职员编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[月工资统计表] WITH NOCHECK ADD 
	CONSTRAINT [DF__月工资统计表__修改标记__39836D4D] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__月工资统计表__接收登记__3A779186] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[月考勤汇总表] WITH NOCHECK ADD 
	CONSTRAINT [DF__月考勤汇总表__迟到次数__7F80E8EA] DEFAULT (0) FOR [迟到次数],
	CONSTRAINT [DF__月考勤汇总表__早退次数__00750D23] DEFAULT (0) FOR [早退次数],
	CONSTRAINT [DF__月考勤汇总表__矿工次数__0169315C] DEFAULT (0) FOR [矿工次数],
	CONSTRAINT [DF__月考勤汇总表__请假次数__025D5595] DEFAULT (0) FOR [请假次数],
	CONSTRAINT [DF__月考勤汇总表__加班时间__035179CE] DEFAULT (0) FOR [加班时间]
GO

ALTER TABLE [dbo].[档案借用表] WITH NOCHECK ADD 
	CONSTRAINT [DF__档案借用表__修改标记__749A117A] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__档案借用表__接收登记__758E35B3] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[档案列表] WITH NOCHECK ADD 
	CONSTRAINT [DF__档案列表__修改标记__786AA25E] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__档案列表__接收登记__795EC697] DEFAULT (0) FOR [接收登记],
	 PRIMARY KEY  CLUSTERED 
	(
		[档案编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[档案存入登记表] WITH NOCHECK ADD 
	CONSTRAINT [DF__档案存入登记表__修改标记__542D41E8] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__档案存入登记表__接收登记__55216621] DEFAULT (0) FOR [接收登记],
	 PRIMARY KEY  CLUSTERED 
	(
		[档案编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[档案查询申请表] WITH NOCHECK ADD 
	CONSTRAINT [DF__档案查询申请表__审批情况__5C37ACAD] DEFAULT ('未审') FOR [审批情况]
GO

ALTER TABLE [dbo].[档案转出表] WITH NOCHECK ADD 
	CONSTRAINT [DF__档案转出表__修改标记__71BDA4CF] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__档案转出表__接收登记__72B1C908] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[生育保险信息子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__生育保险信息子集__修改标记__01741E54] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__生育保险信息子集__接收登记__0268428D] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[用户清单] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[用户编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[社会保险子集] WITH NOCHECK ADD 
	CONSTRAINT [DF_社会保险子集_缴费基数] DEFAULT (0) FOR [缴费基数],
	CONSTRAINT [DF_社会保险子集_养老险个人缴费比例] DEFAULT (0) FOR [养老险个人缴费比例],
	CONSTRAINT [DF_社会保险子集_养老险个人缴费额] DEFAULT (0) FOR [养老险个人缴费额],
	CONSTRAINT [DF_社会保险子集_医疗险个人缴费比例] DEFAULT (0) FOR [医疗险个人缴费比例],
	CONSTRAINT [DF_社会保险子集_医疗险个人缴费额] DEFAULT (0) FOR [医疗险个人缴费额],
	CONSTRAINT [DF_社会保险子集_补充医疗险个人缴费额] DEFAULT (0) FOR [补充医疗险个人缴费额],
	CONSTRAINT [DF_社会保险子集_失业险个人缴费比例] DEFAULT (0) FOR [失业险个人缴费比例],
	CONSTRAINT [DF_社会保险子集_失业险个人缴费额] DEFAULT (0) FOR [失业险个人缴费额],
	CONSTRAINT [DF_社会保险子集_生育险个人缴费比例] DEFAULT (0) FOR [生育险个人缴费比例],
	CONSTRAINT [DF_社会保险子集_生育险个人缴费额] DEFAULT (0) FOR [生育险个人缴费额],
	CONSTRAINT [DF_社会保险子集_工伤险个人缴费比例] DEFAULT (0) FOR [工伤险个人缴费比例],
	CONSTRAINT [DF_社会保险子集_工伤险个人缴费额] DEFAULT (0) FOR [工伤险个人缴费额],
	CONSTRAINT [DF_社会保险子集_养老险企业缴费比例] DEFAULT (0) FOR [养老险企业缴费比例],
	CONSTRAINT [DF_社会保险子集_养老险企业缴费额] DEFAULT (0) FOR [养老险企业缴费额],
	CONSTRAINT [DF_社会保险子集_养老险企业划入比例] DEFAULT (0) FOR [养老险企业划入比例],
	CONSTRAINT [DF_社会保险子集_养老险企业划入额] DEFAULT (0) FOR [养老险企业划入额],
	CONSTRAINT [DF_社会保险子集_医疗险企业缴费比例] DEFAULT (0) FOR [医疗险企业缴费比例],
	CONSTRAINT [DF_社会保险子集_医疗险企业缴费额] DEFAULT (0) FOR [医疗险企业缴费额],
	CONSTRAINT [DF_社会保险子集_医疗险企业划入比例] DEFAULT (0) FOR [医疗险企业划入比例],
	CONSTRAINT [DF_社会保险子集_医疗险企业划入额] DEFAULT (0) FOR [医疗险企业划入额],
	CONSTRAINT [DF_社会保险子集_补充医疗险企业缴费比例] DEFAULT (0) FOR [补充医疗险企业缴费比例],
	CONSTRAINT [DF_社会保险子集_补充医疗险企业缴费额] DEFAULT (0) FOR [补充医疗险企业缴费额],
	CONSTRAINT [DF_社会保险子集_失业险企业缴费比例] DEFAULT (0) FOR [失业险企业缴费比例],
	CONSTRAINT [DF_社会保险子集_失业险企业缴费额] DEFAULT (0) FOR [失业险企业缴费额],
	CONSTRAINT [DF_社会保险子集_生育险企业缴费比例] DEFAULT (0) FOR [生育险企业缴费比例],
	CONSTRAINT [DF_社会保险子集_生育险企业缴费额] DEFAULT (0) FOR [生育险企业缴费额],
	CONSTRAINT [DF_社会保险子集_工伤险企业缴费比例] DEFAULT (0) FOR [工伤险企业缴费比例],
	CONSTRAINT [DF_社会保险子集_工伤险企业缴费额] DEFAULT (0) FOR [工伤险企业缴费额],
	CONSTRAINT [DF_社会保险子集_公积金缴费基数] DEFAULT (0) FOR [公积金缴费基数],
	CONSTRAINT [DF_社会保险子集_公积金个人缴费比例] DEFAULT (0) FOR [公积金个人缴费比例],
	CONSTRAINT [DF_社会保险子集_公积金个人缴费额] DEFAULT (0) FOR [公积金个人缴费额],
	CONSTRAINT [DF_社会保险子集_公积金企业缴费比例] DEFAULT (0) FOR [公积金企业缴费比例],
	CONSTRAINT [DF_社会保险子集_公积金企业缴费额] DEFAULT (0) FOR [公积金企业缴费额],
	CONSTRAINT [DF__社会保险子集__修改标记__4AADF94F] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__社会保险子集__接收登记__4BA21D88] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[离休退休子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__离休退休子集__修改标记__541767F8] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__离休退休子集__接收登记__550B8C31] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[组织机构编码表] WITH NOCHECK ADD 
	CONSTRAINT [DF__组织机构编码表__修改标记__75CD617E] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__组织机构编码表__接收登记__76C185B7] DEFAULT (0) FOR [接收登记],
	CONSTRAINT [PK_组织机构编码表] PRIMARY KEY  CLUSTERED 
	(
		[单位编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[经济补偿合同] WITH NOCHECK ADD 
	CONSTRAINT [DF__经济补偿合同__修改标记__6CF8EFB2] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__经济补偿合同__接收登记__6DED13EB] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[职员主要关系人信息表] WITH NOCHECK ADD 
	CONSTRAINT [DF__职员主要关系人信息表__修改标记__05E3CDB6] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__职员主要关系人信息表__接收登记__06D7F1EF] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[职员基本信息表] WITH NOCHECK ADD 
	CONSTRAINT [DF_职员基本信息表_是否执业药师] DEFAULT ('否') FOR [是否执业药师],
	CONSTRAINT [DF__职员基本信息表__修改标记__23A93AC7] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__职员基本信息表__接收登记__249D5F00] DEFAULT (0) FOR [接收登记],
	CONSTRAINT [PK__职员基本信息表__22B5168E] PRIMARY KEY  CLUSTERED 
	(
		[职员编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[职员奖励表] WITH NOCHECK ADD 
	CONSTRAINT [DF__职员奖励表__奖励金额__75035A77] DEFAULT (0) FOR [奖励金额],
	CONSTRAINT [DF__职员奖励表__是否计入工资__75F77EB0] DEFAULT ('否') FOR [是否计入工资]
GO

ALTER TABLE [dbo].[职员工资项目表] WITH NOCHECK ADD 
	CONSTRAINT [PK_职员工资项目表] PRIMARY KEY  CLUSTERED 
	(
		[职员编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[职员惩罚表] WITH NOCHECK ADD 
	CONSTRAINT [DF__职员惩罚表__惩罚金额__78D3EB5B] DEFAULT (0) FOR [惩罚金额],
	CONSTRAINT [DF__职员惩罚表__是否计入工资__79C80F94] DEFAULT ('否') FOR [是否计入工资]
GO

ALTER TABLE [dbo].[职员离职登记表] WITH NOCHECK ADD 
	CONSTRAINT [DF__职员离职登记表__修改标记__5F49EED9] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__职员离职登记表__接收登记__603E1312] DEFAULT (0) FOR [接收登记],
	CONSTRAINT [PK_职员离职登记表] PRIMARY KEY  CLUSTERED 
	(
		[职员编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[职工参险信息子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__职工参险信息子集__修改标记__5EB4F1FC] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__职工参险信息子集__接收登记__5FA91635] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[聘任合同列表] WITH NOCHECK ADD 
	CONSTRAINT [PK_聘任合同列表] PRIMARY KEY  CLUSTERED 
	(
		[聘任合同编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[行政党派职务子集] WITH NOCHECK ADD 
	CONSTRAINT [DF__行政党派职务子集__修改标记__0D84EF7E] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__行政党派职务子集__接收登记__0E7913B7] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[行政及党内奖励] WITH NOCHECK ADD 
	CONSTRAINT [DF__行政及党内奖励__修改标记__41049384] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__行政及党内奖励__接收登记__41F8B7BD] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[行政及党内惩罚] WITH NOCHECK ADD 
	CONSTRAINT [DF__行政及党内惩罚__修改标记__44D52468] DEFAULT ('1') FOR [修改标记],
	CONSTRAINT [DF__行政及党内惩罚__接收登记__45C948A1] DEFAULT (0) FOR [接收登记]
GO

ALTER TABLE [dbo].[转入正式员工登记表] WITH NOCHECK ADD 
	CONSTRAINT [DF__转入正式员工登记表__是否转为正__0CDAE408] DEFAULT ('否') FOR [是否转为正式员工],
	CONSTRAINT [PK_转入正式员工登记表] PRIMARY KEY  CLUSTERED 
	(
		[应聘人编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[面试历史表] WITH NOCHECK ADD 
	CONSTRAINT [PK_面试历史表] PRIMARY KEY  CLUSTERED 
	(
		[应聘人编号]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[面试名单表] WITH NOCHECK ADD 
	CONSTRAINT [DF__面试名单表__录用情况__16644E42] DEFAULT ('未审') FOR [录用情况]
GO

ALTER TABLE [dbo].[专业技术职务子集] ADD 
	CONSTRAINT [专业技术职务子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[个人年度汇总台帐子集] ADD 
	CONSTRAINT [个人年度汇总台帐子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[个人简历子集] ADD 
	CONSTRAINT [个人简历子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[主要论文著作子集] ADD 
	CONSTRAINT [主要论文著作子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[住房公积金子集] ADD 
	CONSTRAINT [住房公积金子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[养老保险信息子集] ADD 
	CONSTRAINT [养老保险信息子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[兼任职务子集] ADD 
	CONSTRAINT [兼任职务子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[军转干部子集] ADD 
	CONSTRAINT [军转干部子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[劳动争议子集] ADD 
	CONSTRAINT [劳动争议子集_劳动合同编号_fk] FOREIGN KEY 
	(
		[合同编号]
	) REFERENCES [dbo].[合同管理子集] (
		[合同编号]
	)
GO

ALTER TABLE [dbo].[医疗保险子集] ADD 
	CONSTRAINT [医疗保险子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[合同变动子集] ADD 
	CONSTRAINT [合同变动子集_劳动合同编号_fk] FOREIGN KEY 
	(
		[合同编号]
	) REFERENCES [dbo].[合同管理子集] (
		[合同编号]
	)
GO

ALTER TABLE [dbo].[合同管理子集] ADD 
	CONSTRAINT [合同管理子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[合同终止子集] ADD 
	CONSTRAINT [合同终止子集_劳动合同编号_fk] FOREIGN KEY 
	(
		[合同编号]
	) REFERENCES [dbo].[合同管理子集] (
		[合同编号]
	)
GO

ALTER TABLE [dbo].[合同续签子集] ADD 
	CONSTRAINT [合同续签子集_劳动合同编号_fk] FOREIGN KEY 
	(
		[合同编号]
	) REFERENCES [dbo].[合同管理子集] (
		[合同编号]
	)
GO

ALTER TABLE [dbo].[合同补充子集] ADD 
	CONSTRAINT [合同补充子集_劳动合同编号_fk] FOREIGN KEY 
	(
		[合同编号]
	) REFERENCES [dbo].[合同管理子集] (
		[合同编号]
	)
GO

ALTER TABLE [dbo].[合同解除子集] ADD 
	CONSTRAINT [合同解除子集_劳动合同编号_fk] FOREIGN KEY 
	(
		[合同编号]
	) REFERENCES [dbo].[合同管理子集] (
		[合同编号]
	)
GO

ALTER TABLE [dbo].[失业保险信息子集] ADD 
	CONSTRAINT [失业保险信息子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[学历及学位子集] ADD 
	CONSTRAINT [学历及学位子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[干部调整与交流子集] ADD 
	CONSTRAINT [干部调整与交流子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[政治面貌及党籍情况] ADD 
	CONSTRAINT [政治面貌及党籍情况_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[生育保险信息子集] ADD 
	CONSTRAINT [生育保险信息子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[社会保险子集] ADD 
	CONSTRAINT [社会保险子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[离休退休子集] ADD 
	CONSTRAINT [离休退休子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[职员主要关系人信息表] ADD 
	CONSTRAINT [职员主要关系人信息表_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[职员离职登记表] ADD 
	CONSTRAINT [FK_职员离职登记表_职员基本信息表] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[职工参险信息子集] ADD 
	CONSTRAINT [职工参险信息子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[行政党派职务子集] ADD 
	CONSTRAINT [行政党派职务子集_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[行政及党内奖励] ADD 
	CONSTRAINT [行政及党内奖励_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[行政及党内惩罚] ADD 
	CONSTRAINT [行政及党内惩罚_职员编号_fk] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO


--- 初始化数据
insert into 用户清单 values('1','系统管理','sys','M','sys')
insert into 用户清单 values('zs','采购部','张三','M','sys')
insert into 用户清单 values('ls','销售部','李四','M','sys')
insert into 用户清单 values('ww','财务部','王五','M','sys')
go

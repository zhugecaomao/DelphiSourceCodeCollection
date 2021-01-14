if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_工资发放历史表_职员基本信息表]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[工资发放历史表] DROP CONSTRAINT FK_工资发放历史表_职员基本信息表
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_月工资统计表_职员基本信息表]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[月工资统计表] DROP CONSTRAINT FK_月工资统计表_职员基本信息表
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_职员惩罚表_职员基本信息表]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[职员惩罚表] DROP CONSTRAINT FK_职员惩罚表_职员基本信息表
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_职员奖励表_职员基本信息表]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[职员奖励表] DROP CONSTRAINT FK_职员奖励表_职员基本信息表
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[用户清单]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[用户清单]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[组织机构编码表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[组织机构编码表]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职员基本信息表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[职员基本信息表]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[月工资统计表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[月工资统计表]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[个人所得税表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[个人所得税表]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[工资发放历史表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[工资发放历史表]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职员奖励表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[职员奖励表]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[职员惩罚表]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[职员惩罚表]
GO

CREATE TABLE [dbo].[用户清单] (
	[用户编号] [char] (6) NOT NULL ,
	[部门] [char] (20) NOT NULL ,
	[姓名] [char] (10) NOT NULL ,
	[性别] [char] (2) NOT NULL ,
	[密码] [char] (10) NULL 
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
	[单位编号] [varchar] (20) NOT NULL PRIMARY KEY,
	[单位名称] [varchar] (100) NULL ,
	[拼音编码] [varchar] (50) NULL ,
	[单位地址] [varchar] (100) NULL ,
	[单位电话号码] [varchar] (50) NULL ,
	[开户银行] [varchar] (100) NULL ,
	[帐号] [varchar] (50) NULL ,
	[开户全称] [varchar] (100) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[职员基本信息表] (
	[内部编号] [int] IDENTITY (1, 1) NOT NULL ,
	[职员编号] [varchar] (30) NOT NULL PRIMARY KEY,
	[姓名] [varchar] (20) NOT NULL ,
	[姓名简码] [varchar] (10) NULL ,
	[性别] [varchar] (2) NULL ,
	[出生日期] [int] NULL ,
	[年龄] [int] NULL ,
	[籍贯] [varchar] (50) NULL ,
	[民族] [varchar] (20) NULL ,
	[文化程度] [char] (50) NULL ,
	[毕业学校] [char] (100) NULL ,
	[健康状况] [varchar] (50) NULL ,
	[婚姻状况] [varchar] (10) NULL ,
	[身份证号码] [varchar] (18) NULL ,
	[家庭电话] [varchar] (50) NULL ,
	[办公电话] [varchar] (50) NULL ,
	[手机] [varchar] (50) NULL ,
	[电子邮件地址] [varchar] (50) NULL ,
	[职工账号] [varchar] (20) NULL ,
	[单位编号] [varchar] (20) NULL, 
	[备注] [varchar] (100) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[月工资统计表] (
	[日期] [int] NULL ,
	[职员编号] [varchar] (30) Not NULL PRIMARY KEY,
	[基本工资] [float] NULL DEFAULT (0) ,
	[浮动工资] [decimal](26, 2) NULL DEFAULT (0) ,
	[合同补] [decimal](26, 2) NULL DEFAULT (0) ,
	[粮副补] [decimal](26, 2) NULL DEFAULT (0) ,
	[房补] [decimal](26, 2) NULL DEFAULT (0) ,
	[临时补] [decimal](26, 2) NULL DEFAULT (0) ,
	[职务工资] [decimal](26, 2) NULL DEFAULT (0) ,
	[工龄工资] [decimal](26, 2) NULL DEFAULT (0) ,
	[考核工资] [decimal](26, 2) NULL DEFAULT (0) ,
	[奖金] [decimal](26, 2) NULL DEFAULT (0) ,
	[应发金额合计] [decimal](26, 2) NULL DEFAULT (0) ,
	[房租] [decimal](26, 2) NULL DEFAULT (0) ,
	[水电费] [decimal](26, 2) NULL DEFAULT (0) ,
	[请假扣除] [decimal](26, 2) NULL DEFAULT (0) ,
	[考勤扣除] [decimal](26, 2) NULL DEFAULT (0) ,
	[罚款] [decimal](26, 2) NULL DEFAULT (0) ,
	[住房公积金] [decimal](26, 2) NULL DEFAULT (0) ,
	[医疗保险] [decimal](26, 2) NULL DEFAULT (0) ,
	[养老保险] [decimal](26, 2) NULL DEFAULT (0) ,
	[失业保险] [decimal](26, 2) NULL DEFAULT (0) ,
	[生育保险] [decimal](26, 2) NULL DEFAULT (0) ,
	[工伤保险] [decimal](26, 2) NULL DEFAULT (0) ,
	[应扣金额合计] [decimal](26, 2) NULL DEFAULT (0) ,
	[工资合计] [decimal](26, 2) NULL DEFAULT (0) ,
	[个人所得税] [decimal](26, 2) NULL DEFAULT (0) ,
	[实发金额] [decimal](26, 2) NULL DEFAULT (0) ,
	[发放否] [char] (10) NULL ,
	[月份] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[个人所得税表] (
	[编号] [int] NOT NULL PRIMARY KEY,
	[级数] [char] (2) NOT NULL ,
	[不计税工资] [decimal](26, 2) NOT NULL DEFAULT (800),
	[工资下限] [decimal](26, 2) NOT NULL DEFAULT (0),
	[工资上限] [decimal](26, 2) NOT NULL DEFAULT (0),
	[个人所得税率] [decimal](26, 2) NOT NULL DEFAULT (0),
	[速算扣除数] [decimal](26, 2) NOT NULL DEFAULT (0),
	[备注] [varchar] (50) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[工资发放历史表] (
	[日期] [int] NULL ,
	[职员编号] [varchar] (30) NULL ,
	[基本工资] [float] NULL ,
	[浮动工资] [decimal](26, 2) NULL ,
	[合同补] [decimal](26, 2) NULL ,
	[粮副补] [decimal](26, 2) NULL ,
	[房补] [decimal](26, 2) NULL ,
	[临时补] [decimal](26, 2) NULL ,
	[职务工资] [decimal](26, 2) NULL ,
	[工龄工资] [decimal](26, 2) NULL ,
	[考核工资] [decimal](26, 2) NULL ,
	[奖金] [decimal](26, 2) NULL ,
	[应发金额合计] [decimal](26, 2) NULL ,
	[房租] [decimal](26, 2) NULL ,
	[水电费] [decimal](26, 2) NULL ,
	[请假扣除] [decimal](26, 2) NULL ,
	[考勤扣除] [decimal](26, 2) NULL ,
	[罚款] [decimal](26, 2) NULL ,
	[住房公积金] [decimal](26, 2) NULL ,
	[医疗保险] [decimal](26, 2) NULL ,
	[养老保险] [decimal](26, 2) NULL ,
	[失业保险] [decimal](26, 2) NULL ,
	[生育保险] [decimal](26, 2) NULL ,
	[工伤保险] [decimal](26, 2) NULL ,
	[应扣金额合计] [decimal](26, 2) NULL ,
	[工资合计] [decimal](26, 2) NULL ,
	[个人所得税] [decimal](26, 2) NULL ,
	[实发金额] [decimal](26, 2) NULL ,
	[发放否] [char] (10) NULL ,
	[月份] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[职员奖励表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[职员编号] [varchar] (30) NOT NULL ,
	[奖励类型] [varchar] (20) NULL ,
	[奖励金额] [float] NULL DEFAULT (0),
	[是否计入工资] [char] (10) NULL DEFAULT ('否'),
	[奖励原因] [varchar] (50) NULL ,
	[部门意见] [varchar] (100) NULL ,
	[奖励日期] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[职员惩罚表] (
	[序号] [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[职员编号] [varchar] (30) NOT NULL ,
	[惩罚类型] [varchar] (20) NULL ,
	[惩罚金额] [float] NULL DEFAULT (0) ,
	[是否计入工资] [char] (10) NULL DEFAULT ('否'),
	[惩罚原因] [varchar] (50) NULL ,
	[部门意见] [varchar] (100) NULL ,
	[惩罚日期] [int] NULL
) ON [PRIMARY]
GO

-- 外键关联字段
ALTER TABLE [dbo].[月工资统计表] ADD 
	CONSTRAINT [FK_月工资统计表_职员基本信息表] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[工资发放历史表] ADD 
	CONSTRAINT [FK_工资发放历史表_职员基本信息表] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[职员奖励表] ADD 
	CONSTRAINT [FK_职员奖励表_职员基本信息表] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

ALTER TABLE [dbo].[职员惩罚表] ADD 
	CONSTRAINT [FK_职员惩罚表_职员基本信息表] FOREIGN KEY 
	(
		[职员编号]
	) REFERENCES [dbo].[职员基本信息表] (
		[职员编号]
	)
GO

-- 存储过程
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_空数据置0]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_空数据置0]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_形成月工资统计表]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_形成月工资统计表]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_当月工资统计]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_当月工资统计]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sf_当月工资发放]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sf_当月工资发放]
GO
-----------------------
create procedure sf_空数据置0
as
begin transaction
	update 月工资统计表 set 基本工资=0 where 基本工资 is null
	update 月工资统计表 set 职务工资=0 where 职务工资 is null
	update 月工资统计表 set 工龄工资=0 where 工龄工资 is null
	update 月工资统计表 set 考核工资=0 where 考核工资 is null
	update 月工资统计表 set 奖金=0 where 奖金 is null
	update 月工资统计表 set 应发金额合计=0 where 应发金额合计 is null
	update 月工资统计表 set 房租=0 where 房租 is null
	update 月工资统计表 set 水电费=0 where 水电费 is null
	update 月工资统计表 set 请假扣除=0 where 请假扣除 is null
	update 月工资统计表 set 罚款=0 where 罚款 is null
	update 月工资统计表 set 考勤扣除=0 where 考勤扣除 is null
	update 月工资统计表 set 住房公积金=0 where 住房公积金 is null
	update 月工资统计表 set 医疗保险=0 where 医疗保险 is null
	update 月工资统计表 set 养老保险=0 where 养老保险 is null
	update 月工资统计表 set 应扣金额合计=0 where 应扣金额合计 is null
	update 月工资统计表 set 失业保险=0 where 失业保险 is null
	update 月工资统计表 set 个人所得税=0 where 个人所得税 is null
	update 月工资统计表 set 工资合计=0 where 工资合计 is null
	update 月工资统计表 set 实发金额=0 where 实发金额 is null
	update 个人所得税表 set 个人所得税率=0 where 个人所得税率 is null
commit
GO
-------------------------------------
create procedure sf_当月工资统计
as
begin transaction
	declare @month int
	select @month = 日期 from 月工资统计表
	-- 计算奖金
	update 月工资统计表 set 奖金 = 
		(select sum(奖励金额) from 职员奖励表 as i where i.是否计入工资='是' and 
		i.奖励日期>@month*100 and i.奖励日期<(@month+1)*100 
		group by i.职员编号 having i.职员编号=月工资统计表.职员编号)
	update 月工资统计表 set 奖金=0 where 奖金 is null
	-- 计算惩罚
	update 月工资统计表 set 罚款 = 
		(select sum(惩罚金额) from 职员惩罚表 as i where i.是否计入工资='是' and 
		i.惩罚日期>@month*100 and i.惩罚日期<(@month+1)*100 
		group by i.职员编号 having i.职员编号=月工资统计表.职员编号)
	update 月工资统计表 set 罚款=0 where 罚款 is null
	-- 将空数据置0
	exec sf_空数据置0
	-- 计算应发/应扣/工资合计
	update 月工资统计表
		set 应扣金额合计 = 房租+水电费+请假扣除+罚款+考勤扣除+住房公积金+医疗保险
			+养老保险+失业保险
	update 月工资统计表
		set 应发金额合计=基本工资+浮动工资+合同补+粮副补+房补+临时补
			+职务工资+工龄工资+ 考核工资+ 奖金
	update 月工资统计表
		set 工资合计 = 应发金额合计 - 应扣金额合计
	-- 计算个人所得税
	declare @gzhj numeric(20,4), @zybh varchar(20), @grsds numeric(20,4),@sl float, 
		@gzxx numeric(20,4),@gzsx numeric(20,4)
	declare mycur cursor for select 职员编号,工资合计 from 月工资统计表
	open mycur
	fetch next from mycur into @zybh,@gzhj
	WHILE (@@FETCH_STATUS = 0 )
	BEGIN
		-- 扣除不计税部分
		select @gzhj = @gzhj - (select top 1 不计税工资 from 个人所得税表 order by 级数)
		select @grsds = 0
		declare mycur1 cursor for select 工资下限,工资上限,case when 
			个人所得税率>1 then 个人所得税率/100 else 个人所得税率 end 
			from 个人所得税表 where 工资上限 <= @gzhj order by 工资上限  
		open mycur1
		fetch next from mycur1 into @gzxx, @gzsx,@sl
		WHILE (@@FETCH_STATUS = 0 )
		BEGIN
			select @grsds = @grsds + (@gzsx-@gzxx)*@sl
			fetch next from mycur1 into @gzxx, @gzsx,@sl
		END
		close mycur1
		deallocate mycur1
		select @sl = case when 个人所得税率>1 then 个人所得税率/100 else 
			个人所得税率 end , @gzxx = 工资下限 from 个人所得税表 
			where 工资下限=@gzsx
		select @grsds = @grsds + (@gzhj-@gzxx)*@sl

		update 月工资统计表 set 个人所得税 = @grsds where current of mycur
		fetch next from mycur into @zybh,@gzhj
	END
	close mycur
	deallocate mycur
	-- 计算实发工资
	update 月工资统计表 set 实发金额 = 工资合计-个人所得税
commit
GO
-------------------------------------
create procedure sf_形成月工资统计表 @导入工资月份 int, @统计工资月份 int
as
begin transaction
	delete from 月工资统计表    -- 删除已有数据
	if exists (select * from 工资发放历史表 where 日期=@导入工资月份)
	begin
		-- 从历史倒入
		insert into 月工资统计表
			(日期, 职员编号, 基本工资, 浮动工资, 合同补, 粮副补, 房补, 临时补, 
			职务工资, 工龄工资, 考核工资, 奖金, 应发金额合计, 房租, 水电费,
			请假扣除, 考勤扣除, 罚款, 住房公积金, 医疗保险, 养老保险, 失业保险, 
			生育保险, 工伤保险, 应扣金额合计, 工资合计, 个人所得税, 实发金额,
			发放否, 月份)
			select @统计工资月份, 职员编号, 基本工资, 浮动工资, 合同补, 粮副补, 
			房补, 临时补, 职务工资, 工龄工资, 考核工资, 奖金, 
			应发金额合计, 房租, 水电费, 请假扣除, 考勤扣除, 罚款,
			住房公积金, 医疗保险, 养老保险, 失业保险, 生育保险, 
			工伤保险, 应扣金额合计, 工资合计, 个人所得税, 实发金额,
			发放否, 月份
			from 工资发放历史表 as h where h.日期=@导入工资月份 
	end
	-- 新的员工,历史没有记录,生成记录
	insert into 月工资统计表	(职员编号,日期) select 职员编号,@统计工资月份 
		from 职员基本信息表 as h where h.职员编号 not in 
		(select 职员编号 from  月工资统计表)
	-- 将空数据置0
	exec sf_空数据置0
	-- 自动计算工资
	exec sf_当月工资统计
commit
GO
--------------------- 发放指定职员的工资
create procedure sf_当月工资发放 @职员编号 char(10)
as
begin transaction
	update 月工资统计表 set 发放否='是' from 月工资统计表 
		where 职员编号=@职员编号
	insert into 工资发放历史表
		select * from 月工资统计表 
		where 职员编号=@职员编号
	delete 月工资统计表 where 职员编号=@职员编号
commit
GO

--- 初始化数据
insert into 用户清单 values('1','系统管理','sys','M','sys')
insert into 用户清单 values('zs','采购部','张三','M','sys')
insert into 用户清单 values('ls','销售部','李四','M','sys')
insert into 用户清单 values('ww','财务部','王五','M','sys')
go

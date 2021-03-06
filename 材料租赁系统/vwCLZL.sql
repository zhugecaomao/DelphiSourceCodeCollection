/****** Object:  View dbo.VW_Shdj    Script Date: 2004-05-12 0:58:31 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_Shdj]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_Shdj]
GO

/****** Object:  View dbo.vW_Fcdj    Script Date: 2004-05-12 0:58:31 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vW_Fcdj]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vW_Fcdj]
GO

/****** Object:  View dbo.vw_cl_sp    Script Date: 2004-05-12 0:58:31 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vw_cl_sp]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vw_cl_sp]
GO

/****** Object:  View dbo.vw_fc    Script Date: 2004-05-12 0:58:31 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vw_fc]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vw_fc]
GO

/****** Object:  View dbo.vw_sfdj    Script Date: 2004-05-12 0:58:31 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vw_sfdj]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vw_sfdj]
GO

/****** Object:  View dbo.vw_sh    Script Date: 2004-05-12 0:58:31 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vw_sh]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vw_sh]
GO

/****** Object:  View dbo.vw_clfc    Script Date: 2004-05-12 0:58:31 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vw_clfc]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vw_clfc]
GO

/****** Object:  View dbo.vw_cljxb    Script Date: 2004-05-12 0:58:31 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vw_cljxb]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vw_cljxb]
GO

/****** Object:  View dbo.vw_clsh    Script Date: 2004-05-12 0:58:31 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vw_clsh]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vw_clsh]
GO

/****** Object:  View dbo.vw_cx    Script Date: 2004-05-12 0:58:31 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vw_cx]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vw_cx]
GO

/****** Object:  Table [dbo].[bmbmk]    Script Date: 2004-05-12 0:58:31 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bmbmk]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bmbmk]
GO

/****** Object:  Table [dbo].[cljxb]    Script Date: 2004-05-12 0:58:31 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[cljxb]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[cljxb]
GO

/****** Object:  Table [dbo].[sfdj]    Script Date: 2004-05-12 0:58:31 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sfdj]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sfdj]
GO

/****** Object:  Table [dbo].[spbmk]    Script Date: 2004-05-12 0:58:31 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spbmk]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[spbmk]
GO

/****** Object:  Table [dbo].[bmbmk]    Script Date: 2004-05-12 0:58:32 ******/
CREATE TABLE [dbo].[bmbmk] (
	[bmbh] [nchar] (10) NOT NULL ,
	[bmname] [nchar] (20) NULL ,
	[bmjc] [nchar] (10) NULL ,
	[bmsx] [nchar] (10) NULL ,
	[bmfzr] [nchar] (10) NULL ,
	[bmdz] [nvarchar] (100) NULL ,
	[bmlxdh] [nchar] (20) NULL ,
	[bz] [nvarchar] (200) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[cljxb]    Script Date: 2004-05-12 0:58:32 ******/
CREATE TABLE [dbo].[cljxb] (
	[ynsf] [bit] NULL ,
	[sfno] [nchar] (12) NULL ,
	[sdate] [datetime] NULL ,
	[bmbh] [nchar] (10) NULL ,
	[spbh] [nchar] (8) NULL ,
	[spmc] [nchar] (50) NULL ,
	[jldw] [nchar] (10) NULL ,
	[spdj] [money] NULL ,
	[fcsl] [float] NULL ,
	[hssl] [float] NULL ,
	[zlts] [int] NULL ,
	[money] [float] NULL ,
	[jMoney] [float] NULL ,
	[jsje] [float] NULL ,
	[ynqc] [bit] NULL ,
	[ynjs] [bit] NULL ,
	[yntz] [bit] NULL ,
	[ynjz] [bit] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sfdj]    Script Date: 2004-05-12 0:58:32 ******/
CREATE TABLE [dbo].[sfdj] (
	[seri] [int] IDENTITY (1, 1) NOT NULL ,
	[sfno] [nchar] (12) NULL ,
	[ynsf] [bit] NULL ,
	[ynjs] [bit] NULL ,
	[spbh] [nchar] (8) NULL ,
	[bmbh] [nchar] (4) NULL ,
	[sfrq] [datetime] NULL ,
	[dj] [float] NULL ,
	[fcsl] [float] NULL ,
	[fczj] [float] NULL ,
	[shsl] [float] NULL ,
	[shzj] [float] NULL ,
	[jcsl] [float] NULL ,
	[jczj] [float] NULL ,
	[djzy] [nchar] (50) NULL ,
	[fhr] [nchar] (10) NULL ,
	[jsr] [nchar] (10) NULL ,
	[jzr] [nchar] (10) NULL ,
	[ynqc] [bit] NULL ,
	[ynjz] [bit] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[spbmk]    Script Date: 2004-05-12 0:58:32 ******/
CREATE TABLE [dbo].[spbmk] (
	[spbh] [nchar] (8) NOT NULL ,
	[spmc] [nchar] (50) NULL ,
	[ggxh] [nchar] (10) NULL ,
	[spdj] [money] NULL ,
	[jldw] [nchar] (10) NULL ,
	[bz] [nchar] (50) NULL ,
	[jldw2] [nchar] (10) NULL ,
	[hsbl] [float] NULL ,
	[tzcl] [bit] NULL 
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  View dbo.vw_clfc    Script Date: 2004-05-12 0:58:32 ******/
CREATE VIEW dbo.vw_clfc
AS
SELECT dbo.sfdj.sfno, dbo.sfdj.spbh, dbo.sfdj.bmbh, dbo.sfdj.sfrq, dbo.sfmx.Cl_0, 
      dbo.sfmx.cl_1, dbo.sfmx.cl_2, dbo.sfmx.cl_3, dbo.sfmx.cl_4, dbo.sfmx.cl_5, 
      dbo.sfmx.cl_6, dbo.sfmx.cl_7, dbo.sfmx.cl_8, dbo.sfmx.cl_9, dbo.sfmx.clTal, 
      dbo.sfdj.cfdj, dbo.sfdj.fczj, dbo.sfdj.djzy
FROM dbo.sfdj INNER JOIN
      dbo.sfmx ON dbo.sfdj.sfno = dbo.sfmx.sfno
WHERE (dbo.sfdj.ynsf = 0) AND (dbo.sfmx.ynsf = 0)

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  View dbo.vw_cljxb    Script Date: 2004-05-12 0:58:32 ******/
CREATE VIEW dbo.vw_cljxb
AS
SELECT bmbh, spbh, ynsf, sdate, SUM(fcsl) AS fcsl, SUM(hssl) AS hssl, SUM(money) 
      AS money, SUM(jsje) AS jsje, SUM(jMoney) AS jMoney, ynqc, zlts
FROM dbo.cljxb
GROUP BY bmbh, spbh, ynsf, ynqc, sdate, zlts

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  View dbo.vw_clsh    Script Date: 2004-05-12 0:58:32 ******/
CREATE VIEW dbo.vw_clsh
AS
SELECT dbo.sfdj.sfno, dbo.sfdj.spbh, dbo.sfdj.bmbh, dbo.sfdj.sfrq, dbo.sfmx.Cl_0, 
      dbo.sfmx.cl_1, dbo.sfmx.cl_2, dbo.sfmx.cl_3, dbo.sfmx.cl_4, dbo.sfmx.cl_5, 
      dbo.sfmx.cl_6, dbo.sfmx.cl_7, dbo.sfmx.cl_8, dbo.sfmx.cl_9, dbo.sfmx.clTal, 
      dbo.sfdj.shdj, dbo.sfdj.shzj, dbo.sfdj.djzy
FROM dbo.sfdj INNER JOIN
      dbo.sfmx ON dbo.sfdj.sfno = dbo.sfmx.sfno
WHERE (dbo.sfdj.ynsf = 1) AND (dbo.sfmx.ynsf = 1)

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  View dbo.vw_cx    Script Date: 2004-05-12 0:58:32 ******/
CREATE VIEW dbo.vw_cx
AS
SELECT sfno, spbh, bmbh, sfrq, fcdj, fczj, djzy, shdj, shzj, fczj - shzj AS ye
FROM dbo.sfdj

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  View dbo.VW_Shdj    Script Date: 2004-05-12 0:58:32 ******/
CREATE VIEW dbo.VW_SHDJ
AS
SELECT MAX(sfno) AS SFNO
FROM dbo.sfdj
WHERE (ynqc = 0) AND (ynsf = 1)

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  View dbo.vW_Fcdj    Script Date: 2004-05-12 0:58:32 ******/
CREATE VIEW dbo.vW_Djfc
AS
SELECT MAX(sfno) AS SFNO
FROM dbo.sfdj
WHERE (ynqc = 0) AND (ynsf = 0)

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  View dbo.vw_cl_sp    Script Date: 2004-05-12 0:58:32 ******/
CREATE VIEW dbo.vw_cl_sp
AS
SELECT TOP 100 PERCENT dbo.vw_cljxb.bmbh, dbo.vw_cljxb.spbh, dbo.vw_cljxb.ynsf, 
      dbo.vw_cljxb.sdate, dbo.vw_cljxb.fcsl, dbo.vw_cljxb.hssl, dbo.vw_cljxb.money, 
      dbo.vw_cljxb.jsje, dbo.vw_cljxb.jMoney, dbo.vw_cljxb.ynqc, dbo.spbmk.spmc, 
      dbo.spbmk.ggxh, dbo.spbmk.jldw, dbo.spbmk.spdj, dbo.vw_cljxb.zlts
FROM dbo.vw_cljxb INNER JOIN
      dbo.spbmk ON dbo.vw_cljxb.spbh = dbo.spbmk.spbh
ORDER BY dbo.vw_cljxb.sdate

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  View dbo.vw_fc    Script Date: 2004-05-12 0:58:32 ******/
CREATE VIEW dbo.vw_fc
AS
SELECT TOP 100 PERCENT dbo.cljxb.sfno, dbo.cljxb.sdate, dbo.cljxb.bmbh, 
      dbo.cljxb.spbh, dbo.cljxb.spdj, dbo.cljxb.zlts, dbo.cljxb.money, dbo.spbmk.spmc, 
      dbo.spbmk.jldw, dbo.cljxb.hssl, dbo.cljxb.fcsl, dbo.cljxb.jldw AS Expr1, 
      dbo.cljxb.jMoney, dbo.cljxb.jsje, dbo.cljxb.ynqc, dbo.cljxb.ynjs, dbo.cljxb.yntz, 
      dbo.cljxb.ynjz
FROM dbo.cljxb INNER JOIN
      dbo.spbmk ON dbo.cljxb.spbh = dbo.spbmk.spbh
WHERE (dbo.cljxb.ynsf = 0)
ORDER BY dbo.cljxb.sfno

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  View dbo.vw_sfdj    Script Date: 2004-05-12 0:58:32 ******/
CREATE VIEW dbo.vw_sfdj
AS
SELECT dbo.sfdj.sfno, dbo.sfdj.ynsf, dbo.sfdj.ynjs, dbo.sfdj.spbh, dbo.sfdj.bmbh, 
      dbo.sfdj.sfrq, dbo.sfdj.dj, dbo.sfdj.fcsl * dbo.spbmk.hsbl AS fcsl, dbo.sfdj.fczj, 
      dbo.sfdj.shsl * dbo.spbmk.hsbl AS shsl, dbo.sfdj.shzj, dbo.sfdj.jcsl, dbo.sfdj.jczj, 
      dbo.sfdj.djzy, dbo.sfdj.fhr, dbo.sfdj.jsr, dbo.sfdj.jzr, dbo.bmbmk.bmname, 
      dbo.spbmk.spmc, dbo.spbmk.hsbl, dbo.spbmk.jldw2, dbo.sfdj.ynqc, dbo.spbmk.jldw, 
      dbo.spbmk.bz, dbo.spbmk.ggxh
FROM dbo.sfdj INNER JOIN
      dbo.bmbmk ON dbo.sfdj.bmbh = dbo.bmbmk.bmbh INNER JOIN
      dbo.spbmk ON dbo.sfdj.spbh = dbo.spbmk.spbh

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  View dbo.vw_sh    Script Date: 2004-05-12 0:58:32 ******/
CREATE VIEW dbo.vw_sh
AS
SELECT TOP 100 PERCENT dbo.cljxb.sfno, dbo.cljxb.sdate, dbo.cljxb.bmbh, 
      dbo.cljxb.spbh, dbo.cljxb.spdj, dbo.cljxb.zlts, dbo.cljxb.money, dbo.spbmk.spmc, 
      dbo.spbmk.jldw, dbo.cljxb.spmc AS Expr1, dbo.cljxb.jldw AS Expr2, dbo.cljxb.fcsl, 
      dbo.cljxb.hssl, dbo.cljxb.jMoney, dbo.cljxb.jsje, dbo.cljxb.ynqc, dbo.cljxb.ynjs, 
      dbo.cljxb.yntz, dbo.cljxb.ynjz
FROM dbo.cljxb INNER JOIN
      dbo.spbmk ON dbo.cljxb.spbh = dbo.spbmk.spbh
WHERE (dbo.cljxb.ynsf = 1)
ORDER BY dbo.cljxb.sfno

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


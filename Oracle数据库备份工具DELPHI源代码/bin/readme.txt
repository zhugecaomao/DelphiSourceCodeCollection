『OracleBackupService』简要介绍
================================

功能特点：
========
1、OracleBackupService是一款Oracle数据库备份软件，基于NT服务模式运行；
2、调用Oracle内置的Exp.exe程序导出指定Oracle用户的所有数据对象；
3、可设置备份时间，可根据当前数据导出时间命名导出文件，可使用Zip格式压缩导出文件；
4、保存导出日志文件，记录命令行和窗口输出内容；
5、自动从注册表中取得Oracle的OraHome目录；

使用说明：
========
1、安装并启动服务后，系统系统栏显示托盘图标；
2、在图标上点击右键，出现功能菜单，设置参数和暂停服务；
3、根据日期命名的方式会在导出文件的主名后面加上导出的时间；
4、使用Zip格式压缩文件将导出的数据文件和日志文件压缩成同名Zip文件，并删除源文件；
5、执行InstallService.bat安装服务，StartService.bat启动服务；
6、执行StopService.bat停止服务，UnInstallService.bat卸载服务

                                               James.Q
                                               2006.04.21
                                               Mail:webtext@163.com
                                               Blog:http://www.blogjava.net/96sd2
                                               QQ:84771103

   ┏━━━━━━━━━━━━━━━━━━━━━┓
   ┃             源 码 爱 好 者               ┃
   ┣━━━━━━━━━━━━━━━━━━━━━┫
   ┃                                          ┃
   ┃           提供源码发布与下载             ┃
   ┃                                          ┃
   ┃        http://www.codefans.net           ┃
   ┃                                          ┃
   ┃            互助、分享、提高              ┃
   ┗━━━━━━━━━━━━━━━━━━━━━┛
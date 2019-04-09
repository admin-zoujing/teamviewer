# teamviewer

1.下载teamview centos版本，官网有rpm版本，官方下载地址： https://www.teamviewer.com/zhCN/download/linux/
  下载后，放到你的目录下，我的是在/mnt/下
[root@localhost mnt]# ls
teamviewer_12.0.76279.i686.rpm

2.安装
说明：用rpm 命令安装可能会出现缺少依赖，而导致安装失败
[root@localhost mnt]# yum -y install teamviewer_12.0.76279.i686.rpm 

3.接受license。

    停止服务。执行命令
[root@localhost mnt]# teamviewer daemon stop
    修改配置文件。 在文件/opt/teamviewer/config/global.conf末尾增加以下内容（由于只读限制，所以可能需要用到管理员权限）
[root@localhost mnt]# vim /opt/teamviewer/config/global.conf    
    [int32] EulaAccepted = 1
    [int32] EulaAcceptedRevision = 6
    重新启动服务
[root@localhost mnt]# teamviewer daemon restart

4.启动
默认会安装到/opt/teamview里面，并且安装成功会默认启动
cd /opt/teamviewer/tv_bin/
用teamviewer info命令可查看teamview运行状态
[root@localhost mnt]# cd /opt/teamviewer/tv_bin/
[root@localhost tv_bin]# teamviewer info

 TeamViewer                           12.0.76279  (RPM) 

 teamviewerd status                   teamviewerd start/running, process 15119 

 TeamViewer ID:                        
Try restarting the TeamViewer daemon (e.g. teamviewer --daemon restart)

如果没有设置密码，TeamViewer ID： 后面会是空的，
执行命令 teamviewer passwd 你的密码
再次运行teamviewer info命令就可以看到ID了

附录：
1.	cd /opt/teamviewer/tv_bin  
2.	teamviewer setup console #设置启动方式为控制台启动  
3.	teamviewer daemon restart  #重启teamview服务  
4.	teamviewer info #查看teamview信息  
5.	teamviewer passwd [PASSWD]   #设置密码  
6.	teamviewer --help  #查看帮助  
以关键字查看服务
rpm -q teamviewer
卸载rpm -e 查到的程序名

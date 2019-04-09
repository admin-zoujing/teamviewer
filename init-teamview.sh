#!/bin/bash

#安装rpm包
ntpdate cn.pool.ntp.org

chmod +x /usr/local/src/teamviewer/teamviewer_12.0.76279.i686.rpm
cd /usr/local/src/teamviewer
yum -y install teamviewer_12.0.76279.i686.rpm
sleep 3s

#停止服务
teamviewer daemon stop

#修改配置文件
cat >> /opt/teamviewer/config/global.conf <<EOF
[int32] EulaAccepted = 1
[int32] EulaAcceptedRevision = 6
EOF

#重启服务
teamviewer daemon start

#配置
cd /opt/teamviewer/tv_bin/
teamviewer info
teamviewer passwd SANzhink123
teamviewer setup console
teamviewer daemon restart
teamviewer info
sleep 8s
teamviewer info

echo 'teamviewer daemon start' >> /etc/rc.local 







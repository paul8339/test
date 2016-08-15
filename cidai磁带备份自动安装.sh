#!/bin/bash
#判断文件夹是否存在
if [ ! -d /test ];then
	mkdir /test
	mount -o loop -t iso9660  /tmp/NB_7.0_LinuxR_x8.iso /test
	echo '10.72.16.18     dbusrvbj01.hna.net' >> /etc/hosts
else
	echo 'The test directory is already exist!'
fi

#安装磁带备份程序
/test/install << EOF
3
y
dbusrvbj01.hna.net
y
4
EOF

#判断是否安装成功
if [ $? -eq 0 ];then
	echo  "############################################"
	echo "NetBackup is been installed successfully!"
	echo  "############################################"
else
	echo  "############################################"
	echo -e '\e[31;43mNetBackup is been installed fail, Please check it out!\e[0m'
	echo  "############################################"
fi

#查看进程,并卸载ISO
ps -ef|grep netbackup
#umount /test
#rm -rf /test

#!/bin/bash
#�ж��ļ����Ƿ����
if [ ! -d /test ];then
	mkdir /test
	mount -o loop -t iso9660  /tmp/NB_7.0_LinuxR_x8.iso /test
	echo '10.72.16.18     dbusrvbj01.hna.net' >> /etc/hosts
else
	echo 'The test directory is already exist!'
fi

#��װ�Ŵ����ݳ���
/test/install << EOF
3
y
dbusrvbj01.hna.net
y
4
EOF

#�ж��Ƿ�װ�ɹ�
if [ $? -eq 0 ];then
	echo  "############################################"
	echo "NetBackup is been installed successfully!"
	echo  "############################################"
else
	echo  "############################################"
	echo -e '\e[31;43mNetBackup is been installed fail, Please check it out!\e[0m'
	echo  "############################################"
fi

#�鿴����,��ж��ISO
ps -ef|grep netbackup
#umount /test
#rm -rf /test

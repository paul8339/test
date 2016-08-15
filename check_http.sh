#!/bin/bash

function http_check {
#设置环境变量
source /etc/profile

#判断httpd服务是否启动
service httpd status &> /dev/null

#或者
#/etc/init.d/httpd &> /dev/null

if [ $? -eq 0 ];then
	echo "################"
	echo "httpd is running"
else
	echo "####################################"
	echo "httpd is not running, restart it now"
	service httpd restart
fi
}

read -p "please input your choice(y/n):" input

case $input in
	y|Y)
		echo "#####################"
		echo 'apache will be start!'
		echo "#####################"
		http_check
		;;
	n|N)
		echo "###################"
		echo 'your input is exit!'
		echo "###################"
		;;	
	*)
 		echo "####################"
		echo 'your input is wrong!'
		echo "###################"
		;;	
esac

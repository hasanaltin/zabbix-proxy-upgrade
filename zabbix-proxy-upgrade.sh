#!/usr/bin/env bash


systemctl stop zabbix-proxy
rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/8/x86_64/zabbix-release-6.0-1.el8.noarch.rpm
dnf clean all 
yum makecache
yum upgrade zabbix-proxy-mysql -y
yum install zabbix-apache-conf -y 
systemctl start zabbix-proxy
zabbix_proxy --version
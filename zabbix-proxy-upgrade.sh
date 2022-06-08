#!/usr/bin/env bash

INSTALL_CMD="yum -y upgrade"


systemctl stop zabbix-proxy
rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/8/x86_64/zabbix-release-6.0-1.el8.noarch.rpm
dnf clean all 
yum makecache
$INSTALL_CMD zabbix-proxy-mysql
$INSTALL_CMD zabbix-apache-conf
systemctl start zabbix-proxy
zabbix_proxy --version

#!/bin/bash

yum -y upgrade
yum -y install nscd
service nscd restart
service ntpd restart
service iptables stop
chkconfig nscd on
echo "SELINUX=disabled" > /etc/selinux/config
 mkfs.ext4  /dev/xvdb
 mkfs.ext4  /dev/xvdc
 mkfs.ext4  /dev/xvdd
 mkfs.ext4  /dev/xvde
 mkdir /mnt/mount1
 mkdir /mnt/mount2
 mkdir /mnt/mount3
 mkdir /mnt/mount4
 echo "/dev/xvdb /mnt/mount1  ext4 defaults 0 0" >> /etc/fstab
 echo "/dev/xvdc /mnt/mount2  ext4 defaults 0 0" >> /etc/fstab
 echo "/dev/xvdd /mnt/mount3  ext4 defaults 0 0" >> /etc/fstab
 echo "/dev/xvde /mnt/mount4  ext4 defaults 0 0" >> /etc/fstab
 mount -a
echo "[cloudera-manager]
# Packages for Cloudera Manager, Version 4, on RedHat or CentOS 6 x86_64
name=Cloudera Manager
baseurl=http://archive.cloudera.com/cm4/redhat/6/x86_64/cm/4/
gpgkey = http://archive.cloudera.com/cm4/redhat/6/x86_64/cm/RPM-GPG-KEY-cloudera
gpgcheck = 1
" >> /etc/yum.repos.d/cloudera.repo

echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo " net.ipv6.conf.default.disable_ipv6 = 1 " >> /etc/sysctl.conf
echo " net.ipv6.conf.lo.disable_ipv6 = 1  " >> /etc/sysctl.conf
echo "vm.swappiness = 0" >> /etc/sysctl.conf

echo "hdfs - nofile 32768" >> /etc/security/limits.conf
echo "mapred - nofile 32768" >> /etc/security/limits.conf
echo "hbase - nofile 32768" >> /etc/security/limits.conf
echo "hdfs - nproc 32768" >> /etc/security/limits.conf
echo "mapred - nproc 32768" >> /etc/security/limits.conf
echo "hbase - nproc 32768" >> /etc/security/limits.conf
echo "SELINUX=disabled" > /etc/selinux/config
sysctl -a
(echo d; echo n; echo p; echo 1; echo ; echo ; echo w) | sudo fdisk /dev/xvda
shutdown -r 2
~
~

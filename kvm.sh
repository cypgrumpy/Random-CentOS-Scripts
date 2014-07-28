#!/bin/bash
clear
echo "INSTALLIN YO SHIT LIKE YOU WOULD.  THIS IS PROBABLY KVM AND SVM SLAVE!"
read -sn 1 -p "Press any key to continue..."
yum install kvm qemu-kvm python-virtinst libvirt libvirt-python virt-manager libguestfs-tools -y
chkconfig libvirtd on
service libvirtd start
clear
echo "Okay, you have to configure the network yourself.  This is a fairly easy task.  If you don't know how, this is a good guide: http://docs.solusvm.com/kvm_bridge_setup once you've done that, come back and restart this script."
echo "Escape key is ^C"
read -sn 1 -p "Press any key to continue..."
echo "Please Wait, Installing Dependencies for RHEL 6..."
yum -y install glibc glibc-devel glibc-devel.i686 perl php php-cli php-common
wget files.us.tx.soluslabs.com/solusvm/loaders/ioncube_loaders_lin_x86_64.tar.gz -O /usr/local/solusvm/tmp/ioncube_loaders.tar.gz
wget files.us.tx.soluslabs.com/solusvm/loaders/php.ini.64.6 -O /etc/php.ini
userdel solusvm
adduser -d /usr/local/solusvm -s /sbin/nologin solusvm
wget http://repo.soluslabs.com/centos/soluslabs.repo -O /etc/yum.repos.d/soluslabs.repo
yum clean all
tar vxzf /usr/local/solusvm/tmp/ioncube_loaders.tar.gz -C /etc/
wget files.us.tx.soluslabs.com/solusvm/installer/v3/installscripts.tar.gz -O /usr/local/solusvm/tmp/installscripts.tar.gz
mkdir -p /usr/local/solusvm/tmp/.install/
tar vxzf /usr/local/solusvm/tmp/installscripts.tar.gz -C /usr/local/solusvm/tmp/.install/
chown root:root /usr/local/solusvm/tmp/.install/*
chmod +x /usr/local/solusvm/tmp/.install/*
php /usr/local/solusvm/tmp/.install/slave --virt=kvm --templates=none

echo "Thankyou for using the world's messiest script."
#!/bin/bash

# Fix sshd config
sudo sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
sudo sed -i "s/#UseDNS yes/UseDNS no/" /etc/ssh/sshd_config

# Installing packages
sudo yum -y install perl wget git vim
sudo yum -y install gcc gcc-c++ make automake autoconf libtool
sudo yum -y install kernel-headers-`uname -r` kernel-devel-`uname -r` bzip2
#sudo yum -y zlib-devel openssl-devel readline-devel sqlite-devel nfs-utils bind-utils

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Installing Virtual Box Guest Additions
cd /tmp
sudo mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
sudo sh /mnt/VBoxLinuxAdditions.run
sudo umount /mnt
#rm -rf /home/vagrant/VBoxGuestAdditions*.iso

# Rebuilding Guest Additions
#sudo /etc/rc.d/init.d/vboxadd setup
#!/bin/bash
 
#identity
sudo touch /root/this_is_a_sftp_node
sudo touch /home/vagrant/this_is_a_sftp_node

#update system
sudo apt-get -y update
sudo apt-get -y upgrade

#install extra packages
sudo apt-get -y install emacs 

#create sftp users group and sftpuser
sudo groupadd sftpusers 
sudo useradd sftpuser -G sftpusers --password `openssl passwd -crypt B0st0n` --shell /bin/nologin

#create directory for ftp chroot jail
sudo mkdir /sftproot
sudo mkdir /sftproot/repository
sudo chown sftpuser:sftpuser /sftproot/repository

#copy over the sshd_config file
sudo cp /vagrant/files/sshd_config /etc/ssh/sshd_config

#restart sshd daemon
sudo service ssh restart

echo " "
echo "The sftp credentials are:"
echo "user: sftpuser"
echo "password: B0st0n"
echo "ip addresses listed for this vagrant are:"
ip addr | grep -oE "\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)/\b" | sed "s/\///g"
echo "Connect using:"
echo "$ sftp sftpuser@<IP of SFTP server>"
echo "sftp> cd repository"
echo "sftp> put <somefile>"
echo " "

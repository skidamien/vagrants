#!/bin/bash

sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g'  /etc/ssh/sshd_config 
sed -i 's/PasswordAuthentication no/#PasswordAuthentication no/g'  /etc/ssh/sshd_config
systemctl restart sshd


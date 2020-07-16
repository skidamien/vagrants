#!/bin/bash

yum install -y openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel
systemctl start slapd
systemctl enable slapd
netstat -antup | grep -i 389
slappasswd -h {SSHA} -s B0st0n > /tmp/slappasswd.out

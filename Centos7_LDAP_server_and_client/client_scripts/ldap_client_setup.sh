#!/bin/bash

yum install -y openldap-clients nss-pam-ldapd
authconfig --enableldap --enableldapauth --ldapserver=192.168.1.10 --ldapbasedn="dc=itzgeek,dc=local" --enablemkhomedir --update
systemctl restart nslcd
getent passwd damien

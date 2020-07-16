#!/bin/bash

oldRootPW=`cat /tmp/slappasswd.out`

cat <<EOF > /tmp/monitor.ldif
dn: olcDatabase={1}monitor,cn=config
changetype: modify
replace: olcAccess
olcAccess: {0}to * by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external, cn=auth" read by dn.base="cn=ldapadm,dc=itzgeek,dc=local" read by * none
EOF

ldapmodify -Y EXTERNAL  -H ldapi:/// -f /tmp/monitor.ldif


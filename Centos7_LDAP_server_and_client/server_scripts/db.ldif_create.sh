#!/bin/bash

oldRootPW=`cat /tmp/slappasswd.out`

cat <<EOF > /tmp/db.ldif 
dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcSuffix
olcSuffix: dc=itzgeek,dc=local

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootDN
olcRootDN: cn=ldapadm,dc=itzgeek,dc=local

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootPW
olcRootPW: $oldRootPW
EOF

ldapmodify -Y EXTERNAL  -H ldapi:/// -f /tmp/db.ldif

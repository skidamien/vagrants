#!/bin/bash

oldRootPW=`cat /tmp/slappasswd.out`

cat <<EOF > /tmp/new_user.ldif 
dn: uid=damien,ou=People,dc=itzgeek,dc=local
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
cn: damien
uid: damien
uidNumber: 9999
gidNumber: 100
homeDirectory: /home/damien
loginShell: /bin/bash
gecos: Damien [Admin (at) ITzGeek]
userPassword: {crypt}x
shadowLastChange: 17058
shadowMin: 0
shadowMax: 99999
shadowWarning: 7
EOF

ldapadd -w B0st0n -x -D "cn=ldapadm,dc=itzgeek,dc=local" -f /tmp/new_user.ldif

ldappasswd -w B0st0n -s apple -D "cn=ldapadm,dc=itzgeek,dc=local" -x "uid=damien,ou=People,dc=itzgeek,dc=local"

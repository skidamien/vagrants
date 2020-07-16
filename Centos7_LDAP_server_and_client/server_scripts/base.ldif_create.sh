#!/bin/bash

cat <<EOF > /tmp/base.ldif
dn: dc=itzgeek,dc=local
dc: itzgeek
objectClass: top
objectClass: domain

dn: cn=ldapadm ,dc=itzgeek,dc=local
objectClass: organizationalRole
cn: ldapadm
description: LDAP Manager

dn: ou=People,dc=itzgeek,dc=local
objectClass: organizationalUnit
ou: People

dn: ou=Group,dc=itzgeek,dc=local
objectClass: organizationalUnit
ou: Group
EOF

ldapadd -x -w B0st0n -D "cn=ldapadm,dc=itzgeek,dc=local" -f /tmp/base.ldif

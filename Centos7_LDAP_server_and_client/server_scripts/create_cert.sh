#!/bin/bash

openssl req -new -x509 -nodes -out /etc/openldap/certs/itzgeekldap.crt -keyout /etc/openldap/certs/itzgeekldap.key -days 1460 -subj "/C=US/ST=Massachusetts/L=Boston/O=Global Security/OU=IT Department/CN=server.itzgeek.local"

chown -R ldap:ldap /etc/openldap/certs/itzgeek*

ll /etc/openldap/certs/itzgeek*

cat <<EOF > /tmp/certs.ldif
dn: cn=config
changetype: modify
replace: olcTLSCertificateFile
olcTLSCertificateFile: /etc/openldap/certs/itzgeekldap.crt

dn: cn=config
changetype: modify
replace: olcTLSCertificateKeyFile
olcTLSCertificateKeyFile: /etc/openldap/certs/itzgeekldap.key
EOF

ldapmodify -Y EXTERNAL  -H ldapi:/// -f /tmp/certs.ldif

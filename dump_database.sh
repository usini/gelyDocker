mysqldump -u root -p!ChangeMe! -h database_dolibarr dolibarr > dump/dolibarr_dump.sql
mysqldump -u app -p!ChangeMe! -h database app > dump/database_dump.sql
ldapsearch -x -H ldap://openldap:1389 -D "cn=admin,dc=my-domain,dc=com" -w adminpassword -b "dc=my-domain,dc=com" "(objectClass=*)" > dump/ldap_dump.ldif

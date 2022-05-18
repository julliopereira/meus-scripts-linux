#!/bin/sh
# NO HARDENNING 
user=$(whoami)
if [ "$user" != "root" ]; then
	exit 1
fi       	
#
for suid in $(cat /root/auditoria/arquivos_suid.audit | egrep -v "su$|passwd$"); do 
	chmod +s $suid 	
done
#
exit 0

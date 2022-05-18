#!/bin/bash
# HARDENNING 
user=$(whoami)
if [ "$user" != "root" ]; then
	exit 1
#
else
	if [ ! -d ~/root/auditoria ]; then
		mkdir -p /root/auditoria
	fi
#
	find / -perm -4000 2> /dev/null > /root/auditoria/original_arquivos_suid.audit
#
	for suid in $(cat /root/auditoria/arquivos_suid.audit | egrep -v "su$|passwd$"); do 
		chmod -s $suid 	
	done
fi
#
exit 0

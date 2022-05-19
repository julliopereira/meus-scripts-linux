#!/bin/bash
#
#
#
if [ ! -d /root/auditoria ];then
	mkdir -p /root/auditoria
fi

dpkg -l | awk -F " " '{print $2,$5}' | tr ' ' '\t' > /root/auditoria/programas_instalados.audit

PROG="
wget
netcat
nmap
tcpdump
snmp
telnet
"
for PROGRAMA in $(echo "$PROG"); do
	apt remove -y $PROGRAMA
done

exit 0

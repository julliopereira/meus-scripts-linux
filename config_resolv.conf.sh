#!/bin/bash
resolv="
search $DOMINIO
domain $DOMINIO
nameserver $DNS_SERVER1
nameserver $DNS_SERVER2
"
resolv () {
	> /etc/resolv.conf
	echo "$resolv" >> /etc/resolv.conf
}

echo -e -n "QUAL NOME DO DOMINIO [exempolo: xyz.com]: "; read DOMINIO
echo -e -n "QUAL O IP DO DNS SERVER 1: "; read DNS_SERVER1
echo -e -n "QUAL O IP DO DNS SERVER 2: "; read DNS_SERVER2

resolv

exit 0

#!/bin/bash
#
#
iptables () {
	$IPT -A INPUT -i lo -j ACCEPT
	$IPT -A INPUT -p tcp --dport 22 -m state --state NEW -m limit --limit 1/s -j ACCEPT
	$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
	$IPT -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
	$IPT -A OUTPUT -o lo -j ACCEPT
	$IPT -A OUTPUT -p tcp -m state --state NEW -j ACCEPT
	$IPT -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
	$IPT -P INPUT DROP
	$IPT -P FORWARD DROP
	$IPT -P OUTPUT DROP
} 
#
USER=$(whoami)
#
if [ "$USER" != "root" ]; then
	echo -e "DEVE SER ROOT"
	exit 1
else
	echo -e "INSTALACAO DE IPTABLES ...."
	apt update
	apt install -y iptables iptables-persistent
	IPT="ip6tables"
fi

exit 0

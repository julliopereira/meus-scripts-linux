#!/bin/bash
#
ipt="
iptables
ip6tables
"
#
limpar_func () {
	for $IPT in $(echo "$ipt"); do
		$IPT -F
	done
}
#
iptables_func () {
	$IPT -A INPUT -i lo -j ACCEPT
	$IPT -A INPUT -p icmp --icmp-type 0 -j ACCEPT
	$IPT -A INPUT -p tcp --dport 22 -m state --state NEW -m limit --limit 1/s -j ACCEPT
	$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
	$IPT -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
	$IPT -A OUTPUT -o lo -j ACCEPT
	$IPT -A OUTPUT -p icmp --icmp-type 8 -j ACCEPT
	$IPT -A OUTPUT -m state --state NEW -j ACCEPT
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
	limpar_func
	apt update
	apt install -y iptables iptables-persistent
	for IPT in $(echo -e "$ipt"); do
		iptables_func
	done
fi

exit 0

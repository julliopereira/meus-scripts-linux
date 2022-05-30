#!/bin/bash
#
case $? in 
	start) 	
		mount -o remount,rw,noexec /tmp
		mount
		echo "Particoes SEM PERMISSAO de execucao" | grep /tmp
		;;
	stop) 	
		mount -o remount,rw,exec /tmp
		echo "Particoes COM PERMISSAO de execucao"
		;;
	*) 	
		echo "OPCAO INVALIDA use: $0 {start|stop}"
		exit 1
		;;	 
esac

exit 0

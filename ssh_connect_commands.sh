#!/bin/bash
#
# MANDATORIO INSTALACAO DE SSHPASS
# apt install sshpass
# 
# CRIAR ARQUIVO IPS COM OS IPS DOS DISPOSITIVOS A SEREM ACESSADOS
#
# ----------------------------------------------------------------------------
read -p "digitar login: " LOGIN			   # PEDIR LOGIN PARA O USUARIO
read -s -p "digitar a senha: " SSHPASS             # PEDIR A SENHA PARA O USUARIO
export SSHPASS				           # EXPORTAR A SENHA 

clear
COMM="ip a; \
	pwd; \
	ip route"

func_ssh () { 
	#sshpass -e ssh $LOGIN@$IP "ip a | egrep '^[0-9]:|inet'" > /tmp/$IP'ip_a'
	#sshpass -e ssh $LOGIN@@IP "pwd" > /tmp/$IP'pwd'
	sshpass -e ssh $LOGIN@$IP "$COMM" > /tmp/$IP'comm'
} 

for IP in $(cat IPS); do
	func_ssh
done 


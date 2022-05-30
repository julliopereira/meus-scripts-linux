#!/bin/bash
#
#
USER=$(whoami)
if [ "$USER" != "root" ]; then
	exit 1
else
	f_padrao () {
		echo -e "APLICANDO SCRIPT [ \033[32m $SCRIPT \033[m] \t ...."
		./$script
		sleep 1
		echo -e "\n\n"
		echo -e "..........APLICADO"
	}
	SCRIPT="removendo_suid_de_arquivos.sh" ; f_padrao
	SCRIPT="removendo_programas_desnecessarios.sh" ; f_padrao
	SCRIPT="pre_configurando_iptables.sh" ; f_padrao
	#SCRIPT="configurando_limites_para_usuarios.sh" ; f_padrao
	SCRIPT="configurando_pam_para_permit_acesso_root.sh" ; f_padrao
	SCRIPT="configurando_seguranca_para_ssh.sh" ; f_padrao
	#SCRIPT=""
	#SCRIPT=""
	#SCRIPT=""
	#SCRIPT=""
	#SCRIPT=""
	#SCRIPT=""

fi 

exit 0

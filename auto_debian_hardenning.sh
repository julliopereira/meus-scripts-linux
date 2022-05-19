#!/bin/bash
#
#
USER=$(whoami)
if [ "$USER" != "root" ]; then
	exit 1
else
	padrao () {
		echo -e "APLICANDO SCRIPT [ \033[32m $SCRIPT \033[m] \t ...."
		./$script
		sleep 1
		echo -e "\n\n"
		echo -e "..........APLICADO"
	}
	SCRIPT="removendo_arquivos_com_suid.sh" ; padrao
	SCRIPT="removendo_programas_desnecessarios.sh" ; padrao
	SCRIPT="pre_configurando_iptables.sh" ; padrao
	SCRIPT="configurando_limites_para_usuarios.sh" ; padrao
	SCRIPT="configurando_pam_para_permit_acesso_root.sh" ; padrao
	#SCRIPT=""
	#SCRIPT=""
	#SCRIPT=""
	#SCRIPT=""
	#SCRIPT=""
	#SCRIPT=""
	#SCRIPT=""

fi 

exit 0

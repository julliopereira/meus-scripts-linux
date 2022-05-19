#!/bin/bash
#
#
#
USER=$(whoami)
#
if [ "$USER" != "root" ]; then
	echo -e "DEVE SER ROOT"
	exit 1
else
	addgroup loginr
	useradd -m -k /etc/skel/ sup
	useradd -m -k /etc/skel/ repus	
	usermod -a -G loginr sup
	usermod -a -G loginr repus
	echo -e "auth       required   pam_wheel.so 	group=loginr" >> /etc/pam.d/su
	echo -e "CRIE A SENHA PARA O USUARIO: [ sup ] "
	passwd sup
	echo -e "CRIE A SENHA PARA O USUARIO: [ repus ] "
	passwd repus
fi

exit 0

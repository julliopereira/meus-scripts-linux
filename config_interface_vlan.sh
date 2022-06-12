#!/bin/bash
#
#
VERD="\033[32m"
VERM="\033[31m"
NOCOL="\033[m"
#
func_comandos () {
	echo -e "
	ip link add link $INTERFACE $INTERFACE.$VLAN type vlan id $VLAN
	ip link set $INTERFACE.$VLAN up
	ip addr add $IP/$MASK dev $INTERFACE.$VLAN 
	"
}
func_aplicar () {
        ip link add link $INTERFACE $INTERFACE.$VLAN type vlan id $VLAN
        ip link set $INTERFACE.$VLAN up
        ip addr add $IP/$MASK dev $INTERFACE.$VLAN 
} 
#
#
LOOP=0
while [ $LOOP -eq "0" ]; do
	clear
	ip addr
	echo -e "\n\n------------------------------"
	echo -e -n "1. QUAL $VERD INTERFACE $NOCOL USAR? [eth0]:               "; read INTERFACE
	echo -e -n "2. QUAL $VERD IP $NOCOL DA INTERFACE? [1.1.1.1]:           "; read IP
	echo -e -n "3. QUAL $VERD MASCARA $NOCOL DO IP? [25]:                  "; read MASK
	echo -e -n "4. QUAL $VERD VLAN $NOCOL VLAN ADICIONAR? [101]:           "; read VLAN
	ASK=NO
	echo -e -n "\n\n$VERD INFORMACOES ESTAO CORRETAS? [S|N]: $NOCOL"; read ASK
	case $ASK in
		s|S) LOOP=1;;
		n|N) echo -e -n "\n\nFACA NOVAMENTE ....."; sleep 3;;
		*) echo -e -n "INFORMACAO INCORRETA ... SAINDO .......";;
	esac
done
func_comandos
echo -e -n "\n\nDESEJA APLICAR A CONFIGURACAO ACIMA? ( CUIDADO )  [S|N]"; read APLICAR
case $APLICAR in
	s|S) func_aplicar ;;
	n|N) exit 1 ;;
	*) echo -e "SAINDO ...." ;;
esac

exit 0

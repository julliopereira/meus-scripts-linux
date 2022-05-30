#!/bin/bash
#
for USER in $(cat /etc/passwd | cut -f 1 -d ":" | grep -v root | grep -v toor | grep -v julio); do
	usermod -s /bin/fase $USER
done	

exit 0

#!/bin/bash
#
# AUTHOR: 	Julio C. Pereira
# DATE: 	2022-04-12
# OBJECTIVE:	Test how many processes a common user can start  
# E-MAIL:	julliopereira@gmail.com
# 
# MITIGATE: 	1-edit the file /etc/security/limits.conf to limit 
# 		the number of process each user can open
#		2-remove file execution on userhome directory
#

# if directory .secure not exists then create .secure
if [ ! -d ~/.secure ]; then
	mkdir -p ~/.secure
fi

# create the file loop on directory .secure with a 
echo -e "#!/bin/bash" > ~/.secure/loop
echo -e "while true; do" >> ~/.secure/loop
echo -e "\techo -e "linha" >> count" >> ~/.secure/loop
echo -e "\t./loop_do_demo" >> ~/.secure/loop
echo -e "done" >> ~/.secure/loop

# give execution level to owner 
chmod 700 ~/.secure/loop

# enter in .secure directory
cd ~/.secure

# run the script with eternal loop
./loop &


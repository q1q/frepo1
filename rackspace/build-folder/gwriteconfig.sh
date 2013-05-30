#!/bin/bash
echo "start="
read START
echo "stop="
read STOP
LINE=15
FIELD=4


IPARRAY=()
for ((i=$START; i!=($STOP+1); i++))
	do
	FPATH="/home/admin2/rackspace/build-folder/ipaddr$i.json"
	IPARRAY[$i]=$(cat $FPATH | grep -B 1 ": 4" | head -1 | cut -d '"' -f $FIELD)
	echo "Host rs$i
Hostname ${IPARRAY[$i]}
IdentityFile ~/.ssh/rs.key
User root
" >> config3.txt 	      
	done




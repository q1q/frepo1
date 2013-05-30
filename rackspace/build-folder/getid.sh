#!/bin/bash

GenIdArray () {
echo "start="
read START
echo "stop="
read STOP
ID=()
LINE=5
FIELD=4
	for ((i=$START; i!=($STOP+1); i++))
		do
		FPATH="/home/admin2/rackspace/build-folder/buildreciept$i.json"
		ID[$i]=$(cat $FPATH | head -$LINE | tail -1 | cut -d '"' -f $FIELD)
		done
}	

GetToken () {
FPATH="/home/admin2/rackspace/SA2p.json"
LINE=154
FIELD=4
TOKEN=$(cat $FPATH | head -$LINE | tail -1 | cut -d '"' -f $FIELD)
}

DoApiCall () {
LOC=dfw
ACCOUNT=817848
for ((i=$START; i!=($STOP+1); i++))
	do
	curl https://$LOC.servers.api.rackspacecloud.com/v2/$ACCOUNT/servers/${ID[$i]}/ips \
        -H "Accept: application/json" \
        -H "X-Auth-Token: $TOKEN" | python -m json.tool | grep -A 7 "public" > ipaddr$i.json
	done
}

Delete () {
LOC=dfw
ACCOUNT=817848
for ((i=$START; i!=($STOP+1); i++))
        do
        curl https://$LOC.servers.api.rackspacecloud.com/v2/$ACCOUNT/servers/${ID[$i]} \
	-X DELETE \
	-H "Accept: application/json" \
        -H "X-Auth-Token: $TOKEN" 
	done
} 

GenIdArray
GetToken
DoApiCall
	

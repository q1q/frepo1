#!/bin/bash

FPATH="/Users/sruther/Documents/programming/test.json"
LINE=5
FIELD=4

TOKEN=$(cat $FPATH | head -$LINE | tail -1 | cut -d '"' -f $FIELD)

IMAGEREF=3afe97b2-26dc-49c5-a2cc-a2fc8d80c001
FLAVORREF=6

echo "TOKEN = $TOKEN \n"
echo "how many?"
read HOWMANY

function MakeBuildFiles () {
	echo "{
	\"server\" : {
	\"name\" : \"test$i\",
	\"imageRef\" : \"$IMAGEREF\", \"flavorRef\" : \"$FLAVORREF\",
	\"metadata\" : {
	\"My Server Name\" : \"Ubuntu 11.10 server\" }
	} }" > $i.json

}

function RsBuild () {

curl \
-s https://dfw.servers.api.rackspacecloud.com/v2/$account/servers \ -X POST \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $TOKEN" \
-H "X-Auth-Project-Id: project1" \
-T $i.json | python -m json.tool > buildreciept$i.json 

}

for ((i=1 ; i!=$HOWMANY ; i++))
	do
	MakeBuildFiles 
	RsBuild 
	done 	

#bin/bash
START=1
STOP=1


USER="zagatsky-jessup@rogiservice.com"
PASS="5erdB2V3ig"
BASEURL="http://apicontrol.lunacloud.com:4465/paci/v1.0/"
TYPE="PUT" 
NAME="q2q"

if [ $1 ] ; then 
V="--verbose" 
fi 				

for ((i=$START;i!=($STOP+1);i++)) ; do
COMMAND="ve/$NAME${i}/stop"
curl $V $BASEURL$COMMAND -X $TYPE --user ${USER}:${PASS} \
-H "Content-Type: application/xml" 
done
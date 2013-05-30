#bin/bash
START=1
STOP=1


USER="zagatsky-jessup@rogiservice.com"
PASS="5erdB2V3ig"
BASEURL="http://apicontrol.lunacloud.com:4465/paci/v1.0/"
TYPE="DELETE" 
NAME="q2q"
		

for ((i=$START;i!=($STOP+1);i++)) ; do
COMMAND="ve/$NAME${i}"
curl $V $BASEURL$COMMAND -X $TYPE --user ${USER}:${PASS} \
-H "Content-Type: application/xml" 
done
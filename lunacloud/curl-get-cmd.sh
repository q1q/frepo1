#bin/bash
START=1
STOP=1


USER="zagatsky-jessup@rogiservice.com"
PASS="5erdB2V3ig"
BASEURL="http://apicontrol.lunacloud.com:4465/paci/v1.0/"
TYPE="GET" 
NAME="name"

if [ $1 ] ; then 
V="--verbose" 
fi 						

for ((i=$START;i!=($STOP+1);i++)) ; do
COMMAND="ve/$NAME${i}"
curl $V $BASEURL$COMMAND -X $TYP E --user ${USER}:${PASS} \
-H "Content-Type: application/xml" | grep address | cut -d '"' -f6 | cut -d '/' -f1 >> luna-host-file.tmp
done

## for getting serv info type=get; for starting/stopping type=put and append start / stop to the url
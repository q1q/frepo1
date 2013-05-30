#bin/bash
START=1
STOP=1


USER="zagatsky-jessup@rogiservice.com"
PASS="5erdB2V3ig"
BASEURL="http://apicontrol.lunacloud.com:4465/paci/v1.0/"
TYPE="PUT" # PUT | GET
#V="--verbose" 				

for ((i==$START;i!=($STOP+1);i++)) ; do
COMMAND="ve/name${i}/start"
curl $V $BASEURL$COMMAND -X $TYPE --user ${USER}:${PASS} \
-H "Content-Type: application/xml" 
done

## for getting serv info type=get; for starting/stopping type=put and append start / stop to the url
#!/bin/bash

FPATH="/home/admin2/rackspace/SA2p.json"
LINE=154
FIELD=4
TOKEN=$(cat $FPATH | head -$LINE | tail -1 | cut -d '"' -f $FIELD)
LOC=dfw
ACCOUNT=817848

IMAGEREF=3afe97b2-26dc-49c5-a2cc-a2fc8d80c001
FLAVORREF=2

echo "TOKEN = $TOKEN"
echo "start="
read START
echo "stop="
read STOP

MakeBuildFiles () {
	echo "{
	\"server\" : {
	\"name\" : \"tst$i\",
	\"imageRef\" : \"$IMAGEREF\", \"flavorRef\" : \"$FLAVORREF\",
	\"personality\" : [
		     {
			\"path\" : \"/root/.ssh/authorized_keys\",
			\"contents\" : \"c3NoLXJzYSBBQUFBQjNOemFDMXljMkVBQUFBREFRQUJBQUFCQVFEaEFCQ3RyYitTSmVmSG8rUkdhSDhyYm9pY3VoemNBWHpOZXJnWlMzQmRyM2NCU0g4L1dqYThqZXRCNkNSa3hCaW1RZWw2WHE4aDdEbmswTGt2anZYcEsyMUxia1dIQ2JOaFl3anlDZ04zQmxVR0Z4Z0pRK2VjZDZWYUNCQ01DcklGMEpmSlNMbEJ4VFBHRmZybm1PMllDb0QrVmUyL3dLR3NKdU92T2dSRmEzeTFYSVRyeTlOWk05TFBkOEhuZzZRN3JRMTdYMU5TbDlLZWlKdFZIYTdjZFhpYnkxNUk0RUFYYkRaTWdCbFIxMXl5QklhSHZaUlpNRmU1L3hOdmllUHpBQmZHMlcvTXBzcHRXcVdMb3B5RWdPQ0J6TjZ0WjdHQlVyVEthZDFFamw5Vmd4d2piQWQraUp4THE2cjdpNVlvekcvZlAwSDF0VS80YTNHWHY3VFIKCgo=\"

	} 
	]
	} }" > $i.json

}

RsBuild () {

curl  https://$LOC.servers.api.rackspacecloud.com/v2/$ACCOUNT/servers -X POST \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $TOKEN" \
-H "X-Auth-Project-Id: project1" \
-T $i.json | python -m json.tool > buildreciept$i.json 
}

for ((i=$START ; i!=($STOP+1) ; i++))
	do
 	MakeBuildFiles
	RsBuild 
	done 	

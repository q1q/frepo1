#!/bin/bash

FPATH="/home/admin2/rackspace/SA2p.json"
LINE=154
FIELD=4
TOKEN=$(cat $FPATH | head -$LINE | tail -1 | cut -d '"' -f $FIELD)
LOC=dfw
ACCOUNT=817848

curl https://$LOC.servers.api.rackspacecloud.com/v2/$ACCOUNT/limits \
	-H "Accept: application/json" \
	-H "X-Auth-Token: $TOKEN"

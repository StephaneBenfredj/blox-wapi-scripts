#!/bin/bash
WAPIVS="v2.7.1"
UP="admin:infoblox"
GM="gm.lab"

FQDN=$1

HOSTREF=$(curl -k1 -u $UP \
-X GET https://$GM/wapi/$WAPIVS/record:host \
-d name=$FQDN \
|
jq '.[0] | {ref: ._ref}' | awk {'print $2'})

# remove cr and " " 
HOSTREF=$(echo $HOSTREF | tr -d '\r' | tr -d '"')

HOSTURL="https://$GM/wapi/$WAPIVS/$HOSTREF"

curl -k1 -u $UP -X DELETE $HOSTURL

#!/bin/bash
WAPIVS="v2.7.1"
UP="admin:infoblox"
GM="gm.lab"

FQDN=$1

HOSTREF=$(curl -k1 -s -u $UP \
-X GET https://$GM/wapi/$WAPIVS/record:host \
-d name=$FQDN \
|
jq -r '.[0]."_ref"')  
# -r produces raw output without quotes

HOSTURL="https://$GM/wapi/$WAPIVS/$HOSTREF"

curl -k1 -u $UP -X DELETE $HOSTURL

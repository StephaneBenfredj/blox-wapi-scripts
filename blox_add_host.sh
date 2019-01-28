#!/bin/bash
WAPIVS="v2.7.1"
UP="admin:infoblox"
GM="gm.lab"
MYZONE="test.lab"

#FQDN=$1
HOST=$1
IPA=$2

curl -k1 -u $UP -H "Content-Type: application/json" \
-X POST https://$GM/wapi/$WAPIVS/record:host \
-d "{ \"ipv4addrs\":[ {\"ipv4addr\": \"$IPA\"} ], \"name\": \"$HOST.$MYZONE\"}"

#-d "{ \"ipv4addrs\":[ {\"ipv4addr\": \"$IPA\"} ], \"name\": \"$FQDN\"}"

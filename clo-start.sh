#!/bin/bash

MINER_ID=${MINER_ID}
WALLET=${CLO_WALLET}
POOL1=clo.topmining.co.kr:8008
POOL2=clo.topmining.co.kr:8008
#POOL2=clopool.pro:2561
STRATUM=stratum1+tcp
API_PORT=3333 
HTTP_PORT=8083

MINER=/home/miner/miner/ethminer-0.18.0/ethminer
OPTION=""

$MINER -U $OPTION --HWMON 1 --api-port $API_PORT \
        -P $STRATUM://$WALLET.$MINER_ID:x@$POOL1 \
        -P $STRATUM://$WALLET.$MINER_ID:x@$POOL2

#!/bin/bash

MINER_ID=miner02
WALLET=hbesthee
POOL1=asia.ethash-hub.miningpoolhub.com:20535
POOL2=us-east.ethash-hub.miningpoolhub.com:20535
STRATUM=stratum2+tcp
API_PORT=3333 
HTTP_PORT=8083
MINER_VERSION=0.17.1
#MINER_VERSION=0.18.0

MINER=/home/miner/miner/ethminer-${MINER_VERSION}/ethminer
OPTION=""

$MINER -U $OPTION --HWMON 1 --api-port $API_PORT --display-interval 30 \
        -P $STRATUM://$WALLET%2e$MINER_ID:x@$POOL1 \
        -P $STRATUM://$WALLET%2e$MINER_ID:x@$POOL2

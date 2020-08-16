#!/bin/bash

MINER_ID=${MINER_ID}
WALLET=${ESN_WALLET}
POOL1=asia.ethash-hub.miningpoolhub.com:20605
POOL2=us-east.ethash-hub.miningpoolhub.com:20605
STRATUM=stratum2+tcp
API_PORT=3333
HTTP_PORT=8083
MINER_VERSION=0.16.2
MINER=/home/miner/miner/ethminer-${MINER_VERSION}/ethminer
OPTION=""

$MINER -U $OPTION --HWMON 1 --api-port $API_PORT --http-port $HTTP_PORT \
	-P $STRATUM://$WALLET.$MINER_ID:x@$POOL1 \
	-P $STRATUM://$WALLET.$MINER_ID:x@$POOL2

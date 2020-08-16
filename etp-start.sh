#!/bin/bash

# 메타버스(Metaverse : ETP) 채굴을 위한 스크립트

MINER_ID=miner02
WALLET=MQZ7LZq9vXfHFhMneiemrStNemUHVuqWdT
POOL1=etp-kor1.topmining.co.kr:8008
POOL2=etp-kor1.topmining.co.kr:8008
STRATUM=stratum1+tcp
API_PORT=3333 

MINER=/home/miner/miner/ethminer-0.18.0/ethminer
OPTION=""

$MINER -U $OPTION --HWMON 1 --api-port $API_PORT \
        -P $STRATUM://$WALLET.$MINER_ID:x@$POOL1 \
        -P $STRATUM://$WALLET.$MINER_ID:x@$POOL2


#!/bin/bash

TARGET_COIN=BTN
MINER_PATH=/home/miner/miner/xmr-stak-2.10.2
MINER_OPTION="--noAMD --noNVIDIA"

cd $MINER_PATH

$MINER_PATH/xmr-stak $MINER_OPTION -C pools-$TARGET_COIN.txt

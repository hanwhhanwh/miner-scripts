#!/bin/bash

TARGET_COIN=XMR
#MINER_PATH=/home/miner/miner/xmr-stak-2.10.2
MINER_PATH=/home/miner/miner/xmr-stak-rx-1.0.5
MINER_OPTION="--noAMD --noNVIDIA --noTest"

cd $MINER_PATH

$MINER_PATH/xmr-stak-rx $MINER_OPTION -C pools-$TARGET_COIN.txt

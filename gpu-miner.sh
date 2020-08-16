#!/bin/bash

#TARGET_COIN=eth
#TARGET_MINER=ethminer
TARGET_COIN=rvn
TARGET_MINER=t-rex

miner=`ps -ef | grep "${TARGET_MINER}" | grep -v 'grep' | grep -v 'sh -c' | awk '{print $2}'`
if [ -z $miner ]; then

   echo $(date)

   screen -dmS gpu bash -c "/home/miner/bin/${TARGET_COIN}-start.sh"

   echo "" 

fi

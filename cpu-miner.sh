#!/bin/bash

TARGET_COIN=xmr
miner=`ps -ef | grep "xmr-stak" | grep -v 'grep' | grep -v 'sh -c' | awk '{print $2}'`
if [ -z $miner ]; then

   echo $(date)

   screen -dmS cpu bash -c "/home/miner/bin/$TARGET_COIN-start.sh"

   echo "" 

fi

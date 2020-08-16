#!/bin/bash

TARGET_COIN=eth
miner=`ps -ef | grep "ethminer" | grep -v 'grep' | grep -v 'sh -c' | awk '{print $2}'`
if [ -z $miner ]; then

   echo $(date)

   screen -dmS gpu bash -c "/home/miner/bin/$TARGET_COIN-start.sh"

   echo "" 

fi

#!/bin/bash

# Ravencoin start mining scripts
# @author : hbesthee@naver.com
# @date : 2020-08-16

MINER_VERSION=0.15.8
MINER_DIR=/home/miner/miner/t-rex-${MINER_VERSION}/
MINER=t-rex
OPTION=""

cd ${MINER_DIR}
./$MINER -c ${MINER_DIR}config

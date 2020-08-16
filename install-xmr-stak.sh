#!/bin/bash

if [ $# -ne 4 ]
	then
		echo -e "Usage $0 <XMR-STAK-VERSION> <coin_name> <MINER_ID> <CPU_TYPE>\n"
		echo -e "\n\t XMR-STAK-VERSION : 2.8.2 \( xmr-stak 버전 번호 \)"
		echo -e "\t coin_name : miner03 \( 채굴할 코인 이름 : xmr, bbrc, btn \)"
		echo -e "\t MINER_ID : miner03 \( 채굴 아이디 \)"
		echo -e "\t CPU_TYPE : CPU 종류 \( ryzen \/ intel \)"
		echo -e "\n\t Example : $0 2.8.2 xmr miner03 ryzen"
		exit 1
fi

DOWNLOAD_HOST="192.168.0.13:8000"
#DOWNLOAD_HOST="192.168.0.102"
MINER_DIR="/home/miner/miner"
XMR_STAK_VERSION=$1
COIN_NAME=$2
MINER_ID=$3
CPU_TYPE=$4

# xmr-stak XMR_STAK_VERSION 적용
cd /home/miner/miner

if [ -d "$MINER_DIR/xmr-stak-$XMR_STAK_VERSION" ]
	then
		echo "xmr-stak-$XMR_STAK_VERSION 는 이미 설치되어 있습니다.\n"
		exit 1
fi

# xmr-stak 다운로드
cd $MINER_DIR
wget http://$DOWNLOAD_HOST/down/xmr-stak-$XMR_STAK_VERSION-$CPU_TYPE.tgz

if [ ! -f "$MINER_DIR/xmr-stak-$XMR_STAK_VERSION-$CPU_TYPE.tgz" ]
	then
		echo -e "xmr-stak-$XMR_STAK_VERSION-$CPU_TYPE.tgz 파일 다운로드가 실패하였습니다.\n파라미터를 확인하여 주십시요."
		exit -1
fi

tar xvfz xmr-stak-$XMR_STAK_VERSION-$CPU_TYPE.tgz
rm -f xmr-stak-$XMR_STAK_VERSION-$CPU_TYPE.tgz

# 스크립트 적용
cd ~
wget http://$DOWNLOAD_HOST/down/bin-cpu.tgz
tar xvfz bin-cpu.tgz
rm -f bin-cpu.tgz

cd ~/bin

# 채굴 코인 적용하기
sed -i "s/xmr/$COIN_NAME/g" cpu-miner.sh

# 채굴 시작 스크립트에 miner 버전 적용하기
sed -i "s/2.8.2/$XMR_STAK_VERSION/g" bbrc-start.sh
sed -i "s/2.8.2/$XMR_STAK_VERSION/g" btn-start.sh
sed -i "s/2.8.2/$XMR_STAK_VERSION/g" xmr-start.sh


# 채굴 장치 ID 적용하기
sed -i "s/miner02/$MINER_ID/g" $MINER_DIR/xmr-stak-$XMR_STAK_VERSION/pools-XMR.txt
sed -i "s/miner02/$MINER_ID/g" $MINER_DIR/xmr-stak-$XMR_STAK_VERSION/pools.txt

miner=`ps -ef | grep "xmr-stak --" | grep -v 'grep' | grep -v 'sh -c' | awk '{print $2}'`
if [ 0 != "$miner" ]; then

        echo "find mxr-stak : $miner"

        # 패치가 완료되면 동작중인 xmr-stak를 종료시킨다.
        kill -9 $miner

fi

#!/bin/bash

if [ $# -ne 3 ]
	then
		echo -e "Usage $0 <ETHMINER-VERSION> <coin_name> <MINER_ID>\n"
		echo -e "\n\t ETHMINER-VERSION : 1.17.1 \( ethminer 버전 번호 \)"
		echo -e "\t coin_name : miner02 \( 채굴할 코인 이름 : clo, esn, eth, etp \)"
		echo -e "\t MINER_ID : miner02 \( 채굴 아이디 \)"
		echo -e "\n\t Example : $0 1.17.1 etp miner02"
		exit 1
fi

DOWNLOAD_HOST="192.168.0.13:8000"
#DOWNLOAD_HOST="192.168.0.102"
MINER_DIR="/home/miner/miner"
ETHMINER_VERSION=$1
COIN_NAME=$2
MINER_ID=$3

# ethminer ETHMINER_VERSION 적용
cd /home/miner/miner

if [ -d "$MINER_DIR/ethminer-$ETHMINER_VERSION" ]
	then
		echo "ethminer-$ETHMINER_VERSION 는 이미 설치되어 있습니다.\n"
#		exit 1
	else

# ethminer 다운로드
		cd $MINER_DIR
		wget http://$DOWNLOAD_HOST/down/ethminer-$ETHMINER_VERSION-linux-x86_64.tar.gz

		if [ ! -f "$MINER_DIR/ethminer-$ETHMINER_VERSION-linux-x86_64.tar.gz" ]
			then
				echo -e "ethminer-$ETHMINER_VERSION-linux-x86_64.tar.gz 파일 다운로드가 실패하였습니다.\n파라미터
를 확인하여 주십시요."
				exit -1
		fi

		tar xvfz ethminer-$ETHMINER_VERSION-linux-x86_64.tar.gz
		mv bin ethminer-$ETHMINER_VERSION
		rm -f ethminer-$ETHMINER_VERSION-linux-x86_64.tar.gz
fi


# 스크립트 적용
cd ~/bin
wget http://$DOWNLOAD_HOST/down/bin-gpu.tgz
tar xvfz bin-gpu.tgz
rm -f bin-gpu.tgz

cd ~/bin


# 채굴 코인 적용하기
sed -i "s/eth/$COIN_NAME/g" gpu-miner.sh

# 채굴 시작 스크립트에 miner 버전 적용하기
sed -i "s/0.17.1/$ETHMINER_VERSION/g" clo-start.sh
sed -i "s/0.17.1/$ETHMINER_VERSION/g" esn-start.sh
sed -i "s/0.17.1/$ETHMINER_VERSION/g" eth-start.sh
sed -i "s/0.17.1/$ETHMINER_VERSION/g" etp-start.sh

# 채굴 장치 ID 적용하기
sed -i "s/miner02/$MINER_ID/g" clo-start.sh
sed -i "s/miner02/$MINER_ID/g" esn-start.sh
sed -i "s/miner02/$MINER_ID/g" eth-start.sh
sed -i "s/miner02/$MINER_ID/g" etp-start.sh

miner=`ps -ef | grep "ethminer -" | grep -v 'grep' | grep -v 'sh -c' | awk '{print $2}'`
if [ 0 != "$miner" ]; then

	echo "find ethminer : $miner"

	# 패치가 완료되면 동작중인 ethminer를 종료시킨다.
	kill -9 $miner

fi

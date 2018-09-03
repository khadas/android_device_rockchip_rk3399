#!/bin/sh

RESULT_DIR=/data/logs/rockchip_test
RESULT_LOG=${RESULT_DIR}/memtester.log

if [ ! -e "/data/logs/rockchip_test" ]; then
	echo "no /data/logs/rockchip_test"
	mkdir /data/logs/rockchip_test
fi

#run memtester test
echo "**********************DDR MEMTESTER TEST****************************"
echo "**********************run: memtester 128M***************************"
echo "**********************DDR MEMTESTER TEST****************************"
memtester 128M > $RESULT_LOG & 

echo "***DDR MEMTESTER TEST START: you can see the log at $RESULT_LOG*****"

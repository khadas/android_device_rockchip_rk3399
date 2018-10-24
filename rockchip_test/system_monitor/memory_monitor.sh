#!/system/bin/sh
INTERVAL=600
TIME=$(date "+%Y%m%d-%H%M")
PROC_MEMINFO=/data/logs/rockchip_test/memory_monitor/$TIME/proc_meminfo.txt
DUMP_MEMINFO=/data/logs/rockchip_test/memory_monitor/$TIME/dump_meminfo.txt
PS=/data/logs/rockchip_test/memory_monitor/$TIME/ps.txt
COUNT=1
SLAB=/data/logs/rockchip_test/memory_monitor/$TIME/slabinfo.txt

mkdir -p /data/logs/rockchip_test/memory_monitor/$TIME
 #echo `date >> $LOG`
 #echo `date >> $SLAB`
while((1));do
  #echo `cat /proc/meminfo | busybox grep -E "Slab|SReclaimable|SUnreclaim" >> $MEMINFO`
  #echo `cat /proc/slabinfo >> $SLAB`
  NOW=`date`
  TIME_LABEL="\n$NOW:--------------------------------------------------:$COUNT"
  echo -e  $TIME_LABEL >> $PROC_MEMINFO
  `cat /proc/meminfo  >> $PROC_MEMINFO`
  
  echo -e  $TIME_LABEL >> $DUMP_MEMINFO
  `dumpsys meminfo  >> $DUMP_MEMINFO`
  
  echo -e  $TIME_LABEL >> $PS
  `ps >> $PS`

  COUNT=$(expr $COUNT + 1 )
  sleep $INTERVAL
done

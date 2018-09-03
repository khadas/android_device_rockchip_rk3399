#!/bin/sh
### file: stress_test_dvfs.sh
### author: xxx@rock-chips.com
### function: ddr dvfs stress test
### date: 20180409

echo "**********************stress ddr dvfs test****************************"

delay_time=$1
echo "delay_time: $delay_time"

echo userspace >  /sys/class/devfreq/dmc/governor
governor_ddr=`cat /sys/class/devfreq/dmc/governor`

echo "*********scaling governor of ddr: $governor_ddr!"

freq_list_ddr=`cat /sys/class/devfreq/dmc/available_frequencies`

echo "freq_list_ddr: $freq_list_ddr"

while true
do
for i in $freq_list_ddr;
do
#echo "will set $i to ddr!"
echo $i >  /sys/class/devfreq/dmc/userspace/set_freq
cur_freq_ddr=`cat /sys/class/devfreq/dmc/cur_freq`
echo "cur_freq_ddr: $cur_freq_ddr"
sleep $delay_time
done

done




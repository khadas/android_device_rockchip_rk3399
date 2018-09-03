#!/bin/sh
### file: stress_test_dvfs.sh
### author: xxx@rock-chips.com
### function: gpu dvfs stress test
### date: 20180409

echo "**********************stress gpu dvfs test****************************"

delay_time=$1
echo "delay_time: $delay_time"

echo userspace >  /sys/class/devfreq/ff9a0000.gpu/governor
governor_gpu=`cat /sys/class/devfreq/ff9a0000.gpu/governor`

echo "*********scaling governor of gpu: $governor_gpu!"

freq_list_gpu=`cat /sys/class/devfreq/ff9a0000.gpu/available_frequencies`

echo "freq_list_gpu: $freq_list_gpu"

while true
do
for i in $freq_list_gpu;
do
#echo "will set $i to gpu!"
echo $i >  /sys/class/devfreq/ff9a0000.gpu/userspace/set_freq
cur_freq_gpu=`cat /sys/class/devfreq/ff9a0000.gpu/cur_freq`
echo "cur_freq_gpu: $cur_freq_gpu"
sleep $delay_time
done

done




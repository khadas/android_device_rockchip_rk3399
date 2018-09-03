#!/bin/sh
### file: stress_test_dvfs.sh
### author: xxx@rock-chips.com
### function: cpu dvfs stress test
### date: 20180409

echo "**********************stress dvfs test****************************"

delay_time=$1
echo "delay_time: $delay_time"

echo userspace >  /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
governor_little=`cat /sys/devices/system/cpu/cpufreq/policy0/scaling_governor`

echo userspace >  /sys/devices/system/cpu/cpufreq/policy4/scaling_governor
governor_big=`cat /sys/devices/system/cpu/cpufreq/policy4/scaling_governor`

echo "*********scaling governor of cpu_big: $governor_little, cpu_little: $governor_big !"

freq_list_little=`cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies`
freq_list_big=`cat /sys/devices/system/cpu/cpufreq/policy4/scaling_available_frequencies`

echo "freq_list_little: $freq_list_little; freq_list_big: $freq_list_big"

while true
do
for i in $freq_list_little;
do
#echo "will set $i to cpu_little!"
echo $i >  /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed
cur_freq_little=`cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq`
echo "cur_freq_little: $cur_freq_little"

for j in $freq_list_big;
do
#echo "will set $j to cpu_big !"
echo $j >  /sys/devices/system/cpu/cpufreq/policy4/scaling_setspeed
cur_freq_big=`cat /sys/devices/system/cpu/cpufreq/policy4/cpuinfo_cur_freq`
echo "cur_freq_big: $cur_freq_big"
sleep $delay_time
done

done

done




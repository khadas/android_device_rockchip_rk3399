#!/bin/sh

DIR_DVFS=/system/bin

info_view()
{
    echo "*****************************************************"
    echo "***                                               ***"
    echo "***            DVFS TEST                          ***"
    echo "***                                               ***"
    echo "*****************************************************"
}

info_view
echo "*****************************************************"
echo "cpu auto freq test:                             1"
echo "gpu auto freq test:                             2"
echo "ddr auto freq test:                             3"
echo "*****************************************************"

read -t 30 DVFS_CHOICE

auto_cpu_freq_test()
{
	#value 1 is sleep time
	sh ${DIR_DVFS}/auto_cpu_freq_test.sh 1 &
}

auto_gpu_freq_test()
{
	#value 1 is sleep time
	sh ${DIR_DVFS}/auto_gpu_freq_test.sh 1 &
}

auto_ddr_freq_test()
{
	#value 1 is sleep time
	sh ${DIR_DVFS}/auto_ddr_freq_test.sh 1 &
}

case ${DVFS_CHOICE} in
	1)
		auto_cpu_freq_test
		;;
	2)
		auto_gpu_freq_test
		;;
	3)
		auto_ddr_freq_test
		;;
	*)
		echo "not fount your input."
		;;
esac

#!/bin/sh
### file: rockchip_test.sh
### author: zwp@rock-chips.com
### function: ddr cpu memory_monitor 
### date: 20180922

moudle_env()
{
   export  MODULE_CHOICE
}

module_choice()
{  
    echo "*****************************************************"
    echo "***                                               ***"
    echo "***        ********************                   ***"
    echo "***       *ROCKCHIPS TEST TOOLS*                  ***"
    echo "***        *                  *                   ***"
    echo "***        ********************                   ***"
    echo "***                                               ***"
    echo "*****************************************************"

    
    echo "*****************************************************"
    echo "ddr test :            1 (memtester & stressapptest)"
    echo "dvfs_test:        2 (dvfs stresstest, including cpu/gpu/ddr)"
    echo "memory_monitor:        3 (tools used to detect memory leak)"
    echo "*****************************************************"

    echo  "please input your test moudle: "
    read -t 30  MODULE_CHOICE
}

ddr_test()
{
    sh /system/bin/ddr_test.sh
}

dvfs_test()
{
    sh /system/bin/dvfs_test.sh
}

memory_monitor()
{
    sh /system/bin/memory_monitor.sh
}

module_test()
{
    case ${MODULE_CHOICE} in
        1)
            ddr_test
            ;;
        2)
            dvfs_test
            ;;
        3)
            memory_monitor
            ;;
    esac
}

module_choice
module_test




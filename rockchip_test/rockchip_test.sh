#!/bin/sh
### file: rockchip_test.sh
### author: yhx@rock-chips.com
### function: ddr cpu gpio audio usb player ehernet sdio/pcie(wifi) 
### date: 20180327

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

module_test()
{
    case ${MODULE_CHOICE} in
        1)
            ddr_test
            ;;
        2)
            dvfs_test
            ;;
    esac
}

module_choice
module_test




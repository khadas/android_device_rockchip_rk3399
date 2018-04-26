#!/bin/bash

ifconfig eth0 up
ifconfig eth1 up

brctl addbr br0
brctl addif br0 eth0
brctl addif br0 eth1


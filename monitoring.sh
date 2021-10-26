#!/bin/bash

architecture=`uname -a`
pCPU=`grep "physical id" /proc/cpuinfo | wc -l`
vCPU=`grep "processor" /proc/cpuinfo | wc -l`
memory=``
disk=``
lCPU=``
lastboot=`who -b | cut -c23-`
lvmuse=``
tcp=``
userlog=``
networkIP=`hostname -I`
networkMAC=`ip a | grep link/ether | cut -d ' ' -f6`
sudo=``

wall $'#Achitecture:' "$architecture" \
$'\nCPU physical :' "$pCPU" \
$'\nvCPU :' "$vCPU"

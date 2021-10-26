#!/bin/bash

architecture=`uname -a`
pCPU=`grep "physical id" /proc/cpuinfo | wc -l`
vCPU=`grep "processor" /proc/cpuinfo | wc -l`
memory=`free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)", $3,$2,$3*100/$2 }'`
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
$'\n#CPU physical :' "$pCPU" \
$'\n#vCPU :' "$vCPU" \
$'\n#Memory Usage:' \
$'\n#Disk Usage:' \
$'\n#CPU Load:' \
$'\n#Last boot:' "$lastboot" \
$'\n#LVM use:' \
$'\n#Connexions TCP :' \
$'\n#User log:' \
$'\n#Network:' "$networkIP"'('"$networkMAC"')' \
$'\n#Sudo :'


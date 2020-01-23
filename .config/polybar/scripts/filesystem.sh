#!/bin/dash

root=$(df -h | grep "/dev/nvme0n1p2" | egrep -o "[0-9]{1,2}%")
home=$(df -h | grep "/dev/sda2" | egrep -o "[0-9]{1,2}%")

echo "ﲂ ${root}   ${home}"

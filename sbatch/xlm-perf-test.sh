#!/bin/bash
#SBATCH -N 1
#SBATCH -p LM
#SBATCH -t 48:00:00
#SBATCH --mem 6000GB

ulimit -n 65535

hostname
date

# Copy MySQL files to Local RAMDISK
RC=1
n=0
while [[ $RC -ne 0 && $n -lt 20 ]]; do
    rsync -aPHS /pylon5/bi5fpep/yiz141/mysql $RAMDISK/
    RC=$?
    let n = n + 1
    sleep 10
done

# Copy InfluxDB files to Local RAMDISK
RC=1
n=0
while [[ $RC -ne 0 && $n -lt 20 ]]; do
    rsync -aPHS rsync -aPHS /pylon5/bi5fpep/yiz141/idb_runtime/data $RAMDISK/
    RC=$?
    let n = n + 1
    sleep 10
done

echo "RAMDISK path:" $RAMDISK
echo "Local path:" $LOCAL
echo "Special LM, do what you have to do"
env sleep 10d

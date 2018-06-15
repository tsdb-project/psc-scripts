#!/bin/bash
#SBATCH -N 1
#SBATCH --ntasks-per-node 10
#SBATCH -p RM-shared
#SBATCH -t 48:00:00
#SBATCH -C EGRESS

ulimit -n 4096

hostname
date

cd /pylon5/bi5fpep/quz3/special_ver
java -jar brainflux_final_load_psc.jar --machine=realpsc --load=1.5 --soft-timeout-sleep=30

#!/bin/bash
#SBATCH -N 1
#SBATCH -p RM
#SBATCH -C EGRESS
#SBATCH -t 48:00:00

# DO WHAT EVER YOU WANT TO DO MANUALLY

ulimit -n 16384

hostname
date
echo "Special RM, please use SSH"
env sleep 3d

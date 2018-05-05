#!/bin/bash
#SBATCH -N 1
#SBATCH --ntasks-per-node 1
#SBATCH -p RM-small
#SBATCH -t 8:00:00
#SBATCH --mail-type=ALL

mkdir -p /pylon5/bi5fpep/yiz141/csv_subset/Subset-upload-272-c03
tar xvf /pylon5/bi5fpep/yiz141/csv_subset/2-272-c03.tar.gz --skip-old-files -C /pylon5/bi5fpep/yiz141/csv_subset/Subset-upload-272-c03

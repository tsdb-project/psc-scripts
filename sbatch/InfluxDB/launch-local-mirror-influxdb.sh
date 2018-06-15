#!/bin/bash
#SBATCH -N 1
#SBATCH --ntasks-per-node 10
#SBATCH -p RM-small
#SBATCH -t 4:00:00
#SBATCH --mem 44000MB

##################################################################
#               !!!!    Important Notice    !!!!                 #
#    Stop a job using this command to avoid data corruption:     #
#               scancel --signal=TERM -v $job_id                 #
##################################################################

ulimit -n 4096

logbase_path="/pylon5/bi5fpep/yiz141/influxdb/log_oper"
start_date=$(date "+%Y%m%d")
start_time=$(date "+%H%M%S")

log_path="$logbase_path/$start_date"
mkdir -p "$log_path"
log_name="$log_path/$start_time.log"
host_name="$log_path/$start_time.host"

hostname | tee $host_name

cd /pylon5/bi5fpep/yiz141/idb_deploy
./idb_152_02d7d -config oper.ini > $log_name 2>&1

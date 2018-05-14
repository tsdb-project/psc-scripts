#!/bin/bash
#SBATCH --ntasks-per-node 16
#SBATCH -p RM-shared
#SBATCH -C EGRESS
#SBATCH -t 48:00:00
#SBATCH --mem=70400
#SBATCH --mail-type=ALL

ulimit -n 4096

logbase_path="/pylon5/bi5fpep/yiz141/influxdb/log_load"
start_date=$(date "+%Y%m%d")
start_time=$(date "+%H%M%S")

log_path="$logbase_path/$start_date"
mkdir -p "$log_path"
log_name="$log_path/$start_time.log"
host_name="$log_path/$start_time.host"

hostname | tee $host_name
date
echo "InfluxDB is running with load conf when you see this, for edge loading only..."

cd /pylon5/bi5fpep/yiz141/idb_deploy
./idb_152_02d7d -config load.ini > $log_name 2>&1

date

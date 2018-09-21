#!/bin/bash
#SBATCH -N 1
#SBATCH --ntasks-per-node 12
#SBATCH -p RM-shared
#SBATCH --mem 52800MB
#SBATCH -t 48:00:00
#SBATCH --mail-type=ALL

# This is the latest start script for running loading config for InfluxDB

ulimit -n 16384

logbase_path="/pylon5/bi5fpep/quz3/batch_log"
start_date=$(date "+%Y%m%d")
start_time=$(date "+%H%M%S")

log_path="$logbase_path/$start_date"
mkdir -p "$log_path"
log_name="$log_path/$start_time.log"
host_name="$log_path/$start_time.host"

hostname | tee $host_name
echo "InfluxDB is running with load conf when you see this..."

cd /pylon5/bi5fpep/quz3/idb162
./influxd -config load.ini > $log_name 2>&1
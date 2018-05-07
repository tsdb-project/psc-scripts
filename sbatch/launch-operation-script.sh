#!/bin/bash
#SBATCH -N 1
#SBATCH --ntasks-per-node 3
#SBATCH -p RM-small
#SBATCH -C EGRESS
#SBATCH -t 3:00:00
#SBATCH --mail-type=ALL

ulimit -n 4096

logbase_path="/pylon5/bi5fpep/yiz141/influxdb/log_oper"
start_date=$(date "+%Y%m%d")
start_time=$(date "+%H%M%S")

log_path="$logbase_path/$start_date"
mkdir -p "$log_path"
log_name="$log_path/$start_time.log"
host_name="$log_path/$start_time.host"

hostname | tee $host_name
date
echo "BrainFlux and InfluxDB is running with oper conf when you see this..."

java -jar /pylon5/bi5fpep/quz3/brain-flux-0.0.1-SNAPSHOT.jar --machine=realpsc &

cd /pylon5/bi5fpep/yiz141/idb_deploy
./idb_152_02d7d -config oper.ini > $log_name 2>&1

date

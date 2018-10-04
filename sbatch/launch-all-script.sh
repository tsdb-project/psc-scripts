#!/bin/bash
#SBATCH -N 1
#SBATCH -p RM
#SBATCH -C EGRESS
#SBATCH -t 48:00:00
#SBATCH --mail-type=ALL

ulimit -n 16384

logbase_path="/pylon5/bi5fpep/quz3/batch_log"
start_date=$(date "+%Y%m%d")
start_time=$(date "+%H%M%S")

log_path="$logbase_path/$start_date"
mkdir -p "$log_path"
log_name="$log_path/$start_time.log"
host_name="$log_path/$start_time.host"

echo "BrainFlux and InfluxDB is running with load conf when you see this..."

java -jar /pylon5/bi5fpep/yiz141/brain-flux-1.0.0.jar --machine=realpsc --soft-timeout-sleep=15 --load=2.5 &

cd /pylon5/bi5fpep/quz3/idb163

termHandler() {
  kill -TERM "$pid" 2>/dev/null
}
trap 'termHandler' HUP INT QUIT PIPE TERM

./influxd -config load.ini > $log_name 2>&1 &

pid=$!
wait "$pid"


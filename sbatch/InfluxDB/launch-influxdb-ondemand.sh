#!/bin/bash
#SBATCH -N 1
#SBATCH -p RM
#SBATCH -t 48:00:00

# Script for RPC starting

ulimit -n 16384
cd /pylon5/bi5fpep/quz3/idb162/

log_path="/pylon5/bi5fpep/quz3/ondemand_log"
start_dt=$(date "+%Y%m%d_%H%M%S")

log_name="$log_path/$start_dt.log"
host_file="$log_path/nowhost"
pid_file="$log_path/nowpid"

# If host file exists, then InfluxDB is running and we should not start a new one
if [ -f $host_file ]; then
   echo "Host file exists, InfluxDB is running now!"
   exit 1
fi

# Try for clean shutdown (KILL a DB is a very very bad idea)

cleanup() {
  rm -f $host_file
  rm -f $pid_file
  gzip "$log_name"
  echo "Cleaned up."
}

termHandler() {
  kill -TERM "$pid" 2>/dev/null
  cleanup
  echo "SIGTERM received and processed."
}
trap 'termHandler' HUP INT QUIT PIPE TERM

./influxd -pidfile $pid_file -config oper.ini > $log_name 2>&1 &

hostname > $host_file
sleep 5s
pid=$(cat $pid_file)
wait "$pid"
cleanup

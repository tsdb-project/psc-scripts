#!/bin/bash
#SBATCH -N 1
#SBATCH --ntasks-per-node 12
#SBATCH -p RM-shared
#SBATCH -t 48:00:00

# Script for RPC starting

ulimit -n 16384
cd /pylon5/bi5fpep/quz3/idb162/

log_path="/pylon5/bi5fpep/quz3/ondemand_log"
start_dt=$(date "+%Y%m%d%H%M%S")

log_name="$log_path/$start_dt.log"
host_file="$log_path/nowhost"
pid_file="$log_path/nowpid"

hostname > $host_file

# Try for clean shutdown (KILL a DB is a very very bad idea)

termHandler() {
  kill -TERM "$pid" 2>/dev/null
  rm -f $host_file
  rm -f $pid_file
}
trap 'termHandler' HUP INT QUIT PIPE TERM

./influxd -pidfile $pid_file -config oper.ini > $log_name 2>&1 &

pid=$!
wait "$pid"

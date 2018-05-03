#!/bin/sh

ulimit -n 4096

base_path="/pylon5/bi5fpep/yiz141/influxdb/log_load"
start_date=$(date "+%Y%m%d")
start_time=$(date "+%H%M%S")

log_path="$base_path/$start_date"
mkdir -p "$log_path"

log_name="$log_path/$start_time.log"
pid_name="$log_path/$start_time.host"

echo "InfluxDB is running when you see this..."
echo "$(hostname)" > $pid_name
./idb_152_02d7d -config load.ini > $log_name 2>&1

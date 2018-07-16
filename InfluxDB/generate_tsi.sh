#!/bin/bash

# Build TSIndex for existing data, store log to a gzipped file (log is large)

/home/yiz141/p5/idb_deploy/idb_ins_153_89e08 buildtsi \
-datadir /pylon5/bi5fpep/yiz141/influxdb/data/data \
-waldir /pylon5/bi5fpep/yiz141/influxdb/data/wal -v 2>&1 | gzip -c > tsibuild.gz

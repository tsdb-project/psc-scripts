#!/bin/bash

# Build TSIndex for existing data, store log to a gzipped file (log is large)

/pylon5/bi5fpep/quz3/idb162/influx_inspect buildtsi \
-datadir /pylon5/bi5fpep/yiz141/idb_runtime/data/data \
-waldir /pylon5/bi5fpep/yiz141/idb_runtime/data/wal -v 2>&1 | gzip -c > tsibuild.gz

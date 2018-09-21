#!/bin/bash

# Check data (No output is good)
/pylon5/bi5fpep/quz3/idb162/influx_inspect verify \
-dir /pylon5/bi5fpep/yiz141/idb_runtime/data

# Check series file
/pylon5/bi5fpep/quz3/idb162/influx_inspect verify-seriesfile \
-dir /pylon5/bi5fpep/yiz141/idb_runtime/data/data -v

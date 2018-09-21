#!/bin/sh

sd=$(date "+%Y%m%d")
while true; do uptime >> uptime_$sd.log; sleep 15; done

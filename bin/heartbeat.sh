#!/usr/bin/env bash
set -euo pipefail
echo "[$(date --iso-8601=seconds)] heartbeat from $(hostname), root fs $(df -h / | awk 'NR==2{print $5}') used" >> /data/heartbeat.log

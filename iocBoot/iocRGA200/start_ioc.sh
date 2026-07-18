#!/bin/bash
set -e

IOC_DIR="/home/training/ConditionMonitoring/iocBoot/iocRGA200/Baudrate"
IOC_BIN="/home/training/ConditionMonitoring/bin/linux-x86_64/RGA200"

echo "[INFO] Entering IOC directory: $IOC_DIR"
cd "$IOC_DIR"

echo "[INFO] Setting non-standard baudrate 28800..."
./set28800

echo "[INFO] Starting EPICS IOC..."
exec "$IOC_BIN" st.cmd


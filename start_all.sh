#!/bin/bash

BASE=/home/training/ConditionMonitoring
LOGDIR=$BASE/log
mkdir -p $LOGDIR
TIME=$(date +"%Y%m%d_%H%M%S")

echo "Starting IOCs with screen..."

# iockeythley6485
cd $BASE/iocBoot/iockeythley6485 || exit 1
chmod +x st.cmd
screen -dmS iockeythley6485 bash -c "./st.cmd | tee $LOGDIR/iockeythley6485_$TIME.log"

sleep 1

# iocStatusMonitor
cd $BASE/iocBoot/iocStatusMonitor || exit 1
chmod +x st.cmd
screen -dmS iocStatusMonitor bash -c "./st.cmd | tee $LOGDIR/iocStatusMonitor_$TIME.log"

echo "All IOCs started."
echo "You can attach with:"
echo "  screen -r iockeythley6485"
echo "  screen -r iocStatusMonitor"
echo "Logs are in $LOGDIR"

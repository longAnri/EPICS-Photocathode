#!/bin/bash

echo "Stopping all IOCs..."

# 关闭 iockeythley6485
if screen -ls | grep -q "iockeythley6485"; then
    echo "Stopping iockeythley6485..."
    screen -S iockeythley6485 -X quit
else
    echo "iockeythley6485 is not running."
fi

# 关闭 iocStatusMonitor
if screen -ls | grep -q "iocStatusMonitor"; then
    echo "Stopping iocStatusMonitor..."
    screen -S iocStatusMonitor -X quit
else
    echo "iocStatusMonitor is not running."
fi

echo "All stop commands sent."

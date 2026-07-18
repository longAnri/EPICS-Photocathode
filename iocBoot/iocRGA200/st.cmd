#!../../bin/linux-x86_64/RGA200

#- You may have to change RGA200 to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/RGA200.dbd"
RGA200_registerRecordDeviceDriver pdbbase


epicsEnvSet ("STREAM_PROTOCOL_PATH", "/home/training/ConditionMonitoring/RGA200App/Db")
drvAsynSerialPortConfigure ("RGA200", "/dev/ttyUSB0")

asynSetOption("RGA200", 0, "baud", "28800")
asynSetOption("RGA200", 0, "bits", "8")
asynSetOption("RGA200", 0, "parity", "none")
asynSetOption("RGA200", 0, "stop", "1")
asynSetOption("RGA200", 0, "clocal", "Y")
asynSetOption("RGA200", 0, "crtscts", "N")

asynSetTraceMask("RGA200", 0, ERROR|DRIVER)
asynSetTraceIOMask("RGA200", 0, ESCAPE)

## Load record instances
#dbLoadRecords("db/RGA200.db","user=flon")
dbLoadRecords("db/rga.db","S=fl, R=m1, PORT=RGA200")
dbLoadTemplate("db/rga.substitutions")
cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=flon"

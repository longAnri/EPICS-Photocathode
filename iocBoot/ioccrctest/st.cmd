#!../../bin/linux-x86_64/crctest

#- You may have to change crctest to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/crctest.dbd"
crctest_registerRecordDeviceDriver pdbbase
epicsEnvSet ("STREAM_PROTOCOL_PATH", "/home/training/ConditionMonitoring/crctestApp/Db")
drvAsynIPPortConfigure("crc", "192.168.1.18:4196")

asynSetTraceMask("crc", 0, 0x2)
asynSetTraceIOMask("crc", 0, 2)
## Load record instances
#dbLoadRecords("db/xxx.db","user=training")
dbLoadRecords("db/crc.db", "P=fl, R=crctest, PORT=crc")
cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=training"

#!../../bin/linux-x86_64/SQM160

#- You may have to change SQM160 to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/SQM160.dbd"
SQM160_registerRecordDeviceDriver pdbbase
epicsEnvSet ("STREAM_PROTOCOL_PATH", "/home/training/ConditionMonitoring/SQM160App/Db")

drvAsynIPPortConfigure("crc", "192.168.1.18:4196")

# asynSetTraceMask("crc", 0, 0x2)
# asynSetTraceIOMask("crc", 0, 2)
asynSetTraceIOMask(crc, 0, HEX)
asynSetTraceMask(crc, 0, ERROR|DRIVER)
## Load record instances
#dbLoadRecords("db/SQM160.db","user=flon")
# dbLoadRecords("db/devSQM160.db", "P=fl, R=crctest, PORT=crc")
dbLoadRecords("db/devSQM160.db", "P=SQM, R=crctest, PORT=crc")
#dbLoadRecords("db/devSQM160Test.db", "P=SQM, R=crctest, PORT=crc")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=flon"

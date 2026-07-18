#!../../bin/linux-x86_64/MFP4000

#- You may have to change MFP4000 to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/MFP4000.dbd"
MFP4000_registerRecordDeviceDriver pdbbase
epicsEnvSet ("STREAM_PROTOCOL_PATH", "/home/training/ConditionMonitoring/MFP4000App/Db")
drvAsynIPPortConfigure("MFP", "192.168.1.63:4196")

asynSetTraceMask("MFP", 0, 0x2)
asynSetTraceIOMask("MFP", 0, 2)

## Load record instances
#dbLoadRecords("db/MFP4000.db","user=flon")
dbLoadRecords("db/MFP4000.db","P=fl:, R=MFP4000, PORT=MFP")
MFPRead.db
cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=flon"

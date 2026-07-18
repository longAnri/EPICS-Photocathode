#!../../bin/linux-x86_64/devCombivac

#- You may have to change devCombivac to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/devCombivac.dbd"
devCombivac_registerRecordDeviceDriver pdbbase
epicsEnvSet ("STREAM_PROTOCOL_PATH", "/home/training/ConditionMonitoring/devCombivacApp/Db")
# epicsEnvSet ("P", "Emission:")
# epicsEnvSet ("R", "fl")
drvAsynIPPortConfigure("Preparation_Combivac1", "192.168.1.11:4196")
drvAsynIPPortConfigure("Preparation_Combivac2", "192.168.1.12:4196")
drvAsynIPPortConfigure("Preparation_Combivac3", "192.168.1.14:4196")

# asynSetTraceMask("Combivac1", 0, 0x2)
# asynSetTraceIOMask("Combivac1", 0, 2)
## Load record instances
#dbLoadRecords("db/devCombivac.db","user=flon")
dbLoadRecords("db/devCombivac.db","P=Pre:, R=Vac1, PORT=Preparation_Combivac1")
dbLoadRecords("db/devCombivac.db","P=Pre:, R=Vac2, PORT=Preparation_Combivac2")
dbLoadRecords("db/devCombivac.db","P=Pre:, R=Vac3, PORT=Preparation_Combivac3")
cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=flon"

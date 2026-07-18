#!../../bin/linux-x86_64/skyIconController

#- You may have to change skyIconController to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/skyIconController.dbd"
skyIconController_registerRecordDeviceDriver pdbbase
epicsEnvSet ("STREAM_PROTOCOL_PATH", "/home/training/ConditionMonitoring/skyIconControllerApp/Db")
# epicsEnvSet ("P", "skyIcon1:")
# epicsEnvSet ("R", "fl")
###################################################################
###############Configuration of Serial Port1#######################
###################################################################

# drvAsynIPPortConfigure ("sky", "192.168.1.62:4196")
drvAsynIPPortConfigure ("sky1", "192.168.1.19:4196")
# drvAsynIPPortConfigure ("sky2", "192.168.1.20:4196")
drvAsynIPPortConfigure ("sky3", "192.168.1.21:4196")
drvAsynIPPortConfigure ("sky4", "192.168.1.22:4196")
drvAsynIPPortConfigure ("sky5", "192.168.1.23:4196")

# asynSetTraceMask("sky", 0, 0x2)
# asynSetTraceIOMask("sky", 0, 2)
## Load record instances
# dbLoadRecords("db/skyIconController.db","user=flon")
# dbLoadTemplate("db/skyIconController.substitutions", "P=fl:")
# dbLoadRecords("db/skyIconController.db", "P=$(P),R=$(R),PORT=sky")
dbLoadRecords("db/skyIconController.db", "P=Pre:,R=Ion1,PORT=sky1")
# dbLoadRecords("db/skyIconController.db", "P=Pre:,R=Ion2,PORT=sky2")
dbLoadRecords("db/skyIconController.db", "P=Pre:,R=Ion3,PORT=sky3")
dbLoadRecords("db/skyIconController.db", "P=Pre:,R=Ion4,PORT=sky4")
dbLoadRecords("db/skyIconController.db", "P=Pre:,R=Ion5,PORT=sky5")
cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=flon"

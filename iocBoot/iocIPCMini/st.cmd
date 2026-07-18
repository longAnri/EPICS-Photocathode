#!../../bin/linux-x86_64/IPCMini

#- You may have to change IPCMini to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/IPCMini.dbd"
IPCMini_registerRecordDeviceDriver pdbbase
epicsEnvSet ("STREAM_PROTOCOL_PATH", "/home/training/ConditionMonitoring/IPCMiniApp/Db")
epicsEnvSet "P" "Pre:"
epicsEnvSet "R" "IPCMini:"

#drvAsynIPPortConfigure("IPC", "192.168.1.11:4196")
#asynOctetSetInputEos("IPC", 0, ">")
#asynOctetSetOutputEos("IPC", 0, "\r")

#asynSetTraceMask("IPC", 0, 0x2)
#asynSetTraceIOMask("IPC", 0, 2)

########################################################
######Serial Port#######################################
########################################################
drvAsynSerialPortConfigure ("IPC", "/dev/ttyUSB0")

#asynSetOption("IPC", 0, "baud", "19200")
asynSetOption("IPC", 0, "bits", "8")
asynSetOption("IPC", 0, "parity", "none")
asynSetOption("IPC", 0, "stop", "1")
asynSetOption("IPC", 0, "clocal", "Y")
asynSetOption("IPC", 0, "crtscts", "N")

asynSetTraceMask("IPC", 0, ERROR|DRIVER)
asynSetTraceIOMask("IPC", 0, ESCAPE)


epicsThreadSleep(2)
## Load record instances

dbLoadRecords("db/devIPCMini.db","P=$(P),R=$(R),PORT=IPC,A=0")
#asynOctetSetOutputEos("EMODBUS", -1, "\r")
cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=flon"

#!../../bin/linux-x86_64/negController

#- You may have to change negController to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/negController.dbd"
negController_registerRecordDeviceDriver pdbbase
drvAsynIPPortConfigure ("neg", "192.168.1.34:4196")
#modbusInterposeConfig(const char *portName,
#                      modbusLinkType linkType,  # 0=TCP, 1=RTU, 2=ASCII
#                      int timeoutMsec,
#                      int writeDelayMsec)
modbusInterposeConfig("neg", 1, 1000, 50)

# drvModbusAsynConfigure(
#   char *portName,
#   char *octetPortName,
#   int modbusSlave,
#   int modbusFunction,
#   int modbusStartAddress,
#   int modbusLength,
#   modbusDataType dataType,
#   int pollMsec,
#   char *plcType)vim
# Read 6 registers. Function code=4.  Poll every 1000 ms

drvModbusAsynConfigure("negGen32", "neg", 0, 3, 0, 2, 0, 1000,"status")

drvModbusAsynConfigure("negGen16", "neg", 0, 3, 0, 1, 0, 1000, "status")
drvModbusAsynConfigure("negGenout16", "neg", 0, 6, 0, 1, 0, 1000, "status")
drvModbusAsynConfigure("negOut32", "neg", 0, 3, 0x1100, 2, 0, 1000,"status")

drvModbusAsynConfigure("negOut16", "neg", 0, 3, 0x1100, 1, 0, 1000, "status")
drvModbusAsynConfigure("negOutout16", "neg", 0, 6, 0x1100, 1, 0, 1000, "status")
drvModbusAsynConfigure("negOutout32", "neg", 0, 6, 0x1100, 2, 0, 1000, "status")

## Load record instances
#dbLoadRecords("db/negController.db","user=flon")
dbLoadRecords("db/negCommand.db","P=G:")
dbLoadTemplate("db/neg.substitutions")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=flon"

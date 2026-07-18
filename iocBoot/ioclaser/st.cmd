#!../../bin/linux-x86_64/laser

#- You may have to change laser to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/laser.dbd"
laser_registerRecordDeviceDriver pdbbase
drvAsynIPPortConfigure ("laser", "192.168.1.25:4196")

#modbusInterposeConfig(const char *portName,
#                      modbusLinkType linkType,  # 0=TCP, 1=RTU, 2=ASCII
#                      int timeoutMsec,
#                      int writeDelayMsec)
modbusInterposeConfig("laser", 1, 1000, 50)

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
drvModbusAsynConfigure("laserAo", "laser", 0, 6, 0, 1, 0, 1000,"status")
drvModbusAsynConfigure("laserAi", "laser", 0, 3, 0, 1, 0, 1000,"status")

## Load record instances
#dbLoadRecords("db/laser.db","user=flon")
dbLoadTemplate("db/amSamototion.substitutions")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=flon"

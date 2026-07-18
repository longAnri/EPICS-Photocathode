#!../../bin/linux-x86_64/Eurotherm

#- You may have to change Eurotherm to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/Eurotherm.dbd"
Eurotherm_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure("EMODBUS","192.168.1.16:4196",0,0,1)

modbusInterposeConfig(EMODBUS, 1, 2000, 0)
eurothermModbusCtrlConfigure(EMODBUS, 1)
## Load record instances
#dbLoadRecords("db/Eurotherm.db","user=flon")
dbLoadRecords("db/example_modbus_expanded.db","user=bl")
cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=flon"

#!../../bin/linux-x86_64/shiMaden

#- You may have to change shiMaden to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/shiMaden.dbd"
shiMaden_registerRecordDeviceDriver pdbbase


drvAsynIPPortConfigure("SRS", "192.168.1.54:502")

# Enable ASYN_TRACEIO_HEX on octet server
asynSetTraceIOMask(SRS, 0, HEX)

# Enable ASYN_TRACE_ERROR and ASYN_TRACEIO_DRIVER on octet server
asynSetTraceMask(SRS, 0, ERROR|DRIVER)
#modbusInterposeConfig(const char *portName,
#                      modbusLinkType linkType,  # 0=TCP, 1=RTU, 2=ASCII
#                      int timeoutMsec,
#                      int writeDelayMsec)
modbusInterposeConfig("SRS", 0, 1000, 50)

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

drvModbusAsynConfigure("SRS10_In1", "SRS", 1, 3, 0x100, 8, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In2", "SRS", 1, 3, 0x109, 3, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In3", "SRS", 1, 3, 0x10D, 2, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In4", "SRS", 1, 3, 0x120, 3, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In5", "SRS", 1, 3, 0x123, 4, 0, 2000,"status")

drvModbusAsynConfigure("SRS10_In6", "SRS", 1, 3, 0x300, 3, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In7", "SRS", 1, 3, 0x30A, 2, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In8", "SRS", 1, 3, 0x400, 10, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In9", "SRS", 1, 3, 0x40A, 6, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In10", "SRS", 1, 3, 0x410, 8, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In11", "SRS", 1, 3, 0x600, 2, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In12", "SRS", 1, 3, 0x60A, 1, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In13", "SRS", 1, 3, 0x700, 3, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In14", "SRS", 1, 3, 0x704, 1, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In15", "SRS", 1, 3, 0x708, 2, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In16", "SRS", 1, 3, 0x500, 4, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In17", "SRS", 1, 3, 0x508, 4, 0, 2000,"status")
drvModbusAsynConfigure("SRS10_In18", "SRS", 1, 3, 0x510, 4, 0, 2000,"status")
#drvModbusAsynConfigure("SRS10_In12", "SRS", 1, 3, 0x50D, 1, 0, 2000,"status")
#drvModbusAsynConfigure("SRS10_In13", "SRS", 1, 3, 0x510, 4, 0, 2000,"status")
#drvModbusAsynConfigure("SRS10_In14", "SRS", 1, 3, 0x515, 1, 0, 2000,"status")



drvModbusAsynConfigure("SRS10_Out1", "SRS", 1, 6, 0x180, 1, 0, 0,"status")
drvModbusAsynConfigure("SRS10_Out2", "SRS", 1, 6, 0x182, 4, 0, 0,"status")
drvModbusAsynConfigure("SRS10_Out3", "SRS", 1, 6, 0x18C, 1, 0, 0,"status")
drvModbusAsynConfigure("SRS10_Out4", "SRS", 1, 6, 0x190, 3, 0, 0,"status")
drvModbusAsynConfigure("SRS10_Out5", "SRS", 1, 6, 0x198, 1, 0, 0,"status")
drvModbusAsynConfigure("SRS10_Out6", "SRS", 1, 6, 0x300, 3, 0, 10,"status")
drvModbusAsynConfigure("SRS10_Out7", "SRS", 1, 6, 0x30A, 2, 0, 10,"status")

drvModbusAsynConfigure("SRS10_Out8", "SRS", 1, 6, 0x400, 10, 0, 10,"status")
drvModbusAsynConfigure("SRS10_Out9", "SRS", 1, 6, 0x40A, 6, 0, 10,"status")
drvModbusAsynConfigure("SRS10_Out10", "SRS", 1, 6, 0x410, 8, 0, 10,"status")
drvModbusAsynConfigure("SRS10_Out11", "SRS", 1, 6, 0x600, 2, 0, 10,"status")
drvModbusAsynConfigure("SRS10_Out12", "SRS", 1, 6, 0x60A, 1, 0, 10,"status")
drvModbusAsynConfigure("SRS10_Out13", "SRS", 1, 6, 0x700, 3, 0, 10,"status")
drvModbusAsynConfigure("SRS10_Out14", "SRS", 1, 6, 0x704, 1, 0, 10,"status")
drvModbusAsynConfigure("SRS10_Out15", "SRS", 1, 6, 0x708, 2, 0, 10,"status")
drvModbusAsynConfigure("SRS10_Out16", "SRS", 1, 6, 0x500, 4, 0, 10,"status")
drvModbusAsynConfigure("SRS10_Out17", "SRS", 1, 6, 0x508, 4, 0, 10,"status")
drvModbusAsynConfigure("SRS10_Out18", "SRS", 1, 6, 0x510, 4, 0, 10,"status")
#drvModbusAsynConfigure("SRS10_Out11", "SRS", 1, 6, 0x508, 4, 0, 1000,"status")
#drvModbusAsynConfigure("SRS10_Out12", "SRS", 1, 6, 0x50D, 1, 0, 1000,"status")
#drvModbusAsynConfigure("SRS10_Out13", "SRS", 1, 6, 0x510, 4, 0, 1000,"status")
#drvModbusAsynConfigure("SRS10_Out14", "SRS", 1, 6, 0x515, 1, 0, 1000,"status")
# drvModbusAsynConfigure("SRS10_Ao", "SRS", 1, 3, 0, 1, 0, 1000,"status")

## Load record instances
#dbLoadRecords("db/shiMaden.db","user=flon")
dbLoadTemplate("db/SRS10_test.substitutions")
dbLoadTemplate("db/SRS10_Out.substitutions")
dbLoadRecords("db/SRS10_BCD.db","P=SRS:,PORT=SRS10_In5")
#dbLoadRecords("db/SRS_PV.db","P=SRS:,R=PV,PORT=SRS")
cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=flon"

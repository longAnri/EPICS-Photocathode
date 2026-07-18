#!../../bin/linux-x86_64/keythley6485

#- You may have to change keythley6485 to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/keythley6485.dbd"
keythley6485_registerRecordDeviceDriver pdbbase

############ Linux serial port ###############

#drvAsynSerialPortConfigure("portName","ttyName",priority,noAutoConnect,
#                            noProcessEos)
drvAsynSerialPortConfigure("serial1", "/dev/ttyUSB0", 0, 0, 0)
asynSetOption(serial1, 0, "baud",   "9600")
asynSetOption(serial1, 0, "bits",   "8")
asynSetOption(serial1, 0, "parity", "none")
asynSetOption(serial1, 0, "stop",   "1")

#asynSetTraceIOMask("serial1", 0, ESCAPE)
#asynSetTraceMask("serial1", 0, ERROR|DRIVER)
#asynOctetSetInputEos(const char *portName, int addr,
#                     const char *eosin,const char *drvInfo)
asynOctetSetInputEos("serial1",0,"\r")
# asynOctetSetOutputEos(const char *portName, int addr,
#                       const char *eosin,const char *drvInfo)
asynOctetSetOutputEos("serial1",0,"\r")
# Make port available from the iocsh command line
#asynOctetConnect(const char *entry, const char *port, int addr,
#                 int timeout, int buffer_len, const char *drvInfo)
asynOctetConnect("serial1", "serial1")

# drvAsynIPPortConfigure ("serial1", "192.168.1.17:4196")

##### for 6485
drvAsynKeithley648x("6485", "CA1","serial1",-1);
dbLoadRecords("$(TOP)/keythley6485App/Db/Keithley6485.db","P=k648x:,CA=CA1:,PORT=CA1"

##### for 6487
#drvAsynKeithley648x("6487", "CA1","serial1",-1);
#dbLoadRecords("$(TOP)/keythley6485App/Db/Keithley6487.db","P=k648x:,CA=CA1:,PORT=CA1"

##### asyn record for debugging
dbLoadRecords("$(ASYN)/db/asynRecord.db", "P=k648x:,R=asyn_k648x,PORT=serial1,ADDR=0,OMAX=256,IMAX=2048")

## Load record instances
#dbLoadRecords("db/xxx.db","user=training")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=training"

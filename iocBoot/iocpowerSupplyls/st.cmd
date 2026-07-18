#!../../bin/linux-x86_64/powerSupplyls

#- You may have to change powerSupplyls to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/powerSupplyls.dbd"
powerSupplyls_registerRecordDeviceDriver pdbbase
epicsEnvSet ("STREAM_PROTOCOL_PATH", "$(TOP)/powerSupplylsApp/Db")
drvAsynIPPortConfigure ("Power", "192.168.1.24:4196")

## Load record instances
#dbLoadRecords("db/powerSupplyls.db","user=flon")
dbLoadRecords("db/9182B.db" "P=9182:,R=Fl,PORT=Power")
cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=flon"

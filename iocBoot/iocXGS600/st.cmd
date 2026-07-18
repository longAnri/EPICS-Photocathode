#!../../bin/linux-x86_64/XGS600

#- You may have to change XGS600 to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/XGS600.dbd"
XGS600_registerRecordDeviceDriver pdbbase



epicsEnvSet ("STREAM_PROTOCOL_PATH", "$(TOP)/XGS600App/protocol")

epicsEnvSet ("PREFIX", "LEL:VAC:VGCON01")

drvAsynIPPortConfigure ("MOXA1", "192.168.1.13:502",0,0,0)

## Load record instances
#dbLoadRecords("db/XGS600.db","user=flon")
dbLoadRecords("$(TOP)/db/agilentXgs600Ctlr.template","device=$(PREFIX), port=MOXA1")

dbLoadRecords("$(TOP)/db/agilentXgs600Img.template","device=$(PREFIX):GAUG01:CC, port=MOXA1, sensor=I1,tcauto=T3")
dbLoadRecords("$(TOP)/db/agilentXgs600Img.template","device=$(PREFIX):GAUG02:CC, port=MOXA1, sensor=I2,tcauto=T3")
dbLoadRecords("$(TOP)/db/agilentXgs600Img.template","device=$(PREFIX):GAUG03:CC, port=MOXA1, sensor=I3,tcauto=T3")
dbLoadRecords("$(TOP)/db/agilentXgs600Img.template","device=$(PREFIX):GAUG04:CC, port=MOXA1, sensor=I4,tcauto=T3")

# dbLoadRecords("$(TOP)/db/agilentXgs600Cnv.template","device=LEL-VAC-GAUG11:TC, port=MOXA1, number=0 , sensor=T3")
# dbLoadRecords("$(TOP)/db/agilentXgs600Spt.template","device=LEL-VAC-GAUG10:SPR01, port=MOXA1, number=1 , sensor=T3")
#

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=flon"

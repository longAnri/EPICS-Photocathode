#!../../bin/linux-x86_64/motorSim

#- You may have to change motorSim to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/motorSim.dbd"
motorSim_registerRecordDeviceDriver pdbbase
motorSimCreate(0, 0, 0, 36000, 0, 1, 4)
## Load record instances
#dbLoadRecords("db/motorSim.db","user=flon")
drvAsynMotorConfigure("motorSim1", "motorSim", 0, 4)

dbLoadRecords("db/sim_motor.db", "P=ky9, M=Sim")
cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=flon"

#!../../bin/linux-x86_64/motor

#- You may have to change motor to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/motor.dbd"
motor_registerRecordDeviceDriver pdbbase


drvAsynIPPortConfigure("mclennanMotor", "192.168.1.15:4196")

asynSetTraceMask("mclennanMotor", 0, ERROR|DRIVER)
asynSetTraceIOMask("mclennanMotor", 0, ESCAPE)
asynOctetSetInputEos  ("mclennanMotor", 0, "\r\n")
asynOctetSetOutputEos ("mclennanMotor", 0, "\r")


# --------- initialize PM304 driver (must be compiled into IOC) ----------
# PM304Setup(num_cards, scan_rate)
#   num_cards: maximum controllers, scan_rate: polling rate (1..60) in 1/60s units
PM304Setup(1, 5)


# PM304Config(cardIndex, portName, n_axes)
# cardIndex: 0-based index of controller
# portName: asyn port name above
# n_axes: number of axes on that controller (set to actual count)
PM304Config(0, "mclennanMotor", 1)

## Load record instances
#dbLoadRecords("db/motor.db","user=flon")
dbLoadRecords("db/mclennanMotor.db", "P=Mclennan, M=SM9749, PORT=mclennanMotor, ADDR=1")
dbLoadRecords("$(MOTOR)/db/motorUtil.db", "P=Mclennan, M=SM9749")
cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=flon"

#!../../bin/linux-x86_64/StatusMonitor

#- You may have to change StatusMonitor to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"
epicsEnvSet ("STREAM_PROTOCOL_PATH", "/home/training/examples/radioApp/Db")

## Register all support components
dbLoadDatabase "dbd/StatusMonitor.dbd"
StatusMonitor_registerRecordDeviceDriver pdbbase


## Load record instances
dbLoadTemplate "db/doseMonitor.substitutions"
# dbLoadRecords "db/doseMonitor.db"
# dbLoadRecords "db/doseMonitor.template"

cd "$(TOP)/iocBoot/${IOC}"
# < serial_configure.cmd
< TCP_configure.cmd
# < autosave.cmd

##### for 6485
# drvAsynKeithley648x("6485", "CA1","serial1",-1);
# dbLoadRecords("$(TOP)/db/Keithley6485.db","P=k648x:,CA=CA1:,PORT=CA1")

##### asyn record for debugging
# dbLoadRecords("$(ASYN)/db/asynRecord.db", "P=k648x:,R=asyn_k648x,PORT=serial1,ADDR=0,OMAX=256,IMAX=2048")

iocInit

### AUTOSAVE: Create request file and start periodic 'save’ ##
#makeAutosaveFileFromDbInfo("$(SAVE_DIR)/$(IOCNAME).req", "autosaveFields")
#create_monitor_set("$(IOCNAME).req", 5)
######################################################

## Start any sequence programs
#seq sncxxx,"user=flon"

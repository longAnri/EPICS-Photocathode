#!../../bin/linux-x86_64/radio

#- You may have to change radio to something else
#- everywhere it appears in this file

< envPaths

# cd "${TOP}"

## Register all support components
dbLoadDatabase("../../dbd/radio.dbd",0,0)
radio_registerRecordDeviceDriver pdbbase

epicsEnvSet ("STREAM_PROTOCOL_PATH", "/home/training/examples/radioApp/Db")
drvAsynIPPortConfigure ("SI", "127.0.0.1:24744")

# Log some asyn info and in/out texts
# ASYN_TRACE_ERROR     0x0001
# ASYN_TRACEIO_DEVICE  0x0002
# ASYN_TRACEIO_FILTER  0x0004
# ASYN_TRACEIO_DRIVER  0x0008
# ASYN_TRACE_FLOW      0x0010
# ASYN_TRACE_WARNING   0x0020
asynSetTraceMask("SI", 0, 4)
asynSetTraceIOMask("SI", 0, 6)

## Load record instances
dbLoadRecords("../../db/radio-monitor.db")


### AUTOSAVE: Configure ########################################
# File location, using some macros
epicsEnvSet IOCNAME radio-monitor
epicsEnvSet SAVE_DIR /home/training/examples/iocBoot/iocradio
save_restoreSet_status_prefix("radio:")
set_requestfile_path("$(SAVE_DIR)")
set_savefile_path("$(SAVE_DIR)")

# Schedule a maximum of 3 sequenced backups of the .sav file
# every 10 minutes - .sav0, .sav1, .sav2
save_restoreSet_NumSeqFiles(3)
save_restoreSet_SeqPeriodInSeconds(600)

# Arrange for restoring saved values into records
set_pass1_restoreFile("$(IOCNAME).sav")
######################################################

# cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
seq radios

### AUTOSAVE: Create request file and start periodic 'save’ ##
makeAutosaveFileFromDbInfo("$(SAVE_DIR)/$(IOCNAME).req", "autosaveFields")
create_monitor_set("$(IOCNAME).req", 5)
######################################################


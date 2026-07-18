### AUTOSAVE: Configure ########################################
# File location, using some macros
epicsEnvSet IOCNAME status
epicsEnvSet SAVE_DIR /home/flon/ConditionMonitoring/iocBoot/iocStatusMonitor/saveFile

save_restoreSet_status_prefix("status:")
set_requestfile_path("$(SAVE_DIR)")
set_savefile_path("$(SAVE_DIR)")

# Schedule a maximum of 3 sequenced backups of the .sav file
# every 10 minutes - .sav0, .sav1, .sav2
save_restoreSet_NumSeqFiles(3)
save_restoreSet_SeqPeriodInSeconds(600)

# Arrange for restoring saved values into records
set_pass1_restoreFile("$(IOCNAME).sav")



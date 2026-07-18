TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = SQM160
# SQM160.dbd will be created and installed
DBD += SQM160.dbd

# SQM160.dbd will be made up from these files:
SQM160_DBD += base.dbd
SQM160_DBD += stream.dbd
SQM160_DBD += asyn.dbd
SQM160_DBD += drvAsynIPPort.dbd
# Include dbd files from all support applications:
#SQM160_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#SQM160_LIBS += xxx
SQM160_LIBS += asyn
SQM160_LIBS += stream

# SQM160_registerRecordDeviceDriver.cpp derives from SQM160.dbd
SQM160_SRCS += SQM160_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
SQM160_SRCS_DEFAULT += SQM160Main.cpp
SQM160_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#SQM160_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
SQM160_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


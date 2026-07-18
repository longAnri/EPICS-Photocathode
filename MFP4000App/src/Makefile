TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = MFP4000
# MFP4000.dbd will be created and installed
DBD += MFP4000.dbd

# MFP4000.dbd will be made up from these files:
MFP4000_DBD += base.dbd

# Include dbd files from all support applications:
#MFP4000_DBD += xxx.dbd
MFP4000_DBD += stream.dbd
MFP4000_DBD += asyn.dbd
MFP4000_DBD += drvAsynIPPort.dbd

# Add all the support libraries needed by this IOC
#MFP4000_LIBS += xxx
MFP4000_LIBS += asyn
MFP4000_LIBS += stream

# MFP4000_registerRecordDeviceDriver.cpp derives from MFP4000.dbd
MFP4000_SRCS += MFP4000_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
MFP4000_SRCS_DEFAULT += MFP4000Main.cpp
MFP4000_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#MFP4000_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
MFP4000_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


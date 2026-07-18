TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = IPCMini
# IPCMini.dbd will be created and installed
DBD += IPCMini.dbd

# IPCMini.dbd will be made up from these files:
IPCMini_DBD += base.dbd

# Include dbd files from all support applications:
#IPCMini_DBD += xxx.dbd
IPCMini_DBD += stream.dbd
IPCMini_DBD += asyn.dbd
IPCMini_DBD += drvAsynIPPort.dbd
IPCMini_DBD += drvAsynSerialPort.dbd
# Add all the support libraries needed by this IOC
#IPCMini_LIBS += xxx
IPCMini_LIBS += asyn
IPCMini_LIBS += stream

# IPCMini_registerRecordDeviceDriver.cpp derives from IPCMini.dbd
IPCMini_SRCS += IPCMini_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
IPCMini_SRCS_DEFAULT += IPCMiniMain.cpp
IPCMini_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#IPCMini_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
IPCMini_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


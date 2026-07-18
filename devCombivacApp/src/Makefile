TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = devCombivac
# devCombivac.dbd will be created and installed
DBD += devCombivac.dbd

# devCombivac.dbd will be made up from these files:
devCombivac_DBD += base.dbd

# Include dbd files from all support applications:
#devCombivac_DBD += xxx.dbd
devCombivac_DBD += stream.dbd
devCombivac_DBD += asyn.dbd
devCombivac_DBD += drvAsynIPPort.dbd
# Add all the support libraries needed by this IOC
#devCombivac_LIBS += xxx
devCombivac_LIBS += asyn
devCombivac_LIBS += stream
# devCombivac_registerRecordDeviceDriver.cpp derives from devCombivac.dbd
devCombivac_SRCS += devCombivac_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
devCombivac_SRCS_DEFAULT += devCombivacMain.cpp
devCombivac_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#devCombivac_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
devCombivac_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


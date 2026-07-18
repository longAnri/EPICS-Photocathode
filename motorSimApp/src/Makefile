TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = motorSim
# motorSim.dbd will be created and installed
DBD += motorSim.dbd

# motorSim.dbd will be made up from these files:
motorSim_DBD += base.dbd
motorSim_DBD += asyn.dbd
motorSim_DBD += drvAsynIPPort.dbd
motorSim_DBD += motorSupport.dbd
motorSim_DBD += motorSimSupport.dbd

# Include dbd files from all support applications:
#motorSim_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#motorSim_LIBS += xxx

# motorSim_registerRecordDeviceDriver.cpp derives from motorSim.dbd
motorSim_SRCS += motorSim_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
motorSim_SRCS_DEFAULT += motorSimMain.cpp
motorSim_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#motorSim_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
motorSim_LIBS += $(EPICS_BASE_IOC_LIBS)
motorSim_LIBS += asyn
motorSim_LIBS += motor
motorSim_LIBS += motorSimSupport

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


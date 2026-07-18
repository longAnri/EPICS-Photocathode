TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = shiMaden
# shiMaden.dbd will be created and installed
DBD += shiMaden.dbd

# shiMaden.dbd will be made up from these files:
shiMaden_DBD += base.dbd

# Include dbd files from all support applications:
#shiMaden_DBD += xxx.dbd
shiMaden_DBD += asyn.dbd
shiMaden_DBD += modbusApp.dbd
shiMaden_DBD += modbusSupport.dbd
shiMaden_DBD += drvAsynIPPort.dbd

# Add all the support libraries needed by this IOC
#shiMaden_LIBS += xxx
shiMaden_LIBS += asyn
shiMaden_LIBS += modbus
# shiMaden_registerRecordDeviceDriver.cpp derives from shiMaden.dbd
shiMaden_SRCS += shiMaden_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
shiMaden_SRCS_DEFAULT += shiMadenMain.cpp
shiMaden_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#shiMaden_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
shiMaden_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = StatusMonitor
# StatusMonitor.dbd will be created and installed
DBD += StatusMonitor.dbd

# StatusMonitor.dbd will be made up from these files:
StatusMonitor_DBD += base.dbd

# Build the IOC support library

LIBRARY_IOC += StatusMonitorSupport

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
StatusMonitorSupport_SRCS += drvAsynKeithley648x.cpp

# StatusMonitor_registerRecordDeviceDriver.cpp derives from StatusMonitor.dbd
StatusMonitor_SRCS += StatusMonitor_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
StatusMonitor_SRCS_DEFAULT += StatusMonitorMain.cpp
StatusMonitor_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#StatusMonitor_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
StatusMonitor_LIBS += $(EPICS_BASE_IOC_LIBS)

##### ADDED FOR ASYN ############
##### ADDED FOR STREAM DEVICE ############
StatusMonitor_DBD += stream.dbd
StatusMonitor_DBD += asyn.dbd
StatusMonitor_DBD += modbusApp.dbd
StatusMonitor_DBD += modbusSupport.dbd
StatusMonitor_DBD += asSupport.dbd
StatusMonitor_DBD += drvAsynSerialPort.dbd
StatusMonitor_DBD += drvAsynIPPort.dbd
StatusMonitor_DBD += drvAsynKeithley648x.dbd

StatusMonitor_LIBS += asyn
# Link in the code from the support library
StatusMonitor_LIBS += StatusMonitorSupport
StatusMonitor_LIBS += stream
StatusMonitor_LIBS += modbus
StatusMonitor_LIBS += autosave
#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


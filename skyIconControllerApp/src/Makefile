TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = skyIconController
# skyIconController.dbd will be created and installed
DBD += skyIconController.dbd

# skyIconController.dbd will be made up from these files:
skyIconController_DBD += base.dbd

# Include dbd files from all support applications:
#skyIconController_DBD += xxx.dbd
skyIconController_DBD += asyn.dbd
skyIconController_DBD += stream.dbd
skyIconController_DBD += modbusApp.dbd
skyIconController_DBD += modbusSupport.dbd
skyIconController_DBD += drvAsynIPPort.dbd

# Add all the support libraries needed by this IOC
#skyIconController_LIBS += xxx
skyIconController_LIBS += asyn
skyIconController_LIBS += stream
skyIconController_LIBS += modbus
# skyIconController_registerRecordDeviceDriver.cpp derives from skyIconController.dbd
skyIconController_SRCS += skyIconController_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
skyIconController_SRCS_DEFAULT += skyIconControllerMain.cpp
skyIconController_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#skyIconController_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
skyIconController_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


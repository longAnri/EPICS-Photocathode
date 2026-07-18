TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = keythley6485
# keythley6485.dbd will be created and installed
DBD += keythley6485.dbd

# keythley6485.dbd will be made up from these files:
keythley6485_DBD += base.dbd

# Build the IOC support library

LIBRARY_IOC += keythley6485Support

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
keythley6485Support_SRCS += drvAsynKeithley648x.cpp

keythley6485Support_LIBS += $(EPICS_BASE_IOC_LIBS)

# Include dbd files from all support applications:
#keythley6485_DBD += xxx.dbd
keythley6485_DBD += asyn.dbd
keythley6485_DBD += drvAsynSerialPort.dbd
keythley6485_DBD += drvAsynKeithley648x.dbd
keythley6485_DBD += drvAsynIPPort.dbd

# Add all the support libraries needed by this IOC
#keythley6485_LIBS += xxx
keythley6485_LIBS += keythley6485Support
keythley6485_LIBS += asyn
# keythley6485_registerRecordDeviceDriver.cpp derives from keythley6485.dbd
keythley6485_SRCS += keythley6485_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
keythley6485_SRCS_DEFAULT += keythley6485Main.cpp
keythley6485_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#keythley6485_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
keythley6485_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


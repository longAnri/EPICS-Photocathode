TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = motor
# motor.dbd will be created and installed
DBD += motor.dbd

# motor.dbd will be made up from these files:
motor_DBD += base.dbd
motor_DBD += asyn.dbd
motor_DBD += asynRecord.dbd
motor_DBD += drvAsynIPPort.dbd

motor_DBD += motorRecord.dbd
motor_DBD += motorSupport.dbd
motor_DBD += devMclennanMotor.dbd
# Include dbd files from all support applications:
#motor_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#motor_LIBS += xxx

# motor_registerRecordDeviceDriver.cpp derives from motor.dbd
motor_SRCS += motor_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
motor_SRCS_DEFAULT += motorMain.cpp
motor_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#motor_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
motor_LIBS += $(EPICS_BASE_IOC_LIBS)

motor_LIBS += asyn
motor_LIBS += motor
motor_LIBS += Mclennan
#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


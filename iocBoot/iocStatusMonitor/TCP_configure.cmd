
###################################################################
###############Configuration of Serial Port1#######################
###################################################################

drvAsynIPPortConfigure ("SI1", "192.168.1.23:1037")
#modbusInterposeConfig(const char *portName,
#                      modbusLinkType linkType,  # 0=TCP, 1=RTU, 2=ASCII
#                      int timeoutMsec,
#                      int writeDelayMsec)
modbusInterposeConfig("SI1", 1, 1000, 50)

# drvModbusAsynConfigure(
#   char *portName,
#   char *octetPortName,
#   int modbusSlave,
#   int modbusFunction,
#   int modbusStartAddress,
#   int modbusLength,
#   modbusDataType dataType,
#   int pollMsec,
#   char *plcType)
# Read 6 registers. Function code=4.  Poll every 1000 ms

drvModbusAsynConfigure("SI1_REG_IN", "SI1", 1, 4, 0, 6, 0, 1000, "Pressure")

drvModbusAsynConfigure("SI1_REG_OUT", "SI1", 1, 16, 6, 8, 0, 2000, "Pressure")

###################################################################
###############Configuration of Serial Port2#######################
###################################################################

#drvAsynIPPortConfigure ("SI2", "192.168.1.23:1035")

#modbusInterposeConfig("SI2", 1, 1000, 50)


#drvModbusAsynConfigure("SI2_REG_IN", "SI2", 1, 4, 0, 6, 0, 1000, "Pressure")
#drvModbusAsynConfigure("SI2_REG_OUT", "SI2", 1, 6, 6, 1, 0, 2000, "Pressure")

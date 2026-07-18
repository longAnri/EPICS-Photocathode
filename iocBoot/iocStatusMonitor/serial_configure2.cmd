
###################################################################
###############Configuration of Serial Port1#######################
###################################################################

drvAsynSerialPortConfigure("SI1", "/dev/ttyUSB0")
asynSetOption("SI1", 0, "baud", "9600")
asynSetOption("SI1", 0, "bits", "8")
asynSetOption("SI1", 0, "parity", "none")
asynSetOption("SI1", 0, "stop", "1")
asynSetOption("SI1", 0, "clocal", "Y")
asynSetOption("SI1", 0, "crtscts", "N")

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



###################################################################
###############Configuration of Serial Port2#######################
###################################################################

drvAsynSerialPortConfigure("SI2", "/dev/ttyUSB1")
asynSetOption("SI2", 0, "baud", "9600")
asynSetOption("SI2", 0, "bits", "8")
asynSetOption("SI2", 0, "parity", "none")
asynSetOption("SI2", 0, "stop", "1")
asynSetOption("SI2", 0, "clocal", "Y")
asynSetOption("SI2", 0, "crtscts", "N")

modbusInterposeConfig("SI2", 1, 1000, 50)


drvModbusAsynConfigure("SI2_REG_IN", "SI2", 1, 4, 0, 6, 0, 1000, "Pressure")


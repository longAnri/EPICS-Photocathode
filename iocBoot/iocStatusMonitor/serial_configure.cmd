
###################################################################
###############Configuration of Serial Port1#######################
###################################################################


#drvAsynSerialPortConfigure("portName","ttyName",priority,noAutoConnect,
#                            noProcessEos)
drvAsynSerialPortConfigure("serial1", "/dev/ttyUSB0", 0, 0, 0)
asynSetOption(serial1, 0, "baud",   "9600")
asynSetOption(serial1, 0, "bits",   "8")
asynSetOption(serial1, 0, "parity", "none")
asynSetOption(serial1, 0, "stop",   "1")
#asynOctetSetInputEos(const char *portName, int addr,
#                     const char *eosin,const char *drvInfo)
asynSetTraceIOMask("serial1", 0, ESCAPE)
asynSetTraceMask("serial1", 0, ERROR|DRIVER)

asynOctetSetInputEos("serial1",0,"\r")
# asynOctetSetOutputEos(const char *portName, int addr,
#                       const char *eosin,const char *drvInfo)
asynOctetSetOutputEos("serial1",0,"\r")
# Make port available from the iocsh command line
#asynOctetConnect(const char *entry, const char *port, int addr,
#                 int timeout, int buffer_len, const char *drvInfo)

asynOctetConnect("serial1", "serial1")


TOP=../..
include $(TOP)/configure/CONFIG

#=======================================

# DG645.dbd will include these files:
DBD += DG645.dbd
DG645_DBD += base.dbd
DG645_DBD += calcSupport.dbd
DG645_DBD += stream.dbd
DG645_DBD += asyn.dbd
DG645_DBD += drvAsynSerialPort.dbd
DG645_DBD += drvAsynIPPort.dbd

#=======================================

# Build the IOC application
PROD_IOC = DG645

# DG645_registerRecordDeviceDriver.cpp derives from DG645.dbd
DG645_SRCS += DG645_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
DG645_SRCS_DEFAULT += main.cpp
DG645_SRCS_vxWorks += -nil-

# Link with the asyn and base libraries
DG645_LIBS += calc stream asyn pcre seq pv sscan
DG645_LIBS += $(EPICS_BASE_IOC_LIBS)
DG645_SYS_LIBS += usb-1.0

#=======================================

include $(TOP)/configure/RULES
#  ADD EXTRA GNUMAKE RULES BELOW HERE

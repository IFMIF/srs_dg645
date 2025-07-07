TOP = ..
include $(TOP)/configure/CONFIG

#==============================================================================
# DB/DBD files
#==============================================================================

# <name>.dbd will be generated from <name>Include.dbd
DBD += srs_DG645.dbd

# Install databases, templates & substitutions like this
DB += srs_DG645.db
DB += srs_DG645_output.db
DB += srs_DG645_channel.db
DB += srs_DG645.proto

# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_TEMPLATE = <templatename>

#==============================================================================
# Source and libraries
#==============================================================================

# Build DG645 as a library for an IOC
LIBRARY_IOC = srs_DG645

# Library source files
# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
srs_DG645_SRCS += srs_DG645_registerRecordDeviceDriver.cpp

# Link with the asyn and base libraries
srs_DG645_LIBS += calc stream asyn seq pv sscan
srs_DG645_LIBS += $(EPICS_BASE_IOC_LIBS)
srs_DG645_SYS_LIBS += usb-1.0

#==============================================================================
# EPICS build rules
#==============================================================================

include $(TOP)/configure/RULES
#  ADD EXTRA GNUMAKE RULES BELOW HERE

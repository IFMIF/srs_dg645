TOP = ../..
include $(TOP)/configure/CONFIG

#==============================================================================
# DB/DBD files
#==============================================================================

# Create the application DBD file from the library DBD file
DBD += srs_DG645_test.dbd
srs_DG645_test_DBD += srs_DG645.dbd

#==============================================================================
# Source and libraries
#==============================================================================

# Build an IOC application
PROD_IOC = srs_DG645_test

# Application source files
# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
srs_DG645_test_SRCS += srs_DG645_test_registerRecordDeviceDriver.cpp
srs_DG645_test_SRCS_DEFAULT += main.cpp

# Add a definition for each support application used by this application
# N1470App_LIBS += N1470 calc stream asyn pcre seq pv sscan
srs_DG645_test_LIBS += srs_DG645
srs_DG645_test_LIBS += calc stream asyn seq pv sscan
srs_DG645_test_LIBS += $(EPICS_BASE_IOC_LIBS)

#==============================================================================
# EPICS build rules
#==============================================================================

include $(TOP)/configure/RULES
#  ADD EXTRA GNUMAKE RULES BELOW HERE
USR_CXXFLAGS += -Wno-deprecated -Werror -fPIC

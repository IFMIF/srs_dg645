#!../bin/linux-x86_64/srs_DG645_test

< envPaths

# Settings
epicsEnvSet("BOOT_DIR", ${PWD})
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/db")
epicsEnvSet("DEVICE_HOSTNAME", "srs-dg645.local:5025")
epicsEnvSet("BUS", "L0")

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/db")
epicsEnvSet("P", "DCU07:")
epicsEnvSet("R", "DG645:")

# Register all support components
cd "$(TOP)/dbd"
dbLoadDatabase("srs_DG645.dbd")
srs_DG645_test_registerRecordDeviceDriver(pdbbase)

# Set up IOC/hardware links - TCP port
#     (link, host, priority, noAutoConnect, noEosProcessing)
drvAsynIPPortConfigure("$(BUS)", "$(DEVICE_HOSTNAME)", 0, 0, 0) 
epicsThreadSleep(2)

# Only for debugging
asynSetTraceMask("$(BUS)", 0, 4)
asynSetTraceIOMask("$(BUS)", 0, 6)

# Load record instances
cd "$(TOP)/db"
dbLoadRecords("srs_DG645.db","P=$(P),R=$(R),PORT=$(BUS),A=0")

dbLoadRecords("srs_DG645_output.db","P=$(P),R=$(R),N=T0:,ID=0,PORT=$(BUS),A=0")
dbLoadRecords("srs_DG645_output.db","P=$(P),R=$(R),N=AB:,ID=1,PORT=$(BUS),A=0")
dbLoadRecords("srs_DG645_output.db","P=$(P),R=$(R),N=CD:,ID=2,PORT=$(BUS),A=0")
dbLoadRecords("srs_DG645_output.db","P=$(P),R=$(R),N=EF:,ID=3,PORT=$(BUS),A=0")
dbLoadRecords("srs_DG645_output.db","P=$(P),R=$(R),N=GH:,ID=3,PORT=$(BUS),A=0")

dbLoadRecords("srs_DG645_channel.db","P=$(P),R=$(R),N=t0:,ID=0,PORT=$(BUS),A=0")
dbLoadRecords("srs_DG645_channel.db","P=$(P),R=$(R),N=t1:,ID=1,PORT=$(BUS),A=0")
dbLoadRecords("srs_DG645_channel.db","P=$(P),R=$(R),N=a:,ID=2,PORT=$(BUS),A=0")
dbLoadRecords("srs_DG645_channel.db","P=$(P),R=$(R),N=b:,ID=3,PORT=$(BUS),A=0")
dbLoadRecords("srs_DG645_channel.db","P=$(P),R=$(R),N=c:,ID=4,PORT=$(BUS),A=0")
dbLoadRecords("srs_DG645_channel.db","P=$(P),R=$(R),N=d:,ID=5,PORT=$(BUS),A=0")
dbLoadRecords("srs_DG645_channel.db","P=$(P),R=$(R),N=e:,ID=6,PORT=$(BUS),A=0")
dbLoadRecords("srs_DG645_channel.db","P=$(P),R=$(R),N=f:,ID=7,PORT=$(BUS),A=0")
dbLoadRecords("srs_DG645_channel.db","P=$(P),R=$(R),N=g:,ID=8,PORT=$(BUS),A=0")
dbLoadRecords("srs_DG645_channel.db","P=$(P),R=$(R),N=h:,ID=9,PORT=$(BUS),A=0")

# Start the IOC control loop
cd $(BOOT_DIR)
iocInit()

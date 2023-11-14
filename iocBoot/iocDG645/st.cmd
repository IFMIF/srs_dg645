#!../../bin/linux-x86_64/DG645

#- You may have to change DG645 to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"
epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/db"
epicsEnvSet "IP" "172.16.8.235"
epicsEnvSet "IPport" "5025"

# Macro prefix
epicsEnvSet "P" "DCU07:"
epicsEnvSet "R" "DG645:"

## Register all support components
dbLoadDatabase "dbd/DG645.dbd"
DG645_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure("L0","$(IP):$(IPport)",0,0,0) 

asynSetTraceMask("L0", 0, 4)
asynSetTraceIOMask("L0", 0, 6)

epicsThreadSleep(2)


## Load record instances
#dbLoadRecords("db/asynRecord.db","P=$(P),R=$(R),PORT=L0,ADDR=0,IMAX=200,OMAX=200")
dbLoadRecords("db/DG645.db","P=$(P),R=$(R),PORT=L0,A=0")


cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=fb250757"

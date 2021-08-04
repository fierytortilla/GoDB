#!/bin/sh
export CONFFILE=$1
source ${CONFFILE}
tabix -h ${DBDATADIR}/chr19.vcf.gz 0:0-0 | python ${PYLDIR}/load_samples.py --assaytype=${ASSAYTYPE}
#for i in $(seq 1 22); do if [ -e ${DBDATADIR}/chr${i}.vcf.gz ]; then tabix -h ${DBDATADIR}/chr${i}.vcf.gz 0:0-0 | python ${PYLDIR}/load_samples.py --assaytype=${ASSAYTYPE}; fi; done

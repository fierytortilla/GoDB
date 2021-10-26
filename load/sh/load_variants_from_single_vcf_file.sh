#!/bin/bash

set -eu

# Ensure the config file has been sourced first.
# This operation is (mostly) in parallel and more cores
# can be used (if available) by increasing the value on
# xargs -P argument.

for a in broad affy illumina ; do
    find $DATADIR/$a -name "*.vcf.gz" -print0 | \
	xargs -P2 -0 -I{} sh -c "${ZCATEXEC} {} | \
python ${PYLDIR}/load_variants_from_vcf.py --assaytype=$a"
done

#!/bin/bash

set -eu

# Ensure the config file has been sourced first.

for a in broad affy illumina ; do
    python ${PYLDIR}/load_filepaths.py --assaytype=$a \
	--prfx=$DATADIR --sfx=$a/dbresults
done

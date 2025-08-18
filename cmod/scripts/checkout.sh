#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script checks out the correct NVDLA hw Github branch.

set -e

cd ${NVP_CMOD_NVDLA}

rm -f ${NVP_CMOD_NVDLA}/*.done
rm -rf ${NVP_CMOD_OUT}

if [ ${NVP_CONFIG} = "nv_full" ]; then
    git checkout nvdlav1
else
    git checkout master #nv_small
fi
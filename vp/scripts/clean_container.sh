#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script cleans all Virtual Platform container output artifacts.

# Clean VP artifacts
sudo rm -rf ${NVP_VP_PATH}
sudo rm -f ${NVP_VP_OUT}/inference.log

if [ -z "$(find "${NVP_VP_OUT}" -mindepth 1 -print -quit)" ]; then
    rm -rf ${NVP_VP_OUT}
fi

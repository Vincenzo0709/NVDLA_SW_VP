#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script prepares the Virtual Platform execution environment, after launch.

# Set some useful environment variables
export NVP_VP_ROOT=/mnt
export NVP_VP_NATIVE=${NVP_VP_ROOT}/native
export NVP_VP_NETS=${NVP_VP_ROOT}/nets
export NVP_VP_OUT=${NVP_VP_ROOT}/output
export NVP_VP_PATH=${NVP_VP_OUT}/nvdla

# Retrieve the NET
export NVP_NET=$(cat ${NVP_VP_OUT}/nets/net.config)
export NVP_PROFILE=$(cat ${NVP_VP_OUT}/nets/profile.config)
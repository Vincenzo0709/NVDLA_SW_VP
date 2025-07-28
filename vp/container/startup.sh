#!/bin/bash
# 
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script executes at each nvdla_custom container startup:
#       1. Set environment variables;
#       2. Copy KMD, UMD runtime application and library, to update them if recompiled;
#       3. Keep bash CLI and container environment running.

echo "Running startup script..."

# Set some environment variables
export NVP_VP_ROOT=/home/vp
export NVP_VP_PATH=/usr/local/nvdla
export NVP_SW_ROOT=/home/sw
export NVP_SW_NVDLA=${NVP_SW_ROOT}/nvdla

# Copy recompiled KDM kernel module into container environment
cp ${NVP_SW_NVDLA}/kmd/port/linux/opendla.ko ${NVP_VP_PATH}

# Copy recompiled UDM application and linked library into container environment
cp ${NVP_SW_NVDLA}/umd/out/apps/runtime/nvdla_runtime/nvdla_runtime ${NVP_VP_PATH}
cp ${NVP_SW_NVDLA}/umd/out/core/src/runtime/libnvdla_runtime/libnvdla_runtime.so ${NVP_VP_PATH}

# Prevent container from exiting
exec /bin/bash

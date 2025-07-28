#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script runs an inference:
#       1. Insert kernel modules;
#       2. Export LD_LIBRARY_PATH needed by the runtime application;
#       3. Start runtime indicating:
#           a. The loadable of the chosen net;
#           b. An image taken from the respective directory;
#           c. To print the output in raw format.
#       4. Extract inference log.

# Insert needed kernel modules
insmod ${NVP_VP_PATH}/drm.ko
insmod ${NVP_VP_PATH}/opendla.ko

# Library path for nvdla_runtime
export LD_LIBRARY_PATH=${NVP_VP_PATH}

# Run inference
cd ${NVP_VP_OUT}
${NVP_VP_PATH}/nvdla_runtime \
    --loadable ${NVP_VP_OUT}/nets/LeNet/fast-math.nvdla \
    --image ${NVP_VP_ROOT}/nets/LeNet/images/three.pgm \
    --rawdump | tee ${NVP_VP_OUT}/inference.log

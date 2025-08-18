#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script compiles the loadable for the chosen net and configuration.

set -e

# Set needed parameters for the compiler
OUTPUT_DIR=${NVP_VP_OUT}/nets/${NVP_NET}
INPUT_DIR=${NVP_VP_NETS}/${NVP_NET}

PROTOTXT=$( find ${INPUT_DIR}/ -name "*.prototxt" )

CAFFEMODEL=$( find ${INPUT_DIR}/ -name "*.caffemodel" )

# TODO: table of formats
case ${NVP_NET} in
    LeNet)
        FORMAT=R8
        ;;
    AlexNet)
        FORMAT=B8G8R8
        ;;
    *)
        echo "Unsupported pixel format for ${NVP_NET}"
        exit 1
        ;;
esac

# Launch compiler (the .nvdla output is generated in the current directory)
cd ${OUTPUT_DIR}

${NVP_VP_ROOT}/compiler/nvdla_compiler                                          \
    --prototxt ${PROTOTXT}                                                      \
    --caffemodel ${CAFFEMODEL}                                                  \
    --profile ${NVP_PROFILE}                                                    \
    -o .                                                                        \
    --cprecision int8                                                           \
    --configtarget ${NVP_CONFIG}                                                \
    --informat ${FORMAT} | tee ${NVP_VP_OUT}/${NVP_CONFIG}-${NVP_PROFILE}.log

# Remove futile outputs
rm -rf ${OUTPUT_DIR}/.wisdom.dir

# To pass NVP_NET and NVP_PROFILE environment variables inside the Virtual Platform environment, we use a file
echo ${NVP_NET} > ${NVP_VP_OUT}/nets/net.config
echo ${NVP_PROFILE} > ${NVP_VP_OUT}/nets/profile.config
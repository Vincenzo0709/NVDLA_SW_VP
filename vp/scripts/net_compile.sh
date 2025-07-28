#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script compiles the loadable for the chosen net and configuration.

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
    *)
        echo "Unsupported network format for ${NVP_NET}"
        exit 1
        ;;
esac

# Launch compiler
cd ${OUTPUT_DIR}

${NVP_SW_UMD}/out/apps/compiler/nvdla_compiler/nvdla_compiler     \
    --prototxt ${PROTOTXT}                                        \
    --caffemodel ${CAFFEMODEL}                                    \
    -o .                                                          \
    --configtarget ${NVP_CONFIG}                                  \
    --informat ${FORMAT}                                          \
    | tee ${NVP_VP_OUT}/net_compile.log

# Remove futile outputs
rm -rf ${OUTPUT_DIR}/.wisdom.dir
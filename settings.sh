#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script must be sourced before any target; it prepares the environment:
#       1. Define all environment variabiles;
#       2. Select NVDLA configuration;
#       3. Select VP mode.
#
# Usage:
#       source settings.sh <CONFIG> <MODE>

# Top directory
export NVP_ROOT_DIR="$( dirname "$( realpath "${BASH_SOURCE[0]}" )" )"

# Hardware C model directories:
export NVP_CMOD_ROOT=${NVP_ROOT_DIR}/cmod
export NVP_CMOD_NVDLA=${NVP_CMOD_ROOT}/nvdla
export NVP_CMOD_OUT=${NVP_CMOD_NVDLA}/outdir

# Software directories
export NVP_SW_ROOT=${NVP_ROOT_DIR}/sw
export NVP_SW_NVDLA=${NVP_SW_ROOT}/nvdla
export NVP_SW_TOOLS=${NVP_SW_ROOT}/tools
export NVP_SW_UMD=${NVP_SW_NVDLA}/umd
export NVP_SW_KMD=${NVP_SW_NVDLA}/kmd

# Virtual Platform directories
export NVP_VP_ROOT=${NVP_ROOT_DIR}/vp
export NVP_VP_NATIVE=${NVP_VP_ROOT}/native
export NVP_VP_NETS=${NVP_VP_ROOT}/nets
export NVP_VP_OUT=${NVP_VP_ROOT}/output
export NVP_VP_PATH=${NVP_VP_OUT}/nvdla

# Configuration, mode, and CNN selection
CONFIG=$1
MODE=$2
NET=$3

# NVDLA configurations:
# - nv_full:
# - nv_large: 
# - nv_small: the least complex, with 64 INT8 MAC, no SRAM and no Microcontroller (headless)
case ${CONFIG} in
    nv_full | "")
        export NVP_CONFIG=nv_full
        ;;
    *)
        echo "Configuration not recognized"
        exit 1
        ;;
esac
echo "Chosen configuration: $NVP_CONFIG"

# NVDLA VP modes:
# - native: executes directly in the current environment;
# - container: executes in a preconfigured container environment.
case ${MODE} in
    native | "")
        export NVP_MODE=native
        export NVP_VP_INF_OUTPUT=${NVP_VP_OUT}/output/nets/${NVP_NET}/output.dimg
        ;;
    container)
        export NVP_MODE=container
        export NPV_VP_INF_OUTPUT=/mnt/usr/local/nvdla
        ;;
    *)
        echo "Mode not recognized"
        exit 1
        ;;
esac
echo "Chosen mode: $NVP_MODE"

# CNN alternatives:
# - LeNet:
# - AlexNet:
case ${NET} in
    LeNet | "")
        export NVP_NET=LeNet
        ;;
    AlexNet)
        export NVP_NET=AlexNet
        ;;
    *)
        echo "Mode not recognized"
        exit 1
        ;;
esac
echo "Chosen net: $NVP_NET"

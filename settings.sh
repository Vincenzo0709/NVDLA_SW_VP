#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script prepares the environment:
#       1. Define all environment variabiles;
#       2. Select NVDLA configuration;
#       3. Select VP mode.
#

# Top directory
export NVP_ROOT_DIR="$( dirname "$( realpath "${BASH_SOURCE[0]}" )" )"

# Hardware C model directories:
export NVP_CMOD_ROOT=${NVP_ROOT_DIR}/cmod
export NVP_CMOD_NVDLA=${NVP_CMOD_ROOT}/nvdla

# Software directories
export NVP_SW_ROOT=${NVP_ROOT_DIR}/sw
export NVP_SW_NVDLA=${NVP_SW_ROOT}/nvdla
export NVP_SW_TOOLS=${NVP_SW_ROOT}/tools
export NVP_SW_UMD=${NVP_SW_NVDLA}/umd
export NVP_SW_KMD=${NVP_SW_NVDLA}/kmd

# Virtual Platform directories
export NVP_VP_ROOT=${NVP_ROOT_DIR}/vp
export NVP_VP_NATIVE=${NVP_VP_ROOT}/native

# Configuration and mode selection
CONFIG=$1
MODE=$2

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

# NVDLA VP modes:
# - native: executes directly in the current environment (if you followed);
# - container: executes in a preconfigured container environment.
case ${MODE} in
    native | "")
        export NVP_VP_MODE=native
        ;;
    container)
        export NVP_VP_MODE=container
        ;;
    *)
        echo "Mode not recognized"
        exit 1
        ;;
esac

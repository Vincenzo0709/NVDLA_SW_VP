#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script must be sourced before any target; it prepares the environment:
#       1. Define all environment variabiles;
#       2. Select NVDLA parameters:
#           a. Mode;
#           b. Configuration;
#           c. Profile;
#           d. CNN.
#
# Usage:
#       source settings.sh

# Colors
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[0m' # No Color

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

# NVDLA VP modes:
# - native: executes directly in the current environment;
# - container: executes in a preconfigured container environment.
read -p "Enter the mode (native/container): " MODE
case ${MODE} in
    native)
        export NVP_MODE=native
        export NVP_VP_INF_OUTPUT=${NVP_VP_OUT}/output/nets/${NVP_NET}/output.dimg
        ;;
    container)
        export NVP_MODE=container
        export NPV_VP_INF_OUTPUT=/mnt/usr/local/nvdla/output.dimg
        ;;
    *)
        echo -e "${RED}ERROR!${NC} Mode not recognized"
        return 1
        ;;
esac

# NVDLA configurations (see documentation):
# - nv_full;
# - nv_large; 
# - nv_small.
read -p "Enter the hardware configuration (nv_full/nv_large/nv_small): " CONFIG
case ${CONFIG} in
    nv_full)
        export NVP_CONFIG=nv_full
        ;;
    nv_large)
        export NVP_CONFIG=nv_large
        ;;
    nv_small)
        export NVP_CONFIG=nv_small
        ;;
    *)
        echo -e "${RED}ERROR!${NC} Configuration not recognized"
        return 1
esac


# Profile alternatives:
# - basic;
# - default;
# - performance;
# - fast-math.
read -p "Enter the loadable profile (basic/default/performance/fast-math): " PROFILE
case ${PROFILE} in
    basic)
        export NVP_PROFILE=basic
        ;;
    default)
        export NVP_PROFILE=default
        ;;
    performance)
        export NVP_PROFILE=performance
        ;;
    fast-math)
        export NVP_PROFILE=fast-math
        ;;
    *)
        echo -e "${RED}ERROR!${NC} Profile not recognized"
        return 1
esac

# CNN alternatives (see documentation):
# - LeNet;
# - AlexNet.
read -p "Enter the CNN (LeNet): " NET
case ${NET} in
    LeNet)
        export NVP_NET=LeNet
        ;;
    AlexNet)
        export NVP_NET=AlexNet
        ;;
    *)
        echo "${RED}ERROR!${NC} CNN not recognized"
        return 1
esac

echo -e "${GREEN}"
echo "Chosen mode: $NVP_MODE"
echo "Chosen configuration: $NVP_CONFIG"
echo "Chosen profile: $NVP_PROFILE"
echo "Chosen net: $NVP_NET"

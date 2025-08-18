#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script builds the Virtual Platform in native mode:
#       1. Configure cmake project indicating all needed parameters:
#           a. Output directory;
#           b. SystemC library path;
#           c. NVDLA hardware repository path;
#           d. NVDLA configuration;
#           e. Python library and executable paths.
#       2. Compile
#       3. Install

set -e

cd ${NVP_VP_NATIVE}

# Prepare cmake needed parameters:
# Output directory
INSTALL_DIR="-DCMAKE_INSTALL_PREFIX=build"
# SystemC path
SYSTEMC_DIR="-DSYSTEMC_PREFIX=/usr/local/systemc/systemc-2.3.0"
# NVDLA hardware repo path
HW_DIR="-DNVDLA_HW_PREFIX=${NVP_CMOD_NVDLA}"
# NVDLA configuration
CONFIG="-DNVDLA_HW_PROJECT=${NVP_CONFIG}"

# Python paths
PYTHON_EXE="-DPYTHON_EXECUTABLE=/usr/bin/python2"
PYTHON_INC="-DPYTHON_INCLUDE_DIR=/usr/include/python2.7"
PYTHON_LIB="-DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython2.7.so"
PYTHON="${PYTHON_EXE} ${PYTHON_INC} ${PYTHON_LIB}"

# Launch Virtual Platform repo configuration
cmake ${INSTALL_DIR} ${SYSTEMC_DIR} ${HW_DIR} ${CONFIG} ${GCC_DIR} ${GXX_DIR} ${PYTHON} ${FLAGS}

# Launch build
make

# Launch installation
make install

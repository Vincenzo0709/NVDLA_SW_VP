#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script adds a macro needed in case of nv_small or nv_large configurations.

set -e

cd ${NVP_SW_KMD}/include

if [ "${NVP_CONFIG}" != "nv_full" ]; then
    if ! grep -q "#define DLA_2_CONFIG 1" nvdla_interface.h; then
        sed -i "/#include <linux\/types.h>/a #define DLA_2_CONFIG 1" nvdla_interface.h
    fi
else
    sed -i "s|#define DLA_2_CONFIG 1||" nvdla_interface.h
fi
#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script is called before Virtual platform container launch, in order to:
#       1. Perpare the VP execution environment;
#       2. Correct some QEMU configuration parameters.

# Set some environment variables
export NVP_VP_ROOT=/home/vp
export NVP_VP_NATIVE=${NVP_VP_ROOT}/native
export NVP_VP_OUT=${NVP_VP_ROOT}/output
export NVP_VP_PATH=${NVP_VP_OUT}/nvdla

export NVDLA=/usr/local/nvdla
export NVDLA_LIB=/usr/lib
export NVDLA_BIN=/usr/bin

# Copy all outputs in the same directories
mkdir -p ${NVP_VP_PATH}/lib
mkdir -p ${NVP_VP_PATH}/images/linux-4.13.3

# Copy the main artifacts
cp ${NVDLA_BIN}/aarch64_toplevel ${NVP_VP_PATH}
cp ${NVDLA}/aarch64_nvdla.lua ${NVP_VP_PATH}
cp ${NVDLA}/aarch64_nvdla_dump_dts.lua ${NVP_VP_PATH}
cp ${NVDLA}/efi-virtio.rom ${NVP_VP_PATH}

# Copy rootfs, kernel image and drm.ko from the compiled buildroot
cp ${NVDLA}/Image ${NVP_VP_PATH}/images/linux-4.13.3
cp ${NVDLA}/rootfs.ext4 ${NVP_VP_PATH}/images/linux-4.13.3
cp ${NVDLA}/drm.ko ${NVP_VP_PATH}

# Copy runtime, compiler and kernel module
cp ${NVDLA}/nvdla_compiler ${NVP_VP_PATH}
cp ${NVDLA}/nvdla_runtime ${NVP_VP_PATH}
cp ${NVDLA}/libnvdla_compiler.so ${NVP_VP_PATH}
cp ${NVDLA}/libnvdla_runtime.so ${NVP_VP_PATH}
cp ${NVDLA}/opendla.ko ${NVP_VP_PATH}

# Copy additional libraries
cp ${NVDLA_LIB}/libcosim_sc_wrapper.so ${NVP_VP_PATH}/lib
cp ${NVDLA_LIB}/libnvdla.so ${NVP_VP_PATH}/lib
cp ${NVDLA_LIB}/libqbox-nvdla.so ${NVP_VP_PATH}/lib
cp ${NVDLA_LIB}/liblog.so ${NVP_VP_PATH}/lib
cp ${NVDLA_LIB}/libnvdla_cmod.so ${NVP_VP_PATH}/lib
cp ${NVDLA_LIB}/libsimplecpu.so ${NVP_VP_PATH}/lib

# Modify LUA configuration file, needed by QEMU, substituting with absolute paths:
# Root filesystem
sed -i "s|rootfs.ext4|${NVP_VP_PATH}/images/linux-4.13.3/rootfs.ext4|g" \
            ${NVP_VP_PATH}/aarch64_nvdla.lua ${NVP_VP_PATH}/aarch64_nvdla_dump_dts.lua
# Kernel image
sed -i "s|Image|${NVP_VP_PATH}/images/linux-4.13.3/Image|g" \
            ${NVP_VP_PATH}/aarch64_nvdla.lua ${NVP_VP_PATH}/aarch64_nvdla_dump_dts.lua
# Mount path
sed -i "s|-fsdev local,id=r,path=.|-fsdev local,id=r,path=${NVP_VP_ROOT}|g" \
            ${NVP_VP_PATH}/aarch64_nvdla.lua ${NVP_VP_PATH}/aarch64_nvdla_dump_dts.lua

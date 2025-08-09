#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script is called before Virtual platform native launch, in order to:
#       1. Prepare the VP execution environment;
#       2. Correct some QEMU configuration parameters.

# Copy all outputs in the same directories
mkdir -p ${NVP_VP_PATH}/lib
mkdir -p ${NVP_VP_PATH}/images/linux-4.13.3

# Copy additional libraries
cp ${NVP_VP_NATIVE}/build/lib/libcosim_sc_wrapper.so ${NVP_VP_PATH}/lib
cp ${NVP_VP_NATIVE}/build/lib/libnvdla.so ${NVP_VP_PATH}/lib
cp ${NVP_VP_NATIVE}/build/lib/libqbox-nvdla.so ${NVP_VP_PATH}/lib
cp ${NVP_VP_NATIVE}/build/lib/liblog.so ${NVP_VP_PATH}/lib
cp ${NVP_VP_NATIVE}/build/lib/libnvdla_cmod.so ${NVP_VP_PATH}/lib
cp ${NVP_VP_NATIVE}/build/lib/libsimplecpu.so ${NVP_VP_PATH}/lib

# Copy the main artifacts
cp ${NVP_VP_NATIVE}/build/bin/aarch64_toplevel ${NVP_VP_PATH}
cp ${NVP_VP_NATIVE}/conf/aarch64_nvdla.lua ${NVP_VP_PATH}
cp ${NVP_VP_NATIVE}/conf/aarch64_nvdla_dump_dts.lua ${NVP_VP_PATH}
cp ${NVP_VP_NATIVE}/libs/qbox.build/share/qemu/efi-virtio.rom ${NVP_VP_PATH}

# Copy rootfs, kernel image and drm.ko from the compiled buildroot
cp ${NVP_SW_TOOLS}/buildroot/output/images/Image ${NVP_VP_PATH}/images/linux-4.13.3
cp ${NVP_SW_TOOLS}/buildroot/output/images/rootfs.ext4 ${NVP_VP_PATH}/images/linux-4.13.3
cp ${NVP_SW_TOOLS}/buildroot/output/build/linux-4.13.3/drivers/gpu/drm/drm.ko ${NVP_VP_PATH}

# Copy runtime
cp ${NVP_SW_NVDLA}/umd/out/apps/runtime/nvdla_runtime/nvdla_runtime ${NVP_VP_PATH}
cp ${NVP_SW_NVDLA}/umd/out/core/src/runtime/libnvdla_runtime/libnvdla_runtime.so ${NVP_VP_PATH}

# Copy kernel module
cp ${NVP_SW_NVDLA}/kmd/port/linux/opendla.ko ${NVP_VP_PATH}

# Modify LUA configuration file, needed by QEMU, substituting with absolute paths:
# Root filesystem
sed -i "s|images/linux-4.13.3/rootfs.ext4|${NVP_VP_PATH}/images/linux-4.13.3/rootfs.ext4|" \
                ${NVP_VP_PATH}/aarch64_nvdla.lua ${NVP_VP_PATH}/aarch64_nvdla_dump_dts.lua
# Kernel image
sed -i "s|images/linux-4.13.3/Image|${NVP_VP_PATH}/images/linux-4.13.3/Image|g" \
                ${NVP_VP_PATH}/aarch64_nvdla.lua ${NVP_VP_PATH}/aarch64_nvdla_dump_dts.lua
# Mount path
sed -i "s|-fsdev local,id=r,path=.|-fsdev local,id=r,path=${NVP_VP_ROOT}|g" \
                ${NVP_VP_PATH}/aarch64_nvdla.lua ${NVP_VP_PATH}/aarch64_nvdla_dump_dts.lua

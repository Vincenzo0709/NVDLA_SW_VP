#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script cleans all Virtual Platform native output artifacts.

# Clean cmake outputs
cd ${NVP_VP_NATIVE}
rm -f aarch64_toplevel CMakeCache.txt cmake_install.cmake CPackConfig.cmake
rm -f CPackSourceConfig.cmake install_manifest Makefile make.log
rm -rf build/ CMakefiles/ fpga/aws-fpga/*.build
rm -f .done

# Clean VP artifacts
sudo rm -rf ${NVP_VP_PATH}
rm -rf ${NVP_VP_OUT}/output.dimg

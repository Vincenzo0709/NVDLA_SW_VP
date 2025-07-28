#!/bin/bash
# 
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script prepares a new custom container image, named "nvdla_custom".

cd ${NVP_VP_ROOT}/container

sudo docker build -t nvdla_custom .
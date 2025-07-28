#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script is called to start a container, before the Virtual Platform launch.

sudo docker run -it -v ${NVP_ROOT_DIR}:/home nvdla_custom
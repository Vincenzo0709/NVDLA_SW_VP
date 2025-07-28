#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script launches the Virtual Platform.

# Disable SC_SIGNAL_WRITE_CHECK, macro used in SystemC to decide upon checking multiple writes
# on sc_signal objects or not. Because NVDLA VP uses TLM to model module communication, not RTL signal wiring,
# multiple writes in the same delta cycle could happen but should not cause errors.
export SC_SIGNAL_WRITE_CHECK=DISABLE

# Launch the VP
${NVP_VP_PATH}/aarch64_toplevel -c ${NVP_VP_PATH}/aarch64_nvdla.lua

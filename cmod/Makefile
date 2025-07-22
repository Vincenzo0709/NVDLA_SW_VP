# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This Makefile manages cmod build target in nvdla_hw submodule.

# Environment check
ifndef NVP_ROOT_DIR
$(error Setup script settings.sh has not been sourced, aborting)
endif

# Main targets
all: cmod

# Hardware C model build
cmod:
	$(NVP_CMOD_ROOT)/scripts/build.sh

# Clean targets
clean:
	rm -rf $(NVP_CMOD_NVDLA)/outdir
	rm -f $(NVP_CMOD_NVDLA)/tree.make

.PHONY: cmod clean

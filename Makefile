# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This Makefile holds all targets for NVDLA_VP repository.

# Environment check
ifndef NVP_ROOT_DIR
$(error Setup script settings.sh has not been sourced, aborting)
endif

# Main targets
all: cmod sw vp

# Software compilation
sw:
	$(MAKE) -C $(NVP_SW_ROOT)

# Virtual Platform build
vp: cmod
	$(MAKE) -C $(NVP_VP_ROOT)

# Hardware C model build
cmod:
	$(MAKE) -C $(NVP_CMOD_ROOT)

# Clean targets
clean: clean_sw clean_vp

clean_sw:
	$(MAKE) -C $(NVP_SW_ROOT) clean

clean_vp:
	$(MAKE) -C $(NVP_VP_ROOT) clean

clean_cmod:
	$(MAKE) -C $(NVP_CMOD_ROOT) clean

.PHONY: sw vp cmod clean clean_sw clean_vp

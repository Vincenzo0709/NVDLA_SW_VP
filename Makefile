# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This Makefile holds all targets for NVDLA_SW_VP repository.

# Environment check
ifndef NVP_ROOT_DIR
$(error Setup script settings.sh has not been sourced, aborting)
endif

# Main targets
all: vp

# Software compilation
sw:
	$(MAKE) -C $(NVP_SW_ROOT)

# Virtual Platform build
vp: cmod sw
	$(MAKE) -C $(NVP_VP_ROOT)

# Hardware C model build
cmod:
	$(MAKE) -C $(NVP_CMOD_ROOT)

# Virtual Platform launch
run: vp
	$(MAKE) -C $(NVP_VP_ROOT) run

# Clean targets
clean: clean_cmod clean_sw clean_vp clean_nets

clean_sw:
	$(MAKE) -C $(NVP_SW_ROOT) clean

clean_vp:
	$(MAKE) -C $(NVP_VP_ROOT) clean

clean_cmod:
	$(MAKE) -C $(NVP_CMOD_ROOT) clean

clean_nets:
	$(MAKE) -C $(NVP_VP_ROOT) clean_nets

clean_buildroot:
	$(MAKE) _C $(NVP_SW_TOOLS) clean_buildroot

.PHONY: sw vp cmod clean clean_sw clean_vp clean_cmod clean_nets clean_buildroot

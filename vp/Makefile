# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This Makefile manages VP build and execution.

# Environment check
ifndef NVP_ROOT_DIR
$(error Setup script settings.sh has not been sourced, aborting)
endif

# Cmod library dependency, needed by vp build
CMOD_LIB := $(NVP_CMOD_OUT)/$(NVP_CONFIG)/cmod/release/lib/libnvdla_cmod.so

# Network compiling output
NET_NVDLA := $(shell find $(NVP_VP_OUT)/nets/$(NVP_NET)/ -name "*.nvdla")

# Main targets
all: net ${NVP_MODE}

# VP build (native and container mode are separated targets)
native: $(CMOD_LIB) $(NVP_VP_NATIVE)/.done

$(NVP_VP_NATIVE)/.done:
	$(NVP_VP_ROOT)/scripts/build_native.sh
	touch $(NVP_VP_NATIVE)/.done

container:
	$(NVP_VP_ROOT)/scripts/build_container.sh

# Loadable compilation
net: $(NET_NVDLA)

$(NET_NVDLA): $(NVP_VP_OUT)/nets/$(NVP_NET)/fast-math.nvdla
	mkdir -p $(NVP_VP_OUT)/nets/$(NVP_NET)
	$(NVP_VP_ROOT)/scripts/net_compile.sh

# Virtual Platform launch (native or container mode)
run: $(NVP_MODE)
	if [ ${NVP_MODE} = "container" ]; then 			\
		$(NVP_VP_ROOT)/scripts/start_container.sh; 	\
	else											\
		$(NVP_VP_ROOT)/scripts/set_native.sh		\
		$(NVP_VP_ROOT)/scripts/launch_vp.sh;		\
	fi

# Clean targets
clean:
	$(NVP_VP_ROOT)/scripts/clean_$(NVP_MODE).sh

clean_nets:
	rm -rf $(NVP_VP_OUT)/nets
	
.PHONY: net container native clean clean_nets

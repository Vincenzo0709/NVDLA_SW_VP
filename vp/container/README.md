# Container NVDLA overview
All necessary tools to use NVDLA VP are located in */usr/local/nvdla* directory, inside the container environment:
- **LICENSE**: gathers all Licenses for UMD, KMD, Apache, MIT, Google protobuf, Caffe, rapidjson, msinttypes, JSON, GNU buildroot and Linux;
- **aarch64_nvdla.lua** and **aarch64_nvdla_dump_dts.lua**: configuration scripts needed by Qemu;
- **drm.ko**: kernel module for Direct Rendering Image, graphics and GPU management;
- **opendla_x.ko**: kernel mode drivers to access NVDLA hardware, depending on the configuration:
    - **opendla_1.ko**: for nv_large and nv_full configurations;
    - **opendla_2.ko**: for nv_small configuration.
- **rootfs.ext4**: root fileysystem;
- **Image**: linux 4.13.3 kernel image.
- **efi-virtio.rom**: optional ROM for Virtio device support on boot with UEFI;
- **nvdla_compiler**: to compile nets' description into loadable;
- **libnvdla_compiler.so**: shared library referenced from compiler application;
- **nvdla_runtime**: user-level application to start inference;
- **libnvdla_runtime.so**: shared library referenced from runtime application;
- **init_dla.sh**: example script to start VP and configure SSH (not used).

The VP executable is located in */usr/bin*:
- **aarch64_toplevel**

Other libraries are located in */usr/lib*:
- **libcosim_sc_wrapper.so**
- **libnvdla.so**
- **libqbox-nvdla.so**
- **liblog.so**
- **libnvdla_cmod.so**
- **libsimplecpu.so**
